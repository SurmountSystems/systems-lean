/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SlakeHostToolElfMainCatchX86.lean bytes.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86Source
  Greppable: SYSTEMS_LEAN_HOST, liveSlakeHostToolElfMainCatchX86Source,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-X86.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69. Not a remill.
  Not Lake-gone. slakeOwnsPackageTypecheck stays false. FullBackend stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86

/-- Dual-pinned live SlakeHostToolElfMainCatchX86.lean bytes.
    Greppable: liveSlakeHostToolElfMainCatchX86Source. -/
def liveSlakeHostToolElfMainCatchX86Source : String := r#"/-
  SYSTEMS_LEAN_HOST -- native x86_64 of Lean catch IR (eprint plus return 1).
  Named dump: out/slake-host-tool-elf/self-host-complete-main-catch.x86-64.bin.
  Tagged X64I sidecar. Not dest ELF. Not mill dest. Reloc count 0.
  Catch lives in CatchReturn.withCatch; SelfHostComplete.main uses it.
  Dest extra-argv encodes those catch strings; extra-argv is still not Lean throw.
  Dest catch is completeOk/argc stand-in, not this Lean catch.
  Do not import SystemsLean.SelfHostComplete (too fat). Do not import Measure
  NativeInsn. Do not import MeasureReloc or CompleteOk.
  Do not replace dest .text. not mill leanc. Not remill mill 69. Not slake-hello.
  FullHost stays false. slakeOwnsPackageTypecheck stays false.
  occupancy 49. Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-MAIN-CATCH, HOST-HOST-TOOL-MAIN-CATCH-X86, HOST-HOST-TOOL-EPRINT,
  X64I, CatchInsn.x86_64Code, CatchInsn.encodeX86_64, writeCatchX86,
  self-host-complete-main-catch.x86-64.bin.
  Module: SystemsLean.SlakeHostToolElfMainCatchX86
-/

import SystemsLean.SlakeHostToolElfMainCatch

namespace SystemsLean.SlakeHostToolElfMainCatchX86

open SystemsLean.SlakeHostToolElfMainCatch

/-- Greppable stage id (same writer family). -/
def stageId : String := SystemsLean.SlakeHostToolElfMainCatch.stageId

/-- Lean-main catch stage. Distinct from dest HOST-HOST-TOOL-CATCH. -/
def catchStage : String := SystemsLean.SlakeHostToolElfMainCatch.catchStage

/-- Named dest. Catch x86 dump must not be this path. -/
def destRel : String := SystemsLean.SlakeHostToolElfMainCatch.destRel

/-- Tagged catch x86 sidecar. Not dest. Not ELF magic. -/
def catchX86Rel : String :=
  "out/slake-host-tool-elf/self-host-complete-main-catch.x86-64.bin"

/-- Precise leftover after catch x86. Catch lives in CatchReturn.withCatch. -/
def leftoverCatchX86 : String := leftoverLeanCatch

theorem catchX86Rel_ne_destRel : (catchX86Rel == destRel) = false :=
  rfl

/-- Little-endian UInt32 of a Nat (low 32 bits). Local; do not import Measure. -/
def encodeU32le (n : Nat) : ByteArray :=
  ByteArray.mk #[
    UInt8.ofNat (n % 256),
    UInt8.ofNat ((n / 256) % 256),
    UInt8.ofNat ((n / 65536) % 256),
    UInt8.ofNat ((n / 16777216) % 256)
  ]

/-- ASCII tag "X64I". Same as first-banner / fields printer. Not ELF magic. -/
def x86_64Tag : ByteArray := ByteArray.mk #[0x58, 0x36, 0x34, 0x49]

/-- ELF magic 0x7f 'E' 'L' 'F'. Sidecar must not be this. -/
def elfMagic : ByteArray := ByteArray.mk #[0x7f, 0x45, 0x4c, 0x46]

/-- True when the first four bytes are ELF magic. -/
def bytesAreElfMagic (b : ByteArray) : Bool :=
  b.size >= 4 && b.extract 0 4 == elfMagic

theorem x86_64Tag_ne_elfMagic : (x86_64Tag == elfMagic) = false :=
  rfl

