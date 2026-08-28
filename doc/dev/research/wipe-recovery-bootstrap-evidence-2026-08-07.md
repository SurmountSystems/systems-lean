# Wipe recovery bootstrap evidence (2026-08-07)

Kind: analysis only. Not residual invent beyond the ordered queue.
Not FullHostElaborateRemains pin flip. Not DualResidual free forge.
Not product free / complete / PROVABLY re-open. Not host free claim.

ASCII only. Plain American English. Date: 2026-08-07.

**Slice:** Slice 2 of B2 unblock path (E4 recovery evidence).
**Program:** `.agents/plans/plan-slake-replaces-lake.md` Phase B / section 5.
**Prior:** `doc/dev/research/cold-elaborate-day-to-day-use-map-2026-08-07.md` (Slice 1 A64).
**Sources:** `just/host.just` (`host-foundation-tools-clean-bootstrap`),
`just/host-tool-expand.just` (`host-develop-tools-clean-bootstrap`),
`just/host-without-lake.just` (without-Lake hot paths and recovery banners),
`src/systems/SystemsLean/HostResidualShrink.lean` (pin greps only; no pin false);
join this pass `.agents/joins/a65-wipe-recovery-bootstrap-evidence.md`.

---

## 1. Goal and honesty bar for this slice

**Goal:** Document and measure that cold full Lake is a **one-shot bootstrap**
when IR / link response files (rsp) are missing, then day-to-day host develop
returns to clean-bootstrap + without-Lake recipes. Do **not** flip
`hostResidualShrinkFullHostElaborateRemains` or DualResidual free here.

**Honesty about total wipe:** this pass did **not** run `rm -rf src/systems/.lake`
on the operator tree. Full total-wipe wall-clock was **not** measured. E4 is
**Met-documented** with:

1. Ordered recovery sequence taken from living recipe fail-closed messages.
2. Safe measured probes on a single foundation tool (missing ELF; missing rsp).
3. Without-Lake matrix GREEN after clean-bootstrap on the current tree (IR already
   present for full package objects).

That is enough for Slice 2 Done when (documented ordered steps + matrix exit 0
after bootstrap on the living tree). It is **not** a claim that a human timed
cold `lake build` after deleting the entire `.lake` directory in this session.

---

## 2. Ordered recovery sequence (recipe contract)

When foundation or develop tool IR/rsp is missing after a total wipe (or any
clean that removed Lake IR objects / `.rsp` files):

| Step | Action | Lake on this step? | Notes |
|-----:|--------|--------------------|-------|
| **0** | Observe fail-closed: without-Lake or clean-bootstrap prints recovery | n/a | Recipe refuses to invent IR |
| **1** | Cold one-shot: `(cd src/systems && lake build <tool>)` for each missing tool, **or** full `(cd src/systems && lake build)` / `just systems-lake` once for the whole package | **yes** (wipe-bootstrap only) | Restores IR objects under `.lake/build/ir/` and link `.rsp` under `.lake/build/bin/` |
| **2** | `just host-foundation-tools-clean-bootstrap` | **no** | Relinks six foundation ELFs with `leanc` from existing IR+rsp |
| **3** | `just host-develop-tools-clean-bootstrap` | **no** | Relinks five develop ELFs with `leanc` from existing IR+rsp |
| **4** | Day-to-day without-Lake matrix (section 4) | **no** on hot path | Roots, import-graph, module-check, develop tools, product wire |

**Foundation tools** (step 1 subset if only those missing):

- `slake-host-fragment-check`
- `slake-host-graph`
- `slake-host-package-write`
- `slake-host-package-roots`
- `slake-host-import-graph`
- `slake-host-module-check`

**Develop tools** (step 1 subset if only those missing):

- `slake-host-front`
- `slake-subset-front`
- `slake-front-mult-package`
- `slake-mult-subset-rebuild`
- `slake-first-surface`

**Canonical fail-closed text** (from `host-foundation-tools-clean-bootstrap` when
`.rsp` missing; develop recipe mirrors it):

