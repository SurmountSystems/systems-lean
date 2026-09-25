/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SlakeHostToolElfMeasureReloc.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeHostToolElfMeasureRelocSource.
  Not occupancy name 50. Not mill 70.
  This wrap is SlakeHostToolElfMeasureReloc.lean.
  It is not SlakeHostToolElfMeasure.lean.
  It is not SlakeHostToolElfMeasureFieldsX86.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveSlakeHostToolElfMeasureRelocSource,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-RELOC, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureRelocSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc

/-- Dual-pinned live SlakeHostToolElfMeasureReloc.lean bytes (must match on-disk file).
    Greppable: liveSlakeHostToolElfMeasureRelocSource,
    HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-RELOC. -/
def liveSlakeHostToolElfMeasureRelocSource : String := r#"/-
  SYSTEMS_LEAN_HOST -- ELF64 ET_REL of first-banner x86 plus remaining-field x86,
  and dest one-function ET_EXEC (writes, Ok-gated catch return-1, taken
  sys_exit(0) when completeOk). Named sidecar:
  out/slake-host-tool-elf/self-host-complete-measure.o
  Named dest: out/slake-host-tool-elf/slake-freestanding-self-host-complete
  Measure .o .text is sequential printLine write-then-ret (reloc count 0).
  Dest .text is one function: jmp over each payload, write, no mid-block ret,
  then Ok-gate (mov eax completeOk; test; jnz over fail-closed), then
  extra-argv MainCatch dest eprint plus sys_exit(1), then taken sys_exit(0).
  completeOk true skips fail-closed. Extra argv takes dest-safe MainCatch
  (HOST-HOST-TOOL-MAIN-CATCH-DEST) then EXIT 1. Default argv Ok-true EXIT 0.
  Dest .text evaluates Lean-owned completeOk, not argc as Ok. Catch lives
  in CatchReturn.withCatch; SelfHostComplete.main uses it. Dest extra-argv
  encodes those catch strings; extra-argv is still not Lean throw. Sidecar
  stays X64I. Dest does not ret
  from process entry.
  Do not always-print eprint on Ok-true.
  takenAbort / cmpArgcOne stay contrast encodings (not the living terminator).
  Do not import SystemsLean.SelfHostComplete (too fat for lean --run).
  Not mill leanc. Not remill mill 69. Not slake-hello clang wrap. Not mill copy.
  FullHost stays false. slakeOwnsPackageTypecheck stays false.
  occupancy 49. Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-MEASURE-REL, HOST-HOST-TOOL-ONE-FUNCTION, HOST-HOST-TOOL-EXIT,
  HOST-HOST-TOOL-ABORT, HOST-HOST-TOOL-EPRINT, HOST-HOST-TOOL-CATCH,
  HOST-HOST-TOOL-MAIN-CATCH-DEST, extraArgvCatch, destCatchEprint,
  HOST-HOST-TOOL-COMPLETE-OK, completeOkGate, freestandingProductSelfHostCompleteOk,
  writeInsnEprintNoRet, encodeOneEprintLine, oneFunctionEprint, oneFunctionText,
  writeOneFunction, abortSyscall, unusedAbort, takenAbort, takenCatch,
  takenFailClosed, failClosedReturn1, exitSyscall, ET_EXEC, ET_REL, not mill leanc,
  printSelfHostCompleteMeasure, writeMeasureReloc, self-host-complete-measure.o,
  SystemsLean.SelfHostComplete.main.
  Module: SystemsLean.SlakeHostToolElfMeasureReloc
-/

import SystemsLean.SlakeHostToolElfCompleteOk
import SystemsLean.SlakeHostToolElfLink
import SystemsLean.SlakeHostToolElfMeasure
import SystemsLean.SlakeHostToolElfMeasureFields
import SystemsLean.SlakeHostToolElfMeasureFieldsX86
import SystemsLean.SlakeHostToolElfMeasureGreen
import SystemsLean.SlakeHostToolElfMeasureX86
import SystemsLean.SlakeHostToolElfMainCatchDest

namespace SystemsLean.SlakeHostToolElfMeasureReloc

open SystemsLean.SlakeHostToolElfLink (
  encodeElf64Ehdr encodeElf64Phdr encodeElf64Shdr encodeElf64Sym encodeU32le
  cstr nZeros padAlign elfEtExec elfEtRel elfRelocUndName bytesAreElfMagic
  elfExecObjOk destIsEtRel destLooksLikeMillCopy encodeElf64ExecLinked
  loadVaddr execTextOff execEntry)
open SystemsLean.SlakeHostToolElfMeasure (firstBanner)
open SystemsLean.SlakeHostToolElfMeasureFields (remainingLines remainingCount)
open SystemsLean.SlakeHostToolElfMeasureFieldsX86 (
  firstBannerX86Code remainingX86Code remainingX86CodeOk destRel
  measureFieldsX86Rel)
open SystemsLean.SlakeHostToolElfMeasureGreen (greenLine failClosedEprint catchEprint)
open SystemsLean.SlakeHostToolElfMeasureX86 (x86_64Tag measureX86Rel insnPrefix)
open SystemsLean.SlakeHostToolElfCompleteOk (
  completeOk completeOkGate encodeJnzOver movEaxCompleteOk testEaxEax)
open SystemsLean.SlakeHostToolElfMainCatchDest (
  destCatchEprint destCatchReturn1 extraArgvCatch extraArgvCatchOk destCatchEprintOk
  leftoverAfterDestCatch)

/-- Greppable stage id (same writer family). -/
def stageId : String := "SLAKE_HOST_TOOL_ELF_V0"

