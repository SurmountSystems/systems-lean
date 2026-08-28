# Grow HostPackageWriteTheorems (19 of about 206) -- extract-first brief

Date: 2026-08-16. Read-only confirm from disk. No product edits.

Sources: `SystemsLean.lean` barrel, `HostPackageWriteTheorems.lean`,
`HostPackageWrite.lean` imports, eighteenth walk
`ElabMeetNamedWalkHostPackageWrite.lean` (exact compile order),
eighteenth probe `ElabMeetNamedHostPackageWriteProbe.lean`,
eighteenth theorems at the end of `ElabMeetTheorems.lean`,
grow-surface line counts, `nix/systems-host-presence/`, residual
Open Name Grow HostPackageWriteTheorems subset.

This slice adds `SystemsLean.HostPackageWriteTheorems` as the
nineteenth named ElabMeet subset member. HostPackageWriteTheorems
already exists as product Lean. Do not invent that module. Do not
plant a type error on the live file.

## Confirmed facts

### 1. Barrel order (skip Linear / skip IrGraph / skip HostGraphMain)

In `src/systems/SystemsLean.lean` import order around the grow tip
(lines 104-108):

| Order | Module | Role |
|------:|--------|------|
| ... | HostCheck | named grow (15) |
| ... | HostGraph | named grow (16) |
| ... | HostGraphTheorems | named grow (17) |
| prior tip | **HostPackageWrite** | named grow (18) -- landed |
| **this slice** | **HostPackageWriteTheorems** | named grow (19) |
| **after land** | **HostPackageRoots** | **twentieth neighbor** (next Open Name) |

- **HostGraphMain** is a lake exe root only. Not in the barrel. Do not add it.
- **Linear** and **IrGraph** stay skipped as *named grow tip* modules
  (they sit earlier in the barrel, or enter only as compile deps).
- After this land: **Grow HostPackageRoots subset**.

### 2. HostPackageWriteTheorems imports (import-closed on HostPackageWrite)

Path: `src/systems/SystemsLean/HostPackageWriteTheorems.lean`

Direct imports (line 43):

```
import SystemsLean.HostPackageWrite
```

`open` (not import) after that: HostFront, HostGraph, MultSubsetEmit,
LinearSubsetEmit, TypesSubsetEmit, ProgramSubsetEmit, GraphSubsetEmit,
ComposeSubsetEmit. Those namespaces arrive through HostPackageWrite.

**Verdict:** HostPackageWriteTheorems is **import-closed** on
HostPackageWrite and the prior eighteen named members. No new named
member is required for HostPackageWriteTheorems itself.

**Compile list is not "eighteen names then HostPackageWriteTheorems."**
HostPackageWrite is **not** import-closed on the prior seventeen. The
nineteenth walk must still compile HostPackageWrite's extra deps.

Path: `src/systems/SystemsLean/HostPackageWrite.lean` (lines 99-106):

```
import SystemsLean.HostFront
import SystemsLean.HostGraph
import SystemsLean.MultSubsetEmit
import SystemsLean.LinearSubsetEmit
import SystemsLean.TypesSubsetEmit
import SystemsLean.ProgramSubsetEmit
import SystemsLean.GraphSubsetEmit
import SystemsLean.ComposeSubsetEmit
```

HostFront and HostGraph are already named members. The six SubsetEmit
modules are not. Compiling live HostPackageWriteTheorems after only
Mult..HostPackageWrite **without** those extras will fail, because
HostPackageWrite still needs them.

#### Extra compile deps (from the eighteenth walker; do not guess)

Exact `namedClosedHostPackageWriteCompileOrder` after HostGraphTheorems
and before HostPackageWrite
(`ElabMeetNamedWalkHostPackageWrite.lean` 112-158):

```
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
```

**Honesty:** IrGraph and HostCompose stay **compile dependencies only**.
Do not sell this as Grow IrGraph or Grow HostCompose. Skip Linear.lean
as a named grow tip. **LinearSubsetEmit** is still required because
HostPackageWrite imports it.

