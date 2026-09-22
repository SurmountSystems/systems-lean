/-
  SYSTEMS_LEAN_HOST -- native x86_64 of first-banner printLine (closed subset).
  Named dump: out/slake-host-tool-elf/self-host-complete-measure.x86-64.bin.
  Named dest ELF stays wrapper plus xor-ret callee. This sidecar is not dest.
  Do not import SystemsLean.SelfHostComplete (too fat for lean --run).
  Do not replace dest .text with printLine. Do not link this body in place of xor-ret.
  Reloc count 0. Banner bytes live in the same blob after the insn (RIP-relative LEA).
  not mill leanc. Not remill mill 69. Not slake-hello clang wrap.
  FullHost stays false. slakeOwnsPackageTypecheck stays false.
  occupancy 49. Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-MEASURE-X86, printSelfHostCompleteMeasure,
  NativeInsn.x86_64Code, NativeInsn.encodeX86_64, writeMeasureX86,
  self-host-complete-measure.x86-64.bin.
  Module: SystemsLean.SlakeHostToolElfMeasureX86
-/

import SystemsLean.SlakeHostToolElfMeasure

namespace SystemsLean.SlakeHostToolElfMeasureX86

open SystemsLean.SlakeHostToolElfMeasure

/-- Greppable stage id (same writer family). -/
def stageId : String := "SLAKE_HOST_TOOL_ELF_V0"

/-- Named dest. Measure x86 dump must not be this path. -/
def destRel : String := SystemsLean.SlakeHostToolElfMeasure.destRel

/-- Tagged x86 sidecar. Not dest. Not ELF magic. -/
def measureX86Rel : String :=
  "out/slake-host-tool-elf/self-host-complete-measure.x86-64.bin"

/-- Precise leftover after first-banner x86. Dest stays xor-ret callee. -/
def leftoverX86 : String := leftoverNative

theorem measureX86Rel_ne_destRel : (measureX86Rel == destRel) = false :=
  rfl

/-- Little-endian UInt32 of a Nat (low 32 bits). -/
def encodeU32le (n : Nat) : ByteArray :=
  ByteArray.mk #[
    UInt8.ofNat (n % 256),
    UInt8.ofNat ((n / 256) % 256),
    UInt8.ofNat ((n / 65536) % 256),
    UInt8.ofNat ((n / 16777216) % 256)
  ]

/-- ASCII tag "X64I". Same as printer. Not ELF magic. -/
def x86_64Tag : ByteArray := ByteArray.mk #[0x58, 0x36, 0x34, 0x49]

theorem x86_64Tag_ne_elfMagic : (x86_64Tag == elfMagic) = false :=
  rfl

