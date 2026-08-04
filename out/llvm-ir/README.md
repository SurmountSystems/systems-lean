# out/llvm-ir -- LLVM IR (intermediate representation) for Rust-native link

**Intent:** freestanding emit of LLVM IR that can link with the Rust ecosystem in a seamless, native way (layout/ABI (application binary interface) compatible) -- without classic FFI (foreign function interface) glue as the happy path.

## Status: unlocked with evidence (Mult..Graph unit IR + compose emit + optional llvm-as smoke + unlock residual; not full backend)

First residual: **design note + measured honesty stub**. Second: **Mult unit IR
text** from Lean Mult SSOT (`slake_mult.ll`). Third: **Linear unit IR text**
from Lean Linear SSOT (`slake_linear.ll`). Fourth: **Types unit IR text** from
Lean Types SSOT (`slake_types.ll`). Fifth: **Program unit IR text** from Lean
Program SSOT (`slake_program.ll`). Sixth: **Graph unit IR text** from Lean
Graph SSOT (`slake_graph.ll`). Seventh: **compose IR text** from Lean host
compose + program+graph SSOT (`slake_compose.ll`). Eighth: **optional llvm-as
smoke** (`just llvm-as-smoke`; skip when tool missing; RED when present and
assemble fails; not production backend). Living `llvmUnlocked` is **true**
(unlock residual + lake proof). Local text-module unlock pins stay **false**
(modules do not own unlock). Not full backend.

| Artifact | Role |
|----------|------|
| Design note (emit path) | `doc/dev/research/llvm-ir-emit-path-2026-08-02.md` (Kind: analysis only) |
| Unlock design | `doc/dev/research/llvm-ir-unlock-design-2026-08-03.md` (checklist; residual done) |
| Host pin (path) | `SystemsLean/LlvmEmitPath.lean` (`llvmEmitPathReady`; local unlock false) |
| Host Mult IR | `SystemsLean/LlvmMultText.lean` (`llvmMultTextReady`; Mult grades SSOT) |
| Host Linear IR | `SystemsLean/LlvmLinearText.lean` (`llvmLinearTextReady`; Linear SSOT) |
| Host Types IR | `SystemsLean/LlvmTypesText.lean` (`llvmTypesTextReady`; Types kind/mult SSOT) |
| Host Program IR | `SystemsLean/LlvmProgramText.lean` (`llvmProgramTextReady`; Program CAP/push SSOT) |
| Host Graph IR | `SystemsLean/LlvmGraphText.lean` (`llvmGraphTextReady`; Graph EDGE_MAX/EMPTY-GRAPH-OK SSOT) |
| Host compose IR | `SystemsLean/LlvmComposeText.lean` (`llvmComposeTextReady`; HostCompose + CAP/EDGE_MAX SSOT) |
| Hold unlock SSoT | `SystemsLean/LlvmHold.lean` (`llvmUnlocked` **true**; `llvmHoldReady` true; not full backend) |
| Measured stub | `MEASURED-STUB.txt` (honesty only; not production IR) |
| Mult IR fragment | `slake_mult.ll` (generator-owned; Lean `IO.FS.writeFile`) |
| Linear IR fragment | `slake_linear.ll` (generator-owned; Lean `IO.FS.writeFile`) |
| Types IR fragment | `slake_types.ll` (generator-owned; Lean `IO.FS.writeFile`) |
| Program IR fragment | `slake_program.ll` (generator-owned; Lean `IO.FS.writeFile`) |
| Graph IR fragment | `slake_graph.ll` (generator-owned; Lean `IO.FS.writeFile`) |
| Compose IR fragment | `slake_compose.ll` (generator-owned; Lean `IO.FS.writeFile`) |
| Gates | `just llvm-emit-path`; `just llvm-mult-text`; `just llvm-linear-text`; `just llvm-types-text`; `just llvm-program-text`; `just llvm-graph-text`; `just llvm-unit-package` (Mult..Graph join); `just llvm-compose-text` (compose layer; living unlock true; local pins false); `just llvm-as-smoke` (optional; skip-if-missing; not production); `just abi-parity-smoke` (Mult fixture/header/IR agreement; not full Rust ABI) |