#### Prior eighteen (named grow membership already landed)

Barrel-order membership among the eighteen (from
`namedClosedHostPackageWriteSubsetNames`):

```
Mult, MultTheorems, Types, TypesTheorems, IrProgram, IrProgramTheorems,
Erasure, ErasureTheorems, Extract, ExtractTheorems, HostTerm,
HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, HostPackageWrite
```

Compile order among those eighteen members (Mult first; extras omitted
here; HostPackageWrite last after the extra-dep block):

```
Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
Extract, ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, HostPackageWrite
```

#### Membership vs compile order for this slice

- **Named grow tip count after land:** **19 of about 206** = prior
  eighteen + `SystemsLean.HostPackageWriteTheorems` last.
- **Named membership list:** prior eighteen barrel order, then
  `SystemsLean.HostPackageWriteTheorems` last. Skip Linear, skip
  IrGraph, skip HostGraphMain.
- **Import-closed compile list:** eighteenth
  `namedClosedHostPackageWriteCompileOrder` (Mult first, then the
  seventeen compile order, then IrGraph / HostCompose / CompilePath /
  Emit scaffolds and bodies / CompilePath units / FirstSurface / six
  SubsetEmit / HostPackageWrite), then **HostPackageWriteTheorems last**.
- Prefer listing every live module the walker actually compiles in
  `namedClosedHostPackageWriteTheoremsCompileOrder`. Do not claim
  "closed on Mult..HostPackageWrite only" for the compile list.
- After-deps for the planted sidecar: eighteenth after-deps (Mult first,
  then Types / IrProgram / IrGraph / Erasure / Extract / HostCompose /
  CompilePath / Emit scaffolds and units / FirstSurface / HostTerm /
  HostFrontGoldens / HostFront / HostGraph / six SubsetEmit) **plus
  HostPackageWrite**, so a temp HostPackageWriteTheorems copy can
  import HostPackageWrite. Do **not** plant live
  `HostPackageWriteTheorems.lean`.

Exact eighteenth after-deps to extend
(`tryCompileAfterHostPackageWriteDepsIO`, lines 207-225):

```
SystemsLean.Mult, SystemsLean.Types,
SystemsLean.IrProgram, SystemsLean.IrGraph,
SystemsLean.Erasure, SystemsLean.Extract,
SystemsLean.HostCompose, SystemsLean.CompilePath,
SystemsLean.EmitMultScaffold, SystemsLean.EmitLinearScaffold,
SystemsLean.EmitTypesScaffold, SystemsLean.EmitProgramScaffold,
SystemsLean.EmitGraphScaffold, SystemsLean.EmitComposeScaffold,
SystemsLean.EmitMult, SystemsLean.EmitLinear,
SystemsLean.EmitTypes, SystemsLean.EmitProgram,
SystemsLean.EmitGraph, SystemsLean.EmitCompose,
SystemsLean.CompilePathMult, SystemsLean.CompilePathLinear,
SystemsLean.CompilePathTypes, SystemsLean.CompilePathProgram,
SystemsLean.CompilePathGraph, SystemsLean.CompilePathCompose,
SystemsLean.FirstSurface, SystemsLean.HostTerm,
SystemsLean.HostFrontGoldens, SystemsLean.HostFront,
SystemsLean.HostGraph, SystemsLean.MultSubsetEmit,
SystemsLean.LinearSubsetEmit, SystemsLean.TypesSubsetEmit,
SystemsLean.ProgramSubsetEmit, SystemsLean.GraphSubsetEmit,
SystemsLean.ComposeSubsetEmit
```

Nineteenth after-deps = that list, then `SystemsLean.HostPackageWrite`.

### 3. Line counts (last line on disk)

