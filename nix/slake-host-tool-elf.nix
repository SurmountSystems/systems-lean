# SPDX-License-Identifier: Unlicense
# Pure Nix slake-host-tool-elf presence: dest path, tokens, fail-closed policy.
# Live lean --run dest-missing is not a pure derivation of an ELF. Thin just
# wrapper evals this module then runs lean --run on the Lean checker.
# Dest is out/slake-host-tool-elf/slake-freestanding-self-host-complete.
# Dest ELF must not exist yet. Do not fake an ELF. Not mill leanc.
# Not remill mill 69. Not slake-hello clang wrap. Occupancy stays 49.
# Policy: fail-closed dest-missing. Dest not slake-hello. Dest not
# first-host-tool. Dest not leanc.
# This check does not read a dest ELF. Does not claim Lake-gone.
# FullHost stays false. slakeOwnsPackageTypecheck stays false.
#
#   import ./slake-host-tool-elf.nix { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary, destRel }
{ lib, root }:
let
  destRel = "out/slake-host-tool-elf/slake-freestanding-self-host-complete";
  printerRel = "src/systems/SystemsLean/SlakeHostToolElf.lean";
  linkRel = "src/systems/SystemsLean/SlakeHostToolElfLink.lean";
  measureRel = "src/systems/SystemsLean/SlakeHostToolElfMeasure.lean";
  measureFieldsRel = "src/systems/SystemsLean/SlakeHostToolElfMeasureFields.lean";
  measureGreenRel = "src/systems/SystemsLean/SlakeHostToolElfMeasureGreen.lean";
  measureX86Rel = "src/systems/SystemsLean/SlakeHostToolElfMeasureX86.lean";
  measureFieldsX86Rel = "src/systems/SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean";
  measureRelocRel = "src/systems/SystemsLean/SlakeHostToolElfMeasureReloc.lean";
  completeOkRel = "src/systems/SystemsLean/SlakeHostToolElfCompleteOk.lean";
  justRel = "just/slake-host-tool-elf.just";
  sourceMainRel = "src/systems/SystemsLean/SelfHostCompleteMain.lean";

  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel =
    rel:
    if exists rel then
      builtins.readFile (root + "/${rel}")
    else
      null;
  has = import ./string-contains.nix;

  destForbidden =
    has "first-host-tool" destRel || has "leanc" destRel || has "slake-hello" destRel;

  destViolations =
    (
      if destRel == "out/slake-host-tool-elf/slake-freestanding-self-host-complete" then
        [ ]
      else
        [ "destRel must be out/slake-host-tool-elf/slake-freestanding-self-host-complete" ]
    )
    ++ (
      if destForbidden then
        [ "destRel must not be mill, leanc, or slake-hello" ]
      else
        [ ]
    )
    ++ (
      if exists destRel then
        [ "dest ELF must not exist yet (do not fake an ELF): ${destRel}" ]
      else
        [ ]
    );

  missingFile = rel: if exists rel then [ ] else [ "missing file: ${rel}" ];

  tokenMiss =
    rel: content: tokens:
    if content == null then
      [ ]
    else
      lib.concatMap (
        t: if has t content then [ ] else [ "${rel}: missing token ${t}" ]
      ) tokens;

  printerContent = readRel printerRel;
  printerTokens = [
    "HOST-SLAKE-HOST-TOOL-ELF"
    "SLAKE_HOST_TOOL_ELF_V0"
    destRel
    "SystemsLean.SelfHostCompleteMain"
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
    "self-host-complete-measure.native-ir.txt"
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

  linkContent = readRel linkRel;
  linkTokens = [
    "HOST-HOST-TOOL-ELF-LINK"
    "HOST-HOST-TOOL-ELF-UND"
    "HOST-HOST-TOOL-ELF-EXEC"
    "ET_EXEC"
    "SystemsLean.SelfHostComplete.main"
    "self-host-complete-callee.o"
    "encodeElf64ExecLinked"
    "not mill leanc"
  ];

  measureContent = readRel measureRel;
  measureTokens = [
    "HOST-HOST-TOOL-MEASURE-IR"
    "HOST-HOST-TOOL-MEASURE-FIELDS"
    "printSelfHostCompleteMeasure"
    "self-host-complete-measure.native-ir.txt"
    "HOST-SLAKE-HOST-TOOL-ELF"
    "writeMeasureNativeIr"
    "HOST-HOST-TOOL-MEASURE-GREEN"
    "not mill leanc"
  ];

  measureFieldsContent = readRel measureFieldsRel;
  measureFieldsTokens = [
    "HOST-HOST-TOOL-MEASURE-FIELDS"
    "printSelfHostCompleteMeasure"
    "remainingLines"
    "HOST-SLAKE-HOST-TOOL-ELF"
    "not mill leanc"
  ];

  measureGreenContent = readRel measureGreenRel;
  measureGreenTokens = [
    "HOST-HOST-TOOL-MEASURE-GREEN"
    "printSelfHostCompleteMeasure"
    "greenLine"
    "failClosedEprint"
    "throwMsg"
    "catchEprint"
    "leftoverAfterGreen"
    "HOST-SLAKE-HOST-TOOL-ELF"
    "not mill leanc"
  ];

  measureX86Content = readRel measureX86Rel;
  measureX86Tokens = [
    "HOST-HOST-TOOL-MEASURE-X86"
    "printSelfHostCompleteMeasure"
    "self-host-complete-measure.x86-64.bin"
    "HOST-SLAKE-HOST-TOOL-ELF"
    "writeMeasureX86"
    "NativeInsn.x86_64Code"
    "NativeInsn.encodeX86_64"
    "not mill leanc"
  ];

  measureFieldsX86Content = readRel measureFieldsX86Rel;
  measureFieldsX86Tokens = [
    "HOST-HOST-TOOL-MEASURE-FIELDS-X86"
    "printSelfHostCompleteMeasure"
    "self-host-complete-measure-fields.x86-64.bin"
    "HOST-SLAKE-HOST-TOOL-ELF"
    "writeMeasureFieldsX86"
    "leftoverAfterFieldsX86"
    "remainingLines"
    "NativeInsn.x86_64Code"
    "NativeInsn.encodeX86_64"
    "not mill leanc"
  ];

  measureRelocContent = readRel measureRelocRel;
  measureRelocTokens = [
    "HOST-HOST-TOOL-MEASURE-REL"
    "printSelfHostCompleteMeasure"
    "self-host-complete-measure.o"
    "HOST-SLAKE-HOST-TOOL-ELF"
    "writeMeasureReloc"
    "leftoverAfterReloc"
    "HOST-HOST-TOOL-EXIT"
    "HOST-HOST-TOOL-ABORT"
    "takenAbort"
    "HOST-HOST-TOOL-EPRINT"
    "HOST-HOST-TOOL-CATCH"
    "HOST-HOST-TOOL-COMPLETE-OK"
    "completeOkGate"
    "freestandingProductSelfHostCompleteOk"
    "takenCatch"
    "writeInsnEprintNoRet"
    "encodeOneEprintLine"
    "oneFunctionEprint"
    "exitSyscall"
    "ET_REL"
    "not mill leanc"
  ];

  completeOkContent = readRel completeOkRel;
  completeOkTokens = [
    "HOST-HOST-TOOL-COMPLETE-OK"
    "freestandingProductSelfHostCompleteOk"
    "completeOk"
    "completeOkGate"
    "movEaxCompleteOk"
    "HOST-SLAKE-HOST-TOOL-ELF"
    "not mill leanc"
  ];

  justContent = readRel justRel;
  justTokens = [
    "fail closed"
    "lean -R"
    destRel
    "not mill leanc"
    "nix/slake-host-tool-elf.nix"
    "SLAKE_HOST_TOOL_ELF_V0"
    "do not clang"
    "HOST-HOST-TOOL-ELF-LINK"
    "SlakeHostToolElfLink.lean"
    "SlakeHostToolElfMeasure.lean"
    "SlakeHostToolElfMeasureFields.lean"
    "SlakeHostToolElfMeasureGreen.lean"
    "SlakeHostToolElfMeasureX86.lean"
    "SlakeHostToolElfMeasureFieldsX86.lean"
    "SlakeHostToolElfMeasureReloc.lean"
    "SlakeHostToolElfCompleteOk.lean"
  ];

  violations =
    destViolations
    ++ missingFile printerRel
    ++ missingFile linkRel
    ++ missingFile measureRel
    ++ missingFile measureFieldsRel
    ++ missingFile measureGreenRel
    ++ missingFile measureX86Rel
    ++ missingFile measureFieldsX86Rel
    ++ missingFile measureRelocRel
    ++ missingFile completeOkRel
    ++ missingFile justRel
    ++ missingFile sourceMainRel
    ++ tokenMiss printerRel printerContent printerTokens
    ++ tokenMiss linkRel linkContent linkTokens
    ++ tokenMiss measureRel measureContent measureTokens
    ++ tokenMiss measureFieldsRel measureFieldsContent measureFieldsTokens
    ++ tokenMiss measureGreenRel measureGreenContent measureGreenTokens
    ++ tokenMiss measureX86Rel measureX86Content measureX86Tokens
    ++ tokenMiss measureFieldsX86Rel measureFieldsX86Content measureFieldsX86Tokens
    ++ tokenMiss measureRelocRel measureRelocContent measureRelocTokens
    ++ tokenMiss completeOkRel completeOkContent completeOkTokens
    ++ tokenMiss justRel justContent justTokens;

  ok = violations == [ ];
  summary =
    if ok then
      "slake-host-tool-elf OK (dest=${destRel}; not mill leanc; not slake-hello; lean --run dest ET_EXEC is just glue, not a pure derivation; occupancy 49)"
    else
      "slake-host-tool-elf FAILED:\n" + lib.concatStringsSep "\n" violations;
in
{
  inherit
    ok
    violations
    summary
    destRel
    printerRel
    linkRel
    measureRel
    measureFieldsRel
    measureGreenRel
    measureX86Rel
    measureFieldsX86Rel
    measureRelocRel
    completeOkRel
    justRel
    sourceMainRel
    ;
}
