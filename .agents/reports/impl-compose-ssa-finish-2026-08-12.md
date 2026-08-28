# Compose SSA finish -- 2026-08-12

Resume, do not rewrite. Mid-flight writer already had `composeSsaPackage`,
`llvmComposeSsaWrite` (`IO.FS.writeFile`), lake exe `slake-llvm-compose-ssa`,
and just recipe `llvm-compose-ssa`. Missing artifact was
`out/llvm-ir/slake_compose_ssa.ll`.

## Resume vs rewrite

**Resumed.** No Lean rewrite. No second writer. No second recipe. No Nix
spec weaken. No lakefile change. Ran the existing writer.

Touched: generator-owned `out/llvm-ir/slake_compose_ssa.ll` (writer output)
and this report. Did not edit `LlvmComposeSsa.lean`, Main, just, or Nix.

## Red observed (file missing)

Command: `just systems-llvm-ir`

Exit: **1**

Fail: `systems-llvm-ir-presence FAILED: missing file: out/llvm-ir/slake_compose_ssa.ll`

Confirmed before write: `out/llvm-ir/slake_compose_ssa.ll` absent; peer
`slake_{mult,linear,types,program,graph}_ssa.ll` already present.

Lake on PATH: `/home/hunter/.elan/bin/lake` (Lake 5.0.0-src+8c9756b, Lean 4.32.0).

## Green -- writer

Command: `just llvm-compose-ssa`

Exit: **0**

- `lake build slake-llvm-compose-ssa` -- Build completed successfully (80 jobs)
- `lake exe slake-llvm-compose-ssa -- <repo root>` --
  `GREEN SLAKE_LLVM_COMPOSE_SSA_V0: wrote .../out/llvm-ir/slake_compose_ssa.ll (4542)`
  `readyPin=true llvmUnlocked=true fullBackend=false`
- recipe then ran `just systems-llvm-ir` -- presence OK (190 required paths)
- `llvm-compose-ssa: GREEN`

File: `out/llvm-ir/slake_compose_ssa.ll` -- 4542 bytes.

## Tokens in `out/llvm-ir/slake_compose_ssa.ll`

Nix `nix/systems-llvm-ir/compose-ssa.nix` contentSpecs for that file, plus
the Done-when list:

| Token | Present |
|---|---|
| SLAKE_LLVM_COMPOSE_SSA_V0 | yes (banner) |
| HOST-LLVM-COMPOSE-SSA | yes |
| HOST_COMPOSE_V0 | yes |
| HOST-COMPOSE | yes |
| EMPTY-GRAPH-OK | yes |
| EMPTY-PROGRAM-FAIL-CLOSED | yes |
| SLAKE_IR_PROGRAM_CAP | yes (`=8`) |
| SLAKE_IR_EDGE_MAX | yes (`=16`) |
| SSA-SHAPED | yes |
| `phi i32` | yes (mint + consume merge) |
| slake_compose_ssa_mint_status | yes |
| slake_compose_ssa_consume_status | yes |
| slake_compose_ssa_kernel_band_ready | yes |
| slake_compose_ssa_check_fail_closed | yes |
| slake_compose_ssa_extract_ok_fs | yes |
| bb_ok / bb_reject | yes |
| SystemsLean/HostCompose.lean | yes |
| llvmUnlocked | yes (honesty comment; local pin remains false) |
| Not production LLVM backend | yes |
| Not full CFG/dominance | yes |

## Green -- gates after file exists

| Command | Exit | Note |
|---|---|---|
| `just systems-llvm-ir` (via `just llvm-compose-ssa`) | 0 | compose SSA partial listed among required paths |
| `just hygiene` | 0 | source-hygiene OK (1323 files); professional-tone OK (665 markdown) |
| `just llvm-as-smoke` | 0 | **GREEN** (llvm-as on PATH; not skip) |

llvm-as assembled all expected artifacts, including compose SSA:

- slake_compose.ll, slake_mult.ll, slake_linear.ll, slake_types.ll,
  slake_program.ll, slake_graph.ll
- slake_compose_ssa.ll
- slake_mult_ssa.ll, slake_linear_ssa.ll, slake_types_ssa.ll,
  slake_program_ssa.ll, slake_graph_ssa.ll

`just/llvm.just` expected set already listed `slake_compose_ssa.ll`. Did not
edit `just/llvm.just`.

**SSA llvm-as expected set: done** (green assemble of Mult through Graph SSA
and compose SSA).

## Pins unchanged

Did not flip any living claim bools. Writer already had:

- `llvmComposeSsaFinishedClaimed := true` -- now honest: file exists
- `llvmComposeSsaFullBackendClaimed := false` -- stays false
- `llvmComposeSsaLlvmUnlocked := false` -- local unlock pin stays false
- `llvmComposeSsaCfgProductionClaimed := false`

Did **not** flip: free, complete, PROVABLY, FullHostElaborateRemains,
DominanceClaimed, band FullBackend.

## Residual lockstep should mark done

Parent / residual lockstep owns `RESIDUAL-systems.md`, `RESIDUAL.md`,
`WATCHER.md`, `doc/SESSION-HANDOFF.md` (this implementer did not touch them).

Mark done:

1. **Compose SSA** -- `out/llvm-ir/slake_compose_ssa.ll` exists; tokens
   match Nix spec; writer + `just systems-llvm-ir` green.
2. **SSA llvm-as expected set** -- `just llvm-as-smoke` GREEN including
   `slake_compose_ssa.ll` (Mult through Graph SSA and compose SSA).

Do not mark production backend / FullBackend / DominanceClaimed / free /
complete / PROVABLY / FullHost as done from this slice.