| File | Lines | Absorb nineteenth? |
|------|------:|--------------------|
| `ElabMeetSubset.lean` | **865** | **No.** Cannot take another thin probe (~+124 would pass ~880). |
| `ElabMeetCompile.lean` | **916** | **Must not grow.** |
| `ElabMeetNamedWalk.lean` | **322** | Shared helpers only. Reuse `tryCompileNamedMemberListIO`. Do not grow into a wrapper farm. |
| `ElabMeetNamedWalkLater.lean` | **785** | Do not grow. 785 + ~108 would pass ~880. |
| `ElabMeetNamedWalkTail.lean` | **863** | Do not grow. |
| `ElabMeetNamedWalkHostTerm.lean` | **841** | Do not grow. |
| `ElabMeetNamedWalkHostGraphTheorems.lean` | **191** | Stays the seventeenth walk. Do not put nineteenth wrappers here. |
| `ElabMeetNamedWalkHostPackageWrite.lean` | **242** | **MAY take nineteenth wrappers.** 242 + a stacked family of about 106-166 lands about 348-408, well under ~780 and under ~880. |
| `ElabMeetTheorems.lean` | **680** | Four `native_decide` theorems (~20 lines). Stays under 880. |
| `ElabMeet.lean` | **745** | Fold only (four `&&` Bools). |
| `ElabMeetNamedHostPackageWriteProbe.lean` | **205** | Do **not** dump HostPackageWriteTheorems onto the eighteenth probe. |

Nineteenth files that **do not exist yet** (confirmed absent):

- `ElabMeetNamedHostPackageWriteTheoremsProbe.lean`
- `ElabMeetNamedWalkHostPackageWriteTheorems.lean`

There is **no** `ElabMeetNamedWalkHostGraph.lean`. Do not name a walk that.

### 4. Extract-first decision (implementer contract)

| Role | Path | Decision |
|------|------|----------|
| Isolation probe | **NEW** `src/systems/SystemsLean/ElabMeetNamedHostPackageWriteTheoremsProbe.lean` | **Required.** Do not put on Subset, Compile, Tail, Later, HostTerm walk, HostGraphTheorems walk, or the eighteenth probe. |
| Wrappers | Stay on `ElabMeetNamedWalkHostPackageWrite.lean` | **Yes.** 242 + ~106-166 is about 348-408, under ~780. A new walk `ElabMeetNamedWalkHostPackageWriteTheorems.lean` is **not** needed. Extract that walk **only if** adding wrappers would pass ~780 (current evidence says it will not). |
| Walk name ban | -- | **Do not** name any walk `ElabMeetNamedWalkHostGraph`. |
| Shared walker | `ElabMeetNamedWalk.lean` | Reuse `tryCompileNamedMemberListIO` / `tryCompileAfterNamedDepsIO`. **No cloned walker.** Four-line wrappers. |

#### Helpers to add (mirror HostPackageWrite naming)

- `findLiveHostPackageWriteTheoremsPath`
- `namedClosedHostPackageWriteTheoremsSubsetNames`
- `namedClosedHostPackageWriteTheoremsCompileOrder`
- `barrelListsNamedHostPackageWriteTheoremsSubset`
- `tryCompileNamedHostPackageWriteTheoremsSubset` / `tryCompileNamedHostPackageWriteTheoremsSubsetIO` / `...IOSafe`
- `tryCompileAfterHostPackageWriteTheoremsDeps` / `...IO` / `...IOSafe`
- Bools from probe: `elabMeetDrivesNamedHostPackageWriteTheoremsSubset`, `elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset`, `elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset`, `elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset`
- Probe command: `#elabMeetNamedHostPackageWriteTheoremsSubsetProbe` / greppable `elabMeetNamedHostPackageWriteTheoremsSubsetProbe`

#### Theorems in `ElabMeetTheorems.lean` (all `= true := by native_decide`)

Land these four **first**, after the eighteenth HostPackageWrite theorems
(file currently ends at line 680):

```
theorem elabMeetDrivesNamedHostPackageWriteTheoremsSubset_true
theorem elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset_true
theorem elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset_true
theorem elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset_true
```

