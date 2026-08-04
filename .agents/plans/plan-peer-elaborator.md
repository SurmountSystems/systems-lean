# Plan: Freestanding Slake elaborates its own host (peer to Lake)

ASCII only. Plain English. No ephemeral step codes in product source or APIs.

Session plan (same body): keep lockstep with session `plan.md` when revising.

**Mission:** freestanding, garbage-collection-free Systems Lean that can
bootstrap itself. Freestanding Slake must eventually check and build the same
host work classic Lean Lake does today, so "Slake vs Lake" times the **same job**.

Explore joins (analysis only):
- `/tmp/grok-1000/explore-peer-elaborator-map.md`
- `/tmp/grok-1000/explore-minimal-peer-elaborator.md`

---

## Living tip

Steps 1-8 **done**: Peer elaborator design; Host term representation
(`SystemsLean.HostTerm` / HOST-TERM-IR); Host fragment front-end
(`SystemsLean.HostFront` / just `host-front` / HOST-FRONT);
Host fragment check (`SystemsLean.HostCheck` / just `host-fragment-check` /
HOST-FRAGMENT-CHECK);
Check without Lake (just `host-fragment-check-without-lake` Name A prebuilt;
`hostFragmentCheckWithoutLakeFinished` true);
Fragment module graph (`SystemsLean.HostGraph` / just `host-graph` +
`host-graph-without-lake`; Mult+MultSubsetEmit multi-file; fail-closed
MISSING-IMPORT / IMPORT-CYCLE; `hostGraphWithoutLakeFinished` true;
join `/tmp/grok-1000/grok-impl-summary-fragment-module-graph.md`);
Elaborator Mult package write (`SystemsLean.HostPackageWrite` / just
`host-package-write` + `host-package-write-without-lake`; HostFront G1 +
HostGraph Mult set then MultSubsetEmit write; `hostPackageWriteFinishedClaimed`
/ `hostPackageWriteWithoutLakeFinished` true; join
`/tmp/grok-1000/grok-impl-summary-elaborator-mult-package-write.md`);
Same-job peer wall-clock (research
`doc/dev/research/slake-vs-lake-same-job-mult-2026-08-02.md`; Job A median
real 0.025 s vs Job B `mult-subset-emit` median 0.906 s; join
`/tmp/grok-1000/grok-impl-summary-same-job-peer-wall-clock.md`);
step 9 **Expand host fragment set done** (HostFront G3 Linear mini + HostGraph
Linear Mult companion expand; without-Lake green; package write still green);
step 10 **Host residual shrink done** (honest partial Mult-first peer Lake-free
inventory; research `doc/dev/research/host-residual-shrink-2026-08-02.md`;
`SystemsLean.HostResidualShrink` / `just host-residual-shrink`;
`hostResidualPartialShrinkClaimed` true; `hostElaboratorResidualRemains` true;
host free not claimed; join
`/tmp/grok-1000/grok-impl-summary-host-residual-shrink.md`).
**Peer program steps 1-10 closed.** Systems Open next: **LLVM IR emit path**
(design + measured stub; `llvmUnlocked` stays false). Full host peer expand
beyond Mult-first remains future residual if opened (not forced by step 10).

**Parallel CompCert seal program:** **closed** 2026-08-02 (PROVABLY claimed;
`provablyUnlocked` true; plan-compcert-product-seal complete through step 6).
Peer elaborator history closed at step 10 with partial host residual honesty.

---

## 1. What is true today

| Fact | Status |
|------|--------|
| Product residual free | true |
| Freestanding product self-host complete | true |
| Product path without Lake on hot path | true |
| Host elaborator residual | remains |
| Freestanding Slake elaborates full host `.lean` like Lake | **false** |
| PROVABLY / LLVM | held |

---

## 2. Goal

Mult-first freestanding host fragment elaborator, then expand until host develop
of Systems Lean product modules does not need Lake on the measured path.

---

## 3. Non-goals

Full Lean day-one; forge host residual gone; re-open free/complete without cause;
auto PROVABLY/LLVM; product C/shell growth; residual essays in driver print lines;
ephemeral step codes in module names or permanent APIs.

---

## 4. Approach

```
Mult subset front-end (done for unit IR text)
  -> closed host term representation
  -> Mult-first host fragment front-end
  -> check driver (Lake-built OK first)
  -> check without Lake on hot path
  -> tiny multi-file import set
  -> check + Mult unit package write
  -> same-job wall-clock vs Lake
  -> expand module set; host residual shrink with evidence only
```

Not: reimplement all of Lean first; claim peer via greps; only grow C packages.

---

## 5. Green bars

| Green bar | Meaning |
|-----------|---------|
| Fragment check green | Freestanding check of Mult-first host fragment set without Lake on hot path |
| Package write green | That path writes Mult unit package with existing package evidence |
| Same-job bench green | Lake vs Slake wall-clock on those same modules only |
| Host residual shrink | Freestanding evidence + elaborator proof only |

---

## 6. Steps (global; never restart numbering; never put numbers in product APIs)

| Step | Residual Name | Done when |
|------|---------------|-----------|
| 1 | Peer elaborator design | Research note; Mult-first list; green bars; next Names; residual Open step 2 |
| 2 | Host term representation | Short modules; fixtures; gates green; host residual still true |
| 3 | Host fragment front-end | Goldens accept/reject; just green |
| 4 | Host fragment check | Check corpus; fail closed; Lake-built OK |
| 5 | Check without Lake | Same corpus; no lake on hot path |
| 6 | Fragment module graph | Multi-file imports under without-Lake check |
| 7 | Elaborator Mult package write | Package evidence matches Mult package path |
| 8 | Same-job peer wall-clock | Measured same-job times in research note |
| 9 | Expand host fragment set | After 7-8; new residual Names |
| 10 | Host residual shrink | Evidence + proof only |

**Print-line quality:** when editing drivers, short status only (what ran, paths,
raw pins). Residual and design prose stay in residual / self-host / research.
Scrub on touch. No bulk style-only rewrite of the tree.

---

## 7. Critical files

`SubsetFront.lean`, `Mult.lean`, `MultSubsetEmit.lean`, `DualResidual.lean`,
`LakeRetireInventory.lean`, `SelfHostComplete.lean`, `self-host.md`, residual,
WATCHER, handoff, proper bench research note, pure Nix host presence.

---

## 8. Verification

Research note + Open residual for step 2; goldens red then green; Mult package
evidence; same-job TSV; freestanding-self-host-complete and free measure green
each slice; host residual honesty until step 10.

---

## 9. Defaults

Tiny Lean-like Mult-first subset; package stage-token equality first; after
approve open **Peer elaborator design**; PROVABLY/LLVM held; parallel subagents
effort 2 on disjoint scopes.

---

## 10. Success

Fragment check without Lake; Mult package write via that path; same-job
wall-clock table; full host peer is explicit expand work; free/complete/wire stay
honest.
