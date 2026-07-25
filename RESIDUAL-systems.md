# Residual -- Systems / Slake (`src/systems/`)

Owned by the Systems / Slake implement fork (`doc/fork-systems.md`).
Coordinator reads this file; does not drive the freestanding treadmill by default.

**Status vocabulary:** `open` | `in progress` | `done` | `blocked` | `deferred` | `wontfix`

**Honesty:** green gates are not residual free. Product freestanding residual
and host elaborator residual both remain. Do not claim residual free, product
self-host complete, proof complete, or llvm unlock without evidence bars in
`doc/goals.md`.

**Language:** Systems / Slake, Idris side, Lean side, coordinator. Do not say
"pole." Living residual uses **plain Names** (schema below), not phase / track /
wave / SH* / P* item titles.

**Focus:** bootstrap freestanding **Slake** -- Lean host under `src/systems/`
that owns freestanding synthesis toward `out/freestanding-c`.

**Autonomy:** when Open has a Name with checkable Done when, agents chain short
implement loops via `WATCHER.md` without waiting. When Done when is not
checkable, set BLOCKED with one need. Do not invent work.

**Evidence map (greppable gate tokens):** stay in product Lean and pure Nix
presence. Optional inventory companions under `src/systems/` (e.g.
`host-partial-inventory.md`, module headers). Do not re-paste token soup into
this living residual.

Plan: `.agents/plans/plan-unambiguous-residual-work.md`

---

## Work item schema (living residual)

Every **open** or **in progress** item:

| Field | Rule |
|-------|------|
| **Name** | 2-6 words; what you are building. Not a stage id. |
| **Goal** | One sentence. |
| **Done when** | Checkable outcomes (paths, gates, behaviors). Theorems only when they prove a **new** property. |
| **Out of scope** | Explicit non-claims for the slice. |
| **Primary paths** | 1-5 paths. |
| **Status** | open / in progress / done / blocked / deferred / wontfix |

**Banned as residual item names or living status voice:** wave, phase, track,
lane, stream, epoch; SH0..SH6 or P0..P7 as titles; stacking greppable tokens as
the work description; "human-directed product residual" without a Name.

---

## Open (living queue -- drives implement)

| Name | Goal (one line) | Status |
|------|-----------------|--------|
| *(empty)* | No open Systems residual Names. Deferred tracks stay deferred. | **done-for-now** |

Open queue empty after **Thin process glue** and **Host owns freestanding erasure C**. Do not invent Open Names. Residual
free still false; freestanding product self-host complete still false; proof
complete false; PROVABLY false; llvm / CompCert still deferred.

---

## Deferred (held with reason)

| Name | Why held | Unlocks when |
|------|----------|--------------|
| LLVM IR emit | Not before freestanding self-host is real | True freestanding self-host acceptance met |
| CompCert product seal | Needs real resolved CompCert + matrix | Real `ccomp` available and product matrix defined |
| Host readiness canaries only | Exhausted as residual under current surface | New product surface needs a new property proof |
| Definitional alias theorem growth | Not product progress | Never as residual (wontfix as residual) |

---

## Done (archive -- capabilities, not token dumps)

Short capability list. Greppable stage ids live in Lean / Nix / companions.

