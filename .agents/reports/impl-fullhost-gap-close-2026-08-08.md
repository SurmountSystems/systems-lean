# Implement report: FullHost / elaborator depth gap close (2026-08-08)

IMPL id (bookkeeping only; not product code): **gapc2026**.
ASCII only. Plain American English.

Plan: `.agents/plans/plan-fullhost-gap-close-2026-08-08.md`
Inventory: `doc/dev/research/check-depth-gap-inventory-2026-08-08.md`

---

## What landed

### Slice 1 -- Check depth gap inventory (done)

- Research note: `doc/dev/research/check-depth-gap-inventory-2026-08-08.md`
  (Kind: analysis only).
- Sample table: Mult, Linear, Types, Extract (kind-surface band) + KernelMult,
  KernelEmit, ParityMult, SpecProof (structural-only / non-kind-surface).
- Evidence: `just host-module-check-without-lake` exit 0 modules=206; cold
  `lake build` of each sample module exit 0.
- Rank for Slice 2: **Kernel Mult..KernelEmit** first; Emit Plan/Apply/Body
  second; Parity third.
- Residual / handoff / WATCHER / surface-matrix "inventory present" tip.
- **No pin flips.**

### Slice 2 -- Kind-surface band expand (done)

**Band expanded:** Kernel Mult..KernelEmit
(KernelMult, KernelLinear, KernelTypes, KernelProgram, KernelEmit + *Theorems).

| Change | Detail |
|--------|--------|
| Dual-pin band string | Mult..Extract **+** Kernel Mult..KernelEmit (+ *Theorems) in `checkDepthDeepenBand` + `measuredHostCheckDepthDeepenBand` |
| Required decls | Kernel readiness/path surface expanded (10/10/10/10 defs; Emit 12 defs). No local Kernel structure/axiom on disk; deepen is honest readiness + path greps under FOUNDATION-KIND-SURFACE bar |
| Theorem corpus | Kernel Mult/Linear/Types/Program/Emit = 11/12/12/12/12 (was 8/8/8/8 and Emit 6) |
| Bad reject | `hostModuleCheckBadMissingKernelReady` / Text: KernelMult missing `lowerMultKernel` |
| Dual-pin lists | Fixtures, LoadOk lengths, HostResidualShrink corpus string, Theorems rfl, just host residual-shrink grep |
| Seeds / Driver | Band string; driver fail-closed smoke for Kernel bad |

### Slice 3 -- Kind-surface second band (done)

**Band expanded:** Emit Plan/Apply/Body
(EmitPlan, EmitApply, EmitBody with local structure Plan/Apply/Body).

| Change | Detail |
|--------|--------|
| Dual-pin band string | Mult..Extract + Kernel Mult..KernelEmit **+** EmitPlan+EmitApply+EmitBody in `checkDepthDeepenBand` + `measuredHostCheckDepthDeepenBand` |
| Required decls | EmitPlan 9 (structure:Plan + Plan.failClosed + plan/count surface); EmitApply 10 (structure:Apply + Apply.failClosed + apply/pack/tag); EmitBody 8 (structure:Body + Body.failClosed + body/fragment) |
| Good fixtures | Expanded structure surface; moved Emit good texts to FixtureTextsProduct (Later Sub-1-KLOC room) |
| Bad reject | `hostModuleCheckBadMissingPlanStructure` / Text: EmitPlan missing `structure Plan` |
| Dual-pin lists | LoadOk lengths 9/10/8; HostResidualShrink band; Theorems deepen_band_eq + Plan missing theorem; just host-without-lake Plan token |
| Scaffolds | Not re-deepened (path key decls already seed-covered; no local Plan/Apply/Body structure on scaffolds) |

### Slice 4 -- Kind-surface third band (done)

**Band expanded:** Parity Mult..Emit
(ParityMult, ParityLinear, ParityTypes, ParityProgram, ParityEmit + *Theorems).

