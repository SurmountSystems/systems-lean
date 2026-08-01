/-
  SYSTEMS_LEAN_HOST partial -- host-side superset surface matrix (P7).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): SystemsLean.SelfHost self-host direction readiness
    (sibling unit/program bars), JoinMap JOIN-ALG dual cite, CompilePath,
    Mult/Linear/Types/IrProgram/IrGraph/Erasure/Extract/HostCompose/Emit*
    host ladder. Dual cite paths (read-only; do not reimplement):
    ConsumeToken, ErasedIndex, UnrestrictedShare under src/idris2/examples/
    and src/lean4/examples/. Inventory prose: src/systems/surface-matrix.md.

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
  - Open rows stay open: full syntax surface, full elaborator, freestanding
    product self-host, llvm, PROVABLY, full Idris parity, full Lean parity.
  - Duals cited only (three JOIN-ALG algorithm examples); no dual invent.
  - Not residual free. Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Does not fold program bar into unit bar (sibling APIs; P3 residual lesson).
  - Does not unlock out/llvm-ir (still deferred until true self-host).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SURFACE_MATRIX_V0, HOST-SURFACE-MATRIX,
  SURFACE-MATRIX, matrixUnitReady, matrixProgramReady, matrixReady,
  matrixSurfaceOk, SURFACE-MATRIX-SMOKE, HOST-SELF-HOST, SLAKE_SELF_HOST_V0,
  HOST-JOIN-MAP, HOST-COMPILE-PATH, MULT-0, MULT-1, MULT-OMEGA, JOIN-ALG,
  ConsumeToken, ErasedIndex, UnrestrictedShare, present-partial, open,
  EMPTY-PROGRAM-FAIL-CLOSED, FAIL-CLOSED, SURFACE-MATRIX-THEOREM,
  HOST-SURFACE-MATRIX-THEOREM, SurfaceMatrixTheorems,
  matrixUnitReady_empty_true, matrixProgramReady_empty_false,
  matrixUnitReady_mult1_unminted_false, matrixUnitReady_mult1_minted_true,
  matrixProgramReady_single_value, UNIT_SURFACE host surface.
  Module: SystemsLean.SurfaceMatrix
  Long-file peel: SURFACE-MATRIX-THEOREM + SURFACE-MATRIX-SMOKE in
  SystemsLean.SurfaceMatrixTheorems (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
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

/-! ### Dual cite paths (three JOIN-ALG algorithm examples; read-only) -/

def dualConsumeTokenIdris : String := "src/idris2/examples/ConsumeToken.idr"
def dualConsumeTokenLean : String := "src/lean4/examples/ConsumeToken.lean"
def dualErasedIndexIdris : String := "src/idris2/examples/ErasedIndex.idr"
def dualErasedIndexLean : String := "src/lean4/examples/ErasedIndex.lean"
def dualUnrestrictedShareIdris : String := "src/idris2/examples/UnrestrictedShare.idr"
def dualUnrestrictedShareLean : String := "src/lean4/examples/UnrestrictedShare.lean"

/-- dualCiteOk -- three JOIN-ALG dual-pair path cites match layout.
    Surface-level constant canary only (not an FS walk of dual trees).
    Greppable: ConsumeToken, ErasedIndex, UnrestrictedShare, JOIN-ALG. -/
def dualCiteOk : Bool :=
  (dualConsumeTokenIdris == "src/idris2/examples/ConsumeToken.idr")
    && (dualConsumeTokenLean == "src/lean4/examples/ConsumeToken.lean")
    && (dualErasedIndexIdris == "src/idris2/examples/ErasedIndex.idr")
    && (dualErasedIndexLean == "src/lean4/examples/ErasedIndex.lean")
    && (dualUnrestrictedShareIdris == "src/idris2/examples/UnrestrictedShare.idr")
    && (dualUnrestrictedShareLean == "src/lean4/examples/UnrestrictedShare.lean")

/-! ### Matrix row status vocabulary (inventory strings; not product C) -/

/-- Row present on host as progressive partial (not full parity). -/
def statusPresentPartial : String := "present-partial"

/-- Row open / not claimed (full feature, parity, or deferred track). -/
def statusOpen : String := "open"

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

/-- Full classic elaborator parity (not claimed). -/
def rowFullElaborator : String := statusOpen

/-- Freestanding product self-host complete (not claimed): HOST-SELF-HOST
    direction + SH5 SelfApply host-structural only; freestanding product
    self-host complete still open; SH6 held. Do not flip to present-partial. -/
def rowFreestandingSelfHost : String := statusOpen

/-- out/llvm-ir pipeline (deferred; SH6 held until true freestanding product
    self-host; SH5 host-structural kernelRebuildsKernel does not unlock). -/
def rowLlvm : String := statusOpen

/-- CompCert PROVABLY (needs real ccomp + matrix; never forge). -/
def rowProvably : String := statusOpen

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

/-- openRowsOpenOk -- open / not-claimed rows stay open (honesty). -/
def openRowsOpenOk : Bool :=
  (rowSyntaxSurface == statusOpen)
    && (rowFullElaborator == statusOpen)
    && (rowFreestandingSelfHost == statusOpen)
    && (rowLlvm == statusOpen)
    && (rowProvably == statusOpen)
    && (rowFullIdrisParity == statusOpen)
    && (rowFullLeanParity == statusOpen)

/-- matrixSurfaceOk -- stage / dual / row-status inventory canary.
    Surface-level only (not implementing missing language features).
    Greppable: matrixSurfaceOk, SURFACE-MATRIX, present-partial, open. -/
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
