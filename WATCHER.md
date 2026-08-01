# WATCHER.md -- next residual implement action only

Contract: the watcher session (separate from Systems / Slake implement) reads the
fenced block and may auto-continue. Keep this file short. Detail lives in
`RESIDUAL-systems.md` and `doc/SESSION-HANDOFF.md`.

<!-- WATCHER_BEGIN -->
/implement --effort 1 M3 subset language front-end design

Name: M3 subset language front-end design
Goal: Design (not forge) a real front-end over a defined Mult/subset language
surface: parse and check good and bad golden inputs, not only fixed Mult fixtures.

Done when:
1. Research note under doc/dev/research/ (Kind: analysis only) names input
   grammar/surface, good+bad golden cases, host module short role names, and
   honesty vs StillUsesLake true until M6.
2. Checkable Done when draft for a follow-on implement residual (not implement
   in this design slice).
3. Residual Open switches to implement Name only when Done when is checkable;
   do not flip freestanding product free/complete; do not forge PROVABLY/llvm;
   do not start S4/M6.
4. Docs: self-host M3 row design; handoff/WATCHER; hygiene if md.

Out of scope: full implement of parser/checker; S4/M6; StillUsesLake false;
free/complete re-open; PROVABLY; llvm; hand product C; shell mills.

Cite: plan-residual-free-freestanding.md ideal M3; Mult S0-S3 / M1 unit surfaces;
Name B full freestanding Mult write done (freestandingDriverComplete true).
Honesty: free true; complete true; StillUsesLake true; freestandingDriverComplete true.
<!-- WATCHER_END -->