| Change | Detail |
|--------|--------|
| Dual-pin band string | Mult..Extract + Kernel Mult..KernelEmit + EmitPlan+EmitApply+EmitBody **+** ParityMult+ParityLinear+ParityTypes+ParityProgram+ParityEmit+Parity*Theorems in `checkDepthDeepenBand` + `measuredHostCheckDepthDeepenBand` |
| Required decls | Parity readiness/path surface expanded from 8/5 to **12 defs / 10-8 theorems** from on-disk Parity*.lean (multParityReady, gradeParityOk, contractParityOk, productProbePath, productApiSurfaceOk, joint bar names, ...). **No local structure/axiom on Parity modules** -- deepen is honest readiness + path greps under FOUNDATION-KIND-SURFACE |
| Theorem corpus | Parity Mult/Linear/Types/Program/Emit required theorems = **10/8/8/8/8** (was 5/5/5/5/5) |
| Bad reject | `hostModuleCheckBadMissingParityReady` / Text: ParityMult missing `multParityReady` |
| Dual-pin lists | Fixtures, LoadOk lengths 12/10/12/8/..., HostResidualShrink band string, Theorems deepen_band_eq + Parity missing theorem, just host-without-lake Parity token |
| Good fixtures | Expanded readiness surface in FixtureTextsLater (Later 996; under 1000) |

---

## Commands + exit codes

| Command | Exit |
|---------|-----:|
| `just host-module-check-without-lake` (baseline + after Slice 2+3+4) | 0 |
| `lake build SystemsLean.Mult Linear Types Extract KernelMult KernelEmit ParityMult SpecProof` (inventory sample) | 0 each |
| `lake build SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems slake-host-module-check` (Slice 2+3+4) | 0 |
| `just host-residual-shrink` | 0 |
| `just systems-host` | 0 |
| `just hygiene` | 0 |

Without-Lake GREEN banner includes:
`band=...+EmitPlan+EmitApply+EmitBody+ParityMult+...+ParityEmitTheorems` and
`modules=206`, `depth=PARTIAL-STRUCTURAL`, `bar=FOUNDATION-KIND-SURFACE`.

---

## Pin honesty table

| Pin / claim | Before | After |
|-------------|--------|-------|
| FullHostElaborateRemains | false | **false** (unchanged) |
| Host residual free claimed F1 / remains | free true / remains false | **unchanged** |
| Product free / complete / PROVABLY | true | **true** |
| Product StillUsesLake / DependsOnLake | false | **false** |
| proofCompleteClaimed | true | **true** |
| HostModuleCheck depth | PARTIAL-STRUCTURAL | **PARTIAL-STRUCTURAL** |
| FOUNDATION-KIND-SURFACE band | Mult..Extract + Kernel + Emit Plan/Apply/Body | Mult..Extract + Kernel + Emit Plan/Apply/Body + **Parity Mult..Emit** |
| Full classic elaborator parity | open | **open** (partial kind-surface only) |
| modules seed | 206 | **206** |

---

## Line counts (touched large files after Slice 4)

| File | Lines |
|------|------:|
| HostModuleCheckFixtureTextsLater.lean | 996 |
| HostModuleCheckCheckersLater.lean | 988 |
| HostModuleCheckFixtureTextsProduct.lean | 986 |
| HostModuleCheckFixtureTexts.lean | 975 |
| HostModuleCheckLoadOk.lean | 866 |
| HostResidualShrink.lean | 835 |
| HostModuleCheckRequiredDeclsLater.lean | 817 |
| HostModuleCheckDriver.lean | 767 |
| HostModuleCheckSeeds.lean | 717 |
| HostModuleCheckFixtures.lean | 675 |
| HostModuleCheckRequiredDecls.lean | 667 |
| HostModuleCheckAccepts.lean | 656 |
| HostModuleCheckTheorems.lean | 632 |

All HostModuleCheck*.lean under **1000** (Sub-1-KLOC). FixtureTextsLater headroom
tight (~4 lines); split companion before next grow.

---

## Remaining gap (honest)

- HostModuleCheck seed depth honesty is still **PARTIAL-STRUCTURAL** (key decls +
  package-local imports for all 206 modules).
- **Mult L2 TERM-SURFACE Mult-only** dual-ok (not package elaborate; not peer units).
- **MultTheorems L3 PROOF-SURFACE MultTheorems-only** dual-ok (not package L4).
- Kind-surface coverage is Mult..Extract + Kernel Mult..KernelEmit +
  EmitPlan+EmitApply+EmitBody + Parity Mult..Emit (closed this wave).