/-- Named measure ET_REL. Not dest. Not X64I sidecar. Not mill dest. -/
def measureRelocRel : String :=
  "out/slake-host-tool-elf/self-host-complete-measure.o"

/-- Precise leftover after dest one-function ET_EXEC of writes plus Ok-gated catch. -/
def leftoverAfterReloc : String :=
  "leftover: dest is one-function ET_EXEC of first-banner plus remaining " ++
    "println writes plus GREEN line plus Ok-gated fail-closed plus extra-argv " ++
    "MainCatch dest eprint then sys_exit(1); dest .text evaluates Lean-owned " ++
    "completeOk recomputed from living freestandingProductSelfHostCompleteOk " ++
    "(not argc as Ok); extra argv takes dest-safe MainCatch (sidecar stays " ++
    "X64I); dest cannot import fat SelfHostComplete; dest is not full " ++
    "SelfHostComplete.main (not mill, not mill leanc, not slake-hello, not " ++
    "Lake-gone); " ++
    leftoverAfterDestCatch

theorem measureRelocRel_ne_destRel : (measureRelocRel == destRel) = false :=
  rfl

theorem measureRelocRel_ne_measureX86Rel :
    (measureRelocRel == measureX86Rel) = false :=
  rfl

theorem measureRelocRel_ne_measureFieldsX86Rel :
    (measureRelocRel == measureFieldsX86Rel) = false :=
  rfl

/-- First-banner x86 then remaining-field x86. Each printLine still ends in ret. -/
def measureText : ByteArray :=
  firstBannerX86Code.append remainingX86Code

/-- True when `b` is first-banner prefix plus remaining sequential writes. -/
def measureTextOk (b : ByteArray) : Bool :=
  let fb := firstBannerX86Code
  let rem := remainingX86Code
  (b.size == fb.size + rem.size) &&
    (b.size != 0) &&
    (fb.size != 0) &&
    (b.extract 0 fb.size == fb) &&
    remainingX86CodeOk (b.extract fb.size b.size)

/-- Greppable dest encoder id. HOST-HOST-TOOL-ONE-FUNCTION. Not mill leanc. -/
def oneFunctionStage : String := "HOST-HOST-TOOL-ONE-FUNCTION"

/-- Greppable dest exit id. HOST-HOST-TOOL-EXIT. Not process-entry ret. -/
def exitStage : String := "HOST-HOST-TOOL-EXIT"

/-- Greppable dest taken-abort id. HOST-HOST-TOOL-ABORT. Not unusedAbort. -/
def abortStage : String := "HOST-HOST-TOOL-ABORT"

/-- Greppable dest stderr eprint id. HOST-HOST-TOOL-EPRINT. Not stdout printLine. -/
def eprintStage : String := "HOST-HOST-TOOL-EPRINT"

/-- Greppable dest Ok-gated catch id. HOST-HOST-TOOL-CATCH. Not sequential always-eprint. -/
def catchStage : String := "HOST-HOST-TOOL-CATCH"

/-- xor eax,eax; ret. Old dest terminator. Dest .text must not end with this. -/
def xorRet : ByteArray := ByteArray.mk #[0x31, 0xc0, 0xc3]

/--
  x86_64 Linux sys_exit(0): xor edi,edi; mov eax,60; syscall.
  Not process-entry ret. Dest one-function terminator.
-/
def exitSyscall : ByteArray :=
  ByteArray.mk #[0x31, 0xff, 0xb8, 0x3c, 0x00, 0x00, 0x00, 0x0f, 0x05]

theorem exitSyscall_ne_xorRet : (exitSyscall == xorRet) = false :=
  rfl

/-- x86_64 Linux sys_exit(1): mov edi,1; mov eax,60; syscall. Unused on Ok-true. -/
def abortSyscall : ByteArray :=
  ByteArray.mk #[0xbf, 0x01, 0x00, 0x00, 0x00, 0xb8, 0x3c, 0x00, 0x00, 0x00, 0x0f, 0x05]

theorem abortSyscall_ne_exitSyscall : (abortSyscall == exitSyscall) = false :=
  rfl

theorem abortSyscall_ne_xorRet : (abortSyscall == xorRet) = false :=
  rfl

/-- jmp over n-byte payload: eb rel8 if n <= 127, else e9 rel32. Reloc count 0.
    Displacement equals payload size (RIP after the jmp). Not n-1. -/
