# Clone inventory: twentieth named closed subset (HostPackageRoots)

Read-only L3 inventory so Grow HostImportGraphSeeds can clone HostPackageRoots faithfully.
Date: 2026-08-16. No product edits.

Living Open after HostPackageRoots: **Grow HostImportGraphSeeds subset**
(WATCHER.md, RESIDUAL-systems.md Open, SESSION-HANDOFF.md Next). Do not rewrite those.

---

## 1. Role of the twentieth

| Item | Fact |
|------|------|
| Residual Name | Grow HostPackageRoots subset (**done** 2026-08-16) |
| Named members | **20 of about 206** |
| Tip module | `SystemsLean.HostPackageRoots` (pure leaf; **no** `import` lines) |
| Import-closed on | the prior nineteen |
| Probe | `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean` (**205** lines) |
| Walk home | `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean` (**622** lines). No dedicated `ElabMeetNamedWalkHostPackageRoots.lean`. |
| Theorems | `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/ElabMeetTheorems.lean` lines 703-721 |
| Shared helpers | `SystemsLean.ElabMeetNamedWalk` (`tryCompileNamedMemberListIO`, `tryCompileAfterNamedDepsIO`, `findLiveModulePath`, `barrelListsNamedMembers`, `leftoverFakePackageLakefileText`) |
| Namespace | `SystemsLean.ElabMeet` |

Members (plain names): Mult, MultTheorems, Types, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph, HostGraphTheorems, HostPackageWrite, HostPackageWriteTheorems, **HostPackageRoots**.

Skip as named members: Linear, IrGraph, HostGraphMain. IrGraph and HostCompose stay **compile dependencies only**.

---

## 2. Four Bool names (exact)

Defined by the isolation command in the twentieth probe (lines 189-196). Drive is `good && !badCompiled && isolation`.

1. `elabMeetDrivesNamedHostPackageRootsSubset`
2. `elabMeetAcceptsGoodNamedHostPackageRootsSubset`
3. `elabMeetRejectsBadNamedHostPackageRootsSubset`
4. `elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset`

Twenty-first clone (do not exist yet):

1. `elabMeetDrivesNamedHostImportGraphSeedsSubset`
2. `elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset`
3. `elabMeetRejectsBadNamedHostImportGraphSeedsSubset`
4. `elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset`

TDD: four theorems FIRST, all `= true := by native_decide`, **before** the Bools exist.

---

## 3. Four theorem names (exact)

`ElabMeetTheorems.lean` 703-721:

1. `elabMeetDrivesNamedHostPackageRootsSubset_true`
2. `elabMeetAcceptsGoodNamedHostPackageRootsSubset_true`
3. `elabMeetRejectsBadNamedHostPackageRootsSubset_true`
4. `elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset_true`

Each is `... = true := by native_decide`. Isolation theorem comment: leftover temp `good.lean` and leftover fake `lean_lib ElabMeetRichLib` stay false.

Twenty-first clone (WATCHER / residual Done when):

1. `elabMeetDrivesNamedHostImportGraphSeedsSubset_true`
2. `elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset_true`
3. `elabMeetRejectsBadNamedHostImportGraphSeedsSubset_true`
4. `elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset_true`

---

## 4. Isolation command spelling

Twentieth elab command (probe lines 93 and 198):

```
#elabMeetNamedHostPackageRootsSubsetProbe
```

Greppable companion required by Nix: `elabMeetNamedHostPackageRootsSubsetProbe`.

Twenty-first must be a **new** command, not an alias:

```
#elabMeetNamedHostImportGraphSeedsSubsetProbe
```

in a **new** file `ElabMeetNamedHostImportGraphSeedsProbe.lean`. Do not dump onto `ElabMeetNamedHostPackageRootsProbe.lean`.

### Isolation fold (twentieth, clone this shape)

```
isolation :=
  liveMultStillOk && liveThmStillOk && priorSubsetStillOk
    && !thisOnTempSnippet && !thisOnFakePackage
    && notAliasOfNineteenth
```

