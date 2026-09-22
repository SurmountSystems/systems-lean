/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProgramForeignLink.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProgramForeignLinkSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-PROGRAM-FOREIGN-LINK, liveProgramForeignLinkSource,
  HOST-FRONT-LIVE-PROGRAM-FOREIGN-LINK, PROGRAM-FOREIGN-LINK, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProgramForeignLinkSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProgramForeignLink

/-- Dual-pinned live ProgramForeignLink.lean bytes (must match on-disk file).
    Greppable: liveProgramForeignLinkSource, PARSE-LIVE-PROGRAM-FOREIGN-LINK. -/
def liveProgramForeignLinkSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Program foreign link success (layout-compatible
  foreign / out-of-tree consumer for Program push-status codes only). Dual
  Program push-status layout/IR agreement. Host Lean dual-pin of foreign
  consumer contract (i32 Program push codes 0, -1, -2 ok/badNode/full, size 4,
  align 4, programCap 8 on x86_64-unknown-linux-gnu) against Program SSOT +
  freestanding Program subset cite + Program unit IR push constants + Program
  SSA push constants / push_status honesty.
  Not product Rust under src/. Not Graph foreign link.
  Not Mult/Linear/Types otherBands flip (those stay Mult/Linear/Types-only).
  Not full LLVM production backend. Not free/complete/PROVABLY flip.
  Honest dual surface: Program IR does not use a three-tag kind enum; primary
  dual is emit push status codes (0 ok, -1 badNode, -2 full) plus CAP=8.
  SSA status_ix 0/1/2 is a secondary index that maps to those codes.
  Greppable: SYSTEMS_LEAN_HOST, HOST-PROGRAM-FOREIGN-LINK,
  SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0, PROGRAM-FOREIGN-LINK-SUCCESS,
  programForeignLinkSuccessClaimed, programForeignLinkDualAgreementOk,
  programForeignLinkConsumerContractOk, FOREIGN-PROGRAM-CONSUMER-CONTRACT,
  PROGRAM-FOREIGN-DUAL-AGREEMENT, just program-foreign-link-success,
  out-of-tree, x86_64-unknown-linux-gnu, size 4, align 4, Program,
  ORDERED-IR-PROGRAM, EMPTY-PROGRAM-FAIL-CLOSED, SLAKE_IR_PROGRAM_CAP,
  push_ok, push_bad, push_full, LlvmHold, llvmUnlocked,
  HOST-PROGRAM-FOREIGN-LINK-SMOKE, HOST-PROGRAM-FOREIGN-LINK-THEOREM.
  Module: SystemsLean.ProgramForeignLink
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Short role name. Red/green: lake build SystemsLean.ProgramForeignLink;
  just program-foreign-link-success; just systems-llvm-ir.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.IrProgram
import SystemsLean.LlvmHold
import SystemsLean.LlvmProgramSsa

namespace SystemsLean.ProgramForeignLink

open SystemsLean.IrProgram

/-! ### HOST-PROGRAM-FOREIGN-LINK / SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0

  Program-band foreign consumer link success: layout-compatible Program
  push-status codes so an out-of-tree consumer can match Slake Program push
  size/align/discriminants without an in-tree product Rust crate. Primary dual
  is push status i32 codes 0 / -1 / -2 (ok / badNode / full) and CAP=8.
  Freestanding slake_ir_program + push is a secondary API cite (struct + API).
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-PROGRAM-FOREIGN-LINK"

/-- Surface id (same durable token). -/
def surfaceId : String := "HOST-PROGRAM-FOREIGN-LINK"

/-- Success claim name (Program band only).
    Greppable: programForeignLinkSuccessName, PROGRAM-FOREIGN-LINK-SUCCESS. -/
def programForeignLinkSuccessName : String := "PROGRAM-FOREIGN-LINK-SUCCESS"

/-- Dual agreement recipe name.
    Greppable: programForeignDualAgreementName, PROGRAM-FOREIGN-DUAL-AGREEMENT. -/
