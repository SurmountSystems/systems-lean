# SelfHost long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Result

| Path | Lines |
|------|------:|
| `SelfHost.lean` before | 342 |
| `SelfHost.lean` after | 164 |
| `SelfHostTheorems.lean` (new) | 240 |

## Seam

Theorem + smoke move into `SystemsLean.SelfHostTheorems` (same namespace
`SystemsLean.SelfHost`). Parent keeps stage ids, `hostSurfaceOk`, `Verdict`,
`selfHostUnitReady` / `selfHostProgramReady` / `selfHostReady`, `verdictOf`.
Parent does not import Theorems (import cycle). Pattern matches
KernelLinearTheorems / ExtractTheorems.

## Wire

- `SystemsLean.lean` import + header
- `lakefile.toml` comment
- `nix/systems-host-presence/{host-leans,required-files,host-specs-join-surface,specs}.nix`

## Gates

- `lake build SystemsLean.SelfHost SystemsLean.SelfHostTheorems` exit 0
- `just hygiene` OK
- `just systems-host` OK

## Claims

Unchanged: complete true (SelfApplyFs / SelfHostComplete); free / llvm /
PROVABLY false.

## Next cold never-split primary

CapableCompose.lean **338** (skip scaffolds / Theorems / Load / Bars / Main /
CompilePath* / SelfApplyFs tip / already-split list).