| Check | How twentieth does it | Twenty-first clone |
|-------|----------------------|--------------------|
| leftover temp `good.lean` | write `isoDir / "good.lean"` as `"def n : Nat := 0"`; `tryCompileNamedHostPackageRootsSubset goodIso isoDir` must be **false** | same snippet; call **this** walk (`tryCompileNamedHostImportGraphSeedsSubset`) |
| leftover fake package | write `leftoverFakePackageLakefileText` (`lean_lib ElabMeetRichLib` / `module ElabMeetRichLib`) to `fakeDir / "lakefile.lean"`; this walk on fake lake must be **false** | same helper; this walk on fake lake false |
| prior subset still succeeds | `tryCompileNamedHostPackageWriteTheoremsSubset liveLake subsetIsoDir` | `tryCompileNamedHostPackageRootsSubset liveLake subsetIsoDir` |
| not an alias of prior | names != nineteenth names **and** compile order != nineteenth compile order **and** this names contain `SystemsLean.HostPackageRoots` **and** nineteenth names do **not** | names != twentieth names **and** compile order != twentieth compile order **and** this names contain `SystemsLean.HostImportGraphSeeds` **and** twentieth names do **not** |
| live Mult / MultTheorems | `tryCompileLiveModule` / `tryCompileLiveTheorems` still true | keep |
| do not plant live tip | planted bad is a **temp** copy `ElabMeetNamedHostPackageRootsSubsetBad.lean` with `\ndef plantedTypeError : Nat := true\n` after live text; compile via `tryCompileAfterHostPackageRootsDeps` | temp `ElabMeetNamedHostImportGraphSeedsSubsetBad.lean`; compile via `tryCompileAfterHostImportGraphSeedsDeps` |

Prior-walker still-succeeds is **required**. Nineteenth leftover isolation vs eighteenth used `tryCompileNamedHostPackageWriteSubset`. Twentieth leftover isolation vs nineteenth uses `tryCompileNamedHostPackageWriteTheoremsSubset`. Twenty-first leftover isolation vs twentieth uses `tryCompileNamedHostPackageRootsSubset`.

---

## 5. Wrapper function names (visible)

All in `ElabMeetNamedWalkHostPackageWrite.lean` (namespace `SystemsLean.ElabMeet`):

| Role | Twentieth name |
|------|----------------|
| live path | `findLiveHostPackageRootsPath` |
| membership list | `namedClosedHostPackageRootsSubsetNames` |
| compile order | `namedClosedHostPackageRootsCompileOrder` |
| barrel check | `barrelListsNamedHostPackageRootsSubset` |
| compile subset (unsafe IO) | `tryCompileNamedHostPackageRootsSubsetIO` |
| compile subset (opaque) | `tryCompileNamedHostPackageRootsSubsetIOSafe` |
| compile subset (CommandElab) | `tryCompileNamedHostPackageRootsSubset` |
| after-deps (unsafe IO) | `tryCompileAfterHostPackageRootsDepsIO` |
| after-deps (opaque) | `tryCompileAfterHostPackageRootsDepsIOSafe` |
| after-deps (CommandElab) | `tryCompileAfterHostPackageRootsDeps` |

Ten HostPackageRoots-specific defs. Shared walker: `tryCompileNamedMemberListIO` / `tryCompileAfterNamedDepsIO`. Do not clone the walker body.

Twenty-first wrappers (new module): same ten names with `HostImportGraphSeeds` in place of `HostPackageRoots`.

---

## 6. Wrapper-block size / extract decision

File: `ElabMeetNamedWalkHostPackageWrite.lean`.

| Block | Lines | Count |
|-------|-------|-------|
| Eighteenth HostPackageWrite wrappers | 109-277 | 169 |
| Nineteenth HostPackageWriteTheorems wrappers | 279-447 | 169 |
| Twentieth HostPackageRoots wrappers | **449-620** | **172** |
| Whole file now | 1-622 | **622** |

Residual records the walk at **434** after the nineteenth. After the twentieth it is **622**. File delta for the twentieth clone: **622 - 434 = 188** (172 function lines plus header/greppable comment growth at the top of the same file).

Twenty-first extract bar for that walk is **about 780**.

- 622 + another 169-to-188 family = about **791 to 810**, **over** 780.
- Residual / WATCHER already require: twenty-first wrappers **MUST** extract to `ElabMeetNamedWalkHostImportGraphSeeds.lean` unless the add would stay under about 780. It will not.
- Do **not** grow Tail (**863**) or Later (**785**). HostTerm walk (**841**) stays. HostGraphTheorems walk (**191**) stays. HostPackageWrite walk stays **622**.
- Twentieth probe stays **205**. Twenty-first probe is a **new** `ElabMeetNamedHostImportGraphSeedsProbe.lean` (expect about 205).
- Do not grow `ElabMeetCompile.lean` (**916**).

---

## 7. Membership list (barrel order among the twenty; HostPackageRoots last)

