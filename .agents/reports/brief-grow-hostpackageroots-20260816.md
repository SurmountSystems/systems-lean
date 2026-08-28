# Grow HostPackageRoots (20 of about 206)

Date: 2026-08-16. Land `SystemsLean.HostPackageRoots` as the twentieth
named ElabMeet closed subset without rediscovering the ElabMeet family.
The product module already exists. Do not invent it. Do not plant a
type error on the live file.

## 2. Metric, barrel neighbors, next-after Name

After land: **20 of about 206**. Trust barrel imports in
`src/systems/SystemsLean.lean`, not the header plus-list. Import 107 is
HostPackageWriteTheorems (nineteenth, landed). Import 108 is
HostPackageRoots (this tip). Import 109 is HostImportGraphSeeds. The
plus-list mentions HostImportGraph before HostImportGraphSeeds. After
land the next Open Name is **Grow HostImportGraphSeeds**, not Grow
HostImportGraph.

Product path: `src/systems/SystemsLean/HostPackageRoots.lean` (435
lines). No import lines. Import-closed leaf. Prelude only. Does not
import ElabMeet, HostCompose, IrGraph, HostPackageWrite, or HostGraph.
Theorems and main live in this file. No barrel HostPackageRootsTheorems.
`hostPackageRootsMod` already has `imports := []`. Open Name 146 is
already Grow HostPackageRoots.

## 3. Probe, isolation command, Bools, theorems

**NEW file:** `src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean`

Do not put this probe on ElabMeetSubset (865) or on
ElabMeetNamedHostPackageWriteTheoremsProbe (202). Isolation command:
`#elabMeetNamedHostPackageRootsSubsetProbe`. Expected size: about 202
lines (clone the nineteenth). Probe uses `rfl` on the Bools. Theorems
use `native_decide`.

Four Bools: `elabMeetAcceptsGoodNamedHostPackageRootsSubset`,
`elabMeetRejectsBadNamedHostPackageRootsSubset`,
`elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset`,
`elabMeetDrivesNamedHostPackageRootsSubset`.

Four theorems in `ElabMeetTheorems.lean` (each `= true := by native_decide`):
`elabMeetDrivesNamedHostPackageRootsSubset_true`,
`elabMeetAcceptsGoodNamedHostPackageRootsSubset_true`,
`elabMeetRejectsBadNamedHostPackageRootsSubset_true`,
`elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset_true`.

Good path: `tryCompileNamedHostPackageRootsSubset` (wrapper over
`tryCompileNamedMemberListIO`). Bad path: temp copy of HostPackageRoots
plus `plantedTypeError`, then `tryCompileAfterHostPackageRootsDeps`.
Do not edit live `HostPackageRoots.lean`.

## 4. Wrapper home, expected size, new-walk decision

Stay on `ElabMeetNamedWalkHostPackageWrite.lean` (434 lines).
Nineteenth wrappers are about 169 lines (264-432). Clone that family
with Roots names. Expected after add: about **603-626** (user band
544-634). Extract bar for this file is about **780**. The 880 bar in
residual and WATCHER applies to Tail and Later leftover wrappers, not
this file. A new walk `ElabMeetNamedWalkHostPackageRoots.lean` is
**not** needed unless the add would pass about 780. Measured: it will
not. Do not extract into a role module for this walk. Do not grow
ElabMeetNamedWalkHostGraphTheorems (191). ElabMeetNamedWalkHostGraph
does not exist. Do not extract it.

Clone wrappers (swap WriteTheorems to Roots):
`findLiveHostPackageRootsPath`,
`namedClosedHostPackageRootsSubsetNames`,
`namedClosedHostPackageRootsCompileOrder`,
`barrelListsNamedHostPackageRootsSubset`,
`tryCompileNamedHostPackageRootsSubset` plus IO and IOSafe,
`tryCompileAfterHostPackageRootsDeps` plus IO and IOSafe. Reuse
`tryCompileNamedMemberListIO` from `ElabMeetNamedWalk.lean`. Do not
copy that helper into a new file.

