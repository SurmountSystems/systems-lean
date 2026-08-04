# Modular just: just/product-wire.just -- role recipes (import into root justfile).
# Dual-pin honesty (modular just; greppable for pure Nix + residual dual-pins):
# product residual free -- claim A measure via systems-emit-wire / freestanding-self-host-complete.
# Diagnostic Lake FreestandingEmit path (not hot path / not official writer):
# lake build slake-emit-freestanding-c
# lake exe slake-emit-freestanding-c
# SystemsLean.FreestandingEmit
# Product freestanding wire: regenerate emit + out/freestanding-c.
# M4 Name C (official without-Lake hot path): prefer Name B Lean-native freestanding
# writer (product-wire-freestanding-write; P1 no host-cc C print from Lean), else
# Name A prebuilt regenerate (freestanding-capable-regenerate-without-lake).
# B38 dual-eq WRITE authority remains (Capable* / freestandingCapableWriteFreestandingHc
# substrate; freestanding-capable-regenerate Lake path stays diagnostic).
# NOT FreestandingEmit / slake-emit-freestanding-c as official writer.
# Fail closed if neither Name B path nor Name A prebuilt is available.
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# SLAKE_COMPILE_PATH_V0: retired shell stamp (deleted). Static compile-path /
# unit walk: just systems-emit-wire + just systems-host (HOST-COMPILE-PATH /
# SLAKE_COMPILE_PATH_V1 in SystemsLean/CompilePath.lean). Not product C.
# No separate out-freestanding-c recipe (retired; former stamp-only build deleted).
# Release dir stays out/freestanding-c/. Not residual free; not PROVABLY.
# Greppable: product-wire-freestanding-write, freestanding-capable-regenerate-without-lake,
# freestanding-capable-regenerate, PRODUCT-WIRE-WITHOUT-LAKE, M4 Name C.
build:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    dest=out/freestanding-c
    emit_dir="src/systems/emit"
    systems_dir="src/systems"
    prebuilt="$systems_dir/.lake/build/bin/slake-freestanding-capable-regenerate"
    tool_prebuilt="$systems_dir/.lake/build/bin/slake-product-wire-fs-write-tool"
    tool_mod="$systems_dir/SystemsLean/ProductWireWriteTool.lean"
    mkdir -p "$dest"
    echo "== just build (product freestanding wire; M4 Name C without-Lake hot path) -> $dest =="
    echo "Release: runtimeless product C (no Lean managed runtime / product GC on the wire)."
    echo "  not residual free; not PROVABLY"
    echo "  SLAKE_COMPILE_PATH_V0: retired shell stamp; static: systems-emit-wire + systems-host"
    echo "  SLAKE_COMPILE_PATH_V1 / HOST-COMPILE-PATH: SystemsLean/CompilePath.lean (not product C)"
    echo "  emit: freestanding dual-eq WRITE without lake on hot path (B38 RETIRE-OFFICIAL substrate)"
    echo "  prefer: product-wire-freestanding-write (Name B Lean-native P1); else freestanding-capable-regenerate-without-lake (Name A)"
    echo "  authority: freestandingCapableOrderedRegenerate / freestandingCapableWriteFreestandingHc"
    echo "  not FreestandingEmit (retired as official product writer; diagnostic Lake path remains)"
    echo "  product StillUsesLake true until M6 (host elaborator residual remains)"
    if [[ ! -f "$dest/README.md" ]]; then
      echo "error: missing $dest/README.md" >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/CapableRegenerate.lean" ]]; then
      echo "error: freestanding-capable regenerate missing under $systems_dir" >&2
      echo "  residual requires freestanding dual-eq WRITE official path (B38 RETIRE-OFFICIAL)." >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/SystemsLean/CapableWriteHc.lean" ]]; then
      echo "error: Capable dual-eq WRITE module missing under $systems_dir" >&2
      exit 1
    fi
    # M4 Name C: prefer Name B Lean-native product-wire writer (P1; no host-cc C
    # print); fall back to Name A prebuilt freestanding-capable-regenerate.
    if [[ -f "$tool_mod" ]] && { [[ -x "$prebuilt" ]] || [[ -x "$tool_prebuilt" ]] || command -v lake >/dev/null 2>&1; }; then
      echo "  hot path: product-wire-freestanding-write (Name B Lean-native P1)"
      just product-wire-freestanding-write
      echo "build: product-wire-freestanding-write (M4 Name B/C dual-eq WRITE+INSTALL) done"
    elif [[ -x "$prebuilt" ]]; then
      echo "  hot path: freestanding-capable-regenerate-without-lake (Name A prebuilt; no lake)"
      just freestanding-capable-regenerate-without-lake
      echo "build: freestanding-capable-regenerate-without-lake (M4 Name A/C dual-eq WRITE) done"
    else
      echo "error: official without-Lake product wire missing both measured writers" >&2
      echo "  Name B: need ProductWireWriteTool + prebuilt CapableRegenerate or lake" >&2
      echo "    bootstrap once: (cd $systems_dir && lake build slake-product-wire-fs-write-tool && lake exe slake-product-wire-fs-write-tool -- $root)" >&2
      echo "  Name A: need executable prebuilt $prebuilt" >&2
      echo "    bootstrap once: (cd $systems_dir && lake build slake-freestanding-capable-regenerate)" >&2
      echo "  then re-run: just build" >&2
      exit 1
    fi
    # Dual evidence after without-Lake write (emit + Out stage tokens).
    out_h="$emit_dir/slake_freestanding.h"
    out_c="$emit_dir/slake_freestanding.c"
    install_h="$dest/slake_freestanding.h"
    install_c="$dest/slake_freestanding.c"
    for path in "$out_h" "$out_c" "$install_h" "$install_c"; do
      if [[ ! -f "$path" ]]; then
        echo "error: missing freestanding product path after build: $path" >&2
        exit 1
      fi
    done
    for tok in SLAKE_EMIT_FREESTANDING_C_V0 HOST-EMIT-MULT HOST-EMIT-LINEAR HOST-EMIT-SSOT; do
      for path in "$out_h" "$out_c" "$install_h" "$install_c"; do
        if ! grep -qF "$tok" "$path"; then
          echo "error: $path missing greppable token $tok after without-Lake build" >&2
          exit 1
        fi
      done
    done
    echo "  not residual free; not PROVABLY; no product GC; not Lean managed runtime"
    echo "  stage: freestanding dual-eq WRITE official without-Lake path + UNIT_DEEPEN_V1"
    echo "  product path: just build -> emit + out/freestanding-c (no lake on hot path)"

