# FreestandingEmitLoad long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Summary
Split Mult..Apply unit SSOT loaders from FreestandingEmitLoad into
FreestandingEmitLoadScaffold (same namespace SystemsLean.FreestandingEmit).

## Counts
- FreestandingEmitLoad.lean: 622 -> 235 (-387)
- FreestandingEmitLoadScaffold.lean: new 414
- Parent keeps: stageId, string helpers, Dual SSOT, require*, BodySsot, BannerSsot
- Scaffold owns: Mult..Apply structures + load*Ssot

## Why this seam
Uniform headerBlock/bodyBlock unit loaders after Body (dialect) and Banner
(identity). Matches *Scaffold pattern used by EmitBody/Plan/Apply.

## Gates
lake FreestandingEmit{,Load,LoadScaffold}; just hygiene; systems-host;
systems-emit-wire. Tip not touched.

## Next cold
EmitCompose.lean ~596 (skip SelfApplyFs tip ~1888).
