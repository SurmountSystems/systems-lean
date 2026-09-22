/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SlakeHostToolElfMainCatchDest.lean bytes.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDestSource
  Greppable: SYSTEMS_LEAN_HOST, liveSlakeHostToolElfMainCatchDestSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69. Not a remill.
  Not Lake-gone. slakeOwnsPackageTypecheck stays false. FullBackend stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest

/-- Dual-pinned live SlakeHostToolElfMainCatchDest.lean bytes.
    Greppable: liveSlakeHostToolElfMainCatchDestSource. -/
def liveSlakeHostToolElfMainCatchDestSource : String := r#"/-
  SYSTEMS_LEAN_HOST -- dest-safe MainCatch x86 on extra-argv / catch path.
  Sidecar stays X64I (SlakeHostToolElfMainCatchX86). This helper is dest .text.
  Catch lives in CatchReturn.withCatch; SelfHostComplete.main uses it.
  Dest extra-argv encodes those catch strings; extra-argv is still not Lean throw.
  Dest extra-argv takes catch eprint then sys_exit(1). Ok-true default argv
  skips this block. Dest does not ret from process entry.
  Do not import SystemsLean.SelfHostComplete (too fat). Do not import
  MeasureReloc (cycle). Not mill leanc. Not remill mill 69. Not slake-hello.
  FullHost stays false. slakeOwnsPackageTypecheck stays false.
  occupancy 49. Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-MAIN-CATCH, HOST-HOST-TOOL-MAIN-CATCH-DEST, HOST-HOST-TOOL-EPRINT,
  HOST-HOST-TOOL-CATCH, extraArgvCatch, destCatchEprint, destCatchReturn1,
  CatchInsn.x86_64Code.
  Module: SystemsLean.SlakeHostToolElfMainCatchDest
-/

import SystemsLean.SlakeHostToolElfMainCatchX86

namespace SystemsLean.SlakeHostToolElfMainCatchDest

open SystemsLean.SlakeHostToolElfMainCatchX86 (
  catchX86Code eprintPrefix payloadBytes payloadLen return1Code encodeU32le
  x86_64CodeOk x86_64Tag)

/-- Greppable stage id (same writer family). -/
def stageId : String := "SLAKE_HOST_TOOL_ELF_V0"

/-- Dest extra-argv MainCatch stage. Distinct from X64I sidecar. -/
def destCatchStage : String := "HOST-HOST-TOOL-MAIN-CATCH-DEST"

/-- Named dest. This helper does not write that path. -/
def destRel : String :=
  "out/slake-host-tool-elf/slake-freestanding-self-host-complete"

/-- Tagged catch x86 sidecar. Must stay X64I. Not dest. -/
def catchX86Rel : String :=
  "out/slake-host-tool-elf/self-host-complete-main-catch.x86-64.bin"

theorem catchX86Rel_ne_destRel : (catchX86Rel == destRel) = false :=
  rfl

/-- ASCII tag X64I. Sidecar stays this. Dest ELF must not start with this. -/
def sidecarTag : ByteArray := x86_64Tag

/-- x86_64 Linux sys_exit(1). Dest catch terminator. Not SysV ret. -/
def abortSyscall : ByteArray :=
  ByteArray.mk #[0xbf, 0x01, 0x00, 0x00, 0x00, 0xb8, 0x3c, 0x00, 0x00, 0x00, 0x0f, 0x05]

/-- cmp qword [rsp], 1. Extra-argv gate. Not completeOk stand-in. -/
def cmpArgcOne : ByteArray := ByteArray.mk #[0x48, 0x83, 0x3c, 0x24, 0x01]

/-- je rel8 over n-byte payload. n must be <= 127. -/
def encodeJeRel8 (n : Nat) : ByteArray :=
  ByteArray.mk #[0x74, UInt8.ofNat n]

/--
  Dest-safe MainCatch eprint: same write prefix as sidecar (fd 2), LEA disp 9
  so syscall is followed by jmp-over-payload, then catchEprint plus newline.
  Sidecar uses disp 7 and falls into payload; dest must not. No ret.
