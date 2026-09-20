# SPDX-License-Identifier: Unlicense
# Filter flake source to novel work only (no ref/, skills submodules, git, cache, result).
{ lib, src }:
lib.cleanSourceWith {
  name = "systems-lean-novel";
  inherit src;
  filter =
    path: _type:
    let
      rel = lib.removePrefix (toString src + "/") (toString path);
      base = baseNameOf path;
    in
    !(lib.hasPrefix "ref/" rel)
    && !(lib.hasPrefix "skills/" rel)
    && !(lib.hasPrefix ".git/" rel)
    && !(lib.hasInfix "/.git/" rel)
    && !(lib.hasPrefix ".cache/" rel)
    && !(lib.hasInfix "/.cache/" rel)
    && !(lib.hasPrefix ".lake/" rel)
    && !(lib.hasInfix "/.lake/" rel)
    && !(lib.hasPrefix "src/systems/bin/" rel)
    && !(lib.hasInfix "/src/systems/bin/" rel)
    # Host ELF dest; hygiene walks text only (Nix readFile cannot load binaries).
    && !(lib.hasPrefix "out/slake-produced-elf/" rel)
    && !(lib.hasInfix "/out/slake-produced-elf/" rel)
    # Idris 2 elaborator writes examples/build/*.ttc next to duals (not product).
    && !(lib.hasPrefix "src/idris2/examples/build/" rel)
    && !(lib.hasInfix "/src/idris2/examples/build/" rel)
    && !(lib.hasSuffix ".ttc" rel)
    && !(lib.hasPrefix "result" base)
    && !(lib.hasSuffix ".pyc" rel)
    && !(lib.hasInfix "__pycache__" rel);
}
