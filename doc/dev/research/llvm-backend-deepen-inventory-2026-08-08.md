# LLVM backend deepen inventory (unlock vs full backend)

**Kind: analysis only. Not residual.**
**Date:** 2026-08-08
**Reseed:** 2026-08-11 U4 XL honesty hold (confirms R3/W4/T4; pins stay false; no forge)
**Accessed living pins:** 2026-08-11 (seed=206 harness=**64** living host tip;
free/complete/PROVABLY true; host free claimed; FullHostElaborateRemains false;
Mult..Graph SSA partial done; Mult..Graph production CFG dual-pin **done**
(R1a..R1d); Mult DF partial+deepen done; Linear+Types DF deepen **done** (R5);
Program+Graph DF deepen **done** (N4); multiUnit Mult..Graph DF deepen **true**;
general + iterative CFG partial done; Mult..Graph foreign band-local done; Rust IR
partial + multi-band full true; without-classic-FFI C1 **done**; fixture tip
`llvmCfgFixtureFullBackendClaimed` **true** under Package 1 A-light; band Mult..Graph
SSA / foreign `*FullBackendClaimed` still **false**; production opt / DominanceClaimed
**false** (structural idom; fixed unit diamonds; not proved general pipeline).
U4 XL honesty hold: `.agents/reports/impl-llvm-xl-u4-2026-08-11.md`.
R3 honesty hold: `.agents/reports/impl-llvm-honesty-r3-2026-08-11.md`.
T4 honesty report: `.agents/reports/impl-llvm-honesty-t4-2026-08-11.md`.
W4 honesty hold: `.agents/reports/impl-llvm-honesty-w4-2026-08-11.md`.
N4 product deepen: `.agents/reports/impl-llvm-honesty-n4-2026-08-11.md`. Prior
next-slice: `.agents/reports/impl-llvm-next-slice-2026-08-10.md`)

## Status

| Claim | Living value | Notes |
|-------|--------------|-------|
| `llvmUnlocked` (`SystemsLean.LlvmHold`) | **true** | Unlock residual Done 2026-08-03; lake proof required at land |
| Fixture tip fullBackend (`llvmCfgFixtureFullBackendClaimed`) | **true** (A-light) | Package 1 2026-08-10; lake + progressive bar path B; not band FullBackend |
| Band Mult..Graph SSA / foreign `*FullBackendClaimed` | **false** | Intentional; pure Nix forge-bans; tip true is not band FullBackend true |
| Production opt / DominanceClaimed | **false** | Path B non-claims; multiUnit Mult..Graph DF true is **not** DominanceClaimed |
| multiUnit Mult..Graph DF deepen | **true** (N4) | Mult+Linear+Types+Program+Graph Cytron dual-pin; DominanceClaimed stays false |
| Rust-native link success (end announce) | **deferred announce** | Mult..Graph foreign + rustIrInterop partial/full **done**; without-classic-FFI end announce is completeness Package C1 |
| Mult..Graph (+ compose) IR text generators | **done** | Unit text ladder + package expand residual history |
| Mult SSA lower partial (Phase L) | **done** (2026-08-08) | `LlvmMultSsa` / `slake_mult_ssa.ll` / `just llvm-mult-ssa` |
| Linear SSA lower partial (A1) | **done** (2026-08-08) | `LlvmLinearSsa` / `slake_linear_ssa.ll` / `just llvm-linear-ssa` |
| Types SSA lower partial (A2) | **done** (2026-08-08) | `LlvmTypesSsa` / `slake_types_ssa.ll` / `just llvm-types-ssa`; band full-backend pin false |
| Program SSA lower partial | **done** (2026-08-08) | `LlvmProgramSsa` / `slake_program_ssa.ll` / `just llvm-program-ssa`; band full-backend pin false |
| Graph SSA lower partial | **done** (2026-08-08) | `LlvmGraphSsa` / `slake_graph_ssa.ll` / `just llvm-graph-ssa`; band full-backend pin false |
| Mult CFG fixture + deepen (A3 partial) | **done partial** (2026-08-08) | `LlvmCfgFixture` + merge preds / reachability deepen; production opt false; dominance claim false |
| Production CFG deepen Mult SSA dual-pin | **done** (2026-08-10) | Mult SSA grade_tag dual-pin (idom + four-pred merge phi); `just production-cfg-deepen` |
| Linear CFG production dual-pin | **done** (2026-08-10 R1a) | Linear live_flag dual-pin + multi-unit Mult+Linear; `just linear-cfg-production-deepen` |
| Types CFG production dual-pin | **done** (2026-08-10 R1b) | Types kind_tag dual-pin + multi-unit Mult+Linear+Types; `just types-cfg-production-deepen` |
| Program CFG production dual-pin | **done** (2026-08-10 R1d) | Program push dual-pin + multi-unit Mult..Program |
| Graph CFG production dual-pin | **done** (2026-08-10 R1d) | Graph add-edge dual-pin + multi-unit Mult..Graph |
| Mult DF partial | **done** (R1c) | Structural DF table; not full DF pipeline; DominanceClaimed false |
| Mult DF Cytron deepen | **done** | multDominanceFrontierDeepen true |
| Linear+Types DF deepen | **done** (R5) | linear/typesDominanceFrontierDeepen; multi-unit Mult+Linear+Types |
| Program+Graph DF deepen | **done** (N4 2026-08-11) | program/graphDominanceFrontierDeepen; multiUnit Mult..Graph; still not DominanceClaimed |
| General + iterative CFG partial | **done** | Beyond unit-diamond-only; progressive independent of tip polarity |
| Host seed / harness (orthogonal) | modules=**206**, harness=**64** | Not an llvm pin; reseed honesty only (R5 long-file; ParityEmit TERM W3) |

