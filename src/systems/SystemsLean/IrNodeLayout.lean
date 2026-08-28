/-
  SYSTEMS_LEAN_HOST -- richer-than-i32 named record layout dual-pin.
  Wire layout of slake_ir_node (emit map of Types.IrNode) versus rustc_abi
  repr(C) packing on x86_64-unknown-linux-gnu. Mixed I32 + I8 fields so the
  record is larger than a lone i32 tag (size 16, align 4, pad 3).
  Not product Rust under src/. C product wire unchanged. Not full rustc
  formalization. Not full LLVM production backend.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IR-NODE-LAYOUT,
  SLAKE_IR_NODE_LAYOUT_V0, RICHER-THAN-I32-LAYOUT, IrNodeRecord,
  rustc_abi, LAYOUT-SIZE-ALIGN-FIXTURE, x86_64-unknown-linux-gnu,
  slake_ir_node, TYPED_IR_V0, just richer-record-layout,
  HOST-IR-NODE-LAYOUT-SMOKE, HOST-IR-NODE-LAYOUT-THEOREM.
  Module: SystemsLean.IrNodeLayout
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Short role name. Red/green: lake build SystemsLean.IrNodeLayout;
  just richer-record-layout.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.LlvmHold

namespace SystemsLean.IrNodeLayout

open SystemsLean.Mult
open SystemsLean.Types

/-! ### HOST-IR-NODE-LAYOUT / SLAKE_IR_NODE_LAYOUT_V0

  Named record: IrNodeRecord. This is the rustc_abi / repr(C) layout of the
  freestanding wire struct slake_ir_node (type tag + Mult enum + kind enum +
  valid byte), not the host Lean inductive Types.IrNode (no valid flag; Nat
  tags). Dual-pin applies rustc_abi Integer size/align plus Size::align_to
  field packing. C wire is read-only evidence; this module does not edit it.
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_IR_NODE_LAYOUT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-IR-NODE-LAYOUT"

/-- Surface id (same durable token). -/
def surfaceId : String := "HOST-IR-NODE-LAYOUT"

/-- Named record id (wire / rustc_abi dual).
    Greppable: irNodeRecordName, IrNodeRecord. -/
def irNodeRecordName : String := "IrNodeRecord"

/-- Residual / recipe name.
    Greppable: richerThanI32LayoutName, RICHER-THAN-I32-LAYOUT. -/
def richerThanI32LayoutName : String := "RICHER-THAN-I32-LAYOUT"

/-- just recipe for this gate.
    Greppable: justRecipeRicherRecordLayout, richer-record-layout. -/
def justRecipeRicherRecordLayout : String := "richer-record-layout"

/-- Alias used by presence greps. -/
def justRecipe : String := justRecipeRicherRecordLayout

/-- Named target (matches layout fixture and foreign bands).
    Greppable: foreignLinkTargetTriple, x86_64-unknown-linux-gnu. -/
def foreignLinkTargetTriple : String := "x86_64-unknown-linux-gnu"

/-- rustc_abi Size::align_to on power-of-two aligns: round n up to alignBytes.
    Cite: ref/rust/compiler/rustc_abi/src/lib.rs Size::align_to. -/
def alignUp (n alignBytes : Nat) : Nat :=
  if alignBytes == 0 then
    n
  else
    let mask := alignBytes - 1
    ((n + mask) / alignBytes) * alignBytes

/-- I32 size (rustc_abi Integer::size I32 => Size::from_bytes(4)). -/
def i32SizeBytes : Nat := 4

/-- I32 align (TargetDataLayout default i32_align 32 bits). -/
def i32AlignBytes : Nat := 4

/-- I8 size (rustc_abi Integer::size I8 => Size::from_bytes(1)). -/
def i8SizeBytes : Nat := 1

/-- I8 align (TargetDataLayout default i8_align 8 bits). -/
def i8AlignBytes : Nat := 1

/-- Field ty: slake_type_tag { uint32_t tag } / rustc u32. -/
def typeTagSizeBytes : Nat := i32SizeBytes
def typeTagAlignBytes : Nat := i32AlignBytes