## 5. Compile-order extras and after-deps

HostPackageRoots itself adds **no** new compile members. Named
membership is the nineteenth names plus `SystemsLean.HostPackageRoots`
last. Compile order is the nineteenth compile order plus
`SystemsLean.HostPackageRoots` last.

Nineteenth named membership, then HostPackageRoots:
Mult, MultTheorems, Types, TypesTheorems, IrProgram, IrProgramTheorems,
Erasure, ErasureTheorems, Extract, ExtractTheorems, HostTerm,
HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, HostPackageWrite, HostPackageWriteTheorems.

Keep this extra-dep block from the nineteenth compile order. Do not
open Grow IrGraph or Grow HostCompose as residual Names:
IrGraph, HostCompose, CompilePath, EmitMultScaffold, EmitLinearScaffold,
EmitTypesScaffold, EmitProgramScaffold, EmitGraphScaffold,
EmitComposeScaffold, EmitMult, EmitLinear, EmitTypes, EmitProgram,
EmitGraph, EmitCompose, CompilePathMult, CompilePathLinear,
CompilePathTypes, CompilePathProgram, CompilePathGraph,
CompilePathCompose, FirstSurface, MultSubsetEmit, LinearSubsetEmit,
TypesSubsetEmit, ProgramSubsetEmit, GraphSubsetEmit, ComposeSubsetEmit,
HostPackageWrite, HostPackageWriteTheorems.

Named-member compile order (Mult first; extras omitted): Mult, Types,
MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract,
ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, HostPackageWrite, HostPackageWriteTheorems,
HostPackageRoots.

After-deps for the planted-error sidecar: clone
`tryCompileAfterHostPackageWriteTheoremsDeps` and add
`SystemsLean.HostPackageWriteTheorems`. HostPackageRoots has no
imports, so do not add new compile members for the sidecar. Nineteenth
after-deps already include Mult, Types, IrProgram, IrGraph, Erasure,
Extract, HostCompose, CompilePath, six Emit scaffolds, six Emit
bodies, six CompilePath units, FirstSurface, HostTerm,
HostFrontGoldens, HostFront, HostGraph, six SubsetEmit modules, and
HostPackageWrite. Twentieth after-deps = that list plus
HostPackageWriteTheorems.

## 6. Isolation (Name 113 analog versus the nineteenth)

Drive: `good && !bad && isolation`. Name 113 does not appear on the
nineteenth probe. Still keep these checks. Do not invent leftover-walk
residual Names. Isolation: live Mult still compiles; live MultTheorems
still compiles; leftover temp `good.lean` false (walker on
`isoDir / "good.lean"` with `def n : Nat := 0` must fail); leftover
fake `lean_lib ElabMeetRichLib` false
(`leftoverFakePackageLakefileText` string only; no live `lean_lib`);
`tryCompileNamedHostPackageWriteTheoremsSubset` still succeeds (prior
nineteen-module walk); twentieth walk is not an alias of the nineteenth
(name lists and compile orders differ; only the twentieth list contains
`SystemsLean.HostPackageRoots`); live `HostPackageRoots.lean` was not
planted (planted error is a temp sidecar).

## 7. TDD and lake cwd

1. Four theorems first in `ElabMeetTheorems.lean` (701) so
   `lake build SystemsLean.ElabMeetTheorems` fails on unknown Bools
   (observed red).
2. Then wrappers on the existing walk, the NEW probe, the ElabMeet
   ready fold, and Nix presence.
3. Same lake command exit 0. Do not rewrite theorems to finish green.

