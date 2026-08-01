/-
  SYSTEMS_LEAN_HOST partial -- host-owned Erasure freestanding C product text.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): Erasure.lean marker / isRuntimeAbsent; emit slake_erased_*;
    self-host.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_EMIT_ERASURE_V0 / HOST-EMIT-ERASURE / SELF-HOST-EMIT-ERASURE:
    Lean owns freestanding mult-0 erasure product C text
    (slake_erased + mark / is_marked / is_runtime_absent).
  - Scaffolding text + emitErasureReady live in SystemsLean.EmitErasureScaffold
    (same namespace; long-file split). Greppable: erasureHeaderFragment,
    erasureBodyFragment, emitErasureReady, SLAKE_SELF_HOST_EMIT_ERASURE_V0.
  - Durable artifact: src/systems/emit/host_emit_erasure.ssot.txt
    (ERASURE_C_HEADER / ERASURE_C_BODY blocks match erasureHeaderFragment /
    erasureBodyFragment).
  - FreestandingEmit embeds Erasure product text from the durable SSOT artifact;
    it must not invent a second Erasure dialect.
  - ERASE-RULE-MULT-0 / ERASE-NO-RUNTIME greppable on wire.
  - emitErasureReady: surface + honesty piece equality (scaffold).
  - No new EMIT_ERASURE_V0 residual C stage ladder (host stage ids only).
  - This is mult-0 absence honesty on freestanding C -- not a type system in C.

  Intentional non-claims / partial parity:
  - PARTIAL: Erasure product C text SSoT only; not full product module emit;
    not compiler self-application; Extract / FAIL_CLOSED is HOST-EMIT-EXTRACT.
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm. Does not grow bash EMIT_* residual treadmill.
  - Does not put elaborator types on freestanding C.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_ERASURE_V0, HOST-EMIT-ERASURE,
  SELF-HOST-EMIT-ERASURE, EMIT-ERASURE-SMOKE, HOST-EMIT-ERASURE-SMOKE,
  ERASE-RULE-MULT-0, ERASE-NO-RUNTIME, slake_erased_mark,
  slake_erasure_is_runtime_absent, erasureHeaderFragment, erasureBodyFragment,
  emitErasureReady, NON-SSOT, EmitErasureScaffold,
  UNIT_SURFACE host surface. Module: SystemsLean.EmitErasure
  Long-file split: HOST-EMIT-ERASURE scaffolding in SystemsLean.EmitErasureScaffold
  (same namespace). Product-text ownership only.
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.EmitErasureScaffold

namespace SystemsLean.EmitErasure

/-! ### HOST-EMIT-ERASURE scaffolding split to EmitErasureScaffold (same namespace)
    Greppable cites (defs live on EmitErasureScaffold): HOST-EMIT-ERASURE,
    SELF-HOST-EMIT-ERASURE, SLAKE_SELF_HOST_EMIT_ERASURE_V0, erasureHeaderFragment,
    erasureBodyFragment, emitErasureReady, emitErasureOk, ownershipHonestyOk,
    headerHonestyOk, bodyHonestyOk, emitErasureSurfaceOk,
    EMIT-ERASURE-SMOKE, HOST-EMIT-ERASURE-SMOKE, EmitErasureScaffold, NON-SSOT,
    ERASE-RULE-MULT-0, ERASE-NO-RUNTIME, slake_erased_mark,
    slake_erasure_is_runtime_absent,
    src/systems/emit/host_emit_erasure.ssot.txt,
    src/systems/SystemsLean/EmitErasure.lean.
    Import SystemsLean.EmitErasureScaffold above. Product-text ownership only --
    not residual free / not complete. -/

end SystemsLean.EmitErasure
