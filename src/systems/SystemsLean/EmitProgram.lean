/-
  SYSTEMS_LEAN_HOST partial -- host-owned IR program freestanding C product text.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): IrProgram.lean ordered list; emit slake_ir_program_*;
    self-host.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_EMIT_PROGRAM_V0 / HOST-EMIT-PROGRAM / SELF-HOST-EMIT-PROGRAM:
    Lean owns freestanding ordered IR program product C text
    (slake_ir_program + CAP 8 + init/push/is_well_typed/check_fail_closed).
  - Scaffolding text + emitProgramReady live in SystemsLean.EmitProgramScaffold
    (same namespace; long-file peel). Greppable: programHeaderFragment,
    programBodyFragment, emitProgramReady, SLAKE_SELF_HOST_EMIT_PROGRAM_V0.
  - Durable artifact: src/systems/emit/host_emit_program.ssot.txt
    (PROGRAM_C_HEADER / PROGRAM_C_BODY blocks match programHeaderFragment /
    programBodyFragment).
  - FreestandingEmit embeds IR program product text from the durable SSOT
    artifact; it must not invent a second IR program dialect.
  - IR_PROGRAM_V0 / SLAKE_IR_PROGRAM_CAP / slake_ir_program greppable on wire.
  - emitProgramReady: surface + honesty piece equality (scaffold).
  - No new EMIT_PROGRAM_V0 residual C stage ladder (host stage ids only).
  - Contiguous IR program after Types on product wire (depends on typed nodes).

  Intentional non-claims / partial parity:
  - PARTIAL: IR program product C text SSoT only; not full product module emit;
    not compiler self-application; host compose stays template
    (IR graph product text is HOST-EMIT-GRAPH / EmitGraph).
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm. Does not grow bash EMIT_* residual treadmill.
  - Does not put elaborator CFG / SSA on freestanding C.
  - Product wire stage id IR_PROGRAM_V0 remains on the wire (map only).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_PROGRAM_V0, HOST-EMIT-PROGRAM,
  SELF-HOST-EMIT-PROGRAM, EMIT-PROGRAM-SMOKE, HOST-EMIT-PROGRAM-SMOKE,
  IR_PROGRAM_V0, SLAKE_IR_PROGRAM_CAP, slake_ir_program, slake_ir_program_init,
  slake_ir_program_push, slake_ir_program_is_well_typed,
  slake_ir_program_check_fail_closed, programHeaderFragment, programBodyFragment,
  emitProgramReady, NON-SSOT, RUNTIME-FS, EmitProgramScaffold,
  theorem emitProgramReady_true, UNIT_SURFACE host surface.
  Module: SystemsLean.EmitProgram
  Long-file peel: HOST-EMIT-PROGRAM scaffolding in SystemsLean.EmitProgramScaffold
  (same namespace). Product-text ownership only.
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.EmitProgramScaffold

namespace SystemsLean.EmitProgram

/-! ### HOST-EMIT-PROGRAM scaffolding peeled to EmitProgramScaffold (same namespace)
    Greppable cites (defs live on EmitProgramScaffold): HOST-EMIT-PROGRAM,
    SELF-HOST-EMIT-PROGRAM, SLAKE_SELF_HOST_EMIT_PROGRAM_V0, programHeaderFragment,
    programBodyFragment, emitProgramReady, emitProgramOk, ownershipHonestyOk,
    headerHonestyOk, bodyHonestyOk, emitProgramSurfaceOk, EMIT-PROGRAM-SMOKE,
    HOST-EMIT-PROGRAM-SMOKE, EmitProgramScaffold, theorem emitProgramReady_true,
    NON-SSOT, src/systems/emit/host_emit_program.ssot.txt,
    src/systems/SystemsLean/EmitProgram.lean,
    slake_ir_program, slake_ir_program_init, slake_ir_program_push,
    slake_ir_program_is_well_typed, slake_ir_program_check_fail_closed,
    IR_PROGRAM_V0, SLAKE_IR_PROGRAM_CAP, RUNTIME-FS.
    Import SystemsLean.EmitProgramScaffold above. Product-text ownership only --
    not residual free / not complete. -/

end SystemsLean.EmitProgram
