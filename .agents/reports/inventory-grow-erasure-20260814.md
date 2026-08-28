# Inventory: grow named closed subset with SystemsLean.Erasure

Read-only inventory for Name 131. Do not implement. Do not flip pins.

## 1. Current named closed subset (4 of about 206)

Live members Slake typechecks on the ElabMeet path:

| Module | Imports | Role |
|--------|---------|------|
| SystemsLean.Mult | none | `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/Mult.lean` |
| SystemsLean.MultTheorems | Mult only | line 42 of MultTheorems.lean |
| SystemsLean.Types | Mult only | line 71 of Types.lean |
| SystemsLean.TypesTheorems | Mult, MultTheorems, Types | lines 49-51 of TypesTheorems.lean |

Name lists are membership (import-closed). Compile order is different: Mult first, push search path, then Types, then MultTheorems, then TypesTheorems. Header at ElabMeetSubset.lean lines 21-31 already states this. Do not treat the List order as compile order.

### ElabMeetSubset.lean

Path: `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/ElabMeetSubset.lean`
Line count: **667** (ends at `end SystemsLean.ElabMeet`). Same namespace `SystemsLean.ElabMeet`. Imports Lean, ElabMeetCompile, ElabMeetLive (lines 83-85).

**Three-module walk (Name 129)**

| Kind | Name | Lines |
|------|------|-------|
| names | `namedClosedSubsetNames` | 94-95 |
| barrel | `barrelListsNamedSubset` | 164-176 |
| live Types path | `findLiveTypesPath` | 130-137 |
| compile IO | `tryCompileNamedClosedSubsetIO` | 184-244 |
| safe + wrapper | `tryCompileNamedClosedSubsetIOSafe`, `tryCompileNamedClosedSubset` | 246-257 |
| leftover fake | `leftoverFakePackageLakefileText` | 261-262 (`lean_lib ElabMeetRichLib`) |
| probe | `#elabMeetNamedSubsetProbe` | 271-351 |
| invoke + examples | 353-358 |

Probe Bools: `elabMeetAcceptsGoodNamedSubset`, `elabMeetRejectsBadNamedSubset`, `elabMeetRejectsOldWalkAsNamedSubset`, `elabMeetDrivesNamedSubset`.

Compile order in IO: Mult, search path, Types, MultTheorems. Bad path plants on a Types copy via `tryCompileTheoremsAfterLiveMult`. Isolation: live Mult + live MultTheorems still compile; this walker is false on leftover temp `good.lean` and leftover fake lakefile.

**Four-module TypesTheorems walk (Name 130, the ~330-line clone)**

Region **360-665 = 306 lines** (header claimed ~330).

| Kind | Name | Lines |
|------|------|-------|
| live path | `findLiveTypesTheoremsPath` | 365-372 |
| names | `namedClosedTypesTheoremsSubsetNames` | 377-382 |
| barrel | `barrelListsNamedTypesTheoremsSubset` | 387-400 |
| compile IO | `tryCompileNamedTypesTheoremsSubsetIO` | 411-481 |
| safe + wrapper | `tryCompileNamedTypesTheoremsSubsetIOSafe`, `tryCompileNamedTypesTheoremsSubset` | 483-494 |
| planted deps | `tryCompileAfterTypesTheoremsDepsIO` / `...Safe` / `tryCompileAfterTypesTheoremsDeps` | 502-555 |
| probe | `#elabMeetNamedTypesTheoremsSubsetProbe` | 565-658 |
| invoke + examples | 660-665 |

Probe Bools: `elabMeetAcceptsGoodNamedTypesTheoremsSubset`, `elabMeetRejectsBadNamedTypesTheoremsSubset`, `elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset`, `elabMeetDrivesNamedTypesTheoremsSubset`.

Isolation (lines 616-618): live Mult still ok, live MultTheorems still ok, **prior three-module** `tryCompileNamedClosedSubset` still ok, leftover temp `good.lean` false, leftover fake `ElabMeetRichLib` false. Bad plants on a TypesTheorems copy after Mult+Types+MultTheorems oleans.

**Shared live paths** (from ElabMeetLive, not this file): `findLiveMultPath` at ElabMeetLive.lean:72, `findLiveMultTheoremsPath` at ElabMeetLive.lean:87. Shared lakefile/barrel: `findLiveLakefilePath` 102-109, `findLiveBarrelPath` 116-123, `parseRealLakeLibraryName` 143-159. Library name must be exactly `SystemsLean`. Barrel requires exact trimmed lines `import SystemsLean.<Member>`.

**.olean** files go under a temp dir, never under `src/systems`. `srcPath` must be the live lakefile or the walker is false.

### ElabMeetTheorems.lean (four TypesTheorems theorems)

Path: `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/ElabMeetTheorems.lean` (**382** lines). Import of ElabMeetSubset at line 42.