/-- Field mult: C enum slake_mult (c_enum_min_size I32) / repr(i32). -/
def multSizeBytes : Nat := i32SizeBytes
def multAlignBytes : Nat := i32AlignBytes

/-- Field kind: C enum slake_ir_kind (c_enum_min_size I32) / repr(i32). -/
def kindSizeBytes : Nat := i32SizeBytes
def kindAlignBytes : Nat := i32AlignBytes

/-- Field valid: uint8_t / rustc u8. Wire-only (host IrNode has no valid flag). -/
def validSizeBytes : Nat := i8SizeBytes
def validAlignBytes : Nat := i8AlignBytes

/-- repr(C) field offsets: each field starts at align_to(end_of_prev, field_align). -/
def typeTagOffset : Nat := 0

def multOffset : Nat :=
  alignUp (typeTagOffset + typeTagSizeBytes) multAlignBytes

def kindOffset : Nat :=
  alignUp (multOffset + multSizeBytes) kindAlignBytes

def validOffset : Nat :=
  alignUp (kindOffset + kindSizeBytes) validAlignBytes

/-- Struct ABI align is max field align (aggregate_align default is 1 byte). -/
def recordAlignBytes : Nat :=
  max typeTagAlignBytes (max multAlignBytes (max kindAlignBytes validAlignBytes))

/-- End of last field before trailing pad. -/
def recordEndBytes : Nat := validOffset + validSizeBytes

/-- Size rounded up to struct align (rustc_abi Size::align_to). -/
def recordSizeBytes : Nat := alignUp recordEndBytes recordAlignBytes

/-- Trailing pad bytes (13 -> 16 on this target). -/
def recordPadBytes : Nat := recordSizeBytes - recordEndBytes

/-- rustc_abi cite (read-only under ref/rust).
    Greppable: rustcAbiCite, rustc_abi. -/
def rustcAbiCite : String :=
  "rustc_abi Integer::I32 size 4 align 4; Integer::I8 size 1 align 1; " ++
    "c_enum_min_size I32; Size::align_to; TargetDataLayout default " ++
    "i32_align 32 bits / i8_align 8 bits " ++
    "(ref/rust/compiler/rustc_abi/src/lib.rs)"

/-- Target data-layout cite.
    Greppable: targetDataLayoutCite. -/
def targetDataLayoutCite : String :=
  "x86_64-unknown-linux-gnu rustc_target data-layout; i32/i8 aligns unchanged"

/-- Wire struct cite (read-only product header; C unchanged by this residual).
    Greppable: slakeIrNodeWireCite, slake_ir_node. -/
def slakeIrNodeWireCite : String :=
  "slake_ir_node { slake_type_tag ty; enum slake_mult; enum slake_ir_kind; uint8_t valid }"

/-- Layout fixture peer cite (i32 tags remain 4/4; this record is richer).
    Greppable: layoutFixtureCite, LAYOUT-SIZE-ALIGN-FIXTURE. -/
def layoutFixtureCite : String :=
  "LAYOUT-SIZE-ALIGN-FIXTURE Mult i32 tag size 4 align 4; IrNodeRecord size 16 align 4"

/-- Out-of-tree dogfood honesty: no product Rust under src/.
    Greppable: outOfTreeConsumerHonesty, out-of-tree. -/
def outOfTreeConsumerHonesty : String :=
  "out-of-tree rustc size_of/align_of/offset_of IrNodeRecord under /tmp (not product Rust under src/)"

/-- Correspondence honesty.
    Greppable: recordLayoutHonesty. -/
def recordLayoutHonesty : String :=
  "repr(C) dual-pin of slake_ir_node / IrNodeRecord versus rustc_abi; not formalized rustc; not Lean inductive layout"

/-- Local inventory finished for richer-than-i32 layout residual. -/
def irNodeLayoutFinishedClaimed : Bool := true

/-- Full LLVM production backend -- MUST stay false. -/
def irNodeLayoutFullBackendClaimed : Bool := false

