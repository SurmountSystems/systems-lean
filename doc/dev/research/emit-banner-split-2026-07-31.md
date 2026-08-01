# EmitBanner long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Result

| Path | Lines |
|------|------:|
| Before `EmitBanner.lean` | 327 |
| After `EmitBanner.lean` | 63 |
| New `EmitBannerScaffold.lean` | 325 |

Parent strictly decreased (-264).

## Seam

**EmitBannerScaffold** (same namespace `SystemsLean.EmitBanner`):

- stage/map ids, path cites, ownership comment
- banner header/body open fragments + API decls/bodies
- `bannerHeaderFragment` / `bannerBodyFragment`
- honesty + `emitBannerReady` / `emitBannerOk`
- EMIT-BANNER-SMOKE / HOST-EMIT-BANNER-SMOKE + `emitBannerReady_true`

Primary is thin import shell + greppable cites (Emit*Scaffold pattern).

## Gates

- `lake build SystemsLean.EmitBanner` green (Scaffold + primary)
- `just hygiene` green
- `just systems-host` green (host-leans / required-files / host-specs-core)
- `just systems-emit-wire` green (emit-product scaffold block)

## Claims

Unchanged: complete true; free / llvm / PROVABLY false. Tip not touched.

## Next

Never-split cold primaries by `wc -l` (skip tip, CompilePath*, *Main/*Scaffold/*Theorems/*Load/*Bars, already-split-once): **ParityLinear 304**, Types 302, ParityTypes 279, EmitMult 277, ...
