# just/ -- modular task recipes

Root `justfile` is a thin menu: `set shell`, `import` of these modules, `default`, and `check`.
All modules use `import` (same namespace) so recipe names stay flat: `just check`, `just systems-host`.

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
| `llvm.just` | out-llvm-ir, llvm-*-text, llvm-unit-package |
| `subset-emit.just` | first-surface + unit subset emit (+ early rebuilds colocated) |
| `subset-join.just` | subset package rebuild join / without-lake / lake-retire inventory |
| `host.just` | host residual shrink, front, fragment check |
| `host-without-lake.just` | host graph/package write and without-lake host recipes |
| `host-tool-expand.just` | A9..A10+++ develop tool clean-bootstrap + host-front/subset-front/front-mult-package/first-surface without-lake; mult-subset-rebuild via clean-bootstrap + subset-rebuild without-lake |
| `compcert.just` | ccomp resolve/smoke, freestanding/mult under ccomp, product matrix |
| `subset-rebuild.just` | unit subset rebuild recipes (graph..mult) |
| `freestanding-mult.just` | mult freestanding deepen/write + product-wire-freestanding-write |
| `dual-side.just` | idris/lean elaborate, systems-lake, systems-cc-probe, watch |

**Bar:** every file here and the root justfile must stay **under 1000 lines**. Growing past that is residual (split or port gate logic to pure Nix). See `AGENTS.md` (sub-1-KLOC / modular just).
