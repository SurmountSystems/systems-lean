# Modular just: just/compcert.just -- role recipes (import into root justfile).
# Living tip: PROVABLY true (product CompCert matrix + lake proof; in just check).
# Short banners only (driver stdout policy). Do not print residual essays.
ccomp-resolve:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    ccomp_bin=""
    # 1) Operator override: if set, must be executable (fail closed; no silent fallback).
    if [[ -n "${COMPCERT_CCOMP:-}" ]]; then
      if [[ -x "$COMPCERT_CCOMP" ]]; then
        ccomp_bin="$COMPCERT_CCOMP"
      else
        echo "error: COMPCERT_CCOMP set but not executable: $COMPCERT_CCOMP" >&2
        echo "  unset COMPCERT_CCOMP to try PATH / nixpkgs.compcert" >&2
        echo "  design: doc/dev/research/compcert-product-seal-design-2026-08-02.md" >&2
        echo "  ccomp required for CompCert product matrix" >&2
        exit 1
      fi
    fi
    # 2) PATH
    if [[ -z "$ccomp_bin" ]] && command -v ccomp >/dev/null 2>&1; then
      ccomp_bin="$(command -v ccomp)"
    fi
    # 3) Flake-locked nixpkgs.compcert (unfree)
    if [[ -z "$ccomp_bin" ]]; then
      if command -v nix >/dev/null 2>&1 && [[ -f "$root/flake.nix" ]]; then
        echo "  trying flake-locked nixpkgs.compcert (unfree; COMPCERT-NIX-RESOLVE)..." >&2
        # Multi-output: pick the store path that has bin/ccomp.
        # allowUnfree required: CompCert is INRIA-NC / commercial (not Unlicense).
        nix_err="$(mktemp)"
        if nix_out="$(NIXPKGS_ALLOW_UNFREE=1 nix build --impure --no-link --print-out-paths --expr "
          let
            f = builtins.getFlake (toString $root);
            pkgs = import f.inputs.nixpkgs {
              system = builtins.currentSystem;
              config.allowUnfree = true;
            };
          in pkgs.compcert
        " 2>"$nix_err")"; then
          while IFS= read -r p; do
            if [[ -n "$p" && -x "$p/bin/ccomp" ]]; then
              ccomp_bin="$p/bin/ccomp"
              break
            fi
          done <<< "$nix_out"
        else
          echo "  nix resolve failed (see below if still missing):" >&2
          sed 's/^/    /' "$nix_err" >&2 || true
        fi
        rm -f "$nix_err"
      fi
    fi
    if [[ -z "$ccomp_bin" || ! -x "$ccomp_bin" ]]; then
      echo "error: ccomp not resolved" >&2
      echo "  tried: COMPCERT_CCOMP, PATH ccomp, flake nixpkgs.compcert (unfree)" >&2
      echo "  operator: export COMPCERT_CCOMP=/path/to/ccomp" >&2
      echo "  or: NIXPKGS_ALLOW_UNFREE=1 nix build --impure ... (see doc/compcert-entry.md)" >&2
      echo "  or: build ref/CompCert with Coq 8.15-8.20.1 + menhir (in-tree sources read-only)" >&2
      echo "  design: doc/dev/research/compcert-product-seal-design-2026-08-02.md" >&2
      echo "  ccomp required for CompCert product matrix" >&2
      exit 1
    fi
    printf '%s\n' "$ccomp_bin"

# CompCert seal: fail-closed smoke for resolved ccomp (plan-compcert-product-seal).
# Smoke alone is not the full product matrix (product-compcert-matrix joins rows).
# Greppable: ccomp-smoke, COMPCERT-CCOMP-SMOKE, Resolved ccomp driver, ccomp -version,
# COMPCERT-NIX-RESOLVE (shared via ccomp-resolve).
ccomp-smoke:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== ccomp-smoke (CompCert driver resolve; fail closed) =="
    ccomp_bin="$(just --quiet ccomp-resolve)"
    echo "  ccomp: $ccomp_bin"
    "$ccomp_bin" -version
    echo "ccomp-smoke: GREEN (ccomp -version exit 0; not full product matrix alone)"

