# OwnershipClaimed long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**OWNERSHIP-CLAIMED-THEOREM + OWNERSHIP-CLAIMED-SMOKE** split into
`SystemsLean.OwnershipClaimedTheorems` (same namespace
`SystemsLean.OwnershipClaimed`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `StepContractFullTheorems` /
`ProductPathOwnershipRegenerateTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease (theorem
move alone was small; greppable honesty tokens stay on parent for host-presence).

## Before / after

| Path | Lines |
|------|------:|
| `OwnershipClaimed.lean` before | 367 |
| `OwnershipClaimed.lean` after | 342 |
| `OwnershipClaimedTheorems.lean` new | 247 |
| Delta parent | -25 |

## Why this seam

OwnershipClaimed is B40 OWNERSHIP-CLAIMED surface (claim-path home after B39), not
emit product text. A Scaffold copy would mis-name the role. Theorems + smoke are
a coherent block that does not own Ok / PartialReady / print API.

Land-time honesty preserved on home: `freestandingProductSelfHostComplete := false`
and Full long-name false. Living tip / SelfHostComplete / StepContractFull keep
complete true dual-pin. free / llvm / PROVABLY stay false.

## Wiring

- SelfApplyFs: `import SystemsLean.OwnershipClaimedTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; OWNERSHIP-CLAIMED module path tokens stay
  on home; tip still greps tip PartialReady theorem

## Gates

- `lake build SystemsLean.OwnershipClaimed SystemsLean.OwnershipClaimedTheorems SystemsLean.OwnershipClaimedMain` green
- `lake build SystemsLean.SelfApplyFs` green
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** on tip / SelfHostComplete / StepContractFull dual-pin
- complete **false** land-time on OwnershipClaimed home (unchanged honesty)
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1891**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath **458** seams done; skip CompilePath*
- skip already-split-once including OwnershipClaimed **342**

**Next:** SelfHostComplete.lean **363** (largest never-split cold primary;
DualEqWriteCapableGap **354** / DualEqWriteClosePath **354** / PerformClaimed
**345** follow).

## Join

`/tmp/grok-1000/grok-impl-ownership-claimed-split-a8884351.md`
