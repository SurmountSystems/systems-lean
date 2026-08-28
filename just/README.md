# just/ -- modular task recipes

Root `justfile` is a thin menu: `set shell`, `import` of these modules, `default`, and `check`.
All modules use `import` (same namespace) so recipe names stay flat: `just check`, `just systems-host`.
Full suite `just check` includes fail-closed `product-compcert-matrix` (ccomp) after `systems-cc-probe`.

| Module | Role |
|--------|------|
| `gates.just` | Pure Nix eval strings + hygiene, professional-tone, systems-host/emit-wire/llvm-ir, idris/lean-side |
| `progress.just` | Progress meters (`progress`, `progress-scc`) |
| `product-wire.just` | `build`, product path read/compose/write, install/export freestanding |
| `freestanding-capable.just` | freestanding-capable-* gap/read/compose/write/regenerate/install/full-bar |
| `ownership.just` | ownership-regenerate-* |
| `freestanding-perform-1.just` | perform evidence / official path / dual-eq write parity |
| `freestanding-perform-2.just` | dual-eq write close-path / api / capable-gap |
| `freestanding-perform-3.just` | retire-official / perform-claimed / ownership-claimed |
| `freestanding-complete.just` | step-contract-full / freestanding-self-host-complete |
| `llvm.just` | out-llvm-ir, llvm-*-text, llvm-unit-package, llvm-as-smoke |
| `llvm-ssa.just` | llvm-compose-ssa (Compose SSA writer; split so llvm.just stays under 1000) |
| `llvm-link-smoke.just` | `just richer-record-layout` (IrNodeRecord rustc_abi dual-pin) + `just llvm-link-smoke` (out-of-tree clang or rustc+llc links generator SSA `.ll` under TMPDIR; skip-honest if tools missing) |
| `subset-emit.just` | first-surface + unit subset emit (+ early rebuilds colocated) |
| `subset-join.just` | subset package rebuild join / without-lake / lake-retire inventory |
| `host.just` | host residual shrink, front, fragment check |
| `host-without-lake.just` | host graph/package write and without-lake host recipes |
| `host-tool-expand.just` | Without-Lake develop-tool recovery and related host recipes |
| `compcert.just` | ccomp resolve/smoke, freestanding/mult under ccomp, product matrix. `product-compcert-matrix` skips unless hostname is `surmount-1` (laptop skip is GREEN). Force: `SYSTEMS_COMPCERT_MATRIX_FORCE=1`. |
| `subset-rebuild.just` | unit subset rebuild recipes (graph..mult) |
| `freestanding-mult.just` | mult freestanding deepen/write + product-wire-freestanding-write |
| `dual-side.just` | idris/lean elaborate, systems-lake, systems-cc-probe, watch. `_lake-if-pin` skips `lake build` unless hostname is `surmount-1` (laptop skip is GREEN). Force: `SYSTEMS_LEAN_LAKE_FORCE=1`. |
| `bench.just` | Compile-path timing (`just bench`). Smallest same-job recipe is `just bench-same-job` (does not clobber the suite file). Slake cannot run the Lake same-job until it typechecks this package. |
| `bench-runtime.just` | Runtime arm recipes and flag matrix. Timing-link flags only. |
| `bench-runtime-twins.just` | Smoke-only protocol twins. Not product wire. |
| `bench-runtime-report.just` | `just bench-runtime` plus living report `doc/BENCH-RUNTIME-latest.md`. |
| `bench-llvm.just` | Times generator SSA under `out/llvm-ir/`. Not CompCert. Not the C product wire. |

**Bar:** every file here and the root justfile must stay **under 1000 lines**. Growing past that is residual (split or port gate logic to pure Nix). See `AGENTS.md` (sub-1-KLOC / modular just).
