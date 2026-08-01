# Plan: SelfApplyFs rebuild failure -- RCA, unfuck, prevention

ASCII only. 2026-07-30.
After approval, also copy to `.agents/plans/plan-selfapplyfs-rca-prevention.md` for durable residual.

**Audience:** Systems / Slake + coordinator. Human-approved before implement.

---

## 1. Goal

1. **Explain the root cause in plain English** with exact file paths and counts (not vibes).
2. **Finish unfucking the product tree** so claim B complete is real under Lean elaboration, not only under substring greps.
3. **Change tools and workflows** so a broken living tip cannot report GREEN again the same way.
4. **Shrink the conditions that made a full-file stitch feel necessary** (SelfApplyFs as a single multi-thousand-line claim ledger).

## 2. Non-goals

- Forging residual free / llvm / PROVABLY.
- Re-opening claim B theater (B6..B40 re-land).
- Bulk sed renames of all `ProductPathFreestanding*` in one shot (later residual batch).
- Agent git commit / push.
- Blaming "the model was tired" without a structural control that would have failed closed.

## 3. Root cause analysis (plain English)

### 3.1 What broke (symptom)

On 2026-07-30, during claim B complete, live file

`src/systems/SystemsLean/SelfApplyFs.lean`

contained **invalid Lean text** in the middle of the B40 ownership section:

| Exact delimiter line (corrupt full copy) | Text |
|------------------------------------------:|------|
| 4505 | `==== OwnershipClaimed PartialReady ====` |
| 4597 | `==== SystemsLean.lean import ====` |
| 4603 | `==== just recipe end ownership ====` |
| 4655 | `==== plan section 0 living tip ====` |

Concrete breakage:

1. `def freestandingOwnershipClaimedStepAdvancedId : String :=` had **no string on the right-hand side**; the next line was a delimiter instead of `"FREESTANDING-OWNERSHIP-CLAIMED-STEP-ADVANCED"`.
2. `productPathFreestandingOwnershipClaimedPartialReady` was **cut off** mid-expression.
3. **166 lines** between the first delimiter and the Full section header were not Lean: justfile shell (`exit 1`, `grep`, `$root_just`), lakefile `rg` hit lines, and plan markdown (`# Plan: Close the six open claims...`).

Corrupt full copy still on disk for evidence:

- `/tmp/grok-1000/SelfApplyFs-complete.lean` -- **6537 lines**, **380753 bytes**, four delimiters at lines 4505 / 4597 / 4603 / 4655.
- First broken extract: `/tmp/grok-1000/sec-b40-ownership.lean` -- **335 lines**, same four delimiters at lines 35 / 127 / 133 / 185.

A later fix agent removed the hole from the live tree. Live now:

- `src/systems/SystemsLean/SelfApplyFs.lean` -- **6498 lines**, **378965 bytes**, **zero** `====` markers (verified after fix).

### 3.2 What the implementer did (mechanism)

Complete implementer id `019fb3f5-6cec-77d2-a451-22d759219cb0`:

- Wall time: **1938.59 seconds**
- Tool calls: **139**
- Did **not** only apply small in-place edits to the living tip.
- Built a **rebuild pipeline under `/tmp/grok-1000/`** (mtimes 11:02 through 11:14 local):

| Time | File | Lines / bytes | Role |
|------|------|---------------|------|
| 11:02 | `SelfApplyFs-recovered-full.lean` | 20267 B | early fragment |
| 11:06 | `SelfApplyFs-replay.lean` | 338914 B | large rebuild attempt |
| 11:07 | `sec-b40-ownership.lean` | 335 lines / 18166 B | ownership section extract; **already broken** |
| 11:08 | `SelfApplyFs-reconstructed.lean` | 6445 lines / 375544 B | stitch with four markers |
| 11:09 | `clean-b40.lean` | 135 lines | still has one marker |
| 11:14 | `SelfApplyFs-complete.lean` | 6537 lines / 380753 B | complete-pass assembly still broken |
| 11:28 | `grok-impl-summary-complete.md` | | claimed gates GREEN |

