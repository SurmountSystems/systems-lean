# Same-job peer wall-clock: Mult-first package write (2026-08-02)

Kind: analysis only. Not residual. Measurement only -- no claim flips.

Plan step 8: `.agents/plans/plan-peer-elaborator.md`.
Design cite: `doc/dev/research/peer-elaborator-design-2026-08-01.md`.
Proper full-package contrast (NOT peer): `doc/dev/research/lake-vs-slake-proper-bench-2026-08-01.md`.

## What this measures

**Same Mult unit package outcome** on both sides:

- On-disk write of `src/systems/emit/slake_mult_subset.{h,c}`
- Tokens `SLAKE_MULT_SUBSET_EMIT_V0` / `HOST-EMIT-MULT` / Mult package dual greps

**Peer paths (Job A vs Job B):**

| Job | Role | Command | Hot path |
|-----|------|---------|----------|
| **A** | Freestanding elaborator Mult package write **without Lake** | `just host-package-write-without-lake` | Prebuilt `.lake/build/bin/slake-host-package-write` only (HostFront G1 + HostGraph Mult set + MultSubsetEmit write). No `lake` on hot path. |
| **B** | Closest **Lake Mult package** recipe (same package files) | `just mult-subset-emit` | `lake build slake-mult-subset-emit` then `lake exe slake-mult-subset-emit` (bootstrap S2 Mult subset emit). |

**Choice note (Job B):** `mult-subset-emit` is the living Mult unit package write under Lake (same `emit/slake_mult_subset.*` outcome). `mult-subset-rebuild` is Mult subset self-application (S3), not the package-write peer. Job A also runs HostFront + HostGraph before write; Job B is pure MultSubsetEmit package write via Lake. Package files match; work composition is not identical.

**Not peer (Job C -- contrast only):**

| Label | Command | real (prior proper bench) | Honesty |
|-------|---------|---------------------------|---------|
| **NOT peer** | Cold full `lake clean` then `lake build` (full SystemsLean) | ~800-880 s | Full host package elaborator. **Must never** be sold as the Mult package peer comparator. |

## Protocol

| Rule | Detail |
|------|--------|
| Serial only | One just/lake at a time. No parallel Lake. |
| Timer | bash builtin `time`; `TIMEFORMAT` lines `real` / `user` / `sys` (seconds, three decimals). |
| Bootstrap (not timed) | Prebuilt `slake-host-package-write` already present; Job B first warm paid Lake link of `slake-mult-subset-emit` once. |
| Warm (untimed) | One green run each of Job A and Job B before measured series. |
| Measured | 3 serial runs Job A; 3 serial runs Job B; optional 2 runs Lake Mult-module probe. |
| Raw TSV | `/tmp/grok-1000/bench-same-job-mult-peer.tsv` |
| Console | `/tmp/grok-1000/bench-same-job-mult-peer.log` |

## Environment

| Item | Value |
|------|--------|
| Host | Linux horizon, x86_64, 16 logical CPUs |
| Date (UTC) | 2026-08-02 (measured ~00:50:41Z .. 00:50:45Z) |
| Lake | 5.0.0-src+f3b06c7 |
| Lean | 4.32.2 (`~/.elan`) |
| Repo tip | product free/complete true; product Lake pins false; host residual remains; plan-peer steps 1-7 done |

## Wall-clock table (peer)

All measured runs **exit 0**. Times in seconds.

### Job A -- Slake Mult package write without Lake

| Run | real | user | sys | exit |
|-----|------|------|-----|------|
| A1 | 0.025 | 0.013 | 0.012 | 0 |
| A2 | 0.027 | 0.011 | 0.015 | 0 |
| A3 | 0.025 | 0.014 | 0.012 | 0 |
| **median** | **0.025** | | | |

### Job B -- Lake Mult package (`just mult-subset-emit`, warm)

| Run | real | user | sys | exit |
|-----|------|------|-----|------|
| B1 | 0.929 | 0.508 | 0.225 | 0 |
| B2 | 0.906 | 0.495 | 0.217 | 0 |
| B3 | 0.876 | 0.468 | 0.214 | 0 |
| **median** | **0.906** | | | |

### Optional Job B2 -- Lake elaborates Mult-first modules only (already Built)

| Run | real | user | sys | exit | Command |
|-----|------|------|-----|------|---------|
| B2_1 | 0.416 | 0.221 | 0.096 | 0 | `cd src/systems && lake build SystemsLean.Mult SystemsLean.MultSubsetEmit` |
| B2_2 | 0.428 | 0.237 | 0.093 | 0 | same |

Hot Lake module probe only (14 jobs, already Built). **Does not** write Mult package files. Included for "Lake Mult-first module surface" context, not as package-write peer.

## Ratios (honest)

| Comparison | median real | Ratio |
|------------|-------------|-------|
| Job B / Job A (warm Mult package peer) | 0.906 / 0.025 | **~36x** (Lake Mult package recipe slower than prebuilt elaborator Mult write) |
| Job B2 / Job A (module probe vs package write) | 0.422 / 0.025 | ~17x (different work: Lake probe vs write) |
| Cold full Lake / Job A | ~830 / 0.025 | ~**33,000x** -- **NOT peer**; listed only to reject that misuse |

**Read Job B carefully:** warm `mult-subset-emit` still pays Lake recipe + `lake build` of the MultSubsetEmit exe target even when the package is already Built (~0.9 s). Job A is a single prebuilt ELF doing HostFront + HostGraph + package write (~25 ms). This is **same package outcome**, not "Slake elaborates the same Lean modules Lake elaborates."

## What this is

- Evidence for plan green bar **same-job bench** on Mult unit package write.
- Job A path is the step 7 elaborator Mult package write without Lake on the hot path.
- Job B path is the living Lake Mult package emit recipe.

## What this is not

- Not freestanding Slake elaborating full SystemsLean `.lean` like Lake.
- Not host residual free (host elaborator residual **remains**).
- Not a free/complete pin flip; not PROVABLY; not llvm.
- Not full-package cold Lake (~800 s) as the peer win.
- Not Linear..Compose expand (plan step 9).

## Join

`/tmp/grok-1000/grok-impl-summary-same-job-peer-wall-clock.md`
