/-
  SYSTEMS_LEAN_HOST partial -- host-side self-host readiness composition.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): SystemsLean.JoinMap join-informed unit/program readiness
    (sibling bars), SystemsLean.CompilePath HOST-COMPILE-PATH, HostCompose
    extractOkFs, package root import shell SystemsLean.lean.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_V0 / HOST-SELF-HOST / SELF-HOST: host map that join-informed
    compile path + host ladder surface are present for self-host *direction*.
  - hostSurfaceOk: surface-level canary (stage ids + package/module path cites).
    Not a filesystem walk of the host ladder; not freestanding product compile.
  - selfHostUnitReady hc: JoinMap.joinUnitCompileReady && hostSurfaceOk
    (FAIL-CLOSED composition; reuses join/unit bar APIs; no parallel type zoo).
  - selfHostProgramReady p: JoinMap.joinProgramCompileReady && hostSurfaceOk
    (sibling API; EMPTY-PROGRAM-FAIL-CLOSED preserved; empty host OK != empty
    program OK).
  - selfHostReady hc: alias of selfHostUnitReady (HOST-SELF-HOST unit bar).
  - Verdict records joinReady / unitReady / hostSurface / ok for inventory.

  Theorems (SELF-HOST-THEOREM / HOST-SELF-HOST-THEOREM -- partial SelfHost only):
  - Live in SystemsLean.SelfHostTheorems (same namespace; long-file split).
  - hostSurfaceOk_true / stageId_eq / hostSelfHostId_eq
  - selfHostUnitReady_empty_true / selfHostProgramReady_empty_false
  - selfHostReady_eq_selfHostUnitReady
  - empty_host_ok_ne_empty_program_ok (self-host sibling bars)
  - selfHostUnitReady_mult1_unminted_false / selfHostUnitReady_mult1_minted_true
  - selfHostProgramReady_single_value (path fixtures; JoinMap sibling pattern)
  - SELF-HOST-SMOKE behavioral examples live with theorems
  These SelfHost theorems do NOT set SpecProof.proofCompleteClaimed true.
  Direction readiness canaries != freestanding product self-host complete.

  Intentional non-claims / partial parity:
  - PARTIAL: host Bool readiness inventory vs freestanding product self-host
    (Slake compiling Systems Lean units to freestanding C without classic
    elaborator). This module is V0 direction readiness, not self-host complete.
  - PARTIAL: hostSurfaceOk is surface-level constant canary, not a structure
    walk of Mult..InventoryClose sources or FS unit compile.
  - Classic Lean elaborator residual remains (managed runtime on host; host
    residual != product wire residual).
  - Freestanding product self-host is later (true self-host unlocks llvm track).
  - Not residual free. Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not a full Slake compiler body. Does not emit product C.
  - Does not fold program bar into unit bar (sibling APIs; P3 residual lesson).
  - Does not unlock out/llvm-ir (still deferred until true self-host).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_V0, HOST-SELF-HOST, SELF-HOST,
  HOST-JOIN-MAP, SLAKE_JOIN_MAP_V0, HOST-COMPILE-PATH, SLAKE_COMPILE_PATH_V1,
  selfHostUnitReady, selfHostProgramReady, selfHostReady, hostSurfaceOk,
  SELF-HOST-SMOKE, EMPTY-PROGRAM-FAIL-CLOSED, FAIL-CLOSED, joinUnitCompileReady,
  SELF-HOST-THEOREM, HOST-SELF-HOST-THEOREM, selfHostUnitReady_empty_true,
  selfHostProgramReady_empty_false, selfHostUnitReady_mult1_unminted_false,
  selfHostUnitReady_mult1_minted_true, selfHostProgramReady_single_value,
  SelfHostTheorems
  UNIT_SURFACE host surface. Module: SystemsLean.SelfHost
  Long-file split: SELF-HOST-THEOREM + SELF-HOST-SMOKE in
  SystemsLean.SelfHostTheorems (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.IrProgram
import SystemsLean.HostCompose
import SystemsLean.CompilePath
import SystemsLean.JoinMap

namespace SystemsLean.SelfHost

open SystemsLean.IrProgram (Program)
open SystemsLean.HostCompose (Host)

/-- Greppable primary stage id for host self-host readiness (P5). -/
def stageId : String := "SLAKE_SELF_HOST_V0"

/-- Greppable host alias for self-host honesty (HOST-SELF-HOST). -/
def hostSelfHostId : String := "HOST-SELF-HOST"

/-- Greppable short map id (SELF-HOST). -/
def selfHostId : String := "SELF-HOST"

/-- Read-only package root path cite (not a filesystem read). -/
def packageRootPath : String := "src/systems/SystemsLean.lean"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/SelfHost.lean"

/-- hostSurfaceOk -- package / stage-id inventory canary for self-host direction.
    Surface-level constant canary only (not an FS walk of Mult..InventoryClose;
    this module is SelfHost; full SYSTEMS_LEAN_HOST ladder includes KernelMult +
    EmitMult + ParityMult + KernelLinear + KernelTypes + KernelProgram +
    SelfApply + LlvmHold).
    Greppable: hostSurfaceOk, SYSTEMS_LEAN_HOST, SELF-HOST. -/
def hostSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_V0")
    && (hostSelfHostId == "HOST-SELF-HOST")
    && (selfHostId == "SELF-HOST")
    && (packageRootPath == "src/systems/SystemsLean.lean")
    && (hostModulePath == "src/systems/SystemsLean/SelfHost.lean")

/-- SELF-HOST readiness verdict (inventory; not product C; not self-host complete).
    Field layering matches JoinMap.verdictOf (sibling inventory, not pre-folded):
    - joinReady: JOIN-ALG dual-cite surface canary only
    - unitReady: pure CompilePath unit bar (extractOkFs + gradeSurfaceOk; no join fold)
    - hostSurface: package/stage-id surface canary only
    - ok: joinReady && unitReady && hostSurface (== selfHostUnitReady while join is unit && joinAlg)
    Inventory can separate "join canary down" from "unit bar down" via fields. -/
structure Verdict where
  joinReady : Bool
  unitReady : Bool
  hostSurface : Bool
  ok : Bool
  deriving DecidableEq, Repr

/-- Fail-closed zeroed verdict. -/
def Verdict.failClosed : Verdict := {
  joinReady := false
  unitReady := false
  hostSurface := false
  ok := false
}

/-- selfHostUnitReady hc -- self-host direction unit bar (join-informed).
    FAIL-CLOSED: JoinMap.joinUnitCompileReady && hostSurfaceOk.
    Reuses join unit bar (unitCompileReady + joinAlgContractOk); no parallel zoo.
    Does not fold programCompileReady (sibling API).
    Greppable: selfHostUnitReady, HOST-SELF-HOST, HOST-JOIN-MAP. -/
def selfHostUnitReady (hc : Host) : Bool :=
  JoinMap.joinUnitCompileReady hc && hostSurfaceOk

/-- selfHostReady hc -- HOST-SELF-HOST unit bar alias of selfHostUnitReady.
    Empty HostCompose is OK when join unit bar holds (vacuous mult pre-scan).
    Does not emit C. Does not claim freestanding residual free or self-host complete. -/
def selfHostReady (hc : Host) : Bool :=
  selfHostUnitReady hc

/-- selfHostProgramReady p -- self-host direction program bar (sibling).
    FAIL-CLOSED: JoinMap.joinProgramCompileReady && hostSurfaceOk.
    EMPTY-PROGRAM-FAIL-CLOSED: empty ordered program is not program-ready
    (distinct from empty HostCompose, which is unit-ready under self-host map).
    Greppable: selfHostProgramReady, EMPTY-PROGRAM-FAIL-CLOSED. -/
def selfHostProgramReady (p : Program) : Bool :=
  JoinMap.joinProgramCompileReady p && hostSurfaceOk

/-- verdictOf hc -- inventory Verdict with layered fields (JoinMap pattern).
    unitReady is pure CompilePath.unitCompileReady (not join-pre-folded).
    ok == joinReady && unitReady && hostSurface == selfHostUnitReady hc.
    Does not fold program bar. -/
def verdictOf (hc : Host) : Verdict :=
  let joinReady := JoinMap.joinAlgContractOk
  let unitReady := CompilePath.unitCompileReady hc
  let hostSurface := hostSurfaceOk
  {
    joinReady := joinReady
    unitReady := unitReady
    hostSurface := hostSurface
    ok := joinReady && unitReady && hostSurface
  }

/- Theorems and SELF-HOST-SMOKE live in SystemsLean.SelfHostTheorems
   (same namespace SystemsLean.SelfHost; long-file split). Parent keeps
   dialect only -- do not import SelfHostTheorems here (import cycle). -/

end SystemsLean.SelfHost
