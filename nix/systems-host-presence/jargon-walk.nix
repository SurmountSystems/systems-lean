# SPDX-License-Identifier: Unlicense
# Tree-wide banned-jargon walk config under src/systems (former check.sh mill).
# Skip package-local Lake / VCS / cache (same set as emit-wire unit walk).
# Imported by ./specs.nix thin join. No bash.
{
  jargonWalkRoot = "src/systems";
  jargonWalkSkipDirs = [
    ".lake"
    ".git"
    ".cache"
  ];
  # Match former shell --include set.
  jargonWalkExtensions = [
    ".md"
    ".slake"
    ".lean"
    ".c"
    ".h"
  ];
  # Case-folded substring ban (fail-closed; see default.nix comment on FP risk).
  jargonForbidden = [
    "pole"
    "spine"
  ];
}