- Inventory rank-4 SpecProof / remaining seed still structural-only (orthogonal
  or later).
- Cold `lake build` under `src/systems/` remains the only honest full-package
  elaborator surface.
- Full classic elaborator parity surface-matrix row stays **open**.
- Open checkable residual: **none** (empty done-for-now).
- **Held** (operator promote only): Linear term-surface; package L4; full
  elaborator / mathlib parity. FullHostElaborateRemains stays **false**; free
  claimed is not Lake-gone for full elaborate.
- Do **not** sell without-Lake GREEN, Mult L2, or MultTheorems L3 as full
  elaborator parity or as re-opening FullHost.

---

## Residual Open state

- **Done:** Check depth gap inventory; Kind-surface band expand (Kernel);
  Kind-surface second band (Emit Plan/Apply/Body); Kind-surface third band
  (Parity Mult..Emit); Real elaborator judgments design; Mult term-surface gap
  table; Mult term-surface pilot (L2); **MultTheorems proof-surface pilot (L3)**.
- **Open:** empty done-for-now (no plan default next).
- WATCHER: DONE-FOR-NOW (package L4 held; Linear term-surface promote-only).

---

## Slice 5 -- Real elaborator judgments design (done)

**Analysis only.** No HostModuleCheck judgment implement. Pins unchanged.

| Deliverable | Path / content |
|-------------|----------------|
| Research note | `doc/dev/research/real-elaborator-judgments-design-2026-08-08.md` (Kind: analysis only) |
| Living tip cited | PARTIAL-STRUCTURAL + FOUNDATION-KIND-SURFACE band Mult..Extract + Kernel Mult..KernelEmit + EmitPlan/Apply/Body + Parity Mult..Emit (this report Slices 1-4) |
| Judgment classes | J1-J14 plain English (package load through environment commit; Lake-grade package typecheck roughly J1-J12) |
| Layer map | L0 Structural = PARTIAL-STRUCTURAL; L1/L1b = FOUNDATION-KIND-SURFACE; L2 Term surface; L3 Proof surface; L4 Package elaborate (held) |
| Evidence gates | E-good / E-bad (ill-typed twin) / E-lake / E-without-lake / E-dual-pin / E-sub1kloc / E-hygiene / E-no-forge |
| Dual-ok path | Staged TERM-SURFACE then PROOF-SURFACE then PACKAGE-ELABORATE; FullHost stays false; free claimed stays true; parity row only after L4 evidence |
| Honesty | FullHostElaborateRemains **false**; free claimed != full elaborate; not mathlib; not full classic Lean 4 parity claim |
| Ordered next | Mult term-surface gap table then Mult term-surface pilot (Slice 6 closed gap table) |

**Pin honesty (Slice 5):** all pins **unchanged** from Slice 4 table (FullHost false;
DualResidual free dual-ok; product free/complete/PROVABLY true; PARTIAL-STRUCTURAL;
FOUNDATION-KIND-SURFACE band as above; full classic elaborator parity **open**).

---

## Slice 6 -- Mult term-surface gap table (done)

**Analysis only.** No HostModuleCheck L2 judgment implement. Pins unchanged.

| Deliverable | Path / content |
|-------------|----------------|
| Research note | `doc/dev/research/mult-term-surface-gap-table-2026-08-08.md` (Kind: analysis only) |
| Mult L0/L1 tokens | `multRequiredDecls`: inductive:Mult + def name/isValid/ofNat?/isValidTag/multIsValid (6) |
| MultTheorems L1 corpus | `multTheoremsRequiredDecls` 14 theorems; on-disk extra ofNat?_some / ofNat?_name_* not required |
| Cold lake | `lake build SystemsLean.Mult` **exit 0**; `SystemsLean.MultTheorems` **exit 0** |
| Twin table | T2 wrong name return type; T3 ill-typed multIsValid app; T5 wrong isValid arm type still **L0/L1 accept**; Lake rejects ill-typed; T7 semantic FAIL-CLOSED is well-typed (not L2 alone) |
| MultTheorems | P1-P4 statement/sorry gaps held for **L3** (not Mult L2 pilot) |
| Pilot candidate set | Mult J5 (`name`, `multIsValid`) + optional J6 inductive Mult; Sub-1-KLOC note FixtureTextsLater ~996 |
| Next Open | **Mult term-surface pilot** with checkable Done when (gap table section 9) |
| Hygiene | `just hygiene` this slice |

