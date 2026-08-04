# SelfApplyFs long-file split (2026-08-03)

Kind: analysis only. Not residual invent. Not free/complete/PROVABLY/llvm forge.
ASCII only. Date: 2026-08-03.

Closes residual Open Name **SelfApplyFs long-file split** (Track 6).
Implement join: `/tmp/grok-1000/grok-impl-summary-selfapplyfs-lfs.md`.
Plan cite: `.agents/plans/plan-long-file-refactor.md` (gate-first theorem/smoke seam).

Related:

- Prior tip campaign: `doc/dev/research/selfapplyfs-tip-split-2026-07-31.md`
- Inventory: `doc/dev/research/sub-1kloc-inventory-reseed-2026-08-03.md`
- Pattern: `SelfApplyTheorems` / `DualResidualTheorems` (same-namespace module split)

---

## 1. Before / after

| Metric | Value |
|--------|------:|
| Tip before | **1922** |
| Tip after | **999** |
| Delta | **-923** |
| New module `SelfApplyFsTheorems.lean` | **942** |
| Under 1000 | **yes** |

## 2. Named role seam

| Item | Detail |
|------|--------|
| Seam name | SELF-APPLY-FS-THEOREM + SELF-APPLY-FS-SMOKE role module split |
| New module | `src/systems/SystemsLean/SelfApplyFsTheorems.lean` |
| Namespace | `SystemsLean.SelfApplyFs` (same as tip; unqualified theorem names) |
| Import direction | Theorems imports tip; tip does **not** import Theorems (no cycle) |
| Tip keeps | Living claim SSoT, PartialReady chain folds, stage/path ids, `selfApplyFsOk` |
| Tip drops | Theorem wall + example smoke wall; unused home `*Theorems` imports |

## 3. Pure Nix gate updates

| Surface | Change |
|---------|--------|
| `required-files.nix` / `host-leans.nix` | Add `SelfApplyFsTheorems.lean` |
| `host-specs-tip-selfapply-1.nix` | Tip block drops `theorem` / `example` forms; new Theorems hostSpecs block |
| `host-specs-tip-selfapply-5.nix` | Full + complete dual-pin tip blocks drop theorem/example forms |
| `eval-hostpin-1..4.nix` | Theorem tokens scan `SelfApplyFsTheorems.lean` via `readRel` |

## 4. Gates

| Gate | Result |
|------|--------|
| `lake build SystemsLean.SelfApplyFsTheorems` | GREEN (exit 0; ~572s) |
| `lake build SystemsLean.SelfApplyFs` + DualResidualTheorems | GREEN (exit 0) |
| `just systems-host` | GREEN |
| `just hygiene` | GREEN |
| `just systems-emit-wire` | Pre-existing red only: LlvmCompose/Graph/Program UNIT_SURFACE IR contract id (not tip regression) |

## 5. Living pins (unchanged)

| Pin | Value |
|-----|-------|
| freestandingProductSelfHostComplete | true |
| ownership / perform / stepContractFull | true |
| residualFreeClaimed (DualResidual) | true |
| hostElaboratorResidualRemains | true |
| product StillUsesLake / DependsOnLake (tip) | false |
| provablyUnlocked / llvmUnlocked | true |

## 6. Next hygiene residual

**Self-host map long-file split** (`src/systems/self-host.md` ~5525).