| Capability | Paths (primary) |
|------------|-----------------|
| Systems layout + README product bar | `src/systems/README.md`, stubs |
| Pure Nix host presence + emit-wire gates | `nix/systems-host-presence/`, `nix/systems-emit-wire/` |
| Structure compile path (not product C) | `script/slake-compile-path.sh` |
| Lean freestanding emit writer + `out/freestanding-c` | `SystemsLean/FreestandingEmit.lean`, `emit/`, `out/freestanding-c/` |
| Unit surface + deepen + fail-closed product APIs | emit product + unit maps |
| Ordered IR program, graph edges, host compose (product + host) | emit C + `IrProgram` / `IrGraph` / `HostCompose` |
| Emit plan / apply / body product wire (frozen bulk) | emit product; host `EmitPlan` / `EmitApply` / `EmitBody` |
| Host Mult + body single sources of truth embedded in emit | `EmitMult`, `EmitBody`, `host_emit_*.ssot.txt` |
| Host Linear + ConsumeToken product text host-owned emit | `EmitLinear`, `host_emit_linear.ssot.txt`, `host-owned-emit.md` |
| Host owns freestanding erasure C | `EmitErasure.lean` + `emit/host_emit_erasure.ssot.txt` + FreestandingEmit load/embed; templates `__HOST_EMIT_ERASURE_{HEADER,BODY}__`; `SelfHostBody` folds `emitErasureReady`; map `emit/host-owned-emit.md`; mult-0 **absence honesty** on freestanding C (not types-in-C); no `EMIT_ERASURE_V0` residual C stage; free/complete stay false |
| Product wire matches host compose (PARTIAL inventory honesty) | `host-partial-inventory.md` scannable carry; closed gap **HOST-EMIT-LINEAR** Linear + **HOST-EMIT-ERASURE** Erasure product C text ownership (not template-only); HostCompose mint/consume / plan/apply/body stay consistent without full C parity claim |
| Host Mult..SpecProof modules + honesty canaries | `SystemsLean/*.lean` Mult through SpecProof / LlvmHold |
| Algebraic / fail-closed / path / content theorems (partial) | same host modules; not proof complete |
| Dual maps + join algorithms (sides) | `src/idris2/`, `src/lean4/` (read for systems) |
| Shared IR sketch | `doc/shared-ir-sketch.md` |
| Self-host body (defined freestanding compile step) | plain-English acceptance in `self-host.md` (SELF-HOST-BODY); host pin `SystemsLean/SelfHostBody.lean` (selfHostBodyReady = emitMultReady && emitLinearReady && emitErasureReady + freestanding emit stage cite; freestandingProductSelfHostComplete false; residual free false); E2E under `just systems-host` / `systems-emit-wire` / `out-freestanding-c` / check.sh |
| Dual algorithms into Slake (stated map + host use) | `join-map.md` stated map; `SystemsLean/JoinMap.lean` joinAlgUseOk (ConsumeToken = HostCompose mint/consume via consumeTokenHostUseOk / hostMintConsumeOnceOk -- not Linear Token axioms; ErasedIndex = erasedIndexHostUseOk; UnrestrictedShare = unrestrictedShareHostUseOk Mult multOmega + shareNat) + joinDualCiteOk inventory; dual trees read-only; residual free false; product self-host complete false |
| Thin process glue | Shell ownership note in `src/systems/README.md` (role table + line counts); `script/slake-compile-path.sh` stamp only (~50 lines, no static greps); unit walk / honesty stay pure Nix (`systems-emit-wire` / `systems-host`); dual `check.sh` optional elaborators only; residual free false; product self-host complete false |

## Decisions (durable -- reseed, do not re-derive from chat)

| Decision | Implication |
|----------|-------------|
| Open queue empty | Do not invent Open Names; human names next residual |
| Host-owned freestanding C grows by Mult/Linear/Erasure-style slices | Lean module + `host_emit_*.ssot.txt` + FreestandingEmit embed + pure Nix presence; ownership map SSoT `emit/host-owned-emit.md` |
| Erasure on freestanding C | Mult-0 absence marker APIs only -- **not** a type system in C |
| Template bulk remains | Types / IR program / graph / compose mutators / emit plan-apply bulk / Extract / fail-closed checker still template-owned until a named residual owns them |
| Dual SSOT PARTIAL | Lean fragment defs and SSOT file blocks both maintained; FreestandingEmit embeds **file only**; no byte-equality gate yet |
| Still false | residual free; freestanding product self-host complete; proof complete; PROVABLY; llvm / CompCert product seal |

Still **not residual free**. Still **not** freestanding product self-host complete.
Still **not** proof complete. Still **not** PROVABLY. llvm still deferred.

---

## Next residual implement prompt (Systems / Slake)

```
DONE-FOR-NOW (Open queue empty)

Host owns freestanding erasure C complete:
- EmitErasure.lean + host_emit_erasure.ssot.txt + FreestandingEmit embed
- Templates use __HOST_EMIT_ERASURE_{HEADER,BODY}__
- SelfHostBody folds emitErasureReady
- Ownership map host-owned-emit.md; pure Nix presence/emit-wire

Still false / deferred (do not forge):
- residual free
- freestanding product self-host complete
- proof complete
- PROVABLY
- llvm IR emit / CompCert product seal

Do not invent Open Names. Human names next residual when ready.
```
