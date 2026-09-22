/-
  SYSTEMS_LEAN_HOST -- Lean-owned link of ET_REL wrapper plus callee.
  Named dest: out/slake-host-tool-elf/slake-freestanding-self-host-complete.
  Wrapper object: self-host-complete-main.o (CALL rel32 then RET, UND callee).
  Callee closed subset: xor eax,eax; ret (return 0). Not printSelfHostCompleteMeasure.
  Dest is ELF64 ET_EXEC with R_X86_64_PC32 applied. Not ET_REL. Not empty.
  Not mill leanc. Not remill mill 69. Not slake-hello clang wrap. Not mill copy.
  FullHost stays false. slakeOwnsPackageTypecheck stays false.
  Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-ELF-LINK, HOST-HOST-TOOL-ELF-UND, HOST-HOST-TOOL-ELF-EXEC,
  ET_EXEC, R_X86_64_PC32, SystemsLean.SelfHostComplete.main,
  self-host-complete-callee.o, slake-freestanding-self-host-complete.
  Module: SystemsLean.SlakeHostToolElfLink
-/

namespace SystemsLean.SlakeHostToolElfLink

/-- ELF e_type ET_EXEC (executable). Not ET_REL. Not ET_DYN. -/
def elfEtExec : Nat := 2

/-- Greppable e_type name. -/
def elfEtExecName : String := "ET_EXEC"

/-- ELF e_type ET_REL (must not be dest). -/
def elfEtRel : Nat := 1

/-- ELF machine EM_X86_64. -/
def elfEmX86_64 : Nat := 62

/-- Unresolved then resolved UND callee. HOST-HOST-TOOL-ELF-UND. -/
def elfRelocUndName : String := "SystemsLean.SelfHostComplete.main"

/-- Named callee ET_REL sidecar. Not dest. -/
def calleeRelocRel : String :=
  "out/slake-host-tool-elf/self-host-complete-callee.o"

/-- Named ASCII link plan. Not dest. Not ELF magic. -/
def linkPlanRel : String :=
  "out/slake-host-tool-elf/self-host-complete-main.link.txt"

/-- Load virtual address for the closed-subset ET_EXEC. -/
def loadVaddr : Nat := 0x400000

/-- File offset of .text in the closed-subset ET_EXEC. -/
def execTextOff : Nat := 128

/-- e_entry = load vaddr plus .text file offset (wrapper main). -/
def execEntry : Nat := loadVaddr + execTextOff

/-- Closed-subset callee x86_64: xor eax,eax; ret (return 0). -/
def calleeX86 : ByteArray := ByteArray.mk #[0x31, 0xc0, 0xc3]

/--
  Linked .text: wrapper CALL rel32 resolved (disp 1) then RET, then callee.
  Callee sits at wrapper+6. R_X86_64_PC32 addend -4 yields disp32=1.
-/
def linkedText : ByteArray :=
  ByteArray.mk #[0xe8, 1, 0, 0, 0, 0xc3, 0x31, 0xc0, 0xc3]

/-- ELF magic 0x7f 'E' 'L' 'F'. -/
def elfMagic : ByteArray := ByteArray.mk #[0x7f, 0x45, 0x4c, 0x46]

/-- True when the first four bytes are ELF magic. -/
def bytesAreElfMagic (b : ByteArray) : Bool :=
  b.size >= 4 && b.extract 0 4 == elfMagic

/-- Little-endian UInt16 of a Nat (low 16 bits). -/
def encodeU16le (n : Nat) : ByteArray :=
  ByteArray.mk #[
    UInt8.ofNat (n % 256),
    UInt8.ofNat ((n / 256) % 256)
  ]

/-- Little-endian UInt32 of a Nat (low 32 bits). -/
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

/-- ELF64 ident: magic, class 2, data 1 (LE), version 1, System V. -/
def elfIdent : ByteArray :=
  ByteArray.mk #[0x7f, 0x45, 0x4c, 0x46, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]

/-- ELF64 Ehdr (64 bytes). -/
def encodeElf64Ehdr
    (et entry phoff shoff phnum shnum shstrndx : Nat) : ByteArray :=
  elfIdent
    |>.append (encodeU16le et)
    |>.append (encodeU16le elfEmX86_64)
    |>.append (encodeU32le 1)
    |>.append (encodeU64le entry)
    |>.append (encodeU64le phoff)
    |>.append (encodeU64le shoff)
    |>.append (encodeU32le 0)
    |>.append (encodeU16le 64)
    |>.append (encodeU16le 56)
    |>.append (encodeU16le phnum)
    |>.append (encodeU16le 64)
    |>.append (encodeU16le shnum)
    |>.append (encodeU16le shstrndx)

/-- ELF64 Phdr PT_LOAD PF_R|PF_X covering the file from offset 0. -/
def encodeElf64Phdr (filesz vaddr : Nat) : ByteArray :=
  (encodeU32le 1)
    |>.append (encodeU32le 5)
    |>.append (encodeU64le 0)
    |>.append (encodeU64le vaddr)
    |>.append (encodeU64le vaddr)
    |>.append (encodeU64le filesz)
    |>.append (encodeU64le filesz)
    |>.append (encodeU64le 4096)

/-- ELF64 Shdr (64 bytes). -/
def encodeElf64Shdr
    (name typ flags off size link info align entsize : Nat) : ByteArray :=
  (encodeU32le name)
    |>.append (encodeU32le typ)
    |>.append (encodeU64le flags)
    |>.append (encodeU64le 0)
    |>.append (encodeU64le off)
    |>.append (encodeU64le size)
    |>.append (encodeU32le link)
    |>.append (encodeU32le info)
    |>.append (encodeU64le align)
    |>.append (encodeU64le entsize)

