/-
  SYSTEMS_LEAN_HOST partial -- host-owned host compose freestanding C product text.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): HostCompose.lean mint/consume/mark path; emit
    slake_host_compose_*; self-host.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_EMIT_COMPOSE_V0 / HOST-EMIT-COMPOSE / SELF-HOST-EMIT-COMPOSE:
    Lean owns freestanding host compose product C text
    (slake_host_compose + init/push_node/add_edge/mint/consume/mark_erased/
    is_well_typed/check_fail_closed/extract).
  - Scaffolding text + emitComposeReady live in SystemsLean.EmitComposeScaffold
    (same namespace; long-file peel). Greppable: composeHeaderFragment,
    composeBodyFragment, emitComposeReady, SLAKE_SELF_HOST_EMIT_COMPOSE_V0.
  - Durable artifact: src/systems/emit/host_emit_compose.ssot.txt
    (COMPOSE_C_HEADER / COMPOSE_C_BODY blocks match composeHeaderFragment /
    composeBodyFragment).
  - FreestandingEmit embeds host compose product text from the durable SSOT
    artifact; it must not invent a second host compose dialect.
  - HOST_COMPOSE_V0 / slake_host_compose greppable on wire.
  - emitComposeReady: surface + honesty piece equality (scaffold).
  - No new EMIT_COMPOSE_V0 residual C stage ladder (host stage ids only).
  - Contiguous host compose after Graph on product wire (depends on graph).

  Intentional non-claims / partial parity:
  - PARTIAL: host compose product C text SSoT only; not full product module emit;
    not compiler self-application; emit plan/apply are HOST-EMIT-PLAN / HOST-EMIT-APPLY.
  - Live-flag honesty on freestanding wire: mint/consume track host live state;
    not elaborator MULT-1 enforcement (host model is live-flag only).
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm. Does not grow bash EMIT_* residual treadmill.
  - Does not put elaborator CFG / SSA on freestanding C.
  - Product wire stage id HOST_COMPOSE_V0 remains on the wire (map only).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_COMPOSE_V0, HOST-EMIT-COMPOSE,
  SELF-HOST-EMIT-COMPOSE, EMIT-COMPOSE-SMOKE, HOST-EMIT-COMPOSE-SMOKE,
  HOST_COMPOSE_V0, slake_host_compose, slake_host_compose_init,
  slake_host_compose_push_node, slake_host_compose_add_edge,
  slake_host_compose_mint, slake_host_compose_consume,
  slake_host_compose_mark_erased, slake_host_compose_is_well_typed,
  slake_host_compose_check_fail_closed, slake_host_compose_extract,
  composeHeaderFragment, composeBodyFragment, emitComposeReady, NON-SSOT,
  EMIT-COMPOSE-PRODUCT-SMOKE, EmitComposeScaffold, theorem emitComposeReady_true,
  UNIT_SURFACE host surface. Module: SystemsLean.EmitCompose
  Long-file peel: HOST-EMIT-COMPOSE scaffolding in SystemsLean.EmitComposeScaffold
  (same namespace). Product-text ownership only.
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.EmitComposeScaffold

namespace SystemsLean.EmitCompose

/-! ### HOST-EMIT-COMPOSE scaffolding peeled to EmitComposeScaffold (same namespace)
    Greppable cites (defs live on EmitComposeScaffold): HOST-EMIT-COMPOSE,
    SELF-HOST-EMIT-COMPOSE, SLAKE_SELF_HOST_EMIT_COMPOSE_V0, composeHeaderFragment,
    composeBodyFragment, emitComposeReady, emitComposeOk, ownershipHonestyOk,
    headerHonestyOk, bodyHonestyOk, emitComposeSurfaceOk, EMIT-COMPOSE-SMOKE,
    HOST-EMIT-COMPOSE-SMOKE, EMIT-COMPOSE-PRODUCT-SMOKE, EmitComposeScaffold,
    theorem emitComposeReady_true, NON-SSOT,
    src/systems/emit/host_emit_compose.ssot.txt,
    src/systems/SystemsLean/EmitCompose.lean,
    slake_host_compose, slake_host_compose_init, slake_host_compose_push_node,
    slake_host_compose_add_edge, slake_host_compose_mint, slake_host_compose_consume,
    slake_host_compose_mark_erased, slake_host_compose_is_well_typed,
    slake_host_compose_check_fail_closed, slake_host_compose_extract,
    HOST_COMPOSE_V0, not elaborator MULT-1.
    Import SystemsLean.EmitComposeScaffold above. Product-text ownership only --
    not residual free / not complete. -/

end SystemsLean.EmitCompose