How the delimiters got there (mechanical sequence):

1. Agent extracted the ownership block into `sec-b40-ownership.lean`.
2. It used lines of the form `==== section name ====` as **cut marks / placeholders** while editing that extract.
3. It left a placeholder **where the string RHS should have been** (line 35 of `sec-b40-ownership.lean`).
4. It also **pasted foreign tool output** into the same extract (justfile body, lakefile `rg` lines, plan prose) between other cut marks.
5. It stitched that extract into a full-file rewrite and wrote the result into the product path as `SelfApplyFs.lean`.

This is not git merge conflict syntax. It is a **failed full-file rebuild**.

### 3.3 Why a full-file rebuild looked attractive (precondition)

`SelfApplyFs.lean` is the living tip single source of truth for claim-bool and readiness folds. Counts on live file after fix:

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

Also: `git show HEAD:src/systems/SystemsLean/SelfApplyFs.lean | wc -l` reports **356** lines on the last committed tip. The multi-thousand-line ledger is **working-tree growth** from the B ladder, not ancient git history. Agents kept appending PartialReady / Ok / Measured blocks into one file until in-place editing felt harder than "extract, mark, rebuild."

Project policy already says not to do this (`AGENTS.md`: do not put everything in one file; prefer short living-tip names). Residual Done when still rewarded greppable pins in `SelfApplyFs` more than module split.

### 3.4 Why GREEN lied (detection failure)

`just freestanding-self-host-complete` (primary recipe agents treat as the claim gate) is **substring grep** on:

- `SelfHostComplete.lean`
- `SelfApplyFs.lean` (selected `def ... := true/false` lines)
- companion modules / justfile framing

It does **not** parse Lean, run `lake build`, or prove PartialReady theorems.

`lake build` / `lake exe` live only on the **optional** recipe `just freestanding-self-host-complete-measure`, which is easy to skip.

Implementer summary said: `lake SelfHostComplete | skip if elan absent (optional)`.

On this machine at diagnosis time:

- `lake` at `/home/hunter/.elan/bin/lake`
- `lean` at `/home/hunter/.elan/bin/lean`
- pin: `src/systems/lean-toolchain` = `leanprover/lean4:v4.32.0`

Lake was available. The implementer still treated lake as optional and reported GREEN from greps alone.

`just systems-host` / `systems-emit-wire` are pure Nix **text** token scans. They do not elaborate Lean. A file with `====` markers can still contain the required substrings and pass.

**Reviewer** correctly said grep-only recipes may green falsely. That detection worked. Parent and implementer did not require lake before the success claim.

### 3.5 Causal chain (ordered)

1. **Design debt:** claim ladder truth concentrated in one growing `SelfApplyFs.lean`.
2. **Task shape:** claim B complete required many coordinated edits in that file.
3. **Method failure:** implementer rebuilt via `/tmp` section extracts and cut marks.
4. **Quality failure:** cut marks and foreign paste left in the product file.
5. **Gate failure:** primary "done" recipes are greps; lake measure optional.
6. **Process failure:** summary claimed GREEN without lake; parent joined on summary before reviewer forced a syntax look.
7. **Partial recovery:** fix agent restored the hole; live greps green again; **lake proof still must be mandatory and recorded**.

### 3.6 Already fixed vs still open

| Item | Status |
|------|--------|
| Four `====` markers in live SelfApplyFs | Fixed (zero now) |
| Ownership string RHS + PartialReady endings | Fixed per fix summary |
| WATCHER real `/implement` fence | Fixed |
| Claim bool tip: complete true, free false | Present on disk |
| Grep recipes green | Yes after fix |
| **Mandatory lake build as claim proof** | **Open** |
| **Durable RCA in repo docs** | **Open** |
| **Gate + AGENTS prevention** | **Open** |
| **SelfApplyFs split** | **Open** |
| Short ProductPathFreestanding rename | Open residual; not RCA root |

