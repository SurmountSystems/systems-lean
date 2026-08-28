# Plan: FullHost / Slake-vs-Lake elaborator gap close (effort-2 wave)

ASCII only. Plain American English. Complete sentences.
Date: 2026-08-08.
Kind: operator-promoted implement plan (not residual invent theater).

**Sources (explore report absent; same evidence as R1 design + residual):**

- `doc/dev/research/full-elaborator-parity-design-2026-08-07.md` (R1 gap SSoT)
- `doc/dev/research/full-host-elaborator-design-2026-08-03.md` (A2 Lake job map)
- `.agents/plans/plan-slake-replaces-lake.md` (layers; free bar (a); FullHost false)
- `.agents/reports/impl-full-elaborator-parity-design-2026-08-07.md`
- Living tip: `RESIDUAL-systems.md`, `src/systems/self-host.md`, `src/systems/surface-matrix.md`
- Host family: `HostModuleCheck*.lean`, `HostResidualShrink.lean`, `DualResidual.lean`

**Pin honesty (do not forge):**

| Pin / claim | Living tip | This wave |
|-------------|------------|-----------|
| Product free / complete / PROVABLY | true | preserve |
| Product StillUsesLake / DependsOnLake | false | preserve |
| Host residual free (F1 dual-ok) | remains false / free claimed true | preserve |
| `FullHostElaborateRemains` | **false** (A66) | **stay false** (do not re-true) |
| `proofCompleteClaimed` | true (Track 4c) | preserve; not parity |
| Full classic elaborator parity | **unclaimed / open** | partial progress only |
| llvm full backend / Rust-native link | held | do not open |

---

## 1. Goal

Close as much of the **Slake-vs-Lake host elaborator depth gap** as one effort-2
wave can honestly close, without forging free / complete / PROVABLY /
FullHostElaborateRemains / full elaborator parity / full LLVM backend.

That gap is **not** "re-true FullHostElaborateRemains." A66 already set
FullHostElaborateRemains **false**: cold full Lake is bootstrap / emergency /
claim-proof only for day-to-day. Free bar choice (a) and F1 host free claimed
already own **day-to-day develop ownership** at structural bars.

The remaining gap is **full package typecheck depth**: HostModuleCheck is still
PARTIAL-STRUCTURAL (key decls + package-local imports) with FOUNDATION-KIND-SURFACE
only on Mult..Extract. Cold `lake build` under `src/systems/` remains the only
honest full-package elaborator surface. This wave measures that gap, then deepens
the living HostModuleCheck honesty ceiling on one or more named library bands
beyond Mult..Extract, under Sub-1-KLOC and lake elaborator proof on any claim
touch. Honest partial close is success; claiming full Lean 4 / mathlib parity
is forbidden.

---

## 2. Current measured gap

- **Free claimed F1 != elaborator parity.** Day-to-day without-Lake tools
  (package roots, import graph modules=206, module-check, Mult..Compose package
  write, fragment check/graph, freestanding regenerate) prove ownership of develop
  steps, not kernel elaborate of every module body.
- **FullHostElaborateRemains false != parity.** Cold Lake retired from day-to-day
  only; `just systems-lake` / `(cd src/systems && lake build)` is still the full
  package typecheck diagnostic and claim-proof elaborator.
- **Module body check (L3) is structural only.** PARTIAL-STRUCTURAL: package-local
  imports + greppable key decls; reject empty/missing. Does not type terms, check
  proof validity, or elaborate inductives like Lake.
- **Kind-surface coverage is Mult..Extract only.** FOUNDATION-KIND-SURFACE
  (structure / axiom / expanded theorem tokens) closed through Mult, Linear,
  Types, IrProgram, IrGraph, HostCompose, Erasure, Extract (+ their *Theorems).
  Seed Mult..SpecProofTheorems is still mostly key-decl PARTIAL-STRUCTURAL only.
- **Scale carve.** Seed modules=**206** (product library Mult..SpecProofTheorems);
  *Main (59) + harness (28) carved; on-disk `SystemsLean/*.lean` ~270. Import
  graph / module-check do not equal full develop set including mains/tools.
- **Theorems (L4).** *Theorems corpus under PARTIAL-STRUCTURAL / kind-surface on
  the Mult..Extract band only; proof terms do not elaborate as Lake does.
- **proofCompleteClaimed true is orthogonal.** Track 4c SpecProof bar on named
  Mult/Linear/HostCompose/emit families; not HostModuleCheck typecheck depth.
- **Dialect posture.** Hybrid: Mult-first HostFront/HostCheck dialect + real-module
  structural extract (HostModuleCheck). Not a real Lean 4 subset elaborator.
- **Surface matrix.** Full classic elaborator parity row **open**; host residual
  free row **measured**.
