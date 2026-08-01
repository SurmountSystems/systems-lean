/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path bar assembly.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns unit / program / emit / join / self-host / matrix freestanding path
  readiness Bools and freestandingProductPathReady joint fold used by
  SystemsLean.ProductPath. Surface cites, productPathReady, ladder close,
  theorems, and smoke stay in ProductPath. Same namespace SystemsLean.ProductPath
  so call sites stay unqualified.

  Spec (readable):
  - freestandingUnitProductPathReady through freestandingMatrixProgramProductPathReady:
    fail-closed real Bool path honesty (empty / unminted / lowered compose or
    program kernel) reusing CompilePath, KernelEmit, KernelProgram, JoinMap,
    SelfHost, SurfaceMatrix, SelfApplyFs bars -- not docs-only canaries.
  - freestandingProductPathReady: joint fold of those nine path bars.

  Intentional non-claims:
  - Path bar honesty only -- NOT freestanding residual free.
  - NOT freestanding product self-host complete (direction bars only).
  - NOT day-one full Idris+Lean surface parity. NOT PROVABLY. NOT llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, freestandingUnitProductPathReady,
  freestandingProgramProductPathReady, freestandingEmitProductPathReady,
  freestandingJoinProductPathReady, freestandingJoinUnitProductPathReady,
  freestandingJoinProgramProductPathReady, freestandingSelfHostProductPathReady,
  freestandingSelfHostUnitProductPathReady,
  freestandingSelfHostProgramProductPathReady,
  freestandingMatrixUnitProductPathReady,
  freestandingMatrixProgramProductPathReady, freestandingProductPathReady,
  ProductPathBars, UNIT_SURFACE host surface, RUNTIME-FS, EMPTY-PROGRAM-FAIL-CLOSED,
  HOST-JOIN-MAP, HOST-SELF-HOST, HOST-SURFACE-MATRIX, HOST-KERNEL-EMIT,
  HOST-EMIT-SSOT, HOST-EMIT-MULT.
  Module: SystemsLean.ProductPathBars
  Red/green: just systems-host; lake build SystemsLean.ProductPath.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.CompilePath
import SystemsLean.KernelEmit
import SystemsLean.KernelProgram
import SystemsLean.HostCompose
import SystemsLean.IrProgram
import SystemsLean.JoinMap
import SystemsLean.SelfHost
import SystemsLean.SurfaceMatrix
import SystemsLean.SelfApplyFs

namespace SystemsLean.ProductPath

/-- freestandingUnitProductPathReady -- freestanding unit product path honesty
    (CompilePath.unitCompileReady / extractOkFs on empty, unminted, lowered emit).
    FAIL-CLOSED real Bools:
      1) empty HostCompose unitCompileReady + extractOkFs true
      2) unminted emit compose unitCompileReady false + extractOkFs false
      3) lowerEmitCompose some + unitCompileReady true + extractOkFs true
    Greppable: freestandingUnitProductPathReady, unitCompileReady, extractOkFs. -/
def freestandingUnitProductPathReady : Bool :=
  let emptyOk :=
    CompilePath.unitCompileReady HostCompose.empty
      && HostCompose.extractOkFs HostCompose.empty
  let unmintedFails :=
    !CompilePath.unitCompileReady KernelEmit.unmintedEmitCompose
      && !HostCompose.extractOkFs KernelEmit.unmintedEmitCompose
  match KernelEmit.lowerEmitCompose with
  | none => false
  | some hc =>
      emptyOk
        && unmintedFails
        && CompilePath.unitCompileReady hc
        && HostCompose.extractOkFs hc

/-- freestandingProgramProductPathReady -- sibling program path honesty
    (EMPTY-PROGRAM-FAIL-CLOSED + well-typed lowered kernel).
    FAIL-CLOSED real Bools:
      1) empty program programCompileReady false
      2) lowerProgramKernel some + programCompileReady + isWellTyped
    Greppable: freestandingProgramProductPathReady, programCompileReady. -/
def freestandingProgramProductPathReady : Bool :=
  let emptyFails := !CompilePath.programCompileReady IrProgram.empty
  match KernelProgram.lowerProgramKernel with
  | none => false
  | some p =>
      emptyFails
        && CompilePath.programCompileReady p
        && IrProgram.isWellTyped p

