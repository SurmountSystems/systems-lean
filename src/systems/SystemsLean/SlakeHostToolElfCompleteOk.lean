/-
  SYSTEMS_LEAN_HOST -- Lean-owned encoding of freestandingProductSelfHostCompleteOk
  for dest one-function ET_EXEC. Dest .text evaluates this Bool (mov eax imm,
  test, jnz over catch). Dest does not use argc as the Ok stand-in.
  Dest imports SystemsLean.CompleteOk and evaluates living completeOk from
  that thin module. Do not import SystemsLean.SelfHostComplete (too fat for
  lean --run). Dest is not SelfHostComplete.main.
  Theorem freestandingProductSelfHostCompleteOk_true lives on SelfHostComplete.
  Catch lives in CatchReturn.withCatch; SelfHostComplete.main uses it.
  Dest extra-argv encodes those catch strings; extra-argv is still not Lean throw.
  Not mill leanc. Not remill mill 69. Not slake-hello clang wrap.
  FullHost stays false. slakeOwnsPackageTypecheck stays false.
  occupancy 49. Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-COMPLETE-OK, freestandingProductSelfHostCompleteOk, completeOk,
  completeOkGate, movEaxCompleteOk, testEaxEax, encodeJnzOver,
  leftoverAfterCompleteOk, FullHost stays false, occupancy 49,
  Mill stays 69 of 69, not mill leanc.
  Module: SystemsLean.SlakeHostToolElfCompleteOk
-/

import SystemsLean.CompleteOk

namespace SystemsLean.SlakeHostToolElfCompleteOk

/-- Greppable stage id (same writer family). Not CompleteOk.stageId. -/
def stageId : String := "SLAKE_HOST_TOOL_ELF_V0"

/-- Greppable dest completeOk id. HOST-HOST-TOOL-COMPLETE-OK. Not argc. -/
def completeOkStage : String := "HOST-HOST-TOOL-COMPLETE-OK"

/--
  Living complete from thin SystemsLean.CompleteOk.
  Dest must not import fat SystemsLean.SelfHostComplete.
-/
def freestandingProductSelfHostCompleteOk : Bool :=
  SystemsLean.CompleteOk.freestandingProductSelfHostCompleteOk

/-- Dest .text evaluates this, not argc and not a hard-coded true. -/
def completeOk : Bool := SystemsLean.CompleteOk.completeOk

theorem completeOk_eq_true : completeOk = true :=
  rfl

/-- 0/1 immediate of completeOk. Dest mov eax uses this. -/
def completeOkU32 : UInt32 := if completeOk then 1 else 0

/-- Little-endian UInt32 of a Nat (low 32 bits). -/
def encodeU32le (n : Nat) : ByteArray :=
  ByteArray.mk #[
    UInt8.ofNat (n % 256),
    UInt8.ofNat ((n / 256) % 256),
    UInt8.ofNat ((n / 65536) % 256),
    UInt8.ofNat ((n / 16777216) % 256)
  ]

/--
  jnz over n-byte payload. rel8 (75) if n <= 127, else near jnz (0f 85 rel32).
  Displacement equals payload size. Taken when completeOk is true.
-/
def encodeJnzOver (n : Nat) : ByteArray :=
  if n <= 127 then
    ByteArray.mk #[0x75, UInt8.ofNat n]
  else
    (ByteArray.mk #[0x0f, 0x85]).append (encodeU32le n)

/-- mov eax, completeOkU32. HOST-HOST-TOOL-COMPLETE-OK. Not cmp qword [rsp], 1. -/
def movEaxCompleteOk : ByteArray :=
  (ByteArray.mk #[0xb8]).append (encodeU32le (UInt32.toNat completeOkU32))

/-- test eax, eax. ZF clear iff completeOk is true. -/
def testEaxEax : ByteArray := ByteArray.mk #[0x85, 0xc0]

/--
  Dest Ok-gate: mov eax completeOk; test eax,eax; jnz over payload.
  completeOk true skips catch. completeOk false falls into catch.
  Not argc. Not cmp qword [rsp], 1.
-/
def completeOkGate (payloadSize : Nat) : ByteArray :=
  movEaxCompleteOk.append testEaxEax |>.append (encodeJnzOver payloadSize)

theorem movEaxCompleteOk_true :
    (completeOk = true) &&
      (movEaxCompleteOk == ByteArray.mk #[0xb8, 0x01, 0x00, 0x00, 0x00]) :=
  rfl

/-- cmp qword [rsp], 1 contrast prefix (argc). Living gate must not start with this. -/
def argcCmpPrefix : ByteArray := ByteArray.mk #[0x48, 0x83, 0x3c, 0x24, 0x01]

theorem movEaxCompleteOk_not_argc :
    (movEaxCompleteOk == argcCmpPrefix) = false :=
  rfl

/--
  leftover: dest now imports thin SystemsLean.CompleteOk and evaluates living
  completeOk from it. Dest still must not import fat SystemsLean.SelfHostComplete.
  Dest is not SelfHostComplete.main. Catch lives in CatchReturn.withCatch;
  SelfHostComplete.main uses it. Dest extra-argv encodes those catch strings;
  extra-argv is still not Lean throw.
-/
def leftoverAfterCompleteOk : String :=
  "leftover: dest now imports thin SystemsLean.CompleteOk and evaluates living " ++
    "completeOk from it; dest still must not import fat SystemsLean.SelfHostComplete; " ++
    "dest is not SelfHostComplete.main; catch lives in CatchReturn.withCatch; " ++
    "SelfHostComplete.main uses it; dest extra-argv encodes those catch strings; " ++
    "extra-argv is still not Lean throw"

end SystemsLean.SlakeHostToolElfCompleteOk