`ElabMeet.lean` is 750 lines. Fold the four Bools into `elabMeetReady`
(nineteenth fold near 723-726). Honesty theorems stay in ElabMeet.
Lake cwd: `/home/hunter/Projects/ai/iso/src/systems` only.
`lake build SystemsLean.ElabMeetTheorems`;
`lake build SystemsLean.ElabMeet`;
`lake build SystemsLean.ElabMeetNamedHostPackageRootsProbe`.
Repo root: `just hygiene`; `just professional-tone`; `just systems-host`.

## 8. Nix adds

Under `nix/systems-host-presence/`. Product HostPackageRoots.lean is
already in `required-files.nix`, `host-leans.nix`, and
`host-specs-compile-path-3.nix`. Clone the nineteenth
HostPackageWriteTheorems probe pattern: add
`ElabMeetNamedHostPackageRootsProbe.lean` after the nineteenth probe
in `required-files.nix` and `host-leans.nix`. In
`host-specs-hold-close.nix`: helper tokens on the walk file; new probe
spec block (four Bools plus `elabMeetNamedHostPackageRootsSubsetProbe`);
four theorem name strings on ElabMeetTheorems after the nineteenth
four. No new walk path in Nix unless wrappers are extracted into a
role module (they should not be). Barrel: import the new probe after
the nineteenth probe. Do not add a new walk import.

## 9. Pins, skip list, out of scope

Do not flip: `slakeOwnsPackageTypecheck` false;
`elabMeetFullHostElaborateRemains` false;
`hostResidualShrinkFullHostElaborateRemains` /
`FullHostElaborateRemains` false; `llvmCfgFixtureDominanceClaimed`
false; `llvmMultSsaFullBackendClaimed` false; DualResidual
`residualFreeClaimed` true; `hostElaboratorResidualFreeClaimed` true;
SpecProof `residualFreeClaimed` false; SpecProof
`proofCompleteClaimed` true. Still not whole-package typecheck. Still
not Lake gone. Leave `AGENTS.md` alone.

Skip Linear as grow tip. Skip IrGraph as grow tip. Skip HostGraphMain
(lake exe root, not in the barrel). Do not grow Compile 916, Subset
865, Tail 863, Later 785, NamedWalk 322, HostTerm 841, or
HostGraphTheorems walk 191. No product C. No new shell. ASCII only.

Out of scope: Grow HostImportGraphSeeds (next Name only); Grow
HostImportGraph (not the next Open Name); extracting
`ElabMeetNamedWalkHostPackageRoots.lean` unless wrappers would pass
about 780; naming or extracting ElabMeetNamedWalkHostGraph; cloning
`tryCompileNamedMemberListIO` into a new file; planting live
HostPackageRoots.lean; dumping this probe onto the nineteenth probe or
onto ElabMeetSubset; flipping any pin above.

## 10. Done when

Named closed subset typechecks live HostPackageRoots via
`tryCompileNamedMemberListIO`. Metric is **20 of about 206**. Accept
good. Reject planted error on a temp sidecar. Isolation versus the
nineteenth walk holds (section 6). Four theorems landed first, all
`= true := by native_decide`, not rewritten to finish green. Wrappers
stay on `ElabMeetNamedWalkHostPackageWrite.lean` at about 603-626
lines (under 780). Pins stay as section 9. Gates green: lake from
`src/systems` (ElabMeetTheorems, ElabMeet, new probe); `just hygiene`;
`just professional-tone`; `just systems-host`. Next Open Name is
**Grow HostImportGraphSeeds**.

Paths: ElabMeetTheorems.lean (theorems first);
ElabMeetNamedWalkHostPackageWrite.lean (wrappers); NEW
ElabMeetNamedHostPackageRootsProbe.lean; barrel SystemsLean.lean
(probe import only); ElabMeet.lean (import plus ready fold);
nix/systems-host-presence/required-files.nix, host-leans.nix,
host-specs-hold-close.nix. After land: WATCHER.md,
doc/SESSION-HANDOFF.md, RESIDUAL.md, RESIDUAL-systems.md. Do not edit
live HostPackageRoots.lean.
