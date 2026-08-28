# SPDX-License-Identifier: Unlicense
# Pure Nix systems LLVM IR presence: living LlvmHold unlock, emit-path design+stub,
# Mult..Graph unit text Lean modules, unit package artifacts, and compose text.
# Fail-closed on missing paths, honesty tokens, or forge-ban unlock pins.
# No bash, no ripgrep, no Python. No lake (writers stay thin just process glue).
#
#   import ./systems-llvm-ir { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary }
#
# Specs data: ./specs.nix (hold / emit-path / unit-text / unit-package /
# compose-text / as-smoke / abi-parity / layout-ir-dual-pin /
# ir-node-layout slices).
# Flake: checks.systems-llvm-ir-presence.
# Live gate (does not require git-tracked flake store): just systems-llvm-ir
{ lib, root }:
let
  specs = import ./specs.nix;
  inherit (specs) requiredFiles contentSpecs;

  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel =
    rel:
    if exists rel then
      builtins.readFile (root + "/${rel}")
    else
      null;

  # Do not use lib.hasInfix (regex match): stack-overflows on large files in CI.
  # See nix/string-contains.nix (NixOS/nix#2147 / libstdc++ long-string RE).
  has = import ../string-contains.nix;

  # all: every token must appear.
  # anyGroups: each list needs at least one hit.
  # forbidden: none of these tokens may appear (forge bans / false unlock pins).
  checkContent =
    rel: content:
    {
      all ? [ ],
      anyGroups ? [ ],
      forbidden ? [ ],
    }:
    (lib.concatMap (
      t: if has t content then [ ] else [ "${rel}: missing token ${t}" ]
    ) all)
    ++ (lib.concatMap (
      group:
      if lib.any (t: has t content) group then
        [ ]
      else
        [ "${rel}: missing any of [${lib.concatStringsSep " | " group}]" ]
    ) anyGroups)
    ++ (lib.concatMap (
      t:
      if has t content then
        [ "${rel}: forbidden token ${t}" ]
      else
        [ ]
    ) forbidden);

  fileViolations = lib.concatMap (
    rel: if exists rel then [ ] else [ "missing file: ${rel}" ]
  ) requiredFiles;

  contentViolations = lib.concatMap (
    spec:
    let
      content = readRel spec.rel;
    in
    if content == null then
      [ ]
    else
      checkContent spec.rel content {
        all = spec.all or [ ];
        anyGroups = spec.anyGroups or [ ];
        forbidden = spec.forbidden or [ ];
      }
  ) contentSpecs;

  violations = fileViolations ++ contentViolations;
  ok = violations == [ ];
  maxShow = 40;
  shown = lib.take maxShow violations;
  more =
    let
      n = builtins.length violations;
    in
    if n > maxShow then "\n... and ${toString (n - maxShow)} more" else "";
  summary =
    if ok then
      "systems-llvm-ir-presence OK (${toString (builtins.length requiredFiles)} required paths; hold unlock true; emit-path + Mult..Graph unit text; unit-package artifacts; compose text; Mult+Linear+Types+Program+Graph+Compose SSA partial; Mult CFG fixture deepen partial; Production CFG deepen (Mult SSA dual-pin); Mult dominance frontier partial + Cytron deepen (structural DF table + multDfComputed dual-pin; DominanceClaimed false); multi-unit Mult..Graph DF Cytron deepen (linear/types/program/graphDominanceFrontierDeepen + multiUnitDominanceFrontierDeepen; DominanceClaimed false); Linear CFG production dual-pin (multi-unit Mult+Linear); Types CFG production dual-pin (multi-unit Mult+Linear+Types); Program CFG production dual-pin (multi-unit Mult..Program); Graph CFG production dual-pin (multi-unit Mult..Graph); general program CFG partial (compose multi-merge beyond unit diamonds; fixture tip fullBackend true A-light); optional as-smoke honesty; abi-parity Mult fixture/header/IR; layout-ir-dual-pin Mult IR tags vs fixture; Mult layout consumer; Mult link readiness partial; Mult layout/IR consumer success partial; Mult foreign link success; Linear foreign link success; Types foreign link success; Program foreign link success; Graph foreign link success; Rust IR interop partial + full multi-band joint consumer (rustIrInteropFullClaimed true; multiBandJointConsumerOk; not formalized all of rustc; band FullBackendClaimed false; fixture tip fullBackend true A-light); richer-than-i32 IrNodeLayout + llvm-link-smoke just module)"
    else
      "systems-llvm-ir-presence FAILED:\n" + lib.concatStringsSep "\n" shown + more;
in
{
  inherit
    ok
    violations
    summary
    requiredFiles
    ;
}
