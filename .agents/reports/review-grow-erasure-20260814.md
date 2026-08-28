# Review: grow named closed subset with SystemsLean.Erasure

Verdict: **APPROVE**

Slice: Name 131. Named closed subset is now five live modules on the ElabMeet path. Mid-edit ElabMeetSubset hit 924 lines and failed the line-count story; settled land is **847** (under 880). Lake on the settled tree is exit 0 per the mop. This review is read-only on product. It does not re-run lake.

## Verdict table

| Check | Result |
|-------|--------|
| 1. TDD order | Pass |
| 2. Extract-first / no fifth cloned walker | Pass |
| 3. Isolation | Pass |
| 4. Bad path (temp Erasure + planted type error after Mult) | Pass |
| 5. Barrel list + compile Mult first | Pass |
| 6. Pins stay false | Pass |
| 7. elabMeetReady fold | Pass |
| 8. Nix tokens | Pass |
| 9. ElabMeetCompile not grown | Pass |
| 10. Residual lockstep | Pass |
| 11. No Linear, no IrProgram | Pass |

## 1. TDD order

Theorems landed first in `src/systems/SystemsLean/ElabMeetTheorems.lean`:

- `elabMeetDrivesNamedErasureSubset_true`
- `elabMeetAcceptsGoodNamedErasureSubset_true`
- `elabMeetRejectsBadNamedErasureSubset_true`
- `elabMeetRejectsOldWalkAsNamedErasureSubset_true`

Each is still `= true := by native_decide`. Expects were not rewritten.

Observed red (`/tmp/grok-1000/l3-tdd-red-erasure.md`):

```
cd /home/hunter/Projects/ai/iso/src/systems
lake build SystemsLean.ElabMeetTheorems
```

Exit **1**. Reason: expected type must not contain free variables (the four probe Bools were unknown). Same shape as the TypesTheorems red.

Observed green (`/tmp/grok-1000/l3-tdd-green-erasure.md`): same command, same four theorems, exit **0**.

## 2. Extract-first

No fifth ~300-line cloned walker.

Shared helper: `tryCompileNamedMemberListIO` in `src/systems/SystemsLean/ElabMeetSubset.lean`. Path, barrel, and compile fold live there. Three-module `tryCompileNamedClosedSubsetIO` and four-module `tryCompileNamedTypesTheoremsSubsetIO` are wrappers. Five-module `tryCompileNamedErasureSubsetIO` is another wrapper.

Settled line counts match the mop:

| File | Lines |
|------|-------|
| ElabMeetSubset.lean | **847** (under 880) |
| ElabMeetCompile.lean | **916** |
| ElabMeet.lean | **618** |
| ElabMeetTheorems.lean | **403** |

A new probe on ElabMeetSubset would pass about 880. Name 132 correctly requires extract first.

## 3. Isolation

`#elabMeetNamedErasureSubsetProbe` records:

- leftover temp `good.lean` (`def n : Nat := 0`) is false on this walker
- leftover fake `lean_lib ElabMeetRichLib` is false on this walker
- prior four-module walker `tryCompileNamedTypesTheoremsSubset` still succeeds on the live lakefile

Drive is `good && !bad && isolation`. Isolation is live Mult still ok, live MultTheorems still ok, prior four-module still ok, and the two leftover cases false.

The five-module walker requires Erasure in the membership list and compile order. The four-module walker does not. That satisfies the contract's OR (four-module still succeeds while this walk requires Erasure).

## 4. Bad path

Bad writes a temp copy of live `SystemsLean/Erasure.lean` plus:

```
def plantedTypeError : Nat := true
```

It compiles that sidecar after Mult `.olean` via `tryCompileAfterErasureDeps`, which is a wrapper over `tryCompileTheoremsAfterLiveMult`. That matches Erasure's import graph (Erasure imports only Mult). Live `src/systems/SystemsLean/Erasure.lean` still imports only `SystemsLean.Mult` and does not contain `plantedTypeError`.

## 5. Barrel list and compile order

`namedClosedErasureSubsetNames` and `namedClosedErasureCompileOrder` are:

SystemsLean.Mult, SystemsLean.Types, SystemsLean.MultTheorems, SystemsLean.TypesTheorems, SystemsLean.Erasure.

`tryCompileNamedMemberListIO` still rejects a compile order that does not start with SystemsLean.Mult. Compile then walks the rest after the search path is pushed.

On this slice the membership list and the compile-order list happen to be the same sequence. That is honest: both lists still exist, Mult is first, and the helper still treats them as distinct arguments. The three-module and four-module lists remain different from each other.

## 6. Pins stay false

Verified in product Lean:

- `slakeOwnsPackageTypecheck := false` (`ElabMeet.lean`)
- `elabMeetFullHostElaborateRemains := false` (`ElabMeet.lean`)
- `hostResidualShrinkFullHostElaborateRemains := false`
- `llvmCfgFixtureDominanceClaimed := false`
- `llvmMultSsaFullBackendClaimed := false` (band FullBackend)

Honesty theorems still prove the two ElabMeet pins false.

## 7. elabMeetReady

`elabMeetReady` still starts with `!slakeOwnsPackageTypecheck` and `!elabMeetFullHostElaborateRemains`. It folds the four new Erasure Bools, including the drive Bool `elabMeetDrivesNamedErasureSubset`. Prior TypesTheorems conjuncts remain.

## 8. Nix

`nix/systems-host-presence/host-specs-hold-close.nix` keeps the TypesTheorems token block and adds a parallel Erasure block (`findLiveErasurePath` through `SystemsLean.Erasure`). ElabMeetTheorems keeps the four TypesTheorems theorem tokens and adds the four Erasure theorem tokens. Mop reports `just systems-host` exit 0.

## 9. ElabMeetCompile

`src/systems/SystemsLean/ElabMeetCompile.lean` still ends at line 916 (`end SystemsLean.ElabMeet`). No new API. Subset walks reuse `tryCompileOnDiskModuleIO`.

## 10. Residual lockstep

Name 131 is **done**. Name 132 is **open**, prefer SystemsLean.ErasureTheorems. Metric **5 of about 206** (Mult, Types, MultTheorems, TypesTheorems, Erasure). Extract first is documented because 847 would pass about 880 on the next probe.

Surfaces checked: `RESIDUAL-systems.md` (Done archive + Open Name 132), `RESIDUAL.md` join table, `WATCHER.md`, `doc/SESSION-HANDOFF.md`, `AGENTS.md` remaining-work line, `.agents/plans/plan-slake-replaces-lake.md` living tip. Leftover both-lessons 88/206 is still leftover seed, not this metric.

## 11. No Linear, no IrProgram

Neither name appears in the Erasure membership or compile-order lists. Header and residual say Linear and IrProgram are not in this close. Next preferred module is ErasureTheorems (imports Mult + Erasure).

## Notes (not blocking)

- Mid-write 905/924 was not the land. Review against settled 847.
- Inventory suggested planting after four-module deps. The review contract and the live import graph both want Mult only. The implementer followed that.
- The three probes still duplicate temp-dir and cleanup boilerplate. That is probe surface, not a fifth compile walker. Name 132 extract should move a role module before another probe.

## Next

Name 132: extract a role module from ElabMeetSubset first, then grow the named closed subset with SystemsLean.ErasureTheorems. Reuse `tryCompileNamedMemberListIO`. Do not grow ElabMeetCompile. `slakeOwnsPackageTypecheck` stays false.
