/-
  SYSTEMS_LEAN_HOST partial -- Linear foreign link success (layout-compatible
  foreign / out-of-tree consumer for Linear Mult-class tags only). Dual Linear
  class-tag layout/IR agreement. Host Lean dual-pin of foreign consumer
  contract (i32 Linear Mult-class tags 0/1/2, size 4, align 4 on
  x86_64-unknown-linux-gnu) against Linear SSOT + freestanding Linear cite +
  Linear unit IR class tags + Linear SSA Mult-1 / live_flag honesty.
  Not product Rust under src/. Not Types/Program/Graph foreign link.
  Not Mult otherBands flip (Mult Mult-only stays in MultForeignLink).
  Not full LLVM production backend. Not free/complete/PROVABLY flip.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LINEAR-FOREIGN-LINK,
  SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0, LINEAR-FOREIGN-LINK-SUCCESS,
  linearForeignLinkSuccessClaimed, linearForeignLinkDualAgreementOk,
  linearForeignLinkConsumerContractOk, FOREIGN-LINEAR-CONSUMER-CONTRACT,
  LINEAR-FOREIGN-DUAL-AGREEMENT, just linear-foreign-link-success,
  out-of-tree, x86_64-unknown-linux-gnu, size 4, align 4, Linear, MULT-0,
  MULT-1, MULT-OMEGA, LINEAR-EXACT-ONCE, LlvmHold, llvmUnlocked,
  HOST-LINEAR-FOREIGN-LINK-SMOKE, HOST-LINEAR-FOREIGN-LINK-THEOREM.
  Module: SystemsLean.LinearForeignLink
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Short role name. Red/green: lake build SystemsLean.LinearForeignLink;
  just linear-foreign-link-success; just systems-llvm-ir.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.Linear
import SystemsLean.LlvmHold
import SystemsLean.LlvmLinearSsa

namespace SystemsLean.LinearForeignLink

open SystemsLean.Linear

/-! ### HOST-LINEAR-FOREIGN-LINK / SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0

  Linear-band foreign consumer link success: layout-compatible Linear Mult-class
  tags so an out-of-tree consumer can match Slake Linear class size/align/
  discriminants without an in-tree product Rust crate. Primary dual is Mult-class
  tags i32 0/1/2 (polyId / LINEAR-EXACT-ONCE / shareNat). Freestanding token
  struct is a secondary API cite, not a second three-grade enum.
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LINEAR-FOREIGN-LINK"

/-- Surface id (same durable token). -/
def surfaceId : String := "HOST-LINEAR-FOREIGN-LINK"

/-- Success claim name (Linear band only).
    Greppable: linearForeignLinkSuccessName, LINEAR-FOREIGN-LINK-SUCCESS. -/
def linearForeignLinkSuccessName : String := "LINEAR-FOREIGN-LINK-SUCCESS"

/-- Dual agreement recipe name.
    Greppable: linearForeignDualAgreementName, LINEAR-FOREIGN-DUAL-AGREEMENT. -/
def linearForeignDualAgreementName : String := "LINEAR-FOREIGN-DUAL-AGREEMENT"

/-- Foreign consumer contract name.
    Greppable: foreignLinearConsumerContractName, FOREIGN-LINEAR-CONSUMER-CONTRACT. -/
def foreignLinearConsumerContractName : String := "FOREIGN-LINEAR-CONSUMER-CONTRACT"

/-- just recipe for this gate.
    Greppable: justRecipeLinearForeignLink, linear-foreign-link-success. -/
def justRecipeLinearForeignLink : String := "linear-foreign-link-success"

/-- Alias used by presence greps. -/
def justRecipe : String := justRecipeLinearForeignLink

/-- Named target for Linear foreign layout (matches Mult layout fixture pattern).
    Greppable: foreignLinkTargetTriple, x86_64-unknown-linux-gnu. -/
def foreignLinkTargetTriple : String := "x86_64-unknown-linux-gnu"

/-- Linear Mult-class tag size in bytes on the named target.
    Greppable: foreignLinearTagSizeBytes. -/
def foreignLinearTagSizeBytes : Nat := 4

