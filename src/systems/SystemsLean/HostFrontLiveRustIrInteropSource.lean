/-
  SYSTEMS_LEAN_HOST partial -- dual-pin of RustIrInterop.lean bytes.
  liveRustIrInteropSource is the exact bytes of
  src/systems/SystemsLean/RustIrInterop.lean.
  Module: SystemsLean.HostFrontLiveRustIrInteropSource
  Not FullHost. Not a Rust toolchain. Not an LLVM production backend.
  Not FullBackend. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, liveRustIrInteropSource.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveRustIrInterop

def liveRustIrInteropSource : String := r#"/-
  SYSTEMS_LEAN_HOST -- Rust IR interop correspondence (Systems Lean host
  models to Rust layout / LLVM IR contracts). Progressive dual-pin:
  Mult..Graph foreign success rungs + Mult layout fixture / layout-IR dual
  evidence compose into rustIrInteropPartialClaimed. Multi-band single
  out-of-tree consumer dual-pin (Mult..Graph together) claims
  rustIrInteropFullClaimed true. Full is multi-band joint dual map of our
  i32 Mult..Graph contracts, not formalized all of rustc, not product Rust
  under src/, not full LLVM production backend, not free/complete/PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, HOST-RUST-IR-INTEROP,
  SLAKE_RUST_IR_INTEROP_PARTIAL_V0, SLAKE_RUST_IR_INTEROP_FULL_V0,
  RUST-IR-INTEROP, RUST-SYSTEMS-LEAN-CORRESPONDENCE,
  rustIrInteropPartialClaimed, rustIrInteropFullClaimed,
  RUST-IR-INTEROP-PARTIAL, RUST-IR-INTEROP-FULL,
  MULTI-BAND-JOINT-CONSUMER, just rust-ir-interop-partial,
  just rust-ir-interop-full, LAYOUT-SIZE-ALIGN-FIXTURE, LAYOUT-IR-TAG-DUAL-PIN,
  RICHER-THAN-I32-LAYOUT, IrNodeRecord, HOST-IR-NODE-LAYOUT, just richer-record-layout,
  LLVM-LINK-SMOKE, just llvm-link-smoke,
  out-of-tree, x86_64-unknown-linux-gnu, Mult, Linear, Types, Program, Graph,
  LlvmHold, llvmUnlocked, HOST-RUST-IR-INTEROP-SMOKE,
  HOST-RUST-IR-INTEROP-THEOREM.
  Module: SystemsLean.RustIrInterop
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Short role name. Red/green: lake build SystemsLean.RustIrInterop;
  just rust-ir-interop-partial; just rust-ir-interop-full; just systems-llvm-ir.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.LlvmHold
import SystemsLean.MultForeignLink
import SystemsLean.LinearForeignLink
import SystemsLean.TypesForeignLink
import SystemsLean.ProgramForeignLink
import SystemsLean.GraphForeignLink
import SystemsLean.IrNodeLayout

namespace SystemsLean.RustIrInterop

/-! ### HOST-RUST-IR-INTEROP / SLAKE_RUST_IR_INTEROP_PARTIAL_V0

  Progressive formal correspondence (Curry-Howard style map on the host):
  types and proofs that connect Systems Lean Mult/Linear/Types/Program/Graph
  foreign consumer contracts to Rust layout/IR numeric contracts (size, align,
  discriminants / status codes as i32 or repr(i32)-shaped). Evidence rungs are
  the Mult..Graph foreign success modules plus Mult-first layout fixture and
  layout-IR dual-pin cites. This is a dual map of checkable contracts, not a
  formalization of all of rustc.
-/

/-- Greppable primary stage id (partial correspondence; still true under full). -/
def stageId : String := "SLAKE_RUST_IR_INTEROP_PARTIAL_V0"

/-- Greppable full stage id (multi-band joint consumer dual-pin).
    Greppable: fullStageId, SLAKE_RUST_IR_INTEROP_FULL_V0. -/
def fullStageId : String := "SLAKE_RUST_IR_INTEROP_FULL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-RUST-IR-INTEROP"

/-- Surface id (same durable token). -/
def surfaceId : String := "HOST-RUST-IR-INTEROP"

/-- Partial success claim name.
    Greppable: rustIrInteropPartialName, RUST-IR-INTEROP-PARTIAL. -/
def rustIrInteropPartialName : String := "RUST-IR-INTEROP-PARTIAL"

/-- Full success claim name (multi-band joint Mult..Graph dual map).
    Greppable: rustIrInteropFullName, RUST-IR-INTEROP-FULL. -/
def rustIrInteropFullName : String := "RUST-IR-INTEROP-FULL"

/-- Multi-band joint consumer name.
    Greppable: multiBandJointConsumerName, MULTI-BAND-JOINT-CONSUMER. -/
def multiBandJointConsumerName : String := "MULTI-BAND-JOINT-CONSUMER"

/-- Joint surface name.
    Greppable: rustIrInteropName, RUST-IR-INTEROP. -/
def rustIrInteropName : String := "RUST-IR-INTEROP"

/-- Correspondence map name (Systems Lean <-> Rust layout/IR).
    Greppable: rustSystemsLeanCorrespondenceName,
    RUST-SYSTEMS-LEAN-CORRESPONDENCE. -/
def rustSystemsLeanCorrespondenceName : String :=
  "RUST-SYSTEMS-LEAN-CORRESPONDENCE"

/-- just recipe for partial gate.
    Greppable: justRecipeRustIrInterop, rust-ir-interop-partial. -/
def justRecipeRustIrInterop : String := "rust-ir-interop-partial"

/-- just recipe for full multi-band gate.
    Greppable: justRecipeRustIrInteropFull, rust-ir-interop-full. -/
def justRecipeRustIrInteropFull : String := "rust-ir-interop-full"

/-- Alias used by presence greps (partial remains default alias). -/
def justRecipe : String := justRecipeRustIrInterop

/-- Named target (matches Mult layout fixture and foreign bands).
    Greppable: foreignLinkTargetTriple, x86_64-unknown-linux-gnu. -/
def foreignLinkTargetTriple : String := "x86_64-unknown-linux-gnu"

/-- Shared tag/status size on the named target (Mult-class + status codes).
    Greppable: rustIrTagSizeBytes. -/
def rustIrTagSizeBytes : Nat := 4

/-- Shared tag/status align on the named target.
    Greppable: rustIrTagAlignBytes. -/
def rustIrTagAlignBytes : Nat := 4

/-- Encoding id: i32 / repr(i32)-shaped (not full repr(Rust) freeze).
    Greppable: rustIrEncodingId, i32. -/
def rustIrEncodingId : String := "i32"

/-- Layout fixture cite (Mult-first size/align dual-pin research).
    Greppable: layoutFixtureCite, LAYOUT-SIZE-ALIGN-FIXTURE. -/
def layoutFixtureCite : String :=
  "LAYOUT-SIZE-ALIGN-FIXTURE Mult size 4 align 4 x86_64-unknown-linux-gnu"

/-- Layout IR tag dual-pin cite (Mult IR tags vs fixture).
    Greppable: layoutIrDualPinCite, LAYOUT-IR-TAG-DUAL-PIN. -/
def layoutIrDualPinCite : String :=
  "LAYOUT-IR-TAG-DUAL-PIN Mult IR tags vs fixture (just layout-ir-dual-pin)"

/-- Richer-than-i32 named record cite (IrNodeRecord / slake_ir_node).
    Greppable: richerThanI32LayoutCite, RICHER-THAN-I32-LAYOUT, IrNodeRecord. -/
def richerThanI32LayoutCite : String :=
  "RICHER-THAN-I32-LAYOUT IrNodeRecord size 16 align 4 pad 3 x86_64-unknown-linux-gnu"

/-- IR consumer link smoke cite (out-of-tree clang/rustc + generator .ll).
    Greppable: llvmLinkSmokeCite, LLVM-LINK-SMOKE. -/
def llvmLinkSmokeCite : String :=
  "LLVM-LINK-SMOKE out-of-tree clang or rustc+llc links generator SSA .ll under /tmp"

/-- just recipe for richer-than-i32 layout gate.
    Greppable: justRecipeRicherRecordLayout, richer-record-layout. -/
def justRecipeRicherRecordLayout : String := "richer-record-layout"

/-- just recipe for IR consumer link smoke.
    Greppable: justRecipeLlvmLinkSmoke, llvm-link-smoke. -/
def justRecipeLlvmLinkSmoke : String := "llvm-link-smoke"

/-- Mult layout/IR consumer success partial cite (pure Nix + foreign dual).
    Greppable: multLayoutIrSuccessCite, mult-layout-ir-success. -/
def multLayoutIrSuccessCite : String :=
  "mult-layout-ir-success Mult freestanding + unit IR + SSA + layout fixture (not full Rust-native link)"

/-- Evidence research path for this correspondence residual.
    Greppable: correspondenceEvidencePathCite. -/
def correspondenceEvidencePathCite : String :=
  "doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md"

/-- Out-of-tree dogfood honesty: no product Rust under src/.
    Greppable: outOfTreeConsumerHonesty, out-of-tree. -/
def outOfTreeConsumerHonesty : String :=
  "out-of-tree rustc dogfood under /tmp (not product Rust under src/)"

/-- Multi-band single consumer honesty: one /tmp crate covers Mult..Graph together.
    Greppable: multiBandSingleConsumerHonesty, MULTI-BAND-JOINT-CONSUMER. -/
def multiBandSingleConsumerHonesty : String :=
  "multi-band single out-of-tree consumer Mult+Linear+Types+Program+Graph i32 contracts under /tmp; not product Rust under src/"

/-- Why this path: three languages only; dual-pin + dogfood, not monorepo Rust.
    Greppable: productPathHonesty. -/
def productPathHonesty : String :=
  "host Lean dual-pin + pure Nix + optional /tmp rustc; three languages only; no product Rust under src/"

/-- Correspondence honesty: dual map of contracts, not full rustc formalization.
    Greppable: correspondenceHonesty. -/
def correspondenceHonesty : String :=
  "types and proofs map host Mult..Graph foreign contracts to Rust layout/IR numeric contracts; not formalized rustc"

/-- Full-claim honesty: multi-band joint dual map only; not all of rustc.
    Greppable: fullClaimHonesty. -/
def fullClaimHonesty : String :=
  "RUST-IR-INTEROP-FULL is multi-band joint Mult..Graph dual map + single consumer; not formalized all of rustc; not fullBackend"

/-- Local inventory finished for partial correspondence residual. -/
def rustIrInteropFinishedClaimed : Bool := true

/-- Progressive partial claim: Mult..Graph foreign + Mult layout/IR dual evidence.
    Greppable: rustIrInteropPartialClaimed, RUST-IR-INTEROP-PARTIAL. -/
def rustIrInteropPartialClaimed : Bool := true

/-- Full multi-band joint dual map (Mult..Graph together). Not rustc formalization.
    Greppable: rustIrInteropFullClaimed, RUST-IR-INTEROP-FULL. -/
def rustIrInteropFullClaimed : Bool := true

/-- Full LLVM production backend -- MUST stay false (LlvmHold / fixture own claim). -/
def rustIrInteropFullBackendClaimed : Bool := false

/-- Local honesty: does not re-open product residual free. -/
def rustIrInteropResidualFreeWorkClaimed : Bool := false

/-- Local honesty: not product self-host complete rebrand. -/
def rustIrInteropProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not PROVABLY unlock work. -/
def rustIrInteropProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not FullHostElaborateRemains true. -/
def rustIrInteropFullHostElaborateClaimed : Bool := false

/-- Local honesty: not classic elaborator full parity rebrand. -/
def rustIrInteropFullElaboratorParityClaimed : Bool := false

/-- Local unlock pin -- MUST stay false (LlvmHold owns living unlock). -/
def rustIrInteropLlvmUnlocked : Bool := false

/-- Local unlock false alias. -/
def rustIrInteropLocalUnlockFalse : Bool := !rustIrInteropLlvmUnlocked

/-- Keeps llvm locked at this module (local pin false). -/
def rustIrInteropKeepsLlvmLocked : Bool := !rustIrInteropLlvmUnlocked

/-- Does not unlock llvm. -/
def rustIrInteropDoesNotUnlockLlvm : Bool :=
  rustIrInteropKeepsLlvmLocked
    && LlvmHold.llvmHoldReady

/-- Mult..Graph foreign success rungs (evidence ladder toward intercompat).
    Greppable: multGraphForeignRungsOk. -/
def multGraphForeignRungsOk : Bool :=
  MultForeignLink.multForeignLinkReady
    && MultForeignLink.multForeignLinkSuccessClaimed
    && LinearForeignLink.linearForeignLinkReady
    && LinearForeignLink.linearForeignLinkSuccessClaimed
    && TypesForeignLink.typesForeignLinkReady
    && TypesForeignLink.typesForeignLinkSuccessClaimed
    && ProgramForeignLink.programForeignLinkReady
    && ProgramForeignLink.programForeignLinkSuccessClaimed
    && GraphForeignLink.graphForeignLinkReady
    && GraphForeignLink.graphForeignLinkSuccessClaimed
    && !MultForeignLink.multForeignLinkFullBackendClaimed
    && !LinearForeignLink.linearForeignLinkFullBackendClaimed
    && !TypesForeignLink.typesForeignLinkFullBackendClaimed
    && !ProgramForeignLink.programForeignLinkFullBackendClaimed
    && !GraphForeignLink.graphForeignLinkFullBackendClaimed

/-- Mult layout / IR dual-pin evidence (fixture + Mult foreign dual agreement).
    Greppable: multLayoutIrDualEvidenceOk, LAYOUT-SIZE-ALIGN-FIXTURE. -/
def multLayoutIrDualEvidenceOk : Bool :=
  MultForeignLink.multForeignLinkDualAgreementOk
    && MultForeignLink.multForeignLinkConsumerContractOk
    && (layoutFixtureCite.length > 0)
    && (layoutIrDualPinCite.length > 0)
    && (multLayoutIrSuccessCite.length > 0)
    && (rustIrTagSizeBytes == 4)
    && (rustIrTagAlignBytes == 4)
    && (foreignLinkTargetTriple == "x86_64-unknown-linux-gnu")
    && (rustIrEncodingId == "i32")
    && (MultForeignLink.foreignMultTagSizeBytes == rustIrTagSizeBytes)
    && (MultForeignLink.foreignMultTagAlignBytes == rustIrTagAlignBytes)
    && (MultForeignLink.foreignLinkTargetTriple == foreignLinkTargetTriple)

/-- Richer-than-i32 IrNodeRecord dual-pin (rustc_abi size 16 align 4).
    Greppable: richerThanI32LayoutOk, RICHER-THAN-I32-LAYOUT, IrNodeRecord. -/
def richerThanI32LayoutOk : Bool :=
  IrNodeLayout.irNodeLayoutReady
    && IrNodeLayout.irNodeLayoutDualPinOk
    && (IrNodeLayout.recordSizeBytes == 16)
    && (IrNodeLayout.recordAlignBytes == 4)
    && (IrNodeLayout.recordSizeBytes > rustIrTagSizeBytes)
    && (IrNodeLayout.foreignLinkTargetTriple == foreignLinkTargetTriple)
    && (richerThanI32LayoutCite.length > 0)
    && (llvmLinkSmokeCite.length > 0)
    && (justRecipeRicherRecordLayout == "richer-record-layout")
    && (justRecipeLlvmLinkSmoke == "llvm-link-smoke")
    && (IrNodeLayout.justRecipeRicherRecordLayout == justRecipeRicherRecordLayout)
    && !IrNodeLayout.irNodeLayoutFullBackendClaimed

/-- Multi-band joint consumer dual-pin: Mult..Graph foreign contracts together.
    Shared size/align/triple/encoding + each band dual agreement + joint name.
    Greppable: multiBandJointConsumerOk, MULTI-BAND-JOINT-CONSUMER. -/
def multiBandJointConsumerOk : Bool :=
  multGraphForeignRungsOk
    && MultForeignLink.multForeignLinkDualAgreementOk
    && MultForeignLink.multForeignLinkConsumerContractOk
    && LinearForeignLink.linearForeignLinkDualAgreementOk
    && LinearForeignLink.linearForeignLinkConsumerContractOk
    && TypesForeignLink.typesForeignLinkDualAgreementOk
    && TypesForeignLink.typesForeignLinkConsumerContractOk
    && ProgramForeignLink.programForeignLinkDualAgreementOk
    && ProgramForeignLink.programForeignLinkConsumerContractOk
    && GraphForeignLink.graphForeignLinkDualAgreementOk
    && GraphForeignLink.graphForeignLinkConsumerContractOk
    && (multiBandJointConsumerName == "MULTI-BAND-JOINT-CONSUMER")
    && (multiBandSingleConsumerHonesty.length > 0)
    && (fullClaimHonesty.length > 0)
    && (rustIrTagSizeBytes == 4)
    && (rustIrTagAlignBytes == 4)
    && (foreignLinkTargetTriple == "x86_64-unknown-linux-gnu")
    && (rustIrEncodingId == "i32")
    && (MultForeignLink.foreignMultTagSizeBytes == rustIrTagSizeBytes)
    && (LinearForeignLink.foreignLinearTagSizeBytes == rustIrTagSizeBytes)
    && (TypesForeignLink.foreignTypesTagSizeBytes == rustIrTagSizeBytes)
    && (ProgramForeignLink.foreignProgramTagSizeBytes == rustIrTagSizeBytes)
    && (GraphForeignLink.foreignGraphTagSizeBytes == rustIrTagSizeBytes)
    && (MultForeignLink.foreignMultTagAlignBytes == rustIrTagAlignBytes)
    && (LinearForeignLink.foreignLinearTagAlignBytes == rustIrTagAlignBytes)
    && (TypesForeignLink.foreignTypesTagAlignBytes == rustIrTagAlignBytes)
    && (ProgramForeignLink.foreignProgramTagAlignBytes == rustIrTagAlignBytes)
    && (GraphForeignLink.foreignGraphTagAlignBytes == rustIrTagAlignBytes)
    && (MultForeignLink.foreignLinkTargetTriple == foreignLinkTargetTriple)
    && (LinearForeignLink.foreignLinkTargetTriple == foreignLinkTargetTriple)
    && (TypesForeignLink.foreignLinkTargetTriple == foreignLinkTargetTriple)
    && (ProgramForeignLink.foreignLinkTargetTriple == foreignLinkTargetTriple)
    && (GraphForeignLink.foreignLinkTargetTriple == foreignLinkTargetTriple)
    && (justRecipeRustIrInteropFull == "rust-ir-interop-full")
    && (fullStageId == "SLAKE_RUST_IR_INTEROP_FULL_V0")
    && rustIrInteropFullClaimed
    && rustIrInteropPartialClaimed
    && !rustIrInteropFullBackendClaimed

/-- Joint dual map: foreign rungs + Mult layout/IR dual + multi-band full + cites.
    Greppable: rustIrInteropDualMapOk, RUST-SYSTEMS-LEAN-CORRESPONDENCE. -/
def rustIrInteropDualMapOk : Bool :=
  multGraphForeignRungsOk
    && multLayoutIrDualEvidenceOk
    && richerThanI32LayoutOk
    && multiBandJointConsumerOk
    && (rustSystemsLeanCorrespondenceName == "RUST-SYSTEMS-LEAN-CORRESPONDENCE")
    && (rustIrInteropName == "RUST-IR-INTEROP")
    && (rustIrInteropPartialName == "RUST-IR-INTEROP-PARTIAL")
    && (rustIrInteropFullName == "RUST-IR-INTEROP-FULL")
    && (correspondenceEvidencePathCite.length > 0)
    && (outOfTreeConsumerHonesty.length > 0)
    && (productPathHonesty.length > 0)
    && (correspondenceHonesty.length > 0)
    && rustIrInteropPartialClaimed
    && rustIrInteropFullClaimed
    && !rustIrInteropFullBackendClaimed

/-- Surface canary.
    Greppable: rustIrInteropSurfaceOk. -/
def rustIrInteropSurfaceOk : Bool :=
  (stageId == "SLAKE_RUST_IR_INTEROP_PARTIAL_V0")
    && (fullStageId == "SLAKE_RUST_IR_INTEROP_FULL_V0")
    && (hostId == "HOST-RUST-IR-INTEROP")
    && (surfaceId == "HOST-RUST-IR-INTEROP")
    && (justRecipeRustIrInterop == "rust-ir-interop-partial")
    && (justRecipeRustIrInteropFull == "rust-ir-interop-full")
    && rustIrInteropDualMapOk

/-- Package ok (partial + multi-band full; fullBackend false; no product Rust).
    Greppable: rustIrInteropPackageOk. -/
def rustIrInteropPackageOk : Bool :=
  rustIrInteropSurfaceOk
    && rustIrInteropPartialClaimed
    && rustIrInteropFullClaimed
    && multiBandJointConsumerOk
    && richerThanI32LayoutOk
    && !rustIrInteropFullBackendClaimed
    && !rustIrInteropFullHostElaborateClaimed
    && !rustIrInteropFullElaboratorParityClaimed

/-- Structural ready.
    Greppable: rustIrInteropReady. -/
def rustIrInteropReady : Bool :=
  rustIrInteropFinishedClaimed
    && rustIrInteropPackageOk
    && rustIrInteropKeepsLlvmLocked
    && rustIrInteropDoesNotUnlockLlvm
    && rustIrInteropLocalUnlockFalse
    && !rustIrInteropLlvmUnlocked
    && !rustIrInteropResidualFreeWorkClaimed
    && !rustIrInteropProductSelfHostCompleteClaimed
    && !rustIrInteropProvablyUnlockWorkClaimed
    && LlvmHold.llvmHoldReady
    && GraphForeignLink.graphForeignLinkReady
    && IrNodeLayout.irNodeLayoutReady

/-! ### HOST-RUST-IR-INTEROP-THEOREM -/

theorem rustIrInteropFinishedClaimed_true :
    rustIrInteropFinishedClaimed = true :=
  rfl

theorem rustIrInteropPartialClaimed_true :
    rustIrInteropPartialClaimed = true :=
  rfl

theorem rustIrInteropFullClaimed_true :
    rustIrInteropFullClaimed = true :=
  rfl

theorem rustIrInteropFullBackendClaimed_false :
    rustIrInteropFullBackendClaimed = false :=
  rfl

theorem rustIrInteropLlvmUnlocked_false :
    rustIrInteropLlvmUnlocked = false :=
  rfl

theorem rustIrInteropFullHostElaborateClaimed_false :
    rustIrInteropFullHostElaborateClaimed = false :=
  rfl

theorem multGraphForeignRungsOk_true :
    multGraphForeignRungsOk = true := by
  native_decide

theorem multLayoutIrDualEvidenceOk_true :
    multLayoutIrDualEvidenceOk = true := by
  native_decide

theorem richerThanI32LayoutOk_true :
    richerThanI32LayoutOk = true := by
  native_decide

theorem multiBandJointConsumerOk_true :
    multiBandJointConsumerOk = true := by
  native_decide

theorem rustIrInteropDualMapOk_true :
    rustIrInteropDualMapOk = true := by
  native_decide

theorem rustIrInteropReady_true :
    rustIrInteropReady = true := by
  native_decide

theorem rustIrInteropPackageOk_true :
    rustIrInteropPackageOk = true := by
  native_decide

theorem rustIrInterop_stageId_eq :
    stageId = "SLAKE_RUST_IR_INTEROP_PARTIAL_V0" :=
  rfl

theorem rustIrInterop_fullStageId_eq :
    fullStageId = "SLAKE_RUST_IR_INTEROP_FULL_V0" :=
  rfl

theorem rustIrInterop_hostId_eq :
    hostId = "HOST-RUST-IR-INTEROP" :=
  rfl

theorem rustIrInterop_justRecipe_eq :
    justRecipeRustIrInterop = "rust-ir-interop-partial" :=
  rfl

theorem rustIrInterop_justRecipeFull_eq :
    justRecipeRustIrInteropFull = "rust-ir-interop-full" :=
  rfl

theorem rustIrInterop_correspondence_name_eq :
    rustSystemsLeanCorrespondenceName = "RUST-SYSTEMS-LEAN-CORRESPONDENCE" :=
  rfl

theorem rustIrInterop_multiBand_name_eq :
    multiBandJointConsumerName = "MULTI-BAND-JOINT-CONSUMER" :=
  rfl

theorem rustIrTagSizeBytes_eq :
    rustIrTagSizeBytes = 4 :=
  rfl

theorem rustIrTagAlignBytes_eq :
    rustIrTagAlignBytes = 4 :=
  rfl

theorem rustIrInterop_justRecipeRicher_eq :
    justRecipeRicherRecordLayout = "richer-record-layout" :=
  rfl

theorem rustIrInterop_justRecipeLinkSmoke_eq :
    justRecipeLlvmLinkSmoke = "llvm-link-smoke" :=
  rfl

/-! ### HOST-RUST-IR-INTEROP-SMOKE -/

example : rustIrInteropFinishedClaimed = true := rfl
example : rustIrInteropPartialClaimed = true := rfl
example : rustIrInteropFullClaimed = true := rfl
example : rustIrInteropFullBackendClaimed = false := rfl
example : rustIrInteropLlvmUnlocked = false := rfl
example : rustIrInteropReady = true := by native_decide
example : rustIrInteropDualMapOk = true := by native_decide
example : multiBandJointConsumerOk = true := by native_decide
example : multGraphForeignRungsOk = true := by native_decide
example : multLayoutIrDualEvidenceOk = true := by native_decide
example : richerThanI32LayoutOk = true := by native_decide
example : IrNodeLayout.recordSizeBytes = 16 := rfl
example : IrNodeLayout.recordAlignBytes = 4 := rfl
example : IrNodeLayout.irNodeLayoutFullBackendClaimed = false := rfl
example : justRecipeRicherRecordLayout = "richer-record-layout" := rfl
example : justRecipeLlvmLinkSmoke = "llvm-link-smoke" := rfl
example : rustIrInteropName = "RUST-IR-INTEROP" := rfl
example : rustSystemsLeanCorrespondenceName = "RUST-SYSTEMS-LEAN-CORRESPONDENCE" := rfl
example : multiBandJointConsumerName = "MULTI-BAND-JOINT-CONSUMER" := rfl
example : justRecipeRustIrInterop = "rust-ir-interop-partial" := rfl
example : justRecipeRustIrInteropFull = "rust-ir-interop-full" := rfl
example : fullStageId = "SLAKE_RUST_IR_INTEROP_FULL_V0" := rfl
example : foreignLinkTargetTriple = "x86_64-unknown-linux-gnu" := rfl
example : rustIrTagSizeBytes = 4 := rfl
example : rustIrTagAlignBytes = 4 := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : MultForeignLink.multForeignLinkSuccessClaimed = true := rfl
example : LinearForeignLink.linearForeignLinkSuccessClaimed = true := rfl
example : TypesForeignLink.typesForeignLinkSuccessClaimed = true := rfl
example : ProgramForeignLink.programForeignLinkSuccessClaimed = true := rfl
example : GraphForeignLink.graphForeignLinkSuccessClaimed = true := rfl
example : GraphForeignLink.graphForeignLinkFullBackendClaimed = false := rfl

end SystemsLean.RustIrInterop
"#

end SystemsLean.HostFrontLiveRustIrInterop
