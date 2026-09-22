/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SurfaceMatrixTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSurfaceMatrixTheoremsSource. Not occupancy name 50. Not mill 70.
  Unique needles (trailing newline so SurfaceMatrix wrap is not a prefix):
  HostFrontLiveSurfaceMatrixTheoremsSource
  PARSE-LIVE-SURFACE-MATRIX-THEOREMS
  HOST-FRONT-LIVE-SURFACE-MATRIX-THEOREMS
  Greppable: SYSTEMS_LEAN_HOST, liveSurfaceMatrixTheoremsSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSurfaceMatrixTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSurfaceMatrixTheorems

/-- Dual-pinned live SurfaceMatrixTheorems.lean bytes (must match on-disk file).
    Greppable: liveSurfaceMatrixTheoremsSource, PARSE-LIVE-SURFACE-MATRIX-THEOREMS. -/
def liveSurfaceMatrixTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- SurfaceMatrix SURFACE-MATRIX-THEOREM + SURFACE-MATRIX-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.SurfaceMatrix: theorems and behavioral smoke live
  here; stage ids, dual cites, row status vocabulary, matrixSurfaceOk, Verdict,
  and matrix*Ready bars stay in SurfaceMatrix. Same namespace SystemsLean.SurfaceMatrix
  so theorem names stay unqualified under that namespace.

  Spec (readable):
  - SURFACE-MATRIX-THEOREM / HOST-SURFACE-MATRIX-THEOREM: stageId_eq /
    hostSurfaceMatrixId_eq / surfaceMatrixId_eq / matrixSurfaceOk_true /
    matrixUnitReady_empty_true / matrixProgramReady_empty_false /
    empty_host_ok_ne_empty_program_ok / matrixUnitReady_mult1_unminted_false /
    matrixUnitReady_mult1_minted_true / matrixProgramReady_single_value.
  - SURFACE-MATRIX-SMOKE: stage / dual-cite / row honesty / empty host OK /
    empty program fail-closed / MULT-1 mint / MULT-0 mark / sibling bar
    behavioral examples (lake build fails if example fails).

  These SurfaceMatrix theorems do NOT set SpecProof.proofCompleteClaimed true.
  Surface inventory readiness canaries != freestanding product self-host complete.

  Intentional non-claims:
  - Surface matrix canaries only -- inventory readiness, not full language parity.
  - CompCert PROVABLY inventory row is claimed in canary (rowProvably = PROVABLY;
    rowProvablyClaimedOk). Theorems do NOT flip LlvmHold.provablyUnlocked.
  - freestanding-complete + llvm unlock inventory rows are statusMeasured
    (match living tip; not full backend; not full language parity).
  - NOT formal dual-bridge theorems. NOT full llvm backend claim.
  - NOT proof complete. NOT host residual free.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, SURFACE-MATRIX-THEOREM, HOST-SURFACE-MATRIX-THEOREM,
  SURFACE-MATRIX-SMOKE, stageId_eq, hostSurfaceMatrixId_eq, surfaceMatrixId_eq,
  matrixSurfaceOk_true, matrixUnitReady_empty_true, matrixProgramReady_empty_false,
  empty_host_ok_ne_empty_program_ok, matrixUnitReady_mult1_unminted_false,
  matrixUnitReady_mult1_minted_true, matrixProgramReady_single_value,
  rowProvablyClaimedOk, rowFreestandingSelfHostMeasuredOk, rowLlvmMeasuredOk,
  SurfaceMatrixTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.SurfaceMatrixTheorems
  Red/green: just systems-host; lake build SystemsLean.SurfaceMatrixTheorems.
  Module must stay ASCII.
  Inventory freestanding/llvm measured + PROVABLY claimed; not full backend.
  Not proof complete. Not host residual free.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.Erasure
import SystemsLean.HostCompose
import SystemsLean.CompilePath
import SystemsLean.JoinMap
import SystemsLean.SelfHost
import SystemsLean.SurfaceMatrix

namespace SystemsLean.SurfaceMatrix

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.HostCompose (Host)

