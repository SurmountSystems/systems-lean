# Plan: TECH.md dependency tree, tracking tables, L2 tokens

## Read this first

Nothing here needs a host change from you. If you Approve without notes, these defaults apply:

1. **Home is repo-root `TECH.md`.** One living map. ASCII only. Under 1000 lines. README and `doc/SESSION-HANDOFF.md` each get one pointer. Residual ledgers stay the Open/Done authority. `TECH.md` does not become a second residual novel.
2. **L2 token table is a rolling ledger in `TECH.md`**, not every nested session this chat ever spawned. Full dumps stay local under `~/.agents/reports/` (not git). Each row records **measured** Grok OSS numbers plus an **estimate** even when measured exists.
3. **Backfill this mill wave only** (about mills 53 through 61, plus `[lake-coord]`, reviews, flushes, and these two plan explores). Older occupancy Lakes are not reconstructed. Living process starts the same turn as the file lands.
4. **Mill on surmount-1 keeps going in parallel.** This plan does not pause `just N-host-tool`. Extra_mods waves and trait-object vtable IR stay on the earlier idle-builder plan until you Approve that one.

If you want `doc/TECH.md` instead of the repo root, or a full historical dump in git, say so in Comment before Approve.

## Agent notes

**Done looks like:** `TECH.md` exists, ASCII, sub-1-KLOC, with (a) an ASCII dependency tree of the compiler and host work, (b) one high-level table per tracking aspect, (c) an L2 token table that uses Grok OSS measured fields plus estimates, (d) a short how-to so later L1 turns can append a row without a novel, (e) residual/handoff/WATCHER pointers, (f) `just hygiene` green.

**Size:** one docs writer L2, one reviewer L2 after the file exists. About one agent slice, not a mill.

**Intended depth:** L1 coordinates. L2 writer spawns L3 for greps, file writes, hygiene. L2 mill implementer stays fire-and-return on surmount-1. `[lake-coord]` is not this writer. One reviewer unless you ask for more.

Short reports: `~/.agents/reports/impl-tech-md.md`, `~/.agents/reports/review-tech-md.md`.

Idle plan actions after present: Approve, Comment, Revise, Exit. Clarify is not idle.

### Launch groups

Approve starts immediately:

- **Group A (docs):** write `TECH.md` + one-line pointers + lockstep residual/handoff. L2 writer, L3 edits.
- **Group B (mill):** fire mill 62 (`LlvmGraphSsa`) on surmount-1 if the recipe exists, else add the recipe then mill. Fire-and-return. Parent does not wait.
- **Group C (review):** after Group A lands, one reviewer on `TECH.md` only.

Gated elsewhere (not this plan): extra_mods topological waves, trait-object vtable IR.

## Context

You asked for three things in one living file:

1. Persist a **dependency tree**.
2. A **high-level table for each aspect** of tracking the work.
3. **How many tokens each L2 takes**, using Grok OSS helpers plus estimates (cost, model efficiency, timelines).

`TECH.md` does not exist today. Residual, inventory, and handoff already hold living counts. Those stay sources of truth. `TECH.md` joins them so compaction and a tired reader see the graph without opening six ledgers.

### What Grok OSS already measures (do not invent a mill)

| Surface | What it is | Per L2? |
|---------|------------|---------|
| `get_command_or_subagent_output` snapshot | Live `Progress: turn N, T tool calls, XK/200K tokens (P% context)` | Yes. This parent already saw the two plan explores at **57K/200K (28%)** on turn 1 with 0 tools. |
| Nested session `signals.json` | `contextTokensUsed`, `contextWindowTokens`, `contextWindowUsage`, `toolCallCount`, `compactionCount`, `totalTokensBeforeCompaction`, `primaryModelId`, `sessionDurationSeconds` | Yes. Example nested L2 `019ff32c-...` (S6 TERM, grok-4.5): **174292 / 200000 (87%)**, 117 tools, 498 s, 0 compactions. |
| Parent `subagents/<id>/meta.json` | `duration_ms`, `tool_calls`, `turns`, `effective_model_id`, `description`, `status` | Timing and tools, **not billed tokens**. |
| Session `usage.jsonl` | Per request: `input_tokens`, `output_tokens`, `cached_tokens`, `reasoning_tokens`, `total_tokens`, `model_id`, `agent_kind`, `session_id`, `cost_usd_ticks` | Billed ticks. Nested L2s have their own session id. Parent `agent_kind` is `main`. |
| `$GROK_HOME/grok_oss.db` | Token Economy book from `usage.jsonl` when `local_spend_ledger` is true | Account book, not a per-row TECH table. |
| OTEL `grok_code.subagent` | `phase` launched/completed, `subagent_type`, `outcome`, `duration_ms` | **No token fields.** |
| Parent `signals.json` | This L1: **476735 / 500000 (95%)**, 362 compactions, `totalTokensBeforeCompaction` about 84 million | L1 only. Do not call that an L2 cost. |