**Pin honesty (Slice 6):** FullHostElaborateRemains **false**; DualResidual free
dual-ok **unchanged**; product free/complete/PROVABLY **true** unchanged;
PARTIAL-STRUCTURAL; FOUNDATION-KIND-SURFACE band unchanged; full classic elaborator
parity **open**; TERM-SURFACE **not** dual-ok (no L2 checks yet).

---

## Slice 7 -- Mult term-surface pilot (done)

**Implement.** L2 Mult.lean only. MultTheorems L3 out of scope this slice.

### What L2 checks (Mult dialect subset)

| Judgment | Check |
|----------|--------|
| J6 soft | Nullary inductive Mult ctors `mult0` / `mult1` / `multOmega` name lines present |
| J5 `name` | Def header claims `Mult -> String` (reject `Mult -> Nat`) |
| J5 `isValid` | Header `Mult -> Bool`; every match arm RHS is `true` or `false` |
| J5 `multIsValid` | Single-line body after `:=` is exactly `isValid m` (reject extra args) |

Not full Lean elaborator. ofNat? / isValidTag remain L0/L1 tokens only.

### Twins rejected (E-bad)

| Id | Twin | L0/L1 | L2 |
|----|------|------:|---:|
| T2 | `def name : Mult -> Nat` | accept (def:name token) | **reject** `ILL-TYPED-TERM` |
| T3 | `multIsValid ... := isValid Mult.mult0 m` | accept (def:multIsValid) | **reject** `ILL-TYPED-TERM` |
| T5 | `isValid` arm `=> "bad"` | accept (def:isValid) | **reject** `ILL-TYPED-TERM` |

L0 still-accept dual-pins: `hostModuleCheckBadMult*L0Accept` true.
E-good: `hostModuleCheckGoodMultTerm` accept; real Mult.lean path accepts under L2.

### Dual-ok spelling

| Pin | Value |
|-----|--------|
| `checkDepthTermSurfaceBar` / `measuredHostCheckTermSurfaceBar` | `TERM-SURFACE` |
| `checkDepthTermSurfaceScope` / `measuredHostCheckTermSurfaceScope` | `Mult-only` |
| `hostModuleCheckTermSurfaceDualOk` (HostModuleCheck + HostResidualShrink) | **true** |
| `hostModuleCheckMultTermSurfaceOk` | **true** (good + three rejects + L0 accept) |
| Seed depth honesty | still `PARTIAL-STRUCTURAL` + `FOUNDATION-KIND-SURFACE` band |
| harness | **29** (added `HostModuleCheckMultTerm`) |

### Primary paths

- New: `src/systems/SystemsLean/HostModuleCheckMultTerm.lean` (~357)
- Wire: `HostModuleCheckCheckersLater` Mult branch `refineMultWithTermSurface`
- Accepts / LoadOk / Driver / Theorems dual-pins for Mult term bads
- HostResidualShrink harness string + TERM-SURFACE mirror
- just host + host-without-lake greps; pure Nix required-files / host-leans / MultTerm host-spec

### RED then GREEN (TDD)

1. **RED intent:** without L2, T2/T3/T5 fixtures keep all Mult L0 tokens and would
   accept via `checkNamedSurface` alone (proven dual-pin `*L0Accept = true`).
2. **GREEN:** after `checkMultTermDialect` + Mult-path wire, full `checkRealModule`
   rejects with `reasonIllTypedTerm` (`ILL-TYPED-TERM`); native_decide theorems +
   LoadOk + driver smoke green.

