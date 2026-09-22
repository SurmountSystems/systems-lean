# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until barrel import. Named SlakeTypecheckCheck driver.
# Check is a prefix of Checkers / CheckersLater. Unique needles.
# No bash, no Python.
{
  hostSpecsCompilePath42 = [
    {
      # HOST-SLAKE-TYPECHECK-CHECK named driver; Ready is HostFrontLiveCheck
      # parse plus kernelCheck of live HostCheck.lean, not := true.
      # Unique needles; Check is a prefix of Checkers / CheckersLater.
      # HOST-SLAKE-TYPECHECK-CHECK has no trailing newline in the driver
      # (quoted hostId and comma-separated greppable list).
      rel = "src/systems/SystemsLean/SlakeTypecheckCheck.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckCheck\n"
        "SLAKE_TYPECHECK_CHECK_V0"
        "HOST-SLAKE-TYPECHECK-CHECK"
        "slakeTypecheckCheckReady"
        "kernelCheckLiveHostCheckSource"
        "slakeTypecheckCheckDoesNotUseLake"
        "slakeTypecheckCheckFullHost"
        "slakeTypecheckCheckOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for named Slake typecheck Check driver.
      # Missing-token red until SystemsLean.lean imports this module.
      # Trailing newline: Check is a prefix of Checkers.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeTypecheckCheck\n"
      ];
    }
  ];
}