# Partial B11 / SELF-HOST-PRODUCT-PATH-PERFORM-READ: decomposed dual SSOT READ only.
# Lake host exe SystemsLean.ProductPathReadSsot (IO.FS.readFile Mult..Out SSOT).
# Does NOT run FreestandingEmit / renderHeader / renderSource / emitAtRoot / write .h/.c.
# Still classic Lean Lake for this host step (productPathPerformReadDependsOnLake true).
# Not freestanding perform claimed; FREESTANDING-PERFORM-GAP-READ-SSOT not closed.
# Greppable: read-product-ssot, slake-read-product-ssot, productPathPerformReadPartialReady,
# SELF-HOST-PRODUCT-PATH-PERFORM-READ, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0
read-product-ssot:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    systems_dir="src/systems"
    echo "== read-product-ssot (decomposed READ dual SSOT; no FreestandingEmit write) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/ProductPathReadSsot.lean" ]]; then
      echo "error: ProductPathReadSsot missing under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; read-product-ssot requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-read-product-ssot
      lake exe slake-read-product-ssot -- "$root"
    )
    echo "read-product-ssot: GREEN (dual SSOT read only; compose/write still Lake FreestandingEmit)"

# Partial B12 / SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: decomposed plan/apply/body COMPOSE.
# Lake host exe SystemsLean.ProductPathComposePlan (ordered in-memory compose marker).
# Does NOT run FreestandingEmit / renderHeader / renderSource / emitAtRoot / write .h/.c.
# Still classic Lean Lake for this host step (productPathPerformComposeDependsOnLake true).
# Not freestanding perform claimed; FREESTANDING-PERFORM-GAP-COMPOSE not closed.
# Greppable: compose-product-plan, slake-compose-product-plan, productPathPerformComposePartialReady,
# SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0
compose-product-plan:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    systems_dir="src/systems"
    echo "== compose-product-plan (decomposed COMPOSE plan/apply/body; no FreestandingEmit write) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/ProductPathComposePlan.lean" ]]; then
      echo "error: ProductPathComposePlan missing under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; compose-product-plan requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-compose-product-plan
      lake exe slake-compose-product-plan -- "$root"
    )
    echo "compose-product-plan: GREEN (plan/apply/body compose only; write still Lake FreestandingEmit)"

