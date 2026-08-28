# Explore: LLVM / Rust second primary target (2026-08-12)

Kind: analysis only. Not residual. ASCII. Do not implement. Do not forge pins.

Sources: `doc/goals.md` item 10; `doc/rust-entry.md`; `out/llvm-ir/README.md`;
`doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` (reseed 2026-08-11);
`doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`; residual
Held + living tip in `RESIDUAL-systems.md`; plan living tip
`.agents/plans/plan-north-star-remaining.md`; `just/llvm.just`.

## 1. What LLVM is already claimed

| Claim | Living | Meaning |
|-------|--------|---------|
| `llvmUnlocked` | true | Unlock residual + lake. Not a full backend. |
| Mult..Graph unit IR + compose | done | Generator-owned `.ll` under `out/llvm-ir/`. |
| Five-band SSA lower | done partial | `slake_*_ssa.ll`; each band `*FullBackendClaimed` false. |
| Mult..Graph production CFG dual-pin | done | Unit diamonds / multi-unit; not general pipeline. |
| multiUnit Mult..Graph DF deepen | true | Cytron dual-pin on fixed unit diamonds. |
| `fullLlvmBarEvidencePartial` | true | Progressive path B met. |
| Fixture tip `llvmCfgFixtureFullBackendClaimed` | true A-light | Package 1; not band FullBackend. |
| Band Mult..Graph SSA / foreign `*FullBackendClaimed` | **false** | Pure Nix forge-ban. |
| `DominanceClaimed` | **false** | Structural idom; not proved general DF. |
| Production opt / llc / machine code | **false** | Intentional non-claim. |

Primary product wire stays `out/freestanding-c/`. LLVM is a reserved second
emit surface, not a replacement C dialect.

## 2. What Rust-compatible means here

Not product Rust under `src/` (three languages only). Not rustc formalized.

Happy path: **layout-compatible LLVM IR** so an out-of-tree Rust consumer can
share Mult..Graph i32 tag / status shapes (size 4, align 4 on
`x86_64-unknown-linux-gnu`) without classic FFI ceremony as the story.
Evidence: band-local foreign dual-pins + `rustIrInteropPartialClaimed` /
`rustIrInteropFullClaimed` + optional `/tmp` rustc dogfood.

C1 without-classic-FFI end announce is **measured** for that dual-map path.
It is **not** "no FFI ever", not a monorepo Rust crate, not tip FullBackend,
and **not** linking Slake `.ll` into a rustc binary. AGENTS still says
Rust-native **link** of layout-compatible IR was deferred until self-host;
self-host complete is true, but the link step is still dual-map, not IR link.

## 3. Held vs checkable next

Living Open: **empty done-for-now** (HAP closed 2026-08-12). Residual: do
**not** invent a new Open Name.

**Held until operator promote (A-heavy / C1b / XL):** band FullBackend true;
DominanceClaimed true; proved idom constructor + arbitrary-graph DF; production
opt / llc; FullHostElaborateRemains; mathlib (C4 non-goal).

U4 (2026-08-11) found **no** checkable A-heavy dual-pin short of those XL
pieces + forge-ban invert + lake. Honesty holds T4/W4/R3/U4 already closed.

**Checkable without pin forge:** re-run gates only (`just systems-llvm-ir`,
`just rust-ir-interop-full`, optional `just llvm-as-smoke`). Not new residual.

## 4. Operator-promote Names (grow LLVM/Rust; keep pins false)

Do not auto-open. If the operator wants the second target to grow:

1. **Arbitrary-graph DF export** -- DF beyond unit diamonds; keep DominanceClaimed false.
2. **Proved idom constructor** -- algorithm vs hand tables; pin stays false until bar + Nix invert.
3. **SSA llvm-as expected set** -- fail-closed assemble of `slake_*_ssa.ll` when llvm-as is on PATH (today unit+compose only).
4. **Richer-than-i32 layout** -- one named struct/record size/align dual-pin vs rustc_abi; still no product Rust.
5. **IR consumer link smoke** -- out-of-tree rustc (or clang) actually **links** a generator `.ll` (or bitcode) to a tiny consumer; not classic FFI as the story; not FullBackend.
6. **Compose SSA lower partial** -- compose band to SSA-shaped IR like Mult..Graph; local FullBackend false.
7. **Mult otherBands honesty** -- `multForeignLinkOtherBandsClaimed` stays false unless a named multi-band crate bar exists (today joint interop is already the multi-band map).

## 5. Risks

- Selling `out/llvm-ir/` as product wire (C remains primary).
- Racing freestanding C / emit SSOT to "win" LLVM theater.
- Treating tip A-light or multiUnit DF as band FullBackend or DominanceClaimed.
- Inventing FullHost / Lake-gone from llvm unlock.
- Growing product Rust or more C/shell as residual progress.
- Auto-opening Names while residual says empty done-for-now.

## Lean llvm-related modules (one line)

`LlvmHold` unlock+PROVABLY SSoT; `LlvmEmitPath` path pin (local unlock false);
`Llvm*Text` / `LlvmComposeText` unit+compose writers; `Llvm*Ssa` five-band
partial lower; `LlvmCfgFixture` structural+production CFG + tip A-light;
`LlvmCfgMultProduction` / `LlvmCfgUnitProduction` dual-pins; `LlvmCfgMultDf` /
`LlvmCfgUnitDf` DF; `LlvmCfgGeneral` / `LlvmCfgHonesty` path B; `*ForeignLink`
band-local; `RustIrInterop` joint partial+full. `*Main` are lake exe entries.

## just/llvm.just (thin names)

`out-llvm-ir`, `llvm-emit-path`, `llvm-{mult,linear,types,program,graph}-text`,
`llvm-unit-package`, `llvm-*-ssa`, `llvm-compose-text`, `llvm-as-smoke`,
`abi-parity-smoke`, `layout-ir-dual-pin`, `mult-layout-consumer`,
`mult-link-readiness`, `mult-layout-ir-success`, `*-cfg-production-deepen`,
`*-dominance-frontier-*`, `multi-unit-dominance-frontier-deepen`,
`general-program-cfg-partial`, `iterative-cfg-construction-partial`,
`*-foreign-link-success`, `rust-ir-interop-partial`, `rust-ir-interop-full`.
Join: `just systems-llvm-ir`.
