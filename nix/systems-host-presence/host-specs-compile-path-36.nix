# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing Slake host-tool ELF (lean --run writer; not mill leanc, not lake exe).
# No bash, no Python.
{
  hostSpecsCompilePath36 = [
    {
      # HOST-SLAKE-HOST-TOOL-ELF: Lean dest-missing checker. Dest is not
      # slake-hello. Not mill 70. Not remill mill 69. Do not fake an ELF.
      rel = "src/systems/SystemsLean/SlakeHostToolElf.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElf"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "SLAKE_HOST_TOOL_ELF_V0"
        "slake-host-tool-elf"
        "slake-freestanding-self-host-complete"
        "SystemsLean.SelfHostCompleteMain"
        "first-host-tool"
        "slakeHostToolElfWrite"
        "slakeHostToolElfCheck"
        "slakeHostToolElfMain"
        "FullHost stays false"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "occupancy 49"
        "not mill leanc"
        "do not write a fake ELF"
        "HOST-HOST-TOOL-NATIVE-IR"
        "NativeInsn.encode"
        "NativeFun.encode"
        "self-host-complete-main.native-insn.bin"
        "HOST-HOST-TOOL-X86-64"
        "NativeInsn.x86_64Code"
        "NativeInsn.encodeX86_64"
        "self-host-complete-main.x86-64.bin"
        "HOST-HOST-TOOL-ELF-REL"
        "self-host-complete-main.o"
        "ET_REL"
        "HOST-HOST-TOOL-ELF-LINK"
        "HOST-HOST-TOOL-ELF-UND"
        "HOST-HOST-TOOL-ELF-EXEC"
        "ET_EXEC"
        "import SystemsLean.SlakeHostToolElfLink"
        "import SystemsLean.SlakeHostToolElfMeasure"
        "HOST-HOST-TOOL-MEASURE-IR"
        "printSelfHostCompleteMeasure"
        "import SystemsLean.SlakeHostToolElfMeasureGreen"
        "HOST-HOST-TOOL-MEASURE-GREEN"
        "import SystemsLean.SlakeHostToolElfMeasureX86"
        "HOST-HOST-TOOL-MEASURE-X86"
        "writeMeasureX86"
        "self-host-complete-measure.x86-64.bin"
        "import SystemsLean.SlakeHostToolElfMeasureFieldsX86"
        "HOST-HOST-TOOL-MEASURE-FIELDS-X86"
        "writeMeasureFieldsX86"
        "self-host-complete-measure-fields.x86-64.bin"
        "import SystemsLean.SlakeHostToolElfMeasureReloc"
        "HOST-HOST-TOOL-MEASURE-REL"
        "writeMeasureReloc"
        "self-host-complete-measure.o"
        "HOST-HOST-TOOL-COMPLETE-OK"
      ];
    }
    {
      # HOST-HOST-TOOL-ELF-LINK: Lean-owned ET_EXEC link helper.
      rel = "src/systems/SystemsLean/SlakeHostToolElfLink.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfLink"
        "HOST-HOST-TOOL-ELF-LINK"
        "HOST-HOST-TOOL-ELF-UND"
        "HOST-HOST-TOOL-ELF-EXEC"
        "ET_EXEC"
        "encodeElf64ExecLinked"
        "SystemsLean.SelfHostComplete.main"
        "self-host-complete-callee.o"
        "not mill leanc"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
      ];
    }
    {
      # HOST-HOST-TOOL-MEASURE-IR: typed native IR of printSelfHostCompleteMeasure.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMeasure.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMeasure"
        "HOST-HOST-TOOL-MEASURE-IR"
        "printSelfHostCompleteMeasure"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "self-host-complete-measure.native-ir.txt"
        "writeMeasureNativeIr"
        "HOST-HOST-TOOL-MEASURE-FIELDS"
        "HOST-HOST-TOOL-MEASURE-GREEN"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "not mill leanc"
      ];
    }
    {
      # HOST-HOST-TOOL-MEASURE-FIELDS: remaining println fields as printLine.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMeasureFields.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMeasureFields"
        "HOST-HOST-TOOL-MEASURE-FIELDS"
        "printSelfHostCompleteMeasure"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "remainingLines"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "not mill leanc"
      ];
    }
    {
      # HOST-HOST-TOOL-MEASURE-GREEN: GREEN/fail-closed plus main catch strings.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMeasureGreen.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMeasureGreen"
        "HOST-HOST-TOOL-MEASURE-GREEN"
        "printSelfHostCompleteMeasure"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "greenLine"
        "failClosedEprint"
        "throwMsg"
        "catchEprint"
        "leftoverAfterGreen"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "not mill leanc"
      ];
    }
    {
      # HOST-HOST-TOOL-MEASURE-X86: native x86 of first-banner printLine only.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMeasureX86.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMeasureX86"
        "HOST-HOST-TOOL-MEASURE-X86"
        "printSelfHostCompleteMeasure"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "self-host-complete-measure.x86-64.bin"
        "writeMeasureX86"
        "NativeInsn.x86_64Code"
        "NativeInsn.encodeX86_64"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "not mill leanc"
      ];
    }
    {
      # HOST-HOST-TOOL-MEASURE-FIELDS-X86: native x86 of remaining printLine.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMeasureFieldsX86"
        "HOST-HOST-TOOL-MEASURE-FIELDS-X86"
        "printSelfHostCompleteMeasure"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "self-host-complete-measure-fields.x86-64.bin"
        "writeMeasureFieldsX86"
        "leftoverAfterFieldsX86"
        "remainingLines"
        "NativeInsn.x86_64Code"
        "NativeInsn.encodeX86_64"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "not mill leanc"
      ];
    }
    {
      # HOST-HOST-TOOL-MEASURE-REL: ELF64 ET_REL of banner plus remaining x86.
      rel = "src/systems/SystemsLean/SlakeHostToolElfMeasureReloc.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfMeasureReloc"
        "HOST-HOST-TOOL-MEASURE-REL"
        "printSelfHostCompleteMeasure"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "self-host-complete-measure.o"
        "writeMeasureReloc"
        "ET_REL"
        "leftoverAfterReloc"
        "HOST-HOST-TOOL-EPRINT"
        "HOST-HOST-TOOL-CATCH"
        "HOST-HOST-TOOL-COMPLETE-OK"
        "completeOkGate"
        "freestandingProductSelfHostCompleteOk"
        "import SystemsLean.SlakeHostToolElfCompleteOk"
        "writeInsnEprintNoRet"
        "encodeOneEprintLine"
        "oneFunctionEprint"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "not mill leanc"
      ];
    }
    {
      # HOST-HOST-TOOL-COMPLETE-OK: Lean-owned completeOk encoding for dest .text.
      # Dest encoder imports thin CompleteOk. Not fat SelfHostComplete.
      # Barrel dests stay in this slice 36 barrel row. No barrel edit here.
      rel = "src/systems/SystemsLean/SlakeHostToolElfCompleteOk.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeHostToolElfCompleteOk"
        "import SystemsLean.CompleteOk"
        "HOST-HOST-TOOL-COMPLETE-OK"
        "freestandingProductSelfHostCompleteOk"
        "completeOk"
        "completeOkGate"
        "movEaxCompleteOk"
        "HOST-SLAKE-HOST-TOOL-ELF"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "not mill leanc"
      ];
    }
    {
      # Barrel dest for HOST-SLAKE-HOST-TOOL-ELF. Missing-token red
      # until SystemsLean.lean imports this module. No Main file.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeHostToolElf"
        "import SystemsLean.SlakeHostToolElfLink"
        "import SystemsLean.SlakeHostToolElfMeasureFields"
        "import SystemsLean.SlakeHostToolElfMeasureGreen"
        "import SystemsLean.SlakeHostToolElfMeasure"
        "import SystemsLean.SlakeHostToolElfMeasureX86"
        "import SystemsLean.SlakeHostToolElfMeasureFieldsX86"
        "import SystemsLean.SlakeHostToolElfCompleteOk"
        "import SystemsLean.SlakeHostToolElfMeasureReloc"
      ];
    }
  ];
}