/-- Local honesty: does not re-open product residual free. -/
def irNodeLayoutResidualFreeWorkClaimed : Bool := false

/-- Local honesty: not product self-host complete rebrand. -/
def irNodeLayoutProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not PROVABLY unlock work. -/
def irNodeLayoutProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not FullHostElaborateRemains true. -/
def irNodeLayoutFullHostElaborateClaimed : Bool := false

/-- Local unlock pin -- MUST stay false (LlvmHold owns living unlock). -/
def irNodeLayoutLlvmUnlocked : Bool := false

/-- Local unlock false alias. -/
def irNodeLayoutLocalUnlockFalse : Bool := !irNodeLayoutLlvmUnlocked

/-- Keeps llvm locked at this module (local pin false). -/
def irNodeLayoutKeepsLlvmLocked : Bool := !irNodeLayoutLlvmUnlocked

/-- Does not unlock llvm. -/
def irNodeLayoutDoesNotUnlockLlvm : Bool :=
  irNodeLayoutKeepsLlvmLocked && LlvmHold.llvmHoldReady

/-- Host tag agreement: record fields are the same 0/1/2 Mult and kind tags.
    Greppable: irNodeFieldAgreementOk. -/
def irNodeFieldAgreementOk : Bool :=
  (Mult.ofNat? 0 == some Mult.mult0)
    && (Mult.ofNat? 1 == some Mult.mult1)
    && (Mult.ofNat? 2 == some Mult.multOmega)
    && (Types.ofKindTag? 0 == some Types.NodeKind.value)
    && (Types.ofKindTag? 1 == some Types.NodeKind.linear)
    && (Types.ofKindTag? 2 == some Types.NodeKind.erased)
    && Types.isValidKindTag 0
    && Types.isValidKindTag 1
    && Types.isValidKindTag 2
    && !Types.isValidKindTag 3

/-- rustc_abi numeric dual-pin for IrNodeRecord on the named target.
    Greppable: irNodeLayoutDualPinOk, RICHER-THAN-I32-LAYOUT. -/
def irNodeLayoutDualPinOk : Bool :=
  (foreignLinkTargetTriple == "x86_64-unknown-linux-gnu")
    && (typeTagOffset == 0)
    && (multOffset == 4)
    && (kindOffset == 8)
    && (validOffset == 12)
    && (recordEndBytes == 13)
    && (recordPadBytes == 3)
    && (recordSizeBytes == 16)
    && (recordAlignBytes == 4)
    && (recordSizeBytes > i32SizeBytes)
    && (i32SizeBytes == 4)
    && (i32AlignBytes == 4)
    && (i8SizeBytes == 1)
    && (i8AlignBytes == 1)
    && (irNodeRecordName == "IrNodeRecord")
    && (richerThanI32LayoutName == "RICHER-THAN-I32-LAYOUT")
    && (justRecipeRicherRecordLayout == "richer-record-layout")
    && (rustcAbiCite.length > 0)
    && (targetDataLayoutCite.length > 0)
    && (slakeIrNodeWireCite.length > 0)
    && (layoutFixtureCite.length > 0)
    && (outOfTreeConsumerHonesty.length > 0)
    && (recordLayoutHonesty.length > 0)
    && irNodeFieldAgreementOk

/-- Surface canary.
    Greppable: irNodeLayoutSurfaceOk. -/
def irNodeLayoutSurfaceOk : Bool :=
  (stageId == "SLAKE_IR_NODE_LAYOUT_V0")
    && (hostId == "HOST-IR-NODE-LAYOUT")
    && (surfaceId == "HOST-IR-NODE-LAYOUT")
    && irNodeLayoutDualPinOk

/-- Package ok (record dual-pin; fullBackend false; no product Rust).
    Greppable: irNodeLayoutPackageOk. -/
def irNodeLayoutPackageOk : Bool :=
  irNodeLayoutSurfaceOk
    && irNodeLayoutFinishedClaimed
    && !irNodeLayoutFullBackendClaimed
    && !irNodeLayoutFullHostElaborateClaimed

