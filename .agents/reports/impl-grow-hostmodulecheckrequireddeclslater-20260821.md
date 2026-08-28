# Grow HostModuleCheckRequiredDeclsLater prove -- 2026-08-21

IMPL_ID: efffa4b1
Status: PARKED

## Occupying Lake

Occupying Lake: yes.

Checked with:

`ssh -o BatchMode=yes -o ConnectTimeout=15 surmount-1 'pgrep -af lake || true; pgrep -af ElabMeet || true'`

Host: surmount-1 (SSH). Occupying worktree: `/home/nixbuilder/iso/src/systems`.

One niced serial Lake is already running (nice -n 19, ionice -c3). Current target at check time:

`lake build SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe`

The occupying serial loop is `lake-later-serial-2026-08-21.log`. Its remaining targets include HostImportGraphModel through HostModuleCheckRequiredDeclsProduct probes, then `SystemsLean.ElabMeetTheorems` and `SystemsLean.ElabMeet`. It does not include the Later probe.

Hard rule: exactly one Lake process on surmount-1. A second Lake was not started. Sources were not rsynced over the live compile.

## Three Lake targets for this slice

| Target | Exit | Minutes |
|--------|------|---------|
| SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe | not-run | 0 |
| Later theorems target | not-run | 0 |
| SystemsLean.ElabMeet | not-run | 0 |

This slice's prove commands were not started.

## Residual lockstep

Not applied. Open stays Grow HostModuleCheckRequiredDeclsLater subset. Named closed subset tip stays 29 of about 206. Pins were not flipped. Residual, WATCHER, and SESSION-HANDOFF were not edited.

## Next Open

Grow HostModuleCheckRequiredDeclsLater subset

## What not to forge

This is not GREEN. Slake does not typecheck HostModuleCheckRequiredDeclsLater as the 30th named closed member until this slice's three Lake targets exit 0 after a free host.
