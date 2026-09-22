# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until barrel import. Named SlakeTypecheckTypesTheorems driver.
# Types is a prefix of TypesTheorems. Unique needles with trailing newline.
# Do not edit slice 37 (SlakeTypecheckTypes dests without trailing newline).
# Do not edit slice 44 (SlakeTypecheckMultTheorems dests).
# No bash, no Python.
{
  hostSpecsCompilePath45 = [
    {
      # HOST-SLAKE-TYPECHECK-TYPES-THEOREMS named driver; Ready is
      # HostFrontLiveTypesTheorems parse plus kernelCheck of live
      # TypesTheorems.lean, not := true.
      # Unique needles with trailing newline; Types is a prefix of TypesTheorems.
      rel = "src/systems/SystemsLean/SlakeTypecheckTypesTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckTypesTheorems\n"
        "SLAKE_TYPECHECK_TYPES_THEOREMS_V0"
        "HOST-SLAKE-TYPECHECK-TYPES-THEOREMS"
        "slake-typecheck-typestheorems"
        "slakeTypecheckTypesTheoremsReady"
        "kernelCheckLiveTypesTheoremsSource"
        "PARSE-LIVE-TYPESTHEOREMS"
        "slakeTypecheckTypesTheoremsDoesNotUseLake"
        "slakeTypecheckTypesTheoremsFullHost"
        "slakeTypecheckTypesTheoremsOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for named Slake typecheck TypesTheorems driver.
      # Missing-token red until SystemsLean.lean imports this module.
      # Trailing newline: Types is a prefix of TypesTheorems.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeTypecheckTypesTheorems\n"
      ];
    }
  ];
}
