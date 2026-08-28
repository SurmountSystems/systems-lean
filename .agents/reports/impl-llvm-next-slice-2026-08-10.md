# LLVM next-slice inventory (beyond A-light)

**Date:** 2026-08-10
**Status:** **HELD** (inventory only; no product pin flip)
**Gates:** `just systems-llvm-ir` exit 0
**Open residual:** left **KernelLinear deeper proof-layer checker** alone (not stolen)

## Plain English: what A-light already claims

Fixture tip `llvmCfgFixtureFullBackendClaimed` is **true** under Package 1
**A-light** (2026-08-10). That means:

- Progressive Full LLVM **path B** evidence is green (`fullLlvmBarEvidencePartial`
  true): Mult..Graph unit CFG dual-pin, Mult DF **partial**, general + iterative
  CFG partial, path B says full DF is **not** required for bar item (2).
- Lake elaborator proof on the tip pin surface (`SystemsLean.LlvmCfgFixture` /
  `LlvmCfgHonesty`) already ran when Package 1 closed.
- Living unlock `llvmUnlocked` is **true** (separate, older residual).

A-light does **not** mean:

- Band Mult..Graph SSA or foreign `*FullBackendClaimed` true
- Full dominance pipeline (`llvmCfgFixtureDominanceClaimed` true)
- Production opt / llc machine-code pipeline
- freestanding free / complete / PROVABLY / FullHost re-open
- "Lake is gone" or full Lean 4 / mathlib parity

Bar SSoT: `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`.
Deepen inventory: `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md`.
Consumer surface: `out/llvm-ir/README.md`.

## Living pin map (verified 2026-08-10)

| Pin / surface | Value | Role |
|---------------|-------|------|
| `llvmUnlocked` | **true** | Unlock residual; dogfood IR path allowed |
| Fixture tip `llvmCfgFixtureFullBackendClaimed` | **true** | A-light Package 1 |
| `fullLlvmBarEvidencePartial` | **true** | Progressive bar evidence (not tip synonym) |
| `dominancePipelineRequiredForFullBackend` | **false** | Path B product decision |
| `llvmCfgFixtureDominanceClaimed` | **false** | Full DF optional extra |
| `llvmCfgFixtureProductionOptClaimed` | **false** | No machine-code claim |
| Mult..Graph SSA `*FullBackendClaimed` (5 bands) | **false** each | Pure Nix forge-bans |
| Mult..Graph foreign `*FullBackendClaimed` (5 bands) | **false** each | Band-local success only |
| `rustIrInteropFullBackendClaimed` | **false** | Interop is not tip synonym |
| `rustIrInteropPartialClaimed` / `rustIrInteropFullClaimed` | **true** / **true** | Dual-map measured |
| free / complete / PROVABLY | **true** | Unchanged this slice |
| FullHostElaborateRemains | **false** | Unchanged this slice |

## Mult..Graph pins still false (intentional)

Every band keeps local FullBackend false by design:

| Band | SSA FullBackend | Foreign FullBackend | What is already green |
|------|-----------------|---------------------|------------------------|
| Mult | false | false | unit IR, SSA partial, CFG dual-pin, DF partial, foreign Mult-only, layout/link partials |
| Linear | false | false | unit IR, SSA partial, CFG dual-pin, foreign Mult-class tags |
| Types | false | false | unit IR, SSA partial, CFG dual-pin, foreign kind tags |
| Program | false | false | unit IR, SSA partial, CFG dual-pin, foreign push codes |
| Graph | false | false | unit IR, SSA partial, CFG dual-pin, foreign add-edge |

Also false on purpose (fixture tip, not band):

- DominanceClaimed (full DF algorithm)
- ProductionOptClaimed (opt / llc)

Also **done partial** (not failures): Mult link readiness, Mult layout/IR consumer
success. Foreign + Rust interop already supersede the "link success" story under
named bars; further layout treadmill is optional theater unless product needs a
new consumer contract.

## What progressive LLVM already closed (do not re-open)