Red first is free-variable errors on those four Bools. Do not rewrite
the theorems to finish green.

#### Isolation (Name 113 law vs prior HostPackageWrite walk)

Drive fold must keep:

```
good && !badCompiled && isolation
```

Isolation must include the probe-decided conjunct:

```
isolation :=
  liveMultStillOk && liveThmStillOk && priorSubsetStillOk
    && !thisOnTempSnippet && !thisOnFakePackage
    && notAliasOfEighteenth
```

| Conjunct | Nineteenth meaning |
|----------|--------------------|
| `!thisOnTempSnippet` | leftover temp `good.lean` false (walker on `isoDir / "good.lean"` with `def n : Nat := 0` must fail) |
| `!thisOnFakePackage` | leftover fake `lean_lib ElabMeetRichLib` false (`leftoverFakePackageLakefileText` only; no live `lean_lib`) |
| `priorSubsetStillOk` | prior walker still succeeds: **`tryCompileNamedHostPackageWriteSubset`** |
| `notAliasOfEighteenth` | names != eighteenth names; compile order != eighteenth compile order; this list contains `SystemsLean.HostPackageWriteTheorems`; eighteenth list does not |
| `liveMultStillOk` / `liveThmStillOk` | live Mult and MultTheorems still compile |
| live product not planted | planted error is a **temp copy** (`ElabMeetNamedHostPackageWriteTheoremsSubsetBad.lean`), not live `HostPackageWriteTheorems.lean` |

Confirmed on disk today: no `**/good.lean` in the tree; no live
`lean_lib ElabMeetRichLib`; fake text is string-only in
`leftoverFakePackageLakefileText`. Live
`HostPackageWriteTheorems.lean` exists as product (theorems helper).
Isolation "not planted" means: do not append `plantedTypeError` to
that live file.

Eighteenth probe analog (`ElabMeetNamedHostPackageWriteProbe.lean`,
205 lines):

- Imports: Lean, ElabMeetLive, ElabMeetNamedWalk,
  ElabMeetNamedWalkHostGraphTheorems (prior walker),
  ElabMeetNamedWalkHostPackageWrite (this walk).
- Namespace: `SystemsLean.ElabMeet`.
- Command: `#elabMeetNamedHostPackageWriteSubsetProbe` then four
  `def` Bools, then four `example : BOOL = true := rfl`.
- Good: `tryCompileNamedHostPackageWriteSubset` on the **live lakefile**.
- Bad: read live HostPackageWrite, write temp sidecar +
  `def plantedTypeError : Nat := true`, compile via
  `tryCompileAfterHostPackageWriteDeps`. Missing live path treats
  bad as compiled (`true`) so reject fails closed.

Nineteenth probe is the same shape with:

- prior walker = `tryCompileNamedHostPackageWriteSubset`
- this walker = `tryCompileNamedHostPackageWriteTheoremsSubset`
- membership last = HostPackageWriteTheorems
- alias check vs eighteenth names/order
- after-deps = `tryCompileAfterHostPackageWriteTheoremsDeps`
- **NEW file.** Do not append onto the eighteenth probe.

#### Reuse (B): generalize, do not clone

Shared walker lives in `ElabMeetNamedWalk.lean` around line 225:

```
unsafe def tryCompileNamedMemberListIO
    (srcPath oleanDir : System.FilePath)
    (memberNames compileOrder : List String) : IO Bool
```

Requires live lakefile path equality, parsed library `SystemsLean`,
barrel lists every member, compile order starts with `SystemsLean.Mult`,
then compiles remaining members to oleans under `oleanDir`.

Eighteenth wrapper (`ElabMeetNamedWalkHostPackageWrite.lean` 174-192)
is a four-line call:

```
unsafe def tryCompileNamedHostPackageWriteSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostPackageWriteSubsetNames
    namedClosedHostPackageWriteCompileOrder
```

