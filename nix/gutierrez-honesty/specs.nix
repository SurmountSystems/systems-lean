# SPDX-License-Identifier: Unlicense
# Data for Gutierrez honesty. Living-lie clauses live in
# nix/slake-remaining-distance (imported by ./default.nix). Occupancy
# stays 49. FullHost false. slakeOwnsPackageTypecheck false.
# allTypesUseCheckDone false. Do not mill. Mills 69 of 69 stay.
# Comments-only C is imported here from nix/slake-linear-fixture-c.
# The comments-only needle is fixture specs toyCommentsOnly / toyBlockOnly.
{
  remainingRel = "nix/slake-remaining-distance";
  fixtureRel = "nix/slake-linear-fixture-c";
  needleRel = "nix/gutierrez-honesty/comments-only-needle.nix";
}