def programForeignDualAgreementName : String := "PROGRAM-FOREIGN-DUAL-AGREEMENT"

/-- Foreign consumer contract name.
    Greppable: foreignProgramConsumerContractName, FOREIGN-PROGRAM-CONSUMER-CONTRACT. -/
def foreignProgramConsumerContractName : String := "FOREIGN-PROGRAM-CONSUMER-CONTRACT"

/-- just recipe for this gate.
    Greppable: justRecipeProgramForeignLink, program-foreign-link-success. -/
def justRecipeProgramForeignLink : String := "program-foreign-link-success"

/-- Alias used by presence greps. -/
def justRecipe : String := justRecipeProgramForeignLink

/-- Named target for Program foreign layout (matches Mult layout fixture pattern).
    Greppable: foreignLinkTargetTriple, x86_64-unknown-linux-gnu. -/
def foreignLinkTargetTriple : String := "x86_64-unknown-linux-gnu"

/-- Program push-status code size in bytes on the named target.
    Greppable: foreignProgramTagSizeBytes. -/
def foreignProgramTagSizeBytes : Nat := 4

/-- Program push-status code align in bytes on the named target.
    Greppable: foreignProgramTagAlignBytes. -/
def foreignProgramTagAlignBytes : Nat := 4

/-- Foreign consumer encoding: Program push status is i32 / repr(i32)-shaped.
    Greppable: foreignProgramEncodingId, i32. -/
def foreignProgramEncodingId : String := "i32"

/-- Primary dual: emit push status codes (IrProgram emit map).
    Greppable: foreignProgramPushOkCode, foreignProgramPushBadCode,
    foreignProgramPushFullCode. -/
def foreignProgramPushOkCode : Int := 0
def foreignProgramPushBadCode : Int := -1
def foreignProgramPushFullCode : Int := -2

/-- Program capacity dual (IrProgram.programCap / SLAKE_IR_PROGRAM_CAP).
    Greppable: foreignProgramCap. -/
def foreignProgramCap : Nat := 8

/-- SSA status_ix secondary index (maps to primary codes 0, -1, -2).
    Greppable: foreignProgramStatusIxOk, foreignProgramStatusIxBad,
    foreignProgramStatusIxFull. -/
def foreignProgramStatusIxOk : Nat := 0
def foreignProgramStatusIxBad : Nat := 1
def foreignProgramStatusIxFull : Nat := 2

/-- Program surface names from Program SSOT (not a second dialect). -/
def programOrderedIrName : String := "ORDERED-IR-PROGRAM"
def programEmptyFailClosedName : String := "EMPTY-PROGRAM-FAIL-CLOSED"
def programCapStageName : String := "SLAKE_IR_PROGRAM_CAP"

/-- Freestanding Program API cite (slake_ir_program + push / is_well_typed).
    Greppable: freestandingProgramApiCite, slake_ir_program. -/
def freestandingProgramApiCite : String :=
  "slake_ir_program CAP=8 + slake_ir_program_push 0/-1/-2 + is_well_typed empty-fail-closed + IR_PROGRAM_V0 + SLAKE_IR_PROGRAM_CAP"

/-- Program unit IR symbols dual-pinned for foreign agreement.
    Greppable: programUnitIrCite, slake_program_push_ok. -/
def programUnitIrCite : String :=
  "@slake_program_cap i32 8 + @slake_program_push_{ok,bad,full} i32 0/-1/-2 align 4 + slake_program_is_well_typed + slake_program_push_capacity"

/-- Program SSA symbols dual-pinned for foreign agreement (push status + CAP).
    Greppable: programSsaCite, slake_program_ssa_push_status. -/
def programSsaCite : String :=
  "@slake_program_ssa_cap i32 8 + @slake_program_ssa_push_{ok,bad,full} i32 0/-1/-2 align 4 + slake_program_ssa_push_status status_ix 0/1/2 + kernel_band_ready + is_well_typed"

