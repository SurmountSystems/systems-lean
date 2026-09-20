# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveRequiredDecls parse of live HostModuleCheckRequiredDecls.lean
# (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath16 = [
    {
      # HOST-FRONT-LIVE-REQUIRED-DECLS: parse live HostModuleCheckRequiredDecls.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveRequiredDecls.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveRequiredDecls"
        "HOST-FRONT-LIVE-REQUIRED-DECLS"
        "SLAKE_HOST_FRONT_LIVE_REQUIRED_DECLS_V0"
        "PARSE-LIVE-REQUIRED-DECLS"
        "parseLiveRequiredDeclsSource"
        "kernelCheckLiveRequiredDeclsSource"
        "hostFrontLiveRequiredDeclsReady"
        "liveRequiredDeclsSource"
        "liveRequiredDeclsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-REQUIRED-DECLS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveRequiredDeclsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveRequiredDeclsMain"
        "HOST-FRONT-LIVE-REQUIRED-DECLS"
        "SLAKE_HOST_FRONT_LIVE_REQUIRED_DECLS_V0"
        "PARSE-LIVE-REQUIRED-DECLS"
        "parseLiveRequiredDeclsSource"
        "kernelCheckLiveRequiredDeclsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-REQUIRED-DECLS.
      rel = "src/systems/SystemsLean/HostFrontLiveRequiredDeclsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveRequiredDeclsSource"
        "PARSE-LIVE-REQUIRED-DECLS"
        "liveRequiredDeclsSource"
        "HOST-FRONT-LIVE-REQUIRED-DECLS"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK RequiredDecls kernel path (live HostModuleCheckRequiredDecls.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckRequiredDeclsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckRequiredDeclsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckRequiredDecls-only"
        "checkRequiredDeclsKernel"
        "hostModuleCheckRequiredDeclsKernelOk"
        "hostModuleCheckLiveRequiredDeclsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveRequiredDecls"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
