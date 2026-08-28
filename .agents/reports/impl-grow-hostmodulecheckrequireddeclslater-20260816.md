# Implement report: Grow HostModuleCheckRequiredDeclsLater

IMPL_ID: efffa4b1
Status: PARKED
Date: 2026-08-21

## Job

Prove Grow HostModuleCheckRequiredDeclsLater on surmount-1 with exactly one niced Lake at a time. Fat Lake must not run on this laptop (horizon). If another Lake is already running, park.

## SSH result

SSH to surmount-1 succeeded with BatchMode and a 15 second connect timeout.

- Host: surmount-1, Linux 6.18.42 NixOS x86_64, 64 processors, 256 GiB RAM (about 28 GiB used, 228 GiB available).
- `/var/lib/iso` exists (ISO_YES).
- `/var/lib/elan/bin/lake` is executable (LAKE_YES).
- Login user on that hop is nixbuilder.

## Worktree path

`/var/lib/iso` exists, but nixbuilder cannot write `.lake/` or `src/systems` there. Ownership is 1000:1000 on the tree and root:root on `/var/lib/iso/src/systems/.lake`. That default worktree is not usable for this login.

The live Lake already on the box is using `/home/nixbuilder/iso/src/systems` with Elan `/var/lib/elan` and Lean 4.32.0. This job did not rsync and did not start a second Lake.

## Why parked

Before any Lake start, process list showed one Lake already running:

- Parent serial bash PID 1722502, elapsed about 1 hour 16 minutes at inspect time, started 2026-08-21T23:13:10Z.
- Child `nice -n 19 lake build SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe` PID 1726776, elapsed about 8 minutes, plus one Lean worker on that probe.
- Workdir of that job: `/home/nixbuilder/iso/src/systems`.
- Serial log: `/home/nixbuilder/iso/src/systems/lake-later-serial-2026-08-21.log`.

That serial job already finished three earlier probes with exit 0 (PackageWrite 1119s, PackageWriteTheorems 1492s, PackageRoots 1463s) and is now on Seeds. Later targets in that same serial list include ProductProbe, ElabMeetTheorems, and ElabMeet. That list does not include `SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe`.

Contract: do not start a second Lake. One `lake build SystemsLean.ElabMeetTheorems` already fans many inner jobs. This job parked.

No rsync was done. Overwriting Lean under the live worktree while that Lake is compiling would race the other job.

No Lake ran on horizon.

## Three Lake commands for this slice

None started. No exit codes and no minutes for this job.

| Target | Host | Command | Exit | Minutes |
|---|---|---|---|---|
| SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe | not started | nice -n 10 lake build ... | not run | n/a |
| SystemsLean.ElabMeetTheorems | not started | nice -n 10 lake build ... | not run | n/a |
| SystemsLean.ElabMeet | not started | nice -n 10 lake build ... | not run | n/a |

## Line counts measured on this laptop

- `ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe.lean`: 221
- `ElabMeetNamedWalkHostImportGraphWalkLater.lean`: 762
- `HostModuleCheckRequiredDeclsLater.lean`: 819
- `ElabMeetTheorems.lean`: 944
- `ElabMeet.lean`: 809
- `SystemsLean.lean`: 348

Remote `/home/nixbuilder/iso` and `/var/lib/iso` both already have LaterProbe 221, WalkLater 762, ElabMeetTheorems 944, ElabMeet 809, SystemsLean.lean 348. Those counts match this laptop. That is not a green Lake proof.

## Residual honesty

Open stays Grow HostModuleCheckRequiredDeclsLater. Living tip stays 29 of about 206. This job did not edit `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`, `doc/SESSION-HANDOFF.md`, or `AGENTS.md`. This job did not flip `slakeOwnsPackageTypecheck`, `elabMeetFullHostElaborateRemains`, `hostResidualShrinkFullHostElaborateRemains`, `llvmCfgFixtureDominanceClaimed`, or `llvmMultSsaFullBackendClaimed`. No git add, commit, or push.

## Next Open

Still Grow HostModuleCheckRequiredDeclsLater. Re-prove on surmount-1 only after the live serial Lake exits and a new inspect shows no Lake.
