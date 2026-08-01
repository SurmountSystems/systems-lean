# No-sorry host path inventory (2026-07-31)

Kind: analysis only. Not residual.

Scope: `src/systems/SystemsLean/**/*.lean` (host Systems Lean / Slake).
Commands (repo root):

```
rg -n --glob '*.lean' '\bsorry\b|\badmit\b' src/systems/SystemsLean/
rg -n --glob '*.lean' '\baxiom\b' src/systems/SystemsLean/
find src/systems/SystemsLean -name '*.lean' -exec wc -l {} + | sort -nr
```

## Summary

| Marker | Count (lines matching) | Files |
|--------|------------------------:|------:|
| `sorry` | **0** | none |
| `admit` | **0** | none |
| `axiom` (declarations) | **3** | `Linear.lean` only |
| Host modules (*.lean) | -- | **112** |
| Novel lines (wc total) | -- | **33389** |

**Verdict:** host path is already **sorry-free** and **admit-free**. There is no first
no-sorry proof-fill slice. Next hygiene value is **cold long-file split** under the
long-file plan (chip away >1 KLOC), not theorem theater.

Claims honesty at inventory time (do not forge):

- freestanding product self-host **complete** true (claim B)
- residual **free** false; **llvm** false; **PROVABLY** false
- `proofCompleteClaimed` stays false (SpecProof honesty)

## sorry / admit

Full-tree search under `SystemsLean/` returned **zero** matches for word-boundary
`sorry` or `admit`. Broader `src/systems/` also zero. No comment-only false
positives required filtering.

## axiom surface (honest unfinished contracts, not sorry)

Only file with `axiom` keyword: `src/systems/SystemsLean/Linear.lean`.

| Line (approx) | Declaration | Role |
|---------------|-------------|------|
| 59 | `axiom Token : Type` | JOIN-ALG ConsumeToken host surface |
| 63 | `axiom mkToken : Nat -> Token` | mint |
| 72 | `axiom consume : Token -> Nat` | consume |

Module comments state these stay axioms (not `opaque`); they do **not** claim MULT-1
/ LINEAR-EXACT-ONCE enforcement. Residual theorem mill already closed Linear theorems
as partial with axioms remaining. **Do not** open a no-sorry slice that only rewrites
these axioms without a new named product property.

## Long files (wc -l; chip-away candidates)

Plan: `.agents/plans/plan-long-file-refactor.md` -- novel surfaces over 1000 lines
are residual.

| Lines | Path | Notes |
|------:|------|-------|
| **1888** | `SelfApplyFs.lean` | Living tip; split campaign **done** 3638->1888; still >1k; optional later tip smoke/theorem gate-first split |
| **1069** | `FreestandingEmit.lean` | **Next cold long file** (emit writer); not dual-pin theater; coherent seam split candidate |
| 877 | `DualEqWriteApi.lean` | Under 1k; not required residual by line bar alone |
| 864 | `ProductPath.lean` | Under 1k |
| 820 | `EmitBody.lean` | Under 1k |
| 706 | `EmitApply.lean` | |
| 703 | `EmitPlan.lean` | |
| 669 | `HostCompose.lean` | |
| 665 | `CapableWriteHc.lean` | |
| 596 | `EmitCompose.lean` | |
| 527 | `SpecProof.lean` | |
| 519 | `JoinMap.lean` | |
| 508 | `KernelProgram.lean` | |
| 477 | `EmitGraph.lean` | |
| 475 | `SurfaceMatrix.lean` | |
| 458 | `CompilePath.lean` | Seams **done** (was 3609) |

Only **two** host modules remain above 1000 lines: living tip `SelfApplyFs` and cold
`FreestandingEmit`.

## Recommended next residual (from inventory)

| Choice | Why |
|--------|-----|
| **No first no-sorry slice** | Zero sorry/admit; inventing proof-fill is theorem theater |
| **Open: FreestandingEmit long-file split** | Cold file at **1069**; measurable shrink toward under 1k via coherent seams (header/doc split and/or load helpers); gate-first; no claim-bool forge |
| Not primary | Further SelfApplyFs tip split (optional later); Linear axiom rewrite; free/llvm/PROVABLY |

## Non-claims

- Inventory is not residual free, proof complete, PROVABLY, or llvm unlock.
- Zero sorry does not mean residual free or proof complete.
- Linear axioms remain honest unfinished contracts until a named product property needs them closed.

## Related

- Tip split inventory: `doc/dev/research/selfapplyfs-tip-split-2026-07-31.md`
- Long-file plan: `.agents/plans/plan-long-file-refactor.md`
- Living residual: `RESIDUAL-systems.md` Open / Highest value next