/-! ### SURFACE-MATRIX-THEOREM / HOST-SURFACE-MATRIX-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is surface-matrix
  inventory readiness, empty host unit OK vs empty program fail-closed only.
  Does not complete SpecProof; does not flip residual free / freestanding
  product self-host complete / LlvmHold.provablyUnlocked / llvmUnlocked pins;
  does not claim full backend or full superset parity. Inventory freestanding
  and llvm rows are statusMeasured; CompCert row is PROVABLY; Full classic
  elaborator parity is present-partial (not measured); full Idris/Lean/syntax
  language-parity rows stay open.
-/

/-- Primary stage id is greppable SLAKE_SURFACE_MATRIX_V0.
    Greppable: stageId_eq, SURFACE-MATRIX-THEOREM, HOST-SURFACE-MATRIX-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SURFACE_MATRIX_V0" := rfl

/-- Host map id is greppable HOST-SURFACE-MATRIX.
    Greppable: hostSurfaceMatrixId_eq, SURFACE-MATRIX-THEOREM. -/
theorem hostSurfaceMatrixId_eq :
    hostSurfaceMatrixId = "HOST-SURFACE-MATRIX" := rfl

/-- Short map id is greppable SURFACE-MATRIX.
    Greppable: surfaceMatrixId_eq, SURFACE-MATRIX-THEOREM. -/
theorem surfaceMatrixId_eq : surfaceMatrixId = "SURFACE-MATRIX" := rfl

/-- Matrix surface inventory canary holds (stage / dual / row status).
    Greppable: matrixSurfaceOk_true, SURFACE-MATRIX-THEOREM,
    HOST-SURFACE-MATRIX-THEOREM. -/
theorem matrixSurfaceOk_true : matrixSurfaceOk = true := by decide

/-- Empty HostCompose is matrix unit-ready (self-host + surface).
    Greppable: matrixUnitReady_empty_true, HOST-SURFACE-MATRIX,
    SURFACE-MATRIX-THEOREM, HOST-SURFACE-MATRIX-THEOREM. -/
theorem matrixUnitReady_empty_true :
    matrixUnitReady HostCompose.empty = true := by decide

/-- EMPTY-PROGRAM-FAIL-CLOSED on matrix program bar.
    Greppable: matrixProgramReady_empty_false, EMPTY-PROGRAM-FAIL-CLOSED,
    SURFACE-MATRIX-THEOREM, HOST-SURFACE-MATRIX-THEOREM. -/
theorem matrixProgramReady_empty_false :
    matrixProgramReady IrProgram.empty = false := by decide

/-- Honesty: empty host matrix unit OK is not empty program matrix OK.
    Greppable: empty_host_ok_ne_empty_program_ok, SURFACE-MATRIX-THEOREM. -/
theorem empty_host_ok_ne_empty_program_ok :
    matrixUnitReady HostCompose.empty = true
      /\ matrixProgramReady IrProgram.empty = false := by
  exact And.intro matrixUnitReady_empty_true matrixProgramReady_empty_false

/-! ### Non-empty path fixtures (beyond empty host vs empty program canaries)
    SelfHost / JoinMap sibling pattern: MULT-1 mint + single-value program. -/

private def thmValueNode : IrNode :=
  { ty := typeTagInit 2, mult := Mult.multOmega, kind := NodeKind.value }

private def thmLinearNode : IrNode :=
  { ty := typeTagInit 1, mult := Mult.mult1, kind := NodeKind.linear }

private def thmSingleValueProg : Program := { nodes := [thmValueNode] }

private def thmHostMult1Unminted : Host := {
  graph := { prog := { nodes := [thmLinearNode] }, edges := [] }
  linear := HostCompose.LinearHost.empty
  erased := Erasure.unmarked
}

private def thmHostMult1Minted : Host := {
  graph := { prog := { nodes := [thmLinearNode] }, edges := [] }
  linear := { live := true, id := 4 }
  erased := Erasure.unmarked
}

/-- MULT-1 host without mint fails matrix unit-ready (self-host unit fail-closed).
    Greppable: matrixUnitReady_mult1_unminted_false, MULT-1,
    SURFACE-MATRIX-THEOREM, HOST-SURFACE-MATRIX-THEOREM. -/
theorem matrixUnitReady_mult1_unminted_false :
    matrixUnitReady thmHostMult1Unminted = false := by decide

/-- MULT-1 host with mint is matrix unit-ready (self-host unit + matrix surface).
    Greppable: matrixUnitReady_mult1_minted_true, MULT-1,
    SURFACE-MATRIX-THEOREM, HOST-SURFACE-MATRIX-THEOREM. -/
theorem matrixUnitReady_mult1_minted_true :
    matrixUnitReady thmHostMult1Minted = true := by decide

/-- One well-typed VALUE node is matrix program-ready (sibling of empty fail).
    Greppable: matrixProgramReady_single_value, SURFACE-MATRIX-THEOREM,
    HOST-SURFACE-MATRIX-THEOREM. -/
theorem matrixProgramReady_single_value :
    matrixProgramReady thmSingleValueProg = true := by decide

/-! ### Surface-matrix smoke (behavioral; lake build fails if an example does not hold)
    Greppable: SURFACE-MATRIX-SMOKE. Exercises matrix surface canary, dual cites,
    present-partial / open row honesty, empty host OK, empty program fail-closed,
    MULT-1 mint path, sibling bars not conflated. -/

private def smokeLinearNode : IrNode :=
  { ty := typeTagInit 1, mult := Mult.mult1, kind := NodeKind.linear }

private def smokeErasedNode : IrNode :=
  { ty := typeTagInit 0, mult := Mult.mult0, kind := NodeKind.erased }

private def smokeValueNode : IrNode :=
  { ty := typeTagInit 2, mult := Mult.multOmega, kind := NodeKind.value }

private def smokePush (hc : Host) (n : IrNode) : Host :=
  match HostCompose.pushHostNode hc n with
  | HostCompose.HostPushNodeResult.ok hc' => hc'
  | _ => hc

private def smokeMint (hc : Host) (id : Nat) : Host :=
  match HostCompose.mint hc id with
  | HostCompose.MintResult.ok hc' => hc'
  | _ => hc

private def smokePushProg (p : Program) (n : IrNode) : Program :=
  match IrProgram.push p n with
  | IrProgram.PushResult.ok p' => p'
  | _ => p

/-- SURFACE-MATRIX-SMOKE: stage / map ids are greppable honesty strings. -/
example : stageId = "SLAKE_SURFACE_MATRIX_V0" := by decide
example : hostSurfaceMatrixId = "HOST-SURFACE-MATRIX" := by decide
example : surfaceMatrixId = "SURFACE-MATRIX" := by decide

/-- SURFACE-MATRIX-SMOKE: inventory / module / package path cites match layout. -/
example : inventoryDocPath = "src/systems/surface-matrix.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/SurfaceMatrix.lean" := by decide
example : packageRootPath = "src/systems/SystemsLean.lean" := by decide

/-- SURFACE-MATRIX-SMOKE: six dual cites (ConsumeToken + ErasedIndex +
    UnrestrictedShare + FailClosedGrade + LinearPairSwap + RuntimeExtract). -/
example : dualCiteOk = true := by decide
example : dualConsumeTokenIdris = "src/idris2/examples/ConsumeToken.idr" := by decide
example : dualErasedIndexLean = "src/lean4/examples/ErasedIndex.lean" := by decide
example :
    dualUnrestrictedShareIdris = "src/idris2/examples/UnrestrictedShare.idr" := by
  decide
example :
    dualFailClosedGradeIdris = "src/idris2/examples/FailClosedGrade.idr" := by
  decide
example :
    dualFailClosedGradeLean = "src/lean4/examples/FailClosedGrade.lean" := by
  decide

/-- SURFACE-MATRIX-SMOKE: host progressive rows present-partial; Full classic
    elaborator present-partial (not measured); full syntax/Idris/Lean open;
    freestanding + llvm measured; CompCert PROVABLY. -/
example : hostRowsPresentPartialOk = true := by decide
example : openRowsOpenOk = true := by decide
example : rowMult = "present-partial" := by decide
example : rowLinearJoin = "present-partial" := by decide
example : rowSelfHostDirection = "present-partial" := by decide
example : rowFullElaborator = "measured" := by decide
example : rowFullElaboratorMeasuredOk = true := by decide
example : rowFullElaboratorPartialOk = true := by decide
example : rowSyntaxSurface = "open" := by decide
example : rowFullIdrisParity = "open" := by decide
example : rowFullLeanParity = "open" := by decide
example : rowFreestandingSelfHost = "measured" := by decide
example : rowLlvm = "measured" := by decide
example : rowFreestandingSelfHostMeasuredOk = true := by decide
example : rowLlvmMeasuredOk = true := by decide
example : rowProvably = "PROVABLY" := by decide
example : rowProvablyClaimedOk = true := by decide
example : matrixSurfaceOk = true := by decide

/-- SURFACE-MATRIX-SMOKE: empty HostCompose is matrix unit-ready (self-host + surface). -/
example : matrixReady HostCompose.empty = true := by decide
example : matrixUnitReady HostCompose.empty = true := by decide
example :
    (let v := verdictOf HostCompose.empty
     v.ok && v.selfHostUnit && v.unitReady && v.matrixSurface) = true := by decide

/-- SURFACE-MATRIX-SMOKE: empty ordered program is NOT matrix program-ready.
    Sibling bar: empty host OK != empty program OK (P3 residual lesson). -/
example : matrixProgramReady IrProgram.empty = false := by decide

/-- SURFACE-MATRIX-SMOKE: MULT-OMEGA-only host is matrix unit-ready without mint. -/
example :
    matrixUnitReady (smokePush HostCompose.empty smokeValueNode) = true := by
  decide

/-- SURFACE-MATRIX-SMOKE: MULT-1 without mint fails matrix unit-ready (multPreScan). -/
example :
    matrixReady (smokePush HostCompose.empty smokeLinearNode) = false := by
  decide
example :
    (let v := verdictOf (smokePush HostCompose.empty smokeLinearNode)
     !v.ok && !v.selfHostUnit && !v.unitReady && v.matrixSurface) = true := by
  decide

/-- SURFACE-MATRIX-SMOKE: MULT-1 with mint is matrix unit-ready. -/
example :
    matrixUnitReady
      (smokeMint (smokePush HostCompose.empty smokeLinearNode) 4) = true := by
  decide

/-- SURFACE-MATRIX-SMOKE: MULT-0 without mark fails; with markErased ok. -/
example :
    matrixReady (smokePush HostCompose.empty smokeErasedNode) = false := by
  decide
example :
    matrixReady
      (HostCompose.markErased (smokePush HostCompose.empty smokeErasedNode))
      = true := by decide

/-- SURFACE-MATRIX-SMOKE: well-typed non-empty program is matrix program-ready. -/
example :
    (let p := smokePushProg IrProgram.empty smokeValueNode
     matrixProgramReady p) = true := by decide

/-- SURFACE-MATRIX-SMOKE: failClosed verdict is not ok. -/
example : Verdict.failClosed.ok = false := by decide

/-- SURFACE-MATRIX-SMOKE: unit bar does not imply program bar on empty program
    (sibling APIs; do not conflate). -/
example :
    (matrixUnitReady HostCompose.empty
      && !matrixProgramReady IrProgram.empty) = true := by decide

/-- SURFACE-MATRIX-SMOKE: matrix unit bar matches self-host unit bar under surface. -/
example :
    (matrixUnitReady HostCompose.empty
      = SelfHost.selfHostUnitReady HostCompose.empty) = true := by decide

/-- SURFACE-MATRIX-SMOKE: JoinMap dual canary still holds under matrix composition. -/
example : JoinMap.joinAlgContractOk = true := by decide

end SystemsLean.SurfaceMatrix
"#

end SystemsLean.HostFrontLiveSurfaceMatrixTheorems