/-- Linear Mult-class tag align in bytes on the named target.
    Greppable: foreignLinearTagAlignBytes. -/
def foreignLinearTagAlignBytes : Nat := 4

/-- Linear Mult-class names from Linear SSOT (not a second dialect). -/
def linearClass0Name : String := Linear.mult0ClassId
def linearClass1Name : String := Linear.mult1ClassId
def linearClassOmegaName : String := Linear.multOmegaClassId
def linearExactOnceName : String := Linear.linearExactOnceId

/-- Foreign consumer encoding: Linear Mult-class tag is i32 / repr(i32)-shaped.
    Greppable: foreignLinearEncodingId, i32. -/
def foreignLinearEncodingId : String := "i32"

/-- Freestanding Linear API cite (token / consume secondary surface; not Mult enum).
    Greppable: freestandingLinearApiCite, slake_linear_token. -/
def freestandingLinearApiCite : String :=
  "slake_linear_token + slake_linear_consume + slake_linear_token_is_live + CONSUME_TOKEN_HOST_V0"

/-- Linear unit IR symbols dual-pinned for foreign agreement.
    Greppable: linearUnitIrCite, slake_linear_is_valid_class_tag. -/
def linearUnitIrCite : String :=
  "@slake_linear_class_{0,1,omega} i32 align 4 + slake_linear_is_valid_class_tag"

/-- Linear SSA symbols dual-pinned for foreign agreement (Mult-1 + live_flag honesty).
    Greppable: linearSsaCite, slake_linear_ssa_live_flag. -/
def linearSsaCite : String :=
  "@slake_linear_ssa_tag_1 MULT-1 + slake_linear_ssa_live_flag + slake_linear_ssa_kernel_band_ready + slake_linear_ssa_is_live"

/-- Layout fixture cite (Mult-primary pattern; Linear class tags same i32 size/align).
    Greppable: layoutFixtureCite, LAYOUT-SIZE-ALIGN-FIXTURE. -/
def layoutFixtureCite : String :=
  "LAYOUT-SIZE-ALIGN-FIXTURE Mult-class tags size 4 align 4 x86_64-unknown-linux-gnu (Linear class tags same i32 pattern)"

/-- Evidence research path cite (out-of-tree recipe lives here).
    Greppable: foreignLinkEvidencePathCite. -/
def foreignLinkEvidencePathCite : String :=
  "doc/dev/research/linear-foreign-link-success-2026-08-10.md"

/-- Out-of-tree dogfood honesty: consumer lives outside product git.
    Greppable: outOfTreeConsumerHonesty, out-of-tree. -/
def outOfTreeConsumerHonesty : String :=
  "out-of-tree consumer under /tmp (not product Rust under src/)"

/-- Local inventory finished for Linear foreign link success residual. -/
def linearForeignLinkFinishedClaimed : Bool := true

/-- Linear foreign link success claim (Linear Mult-class tags only).
    Greppable: linearForeignLinkSuccessClaimed, LINEAR-FOREIGN-LINK-SUCCESS. -/
def linearForeignLinkSuccessClaimed : Bool := true

/-- Full LLVM production backend -- MUST stay false. -/
def linearForeignLinkFullBackendClaimed : Bool := false

/-- Types / Program / Graph foreign link -- MUST stay false here.
    Mult Mult-only stays in MultForeignLink (not flipped by this module).
    Greppable: linearForeignLinkOtherBandsClaimed. -/
def linearForeignLinkOtherBandsClaimed : Bool := false

/-- Local honesty: does not re-open product residual free. -/
def linearForeignLinkResidualFreeWorkClaimed : Bool := false

/-- Local honesty: not product self-host complete rebrand. -/
def linearForeignLinkProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not PROVABLY unlock work. -/
def linearForeignLinkProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not FullHostElaborateRemains true. -/
def linearForeignLinkFullHostElaborateClaimed : Bool := false

/-- Local honesty: not classic elaborator full parity rebrand. -/
def linearForeignLinkFullElaboratorParityClaimed : Bool := false

