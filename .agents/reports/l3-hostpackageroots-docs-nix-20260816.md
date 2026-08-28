# L3 harvest: Grow HostPackageRoots (20 of about 206)

Date: 2026-08-16. Read-only harvest. No product edits.

Briefs: `/tmp/grok-1000/grok-brief-grow-hostpackagewritetheorems-20260816.md`
and `.agents/reports/brief-grow-hostpackagewritetheorems-20260816.md`
are the same text. Closeout:
`.agents/reports/impl-grow-hostpackagewritetheorems-20260816.md`.

## Template skeleton (from nineteenth brief)

Pins that stay (do not flip):
- slakeOwnsPackageTypecheck false
- elabMeetFullHostElaborateRemains false
- hostResidualShrinkFullHostElaborateRemains / FullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false; llvmMultSsaFullBackendClaimed false
- DualResidual residualFreeClaimed true; hostElaboratorResidualFreeClaimed true
- SpecProof residualFreeClaimed false; SpecProof proofCompleteClaimed true
- Still not whole-package typecheck. Still not Lake gone.

Skip: Linear as named grow tip; IrGraph as named grow tip; HostGraphMain
(lake exe root, not in the barrel). Do not grow ElabMeetSubset (865),
ElabMeetCompile (916), NamedWalk (322 helpers only), Later (785), Tail
(863), HostTerm walk (841), HostGraphTheorems walk (191). Do not clone
tryCompileNamedMemberListIO. Do not plant live product. Do not edit
AGENTS.md.

TDD order: (1) four theorems in ElabMeetTheorems first so
`lake build SystemsLean.ElabMeetTheorems` fails on unknown Bools;
(2) wrappers + NEW probe + barrel/ElabMeet fold + Nix; (3) same
command exit 0. Do not rewrite theorems to finish green.

Lake cwd: `/home/hunter/Projects/ai/iso/src/systems` only.
- lake build SystemsLean.ElabMeetTheorems
- lake build SystemsLean.ElabMeet
- lake build SystemsLean.ElabMeetNamedHostPackageRootsProbe
Repo-root: just hygiene; just professional-tone; just systems-host.

Name 113 isolation analog (twentieth vs nineteenth):
Drive stays `good && !badCompiled && isolation`. Isolation:
liveMultStillOk && liveThmStillOk && priorSubsetStillOk &&
!thisOnTempSnippet && !thisOnFakePackage && notAliasOfNineteenth.
- leftover temp good.lean false (walker on isoDir / "good.lean" with
  def n : Nat := 0 must fail)
- leftover fake lean_lib ElabMeetRichLib false (string-only
  leftoverFakePackageLakefileText; no live lean_lib)
- priorSubsetStillOk = tryCompileNamedHostPackageWriteTheoremsSubset
- notAliasOfNineteenth: names/order != nineteenth; this list contains
  SystemsLean.HostPackageRoots; nineteenth list does not
- planted error is a temp sidecar, not live HostPackageRoots.lean

Metric after nineteenth land: **19 of about 206**. This slice bumps to
**20**. Nineteenth predicted next-after Name: Grow HostPackageRoots.

## Residual / WATCHER current tip

Grow HostPackageRoots is **already Open** (Name 146), not "next after
land."

- Name: Grow HostPackageRoots subset
- Goal: Add SystemsLean.HostPackageRoots to the named ElabMeet subset
  toward the develop seed. HostPackageRoots already exists as product
  Lean and has no import lines (pure leaf). HostPackageWriteTheorems
  is now in the closed subset. Skip HostGraphMain, Linear, IrGraph.
- Done when: named closed subset typechecks live HostPackageRoots via
  tryCompileNamedMemberListIO; 19-plus-HostPackageRoots is **20 of
  about 206**; accept good / reject planted error; isolation vs the
  prior nineteen-module walk; leftover temp good.lean and leftover
  fake lean_lib ElabMeetRichLib stay false; four theorems FIRST
  (elabMeetDrivesNamedHostPackageRootsSubset_true,
  elabMeetAcceptsGoodNamedHostPackageRootsSubset_true,
  elabMeetRejectsBadNamedHostPackageRootsSubset_true,
  elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset_true) all
  `= true := by native_decide` before the Bools exist; TDD red then
  extract-first then implement then green; theorems not rewritten;
  pins stay; leftover seed walk stays closed; hygiene + systems-host
  green. Prior walker tryCompileNamedHostPackageWriteTheoremsSubset
  still succeeds.
