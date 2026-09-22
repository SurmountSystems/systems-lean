# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until barrel import. Named SlakeTypecheckIrProgramTheorems driver.
# IrProgram is a prefix of IrProgramTheorems. Unique needles with trailing newline.
# Do not edit slice 37 (SlakeTypecheckIrProgram dests without trailing newline).
# Do not edit slice 46 (SlakeTypecheckErasureTheorems dests).
# No bash, no Python.
{
  hostSpecsCompilePath47 = [
    {
      # HOST-SLAKE-TYPECHECK-IR-PROGRAM-THEOREMS named driver; Ready is
      # HostFrontLiveIrProgramTheorems parse plus kernelCheck of live
      # IrProgramTheorems.lean, not := true.
      # Unique needles with trailing newline; IrProgram is a prefix of IrProgramTheorems.
      rel = "src/systems/SystemsLean/SlakeTypecheckIrProgramTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckIrProgramTheorems\n"
        "SLAKE_TYPECHECK_IR_PROGRAM_THEOREMS_V0"
        "HOST-SLAKE-TYPECHECK-IR-PROGRAM-THEOREMS"
        "slake-typecheck-irprogramtheorems"
        "slakeTypecheckIrProgramTheoremsReady"
        "kernelCheckLiveIrProgramTheoremsSource"
        "PARSE-LIVE-IR-PROGRAM-THEOREMS"
        "slakeTypecheckIrProgramTheoremsDoesNotUseLake"
        "slakeTypecheckIrProgramTheoremsFullHost"
        "slakeTypecheckIrProgramTheoremsOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for named Slake typecheck IrProgramTheorems driver.
      # Missing-token red until SystemsLean.lean imports this module.
      # Trailing newline: IrProgram is a prefix of IrProgramTheorems.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeTypecheckIrProgramTheorems\n"
      ];
    }
  ];
}
