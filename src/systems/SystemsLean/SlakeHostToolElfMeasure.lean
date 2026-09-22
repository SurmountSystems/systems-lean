/-
  SYSTEMS_LEAN_HOST -- typed native IR of printSelfHostCompleteMeasure (closed subset).
  Named dump: out/slake-host-tool-elf/self-host-complete-measure.native-ir.txt.
  Named dest ELF stays wrapper plus return-0 callee. This sidecar is not dest.
  Do not import SystemsLean.SelfHostComplete (too fat for lean --run).
  Duplicate names as strings. First banner plus remaining println fields plus
  GREEN/fail-closed plus main catch. not mill leanc. Not remill mill 69.
  Not slake-hello. FullHost stays false. slakeOwnsPackageTypecheck stays false.
  Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-MEASURE-IR, HOST-HOST-TOOL-MEASURE-FIELDS,
  HOST-HOST-TOOL-MEASURE-GREEN, printSelfHostCompleteMeasure,
  self-host-complete-measure.native-ir.txt, writeMeasureNativeIr.
  Module: SystemsLean.SlakeHostToolElfMeasure
-/

import SystemsLean.SlakeHostToolElfMeasureFields
import SystemsLean.SlakeHostToolElfMeasureGreen

namespace SystemsLean.SlakeHostToolElfMeasure

open SystemsLean.SlakeHostToolElfMeasureFields
open SystemsLean.SlakeHostToolElfMeasureGreen

/-- Greppable stage id (same writer family). -/
def stageId : String := "SLAKE_HOST_TOOL_ELF_V0"

/-- Named dest. Measure dump must not be this path. -/
def destRel : String := "out/slake-host-tool-elf/slake-freestanding-self-host-complete"

/-- ASCII dump sidecar. Not dest. Not ELF magic. -/
def measureNativeIrRel : String :=
  "out/slake-host-tool-elf/self-host-complete-measure.native-ir.txt"

/-- NativeFun name. Duplicate of SelfHostComplete; do not import that module. -/
def measureFunName : String := "printSelfHostCompleteMeasure"

/-- First banner line of printSelfHostCompleteMeasure. -/
def firstBanner : String :=
  "== SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0: freestanding product self-host complete =="

/-- Precise leftover after GREEN/fail-closed tokens. Dest stays xor-ret. -/
def leftoverNative : String := leftoverAfterGreen

/-- Local native type. Do not rewrite wrapper NativeTy in the printer. -/
inductive NativeTy where
  | unit
  | io (t : NativeTy)
  deriving DecidableEq, Repr

/-- Closed-subset insn: printLine, fail-closed eprint/throw, main catch. -/
inductive NativeInsn where
  | printLine (line : String)
  | eprintLine (line : String)
  | throwUser (msg : String)
  | catchMain (eprint : String)
  deriving DecidableEq, Repr

/-- One native function. Closed subset of printSelfHostCompleteMeasure. -/
structure NativeFun where
  name : String
  params : List String
  retTy : NativeTy
  body : List NativeInsn
  deriving DecidableEq, Repr

/-- ASCII type render. Not LLVM. Not mill C. -/
def NativeTy.render : NativeTy -> String
  | .unit => "Unit"
  | .io t => "IO " ++ t.render

/-- ASCII insn render. -/
def NativeInsn.render : NativeInsn -> String
  | .printLine line => "printLine " ++ line
  | .eprintLine line => "eprintLine " ++ line
  | .throwUser msg => "throwUser " ++ msg
  | .catchMain eprint => "catchMain " ++ eprint

/-- ASCII body render. Seq of printLine. -/
def NativeInsn.renderBody (xs : List NativeInsn) : String :=
  String.intercalate "\n" (xs.map NativeInsn.render)

/-- ASCII function render. HOST-HOST-TOOL-MEASURE-IR dump body. -/
def NativeFun.render (f : NativeFun) : String :=
  "fun " ++ f.name ++ "(" ++ String.intercalate "," f.params ++ ") : " ++
    f.retTy.render ++ " :=\n" ++ NativeInsn.renderBody f.body

/-- First banner plus remaining fields plus GREEN/fail-closed plus main catch.
    Sequential tokens: Ok-true takes GREEN; fail-closed remains in the IR. -/
def measureBody : List NativeInsn :=
  NativeInsn.printLine firstBanner :: remainingLines.map NativeInsn.printLine
    ++ [ NativeInsn.printLine greenLine
       , NativeInsn.eprintLine failClosedEprint
       , NativeInsn.throwUser throwMsg
       , NativeInsn.catchMain catchEprint ]

