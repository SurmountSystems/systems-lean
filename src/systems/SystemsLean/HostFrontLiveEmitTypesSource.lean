/-
  SYSTEMS_LEAN_HOST partial -- dual-pin of EmitTypes.lean bytes.
  liveEmitTypesSource is the exact bytes of
  src/systems/SystemsLean/EmitTypes.lean.
  Module: SystemsLean.HostFrontLiveEmitTypesSource
  Not FullHost. Not a new emit feature. Not a remill.
  Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, liveEmitTypesSource.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveEmitTypes

def liveEmitTypesSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- host-owned Types freestanding C product text.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): Types.lean kind/mult; emit slake_type_tag / slake_ir_node;
    self-host.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_EMIT_TYPES_V0 / HOST-EMIT-TYPES / SELF-HOST-EMIT-TYPES:
    Lean owns freestanding Types product C text
    (slake_type_tag + TYPED_IR_V0 slake_ir_node kind/mult + fail-closed).
  - Scaffolding text + emitTypesReady live in SystemsLean.EmitTypesScaffold
    (same namespace; long-file peel). Greppable: typesHeaderFragment,
    typesBodyFragment, emitTypesReady, SLAKE_SELF_HOST_EMIT_TYPES_V0.
  - Durable artifact: src/systems/emit/host_emit_types.ssot.txt
    (TYPES_C_HEADER / TYPES_C_BODY blocks match typesHeaderFragment /
    typesBodyFragment).
  - FreestandingEmit embeds Types product text from the durable SSOT artifact;
    it must not invent a second Types dialect.
  - TYPED_IR_V0 / COMMON-UNIVERSE / slake_ir_node greppable on wire.
  - emitTypesReady: surface + honesty piece equality (scaffold).
  - No new EMIT_TYPES_V0 residual C stage ladder (host stage ids only).
  - Contiguous Types+TYPED_IR after Extract on product wire (depends on Mult /
    Linear / Erasure / FAIL_CLOSED_CHECKER types and decls).

  Intentional non-claims / partial parity:
  - PARTIAL: Types product C text SSoT only; not full product module emit;
    not compiler self-application; host compose stays template
    (IR program product text is HOST-EMIT-PROGRAM / EmitProgram;
    IR graph product text is HOST-EMIT-GRAPH / EmitGraph).
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm. Does not grow bash EMIT_* residual treadmill.
  - Does not put elaborator type checker on freestanding C.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_TYPES_V0, HOST-EMIT-TYPES,
  SELF-HOST-EMIT-TYPES, EMIT-TYPES-SMOKE, HOST-EMIT-TYPES-SMOKE,
  TYPED_IR_V0, COMMON-UNIVERSE, slake_type_tag, slake_ir_node,
  slake_ir_node_init, slake_ir_node_is_well_typed, typesHeaderFragment,
  typesBodyFragment, emitTypesReady, NON-SSOT, RUNTIME-FS, EmitTypesScaffold,
  theorem emitTypesReady_true, UNIT_SURFACE host surface. Module: SystemsLean.EmitTypes
  Long-file peel: HOST-EMIT-TYPES scaffolding in SystemsLean.EmitTypesScaffold
  (same namespace). Product-text ownership only.
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.EmitTypesScaffold

namespace SystemsLean.EmitTypes

/-! ### HOST-EMIT-TYPES scaffolding peeled to EmitTypesScaffold (same namespace)
    Greppable cites (defs live on EmitTypesScaffold): HOST-EMIT-TYPES,
    SELF-HOST-EMIT-TYPES, SLAKE_SELF_HOST_EMIT_TYPES_V0, typesHeaderFragment,
    typesBodyFragment, emitTypesReady, emitTypesOk, ownershipHonestyOk,
    headerHonestyOk, bodyHonestyOk, emitTypesSurfaceOk, EMIT-TYPES-SMOKE,
    HOST-EMIT-TYPES-SMOKE, EmitTypesScaffold, theorem emitTypesReady_true,
    NON-SSOT, src/systems/emit/host_emit_types.ssot.txt,
    src/systems/SystemsLean/EmitTypes.lean,
    slake_type_tag, slake_ir_node, slake_ir_node_init, slake_ir_node_is_well_typed,
    TYPED_IR_V0, COMMON-UNIVERSE.
    Import SystemsLean.EmitTypesScaffold above. Product-text ownership only --
    not residual free / not complete. -/

end SystemsLean.EmitTypes
"#

end SystemsLean.HostFrontLiveEmitTypes
