# SPDX-License-Identifier: Unlicense
# Pure Nix slake-produced-elf presence: dest path, tokens, fail-closed policy.
# Live clang/lean is not a pure derivation of a host PATH ELF. Thin just
# wrapper evals this module then runs lean --run on the Lean printer.
# Dest is out/slake-produced-elf/slake-hello. Not mill leanc. Not mill 69 of 69.
# Dest binary is excluded from novel-source (hygiene skip; other L2). This
# check does not read that ELF. Does not claim Lake-gone. Occupancy stays 49.
#
#   import ./slake-produced-elf.nix { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary, destRel }
{ lib, root }:
let
  destRel = "out/slake-produced-elf/slake-hello";
  printerRel = "src/systems/SystemsLean/SlakeProducedElf.lean";
  justRel = "just/slake-produced-elf.just";
  composeRel = "out/llvm-ir/slake_compose_ssa.ll";

  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel =
    rel:
    if exists rel then
      builtins.readFile (root + "/${rel}")
    else
      null;
  has = import ./string-contains.nix;

  destForbidden = has "first-host-tool" destRel || has "leanc" destRel;

  destViolations =
    (
      if destRel == "out/slake-produced-elf/slake-hello" then
        [ ]
      else
        [ "destRel must be out/slake-produced-elf/slake-hello" ]
    )
    ++ (
      if destForbidden then
        [ "destRel must not be a mill ELF path (first-host-tool or leanc)" ]
      else
        [ ]
    );

  missingFile = rel: if exists rel then [ ] else [ "missing file: ${rel}" ];

  tokenMiss =
    rel: content: tokens:
    if content == null then
      [ ]
    else
      lib.concatMap (
        t: if has t content then [ ] else [ "${rel}: missing token ${t}" ]
      ) tokens;

  printerContent = readRel printerRel;
  printerTokens = [
    "HOST-SLAKE-PRODUCED-ELF"
    "SLAKE_PRODUCED_ELF_V0"
    destRel
    "slake_compose_ssa_mint_status"
    "not mill leanc"
  ];

  justContent = readRel justRel;
  justTokens = [
    "fail closed"
    "clang"
    "lean -R"
    destRel
    "not mill leanc"
    "nix/slake-produced-elf.nix"
    "SLAKE_PRODUCED_ELF_V0"
  ];

  violations =
    destViolations
    ++ missingFile printerRel
    ++ missingFile justRel
    ++ missingFile composeRel
    ++ tokenMiss printerRel printerContent printerTokens
    ++ tokenMiss justRel justContent justTokens;

  ok = violations == [ ];
  summary =
    if ok then
      "slake-produced-elf OK (dest=${destRel}; not mill leanc; fail-closed clang/lean is just glue, not a pure derivation; occupancy 49)"
    else
      "slake-produced-elf FAILED:\n" + lib.concatStringsSep "\n" violations;
in
{
  inherit
    ok
    violations
    summary
    destRel
    printerRel
    justRel
    composeRel
    ;
}