## Measured gap (unlock true; tip fullBackend true A-light; band FullBackend false)

What unlock and progressive residual already allow (dogfood / generator-owned IR under `out/llvm-ir/`):

- Greppable Mult / Linear / Types / Program / Graph / Compose text writers
- Five-band SSA-shaped partial lower (`slake_*_ssa.ll`; phi + blocks; band FullBackend false)
- Mult CFG structural fixture + deepen (entry dominates all; merge preds; not production opt)
- Mult..Graph production CFG dual-pin (unit diamonds / multi-unit; still not full DF pipeline)
- Mult DF partial (structural; DominanceClaimed false)
- General + iterative CFG partial
- Mult..Graph foreign link success band-local
- Rust IR interop partial + multi-band full (`rustIrInteropPartialClaimed` / `rustIrInteropFullClaimed`)
- Fixture tip fullBackend **true** under Package 1 A-light (lake + path B)
- Optional llvm-as smoke where present
- Layout / ABI fixture honesty + Mult layout/IR consumer success partial

What remains **intentional non-claim** (not automatic residual unless operator promotes A-heavy / C1b):

1. **Band Mult..Graph SSA / foreign FullBackend true** -- would need honesty redesign of pure Nix forge-bans; default leave false
2. **Full dominance frontier pipeline** -- optional algorithm residual; DominanceClaimed true; **not** required for tip A-light or announce bar B
3. **Opt / llc pipeline contract** -- optional; only if product claims machine code
4. **Without-classic-FFI end announce** -- interop dual map done; announce contract is completeness Package **C1** (not another foreign band)

Bar SSoT: `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`.

## Candidate residual Names (held or next)