```
error: missing link response file: .../<tool>.rsp
  clean-tree policy: total .lake wipe still needs classic Lake once to restore IR+rsp
  (FullHostElaborateRemains): (cd src/systems && lake build <tool>)
  then re-run: just host-foundation-tools-clean-bootstrap
```

Without-Lake recipes prefer clean-bootstrap first, then the same lake one-shot
when IR/rsp is still missing (see `just/host-without-lake.just` and
`just/host-tool-expand.just` banners: "prefer (no lake): just host-*-clean-bootstrap"
then "if IR/rsp missing (total wipe): (cd src/systems && lake build <tool>)").

**Class map (unchanged from Slice 1):**

| Class | Role after wipe |
|-------|-----------------|
| **wipe-bootstrap** | Cold `lake build` once (step 1) |
| **clean-bootstrap** | `leanc` relink only; no lake (steps 2-3) |
| **day-to-day without-Lake** | Prebuilt ELF hot path; no lake (step 4) |
| **claim-proof / diagnostic** | Still Lake when proving claim bools or unit diagnostics; not day-to-day edit loop |

Cold full library elaborate is **not** the normal edit-check loop. It is step 1
only when IR is gone.

---

## 3. Safe measured probes (this host, 2026-08-07)

Did **not** delete whole `.lake`. Used one foundation tool only:
`slake-host-package-roots`. Restored after each probe.

| Probe | Setup | Result | Exit |
|-------|-------|--------|------|
| **P1 missing ELF** | Removed `bin/slake-host-package-roots` only; left `.rsp` + IR objects | `just host-foundation-tools-clean-bootstrap` relinked all six foundation tools with `leanc` (no lake); ELF restored executable | **0** |
| **P2 missing rsp** | Moved `bin/slake-host-package-roots.rsp` aside; removed ELF | Fail-closed with clean-tree policy + `(cd src/systems && lake build slake-host-package-roots)` recovery banner | **1** |
| **P2 restore** | Restored `.rsp` file; re-ran clean-bootstrap | GREEN; ELF restored without lake | **0** |

**What probes prove:**

- Missing **ELF** with IR+rsp present: recovery is clean-bootstrap only (no lake).
- Missing **rsp** (proxy for wipe that took link responses): clean-bootstrap **cannot**
  invent rsp; fail-closed names classic Lake once, then re-run clean-bootstrap.
- Full package IR re-elaborate after total `.lake` wipe still classifies as
  wipe-bootstrap (recipe policy + FullHostElaborateRemains pin meaning). That
  wall-clock was not re-run this session.

---

## 4. Without-Lake matrix after clean-bootstrap (exit codes)

Ran from repo root on current tree after foundation + develop clean-bootstrap
(IR already present; not post-total-wipe). Date: 2026-08-07.

| Recipe | Exit | Notes |
|--------|------|-------|
| `just host-foundation-tools-clean-bootstrap` | **0** | 6 foundation tools relinked with leanc; no lake |
| `just host-develop-tools-clean-bootstrap` | **0** | 5 develop tools relinked with leanc; no lake |
| `just host-package-roots-without-lake` | **0** | modules=271 libraryLeanFiles=270; withoutLake finished |
| `just host-import-graph-without-lake` | **0** | seed modules=206; withoutLake finished |
| `just host-module-check-without-lake` | **0** | modules=206; depth=PARTIAL-STRUCTURAL; deepen=FOUNDATION-KIND-SURFACE |
| `just host-front-without-lake` | **0** | develop tool goldens accept/reject; no lake hot path |
| `just build` | **0** | product freestanding wire WRITE+INSTALL; no lake on hot path |
| `just hygiene` | **0** | source-hygiene OK; professional-tone OK |

**ALL_GREEN=1** for the matrix above.

---

## 5. Pin greps after matrix (unchanged this slice)

| Def | Value |
|-----|-------|
| `hostResidualShrinkFullHostElaborateRemains` | **true** |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** (A8) |
| `hostElaboratorResidualRemains` | **true** |
| `hostElaboratorResidualFreeClaimed` | **false** |
| `hostResidualShrinkHostFreeClaimed` | **false** |

