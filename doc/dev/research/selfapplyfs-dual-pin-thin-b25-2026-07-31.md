# SelfApplyFs dual-pin thin batch 25 inventory (B34 DualEqualityWriteParity)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-1000/grok-impl-summary-dual-pin-b25-2026-07-31.md`

## Family

**B34 DualEqualityWriteParity** -- tip dual-pins gate-first onto
`SystemsLean.ProductPathFreestandingPerformDualEqualityWriteParity`
(long kitchen-sink basename). Living tip keeps Measured + GapOpen **false** +
StructuralNotDualEquality **false** (post-B37 living values; home land-time
GapOpen true / StructuralNotDualEq true) + PartialReady fold chaining B33
OfficialPathAlternate.

Tip start: **4206**.

## Short-name

**Defer** rename `ProductPathFreestandingPerformDualEqualityWriteParity` -> short
role (e.g. `DualEqWriteParity` + Main). Reasons:

1. Dual-pin tip mass first; rename races lakefile Main, justfile, emit-wire
   modulePath, hostSpecs rel, SelfApplyFs import, ModuleCite string.
2. Plan section 8c: serialize short-name when tip dual-pin not racing.
3. Dual-pin of this family does not make rename free (many path greps remain).

Home module stays `ProductPathFreestandingPerformDualEqualityWriteParity.lean`.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `productPathFreestandingPerformDualEqualityWriteParityMeasured := true` | B34 fold bare name; later DualEq hostPin tip pins |
| `productPathDualEqualityWriteParityGapOpen := false` | living tip SSoT (home true) |
| `productPathCapableWriteStructuralNotDualEquality := false` | living tip SSoT (home true) |
| `def productPathFreestandingPerformDualEqualityWriteParityPartialReady` | Chain fold: B33 Alternate PartialReady && home PartialReady && honesty && living claims |
| theorems Measured_true + PartialReady_true | host-presence tip |
| examples Measured / GapOpen false / StructuralNotDualEq false / PartialReady + claim chain | host-presence tip |
| `import SystemsLean.ProductPathFreestandingPerformDualEqualityWriteParity` | compile + greppable import cite |
| fold comments SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY | fold doc |
| B35+ uses of Parity PartialReady / GapOpen | later family folds |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathFreestandingPerformDualEqualityWriteParityStageId` | `stageId` |
| `hostProductPathFreestandingPerformDualEqualityWriteParityId` | `hostId` |
| `selfHostProductPathFreestandingPerformDualEqualityWriteParityId` | `selfHostId` |
| `freestandingPerformDualEqualityWriteParity*Id` step strings | `dualEqualityWriteParity*Id` |
| Recipe / MeasureRecipe / LakeExe / ModuleCite | `lakeFreeParityRecipe` / `justMeasureRecipe` / `lakeExeName` / basename |
| CapableWriteApi/Module + OfficialGate/Api cites | `capableWriteApi` / `capableWriteModule` / dual-eq gate/api |
| `productPathFreestandingPerformDualEqualityWriteParityOk` tip alias | home Ok bulk |
| Ok theorem + stage/host/recipe/exe/stepId/Ok smoke examples | home print path |

### Still dual by necessity

| Token | Tip | Home |
|-------|-----|------|
| PartialReady | chain fold (living GapOpen false / StructuralNotDualEq false) | land-time bulk (GapOpen true / StructuralNotDualEq true) |
| Measured | tip living true | home same |
| GapOpen / StructuralNotDualEq | tip **false** | home **true** |
| perform / ownership / complete | tip living true | **forbidden** living claim true on home |

### Not touched

- justfile parity process glue
- living claim bools on tip
- B35+ family defs (except chain use)
- short-name track (deferred)

## Next

B35 DualEqualityWriteClosePath dual-pin thin batch 26.
