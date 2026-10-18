# SPDX-License-Identifier: Unlicense
# Data for the String.Slice copy gate. Novel Systems Lean only.
# Occupancy 49. FullHost false. Do not mill. Do not chase String.mk.
{
  walkRels = [
    "src/systems/SystemsLean"
    "src/systems/emit"
  ];
  skipDirs = [
    ".git"
    "ref"
    "skills"
    ".lake"
    ".cache"
    "build"
  ];
  listDropSuffixes = [
    "toList"
    ".List"
    ".Array"
    ".Subarray"
  ];
  listDropExact = [
    "List"
    "Array"
    "Subarray"
  ];
  # First method on the drop result: copy passes; trim/toList/splitOn fail.
  methods = [
    { tok = ".copy"; kind = "copy"; }
    { tok = ".trim"; kind = "bad"; }
    { tok = ".toList"; kind = "bad"; }
    { tok = ".splitOn"; kind = "bad"; }
    { tok = "|> copy"; kind = "copy"; }
    { tok = "|>copy"; kind = "copy"; }
    { tok = "|> trim"; kind = "bad"; }
    { tok = "|>trim"; kind = "bad"; }
    { tok = "|> toList"; kind = "bad"; }
    { tok = "|>toList"; kind = "bad"; }
    { tok = "|> splitOn"; kind = "bad"; }
    { tok = "|>splitOn"; kind = "bad"; }
  ];
}
