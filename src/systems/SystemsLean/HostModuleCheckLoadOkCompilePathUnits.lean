/-
  SYSTEMS_LEAN_HOST partial -- LoadOk fold for S8 CompilePath unit TERM SurfaceOk.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: aggregate dual-ok gates for CompilePathMult..Extract
  plus Plan/Apply/Body TERM companions so HostModuleCheckLoadOk stays under
  Sub-1-KLOC.
  Same namespace SystemsLean.HostModuleCheck.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only. Not FullHost re-true. Not package elaborate.
  - Mult..DualResidual prior TERM dual-ok unchanged.
  - Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLoadOkCompilePathUnits, hostModuleCheckCompilePathUnitsTermSurfaceOk,
  TERM-SURFACE, CompilePathMult-only, CompilePathLinear-only, CompilePathTypes-only,
  CompilePathProgram-only, CompilePathGraph-only, CompilePathCompose-only,
  CompilePathErasure-only, CompilePathExtract-only,
  CompilePathPlan-only, CompilePathApply-only, CompilePathBody-only,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLoadOkCompilePathUnits
  Red/green: lake build SystemsLean.HostModuleCheckLoadOkCompilePathUnits;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckCompilePathMultTerm
import SystemsLean.HostModuleCheckCompilePathLinearTerm
import SystemsLean.HostModuleCheckCompilePathTypesTerm
import SystemsLean.HostModuleCheckCompilePathProgramTerm
import SystemsLean.HostModuleCheckCompilePathGraphTerm
import SystemsLean.HostModuleCheckCompilePathComposeTerm
import SystemsLean.HostModuleCheckCompilePathErasureTerm
import SystemsLean.HostModuleCheckCompilePathExtractTerm
import SystemsLean.HostModuleCheckCompilePathPlanTerm
import SystemsLean.HostModuleCheckCompilePathApplyTerm
import SystemsLean.HostModuleCheckCompilePathBodyTerm

namespace SystemsLean.HostModuleCheck

/-- S8 CompilePath unit modules TERM SurfaceOk aggregate (LoadOk fold).
    Greppable: hostModuleCheckCompilePathUnitsTermSurfaceOk, TERM-SURFACE. -/
def hostModuleCheckCompilePathUnitsTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathMultTermSurfaceOk
    && hostModuleCheckCompilePathLinearTermSurfaceOk
    && hostModuleCheckCompilePathTypesTermSurfaceOk
    && hostModuleCheckCompilePathProgramTermSurfaceOk
    && hostModuleCheckCompilePathGraphTermSurfaceOk
    && hostModuleCheckCompilePathComposeTermSurfaceOk
    && hostModuleCheckCompilePathErasureTermSurfaceOk
    && hostModuleCheckCompilePathExtractTermSurfaceOk
    && hostModuleCheckCompilePathPlanTermSurfaceOk
    && hostModuleCheckCompilePathApplyTermSurfaceOk
    && hostModuleCheckCompilePathBodyTermSurfaceOk

theorem hostModuleCheckCompilePathUnitsTermSurfaceOk_true :
    hostModuleCheckCompilePathUnitsTermSurfaceOk = true := by native_decide

end SystemsLean.HostModuleCheck