No product Lean claim flips. No DualResidual free. No host free.

---

## 6. E1-E7 status after Slice 2

| # | Claim | Status after this note |
|---|-------|------------------------|
| **E1** | Day-to-day host develop recipe set named | **Met** (Slice 1 section 2) |
| **E2** | Day-to-day recipes GREEN without cold full lake on that step | **Met** for living IR tree: section 4 matrix GREEN after clean-bootstrap; no cold full lake on those steps |
| **E3** | Cold full lake classified bootstrap / emergency / claim-proof / diagnostic only | **Met** (Slice 1 section 3 + this note section 2) |
| **E4** | After IR exists, total-wipe recovery documented: one classic Lake elaborate (or named tool builds), then clean-bootstrap + without-Lake | **Met-documented** (sections 2-4). Partial measure: P1/P2 probes. **Not** Met-measured-total-wipe (`rm -rf .lake` not run) |
| **E5a** | PARTIAL-STRUCTURAL + Mult..Extract FOUNDATION-KIND-SURFACE living day-to-day check bar | **Met** (Slice 1; module-check matrix confirms bar) |
| **E6** | Claim / diagnostic / *Main / harness out of day-to-day with honesty | **Met** (A59/A60 + Slice 1) |
| **E7** | Pin dual-ok false only after E1-E6; DualResidual free stays false; hygiene green | **Not met** -- Slice 4 only (pin still true) |

**E5b** (deeper elaborator check) not required for B2 under operator E5a default.
Optional Slice 3 remains if the operator rejects E5a for the pin flip.

---

## 7. Explicit non-claims (this slice)

- **FullHostElaborateRemains stays true** until Slice 4 dual-ok false. This note
  does not flip the pin.
- **DualResidual free stays false.** Host free not claimed. Not A-last.
- **Not total `.lake` wipe measurement.** E4 is Met-documented + partial probe.
- **Not full elaborator.** PARTIAL-STRUCTURAL + FOUNDATION-KIND-SURFACE is not
  Lean body typecheck of the full library.
- **Not product free / complete / PROVABLY / StillUsesLake reopen.**
- **Not B2 Done when closed.** B2 pin false is Slice 4 after dual-ok + residual
  honesty, using E1-E6 written evidence (E4 Met-documented accepted for queueing
  Slice 4; implementer still proves pin false carefully).

---

## 8. Judgment: next residual after Slice 2

| Question | Answer |
|----------|--------|
| Slice 2 Done when | **Met** -- ordered steps + probe exits + matrix exit 0 + pin honesty + hygiene |
| E1-E6 for B2 queue | E1, E2 (living tree), E3, E4 Met-documented, E5a, E6 **yes** |
| Open FullHostElaborateRemains false? | **Yes as implementable Open** (Slice 4). Done when: dual-ok pin false + residual honesty + DualResidual free still false + lake elaborator proof while Lake is host elaborator. Do not forge. |
| Optional measured total wipe | Operator may still ask for a one-shot measured recovery after `rm -rf .lake` in a disposable worktree; not required to **close Slice 2** under documented-contract Done when |
| DualResidual free | **Held** forever relative to B2 alone; free only after full free checklist (A-last) |

---

## Bottom line

| Question | Answer |
|----------|--------|
| Recovery when IR/rsp missing | Cold lake once (tool or full package), then foundation + develop clean-bootstrap, then without-Lake day-to-day |
| Clean-bootstrap alone when only ELF missing | GREEN (P1) |
| Clean-bootstrap when rsp missing | Fail-closed exit 1 with lake recovery banner (P2) |
| Matrix after bootstrap | GREEN (section 4) |
| E4 | **Met-documented** (not Met-measured-total-wipe) |
| Pin / free | FullHostElaborateRemains **true**; DualResidual free **false** |
| Next | Slice 4: FullHostElaborateRemains false with dual-ok (optional Slice 3 if operator wants deeper check bar first) |