/-- Layout fixture cite (Mult-primary pattern; Program push codes same i32 size/align).
    Greppable: layoutFixtureCite, LAYOUT-SIZE-ALIGN-FIXTURE. -/
def layoutFixtureCite : String :=
  "LAYOUT-SIZE-ALIGN-FIXTURE Mult-class tags size 4 align 4 x86_64-unknown-linux-gnu (Program push codes same i32 pattern)"

/-- Evidence research path cite (out-of-tree recipe lives here).
    Greppable: foreignLinkEvidencePathCite. -/
def foreignLinkEvidencePathCite : String :=
  "doc/dev/research/program-foreign-link-success-2026-08-10.md"

/-- Out-of-tree dogfood honesty: consumer lives outside product git.
    Greppable: outOfTreeConsumerHonesty, out-of-tree. -/
def outOfTreeConsumerHonesty : String :=
  "out-of-tree consumer under /tmp (not product Rust under src/)"

/-- Local inventory finished for Program foreign link success residual. -/
def programForeignLinkFinishedClaimed : Bool := true

/-- Program foreign link success claim (Program push-status codes only).
    Greppable: programForeignLinkSuccessClaimed, PROGRAM-FOREIGN-LINK-SUCCESS. -/
def programForeignLinkSuccessClaimed : Bool := true

/-- Full LLVM production backend -- MUST stay false. -/
def programForeignLinkFullBackendClaimed : Bool := false

/-- Graph foreign link -- MUST stay false here.
    Mult Mult-only + Linear Mult-class + Types kind tags stay in their modules.
    Greppable: programForeignLinkOtherBandsClaimed. -/
def programForeignLinkOtherBandsClaimed : Bool := false

/-- Local honesty: does not re-open product residual free. -/
def programForeignLinkResidualFreeWorkClaimed : Bool := false

/-- Local honesty: not product self-host complete rebrand. -/
def programForeignLinkProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not PROVABLY unlock work. -/
def programForeignLinkProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not FullHostElaborateRemains true. -/
def programForeignLinkFullHostElaborateClaimed : Bool := false

/-- Local honesty: not classic elaborator full parity rebrand. -/
def programForeignLinkFullElaboratorParityClaimed : Bool := false

/-- Local unlock pin -- MUST stay false (LlvmHold owns living unlock). -/
def programForeignLinkLlvmUnlocked : Bool := false

/-- Local unlock false alias. -/
def programForeignLinkLocalUnlockFalse : Bool := !programForeignLinkLlvmUnlocked

/-- Keeps llvm locked at this module (local pin false). -/
def programForeignLinkKeepsLlvmLocked : Bool := !programForeignLinkLlvmUnlocked

/-- Does not unlock llvm. -/
def programForeignLinkDoesNotUnlockLlvm : Bool :=
  programForeignLinkKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmProgramSsa.llvmProgramSsaKeepsLlvmLocked

/-- Program SSOT push-status / CAP agreement with foreign consumer codes.
    Greppable: programSsotPushAgreementOk, ORDERED-IR-PROGRAM,
    EMPTY-PROGRAM-FAIL-CLOSED, SLAKE_IR_PROGRAM_CAP. -/
def programSsotPushAgreementOk : Bool :=
  (programCap == foreignProgramCap)
    && (programCap == 8)
    && (foreignProgramPushOkCode == (0 : Int))
    && (foreignProgramPushBadCode == (-1 : Int))
    && (foreignProgramPushFullCode == (-2 : Int))
    && (foreignProgramStatusIxOk == 0)
    && (foreignProgramStatusIxBad == 1)
    && (foreignProgramStatusIxFull == 2)
    && (programOrderedIrName == "ORDERED-IR-PROGRAM")
    && (programEmptyFailClosedName == "EMPTY-PROGRAM-FAIL-CLOSED")
    && (programCapStageName == "SLAKE_IR_PROGRAM_CAP")
    && !isWellTyped empty
    && checkFailClosed empty = false

/-- Foreign consumer contract (size/align/encoding/target/codes) dual-ok.
    Greppable: programForeignLinkConsumerContractOk, FOREIGN-PROGRAM-CONSUMER-CONTRACT. -/
def programForeignLinkConsumerContractOk : Bool :=
  (foreignProgramTagSizeBytes == 4)
    && (foreignProgramTagAlignBytes == 4)
    && (foreignLinkTargetTriple == "x86_64-unknown-linux-gnu")
    && (foreignProgramEncodingId == "i32")
    && (foreignProgramConsumerContractName == "FOREIGN-PROGRAM-CONSUMER-CONTRACT")
    && (foreignProgramCap == 8)
    && programSsotPushAgreementOk

/-- Dual Program push-status layout/IR agreement recipe.
    Requires Program SSOT + consumer contract + Program SSA peer ready (not full
    backend) + freestanding/IR/SSA/fixture cites present as strings + Graph
    other bands false.
    Greppable: programForeignLinkDualAgreementOk, PROGRAM-FOREIGN-DUAL-AGREEMENT. -/
def programForeignLinkDualAgreementOk : Bool :=
  programForeignLinkConsumerContractOk
    && (programForeignDualAgreementName == "PROGRAM-FOREIGN-DUAL-AGREEMENT")
    && (freestandingProgramApiCite.length > 0)
    && (programUnitIrCite.length > 0)
    && (programSsaCite.length > 0)
    && (layoutFixtureCite.length > 0)
    && (foreignLinkEvidencePathCite.length > 0)
    && (outOfTreeConsumerHonesty.length > 0)
    && LlvmProgramSsa.llvmProgramSsaReady
    && LlvmProgramSsa.llvmProgramSsaPartialClaimed
    && !LlvmProgramSsa.llvmProgramSsaFullBackendClaimed
    && !programForeignLinkOtherBandsClaimed
    && !programForeignLinkFullBackendClaimed

/-- Surface canary.
    Greppable: programForeignLinkSurfaceOk. -/
def programForeignLinkSurfaceOk : Bool :=
  (stageId == "SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0")
    && (hostId == "HOST-PROGRAM-FOREIGN-LINK")
    && (surfaceId == "HOST-PROGRAM-FOREIGN-LINK")
    && (programForeignLinkSuccessName == "PROGRAM-FOREIGN-LINK-SUCCESS")
    && (justRecipeProgramForeignLink == "program-foreign-link-success")
    && programForeignLinkDualAgreementOk

/-- Package ok (Program foreign link success; no product Rust crate).
    Greppable: programForeignLinkPackageOk. -/
def programForeignLinkPackageOk : Bool :=
  programForeignLinkSurfaceOk
    && programForeignLinkSuccessClaimed
    && !programForeignLinkFullBackendClaimed
    && !programForeignLinkOtherBandsClaimed
    && !programForeignLinkFullHostElaborateClaimed
    && !programForeignLinkFullElaboratorParityClaimed

/-- Structural ready.
    Greppable: programForeignLinkReady. -/
def programForeignLinkReady : Bool :=
  programForeignLinkFinishedClaimed
    && programForeignLinkPackageOk
    && programForeignLinkKeepsLlvmLocked
    && programForeignLinkDoesNotUnlockLlvm
    && programForeignLinkLocalUnlockFalse
    && !programForeignLinkLlvmUnlocked
    && !programForeignLinkResidualFreeWorkClaimed
    && !programForeignLinkProductSelfHostCompleteClaimed
    && !programForeignLinkProvablyUnlockWorkClaimed
    && LlvmHold.llvmHoldReady
    && LlvmProgramSsa.llvmProgramSsaReady

/-! ### HOST-PROGRAM-FOREIGN-LINK-THEOREM -/

theorem programForeignLinkFinishedClaimed_true :
    programForeignLinkFinishedClaimed = true :=
  rfl

theorem programForeignLinkSuccessClaimed_true :
    programForeignLinkSuccessClaimed = true :=
  rfl

theorem programForeignLinkFullBackendClaimed_false :
    programForeignLinkFullBackendClaimed = false :=
  rfl

theorem programForeignLinkOtherBandsClaimed_false :
    programForeignLinkOtherBandsClaimed = false :=
  rfl

theorem programForeignLinkLlvmUnlocked_false :
    programForeignLinkLlvmUnlocked = false :=
  rfl

theorem programForeignLinkFullHostElaborateClaimed_false :
    programForeignLinkFullHostElaborateClaimed = false :=
  rfl

theorem programSsotPushAgreementOk_true :
    programSsotPushAgreementOk = true := by
  native_decide

theorem programForeignLinkConsumerContractOk_true :
    programForeignLinkConsumerContractOk = true := by
  native_decide

theorem programForeignLinkDualAgreementOk_true :
    programForeignLinkDualAgreementOk = true := by
  native_decide

theorem programForeignLinkReady_true :
    programForeignLinkReady = true := by
  native_decide

theorem programForeignLinkPackageOk_true :
    programForeignLinkPackageOk = true := by
  native_decide

theorem programForeignLink_stageId_eq :
    stageId = "SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0" :=
  rfl

theorem programForeignLink_hostId_eq :
    hostId = "HOST-PROGRAM-FOREIGN-LINK" :=
  rfl

theorem programForeignLink_justRecipe_eq :
    justRecipeProgramForeignLink = "program-foreign-link-success" :=
  rfl

theorem foreignProgramTagSizeBytes_eq :
    foreignProgramTagSizeBytes = 4 :=
  rfl

theorem foreignProgramTagAlignBytes_eq :
    foreignProgramTagAlignBytes = 4 :=
  rfl

theorem foreignProgramCap_eq :
    foreignProgramCap = 8 :=
  rfl

theorem foreignProgramPushOkCode_eq :
    foreignProgramPushOkCode = (0 : Int) :=
  rfl

theorem foreignProgramPushBadCode_eq :
    foreignProgramPushBadCode = (-1 : Int) :=
  rfl

theorem foreignProgramPushFullCode_eq :
    foreignProgramPushFullCode = (-2 : Int) :=
  rfl

/-! ### HOST-PROGRAM-FOREIGN-LINK-SMOKE -/

example : programForeignLinkFinishedClaimed = true := rfl
example : programForeignLinkSuccessClaimed = true := rfl
example : programForeignLinkFullBackendClaimed = false := rfl
example : programForeignLinkOtherBandsClaimed = false := rfl
example : programForeignLinkLlvmUnlocked = false := rfl
example : programForeignLinkReady = true := by native_decide
example : programForeignLinkDualAgreementOk = true := by native_decide
example : programForeignLinkConsumerContractOk = true := by native_decide
example : programSsotPushAgreementOk = true := by native_decide
example : programForeignLinkSuccessName = "PROGRAM-FOREIGN-LINK-SUCCESS" := rfl
example : foreignLinkTargetTriple = "x86_64-unknown-linux-gnu" := rfl
example : foreignProgramTagSizeBytes = 4 := rfl
example : foreignProgramTagAlignBytes = 4 := rfl
example : foreignProgramCap = 8 := rfl
example : foreignProgramPushOkCode = (0 : Int) := rfl
example : foreignProgramPushBadCode = (-1 : Int) := rfl
example : foreignProgramPushFullCode = (-2 : Int) := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : LlvmProgramSsa.llvmProgramSsaReady = true := by native_decide
example : LlvmProgramSsa.llvmProgramSsaFullBackendClaimed = false := rfl
example : LlvmProgramSsa.llvmProgramSsaRustNativeLinkClaimed = false := rfl

end SystemsLean.ProgramForeignLink
"#

end SystemsLean.HostFrontLiveProgramForeignLink
