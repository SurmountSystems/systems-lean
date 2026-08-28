/-
  SYSTEMS_LEAN_HOST partial -- host-side superset surface matrix (P7).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): SystemsLean.SelfHost self-host direction readiness
    (sibling unit/program bars), JoinMap JOIN-ALG dual cite, CompilePath,
    Mult/Linear/Types/IrProgram/IrGraph/Erasure/Extract/HostCompose/Emit*
    host ladder. Dual cite paths (read-only; do not reimplement):
    ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade, LinearPairSwap,
    RuntimeExtract under
    src/idris2/examples/ and src/lean4/examples/. Inventory prose:
    src/systems/surface-matrix.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SURFACE_MATRIX_V0 / HOST-SURFACE-MATRIX / SURFACE-MATRIX: host
    inventory of progressive surface coverage vs open gaps (useful dual cores).
  - matrixSurfaceOk: surface-level canary (stage ids + dual cites + row status
    inventory strings). Not FS walk; not full language feature implement.
  - matrixUnitReady hc: SelfHost.selfHostUnitReady && matrixSurfaceOk
    (FAIL-CLOSED composition; reuses self-host / join / unit bar APIs).
  - matrixProgramReady p: SelfHost.selfHostProgramReady && matrixSurfaceOk
    (sibling API; EMPTY-PROGRAM-FAIL-CLOSED preserved; empty host OK != empty
    program OK).
  - matrixReady hc: alias of matrixUnitReady (HOST-SURFACE-MATRIX unit bar).
  - Verdict records selfHostUnit / pure unitReady / matrixSurface / ok.

  Theorems (SURFACE-MATRIX-THEOREM / HOST-SURFACE-MATRIX-THEOREM -- partial
  SurfaceMatrix):
  - Live in SystemsLean.SurfaceMatrixTheorems (same namespace; long-file peel).
  - matrixSurfaceOk_true / matrixUnitReady_empty_true /
    matrixProgramReady_empty_false / stageId_eq / hostSurfaceMatrixId_eq /
    surfaceMatrixId_eq / empty_host_ok_ne_empty_program_ok
  - matrixUnitReady_mult1_unminted_false / matrixUnitReady_mult1_minted_true
  - matrixProgramReady_single_value (path fixtures; SelfHost sibling pattern)
  - SURFACE-MATRIX-SMOKE behavioral examples live with theorems
  These SurfaceMatrix theorems do NOT set SpecProof.proofCompleteClaimed true.
  Surface inventory readiness canaries != freestanding product self-host complete.

  Intentional non-claims / partial parity:
  - PARTIAL: inventory + progressive host gate, not day-one full Idris+Lean
    parity or "superset complete".
  - Inventory canary matches living tip: freestanding self-host complete and
    llvm unlock rows statusMeasured (not statusOpen lag); CompCert PROVABLY
    statusProvably. Living claim pins elsewhere: freestandingProductSelfHostComplete
    true, llvmUnlocked true (not full backend), residual free true, host residual
    remains, PROVABLY true. Prose SSoT: src/systems/surface-matrix.md.
  - Open language gaps stay open: full syntax surface, full elaborator,
    full Idris parity, full Lean parity, full CFG/SSA backend.
  - CompCert PROVABLY row claimed after product matrix + evidence residual.
  - Duals cited only (six JOIN-ALG algorithm examples); no dual invent padding.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Does not fold program bar into unit bar (sibling APIs; P3 residual lesson).
  - Does not claim full out/llvm-ir backend from unlock true alone.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SURFACE_MATRIX_V0, HOST-SURFACE-MATRIX,
  SURFACE-MATRIX, matrixUnitReady, matrixProgramReady, matrixReady,
  matrixSurfaceOk, SURFACE-MATRIX-SMOKE, HOST-SELF-HOST, SLAKE_SELF_HOST_V0,
  HOST-JOIN-MAP, HOST-COMPILE-PATH, MULT-0, MULT-1, MULT-OMEGA, JOIN-ALG,
  ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade, LinearPairSwap,
  RuntimeExtract, present-partial,
  open, measured,
  EMPTY-PROGRAM-FAIL-CLOSED, FAIL-CLOSED, SURFACE-MATRIX-THEOREM,
  HOST-SURFACE-MATRIX-THEOREM, SurfaceMatrixTheorems,
  matrixUnitReady_empty_true, matrixProgramReady_empty_false,
  matrixUnitReady_mult1_unminted_false, matrixUnitReady_mult1_minted_true,
  matrixProgramReady_single_value, rowFreestandingSelfHostMeasuredOk,
  rowLlvmMeasuredOk, rowProvablyClaimedOk, UNIT_SURFACE host surface.
  Module: SystemsLean.SurfaceMatrix
  Long-file peel: SURFACE-MATRIX-THEOREM + SURFACE-MATRIX-SMOKE in
  SystemsLean.SurfaceMatrixTheorems (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
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

namespace SystemsLean.SurfaceMatrix

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.HostCompose (Host)

/-- Greppable primary stage id for host surface matrix (P7). -/
def stageId : String := "SLAKE_SURFACE_MATRIX_V0"

/-- Greppable host alias for surface-matrix honesty (HOST-SURFACE-MATRIX). -/
def hostSurfaceMatrixId : String := "HOST-SURFACE-MATRIX"

/-- Greppable short map id (SURFACE-MATRIX). -/
def surfaceMatrixId : String := "SURFACE-MATRIX"

/-- Read-only inventory doc path cite (not a filesystem read). -/
def inventoryDocPath : String := "src/systems/surface-matrix.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/SurfaceMatrix.lean"

/-- Read-only package root path cite (not a filesystem read). -/
def packageRootPath : String := "src/systems/SystemsLean.lean"

/-! ### Dual cite paths (six JOIN-ALG algorithm examples; read-only) -/

def dualConsumeTokenIdris : String := "src/idris2/examples/ConsumeToken.idr"
def dualConsumeTokenLean : String := "src/lean4/examples/ConsumeToken.lean"
def dualErasedIndexIdris : String := "src/idris2/examples/ErasedIndex.idr"
def dualErasedIndexLean : String := "src/lean4/examples/ErasedIndex.lean"
def dualUnrestrictedShareIdris : String := "src/idris2/examples/UnrestrictedShare.idr"
def dualUnrestrictedShareLean : String := "src/lean4/examples/UnrestrictedShare.lean"
def dualFailClosedGradeIdris : String := "src/idris2/examples/FailClosedGrade.idr"
def dualFailClosedGradeLean : String := "src/lean4/examples/FailClosedGrade.lean"
def dualLinearPairSwapIdris : String := "src/idris2/examples/LinearPairSwap.idr"
def dualLinearPairSwapLean : String := "src/lean4/examples/LinearPairSwap.lean"
def dualRuntimeExtractIdris : String := "src/idris2/examples/RuntimeExtract.idr"
def dualRuntimeExtractLean : String := "src/lean4/examples/RuntimeExtract.lean"

/-- dualCiteOk -- six JOIN-ALG dual-pair path cites match layout.
    Surface-level constant canary only (not an FS walk of dual trees).
    Greppable: ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade,
    LinearPairSwap, RuntimeExtract, JOIN-ALG. -/
def dualCiteOk : Bool :=
  (dualConsumeTokenIdris == "src/idris2/examples/ConsumeToken.idr")
    && (dualConsumeTokenLean == "src/lean4/examples/ConsumeToken.lean")
    && (dualErasedIndexIdris == "src/idris2/examples/ErasedIndex.idr")
    && (dualErasedIndexLean == "src/lean4/examples/ErasedIndex.lean")
    && (dualUnrestrictedShareIdris == "src/idris2/examples/UnrestrictedShare.idr")
    && (dualUnrestrictedShareLean == "src/lean4/examples/UnrestrictedShare.lean")
    && (dualFailClosedGradeIdris == "src/idris2/examples/FailClosedGrade.idr")
    && (dualFailClosedGradeLean == "src/lean4/examples/FailClosedGrade.lean")
    && (dualLinearPairSwapIdris == "src/idris2/examples/LinearPairSwap.idr")
    && (dualLinearPairSwapLean == "src/lean4/examples/LinearPairSwap.lean")
    && (dualRuntimeExtractIdris == "src/idris2/examples/RuntimeExtract.idr")
    && (dualRuntimeExtractLean == "src/lean4/examples/RuntimeExtract.lean")

/-! ### Matrix row status vocabulary (inventory strings; not product C) -/

/-- Row present on host as progressive partial (not full parity). -/
def statusPresentPartial : String := "present-partial"

/-- Row open / not claimed (full feature, parity, or deferred track). -/
def statusOpen : String := "open"

/-- Row claimed PROVABLY after green product CompCert matrix + pin flip. -/
def statusProvably : String := "PROVABLY"

/-- Dual formal map theorems inventory row (partial named edges; not isomorphism).
    Edges: failClosedGrade_host_use_implies_mult_unknown_reject and
    runtimeExtract_host_use_implies_unknown_runtime_reject in JoinMapTheorems.
    Greppable: rowDualFormalMap, dualFormalMapPartial, present-partial. -/
def rowDualFormalMap : String := statusPresentPartial

/-- dualFormalMapPartialOk -- dual formal map row is present-partial (not open,
    not isomorphism complete). Greppable: dualFormalMapPartialOk. -/
def dualFormalMapPartialOk : Bool :=
  rowDualFormalMap == statusPresentPartial

/-- Row measured against living claim pin / fail-closed evidence (not full parity). -/
def statusMeasured : String := "measured"

/-- Multiplicity surface MULT-0 / MULT-1 / MULT-OMEGA (host Mult). -/
def rowMult : String := statusPresentPartial

/-- Linear / JOIN-ALG duals (ConsumeToken host + ErasedIndex/UnrestrictedShare cite). -/
def rowLinearJoin : String := statusPresentPartial

/-- Typed IR / ordered program / graph edges (Types + IrProgram + IrGraph). -/
def rowTypedIrProgramGraph : String := statusPresentPartial

/-- Erasure + extract (MULT-0 erase; RUNTIME-FS extract honesty). -/
def rowEraseExtract : String := statusPresentPartial

/-- Host compose (graph + linear + erasure; multPreScan). -/
def rowHostCompose : String := statusPresentPartial

/-- Emit plan / apply / body honesty (HOST-EMIT-SSOT fragment; frozen wire). -/
def rowEmitPlanApplyBody : String := statusPresentPartial

/-- Compile path host readiness (HOST-COMPILE-PATH V1; V0 structure remains). -/
def rowCompilePath : String := statusPresentPartial

/-- Join map into Slake (HOST-JOIN-MAP; duals cite only). -/
def rowJoinMap : String := statusPresentPartial

/-- Self-host direction readiness (HOST-SELF-HOST; not self-host complete). -/
def rowSelfHostDirection : String := statusPresentPartial

/-- Full Idris 2 / Lean 4 syntax surface (not claimed day-one). -/
def rowSyntaxSurface : String := statusOpen

/-- Full classic elaborator parity inventory row (measured under M1-M6 bar).
    Living tip: package L4 multi-band PACKAGE-ELABORATE dual-ok
    (MultExtractFoundation + MultLinearTypesProof + KernelEmitParity +
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEnv
    real multi-module Mult..EmitBody + Kernel Mult/Linear/Types/Program/Emit +
    ParityMult + ParityLinear + ParityTypes + ParityProgram + ParityEmit env judgment) plus unit TERM
    Mult..EmitBody + Kernel Mult..Emit + ParityMult + ParityLinear + ParityTypes +
    ParityProgram + ParityEmit and PROOF Mult/Linear/Types dual-ok. Measured bar M1-M6 met
    (research full-classic-elaborator-parity-measured-bar-2026-08-09.md).
    Still not seed-wide J1-J12 Lake-grade package typecheck of full seed; not
    mathlib; FullHost stays false; free claimed != full Lean 4 elaborator.
    statusMeasured = named row bar met with fail-closed dual-ok evidence.
    Greppable: rowFullElaborator, measured, PACKAGE-ELABORATE,
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEnv-only. -/
def rowFullElaborator : String := statusMeasured

/-- Freestanding product self-host complete inventory row.
    Living claim pin freestandingProductSelfHostComplete is true elsewhere
    (SelfApplyFs). Inventory string statusMeasured matches living tip (claim B).
    Not the claim-B SSoT; not residual free synonym; not proof complete. -/
def rowFreestandingSelfHost : String := statusMeasured

/-- out/llvm-ir unlock inventory row.
    Living pin LlvmHold.llvmUnlocked is true (not full backend). Inventory
    string statusMeasured matches unlock tip. Not full CFG/SSA / Rust-native
    link; full backend stays a separate open prose row in surface-matrix.md. -/
def rowLlvm : String := statusMeasured

/-- CompCert PROVABLY (claimed after green product matrix + pin flip). -/
def rowProvably : String := statusProvably

/-- Full Idris 2 core parity (not claimed; progressive gates only). -/
def rowFullIdrisParity : String := statusOpen

/-- Full Lean 4 core parity (not claimed; progressive gates only). -/
def rowFullLeanParity : String := statusOpen

/-- hostRowsPresentPartialOk -- host progressive rows are present-partial. -/
def hostRowsPresentPartialOk : Bool :=
  (rowMult == statusPresentPartial)
    && (rowLinearJoin == statusPresentPartial)
    && (rowTypedIrProgramGraph == statusPresentPartial)
    && (rowEraseExtract == statusPresentPartial)
    && (rowHostCompose == statusPresentPartial)
    && (rowEmitPlanApplyBody == statusPresentPartial)
    && (rowCompilePath == statusPresentPartial)
    && (rowJoinMap == statusPresentPartial)
    && (rowSelfHostDirection == statusPresentPartial)

/-- openRowsOpenOk -- open / not-claimed full-language-parity rows stay open.
    Full classic elaborator parity is measured (rowFullElaboratorMeasuredOk),
    not open. Freestanding complete, llvm unlock, and CompCert PROVABLY are
    measured / claimed separately. Full backend stays open in prose. -/
def openRowsOpenOk : Bool :=
  (rowSyntaxSurface == statusOpen)
    && (rowFullIdrisParity == statusOpen)
    && (rowFullLeanParity == statusOpen)

/-- rowFullElaboratorMeasuredOk -- Full classic elaborator parity is measured.
    M1-M6 bar met: multi-band PACKAGE-ELABORATE + unit TERM/PROOF + MultLinear
    package env judgments path; not seed-wide J1-J12 full seed typecheck; not
    mathlib; FullHost stays false.
    Greppable: rowFullElaboratorMeasuredOk, measured, PACKAGE-ELABORATE. -/
def rowFullElaboratorMeasuredOk : Bool :=
  rowFullElaborator == statusMeasured

/-- Historical name kept as alias of measured gate (greppable partialOk retired).
    Greppable: rowFullElaboratorPartialOk, measured, PACKAGE-ELABORATE. -/
def rowFullElaboratorPartialOk : Bool :=
  rowFullElaboratorMeasuredOk

/-- rowFreestandingSelfHostMeasuredOk -- freestanding complete inventory measured.
    Inventory string self-check only (same pattern as rowProvablyClaimedOk).
    Does not import SelfApplyFs.freestandingProductSelfHostComplete; living tip
    dual-pin lag is intentional -- reseed inventory strings with a named residual
    if tip and canary diverge. Not claim-B SSoT. -/
def rowFreestandingSelfHostMeasuredOk : Bool :=
  rowFreestandingSelfHost == statusMeasured

/-- rowLlvmMeasuredOk -- llvm unlock inventory measured (not full backend).
    Inventory string self-check only (same pattern as rowProvablyClaimedOk).
    Does not import LlvmHold.llvmUnlocked; living tip dual-pin lag intentional.
    Full backend stays open in surface-matrix.md prose. -/
def rowLlvmMeasuredOk : Bool :=
  rowLlvm == statusMeasured

/-- rowProvablyClaimedOk -- CompCert PROVABLY row claimed (not open).
    Inventory string self-check only; does not import LlvmHold.provablyUnlocked. -/
def rowProvablyClaimedOk : Bool :=
  rowProvably == statusProvably

/-- matrixSurfaceOk -- stage / dual / row-status inventory canary.
    Surface-level only (not implementing missing language features).
    Greppable: matrixSurfaceOk, SURFACE-MATRIX, present-partial, open, measured. -/
def matrixSurfaceOk : Bool :=
  (stageId == "SLAKE_SURFACE_MATRIX_V0")
    && (hostSurfaceMatrixId == "HOST-SURFACE-MATRIX")
    && (surfaceMatrixId == "SURFACE-MATRIX")
    && (inventoryDocPath == "src/systems/surface-matrix.md")
    && (hostModulePath == "src/systems/SystemsLean/SurfaceMatrix.lean")
    && (packageRootPath == "src/systems/SystemsLean.lean")
    && dualCiteOk
    && hostRowsPresentPartialOk
    && openRowsOpenOk
    && dualFormalMapPartialOk
    && rowFullElaboratorMeasuredOk
    && rowFreestandingSelfHostMeasuredOk
    && rowLlvmMeasuredOk
    && rowProvablyClaimedOk

/-- SURFACE-MATRIX readiness verdict (inventory; not product C; not superset complete).
    Field layering (JoinMap / SelfHost pattern; not pre-folded):
    - selfHostUnit: SelfHost.selfHostUnitReady (join + host surface; pure call)
    - unitReady: pure CompilePath.unitCompileReady (no join / self-host fold)
    - matrixSurface: matrixSurfaceOk canary only
    - ok: selfHostUnit && matrixSurface (== matrixUnitReady while self-host holds) -/
structure Verdict where
  selfHostUnit : Bool
  unitReady : Bool
  matrixSurface : Bool
  ok : Bool
  deriving DecidableEq, Repr

/-- Fail-closed zeroed verdict. -/
def Verdict.failClosed : Verdict := {
  selfHostUnit := false
  unitReady := false
  matrixSurface := false
  ok := false
}

/-- matrixUnitReady hc -- surface-matrix unit bar (self-host-informed).
    FAIL-CLOSED: SelfHost.selfHostUnitReady && matrixSurfaceOk.
    Reuses self-host unit bar; no parallel type zoo.
    Does not fold programCompileReady (sibling API).
    Greppable: matrixUnitReady, HOST-SURFACE-MATRIX, HOST-SELF-HOST. -/
def matrixUnitReady (hc : Host) : Bool :=
  SelfHost.selfHostUnitReady hc && matrixSurfaceOk

/-- matrixReady hc -- HOST-SURFACE-MATRIX unit bar alias of matrixUnitReady.
    Empty HostCompose is OK when self-host unit bar holds (vacuous mult pre-scan).
    Does not emit C. Does not claim full superset parity or residual free. -/
def matrixReady (hc : Host) : Bool :=
  matrixUnitReady hc

/-- matrixProgramReady p -- surface-matrix program bar (sibling).
    FAIL-CLOSED: SelfHost.selfHostProgramReady && matrixSurfaceOk.
    EMPTY-PROGRAM-FAIL-CLOSED: empty ordered program is not program-ready
    (distinct from empty HostCompose, which is unit-ready under matrix map).
    Greppable: matrixProgramReady, EMPTY-PROGRAM-FAIL-CLOSED. -/
def matrixProgramReady (p : Program) : Bool :=
  SelfHost.selfHostProgramReady p && matrixSurfaceOk

/-- verdictOf hc -- inventory Verdict with layered fields (SelfHost pattern).
    unitReady is pure CompilePath.unitCompileReady (not self-host-pre-folded).
    ok == selfHostUnit && matrixSurface == matrixUnitReady hc.
    Does not fold program bar. -/
def verdictOf (hc : Host) : Verdict :=
  let selfHostUnit := SelfHost.selfHostUnitReady hc
  let unitReady := CompilePath.unitCompileReady hc
  let matrixSurface := matrixSurfaceOk
  {
    selfHostUnit := selfHostUnit
    unitReady := unitReady
    matrixSurface := matrixSurface
    ok := selfHostUnit && matrixSurface
  }

end SystemsLean.SurfaceMatrix
