# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until barrel import. Named SlakeTypecheckExtractTheorems driver.
# Extract is a prefix of ExtractTheorems. Unique needles with trailing newline.
# Do not edit slice 37 (SlakeTypecheckExtract dests without trailing newline).
# No bash, no Python.
{
  hostSpecsCompilePath43 = [
    {
      # HOST-SLAKE-TYPECHECK-EXTRACT-THEOREMS named driver; Ready is
      # HostFrontLiveExtractTheorems parse plus kernelCheck of live
      # ExtractTheorems.lean, not := true.
      # Unique needles with trailing newline; Extract is a prefix of ExtractTheorems.
      rel = "src/systems/SystemsLean/SlakeTypecheckExtractTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckExtractTheorems\n"
        "SLAKE_TYPECHECK_EXTRACT_THEOREMS_V0"
        "HOST-SLAKE-TYPECHECK-EXTRACT-THEOREMS"
        "slake-typecheck-extracttheorems"
        "slakeTypecheckExtractTheoremsReady"
        "kernelCheckLiveExtractTheoremsSource"
        "PARSE-LIVE-EXTRACT-THEOREMS"
        "slakeTypecheckExtractTheoremsDoesNotUseLake"
        "slakeTypecheckExtractTheoremsFullHost"
        "slakeTypecheckExtractTheoremsOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for named Slake typecheck ExtractTheorems driver.
      # Missing-token red until SystemsLean.lean imports this module.
      # Trailing newline: Extract is a prefix of ExtractTheorems.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeTypecheckExtractTheorems\n"
      ];
    }
  ];
}