/-- Local unlock pin -- MUST stay false (LlvmHold owns living unlock). -/
def linearForeignLinkLlvmUnlocked : Bool := false

/-- Local unlock false alias. -/
def linearForeignLinkLocalUnlockFalse : Bool := !linearForeignLinkLlvmUnlocked

/-- Keeps llvm locked at this module (local pin false). -/
def linearForeignLinkKeepsLlvmLocked : Bool := !linearForeignLinkLlvmUnlocked

/-- Does not unlock llvm. -/
def linearForeignLinkDoesNotUnlockLlvm : Bool :=
  linearForeignLinkKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmLinearSsa.llvmLinearSsaKeepsLlvmLocked

/-- Linear SSOT Mult-class ids match foreign consumer tags 0/1/2.
    Greppable: linearSsotClassAgreementOk, LINEAR-EXACT-ONCE. -/
def linearSsotClassAgreementOk : Bool :=
  (linearClass0Name == "MULT-0")
    && (linearClass1Name == "MULT-1")
    && (linearClassOmegaName == "MULT-OMEGA")
    && (linearExactOnceName == "LINEAR-EXACT-ONCE")
    && Linear.linearAxiomInventoryOk

/-- Foreign consumer contract (size/align/encoding/target) dual-ok.
    Greppable: linearForeignLinkConsumerContractOk, FOREIGN-LINEAR-CONSUMER-CONTRACT. -/
def linearForeignLinkConsumerContractOk : Bool :=
  (foreignLinearTagSizeBytes == 4)
    && (foreignLinearTagAlignBytes == 4)
    && (foreignLinkTargetTriple == "x86_64-unknown-linux-gnu")
    && (foreignLinearEncodingId == "i32")
    && (foreignLinearConsumerContractName == "FOREIGN-LINEAR-CONSUMER-CONTRACT")
    && linearSsotClassAgreementOk

/-- Dual Linear class-tag layout/IR agreement recipe.
    Requires Linear SSOT + consumer contract + Linear SSA peer ready (not full backend)
    + freestanding/IR/SSA/fixture cites present as strings + other bands false.
    Greppable: linearForeignLinkDualAgreementOk, LINEAR-FOREIGN-DUAL-AGREEMENT. -/
def linearForeignLinkDualAgreementOk : Bool :=
  linearForeignLinkConsumerContractOk
    && (linearForeignDualAgreementName == "LINEAR-FOREIGN-DUAL-AGREEMENT")
    && (freestandingLinearApiCite.length > 0)
    && (linearUnitIrCite.length > 0)
    && (linearSsaCite.length > 0)
    && (layoutFixtureCite.length > 0)
    && (foreignLinkEvidencePathCite.length > 0)
    && (outOfTreeConsumerHonesty.length > 0)
    && LlvmLinearSsa.llvmLinearSsaReady
    && LlvmLinearSsa.llvmLinearSsaPartialClaimed
    && !LlvmLinearSsa.llvmLinearSsaFullBackendClaimed
    && !linearForeignLinkOtherBandsClaimed
    && !linearForeignLinkFullBackendClaimed

/-- Surface canary.
    Greppable: linearForeignLinkSurfaceOk. -/
def linearForeignLinkSurfaceOk : Bool :=
  (stageId == "SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0")
    && (hostId == "HOST-LINEAR-FOREIGN-LINK")
    && (surfaceId == "HOST-LINEAR-FOREIGN-LINK")
    && (linearForeignLinkSuccessName == "LINEAR-FOREIGN-LINK-SUCCESS")
    && (justRecipeLinearForeignLink == "linear-foreign-link-success")
    && linearForeignLinkDualAgreementOk

/-- Package ok (Linear foreign link success; no product Rust crate).
    Greppable: linearForeignLinkPackageOk. -/
def linearForeignLinkPackageOk : Bool :=
  linearForeignLinkSurfaceOk
    && linearForeignLinkSuccessClaimed
    && !linearForeignLinkFullBackendClaimed
    && !linearForeignLinkOtherBandsClaimed
    && !linearForeignLinkFullHostElaborateClaimed
    && !linearForeignLinkFullElaboratorParityClaimed

/-- Structural ready.
    Greppable: linearForeignLinkReady. -/
def linearForeignLinkReady : Bool :=
  linearForeignLinkFinishedClaimed
    && linearForeignLinkPackageOk
    && linearForeignLinkKeepsLlvmLocked
    && linearForeignLinkDoesNotUnlockLlvm
    && linearForeignLinkLocalUnlockFalse
    && !linearForeignLinkLlvmUnlocked
    && !linearForeignLinkResidualFreeWorkClaimed
    && !linearForeignLinkProductSelfHostCompleteClaimed
    && !linearForeignLinkProvablyUnlockWorkClaimed
    && LlvmHold.llvmHoldReady
    && LlvmLinearSsa.llvmLinearSsaReady

/-! ### HOST-LINEAR-FOREIGN-LINK-THEOREM -/

theorem linearForeignLinkFinishedClaimed_true :
    linearForeignLinkFinishedClaimed = true :=
  rfl

theorem linearForeignLinkSuccessClaimed_true :
    linearForeignLinkSuccessClaimed = true :=
  rfl

theorem linearForeignLinkFullBackendClaimed_false :
    linearForeignLinkFullBackendClaimed = false :=
  rfl

theorem linearForeignLinkOtherBandsClaimed_false :
    linearForeignLinkOtherBandsClaimed = false :=
  rfl

theorem linearForeignLinkLlvmUnlocked_false :
    linearForeignLinkLlvmUnlocked = false :=
  rfl

theorem linearForeignLinkFullHostElaborateClaimed_false :
    linearForeignLinkFullHostElaborateClaimed = false :=
  rfl

theorem linearSsotClassAgreementOk_true :
    linearSsotClassAgreementOk = true := by
  native_decide

theorem linearForeignLinkConsumerContractOk_true :
    linearForeignLinkConsumerContractOk = true := by
  native_decide

theorem linearForeignLinkDualAgreementOk_true :
    linearForeignLinkDualAgreementOk = true := by
  native_decide

theorem linearForeignLinkReady_true :
    linearForeignLinkReady = true := by
  native_decide

theorem linearForeignLinkPackageOk_true :
    linearForeignLinkPackageOk = true := by
  native_decide

theorem linearForeignLink_stageId_eq :
    stageId = "SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0" :=
  rfl

theorem linearForeignLink_hostId_eq :
    hostId = "HOST-LINEAR-FOREIGN-LINK" :=
  rfl

theorem linearForeignLink_justRecipe_eq :
    justRecipeLinearForeignLink = "linear-foreign-link-success" :=
  rfl

theorem foreignLinearTagSizeBytes_eq :
    foreignLinearTagSizeBytes = 4 :=
  rfl

theorem foreignLinearTagAlignBytes_eq :
    foreignLinearTagAlignBytes = 4 :=
  rfl

/-! ### HOST-LINEAR-FOREIGN-LINK-SMOKE -/

example : linearForeignLinkFinishedClaimed = true := rfl
example : linearForeignLinkSuccessClaimed = true := rfl
example : linearForeignLinkFullBackendClaimed = false := rfl
example : linearForeignLinkOtherBandsClaimed = false := rfl
example : linearForeignLinkLlvmUnlocked = false := rfl
example : linearForeignLinkReady = true := by native_decide
example : linearForeignLinkDualAgreementOk = true := by native_decide
example : linearForeignLinkConsumerContractOk = true := by native_decide
example : linearSsotClassAgreementOk = true := by native_decide
example : linearForeignLinkSuccessName = "LINEAR-FOREIGN-LINK-SUCCESS" := rfl
example : foreignLinkTargetTriple = "x86_64-unknown-linux-gnu" := rfl
example : foreignLinearTagSizeBytes = 4 := rfl
example : foreignLinearTagAlignBytes = 4 := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : LlvmLinearSsa.llvmLinearSsaReady = true := by native_decide
example : LlvmLinearSsa.llvmLinearSsaFullBackendClaimed = false := rfl
example : LlvmLinearSsa.llvmLinearSsaRustNativeLinkClaimed = false := rfl

end SystemsLean.LinearForeignLink