/-- UTF-8 first banner plus newline. Lives in the same blob after the insn prefix. -/
def payloadBytes : ByteArray :=
  firstBanner.toUTF8.append (ByteArray.mk #[0x0a])

/-- write(1, payload, n) length. n is firstBanner UTF-8 size plus newline. -/
def payloadLen : Nat := firstBanner.toUTF8.size + 1

/--
  25-byte x86_64-linux SysV prefix: sys_write stdout, LEA rsi [rip+8], mov edx n,
  syscall, ret. RIP after LEA is +17; string at +25; disp=8. Reloc count 0.
-/
def insnPrefix (n : Nat) : ByteArray :=
  (ByteArray.mk #[
      0xb8, 0x01, 0x00, 0x00, 0x00,
      0xbf, 0x01, 0x00, 0x00, 0x00,
      0x48, 0x8d, 0x35, 0x08, 0x00, 0x00, 0x00,
      0xba
    ]).append (encodeU32le n) |>.append (ByteArray.mk #[0x0f, 0x05, 0xc3])

/-- Closed-subset bytes for printLine firstBanner only. Else empty. -/
def NativeInsn.x86_64Code : NativeInsn -> ByteArray
  | .printLine line =>
    if line == firstBanner then
      (insnPrefix payloadLen).append payloadBytes
    else
      ByteArray.mk #[]
  | .eprintLine _ => ByteArray.mk #[]
  | .throwUser _ => ByteArray.mk #[]
  | .catchMain _ => ByteArray.mk #[]

/-- True when prefix is write/ret, payload is firstBanner plus newline, size = 25 + n. -/
def x86_64CodeOk (b : ByteArray) : Bool :=
  (b.size == 25 + payloadLen) &&
    (b.extract 0 25 == insnPrefix payloadLen) &&
    (b.extract 25 b.size == payloadBytes)

/-- Tagged sidecar: X64I, u32le code.size, code, u32le reloc count 0. Empty if not firstBanner. -/
def NativeInsn.encodeX86_64 : NativeInsn -> ByteArray
  | insn =>
    let code := NativeInsn.x86_64Code insn
    if code.size == 0 then
      ByteArray.mk #[]
    else
      x86_64Tag
        |>.append (encodeU32le code.size)
        |>.append code
        |>.append (encodeU32le 0)

/-- Well-typed measure IR only. First banner printLine. Not remaining fields. -/
def NativeFun.encodeX86_64 (f : NativeFun) : ByteArray :=
  if f.wellTyped then
    NativeInsn.encodeX86_64 (NativeInsn.printLine firstBanner)
  else
    ByteArray.mk #[]

set_option maxRecDepth 4096

theorem measureNativeIr_x86_64CodeOk :
  (x86_64CodeOk (NativeInsn.x86_64Code (NativeInsn.printLine firstBanner))) = true :=
  rfl

theorem measureNativeIr_encodeX86_64_not_elf :
  (bytesAreElfMagic (NativeFun.encodeX86_64 measureNativeIr)) = false :=
  rfl

/-- Write tagged measure x86. Fail closed if dest, empty, ELF magic, ill-typed, or code not ok. -/
def writeMeasureX86 (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  let p := root / measureX86Rel
  if measureX86Rel == destRel then
    IO.eprintln s!"error: {stageId}: measure x86 sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: measure x86 sidecar is dest")
  if p == dest then
    IO.eprintln s!"error: {stageId}: measure x86 sidecar must not be dest"
    throw (IO.userError s!"{stageId}: measure x86 is dest")
  unless measureNativeIr.wellTyped do
    IO.eprintln s!"error: {stageId}: measure native IR is not well-typed"
    throw (IO.userError s!"{stageId}: measure IR ill-typed")
  let code := NativeInsn.x86_64Code (NativeInsn.printLine firstBanner)
  unless x86_64CodeOk code do
    IO.eprintln s!"error: {stageId}: measure x86_64 bytes are not write/ret of first banner"
    throw (IO.userError s!"{stageId}: measure x86 code")
  let blob := NativeFun.encodeX86_64 measureNativeIr
  if blob.size == 0 then
    IO.eprintln s!"error: {stageId}: NativeFun.encodeX86_64 empty"
    throw (IO.userError s!"{stageId}: measure x86 empty")
  if bytesAreElfMagic blob then
    IO.eprintln s!"error: {stageId}: NativeInsn.encodeX86_64 must not be ELF magic"
    throw (IO.userError s!"{stageId}: measure x86 is ELF")
  if blob.extract 0 4 != x86_64Tag then
    IO.eprintln s!"error: {stageId}: measure x86 must start with X64I"
    throw (IO.userError s!"{stageId}: measure x86 not X64I")
  if let some parent := p.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile p blob
  let got <- IO.FS.readBinFile p
  if got != blob then
    IO.eprintln s!"error: {stageId}: measure x86 write mismatch"
    throw (IO.userError s!"{stageId}: measure x86 mismatch")
  if got.size == 0 then
    IO.eprintln s!"error: {stageId}: measure x86 empty"
    throw (IO.userError s!"{stageId}: measure x86 empty")
  if bytesAreElfMagic got then
    IO.eprintln s!"error: {stageId}: measure x86 must not be ELF magic: {p}"
    throw (IO.userError s!"{stageId}: measure x86 is ELF")
  if got.extract 0 4 != x86_64Tag then
    IO.eprintln s!"error: {stageId}: measure x86 sidecar must still be X64I (not dest)"
    throw (IO.userError s!"{stageId}: measure x86 not X64I")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-MEASURE-X86 {p}"

end SystemsLean.SlakeHostToolElfMeasureX86
