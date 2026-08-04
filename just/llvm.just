# Modular just: just/llvm.just -- role recipes (import into root justfile).
# LLVM IR release surface (deferred until self-hosted Systems Lean / Slake).
out-llvm-ir:
    @echo "out-llvm-ir: llvmUnlocked true (unlock residual); deepen via llvm-*-text / compose emit (see out/llvm-ir/README.md)"

# LLVM IR emit path: static design note + MEASURED-STUB + Lean pins (pure Nix).
# Greppable: llvm-emit-path, HOST-LLVM-EMIT-PATH, SLAKE_LLVM_EMIT_PATH_V0.
llvm-emit-path: systems-llvm-ir
    @echo "llvm-emit-path: GREEN (systems-llvm-ir)"

# LLVM IR Mult text writer: lake exe -> out/llvm-ir/slake_mult.ll; pure join after.
# Greppable: llvm-mult-text, HOST-LLVM-MULT-TEXT, SLAKE_LLVM_MULT_TEXT_V0.
llvm-mult-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_MULT_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-mult-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-mult-text
      lake exe slake-llvm-mult-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-mult-text: GREEN"

# LLVM IR Linear text writer: lake exe -> out/llvm-ir/slake_linear.ll; pure join after.
# Greppable: llvm-linear-text, HOST-LLVM-LINEAR-TEXT, SLAKE_LLVM_LINEAR_TEXT_V0.
llvm-linear-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_LINEAR_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-linear-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-linear-text
      lake exe slake-llvm-linear-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-linear-text: GREEN"

# LLVM IR Types text writer: lake exe -> out/llvm-ir/slake_types.ll; pure join after.
# Greppable: llvm-types-text, HOST-LLVM-TYPES-TEXT, SLAKE_LLVM_TYPES_TEXT_V0.
llvm-types-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_TYPES_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-types-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-types-text
      lake exe slake-llvm-types-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-types-text: GREEN"

# LLVM IR Program text writer: lake exe -> out/llvm-ir/slake_program.ll; pure join after.
# Greppable: llvm-program-text, HOST-LLVM-PROGRAM-TEXT, SLAKE_LLVM_PROGRAM_TEXT_V0.
llvm-program-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_PROGRAM_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-program-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-program-text
      lake exe slake-llvm-program-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-program-text: GREEN"

# LLVM IR Graph text writer: lake exe -> out/llvm-ir/slake_graph.ll; pure join after.
# Greppable: llvm-graph-text, HOST-LLVM-GRAPH-TEXT, SLAKE_LLVM_GRAPH_TEXT_V0.
llvm-graph-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_GRAPH_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-graph-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-graph-text
      lake exe slake-llvm-graph-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-graph-text: GREEN"

# LLVM IR unit package: Mult..Graph writers then pure Nix join (systems-llvm-ir).
# Greppable: llvm-unit-package, HOST-LLVM-UNIT-PACKAGE.
llvm-unit-package:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "llvm-unit-package: Mult..Graph writers + systems-llvm-ir"
    just llvm-mult-text
    just llvm-linear-text
    just llvm-types-text
    just llvm-program-text
    just llvm-graph-text
    just systems-llvm-ir
    echo "llvm-unit-package: GREEN"

# LLVM IR compose text writer: lake exe -> out/llvm-ir/slake_compose.ll; pure join after.
# Next layer after Mult..Graph unit package (not a fifth unit of that package).
# Greppable: llvm-compose-text, HOST-LLVM-COMPOSE-TEXT, SLAKE_LLVM_COMPOSE_TEXT_V0.
llvm-compose-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_COMPOSE_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-compose-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-compose-text
      lake exe slake-llvm-compose-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-compose-text: GREEN"

# Optional llvm-as assemble smoke on generator-owned compose/unit IR.
# Skip GREEN when llvm-as missing; RED when present and assemble fails or
# expected generator-owned artifacts are missing. Not production llvm-as path.
# Greppable: llvm-as-smoke, HOST-LLVM-AS-SMOKE, SLAKE_LLVM_AS_SMOKE_V0.
llvm-as-smoke:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    ir_dir="$root/out/llvm-ir"
    echo "SLAKE_LLVM_AS_SMOKE_V0 / HOST-LLVM-AS-SMOKE"
    if ! command -v llvm-as >/dev/null 2>&1; then
      echo "skip llvm-as-smoke (llvm-as not on PATH; optional tool; pure Nix systems-llvm-ir honesty still required via just systems-llvm-ir)"
      echo "llvm-as-smoke: SKIP (optional; skip-if-missing; not production backend)"
      exit 0
    fi
    # Fail-closed expected generator-owned Mult..Graph + compose IR (Track 2e).
    expected=(
      slake_compose.ll
      slake_mult.ll
      slake_linear.ll
      slake_types.ll
      slake_program.ll
      slake_graph.ll
    )
    fail=0
    for f in "${expected[@]}"; do
      path="$ir_dir/$f"
      if [[ ! -f "$path" ]]; then
        echo "RED: missing expected generator-owned IR: $path" >&2
        fail=1
        continue
      fi
      if ! llvm-as "$path" -o /dev/null; then
        echo "RED: llvm-as failed on $path" >&2
        fail=1
      else
        echo "ok llvm-as $f"
      fi
    done
    if [[ "$fail" -ne 0 ]]; then
      echo "llvm-as-smoke RED (optional tool present; assemble or artifact fail)" >&2
      exit 1
    fi
    echo "llvm-as-smoke: GREEN (optional assemble; skip-if-missing; not production backend / not CFG/SSA / not Rust link)"

# ABI parity smoke: pure Nix systems-llvm-ir (abi-parity slice) checks Mult
# freestanding header + layout fixture + Mult IR tag agreement (0/1/2, i32
# align 4). No llvm-as or cc. Not full Rust ABI / not extern Rust stable /
# not link without classic FFI.
# Greppable: abi-parity-smoke, HOST-ABI-PARITY-SMOKE, SLAKE_ABI_PARITY_SMOKE_V0.
abi-parity-smoke:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_ABI_PARITY_SMOKE_V0 / HOST-ABI-PARITY-SMOKE"
    echo "non-claims: not extern Rust stable; not link without classic FFI; not full Rust ABI"
    just systems-llvm-ir
    echo "abi-parity-smoke: GREEN (fixture + Mult freestanding + IR tags; not extern Rust stable / not link without classic FFI / not full Rust ABI)"

# Layout IR tag dual-pin: pure Nix systems-llvm-ir (layout-ir-dual-pin slice)
# dual-pins Mult IR full tag constant lines against layout fixture rows
# (0/1/2, i32 align 4) with greppable LAYOUT-IR-TAG-DUAL-PIN. Mult primary;
# Linear/Types class/kind tags when in scope later. Distinct from abi-parity.
# No llvm-as or cc. Not Rust-native link. Not full Graph/Program layout.
# Greppable: layout-ir-dual-pin, HOST-LAYOUT-IR-TAG-DUAL-PIN,
# SLAKE_LAYOUT_IR_TAG_DUAL_PIN_V0, LAYOUT-IR-TAG-DUAL-PIN.
layout-ir-dual-pin:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_LAYOUT_IR_TAG_DUAL_PIN_V0 / HOST-LAYOUT-IR-TAG-DUAL-PIN"
    echo "non-claims: not Rust-native link; not full Graph/Program layout"
    just systems-llvm-ir
    echo "layout-ir-dual-pin: GREEN (Mult IR tags dual-pinned to fixture; not Rust-native link / not full Graph/Program layout)"