`contextTokensUsed` is **window occupancy**, not the sum of billed input+output. Estimates stay valuable because occupancy is a peak, billed sum is a different meter, and a mill L2 that blocks on lean burns wall time that occupancy does not show.

### Living product counts this file must not contradict

| Aspect | Now | Authority |
|--------|-----|-----------|
| Host tools without Lake on the step | **61 of 69** | `src/systems/host-tools-inventory.md` |
| Named closed subset | **49 of about 206** | residual / AGENTS |
| Occupancy names / compile-order rows | **49 / 164** | AGENTS occupancy living files |
| Isolation prove | `SystemsLean.OccupancyProbe` | AGENTS |
| FullHost / Lake-gone | false / not claimed | residual |
| LLVM IR | the Rust-compatible surface; rustc_abi is the check | `doc/rust-entry.md` |

## Approach

One new file, three sections, then keep it honest after each L2.

**Section 1: dependency tree (ASCII).** Pipeline, not residual slang:

```
Systems Lean (language)
+-- Idris 2 side (src/idris2)
+-- Lean 4 side (src/lean4)
+-- Slake host (src/systems)
    +-- units: Mult -> Linear -> Types -> Program -> Graph -> Compose
    +-- occupancy prove (49 names, OccupancyProbe, not member 50)
    +-- host tools mill (lean then leanc on surmount-1, never lake on that step)
    +-- Lake bootstrap ([lake-coord] only, OccupancyProbe or later real lake)
    +-- emit -> out/freestanding-c (product wire)
    +-- llvm IR (out/llvm-ir, Rust-compatible surface, vtable residual held)
```

Edges that matter: mill does not wait on OccupancyProbe; OccupancyProbe stays one Lean thread; extra_mods are still serial until the idle-builder plan is Approved; product wire does not need Lake on `just build`.

**Section 2: one table per tracking aspect.** Columns stay the same shape so a reader can scan:

| Aspect | Now | Goal | Blocked by | Next checkable slice | Authority |
|--------|-----|------|------------|----------------------|-----------|

Aspects (one table each, short):

1. Host tools mill
2. Occupancy / named subset
3. Lake vs Slake (host develop)
4. Product wire / freestanding C
5. LLVM IR / vtable / rustc_abi
6. Dual Idris and Lean map
7. Linear use-check
8. extra_mods waves on surmount-1
9. Agent parallelism (standing `[lake-coord]`, mill fire-and-return, L1 does not wait)
10. L2 tokens (the critical table)

Do **not** paste Open Names, WATCHER `/implement` bodies, or occupancy extras archaeology.

**Section 3: L2 token table.** Rolling, newest first, cap about 20 rows in git. Role totals above the rows.

| When | Role | Model | Measured window | Billed (if known) | Estimate | Duration | Tools | Why the estimate |
|------|------|-------|-----------------|-------------------|----------|----------|-------|------------------|

Measured window: `contextTokensUsed` / `contextWindowTokens` from that L2's `signals.json`, or the live snapshot line while running.

Billed: sum `usage.jsonl` for that nested `session_id` (`input_tokens`, `output_tokens`, `cached_tokens`, `reasoning_tokens`). Label missing as `not_fetched`, never invent.

Estimate (always fill):

| Role | Default estimate (window) | Why |
|------|---------------------------|-----|
| Mill fire-and-return | 40k to 80k on 200k | Spawn, rsync, start `just N-host-tool`, write report. Must not sit on lean. |
| Mill that blocks on lean | 80k to 160k plus wall clock of the compile | Process fail. Tokens buy wait, not product. |
| Review of one mill | 30k to 70k | Residual six-file grep, not a second mill. |
| Memory flush | 15k to 40k | Short. |
| `[lake-coord]` OccupancyProbe cache-hit | 40k to 90k | Funnel resume; 1 s lake is not a 174k prove. |
| OccupancyProbe full rebuild | 80k to 180k L2 plus ~1471 s lake | Do not theater-loop. |
| Explore one area | 40k to 100k | Fresh 200k window. This plan's explores started at 57k. |
| Docs writer (`TECH.md`) | 50k to 120k | Multi-file reads, one new file. |
| L1 parent this session | already 477k / 500k | Do not dump mill work here. |

