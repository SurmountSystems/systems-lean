# Report: Linear term-surface pilot (IMPL d13c73db)

Date: 2026-08-08. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).
Review fix pass closed all open issues in `/tmp/grok-1000/grok-review-d13c73db.md`.

## Goal

Same bar as Mult TERM-SURFACE for **Linear.lean**: reject named ill-typed Linear
twins that L0/L1 still accept; dual-ok **TERM-SURFACE Linear-only** only with
E-bad evidence. Mult Mult-only and MultTheorems PROOF-SURFACE MultTheorems-only
unchanged. FullHostElaborateRemains false. free dual-ok / free/complete/PROVABLY
unchanged.

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/linear-term-surface-gap-table-2026-08-08.md` (Kind: analysis + pilot evidence; LT1..LT4) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckLinearTerm.lean` (344 lines) |
| Wire | `refineLinearWithTermSurface` on `SystemsLean.Linear` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckLinearTermSurfaceDualOk` true; **gate** `hostModuleCheckLinearTermSurfaceOk` (E-bad fold); scope Linear-only; HostResidualShrink mirror |
| Harness | seed=206 harness=**31** (added HostModuleCheckLinearTerm) |
| Residual lockstep | RESIDUAL-systems Done + Open empty; RESIDUAL.md join; WATCHER DONE-FOR-NOW; SESSION-HANDOFF living tip; self-host host-finish tip |

## Linear L2 dialect rules

Documented subset (not full Lean 4 elaborator; not Mult inductive):

1. **shareNat**: claimed Nat return + body exactly `n + n`
2. **polyId**: body exactly `x`
3. **mult0ClassId**: body exactly `"MULT-0"`
4. **roundTrip** (optional): if header present (incl. `noncomputable def`), body
   `consume (mkToken n)`; **LT4** rejects wrong composition (e.g. `consume n`)
5. **Axioms** Token / mkToken / consume: L0 token presence only. Axiom *bodies*
   are never L2 typechecked (LINEAR-AXIOMS-REMAIN honesty; no typed-axiom twin).

Reject reason: `ILL-TYPED-TERM` (shared with Mult L2).

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| LT1 | shareNat : Bool := true | accept | ILL-TYPED-TERM |
| LT2 | polyId body true | accept | ILL-TYPED-TERM |
| LT3 | mult0ClassId := "MULT-1" | accept | ILL-TYPED-TERM |
| LT4 | roundTrip body `consume n` | accept (not L0-required) | ILL-TYPED-TERM |
| E-good | well-typed Linear term fixture | accept | accept |

### RED honesty (review Issue 6)

RED is the **design-time gap**: L0/L1 structural token check would accept the
ill-typed twin texts before Linear L2 dialect. There is **no** checked-in
pre-edit failing CI command log for this pilot. The living dual-pin encodes the
gap: `hostModuleCheckLinearTermSurfaceOk` requires dialect reject of LT1..LT4
while `hostModuleCheckBadLinear*L0Accept` stays true. Standalone theorems
`*_l0Accept` and `*_illTyped` prove both sides. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only claim pin | **true** |
| hostModuleCheckLinearTermSurfaceOk | Linear-only **gate** (E-bad) | **true** |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake): `termSurface=TERM-SURFACE scope=Mult-only dualOk=true` and
`linearTermSurface=TERM-SURFACE scope=Linear-only dualOk=true` and
`proofSurface=PROOF-SURFACE scope=MultTheorems-only dualOk=true`.

LoadOk + Driver fold **SurfaceOk**, not bare dualOk alone (review Issue 5).

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostModuleCheckLinearTerm SystemsLean.Linear SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems` | 0 |
| `lake build slake-host-module-check` | 0 |
| `just host-module-check-without-lake` | 0 (modules=206) |
| `just host-residual-shrink` | 0 |
| `just systems-host` | 0 (244 paths) |
| `just hygiene` | 0 |

## Sub-1-KLOC

All touched HostModuleCheck*.lean under 1000. LinearTerm 344; CheckersLater 994;
Accepts 733; Theorems 866; Driver 819.

## Review issues closed

| # | Fix |
|---|-----|
| 1 | SESSION-HANDOFF living tip harness=31; Linear done; Held no Linear promote |
| 2 | self-host host-finish tip Mult+Linear+MultTheorems dual-ok; Open empty |
| 3 | LT4 roundTrip E-bad twin + full wire |
| 4 | Named L0Accept theorems LT1..LT4 |
| 5 | SurfaceOk gate docs + LoadOk/Driver |
| 6 | RED honesty note (this section) |
| 7 | Axiom bodies never L2-checked header |

## Residual Open next

**Empty done-for-now.** Held: package L4; Types term-surface; LinearTheorems L3;
full elaborator/mathlib; Full LLVM production backend; true Rust-native link;
AffineDrop dual. Do not invent Open Names. Do not re-true FullHostElaborateRemains.
