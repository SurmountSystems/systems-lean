# SPDX-License-Identifier: Unlicense
# Pure Nix Gutierrez honesty: import remaining-distance so the four
# living-lie clauses are not a second copy. remaining-distance already
# fail-closes allTypesUseCheckDone true, slakeOwnsPackageTypecheck true,
# occupancy 50 / not 49, and FullHost true. Comments-only C fails closed
# by importing nix/slake-linear-fixture-c here. Green means those lies
# are absent, not that the flags flipped true. Occupancy stays 49.
# FullHost false. Flag false. Do not mill. Mills 69 of 69 stay.
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
{ lib, root }:
let
  specs = import ./specs.nix;
  remaining = import ../slake-remaining-distance { inherit lib root; };
  fixture = import ../slake-linear-fixture-c { inherit lib root; };
  commentsOnlyNeedle = import ./comments-only-needle.nix { inherit lib; };
  remainingWithoutCollapsedC =
    lib.filter (v: v != "named allocate/free C: FAIL") remaining.violations;
  needleGreened =
    if commentsOnlyNeedle.ok then
      [ "comments-only C needle greened (must fail closed)" ]
    else
      [ ];
  violations =
    fixture.violations ++ remainingWithoutCollapsedC ++ needleGreened;
  ok = violations == [ ];
  shown = lib.take 40 violations;
  more =
    let
      n = builtins.length violations;
    in
    if n > 40 then "\n... and ${toString (n - 40)} more" else "";
  summary =
    if ok then
      "gutierrez-honesty OK (living lies absent via ${specs.remainingRel}; occupancy 49; FullHost false; slakeOwnsPackageTypecheck false; allTypesUseCheckDone false; comments-only C fails closed via ${specs.fixtureRel})"
    else
      "gutierrez-honesty FAILED:\n" + lib.concatStringsSep "\n" shown + more;
in
{
  inherit ok violations summary commentsOnlyNeedle;
}
