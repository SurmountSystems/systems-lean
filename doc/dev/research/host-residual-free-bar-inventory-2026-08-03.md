# Host residual free bar inventory (living gap vs section-4)

Kind: analysis only. Not residual invent. Not host free forge. Not DualResidual
pin flip. Not product free re-open. Not Track 4c. ASCII only. Date: 2026-08-03.

**Design SSoT (section-4 bar):**
`doc/dev/research/host-residual-free-design-2026-08-03.md` section 4.

**Related living inventory:**
`src/systems/SystemsLean/HostResidualShrink.lean`,
`src/systems/SystemsLean/DualResidual.lean`,
`src/systems/SystemsLean/HostPackageWrite.lean`,
`just host-residual-shrink`,
`just host-package-write-without-lake`,
`just systems-lake` / full `lake build` under `src/systems/`.

**Join context:** Peer package ladder Mult+Linear+Types+Program+Graph+Compose
dual-ok is **done** (Track 3b-5..3b-9). This note lists the **living gap** to
the section-4 free bar under the **operator-chosen** scope. It does **not** open
Track 3c free flip.

**Operator decision (2026-08-03, choice (a)):** free checklist scope is **full
SystemsLean host develop** -- retire cold full elaborate from day-to-day develop.
**Not** choice (b) stop at Mult..Compose six units only. Documented defaults in
`.agents/plans/plan-slake-replaces-lake.md` section 10 and design section 4
recommended bar (reseeded same day). Mult..Compose dual-ok remains **not** host
free under this new bar.

---

## 1. Aggregate honesty (unchanged by this inventory)

| Claim surface | Living pin | Status |
|---------------|------------|--------|
| Product residual free | `DualResidual.residualFreeClaimed` | **true** |
| Product path StillUsesLake / DependsOnLake | SelfApplyFs / SelfHostComplete tip | **false** |
| Host elaborator residual remains | `DualResidual.hostElaboratorResidualRemains` | **true** |
| Host elaborator residual free claimed | `DualResidual.hostElaboratorResidualFreeClaimed` | **false** |
| Partial Mult-first peer shrink | `HostResidualShrink.hostResidualPartialShrinkClaimed` | **true** |
| Host free (Track 3c end claim) | remains false until bar met | **not claimed** |

**Explicit:** Mult..Compose package dual-ok is **NOT** host free.

---

## 2. What peer coverage already met (evidence)

| Surface | Status | Greppable / recipe evidence |
|---------|--------|------------------------------|
| Fragment Mult..Compose | **MET** | `measuredHostPeerFragmentUnits` =
  `Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose`;
  recipes `host-fragment-check-without-lake`, `host-graph-without-lake` |
| Package Mult..Compose dual-ok | **MET** | `measuredHostLakeFreePackageUnits` =
  `Mult+Linear+Types+Program+Graph+Compose`;
  `hostPackageWriteComposePackageDualOk` true (+ MultLinear / Types / Program /
  Graph dual-ok pins true); recipe `host-package-write-without-lake`;
  gate `just host-residual-shrink` GREEN (2026-08-03 inventory slice) |
| Free design note path cite | **MET** | `freeDesignNotePath` =
  `doc/dev/research/host-residual-free-design-2026-08-03.md` |

Package dual-ok and fragment expand close the **named Mult..Compose unit host
develop** half of the recommended residual bar in design section 4. They do
**not** close full SystemsLean cold elaborate, bootstrap prebuild honesty, or
DualResidual free flip.

---

## 3. Section-4 requirement rows (1-7) vs living evidence

Flip `hostElaboratorResidualRemains` to **false** and
`hostElaboratorResidualFreeClaimed` to **true** only when **all** hold
(design section 4). Living status after Mult..Compose package dual-ok:

| # | Requirement | Status | Living evidence |
|---|-------------|--------|-----------------|
| 1 | Named host develop residual bar documented | **MET under new bar (full host develop)** | Design section 4 reseeded: default = full SystemsLean host develop (choice (a)); Mult..Compose is foundation only; program `plan-slake-replaces-lake.md` |
| 2 | Coverage without Lake on the normal step for every named surface in that bar | **MET for Mult..Compose foundation only; OPEN for full host** | Three recipes green for Mult..Compose fragment/package foundation. Full host package elaborate/check/build still Lake. A2 design **done** (`full-host-elaborator-design-2026-08-03.md`). Next work: **Package roots without Lake** (A3) then expand coverage |
| 3 | Inventory of what still uses Lake is residual-honest | **OPEN under choice (a)** | Operator chose **(a)** retire cold full elaborate from day-to-day develop (not (b) six units only). Bootstrap prebuild, claim-proof lake, full-package cold elaborate still true pins; must be retired or reclassified as one-time bootstrap with evidence before free flip |
| 4 | DualResidual flip with elaborator proof | **OPEN** | `hostElaboratorResidualRemains := true`; `hostElaboratorResidualFreeClaimed := false` (`DualResidual.lean`); no free flip until full checklist under choice (a) |
| 5 | HostResidualShrink inventory reseed | **MET for Mult..Compose foundation; OPEN for free** | Reseeded Mult..Compose fragment + package dual-ok; `hostResidualPartialShrinkClaimed` true; `hostResidualShrinkHostFreeClaimed` false; bootstrap/full-elaborate remains true |
| 6 | Product pins unchanged | **MET** | free/complete/PROVABLY true; product StillUsesLake false; llvmUnlocked true (not full backend); proofCompleteClaimed false -- tip not re-opened by inventory |
| 7 | Residual lockstep | **MET this slice / reseeded A1** | Research notes + RESIDUAL-systems / RESIDUAL / WATCHER / SESSION-HANDOFF / plan tip / surface-matrix Host residual free row |

