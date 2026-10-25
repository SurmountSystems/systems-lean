# SPDX-License-Identifier: Unlicense
# Pure Nix Gutierrez honesty: import remaining-distance so the four
# living-lie clauses are not a second copy. remaining-distance already
# fail-closes allTypesUseCheckDone true, slakeOwnsPackageTypecheck true,
# occupancy 50 / not 49, and FullHost true. Overlay args here also
# fail-close a silent claim of those lies, plus toSafeC isomorphism,
# SafeKernel implying SafeCompCert, and Facebook SafeC as 0002
# SafeCJudgment / toSafeC. Correspondence maps are statements, not an
# isomorphism theorem. SafeCompCert implies SafeKernel. The converse
# is false. Facebook SafeC wrappers are not 0002 SafeC. Comments-only
# C fails closed by importing nix/slake-linear-fixture-c here. Green
# means those lies are absent, not that the flags flipped true.
# Occupancy stays 49. FullHost false. Flag false. Do not mill. Mills
# 55 through 69 stay. HostKernel.lean 779 closed. Dual clocks unadded.
# Flake not wired.
#
#   import ./gutierrez-honesty { inherit lib; root = repoRoot; }
#   -> { ok, violations, summary }
#
# Live impure eval (flake checks see only git-tracked paths):
#   nix eval --impure --raw --expr 'let lib = (import (builtins.getFlake "nixpkgs") {}).lib;
#     root = ./.; g = import ./nix/gutierrez-honesty { inherit lib root; };
#     in if g.ok then g.summary + "\n" else throw g.summary'
# Comments-only needle (fixture toyCommentsOnly / toyBlockOnly as C input):
#   nix eval --impure --raw --expr 'let lib = (import (builtins.getFlake "nixpkgs") {}).lib;
#     root = ./.; g = import ./nix/gutierrez-honesty { inherit lib root; };
#     in if g.commentsOnlyNeedle.ok then g.commentsOnlyNeedle.summary + "\n"
#        else throw g.commentsOnlyNeedle.summary'
# Silent-claim overlays (must throw / ok false):
#   slakeOwnsPackageTypecheck = true
#   occupancy = 50
#   fullHost = true
#   toSafeCIsomorphism = true
#   safeKernelImpliesSafeCompCert = true
#   facebookSafeCIs0002 = true
{
  lib,
  root,
  slakeOwnsPackageTypecheck ? null,
  occupancy ? null,
  fullHost ? null,
  toSafeCIsomorphism ? null,
  safeKernelImpliesSafeCompCert ? null,
  facebookSafeCIs0002 ? null,
}:
let
  specs = import ./specs.nix;
  remaining = import ../slake-remaining-distance { inherit lib root; };
  fixture = import ../slake-linear-fixture-c { inherit lib root; };
  commentsOnlyNeedle = import ./comments-only-needle.nix { inherit lib; };
  flag = cond: msg: if cond then [ msg ] else [ ];
  overlayViolations =
    flag (slakeOwnsPackageTypecheck == true)
      "slakeOwnsPackageTypecheck true (must stay false; silent claim fail-closed)"
    ++ flag (occupancy == specs.occupancyFail)
      "occupancy ${toString occupancy} (must stay ${toString specs.occupancyStay}; fail closed at ${toString specs.occupancyFail})"
    ++ flag (fullHost == true)
      "FullHost true (must stay false; silent claim fail-closed)"
    ++ flag (toSafeCIsomorphism == true || specs.toSafeCIsomorphismHeld)
      "${specs.toSafeCName} isomorphism theorem claimed (maps are statements / ${specs.correspondsName} only; not an isomorphism)"
    ++ flag (safeKernelImpliesSafeCompCert == true || specs.safeKernelImpliesSafeCompCertHeld)
      "SafeKernel implying SafeCompCert (wrong direction; living direction is SafeCompCert implies SafeKernel; converse is false)"
    ++ flag (facebookSafeCIs0002 == true || specs.facebookSafeCIs0002Held)
      "Facebook SafeC wrappers treated as 0002 ${specs.safeCJudgmentName} / ${specs.toSafeCName} (they are not 0002 SafeC)"
    ++ flag (specs.occupancyStay != 49)
      "occupancy stay is ${toString specs.occupancyStay} (must stay 49)"
    ++ flag (specs.occupancyFail != 50)
      "occupancy fail-closed threshold is ${toString specs.occupancyFail} (must stay 50)"
    ++ flag specs.ownsPkgHeld
      "slakeOwnsPackageTypecheck held true in gutierrez-honesty specs (must stay false)"
    ++ flag specs.fullHostHeld
      "FullHost held true in gutierrez-honesty specs (must stay false)"
    ++ flag (!specs.correspondenceNotIsomorphism)
      "correspondence not isomorphism held false (must stay true)"
    ++ flag (!specs.safeCompCertImpliesSafeKernelHeld)
      "SafeCompCert implies SafeKernel held false (living direction must stay true)"
    ++ flag (specs.hostKernelClosed != 779)
      "HostKernel.lean closed line is ${toString specs.hostKernelClosed} (must stay 779)"
    ++ flag (specs.millStayLo != 55 || specs.millStayHi != 69)
      "mills stay ${toString specs.millStayLo} through ${toString specs.millStayHi} (must stay 55 through 69)";
  remainingWithoutCollapsedC =
    lib.filter (v: v != "named allocate/free C: FAIL") remaining.violations;
  needleGreened =
    if commentsOnlyNeedle.ok then
      [ "comments-only C needle greened (must fail closed)" ]
    else
      [ ];
  violations =
    fixture.violations ++ remainingWithoutCollapsedC ++ needleGreened ++ overlayViolations;
  ok = violations == [ ];
  shown = lib.take 40 violations;
  more =
    let
      n = builtins.length violations;
    in
    if n > 40 then "\n... and ${toString (n - 40)} more" else "";
  summary =
    if ok then
      "gutierrez-honesty OK (living lies absent via ${specs.remainingRel}; occupancy ${toString specs.occupancyStay}; FullHost false; slakeOwnsPackageTypecheck false; allTypesUseCheckDone false; ${specs.toSafeCName} correspondence not isomorphism; SafeCompCert implies SafeKernel and converse false; Facebook SafeC is not 0002 ${specs.safeCJudgmentName}; comments-only C fails closed via ${specs.fixtureRel})"
    else
      "gutierrez-honesty FAILED:\n" + lib.concatStringsSep "\n" shown + more;
in
{
  inherit ok violations summary commentsOnlyNeedle remaining;
  inherit (specs)
    occupancyStay
    occupancyFail
    ownsPkgHeld
    fullHostHeld
    correspondenceNotIsomorphism
    toSafeCIsomorphismHeld
    safeCompCertImpliesSafeKernelHeld
    safeKernelImpliesSafeCompCertHeld
    facebookSafeCIs0002Held
    safeCJudgmentName
    toSafeCName
    toRustName
    correspondsName
    specMdUrl
    specLeanRel
    proofsRel
    hostKernelClosed
    millStayLo
    millStayHi;
}
