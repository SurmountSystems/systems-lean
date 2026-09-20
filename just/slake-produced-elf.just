# Modular just: just/slake-produced-elf.just -- thin wrapper.
# Presence: nix/slake-produced-elf.nix. Printer: SystemsLean/SlakeProducedElf.lean.
# Dest is out/slake-produced-elf/slake-hello. Not mill leanc. Not mill 69 of 69.
# Fail closed if clang or lean missing (not skip-GREEN). No lake. No mill row.
# Greppable: slake-produced-elf, SLAKE_PRODUCED_ELF_V0, HOST-SLAKE-PRODUCED-ELF.

_slake_produced_elf := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/slake-produced-elf.nix { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

slake-produced-elf-presence:
    @nix eval --impure --raw --expr {{quote(_slake_produced_elf)}}

slake-produced-elf: slake-produced-elf-presence
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeProducedElf.lean"
    dest="$root/out/slake-produced-elf/slake-hello"
    echo "SLAKE_PRODUCED_ELF_V0 / HOST-SLAKE-PRODUCED-ELF"
    if ! command -v lean >/dev/null 2>&1; then
      echo "error: lean not on PATH; fail closed" >&2
      exit 1
    fi
    if ! command -v clang >/dev/null 2>&1; then
      echo "error: clang not on PATH; fail closed (not skip-GREEN, not mill leanc)" >&2
      exit 1
    fi
    test -f "$src" || { echo "error: missing Lean printer $src" >&2; exit 1; }
    test -f "$root/out/llvm-ir/slake_compose_ssa.ll" || { echo "error: missing generator Compose SSA" >&2; exit 1; }
    lean -R "$src_root" --run "$src" "$root" write
    test -x "$dest" || { echo "error: missing dest ELF $dest" >&2; exit 1; }
    echo "slake-produced-elf: GREEN $dest (not mill leanc)"

slake-produced-elf-check: slake-produced-elf-presence
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeProducedElf.lean"
    dest="$root/out/slake-produced-elf/slake-hello"
    echo "SLAKE_PRODUCED_ELF_V0 / HOST-SLAKE-PRODUCED-ELF check"
    if ! command -v lean >/dev/null 2>&1; then
      echo "error: lean not on PATH; fail closed" >&2
      exit 1
    fi
    test -f "$src" || { echo "error: missing Lean printer $src" >&2; exit 1; }
    lean -R "$src_root" --run "$src" "$root" check
    echo "slake-produced-elf-check: GREEN $dest (not mill leanc)"
