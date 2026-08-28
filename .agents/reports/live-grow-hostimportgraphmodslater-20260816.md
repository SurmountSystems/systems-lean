# Live task: Grow HostImportGraphModsLater

Job: Grow the named closed subset so Slake typechecks live
HostImportGraphModsLater as the twenty-fourth member.

Status: in flight under L3 implementer.

Extract-first: new ElabMeetNamedHostImportGraphModsLaterProbe.lean plus
sidecar. Wrappers grow ElabMeetNamedWalkHostImportGraphSeeds.lean.
Do not add ElabMeetNamedWalkHostImportGraphModsLater.lean.

TDD required: land four theorems first. `lake build
SystemsLean.ElabMeetTheorems` from src/systems must go red, then
implement, then the same filter must go green. Do not rewrite theorems.

After green: close Grow HostImportGraphModsLater, open Grow
HostImportGraphLoadOkLater, and update WATCHER, SESSION-HANDOFF, the
plan living tip, and the coordinator table. Leave AGENTS.md alone.

Reports owed:

- /tmp/grok-1000/grok-impl-summary-grow-hostimportgraphmodslater-20260816.md
- .agents/reports/impl-grow-hostimportgraphmodslater-20260816.md

Do not invent leftover Names. Do not plant the live tip. Do not flip
free, complete, or PROVABLY.
