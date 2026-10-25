# SPDX-License-Identifier: Unlicense
# Data for Gutierrez honesty. Living-lie clauses live in
# nix/slake-remaining-distance (imported by ./default.nix). Occupancy
# stays 49. FullHost false. slakeOwnsPackageTypecheck false.
# allTypesUseCheckDone false. Do not mill. Mills 55 through 69 stay.
# HostKernel.lean 779 closed. Dual clocks unadded. Comments-only C is
# imported here from nix/slake-linear-fixture-c. The comments-only
# needle is fixture specs toyCommentsOnly / toyBlockOnly.
# 0002 SafeC is SafeCJudgment and toSafeC correspondence with toRust
# and Corresponds (accessed: 2026-10-23). Those maps are statements,
# not an isomorphism theorem. SafeCompCert implies SafeKernel. The
# converse is false. Facebook SafeC wrappers are not 0002 SafeC.
{
  remainingRel = "nix/slake-remaining-distance";
  fixtureRel = "nix/slake-linear-fixture-c";
  needleRel = "nix/gutierrez-honesty/comments-only-needle.nix";

  occupancyStay = 49;
  occupancyFail = 50;
  hostKernelClosed = 779;
  millStayLo = 55;
  millStayHi = 69;

  ownsPkgHeld = false;
  fullHostHeld = false;
  correspondenceNotIsomorphism = true;
  toSafeCIsomorphismHeld = false;
  safeCompCertImpliesSafeKernelHeld = true;
  safeKernelImpliesSafeCompCertHeld = false;
  facebookSafeCIs0002Held = false;

  safeCJudgmentName = "SafeCJudgment";
  toSafeCName = "toSafeC";
  toRustName = "toRust";
  correspondsName = "Corresponds";
  specMdUrl = "https://github.com/SurmountSystems/specs/blob/main/0002_Systems_Lean.md";
  specLeanRel = "0002_Systems_Lean.lean";
  proofsRel = "lean/SystemsLeanProofs.lean";
}
