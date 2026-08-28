# Wave 4a process mop (HAP HostCost + single walk)

**Status:** GREEN

**Tag:** [process-mop]

**Date:** 2026-08-12

**Trusted reports (not re-implemented):**

- `.agents/reports/impl-wave2-hap-hostcost-theorems-2026-08-12.md`
- `.agents/reports/impl-wave3-hap-single-fail-closed-walk-2026-08-12.md`

## Job

Mop compile / lint / test fallout after Wave 2 Lean theorems and Wave 3
emit single-walk. No new product work. Name 10 not opened. Claim bools
not flipped. Product C not hand-authored. `just bench-runtime` not re-run
(Wave 3 stamp `20260812T192951Z` stands).

## Commands and exits

From repo root unless noted.

| Command | First exit | Re-run | Notes |
|---------|-----------:|-------:|-------|
| `just hygiene` | 0 | 0 | Re-run after `systems-cc-probe` because that recipe ran `just build` in parallel with the first hygiene pass |
| `just systems-host` | 0 | -- | `systems-host-presence OK` (316 required paths) |
| `just systems-emit-wire` | 0 | -- | `systems-emit-wire OK` (36 required paths) |
| `just systems-cc-probe` | 0 | -- | Recipe invoked `just build` then behavioral probe; `systems-cc-probe GREEN` |
| `lake build SystemsLean.HostCost` (cwd `src/systems`) | 0 | -- | 9 jobs |
| `lake build SystemsLean.HostCostTheorems` (cwd `src/systems`) | 0 | -- | 16 jobs |

`just build` was **not** invoked as a standalone mop command. It ran only
as the required `just systems-cc-probe` recipe. Wire not treated as stale
beyond that recipe.

Not run (out of mop scope): `just bench-runtime`.

## What was fixed

**No fallout.** First pass of all required commands exited 0. Post-write
hygiene (after probe regenerate) also exited 0. No trailing whitespace,
ASCII, tone-token, presence-token, or Lake compile edits.

Files mopped: none.

Residual / `WATCHER.md` / `doc/SESSION-HANDOFF.md` not rewritten (hygiene
already green; living status left alone). Open queue not emptied or
reopened. Name 10 not opened.

## Pins untouched (not flipped)

- free / complete / PROVABLY: **true** (not touched)
- FullHostElaborateRemains: **false** (not touched)
- DominanceClaimed / band FullBackend: **false** (not touched)
- HostCost Nat defs and Wave 2 theorems: not edited
- Compose vs heap: not forged (Wave 3 still ~1.6x slower vs heap)

## Honesty

- Name 10 Init unroll stays **not open**.
- Process mop is not a product Open Name.
- Probe regenerate rewrote `src/systems/emit/slake_freestanding.{c,h}` and
  `out/freestanding-c/` via the official dual-eq writer (not hand C).
  Hygiene after that rewrite is still 0.

## Verdict

**GREEN**