1. Mult..Graph unit IR text + compose + optional llvm-as smoke
2. Five-band SSA lower partial
3. Mult CFG fixture structural deepen
4. Production CFG Mult + Linear + Types + Program + Graph dual-pin (R1a..R1d)
5. Mult DF partial (R1c)
6. General program CFG + iterative multi-node IR walk
7. Path B DF non-requirement + progressive readiness pin
8. Mult..Graph foreign band-local (R2)
9. Rust IR interop partial + multi-band full
10. Without-classic-FFI end announce (Package C1)
11. Fixture tip fullBackend true A-light (Package 1)

`just systems-llvm-ir` joins the above and is **GREEN** (171 required paths).

## Next 1-2 checkable slices (honest difficulty)

### Slice H1 -- A-heavy band FullBackend true (XL; operator-only C1b)

| Field | Content |
|-------|---------|
| **Goal** | Make Mult..Graph SSA and/or foreign `*FullBackendClaimed` true under a **new** honesty bar, distinct from fixture tip A-light. |
| **Done when (sketch)** | Written A-heavy bar (what band FullBackend means beyond tip); redesign pure Nix forge-bans that currently require `def *FullBackendClaimed : Bool := false` + forbid true; lake proof per band or joint; residual + README + bar note lockstep; tip A-light still true; free/complete/PROVABLY/FullHost unchanged. |
| **Difficulty** | **XL** -- multi-module pin redesign + pure Nix invert + likely multi-band lake. Not S-M. |
| **Forge risk** | Flipping band true by editing defs alone without bar redesign is **forgery**. |
| **Recommendation** | **Held** until operator promotes C1b. |

### Slice H2 -- Full dominance pipeline (L-XL; optional)

| Field | Content |
|-------|---------|
| **Goal** | Iterative DF algorithm dual-pin; `llvmCfgFixtureDominanceClaimed` true. |
| **Done when (sketch)** | Real DF construction over multi-node CFG (not only Mult structural table); dual-pin evidence; lake; pure Nix honesty; path B pin `dominancePipelineRequiredForFullBackend` may stay false (optional extra, not bar requirement). |
| **Difficulty** | **L to XL** algorithm work; not required for tip A-light or announce bar B. |
| **Forge risk** | Setting DominanceClaimed true without algorithm dual-pin is forgery. |
| **Recommendation** | **Held** (path B already closed progressive without it). |

### Slice H3 -- Production opt / llc (held; product policy)

| Field | Content |
|-------|---------|
| **Goal** | Machine-code emit contract (opt / llc pipeline). |
| **Done when** | Only if product residual opens machine code as a claim; then opt pin + pipeline evidence. |
| **Difficulty** | **XL** product policy change first. |
| **Recommendation** | **Held**; leave `ProductionOptClaimed` false. |

### Non-candidates (not next product depth)

| Idea | Why not |
|------|---------|
| Re-flip tip fullBackend false | Forbidden honesty regression |
| Mult layout consumer treadmill | Already partial + foreign/Rust supersede under named bars |
| Compose SSA lower theater | Not on living residual; would be inventing Open without product need |
| KernelLinear / FullHost | Orthogonal host work; Open already KernelLinear |

## Decision this slice

**No S-M implement residual** without forging band FullBackend, DominanceClaimed,
or production opt.

Actions taken:

1. Inventory report (this file).
2. Reseed research deepen inventory: C1 **done**; next = A-heavy held only.
3. Residual Deferred row for A-heavy LLVM (C1b) with unlock condition; **did not**
   open LLVM Name in Open queue (KernelLinear stays sole Open).
4. No Lean claim-bool flips.
5. `just systems-llvm-ir` green.

## Gates

```text
just systems-llvm-ir  # exit 0 (171 paths; tip true A-light; band FullBackend false)
just hygiene          # if markdown residual/research touched
```

## Pins unchanged (explicit)

- tip fullBackend A-light **true**
- band FullBackend **false**
- DominanceClaimed **false**
- ProductionOptClaimed **false**
- free / complete / PROVABLY **true**
- FullHostElaborateRemains **false**

## Verdict

**HELD** -- heavier LLVM beyond A-light is operator-promoted XL redesign only
(A-heavy band FullBackend / optional full DF / optional opt). Inventory only;
KernelLinear Open preserved.
