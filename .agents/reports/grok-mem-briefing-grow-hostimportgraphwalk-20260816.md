# implement-memory after Grow HostImportGraphWalk GREEN

Status: GREEN
Slice closed: Grow HostImportGraphWalk (27 of about 206)
Closed member: HostImportGraphWalk

This closeout is process only. Product Lean was not changed.

## Memory update

- Command: python3 /home/hunter/.agents/skills/implement/scripts/memory.py update < /tmp/grok-1000/grok-mem-hostimportgraphwalk.json
- Cwd: /home/hunter/Projects/ai/iso
- The helper has no --project flag. Workspace memory already resolves to systems-lean.
- File: /home/hunter/.grok/implement-memory/systems-lean-6ac39f2795e7.md
- existed_before: true
- new_patterns: 11
- merged_patterns: 16
- categories_touched: 17 (Grow named closed subset, Host metrics, HostGraphTheorems isolation Name 113, HostImportGraphWalk TDD, HostImportGraphWalk drive, HostImportGraphWalk extract-first, HostImportGraphWalk line budget, HostModuleCheckRequiredDecls Nix, HostModuleCheckRequiredDecls next, HostPackageRoots Lake cwd, HostPackageWrite Lake cwd, HostPackageWrite TDD, HostPackageWrite claim pins, One reviewer per slice, Project agent home, Role-swap, Testing)
- categories_capped: none
- recent_runs_dropped: 1
- totals: 57 categories, 164 patterns, 20 recent runs

## Facts persisted

- Named closed subset is now 27 of about 206. Closed member: HostImportGraphWalk.
- Living next Open: Grow HostModuleCheckRequiredDecls (barrel import 120).
- Do NOT open Grow HostImportGraph (hub 119), Grow HostImportGraphLoadOk (hub 113), Grow HostImportGraphTheorems, or Grow HostImportGraphDriver.
- Skip Linear. Skip IrGraph. Skip HostCompose. Skip HostGraphMain.
- New Walk probe: ElabMeetNamedHostImportGraphWalkProbe.lean (about 215). Isolation #elabMeetNamedHostImportGraphWalkSubsetProbe.
- WalkLater walk grew to about 327 (Walk wrappers live there). Seeds walk stays about 693. Do not dump next wrappers on Seeds.
- Next (twenty-eighth) wrappers may stay on WalkLater walk (327 plus about 130 is about 457, under 780).
- Next probe MUST be new ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean because ElabMeetSubset is 865 and cannot take another probe.
- Do not invent a new walk unless a later measure would pass 780.
- Live barrel HostImportGraphWalk.lean about 589, not planted.
- Do not plant live HostModuleCheckRequiredDecls.lean.
- TDD: four _true stubs first; lake build SystemsLean.ElabMeetTheorems from src/systems exited 1 on free-variable errors; then same theorems green via native_decide.
- Lake cwd is ALWAYS /home/hunter/Projects/ai/iso/src/systems (root lakefile has no lean_lib SystemsLean).
- Pins stay false: slakeOwnsPackageTypecheck, elabMeetFullHostElaborateRemains, hostResidualShrinkFullHostElaborateRemains, llvmCfgFixtureDominanceClaimed, llvmMultSsaFullBackendClaimed.
- Four Walk Bools: elabMeetAcceptsGoodNamedHostImportGraphWalkSubset, elabMeetRejectsBadNamedHostImportGraphWalkSubset, elabMeetRejectsOldWalkAsNamedHostImportGraphWalkSubset, elabMeetDrivesNamedHostImportGraphWalkSubset. Drive: good && !bad && isolation.
- Host tools without Lake: 0 of about 69. Linear use-check not started. Same-job Lake idle-hot 0.459 s. CompCert no-UB already true.
- Next Nix: add HostModuleCheckRequiredDecls probe after Walk in required-files.nix, host-leans.nix, host-specs. Do not churn compile-path-2.
- Do not grow ElabMeetCompile (916). Do not grow Subset past about 880. Do not grow WalkLater Later (785) or Tail (863) or HostTerm walk (841).
- Extract first when a family would pass about 880 (walk extract bar about 780).
- AGENTS.md still says 13 / HostFrontTheorems; leave AGENTS.md alone (nit, not a product fail).

## Non-claims

- Do not open Grow HostImportGraph.
- Do not open Grow HostImportGraphLoadOk.
- Do not open Grow HostImportGraphTheorems.
- Do not open Grow HostImportGraphDriver.
- Skip Linear, IrGraph, HostCompose, and HostGraphMain as grow-tip Names.
- Pins stay false. DualResidual residualFreeClaimed stays true.
- One reviewer after mop, not three.
- Leave the AGENTS.md living tip alone. Residual, handoff, and watcher already carry the living count.

## Briefing copies

- /tmp/grok-1000/grok-mem-briefing-grow-hostimportgraphwalk-20260816.md
- /home/hunter/Projects/ai/iso/.agents/reports/grok-mem-briefing-grow-hostimportgraphwalk-20260816.md