**SH6 unlock residual (documented, not full backend):** host gate
`SystemsLean/LlvmHold.lean` (`HOST-LLVM-HOLD` / `SELF-HOST-LLVM-HOLD` /
`HOST-PROVABLY-HOLD`). Living `llvmUnlocked` decides **true** with Mult..Graph
text ladder + lake elaborator proof. `provablyUnlocked` **true** (CompCert
matrix; orthogonal). Unlock does **not** mean full CFG/SSA, production opt, or
Rust-native link success. Not production IR alone.

## Generator ownership

- Structural path pin: Lean `SystemsLean.LlvmEmitPath`
- Mult IR package text + write: Lean `SystemsLean.LlvmMultText` (Mult SSOT grades)
- Linear IR package text + write: Lean `SystemsLean.LlvmLinearText` (Linear SSOT)
- Types IR package text + write: Lean `SystemsLean.LlvmTypesText` (Types kind/mult)
- Program IR package text + write: Lean `SystemsLean.LlvmProgramText` (Program CAP/push)
- Graph IR package text + write: Lean `SystemsLean.LlvmGraphText` (Graph EDGE_MAX/EMPTY-GRAPH-OK)
- Compose IR package text + write: Lean `SystemsLean.LlvmComposeText` (HostCompose + program+graph)
- Unlock flag: Lean `SystemsLean.LlvmHold` only (living true after unlock residual; do not forge without lake proof)
- On-disk Mult/Linear/Types/Program/Graph/compose IR under this directory is **generator output**,
  not hand-grown production IR theater and not a second freestanding C dialect
- Primary product wire remains `out/freestanding-c/`

## After unlock residual

- This directory is a reserved release surface + design/stub + Mult/Linear/Types/
  Program/Graph unit IR text + compose IR text with living unlock pin true.
- Correspondence and freestanding C (`out/freestanding-c/`) stay primary.
- Do not treat Mult/Linear/Types/Program/Graph/compose IR text or measured stub as
  production-ready full LLVM emit / CFG / SSA.
- `just out-llvm-ir` points at unlock + deepen path (not a full-backend claim).

## Later (post-unlock product ladder)

1. **Unit package expand (Track 2c):** **done** -- `just llvm-unit-package` joins Mult..Graph.
2. **LLVM IR compose emit (Track 2d):** **done** -- `just llvm-compose-text` writes `slake_compose.ll`.
3. **Optional llvm-as smoke (Track 2e):** **done** -- `just llvm-as-smoke` skip-if-missing / RED when present; pure Nix honesty only (no always-on CI binary require).
4. **Rust-native layout design (Track 2f):** **done** -- `doc/dev/research/rust-native-layout-design-2026-08-03.md` (layout/ABI bar vs `rustc_abi`; not Rust link claim). See `doc/rust-entry.md`.
5. **Layout size/align fixture done** (`doc/dev/research/layout-size-align-fixture-2026-08-03.md`; Mult i32 tags size 4 align 4).
6. **ABI parity smoke done** (`just abi-parity-smoke`; pure Nix Mult fixture + freestanding header + IR tags; not full Rust ABI / not link without classic FFI).
7. **Layout IR tag dual-pin done** (`just layout-ir-dual-pin`; pure Nix Mult IR full tag lines vs fixture `LAYOUT-IR-TAG-DUAL-PIN`; Mult primary; not Rust-native link / not full Graph/Program layout). Mult-first layout ladder closed. **Next primary Open:** SelfApplyFs long-file split.
7. Release same as freestanding-c (subtree/tarball) when green and compose exists.

## Optional llvm-as smoke (skip vs RED)

| Condition | Exit | Meaning |
|-----------|------|---------|
| `llvm-as` **not** on PATH | 0 (SKIP) | Optional tool missing; pure Nix `systems-llvm-ir` honesty still required |
| `llvm-as` on PATH and all expected `slake_{compose,mult,linear,types,program,graph}.ll` assemble | 0 (GREEN) | Generator-owned IR assembles; not production backend |
| `llvm-as` on PATH and any expected artifact **missing** | non-zero (RED) | Fail-closed after package/compose |
| `llvm-as` on PATH and assemble fails | non-zero (RED) | Broken generator-owned IR |

## Non-claims

Unlock claimed with evidence. Compose IR is generator-owned sketch surface, not
production opt. Optional llvm-as smoke is **not** production llvm-as path (Track
5). Not Rust-native link success. Not PROVABLY re-open. Not full LLVM backend.
Not freestanding residual free re-open. Not full CFG/SSA.