- **Headroom constraints.** Sub-1-KLOC on every novel file; HostModuleCheck family
  already split under 1000; FixtureTextsLater / Walk / LoadOk near ~999 headroom.
  Kind-surface expand must prefer companion splits over tip growth past 1000.

---

## 3. Wave slices (priority order)

Implement in order. Stop after any slice if Done when fails or forge risk appears.
Do not skip measurement (Slice 1) before product deepen (Slice 2+).

### Slice 1 -- Check depth gap inventory

| Field | Content |
|-------|---------|
| **Name** | Check depth gap inventory |
| **Goal** | Publish a dated measurement of HostModuleCheck bar vs cold Lake elaborate on a named sample set, so later deepen is evidence-driven not slogan. |
| **Done when** | (1) Research note `doc/dev/research/check-depth-gap-inventory-2026-08-08.md` (Kind: analysis only). (2) Sample table: at least 8 modules spanning Mult..Extract kind-surface band **and** at least one non-kind-surface seed band (e.g. Kernel*, Emit*, Parity*, SpecProof). Columns: module, HostModuleCheck accept/reject tokens checked, without-Lake recipe result, cold `lake build` of that module (or package filter) exit, gap class (structural-only / kind-surface / real elaborate). (3) Ordered recommendation for which band Slice 2 deepens first. (4) Residual Open Name + Done cite; WATCHER + SESSION-HANDOFF reseed; surface-matrix Full classic elaborator parity tip note "inventory present". (5) `just hygiene` green. (6) **No** pin flips. |
| **Paths** | `doc/dev/research/check-depth-gap-inventory-2026-08-08.md` (new); `RESIDUAL-systems.md`; `RESIDUAL.md`; `WATCHER.md`; `doc/SESSION-HANDOFF.md`; `src/systems/surface-matrix.md` (tip line only); optional cite in `self-host.md` one line. |
| **Gates** | `just hygiene`; optional read-only `just host-module-check-without-lake` + targeted `lake build` for sample evidence (document commands + exits in the note). |
| **Out of scope** | Implementing elaborator; kind-surface product edits; free / FullHost / proof complete / product free flips; mathlib; full parity claim. |

### Slice 2 -- Kind-surface band expand (first band beyond Mult..Extract)

| Field | Content |
|-------|---------|
| **Name** | Kind-surface band expand |
| **Goal** | Raise one named product library band past Mult..Extract to FOUNDATION-KIND-SURFACE under the same PARTIAL-STRUCTURAL honesty ceiling (structures / axioms / expanded theorem tokens + at least one fail-closed reject fixture). |
| **Default band (unless Slice 1 ranks otherwise)** | **Kernel Mult..KernelEmit** (KernelMult, KernelLinear, KernelTypes, KernelProgram, KernelEmit + matching *Theorems companions that already sit on the seed). Rationale: self-host kernel surface is product-critical and still structural-only after A58. Alternate if inventory shows denser gap: Emit scaffold/product band (EmitPlan/Apply/Body + scaffolds) or Parity Mult..Emit. **Pick exactly one band name in residual Open.** |
| **Done when** | (1) Named band string dual-pinned (HostModuleCheck checkDepthDeepen* + HostResidualShrink inventory reseed). (2) Required decls gain structure/axiom/kind tokens for that band; *Theorems corpus expanded with greppable names (same order of magnitude as A56..A58). (3) At least one bad reject fixture for missing structure/axiom on the band. (4) `just host-module-check-without-lake` GREEN modules=206 (or honest count if seed unchanged). (5) `lake build` HostModuleCheck family + HostResidualShrink + `slake-host-module-check` exit 0. (6) `just host-residual-shrink` GREEN. (7) `just systems-host` GREEN if pure Nix dual-pin paths touched. (8) Every touched HostModuleCheck*.lean stays under **1000** lines (split companion first if headroom tight). (9) Residual Done + WATCHER + handoff; DualResidual free dual-ok **unchanged**; FullHostElaborateRemains **false**; product free/complete/PROVABLY unchanged; no full typecheck slogan in living prose. (10) `just hygiene` green. |
| **Paths** | `SystemsLean/HostModuleCheckRequiredDecls*.lean`; `HostModuleCheckFixtureTexts*.lean`; `HostModuleCheckFixtures.lean`; `HostModuleCheckAccepts*.lean` / Checkers* as needed; `HostModuleCheckSeeds.lean` / LoadOk / Theorems if dual-ok strings move; `HostResidualShrink.lean` (+ Theorems if needed); pure Nix `nix/systems-host-presence/*` dual-pin only if gate requires; `just/host-without-lake.just` / `just/host.just` token greps; residual / WATCHER / handoff / self-host tip one line. |
| **Gates** | lake HostModuleCheck family + HostResidualShrink + exe; `just host-module-check-without-lake`; `just host-residual-shrink`; `just systems-host` when presence touched; `just hygiene`. |
| **Out of scope** | Full elaborator judgments; second band (Slice 3); free flip; FullHost re-true; seed modules count theater (*Main into seed); mathlib; llvm backend. |

