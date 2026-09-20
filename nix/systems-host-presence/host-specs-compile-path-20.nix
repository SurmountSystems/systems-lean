# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveSurface parse of live HostModuleCheckSurface.lean
# (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath20 = [
    {
      # HOST-FRONT-LIVE-SURFACE: parse live
      # HostModuleCheckSurface.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveSurface.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveSurface"
        "HOST-FRONT-LIVE-SURFACE"
        "SLAKE_HOST_FRONT_LIVE_SURFACE_V0"
        "PARSE-LIVE-SURFACE"
        "parseLiveSurfaceSource"
        "kernelCheckLiveSurfaceSource"
        "hostFrontLiveSurfaceReady"
        "liveSurfaceSource"
        "liveSurfaceRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-SURFACE. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveSurfaceMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveSurfaceMain"
        "HOST-FRONT-LIVE-SURFACE"
        "SLAKE_HOST_FRONT_LIVE_SURFACE_V0"
        "PARSE-LIVE-SURFACE"
        "parseLiveSurfaceSource"
        "kernelCheckLiveSurfaceSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-SURFACE.
      rel = "src/systems/SystemsLean/HostFrontLiveSurfaceSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveSurfaceSource"
        "PARSE-LIVE-SURFACE"
        "liveSurfaceSource"
        "HOST-FRONT-LIVE-SURFACE"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Surface kernel path (live
      # HostModuleCheckSurface.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckSurfaceKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSurfaceKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckSurface-only"
        "checkSurfaceKernel"
        "hostModuleCheckSurfaceKernelOk"
        "hostModuleCheckLiveSurfaceParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveSurface"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