**Section-4 overall under new bar (choice (a)):** **NOT MET**. Track 3c free flip
**held**. Mult..Compose dual-ok is **not** host free.

---

## 4. Remaining section-4 blockers (open, with paths)

| Blocker | Living pin / recipe | Evidence path |
|---------|---------------------|---------------|
| DualResidual host residual remains | `hostElaboratorResidualRemains := true` | `src/systems/SystemsLean/DualResidual.lean` |
| Host free not claimed | `hostElaboratorResidualFreeClaimed := false` | same; theorems/smoke require false |
| Bootstrap prebuild of peer bins | `hostResidualShrinkBootstrapPrebuildRemains := true` | `HostResidualShrink.lean`; bootstrap `lake build slake-host-fragment-check` / `slake-host-graph` / `slake-host-package-write` before without-Lake hot path |
| Full SystemsLean cold elaborate still Lake | `hostResidualShrinkFullHostElaborateRemains := true` | `HostResidualShrink.lean`; cold `just systems-lake` / `lake build` under `src/systems/` (~256 host modules); not peer fragment alone |
| Diagnostic Lake recipes remain | `hostResidualShrinkDiagnosticLakeRecipesRemain := true` | HostResidualShrink; unit/diagnostic lake recipes |
| HostPackageWrite local Lake honesty | `stillUsesLake := true`, `dependsOnLake := true` | `src/systems/SystemsLean/HostPackageWrite.lean` (bootstrap honesty; without-Lake hot path does not delete Lake bootstrap) |
| Host free claim false on shrink inventory | `hostResidualShrinkHostFreeClaimed := false` | `HostResidualShrink.lean` |
| Surface matrix row open | Host residual free **open** | `src/systems/surface-matrix.md` |

**Optional hygiene (not free bar, checkable):**
`HostPackageWrite.lean` **1015** lines (over sub-1-KLOC); also HostFront **1215**,
HostGraph **1116**. Coherent long-file split residual is agent-doable without
any free flip.

---

## 5. What Mult..Compose package dual-ok is not

- **Not** host residual free
- **Not** DualResidual remains false
- **Not** full SystemsLean peer elaborator
- **Not** "Lake binary never exists on disk"
- **Not** product free re-open / complete / PROVABLY / llvm tip change
- **Not** proof complete (Track 4)
- **Not** full LLVM backend (Track 5)

---

## 6. Recommended next residual Names (not Track 3c free flip)

| Priority | Name | Why | Out of scope |
|----------|------|-----|--------------|
| **Primary next (after A2 design)** | **Package roots without Lake** | First full-package surface: load package roots / module list without Lake on measured step (design A3) | Free flip; full elaborate; mathlib |
| Design done | **Full host elaborator design** | Research `full-host-elaborator-design-2026-08-03.md`; queue A3..A-last | Free flip (correctly not flipped) |
| Supporting | **Host-cc helper tools without C printed from Lean** | After multi-language print inventory: retire MultFsWriteTool / ProductWireWriteTool full C printers if still temporary-helper debt | Forging free; rewriting freestanding product APIs as main work |
| Hygiene (done) | HostPackageWrite / HostFront / HostGraph long-file splits | Tips under 1000; DualResidual unchanged | Free flip |
| Policy | Host residual free residual (Track 3c) | **Held** until section-4 all rows met under **choice (a)** full host develop bar | Agent must not open 3c because Mult..Compose dual-ok is green |
| Not recommended as auto next | Invented theorem canaries sold as free progress | Theater vs full host checklist | Forges |

**Default after operator choice (a) + A1 reseed + A2 design:** open **Package
roots without Lake** (A3). Keep Track 3c **held**. Mult..Compose dual-ok is
**not** host free. Inventory and design alone do **not** flip DualResidual.

---

## 7. Non-claims (this slice)

- Does **not** flip DualResidual host residual pins
- Does **not** claim host residual free
- Does **not** sell Mult..Compose package as free
- Does **not** re-open product free / complete / PROVABLY
- Does **not** forge llvm full backend or proof complete
- Does **not** grow product C or shell mills
- Does **not** half-cut HostPackageWrite for free progress

---

## 8. Pointers

| Artifact | Role |
|----------|------|
| Design section 4 | Free bar requirements 1-7 |
| This note | Living gap inventory after package Mult..Compose |
| `HostResidualShrink.lean` | Peer unit + package strings + remains pins |
| `DualResidual.lean` | host remains true; host free false |
| `HostPackageWrite.lean` | stillUsesLake / dependsOnLake true local honesty |
| `just host-residual-shrink` | Inventory gate GREEN |
| Residual / WATCHER / handoff | Free bar inventory **done**; operator choice (a); A1 docs reseed; A2 design **done**; next Package roots without Lake |
| Finish-line program | `.agents/plans/plan-slake-replaces-lake.md` |
