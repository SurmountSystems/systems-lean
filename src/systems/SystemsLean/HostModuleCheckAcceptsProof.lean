/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck Kernel Mult..Emit L3 proof accept dual-pins.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from HostModuleCheckAcceptsGoods: Kernel Mult/Linear/Types/Program/Emit
  theorems PROOF-SURFACE good/bad accepts + compact smoke folds.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.
  Sub-1-KLOC: do not grow past 1000.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckAcceptsProof,
  PROOF-SURFACE, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckAcceptsProof
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckAcceptsProof;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckRealModule
import SystemsLean.HostModuleCheckKernelMultProof
import SystemsLean.HostModuleCheckKernelLinearProof
import SystemsLean.HostModuleCheckKernelTypesProof
import SystemsLean.HostModuleCheckKernelProgramProof
import SystemsLean.HostModuleCheckKernelEmitProof

namespace SystemsLean.HostModuleCheck

/-- Good KernelMultTheorems L3 proof fixture accepts.
    Greppable: hostModuleCheckGoodKernelMultTheoremsProof, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelMultTheoremsProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelMultTheorems"
    hostModuleCheckGoodKernelMultTheoremsProofText

/-- P1 wrong stageId_eq statement rejects under L3.
    Greppable: hostModuleCheckBadKernelMultThmWrongStmt, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelMultThmWrongStmt : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelMultTheorems"
    hostModuleCheckBadKernelMultThmWrongStmtText

/-- P2 by sorry on stageId_eq rejects under L3.
    Greppable: hostModuleCheckBadKernelMultThmSorry, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelMultThmSorry : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelMultTheorems"
    hostModuleCheckBadKernelMultThmSorryText

/-- Compact KernelMultTheorems L3 smoke fold (keeps Driver under Sub-1-KLOC).
    Greppable: hostModuleCheckKernelMultProofSmokeOk, PROOF-SURFACE. -/
def hostModuleCheckKernelMultProofSmokeOk : Bool :=
  hostModuleCheckGoodKernelMultTheoremsProof.isAccept
    && hostModuleCheckBadKernelMultThmWrongStmt.isRejectWith reasonIllTypedProof
    && hostModuleCheckBadKernelMultThmSorry.isRejectWith reasonIllTypedProof
    && hostModuleCheckKernelMultProofSurfaceOk

/-! ### KernelLinearTheorems L3 proof-surface twins (full checkRealModule + smoke) -/

/-- Good KernelLinearTheorems L3 proof fixture accepts.
    Greppable: hostModuleCheckGoodKernelLinearTheoremsProof, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelLinearTheoremsProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelLinearTheorems"
    hostModuleCheckGoodKernelLinearTheoremsProofText

/-- P1 wrong stageId_eq statement rejects under L3.
    Greppable: hostModuleCheckBadKernelLinearThmWrongStmt, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelLinearThmWrongStmt : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelLinearTheorems"
    hostModuleCheckBadKernelLinearThmWrongStmtText

/-- P2 by sorry on stageId_eq rejects under L3.
    Greppable: hostModuleCheckBadKernelLinearThmSorry, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelLinearThmSorry : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelLinearTheorems"
    hostModuleCheckBadKernelLinearThmSorryText

/-- Compact KernelLinearTheorems L3 smoke fold (keeps Driver under Sub-1-KLOC).
    Greppable: hostModuleCheckKernelLinearProofSmokeOk, PROOF-SURFACE. -/
def hostModuleCheckKernelLinearProofSmokeOk : Bool :=
  hostModuleCheckGoodKernelLinearTheoremsProof.isAccept
    && hostModuleCheckBadKernelLinearThmWrongStmt.isRejectWith reasonIllTypedProof
    && hostModuleCheckBadKernelLinearThmSorry.isRejectWith reasonIllTypedProof
    && hostModuleCheckKernelLinearProofSurfaceOk

/-! ### KernelTypesTheorems L3 proof-surface twins (full checkRealModule + smoke) -/

/-- Good KernelTypesTheorems L3 proof fixture accepts.
    Greppable: hostModuleCheckGoodKernelTypesTheoremsProof, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelTypesTheoremsProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelTypesTheorems"
    hostModuleCheckGoodKernelTypesTheoremsProofText

/-- P1 wrong stageId_eq statement rejects under L3.
    Greppable: hostModuleCheckBadKernelTypesThmWrongStmt, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelTypesThmWrongStmt : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelTypesTheorems"
    hostModuleCheckBadKernelTypesThmWrongStmtText

/-- P2 by sorry on stageId_eq rejects under L3.
    Greppable: hostModuleCheckBadKernelTypesThmSorry, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelTypesThmSorry : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelTypesTheorems"
    hostModuleCheckBadKernelTypesThmSorryText

/-- Compact KernelTypesTheorems L3 smoke fold (keeps Driver under Sub-1-KLOC).
    Greppable: hostModuleCheckKernelTypesProofSmokeOk, PROOF-SURFACE. -/
def hostModuleCheckKernelTypesProofSmokeOk : Bool :=
  hostModuleCheckGoodKernelTypesTheoremsProof.isAccept
    && hostModuleCheckBadKernelTypesThmWrongStmt.isRejectWith reasonIllTypedProof
    && hostModuleCheckBadKernelTypesThmSorry.isRejectWith reasonIllTypedProof
    && hostModuleCheckKernelTypesProofSurfaceOk

/-! ### KernelProgramTheorems L3 proof-surface twins (full checkRealModule + smoke) -/

/-- Good KernelProgramTheorems L3 proof fixture accepts.
    Greppable: hostModuleCheckGoodKernelProgramTheoremsProof, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelProgramTheoremsProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelProgramTheorems"
    hostModuleCheckGoodKernelProgramTheoremsProofText

/-- P1 wrong stageId_eq statement rejects under L3.
    Greppable: hostModuleCheckBadKernelProgramThmWrongStmt, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelProgramThmWrongStmt : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelProgramTheorems"
    hostModuleCheckBadKernelProgramThmWrongStmtText

/-- P2 by sorry on stageId_eq rejects under L3.
    Greppable: hostModuleCheckBadKernelProgramThmSorry, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelProgramThmSorry : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelProgramTheorems"
    hostModuleCheckBadKernelProgramThmSorryText

/-- Compact KernelProgramTheorems L3 smoke fold (keeps Driver under Sub-1-KLOC).
    Greppable: hostModuleCheckKernelProgramProofSmokeOk, PROOF-SURFACE. -/
def hostModuleCheckKernelProgramProofSmokeOk : Bool :=
  hostModuleCheckGoodKernelProgramTheoremsProof.isAccept
    && hostModuleCheckBadKernelProgramThmWrongStmt.isRejectWith reasonIllTypedProof
    && hostModuleCheckBadKernelProgramThmSorry.isRejectWith reasonIllTypedProof
    && hostModuleCheckKernelProgramProofSurfaceOk

/-! ### KernelEmitTheorems L3 proof-surface twins (full checkRealModule + smoke) -/

/-- Good KernelEmitTheorems L3 proof fixture accepts.
    Greppable: hostModuleCheckGoodKernelEmitTheoremsProof, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelEmitTheoremsProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelEmitTheorems"
    hostModuleCheckGoodKernelEmitTheoremsProofText

/-- P1 wrong stageId_eq statement rejects under L3.
    Greppable: hostModuleCheckBadKernelEmitThmWrongStmt, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelEmitThmWrongStmt : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelEmitTheorems"
    hostModuleCheckBadKernelEmitThmWrongStmtText

/-- P2 by sorry on stageId_eq rejects under L3.
    Greppable: hostModuleCheckBadKernelEmitThmSorry, ILL-TYPED-PROOF,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelEmitThmSorry : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelEmitTheorems"
    hostModuleCheckBadKernelEmitThmSorryText

/-- Compact KernelEmitTheorems L3 smoke fold (keeps Driver under Sub-1-KLOC).
    Greppable: hostModuleCheckKernelEmitProofSmokeOk, PROOF-SURFACE. -/
def hostModuleCheckKernelEmitProofSmokeOk : Bool :=
  hostModuleCheckGoodKernelEmitTheoremsProof.isAccept
    && hostModuleCheckBadKernelEmitThmWrongStmt.isRejectWith reasonIllTypedProof
    && hostModuleCheckBadKernelEmitThmSorry.isRejectWith reasonIllTypedProof
    && hostModuleCheckKernelEmitProofSurfaceOk

end SystemsLean.HostModuleCheck