After each finished L2, L1 (or the mill writer in the same lockstep) appends one row from `signals.json` + snapshot + estimate. Do not wait on mill to write the row.

**Not X:**

- Not a Python or shell token mill.
- Not OTEL as the SSoT (no per-L2 tokens there).
- Not copying 3600+ `subagents/*/meta.json` files into git.
- Not claiming billed USD in `TECH.md` (`cost_usd_ticks` stays in the local book).

## Critical files

| Path | Why |
|------|-----|
| `TECH.md` (new, repo root) | Dependency tree, aspect tables, L2 token ledger |
| `README.md` | One living-tip line pointing at `TECH.md` |
| `doc/SESSION-HANDOFF.md` | Reseed pointer |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | Open/Done stay authority; TECH links, does not fork |
| `WATCHER.md` | Next mill `/implement` must survive; add TECH pointer without wiping mill body |
| `src/systems/host-tools-inventory.md` | Mill 61 of 69 |
| `AGENTS.md` | One sentence: after an L2 exits, record tokens in `TECH.md` |
| Nested `~/.grok/sessions/.../<l2-id>/signals.json` | Measured window |
| Parent `subagents/<id>/meta.json` | Duration, tools, model |
| Parent `usage.jsonl` | Billed ticks by `session_id` |

## Reuse

| Symbol / module | Path | How |
|-----------------|------|-----|
| Host tools count | `src/systems/host-tools-inventory.md` | Cite, do not duplicate the 69-row list |
| Occupancy living files | `OccupancyWalk` / `OccupancyProbe` / `OccupancyTheorems` | Cite 49 / 164 |
| IR is the Rust-compatible surface | `doc/rust-entry.md` | One tree node, not a rewrite |
| Idle-builder plan | `.agents/plans/plan-idle-builder-vtable-ir-2026-09-09.md` | extra_mods + vtable stay gated there |
| Snapshot Progress line | `get_command_or_subagent_output` | Live L2 window |
| Child `signals.json` | nested session dir | Measured peak window |

## Steps

1. **Write `TECH.md`:** ASCII tree, ten aspect tables, L2 token how-to, rolling table seeded with this session's measured examples (L1 477k/500k as parent contrast; nested S6 174k/200k; live explores 57k/200k; mill 61 as estimate until that child's `signals.json` is read). Size 1.
2. **Seed mill-wave L2 rows:** read `meta.json` + nested `signals.json` for mill/review/flush/`[lake-coord]` ids still on disk for mills 53 through 61. Measured where present, estimate where missing. Size 2. Depends on 1.
3. **Pointers:** one line each in `README.md`, `doc/SESSION-HANDOFF.md`, `AGENTS.md` (record L2 tokens in TECH after exit), residual join. Do not wipe WATCHER mill fence. Size 1. Depends on 1.
4. **Hygiene:** `just hygiene` and `just professional-tone`. Size 1. Depends on 1-3.
5. **Review:** one reviewer, `TECH.md` + pointers only. Size 1. Depends on 4.
6. **Parallel mill (not blocked on TECH):** mill 62 `LlvmGraphSsa` on surmount-1, fire-and-return, then append that L2's token row when the notification lands. Size 2. Independent of 1.

## Risks

- **Second residual novel:** keep tables short; link residual; delete essays on sight.
- **Window vs billed confusion:** label columns Measured window vs Billed vs Estimate.
- **L1 95% window:** writer must be an L2. Parent only coordinates.
- **WATCHER mill wipe:** lockstep mill body first, TECH pointer second.
- **Missing nested usage.jsonl:** write `not_fetched` and still fill Estimate.
- **Sub-1-KLOC:** if the mill-wave backfill blows 1000 lines, keep 20 rows in `TECH.md` and put the rest in `~/.agents/reports/l2-tokens-mill-wave.md`.

## Verification

Pure docs. No red/green product test.

- `test -f TECH.md`
- `just hygiene` exit 0 (ASCII, no trailing whitespace, professional tone)
- Line count under 1000
- Tables name 61 of 69, 49 of about 206, occupancy 49 / 164, FullHost false
- L2 table has at least one **measured** row (from `signals.json` or a snapshot) and every row has an **estimate**
- WATCHER mill `/implement` fence still present
- README living tip still does not claim Lake-gone

## Open questions

- None blocking. Defaults are in Read this first.
- Optional later (not this plan): grok-oss product change so `meta.json` copies `contextTokensUsed` and billed sums, so agents do not open `signals.json` by hand.