- Out of scope: whole-package typecheck; leftover seed increments;
  flipping ownership / FullHost / DualResidual / Dominance /
  FullBackend / SpecProof; claiming the whole develop seed; planting
  live product; growing ElabMeetCompile; flipping free / complete /
  PROVABLY; adding Linear, IrGraph, or HostGraphMain; inventing a
  leftover-walk Name; flipping the stay-false pins.
- Paths: extract-first. HostPackageWrite walk is **434**; twentieth
  wrappers MAY stay there (about 108 lands near 542, under about 880)
  unless that add would pass about 880; then extract
  ElabMeetNamedWalkHostPackageRoots.lean. NEW probe
  ElabMeetNamedHostPackageRootsProbe.lean. Do not dump onto the
  nineteenth probe. After-deps: Mult first, then
  HostPackageWriteTheorems (and HostPackageWrite real deps if the
  planted sidecar needs them): HostFront, HostGraph, MultSubsetEmit
  through ComposeSubsetEmit. Membership: prior nineteen then
  HostPackageRoots last. Compile order: prior nineteen compile order,
  then HostPackageRoots last.

WATCHER fence: `/implement --effort 2 Grow HostPackageRoots` with the
same Name / Goal / Done when / Out of scope / Paths / Gates.

## Nix presence gaps

Dir `nix/systems-host-presence/` (25 files). Product
HostPackageRoots.lean already listed in required-files.nix,
host-leans.nix, and host-specs-compile-path-3.nix. Nineteenth probe
and HostPackageWriteTheorems helpers are already in required-files,
host-leans, and host-specs-hold-close.

**Missing (add, clone nineteenth pattern):**
- required-files.nix: NEW
  `src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean`
  (after ElabMeetNamedHostPackageWriteTheoremsProbe). No new walk
  path unless wrappers are extracted.
- host-leans.nix: same probe path.
- host-specs-hold-close.nix: (a) walk-file helper tokens
  findLiveHostPackageRootsPath,
  namedClosedHostPackageRootsSubsetNames / CompileOrder,
  barrelListsNamedHostPackageRootsSubset,
  tryCompileNamedHostPackageRootsSubset,
  tryCompileAfterHostPackageRootsDeps, SystemsLean.HostPackageRoots
  on ElabMeetNamedWalkHostPackageWrite.lean (or a new walk file);
  (b) new probe spec block mirroring lines 2258-2283
  (ElabMeetNamedHostPackageRootsProbe + four Bools +
  elabMeetNamedHostPackageRootsSubsetProbe);
  (c) four theorem name strings on ElabMeetTheorems.lean (after
  HostPackageWriteTheorems four at 2398-2401).
- host-specs-compile-path-2.nix: not required for this ElabMeet
  named-subset; product HostPackageRoots tokens already live in
  compile-path-3.

Grep found zero ElabMeetNamedHostPackageRootsProbe /
ElabMeetNamedWalkHostPackageRoots / namedClosedHostPackageRoots*.

## Closeout facts the twentieth brief must inherit

GREEN Name 145. Named closed subset is **19 of about 206**. Nineteenth
module: SystemsLean.HostPackageWriteTheorems. New probe
ElabMeetNamedHostPackageWriteTheoremsProbe.lean **202**. Wrappers stay
on ElabMeetNamedWalkHostPackageWrite.lean **434**. No new walk.
Shared walker tryCompileNamedMemberListIO. After-deps = eighteenth
after-deps plus HostPackageWrite. Isolation: leftover temp false,
leftover fake lean_lib ElabMeetRichLib false, prior
tryCompileNamedHostPackageWriteSubset still succeeds,
notAliasOfEighteenth. Drive `good && !bad && isolation`. Line counts
after land: ElabMeet 750; ElabMeetTheorems 701; Subset 865; Compile
916; NamedWalk 322; Later 785; Tail 863; HostTerm 841;
HostGraphTheorems walk 191; eighteenth probe 205. Pins unchanged.
AGENTS.md left alone. HostPackageRoots has no `import` lines
(confirmed). Import-closed on the 19. Compile list still needs the
nineteenth extra-dep block (IrGraph / HostCompose / CompilePath /
Emit scaffolds and bodies / CompilePath units / FirstSurface / six
SubsetEmit / HostPackageWrite / HostPackageWriteTheorems) then
HostPackageRoots last. Do not sell Grow IrGraph or Grow HostCompose.

## Predicted 21st Name

Residual does **not** already Open a 21st Name. Barrel neighbor after
HostPackageRoots is **HostImportGraphSeeds**
(`SystemsLean.lean` line 109), then HostImportGraphModel / Mods /
LoadOk / Theorems / Walk / Driver, then HostImportGraph. After-land
docs should name Grow HostImportGraphSeeds only if that remains the
next barrel neighbor and skip list still holds.
