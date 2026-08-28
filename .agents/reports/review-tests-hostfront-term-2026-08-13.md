# TESTS review: Term-surface for HostFront

Date: 2026-08-13. Role: tests reviewer (TDD specialist; not implementer).
Repo: `/home/hunter/Projects/ai/iso`.
Scope: HostFront TERM companion, eight ILL-TYPED-TERM twins, living
`hostFrontReady` dialect (FirstSurface-class, not ExtractSubsetRebuild),
L0 accept + dialect reject, LoadOk later-fold of SurfaceOk, Soft J2
HostFront-only, ShrinkTermOk HostFront-only, Accepts TERM text, RealModule
refine, Evidence / PackageEnv not grown, no HostFront package-env, FullHost
pin false.
Harness 121. TERM 67. Seed 206. FullHostElaborateRemains false.
Lean bool plus `native_decide`. Not CompCert. Not a C probe.
No implement. No residual edits. Did not update WATCHER. Did not flip pins.
Did not re-run lake. Fresh review (not writer `019ffb8c`; not mop `019ffb94`).

Primary implementer: `.agents/reports/impl-hostfront-term-2026-08-13.md`
Summary: `/tmp/grok-1000/grok-impl-summary-hostfront-term.md`
Process mop: `.agents/reports/process-mop-hostfront-term-2026-08-13.md`
(GREEN; hygiene 0; family lake 111 jobs 0; systems-host 340; no product edits)
Prior tests review clone: `.agents/reports/impl-extract-subsetrebuild-term-2026-08-13.md`
(ExtractSubsetRebuild TERM GREEN; reviews APPROVE 0, now trashed)
Also useful: `.agents/reports/review-tests-firstsurface-term-2026-08-12.md`
(FirstSurface TERM template APPROVE 0)

Also written: `/tmp/grok-1000/grok-review-hostfront-term-tests.md`

Lake re-run: **no**. Implementer plus mop already recorded focused HostFront
TERM family lake exit 0 (111 jobs). Replaying green does not add contract
evidence. The implementer report already names red command, exit 1, tactic
fail reason, theorem bool, and green of the same command.

## Verdict

**APPROVE**. 0 open issues.

The named HostFront TERM contract is encoded as Lean bools plus
`native_decide` theorems, not as presence greps. Unit dialect rejects eight
dishonest HostFront claim flips as `ILL-TYPED-TERM`. L0 named-surface still
accepts those same texts. E-good dialect is living `hostFrontReady` (goldens
+ ids + Mult grades + HostTerm reuse + Lake + residual remains + peer-green
+ living false claims), not `emitExtractReady` and not
`extractSubsetRebuildSelfApplyOk`. SurfaceOk folds dialect, eight rejects,
eight L0 accepts, multiline collapse, bar, and HostFront-only scope. It is
not DualOk alone. LoadOk later-fold includes
`hostModuleCheckHostFrontTermSurfaceOk`. Theorems were not rewritten to
finish green. PackageEnv / Evidence / Fixtures were not grown. No HostFront
package-env this slice. FullHostElaborateRemains stays false. Living
HostFront residual-free / complete / proof / llvm / PROVABLY stay false.

This unit is a new Mult-first host fragment front-end class. Template is
FirstSurface TERM (living ready + honesty pins), not ExtractSubsetRebuild
TERM (no self-apply / wrote-expected dialect). This reviewer did not re-run
lake. Implementer logged red then green on
`lake build SystemsLean.HostModuleCheckHostFrontTerm`. Mop re-ran the wire
family, `just hygiene`, and `just systems-host` at exit 0.

## TDD table

| Step | Command | Result | Theorem rewritten? |
|------|---------|--------|--------------------|
| Red (logged) | `lake build SystemsLean.HostModuleCheckHostFrontTerm` with `hostModuleCheckHostFrontTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckHostFrontTermSurfaceOk = true` is false (14 jobs attempted). Theorem `hostModuleCheckHostFrontTermSurfaceOk_true`. | **No** |
| Green (logged + mop) | same theorem after dialect + eight ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs). Wire family exit 0 (111 jobs). Mop same family 111 jobs exit 0. | **No**. Still `hostModuleCheckHostFrontTermSurfaceOk = true := by native_decide`. |