Nineteenth: add `tryCompileNamedHostPackageWriteTheoremsSubset` the
same way. After-deps wrap `tryCompileAfterNamedDepsIO`. **Do not clone
a walker.**

#### TDD order

1. Add the four theorems in `ElabMeetTheorems.lean` first so
   `lake build SystemsLean.ElabMeetTheorems` fails on unknown
   identifiers (observed red).
2. Implement wrappers + probe + barrel/ElabMeet fold + Nix presence.
3. Same command exit 0 (green). **Do not rewrite theorems** to finish green.

#### Wire-up

- Barrel `SystemsLean.lean`: import new probe near the other ElabMeet
  named modules (after `ElabMeetNamedHostPackageWriteProbe`). Do **not**
  add a new walk import; wrappers stay on the HostPackageWrite walk.
- `ElabMeet.lean`: import probe; fold the four Bools into the ready
  chain after the HostPackageWrite four (same pattern as lines 718-721).
- `ElabMeetTheorems.lean`: import probe so native_decide sees the Bools.
- Namespace stays `SystemsLean.ElabMeet`.

#### Nix (`nix/systems-host-presence/`) -- mirror HostPackageWrite land

| File | Add |
|------|-----|
| `required-files.nix` | new probe path only (no new walk file) |
| `host-leans.nix` | same probe path |
| `host-specs-hold-close.nix` | helpers / four Bools / four theorem names / probe module tokens |
| `host-specs-compile-path-2.nix` | only if dual-pin tokens for HostPackageWriteTheorems land require it (the product module already exists; this slice is ElabMeet named-subset) |

Do not invent a second presence home.

#### Pins stay (do not flip)

- `slakeOwnsPackageTypecheck` stays **false** (`ElabMeet.lean`)
- FullHost / `elabMeetFullHostElaborateRemains` stays **false**
- `hostResidualShrinkFullHostElaborateRemains` stays **false**
- LLVM dominance / full-backend pins stay **false**
  (`llvmCfgFixtureDominanceClaimed`, `llvmMultSsaFullBackendClaimed`)
- DualResidual `residualFreeClaimed` stays **true**
- DualResidual `hostElaboratorResidualFreeClaimed` stays **true**
- SpecProof `residualFreeClaimed` stays **false**
- SpecProof `proofCompleteClaimed` stays **true**
- Still not whole-package typecheck. Still not Lake gone.

#### Lake cwd

Lake from `/home/hunter/Projects/ai/iso/src/systems` only.

- `lake build SystemsLean.ElabMeetTheorems`
- `lake build SystemsLean.ElabMeet`
- `lake build SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe`

Repo-root gates: `just hygiene`; `just professional-tone`; `just systems-host`.

#### After-land lockstep (docs; leave AGENTS.md alone)

- Named subset **19 of about 206**
- Next Open Name: **Grow HostPackageRoots subset**
- Update: `WATCHER.md`, `doc/SESSION-HANDOFF.md`, `RESIDUAL.md`,
  `RESIDUAL-systems.md`, plan living tip if one tracks this series
- Do **not** edit `AGENTS.md` for this slice

### 5. Extract-first implement order

1. **Red:** four theorems in `ElabMeetTheorems.lean` (Bools missing).
2. **Wrappers:** HostPackageWriteTheorems helpers on
   `ElabMeetNamedWalkHostPackageWrite.lean` (242 -> about 348-408).
   Extract `ElabMeetNamedWalkHostPackageWriteTheorems.lean` only if
   that add would pass ~780.
3. **Probe:** new `ElabMeetNamedHostPackageWriteTheoremsProbe.lean` only.
4. **Wire:** barrel + ElabMeet fold + ElabMeetTheorems imports +
   pure Nix presence.
5. **Green:** same four theorems; lake from `src/systems` as above;
   `just hygiene`; `just professional-tone`; `just systems-host`.
6. **Lockstep docs** as above.

### 6. Paths the implementer may touch

