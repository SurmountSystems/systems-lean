# Explore: leftover after HAP for proven-safe + optimal freestanding C

**Kind:** analysis only. Not residual. Not implement. ASCII. **Date:** 2026-08-12.
**Target:** first product Out `out/freestanding-c/`. Sources: living runtime stamp
**20260812T192951Z** (`-O3 -flto`); Wave 2/3 + HAP closeout; Name 10; emit ownership
tip; `doc/goals.md` Primary product focus (runtimeless C, safety from types, no GC).

## Verdict

HAP Names 1-9 are **done**. Living Open is **empty done-for-now**. **Name 10 Init
unroll stays closed.** Mint matches heap and beats GC/Lean. Compose still loses
to malloc because the **cold product arm is mixed work**, not a leftover zero-loop.
Proven-safe C is sealed on the wire. Optimal C is Lean SSOT + measure, or skip.
No new C or shell.

## 1. Living runtime (median ns/op)

| Class | Free | Baseline | Phrase |
|-------|-----:|----------|--------|
| Mint vs Boehm | 0.6645 | 18.7710 | ~28.2x faster |
| Mint vs Lean managed | 0.6645 | 7.4700 | ~11.2x faster (not same C IR) |
| Mint vs heap_churn | 0.6645 | 0.6748 | ~1.0x faster |
| Mint vs stack live-flag twin | 0.6645 | 0.6336 | ~1.0x slower (not product wire) |
| Compose vs heap_churn | 17.5277 | 10.6737 | **~1.6x slower** (did not beat heap) |
| Compose vs fail_closed_shape | 17.5277 | 18.2351 | ~1.0x faster (not product wire) |

Name 9 improved compose (prior ~2.5x vs heap / ~1.5x vs fail_closed_shape).

## 2. What is still slower, and why

**Mint vs heap:** not slower. **Mint vs protocol twin:** ~5% in noise; skip.
**Compose vs heap (~1.6x)** is the leftover. Stage pass (attribution, not the 17.5
ns whole-op): init ~22, push_nodes ~25, edges ~24, mint ~23, mark ~23, well_typed
~25, extract ~26, consume ~24, post_check ~24; `check_fail_closed` reads 0.0000
(E2 fuse; extract still runs). Cold arm still **full re-init each op** plus bench
`is_well_typed` plus Mult pre-scan plus per-node check plus extract plus post_check.
**Not init-only.** Heap_churn is allocator only, not fail-closed protocol. M1 subset
packages still nest well-typed walks; those are **not** product Out.

## 3. Safety sealed vs still open

**Sealed:** product residual free + self-host complete; **PROVABLY true** (CompCert
wire, not speed); linear/affine 0/1/omega; **no product GC** / no Lean RT on the
freestanding link; Banner..Apply Lean-owned SSOT (templates SPDX + placeholders);
public extract/check meaning unchanged after Name 9; HostCompose rejects spent MULT-1.

**Open:** thin Extract `extractOk_mult1_fs_true` still passes MULT-1 with no live
token (Name 8 named the gap; did not close it). Frozen C check and HostCompose
require a live MULT-1 token. **HostCost is Nat, not wall-clock**; Name 9 did not
change it (`costCheckFailClosed = well-typed + pre-scan`). Dominance / band
FullBackend / FullHost stay **false**.

## 4. Next Names (C target) or honest skip

**Name 10 Init unroll: stay closed.** It was only for a cap-8/16 zero-loop win if
leftover was still init. Evidence says mixed. Honest skip.

**Default:** do **not** invent a new Open queue. HAP value is measured, not a
claim-bool flip.

If the operator reopens **C-target leftover only** (Lean + SSOT + `just
bench-runtime`; **no** hand C / **no** shell):

| Name | Goal | Done when |
|------|------|-----------|
| Thin extract MULT-1 close | Thin Extract matches compose/C live-token reject | Retire `extractOk_mult1_fs_true`; HostCost gap theorem updates; lake green; **no C** |
| Compose leftover isolate | Split 1.6x into bench `is_well_typed` vs extract vs cold init | Stage timers + rebench vs heap and fail_closed_shape; SSOT only if a **product** walk is still redundant; do not skip extract |
| HostCost single-walk Nat | Nat check cost matches Name 9 C (one live walk) | Honesty or theorem note; lake green; still not ns |
| Reset-path measure (optional) | Show whether 1.6x is E3 cold-init tax | `BENCH_RUNTIME_COMPOSE_RESET=1` vs default cold; do not change default cold honesty |

Skip: mint protocol 5%; subset-package nest (not Out); more C/shell; PROVABLY
speed rename; forging compose <= heap without a measured product walk.

## Ownership tip

Lean owns Banner + Mult..Apply/Body via `host_emit_*.ssot.txt` + Emit* embed.
Template-owned product text: **none**. Regenerate with `just build`.
