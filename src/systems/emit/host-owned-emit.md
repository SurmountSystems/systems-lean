# Host-owned freestanding emit (ownership map)

**Kind:** product ownership SSoT (source of truth). **Discover after compaction:**
agents reseeding Systems work should open this file when asking "what freestanding
C does Lean own?" -- not only chat or residual token soup.

**Also update when ownership changes:** `src/systems/README.md` (lead table +
C emit product wire bullets), `RESIDUAL-systems.md` Done, `doc/SESSION-HANDOFF.md`
Decisions table, pure Nix presence/emit-wire specs, `SelfHostBody` if readiness folds.

Purpose: which freestanding product C text under `emit/` is owned by Lean host
SSOT + `FreestandingEmit` embed, vs still frozen in templates. Residual free
remains false. Not PROVABLY. Not freestanding product self-host complete.

## Lean-owned (host SSOT + FreestandingEmit embed)

| Surface | Stage / map id | Lean module | Durable SSOT | Placeholder |
|---------|----------------|-------------|--------------|-------------|
| Mult (enum + is_valid / is_known / name) | HOST-EMIT-MULT | `SystemsLean/EmitMult.lean` | `emit/host_emit_mult.ssot.txt` | `__HOST_EMIT_MULT_HEADER__` / `__HOST_EMIT_MULT_BODY__` |
| EMIT_BODY put_str dialect keys | HOST-EMIT-SSOT | `SystemsLean/EmitBody.lean` | `emit/host_emit_body_fragment.ssot.txt` | `__SSOT_*__` keys in body template |
| Linear + ConsumeToken freestanding APIs | HOST-EMIT-LINEAR | `SystemsLean/EmitLinear.lean` | `emit/host_emit_linear.ssot.txt` | `__HOST_EMIT_LINEAR_HEADER__` / `__HOST_EMIT_LINEAR_BODY__` |
| Erasure mult-0 absence (`slake_erased` + mark / is_marked / is_runtime_absent) | HOST-EMIT-ERASURE | `SystemsLean/EmitErasure.lean` | `emit/host_emit_erasure.ssot.txt` | `__HOST_EMIT_ERASURE_HEADER__` / `__HOST_EMIT_ERASURE_BODY__` |

Writer: `SystemsLean/FreestandingEmit.lean` (lake exe `slake-emit-freestanding-c`).
Templates: `emit/template_slake_freestanding.{h,c}.in`. Product wire:
`emit/slake_freestanding.{h,c}` (generated); release copy `out/freestanding-c/`.

Host stage ids only (`HOST-EMIT-*` / `SLAKE_SELF_HOST_EMIT_*_V0`). Do not mint
residual-only C stage ladders (`EMIT_MULT_V0`, `EMIT_LINEAR_V0`,
`EMIT_ERASURE_V0`, etc.) as freestanding residual progress.

Erasure on freestanding C is mult-0 absence honesty (`slake_erased` + mark /
is_marked / is_runtime_absent). It is not a type system in C.

## Template-owned still

| Surface | Notes |
|---------|-------|
| Types / typed IR (`slake_type_tag`, `TYPED_IR_V0` ir_node) | Frozen ABI in templates |
| Ordered IR program (`IR_PROGRAM_V0`) | Template-owned bulk |
| IR graph edges (`IR_GRAPH_EDGES_V0`) | Template-owned bulk |
| Host compose bulk (`HOST_COMPOSE_V0`) | Mutators + check orchestration still template |
| Emit plan / apply product APIs | `EMIT_PLAN_V0` / `EMIT_APPLY_V0` bodies |
| Emit body beyond HOST-EMIT-SSOT dialect keys | put_char / put_u8 / from_compose scaffolding |
| Extract + FAIL_CLOSED_CHECKER_V1 | Template-owned (Mult / Linear / Erasure host-owned) |
| Banner / version / unit_translation strings | Template-owned |

## Honesty

- Residual free: **false**. Freestanding product residual free: **false**.
- Not PROVABLY. Not full Slake self-host complete. No product GC.
- Host elaborator residual != product wire residual (do not forge either free).
- Behavioral probe remains hosted smoke, not freestanding product body growth.
- Ownership map lives here; stage tokens stay greppable in Lean / SSOT / product.
- **Dual SSOT (intentional PARTIAL, Mult + Linear + Erasure):** Lean fragments
  (`multHeaderFragment` / `linearHeaderFragment` / `erasureHeaderFragment` and
  body twins) and durable `host_emit_*.ssot.txt` blocks are both maintained.
  FreestandingEmit embeds product text from the **SSOT file only**. Lake smoke
  proves Lean piece honesty and presence gates prove SSOT tokens/blocks; there
  is **no** emit-time or pure-Nix equality that the SSOT file bytes equal the
  Lean fragment defs. Same split as Mult (HOST-EMIT-MULT). Drift risk accepted
  until a later shared equality gate lands; do not treat Erasure alone as the
  place to invent a stricter dual check.

## Paths (quick)

- `src/systems/SystemsLean/EmitMult.lean`
- `src/systems/SystemsLean/EmitBody.lean`
- `src/systems/SystemsLean/EmitLinear.lean`
- `src/systems/SystemsLean/EmitErasure.lean`
- `src/systems/SystemsLean/FreestandingEmit.lean`
- `src/systems/emit/host_emit_mult.ssot.txt`
- `src/systems/emit/host_emit_body_fragment.ssot.txt`
- `src/systems/emit/host_emit_linear.ssot.txt`
- `src/systems/emit/host_emit_erasure.ssot.txt`
- `src/systems/emit/template_slake_freestanding.h.in`
- `src/systems/emit/template_slake_freestanding.c.in`
