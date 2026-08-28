# Progress meter (generated)

Updated: (just progress -- regenerate)
Generator: pure Nix (`nix/progress/`; also flake `progressReportText`).
Evidence-based weights -- not calendar estimates.

## Goal -- total progress (Systems Lean / Slake freestanding journey)

    [####################] 100.0%

Weighted evidence: 136 / 136

North star (see `doc/goals.md`): Slake in Systems Lean, meet-in-the-middle
Idris 2 and Lean 4 map, primary emit runtimeless freestanding C under
`out/freestanding-c`. CompCert PROVABLY is claimed true (matrix in just
check; weight 0 row). llvm unlock + Mult SSA partial are earned (weight 0);
full LLVM backend and Rust-native link stay held.

## Phases (plan milestones)

### Foundation (charter, tooling, refs)

    [####################] 100.0%
    weight 20 / 20

### Bridge duals (Idris side + Lean side)

    [####################] 100.0%
    weight 56 / 56

### Join / map honesty (coordinator)

    [####################] 100.0%
    weight 22 / 22

### Systems Lean / Slake synthesis

    [####################] 100.0%
    weight 22 / 22

### Freestanding product release surfaces

    [####################] 100.0%
    weight 16 / 16


## Streams

- Foundation:     [####################] 100.0%
- Idris side:     [####################] 100.0%
- Lean side:      [####################] 100.0%
- Join (both):    [####################] 100.0%
- Systems / freestanding: [####################] 100.0%

## Milestone meters

| Meter | Weight | Phase | Stream | Milestone | Evidence |
|-------|--------|-------|--------|-----------|----------|
| `[##########] 100.0%` | 12 | foundation | foundation | Foundation (charter, tooling, refs) | AGENTS + just + flake + watcher + residual + nix tooling modules |
| `[##########] 100.0%` | 4 | foundation | foundation | Goals / vocabulary / architecture | doc/goals + vocabulary + architecture + divergence |
| `[##########] 100.0%` | 4 | foundation | foundation | Fork prompts + dual residuals | fork-*.md + RESIDUAL-idris/lean |
| `[##########] 100.0%` | 10 | bridge | idris | Idris multiplicity map | src/idris2 multiplicity notes |
| `[##########] 100.0%` | 10 | bridge | lean | Lean multiplicity map | src/lean4/multiplicity-map.md |
| `[##########] 100.0%` | 10 | bridge | idris | Idris dual example (native) | src/idris2 .idr |
| `[##########] 100.0%` | 10 | bridge | lean | Lean dual example | src/lean4/examples |
| `[##########] 100.0%` | 5 | bridge | idris | Idris JOIN greppable points | src/idris2/JOIN.md |
| `[##########] 100.0%` | 5 | bridge | lean | Lean JOIN greppable points | src/lean4/JOIN.md |
| `[##########] 100.0%` | 3 | bridge | idris | Idris presence red/green gate | just idris-side pure presence (+ just idris-elaborate optional) |
| `[##########] 100.0%` | 3 | bridge | lean | Lean presence red/green gate | just lean-side pure presence (+ just lean-elaborate optional) |
| `[##########] 100.0%` | 8 | join | both | Dual pair join-ready | both JOIN.md + nontrivial sides |
| `[##########] 100.0%` | 6 | join | both | Divergence imperfect edges joined | doc/divergence.md cites dual imperfect edges |
| `[##########] 100.0%` | 8 | join | both | Shared intermediate-representation sketch | doc/shared-ir-sketch.md |
| `[##########] 100.0%` | 12 | systems | systems | Slake / systems novel sources | src/systems beyond README |
| `[##########] 100.0%` | 6 | systems | systems | Systems units for just build | src/systems *.lean or *.slake |
| `[##########] 100.0%` | 4 | systems | systems | Min mult 0/1/omega host notes in systems | src/systems mult / QTT surface |
| `[##########] 100.0%` | 12 | release | systems | out/freestanding-c product C | generated .c/.h under out/freestanding-c |
| `[##########] 100.0%` | 4 | release | systems | just build / build path | just build = product freestanding wire; compile-path stamp shell deleted (pure Nix + host CompilePath) |
| `[##########] 100.0%` | 0* | release | systems | CompCert PROVABLY path (weight 0 track; claimed true) | PROVABLY claimed true; product-compcert-matrix in just check (not weaker dogfood alone) |
| `[##########] 100.0%` | 0* | release | systems | out/llvm-ir unlock + Mult SSA partial (not full backend; weight 0) | llvmUnlocked true; Mult SSA lower partial; full LLVM backend still held |

\* weight 0 = tracked for honesty, not counted in weighted totals (may be claimed or held; read Evidence).

## Open weighted milestones

(none weighted open)

## Residuals

- Coordinator: `RESIDUAL.md`
- Idris side: `RESIDUAL-idris.md`
- Lean side: `RESIDUAL-lean.md`
- Systems / Slake: `RESIDUAL-systems.md`
- Next implement prompt: `WATCHER.md` (watcher session; do not race Slake)

## Guidance

- `doc/fork-guidance-idris.md`
- `doc/fork-guidance-lean.md`
- `doc/fork-guidance-systems.md`

SPDX-License-Identifier: Unlicense