- `src/systems/SystemsLean/ElabMeetTheorems.lean` (theorems first)
- `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean` (wrappers)
- **NEW** `src/systems/SystemsLean/ElabMeetNamedHostPackageWriteTheoremsProbe.lean`
- `src/systems/SystemsLean.lean` (barrel import of the new probe)
- `src/systems/SystemsLean/ElabMeet.lean` (import + ready fold)
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/host-specs-hold-close.nix`
- After land: `WATCHER.md`, `doc/SESSION-HANDOFF.md`, `RESIDUAL.md`,
  `RESIDUAL-systems.md`, plan living tip if present

Do not edit live `HostPackageWriteTheorems.lean` except if a greppable
token is already required and missing (it is not). Do not plant it.

### 7. Out of scope

- Grow HostPackageRoots (twentieth; next Name only)
- HostGraphMain, Linear as named grow tip, IrGraph as residual grow tip
- Whole-package typecheck; slakeOwnsPackageTypecheck true; FullHost; Lake gone
- Growing ElabMeetSubset / ElabMeetCompile / HostTerm walk / Tail / Later /
  HostGraphTheorems walk
- Cloning `tryCompileNamedMemberListIO`
- Planting live `HostPackageWriteTheorems.lean`
- Dumping the nineteenth probe onto `ElabMeetNamedHostPackageWriteProbe.lean`
- Extracting `ElabMeetNamedWalkHostPackageWriteTheorems.lean` unless
  wrappers would pass ~780
- Naming a walk `ElabMeetNamedWalkHostGraph`
- Growing C or shell
- AGENTS.md edits

### 8. Done when

- Named closed subset typechecks live HostPackageWriteTheorems via
  `tryCompileNamedMemberListIO`.
- Eighteen-plus-HostPackageWriteTheorems is **19 of about 206**.
- Accept good / reject planted error on a temp sidecar.
- Isolation vs the prior eighteen-module walk: leftover temp
  `good.lean` false; leftover fake `lean_lib ElabMeetRichLib` false;
  `tryCompileNamedHostPackageWriteSubset` still succeeds; nineteenth
  walk is not an alias of the eighteenth; live
  `HostPackageWriteTheorems.lean` was not planted.
- Four theorems landed first, all `= true := by native_decide`, not
  rewritten to finish green.
- Pins stay as section 4.
- Gates green: lake from `src/systems` (ElabMeetTheorems, ElabMeet,
  new probe); `just hygiene`; `just professional-tone`;
  `just systems-host`.
- Next Open Name is Grow HostPackageRoots.

---

## Parent return summary

| Field | Value |
|-------|--------|
| Brief paths | `/tmp/grok-1000/grok-brief-grow-hostpackagewritetheorems-20260816.md` and `/home/hunter/Projects/ai/iso/.agents/reports/brief-grow-hostpackagewritetheorems-20260816.md` (same content) |
| Confirmed nineteenth name | **HostPackageWriteTheorems** (`SystemsLean.HostPackageWriteTheorems`) |
| Next-after-nineteenth barrel neighbor | **HostPackageRoots** |
| Extract-first probe path | **NEW** `src/systems/SystemsLean/ElabMeetNamedHostPackageWriteTheoremsProbe.lean` |
| Wrappers on HostPackageWrite walk? | **Yes.** 242 -> about 348-408, under ~780. New walk not needed. |
| Import-closed vs extra compile deps | **Import-closed** on HostPackageWrite / the prior eighteen. **Compile list is not.** Reuse eighteenth compile order (IrGraph, HostCompose, CompilePath, Emit scaffolds/bodies, CompilePath units, FirstSurface, six SubsetEmit, HostPackageWrite), then HostPackageWriteTheorems last. |
| Line counts | Subset 865; Compile 916; NamedWalk 322; Later 785; Tail 863; HostTerm 841; HostGraphTheorems walk 191; HostPackageWrite walk 242; ElabMeetTheorems 680; ElabMeet 745; eighteenth probe 205 |