### Slice 3 -- Kind-surface second band (if Slice 2 green and effort remains)

| Field | Content |
|-------|---------|
| **Name** | Kind-surface second band |
| **Goal** | Same bar as Slice 2 on the **next** band Slice 1 ranked (default: Emit plan/apply/body product + scaffold family **or** Parity Mult..Emit -- whichever Slice 1 did not take). |
| **Done when** | Same shape as Slice 2 for the second named band; Sub-1-KLOC; no pin forge; without-Lake + lake + residual-shrink + hygiene green; residual reseed. |
| **Paths** | Same HostModuleCheck / HostResidualShrink / presence / residual family as Slice 2. |
| **Gates** | Same as Slice 2. |
| **Out of scope** | Parity claim; real elaborator; third band if headroom or effort exhausted (stop honestly). |

### Slice 4 -- Real elaborator judgments design (analysis only; optional if deepen done)

| Field | Content |
|-------|---------|
| **Name** | Real elaborator judgments design |
| **Goal** | Write a checkable multi-wave design for **real** typecheck depth beyond FOUNDATION-KIND-SURFACE (term-shaped judgments, binder / multiplicity surface, theorem body elaborate subset), without implementing the elaborator or claiming parity. |
| **Done when** | (1) Research note `doc/dev/research/real-elaborator-judgments-design-2026-08-08.md` (Kind: analysis only). (2) Explicit non-equivalence table: kind-surface vs real judgments vs full Lake package typecheck vs mathlib. (3) Staged residual Names with Done when that cannot be greps-only. (4) Dialect posture: grow host dialect vs import classic elaborator surface (pick default; document why). (5) Checklist cross-link to section 4 of this plan. (6) Residual Open empty or next Name only if Done when is checkable; hygiene green; **no** pin flips. |
| **Paths** | research note; residual / WATCHER / handoff tip; optional surface-matrix row update (open + design path). |
| **Gates** | `just hygiene`. |
| **Out of scope** | Implementing judgments; flipping FullHost or free; selling design as parity. |

### Explicitly not this wave

- Full classic elaborator parity claim (surface-matrix stays open until multi-wave evidence + dual-ok redesign).
- Full Lean 4 / mathlib elaborator.
- Re-true FullHostElaborateRemains.
- Re-open product free / complete / PROVABLY / host free dual-ok.
- Full LLVM production backend; Rust-native link success.
- Invent theorem canaries only to exercise lean4 skill.
- Product C / shell growth.

---

## 4. What would be required to claim full elaborator parity (multi-wave checklist)

**Clarify pin names first.**

| Phrase | Meaning | Living tip |
|--------|---------|------------|
| `FullHostElaborateRemains` | "Does cold full package elaborate remain a **day-to-day** residual?" | **false** after A66 -- keep false |
| Full classic elaborator parity | "Does Slake do the same **typecheck job** as Lake for the SystemsLean develop set?" | **unclaimed** -- this checklist |
| Host residual free (F1) | Day-to-day Lake not required for free bar (a) develop steps | **claimed** -- preserve |

**Do not "flip FullHostElaborateRemains" to true** as progress. That would reclassify cold full Lake as day-to-day residual and undo A66. Progress is closing the **parity** gap while FullHost stays false (cold Lake remains bootstrap / claim-proof / diagnostic only).

### Multi-wave checklist for full package typecheck parity (honest)

None of these flip in this effort-2 wave alone. First wave may complete only
measurement + kind-surface partials.

1. **Package load (L1)** -- already met for free (`host-package-roots-without-lake`). Preserve.
2. **Import graph (L2)** -- seed Mult..SpecProofTheorems modules=206 without-Lake. Policy for *Main/harness explicit. Expand only if develop set grows; no seed theater.
3. **Module body check (L3) real judgments** -- replace PARTIAL-STRUCTURAL as the **parity** bar with named elaborator judgments (defs, inductives, namespaces, instances) on the full develop seed. Greps alone never green this bar. Needs Slice 4 design + multi implement waves.
4. **Kind-surface then judgments coverage (band roll)** -- every library band at least FOUNDATION-KIND-SURFACE, then real elaborate. Today: Mult..Extract kind-surface only. This wave: +1..2 bands.
5. **Theorems (L4)** -- proof terms elaborate as Lake does on *Theorems corpus for the develop set, not only greppable theorem names.
6. **Host tools (L6-L7)** -- day-to-day candidates empty (A60). Claim/diagnostic Lake-only carve stays honest unless residual moves a tool into day-to-day with without-Lake evidence.
7. **Same-job evidence** -- for each parity milestone, wall-clock and exit comparison is **same modules / same job** as Lake elaborate of those modules -- never Mult package write vs cold full package as a "parity win."
8. **Dual-ok redesign for parity claim** -- when evidence exists: surface-matrix Full classic elaborator parity row moves measured; living tip prose; lake elaborator proof on claim flip; HostResidualShrink / DualResidual honesty strings that **do not** re-true FullHost or re-open free without cause.
9. **Cold Lake role** -- even after parity, wipe-bootstrap and policy claim-proof may still use Lake until Slake builds its own tools and oleans. FullHostElaborateRemains can stay **false** the whole time.
10. **mathlib-scale Lean 4** -- explicit non-goal day one; separate operator promote.

