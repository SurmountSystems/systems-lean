# Modular just: just/llvm-ssa.just -- Compose SSA writer (import into root justfile).
# Split from just/llvm.just so that module stays under 1000 lines.
# Greppable: llvm-compose-ssa, HOST-LLVM-COMPOSE-SSA, SLAKE_LLVM_COMPOSE_SSA_V0.

# LLVM Compose SSA lower partial: lake exe -> out/llvm-ir/slake_compose_ssa.ll; pure join after.
# Compose host band (HostCompose mint/consume/check/extract) to SSA-shaped IR.
# Not full CFG/dominance. Local FullBackend stays false.
llvm-compose-ssa:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_COMPOSE_SSA_V0 / HOST-LLVM-COMPOSE-SSA"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-compose-ssa requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-compose-ssa
      lake exe slake-llvm-compose-ssa -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-compose-ssa: GREEN"
