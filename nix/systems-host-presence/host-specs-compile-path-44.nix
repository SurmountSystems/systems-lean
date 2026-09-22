# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until barrel import. Named SlakeTypecheckMultTheorems driver.
# Mult is a prefix of MultTheorems. Unique needles with trailing newline.
# Do not edit slice 37 (SlakeTypecheckMult dests without trailing newline).
# No bash, no Python.
{
  hostSpecsCompilePath44 = [
    {
      # HOST-SLAKE-TYPECHECK-MULT-THEOREMS named driver; Ready is
      # HostFrontLiveMultTheorems parse plus kernelCheck of live
      # MultTheorems.lean, not := true.
      # Unique needles with trailing newline; Mult is a prefix of MultTheorems.
      rel = "src/systems/SystemsLean/SlakeTypecheckMultTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckMultTheorems\n"
        "SLAKE_TYPECHECK_MULT_THEOREMS_V0"
        "HOST-SLAKE-TYPECHECK-MULT-THEOREMS"
        "slake-typecheck-multtheorems"
        "slakeTypecheckMultTheoremsReady"
        "kernelCheckLiveMultTheoremsSource"
        "PARSE-LIVE-MULT-THEOREMS"
        "slakeTypecheckMultTheoremsDoesNotUseLake"
        "slakeTypecheckMultTheoremsFullHost"
        "slakeTypecheckMultTheoremsOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for named Slake typecheck MultTheorems driver.
      # Missing-token red until SystemsLean.lean imports this module.
      # Trailing newline: Mult is a prefix of MultTheorems.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeTypecheckMultTheorems\n"
      ];
    }
  ];
}