### Commands + exit codes (Slice 7)

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.Mult` | 0 |
| `lake build SystemsLean.HostModuleCheck* HostResidualShrink* slake-host-module-check` | 0 |
| `just host-module-check-without-lake` | 0 (modules=206; termSurface=TERM-SURFACE Mult-only dualOk=true) |
| `just host-residual-shrink` | 0 |
| `just systems-host` | 0 (242 required paths) |
| `just hygiene` | 0 |

### Pin honesty (Slice 7)

| Pin / claim | After Mult L2 pilot |
|-------------|---------------------|
| FullHostElaborateRemains | **false** |
| DualResidual free dual-ok | **unchanged** (free true / remains false) |
| Product free / complete / PROVABLY | **true** unchanged |
| TERM-SURFACE dual-ok | **true** Mult-only (not package) |
| Full classic elaborator parity | **open** |
| seed / harness | 206 / **29** |

- Report path: this file.

---

## Slice 8 -- MultTheorems proof-surface pilot (done)

**Implement.** L3 MultTheorems.lean only. Package L4 out of scope. Mult L2
TERM-SURFACE Mult-only **unchanged**.

### What L3 checks (MultTheorems dialect subset)

| Judgment | Check |
|----------|--------|
| J7 `ofNat?_zero` statement | Theorem header statement must contain `ofNat? 0 = some Mult.mult0` (reject `: True`) |
| J7 `ofNat?_zero` proof | Body after `:=` must be exactly `rfl` (reject `by sorry` / `trivial`) |
| J7 `name_mult0` statement | Must contain `name Mult.mult0` and `MULT-0` (reject `: True`) |
| J7 `name_mult0` proof | Body after `:=` must be exactly `rfl` |

Not full Lean tactic elaborator. Other MultTheorems theorems stay L0/L1 tokens only.

### Twins rejected (E-bad)

| Id | Twin | L0/L1 | L3 |
|----|------|------:|---:|
| P1 | `theorem ofNat?_zero : True := trivial` | accept (theorem:ofNat?_zero token) | **reject** `ILL-TYPED-PROOF` |
| P2 | `theorem ofNat?_zero : ofNat? 0 = some Mult.mult0 := by sorry` | accept (theorem:ofNat?_zero) | **reject** `ILL-TYPED-PROOF` |

L0 still-accept dual-pins: `hostModuleCheckBadMultThm*L0Accept` true.
E-good: `hostModuleCheckGoodMultTheoremsProof` accept; real MultTheorems.lean
path accepts under L3 (`ofNat?_zero` / `name_mult0` are `:= rfl`).

### Dual-ok spelling

| Pin | Value |
|-----|--------|
| `checkDepthProofSurfaceBar` / `measuredHostCheckProofSurfaceBar` | `PROOF-SURFACE` |
| `checkDepthProofSurfaceScope` / `measuredHostCheckProofSurfaceScope` | `MultTheorems-only` |
| `hostModuleCheckProofSurfaceDualOk` (HostModuleCheck + HostResidualShrink) | **true** |
| `hostModuleCheckMultProofSurfaceOk` | **true** (good + two rejects + L0 accept) |
| Mult L2 TERM-SURFACE Mult-only | **unchanged** dual-ok true |
| Seed depth honesty | still `PARTIAL-STRUCTURAL` + `FOUNDATION-KIND-SURFACE` band |
| harness | **30** (added `HostModuleCheckMultProof`) |

### Primary paths

- New: `src/systems/SystemsLean/HostModuleCheckMultProof.lean` (~293)
- Wire: `HostModuleCheckCheckersLater` MultTheorems branch
  `refineMultTheoremsWithProofSurface`
- Accepts / Driver / Theorems dual-pins for MultTheorems proof bads
- HostResidualShrink harness string + PROOF-SURFACE mirror
- just host + host-without-lake greps; pure Nix required-files / host-leans /
  MultProof host-spec

### RED then GREEN (TDD)

1. **RED intent:** without L3, P1/P2 fixtures keep all MultTheorems L0 tokens and
   would accept via `checkNamedSurface` alone (proven dual-pin `*L0Accept = true`).
2. **GREEN:** after `checkMultTheoremsProofDialect` + MultTheorems-path wire, full
   `checkRealModule` rejects with `reasonIllTypedProof` (`ILL-TYPED-PROOF`);
   native_decide theorems + driver smoke green.

### Commands + exit codes (Slice 8)

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.MultTheorems` | 0 |
| `lake build SystemsLean.HostModuleCheck* HostResidualShrink* slake-host-module-check` | 0 |
| `just host-module-check-without-lake` | 0 (modules=206; proofSurface=PROOF-SURFACE MultTheorems-only dualOk=true) |
| `just host-residual-shrink` | 0 |
| `just systems-host` | 0 (243 required paths) |
| `just hygiene` | 0 |

