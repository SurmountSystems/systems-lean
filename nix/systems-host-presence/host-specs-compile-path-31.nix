# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveTypesTheorems parse of live TypesTheorems.lean
# (not Types fixture, not HostFrontLiveTypes).
# No bash, no Python.
{
  hostSpecsCompilePath31 = [
    {
      # HOST-FRONT-LIVE-TYPESTHEOREMS: parse live
      # TypesTheorems.lean (not HostTerm.multFixtureModule, not
      # Types.lean live parse).
      rel = "src/systems/SystemsLean/HostFrontLiveTypesTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveTypesTheorems"
        "HOST-FRONT-LIVE-TYPESTHEOREMS"
        "SLAKE_HOST_FRONT_LIVE_TYPESTHEOREMS_V0"
        "PARSE-LIVE-TYPESTHEOREMS"
        "parseLiveTypesTheoremsSource"
        "kernelCheckLiveTypesTheoremsSource"
        "hostFrontLiveTypesTheoremsReady"
        "liveTypesTheoremsSource"
        "liveTypesTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-TYPESTHEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveTypesTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveTypesTheoremsMain"
        "HOST-FRONT-LIVE-TYPESTHEOREMS"
        "SLAKE_HOST_FRONT_LIVE_TYPESTHEOREMS_V0"
        "PARSE-LIVE-TYPESTHEOREMS"
        "parseLiveTypesTheoremsSource"
        "kernelCheckLiveTypesTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-TYPESTHEOREMS.
      rel = "src/systems/SystemsLean/HostFrontLiveTypesTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveTypesTheoremsSource"
        "HOST-FRONT-LIVE-TYPESTHEOREMS"
        "PARSE-LIVE-TYPESTHEOREMS"
        "liveTypesTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK TypesTheorems kernel path (live
      # TypesTheorems.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckTypesTheoremsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckTypesTheoremsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "TypesTheorems-only"
        "checkTypesTheoremsKernel"
        "hostModuleCheckTypesTheoremsKernelOk"
        "hostModuleCheckLiveTypesTheoremsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveTypesTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-TYPESTHEOREMS. Missing-token red
      # until SystemsLean.lean imports these modules.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveTypesTheorems"
        "import SystemsLean.HostModuleCheckTypesTheoremsKernel"
      ];
    }
  ];
}
