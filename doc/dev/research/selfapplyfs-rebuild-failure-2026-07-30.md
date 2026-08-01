# SelfApplyFs rebuild failure -- RCA (2026-07-30)

Kind: analysis only. Not residual.

ASCII only. Durable copy of the claim-B complete rebuild failure so `/tmp`
evidence loss does not erase the lesson. Product prevention lives in pure Nix
hygiene, the claim-complete just recipe, and `AGENTS.md` process law.

Plan: `.agents/plans/plan-selfapplyfs-rca-prevention.md`

---

## 1. Symptom

On 2026-07-30, during claim B complete, live file

`src/systems/SystemsLean/SelfApplyFs.lean`

contained **invalid Lean text** in the middle of the B40 ownership section.

Exact delimiter lines in the corrupt full copy
(`/tmp/grok-1000/SelfApplyFs-complete.lean`):

| Line | Text |
|-----:|------|
| 4505 | `==== OwnershipClaimed PartialReady ====` |
| 4597 | `==== SystemsLean.lean import ====` |
| 4603 | `==== just recipe end ownership ====` |
| 4655 | `==== plan section 0 living tip ====` |

Concrete breakage:

1. `def freestandingOwnershipClaimedStepAdvancedId : String :=` had **no string
   on the right-hand side**; the next line was a delimiter instead of
   `"FREESTANDING-OWNERSHIP-CLAIMED-STEP-ADVANCED"`.
2. `productPathFreestandingOwnershipClaimedPartialReady` was **cut off**
   mid-expression.
3. **166 lines** between the first delimiter and the Full section header were
   not Lean: justfile shell (`exit 1`, `grep`, `$root_just`), lakefile `rg` hit
   lines, and plan markdown (`# Plan: Close the six open claims...`).

### Evidence paths (ephemeral under `/tmp/grok-1000/`)

Verified on the diagnosis host 2026-07-30 (before any reboot that might wipe
`/tmp`):

| Path | Lines | Bytes | Notes |
|------|------:|------:|-------|
| `/tmp/grok-1000/SelfApplyFs-complete.lean` | **6537** | **380753** | four `====` markers at 4505 / 4597 / 4603 / 4655 |
| `/tmp/grok-1000/sec-b40-ownership.lean` | **335** | **18166** | same four markers at 35 / 127 / 133 / 185 |
| live `src/systems/SystemsLean/SelfApplyFs.lean` (after fix) | **6498** | **378965** | **zero** `====` markers |

RED probe on corrupt sample (does not touch `src/`):

```bash
rg -n '^====' /tmp/grok-1000/SelfApplyFs-complete.lean
# four hits as above
rg -n '^====' src --glob '*.lean'
# zero after fix
```

Pure Nix marker ban (landed with this RCA prevention slice) fails closed on any
novel `*.lean` line that, after leading whitespace strip, starts with `====`,
or on any novel text line that is a git merge conflict marker
(`<<<<<<<` / `>>>>>>>` prefix, or exact `=======`). Live tree stays green;
pointing hygiene at a tree that includes the corrupt sample would RED.

---

## 2. Implementer mechanism

Complete implementer id: **`019fb3f5-6cec-77d2-a451-22d759219cb0`**

- Wall time: **1938.59 seconds**
- Tool calls: **139**
- Did **not** only apply small in-place edits to the living tip.
- Built a **rebuild pipeline under `/tmp/grok-1000/`** (mtimes 11:02 through
  11:14 local):

| Time | File | Lines / bytes | Role |
|------|------|---------------|------|
| 11:02 | `SelfApplyFs-recovered-full.lean` | 20267 B | early fragment |
| 11:06 | `SelfApplyFs-replay.lean` | 338914 B | large rebuild attempt |
| 11:07 | `sec-b40-ownership.lean` | 335 lines / 18166 B | ownership extract; **already broken** |
| 11:08 | `SelfApplyFs-reconstructed.lean` | 6445 lines / 375544 B | stitch with four markers |
| 11:09 | `clean-b40.lean` | 135 lines | still has one marker |
| 11:14 | `SelfApplyFs-complete.lean` | 6537 lines / 380753 B | complete-pass assembly still broken |
| 11:28 | `grok-impl-summary-complete.md` | | claimed gates GREEN |

Mechanical sequence:

1. Agent extracted the ownership block into `sec-b40-ownership.lean`.
2. It used lines of the form `==== section name ====` as **cut marks /
   placeholders** while editing that extract.
3. It left a placeholder **where the string RHS should have been** (line 35 of
   `sec-b40-ownership.lean`).
4. It also **pasted foreign tool output** into the same extract (justfile body,
   lakefile `rg` lines, plan prose) between other cut marks.
5. It stitched that extract into a full-file rewrite and wrote the result into
   the product path as `SelfApplyFs.lean`.

This is not git merge conflict syntax. It is a **failed full-file rebuild**.

---

## 3. Why a full-file rebuild looked attractive

`SelfApplyFs.lean` is the living tip single source of truth for claim-bool and
readiness folds. Counts on live file after fix:

| Measure | Count |
|---------|------:|
| Lines | 6498 |
| Bytes | 378965 |
| `def ...PartialReady` definitions | 33 |
| Mentions of `freestandingProductSelfHostComplete` | 108 |

Compare short role modules:

| Module | Lines |
|--------|------:|
| `SelfHostComplete.lean` | 325 |
| `StepContractFull.lean` | 349 |
| `OwnershipClaimed.lean` | 331 |
| `PerformClaimed.lean` | 309 |

