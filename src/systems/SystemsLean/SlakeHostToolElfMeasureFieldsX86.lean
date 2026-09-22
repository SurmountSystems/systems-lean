/-
  SYSTEMS_LEAN_HOST -- native x86_64 of remaining println fields (closed subset).
  Named dump:
  out/slake-host-tool-elf/self-host-complete-measure-fields.x86-64.bin.
  Named dest ELF stays wrapper plus xor-ret callee. This sidecar is not dest.
  Do not import SystemsLean.SelfHostComplete (too fat for lean --run).
  Do not replace dest .text. Measure ET_REL sidecar is not dest.
  Do not re-encode firstBanner. Do not encode GREEN/eprint/throw/catch.
  Reloc count 0. Sequential write(1, line plus newline) then ret per line.
  not mill leanc. Not remill mill 69. Not slake-hello clang wrap.
  FullHost stays false. slakeOwnsPackageTypecheck stays false.
  occupancy 49. Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-MEASURE-FIELDS-X86, printSelfHostCompleteMeasure,
  remainingLines, NativeInsn.x86_64Code, NativeInsn.encodeX86_64,
  writeMeasureFieldsX86, leftoverAfterFieldsX86,
  self-host-complete-measure-fields.x86-64.bin.
  Module: SystemsLean.SlakeHostToolElfMeasureFieldsX86
-/

import SystemsLean.SlakeHostToolElfMeasureX86

namespace SystemsLean.SlakeHostToolElfMeasureFieldsX86

open SystemsLean.SlakeHostToolElfMeasure
open SystemsLean.SlakeHostToolElfMeasureFields
open SystemsLean.SlakeHostToolElfMeasureX86 (
  encodeU32le x86_64Tag insnPrefix measureX86Rel)

/-- Greppable stage id (same writer family). -/
def stageId : String := "SLAKE_HOST_TOOL_ELF_V0"

/-- Named dest. Measure fields x86 dump must not be this path. -/
def destRel : String := SystemsLean.SlakeHostToolElfMeasure.destRel

/-- Tagged remaining-fields x86 sidecar. Not dest. Not ELF magic. -/
def measureFieldsX86Rel : String :=
  "out/slake-host-tool-elf/self-host-complete-measure-fields.x86-64.bin"

/-- Precise leftover after remaining-field x86. Dest is one-function ET_EXEC. -/
def leftoverAfterFieldsX86 : String :=
  "leftover: dest is one-function ET_EXEC of first-banner plus remaining " ++
    "println writes; leftover is GREEN/fail-closed plus main-catch of " ++
    "printSelfHostCompleteMeasure still not in dest .text (not mill, not mill " ++
    "leanc, not slake-hello, not Lake-gone)"

theorem measureFieldsX86Rel_ne_destRel :
    (measureFieldsX86Rel == destRel) = false :=
  rfl

theorem measureFieldsX86Rel_ne_measureX86Rel :
    (measureFieldsX86Rel == measureX86Rel) = false :=
  rfl

/-- True when `line` is a remaining println field, not the first banner. -/
def isRemainingLine (line : String) : Bool :=
  (line != firstBanner) && remainingLines.any (fun s => s == line)

