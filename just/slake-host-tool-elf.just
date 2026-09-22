# Modular just: just/slake-host-tool-elf.just -- thin wrapper.
# Presence: nix/slake-host-tool-elf.nix. Checker: SystemsLean/SlakeHostToolElf.lean.
# Dest is out/slake-host-tool-elf/slake-freestanding-self-host-complete.
# Dest is Lean-owned ET_EXEC (wrapper plus callee). Do not clang. Not mill leanc.
# Not remill mill 69. No lake. No mill row. Occupancy 49. FullHost false.
# Greppable: slake-host-tool-elf, SLAKE_HOST_TOOL_ELF_V0, HOST-SLAKE-HOST-TOOL-ELF.

_slake_host_tool_elf := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/slake-host-tool-elf.nix { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

slake-host-tool-elf-presence:
    @nix eval --impure --raw --expr {{quote(_slake_host_tool_elf)}}

# lean --run write emits named plan, callee ET_REL, dest ET_EXEC.
# Fail closed dest-missing unless dest is a real linked program. Do not mill.
slake-host-tool-elf: slake-host-tool-elf-presence
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeHostToolElf.lean"
    dest="$root/out/slake-host-tool-elf/slake-freestanding-self-host-complete"
    echo "SLAKE_HOST_TOOL_ELF_V0 / HOST-SLAKE-HOST-TOOL-ELF"
    echo "HOST-HOST-TOOL-ELF-LINK dest ET_EXEC (not mill leanc; do not clang)"
    if ! command -v lean >/dev/null 2>&1; then
      echo "error: lean not on PATH; fail closed" >&2
      exit 1
    fi
    test -f "$src" || { echo "error: missing Lean checker $src" >&2; exit 1; }
    test -f "$src_root/SystemsLean/SlakeHostToolElfLink.lean" || {
      echo "error: missing Lean linker $src_root/SystemsLean/SlakeHostToolElfLink.lean" >&2
      exit 1
    }
    test -f "$src_root/SystemsLean/SlakeHostToolElfMeasure.lean" || {
      echo "error: missing Lean measure $src_root/SystemsLean/SlakeHostToolElfMeasure.lean" >&2
      exit 1
    }
    test -f "$src_root/SystemsLean/SlakeHostToolElfMeasureFields.lean" || {
      echo "error: missing Lean measure fields $src_root/SystemsLean/SlakeHostToolElfMeasureFields.lean" >&2
      exit 1
    }
    test -f "$src_root/SystemsLean/SlakeHostToolElfMeasureGreen.lean" || {
      echo "error: missing Lean measure green $src_root/SystemsLean/SlakeHostToolElfMeasureGreen.lean" >&2
      exit 1
    }
    test -f "$src_root/SystemsLean/SlakeHostToolElfMeasureX86.lean" || {
      echo "error: missing Lean measure x86 $src_root/SystemsLean/SlakeHostToolElfMeasureX86.lean" >&2
      exit 1
    }
    test -f "$src_root/SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean" || {
      echo "error: missing Lean measure fields x86 $src_root/SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean" >&2
      exit 1
    }
    test -f "$src_root/SystemsLean/SlakeHostToolElfCompleteOk.lean" || {
      echo "error: missing Lean completeOk $src_root/SystemsLean/SlakeHostToolElfCompleteOk.lean" >&2
      exit 1
    }
    test -f "$src_root/SystemsLean/SlakeHostToolElfMeasureReloc.lean" || {
      echo "error: missing Lean measure reloc $src_root/SystemsLean/SlakeHostToolElfMeasureReloc.lean" >&2
      exit 1
    }
    test -f "$src_root/SystemsLean/SelfHostCompleteMain.lean" || {
      echo "error: missing source Main SystemsLean.SelfHostCompleteMain" >&2
      exit 1
    }
    modroot="$root/out/slake-host-tool-elf/mods"
    mkdir -p "$modroot/SystemsLean"
    lean -R "$src_root" -o "$modroot/SystemsLean/SlakeHostToolElfLink.olean" \
      "$src_root/SystemsLean/SlakeHostToolElfLink.lean"
    lean -R "$src_root" -o "$modroot/SystemsLean/SlakeHostToolElfMeasureFields.olean" \
      "$src_root/SystemsLean/SlakeHostToolElfMeasureFields.lean"
    lean -R "$src_root" -o "$modroot/SystemsLean/SlakeHostToolElfMeasureGreen.olean" \
      "$src_root/SystemsLean/SlakeHostToolElfMeasureGreen.lean"
    LEAN_PATH="$modroot" lean -R "$src_root" -o "$modroot/SystemsLean/SlakeHostToolElfMeasure.olean" \
      "$src_root/SystemsLean/SlakeHostToolElfMeasure.lean"
    LEAN_PATH="$modroot" lean -R "$src_root" -o "$modroot/SystemsLean/SlakeHostToolElfMeasureX86.olean" \
      "$src_root/SystemsLean/SlakeHostToolElfMeasureX86.lean"
    LEAN_PATH="$modroot" lean -R "$src_root" -o "$modroot/SystemsLean/SlakeHostToolElfMeasureFieldsX86.olean" \
      "$src_root/SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean"
    lean -R "$src_root" -o "$modroot/SystemsLean/SlakeHostToolElfCompleteOk.olean" \
      "$src_root/SystemsLean/SlakeHostToolElfCompleteOk.lean"
    LEAN_PATH="$modroot" lean -R "$src_root" -o "$modroot/SystemsLean/SlakeHostToolElfMeasureReloc.olean" \
      "$src_root/SystemsLean/SlakeHostToolElfMeasureReloc.lean"
    LEAN_PATH="$modroot" lean -R "$src_root" --run "$src" "$root" write
    if [[ ! -f "$dest" ]]; then
      echo "error: dest ELF must still be missing: $dest" >&2
      echo "honesty: Name SlakeHostToolElf is not GREEN; leftover emit/link remains" >&2
      exit 1
    fi
    echo "SLAKE_HOST_TOOL_ELF_V0 dest ELF present (Lean-owned ET_EXEC; not mill leanc)"
