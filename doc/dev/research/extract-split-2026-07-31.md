# Extract long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

| Item | Value |
|------|-------|
| Parent | `src/systems/SystemsLean/Extract.lean` |
| Role module | `src/systems/SystemsLean/ExtractTheorems.lean` |
| Namespace | `SystemsLean.Extract` (Theorems imports parent; parent does not import Theorems) |
| Moved | EXTRACT-THEOREM / HOST-EXTRACT-THEOREM block (all real theorems) |
| Stayed | RuntimeClaim, ofRuntimeTag?, isValidRuntimeTag, checkFailClosed, extractOk, extractOkFromTags? |

## Line counts

| File | Before | After |
|------|--------|-------|
| Extract.lean | 344 | 156 |
| ExtractTheorems.lean | (new) | 253 |

Parent strictly decreased (-188).

## Gates

- `lake build SystemsLean.Extract SystemsLean.ExtractTheorems` green
- `just hygiene` green
- `just systems-host` green
- `just systems-emit-wire` green
- Tip / freestanding-self-host-complete not required (tip not touched)
- Claims: complete true; free/llvm/PROVABLY false (untouched)

## Wire-up

- `SystemsLean.lean` imports ExtractTheorems
- `nix/systems-host-presence/` required-files + host-leans + host-specs-core Extract + ExtractTheorems
- `specs.nix` root import token for ExtractTheorems
- `host-partial-inventory.md` row pair

## Next cold primary

KernelLinear.lean ~343 (never-split); SelfHost.lean ~342 follows.