/-- freestandingEmitProductPathReady -- freestanding emit product path honesty
    (HOST-KERNEL-EMIT plan/apply/body + HOST-EMIT-SSOT body deepen).
    FAIL-CLOSED real Bools (reuse, do not duplicate theater):
      1) KernelEmit.emitPlanPathReady (empty plan OK / unminted fails /
         lowerEmitCompose plan ready with r=2 e=1)
      2) KernelEmit.emitApplyPathReady (empty apply OK / unminted fails /
         tags [2, 17, 32])
      3) KernelEmit.emitBodyPathReady (empty SSOT fragment / unminted fails /
         exact HOST-EMIT-SSOT body)
      4) KernelEmit.emitKernelReady (intentional re-assert of plan/apply/body +
         EmitMult.emitMultReady + programKernelReady + surface)
      5) SelfApplyFs.freestandingBodyPathReady (HOST-EMIT-SSOT body path +
         emitMultReady on same compose; greppable freestanding body bar)
    Greppable: freestandingEmitProductPathReady, emitPlanPathReady,
    emitApplyPathReady, emitBodyPathReady, emitKernelReady,
    freestandingBodyPathReady, HOST-KERNEL-EMIT, HOST-EMIT-SSOT, HOST-EMIT-MULT. -/
def freestandingEmitProductPathReady : Bool :=
  KernelEmit.emitPlanPathReady
    && KernelEmit.emitApplyPathReady
    && KernelEmit.emitBodyPathReady
    && KernelEmit.emitKernelReady
    && SelfApplyFs.freestandingBodyPathReady

/-- freestandingJoinProductPathReady -- freestanding join *unit* product path honesty
    (HOST-JOIN-MAP joinUnitCompileReady on empty / unminted / lowerEmitCompose).
    FAIL-CLOSED real Bools:
      1) empty HostCompose joinUnitCompileReady true
      2) unminted emit compose joinUnitCompileReady false
      3) lowerEmitCompose some + joinUnitCompileReady true
    Sibling: freestandingJoinProgramProductPathReady (program bar; empty program
    fail-closed). Dual greppable alias freestandingJoinUnitProductPathReady.
    Greppable: freestandingJoinProductPathReady, joinUnitCompileReady,
    HOST-JOIN-MAP. -/
def freestandingJoinProductPathReady : Bool :=
  let emptyOk := JoinMap.joinUnitCompileReady HostCompose.empty
  let unmintedFails :=
    !JoinMap.joinUnitCompileReady KernelEmit.unmintedEmitCompose
  match KernelEmit.lowerEmitCompose with
  | none => false
  | some hc =>
      emptyOk && unmintedFails && JoinMap.joinUnitCompileReady hc

/-- freestandingJoinUnitProductPathReady -- dual greppable alias of
    freestandingJoinProductPathReady (joint name honesty with join program sibling).
    Greppable: freestandingJoinUnitProductPathReady. -/
def freestandingJoinUnitProductPathReady : Bool :=
  freestandingJoinProductPathReady

/-- freestandingJoinProgramProductPathReady -- freestanding join *program* product
    path honesty (HOST-JOIN-MAP joinProgramCompileReady; sibling of
    freestandingJoinProductPathReady / freestandingJoinUnitProductPathReady).
    Pattern after freestandingProgramProductPathReady + JoinMap.joinProgramCompileReady.
    FAIL-CLOSED real Bools:
      1) empty program joinProgramCompileReady false (EMPTY-PROGRAM-FAIL-CLOSED)
      2) lowerProgramKernel some + joinProgramCompileReady + isWellTyped
    Does not fold join unit bar (sibling APIs; unit empty host OK != empty program).
    Greppable: freestandingJoinProgramProductPathReady, joinProgramCompileReady,
    EMPTY-PROGRAM-FAIL-CLOSED, HOST-JOIN-MAP. -/
def freestandingJoinProgramProductPathReady : Bool :=
  let emptyFails := !JoinMap.joinProgramCompileReady IrProgram.empty
  match KernelProgram.lowerProgramKernel with
  | none => false
  | some p =>
      emptyFails
        && JoinMap.joinProgramCompileReady p
        && IrProgram.isWellTyped p

/-- freestandingSelfHostProductPathReady -- freestanding self-host *direction*
    *unit* product path honesty (HOST-SELF-HOST / SLAKE_SELF_HOST_V0 /
    selfHostUnitReady). Dual greppable alias freestandingSelfHostUnitProductPathReady.
    FAIL-CLOSED real Bools:
      1) empty HostCompose selfHostUnitReady true
      2) unminted emit compose selfHostUnitReady false
      3) lowerEmitCompose some + selfHostUnitReady true
    Does NOT claim freestanding product self-host complete (direction only).
    Greppable: freestandingSelfHostProductPathReady, selfHostUnitReady,
    HOST-SELF-HOST, SLAKE_SELF_HOST_V0. -/
def freestandingSelfHostProductPathReady : Bool :=
  let emptyOk := SelfHost.selfHostUnitReady HostCompose.empty
  let unmintedFails :=
    !SelfHost.selfHostUnitReady KernelEmit.unmintedEmitCompose
  match KernelEmit.lowerEmitCompose with
  | none => false
  | some hc =>
      emptyOk && unmintedFails && SelfHost.selfHostUnitReady hc

