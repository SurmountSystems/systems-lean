# Grow named closed subset: SystemsLean.Erasure

GREEN. Named closed subset typechecks **5 of about 206** live modules
(Mult, Types, MultTheorems, TypesTheorems, Erasure).

Generalized `tryCompileNamedMemberListIO` in ElabMeetSubset.lean.
Three-module and four-module probes stay wrappers. No fifth cloned
walker. ElabMeetCompile untouched (**916**). ElabMeetSubset **847**
(under 880). ElabMeet **618**. ElabMeetTheorems **403**.

TDD: theorems first, lake red (free-variable expected type, exit 1),
then probe, then the same theorems green (exit 0 from `src/systems`).
Isolation keeps leftover temp good.lean and leftover fake lean_lib
ElabMeetRichLib false. Prior four-module walker still succeeds.

Pins stay false: slakeOwnsPackageTypecheck, FullHost. Leftover walk
stays closed. Leftover both-lessons 88/206 is leftover seed, not
this metric.

Gates: lake ElabMeetTheorems / ElabMeetSubset / ElabMeet exit 0;
just hygiene, just systems-host, just professional-tone exit 0.

Next: Grow the named closed subset with **ErasureTheorems** (imports
Mult + Erasure). Extract a role module first: 847 plus a new probe
would pass about 880. Skip Linear and IrProgram.