def encodeJmpOver (n : Nat) : ByteArray :=
  if n <= 127 then
    ByteArray.mk #[0xeb, UInt8.ofNat n]
  else
    (ByteArray.mk #[0xe9]).append (encodeU32le n)

/-- Jmp over unused abortSyscall. Contrast encoding only. Dest terminator is takenCatch. -/
def unusedAbort : ByteArray :=
  (encodeJmpOver abortSyscall.size).append abortSyscall

/-- cmp qword [rsp], 1. Linux process-entry argc. HOST-HOST-TOOL-ABORT / CATCH. -/
def cmpArgcOne : ByteArray := ByteArray.mk #[0x48, 0x83, 0x3c, 0x24, 0x01]

/--
  je over n-byte payload. rel8 (74) if n <= 127, else near je (0f 84 rel32).
  Displacement equals payload size. Not jmp. takenAbort still uses rel8.
-/
def encodeJeOver (n : Nat) : ByteArray :=
  if n <= 127 then
    ByteArray.mk #[0x74, UInt8.ofNat n]
  else
    (ByteArray.mk #[0x0f, 0x84]).append (encodeU32le n)

/--
  Contrast abort: cmp argc, je over abortSyscall only. Not the living terminator.
  Living dest uses takenCatch (eprint plus sys_exit(1) behind the same cmp).
-/
def takenAbort : ByteArray :=
  cmpArgcOne.append (encodeJeOver abortSyscall.size) |>.append abortSyscall

theorem takenAbort_ne_unusedAbort : (takenAbort == unusedAbort) = false :=
  rfl

theorem takenAbort_ne_xorRet : (takenAbort == xorRet) = false :=
  rfl

/-- Two's-complement i32le of `-mag` (LEA disp is -(n+17)). -/
def encodeNegI32le (mag : Nat) : ByteArray :=
  encodeU32le (UInt32.toNat ((0 : UInt32) - UInt32.ofNat mag))

/--
  sys_write stdout of n bytes. No ret. Layout after payload:
  mov eax,1; mov edi,1; lea rsi,[rip+disp]; mov edx,n; syscall.
  RIP after 7-byte LEA is payload_end+17, so disp = -(n+17).
-/
def writeInsnNoRet (n : Nat) : ByteArray :=
  (ByteArray.mk #[
      0xb8, 0x01, 0x00, 0x00, 0x00,
      0xbf, 0x01, 0x00, 0x00, 0x00,
      0x48, 0x8d, 0x35
    ]).append (encodeNegI32le (n + 17))
    |>.append (ByteArray.mk #[0xba])
    |>.append (encodeU32le n)
    |>.append (ByteArray.mk #[0x0f, 0x05])

/-- One printLine: jmp over payload, payload, write, no ret. n is payload.size. -/
def encodeOnePrintLine (line : String) : ByteArray :=
  let payload := line.toUTF8.append (ByteArray.mk #[0x0a])
  let n := payload.size
  (encodeJmpOver n).append payload |>.append (writeInsnNoRet n)

/--
  sys_write stderr of n bytes. No ret. Same layout as writeInsnNoRet except
  mov edi,2 (fd 2). Do not use writeInsnNoRet here. HOST-HOST-TOOL-EPRINT.
-/
def writeInsnEprintNoRet (n : Nat) : ByteArray :=
  (ByteArray.mk #[
      0xb8, 0x01, 0x00, 0x00, 0x00,
      0xbf, 0x02, 0x00, 0x00, 0x00,
      0x48, 0x8d, 0x35
    ]).append (encodeNegI32le (n + 17))
    |>.append (ByteArray.mk #[0xba])
    |>.append (encodeU32le n)
    |>.append (ByteArray.mk #[0x0f, 0x05])

/-- One stderr line: jmp over payload, payload, write fd 2, no ret. -/
def encodeOneEprintLine (line : String) : ByteArray :=
  let payload := line.toUTF8.append (ByteArray.mk #[0x0a])
  let n := payload.size
  (encodeJmpOver n).append payload |>.append (writeInsnEprintNoRet n)

/-- firstBanner then remainingLines then GREEN, in order. Stdout only. -/
def oneFunctionLines : List String :=
  firstBanner :: remainingLines ++ [greenLine]

/-- Fail-closed then main-catch. Stderr. Not stdout printLine. -/
def oneFunctionEprintLines : List String :=
  [failClosedEprint, catchEprint]

/-- Dest stderr writes: fail-closed then catch. Not encodeOnePrintLine (fd 1). -/
def oneFunctionEprint : ByteArray :=
  oneFunctionEprintLines.foldl
    (fun acc line => acc.append (encodeOneEprintLine line))
    (ByteArray.mk #[])

/-- Fail-closed eprint plus sys_exit(1). Taken when completeOk is false. -/
def failClosedReturn1 : ByteArray :=
  (encodeOneEprintLine failClosedEprint).append abortSyscall

/--
  Old living suffix: always eprint then takenAbort then exit. Dest must not
  use this. sequential always-print is not Ok-gated catch return-1.
-/
def sequentialAlwaysEprint : ByteArray :=
  oneFunctionEprint.append takenAbort |>.append exitSyscall

/--
  Ok-gated fail-closed: mov eax completeOk, test, jnz over failClosedReturn1.
  completeOk true skips fail-closed. completeOk false eprint then sys_exit(1).
  HOST-HOST-TOOL-COMPLETE-OK. Extra-argv MainCatch is takenCatch, not this.
-/
def takenFailClosed : ByteArray :=
  completeOkGate failClosedReturn1.size |>.append failClosedReturn1

/-- Living extra-argv MainCatch dest catch plus sys_exit(1). HOST-HOST-TOOL-CATCH. -/
def takenCatch : ByteArray := extraArgvCatch

/-- unusedAbort is jmp-over, not the living cmp argc gate. -/
theorem unusedAbort_not_cmp_gate :
    (unusedAbort.extract 0 5 == cmpArgcOne) = false :=
  rfl

/-- Sequential fail-closed eprint starts with jmp, not cmp argc. -/
theorem sequentialEprint_not_cmp_gate :
    ((encodeOneEprintLine failClosedEprint).extract 0 5 == cmpArgcOne) = false :=
  rfl

/-- Dest .text: stdout printLines, Ok-gated fail-closed, extra-argv MainCatch, exit. -/
def oneFunctionText : ByteArray :=
  (oneFunctionLines.foldl
      (fun acc line => acc.append (encodeOnePrintLine line))
      (ByteArray.mk #[])).append takenFailClosed |>.append takenCatch
    |>.append exitSyscall

/-- Walk one printLine block: jmp, payload, 24-byte write, not old write-then-ret. -/
def stepOnePrintOk (acc : Option Nat) (line : String) (b : ByteArray) :
    Option Nat :=
  match acc with
  | none => none
  | some off =>
    let pay := line.toUTF8.append (ByteArray.mk #[0x0a])
    let n := pay.size
    let jmp := encodeJmpOver n
    let wr := writeInsnNoRet n
    let sz := jmp.size + n + wr.size
    if b.size >= off + sz &&
        (jmp.size == (if n <= 127 then 2 else 5)) &&
        (b.extract off (off + jmp.size) == jmp) &&
        (b.extract (off + jmp.size) (off + jmp.size + n) == pay) &&
        (n == pay.size) &&
        (b.extract (off + jmp.size + n) (off + sz) == wr) &&
        (wr.size == 24) &&
        (wr.extract 22 24 == ByteArray.mk #[0x0f, 0x05]) &&
        (insnPrefix n != wr) then
      some (off + sz)
    else
      none

/-- Walk one stderr eprint block: jmp, payload, 24-byte write fd 2, not stdout. -/
def stepOneEprintOk (acc : Option Nat) (line : String) (b : ByteArray) :
    Option Nat :=
  match acc with
  | none => none
  | some off =>
    let pay := line.toUTF8.append (ByteArray.mk #[0x0a])
    let n := pay.size
    let jmp := encodeJmpOver n
    let wr := writeInsnEprintNoRet n
    let sz := jmp.size + n + wr.size
    if b.size >= off + sz &&
        (jmp.size == (if n <= 127 then 2 else 5)) &&
        (b.extract off (off + jmp.size) == jmp) &&
        (b.extract (off + jmp.size) (off + jmp.size + n) == pay) &&
        (n == pay.size) &&
        (b.extract (off + jmp.size + n) (off + sz) == wr) &&
        (wr.size == 24) &&
        (wr.extract 5 10 == ByteArray.mk #[0xbf, 0x02, 0x00, 0x00, 0x00]) &&
        (wr.extract 22 24 == ByteArray.mk #[0x0f, 0x05]) &&
        (wr != writeInsnNoRet n) &&
        (insnPrefix n != wr) then
      some (off + sz)
    else
      none

/--
  True iff the walk consumes firstBanner plus all 40 remaining lines plus GREEN,
  then Ok-gate (mov eax completeOk, test, jnz over failClosedReturn1), then
  fail-closed eprint plus sys_exit(1), then extra-argv MainCatch dest eprint
  plus sys_exit(1), then taken exitSyscall. Fail closed on empty, sequential
  eprints then exit with no Ok-gate, argc cmp as Ok stand-in at off0, xor-ret
  terminator, unusedAbort as terminator, takenAbort as living terminator,
  old write-then-ret prefix as dest .text, or concatenated measureText.
  extra-argv catch may start with cmpArgcOne; Ok gate at off0 must not.
-/
def oneFunctionTextOk (b : ByteArray) : Bool :=
  if b.size == 0 then
    false
  else if b == measureText then
    false
  else
    match oneFunctionLines.foldl (fun acc line => stepOnePrintOk acc line b)
        (some 0) with
    | none => false
    | some off0 =>
      let gate := completeOkGate failClosedReturn1.size
      let jnz := encodeJnzOver failClosedReturn1.size
      let gateOff := off0 + gate.size
      if (oneFunctionEprint.size != 0) &&
          (b.size >= off0 + oneFunctionEprint.size) &&
          (b.extract off0 (off0 + oneFunctionEprint.size) ==
            oneFunctionEprint) then
        false
      else
        match stepOneEprintOk (some gateOff) failClosedEprint b with
        | none => false
        | some offFc =>
          let catchOff := offFc + abortSyscall.size
          (b.extract off0 (off0 + takenFailClosed.size) == takenFailClosed) &&
            (takenFailClosed == gate.append failClosedReturn1) &&
            (gate ==
              (movEaxCompleteOk.append testEaxEax |>.append jnz)) &&
            (completeOk = true) &&
            (movEaxCompleteOk ==
              ByteArray.mk #[0xb8, 0x01, 0x00, 0x00, 0x00]) &&
            (testEaxEax == ByteArray.mk #[0x85, 0xc0]) &&
            (failClosedReturn1 ==
              (encodeOneEprintLine failClosedEprint).append abortSyscall) &&
            (takenFailClosed.size == gate.size + failClosedReturn1.size) &&
            (failClosedReturn1.size <= 127) &&
            (jnz.size == 2) &&
            (jnz.extract 0 1 == ByteArray.mk #[0x75]) &&
            ((b.extract off0 (off0 + cmpArgcOne.size) == cmpArgcOne) =
              false) &&
            extraArgvCatchOk extraArgvCatch &&
            destCatchEprintOk destCatchEprint &&
            (takenCatch == extraArgvCatch) &&
            ((takenCatch == destCatchReturn1) = false) &&
            (encodeJeOver abortSyscall.size ==
              ByteArray.mk #[0x74, 0x0c]) &&
            (abortSyscall.size == 12) &&
            (takenAbort.size == 19) &&
            (unusedAbort ==
              (encodeJmpOver abortSyscall.size).append abortSyscall) &&
            (unusedAbort.size == 14) &&
            ((b.extract off0 (off0 + unusedAbort.size) == unusedAbort) =
              false) &&
            ((takenCatch == unusedAbort) = false) &&
            ((takenCatch == takenAbort) = false) &&
            ((b.extract off0 (off0 + takenAbort.size) == takenAbort) =
              false) &&
            ((b.extract off0 (off0 + sequentialAlwaysEprint.size) ==
                sequentialAlwaysEprint) = false) &&
            (b.extract (off0 + gate.size)
              (off0 + takenFailClosed.size) == failClosedReturn1) &&
            (b.extract offFc (offFc + abortSyscall.size) == abortSyscall) &&
            (b.extract catchOff (catchOff + extraArgvCatch.size) ==
              extraArgvCatch) &&
            (b.extract (catchOff + extraArgvCatch.size) b.size ==
              exitSyscall) &&
            (b.size ==
              catchOff + extraArgvCatch.size + exitSyscall.size) &&
            ((abortSyscall == exitSyscall) = false) &&
            (abortSyscall.extract 0 5 ==
              ByteArray.mk #[0xbf, 0x01, 0x00, 0x00, 0x00]) &&
            ((abortSyscall.extract 0 2 == ByteArray.mk #[0x31, 0xff]) =
              false) &&
            ((takenFailClosed.extract 0 2 == ByteArray.mk #[0xeb, 0x0c]) =
              false) &&
            ((b.extract (catchOff + extraArgvCatch.size) b.size == xorRet) =
              false) &&
            ((exitSyscall == xorRet) = false) &&
            (remainingLines.length == remainingCount) &&
            (greenLine.length != 0) &&
            (failClosedEprint.length != 0) &&
            (catchEprint.length != 0) &&
            (oneFunctionEprint.size != 0)

/-- X64I tagged sidecar (not ELF). -/
def looksLikeX64I (b : ByteArray) : Bool :=
  b.size >= 4 && b.extract 0 4 == x86_64Tag

/-- Closed-subset dest is 137-byte ET_EXEC xor-ret. Measure .o must not be that. -/
def looksLikeDestExec (b : ByteArray) : Bool :=
  elfExecObjOk b

/-- Mill 69 dest is about 4.2 MiB. Closed-subset measure ET_REL is a few KiB. -/
def millSizedCopy (b : ByteArray) : Bool :=
  b.size > 65536

/--
  HOST-HOST-TOOL-MEASURE-REL: ELF64 LE ET_REL defining
  SystemsLean.SelfHostComplete.main as first-banner plus remaining writes.
  Reloc count 0. Not dest. Not ET_EXEC. Not X64I.
-/
def encodeElf64MeasureReloc : ByteArray :=
  let text := measureText
  let nameB := cstr elfRelocUndName
  let strtab := (ByteArray.mk #[0]).append nameB
  let shstrtab :=
    (ByteArray.mk #[0])
      |>.append (cstr ".text")
      |>.append (cstr ".symtab")
      |>.append (cstr ".strtab")
      |>.append (cstr ".shstrtab")
  let textOff := 64
  let textPad := padAlign (textOff + text.size) 8
  let symOff := textOff + text.size + textPad
  let strOff := symOff + 48
  let shstrOff := strOff + strtab.size
  let shstrPad := padAlign (shstrOff + shstrtab.size) 8
  let shOff := shstrOff + shstrtab.size + shstrPad
  let ehdr := encodeElf64Ehdr elfEtRel 0 0 shOff 0 5 4
  let nullSh := encodeElf64Shdr 0 0 0 0 0 0 0 0 0
  let textSh := encodeElf64Shdr 1 1 6 textOff text.size 0 0 1 0
  let symSh := encodeElf64Shdr 7 2 0 symOff 48 3 1 8 24
  let strSh := encodeElf64Shdr 15 3 0 strOff strtab.size 0 0 1 0
  let shstrSh := encodeElf64Shdr 23 3 0 shstrOff shstrtab.size 0 0 1 0
  let sym0 := encodeElf64Sym 0 0 0 0 0
  let sym1 := encodeElf64Sym 1 0x12 1 0 text.size
  ehdr
    |>.append text
    |>.append (nZeros textPad)
    |>.append sym0
    |>.append sym1
    |>.append strtab
    |>.append shstrtab
    |>.append (nZeros shstrPad)
    |>.append nullSh
    |>.append textSh
    |>.append symSh
    |>.append strSh
    |>.append shstrSh

/-- True when bytes are ELF64 ET_REL whose .text is banner plus remaining writes. -/
def elfMeasureRelocOk (b : ByteArray) : Bool :=
  let text := measureText
  let textOff := 64
  bytesAreElfMagic b &&
    !looksLikeX64I b &&
    (b.size >= textOff + text.size) &&
    (b.extract 16 18 == ByteArray.mk #[1, 0]) &&
    measureTextOk (b.extract textOff (textOff + text.size)) &&
    !looksLikeDestExec b &&
    !millSizedCopy b &&
    (b.size != 0)

/--
  HOST-HOST-TOOL-ONE-FUNCTION / HOST-HOST-TOOL-ELF-EXEC: ELF64 LE ET_EXEC.
  .text at 128 is oneFunctionText (writes plus Ok-gated fail-closed plus
  extra-argv MainCatch plus taken exitSyscall). Not ET_REL. Not mill leanc. Not xor-ret wrapper.
  Not process-entry ret. Not sequential always-eprint. Not unusedAbort.
-/
def encodeElf64ExecOneFunction : ByteArray :=
  let text := oneFunctionText
  let filesz := execTextOff + text.size
  let ehdr := encodeElf64Ehdr elfEtExec execEntry 64 0 1 0 0
  let phdr := encodeElf64Phdr filesz loadVaddr
  let pad := nZeros (execTextOff - 64 - 56)
  ehdr.append phdr |>.append pad |>.append text

/-- True when bytes are ELF64 ET_EXEC whose .text is one-function writes. -/
def elfExecOneFunctionOk (b : ByteArray) : Bool :=
  let text := oneFunctionText
  bytesAreElfMagic b &&
    (text.size != 0) &&
    oneFunctionTextOk text &&
    (b.size == execTextOff + text.size) &&
    (b.extract 16 18 == ByteArray.mk #[2, 0]) &&
    (b.extract 18 20 == ByteArray.mk #[0x3e, 0]) &&
    (b.extract execTextOff (execTextOff + text.size) == text) &&
    oneFunctionTextOk (b.extract execTextOff (execTextOff + text.size)) &&
    !destIsEtRel b &&
    !millSizedCopy b &&
    (b.size != 0) &&
    (b != encodeElf64MeasureReloc) &&
    (b != encodeElf64ExecLinked)

/-- First four bytes equal ELF magic. -/
def isElfMagic (p : System.FilePath) : IO Bool := do
  let bytes <-
    try
      IO.FS.readBinFile p
    catch _ =>
      return false
  if bytes.size < 4 then
    return false
  pure (bytes.extract 0 4 == ByteArray.mk #[0x7f, 0x45, 0x4c, 0x46])

/-- Lean-owned emit plan. Not an ELF. Includes measure ET_REL sidecar. -/
def emitPlanText : String :=
  "SLAKE_HOST_TOOL_ELF_V0 / HOST-SLAKE-HOST-TOOL-ELF\n" ++
  "HOST-HOST-TOOL-NATIVE-IR\n" ++
  "HOST-HOST-TOOL-NATIVE-INSN NativeFun.encode NativeInsn.encode\n" ++
  "HOST-HOST-TOOL-X86-64 NativeInsn.x86_64Code NativeInsn.encodeX86_64\n" ++
  "HOST-HOST-TOOL-ELF-REL ET_REL self-host-complete-main.o R_X86_64_PC32\n" ++
  "HOST-HOST-TOOL-ELF-LINK HOST-HOST-TOOL-ELF-UND HOST-HOST-TOOL-ELF-EXEC ET_EXEC\n" ++
  "HOST-HOST-TOOL-MEASURE-IR printSelfHostCompleteMeasure " ++
  "out/slake-host-tool-elf/self-host-complete-measure.native-ir.txt\n" ++
  "HOST-HOST-TOOL-MEASURE-GREEN GREEN/fail-closed plus main catch\n" ++
  "HOST-HOST-TOOL-MEASURE-X86 writeMeasureX86 " ++
  "out/slake-host-tool-elf/self-host-complete-measure.x86-64.bin\n" ++
  "HOST-HOST-TOOL-MEASURE-FIELDS-X86 writeMeasureFieldsX86 " ++
  "out/slake-host-tool-elf/self-host-complete-measure-fields.x86-64.bin\n" ++
  "HOST-HOST-TOOL-MEASURE-REL writeMeasureReloc " ++
  "out/slake-host-tool-elf/self-host-complete-measure.o ET_REL\n" ++
  "HOST-HOST-TOOL-ONE-FUNCTION writeOneFunction dest .text jmp-over-payload " ++
  "HOST-HOST-TOOL-EPRINT writeInsnEprintNoRet encodeOneEprintLine oneFunctionEprint " ++
  "HOST-HOST-TOOL-ABORT takenAbort cmpArgcOne abortSyscall contrast not living terminator\n" ++
  "HOST-HOST-TOOL-COMPLETE-OK completeOk completeOkGate movEaxCompleteOk " ++
  "freestandingProductSelfHostCompleteOk not argc\n" ++
  "HOST-HOST-TOOL-CATCH takenCatch extraArgvCatch destCatchEprint " ++
  "HOST-HOST-TOOL-MAIN-CATCH-DEST extra argv eprint sys_exit(1)\n" ++
  "HOST-HOST-TOOL-EXIT takenFailClosed abortSyscall extraArgvCatch exitSyscall " ++
  "sys_exit ET_EXEC not mill leanc\n" ++
  "dest: out/slake-host-tool-elf/slake-freestanding-self-host-complete\n" ++
  "source Main: SystemsLean.SelfHostCompleteMain\n" ++
  "source path: src/systems/SystemsLean/SelfHostCompleteMain.lean\n" ++
  "native IR: out/slake-host-tool-elf/self-host-complete-main.native-ir.txt\n" ++
  "native insn: out/slake-host-tool-elf/self-host-complete-main.native-insn.bin\n" ++
  "x86_64: out/slake-host-tool-elf/self-host-complete-main.x86-64.bin\n" ++
  "elf reloc: out/slake-host-tool-elf/self-host-complete-main.o\n" ++
  "elf callee: out/slake-host-tool-elf/self-host-complete-callee.o\n" ++
  "measure reloc: out/slake-host-tool-elf/self-host-complete-measure.o\n" ++
  "link plan: out/slake-host-tool-elf/self-host-complete-main.link.txt\n" ++
  "x86_64 callNamedMain: e8 00 00 00 00 c3 (CALL rel32 then RET; reloc +1)\n" ++
  "dest ET_EXEC .text is one-function first-banner plus remaining writes plus GREEN " ++
  "plus Ok-gated fail-closed plus extra-argv MainCatch plus exitSyscall\n" ++
  "closed subset: printLine writes plus mov eax completeOk test jnz over " ++
  "fail-closed eprint plus sys_exit(1), then extra-argv dest-safe MainCatch " ++
  "eprint plus sys_exit(1), then taken exitSyscall; completeOk true skips " ++
  "fail-closed; extra argv takes MainCatch; dest .text evaluates Lean-owned " ++
  "completeOk encoding of freestandingProductSelfHostCompleteOk, not argc as Ok\n" ++
  "honesty: not mill leanc; not remill mill 69; not slake-hello clang wrap\n" ++
  "do not write a fake ELF; do not write dest as ET_REL; " ++
  "do not clang-link Compose SSA; do not call leanc\n" ++
  leftoverAfterReloc ++ "\n" ++
  "pins: FullHost false; slakeOwnsPackageTypecheck false; occupancy 49; " ++
  "mill 69 of 69; not Lake-gone\n"

/-- Fail closed unless dest is a real linked ET_EXEC. Does not clang. Does not leanc. -/
def checkDest (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  unless (<- dest.pathExists) do
    IO.eprintln s!"error: {stageId}: missing dest ELF {dest}"
    IO.eprintln "  source Main: SystemsLean.SelfHostCompleteMain"
    IO.eprintln s!"  {leftoverAfterReloc}"
    IO.eprintln "  honesty: not mill leanc; not remill mill 69; not slake-hello clang wrap"
    throw (IO.userError s!"{stageId}: missing dest")
  unless (<- isElfMagic dest) do
    IO.eprintln s!"error: {stageId}: dest is not ELF magic: {dest}"
    throw (IO.userError s!"{stageId}: not ELF")
  let destBytes <- IO.FS.readBinFile dest
  if destIsEtRel destBytes then
    IO.eprintln s!"error: {stageId}: dest must not be ET_REL: {dest}"
    throw (IO.userError s!"{stageId}: dest is ET_REL")
  if destLooksLikeMillCopy destBytes then
    IO.eprintln s!"error: {stageId}: dest looks like mill 69 copy: {dest}"
    throw (IO.userError s!"{stageId}: mill copy")
  unless elfExecOneFunctionOk destBytes do
    IO.eprintln
      s!"error: {stageId}: dest is not ELF64 ET_EXEC one-function .text: {dest}"
    throw (IO.userError s!"{stageId}: dest not ET_EXEC")
  IO.println s!"{stageId}: dest ELF present {dest}"
  IO.println "  HOST-HOST-TOOL-ELF-EXEC: dest is ET_EXEC (not ET_REL)"
  IO.println "  HOST-HOST-TOOL-ONE-FUNCTION: dest .text jmp over payload, writes"
  IO.println "  HOST-HOST-TOOL-EPRINT: dest .text fail-closed plus extra-argv MainCatch"
  IO.println "  HOST-HOST-TOOL-COMPLETE-OK: dest .text evaluates completeOk, not argc as Ok"
  IO.println "  HOST-HOST-TOOL-CATCH: dest .text extra-argv MainCatch dest eprint sys_exit(1)"
  IO.println "  HOST-HOST-TOOL-MAIN-CATCH-DEST: dest-safe MainCatch bytes in .text"
  IO.println "  HOST-HOST-TOOL-ABORT: takenAbort stays contrast (not living terminator)"
  IO.println "  HOST-HOST-TOOL-EXIT: dest .text sys_exit(0) on Ok-true default argv, not ret"
  IO.println "  honesty: dest is not full SelfHostComplete.main body"
  IO.println "  pins: FullHost false; occupancy 49; mill 69 of 69; not Lake-gone"

/-- Write measure ET_REL. Fail closed if dest, empty, X64I, mill copy, or not ET_REL. -/
def writeMeasureReloc (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  let p := root / measureRelocRel
  if measureRelocRel == destRel then
    IO.eprintln s!"error: {stageId}: measure ET_REL sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: measure ET_REL sidecar is dest")
  if measureRelocRel == measureX86Rel then
    IO.eprintln s!"error: {stageId}: measure ET_REL must not be first-banner X64I"
    throw (IO.userError s!"{stageId}: measure ET_REL is first-banner sidecar")
  if measureRelocRel == measureFieldsX86Rel then
    IO.eprintln s!"error: {stageId}: measure ET_REL must not be remaining X64I"
    throw (IO.userError s!"{stageId}: measure ET_REL is remaining sidecar")
  if p == dest then
    IO.eprintln s!"error: {stageId}: measure ET_REL sidecar must not be dest"
    throw (IO.userError s!"{stageId}: measure ET_REL is dest")
  unless measureTextOk measureText do
    IO.eprintln s!"error: {stageId}: measure .text is not banner plus remaining writes"
    throw (IO.userError s!"{stageId}: measure text")
  let blob := encodeElf64MeasureReloc
  if blob.size == 0 then
    IO.eprintln s!"error: {stageId}: encodeElf64MeasureReloc empty"
    throw (IO.userError s!"{stageId}: measure ET_REL empty")
  unless bytesAreElfMagic blob do
    IO.eprintln s!"error: {stageId}: measure ET_REL missing ELF magic"
    throw (IO.userError s!"{stageId}: measure ET_REL not ELF")
  if looksLikeX64I blob then
    IO.eprintln s!"error: {stageId}: measure ET_REL must not be X64I tag"
    throw (IO.userError s!"{stageId}: measure ET_REL is X64I")
  if looksLikeDestExec blob then
    IO.eprintln s!"error: {stageId}: measure ET_REL must not be dest ET_EXEC copy"
    throw (IO.userError s!"{stageId}: measure ET_REL is dest copy")
  if millSizedCopy blob then
    IO.eprintln s!"error: {stageId}: measure ET_REL looks like mill 69 copy"
    throw (IO.userError s!"{stageId}: mill copy")
  unless destIsEtRel blob do
    IO.eprintln s!"error: {stageId}: measure sidecar must stay ET_REL"
    throw (IO.userError s!"{stageId}: measure not ET_REL")
  unless elfMeasureRelocOk blob do
    IO.eprintln s!"error: {stageId}: measure ET_REL missing banner prefix or remaining writes"
    throw (IO.userError s!"{stageId}: measure object")
  if let some parent := p.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile p blob
  let got <- IO.FS.readBinFile p
  if got != blob then
    IO.eprintln s!"error: {stageId}: measure ET_REL write mismatch"
    throw (IO.userError s!"{stageId}: measure ET_REL mismatch")
  if got.size == 0 then
    IO.eprintln s!"error: {stageId}: measure ET_REL empty"
    throw (IO.userError s!"{stageId}: measure ET_REL empty")
  unless bytesAreElfMagic got do
    IO.eprintln s!"error: {stageId}: measure ET_REL must keep ELF magic: {p}"
    throw (IO.userError s!"{stageId}: measure ET_REL not ELF")
  if looksLikeX64I got then
    IO.eprintln s!"error: {stageId}: measure ET_REL sidecar must not be X64I: {p}"
    throw (IO.userError s!"{stageId}: measure ET_REL is X64I")
  if looksLikeDestExec got then
    IO.eprintln s!"error: {stageId}: measure ET_REL must not become dest copy: {p}"
    throw (IO.userError s!"{stageId}: measure ET_REL is dest copy")
  unless destIsEtRel got do
    IO.eprintln s!"error: {stageId}: measure ET_REL sidecar must stay ET_REL: {p}"
    throw (IO.userError s!"{stageId}: measure not ET_REL")
  unless elfMeasureRelocOk got do
    IO.eprintln s!"error: {stageId}: measure .text missing first-banner or remaining payload"
    throw (IO.userError s!"{stageId}: measure payload")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-MEASURE-REL {p}"

/-- Overwrite dest as one-function ET_EXEC. Do not delete dest first. Not mill leanc. -/
def writeOneFunction (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  unless oneFunctionTextOk oneFunctionText do
    IO.eprintln
      s!"error: {stageId}: oneFunctionText is not jmp-over-payload plus takenCatch plus exitSyscall"
    throw (IO.userError s!"{stageId}: oneFunctionText")
  if oneFunctionText == measureText then
    IO.eprintln s!"error: {stageId}: dest .text must not be concatenated write-then-ret"
    throw (IO.userError s!"{stageId}: dest is measureText")
  if oneFunctionText.size >= xorRet.size &&
      oneFunctionText.extract (oneFunctionText.size - xorRet.size)
        oneFunctionText.size == xorRet then
    IO.eprintln s!"error: {stageId}: dest .text must not end in xor-ret"
    throw (IO.userError s!"{stageId}: dest xor-ret")
  let blob := encodeElf64ExecOneFunction
  if blob.size == 0 then
    IO.eprintln s!"error: {stageId}: encodeElf64ExecOneFunction empty"
    throw (IO.userError s!"{stageId}: dest empty")
  unless bytesAreElfMagic blob do
    IO.eprintln s!"error: {stageId}: dest missing ELF magic"
    throw (IO.userError s!"{stageId}: dest not ELF")
  if destIsEtRel blob then
    IO.eprintln s!"error: {stageId}: dest must not be ET_REL"
    throw (IO.userError s!"{stageId}: dest is ET_REL")
  if millSizedCopy blob then
    IO.eprintln s!"error: {stageId}: dest looks like mill 69 copy"
    throw (IO.userError s!"{stageId}: mill copy")
  if destLooksLikeMillCopy blob then
    IO.eprintln s!"error: {stageId}: dest looks like mill 69 copy"
    throw (IO.userError s!"{stageId}: mill copy")
  if blob == encodeElf64MeasureReloc then
    IO.eprintln s!"error: {stageId}: dest must not be measure ET_REL copy"
    throw (IO.userError s!"{stageId}: dest is measure copy")
  if blob == encodeElf64ExecLinked then
    IO.eprintln s!"error: {stageId}: dest must not stay wrapper plus xor-ret"
    throw (IO.userError s!"{stageId}: dest is xor-ret wrapper")
  unless elfExecOneFunctionOk blob do
    IO.eprintln s!"error: {stageId}: dest is not ELF64 ET_EXEC one-function .text"
    throw (IO.userError s!"{stageId}: dest not one-function")
  if let some parent := dest.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile dest blob
  let got <- IO.FS.readBinFile dest
  if got != blob then
    IO.eprintln s!"error: {stageId}: dest ET_EXEC write mismatch"
    throw (IO.userError s!"{stageId}: dest mismatch")
  unless elfExecOneFunctionOk got do
    IO.eprintln s!"error: {stageId}: dest failed one-function ET_EXEC checks: {dest}"
    throw (IO.userError s!"{stageId}: dest sidecar")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-ONE-FUNCTION {dest}"
  IO.println "  HOST-HOST-TOOL-ELF-EXEC: dest is ET_EXEC (not ET_REL; not mill leanc)"
  IO.println "  HOST-HOST-TOOL-EPRINT: dest .text fail-closed plus extra-argv MainCatch"
  IO.println "  HOST-HOST-TOOL-COMPLETE-OK: dest .text evaluates completeOk, not argc as Ok"
  IO.println "  HOST-HOST-TOOL-CATCH: dest .text extra-argv MainCatch dest eprint sys_exit(1)"
  IO.println "  HOST-HOST-TOOL-MAIN-CATCH-DEST: dest-safe MainCatch bytes in .text"
  IO.println "  HOST-HOST-TOOL-ABORT: takenAbort stays contrast (not living terminator)"
  IO.println "  HOST-HOST-TOOL-EXIT: dest .text sys_exit(0) on Ok-true default argv, not ret"

end SystemsLean.SlakeHostToolElfMeasureReloc
"#

end SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc

