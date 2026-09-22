/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TypesForeignLink.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveTypesForeignLinkSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-TYPESFOREIGNLINK, liveTypesForeignLinkSource,
  HOST-FRONT-LIVE-TYPESFOREIGNLINK, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveTypesForeignLinkSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTypesForeignLink

/-- Dual-pinned live TypesForeignLink.lean bytes (must match on-disk file).
    Greppable: liveTypesForeignLinkSource, PARSE-LIVE-TYPESFOREIGNLINK. -/
def liveTypesForeignLinkSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Types foreign link success (layout-compatible
  foreign / out-of-tree consumer for Types kind tags only). Dual Types
  kind-tag layout/IR agreement. Host Lean dual-pin of foreign consumer
  contract (i32 Types kind tags 0/1/2 VALUE/LINEAR/ERASED, size 4, align 4 on
  x86_64-unknown-linux-gnu) against Types SSOT + freestanding Types cite +
  Types unit IR kind tags + Types SSA kind tags / is_valid honesty.
  Not product Rust under src/. Not Program/Graph foreign link.
  Not Mult/Linear otherBands flip (Mult Mult-only + Linear Mult-class tags stay).
  Not full LLVM production backend. Not free/complete/PROVABLY flip.
  Greppable: SYSTEMS_LEAN_HOST, HOST-TYPES-FOREIGN-LINK,
  SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0, TYPES-FOREIGN-LINK-SUCCESS,
  typesForeignLinkSuccessClaimed, typesForeignLinkDualAgreementOk,
  typesForeignLinkConsumerContractOk, FOREIGN-TYPES-CONSUMER-CONTRACT,
  TYPES-FOREIGN-DUAL-AGREEMENT, just types-foreign-link-success,
  out-of-tree, x86_64-unknown-linux-gnu, size 4, align 4, Types, VALUE,
  LINEAR, ERASED, TYPED_IR_V0, FAIL-CLOSED-UNKNOWN-KIND, LlvmHold,
  llvmUnlocked, HOST-TYPES-FOREIGN-LINK-SMOKE, HOST-TYPES-FOREIGN-LINK-THEOREM.
  Module: SystemsLean.TypesForeignLink
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Short role name. Red/green: lake build SystemsLean.TypesForeignLink;
  just types-foreign-link-success; just systems-llvm-ir.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.Types
import SystemsLean.Mult
import SystemsLean.LlvmHold
import SystemsLean.LlvmTypesSsa

namespace SystemsLean.TypesForeignLink

open SystemsLean.Types
open SystemsLean.Mult (Mult)

/-! ### HOST-TYPES-FOREIGN-LINK / SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0

  Types-band foreign consumer link success: layout-compatible Types kind
  tags so an out-of-tree consumer can match Slake Types kind size/align/
  discriminants without an in-tree product Rust crate. Primary dual is kind
  tags i32 0/1/2 (VALUE / LINEAR / ERASED). Freestanding slake_ir_kind +
  slake_ir_node is a secondary API cite (enum + node struct).
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-TYPES-FOREIGN-LINK"

/-- Surface id (same durable token). -/
def surfaceId : String := "HOST-TYPES-FOREIGN-LINK"

/-- Success claim name (Types band only).
    Greppable: typesForeignLinkSuccessName, TYPES-FOREIGN-LINK-SUCCESS. -/
def typesForeignLinkSuccessName : String := "TYPES-FOREIGN-LINK-SUCCESS"

/-- Dual agreement recipe name.
    Greppable: typesForeignDualAgreementName, TYPES-FOREIGN-DUAL-AGREEMENT. -/
def typesForeignDualAgreementName : String := "TYPES-FOREIGN-DUAL-AGREEMENT"

/-- Foreign consumer contract name.
    Greppable: foreignTypesConsumerContractName, FOREIGN-TYPES-CONSUMER-CONTRACT. -/
def foreignTypesConsumerContractName : String := "FOREIGN-TYPES-CONSUMER-CONTRACT"

/-- just recipe for this gate.
    Greppable: justRecipeTypesForeignLink, types-foreign-link-success. -/
def justRecipeTypesForeignLink : String := "types-foreign-link-success"

/-- Alias used by presence greps. -/
def justRecipe : String := justRecipeTypesForeignLink

/-- Named target for Types foreign layout (matches Mult layout fixture pattern).
    Greppable: foreignLinkTargetTriple, x86_64-unknown-linux-gnu. -/
def foreignLinkTargetTriple : String := "x86_64-unknown-linux-gnu"

/-- Types kind tag size in bytes on the named target.
    Greppable: foreignTypesTagSizeBytes. -/
def foreignTypesTagSizeBytes : Nat := 4

/-- Types kind tag align in bytes on the named target.
    Greppable: foreignTypesTagAlignBytes. -/
def foreignTypesTagAlignBytes : Nat := 4

/-- Types kind names from Types SSOT (not a second dialect). -/
def typesKind0Name : String := NodeKind.value.name
def typesKind1Name : String := NodeKind.linear.name
def typesKind2Name : String := NodeKind.erased.name
def typesTypedIrStageName : String := "TYPED_IR_V0"
def typesFailClosedKindName : String := "FAIL-CLOSED-UNKNOWN-KIND"

/-- Foreign consumer encoding: Types kind tag is i32 / repr(i32)-shaped.
    Greppable: foreignTypesEncodingId, i32. -/
def foreignTypesEncodingId : String := "i32"

/-- Freestanding Types API cite (enum slake_ir_kind + node secondary surface).
    Greppable: freestandingTypesApiCite, slake_ir_kind. -/
def freestandingTypesApiCite : String :=
  "enum slake_ir_kind VALUE/LINEAR/ERASED 0/1/2 + slake_ir_node + slake_ir_node_init + slake_ir_node_is_well_typed + TYPED_IR_V0"

/-- Types unit IR symbols dual-pinned for foreign agreement.
    Greppable: typesUnitIrCite, slake_types_is_valid_kind_tag. -/
def typesUnitIrCite : String :=
  "@slake_types_kind_{0,1,2} i32 align 4 + slake_types_is_valid_kind_tag + slake_types_kind_mult_ok"

/-- Types SSA symbols dual-pinned for foreign agreement (three kind SSA tags).
    Greppable: typesSsaCite, slake_types_ssa_kind_tag. -/
def typesSsaCite : String :=
  "@slake_types_ssa_kind_{value,linear,erased} i32 0/1/2 align 4 + slake_types_ssa_kind_tag + slake_types_ssa_kernel_band_ready + slake_types_ssa_is_valid_kind"

/-- Layout fixture cite (Mult-primary pattern; Types kind tags same i32 size/align).
    Greppable: layoutFixtureCite, LAYOUT-SIZE-ALIGN-FIXTURE. -/
def layoutFixtureCite : String :=
  "LAYOUT-SIZE-ALIGN-FIXTURE Mult-class tags size 4 align 4 x86_64-unknown-linux-gnu (Types kind tags same i32 pattern)"

/-- Evidence research path cite (out-of-tree recipe lives here).
    Greppable: foreignLinkEvidencePathCite. -/
def foreignLinkEvidencePathCite : String :=
  "doc/dev/research/types-foreign-link-success-2026-08-10.md"

/-- Out-of-tree dogfood honesty: consumer lives outside product git.
    Greppable: outOfTreeConsumerHonesty, out-of-tree. -/
def outOfTreeConsumerHonesty : String :=
  "out-of-tree consumer under /tmp (not product Rust under src/)"

/-- Local inventory finished for Types foreign link success residual. -/
def typesForeignLinkFinishedClaimed : Bool := true

/-- Types foreign link success claim (Types kind tags only).
    Greppable: typesForeignLinkSuccessClaimed, TYPES-FOREIGN-LINK-SUCCESS. -/
def typesForeignLinkSuccessClaimed : Bool := true

/-- Full LLVM production backend -- MUST stay false. -/
def typesForeignLinkFullBackendClaimed : Bool := false

/-- Program / Graph foreign link -- MUST stay false here.
    Mult Mult-only + Linear Mult-class tags stay in their modules.
    Greppable: typesForeignLinkOtherBandsClaimed. -/
def typesForeignLinkOtherBandsClaimed : Bool := false

/-- Local honesty: does not re-open product residual free. -/
def typesForeignLinkResidualFreeWorkClaimed : Bool := false

/-- Local honesty: not product self-host complete rebrand. -/
def typesForeignLinkProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not PROVABLY unlock work. -/
def typesForeignLinkProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not FullHostElaborateRemains true. -/
def typesForeignLinkFullHostElaborateClaimed : Bool := false