| Theorem | Statement | Lines |
|---------|-----------|-------|
| `elabMeetDrivesNamedTypesTheoremsSubset_true` | `elabMeetDrivesNamedTypesTheoremsSubset = true` | 363-365 |
| `elabMeetAcceptsGoodNamedTypesTheoremsSubset_true` | `elabMeetAcceptsGoodNamedTypesTheoremsSubset = true` | 368-370 |
| `elabMeetRejectsBadNamedTypesTheoremsSubset_true` | `elabMeetRejectsBadNamedTypesTheoremsSubset = true` | 373-375 |
| `elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset_true` | `elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset = true` | 378-380 |

Each is `native_decide`. Three-module theorems sit just above at 343-360.

### ElabMeet.lean fold

Path: `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/ElabMeet.lean` (**612** lines).

- Import ElabMeetSubset: line 363.
- Pins: `slakeOwnsPackageTypecheck : Bool := false` (385), `elabMeetFullHostElaborateRemains : Bool := false` (389).
- Comment cites both probes: 451-454.
- `elabMeetReady` folds the four TypesTheorems Bools at 586-589. Add four Erasure Bools here only.
- Honesty theorems stay false: 593-598.

### ElabMeetCompile.lean -- reuse, do not grow

Path: `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/ElabMeetCompile.lean` (**916** lines, ends 916).

```
unsafe def tryCompileOnDiskModuleIO (srcPath : System.FilePath)
    (libMod : Name) (dir : System.FilePath) : IO Bool
```

Lines 151-178. Safe twin: `tryCompileOnDiskModuleIOSafe` 181-182. CommandElab wrapper: `tryCompileOnDiskModule` 186-191. Every subset walker already calls the unsafe IO. Do **not** add API or grow this file.

## 2. Erasure module

`/home/hunter/Projects/ai/iso/src/systems/SystemsLean/Erasure.lean` imports **only** `SystemsLean.Mult` (line 55). Not Linear. Not IrProgram.

Barrel `/home/hunter/Projects/ai/iso/src/systems/SystemsLean.lean` lines 40-54:

```
Mult, MultTheorems, Linear, LinearTheorems, Types, TypesTheorems,
IrProgram, IrProgramTheorems, IrGraph, IrGraphTheorems,
Erasure, ErasureTheorems, Extract, ExtractTheorems, HostCompose, ...
```

Nearby imports (Mult-adjacent means "imports Mult", not merely import-closed):

| Module | Import lines | Mult-adjacent? | Closed if subset has |
|--------|--------------|----------------|----------------------|
| Linear | **none** (namespace at Linear.lean:79) | no (residual skip) | itself |
| IrProgram | Types only (IrProgram.lean:63) | no (WATCHER skip) | Types |
| IrGraph | Mult, Types, IrProgram | would need Program | those three |
| **Erasure** | Mult only | **yes -- this slice** | Mult |
| ErasureTheorems | Mult, Erasure (45-46) | yes after Erasure | Mult + Erasure |
| Extract | Mult, Erasure (68-69) | yes after Erasure | Mult + Erasure |
| ExtractTheorems | Mult, Erasure, Extract | yes after Extract | those three |
| HostCompose | Mult, Types, IrGraph, Erasure, Extract | no (needs Graph) | large |

**Next Mult-adjacent after this slice:** `SystemsLean.ErasureTheorems` (same theorems-companion pattern as TypesTheorems after Types). Then `SystemsLean.Extract`. Do not add Linear or IrProgram.

## 3. Extract vs generalize

ElabMeetSubset is 667. Cap ~880. Residual: extract first if a clone would pass ~880. A third 306-line clone would land ~973. That is over the cap.

**Approach A (prefer): generalize compile / path / barrel, keep three distinct probes.**

- One helper: live path from `SystemsLean/Foo.lean` + repo-root twin (folds `findLiveTypesPath` / `findLiveTypesTheoremsPath` / new Erasure).
- One helper: barrel contains `import` for each name in a `List String`.
- One helper: compile Mult first, push search path, then remaining members in a **compile-order list** (not the name-list order).
- Keep `namedClosedSubsetNames` (3) and `namedClosedTypesTheoremsSubsetNames` (4) as the prior probes' lists. Add `namedClosedErasureSubsetNames` = Mult, Types, MultTheorems, TypesTheorems, Erasure (membership) and a separate compile-order list Mult, Types, MultTheorems, TypesTheorems, Erasure.
- Keep `#elabMeetNamedSubsetProbe` and `#elabMeetNamedTypesTheoremsSubsetProbe` working. New Erasure isolation must call the **four-module** walker (`tryCompileNamedTypesTheoremsSubset`), same way four-module isolation calls the three-module walker.
- New probe Bools (mirror): `elabMeetDrivesNamedErasureSubset`, `elabMeetAcceptsGoodNamedErasureSubset`, `elabMeetRejectsBadNamedErasureSubset`, `elabMeetRejectsOldWalkAsNamedErasureSubset`.
- Planted sidecar: copy live Erasure + `def plantedTypeError : Nat := true`, compile after four-module deps.
- Estimated net if compile/path/barrel fold: **+110 to +160** on ElabMeetSubset (end ~780-830). ElabMeet fold +4 conjuncts (~+8). ElabMeetTheorems +4 theorems (~+20). Under 880.
- If the implementer clones the 306-line block instead, stop and use B.