Red was observed and logged by the implementer with command, exit, tactic
message, named SurfaceOk bool, and job count. This is the same TERM-family
red used on ExtractSubsetRebuild TERM (SurfaceOk false, theorem `= true`).
This reviewer did not re-observe the red lake. On-disk theorem statement and
proof tactic match the family shape. The fold grew to include eight isolated
ILL twins plus L0 accepts plus multiline collapse (stronger, not weaker).
No `sorry` / `admit`. Not a green-only land.

## Named contract file:line

| Named item | Path:line |
|------------|-----------|
| Dialect (`checkHostFrontTermDialect`, ten body checks, `reasonIllTypedTerm`) | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:111` |
| Living `hostFrontReady` E-good body | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:58` |
| Ready body collapse | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:61` |
| Residual-free body must collapse to `false` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:66` |
| Complete body must collapse to `false` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:71` |
| Proof / llvm / PROVABLY bodies must collapse to `false` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:76` / `:81` / `:86` |
| Peer-green body must collapse to `true` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:91` |
| Host residual remains / `stillUsesLake` / `dependsOnLake` bodies `true` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:96` / `:101` / `:106` |
| Soft J2 scope `HostFront-only` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:52` |
| RealModule `refineHostFrontWithTermSurface` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:124` |
| RealModule HostFront branch | `src/systems/SystemsLean/HostModuleCheckRealModule.lean:562` |
| E-good TERM text | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:162` |
| ILL residual-free / complete / ready / peer-green texts | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:167` / `:173` / `:179` / `:185` |
| ILL proof / llvm / PROVABLY / Lake texts | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:191` / `:197` / `:203` / `:209` |
| ILL dialect reject == `ILL-TYPED-TERM` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:226` |
| ILL L0 accept via `checkNamedSurface` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:221` |
| SurfaceOk fold (not DualOk alone) | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:306` |
| Gate theorem `hostModuleCheckHostFrontTermSurfaceOk_true` | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:329` |
| Multi-line ready theorem | `src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean:332` |
| LoadOk later-fold of SurfaceOk | `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean:142` |
| Later-fold family theorem | `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean:144` |
| LoadOk tip folds later-fold + HostFront Accepts | `src/systems/SystemsLean/HostModuleCheckLoadOk.lean:218` / `:281` |
| Accepts uses TERM text, not L0 stub | `src/systems/SystemsLean/HostModuleCheckAccepts.lean:423` |
| Smoke HostFront Accepts | `src/systems/SystemsLean/HostModuleCheckSmoke.lean:244` |
| L0 required decls | `src/systems/SystemsLean/HostModuleCheckRequiredDeclsLater.lean:268` |
| L0 HostFront surface (HostTerm import) | `src/systems/SystemsLean/HostModuleCheckCheckersLater.lean:230` |
| Reject reason token | `src/systems/SystemsLean/HostModuleCheckMultTerm.lean:43` |
| ShrinkTermOk HostFront dual-ok / bar / scope | `src/systems/SystemsLean/HostResidualShrinkTermOk.lean:245` |
| FullHostElaborateRemains false | `src/systems/SystemsLean/HostResidualShrink.lean:227` |
| FullHost false theorem | `src/systems/SystemsLean/HostResidualShrinkTheorems.lean:100` |
| Living HostFront residual-free / complete / proof / llvm / PROVABLY false | `src/systems/SystemsLean/HostFront.lean:117` / `:120` / `:123` / `:126` / `:129` |
| Living `hostFrontReady` (goldens + ids + Mult + HostTerm + honesty) | `src/systems/SystemsLean/HostFront.lean:735` |

## Checklist (review prompt)

| # | Requirement | Result |
|---|-------------|--------|
| 1 | Observed red first: companion lake with `hostModuleCheckHostFrontTermSurfaceOk := false` and theorem `= true`. Exit 1. `native_decide` `hostModuleCheckHostFrontTermSurfaceOk = true` false. Theorem `hostModuleCheckHostFrontTermSurfaceOk_true`. 14 jobs attempted. | **Pass** (logged; command + exit + tactic + theorem named) |
| 2 | Same theorem green after dialect + ILL twins + SurfaceOk fold. Exit 0 (14 jobs). Theorem not rewritten. | **Pass**. Still `= true := by native_decide`. |
| 3 | ILL-TYPED-TERM twins reject residual-free / complete / proof / llvm / PROVABLY claimed true; ready body true; peer-green false; `stillUsesLake` false. L0 still accepts. | **Pass**. Eight isolated fixtures. Matcher is `r == reasonIllTypedTerm`. |
| 4 | Dialect E-good body is living `hostFrontReady` (FirstSurface-class), not copied emit/rebuild ready. | **Pass**. Companion has no `emitExtractReady`, `emitMultReady`, `extractSubsetRebuildSelfApplyOk`, or `hostFrontSelfApplyOk` as dialect. |
| 5 | Soft J2 HostFront-only. ShrinkTermOk HostFront-only after this slice. | **Pass**. Scope string `HostFront-only` on companion and TermOk. Import is HostTerm, not an emit-module farm. |
| 6 | Combined LoadOk later-fold includes `hostModuleCheckHostFrontTermSurfaceOk`. | **Pass** (`HostModuleCheckLoadOkLaterTerm.lean:142`). ExtractSubsetRebuild conjunct at `:141` not dropped. |
| 7 | Evidence / PackageEnv not grown. TERM must not grow Evidence. | **Pass**. Zero HostFront tokens in PackageEnv / Evidence / EvidenceLater / FixturesS5 / FixturesLater. Line counts unchanged (980 / 799 / 412 / 990 / 710). |
| 8 | FullHost pin false. HostFront living claimed-free / complete / proof / llvm / PROVABLY still false. | **Pass**. |
| 9 | No HostFront package-env this slice. | **Pass**. No PE companion. Soft J2 did not open package-env. |

## Past issues (this slice)

| Past issue | Result |
|------------|--------|
| 1. Presence gates green while behavior is untested | **Avoided.** Gate is `hostModuleCheckHostFrontTermSurfaceOk`, which folds dialect accept, eight ILL rejects, eight L0 accepts, and multiline collapse. Theorems decide those folds. |
| 2. Same-line `:=` matchers pass single-line fixtures while multi-line real modules fail | **Avoided.** `hostModuleCheckGoodHostFrontReadyMultilineText` matches `HostFront.lean:735` indent (2-space first conjunct, 4-space rest). Collapse is `emitPlanDefBodyCollapsed`. Dedicated `native_decide` theorem. |
| 3. E-bad twins must keep L0 accept so RED is structural without L2/L3 | **Avoided.** Each ILL fixture still has L0 required decls (`stageId`, `hostId`, `hostFrontReady`, `justRecipe`, `surfaceId`) and `import SystemsLean.HostTerm`. Eight L0 accept bools are folded into SurfaceOk. |
| 4. Soft theorem statements that fall through without forcing intermediate success | **Avoided.** Each ILL fixture flips one honesty pin only. Dialect is a chain of body checks. Residual ILL keeps ready good, so the miss is residual-free `true`. Ready ILL keeps residual `false`. Lake ILL keeps `dependsOnLake` true and ready body good, so the miss is `stillUsesLake` false. |
| 5. Claim-bool or inventory canary flips as comments only | **Avoided.** FullHostElaborateRemains was not flipped. Living HostFront residual-free, complete, proof, llvm, and PROVABLY stay false. Behavioral folds have lake `native_decide` proof (implementer + mop). |
| 6. Weakened reject theorem to finish green | **Avoided.** `hostModuleCheckHostFrontTermSurfaceOk_true` still asserts `hostModuleCheckHostFrontTermSurfaceOk = true := by native_decide`. Reject matchers still demand `r == reasonIllTypedTerm`. |
| 7. New fixtures / evidence file as a harness-count cheat | **Avoided.** New module is the named TERM companion. Harness 120 to 121 is the intended one-module bump. Seed 206 unchanged. Evidence / PackageEnv / Fixtures not grown. |
| 8. Later-fold drops prior TERM SurfaceOk or drops HostFront | **Avoided.** Later-fold still lists EmitPlan through ExtractSubsetRebuild, then HostFront at `:142`. |
| 9. Green-only TDD with no red log | **Avoided.** Implementer logged exit 1 on `hostModuleCheckHostFrontTermSurfaceOk = true` before the fold was filled. Command, exit, tactic message, and 14 jobs are all present. |
| 10. Dialect copied `emitExtractReady` or `extractSubsetRebuildSelfApplyOk` | **Avoided.** Dialect is living `hostFrontReady`. Non-claim comments name those copied bodies. No `hostFrontSelfApplyOk`. Cloned FirstSurface TERM class, not ExtractSubsetRebuild TERM. |
| 11. Wrong theorem greened | **Avoided.** Named red and green are `hostModuleCheckHostFrontTermSurfaceOk_true`. That is the fold that is false when SurfaceOk is false. |
| 12. Tests rewritten to finish green | **Avoided.** Combined theorem is still `= true := by native_decide`. Adding eight ILL conjuncts is a stronger fold, not a loosened assert. |
| 13. Accepts still uses L0 stub `hostFrontReady := true` | **Avoided.** `hostModuleCheckGoodHostFront` uses `hostModuleCheckGoodHostFrontTermText`. The L0 stub in FixtureTextsLater remains the L0 surface only. TERM rejects that ready body. LoadOk and Smoke decide Accepts. |

## Contract walk

### Eight ILL twins reject as ILL-TYPED-TERM

Unit dialect (`HostModuleCheckHostFrontTerm.lean:111` through `:122`):

- `hostFrontReady` must collapse to `hostFrontReadyTermBody` (goldens + ids +
  Mult grades + HostTerm reuse + Lake aliases + residual remains + peer-green
  + `!` residual-free / complete / proof / llvm / PROVABLY)
- residual-free / complete / proof / llvm / PROVABLY honesty pins must
  collapse to `false`
- peer-green honesty pin must collapse to `true`
- host residual remains / `stillUsesLake` / `dependsOnLake` must collapse
  to `true`

On any miss the reason is `reasonIllTypedTerm` (`ILL-TYPED-TERM`).
`hostFrontTermDialectReject` requires `some r => r == reasonIllTypedTerm`.

Each ILL fixture flips one named claim only:

| Twin | Flip | Lines |
|------|------|------:|
| residual-free | claimed `true` | 167 |
| complete | claimed `true` | 173 |
| ready | body `true` | 179 |
| peer-green | `hostFrontDoesNotClaimPeerGreen` `false` | 185 |
| proof | claimed `true` | 191 |
| llvm | unlocked `true` | 197 |
| PROVABLY | unlocked `true` | 203 |
| Lake | `stillUsesLake` `false` | 209 |

L0 (`checkNamedSurface` + `hostFrontExpectedNamespace` +
`hostFrontRequiredDecls` + `some "SystemsLean.HostTerm"`) only asks for
namespace, those five decls, and the HostTerm import. The ILL texts still
have those tokens, so the eight `*L0Accept` bools are true.

### Why red is red

`hostModuleCheckHostFrontTermSurfaceOk_true` asserts
`hostModuleCheckHostFrontTermSurfaceOk = true`. With
`hostModuleCheckHostFrontTermSurfaceOk := false`, `native_decide` fails.
That is the logged red: companion lake, 14 jobs attempted, exit 1, tactic
`hostModuleCheckHostFrontTermSurfaceOk = true` is false.

### Why green is the same theorem

After dialect + eight ILL twins + L0 accepts + multiline collapse, SurfaceOk
is the computed fold. The same theorem is still
`hostModuleCheckHostFrontTermSurfaceOk = true := by native_decide`.

Green command is the same `lake build SystemsLean.HostModuleCheckHostFrontTerm`.
Exit 0. 14 jobs. Wire family (companion + LoadOkLaterTerm + LoadOk +
RealModule + Accepts + HostResidualShrink + Theorems + TermOk +
HostModuleCheck) exit 0, 111 jobs. Mop re-ran that family and recorded the
same 111 jobs exit 0.

The fold grew by the named conjuncts. That is a stronger check, not a
rewrite of the named contract.

### FirstSurface-class, not rebuild / emit

`checkHostFrontTermDialect` first checks `hostFrontReadyBodyOk` against
`hostFrontReadyTermBody`. That string matches the collapsed on-disk
`HostFront.lean:735` body. It is not `emitExtractReady`. It is not
`extractSubsetRebuildSelfApplyOk`. There is no wrote-expected arm.

Skeleton import is `SystemsLean.HostTerm` (product HostTerm reuse). Soft J2
is HostFront-only. No CompilePathExtract farm. No emit-module section.

FirstSurface TERM is the template (living ready + honesty pins + refine +
SurfaceOk fold + multiline). HostFront adds the extra living HostFront
honesty twins residual asked for (proof / llvm / PROVABLY / peer-green /
Lake). That is a stronger FirstSurface-class check, not an
ExtractSubsetRebuild clone.

### LoadOk later-fold covers the new unit

`hostModuleCheckLaterTermSurfaceOk` (`LoadOkLaterTerm.lean:88`) conjuncts
EmitPlan through ExtractSubsetRebuild, then
`hostModuleCheckHostFrontTermSurfaceOk` at `:142`. Family theorem
`hostModuleCheckLaterTermSurfaceOk_true` is still `= true := by native_decide`.

LoadOk tip (`LoadOk.lean:281`) folds that later aggregate, and
`LoadOk.lean:218` folds `hostModuleCheckGoodHostFront.isAccept` (TERM text
through `checkRealModule` -> `refineHostFrontWithTermSurface`).

### Evidence / PackageEnv not grown

| File | Lines | HostFront tokens |
|------|------:|------------------|
| `HostModuleCheckPackageEnv.lean` | 980 | none |
| `HostModuleCheckPackageEnvEvidence.lean` | 799 | none |
| `HostModuleCheckPackageEnvEvidenceLater.lean` | 412 | none |
| `HostModuleCheckPackageEnvFixturesS5.lean` | 990 | none |
| `HostModuleCheckPackageEnvFixturesLater.lean` | 710 | none |

No HostFront package-env companion. Residual said do not open HostFront PE
this slice.

### Pins still false

Living product claims were not flipped to finish green:

- `hostResidualShrinkFullHostElaborateRemains := false`
- `hostFrontResidualFreeClaimed := false`
- `hostFrontProductSelfHostCompleteClaimed := false`
- `hostFrontProofCompleteClaimed := false`
- `hostFrontLlvmUnlocked := false`
- `hostFrontProvablyUnlocked := false`

Peer-green honesty stays `hostFrontDoesNotClaimPeerGreen := true`.
Host residual remains stays `true`. `stillUsesLake` / `dependsOnLake` stay
`true`. Harness `seed=206+Main=59+harness=121`. TERM dual-ok 67 (Mult-only
plus 66 later DualOk defs; HostFront is the 67th, scope HostFront-only).

## Line counts (reviewed)

| File | Lines | Role this slice |
|------|------:|-----------------|
| `HostModuleCheckHostFrontTerm.lean` | 340 | New companion; SurfaceOk + twins |
| `HostModuleCheckAccepts.lean` | 995 | HostFront Accepts uses TERM text |
| `HostModuleCheckLoadOk.lean` | 914 | Tip fold; Accepts + later-fold |
| `HostModuleCheckLoadOkLaterTerm.lean` | 147 | HostFront SurfaceOk conjunct |
| `HostResidualShrink.lean` | 839 | FullHost pin false; harness 121 |
| `HostResidualShrinkTermOk.lean` | 292 | HostFront-only dual-ok / bar / scope |
| `HostModuleCheckPackageEnv.lean` | 980 | Untouched |
| `HostFront.lean` | 850 | Living claims stay false |

All under Sub-1-KLOC. Accepts 995 stayed under 1000 (no long-file split).

## What this reviewer did not do

- Re-run lake (implementer red/green plus mop family already recorded)
- Edit product Lean, residual, WATCHER, or SESSION-HANDOFF
- Flip claim bools
- Treat ExtractSubsetRebuild TERM or HostFront package-env as this slice
- Invent an emit / rebuild farm concern that is not on disk

## Issues

0 open issues (APPROVE).

Nits (not blockers): `HostModuleCheckLoadOk.lean:280` comment still says
"EmitPlan through TypesSubsetRebuild" while the later-fold comment and
behavioral list now run through HostFront. The living conjunct is
`hostModuleCheckLaterTermSurfaceOk`, which includes HostFront SurfaceOk.
Same class of comment lag as prior TERM later-fold headers.

## Final

**APPROVE.** Open issue count: **0**.

The named contract is a Lean bool plus `native_decide` fold: HostFront
TERM dialect rejects eight dishonest claim flips as `ILL-TYPED-TERM`,
accepts E-good living `hostFrontReady` (including the on-disk multi-line
shape), and L0 still accepts the ILL texts. Dialect is FirstSurface-class
`hostFrontReady`, not `emitExtractReady` and not
`extractSubsetRebuildSelfApplyOk`. TDD order is logged red then green on
the same theorem body (`hostModuleCheckHostFrontTermSurfaceOk_true` still
`= true := by native_decide`). Wire family lake job count is 111 on
implementer green and mop. LoadOk later-fold includes the new SurfaceOk.
Accepts uses TERM text. Soft J2 / ShrinkTermOk are HostFront-only.
Evidence and PackageEnv were not grown. No HostFront package-env. FullHost
and HostFront living claimed-free / complete / proof / llvm / PROVABLY
stay false. This reviewer did not re-run lake; implementer plus mop
already recorded exit 0 on the focused family, and the Lean theorems
encode the contract.
