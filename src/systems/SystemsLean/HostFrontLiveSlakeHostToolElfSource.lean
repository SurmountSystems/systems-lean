/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SlakeHostToolElf.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeHostToolElfSource. Not occupancy name 50. Not mill 70.
  Occupancy stays 49. Mill stays 69 of 69. Not mill remill. Not occupancy Term.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-SLAKE-HOST-TOOL-ELF, liveSlakeHostToolElfSource,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfSource
  Not FullHost. Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSlakeHostToolElf

/-- Dual-pinned live SlakeHostToolElf.lean bytes (must match on-disk file).
    Greppable: liveSlakeHostToolElfSource, PARSE-LIVE-SLAKE-HOST-TOOL-ELF. -/
def liveSlakeHostToolElfSource : String := r#"/-
  SYSTEMS_LEAN_HOST -- dest-missing writer for one Slake-produced host-tool ELF.
  Named dest: out/slake-host-tool-elf/slake-freestanding-self-host-complete.
  Named source Main: SystemsLean.SelfHostCompleteMain.
  Dest is NOT slake-hello. NOT mill 69 remill. NOT leanc mill.
  NOT build/first-host-tool. FullHost stays false.
  slakeOwnsPackageTypecheck stays false. Occupancy stays 49.
  Mill stays 69 of 69. Not Lake-gone.
  Write mode reads the named Main, writes a named emit plan, writes
  typed native IR for a closed subset of that Main (argv-forward wrapper),
  dumps NativeFun.encode bytes (not dest), dumps Lean-owned x86_64
  callNamedMain bytes (CALL rel32 unresolved, not dest ELF), dumps a
  Lean-owned ELF64 ET_REL relocatable object wrapping those six bytes
  (unresolved R_X86_64_PC32 to SystemsLean.SelfHostComplete.main),
  dumps a callee ET_REL (xor eax,eax; ret), and writes dest as ELF64
  ET_EXEC one-function .text (HOST-HOST-TOOL-ONE-FUNCTION / HOST-HOST-TOOL-ELF-EXEC /
  HOST-HOST-TOOL-COMPLETE-OK completeOk / HOST-HOST-TOOL-CATCH takenCatch /
  HOST-HOST-TOOL-EXIT sys_exit(0) when completeOk, not process-entry ret).
  Dest .text evaluates Lean-owned completeOk, not argc as Ok. Extra argv takes dest-safe MainCatch.
  The ET_REL sidecars are not dest. Dest is the one-function program.
  Do not write dest as ET_REL. Do not clang-link Compose SSA. Do not call leanc.
  do not write a fake ELF.
  CompilePath is fixtures. FreestandingEmit is product C.
  ElabMeetExe is a lakefile walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-NATIVE-IR, HOST-HOST-TOOL-NATIVE-INSN, HOST-HOST-TOOL-X86-64,
  HOST-HOST-TOOL-ELF-REL, ET_REL, self-host-complete-main.o, R_X86_64_PC32,
  HOST-HOST-TOOL-ELF-LINK, HOST-HOST-TOOL-ELF-UND, HOST-HOST-TOOL-ELF-EXEC, ET_EXEC,
  HOST-HOST-TOOL-MEASURE-IR, HOST-HOST-TOOL-MEASURE-X86, HOST-HOST-TOOL-MEASURE-GREEN,
  HOST-HOST-TOOL-MEASURE-FIELDS-X86, HOST-HOST-TOOL-MEASURE-REL,
  HOST-HOST-TOOL-ONE-FUNCTION, HOST-HOST-TOOL-EXIT, HOST-HOST-TOOL-ABORT,
  HOST-HOST-TOOL-EPRINT, HOST-HOST-TOOL-CATCH, HOST-HOST-TOOL-COMPLETE-OK,
  completeOk, oneFunctionText, writeOneFunction,
  abortSyscall, unusedAbort, takenAbort, takenCatch, exitSyscall,
  printSelfHostCompleteMeasure, writeMeasureX86,
  writeMeasureFieldsX86, writeMeasureReloc, self-host-complete-measure.x86-64.bin,
  self-host-complete-measure.native-ir.txt,
  self-host-complete-measure-fields.x86-64.bin, self-host-complete-measure.o,
  NativeInsn.encode, NativeFun.encode,
  slake-host-tool-elf, slake-freestanding-self-host-complete,
  SystemsLean.SelfHostCompleteMain, first-host-tool, slake-hello, SKELETON.
  Module: SystemsLean.SlakeHostToolElf
  Checkable writer: lean --run dest ET_EXEC (just slake-host-tool-elf).
-/

import SystemsLean.SlakeHostToolElfLink
import SystemsLean.SlakeHostToolElfMeasureGreen
import SystemsLean.SlakeHostToolElfMeasure
import SystemsLean.SlakeHostToolElfMeasureX86
import SystemsLean.SlakeHostToolElfMeasureFieldsX86
import SystemsLean.SlakeHostToolElfMeasureReloc

namespace SystemsLean.SlakeHostToolElf

/-- Greppable stage id. -/
def stageId : String := "SLAKE_HOST_TOOL_ELF_V0"

/-- Named just recipe (not a mill inventory row). -/
def justRecipeName : String := "slake-host-tool-elf"