**Minimum to ever claim "full package typecheck of SystemsLean develop seed":**
items 1-5 + 7-8 green with lake proof and residual dual-ok, **without** selling
HostModuleCheck structural green as that claim.

---

## 5. Parallelism opportunities

| Parallel? | Work | Notes |
|-----------|------|-------|
| Serial first | Slice 1 inventory | Feeds band choice for Slice 2; do not race product deepen before sample table exists unless operator pre-picks Kernel band. |
| After Slice 1 | Slice 2 implementer | Single writer on HostModuleCheck family (same-file race risk). |
| Parallel with Slice 2 | pure Nix / just dual-pin presence only if disjoint from Lean tip edits | Prefer one implementer owning Lean + presence to avoid gate thrash. |
| Parallel with Slice 2/3 | Reviewer on residual honesty + Sub-1-KLOC headroom | Read-only review after green. |
| After deepen green | Slice 4 design | Can run parallel to Slice 3 if second band is independent and design author does not edit HostModuleCheck. |
| Never parallel | Two writers on FixtureTextsLater / LoadOk / tip hub | Headroom ~999; serialize. |

Cap: ~1 implementer + ~1 reviewer at effort 2 unless Slice 1 and Slice 4 are pure docs on disjoint files.

---

## 6. Success bar for THIS wave

**Maximum honest progress (preferred close):**

- Slice 1 inventory note on disk with sample table and band ranking.
- Slice 2 kind-surface expand green on one named band beyond Mult..Extract.
- Slice 3 second band **or** Slice 4 real-judgments design (either is enough if effort caps).
- Residual / WATCHER / handoff lockstep; `just hygiene` green; lake proof on product Lean touches.
- Living tip still: free/complete/PROVABLY true; host free claimed F1; FullHostElaborateRemains **false**; proof complete true; full elaborator parity **still unclaimed**.

**Acceptable partial close:**

- Slice 1 + Slice 2 only (second band / design deferred with named next residual).
- Or Slice 1 + Slice 4 if kind-surface headroom is blocked (must document BLOCKED reason: Sub-1-KLOC headroom, not "optional park" of checkable work).

**Failure (do not mark green):**

- Grep-only "parity" claim or surface-matrix Full classic elaborator parity flipped to measured without real judgments.
- FullHostElaborateRemains re-trued.
- Free / product free / PROVABLY / proof complete forged or silently rewritten.
- HostModuleCheck file past 1000 without split residual.
- Claim GREEN without lake elaborator proof on claim-adjacent Lean when required.

---

## 7. Implement loop / residual lockstep

After operator approve:

1. Open **Check depth gap inventory** in `RESIDUAL-systems.md` with Goal / Done when / Out of scope / Paths from Slice 1.
2. Put `/implement` for Slice 1 in `WATCHER.md` + reply final section.
3. On Slice 1 green: Done archive row; open **Kind-surface band expand** with the inventory-chosen band name; chain implement.
4. On Slice 2 green: either open second band or real elaborator judgments design per remaining effort; never empty Open while this plan still names checkable next Done when.
5. When plan slices for this wave are done or honestly BLOCKED: reseed Open empty done-for-now only if no checkable next remains **in this plan**.

---

## 8. Critical files

- `doc/dev/research/full-elaborator-parity-design-2026-08-07.md` -- gap SSoT
- `src/systems/SystemsLean/HostModuleCheck*.lean` -- structural / kind-surface bar
- `src/systems/SystemsLean/HostResidualShrink.lean` -- FullHost false + inventory dual-ok
- `src/systems/SystemsLean/DualResidual.lean` -- host free dual-ok (do not forge)
- `src/systems/surface-matrix.md` -- Full classic elaborator parity row
- `.agents/plans/plan-slake-replaces-lake.md` -- layers and free bar program

---

## 9. Non-claims (this plan and this wave)

- Does not claim full elaborator parity or full package typecheck.
- Does not re-true FullHostElaborateRemains.
- Does not re-open or forge product free / complete / PROVABLY / host free.
- Does not implement a real Lean 4 elaborator in one wave.
- Does not open full LLVM backend or Rust-native link.
- Does not invent unrelated residual Names outside the elaborator gap.