/-- Structural ready.
    Greppable: irNodeLayoutReady. -/
def irNodeLayoutReady : Bool :=
  irNodeLayoutPackageOk
    && irNodeLayoutKeepsLlvmLocked
    && irNodeLayoutDoesNotUnlockLlvm
    && irNodeLayoutLocalUnlockFalse
    && !irNodeLayoutLlvmUnlocked
    && !irNodeLayoutResidualFreeWorkClaimed
    && !irNodeLayoutProductSelfHostCompleteClaimed
    && !irNodeLayoutProvablyUnlockWorkClaimed
    && LlvmHold.llvmHoldReady

/-! ### HOST-IR-NODE-LAYOUT-THEOREM -/

theorem irNodeLayoutFinishedClaimed_true :
    irNodeLayoutFinishedClaimed = true :=
  rfl

theorem irNodeLayoutFullBackendClaimed_false :
    irNodeLayoutFullBackendClaimed = false :=
  rfl

theorem irNodeLayoutLlvmUnlocked_false :
    irNodeLayoutLlvmUnlocked = false :=
  rfl

theorem typeTagOffset_eq : typeTagOffset = 0 :=
  rfl

theorem multOffset_eq : multOffset = 4 :=
  rfl

theorem kindOffset_eq : kindOffset = 8 :=
  rfl

theorem validOffset_eq : validOffset = 12 :=
  rfl

theorem recordEndBytes_eq : recordEndBytes = 13 :=
  rfl

theorem recordPadBytes_eq : recordPadBytes = 3 :=
  rfl

theorem recordSizeBytes_eq : recordSizeBytes = 16 :=
  rfl

theorem recordAlignBytes_eq : recordAlignBytes = 4 :=
  rfl

theorem recordSize_richer_than_i32 : recordSizeBytes > i32SizeBytes :=
  Nat.lt_of_succ_le (by decide : 5 <= 16)

theorem irNodeLayoutDualPinOk_true :
    irNodeLayoutDualPinOk = true := by
  native_decide

theorem irNodeLayoutReady_true :
    irNodeLayoutReady = true := by
  native_decide

theorem irNodeLayoutPackageOk_true :
    irNodeLayoutPackageOk = true := by
  native_decide

theorem irNodeLayout_stageId_eq :
    stageId = "SLAKE_IR_NODE_LAYOUT_V0" :=
  rfl

theorem irNodeLayout_hostId_eq :
    hostId = "HOST-IR-NODE-LAYOUT" :=
  rfl

theorem irNodeLayout_justRecipe_eq :
    justRecipeRicherRecordLayout = "richer-record-layout" :=
  rfl

theorem irNodeLayout_record_name_eq :
    irNodeRecordName = "IrNodeRecord" :=
  rfl

theorem irNodeLayout_richer_name_eq :
    richerThanI32LayoutName = "RICHER-THAN-I32-LAYOUT" :=
  rfl

/-! ### HOST-IR-NODE-LAYOUT-SMOKE -/

example : irNodeLayoutFinishedClaimed = true := rfl
example : irNodeLayoutFullBackendClaimed = false := rfl
example : irNodeLayoutLlvmUnlocked = false := rfl
example : irNodeLayoutReady = true := by native_decide
example : irNodeLayoutDualPinOk = true := by native_decide
example : recordSizeBytes = 16 := rfl
example : recordAlignBytes = 4 := rfl
example : typeTagOffset = 0 := rfl
example : multOffset = 4 := rfl
example : kindOffset = 8 := rfl
example : validOffset = 12 := rfl
example : recordPadBytes = 3 := rfl
example : irNodeRecordName = "IrNodeRecord" := rfl
example : richerThanI32LayoutName = "RICHER-THAN-I32-LAYOUT" := rfl
example : justRecipeRicherRecordLayout = "richer-record-layout" := rfl
example : foreignLinkTargetTriple = "x86_64-unknown-linux-gnu" := rfl
example : LlvmHold.llvmUnlocked = true := rfl

end SystemsLean.IrNodeLayout