`namedClosedHostPackageRootsSubsetNames` (walk 462-483). Order is **barrel order among the twenty**, not compile order, not full barrel order. Linear and IrGraph are omitted.

```
SystemsLean.Mult
SystemsLean.MultTheorems
SystemsLean.Types
SystemsLean.TypesTheorems
SystemsLean.IrProgram
SystemsLean.IrProgramTheorems
SystemsLean.Erasure
SystemsLean.ErasureTheorems
SystemsLean.Extract
SystemsLean.ExtractTheorems
SystemsLean.HostTerm
SystemsLean.HostFrontGoldens
SystemsLean.HostFront
SystemsLean.HostFrontTheorems
SystemsLean.HostCheck
SystemsLean.HostGraph
SystemsLean.HostGraphTheorems
SystemsLean.HostPackageWrite
SystemsLean.HostPackageWriteTheorems
SystemsLean.HostPackageRoots
```

Barrel cites: `src/systems/SystemsLean.lean` import 108 is `import SystemsLean.HostPackageRoots`. Next import 109 is already `import SystemsLean.HostImportGraphSeeds` (product module exists; not yet a named-subset member). Probe import site: barrel line 332 `import SystemsLean.ElabMeetNamedHostPackageRootsProbe`. `ElabMeet.lean` also imports the probe at 406. `ElabMeetTheorems.lean` imports it at 62.

Twenty-first membership: the twenty above, then `SystemsLean.HostImportGraphSeeds` last.

`HostImportGraphSeeds.lean` has **no** `import` lines (pure leaf; import-closed on the 20).

---

## 8. Compile-order extra-dep list (verbatim)

`namedClosedHostPackageRootsCompileOrder` (walk 490-539). Nineteenth compile order, then HostPackageRoots last. Mult first. IrGraph and HostCompose are compile dependencies only.

Named members in compile order, then extra-deps after `HostGraphTheorems`:

```
SystemsLean.Mult
SystemsLean.Types
SystemsLean.MultTheorems
SystemsLean.TypesTheorems
SystemsLean.Erasure
SystemsLean.ErasureTheorems
SystemsLean.Extract
SystemsLean.ExtractTheorems
SystemsLean.IrProgram
SystemsLean.IrProgramTheorems
SystemsLean.HostTerm
SystemsLean.HostFrontGoldens
SystemsLean.HostFront
SystemsLean.HostFrontTheorems
SystemsLean.HostCheck
SystemsLean.HostGraph
SystemsLean.HostGraphTheorems
SystemsLean.IrGraph
SystemsLean.HostCompose
SystemsLean.CompilePath
SystemsLean.EmitMultScaffold
SystemsLean.EmitLinearScaffold
SystemsLean.EmitTypesScaffold
SystemsLean.EmitProgramScaffold
SystemsLean.EmitGraphScaffold
SystemsLean.EmitComposeScaffold
SystemsLean.EmitMult
SystemsLean.EmitLinear
SystemsLean.EmitTypes
SystemsLean.EmitProgram
SystemsLean.EmitGraph
SystemsLean.EmitCompose
SystemsLean.CompilePathMult
SystemsLean.CompilePathLinear
SystemsLean.CompilePathTypes
SystemsLean.CompilePathProgram
SystemsLean.CompilePathGraph
SystemsLean.CompilePathCompose
SystemsLean.FirstSurface
SystemsLean.MultSubsetEmit
SystemsLean.LinearSubsetEmit
SystemsLean.TypesSubsetEmit
SystemsLean.ProgramSubsetEmit
SystemsLean.GraphSubsetEmit
SystemsLean.ComposeSubsetEmit
SystemsLean.HostPackageWrite
SystemsLean.HostPackageWriteTheorems
SystemsLean.HostPackageRoots
```

Extra-dep block after HostGraphTheorems, in order: **IrGraph, HostCompose, CompilePath, six emit scaffolds, six emit bodies, six CompilePath units, FirstSurface, six SubsetEmit, HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots last**.

Twenty-first compile order: this list, then `SystemsLean.HostImportGraphSeeds` last.

---

## 9. After-deps for twentieth (verbatim)

`tryCompileAfterHostPackageRootsDepsIO` (walk 583-605). Nineteenth after-deps **plus** `HostPackageWriteTheorems`. HostPackageRoots itself has no imports; the planted sidecar still needs the HostPackageWrite / SubsetEmit closure.

