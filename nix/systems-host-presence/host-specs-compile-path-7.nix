# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLivePackageRoots parse of live HostPackageRoots.lean (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath7 = [
    {
      # HOST-FRONT-LIVE-PACKAGE-ROOTS: parse live HostPackageRoots.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLivePackageRoots.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageRoots"
        "HOST-FRONT-LIVE-PACKAGE-ROOTS"
        "SLAKE_HOST_FRONT_LIVE_PACKAGE_ROOTS_V0"
        "PARSE-LIVE-PACKAGE-ROOTS"
        "parseLivePackageRootsSource"
        "kernelCheckLivePackageRootsSource"
        "hostFrontLivePackageRootsReady"
        "livePackageRootsSource"
        "livePackageRootsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-PACKAGE-ROOTS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLivePackageRootsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageRootsMain"
        "HOST-FRONT-LIVE-PACKAGE-ROOTS"
        "SLAKE_HOST_FRONT_LIVE_PACKAGE_ROOTS_V0"
        "PARSE-LIVE-PACKAGE-ROOTS"
        "parseLivePackageRootsSource"
        "kernelCheckLivePackageRootsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin live HostPackageRoots.lean bytes.
      rel = "src/systems/SystemsLean/HostFrontLivePackageRootsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageRootsSource"
        "PARSE-LIVE-PACKAGE-ROOTS"
        "livePackageRootsSource"
        "HOST-FRONT-LIVE-PACKAGE-ROOTS"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK HostPackageRoots kernel path (live HostPackageRoots.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageRootsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageRootsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostPackageRoots-only"
        "checkPackageRootsKernel"
        "hostModuleCheckPackageRootsKernelOk"
        "hostModuleCheckLivePackageRootsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLivePackageRoots"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-GRAPH: parse live HostGraph.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveGraph.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveGraph"
        "HOST-FRONT-LIVE-GRAPH"
        "SLAKE_HOST_FRONT_LIVE_GRAPH_V0"
        "PARSE-LIVE-HOST-GRAPH"
        "parseLiveHostGraphSource"
        "kernelCheckLiveHostGraphSource"
        "hostFrontLiveGraphReady"
        "liveHostGraphSource"
        "liveHostGraphRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-HOST-GRAPH. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveGraphMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveGraphMain"
        "HOST-FRONT-LIVE-GRAPH"
        "SLAKE_HOST_FRONT_LIVE_GRAPH_V0"
        "PARSE-LIVE-HOST-GRAPH"
        "parseLiveHostGraphSource"
        "kernelCheckLiveHostGraphSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin live HostGraph.lean bytes.
      rel = "src/systems/SystemsLean/HostFrontLiveGraphSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveGraphSource"
        "PARSE-LIVE-HOST-GRAPH"
        "liveHostGraphSource"
        "HOST-FRONT-LIVE-GRAPH"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK HostGraph kernel path (live HostGraph.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckHostGraphKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckHostGraphKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostGraph-only"
        "checkHostGraphKernel"
        "hostModuleCheckHostGraphKernelOk"
        "hostModuleCheckLiveHostGraphParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveGraph"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