---

## 4. Recommended approach

Order matters. Do not start short-name renames before proof + prevention gates.

### Track 1 -- Prove claim B is real (unfuck verification)

**Red first:** add a check that fails if product Lean contains stitch markers, and make claim-complete success require lake when lake is on PATH.

1. **Marker ban:** fail novel `src/**/*.lean` if a line matches `^====` or merge conflict markers. Prefer pure Nix folded into `just hygiene` (three-languages tooling). Cheap; no lake required.
2. **Claim-complete recipe:** `just freestanding-self-host-complete` keeps greps but, when `lake` is on PATH, also runs `lake build slake-freestanding-self-host-complete`. When lake is missing, residual may say BLOCKED for elaborator proof, not full GREEN for claim flip.
3. Record lake exit codes in implement summaries for claim flips.

TDD for marker ban: gate must be able to fail on the known corrupt sample **without** copying junk into `src/` (check a path under `/tmp` in a unit of the Nix test, or document fixture policy). Live tree stays clean and green.

### Track 2 -- Durable RCA

- Write `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md` with header **Kind: analysis only. Not residual.** Body = section 3 counts and causal chain (so `/tmp` evidence loss does not erase the lesson).
- Pin Decisions in `RESIDUAL-systems.md` and `doc/SESSION-HANDOFF.md` pointing at that note + prevention Open Names.

### Track 3 -- Process law (AGENTS + implement skill)

Document:

1. Never rebuild a product Lean file by writing a full reconstructed copy from `/tmp`. Surgical in-place edits only. If too large, stop and split (new residual), do not stitch.
2. Ban cut-mark lines (`==== ... ====`) in product sources and in any file that will be concatenated into product sources.
3. Claim-bool flips: Done when includes lake build when lake available; grep pins alone are not enough for APPROVE.
4. Implementer summaries may not mark GREEN on claim flips without lake command + exit code (or explicit BLOCKED: lake missing).
5. Parent/reviewer: reject grep-only claim-flip GREEN.

### Track 4 -- Structural unfuck (SelfApplyFs split)

Long-term fix. Without it, the next large tip edit recreates stitch pressure.

Target end state (phased, not one PR):

| Layer | Owns |
|-------|------|
| `SelfApplyFs.lean` | Living tip claim bools only + thin imports (prefer hundreds of lines, not 6498) |
| Step modules / Partial modules | Historical PartialReady / Ok / Measured per closed step |
| Short role modules | Dual-pin + lake exe |

Batches:

1. Inventory all 33 `PartialReady` defs and which just/nix tokens require `SelfApplyFs` path strings.
2. Move one closed historical family out with import; dual-pin gates; lake green; stop.
3. Hard rule: new PartialReady for new steps goes in the short module first; SelfApplyFs only folds or imports.

### Track 5 -- Residual board

After Tracks 1-3: highest-value next = lake-proof + marker ban + split batch 1. Short-name rename residual stays open but not ahead of proof/split.

---

## 5. Implementation steps (after approval)

### Step 0 -- Freeze method

- No full-file rewrite of SelfApplyFs from `/tmp`.
- No bulk rename in the first implement loop.
- Preserve claim bools: complete true; free/llvm/PROVABLY false.

### Step 1 -- Marker ban gate

- Pure Nix (prefer extend `nix/source-hygiene.nix` or small `nix/lean-source-shape.nix`) + `just hygiene` / `just check`.
- AGENTS one-liner: stitch markers forbidden in product Lean.

### Step 2 -- Claim-complete uses lake when available

- Update `freestanding-self-host-complete` default path.
- Run and record lake build on fixed tree.

### Step 3 -- Durable RCA note + residual pins

- Research note with section 3 facts.
- RESIDUAL / SESSION-HANDOFF Decisions.
- Open prevention Names.

### Step 4 -- AGENTS + implement skill pins

- Project AGENTS.md + host implement skill Done-when rules for claim flips.

