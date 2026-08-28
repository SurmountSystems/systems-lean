# Cold elaborate day-to-day use map (2026-08-07)

Kind: analysis only. Not residual invent beyond the ordered queue.
Not FullHostElaborateRemains pin flip. Not DualResidual free forge.
Not product free / complete / PROVABLY re-open. Not host free claim.

ASCII only. Plain American English. Date: 2026-08-07.

**Slice:** Slice 1 of B2 unblock path (protocol evidence only).
**Program:** `.agents/plans/plan-slake-replaces-lake.md` Phase B / section 5.
**Sources:** `.agents/reports/b2-unblock-paths-2026-08-07.md` (E1-E7);
`.agents/reports/b2-evidence-criteria-2026-08-07.md`;
`just/host.just`, `just/host-without-lake.just`, `just/host-tool-expand.just`,
`just/dual-side.just`, `just/product-wire.just`, `just/freestanding-capable.just`;
`src/systems/SystemsLean/HostResidualShrink.lean` (pin greps only; no pin false);
join open `.agents/joins/a63-open-cold-elaborate-use-map.md`.

**Join this pass:** `.agents/joins/a64-cold-elaborate-use-map.md`.

---

## 1. Plain English pin meaning

**Pin:** `hostResidualShrinkFullHostElaborateRemains` in
`src/systems/SystemsLean/HostResidualShrink.lean` is **`true`**.

**Meaning:** Classic Lake is still required to **fully elaborate the SystemsLean
host library** under `src/systems/` at least once after a total `.lake` wipe
(cold full package elaborate). Peer fragment tools, clean-bootstrap `leanc`
relinks, and without-Lake hot paths do **not** replace that job. A8 only
retired **peer bin prebuild** via `leanc` when IR objects and link rsp already
exist. It did **not** retire library elaborate.

Related living pins (do not conflate):

| Pin | Value | Meaning |
|-----|-------|---------|
| `hostResidualShrinkFullHostElaborateRemains` | **true** | Cold full SystemsLean elaborate still needs Lake |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** (A8) | Foundation tool ELFs can relink with leanc without `lake build` when IR exists |
| `hostResidualShrinkDiagnosticLakeRecipesRemain` | **true** | Diagnostic / unit recipes may still call lake |
| `hostElaboratorResidualRemains` | **true** | Host elaborator residual remains (DualResidual program) |
| `hostElaboratorResidualFreeClaimed` | **false** | DualResidual free not claimed |
| `hostResidualShrinkHostFreeClaimed` | **false** | Host free not claimed |

**B2 is not DualResidual free.** Free requires the full layer-1 checklist.
B2 is only checklist item 5 honesty: cold full `lake build` is bootstrap /
emergency / claim-proof only, not the normal day-to-day develop loop.

Operator free-checklist choice (already recorded): **(a)** full host develop --
retire cold full elaborate from day-to-day. Not "stop at six units."

**This note does not flip any pin.** Pin flip is Slice 4 after E1-E6 evidence.

---

## 2. Day-to-day without-Lake / clean-bootstrap host develop recipes

Class legend:

| Class | Meaning |
|-------|---------|
| **day-to-day without-Lake** | Hot path runs prebuilt ELF / peer tool; no `lake build` of full package on that step |
| **clean-bootstrap** | Relink tool ELFs with `leanc` from existing IR+rsp; no lake on that step; missing IR needs wipe-bootstrap first |