### Pin honesty (Slice 8)

| Pin / claim | After MultTheorems L3 pilot |
|-------------|-----------------------------|
| FullHostElaborateRemains | **false** |
| DualResidual free dual-ok | **unchanged** (free true / remains false) |
| Product free / complete / PROVABLY | **true** unchanged |
| TERM-SURFACE dual-ok | **true** Mult-only (unchanged) |
| PROOF-SURFACE dual-ok | **true** MultTheorems-only (not package) |
| Full classic elaborator parity | **open** |
| seed / harness | 206 / **30** |

Open after this slice: **empty done-for-now** (package L4 held; Linear
term-surface promote-only). Report path: this file.

---

## Final closeout (gapc2026 -- Mult L2 + MultTheorems L3 + kind-surface)

**Date:** 2026-08-08. **Status:** wave closed; Open empty done-for-now.

### Closed this wave (Slices 1-8)

| Slice | Outcome |
|-------|---------|
| 1 Check depth gap inventory | Research; Kernel first rank |
| 2 Kind-surface Kernel Mult..KernelEmit | FOUNDATION-KIND-SURFACE expand |
| 3 Kind-surface Emit Plan/Apply/Body | Plan/Apply/Body structure deepen |
| 4 Kind-surface Parity Mult..Emit | Parity readiness/path deepen |
| 5 Real elaborator judgments design | J1-J14 + L0..L4 map (analysis) |
| 6 Mult term-surface gap table | T2/T3/T5 twins; pilot set (analysis) |
| 7 Mult term-surface pilot (L2) | TERM-SURFACE Mult-only dual-ok; ILL-TYPED-TERM |
| 8 MultTheorems proof-surface pilot (L3) | PROOF-SURFACE MultTheorems-only dual-ok; ILL-TYPED-PROOF |

### Closeout gates (all exit 0)

| Command | Exit |
|---------|-----:|
| `just hygiene` | 0 |
| `just host-module-check-without-lake` | 0 (modules=206; termSurface=TERM-SURFACE Mult-only dualOk=true; proofSurface=PROOF-SURFACE MultTheorems-only dualOk=true; depth=PARTIAL-STRUCTURAL; bar=FOUNDATION-KIND-SURFACE) |
| `just host-residual-shrink` | 0 (FullHostElaborateRemains false; free dual-ok F1; remains false) |

### Living tip pins (unchanged honesty)

| Pin | Value |
|-----|--------|
| FullHostElaborateRemains | **false** |
| Host free claimed F1 / remains | free **true** / remains **false** |
| Product free / complete / PROVABLY | **true** |
| Product StillUsesLake / DependsOnLake | **false** |
| TERM-SURFACE | Mult-only dual-ok |
| PROOF-SURFACE | MultTheorems-only dual-ok |
| seed / harness | 206 / 30 |
| Full classic elaborator parity | **open** (held) |

### Residual / handoff / watcher lockstep

| Surface | State |
|---------|--------|
| `RESIDUAL-systems.md` Open | **empty done-for-now** |
| `RESIDUAL.md` Systems Open join | empty done-for-now; highest-value next = operator promote only |
| `doc/SESSION-HANDOFF.md` Active / Next | empty done-for-now; MultTheorems L3 closed |
| `WATCHER.md` | DONE-FOR-NOW (no `/implement`) |

### What remains (not auto-Open)

1. **Linear** (or peer) **term-surface** expand beyond Mult-only.
2. **Package elaborate L4** (FullHostElaborateRemains stays false until real L4 evidence).
3. **Full elaborator / mathlib parity** (unclaimed; not Lake-gone for full elaborate).
4. Held backend tracks unchanged: full LLVM production backend; true Rust-native link success; AffineDrop dual; optional runtime microbench.

Do **not** invent Open Names. Do **not** re-true FullHostElaborateRemains. Do **not** forge free/complete/PROVABLY/full parity/package L4 from this closeout.