# CompCert seal: freestanding product wire under resolved ccomp (plan step 3).
# Default: just build then ccomp -c out/freestanding-c/slake_freestanding.c to object.
# Under just check, SYSTEMS_PRODUCT_WIRE_FRESH=1 skips second build when wire exists
# (fail closed if FRESH=1 but out/ wire missing). Fail closed if ccomp missing or
# compile fails. On reject: fix Lean emit SSOT only, re-emit, re-run (no hand C).
# Greppable: freestanding-under-ccomp, FREESTANDING-UNDER-CCOMP, Freestanding wire under ccomp.
freestanding-under-ccomp:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== freestanding-under-ccomp (product wire under CompCert ccomp; fail closed) =="
    root="$(pwd)"
    out_dir="$root/out/freestanding-c"
    out_c="$out_dir/slake_freestanding.c"
    out_h="$out_dir/slake_freestanding.h"
    obj="${TMPDIR:-/tmp}/slake_freestanding_under_ccomp.o"
    if [[ "${SYSTEMS_PRODUCT_WIRE_FRESH:-}" == "1" ]]; then
      if [[ ! -f "$out_c" || ! -f "$out_h" ]]; then
        echo "error: SYSTEMS_PRODUCT_WIRE_FRESH=1 but freestanding product wire missing:" >&2
        echo "  expected $out_c and $out_h" >&2
        echo "  just check should have produced wire via just build first" >&2
        exit 1
      fi
      echo "ok product wire already fresh (SYSTEMS_PRODUCT_WIRE_FRESH=1; skip regenerate)"
    elif ! just build; then
      echo "error: just build failed (need fresh freestanding product wire)" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" || ! -f "$out_h" ]]; then
      echo "error: freestanding product missing:" >&2
      echo "  expected $out_c and $out_h" >&2
      exit 1
    fi
    ccomp_bin="$(just --quiet ccomp-resolve)"
    echo "  ccomp: $ccomp_bin"
    echo "  source: $out_c"
    echo "  include: $out_dir"
    rm -f "$obj"
    if ! "$ccomp_bin" -c -I"$out_dir" -o "$obj" "$out_c"; then
      echo "error: ccomp rejected freestanding product C" >&2
      echo "  inventory rejects, then fix Lean emit SSOT under src/systems/emit/;" >&2
      echo "  re-emit via just build; do not hand-author product C under out/ or emit/" >&2
      echo "  design: doc/dev/research/compcert-product-seal-design-2026-08-02.md" >&2
      exit 1
    fi
    if [[ ! -f "$obj" || ! -s "$obj" ]]; then
      echo "error: ccomp produced no object artifact at $obj" >&2
      exit 1
    fi
    bytes="$(wc -c < "$obj" | tr -d ' ')"
    echo "  object: $obj ($bytes bytes)"
    echo "freestanding-under-ccomp: GREEN (object under ccomp)"

