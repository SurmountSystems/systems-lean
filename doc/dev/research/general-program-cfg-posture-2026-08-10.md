# General program CFG posture beyond unit diamonds (2026-08-10)

Kind: analysis only. Not residual claim flip. Not full LLVM production backend.
Not R1e fullBackend true. Not product C growth. Not Program/Graph foreign link.

ASCII only. Plain English. Date: 2026-08-10.

**Greppable:** general program CFG, unit diamonds only, PRODUCTION-CFG,
`llvmCfgFixtureFullBackendClaimed` false, Mult DF partial, R1e honesty

**Bar SSoT:** `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`
**CFG home:** `src/systems/SystemsLean/LlvmCfgFixture.lean` (~1145 lines; Sub-1-KLOC residual)
**Types foreign (disjoint R2, done same day):** `just types-foreign-link-success`

---

## 1. What is on disk today (unit diamonds)

Production CFG dual-pin evidence is **five hand-table unit diamonds**, each
matching generator-owned SSA IR for one band:

| Band | Diamond focus (honest) | Gate |
|------|------------------------|------|
| Mult | grade_tag SSA blocks/edges + idom + four-pred merge phi | `just production-cfg-deepen` |
| Linear | live_flag multi-unit Mult+Linear | `just linear-cfg-production-deepen` |
| Types | kind_tag multi-unit Mult..Types | `just types-cfg-production-deepen` |
| Program | push_status multi-unit Mult..Program | `just program-cfg-production-deepen` |
| Graph | add_edge multi-unit Mult..Graph | `just graph-cfg-production-deepen` |

Plus Mult dominance frontier **partial** structural table
(`just mult-dominance-frontier-partial`; `DominanceClaimed` **false**).

**Honesty pin living tip:** `llvmCfgFixtureFullBackendClaimed` **false**;
production opt **false**; full dominance pipeline **false**.

**Unit diamonds only (proposed thin honesty name):** the production CFG story
today is five band-local diamond tables dual-pinned to unit SSA, **not** a
general program CFG builder over arbitrary multi-node IR. That is success for
R1a..R1d progressive dual-pin. It is **not** general CFG construction.

---

## 2. What general CFG would mean (bar slice, not claim)

For residual **General program CFG posture** (Full LLVM Done when item 7), a
checkable next step is evidence that production CFG is **not only** the five
unit diamonds:

| Checkable outcome | Honest non-claim |
|-------------------|------------------|
| Named dual-pin in `LlvmCfgFixture` (or a role split module) against a generator-owned IR shape that is not a copy of the five unit diamonds alone | fullBackend stays false |
| Pure Nix + just recipe folded into `just systems-llvm-ir` | not production opt |
| lake build of the CFG module exit 0 | DominanceClaimed stays false until full DF residual |
| Optional: thin host bool e.g. `productionCfgUnitDiamondsOnlyClaimed` true while general posture open | not R1e fullBackend flip |

**Preferred first product shape (research recommendation):** one multi-unit
**compose or ordered IR program** fixture with CFG that has more structure than
a single diamond per band (for example a chain of unit lowers, or a host
compose path with two merge points), dual-pinned to existing generator IR
without inventing a full production CFG pass.

**Long-file rule:** `LlvmCfgFixture.lean` is already over Sub-1-KLOC. Prefer
**module split** (role helper for general CFG tables) before growing the tip
past stitch risk. Do not full-file rebuild from `/tmp`.

---

## 3. Optional thin host bool (not landed this wave)

Name sketch (do not mint until implement residual opens it):

- `productionCfgUnitDiamondsOnlyClaimed : Bool := true` while general CFG open
- Flip to false only when general dual-pin green
- Never alias `llvmCfgFixtureFullBackendClaimed`

This wave lands **Types foreign link success** (R2) and this research note only.
Optional bool deferred to general CFG implement so LlvmCfgFixture is not raced
with foreign work and long-file residual stays serialized.

---

## 4. Remaining Full LLVM progressive

| Slice | Status |
|-------|--------|
| R1a Mult production CFG dual-pin | done |
| R1b Types multi-unit CFG | done |
| R1c Mult DF partial | done (DominanceClaimed false) |
| R1d Program+Graph multi-unit CFG | done |
| General CFG beyond unit diamonds | **open** (this note; implement residual) |
| R1e fullBackend claim | **false** until bar complete + honesty review |
| R2 Mult/Linear/Types foreign | **done** band-local |
| R2 Program/Graph foreign | not claimed |

---

## 5. Gates (when general CFG lands)

```
just hygiene
just systems-llvm-ir
lake build SystemsLean.LlvmCfgFixture   # or role module
# focused just recipe when added
```

free / complete / PROVABLY / FullHostElaborateRemains **unchanged**.
fullBackend **false**. Do not forge R1e.

---

Analysis only. Next implement: general program CFG posture residual (or long-file
LlvmCfgFixture split if growth required first).

---

## Implement land (2026-08-10)

**Status: met (partial general posture; not fullBackend).**

| Item | Landed |
|------|--------|
| Long-file split | `LlvmCfgHonesty` / `LlvmCfgMultProduction` / `LlvmCfgMultDf` / `LlvmCfgUnitProduction` / `LlvmCfgGeneral` / tip `LlvmCfgFixture` (~463 lines) |
| General dual-pin | `generalCfgConstructionPartial` compose multi-merge + unit roots chain |
| Unit-diamonds-only | `productionCfgUnitDiamondsOnlyClaimed` **false** |
| Gate | `just general-program-cfg-partial`; pure Nix `cfg-general-program-partial.nix` |
| fullBackend | **false** (R1e open) |

Not a full iterative CFG constructor over arbitrary multi-node IR (that
landed later as `iterativeCfgConstructionPartial` / `just iterative-cfg-construction-partial`;
still not fullBackend).