/-- write(1, line plus newline) then ret. Same 25-byte prefix as first-banner. -/
def encodePrintLine (line : String) : ByteArray :=
  let n := line.toUTF8.size + 1
  let payload := line.toUTF8.append (ByteArray.mk #[0x0a])
  (insnPrefix n).append payload

/-- Closed-subset bytes for remaining printLine only. Else empty. -/
def NativeInsn.x86_64Code : NativeInsn -> ByteArray
  | .printLine line =>
    if isRemainingLine line then
      encodePrintLine line
    else
      ByteArray.mk #[]
  | .eprintLine _ => ByteArray.mk #[]
  | .throwUser _ => ByteArray.mk #[]
  | .catchMain _ => ByteArray.mk #[]

/-- Honest sequential writes of remaining fields. Ret after each write. -/
def remainingX86Code : ByteArray :=
  remainingLines.foldl
    (fun acc line => acc.append (NativeInsn.x86_64Code (.printLine line)))
    (ByteArray.mk #[])

/-- Walk remaining payloads: each block is 25-byte prefix plus line newline. -/
def stepRemainingOk (acc : Option Nat) (line : String) (b : ByteArray) :
    Option Nat :=
  match acc with
  | none => none
  | some off =>
    let n := line.toUTF8.size + 1
    let sz := 25 + n
    let pref := insnPrefix n
    let pay := line.toUTF8.append (ByteArray.mk #[0x0a])
    if b.size >= off + sz &&
        (b.extract off (off + 25) == pref) &&
        (b.extract (off + 25) (off + sz) == pay) then
      some (off + sz)
    else
      none

/-- True when `b` is sequential remaining-field writes, not first-banner-only. -/
def remainingX86CodeOk (b : ByteArray) : Bool :=
  match remainingLines.foldl (fun acc line => stepRemainingOk acc line b)
      (some 0) with
  | some off =>
    (off == b.size) && (b.size != 0) && (remainingLines.length == remainingCount)
  | none => false

/-- Tagged sidecar: X64I, u32le code.size, remaining code, reloc count 0. -/
def NativeInsn.encodeX86_64 (code : ByteArray) : ByteArray :=
  if code.size == 0 then
    ByteArray.mk #[]
  else
    x86_64Tag
      |>.append (encodeU32le code.size)
      |>.append code
      |>.append (encodeU32le 0)

/-- Well-typed measure IR only. Remaining printLine fields. Not firstBanner. -/
def NativeFun.encodeX86_64 (f : NativeFun) : ByteArray :=
  if f.wellTyped then
    NativeInsn.encodeX86_64 remainingX86Code
  else
    ByteArray.mk #[]

/-- First-banner x86 code from MeasureX86. Remaining sidecar must not equal it. -/
def firstBannerX86Code : ByteArray :=
  SystemsLean.SlakeHostToolElfMeasureX86.NativeInsn.x86_64Code
    (NativeInsn.printLine firstBanner)

/-- Write tagged remaining-fields x86. Fail closed if dest, empty, ELF, or banner. -/
def writeMeasureFieldsX86 (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  let p := root / measureFieldsX86Rel
  if measureFieldsX86Rel == destRel then
    IO.eprintln s!"error: {stageId}: fields x86 sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: fields x86 sidecar is dest")
  if measureFieldsX86Rel == measureX86Rel then
    IO.eprintln s!"error: {stageId}: fields x86 sidecar must not be first-banner x86"
    throw (IO.userError s!"{stageId}: fields x86 is first-banner sidecar")
  if p == dest then
    IO.eprintln s!"error: {stageId}: fields x86 sidecar must not be dest"
    throw (IO.userError s!"{stageId}: fields x86 is dest")
  unless measureNativeIr.wellTyped do
    IO.eprintln s!"error: {stageId}: measure native IR is not well-typed"
    throw (IO.userError s!"{stageId}: measure IR ill-typed")
  if remainingLines.length != remainingCount then
    IO.eprintln s!"error: {stageId}: remainingLines length is not remainingCount"
    throw (IO.userError s!"{stageId}: remaining count")
  let code := remainingX86Code
  unless remainingX86CodeOk code do
    IO.eprintln s!"error: {stageId}: remaining x86_64 bytes are not sequential writes"
    throw (IO.userError s!"{stageId}: fields x86 code")
  if code == firstBannerX86Code then
    IO.eprintln s!"error: {stageId}: remaining x86 must not be first-banner-only"
    throw (IO.userError s!"{stageId}: fields x86 first-banner-only")
  let blob := NativeFun.encodeX86_64 measureNativeIr
  if blob.size == 0 then
    IO.eprintln s!"error: {stageId}: NativeFun.encodeX86_64 empty"
    throw (IO.userError s!"{stageId}: fields x86 empty")
  if bytesAreElfMagic blob then
    IO.eprintln s!"error: {stageId}: NativeInsn.encodeX86_64 must not be ELF magic"
    throw (IO.userError s!"{stageId}: fields x86 is ELF")
  if blob.extract 0 4 != x86_64Tag then
    IO.eprintln s!"error: {stageId}: fields x86 must start with X64I"
    throw (IO.userError s!"{stageId}: fields x86 not X64I")
  if let some parent := p.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile p blob
  let got <- IO.FS.readBinFile p
  if got != blob then
    IO.eprintln s!"error: {stageId}: fields x86 write mismatch"
    throw (IO.userError s!"{stageId}: fields x86 mismatch")
  if got.size == 0 then
    IO.eprintln s!"error: {stageId}: fields x86 empty"
    throw (IO.userError s!"{stageId}: fields x86 empty")
  if bytesAreElfMagic got then
    IO.eprintln s!"error: {stageId}: fields x86 must not be ELF magic: {p}"
    throw (IO.userError s!"{stageId}: fields x86 is ELF")
  if got.extract 0 4 != x86_64Tag then
    IO.eprintln s!"error: {stageId}: fields x86 sidecar must still be X64I (not dest)"
    throw (IO.userError s!"{stageId}: fields x86 not X64I")
  unless remainingX86CodeOk (got.extract 8 (8 + code.size)) do
    IO.eprintln s!"error: {stageId}: fields x86 payload is not remaining writes"
    throw (IO.userError s!"{stageId}: fields x86 payload")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-MEASURE-FIELDS-X86 {p}"

end SystemsLean.SlakeHostToolElfMeasureFieldsX86
