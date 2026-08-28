# Grow HostPackageWrite extract-first (short)

Full brief: `/tmp/grok-1000/grok-brief-grow-hostpackagewrite-20260816.md`

## Decision

- **Eighteenth probe MUST be NEW** `src/systems/SystemsLean/ElabMeetNamedHostPackageWriteProbe.lean`.
- **Wrappers MAY stay** on `ElabMeetNamedWalkHostGraphTheorems.lean` (191 lines; expected ~299 after add, well under ~780). If expanded compile-order lists push past ~780, extract **NEW** `ElabMeetNamedWalkHostPackageWrite.lean`. Never name a walk `ElabMeetNamedWalkHostGraph`.
- Reuse `tryCompileNamedMemberListIO`. Four-line wrappers. No cloned walker.
- Compile Mult first; prior seventeen then HostPackageWrite last; **plus** MultSubsetEmit..ComposeSubsetEmit and their transitive CompilePath/Emit/IrGraph/HostCompose deps so the good path elaborates.
- TDD: four theorems first (red), then implement (green). Do not rewrite theorems.

## Barrel

- Prior tip: HostGraphTheorems (17). This slice: HostPackageWrite (18).
- **Nineteenth:** HostPackageWriteTheorems.
- Skip HostGraphMain (not in barrel). Skip Linear / IrGraph as named grow tips.

## HostPackageWrite imports

`HostFront`, `HostGraph`, `MultSubsetEmit`, `LinearSubsetEmit`, `TypesSubsetEmit`, `ProgramSubsetEmit`, `GraphSubsetEmit`, `ComposeSubsetEmit`. **Not** closed on Mult..HostGraphTheorems alone.

## Line counts

Subset 865 (no probe); Compile 916 (no grow); NamedWalk 322; Later 785; Tail 863; HostTerm 841; HostGraphTheorems walk 191 (MAY wrappers); probes 198/199/200/201 (do not dump eighteenth).

## Theorems

`elabMeetDrivesNamedHostPackageWriteSubset_true`, `elabMeetAcceptsGoodNamedHostPackageWriteSubset_true`, `elabMeetRejectsBadNamedHostPackageWriteSubset_true`, `elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset_true` (all `= true := by native_decide`).

## Pins / lockstep

Pins stay (slakeOwnsPackageTypecheck false, FullHost false, DualResidual residualFreeClaimed true). After land: 18 of about 206; next Open Name Grow HostPackageWriteTheorems subset. Update WATCHER, SESSION-HANDOFF, residual, plan tip. Leave AGENTS.md alone.
