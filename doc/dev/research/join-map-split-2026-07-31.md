# JoinMap long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Lines |
|------|------:|
| `SystemsLean/JoinMap.lean` before | 519 |
| `SystemsLean/JoinMap.lean` after | 294 |
| `SystemsLean/JoinMapTheorems.lean` (new) | 284 |
| Delta parent | -225 |

## Seam

JOIN-MAP-THEOREM + JOIN-MAP-SMOKE split into `JoinMapTheorems.lean`, same
namespace `SystemsLean.JoinMap` (pattern: HostComposeTheorems / SpecProofTheorems).

**Stays in JoinMap:** stage/map ids, dual path inventory, host use pins
(`consumeTokenHostUseOk` / `erasedIndexHostUseOk` / `unrestrictedShareHostUseOk`),
`joinAlgContractOk`, `Verdict` / `verdictOf`, `joinUnitCompileReady` /
`joinProgramCompileReady` / `joinCompileReady`.

**Moved:** all JOIN-MAP-THEOREM theorems (including mult1 fixtures and single-value
program path) and JOIN-MAP-SMOKE examples + private smoke helpers.

## Wire-up

- `SystemsLean.lean` imports `JoinMapTheorems`
- host-presence: `host-leans.nix`, `required-files.nix`, split tokens in
  `host-specs-join-surface.nix`
- `join-map.md` + README table rows updated

## Gates

- `lake build SystemsLean.JoinMap SystemsLean.JoinMapTheorems` exit 0
- `just systems-host` exit 0
- `just hygiene` exit 0
- Tip SelfApplyFs not touched; freestanding-self-host-complete not required

## Claims (held)

- complete true (untouched)
- free / llvm / PROVABLY false (untouched)

## Next cold primary

`KernelProgram.lean` **508** (skip tip SelfApplyFs **1888**; skip role scaffolds
scaffolds such as EmitComposeScaffold **590**).
