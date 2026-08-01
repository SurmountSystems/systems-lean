# SelfHostBody long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

Theorem + behavioral smoke split (same pattern as SpecProof / JoinMap /
SurfaceMatrix), not emit-product Scaffold.

| Role | Path | Lines |
|------|------|------:|
| Parent (stage ids, path/cite surface, claim Bools, `selfHostBodyReady`) | `src/systems/SystemsLean/SelfHostBody.lean` | **328** (was **456**) |
| Theorems + smoke (`SELF-HOST-BODY-THEOREM` / `SELF-HOST-BODY-SMOKE`) | `src/systems/SystemsLean/SelfHostBodyTheorems.lean` | **199** |

Same namespace `SystemsLean.SelfHostBody` so theorem names stay unqualified.

## Delta

- Before: SelfHostBody.lean **456**
- After: SelfHostBody.lean **328** (-128)
- New: SelfHostBodyTheorems.lean **199**

## Why this seam

SelfHostBody is freestanding **compile-step readiness** fold (Mult..Body emit
ready + surface + free/complete/unlock honesty), not emit product text. A
Scaffold copy would mis-name the role. Theorems + smoke are a coherent block
(~lines 319-454) that does not own the readiness API.

## Wiring

- Root: `SystemsLean.lean` imports `SelfHostBodyTheorems`
- Host presence: `host-leans.nix`, `required-files.nix`, `specs.nix` root import
- Host specs: parent entry cites split + drops smoke/example pins to theorems
  module; new `SelfHostBodyTheorems.lean` entry in `host-specs-hold-close.nix`
- Emit-wire: unchanged (no product wire tokens moved)

## Gates

- `lake build SystemsLean.SelfHostBody SystemsLean.SelfHostBodyTheorems` green
- `just systems-host` green
- `just hygiene` green
- Tip SelfApplyFs not touched; freestanding-self-host-complete not required

## Claims

- complete **true** (SelfApplyFs alias)
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1888**
- skip *Scaffold/*Theorems/*Load/*Bars role scaffolds
- skip CompilePath **458** seams done
- skip already-split-once DualEqWriteApi **498** / EmitBody **480** when
  never-split cold exists

**Next:** DualResidual.lean **427** (largest never-split cold primary;
KernelEmit **425**, EmitProgram **422** follow).

## Join

`/tmp/grok-1000/grok-impl-summary-selfhostbody-split-4472e266.md`
