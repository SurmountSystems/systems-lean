# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing MainCatchDest (lean --run helper; not mill leanc).
# CompleteOk dests stay in slice 36. MainCatch / MainCatchX86 stay in slice 38.
# Thin CompleteOk barrel stays in slice 39. No bash, no Python.
{
  hostSpecsCompilePath40 = [
    {
      # HOST-HOST-TOOL-MAIN-CATCH-DEST: dest-safe MainCatch x86 on extra-argv.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMainCatchDest.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMainCatchDest"
        "HOST-HOST-TOOL-MAIN-CATCH-DEST"
        "HOST-HOST-TOOL-MAIN-CATCH"
        "HOST-HOST-TOOL-EPRINT"
        "HOST-HOST-TOOL-CATCH"
        "extraArgvCatch"
        "destCatchEprint"
        "destCatchReturn1"
        "CatchInsn.x86_64Code"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "SLAKE_HOST_TOOL_ELF_V0"
        "destRel"
        "leftoverAfterDestCatch"
        "extraArgvCatchOk"
        "destCatchEprintOk"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "Not mill leanc"
      ];
    }
    {
      # Barrel dest for MainCatchDest. Missing-token red until
      # SystemsLean.lean imports this module. No Main file.
      # CompleteOk barrel stays in slice 36. MainCatch / MainCatchX86
      # barrel stays in slice 38. Thin CompleteOk barrel stays in slice 39.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeHostToolElfMainCatchDest"
      ];
    }
  ];
}