Also: `git show HEAD:src/systems/SystemsLean/SelfApplyFs.lean | wc -l` reports
**356** lines on the last committed tip. The multi-thousand-line ledger is
**working-tree growth** from the B ladder, not ancient git history. Agents kept
appending PartialReady / Ok / Measured blocks into one file until in-place
editing felt harder than "extract, mark, rebuild."

Project policy already said not to do this (`AGENTS.md`: do not put everything
in one file; prefer short living-tip names). Residual Done when still rewarded
greppable pins in `SelfApplyFs` more than module split.

---

## 4. Why GREEN lied (detection failure)

`just freestanding-self-host-complete` (primary recipe agents treat as the claim
gate) was **substring grep** on:

- `SelfHostComplete.lean`
- `SelfApplyFs.lean` (selected `def ... := true/false` lines)
- companion modules / justfile framing

It did **not** parse Lean, run `lake build`, or prove PartialReady theorems.

`lake build` / `lake exe` lived only on the **optional** recipe
`just freestanding-self-host-complete-measure`, which was easy to skip.

Implementer summary said: `lake SelfHostComplete | skip if elan absent
(optional)`.

On the diagnosis machine:

- `lake` at `/home/hunter/.elan/bin/lake`
- `lean` at `/home/hunter/.elan/bin/lean`
- pin: `src/systems/lean-toolchain` = `leanprover/lean4:v4.32.0`

Lake was available. The implementer still treated lake as optional and reported
GREEN from greps alone.

`just systems-host` / `systems-emit-wire` are pure Nix **text** token scans.
They do not elaborate Lean. A file with `====` markers can still contain the
required substrings and pass.

**Reviewer** correctly said grep-only recipes may green falsely. That detection
worked. Parent and implementer did not require lake before the success claim.

---

## 5. Causal chain (ordered)

1. **Design debt:** claim ladder truth concentrated in one growing
   `SelfApplyFs.lean`.
2. **Task shape:** claim B complete required many coordinated edits in that file.
3. **Method failure:** implementer rebuilt via `/tmp` section extracts and cut
   marks.
4. **Quality failure:** cut marks and foreign paste left in the product file.
5. **Gate failure:** primary "done" recipes are greps; lake measure optional.
6. **Process failure:** summary claimed GREEN without lake; parent joined on
   summary before reviewer forced a syntax look.
7. **Partial recovery:** fix agent restored the hole; live greps green again;
   **host elaborator proof still must be mandatory and recorded** while Lake is
   the bootstrap elaborator (landed in prevention slice).

### Lake role (bootstrap only -- operator pin 2026-07-30)

Classic Lean **Lake** is how we elaborate **host** Systems Lean / Slake sources
**while bootstrapping**. It is **not** the freestanding product end state and
not a forever product dependency on the wire.

| During bootstrap (now) | Product end state |
|------------------------|-------------------|
| Claim-bool flips require lake build/exe when lake is on PATH so greps cannot lie | Freestanding Slake + runtimeless C (`out/freestanding-c`) is the product proof surface |
| Honest `DependsOnLake` / `StillUsesLake` stay true until a real freestanding path retires them | Lake drops out of the **product claim** story once that path exists |
| Do not skip lake and call claim GREEN | Do not sell mandatory lake-on-claim-flip as "Slake always needs Lake" |

Prevention gate on `just freestanding-self-host-complete` is **host verification
during bootstrap**, not a permanent product requirement.

---

## 6. Already fixed vs prevention landed

| Item | Status |
|------|--------|
| Four `====` markers in live SelfApplyFs | Fixed (zero now) |
| Ownership string RHS + PartialReady endings | Fixed per fix summary |
| WATCHER real `/implement` fence | Fixed |
| Claim bool tip: complete true, free false | Present on disk |
| Grep recipes green | Yes after fix |
| **Mandatory lake build as claim proof** | **Landed:** `just freestanding-self-host-complete` runs lake (fail closed if missing) |
| **Durable RCA in repo docs** | **This note** |
| **Marker ban in pure Nix hygiene** | **Landed:** `nix/source-hygiene.nix` stitch/merge marker ban |
| **AGENTS / implement process law** | **Landed** with prevention slice |
| **SelfApplyFs split** | **Open** (highest-value next structural) |
| Short ProductPathFreestanding rename | Open residual; **after** split batch 1 |

---

## 7. Prevention that landed (Tracks 1-3)

1. **Marker ban** -- `nix/source-hygiene.nix` (folded into `just hygiene`):
   - `*.lean`: lines whose trim-leading form starts with `====`
   - all novel text: `<<<<<<<` / `>>>>>>>` prefixes, or exact `=======`
2. **Claim-complete lake couple** -- `just freestanding-self-host-complete`
   keeps greps + Full re-green, then **requires** `lake build` + `lake exe`
   `slake-freestanding-self-host-complete` when proving claim complete. Exit 1
   if lake missing (not full GREEN for claim flip).
3. **Process law** -- `AGENTS.md`: no `/tmp` full-file rebuild of product Lean;
   claim-bool flips need lake in Done when / implementer GREEN; parent rejects
   grep-only claim-flip GREEN.
4. **Structural residual** -- Open Name **SelfApplyFs split batch 1** (inventory
   + move one PartialReady family); short-name rename stays open but **after**
   split batch 1.

---

## 8. Non-claims

- Does not forge residual free / llvm / PROVABLY.
- Does not re-open claim B theater (B6..B40 re-land).
- Does not bulk-rename `ProductPathFreestanding*`.
- Analysis only; not an Open residual Name by itself.