```
SystemsLean.Mult
SystemsLean.Types
SystemsLean.IrProgram
SystemsLean.IrGraph
SystemsLean.Erasure
SystemsLean.Extract
SystemsLean.HostCompose
SystemsLean.CompilePath
SystemsLean.EmitMultScaffold
SystemsLean.EmitLinearScaffold
SystemsLean.EmitTypesScaffold
SystemsLean.EmitProgramScaffold
SystemsLean.EmitGraphScaffold
SystemsLean.EmitComposeScaffold
SystemsLean.EmitMult
SystemsLean.EmitLinear
SystemsLean.EmitTypes
SystemsLean.EmitProgram
SystemsLean.EmitGraph
SystemsLean.EmitCompose
SystemsLean.CompilePathMult
SystemsLean.CompilePathLinear
SystemsLean.CompilePathTypes
SystemsLean.CompilePathProgram
SystemsLean.CompilePathGraph
SystemsLean.CompilePathCompose
SystemsLean.FirstSurface
SystemsLean.HostTerm
SystemsLean.HostFrontGoldens
SystemsLean.HostFront
SystemsLean.HostGraph
SystemsLean.MultSubsetEmit
SystemsLean.LinearSubsetEmit
SystemsLean.TypesSubsetEmit
SystemsLean.ProgramSubsetEmit
SystemsLean.GraphSubsetEmit
SystemsLean.ComposeSubsetEmit
SystemsLean.HostPackageWrite
SystemsLean.HostPackageWriteTheorems
```

Twenty-first after-deps (WATCHER / residual): Mult first, then HostPackageRoots, and HostPackageWriteTheorems real deps if the planted sidecar needs them (HostFront, HostGraph, MultSubsetEmit through ComposeSubsetEmit, HostPackageWrite, HostPackageWriteTheorems). Faithful clone of this list: **this list plus `SystemsLean.HostPackageRoots`**.

---

## 10. Probe mechanics to clone

File: `ElabMeetNamedHostPackageRootsProbe.lean` (205). Imports: `Lean`, `ElabMeetLive`, `ElabMeetNamedWalk`, `ElabMeetNamedWalkHostPackageWrite`.

1. Find live lakefile, Mult, MultTheorems, live tip (`findLiveHostPackageRootsPath`).
2. Temp dirs: olean, bad, iso, fake, thmIso, subsetIso.
3. Good: `tryCompileNamedHostPackageRootsSubset liveLake oleanDir`.
4. Bad: copy live tip + planted `def plantedTypeError : Nat := true`; `tryCompileAfterHostPackageRootsDeps badPath badDir \`ElabMeetNamedHostPackageRootsSubsetBad`.
5. Isolation as in section 4.
6. Cleanup all temp dirs.
7. Emit four Bool defs via `elabCommand`.
8. Run `#elabMeetNamedHostPackageRootsSubsetProbe`.
9. Four `example : ... = true := rfl` (not the theorems; theorems live in ElabMeetTheorems).

`tryCompileNamedMemberListIO` (NamedWalk 225+) is false unless `srcPath` is the **live** lakefile, parsed library is `SystemsLean`, and the barrel lists every member. That is why leftover `good.lean` and leftover fake `ElabMeetRichLib` stay false.

---

## 11. ElabMeet fold (honesty pins stay false)

`ElabMeet.lean`:

- `slakeOwnsPackageTypecheck : Bool := false` (429)
- `elabMeetFullHostElaborateRemains : Bool := false` (433)
- Ready fold includes the four twentieth Bools at 728-731. Twenty-first must append the four new Bools to `elabMeetReady` (fold only; do not grow Compile).
- Honesty theorems stay `= false := by native_decide` (735-740).

Pins that stay **false** (do not flip):

- `slakeOwnsPackageTypecheck`
- `elabMeetFullHostElaborateRemains`
- `FullHostElaborateRemains`
- `hostResidualShrinkFullHostElaborateRemains`
- `llvmCfgFixtureDominanceClaimed`
- `llvmMultSsaFullBackendClaimed`

Stay **true** (do not flip): product residual free, freestanding product self-host complete, PROVABLY, DualResidual `residualFreeClaimed`. SpecProof `residualFreeClaimed` stays **false**. SpecProof `proofCompleteClaimed` stays **true**. Leftover seed walk stays **closed**. Do not invent a leftover-walk Name. Do not open Grow HostImportGraph.

---

## 12. Nix citations

### required-files.nix

`/home/hunter/Projects/ai/iso/nix/systems-host-presence/required-files.nix` lines 473-474:

