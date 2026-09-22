# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Named Slake typecheck drivers (lean --run; not mill; not lake on the step).
# No bash, no Python. No Kernel companions (drivers wrap HostFrontLive*).
{
  hostSpecsCompilePath37 = [
    {
      # HOST-SLAKE-TYPECHECK-MULT: named driver for just slake-typecheck-mult.
      # Ready is HostFrontLiveMult parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckMult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckMult"
        "HOST-SLAKE-TYPECHECK-MULT"
        "SLAKE_TYPECHECK_MULT_V0"
        "slake-typecheck-mult"
        "slakeTypecheckMultReady"
        "kernelCheckLiveMultSource"
        "PARSE-LIVE-MULT"
        "import SystemsLean.HostFrontLiveMult"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-TYPES: named driver for just slake-typecheck-types.
      rel = "src/systems/SystemsLean/SlakeTypecheckTypes.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckTypes"
        "HOST-SLAKE-TYPECHECK-TYPES"
        "SLAKE_TYPECHECK_TYPES_V0"
        "slake-typecheck-types"
        "slakeTypecheckTypesReady"
        "kernelCheckLiveTypesSource"
        "PARSE-LIVE-TYPES"
        "import SystemsLean.HostFrontLiveTypes"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-ERASURE: named driver for just slake-typecheck-erasure.
      rel = "src/systems/SystemsLean/SlakeTypecheckErasure.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckErasure"
        "HOST-SLAKE-TYPECHECK-ERASURE"
        "SLAKE_TYPECHECK_ERASURE_V0"
        "slake-typecheck-erasure"
        "slakeTypecheckErasureReady"
        "kernelCheckLiveErasureSource"
        "PARSE-LIVE-ERASURE"
        "import SystemsLean.HostFrontLiveErasure"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-EXTRACT: named driver for just slake-typecheck-extract.
      rel = "src/systems/SystemsLean/SlakeTypecheckExtract.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckExtract"
        "HOST-SLAKE-TYPECHECK-EXTRACT"
        "SLAKE_TYPECHECK_EXTRACT_V0"
        "slake-typecheck-extract"
        "slakeTypecheckExtractReady"
        "kernelCheckLiveExtractSource"
        "PARSE-LIVE-EXTRACT"
        "import SystemsLean.HostFrontLiveExtract"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-IRPROGRAM: named driver for just slake-typecheck-irprogram.
      rel = "src/systems/SystemsLean/SlakeTypecheckIrProgram.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckIrProgram"
        "HOST-SLAKE-TYPECHECK-IRPROGRAM"
        "SLAKE_TYPECHECK_IRPROGRAM_V0"
        "slake-typecheck-irprogram"
        "slakeTypecheckIrProgramReady"
        "kernelCheckLiveIrProgramSource"
        "PARSE-LIVE-IR-PROGRAM"
        "import SystemsLean.HostFrontLiveIrProgram"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-GRAPH: named driver for just slake-typecheck-graph.
      rel = "src/systems/SystemsLean/SlakeTypecheckGraph.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckGraph"
        "HOST-SLAKE-TYPECHECK-GRAPH"
        "SLAKE_TYPECHECK_GRAPH_V0"
        "slake-typecheck-graph"
        "slakeTypecheckGraphReady"
        "kernelCheckLiveHostGraphSource"
        "PARSE-LIVE-HOST-GRAPH"
        "import SystemsLean.HostFrontLiveGraph"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-PACKAGEWRITE: named driver for just slake-typecheck-packagewrite.
      rel = "src/systems/SystemsLean/SlakeTypecheckPackageWrite.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckPackageWrite"
        "HOST-SLAKE-TYPECHECK-PACKAGEWRITE"
        "SLAKE_TYPECHECK_PACKAGEWRITE_V0"
        "slake-typecheck-packagewrite"
        "slakeTypecheckPackageWriteReady"
        "kernelCheckLivePackageWriteSource"
        "PARSE-LIVE-PACKAGEWRITE"
        "import SystemsLean.HostFrontLivePackageWrite"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-PACKAGEROOTS: named driver for just slake-typecheck-packageroots.
      # Ready is HostFrontLivePackageRoots parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckPackageRoots.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckPackageRoots"
        "HOST-SLAKE-TYPECHECK-PACKAGEROOTS"
        "SLAKE_TYPECHECK_PACKAGEROOTS_V0"
        "slake-typecheck-packageroots"
        "slakeTypecheckPackageRootsReady"
        "kernelCheckLivePackageRootsSource"
        "PARSE-LIVE-PACKAGE-ROOTS"
        "import SystemsLean.HostFrontLivePackageRoots"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-HOSTTERM: named driver for just slake-typecheck-hostterm.
      # Ready is HostFrontLiveHostTerm parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckHostTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckHostTerm"
        "HOST-SLAKE-TYPECHECK-HOSTTERM"
        "SLAKE_TYPECHECK_HOSTTERM_V0"
        "slake-typecheck-hostterm"
        "slakeTypecheckHostTermReady"
        "kernelCheckLiveHostTermSource"
        "PARSE-LIVE-HOSTTERM"
        "import SystemsLean.HostFrontLiveHostTerm"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-GOLDENS: named driver for just slake-typecheck-goldens.
      # Ready is HostFrontLiveGoldens parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckGoldens.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckGoldens"
        "HOST-SLAKE-TYPECHECK-GOLDENS"
        "SLAKE_TYPECHECK_GOLDENS_V0"
        "slake-typecheck-goldens"
        "slakeTypecheckGoldensReady"
        "kernelCheckLiveGoldensSource"
        "PARSE-LIVE-GOLDENS"
        "import SystemsLean.HostFrontLiveGoldens"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-FRONT: named driver for just slake-typecheck-front.
      # Ready is HostFrontLiveFront parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckFront.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckFront"
        "HOST-SLAKE-TYPECHECK-FRONT"
        "SLAKE_TYPECHECK_FRONT_V0"
        "slake-typecheck-front"
        "slakeTypecheckFrontReady"
        "kernelCheckLiveFrontSource"
        "PARSE-LIVE-FRONT"
        "import SystemsLean.HostFrontLiveFront"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-FRONT-THEOREMS: named driver for
      # just slake-typecheck-fronttheorems.
      # Ready is HostFrontLiveFrontTheorems parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckFrontTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckFrontTheorems"
        "HOST-SLAKE-TYPECHECK-FRONT-THEOREMS"
        "SLAKE_TYPECHECK_FRONT_THEOREMS_V0"
        "slake-typecheck-fronttheorems"
        "slakeTypecheckFrontTheoremsReady"
        "kernelCheckLiveFrontTheoremsSource"
        "PARSE-LIVE-FRONT-THEOREMS"
        "import SystemsLean.HostFrontLiveFrontTheorems"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-GRAPH-THEOREMS: named driver for
      # just slake-typecheck-graphtheorems.
      # Ready is HostFrontLiveGraphTheorems parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckGraphTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckGraphTheorems"
        "HOST-SLAKE-TYPECHECK-GRAPH-THEOREMS"
        "SLAKE_TYPECHECK_GRAPH_THEOREMS_V0"
        "slake-typecheck-graphtheorems"
        "slakeTypecheckGraphTheoremsReady"
        "kernelCheckLiveGraphTheoremsSource"
        "PARSE-LIVE-GRAPH-THEOREMS"
        "import SystemsLean.HostFrontLiveGraphTheorems"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-PACKAGEWRITE-THEOREMS: named driver for
      # just slake-typecheck-packagewritetheorems.
      # Ready is HostFrontLivePackageWriteTheorems parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckPackageWriteTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckPackageWriteTheorems"
        "HOST-SLAKE-TYPECHECK-PACKAGEWRITE-THEOREMS"
        "SLAKE_TYPECHECK_PACKAGEWRITE_THEOREMS_V0"
        "slake-typecheck-packagewritetheorems"
        "slakeTypecheckPackageWriteTheoremsReady"
        "kernelCheckLivePackageWriteTheoremsSource"
        "PARSE-LIVE-PACKAGEWRITE-THEOREMS"
        "import SystemsLean.HostFrontLivePackageWriteTheorems"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-IMPORT-SEEDS: named driver for
      # just slake-typecheck-importseeds.
      # Ready is HostFrontLiveImportSeeds parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckImportSeeds.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckImportSeeds"
        "HOST-SLAKE-TYPECHECK-IMPORT-SEEDS"
        "SLAKE_TYPECHECK_IMPORT_SEEDS_V0"
        "slake-typecheck-importseeds"
        "slakeTypecheckImportSeedsReady"
        "kernelCheckLiveImportSeedsSource"
        "PARSE-LIVE-IMPORT-SEEDS"
        "import SystemsLean.HostFrontLiveImportSeeds"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-IMPORT-LOADOKLATER: named driver for
      # just slake-typecheck-importloadoklater.
      # Ready is HostFrontLiveImportLoadOkLater parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckImportLoadOkLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckImportLoadOkLater"
        "HOST-SLAKE-TYPECHECK-IMPORT-LOADOKLATER"
        "SLAKE_TYPECHECK_IMPORT_LOADOKLATER_V0"
        "slake-typecheck-importloadoklater"
        "slakeTypecheckImportLoadOkLaterReady"
        "kernelCheckLiveImportLoadOkLaterSource"
        "PARSE-LIVE-IMPORT-LOADOKLATER"
        "import SystemsLean.HostFrontLiveImportLoadOkLater"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-IMPORT-MODEL: named driver for
      # just slake-typecheck-importmodel.
      # Ready is HostFrontLiveImportModel parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckImportModel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckImportModel"
        "HOST-SLAKE-TYPECHECK-IMPORT-MODEL"
        "SLAKE_TYPECHECK_IMPORT_MODEL_V0"
        "slake-typecheck-importmodel"
        "slakeTypecheckImportModelReady"
        "kernelCheckLiveImportModelSource"
        "PARSE-LIVE-IMPORT-MODEL"
        "import SystemsLean.HostFrontLiveImportModel"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-IMPORT-MODS: named driver for
      # just slake-typecheck-importmods.
      # Ready is HostFrontLiveImportMods parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckImportMods.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckImportMods"
        "HOST-SLAKE-TYPECHECK-IMPORT-MODS"
        "SLAKE_TYPECHECK_IMPORT_MODS_V0"
        "slake-typecheck-importmods"
        "slakeTypecheckImportModsReady"
        "kernelCheckLiveImportModsSource"
        "PARSE-LIVE-IMPORT-MODS"
        "import SystemsLean.HostFrontLiveImportMods"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-IMPORT-MODS-LATER: named driver for
      # just slake-typecheck-importmodslater.
      # Ready is HostFrontLiveImportModsLater parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckImportModsLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckImportModsLater"
        "HOST-SLAKE-TYPECHECK-IMPORT-MODS-LATER"
        "SLAKE_TYPECHECK_IMPORT_MODS_LATER_V0"
        "slake-typecheck-importmodslater"
        "slakeTypecheckImportModsLaterReady"
        "kernelCheckLiveImportModsLaterSource"
        "PARSE-LIVE-IMPORT-MODS-LATER"
        "import SystemsLean.HostFrontLiveImportModsLater"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-IMPORT-WALKLATER: named driver for
      # just slake-typecheck-importwalklater.
      # Ready is HostFrontLiveImportWalkLater parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckImportWalkLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckImportWalkLater"
        "HOST-SLAKE-TYPECHECK-IMPORT-WALKLATER"
        "SLAKE_TYPECHECK_IMPORT_WALKLATER_V0"
        "slake-typecheck-importwalklater"
        "slakeTypecheckImportWalkLaterReady"
        "kernelCheckLiveImportWalkLaterSource"
        "PARSE-LIVE-IMPORT-WALK-LATER"
        "import SystemsLean.HostFrontLiveImportWalkLater"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-IMPORT-WALK: named driver for
      # just slake-typecheck-importwalk.
      # Ready is HostFrontLiveImportWalk parse plus kernelCheck, not := true.
      rel = "src/systems/SystemsLean/SlakeTypecheckImportWalk.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckImportWalk"
        "HOST-SLAKE-TYPECHECK-IMPORT-WALK"
        "SLAKE_TYPECHECK_IMPORT_WALK_V0"
        "slake-typecheck-importwalk"
        "slakeTypecheckImportWalkReady"
        "kernelCheckLiveImportWalkSource"
        "PARSE-LIVE-IMPORT-WALK"
        "import SystemsLean.HostFrontLiveImportWalk"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-REQUIRED-DECLS: named driver for
      # just slake-typecheck-requireddecls.
      # Ready is HostFrontLiveRequiredDecls parse plus kernelCheck, not := true.
      # Needles avoid RequiredDeclsLater / RequiredDeclsProduct prefixes.
      rel = "src/systems/SystemsLean/SlakeTypecheckRequiredDecls.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_TYPECHECK_REQUIRED_DECLS_V0"
        "slakeTypecheckRequiredDeclsReady"
        "kernelCheckLiveRequiredDeclsSource"
        "slakeTypecheckRequiredDeclsDoesNotUseLake"
        "slakeTypecheckRequiredDeclsFullHost"
        "slakeTypecheckRequiredDeclsOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-FIXTURES: named driver for
      # just slake-typecheck-fixtures.
      # Ready is HostFrontLiveFixtures parse plus kernelCheck, not := true.
      # Needles avoid FixtureTexts / later Fixtures prefixes.
      rel = "src/systems/SystemsLean/SlakeTypecheckFixtures.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckFixtures"
        "SLAKE_TYPECHECK_FIXTURES_V0"
        "slakeTypecheckFixturesReady"
        "kernelCheckLiveFixturesSource"
        "slakeTypecheckFixturesDoesNotUseLake"
        "slakeTypecheckFixturesFullHost"
        "slakeTypecheckFixturesOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-CHECKERS: named driver for
      # just slake-typecheck-checkers.
      # Ready is HostFrontLiveCheckers parse plus kernelCheck, not := true.
      # Needles avoid CheckersLater / Surface prefixes.
      rel = "src/systems/SystemsLean/SlakeTypecheckCheckers.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckCheckers"
        "SLAKE_TYPECHECK_CHECKERS_V0"
        "slakeTypecheckCheckersReady"
        "kernelCheckLiveCheckersSource"
        "slakeTypecheckCheckersDoesNotUseLake"
        "slakeTypecheckCheckersFullHost"
        "slakeTypecheckCheckersOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-SURFACE: named driver for
      # just slake-typecheck-surface.
      # Ready is HostFrontLiveSurface parse plus kernelCheck, not := true.
      # Needles avoid SurfaceLater / CheckersLater prefixes.
      rel = "src/systems/SystemsLean/SlakeTypecheckSurface.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_TYPECHECK_SURFACE_V0"
        "slakeTypecheckSurfaceReady"
        "kernelCheckLiveSurfaceSource"
        "slakeTypecheckSurfaceDoesNotUseLake"
        "slakeTypecheckSurfaceFullHost"
        "slakeTypecheckSurfaceOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-CHECKERS-LATER named driver; Ready is
      # HostFrontLiveCheckersLater parse plus kernelCheck, not := true;
      # Needles avoid Checkers / Surface prefixes.
      rel = "src/systems/SystemsLean/SlakeTypecheckCheckersLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_TYPECHECK_CHECKERS_LATER_V0"
        "slakeTypecheckCheckersLaterReady"
        "kernelCheckLiveCheckersLaterSource"
        "slakeTypecheckCheckersLaterDoesNotUseLake"
        "slakeTypecheckCheckersLaterFullHost"
        "slakeTypecheckCheckersLaterOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-EMITBODYTERM named driver; Ready is
      # HostFrontLiveEmitBodyTerm parse plus kernelCheck, not := true.
      # Unique needles: not a prefix of later HostFrontLive / KernelMultTerm
      # names (no living SlakeTypecheckEmitBodyTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckEmitBodyTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_TYPECHECK_EMITBODYTERM_V0"
        "HOST-SLAKE-TYPECHECK-EMITBODYTERM"
        "slakeTypecheckEmitBodyTermReady"
        "kernelCheckLiveEmitBodyTermSource"
        "slakeTypecheckEmitBodyTermDoesNotUseLake"
        "slakeTypecheckEmitBodyTermFullHost"
        "slakeTypecheckEmitBodyTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-KERNELMULTTERM named driver; Ready is
      # HostFrontLiveKernelMultTerm parse plus kernelCheck, not := true.
      # Unique needles: not a prefix of later KernelLinearTerm names
      # (no living SlakeTypecheckKernelMultTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckKernelMultTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckKernelMultTerm"
        "SLAKE_TYPECHECK_KERNELMULTTERM_V0"
        "HOST-SLAKE-TYPECHECK-KERNELMULTTERM"
        "slakeTypecheckKernelMultTermReady"
        "kernelCheckLiveKernelMultTermSource"
        "slakeTypecheckKernelMultTermDoesNotUseLake"
        "slakeTypecheckKernelMultTermFullHost"
        "slakeTypecheckKernelMultTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-KERNELLINEARTERM named driver; Ready is
      # HostFrontLiveKernelLinearTerm parse plus kernelCheck, not := true.
      # Unique needles: not a prefix of later KernelLinearTerm names
      # (no living SlakeTypecheckKernelLinearTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckKernelLinearTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckKernelLinearTerm"
        "SLAKE_TYPECHECK_KERNELLINEARTERM_V0"
        "HOST-SLAKE-TYPECHECK-KERNELLINEARTERM"
        "slakeTypecheckKernelLinearTermReady"
        "kernelCheckLiveKernelLinearTermSource"
        "slakeTypecheckKernelLinearTermDoesNotUseLake"
        "slakeTypecheckKernelLinearTermFullHost"
        "slakeTypecheckKernelLinearTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-KERNELTYPESTERM named driver; Ready is
      # HostFrontLiveKernelTypesTerm parse plus kernelCheck, not := true.
      # Unique needles: not a prefix of later KernelProgramTerm names
      # (no living SlakeTypecheckKernelTypesTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckKernelTypesTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckKernelTypesTerm"
        "SLAKE_TYPECHECK_KERNELTYPESTERM_V0"
        "HOST-SLAKE-TYPECHECK-KERNELTYPESTERM"
        "slakeTypecheckKernelTypesTermReady"
        "kernelCheckLiveKernelTypesTermSource"
        "slakeTypecheckKernelTypesTermDoesNotUseLake"
        "slakeTypecheckKernelTypesTermFullHost"
        "slakeTypecheckKernelTypesTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-KERNELPROGRAMTERM named driver; Ready is
      # HostFrontLiveKernelProgramTerm parse plus kernelCheck, not := true.
      # Unique needles: KernelProgramTerm is not a prefix of KernelEmitTerm
      # (no living SlakeTypecheckKernelProgramTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckKernelProgramTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckKernelProgramTerm"
        "SLAKE_TYPECHECK_KERNELPROGRAMTERM_V0"
        "HOST-SLAKE-TYPECHECK-KERNELPROGRAMTERM"
        "slakeTypecheckKernelProgramTermReady"
        "kernelCheckLiveKernelProgramTermSource"
        "slakeTypecheckKernelProgramTermDoesNotUseLake"
        "slakeTypecheckKernelProgramTermFullHost"
        "slakeTypecheckKernelProgramTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-KERNELEMITTERM named driver; Ready is
      # HostFrontLiveKernelEmitTerm parse plus kernelCheck, not := true.
      # Unique needles; not a prefix of later names
      # (no living SlakeTypecheckKernelEmitTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckKernelEmitTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckKernelEmitTerm"
        "SLAKE_TYPECHECK_KERNELEMITTERM_V0"
        "HOST-SLAKE-TYPECHECK-KERNELEMITTERM"
        "slakeTypecheckKernelEmitTermReady"
        "kernelCheckLiveKernelEmitTermSource"
        "slakeTypecheckKernelEmitTermDoesNotUseLake"
        "slakeTypecheckKernelEmitTermFullHost"
        "slakeTypecheckKernelEmitTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-PARITYMULTTERM named driver; Ready is
      # HostFrontLiveParityMultTerm parse plus kernelCheck, not := true.
      # Unique needles; not a prefix of later names
      # (no living SlakeTypecheckParityMultTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckParityMultTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckParityMultTerm"
        "SLAKE_TYPECHECK_PARITYMULTTERM_V0"
        "HOST-SLAKE-TYPECHECK-PARITYMULTTERM"
        "slakeTypecheckParityMultTermReady"
        "kernelCheckLiveParityMultTermSource"
        "slakeTypecheckParityMultTermDoesNotUseLake"
        "slakeTypecheckParityMultTermFullHost"
        "slakeTypecheckParityMultTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-PARITYLINEARTERM named driver; Ready is
      # HostFrontLiveParityLinearTerm parse plus kernelCheck, not := true.
      # Unique needles; not a prefix of later names
      # (no living SlakeTypecheckParityLinearTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckParityLinearTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckParityLinearTerm"
        "SLAKE_TYPECHECK_PARITYLINEARTERM_V0"
        "HOST-SLAKE-TYPECHECK-PARITYLINEARTERM"
        "slakeTypecheckParityLinearTermReady"
        "kernelCheckLiveParityLinearTermSource"
        "slakeTypecheckParityLinearTermDoesNotUseLake"
        "slakeTypecheckParityLinearTermFullHost"
        "slakeTypecheckParityLinearTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-PARITYTYPESTERM named driver; Ready is
      # HostFrontLiveParityTypesTerm parse plus kernelCheck, not := true.
      # Unique needles; not a prefix of later names
      # (no living SlakeTypecheckParityTypesTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckParityTypesTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckParityTypesTerm"
        "SLAKE_TYPECHECK_PARITYTYPESTERM_V0"
        "HOST-SLAKE-TYPECHECK-PARITYTYPESTERM"
        "slakeTypecheckParityTypesTermReady"
        "kernelCheckLiveParityTypesTermSource"
        "slakeTypecheckParityTypesTermDoesNotUseLake"
        "slakeTypecheckParityTypesTermFullHost"
        "slakeTypecheckParityTypesTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-PARITYPROGRAMTERM named driver; Ready is
      # HostFrontLiveParityProgramTerm parse plus kernelCheck, not := true.
      # Unique needles; not a prefix of later names
      # (no living SlakeTypecheckParityProgramTermFoo).
      rel = "src/systems/SystemsLean/SlakeTypecheckParityProgramTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckParityProgramTerm"
        "SLAKE_TYPECHECK_PARITYPROGRAMTERM_V0"
        "HOST-SLAKE-TYPECHECK-PARITYPROGRAMTERM"
        "slakeTypecheckParityProgramTermReady"
        "kernelCheckLiveParityProgramTermSource"
        "slakeTypecheckParityProgramTermDoesNotUseLake"
        "slakeTypecheckParityProgramTermFullHost"
        "slakeTypecheckParityProgramTermOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for named Slake typecheck drivers. Missing-token red
      # until SystemsLean.lean imports these modules. No Main files.
      # No Kernel dests: these drivers wrap HostFrontLive*, they do not
      # add HostModuleCheck*Kernel companions.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeTypecheckMult"
        "import SystemsLean.SlakeTypecheckTypes"
        "import SystemsLean.SlakeTypecheckErasure"
        "import SystemsLean.SlakeTypecheckExtract"
        "import SystemsLean.SlakeTypecheckIrProgram"
        "import SystemsLean.SlakeTypecheckGraph"
        "import SystemsLean.SlakeTypecheckPackageWrite"
        "import SystemsLean.SlakeTypecheckPackageRoots"
        "import SystemsLean.SlakeTypecheckHostTerm"
        "import SystemsLean.SlakeTypecheckGoldens"
        "import SystemsLean.SlakeTypecheckFront"
        "import SystemsLean.SlakeTypecheckFrontTheorems"
        "import SystemsLean.SlakeTypecheckGraphTheorems"
        "import SystemsLean.SlakeTypecheckPackageWriteTheorems"
        "import SystemsLean.SlakeTypecheckImportSeeds"
        "import SystemsLean.SlakeTypecheckImportLoadOkLater"
        "import SystemsLean.SlakeTypecheckImportModel"
        "import SystemsLean.SlakeTypecheckImportMods"
        "import SystemsLean.SlakeTypecheckImportModsLater"
        "import SystemsLean.SlakeTypecheckImportWalkLater"
        "import SystemsLean.SlakeTypecheckImportWalk"
        "import SystemsLean.SlakeTypecheckRequiredDecls\n"
        "import SystemsLean.SlakeTypecheckFixtures\n"
        "import SystemsLean.SlakeTypecheckCheckers\n"
        "import SystemsLean.SlakeTypecheckSurface\n"
        "import SystemsLean.SlakeTypecheckCheckersLater\n"
        "import SystemsLean.SlakeTypecheckEmitBodyTerm\n"
        "import SystemsLean.SlakeTypecheckKernelMultTerm\n"
        "import SystemsLean.SlakeTypecheckKernelLinearTerm\n"
        "import SystemsLean.SlakeTypecheckKernelTypesTerm\n"
        "import SystemsLean.SlakeTypecheckKernelProgramTerm\n"
        "import SystemsLean.SlakeTypecheckKernelEmitTerm\n"
        "import SystemsLean.SlakeTypecheckParityMultTerm\n"
        "import SystemsLean.SlakeTypecheckParityLinearTerm\n"
        "import SystemsLean.SlakeTypecheckParityTypesTerm\n"
        "import SystemsLean.SlakeTypecheckParityProgramTerm\n"
      ];
    }
  ];
}