| Recipe | Job | Class |
|--------|-----|-------|
| `just host-package-roots-without-lake` | Load package roots + library module list (SystemsLean config + SystemsLean/*.lean walk) | day-to-day without-Lake |
| `just host-import-graph-without-lake` | Seed import graph on Mult..SpecProofTheorems (modules=206) | day-to-day without-Lake |
| `just host-module-check-without-lake` | Structural module check on seed 206 (PARTIAL-STRUCTURAL + Mult..Extract FOUNDATION-KIND-SURFACE) | day-to-day without-Lake |
| `just host-package-write-without-lake` | Mult..Compose package write dual-ok under without-Lake | day-to-day without-Lake |
| `just host-fragment-check-without-lake` | Fragment check goldens accept/reject (foundation tool) | day-to-day without-Lake |
| `just host-graph-without-lake` | Host graph expand Mult..Compose fail-closed | day-to-day without-Lake |
| `just host-foundation-tools-clean-bootstrap` | Relink six foundation tools: fragment-check, graph, package-write, package-roots, import-graph, module-check | clean-bootstrap |
| `just host-develop-tools-clean-bootstrap` | Relink five develop tools: host-front, subset-front, front-mult-package, mult-subset-rebuild, first-surface | clean-bootstrap |
| `just host-front-without-lake` | Host front goldens path without lake on hot path | day-to-day without-Lake |
| `just subset-front-without-lake` | Subset front without lake on hot path | day-to-day without-Lake |
| `just front-mult-package-without-lake` | Front Mult package join without lake on hot path | day-to-day without-Lake |
| `just mult-subset-rebuild-without-lake` | Mult subset rebuild measured step without lake | day-to-day without-Lake |
| `just first-surface-without-lake` | First surface without lake on hot path | day-to-day without-Lake |
| `just subset-packages-rebuild-join-without-lake` | Multi-unit subset package join without lake | day-to-day without-Lake |
| `just freestanding-capable-regenerate-without-lake` | Product wire regenerate (Name A prebuilt) without lake | day-to-day without-Lake (product wire) |
| `just product-wire-freestanding-write` | Product wire WRITE+INSTALL hot path (Name B Lean-native) | day-to-day without-Lake (product wire) |
| `just build` | Official product freestanding wire -> emit + out/freestanding-c (no lake on hot path) | day-to-day without-Lake (product wire) |

**Prerequisite honesty:** every without-Lake and clean-bootstrap recipe above
expects prior Lake IR and link rsp under `src/systems/.lake/` (or an equivalent
recovery). If IR is missing, the recipe fails closed and prints a one-shot
`(cd src/systems && lake build <tool>)` recovery -- that is **wipe-bootstrap**,
not day-to-day.

**Day-to-day set named (E1):** roots, import-graph, module-check, package-write,
foundation tools, develop tools, product wire. A60 already closed day-to-day
lean_exe **candidates** as empty (all owned or carved claim/diagnostic).

---

## 3. Remaining Lake-using steps (not day-to-day)

| Recipe / surface | Job | Class |
|------------------|-----|-------|
| `just systems-lake` / `(cd src/systems && lake build)` | Cold full package elaborate of SystemsLean | **wipe-bootstrap** / emergency |
| `(cd src/systems && lake build <tool>)` when IR/rsp missing | Produce IR + rsp for foundation/develop tools before clean-bootstrap | **wipe-bootstrap** prerequisite |
| Lake recipes that build claim freestanding / perform / ownership / self-host exes | Claim-bool proof while Lake is host elaborator (AGENTS lake-on-PATH) | **claim-proof** |
| `llvm-*-text` writers and similar compact Lake-only inventory | Deferred / diagnostic llvm text writers | **diagnostic** / deferred track |
| Product-wire / subset emit-rebuild / fs-write Lake mains outside owned without-Lake set | Lake exe entrypoints still exist; day-to-day uses without-Lake duals | **not day-to-day** (honesty class claim-exes+llvm-text-writers+product-wire-Lake-mains) |
| `*Main` (59) lake exe entrypoints | L-band out-of-scope lake-built bins | **not day-to-day** |
| Host harness (5): HostImportGraph, HostModuleCheck*, HostResidualShrink | Drive without-Lake checks; not seed body | **not day-to-day** (harness) |
| `just host-package-roots` / `host-import-graph` / `host-module-check` (Lake bootstrap path) | Lake build + exe variants of roots/import/check | **wipe-bootstrap** / bootstrap path (prefer without-Lake for day-to-day) |
| `just host-residual-shrink` | Greps living pins; currently **requires** FullHostElaborateRemains **true** | **diagnostic** honesty gate (not develop hot path) |
| Diagnostic unit lake recipes (`DiagnosticLakeRecipesRemain` true) | Optional unit / diagnostic lake | **diagnostic** |

**No class is "normal edit-check loop" for cold full library elaborate.** Day-to-day
edit-check uses the without-Lake matrix in section 2 (structural check bar per E5a).

---

## 4. B2 accept criteria E1-E7 (shortened)

Before `hostResidualShrinkFullHostElaborateRemains` may go **false**:

| # | Claim | Status after this Slice 1 note |
|---|-------|--------------------------------|
| **E1** | Day-to-day host develop recipe set is named (roots, import graph, module check, package write, foundation tools, develop tools, product wire) | **Met by this note** (section 2) |
| **E2** | Every day-to-day recipe is GREEN without cold full `lake build` of the library on that step | **Met after Slice 2 matrix** on living IR tree (see wipe-recovery note section 4); Slice 1 section 6 was partial with existing IR |
| **E3** | Cold full `lake build` under `src/systems/` classified only as bootstrap-after-total-wipe / emergency / claim-proof / optional diagnostic | **Met by this note** (section 3) |
| **E4** | After IR exists, total-wipe recovery documented: one classic Lake elaborate (or named package subset), then clean-bootstrap + without-Lake day-to-day | **Met-documented after Slice 2** -- `doc/dev/research/wipe-recovery-bootstrap-evidence-2026-08-07.md` (not Met-measured-total-wipe) |
| **E5** | Honesty bar for "check" is explicit: (5a) PARTIAL-STRUCTURAL + Mult..Extract FOUNDATION-KIND-SURFACE is the living day-to-day check bar for B2, **or** (5b) named deepen toward real elaborate | **E5a chosen for B2** (section 5); not full Lean elaborator |
| **E6** | Claim / diagnostic / *Main / harness stay out of day-to-day bar with greppable honesty | **Met** (A59/A60 + section 3) |
| **E7** | Pin dual-ok false only after E1-E6; DualResidual free stays false; product pins unchanged; hygiene + residual-shrink green | **Not met** -- Slice 4 only after E1-E6 |

**What does not alone satisfy B2:** A60 empty tool list; seed 206 PARTIAL-STRUCTURAL;
product StillUsesLake false; DualResidual free flip; this protocol note alone
without E4 + dual-ok.

---

## 5. E5a default: living day-to-day check bar

**Default for B2 (operator choice (a) day-to-day, not invent full elaborator):**

- Living HostModuleCheck honesty is **PARTIAL-STRUCTURAL** (package-local imports
  + key decls) for the 206-module seed.
- Deepen bar **FOUNDATION-KIND-SURFACE** applies to Mult..Extract only
  (structures/axioms + theorem corpus counts on foundation units).
- That bar **is** the accepted day-to-day "check" surface for B2 reclassification
  of cold full Lake as bootstrap/claim-proof only.
- It is **not** full Lean 4 elaborator typecheck of module bodies for the seed,
  *Main, or full package cold build.
- Optional Slice 3 may raise capacity later; it is not required to **name** the
  day-to-day set (this Slice 1). Operator may still require Slice 3 before Slice 4
  if they reject E5a for the pin flip.

---

## 6. Matrix run results (this host, 2026-08-07)

Ran from repo root with existing `src/systems/.lake` IR (not a total wipe).

| Recipe | Exit | Notes |
|--------|------|-------|
| `just host-package-roots-without-lake` | **0** | GREEN; modules=271 libraryLeanFiles=270; withoutLake finished |
| `just host-import-graph-without-lake` | **0** | GREEN; seed import graph without lake on hot path |
| `just host-module-check-without-lake` | **0** | GREEN; modules=206; depth=PARTIAL-STRUCTURAL; deepen=FOUNDATION-KIND-SURFACE |
| `just host-foundation-tools-clean-bootstrap` | **0** | GREEN; 6 foundation tools relinked with leanc; no lake |
| `just host-develop-tools-clean-bootstrap` | **0** | GREEN; 5 develop tools relinked with leanc; no lake |
| `just build` | **0** | GREEN; product-wire-freestanding-write dual-eq WRITE+INSTALL; no lake on hot path |
| `just hygiene` | **0** | source-hygiene OK; professional-tone OK |

**Skipped / not required this slice:** full wipe of `.lake` then recovery (that is
Slice 2). Individual `*-without-lake` develop-tool recipes were not each re-run
after clean-bootstrap; clean-bootstrap GREEN plus prior dual-oks cover inventory.
If IR had been missing, recipes would fail closed with "needs lake bootstrap once"
and class as wipe-bootstrap prerequisite -- pins still would not flip.

**Pin greps after matrix (unchanged):**

| Def | Value |
|-----|-------|
| `hostResidualShrinkFullHostElaborateRemains` | **true** |
| `hostElaboratorResidualFreeClaimed` | **false** |
| `hostResidualShrinkHostFreeClaimed` | **false** |
| `hostElaboratorResidualRemains` | **true** |

---

## 7. Explicit non-claims (this slice)

- **FullHostElaborateRemains stays true.** No dual-ok false. Residual-shrink still
  expects pin true.
- **DualResidual free stays false.** Host free not claimed. Not A-last.
- **Product free / complete / PROVABLY** and product StillUsesLake / DependsOnLake
  pins are **not** reopened here.
- **Not full elaborator.** PARTIAL-STRUCTURAL + FOUNDATION-KIND-SURFACE is not
  Lean body typecheck of the library.
- **Not wipe recovery measurement.** Section 6 used existing IR; E4 remains open
  for Slice 2.
- **Not B2 Done when.** B2 pin false is Slice 4 after E1-E6.

---

## 8. Next after Slice 1 (historical; Slice 2 landed)

Slice 2 **Wipe recovery bootstrap evidence** is **done** (A65). Evidence note:
`doc/dev/research/wipe-recovery-bootstrap-evidence-2026-08-07.md`. E4
**Met-documented**. Next implementable residual is Slice 4 pin false (optional
Slice 3 if operator rejects E5a). DualResidual free never lands in B2 alone.

---

## Bottom line

| Question | Answer |
|----------|--------|
| Pin meaning | Cold full SystemsLean library elaborate still needs classic Lake after wipe; peer without-Lake paths do not replace it |
| Day-to-day set | Named in section 2; matrix GREEN with existing IR (section 6) |
| Remaining Lake | Section 3: wipe-bootstrap / claim-proof / diagnostic / not day-to-day only |
| E5a | PARTIAL-STRUCTURAL + Mult..Extract FOUNDATION-KIND-SURFACE is B2 day-to-day check bar |
| Pin / free | FullHostElaborateRemains **true** until Slice 4; DualResidual free **false** |
| Next | Slice 4 FullHostElaborateRemains false (after Slice 2 E4 Met-documented) |