-/
def destCatchEprint : ByteArray :=
  (ByteArray.mk #[
      0xb8, 0x01, 0x00, 0x00, 0x00,
      0xbf, 0x02, 0x00, 0x00, 0x00,
      0x48, 0x8d, 0x35, 0x09, 0x00, 0x00, 0x00,
      0xba
    ]).append (encodeU32le payloadLen)
    |>.append (ByteArray.mk #[0x0f, 0x05, 0xeb, UInt8.ofNat payloadLen])
    |>.append payloadBytes

/-- MainCatch dest catch: eprint then sys_exit(1). Not mov eax,1; ret. -/
def destCatchReturn1 : ByteArray :=
  destCatchEprint.append abortSyscall

/--
  Extra-argv / catch path: argc==1 skips destCatchReturn1; extra argv takes
  MainCatch dest eprint then sys_exit(1). HOST-HOST-TOOL-CATCH.
-/
def extraArgvCatch : ByteArray :=
  cmpArgcOne.append (encodeJeRel8 destCatchReturn1.size) |>.append destCatchReturn1

/-- True when b is dest-safe MainCatch eprint (prefix, jmp, payload). -/
def destCatchEprintOk (b : ByteArray) : Bool :=
  let pre := eprintPrefix payloadLen
  (payloadLen <= 127) &&
    (b.size == 26 + payloadLen) &&
    (b.extract 0 13 == pre.extract 0 13) &&
    (b.extract 13 17 == ByteArray.mk #[0x09, 0x00, 0x00, 0x00]) &&
    (b.extract 17 22 == pre.extract 17 22) &&
    (b.extract 22 24 == ByteArray.mk #[0x0f, 0x05]) &&
    (b.extract 24 26 == ByteArray.mk #[0xeb, UInt8.ofNat payloadLen]) &&
    (b.extract 26 b.size == payloadBytes) &&
    ((b.extract (b.size - return1Code.size) b.size == return1Code) = false)

/-- True when b is extra-argv MainCatch dest catch plus sys_exit(1). -/
def extraArgvCatchOk (b : ByteArray) : Bool :=
  let je := encodeJeRel8 destCatchReturn1.size
  (destCatchReturn1.size <= 127) &&
    destCatchEprintOk destCatchEprint &&
    x86_64CodeOk catchX86Code &&
    (b.size == 5 + 2 + destCatchReturn1.size) &&
    (b.extract 0 5 == cmpArgcOne) &&
    (b.extract 5 7 == je) &&
    (b.extract 7 (7 + destCatchEprint.size) == destCatchEprint) &&
    (b.extract (7 + destCatchEprint.size) b.size == abortSyscall) &&
    (destCatchReturn1 == destCatchEprint.append abortSyscall) &&
    ((destCatchEprint == catchX86Code) = false) &&
    ((b.extract (b.size - return1Code.size) b.size == return1Code) = false)

set_option maxRecDepth 4096

theorem destCatchEprint_ok : (destCatchEprintOk destCatchEprint) = true :=
  rfl

theorem extraArgvCatch_ok : (extraArgvCatchOk extraArgvCatch) = true :=
  rfl

theorem destCatchEprint_shares_maincatch_prefix :
    (destCatchEprint.extract 0 13 ==
      (eprintPrefix payloadLen).extract 0 13) = true :=
  rfl

theorem destCatchEprint_payload_eq_maincatch :
    (destCatchEprint.extract 26 destCatchEprint.size == payloadBytes) = true :=
  rfl

theorem destCatchEprint_ne_sidecar_code :
    (destCatchEprint == catchX86Code) = false :=
  rfl

theorem extraArgvCatch_ne_xor_ret :
    (extraArgvCatch.extract (extraArgvCatch.size - 2) extraArgvCatch.size ==
      ByteArray.mk #[0x31, 0xc0]) = false :=
  rfl

/-- This helper encodes dest catch bytes. MeasureReloc writeOneFunction writes dest. -/
def writesDest : Bool := false

theorem writesDest_eq_false : writesDest = false :=
  rfl

/-- Sidecar dump stays X64I. This helper does not retag it dest. -/
def sidecarStaysX64I : Bool := true

theorem sidecarStaysX64I_eq_true : sidecarStaysX64I = true :=
  rfl

/--
  leftover: dest extra-argv takes dest-safe MainCatch eprint then sys_exit(1);
  sidecar stays X64I; catch lives in CatchReturn.withCatch;
  SelfHostComplete.main uses it; dest extra-argv encodes those catch strings;
  extra-argv is still not Lean throw; dest is not that main; not mill
-/
def leftoverAfterDestCatch : String :=
  "leftover: dest extra-argv takes dest-safe MainCatch eprint then " ++
    "sys_exit(1); sidecar stays X64I not dest; catch lives in " ++
    "CatchReturn.withCatch; SelfHostComplete.main uses it; dest extra-argv " ++
    "encodes those catch strings; extra-argv is still not Lean throw; dest " ++
    "is not SelfHostComplete.main; not mill; not mill leanc; not slake-hello; " ++
    "not Lake-gone"

end SystemsLean.SlakeHostToolElfMainCatchDest
"#

end SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchDest
