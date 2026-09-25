/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckAcceptsLater.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckAcceptsLaterSource. Not occupancy name 50. Not mill remill. Mill stays 69 of 69.
  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckAcceptsLaterSource
  PARSE-LIVE-HOSTMODULECHECKACCEPTSLATER
  HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSLATER
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckAcceptsLaterSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckAcceptsLaterSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckAcceptsLater

/-- Dual-pinned live HostModuleCheckAcceptsLater.lean bytes (must match on-disk file).
    Greppable: liveHostModuleCheckAcceptsLaterSource, PARSE-LIVE-HOSTMODULECHECKACCEPTSLATER. -/
def liveHostModuleCheckAcceptsLaterSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck fail-closed bads and foundation
  TERM/PROOF twins (long-file split from HostModuleCheckAccepts).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: missing-decl fail-closed rejects plus Mult..Extract
  L2/L3 checkRealModule twins. Same namespace SystemsLean.HostModuleCheck.
  Sub-1-KLOC: do not grow past 1000.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckAcceptsLater,
  hostModuleCheckBadMissingInductive, hostModuleCheckBadMissingErasedStructure,
  hostModuleCheckBadMissingKernelReady, hostModuleCheckBadMissingPlanStructure,
  hostModuleCheckBadMissingParityReady, TERM-SURFACE, ILL-TYPED-TERM,
  PROOF-SURFACE, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckAcceptsLater
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckAcceptsLater;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckRealModule
import SystemsLean.HostModuleCheckMultTerm
import SystemsLean.HostModuleCheckMultProof
import SystemsLean.HostModuleCheckLinearProof
import SystemsLean.HostModuleCheckTypesProof
import SystemsLean.HostModuleCheckLinearTerm
import SystemsLean.HostModuleCheckTypesTerm
import SystemsLean.HostModuleCheckIrProgramTerm
import SystemsLean.HostModuleCheckIrGraphTerm
import SystemsLean.HostModuleCheckHostComposeTerm
import SystemsLean.HostModuleCheckErasureTerm
import SystemsLean.HostModuleCheckExtractTerm

namespace SystemsLean.HostModuleCheck

/-- Bad missing inductive rejects. Greppable: hostModuleCheckBadMissingInductive. -/
def hostModuleCheckBadMissingInductive : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadMissingInductiveText

/-- Bad missing namespace rejects. Greppable: hostModuleCheckBadMissingNamespace. -/
def hostModuleCheckBadMissingNamespace : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadMissingNamespaceText

/-- Bad empty rejects. Greppable: hostModuleCheckBadEmpty. -/
def hostModuleCheckBadEmpty : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadEmptyText

/-- Bad missing theorem rejects. Greppable: hostModuleCheckBadMissingTheorem. -/
def hostModuleCheckBadMissingTheorem : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultTheorems" hostModuleCheckBadMissingTheoremText

/-- Bad missing Linear axiom rejects (A56 FOUNDATION-KIND-SURFACE).
    Greppable: hostModuleCheckBadMissingAxiom, Check depth deepen. -/
def hostModuleCheckBadMissingAxiom : ModuleCheckResult :=
  checkRealModule "SystemsLean.Linear" hostModuleCheckBadMissingAxiomText

/-- Bad missing Types structure rejects (A56 FOUNDATION-KIND-SURFACE).
    Greppable: hostModuleCheckBadMissingStructure, Check depth deepen. -/
def hostModuleCheckBadMissingStructure : ModuleCheckResult :=
  checkRealModule "SystemsLean.Types" hostModuleCheckBadMissingStructureText

/-- Bad missing IrProgram structure Program rejects (A57 deepen continue).
    Greppable: hostModuleCheckBadMissingProgramStructure,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckBadMissingProgramStructure : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgram"
    hostModuleCheckBadMissingProgramStructureText

/-- Bad missing Erasure structure Erased rejects (A58 deepen continue).
    Greppable: hostModuleCheckBadMissingErasedStructure,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckBadMissingErasedStructure : ModuleCheckResult :=
  checkRealModule "SystemsLean.Erasure"
    hostModuleCheckBadMissingErasedStructureText

/-- Bad missing KernelMult lowerMultKernel rejects (Kind-surface band expand).
    Greppable: hostModuleCheckBadMissingKernelReady,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckBadMissingKernelReady : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelMult"
    hostModuleCheckBadMissingKernelReadyText

/-- Bad missing EmitPlan structure Plan rejects (Kind-surface second band).
    Greppable: hostModuleCheckBadMissingPlanStructure,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE,
    Kind-surface second band. -/
def hostModuleCheckBadMissingPlanStructure : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlan"
    hostModuleCheckBadMissingPlanStructureText

/-- Bad missing ParityMult multParityReady rejects (Kind-surface third band).
    Greppable: hostModuleCheckBadMissingParityReady,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE,
    Kind-surface third band. -/
def hostModuleCheckBadMissingParityReady : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityMult"
    hostModuleCheckBadMissingParityReadyText

/-! ### Mult L2 term-surface ill-typed twins (T2/T3/T5; full checkRealModule) -/

/-- Good Mult L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodMultTerm, TERM-SURFACE. -/
def hostModuleCheckGoodMultTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckGoodMultTermText

/-- T2 wrong name return type rejects under L2.
    Greppable: hostModuleCheckBadMultNameReturnType, ILL-TYPED-TERM, TERM-SURFACE. -/
def hostModuleCheckBadMultNameReturnType : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadMultNameReturnTypeText

/-- T3 ill-typed multIsValid app rejects under L2.
    Greppable: hostModuleCheckBadMultIsValidApp, ILL-TYPED-TERM, TERM-SURFACE. -/
def hostModuleCheckBadMultIsValidApp : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadMultIsValidAppText

/-- T5 wrong isValid arm type rejects under L2.
    Greppable: hostModuleCheckBadMultIsValidArm, ILL-TYPED-TERM, TERM-SURFACE. -/
def hostModuleCheckBadMultIsValidArm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadMultIsValidArmText

/-! ### MultTheorems L3 proof-surface twins (P1/P2; full checkRealModule) -/

/-- Good MultTheorems L3 proof fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodMultTheoremsProof, PROOF-SURFACE. -/
def hostModuleCheckGoodMultTheoremsProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultTheorems"
    hostModuleCheckGoodMultTheoremsProofText

/-- P1 wrong ofNat?_zero statement rejects under L3.
    Greppable: hostModuleCheckBadMultThmWrongStmt, ILL-TYPED-PROOF, PROOF-SURFACE. -/
def hostModuleCheckBadMultThmWrongStmt : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultTheorems"
    hostModuleCheckBadMultThmWrongStmtText

/-- P2 by sorry on ofNat?_zero rejects under L3.
    Greppable: hostModuleCheckBadMultThmSorry, ILL-TYPED-PROOF, PROOF-SURFACE. -/
def hostModuleCheckBadMultThmSorry : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultTheorems"
    hostModuleCheckBadMultThmSorryText

/-! ### LinearTheorems L3 proof-surface twins (P1/P2; full checkRealModule) -/

/-- Good LinearTheorems L3 proof fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodLinearTheoremsProof, PROOF-SURFACE. -/
def hostModuleCheckGoodLinearTheoremsProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.LinearTheorems"
    hostModuleCheckGoodLinearTheoremsProofText

/-- P1 wrong shareNat_zero statement rejects under L3.
    Greppable: hostModuleCheckBadLinearThmWrongStmt, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadLinearThmWrongStmt : ModuleCheckResult :=
  checkRealModule "SystemsLean.LinearTheorems"
    hostModuleCheckBadLinearThmWrongStmtText

/-- P2 by sorry on shareNat_zero rejects under L3.
    Greppable: hostModuleCheckBadLinearThmSorry, ILL-TYPED-PROOF, PROOF-SURFACE. -/
def hostModuleCheckBadLinearThmSorry : ModuleCheckResult :=
  checkRealModule "SystemsLean.LinearTheorems"
    hostModuleCheckBadLinearThmSorryText

/-! ### TypesTheorems L3 proof-surface twins (P1/P2; full checkRealModule) -/

/-- Good TypesTheorems L3 proof fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodTypesTheoremsProof, PROOF-SURFACE. -/
def hostModuleCheckGoodTypesTheoremsProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.TypesTheorems"
    hostModuleCheckGoodTypesTheoremsProofText

/-- P1 wrong ofKindTag?_zero statement rejects under L3.
    Greppable: hostModuleCheckBadTypesThmWrongStmt, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmWrongStmt : ModuleCheckResult :=
  checkRealModule "SystemsLean.TypesTheorems"
    hostModuleCheckBadTypesThmWrongStmtText

/-- P2 by sorry on ofKindTag?_zero rejects under L3.
    Greppable: hostModuleCheckBadTypesThmSorry, ILL-TYPED-PROOF, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmSorry : ModuleCheckResult :=
  checkRealModule "SystemsLean.TypesTheorems"
    hostModuleCheckBadTypesThmSorryText

/-! ### Linear L2 term-surface ill-typed twins (LT1..LT4; full checkRealModule) -/

/-- Good Linear L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodLinearTerm, TERM-SURFACE, Linear-only. -/
def hostModuleCheckGoodLinearTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Linear" hostModuleCheckGoodLinearTermText

/-- LT1 wrong shareNat return type rejects under L2.
    Greppable: hostModuleCheckBadLinearShareNatReturnType, ILL-TYPED-TERM,
    TERM-SURFACE, Linear-only. -/
def hostModuleCheckBadLinearShareNatReturnType : ModuleCheckResult :=
  checkRealModule "SystemsLean.Linear"
    hostModuleCheckBadLinearShareNatReturnTypeText

/-- LT2 wrong polyId body rejects under L2.
    Greppable: hostModuleCheckBadLinearPolyIdBody, ILL-TYPED-TERM,
    TERM-SURFACE, Linear-only. -/
def hostModuleCheckBadLinearPolyIdBody : ModuleCheckResult :=
  checkRealModule "SystemsLean.Linear"
    hostModuleCheckBadLinearPolyIdBodyText

/-- LT3 wrong mult0ClassId string rejects under L2.
    Greppable: hostModuleCheckBadLinearMult0ClassId, ILL-TYPED-TERM,
    TERM-SURFACE, Linear-only. -/
def hostModuleCheckBadLinearMult0ClassId : ModuleCheckResult :=
  checkRealModule "SystemsLean.Linear"
    hostModuleCheckBadLinearMult0ClassIdText

/-- LT4 wrong roundTrip composition rejects under L2.
    Greppable: hostModuleCheckBadLinearRoundTripBody, ILL-TYPED-TERM,
    TERM-SURFACE, Linear-only. -/
def hostModuleCheckBadLinearRoundTripBody : ModuleCheckResult :=
  checkRealModule "SystemsLean.Linear"
    hostModuleCheckBadLinearRoundTripBodyText

/-! ### Types L2 term-surface ill-typed twins (TT1..TT4; full checkRealModule) -/

/-- Good Types L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodTypesTerm, TERM-SURFACE, Types-only. -/
def hostModuleCheckGoodTypesTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Types" hostModuleCheckGoodTypesTermText

/-- TT1 wrong NodeKind.name value arm rejects under L2.
    Greppable: hostModuleCheckBadTypesNameArm, ILL-TYPED-TERM,
    TERM-SURFACE, Types-only. -/
def hostModuleCheckBadTypesNameArm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Types" hostModuleCheckBadTypesNameArmText

/-- TT2 wrong expectedMult pairing rejects under L2.
    Greppable: hostModuleCheckBadTypesExpectedMultArm, ILL-TYPED-TERM,
    TERM-SURFACE, Types-only. -/
def hostModuleCheckBadTypesExpectedMultArm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Types" hostModuleCheckBadTypesExpectedMultArmText

/-- TT3 wrong kindMultOk body rejects under L2.
    Greppable: hostModuleCheckBadTypesKindMultOkBody, ILL-TYPED-TERM,
    TERM-SURFACE, Types-only. -/
def hostModuleCheckBadTypesKindMultOkBody : ModuleCheckResult :=
  checkRealModule "SystemsLean.Types" hostModuleCheckBadTypesKindMultOkBodyText

/-- TT4 wrong ofKindTag? decode rejects under L2.
    Greppable: hostModuleCheckBadTypesOfKindTagArm, ILL-TYPED-TERM,
    TERM-SURFACE, Types-only. -/
def hostModuleCheckBadTypesOfKindTagArm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Types" hostModuleCheckBadTypesOfKindTagArmText

/-! ### IrProgram L2 term-surface ill-typed twins (PT1..PT4; full checkRealModule) -/

/-- Good IrProgram L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodIrProgramTerm, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckGoodIrProgramTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgram" hostModuleCheckGoodIrProgramTermText

/-- PT1 wrong programCap rejects under L2.
    Greppable: hostModuleCheckBadIrProgramCap, ILL-TYPED-TERM,
    TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckBadIrProgramCap : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgram" hostModuleCheckBadIrProgramCapText

/-- PT2 wrong checkFailClosed body rejects under L2.
    Greppable: hostModuleCheckBadIrProgramCheckFailClosed, ILL-TYPED-TERM,
    TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckBadIrProgramCheckFailClosed : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgram"
    hostModuleCheckBadIrProgramCheckFailClosedText

/-- PT3 wrong isWellTyped body rejects under L2.
    Greppable: hostModuleCheckBadIrProgramIsWellTyped, ILL-TYPED-TERM,
    TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckBadIrProgramIsWellTyped : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgram"
    hostModuleCheckBadIrProgramIsWellTypedText

/-- PT4 wrong push body rejects under L2.
    Greppable: hostModuleCheckBadIrProgramPush, ILL-TYPED-TERM,
    TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckBadIrProgramPush : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgram" hostModuleCheckBadIrProgramPushText

/-! ### IrGraph L2 term-surface ill-typed twins (GT1..GT4; full checkRealModule) -/

/-- Good IrGraph L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodIrGraphTerm, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckGoodIrGraphTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraph" hostModuleCheckGoodIrGraphTermText

/-- GT1 wrong edgeMax rejects under L2.
    Greppable: hostModuleCheckBadIrGraphEdgeMax, ILL-TYPED-TERM,
    TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckBadIrGraphEdgeMax : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraph" hostModuleCheckBadIrGraphEdgeMaxText

/-- GT2 wrong checkFailClosed body rejects under L2.
    Greppable: hostModuleCheckBadIrGraphCheckFailClosed, ILL-TYPED-TERM,
    TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckBadIrGraphCheckFailClosed : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraph"
    hostModuleCheckBadIrGraphCheckFailClosedText

/-- GT3 wrong isWellTyped body rejects under L2.
    Greppable: hostModuleCheckBadIrGraphIsWellTyped, ILL-TYPED-TERM,
    TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckBadIrGraphIsWellTyped : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraph"
    hostModuleCheckBadIrGraphIsWellTypedText

/-- GT4 wrong pushNode body rejects under L2.
    Greppable: hostModuleCheckBadIrGraphPushNode, ILL-TYPED-TERM,
    TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckBadIrGraphPushNode : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraph" hostModuleCheckBadIrGraphPushNodeText

/-! ### HostCompose L2 term-surface ill-typed twins (GT1..GT4; full checkRealModule) -/

/-- Good HostCompose L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodHostComposeTerm, TERM-SURFACE, HostCompose-only. -/
def hostModuleCheckGoodHostComposeTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostCompose" hostModuleCheckGoodHostComposeTermText

/-- GT1 wrong empty body rejects under L2.
    Greppable: hostModuleCheckBadHostComposeEmpty, ILL-TYPED-TERM,
    TERM-SURFACE, HostCompose-only. -/
def hostModuleCheckBadHostComposeEmpty : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostCompose" hostModuleCheckBadHostComposeEmptyText

/-- GT2 wrong checkFailClosed body rejects under L2.
    Greppable: hostModuleCheckBadHostComposeCheckFailClosed, ILL-TYPED-TERM,
    TERM-SURFACE, HostCompose-only. -/
def hostModuleCheckBadHostComposeCheckFailClosed : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostCompose"
    hostModuleCheckBadHostComposeCheckFailClosedText

/-- GT3 wrong mint body rejects under L2.
    Greppable: hostModuleCheckBadHostComposeMint, ILL-TYPED-TERM,
    TERM-SURFACE, HostCompose-only. -/
def hostModuleCheckBadHostComposeMint : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostCompose" hostModuleCheckBadHostComposeMintText

/-- GT4 wrong pushHostNode body rejects under L2.
    Greppable: hostModuleCheckBadHostComposePushHostNode, ILL-TYPED-TERM,
    TERM-SURFACE, HostCompose-only. -/
def hostModuleCheckBadHostComposePushHostNode : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostCompose"
    hostModuleCheckBadHostComposePushHostNodeText

/-! ### Erasure L2 term-surface ill-typed twins (ET1..ET4; full checkRealModule) -/

/-- Good Erasure L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodErasureTerm, TERM-SURFACE, Erasure-only. -/
def hostModuleCheckGoodErasureTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Erasure" hostModuleCheckGoodErasureTermText

/-- ET1 wrong checkFailClosed body rejects under L2.
    Greppable: hostModuleCheckBadErasureCheckFailClosed, ILL-TYPED-TERM,
    TERM-SURFACE, Erasure-only. -/
def hostModuleCheckBadErasureCheckFailClosed : ModuleCheckResult :=
  checkRealModule "SystemsLean.Erasure"
    hostModuleCheckBadErasureCheckFailClosedText

/-- ET2 wrong isErasureGrade body rejects under L2.
    Greppable: hostModuleCheckBadErasureIsErasureGrade, ILL-TYPED-TERM,
    TERM-SURFACE, Erasure-only. -/
def hostModuleCheckBadErasureIsErasureGrade : ModuleCheckResult :=
  checkRealModule "SystemsLean.Erasure"
    hostModuleCheckBadErasureIsErasureGradeText

/-- ET3 wrong markForGrade? body rejects under L2.
    Greppable: hostModuleCheckBadErasureMarkForGrade, ILL-TYPED-TERM,
    TERM-SURFACE, Erasure-only. -/
def hostModuleCheckBadErasureMarkForGrade : ModuleCheckResult :=
  checkRealModule "SystemsLean.Erasure"
    hostModuleCheckBadErasureMarkForGradeText

/-- ET4 wrong isRuntimeAbsent body rejects under L2.
    Greppable: hostModuleCheckBadErasureIsRuntimeAbsent, ILL-TYPED-TERM,
    TERM-SURFACE, Erasure-only. -/
def hostModuleCheckBadErasureIsRuntimeAbsent : ModuleCheckResult :=
  checkRealModule "SystemsLean.Erasure"
    hostModuleCheckBadErasureIsRuntimeAbsentText

/-! ### Extract L2 term-surface ill-typed twins (XT1..XT4; full checkRealModule) -/

/-- Good Extract L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodExtractTerm, TERM-SURFACE, Extract-only. -/
def hostModuleCheckGoodExtractTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.Extract" hostModuleCheckGoodExtractTermText

/-- XT1 wrong checkFailClosed body rejects under L2.
    Greppable: hostModuleCheckBadExtractCheckFailClosed, ILL-TYPED-TERM,
    TERM-SURFACE, Extract-only. -/
def hostModuleCheckBadExtractCheckFailClosed : ModuleCheckResult :=
  checkRealModule "SystemsLean.Extract"
    hostModuleCheckBadExtractCheckFailClosedText

/-- XT2 wrong isFreestandingGoal body rejects under L2.
    Greppable: hostModuleCheckBadExtractIsFreestandingGoal, ILL-TYPED-TERM,
    TERM-SURFACE, Extract-only. -/
def hostModuleCheckBadExtractIsFreestandingGoal : ModuleCheckResult :=
  checkRealModule "SystemsLean.Extract"
    hostModuleCheckBadExtractIsFreestandingGoalText

/-- XT3 wrong extractOk body rejects under L2.
    Greppable: hostModuleCheckBadExtractExtractOk, ILL-TYPED-TERM,
    TERM-SURFACE, Extract-only. -/
def hostModuleCheckBadExtractExtractOk : ModuleCheckResult :=
  checkRealModule "SystemsLean.Extract"
    hostModuleCheckBadExtractExtractOkText

/-- XT4 wrong isValidRuntimeTag body rejects under L2.
    Greppable: hostModuleCheckBadExtractIsValidRuntimeTag, ILL-TYPED-TERM,
    TERM-SURFACE, Extract-only. -/
def hostModuleCheckBadExtractIsValidRuntimeTag : ModuleCheckResult :=
  checkRealModule "SystemsLean.Extract"
    hostModuleCheckBadExtractIsValidRuntimeTagText

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckAcceptsLater
