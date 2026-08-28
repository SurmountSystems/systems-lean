# out/llvm-ir -- LLVM IR (intermediate representation) for Rust-native link

**Intent:** freestanding emit of LLVM IR that can link with the Rust ecosystem in a seamless, native way (layout/ABI (application binary interface) compatible) -- without classic FFI (foreign function interface) glue as the happy path.

**Without-classic-FFI happy path (completeness C1 end announce):** for Mult
through Graph layout and the foreign dual-map consumer path we document, you do
**not** need classic foreign-function interface ceremony as the happy path.
Evidence: Mult..Graph foreign band-local success + `rustIrInteropPartialClaimed` /
`rustIrInteropFullClaimed` + `just rust-ir-interop-partial` / `just rust-ir-interop-full`.
**Not** "no FFI ever"; **not** formalized all of rustc; **not** tip fullBackend
synonym; **not** product Rust under `src/`. Classic freestanding **C** product
wire under `out/freestanding-c/` remains a permanent valid emit path (this
directory does not replace it).

## Status: unlocked with evidence (Mult..Graph unit IR + compose + five-band SSA partial + Mult..Graph foreign band-local + progressive path B + Mult..Graph multi-unit DF Cytron dual-pin + Rust IR partial/full; without-classic-FFI happy path announced; fixture tip fullBackend true A-light; band FullBackend false; DominanceClaimed false; not production opt / machine code)

Living `llvmUnlocked` is **true** (unlock residual + lake proof). Mult / Linear /
Types / Program / Graph **unit IR text**, **compose IR text**, optional
**llvm-as** smoke, and **five-band SSA lower partial** (Mult through Graph) are
on disk. Mult **layout/IR consumer success** and Mult **link readiness** are
pure Nix partial gates. Mult..Graph **foreign link success** is **done**
band-local (`just mult/linear/types/program/graph-foreign-link-success`). Mult
**CFG fixture deepen** is structural only (merge preds + reachability).
**Production CFG deepen** dual-pins Mult SSA grade_tag CFG (idom + four-pred
merge phi) against `slake_mult_ssa.ll`. Progressive Full LLVM path B **done**
(`fullLlvmBarEvidencePartial` true; `dominancePipelineRequiredForFullBackend`
false; Mult..Graph unit CFG dual-pin + Mult DF partial + general/iterative CFG
partial). **Multi-unit Mult..Graph dominance frontier deepen** is **true**
(`multiUnitDominanceFrontierDeepen`; Mult+Linear+Types+Program+Graph Cytron
dual-pin; N4/R5). That join is **not** `llvmCfgFixtureDominanceClaimed` true.
**Rust IR interop** partial + multi-band full **true**
(`rustIrInteropPartialClaimed` / `rustIrInteropFullClaimed`; multi-band joint
consumer). Production opt and full dominance pipeline stay **false**. Local
text-module unlock pins stay **false**. Band Mult..Graph SSA / foreign
`*FullBackendClaimed` stay **false**. Fixture tip
`llvmCfgFixtureFullBackendClaimed` is **true** (Package 1 A-light 2026-08-10;
progressive bar path B + lake).

### Why DominanceClaimed stays false (T4 honesty)

| Reason | Detail |
|--------|--------|
| Structural idom only | Per-band production idom tables are hand dual-pins, not a proved dominator-tree constructor |
| Fixed unit diamonds | Mult..Graph DF covers unit SSA diamonds only, not arbitrary-graph DF export or multi-join production pipeline |
| Path B bar (2) | `dominancePipelineRequiredForFullBackend` is **false**; progressive bar already met without DominanceClaimed |
| Forge ban | Pure Nix forbids `def llvmCfgFixtureDominanceClaimed : Bool := true` until an operator XL residual redesigns the bar + invert |

`multiUnitDominanceFrontierDeepen` **true** therefore does **not** authorize
flipping DominanceClaimed. Optional later A-heavy residual only.

### Why band Mult..Graph FullBackend stays false

| Reason | Detail |
|--------|--------|
| Partial SSA lower | Each band `llvm*SsaFullBackendClaimed` is intentional **false** (partial lower + dual-pin, not full backend) |
| Tip is not band | Fixture tip `llvmCfgFixtureFullBackendClaimed` **true** (A-light) is a separate pin, not a synonym of band FullBackend |
| Foreign is band-local | Mult..Graph foreign success is per-band; not multi-band fullBackend |
| Forge ban | Pure Nix requires band `*FullBackendClaimed` false; flipping needs A-heavy honesty redesign (operator C1b / XL) |

Bar SSoT: `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`.
Deepen inventory: `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md`.
**W4 honesty hold (2026-08-11):** living residual reseed confirmed the same hold
(structural idom; fixed unit diamonds; Path B; forge ban; band FullBackend A-heavy).
Pins unchanged. Report: `.agents/reports/impl-llvm-honesty-w4-2026-08-11.md`.
**R3 honesty hold (2026-08-11):** hierarchical R wave reseed re-confirmed W4/T4 reasons;
DominanceClaimed **false**; band FullBackend **false**; tip A-light true; multiUnit DF
true is not DominanceClaimed. Report: `.agents/reports/impl-llvm-honesty-r3-2026-08-11.md`.
**U4 XL honesty hold (2026-08-11):** completeness-wave best-effort XL dual-pin found no
checkable A-heavy product slice short of proved idom + arbitrary-graph DF + pure Nix
forge-ban invert + lake. Path B delivered: pins stay **false**; multiUnit Mult..Graph DF
true is still not DominanceClaimed; tip A-light true is still not band FullBackend.
Report: `.agents/reports/impl-llvm-xl-u4-2026-08-11.md`.

### Lean to Rust dual map (value for readers)

What this directory's interop story already **proves under named bars** (not a
full language isomorphism):

| Already true | Meaning |
|--------------|---------|
| Layout size/align parity | Mult..Graph i32 tags and status codes: size 4, align 4 on `x86_64-unknown-linux-gnu`, dual-pinned across host Lean, unit/SSA IR, Mult layout fixture, optional `/tmp` rustc dogfood |
| Richer-than-i32 named record | `IrNodeRecord` / `slake_ir_node`: size 16, align 4, pad 3 versus rustc_abi `repr(C)` (`just richer-record-layout`; host `IrNodeLayout`; C wire unchanged) |
| Foreign link success (band-local) | Mult, Linear, Types, Program, Graph each have green foreign dual-agreement (`just *-foreign-link-success`) |
| Joint partial + multi-band full | `RustIrInterop` partial and full claims true; `just rust-ir-interop-partial` / `just rust-ir-interop-full` |
| IR consumer link smoke | `just llvm-link-smoke` links generator Compose or Mult SSA `.ll` to a TMPDIR consumer (clang IR wrap or rustc+llc); skip-honest if tools missing; not classic FFI as the story; not FullBackend |

What this does **not** claim: formalization of all of rustc; product Rust under
`src/`; complete isomorphism of Systems Lean with all of Rust; tip fullBackend as
a synonym of the dual map; "no FFI ever." Without-classic-FFI happy-path end
announce is **closed under C1** for the Mult..Graph dual-map consumer path (see
status block above); that announce is not tip fullBackend and not a monorepo Rust
crate. Entry map: `doc/rust-entry.md`. Correspondence SSoT:
`doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md`.

| Artifact | Role |
|----------|------|
| Design note (emit path) | `doc/dev/research/llvm-ir-emit-path-2026-08-02.md` (Kind: analysis only) |
| Unlock design | `doc/dev/research/llvm-ir-unlock-design-2026-08-03.md` (checklist; residual done) |
| Backend deepen inventory | `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` |
| Host pin (path) | `SystemsLean/LlvmEmitPath.lean` (`llvmEmitPathReady`; local unlock false) |
| Host Mult..Graph unit IR | `LlvmMultText` / `LlvmLinearText` / `LlvmTypesText` / `LlvmProgramText` / `LlvmGraphText` |
| Host compose IR | `SystemsLean/LlvmComposeText.lean` |
| Host Mult SSA partial | `SystemsLean/LlvmMultSsa.lean` (full backend false) |
| Host Linear SSA partial | `SystemsLean/LlvmLinearSsa.lean` (full backend false) |
| Host Types SSA partial | `SystemsLean/LlvmTypesSsa.lean` (full backend false) |
| Host Program SSA partial | `SystemsLean/LlvmProgramSsa.lean` (full backend false) |
| Host Graph SSA partial | `SystemsLean/LlvmGraphSsa.lean` (full backend false) |
| Host Mult CFG fixture | `SystemsLean/LlvmCfgFixture.lean` (structural deepen partial + Production CFG deepen Mult SSA dual-pin; fixture tip fullBackend true A-light; production opt/dominance false) |
| Host multi-unit DF | `SystemsLean/LlvmCfgUnitDf.lean` + Mult DF (`LlvmCfgMultDf`); Mult..Graph Cytron dual-pin; `multiUnitDominanceFrontierDeepen` **true**; DominanceClaimed **false** |
| Hold unlock SSoT | `SystemsLean/LlvmHold.lean` (`llvmUnlocked` **true**; not full backend) |
| Measured stub | `MEASURED-STUB.txt` (honesty only; not production IR) |
| Unit IR fragments | `slake_mult.ll`, `slake_linear.ll`, `slake_types.ll`, `slake_program.ll`, `slake_graph.ll` |
| Compose IR fragment | `slake_compose.ll` |
| SSA IR fragments (partial) | `slake_mult_ssa.ll`, `slake_linear_ssa.ll`, `slake_types_ssa.ll`, `slake_program_ssa.ll`, `slake_graph_ssa.ll`, `slake_compose_ssa.ll` |
| Gates (unit + compose) | `just llvm-emit-path`; `just llvm-mult-text` .. `llvm-graph-text`; `just llvm-unit-package`; `just llvm-compose-text`; `just llvm-as-smoke` (optional) |
| Gates (SSA partial) | `just llvm-mult-ssa`; `just llvm-linear-ssa`; `just llvm-types-ssa`; `just llvm-program-ssa`; `just llvm-graph-ssa` (each fullBackend false) |
| Gates (layout / link) | `just mult-foreign-link-success` (Mult Mult-only); `just linear-foreign-link-success` (Linear Mult-class tags); `just types-foreign-link-success` (Types kind tags); `just program-foreign-link-success` (Program push codes); `just graph-foreign-link-success` (Graph add-edge); `just mult-link-readiness`; `just mult-layout-ir-success`; `just abi-parity-smoke`; `just layout-ir-dual-pin` |
| Gates (Rust IR interop) | `just rust-ir-interop-partial`; `just rust-ir-interop-full` (multi-band joint; not fullBackend; not formalized all of rustc) |
| Gates (richer layout / link smoke) | `just richer-record-layout` (`IrNodeRecord` rustc_abi dual-pin); `just llvm-link-smoke` (out-of-tree link of generator SSA `.ll`; skip-honest) |
| Gates (CFG deepen) | `just production-cfg-deepen` (Mult SSA dual-pin; fixture tip fullBackend / not production opt / not full dominance); unit Linear/Types/Program/Graph dual-pin recipes; Mult DF partial + deepen; multi-unit Mult..Graph DF deepen (`just multi-unit-dominance-frontier-deepen`); general + iterative CFG partial |
| Pure join | `just systems-llvm-ir` (Mult..Graph SSA + Mult CFG fixture deepen partial + Production CFG deepen + multi-unit Mult..Graph DF deepen + Mult layout/IR success partial + Mult..Graph foreign link success + Rust IR partial/full) |

**Unlock residual (documented, not full backend):** host gate
`SystemsLean/LlvmHold.lean` (`HOST-LLVM-HOLD` / `SELF-HOST-LLVM-HOLD` /
`HOST-PROVABLY-HOLD`). Living `llvmUnlocked` decides **true** with Mult..Graph
text ladder + lake elaborator proof. `provablyUnlocked` **true** (CompCert
matrix; orthogonal). Unlock does **not** mean full CFG/SSA production backend,
production opt, or Rust-native link success. Not production IR alone.

## Generator ownership

- Structural path pin: Lean `SystemsLean.LlvmEmitPath`
- Unit IR package text + write: Lean Mult / Linear / Types / Program / Graph text modules
- Compose IR package text + write: Lean `SystemsLean.LlvmComposeText`
- SSA partial package text + write: Lean Mult / Linear / Types / Program / Graph SSA modules
- Mult CFG fixture + Production CFG deepen: Lean `SystemsLean.LlvmCfgFixture` (structural + Mult SSA dual-pin)
- Mult layout/IR consumer success + link readiness + Mult foreign link success: pure Nix under `nix/systems-llvm-ir/` + host Lean `MultForeignLink` (not product Rust under `src/`)
- Linear foreign link success: pure Nix + host Lean `LinearForeignLink` (Linear Mult-class tags; Mult Mult-only unchanged)
- Types foreign link success: pure Nix + host Lean `TypesForeignLink` (Types kind tags VALUE/LINEAR/ERASED)
- Program foreign link success: pure Nix + host Lean `ProgramForeignLink` (Program push codes 0/-1/-2 CAP=8)
- Graph foreign link success: pure Nix + host Lean `GraphForeignLink` (Graph add-edge 0/-1 EDGE_MAX=16; Mult..Graph foreign progressive **done** band-local)
- Rust IR interop partial + multi-band full: pure Nix + host Lean `RustIrInterop` (`rustIrInteropPartialClaimed` / `rustIrInteropFullClaimed`; not fullBackend synonym)
- Unlock flag: Lean `SystemsLean.LlvmHold` only (living true after unlock residual; do not forge without lake proof)
- On-disk Mult/Linear/Types/Program/Graph/compose/SSA IR under this directory is **generator output**,
  not hand-grown production IR theater and not a second freestanding C dialect
- Primary product wire remains `out/freestanding-c/`

## After unlock residual

- This directory is a reserved release surface + design/stub + Mult..Graph unit IR
  + compose IR + five-band SSA partial with living unlock pin true.
- Correspondence and freestanding C (`out/freestanding-c/`) stay primary.
- Do not treat unit/compose/SSA IR text or measured stub as production-ready full
  LLVM emit / production CFG / dominance pipeline.
- `just out-llvm-ir` points at unlock + deepen path (not a full-backend claim).

## Ladder (done vs held)

1. **Unit package expand:** **done** -- `just llvm-unit-package` joins Mult..Graph.
2. **LLVM IR compose emit:** **done** -- `just llvm-compose-text` writes `slake_compose.ll`.
3. **Optional llvm-as smoke:** **done** -- `just llvm-as-smoke` skip-if-missing / RED when present.
4. **Rust-native layout design:** **done** -- research note (layout/ABI bar; not link claim).
5. **Layout size/align fixture + ABI parity + layout IR tag dual-pin:** **done** (Mult-first).
6. **Five-band SSA lower partial:** **done** -- Mult / Linear / Types / Program / Graph
   (`slake_*_ssa.ll`; fullBackend false). IMPL waves through **b2a2512c**.
7. **Mult layout/IR consumer success partial:** **done** -- `just mult-layout-ir-success`.
   Mult link readiness: `just mult-link-readiness`.
8. **Mult CFG fixture deepen partial:** **done** -- structural merge preds + reachability;
   production opt / dominance pipeline **false**.
9. **Mult foreign link success (Mult band):** **done** -- `just mult-foreign-link-success`;
   host Lean `MultForeignLink`; out-of-tree rustc dogfood; Mult Mult-only (otherBands
   false); not full backend.
9b. **Linear foreign link success (Linear Mult-class tags):** **done** --
   `just linear-foreign-link-success`; host Lean `LinearForeignLink`; out-of-tree
   LinearClassTag dogfood; not full backend.
9c. **Types foreign link success (Types kind tags):** **done** --
   `just types-foreign-link-success`; host Lean `TypesForeignLink`; out-of-tree
   TypesKindTag dogfood; not full backend.
9d. **Program foreign link success (Program push codes):** **done** --
   `just program-foreign-link-success`; host Lean `ProgramForeignLink`; out-of-tree
   ProgramPushStatus dogfood; not full backend.
9e. **Graph foreign link success (Graph add-edge):** **done** --
   `just graph-foreign-link-success`; host Lean `GraphForeignLink`; out-of-tree
   GraphAddEdgeStatus dogfood; last Mult..Graph foreign progressive; not full backend.
9f. **Rust IR interop partial + multi-band full:** **done** --
   `just rust-ir-interop-partial` / `just rust-ir-interop-full`; host Lean
   `RustIrInterop`; multi-band joint Mult..Graph dual map; not formalized all of
   rustc; not product Rust under `src/`; not fullBackend synonym.
9g. **Without-classic-FFI end announce (completeness C1):** **done** -- happy path
    for Mult..Graph layout / foreign dual map does **not** require classic FFI
    ceremony; surface-matrix row **measured**; public prose in goals / vocabulary /
    this README; freestanding C remains permanent; not "no FFI ever."
9h. **Richer-than-i32 named record:** **done** -- `just richer-record-layout`;
    host Lean `IrNodeLayout`; `IrNodeRecord` / `slake_ir_node` size 16 align 4
    pad 3 versus rustc_abi; C wire unchanged; not product Rust under `src/`.
9i. **IR consumer link smoke:** **done** -- `just llvm-link-smoke`; clang IR
    wrap or rustc+llc links Compose/Mult SSA `.ll` under TMPDIR; skip-honest
    if tools missing; not classic FFI as the story; not FullBackend.
10. **Production CFG deepen:** **done** -- Mult SSA grade_tag dual-pin (idom + four-pred
    merge phi); `just production-cfg-deepen`; production opt / full dominance
    pipeline **false**; fixture tip fullBackend **true** (Package 1 A-light).
10b. **Progressive Full LLVM path B:** **done** -- Mult..Graph unit CFG dual-pin;
    Mult DF partial; general + iterative CFG partial; R1e honesty;
    `fullLlvmBarEvidencePartial` true; `dominancePipelineRequiredForFullBackend`
    false; progressive independent of tip polarity.
10c. **Fixture tip fullBackend claim true (Package 1 A-light):** **done** --
    `llvmCfgFixtureFullBackendClaimed` true with lake; join redesign first;
    band SSA / foreign FullBackend stay false.
10d. **Multi-unit Mult..Graph DF Cytron dual-pin (R5 + N4):** **done** --
    Mult+Linear+Types+Program+Graph dominance frontier dual-pin;
    `multiUnitDominanceFrontierDeepen` **true**;
    `just multi-unit-dominance-frontier-deepen`. **Still not** DominanceClaimed
    (structural idom; fixed unit diamonds; path B; pure Nix forge-ban). Band
    FullBackend **false**. T4 honesty reseed 2026-08-11; W4 hold confirm 2026-08-11;
    R3 hold confirm 2026-08-11.
11. **Heavier LLVM beyond A-light:** **held** (operator A-heavy / C1b / XL only).
    Band FullBackend true, proved full DF pipeline (DominanceClaimed true), and
    production opt each need a written bar + lake + pure Nix invert. Do **not**
    auto-open while host T0-T3/T5 work is live. Fixture tip fullBackend **true**
    A-light; band FullBackend **false**; DominanceClaimed **false**. **C4**
    mathlib day-one = **non-goal**. **C5** host UX out of this repo.

## Optional llvm-as smoke (skip vs RED)

| Condition | Exit | Meaning |
|-----------|------|---------|
| `llvm-as` **not** on PATH | 0 (SKIP) | Optional tool missing; pure Nix `systems-llvm-ir` honesty still required |
| `llvm-as` on PATH and expected unit/compose (and optional SSA) `.ll` assemble | 0 (GREEN) | Generator-owned IR assembles; not production backend |
| `llvm-as` on PATH and any expected artifact **missing** | non-zero (RED) | Fail-closed after package/compose |
| `llvm-as` on PATH and assemble fails | non-zero (RED) | Broken generator-owned IR |

Measurement (not a gate): `just bench-llvm` times assemble / object / tiny execute of generator `*_ssa.ll` and writes `doc/BENCH-LLVM-latest.md`. Not CompCert. Not the C product wire. Not a full backend claim.

## Non-claims

Unlock claimed with evidence. Compose and SSA IR are generator-owned sketch
surfaces, not production opt. Optional llvm-as smoke is **not** a production
llvm-as path. Mult..Graph foreign link success is **band-local** each band
(otherBands false on each host pin; not one multi-band synonym of fullBackend).
Rust IR partial/full interop is **not** fullBackend. Without-classic-FFI end
announce is the happy-path contract for Mult..Graph layout / foreign dual map only
-- **not** "no FFI ever," **not** formalized all of rustc, **not** product Rust
under `src/`. Mult layout/IR consumer success and Mult link readiness remain
partial rungs under Mult success. Progressive path B evidence is **not** a synonym
of tip fullBackend (tip is separately true under Package 1 A-light). Band SSA /
foreign FullBackend stay false. Multi-unit Mult..Graph DF deepen **true** is
**not** DominanceClaimed true and **not** band FullBackend true. Classic
freestanding C under `out/freestanding-c/` remains the primary permanent product
wire. Not PROVABLY re-open. Not freestanding residual free re-open. Production
CFG deepen is Mult SSA dual-pin (not full dominance pipeline / not production
opt).