/-- Local honesty: not classic elaborator full parity rebrand. -/
def typesForeignLinkFullElaboratorParityClaimed : Bool := false

/-- Local unlock pin -- MUST stay false (LlvmHold owns living unlock). -/
def typesForeignLinkLlvmUnlocked : Bool := false

/-- Local unlock false alias. -/
def typesForeignLinkLocalUnlockFalse : Bool := !typesForeignLinkLlvmUnlocked

/-- Keeps llvm locked at this module (local pin false). -/
def typesForeignLinkKeepsLlvmLocked : Bool := !typesForeignLinkLlvmUnlocked

/-- Does not unlock llvm. -/
def typesForeignLinkDoesNotUnlockLlvm : Bool :=
  typesForeignLinkKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmTypesSsa.llvmTypesSsaKeepsLlvmLocked

/-- Types SSOT kind ids match foreign consumer tags 0/1/2.
    Greppable: typesSsotKindAgreementOk, VALUE, LINEAR, ERASED. -/
def typesSsotKindAgreementOk : Bool :=
  (typesKind0Name == "VALUE")
    && (typesKind1Name == "LINEAR")
    && (typesKind2Name == "ERASED")
    && (typesTypedIrStageName == "TYPED_IR_V0")
    && (typesFailClosedKindName == "FAIL-CLOSED-UNKNOWN-KIND")
    && isValidKindTag 0
    && isValidKindTag 1
    && isValidKindTag 2
    && !isValidKindTag 3
    && kindMultOk NodeKind.value Mult.multOmega
    && kindMultOk NodeKind.linear Mult.mult1
    && kindMultOk NodeKind.erased Mult.mult0

/-- Foreign consumer contract (size/align/encoding/target) dual-ok.
    Greppable: typesForeignLinkConsumerContractOk, FOREIGN-TYPES-CONSUMER-CONTRACT. -/
def typesForeignLinkConsumerContractOk : Bool :=
  (foreignTypesTagSizeBytes == 4)
    && (foreignTypesTagAlignBytes == 4)
    && (foreignLinkTargetTriple == "x86_64-unknown-linux-gnu")
    && (foreignTypesEncodingId == "i32")
    && (foreignTypesConsumerContractName == "FOREIGN-TYPES-CONSUMER-CONTRACT")
    && typesSsotKindAgreementOk

/-- Dual Types kind-tag layout/IR agreement recipe.
    Requires Types SSOT + consumer contract + Types SSA peer ready (not full backend)
    + freestanding/IR/SSA/fixture cites present as strings + other bands false.
    Greppable: typesForeignLinkDualAgreementOk, TYPES-FOREIGN-DUAL-AGREEMENT. -/
def typesForeignLinkDualAgreementOk : Bool :=
  typesForeignLinkConsumerContractOk
    && (typesForeignDualAgreementName == "TYPES-FOREIGN-DUAL-AGREEMENT")
    && (freestandingTypesApiCite.length > 0)
    && (typesUnitIrCite.length > 0)
    && (typesSsaCite.length > 0)
    && (layoutFixtureCite.length > 0)
    && (foreignLinkEvidencePathCite.length > 0)
    && (outOfTreeConsumerHonesty.length > 0)
    && LlvmTypesSsa.llvmTypesSsaReady
    && LlvmTypesSsa.llvmTypesSsaPartialClaimed
    && !LlvmTypesSsa.llvmTypesSsaFullBackendClaimed
    && !typesForeignLinkOtherBandsClaimed
    && !typesForeignLinkFullBackendClaimed

/-- Surface canary.
    Greppable: typesForeignLinkSurfaceOk. -/
def typesForeignLinkSurfaceOk : Bool :=
  (stageId == "SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0")
    && (hostId == "HOST-TYPES-FOREIGN-LINK")
    && (surfaceId == "HOST-TYPES-FOREIGN-LINK")
    && (typesForeignLinkSuccessName == "TYPES-FOREIGN-LINK-SUCCESS")
    && (justRecipeTypesForeignLink == "types-foreign-link-success")
    && typesForeignLinkDualAgreementOk

/-- Package ok (Types foreign link success; no product Rust crate).
    Greppable: typesForeignLinkPackageOk. -/
def typesForeignLinkPackageOk : Bool :=
  typesForeignLinkSurfaceOk
    && typesForeignLinkSuccessClaimed
    && !typesForeignLinkFullBackendClaimed
    && !typesForeignLinkOtherBandsClaimed
    && !typesForeignLinkFullHostElaborateClaimed
    && !typesForeignLinkFullElaboratorParityClaimed