/-- UTF-8 catch eprint plus newline. Lives in the same blob after the insn prefix. -/
def payloadBytes : ByteArray :=
  catchEprint.toUTF8.append (ByteArray.mk #[0x0a])

/-- write(2, payload, n) length. n is catchEprint UTF-8 size plus newline. -/
def payloadLen : Nat := catchEprint.toUTF8.size + 1

/--
  24-byte x86_64-linux SysV prefix: sys_write stderr (fd 2), LEA rsi [rip+7],
  mov edx n, syscall. No ret (return 1 follows payload). RIP after LEA is +17;
  string at +24; disp=7. Reloc count 0. HOST-HOST-TOOL-EPRINT.
-/
def eprintPrefix (n : Nat) : ByteArray :=
  (ByteArray.mk #[
      0xb8, 0x01, 0x00, 0x00, 0x00,
      0xbf, 0x02, 0x00, 0x00, 0x00,
      0x48, 0x8d, 0x35, 0x07, 0x00, 0x00, 0x00,
      0xba
    ]).append (encodeU32le n) |>.append (ByteArray.mk #[0x0f, 0x05])

/-- mov eax,1 ; ret. SysV return 1 after eprint. Not sys_exit. -/
def return1Code : ByteArray :=
  ByteArray.mk #[0xb8, 0x01, 0x00, 0x00, 0x00, 0xc3]

theorem eprintPrefix_fd_stderr :
    ((eprintPrefix 0).extract 5 10 ==
      ByteArray.mk #[0xbf, 0x02, 0x00, 0x00, 0x00]) = true :=
  rfl

/-- Closed-subset bytes for catch eprintLine plus return 1. Else empty. -/
def CatchInsn.x86_64Code : CatchInsn -> ByteArray
  | .eprintLine line =>
    if line == catchEprint then
      (eprintPrefix payloadLen).append payloadBytes
    else
      ByteArray.mk #[]
  | .returnCode n =>
    if n == 1 then
      return1Code
    else
      ByteArray.mk #[]

/-- Concat of catchBody x86: stderr write then return 1. -/
def catchX86Code : ByteArray :=
  catchBody.foldl
    (fun acc insn => acc.append (CatchInsn.x86_64Code insn))
    (ByteArray.mk #[])

/-- True when prefix is write fd 2, payload is catchEprint plus newline, then return 1. -/
def x86_64CodeOk (b : ByteArray) : Bool :=
  (b.size == 24 + payloadLen + 6) &&
    (b.extract 0 24 == eprintPrefix payloadLen) &&
    (b.extract 24 (24 + payloadLen) == payloadBytes) &&
    (b.extract (24 + payloadLen) b.size == return1Code)

/-- Tagged sidecar: X64I, u32le code.size, code, u32le reloc count 0. Empty if not catch. -/
def CatchInsn.encodeX86_64 (code : ByteArray) : ByteArray :=
  if code.size == 0 then
    ByteArray.mk #[]
  else
    x86_64Tag
      |>.append (encodeU32le code.size)
      |>.append code
      |>.append (encodeU32le 0)

/-- Well-typed catch IR only. eprint throwMsg then return 1. Not dest. -/
def encodeCatchX86 : ByteArray :=
  CatchInsn.encodeX86_64 catchX86Code

set_option maxRecDepth 4096

theorem catchX86Code_ok : (x86_64CodeOk catchX86Code) = true :=
  rfl

theorem encodeCatchX86_not_elf :
    (bytesAreElfMagic encodeCatchX86) = false :=
  rfl

theorem encodeCatchX86_startsWith_X64I :
    (encodeCatchX86.extract 0 4 == x86_64Tag) = true :=
  rfl

theorem catchStage_eq : catchStage = "HOST-HOST-TOOL-MAIN-CATCH" :=
  rfl

/-- This helper encodes Lean catch x86. It does not write dest. -/
def writesDest : Bool := false

theorem writesDest_eq_false : writesDest = false :=
  rfl

/-- Write tagged catch x86. Fail closed if dest, empty, ELF magic, or code not ok. -/
def writeCatchX86 (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  let p := root / catchX86Rel
  if catchX86Rel == destRel then
    IO.eprintln s!"error: {stageId}: catch x86 sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: catch x86 sidecar is dest")
  if p == dest then
    IO.eprintln s!"error: {stageId}: catch x86 sidecar must not be dest"
    throw (IO.userError s!"{stageId}: catch x86 is dest")
  let code := catchX86Code
  unless x86_64CodeOk code do
    IO.eprintln s!"error: {stageId}: catch x86_64 bytes are not eprint/return 1"
    throw (IO.userError s!"{stageId}: catch x86 code")
  let blob := encodeCatchX86
  if blob.size == 0 then
    IO.eprintln s!"error: {stageId}: encodeCatchX86 empty"
    throw (IO.userError s!"{stageId}: catch x86 empty")
  if bytesAreElfMagic blob then
    IO.eprintln s!"error: {stageId}: encodeCatchX86 must not be ELF magic"
    throw (IO.userError s!"{stageId}: catch x86 is ELF")
  if blob.extract 0 4 != x86_64Tag then
    IO.eprintln s!"error: {stageId}: catch x86 must start with X64I"
    throw (IO.userError s!"{stageId}: catch x86 not X64I")
  if let some parent := p.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile p blob
  let got <- IO.FS.readBinFile p
  if got != blob then
    IO.eprintln s!"error: {stageId}: catch x86 write mismatch"
    throw (IO.userError s!"{stageId}: catch x86 mismatch")
  if got.size == 0 then
    IO.eprintln s!"error: {stageId}: catch x86 empty"
    throw (IO.userError s!"{stageId}: catch x86 empty")
  if bytesAreElfMagic got then
    IO.eprintln s!"error: {stageId}: catch x86 must not be ELF magic: {p}"
    throw (IO.userError s!"{stageId}: catch x86 is ELF")
  if got.extract 0 4 != x86_64Tag then
    IO.eprintln s!"error: {stageId}: catch x86 sidecar must still be X64I (not dest)"
    throw (IO.userError s!"{stageId}: catch x86 not X64I")
  unless x86_64CodeOk (got.extract 8 (8 + code.size)) do
    IO.eprintln s!"error: {stageId}: catch x86 payload is not eprint/return 1"
    throw (IO.userError s!"{stageId}: catch x86 payload")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-MAIN-CATCH-X86 {p}"

end SystemsLean.SlakeHostToolElfMainCatchX86
"#

end SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86