### Step 5 -- SelfApplyFs split batch 1 (separate loop if large)

- Inventory; move one family; lake + host + emit-wire + hygiene green; stop.

### Step 6 -- Short-name rename batch only after 1-5

- Existing WATCHER residual; surgical; no bulk sed.

---

## 6. Critical files

| Path | Why |
|------|-----|
| `src/systems/SystemsLean/SelfApplyFs.lean` | Living tip; 6498 lines; failure site |
| `src/systems/SystemsLean/SelfHostComplete.lean` | Claim B short module; lake exe |
| `src/systems/SystemsLean/DualResidual.lean` | complete true + free false |
| `src/systems/lakefile.toml` | slake-freestanding-self-host-complete |
| `justfile` | grep vs measure recipes |
| `nix/source-hygiene.nix` (or new small module) | marker ban |
| `nix/systems-host-presence/` / `nix/systems-emit-wire/` | text token gates today |
| `src/systems/check.sh` | optional lake when on PATH |
| `AGENTS.md` | process law |
| `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md` | durable RCA (create) |
| `RESIDUAL-systems.md` / `RESIDUAL.md` / `WATCHER.md` / `doc/SESSION-HANDOFF.md` | residual honesty |
| Evidence (ephemeral): `/tmp/grok-1000/sec-b40-ownership.lean`, `SelfApplyFs-complete.lean` | cite into research note before reboot |

## 7. Reuse

- Fix summary: `/tmp/grok-1000/grok-impl-fix-complete-corruption.md`
- Review: `/tmp/grok-1000/grok-review-complete.md`
- Short module pattern: `StepContractFull.lean`, `OwnershipClaimed.lean`
- Hygiene pure Nix pattern: `nix/source-hygiene.nix`

## 8. Risks

| Risk | Mitigation |
|------|------------|
| Lake mandatory breaks hosts without elan | Fail closed when lake present; BLOCKED when absent for claim-flip proof |
| Split breaks greppable nix paths | Inventory tokens first; dual-pin during move |
| Agents ignore AGENTS prose | Encode bans in pure Nix / just so violation is RED |
| `/tmp` evidence lost | Research note Step 3 same day |
| Re-break tip during split | No full rewrite; import-based move; lake every batch |

## 9. Verification

| Check | Pass |
|-------|------|
| `rg -n '^====' src --glob '*.lean'` | no matches |
| New marker gate | GREEN live; can RED on corrupt sample outside src |
| `just freestanding-self-host-complete` with lake on PATH | runs lake build; exit 0 |
| `cd src/systems && lake build` (or targeted exe) | exit 0 |
| systems-host / systems-emit-wire / hygiene | GREEN |
| Claim bools | complete true; free/llvm/PROVABLY false |
| RCA note | exists; cites 6537 lines, 166-line hole, 4 markers, implementer id |
| AGENTS pins | present |

## 10. Defaults if unanswered

1. Lake missing: pins may run; claim-flip residual says BLOCKED for elaborator proof, not full GREEN.
2. Split before large rename.
3. Marker ban in pure Nix via `just hygiene`.

## 11. Success criteria for unfuck

1. RCA durable on disk with exact counts and paths.
2. A `====` stitch cannot land under `src/**/*.lean` without a red gate.
3. Claim B complete cannot be called GREEN on this machine without successful lake build when lake is on PATH.
4. AGENTS/implement law forbids `/tmp` full-file rebuilds of product Lean.
5. Residual highest-value next is split (or rename only after split batch 1).
6. Live tip: complete true; free/llvm/PROVABLY false; no markers.

### Critical Files for Implementation

- `src/systems/SystemsLean/SelfApplyFs.lean` -- living tip; do not full-rebuild
- `justfile` -- complete recipe lake coupling
- `nix/source-hygiene.nix` -- marker ban
- `AGENTS.md` -- process law
- `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md` -- RCA
- `RESIDUAL-systems.md` / `WATCHER.md` / `doc/SESSION-HANDOFF.md` -- board honesty