| Name (plain) | Goal | Done when (sketch) | Status |
|--------------|------|--------------------|--------|
| LLVM Mult SSA lower partial | Lower Mult program graph band to SSA-shaped IR | Lean writer + pure Nix + artifact | **done** |
| LLVM Linear SSA lower partial | Same shape for Linear unit band | Same Done when as Mult | **done** (A1) |
| LLVM Types SSA partial | Same shape for Types unit band | Same shape per band | **done** (A2) |
| LLVM Program SSA partial | Same shape for Program unit band | Same shape per band | **done** |
| LLVM Graph SSA partial | Same shape for Graph unit band | Same shape per band | **done** |
| CFG + dominance Mult fixture | Structural Mult CFG + dominance honesty | Lean model + pure Nix + lake | **done partial** (A3 + deepen; not production opt) |
| Production CFG deepen Mult | Mult SSA dual-pin idom + four-pred merge phi | Lean + pure Nix + just + lake | **done** (2026-08-10) |
| Linear..Graph SSA CFG production dual-pin | Multi-unit Mult..Graph production CFG | Lean + pure Nix + just + lake | **done** (R1a..R1d 2026-08-10) |
| Full LLVM progressive residual path B | Bar items (1)-(10) without requiring DominanceClaimed | Progressive pins + residual | **done** (path B) |
| Fixture tip fullBackend claim true | A-light tip with lake + bar green | Package 1 | **done** (A-light 2026-08-10) |
| Mult layout consumer | Layout size/align agreement fixture | Pure Nix / thin just | **done** (B1) |
| Mult link readiness partial | Freestanding + Mult unit IR + Mult SSA tags | Pure Nix / thin just | **done partial** (B3; not link success) |
| Mult layout/IR consumer success partial | Freestanding API + unit IR + SSA kernel + layout | Pure Nix / thin just | **done partial** (not foreign link alone) |
| Mult..Graph foreign link success | Out-of-tree consumer dual agreement per band | Lean + pure Nix + just | **done** band-local (R2) |
| Rust IR interop partial + multi-band full | Joint Mult..Graph dual map | Lean + pure Nix + just + lake | **done** (not end announce) |
| Without-classic-FFI end announce | Public announce contract + matrix/README | Completeness Package C1 | **done** (C1) |
| Band FullBackend true / Dominance / opt | A-heavy deepen beyond A-light | Operator-only C1b; XL redesign of pure Nix forge-bans + bar note | **held** (default skip; inventory 2026-08-10) |
| Full DF pipeline (DominanceClaimed) | Optional algorithm beyond multi-unit unit-diamond DF | Mult..Graph unit DF dual-pin **done** N4; proved idom constructor + arbitrary-graph export still needed for DominanceClaimed true | **held** optional L-XL (not auto Open) |
| Production opt / llc | Machine-code emit only if product claims it | Separate residual | **held** until machine-code residual |
| T4 DominanceClaimed / band FullBackend honesty | Polish bar + consumer README + residual after Mult..Graph DF; keep pins false | Inventory + docs lockstep; no forge | **done** (2026-08-11; report `impl-llvm-honesty-t4-2026-08-11.md`) |
| W4 DominanceClaimed / band FullBackend honesty hold | Hierarchical living-tip reseed; confirm hold after T4 | Pins false + residual/WATCHER lockstep; no forge | **done** (2026-08-11; report `impl-llvm-honesty-w4-2026-08-11.md`) |
| R3 DominanceClaimed / band FullBackend honesty hold | Hierarchical R wave reseed after W1-W5; confirm hold after W4 | Pins false + residual/WATCHER lockstep; no forge | **done** (2026-08-11; report `impl-llvm-honesty-r3-2026-08-11.md`) |
| U4 DominanceClaimed or band FullBackend XL deepen | Completeness-wave best-effort XL dual-pin or deepest honest hold | (A) pin true with XL bar+dual-pin+Nix+lake **or** (B) hold + bar docs + systems-llvm-ir; no forge from multiUnit DF or tip A-light | **done** path B (2026-08-11; report `impl-llvm-xl-u4-2026-08-11.md`) |

## Honesty

- Do **not** re-false fixture tip fullBackend after Package 1 A-light.
- Do **not** treat `llvmUnlocked` true as "full LLVM backend done" by itself.
- Do **not** treat tip fullBackend true as band Mult..Graph `*FullBackendClaimed` true.
- Do **not** treat Mult / Linear / Types / Program / Graph SSA partial as full CFG/dominance pipeline.
- Do **not** treat `multiUnitDominanceFrontierDeepen` true as DominanceClaimed true.
- Do **not** treat Mult layout/IR consumer success partial as without-classic-FFI end announce.
- Prefer freestanding product residual honesty over LLVM theater when inventing Names.
- Prefer honest inventory (T4 / W4 / R3 / U4) over forge when no checkable A-heavy dual-pin remains.
- W4 (2026-08-11) re-confirmed living tip hold: DominanceClaimed false; band FullBackend false.
- R3 (2026-08-11) hierarchical reseed: same hold; multiUnit Mult..Graph DF true is still not DominanceClaimed.
- U4 (2026-08-11) completeness XL reseed: path B honest hold; XL path A still needs proved idom + arbitrary-graph DF + forge-ban invert + lake.

## Related

- Unlock design: `doc/dev/research/llvm-ir-unlock-design-2026-08-03.md`
- Emit path: `doc/dev/research/llvm-ir-emit-path-2026-08-02.md`
- Bar SSoT: `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`
- Living pin: `src/systems/SystemsLean/LlvmHold.lean`
- Mult SSA: `src/systems/SystemsLean/LlvmMultSsa.lean`
- Linear SSA: `src/systems/SystemsLean/LlvmLinearSsa.lean`
- Types SSA: `src/systems/SystemsLean/LlvmTypesSsa.lean`
- Program SSA: `src/systems/SystemsLean/LlvmProgramSsa.lean`
- Graph SSA: `src/systems/SystemsLean/LlvmGraphSsa.lean`
- CFG fixture: `src/systems/SystemsLean/LlvmCfgFixture.lean`
- Plan: `.agents/plans/plan-held-backend-dual-rust-2026-08-08.md`
- Completeness program: session plan Packages C0-C2; durable `.agents/plans/plan-full-readiness-2026-08-09.md`