```
  # Twentieth HostPackageRoots named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean"
```

Walk file already listed at 460. Twenty-first must add a new probe path (and a new walk path if extracted).

### host-leans.nix

`/home/hunter/Projects/ai/iso/nix/systems-host-presence/host-leans.nix` lines 458-459:

```
  # Twentieth HostPackageRoots named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean"
```

Walk file already listed at 445.

### host-specs-hold-close.nix

`/home/hunter/Projects/ai/iso/nix/systems-host-presence/host-specs-hold-close.nix`:

| Block | Lines | Tokens |
|-------|-------|--------|
| ElabMeet helper Bool names | 1173-1176 | four `elabMeet*NamedHostPackageRootsSubset` |
| Walk helper tokens (same file as 18/19) | 2226-2234 | `findLiveHostPackageRootsPath`, `namedClosedHostPackageRootsSubsetNames`, `namedClosedHostPackageRootsCompileOrder`, `barrelListsNamedHostPackageRootsSubset`, `tryCompileNamedHostPackageRootsSubset`, `tryCompileAfterHostPackageRootsDeps`, `SystemsLean.HostPackageRoots` |
| Probe spec | 2297-2321 | module + six wrappers + four Bools + `elabMeetNamedHostPackageRootsSubsetProbe` + tip name + honesty strings |
| Theorem name strings | 2440-2443 | four `theorem elabMeet*NamedHostPackageRootsSubset_true` |

Twenty-first Nix: add probe (and new walk) to required-files and host-leans; add helper tokens, a new probe spec block, four theorem strings, and four ElabMeet Bool names. Do not remove twentieth tokens.

---

## 13. Barrel import sites

`/home/hunter/Projects/ai/iso/src/systems/SystemsLean.lean`:

- Line 108: `import SystemsLean.HostPackageRoots` (product; already there)
- Line 109: `import SystemsLean.HostImportGraphSeeds` (product; already there; not a named-subset member yet)
- Line 332: `import SystemsLean.ElabMeetNamedHostPackageRootsProbe`

Twenty-first adds `import SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe` next to 332. Do not add a second HostImportGraphSeeds product import.

---

## 14. Line-count snapshot (residual after twentieth)

| File | Lines |
|------|-------|
| ElabMeet | 755 |
| ElabMeetCompile | 916 (do not grow) |
| ElabMeetSubset | 865 |
| ElabMeetNamedWalk | 322 |
| ElabMeetNamedWalkLater | 785 |
| ElabMeetNamedWalkTail | 863 |
| ElabMeetNamedWalkHostTerm | 841 |
| ElabMeetNamedWalkHostGraphTheorems | 191 |
| ElabMeetNamedWalkHostPackageWrite | **622** |
| ElabMeetNamedHostPackageRootsProbe | **205** |
| ElabMeetNamedHostPackageWriteTheoremsProbe | 202 |
| ElabMeetTheorems | 723 |

---

## 15. Faithful twenty-first clone checklist

1. Theorems FIRST in `ElabMeetTheorems.lean` (four `HostImportGraphSeeds` names, `native_decide`). Do not rewrite them to finish green.
2. Extract-first: **new** `ElabMeetNamedWalkHostImportGraphSeeds.lean` (about 172-188 lines). Leave HostPackageWrite walk at 622.
3. **New** `ElabMeetNamedHostImportGraphSeedsProbe.lean` (clone 205-line twentieth probe). Isolation vs twentieth: leftover temp `good.lean` false, leftover fake `ElabMeetRichLib` false, `tryCompileNamedHostPackageRootsSubset` still succeeds, not an alias of the twentieth.
4. Membership: twenty names plus `SystemsLean.HostImportGraphSeeds` last (barrel order among the 21).
5. Compile order: twentieth compile order plus HostImportGraphSeeds last.
6. After-deps: twentieth after-deps plus `SystemsLean.HostPackageRoots`.
7. Fold four new Bools into `elabMeetReady` in `ElabMeet.lean`. Pins stay false.
8. Barrel: import the new probe. Nix: required-files, host-leans, host-specs-hold-close (helpers, probe spec, theorem strings, ElabMeet Bools).
9. Skip Linear, IrGraph, HostGraphMain. Do not open Grow HostImportGraph. Do not plant live `HostImportGraphSeeds.lean`.
10. Gates: `lake build SystemsLean.ElabMeetTheorems`; `lake build SystemsLean.ElabMeet`; `just hygiene`; `just professional-tone`; `just systems-host`.