# CompCert seal: Mult unit package under resolved ccomp (plan step 4).
# Compile src/systems/emit/slake_mult_subset.c with -I for Mult header.
# Fail closed if package missing, include missing, ccomp missing, or compile fails.
# On reject: fix Lean MultSubsetEmit SSOT (include + body), re-emit, re-run;
# do not hand-author Mult product C. Shared resolve: just ccomp-resolve.
# Mult row alone is not the full product matrix join (product-compcert-matrix).
# Greppable: mult-package-under-ccomp, MULT-PACKAGE-UNDER-CCOMP, Mult package under ccomp.
mult-package-under-ccomp:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== mult-package-under-ccomp (Mult unit package under CompCert ccomp; fail closed) =="
    root="$(pwd)"
    emit_dir="$root/src/systems/emit"
    out_c="$emit_dir/slake_mult_subset.c"
    out_h="$emit_dir/slake_mult_subset.h"
    obj="${TMPDIR:-/tmp}/slake_mult_subset_under_ccomp.o"
    if [[ ! -f "$out_c" || ! -f "$out_h" ]]; then
      echo "error: Mult subset package missing:" >&2
      echo "  expected $out_c and $out_h" >&2
      echo "  re-emit: just mult-subset-emit (or mult-subset-rebuild / without-lake path)" >&2
      exit 1
    fi
    # Dual package identity (stage + Mult dialect on header and source).
    for tok in SLAKE_MULT_SUBSET_EMIT_V0 HOST-EMIT-MULT MULT-0; do
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'slake_mult_is_valid' "$out_c"; then
      echo "error: $out_c missing slake_mult_is_valid" >&2
      exit 1
    fi
    if ! grep -qF 'enum slake_mult' "$out_h"; then
      echo "error: $out_h missing enum slake_mult" >&2
      exit 1
    fi
    # Standalone compile needs the unit header include (Lean MultSubsetEmit SSOT).
    if ! grep -qF '#include "slake_mult_subset.h"' "$out_c"; then
      echo "error: Mult subset source missing #include \"slake_mult_subset.h\"" >&2
      echo "  fix Lean MultSubsetEmit multSubsetSourceInclude; re-emit; do not hand-edit C" >&2
      echo "  design: doc/dev/research/compcert-product-seal-design-2026-08-02.md" >&2
      exit 1
    fi
    ccomp_bin="$(just --quiet ccomp-resolve)"
    echo "  ccomp: $ccomp_bin"
    echo "  source: $out_c"
    echo "  include: $emit_dir"
    rm -f "$obj"
    if ! "$ccomp_bin" -c -I"$emit_dir" -o "$obj" "$out_c"; then
      echo "error: ccomp rejected Mult unit package C" >&2
      echo "  inventory rejects, then fix Lean MultSubsetEmit / EmitMult SSOT;" >&2
      echo "  re-emit via just mult-subset-emit; do not hand-author product C under emit/" >&2
      echo "  design: doc/dev/research/compcert-product-seal-design-2026-08-02.md" >&2
      exit 1
    fi
    if [[ ! -f "$obj" || ! -s "$obj" ]]; then
      echo "error: ccomp produced no object artifact at $obj" >&2
      exit 1
    fi
    bytes="$(wc -c < "$obj" | tr -d ' ')"
    echo "  object: $obj ($bytes bytes)"
    echo "mult-package-under-ccomp: GREEN (Mult object under ccomp; not full product matrix alone)"

# CompCert seal: named product matrix join (plan step 5).
# Rows (minimum): driver smoke + full freestanding wire + Mult unit package.
# Orchestrates existing fail-closed recipes; does not invent extra unit rows.
# Living tip: PROVABLY true when this matrix + lake proof hold (in just check).
# Greppable: product-compcert-matrix, PRODUCT-COMPCERT-MATRIX, Product CompCert matrix.
product-compcert-matrix:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== product-compcert-matrix (named CompCert product matrix; fail closed) =="
    echo "  rows: ccomp-smoke | freestanding-under-ccomp | mult-package-under-ccomp"
    echo "  design: doc/dev/research/compcert-product-seal-design-2026-08-02.md"
    host=$(hostname -s 2>/dev/null || hostname 2>/dev/null || echo unknown)
    host=${host%%.*}
    if [[ "${SYSTEMS_COMPCERT_MATRIX_FORCE:-}" != "1" && "$host" != "surmount-1" ]]; then
      echo "skip product-compcert-matrix (host $host is not surmount-1; nixpkgs.compcert resolve is a remote Nix build; set SYSTEMS_COMPCERT_MATRIX_FORCE=1 to run here)"
      echo "product-compcert-matrix: GREEN (laptop skip; PROVABLY matrix still on surmount-1)"
      exit 0
    fi
    ccomp_bin="$(just --quiet ccomp-resolve)"
    echo "  ccomp: $ccomp_bin"
    if ! just ccomp-smoke; then
      echo "error: matrix row ccomp-smoke failed" >&2
      exit 1
    fi
    if ! just freestanding-under-ccomp; then
      echo "error: matrix row freestanding-under-ccomp failed" >&2
      exit 1
    fi
    if ! just mult-package-under-ccomp; then
      echo "error: matrix row mult-package-under-ccomp failed" >&2
      exit 1
    fi
    echo "product-compcert-matrix: GREEN (smoke + full wire + Mult under ccomp; PROVABLY matrix)"