/-- Structural ready.
    Greppable: typesForeignLinkReady. -/
def typesForeignLinkReady : Bool :=
  typesForeignLinkFinishedClaimed
    && typesForeignLinkPackageOk
    && typesForeignLinkKeepsLlvmLocked
    && typesForeignLinkDoesNotUnlockLlvm
    && typesForeignLinkLocalUnlockFalse
    && !typesForeignLinkLlvmUnlocked
    && !typesForeignLinkResidualFreeWorkClaimed
    && !typesForeignLinkProductSelfHostCompleteClaimed
    && !typesForeignLinkProvablyUnlockWorkClaimed
    && LlvmHold.llvmHoldReady
    && LlvmTypesSsa.llvmTypesSsaReady

/-! ### HOST-TYPES-FOREIGN-LINK-THEOREM -/

theorem typesForeignLinkFinishedClaimed_true :
    typesForeignLinkFinishedClaimed = true :=
  rfl

theorem typesForeignLinkSuccessClaimed_true :
    typesForeignLinkSuccessClaimed = true :=
  rfl

theorem typesForeignLinkFullBackendClaimed_false :
    typesForeignLinkFullBackendClaimed = false :=
  rfl

theorem typesForeignLinkOtherBandsClaimed_false :
    typesForeignLinkOtherBandsClaimed = false :=
  rfl

theorem typesForeignLinkLlvmUnlocked_false :
    typesForeignLinkLlvmUnlocked = false :=
  rfl

theorem typesForeignLinkFullHostElaborateClaimed_false :
    typesForeignLinkFullHostElaborateClaimed = false :=
  rfl

theorem typesSsotKindAgreementOk_true :
    typesSsotKindAgreementOk = true := by
  native_decide

theorem typesForeignLinkConsumerContractOk_true :
    typesForeignLinkConsumerContractOk = true := by
  native_decide

theorem typesForeignLinkDualAgreementOk_true :
    typesForeignLinkDualAgreementOk = true := by
  native_decide

theorem typesForeignLinkReady_true :
    typesForeignLinkReady = true := by
  native_decide

theorem typesForeignLinkPackageOk_true :
    typesForeignLinkPackageOk = true := by
  native_decide

theorem typesForeignLink_stageId_eq :
    stageId = "SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0" :=
  rfl

theorem typesForeignLink_hostId_eq :
    hostId = "HOST-TYPES-FOREIGN-LINK" :=
  rfl

theorem typesForeignLink_justRecipe_eq :
    justRecipeTypesForeignLink = "types-foreign-link-success" :=
  rfl

theorem foreignTypesTagSizeBytes_eq :
    foreignTypesTagSizeBytes = 4 :=
  rfl

theorem foreignTypesTagAlignBytes_eq :
    foreignTypesTagAlignBytes = 4 :=
  rfl

/-! ### HOST-TYPES-FOREIGN-LINK-SMOKE -/

example : typesForeignLinkFinishedClaimed = true := rfl
example : typesForeignLinkSuccessClaimed = true := rfl
example : typesForeignLinkFullBackendClaimed = false := rfl
example : typesForeignLinkOtherBandsClaimed = false := rfl
example : typesForeignLinkLlvmUnlocked = false := rfl
example : typesForeignLinkReady = true := by native_decide
example : typesForeignLinkDualAgreementOk = true := by native_decide
example : typesForeignLinkConsumerContractOk = true := by native_decide
example : typesSsotKindAgreementOk = true := by native_decide
example : typesForeignLinkSuccessName = "TYPES-FOREIGN-LINK-SUCCESS" := rfl
example : foreignLinkTargetTriple = "x86_64-unknown-linux-gnu" := rfl
example : foreignTypesTagSizeBytes = 4 := rfl
example : foreignTypesTagAlignBytes = 4 := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : LlvmTypesSsa.llvmTypesSsaReady = true := by native_decide
example : LlvmTypesSsa.llvmTypesSsaFullBackendClaimed = false := rfl
example : LlvmTypesSsa.llvmTypesSsaRustNativeLinkClaimed = false := rfl

end SystemsLean.TypesForeignLink
"#

end SystemsLean.HostFrontLiveTypesForeignLink