/-- True when `f` is IO Unit seq of first banner, remaining fields, GREEN/fail-closed, catch. -/
def NativeFun.wellTyped (f : NativeFun) : Bool :=
  (f.name == measureFunName) &&
    (f.params == []) &&
    (f.retTy == NativeTy.io NativeTy.unit) &&
    (f.body == measureBody)

/-- Closed subset lower of printSelfHostCompleteMeasure. Not dest ELF. -/
def measureNativeIr : NativeFun :=
  { name := measureFunName
    params := []
    retTy := NativeTy.io NativeTy.unit
    body := measureBody }

/-- First printLine only. Remaining fields are IR tokens, not x86 this slice. -/
def NativeFun.firstInsn (f : NativeFun) : Option NativeInsn :=
  match f.body with
  | h :: _ => some h
  | [] => none

set_option maxRecDepth 4096

theorem measureNativeIr_wellTyped : measureNativeIr.wellTyped = true :=
  rfl

theorem measureNativeIr_name : measureNativeIr.name = "printSelfHostCompleteMeasure" :=
  rfl

theorem measureNativeIr_body_length :
    measureNativeIr.body.length = remainingCount + 1 + 4 :=
  rfl

theorem measureNativeIr_first :
    NativeFun.firstInsn measureNativeIr = some (NativeInsn.printLine firstBanner) :=
  rfl

/-- Greppable ASCII dump. Not dest ELF. Not ELF magic. -/
def measureNativeIrText : String :=
  "HOST-HOST-TOOL-MEASURE-IR\n" ++
    "HOST-HOST-TOOL-MEASURE-FIELDS\n" ++
    "HOST-HOST-TOOL-MEASURE-GREEN\n" ++
    "SLAKE_HOST_TOOL_ELF_V0 / HOST-SLAKE-HOST-TOOL-ELF\n" ++
    "printSelfHostCompleteMeasure\n" ++
    "closed subset: IO Unit seq (first banner plus remaining println fields " ++
    "plus GREEN/fail-closed plus main catch)\n" ++
    measureNativeIr.render ++ "\n" ++
    leftoverNative ++ "\n" ++
    "pins: FullHost false; slakeOwnsPackageTypecheck false; occupancy 49; " ++
    "mill 69 of 69; not Lake-gone\n"

/-- Dump for write. Empty means do not write a fake blob. -/
def measureNativeIrDump : Option String := some measureNativeIrText

theorem measureNativeIrDump_isSome : measureNativeIrDump.isSome = true :=
  rfl

/-- ELF magic 0x7f 'E' 'L' 'F'. Dump must not start with this. -/
def elfMagic : ByteArray := ByteArray.mk #[0x7f, 0x45, 0x4c, 0x46]

/-- True when the first four bytes are ELF magic. -/
def bytesAreElfMagic (b : ByteArray) : Bool :=
  b.size >= 4 && b.extract 0 4 == elfMagic

theorem measureNativeIrRel_ne_destRel : (measureNativeIrRel == destRel) = false :=
  rfl

/-- Write ASCII measure IR. Fail closed if ELF magic, empty, or dest path. -/
def writeMeasureNativeIr (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  let p := root / measureNativeIrRel
  if measureNativeIrRel == destRel then
    IO.eprintln s!"error: {stageId}: measure sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: measure sidecar is dest")
  if p == dest then
    IO.eprintln s!"error: {stageId}: measure sidecar must not be dest"
    throw (IO.userError s!"{stageId}: measure is dest")
  unless measureNativeIr.wellTyped do
    IO.eprintln s!"error: {stageId}: measure native IR is not well-typed"
    throw (IO.userError s!"{stageId}: measure IR ill-typed")
  match measureNativeIrDump with
  | none => do
    IO.eprintln s!"error: {stageId}: measure native IR dump missing"
    throw (IO.userError s!"{stageId}: measure IR none")
  | some ir => do
    if ir == "" then
      IO.eprintln s!"error: {stageId}: measure native IR dump empty"
      throw (IO.userError s!"{stageId}: measure IR empty")
    if let some parent := p.parent then
      IO.FS.createDirAll parent
    IO.FS.writeFile p ir
    let got <- IO.FS.readFile p
    if got != ir then
      IO.eprintln s!"error: {stageId}: measure native IR write mismatch"
      throw (IO.userError s!"{stageId}: measure IR mismatch")
    if got == "" then
      IO.eprintln s!"error: {stageId}: measure native IR empty"
      throw (IO.userError s!"{stageId}: measure IR empty")
    if bytesAreElfMagic got.toUTF8 then
      IO.eprintln s!"error: {stageId}: measure native IR must not be ELF magic: {p}"
      throw (IO.userError s!"{stageId}: measure IR is ELF")
    IO.println s!"{stageId}: wrote HOST-HOST-TOOL-MEASURE-IR {p}"

end SystemsLean.SlakeHostToolElfMeasure
