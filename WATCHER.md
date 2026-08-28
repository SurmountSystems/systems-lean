# WATCHER -- next residual action only

Separate session owns residual auto-continue from the fenced block.
Contract: plain Name / Goal / Done when; no invent; no forge free/complete/PROVABLY/FullHost.

<!-- WATCHER_BEGIN -->
BLOCKED: operator STOP. Do not run lake build SystemsLean.ElabMeetTheorems
or SystemsLean.ElabMeet. Hub no longer imports the 18 historical isolation
probes (HostFrontTheorems through FixtureTextsLater). Isolation theorems
live on those probe modules. Prove with one serial niced isolation probe
only (ElabMeetNamedHostModuleCheckParityLinearTermProbe),
LEAN_NUM_THREADS=1. If more than one lean process appears, stop starting
jobs and tell the operator. Do not kill processes unless the operator
names the PID or job.

MemoryMax 192 GiB is the ceiling. Never raise it. 256 GiB is the box.
Measured fat isolation peak about 167 GiB. Max concurrent fat Leans is
floor(192/167) = 1. Do not set jobs from core count. 64 * 10 GiB = 640 GiB
is not a budget we have. 18 * 10 GiB already almost filled the slice.

leakEnv := false is live on the nixbuilder tree
(/home/nixbuilder/iso/src/systems/SystemsLean/ElabMeetCompile.lean
lines 111 and 170; single-shot import helper stays true at line 84).
Named closed subset stays **47 of about 206**. Do not claim **48**.
FullHost stays false. Do not fold ParityTypesTerm while this Name is
ungated. ElabMeetTheorems is **581** after dropping hub probe imports.

Next prove, if any: wait until pgrep lake is empty. Then one serial niced
isolation probe only. Not the theorems hub. Not FullHost. Never laptop Lake.

Report: /home/hunter/.agents/reports/iso-2026-08-28-reliability-hub.md

| Remaining work | Honest number |
|----------------|---------------|
| Real modules Slake typechecks | **47 of about 206** (SystemsLean.Mult through SystemsLean.HostModuleCheckParityMultTerm) |
| Real host tools that build without Lake on the step | **0 of about 69** |
| Linear use-check | **not started** |
| Same-job time | Lake idle-hot **0.459 s** (`doc/BENCH-SAME-JOB-latest.md`). Slake cannot do that full-package job. Do not invent a fake Slake wall-clock. |
<!-- WATCHER_END -->