# Partial B13 / SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: decomposed WRITE freestanding .h/.c.
# Lake host exe SystemsLean.ProductPathWriteHc -> FreestandingEmit.emitAtRoot under emit/.
# Writes emit slake_freestanding.{h,c} only; does NOT install Out (B10 / just build).
# Still classic Lean Lake for this host step (productPathPerformWriteHcDependsOnLake true).
# Not freestanding perform claimed; FREESTANDING-PERFORM-GAP-WRITE-HC not closed.
# Greppable: write-freestanding-hc, slake-write-freestanding-hc, productPathPerformWriteHcPartialReady,
# SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0
write-freestanding-hc:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    systems_dir="src/systems"
    echo "== write-freestanding-hc (decomposed WRITE-HC freestanding .h/.c; Lake FreestandingEmit) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/ProductPathWriteHc.lean" ]]; then
      echo "error: missing SystemsLean ProductPathWriteHc / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; write-freestanding-hc requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-write-freestanding-hc
      lake exe slake-write-freestanding-hc -- "$root"
    )
    echo "write-freestanding-hc: GREEN (emit .h/.c write only; install Out still B10; perform claimed false)"

regenerate-product-path:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== regenerate-product-path (B14 ordered host pipeline join; not freestanding-capable close) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
    echo "  order: read-product-ssot -> compose-product-plan -> write-freestanding-hc -> install-freestanding-c-out"
    just read-product-ssot
    just compose-product-plan
    just write-freestanding-hc
    just install-freestanding-c-out
    echo "regenerate-product-path: GREEN (host ordered join only; freestanding-capable full perform stays false)"

# Lake-free install-only entrypoint (partial B10 / SELF-HOST-PRODUCT-PATH-PERFORM-STEP).
# Shared install half for full path (just build may call install-only after emit).
# Copies emit slake_freestanding.{h,c} into out/freestanding-c when already present.
# Does NOT run lake build / lake exe / FreestandingEmit. Fail closed if emit missing.
# Full regenerate still requires just build (Lake). Install-only is not
# freestanding perform claimed (read/compose/write still Lake). Thin process glue only.
# Greppable: install-freestanding-c-out, productPathPerformInstallLakeFreeEntrypointClaimed,
# SELF-HOST-PRODUCT-PATH-PERFORM-STEP, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0
install-freestanding-c-out:
    #!/usr/bin/env bash
    set -euo pipefail
    dest=out/freestanding-c
    emit_dir="src/systems/emit"
    mkdir -p "$dest"
    echo "== install freestanding-c out (Lake-free) -> $dest =="
    echo "  Lake-free install-only: cp emit wire when present; no lake build/exe"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$dest/README.md" ]]; then
      echo "error: missing $dest/README.md" >&2
      exit 1
    fi
    if [[ ! -f "$emit_dir/slake_freestanding.h" || ! -f "$emit_dir/slake_freestanding.c" ]]; then
      echo "error: emit wire missing under $emit_dir (need slake_freestanding.h and .c)" >&2
      echo "  run just build first (Lake emit), then retry install-only." >&2
      exit 1
    fi
    mapfile -t artifacts < <(find "$emit_dir" -type f \( -name 'slake_freestanding.c' -o -name 'slake_freestanding.h' \) 2>/dev/null | sort || true)
    if [[ ${#artifacts[@]} -eq 0 ]]; then
      echo "error: no slake_freestanding.c/.h under $emit_dir to copy into $dest" >&2
      exit 1
    fi
    for stale in "$dest"/*.c "$dest"/*.h; do
      if [[ -f "$stale" ]]; then
        rm -f "$stale"
        echo "  remove stale: $stale"
      fi
    done
    copied=0
    for src in "${artifacts[@]}"; do
      base=$(basename "$src")
      cp -f "$src" "$dest/$base"
      echo "  copy: $src -> $dest/$base"
      copied=$((copied + 1))
    done
    echo "install-freestanding-c-out: copied ${copied} product file(s) into $dest"
    echo "  Lake-free install entrypoint only; read/compose/write still Lake (B9 gap)"
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0 (not freestanding perform claimed)"

# Package out/freestanding-c for consumers (tarball). Does not publish git.
# Prefer git subtree for long-lived consumer trees (see out/freestanding-c/README.md).
# Regenerates product wire first. Not residual free; not PROVABLY.
export-freestanding-c: build
    #!/usr/bin/env bash
    set -euo pipefail
    dest=out/freestanding-c
    mkdir -p .cache
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    archive=".cache/systems-lean-freestanding-c-${stamp}.tar.gz"
    if [[ ! -f "$dest/README.md" || ! -f "$dest/slake_freestanding.c" || ! -f "$dest/slake_freestanding.h" ]]; then
      echo "error: incomplete release surface under $dest" >&2
      exit 1
    fi
    tar -czf "$archive" -C out freestanding-c
    echo "export-freestanding-c: wrote $archive"
    echo "  consumer tree is product wire only (no ref/*, no host elaborator required)"
    echo "  not residual free; not PROVABLY"
    echo "  subtree publish: see out/freestanding-c/README.md"
