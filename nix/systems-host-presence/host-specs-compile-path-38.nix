# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing MainCatch plus MainCatchX86 (lean --run helpers; not mill leanc).
# CompleteOk dests stay in slice 36. No bash, no Python.
{
  hostSpecsCompilePath38 = [
    {
      # HOST-HOST-TOOL-MAIN-CATCH: Lean catch leftover as IR tokens.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMainCatch.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMainCatch"
        "HOST-HOST-TOOL-MAIN-CATCH"
        "SLAKE_HOST_TOOL_ELF_V0"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "catchStage"
        "catchEprint"
        "catchIrText"
        "leftoverLeanCatch"
        "destRel"
        "CatchInsn"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "Not mill leanc"
      ];
    }
    {
      # HOST-HOST-TOOL-MAIN-CATCH-X86: native x86 of Lean catch IR.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMainCatchX86.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMainCatchX86"
        "import SystemsLean.SlakeHostToolElfMainCatch"
        "HOST-HOST-TOOL-MAIN-CATCH"
        "HOST-HOST-TOOL-MAIN-CATCH-X86"
        "HOST-HOST-TOOL-EPRINT"
        "CatchInsn.x86_64Code"
        "CatchInsn.encodeX86_64"
        "writeCatchX86"
        "self-host-complete-main-catch.x86-64.bin"
        "X64I"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "not mill leanc"
      ];
    }
    {
      # Barrel dest for MainCatch plus MainCatchX86. Missing-token red
      # until SystemsLean.lean imports these modules. No Main file.
      # CompleteOk barrel stays in slice 36.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeHostToolElfMainCatch"
        "import SystemsLean.SlakeHostToolElfMainCatchX86"
      ];
    }
  ];
}