**Approach B: long-file split first, then clone or add.**

Move TypesTheorems walk (360-665) to a role module, e.g. `ElabMeetSubsetTypes.lean` (same namespace). Leave 1-359 in ElabMeetSubset (~359). Put four-module + five-module walkers in the new file. Honest if A cannot share the probe without breaking isolation. Extra module + Nix file list. Larger than A if A actually generalizes.

**Do not grow ElabMeetCompile.**

## 4. Nix / gates

Presence SSoT: `/home/hunter/Projects/ai/iso/nix/systems-host-presence/host-specs-hold-close.nix`

ElabMeetSubset block lines **1689-1731**. TypesTheorems tokens to mirror for Erasure:

```
findLiveTypesTheoremsPath
namedClosedTypesTheoremsSubsetNames
barrelListsNamedTypesTheoremsSubset
tryCompileNamedTypesTheoremsSubset
tryCompileAfterTypesTheoremsDeps
elabMeetDrivesNamedTypesTheoremsSubset
elabMeetAcceptsGoodNamedTypesTheoremsSubset
elabMeetRejectsBadNamedTypesTheoremsSubset
elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset
elabMeetNamedTypesTheoremsSubsetProbe
SystemsLean.TypesTheorems
```

ElabMeetTheorems block lines **1734-1800**. Theorem tokens 1786-1789:

```
theorem elabMeetDrivesNamedTypesTheoremsSubset_true
theorem elabMeetAcceptsGoodNamedTypesTheoremsSubset_true
theorem elabMeetRejectsBadNamedTypesTheoremsSubset_true
theorem elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset_true
```

Also listed: `src/systems/SystemsLean/ElabMeetSubset.lean` in `host-leans.nix:434` and `required-files.nix:449` (no new file unless B extracts).

Live gate: `just systems-host` in `/home/hunter/Projects/ai/iso/just/gates.just` lines 80-81 (`nix eval` of `nix/systems-host-presence`). Flake check `systems-host-presence`. Lake: `lake build SystemsLean.ElabMeet` (+ helpers). `just hygiene`.

## 5. Residual lockstep (living tips, do not edit here)

| Surface | Living tip |
|---------|------------|
| RESIDUAL-systems.md Name 131 | **open**. Prefer Erasure. Metric 4 of about 206. Primary paths ElabMeetSubset / ElabMeet fold / ElabMeetTheorems / thin Nix. Extract first if 667 would pass ~880. |
| RESIDUAL.md Systems Open | Highest-value next is Grow the named closed subset. Same metric table. |
| WATCHER.md fence | `/implement --effort 2 Grow the named closed subset`. Isolation vs prior **four-module** walk. Metric 5 of about 206 if Erasure lands. |
| doc/SESSION-HANDOFF.md | Active: 4 of about 206. Next: Erasure. |
| plan-slake-replaces-lake.md | Living tip 2026-08-14: next grow prefers Erasure. |
| AGENTS.md | Remaining-work metric: **4 of about 206** (Mult, MultTheorems, Types, TypesTheorems). |

**Foldable nits (same slice if touching prose):** leftover-walk kitchen-sink counts **88 of 206** / **72 of 206** in Done archive rows are leftover seed both-lessons, not the named-subset metric. The leftover walk is closed. Name-list vs compile-order comment: keep them distinct in the new header.

Lockstep after implement: residual Open/Done, WATCHER fence, SESSION-HANDOFF, plan living tip, AGENTS remaining-work line, coordinator RESIDUAL.md table. Metric **5 of about 206** with Erasure named.

## 6. Pins that must stay false

| Pin | Current | Where |
|-----|---------|-------|
| `slakeOwnsPackageTypecheck` | **false** | ElabMeet.lean:385 |
| `elabMeetFullHostElaborateRemains` | **false** | ElabMeet.lean:389 |
| FullHostElaborateRemains (product claim) | **false** | same ElabMeet pin + `hostResidualShrinkFullHostElaborateRemains` HostResidualShrink.lean:227; DualResidual header: FullHost stays false |
| DominanceClaimed | **false** | `llvmCfgFixtureDominanceClaimed` LlvmCfgHonesty.lean:86 |
| band FullBackend | **false** | `llvmMultSsaFullBackendClaimed` etc. all false. Fixture tip `llvmCfgFixtureFullBackendClaimed` is **true** (A-light). Do not confuse tip with band. |

Also stay false this slice: DualResidual ownership flips, SpecProof, free/complete/PROVABLY (those stay **true** as already claimed). Do not plant errors in live Erasure.

## Recommended implement shape

1. Approach **A**: generalize path/barrel/compile; add Erasure as fifth member; new probe isolated against the four-module walker.
2. Reuse `tryCompileOnDiskModuleIO` only.
3. Mirror Nix tokens in `host-specs-hold-close.nix`.
4. Fold ElabMeetReady + four native_decide theorems.
5. Leave pins false. Metric 5 of about 206.
6. Document next preferred module as **ErasureTheorems** (imports Mult + Erasure).