/-- Durable ELF dest. Not slake-hello. Not build/first-host-tool. -/
def destRel : String := "out/slake-host-tool-elf/slake-freestanding-self-host-complete"

/-- Inventory Main Slake must later emit/link. Not remill. -/
def sourceMain : String := "SystemsLean.SelfHostCompleteMain"

/-- Source path for the named Main (honesty; this writer does not compile it). -/
def sourceMainRel : String := "src/systems/SystemsLean/SelfHostCompleteMain.lean"

/-- Named emit plan. Not dest ELF. Not mill C. Not slake-hello wrap IR. -/
def emitRel : String := "out/slake-host-tool-elf/self-host-complete-main.emit.txt"

/-- Named native IR dump. Not dest ELF. Closed subset of SelfHostCompleteMain. -/
def nativeIrRel : String :=
  "out/slake-host-tool-elf/self-host-complete-main.native-ir.txt"

/-- Named NativeFun.encode sidecar. Not dest ELF. Not ELF magic. -/
def nativeInsnBinRel : String :=
  "out/slake-host-tool-elf/self-host-complete-main.native-insn.bin"

/-- Named x86_64 callNamedMain sidecar. Not dest ELF. Not ELF magic. Not NHIR. -/
def x86_64BinRel : String :=
  "out/slake-host-tool-elf/self-host-complete-main.x86-64.bin"

/-- Named ELF64 ET_REL relocatable object. Not dest. HOST-HOST-TOOL-ELF-REL. -/
def elfRelocRel : String :=
  "out/slake-host-tool-elf/self-host-complete-main.o"

def leftoverNative : String :=
  SystemsLean.SlakeHostToolElfMeasureReloc.leftoverAfterReloc

/-- Result type of a host IO Main (IO UInt32). -/
inductive NativeTy where
  | u32
  | listString
  | io (t : NativeTy)
  deriving DecidableEq, Repr

/-- Host IO Main native insn. Closed subset: argv-forward wrapper only. -/
inductive NativeInsn where
  | callNamedMain (callee : String) (argsBinder : String)
  deriving DecidableEq, Repr

/-- One native function. Closed subset of SystemsLean.SelfHostCompleteMain. -/
structure NativeFun where
  name : String
  params : List String
  retTy : NativeTy
  body : NativeInsn
  deriving DecidableEq, Repr

/-- ASCII type render. Not LLVM. Not mill C. -/
def NativeTy.render : NativeTy -> String
  | .u32 => "u32"
  | .listString => "List String"
  | .io t => "IO " ++ t.render

/-- ASCII insn render. Not clang wrap. -/
def NativeInsn.render : NativeInsn -> String
  | .callNamedMain callee argsBinder =>
    "callNamedMain " ++ callee ++ " " ++ argsBinder

/-- ASCII function render. HOST-HOST-TOOL-NATIVE-IR dump body. -/
def NativeFun.render (f : NativeFun) : String :=
  "fun " ++ f.name ++ "(" ++ String.intercalate "," f.params ++ ") : " ++
    f.retTy.render ++ " := " ++ f.body.render

/-- Little-endian UInt32 of a Nat (low 32 bits). Closed-subset names are short ASCII. -/
def encodeU32le (n : Nat) : ByteArray :=
  ByteArray.mk #[
    UInt8.ofNat (n % 256),
    UInt8.ofNat ((n / 256) % 256),
    UInt8.ofNat ((n / 65536) % 256),
    UInt8.ofNat ((n / 16777216) % 256)
  ]

/-- Little-endian UInt64 of a Nat (low 64 bits). -/
def encodeU64le (n : Nat) : ByteArray :=
  ByteArray.mk #[
    UInt8.ofNat (n % 256),
    UInt8.ofNat ((n / 256) % 256),
    UInt8.ofNat ((n / 65536) % 256),
    UInt8.ofNat ((n / 16777216) % 256),
    UInt8.ofNat ((n / 4294967296) % 256),
    UInt8.ofNat ((n / 1099511627776) % 256),
    UInt8.ofNat ((n / 281474976710656) % 256),
    UInt8.ofNat ((n / 72057594037927936) % 256)
  ]

/-- Length-prefixed UTF-8: u32le byte length, then bytes. -/
def encodeLenStr (s : String) : ByteArray :=
  let b := s.toUTF8
  (encodeU32le b.size).append b

/-- ELF magic 0x7f 'E' 'L' 'F'. -/
def elfMagic : ByteArray := ByteArray.mk #[0x7f, 0x45, 0x4c, 0x46]

/-- True when the first four bytes are ELF magic. -/
def bytesAreElfMagic (b : ByteArray) : Bool :=
  b.size >= 4 && b.extract 0 4 == elfMagic

/-- ASCII tag "NHIR". Not ELF magic 0x7f 0x45 0x4c 0x46. -/
def nativeIrTag : ByteArray := ByteArray.mk #[0x4e, 0x48, 0x49, 0x52]

/--
  Closed-subset native IR encoding. Not machine code. Not an ELF object.
  NativeFun.encode:
    ASCII tag NHIR (4 bytes; not ELF magic)
    u32le name UTF-8 length, name UTF-8
    u32le param count; each param is length-prefixed UTF-8
    NativeTy.encode: tag 0=u32, 1=listString, 2=io then nested ty
    NativeInsn.encode: tag 1=callNamedMain, length-prefixed callee, length-prefixed argsBinder
  Lengths are little-endian UInt32.
-/
def NativeTy.encode : NativeTy -> ByteArray
  | .u32 => ByteArray.mk #[0]
  | .listString => ByteArray.mk #[1]
  | .io t => (ByteArray.mk #[2]).append t.encode

def NativeInsn.encode : NativeInsn -> ByteArray
  | .callNamedMain callee argsBinder =>
    ((ByteArray.mk #[1]).append (encodeLenStr callee)).append (encodeLenStr argsBinder)

def NativeFun.encode (f : NativeFun) : ByteArray :=
  nativeIrTag
    |>.append (encodeLenStr f.name)
    |>.append (encodeU32le f.params.length)
    |>.append (f.params.foldl (fun acc p => acc.append (encodeLenStr p)) (ByteArray.mk #[]))
    |>.append f.retTy.encode
    |>.append f.body.encode

/-- ASCII tag "X64I". Not ELF magic. Not NHIR. Lean-owned x86_64 insn sidecar. -/
def x86_64Tag : ByteArray := ByteArray.mk #[0x58, 0x36, 0x34, 0x49]

/-- CALL rel32 opcode. disp32 at offset 1 is a reloc, not a resolved address. -/
def x86_64CallRel32 : UInt8 := 0xe8

/-- Near RET after CALL rel32 in the argv-forward wrapper. -/
def x86_64Ret : UInt8 := 0xc3

/-- Reloc kind token. Greppable: rel32. -/
def x86_64RelocKindRel32 : String := "rel32"

/--
  x86_64-linux SysV bytes for callNamedMain: CALL rel32 (disp32 0) then RET.
  rdi already holds args. disp32 at +1 is unresolved (reloc to callee).
  Not dest ELF. Not a linked program. Not mill leanc. HOST-HOST-TOOL-X86-64.
-/
def NativeInsn.x86_64Code : NativeInsn -> ByteArray
  | .callNamedMain _callee _argsBinder =>
    ByteArray.mk #[x86_64CallRel32, 0, 0, 0, 0, x86_64Ret]

/-- Reloc offset of CALL rel32 disp32. -/
def NativeInsn.x86_64RelocOffset : NativeInsn -> Nat
  | .callNamedMain _ _ => 1

/-- True when bytes are CALL rel32 + RET (six bytes, opcode 0xe8, last 0xc3). -/
def x86_64CodeOk (b : ByteArray) : Bool :=
  (b.size == 6) &&
    (b.extract 0 1 == ByteArray.mk #[x86_64CallRel32]) &&
    (b.extract 5 6 == ByteArray.mk #[x86_64Ret])

/--
  Tagged x86_64 sidecar. Not ELF. Not NHIR.
  NativeInsn.encodeX86_64:
    ASCII tag X64I (4 bytes; not ELF magic)
    u32le code size, code (CALL rel32 then RET)
    u32le reloc count (1)
    u32le reloc offset (1)
    u8 kind 1=rel32
    length-prefixed callee
-/
def NativeInsn.encodeX86_64 : NativeInsn -> ByteArray
  | insn@(.callNamedMain callee _argsBinder) =>
    let code := insn.x86_64Code
    x86_64Tag
      |>.append (encodeU32le code.size)
      |>.append code
      |>.append (encodeU32le 1)
      |>.append (encodeU32le insn.x86_64RelocOffset)
      |>.append (ByteArray.mk #[1])
      |>.append (encodeLenStr callee)

/-- True when `f` is the argv-forward wrapper of SelfHostCompleteMain. -/
def NativeFun.wellTypedWrapper (f : NativeFun) : Bool :=
  (f.name == "main") &&
    (f.params == ["args"]) &&
    (f.retTy == NativeTy.io NativeTy.u32) &&
    match f.body with
    | NativeInsn.callNamedMain callee argsBinder =>
      (callee == "SystemsLean.SelfHostComplete.main") && (argsBinder == "args")

/-- Well-typed wrapper only. Empty means do not write a fake blob. -/
def NativeFun.encodeX86_64 (f : NativeFun) : ByteArray :=
  if f.wellTypedWrapper then f.body.encodeX86_64 else ByteArray.mk #[]

/-- Closed subset lower of SelfHostCompleteMain. Not SelfHostComplete.main body. -/
def nativeIrClosedSubset : NativeFun :=
  { name := "main"
    params := ["args"]
    retTy := NativeTy.io NativeTy.u32
    body := NativeInsn.callNamedMain "SystemsLean.SelfHostComplete.main" "args" }

theorem nativeIrClosedSubset_wellTyped : nativeIrClosedSubset.wellTypedWrapper = true :=
  rfl

theorem nativeIrClosedSubset_name : nativeIrClosedSubset.name = "main" :=
  rfl

theorem nativeIrClosedSubset_x86_64Code_eq :
  (NativeInsn.x86_64Code nativeIrClosedSubset.body ==
    ByteArray.mk #[0xe8, 0, 0, 0, 0, 0xc3]) = true :=
  rfl

theorem nativeIrClosedSubset_x86_64CodeOk :
  (x86_64CodeOk (NativeInsn.x86_64Code nativeIrClosedSubset.body)) = true :=
  rfl

/-- ELF e_type ET_REL (relocatable). Not ET_EXEC. Not ET_DYN. -/
def elfEtRel : Nat := 1

/-- Greppable e_type name. -/
def elfEtRelName : String := "ET_REL"

/-- ELF machine EM_X86_64. -/
def elfEmX86_64 : Nat := 62

/-- Relocation type R_X86_64_PC32 (CALL rel32 disp). -/
def elfRX86_64Pc32 : Nat := 2

/-- Greppable reloc kind. -/
def elfRelocKindPc32 : String := "R_X86_64_PC32"

/-- Unresolved UND callee in the relocatable object. -/
def elfRelocUndName : String := "SystemsLean.SelfHostComplete.main"

/-- File offset of .text in the closed-subset ET_REL object. -/
def elfRelocTextOff : Nat := 64

/--
  Closed-subset ELF64 LE ET_REL (640 bytes). HOST-HOST-TOOL-ELF-REL.
  Layout: ehdr 64, .text 6 (e8 00 00 00 00 c3), pad 2, .rela.text 24
  (r_offset 1, R_X86_64_PC32, addend -4, UND sym 2), .symtab 72,
  .strtab 40, .shstrtab 44, pad 4, six section headers at 256.
  Not dest. e_type ET_REL (1). Not ET_EXEC. Not ET_DYN.
-/
def elfRelocClosedSubsetBytes : ByteArray :=
  ByteArray.mk #[
    0x7f, 0x45, 0x4c, 0x46, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0x3e, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0x40, 0, 6, 0, 5, 0,
    0xe8, 0, 0, 0, 0, 0xc3, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0,
    0xfc, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    6, 0, 0, 0, 0, 0, 0, 0,
    6, 0, 0, 0, 0x12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0x6d, 0x61, 0x69, 0x6e, 0,
    0x53, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x73, 0x4c, 0x65, 0x61, 0x6e, 0x2e,
    0x53, 0x65, 0x6c, 0x66, 0x48, 0x6f, 0x73, 0x74, 0x43, 0x6f, 0x6d, 0x70,
    0x6c, 0x65, 0x74, 0x65, 0x2e, 0x6d, 0x61, 0x69, 0x6e, 0,
    0,
    0x2e, 0x74, 0x65, 0x78, 0x74, 0,
    0x2e, 0x72, 0x65, 0x6c, 0x61, 0x2e, 0x74, 0x65, 0x78, 0x74, 0,
    0x2e, 0x73, 0x79, 0x6d, 0x74, 0x61, 0x62, 0,
    0x2e, 0x73, 0x74, 0x72, 0x74, 0x61, 0x62, 0,
    0x2e, 0x73, 0x68, 0x73, 0x74, 0x72, 0x74, 0x61, 0x62, 0,
    0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 1, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0x40, 0, 0, 0, 0, 0, 0, 0,
    6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    7, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0x48, 0, 0, 0, 0, 0, 0, 0,
    0x18, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0,
    8, 0, 0, 0, 0, 0, 0, 0, 0x18, 0, 0, 0, 0, 0, 0, 0,
    0x12, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0x60, 0, 0, 0, 0, 0, 0, 0,
    0x48, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 2, 0, 0, 0,
    8, 0, 0, 0, 0, 0, 0, 0, 0x18, 0, 0, 0, 0, 0, 0, 0,
    0x1a, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0xa8, 0, 0, 0, 0, 0, 0, 0,
    0x28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0x22, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0xd0, 0, 0, 0, 0, 0, 0, 0,
    0x2c, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  ]

/--
  HOST-HOST-TOOL-ELF-REL: Lean-owned ELF64 little-endian ET_REL.
  .text is CALL rel32 then RET. Reloc at .text+1, R_X86_64_PC32, addend -4,
  UND SystemsLean.SelfHostComplete.main. Not dest. Not ET_EXEC. Not ET_DYN.
-/
def NativeInsn.encodeElf64Reloc : NativeInsn -> ByteArray
  | .callNamedMain _ _ => elfRelocClosedSubsetBytes

/-- Well-typed wrapper only. Empty means do not write a fake object. -/
def NativeFun.encodeElf64Reloc (f : NativeFun) : ByteArray :=
  if f.wellTypedWrapper then f.body.encodeElf64Reloc else ByteArray.mk #[]

/-- True when bytes are ELF64 ET_REL with CALL rel32 then RET at .text. -/
def elfRelocObjOk (b : ByteArray) : Bool :=
  bytesAreElfMagic b &&
    (b.size >= 70) &&
    (b.extract 16 18 == ByteArray.mk #[1, 0]) &&
    (b.extract 64 70 == ByteArray.mk #[0xe8, 0, 0, 0, 0, 0xc3])

set_option maxRecDepth 8192

theorem elfRelocEncode_magic :
  (bytesAreElfMagic elfRelocClosedSubsetBytes) = true :=
  rfl

theorem elfRelocEncode_etRel :
  (elfRelocClosedSubsetBytes.extract 16 18 == ByteArray.mk #[1, 0]) = true :=
  rfl

theorem elfRelocEncode_text :
  (elfRelocClosedSubsetBytes.extract 64 70 ==
    ByteArray.mk #[0xe8, 0, 0, 0, 0, 0xc3]) = true :=
  rfl

theorem elfRelocRel_ne_destRel : (elfRelocRel == destRel) = false :=
  rfl

/-- Greppable native IR dump (typed closed subset). Not dest ELF. -/
def nativeIrText : String :=
  "HOST-HOST-TOOL-NATIVE-IR\n" ++
    "SLAKE_HOST_TOOL_ELF_V0 / HOST-SLAKE-HOST-TOOL-ELF\n" ++
    "source Main: SystemsLean.SelfHostCompleteMain\n" ++
    "closed subset: argv-forward wrapper only\n" ++
    nativeIrClosedSubset.render ++ "\n" ++
    "honesty: not dest ELF; not mill leanc; not remill mill 69; " ++
    "not slake-hello clang wrap; not full SelfHostComplete body\n" ++
    leftoverNative ++ "\n"

/-- Native IR for that Main. Closed-subset wrapper. Not Compose SSA. Not ELF. -/
def nativeIrForSourceMain : Option String := some nativeIrText

theorem nativeIrForSourceMain_isSome : nativeIrForSourceMain.isSome = true :=
  rfl

/-- Mill directory needle. Dest containing this is dishonest. -/
def millPathNeedle : String := "first-host-tool"

/-- Clang-wrap generator dest. This writer must not reuse it. -/
def helloNeedle : String := "slake-hello"

/-- leanc needle. This writer does not call leanc. -/
def leancNeedle : String := "leanc"

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Dest path is mill, leanc, or slake-hello (forbidden). -/
def isForbiddenDest (p : String) : Bool :=
  containsSub p millPathNeedle || containsSub p leancNeedle || containsSub p helloNeedle

theorem nativeIrTag_ne_elfMagic : (nativeIrTag == elfMagic) = false :=
  rfl

theorem x86_64Tag_ne_elfMagic : (x86_64Tag == elfMagic) = false :=
  rfl

theorem nativeIrClosedSubset_encodeX86_64_not_elf :
  (bytesAreElfMagic nativeIrClosedSubset.encodeX86_64) = false :=
  rfl

/-- Lean-owned emit plan. Body lives in the measure ET_REL helper (printer split). -/
def slakeHostToolElfEmitPlan : String :=
  SystemsLean.SlakeHostToolElfMeasureReloc.emitPlanText

/-- Fail closed if dest would be mill, leanc, or slake-hello. -/
def rejectForbiddenDest (label dest : String) : IO Unit := do
  if isForbiddenDest dest then
    IO.eprintln s!"error: {label}: dest is forbidden (mill, leanc, or slake-hello): {dest}"
    throw (IO.userError s!"{label}: forbidden dest")

/-- First four bytes equal ELF magic. -/
def isElfMagic (p : System.FilePath) : IO Bool := do
  let bytes <-
    try
      IO.FS.readBinFile p
    catch _ =>
      return false
  if bytes.size < 4 then
    return false
  pure (bytes.extract 0 4 == elfMagic)

/-- Print dest, source Main, leftover. Not wrap IR. Not an ELF. -/
def slakeHostToolElfPrint : IO Unit := do
  IO.println s!"{stageId} / HOST-SLAKE-HOST-TOOL-ELF"
  IO.println s!"  dest: {destRel}"
  IO.println s!"  source Main: {sourceMain}"
  IO.println s!"  source path: {sourceMainRel}"
  IO.println s!"  emit plan: {emitRel}"
  IO.println s!"  native IR: {nativeIrRel}"
  IO.println s!"HOST-HOST-TOOL-MEASURE-IR {SystemsLean.SlakeHostToolElfMeasure.measureNativeIrRel}"
  IO.println "HOST-HOST-TOOL-MEASURE-GREEN GREEN/fail-closed plus main catch"
  IO.println s!"HOST-HOST-TOOL-MEASURE-X86 {SystemsLean.SlakeHostToolElfMeasureX86.measureX86Rel}"
  IO.println
    ("HOST-HOST-TOOL-MEASURE-FIELDS-X86 " ++
      SystemsLean.SlakeHostToolElfMeasureFieldsX86.measureFieldsX86Rel)
  IO.println
    ("HOST-HOST-TOOL-MEASURE-REL " ++
      SystemsLean.SlakeHostToolElfMeasureReloc.measureRelocRel)
  IO.println s!"  native insn: {nativeInsnBinRel}"
  IO.println s!"  x86_64: {x86_64BinRel}"
  IO.println s!"  elf reloc: {elfRelocRel}"
  IO.println s!"  elf callee: {SystemsLean.SlakeHostToolElfLink.calleeRelocRel}"
  IO.println s!"  link plan: {SystemsLean.SlakeHostToolElfLink.linkPlanRel}"
  IO.println "  HOST-HOST-TOOL-NATIVE-IR: closed-subset argv-forward wrapper"
  IO.println "  HOST-HOST-TOOL-NATIVE-INSN: NativeFun.encode sidecar (not dest ELF)"
  IO.println "  HOST-HOST-TOOL-X86-64: callNamedMain CALL rel32 unresolved (not dest ELF)"
  IO.println "  HOST-HOST-TOOL-ELF-REL: ELF64 ET_REL sidecar (not dest; unresolved rel32)"
  IO.println "  HOST-HOST-TOOL-ELF-LINK: wrapper plus callee to dest ET_EXEC"
  IO.println "  HOST-HOST-TOOL-ELF-UND: SystemsLean.SelfHostComplete.main resolved"
  IO.println "  HOST-HOST-TOOL-ELF-EXEC: dest is ELF64 ET_EXEC (not ET_REL)"
  IO.println s!"  just recipe: {justRecipeName}"
  IO.println s!"  {leftoverNative}"
  IO.println "  honesty: not mill leanc; not remill mill 69; not slake-hello clang wrap"
  IO.println "  pins: FullHost false; slakeOwnsPackageTypecheck false; occupancy 49"

/-- Fail closed if named Main source is missing or is not a Main. -/
def requireSourceMain (root : System.FilePath) : IO Unit := do
  let p := root / sourceMainRel
  unless (<- p.pathExists) do
    IO.eprintln s!"error: {stageId}: missing source Main {p}"
    throw (IO.userError s!"{stageId}: missing source Main")
  let got <- IO.FS.readFile p
  unless (containsSub got "def main") do
    IO.eprintln s!"error: {stageId}: source Main missing def main: {p}"
    throw (IO.userError s!"{stageId}: source Main has no def main")
  unless (containsSub got "SystemsLean.SelfHostComplete") do
    IO.eprintln s!"error: {stageId}: source Main missing SystemsLean.SelfHostComplete: {p}"
    throw (IO.userError s!"{stageId}: source Main import")

/-- Write named emit plan and closed-subset native IR. Does not write dest ELF. -/
def slakeHostToolElfEmit (root : System.FilePath) : IO Unit := do
  let dest := root / destRel
  let emit := root / emitRel
  let nir := root / nativeIrRel
  let encPath := root / nativeInsnBinRel
  let x64Path := root / x86_64BinRel
  let relPath := root / elfRelocRel
  let calleePath := root / SystemsLean.SlakeHostToolElfLink.calleeRelocRel
  let linkPath := root / SystemsLean.SlakeHostToolElfLink.linkPlanRel
  let measRelPath :=
    root / SystemsLean.SlakeHostToolElfMeasureReloc.measureRelocRel
  rejectForbiddenDest stageId dest.toString
  rejectForbiddenDest stageId emit.toString
  rejectForbiddenDest stageId nir.toString
  rejectForbiddenDest stageId encPath.toString
  rejectForbiddenDest stageId x64Path.toString
  rejectForbiddenDest stageId relPath.toString
  rejectForbiddenDest stageId calleePath.toString
  rejectForbiddenDest stageId linkPath.toString
  rejectForbiddenDest stageId measRelPath.toString
  if nativeInsnBinRel == destRel then
    IO.eprintln s!"error: {stageId}: encode sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: encode sidecar is dest")
  if x86_64BinRel == destRel then
    IO.eprintln s!"error: {stageId}: x86_64 sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: x86_64 sidecar is dest")
  if elfRelocRel == destRel then
    IO.eprintln s!"error: {stageId}: ET_REL sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: ET_REL sidecar is dest")
  if SystemsLean.SlakeHostToolElfLink.calleeRelocRel == destRel then
    IO.eprintln s!"error: {stageId}: callee ET_REL sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: callee sidecar is dest")
  if SystemsLean.SlakeHostToolElfLink.linkPlanRel == destRel then
    IO.eprintln s!"error: {stageId}: link plan must not be dest ELF"
    throw (IO.userError s!"{stageId}: link plan is dest")
  if SystemsLean.SlakeHostToolElfMeasureReloc.measureRelocRel == destRel then
    IO.eprintln s!"error: {stageId}: measure ET_REL sidecar must not be dest ELF"
    throw (IO.userError s!"{stageId}: measure ET_REL sidecar is dest")
  requireSourceMain root
  unless nativeIrClosedSubset.wellTypedWrapper do
    IO.eprintln s!"error: {stageId}: closed-subset native IR is not a well-typed wrapper"
    throw (IO.userError s!"{stageId}: native IR ill-typed")
  match nativeIrForSourceMain with
  | none => do
    IO.eprintln s!"error: {stageId}: native IR missing for closed subset"
    throw (IO.userError s!"{stageId}: native IR none")
  | some ir => do
    -- Closed-subset IR is not a license to clang-wrap Compose SSA or call leanc.
    if let some parent := nir.parent then
      IO.FS.createDirAll parent
    IO.FS.writeFile nir ir
    let got <- IO.FS.readFile nir
    if got != ir then
      IO.eprintln s!"error: {stageId}: native IR write mismatch"
      throw (IO.userError s!"{stageId}: native IR mismatch")
    if (<- isElfMagic nir) then
      IO.eprintln s!"error: {stageId}: native IR must not be ELF magic: {nir}"
      throw (IO.userError s!"{stageId}: native IR is ELF")
    IO.println s!"{stageId}: wrote HOST-HOST-TOOL-NATIVE-IR {nir}"
  SystemsLean.SlakeHostToolElfMeasure.writeMeasureNativeIr root
  SystemsLean.SlakeHostToolElfMeasureX86.writeMeasureX86 root
  SystemsLean.SlakeHostToolElfMeasureFieldsX86.writeMeasureFieldsX86 root
  SystemsLean.SlakeHostToolElfMeasureReloc.writeMeasureReloc root
  let enc := nativeIrClosedSubset.encode
  if bytesAreElfMagic enc then
    IO.eprintln s!"error: {stageId}: NativeFun.encode must not be ELF magic"
    throw (IO.userError s!"{stageId}: encode is ELF")
  if let some parent := encPath.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile encPath enc
  let gotEnc <- IO.FS.readBinFile encPath
  if gotEnc != enc then
    IO.eprintln s!"error: {stageId}: NativeFun.encode write mismatch"
    throw (IO.userError s!"{stageId}: encode mismatch")
  if (<- isElfMagic encPath) then
    IO.eprintln s!"error: {stageId}: NativeFun.encode sidecar must not be ELF magic: {encPath}"
    throw (IO.userError s!"{stageId}: encode sidecar is ELF")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-NATIVE-INSN {encPath}"
  let x64 := nativeIrClosedSubset.encodeX86_64
  let code := NativeInsn.x86_64Code nativeIrClosedSubset.body
  unless x86_64CodeOk code do
    IO.eprintln s!"error: {stageId}: x86_64 callNamedMain bytes are not CALL rel32 then RET"
    throw (IO.userError s!"{stageId}: x86_64 code")
  if x64.size == 0 then
    IO.eprintln s!"error: {stageId}: NativeFun.encodeX86_64 empty"
    throw (IO.userError s!"{stageId}: x86_64 empty")
  if bytesAreElfMagic x64 then
    IO.eprintln s!"error: {stageId}: NativeInsn.encodeX86_64 must not be ELF magic"
    throw (IO.userError s!"{stageId}: x86_64 is ELF")
  if let some parent := x64Path.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile x64Path x64
  let gotX64 <- IO.FS.readBinFile x64Path
  if gotX64 != x64 then
    IO.eprintln s!"error: {stageId}: NativeInsn.encodeX86_64 write mismatch"
    throw (IO.userError s!"{stageId}: x86_64 mismatch")
  if (<- isElfMagic x64Path) then
    IO.eprintln s!"error: {stageId}: x86_64 sidecar must not be ELF magic: {x64Path}"
    throw (IO.userError s!"{stageId}: x86_64 sidecar is ELF")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-X86-64 {x64Path}"
  let relObj := NativeInsn.encodeElf64Reloc nativeIrClosedSubset.body
  if relObj.size == 0 then
    IO.eprintln s!"error: {stageId}: NativeInsn.encodeElf64Reloc empty"
    throw (IO.userError s!"{stageId}: ET_REL empty")
  unless elfRelocObjOk relObj do
    IO.eprintln s!"error: {stageId}: ET_REL object missing ELF magic, ET_REL e_type, or CALL rel32 RET"
    throw (IO.userError s!"{stageId}: ET_REL object")
  unless bytesAreElfMagic relObj do
    IO.eprintln s!"error: {stageId}: ET_REL object must start with ELF magic"
    throw (IO.userError s!"{stageId}: ET_REL magic")
  unless (relObj.extract 64 70 == code) do
    IO.eprintln s!"error: {stageId}: ET_REL .text is not CALL rel32 then RET"
    throw (IO.userError s!"{stageId}: ET_REL text")
  if let some parent := relPath.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile relPath relObj
  let gotRel <- IO.FS.readBinFile relPath
  if gotRel != relObj then
    IO.eprintln s!"error: {stageId}: ET_REL object write mismatch"
    throw (IO.userError s!"{stageId}: ET_REL mismatch")
  unless (<- isElfMagic relPath) do
    IO.eprintln s!"error: {stageId}: ET_REL sidecar must be ELF magic: {relPath}"
    throw (IO.userError s!"{stageId}: ET_REL sidecar not ELF")
  unless elfRelocObjOk gotRel do
    IO.eprintln s!"error: {stageId}: ET_REL sidecar failed object checks"
    throw (IO.userError s!"{stageId}: ET_REL sidecar")
  if (<- dest.pathExists) then
    let destNow <- IO.FS.readBinFile dest
    let priorEtExec :=
      destNow.size >= 18 &&
        SystemsLean.SlakeHostToolElfLink.bytesAreElfMagic destNow &&
        (destNow.extract 16 18 == ByteArray.mk #[2, 0]) &&
        !SystemsLean.SlakeHostToolElfLink.destIsEtRel destNow &&
        !SystemsLean.SlakeHostToolElfLink.destLooksLikeMillCopy destNow &&
        !SystemsLean.SlakeHostToolElfMeasureReloc.millSizedCopy destNow
    unless (SystemsLean.SlakeHostToolElfMeasureReloc.elfExecOneFunctionOk destNow ||
        SystemsLean.SlakeHostToolElfLink.elfExecObjOk destNow ||
        priorEtExec) do
      IO.eprintln s!"error: {stageId}: existing dest is not closed-subset ET_EXEC: {dest}"
      throw (IO.userError s!"{stageId}: dest exists but not ET_EXEC")
  let stillX64 <- IO.FS.readBinFile x64Path
  unless (stillX64.extract 0 4 == x86_64Tag) do
    IO.eprintln s!"error: {stageId}: x86_64 sidecar must still be X64I (not dest, not ELF copy)"
    throw (IO.userError s!"{stageId}: x86_64 not X64I")
  if (<- isElfMagic x64Path) then
    IO.eprintln s!"error: {stageId}: x86_64 sidecar must not become ELF magic: {x64Path}"
    throw (IO.userError s!"{stageId}: x86_64 became ELF")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-ELF-REL {relPath}"
  let calleeObj := SystemsLean.SlakeHostToolElfLink.encodeElf64RelocCallee
  if calleeObj.size == 0 then
    IO.eprintln s!"error: {stageId}: callee ET_REL empty"
    throw (IO.userError s!"{stageId}: callee empty")
  unless SystemsLean.SlakeHostToolElfLink.elfCalleeRelocOk calleeObj do
    IO.eprintln s!"error: {stageId}: callee ET_REL missing ELF magic, ET_REL e_type, or xor-ret"
    throw (IO.userError s!"{stageId}: callee object")
  if SystemsLean.SlakeHostToolElfLink.destIsEtRel calleeObj then
    pure ()
  else
    IO.eprintln s!"error: {stageId}: callee sidecar must stay ET_REL"
    throw (IO.userError s!"{stageId}: callee not ET_REL")
  if let some parent := calleePath.parent then
    IO.FS.createDirAll parent
  IO.FS.writeBinFile calleePath calleeObj
  let gotCallee <- IO.FS.readBinFile calleePath
  if gotCallee != calleeObj then
    IO.eprintln s!"error: {stageId}: callee ET_REL write mismatch"
    throw (IO.userError s!"{stageId}: callee mismatch")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-ELF-UND callee {calleePath}"
  SystemsLean.SlakeHostToolElfMeasureReloc.writeOneFunction root
  if let some parent := linkPath.parent then
    IO.FS.createDirAll parent
  IO.FS.writeFile linkPath SystemsLean.SlakeHostToolElfLink.linkPlanText
  let gotLink <- IO.FS.readFile linkPath
  if gotLink != SystemsLean.SlakeHostToolElfLink.linkPlanText then
    IO.eprintln s!"error: {stageId}: link plan write mismatch"
    throw (IO.userError s!"{stageId}: link plan mismatch")
  if (<- isElfMagic linkPath) then
    IO.eprintln s!"error: {stageId}: link plan must not be ELF magic: {linkPath}"
    throw (IO.userError s!"{stageId}: link plan is ELF")
  IO.println s!"{stageId}: wrote HOST-HOST-TOOL-ELF-LINK {linkPath}"
  if let some parent := emit.parent then
    IO.FS.createDirAll parent
  IO.FS.writeFile emit slakeHostToolElfEmitPlan
  let written <- IO.FS.readFile emit
  if written != slakeHostToolElfEmitPlan then
    IO.eprintln s!"error: {stageId}: emit plan write mismatch"
    throw (IO.userError s!"{stageId}: emit mismatch")
  if (<- isElfMagic emit) then
    IO.eprintln s!"error: {stageId}: emit plan must not be ELF magic: {emit}"
    throw (IO.userError s!"{stageId}: emit is ELF")
  IO.println s!"{stageId}: wrote emit plan {emit}"
  IO.println s!"  {leftoverNative}"
  IO.println "  honesty: not mill leanc; not remill mill 69; not slake-hello clang wrap"
  IO.println "  dest is ET_EXEC; ET_REL sidecars are not dest ELF"

/-- Fail closed unless dest is a real linked ET_EXEC. Body lives in the measure helper. -/
def slakeHostToolElfCheck (root : System.FilePath) : IO Unit := do
  rejectForbiddenDest stageId (root / destRel).toString
  SystemsLean.SlakeHostToolElfMeasureReloc.checkDest root

/-- Write emit plan, callee ET_REL, dest ET_EXEC, then dest check. -/
def slakeHostToolElfWrite (root : System.FilePath) : IO Unit := do
  slakeHostToolElfEmit root
  slakeHostToolElfCheck root

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: check dest (default), write (same fail-closed), or print dest/source. -/
def slakeHostToolElfMain (args : List String) : IO UInt32 := do
  let rest := filterArgs args
  let root : System.FilePath :=
    match rest with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  let mode : String :=
    match rest with
    | _ :: m :: _ => m
    | _ => "check"
  try
    match mode with
    | "print" => do
      slakeHostToolElfPrint
      pure 0
    | "check" => do
      slakeHostToolElfCheck root
      pure 0
    | "write" => do
      slakeHostToolElfWrite root
      pure 0
    | other => do
      IO.eprintln s!"error: {stageId}: unknown mode {other} (want check|write|print)"
      pure 1
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.SlakeHostToolElf

/-- lean --run entry (no mill row, no lake exe). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.SlakeHostToolElf.slakeHostToolElfMain args
"#

end SystemsLean.HostFrontLiveSlakeHostToolElf