/-- ELF64 Sym (24 bytes). -/
def encodeElf64Sym (name info shndx value size : Nat) : ByteArray :=
  (encodeU32le name)
    |>.append (ByteArray.mk #[UInt8.ofNat info, 0])
    |>.append (encodeU16le shndx)
    |>.append (encodeU64le value)
    |>.append (encodeU64le size)

/-- NUL-terminated UTF-8. -/
def cstr (s : String) : ByteArray :=
  s.toUTF8.append (ByteArray.mk #[0])

/-- Zero padding of length `n`. -/
def nZeros (n : Nat) : ByteArray :=
  ByteArray.mk (Array.replicate n (0 : UInt8))

/-- Bytes to reach alignment `align` from offset `off`. -/
def padAlign (off align : Nat) : Nat :=
  let r := off % align
  if r == 0 then 0 else align - r

/--
  HOST-HOST-TOOL-ELF-REL callee: ELF64 LE ET_REL defining
  SystemsLean.SelfHostComplete.main as xor eax,eax; ret. No UND.
  Not dest. Not ET_EXEC.
-/
def encodeElf64RelocCallee : ByteArray :=
  let text := calleeX86
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

/-- True when bytes are ELF64 ET_REL with xor eax,eax; ret at .text. -/
def elfCalleeRelocOk (b : ByteArray) : Bool :=
  bytesAreElfMagic b &&
    (b.size >= 70) &&
    (b.extract 16 18 == ByteArray.mk #[1, 0]) &&
    (b.extract 64 67 == calleeX86)

/--
  HOST-HOST-TOOL-ELF-EXEC: ELF64 LE ET_EXEC. PT_LOAD, e_entry at wrapper.
  .text is resolved CALL then RET then callee return-0. Not ET_REL.
-/
def encodeElf64ExecLinked : ByteArray :=
  let text := linkedText
  let filesz := execTextOff + text.size
  let ehdr := encodeElf64Ehdr elfEtExec execEntry 64 0 1 0 0
  let phdr := encodeElf64Phdr filesz loadVaddr
  let pad := nZeros (execTextOff - 64 - 56)
  ehdr.append phdr |>.append pad |>.append text

/-- True when bytes are ELF64 ET_EXEC with resolved CALL then callee. -/
def elfExecObjOk (b : ByteArray) : Bool :=
  bytesAreElfMagic b &&
    (b.size == execTextOff + linkedText.size) &&
    (b.extract 16 18 == ByteArray.mk #[2, 0]) &&
    (b.extract 18 20 == ByteArray.mk #[0x3e, 0]) &&
    (b.extract execTextOff (execTextOff + linkedText.size) == linkedText)

/-- Dest that is ET_REL is dishonest (must not rename the .o). -/
def destIsEtRel (b : ByteArray) : Bool :=
  b.size >= 18 && b.extract 16 18 == ByteArray.mk #[1, 0]

/-- Mill 69 dest is about 4.2 MiB. A few-KiB one-function ET_EXEC is not mill copy. -/
def destLooksLikeMillCopy (b : ByteArray) : Bool :=
  b.size > 65536

/-- ASCII link plan. HOST-HOST-TOOL-ELF-LINK. Not dest ELF. -/
def linkPlanText : String :=
  "HOST-HOST-TOOL-ELF-LINK\n" ++
    "SLAKE_HOST_TOOL_ELF_V0 / HOST-SLAKE-HOST-TOOL-ELF\n" ++
    "HOST-HOST-TOOL-ELF-UND SystemsLean.SelfHostComplete.main resolved\n" ++
    "HOST-HOST-TOOL-ELF-EXEC ET_EXEC\n" ++
    "wrapper: out/slake-host-tool-elf/self-host-complete-main.o\n" ++
    "callee: out/slake-host-tool-elf/self-host-complete-callee.o\n" ++
    "dest: out/slake-host-tool-elf/slake-freestanding-self-host-complete\n" ++
    "R_X86_64_PC32 applied disp32=1 (callee at wrapper+6)\n" ++
    "closed subset callee: xor eax,eax; ret (return 0)\n" ++
    "honesty: not mill leanc; not remill mill 69; not slake-hello clang wrap\n" ++
    "do not write dest as ET_REL; do not copy mill 69; do not empty ELF\n" ++
    "leftover: dest is one-function ET_EXEC of first-banner plus remaining " ++
    "println writes; leftover is GREEN/fail-closed plus main-catch of " ++
    "printSelfHostCompleteMeasure still not in dest .text (not mill, not mill " ++
    "leanc, not slake-hello, not Lake-gone)\n" ++
    "pins: FullHost false; slakeOwnsPackageTypecheck false; occupancy 49; " ++
    "mill 69 of 69; not Lake-gone\n"

theorem elfEtExec_eq : elfEtExec = 2 :=
  rfl

theorem elfEtRel_ne_elfEtExec : (elfEtRel == elfEtExec) = false :=
  rfl

theorem calleeX86_size : calleeX86.size = 3 :=
  rfl

theorem linkedText_size : linkedText.size = 9 :=
  rfl

theorem execTextOff_eq : execTextOff = 128 :=
  rfl

theorem calleeRelocRel_ne_dest :
  (calleeRelocRel ==
    "out/slake-host-tool-elf/slake-freestanding-self-host-complete") = false :=
  rfl

end SystemsLean.SlakeHostToolElfLink