/-- freestandingSelfHostUnitProductPathReady -- dual greppable alias of
    freestandingSelfHostProductPathReady (joint name honesty with self-host
    program sibling). Greppable: freestandingSelfHostUnitProductPathReady. -/
def freestandingSelfHostUnitProductPathReady : Bool :=
  freestandingSelfHostProductPathReady

/-- freestandingSelfHostProgramProductPathReady -- freestanding self-host
    *direction* *program* product path honesty (HOST-SELF-HOST /
    selfHostProgramReady; sibling of freestandingSelfHostProductPathReady /
    freestandingSelfHostUnitProductPathReady).
    Pattern after freestandingProgramProductPathReady + SelfHost.selfHostProgramReady.
    FAIL-CLOSED real Bools:
      1) empty program selfHostProgramReady false (EMPTY-PROGRAM-FAIL-CLOSED)
      2) lowerProgramKernel some + selfHostProgramReady + isWellTyped
    Does NOT claim freestanding product self-host complete (direction only).
    Does not fold self-host unit bar (sibling APIs; unit empty host OK != empty program).
    Greppable: freestandingSelfHostProgramProductPathReady, selfHostProgramReady,
    EMPTY-PROGRAM-FAIL-CLOSED, HOST-SELF-HOST. -/
def freestandingSelfHostProgramProductPathReady : Bool :=
  let emptyFails := !SelfHost.selfHostProgramReady IrProgram.empty
  match KernelProgram.lowerProgramKernel with
  | none => false
  | some p =>
      emptyFails
        && SelfHost.selfHostProgramReady p
        && IrProgram.isWellTyped p

/-- freestandingMatrixUnitProductPathReady -- freestanding surface-matrix *unit*
    product path honesty (HOST-SURFACE-MATRIX / SLAKE_SURFACE_MATRIX_V0 /
    matrixUnitReady). Open matrix rows stay open; not day-one full Idris+Lean
    parity; not residual free.
    FAIL-CLOSED real Bools:
      1) empty HostCompose matrixUnitReady true
      2) unminted emit compose matrixUnitReady false
      3) lowerEmitCompose some + matrixUnitReady true
    Greppable: freestandingMatrixUnitProductPathReady, matrixUnitReady,
    HOST-SURFACE-MATRIX, SLAKE_SURFACE_MATRIX_V0. -/
def freestandingMatrixUnitProductPathReady : Bool :=
  let emptyOk := SurfaceMatrix.matrixUnitReady HostCompose.empty
  let unmintedFails :=
    !SurfaceMatrix.matrixUnitReady KernelEmit.unmintedEmitCompose
  match KernelEmit.lowerEmitCompose with
  | none => false
  | some hc =>
      emptyOk && unmintedFails && SurfaceMatrix.matrixUnitReady hc

/-- freestandingMatrixProgramProductPathReady -- freestanding surface-matrix
    *program* product path honesty (HOST-SURFACE-MATRIX / matrixProgramReady;
    sibling of freestandingMatrixUnitProductPathReady).
    Pattern after freestandingProgramProductPathReady + SurfaceMatrix.matrixProgramReady.
    FAIL-CLOSED real Bools:
      1) empty program matrixProgramReady false (EMPTY-PROGRAM-FAIL-CLOSED)
      2) lowerProgramKernel some + matrixProgramReady + isWellTyped
    Open matrix rows stay open; not day-one full Idris+Lean parity.
    Greppable: freestandingMatrixProgramProductPathReady, matrixProgramReady,
    EMPTY-PROGRAM-FAIL-CLOSED, HOST-SURFACE-MATRIX. -/
def freestandingMatrixProgramProductPathReady : Bool :=
  let emptyFails := !SurfaceMatrix.matrixProgramReady IrProgram.empty
  match KernelProgram.lowerProgramKernel with
  | none => false
  | some p =>
      emptyFails
        && SurfaceMatrix.matrixProgramReady p
        && IrProgram.isWellTyped p

/-- freestandingProductPathReady -- joint unit + program + emit + join unit +
    join program + self-host unit + self-host program + matrix unit + matrix
    program freestanding product path.
    Greppable: freestandingProductPathReady. -/
def freestandingProductPathReady : Bool :=
  freestandingUnitProductPathReady
    && freestandingProgramProductPathReady
    && freestandingEmitProductPathReady
    && freestandingJoinProductPathReady
    && freestandingJoinProgramProductPathReady
    && freestandingSelfHostProductPathReady
    && freestandingSelfHostProgramProductPathReady
    && freestandingMatrixUnitProductPathReady
    && freestandingMatrixProgramProductPathReady

end SystemsLean.ProductPath
