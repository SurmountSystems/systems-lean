# LLVM IR emit path (first residual inventory)

Kind: analysis only. Not residual invent beyond this named residual. Not
llvm unlock. Not production LLVM backend. Not Rust-native link success.
ASCII only. Date: 2026-08-02.

Living tip at land: free true; complete true; product StillUsesLake/DependsOnLake
false; hostElaboratorResidualRemains true; PROVABLY true (`provablyUnlocked`);
llvmUnlocked **false** (must stay false this residual).

Related:

- Goals: `doc/goals.md` (LLVM / Rust path deferred until self-host)
- Architecture backends: `doc/architecture.md` (LLVM IR section)
- Rust layout bar: `doc/rust-entry.md` (rustc_abi; LLVM IR alone is not enough)
- Hold gate: `src/systems/SystemsLean/LlvmHold.lean` (`llvmUnlocked` false)
- Release surface: `out/llvm-ir/` (reserved; measured stub only after this residual)
- Primary product wire: `out/freestanding-c/` (runtimeless freestanding C)
- PROVABLY surface: CompCert product matrix (orthogonal; claimed 2026-08-02)

---

## 1. Intent

**LLVM IR emit path** is the deferred secondary product surface for Slake:

| Intent | Meaning |
|--------|---------|
| Embed | Efficient freestanding-shaped embed via LLVM IR, not managed Lean AOT |
| Rust-native design bar | Layout/ABI-compatible interop with the Rust ecosystem **without** classic foreign-function glue as the happy path (`doc/rust-entry.md`) |
| Meet north star | Goals name freestanding products toward CompCert-oriented C **and** LLVM IR |

**Primary product remains freestanding C** under `out/freestanding-c`. LLVM IR is a
later parallel release surface, not a replacement for CompCert seal work.

---

## 2. Non-claims (this residual and current living tip)

| Claim | Status |
|-------|--------|
| `llvmUnlocked` | **false** (LlvmHold; proved false; do not flip here) |
| Production-ready `out/llvm-ir` | **false** |
| Full LLVM backend / llvm-as / opt pipeline | **out of scope** |
| Rust-native link as shipped success | **out of scope** (design bar only) |
| PROVABLY re-open / re-false | **forbidden** (stays true) |
| free / complete flip | **unchanged** (both true) |
| product StillUsesLake / DependsOnLake | **false** (unchanged) |
| host elaborator residual free | **false** (host residual remains) |
| Hand-authored product C growth as residual | **forbidden** |
| Second product C dialect under llvm-ir | **forbidden** |

---

## 3. Relation to freestanding C and PROVABLY

| Surface | Role | Evidence bar |
|---------|------|--------------|
| `out/freestanding-c` | **Primary** runtimeless freestanding C product wire | free true; complete true; host-owned emit SSOT |
| CompCert / PROVABLY | Seal product C with real resolved `ccomp` + matrix | `provablyUnlocked` true (2026-08-02) |
| `out/llvm-ir` | **Deferred** LLVM IR for embed + Rust path | separate unlock residual; this residual only design + measured stub |

PROVABLY does **not** unlock llvm. LlvmHold already separates
`provablyUnlocked` (true) from `llvmUnlocked` (false).

---

## 4. Relation to Rust-native link bar

From `doc/rust-entry.md` and `doc/architecture.md`:

1. **LLVM IR alone is not Rust layout.** rustc (`rustc_abi`, codegen) defines
   layout and ABI. A future backend must cite those rules + tests.
2. **Without classic FFI** is the design happy path, not a claim until design
   note + tests exist. This residual does **not** claim that bar.
3. **`ref/rust`** is read-only layout reference. Nested llvm-project under rust
   is not required for reading layout sources.

---

## 5. Candidate measured stub (this residual)

| Artifact | Role |
|----------|------|
| Research note (this file) | Design inventory + non-claims |
| `SystemsLean.LlvmEmitPath` | Short role-named host structural pin: path ready as **design+stub**, unlock stays false |
| `out/llvm-ir/MEASURED-STUB.txt` | On-disk honesty stub (generator ownership + non-claims) |
| `out/llvm-ir/README.md` | Consumer/status map (design+stub; not production) |
| `just llvm-emit-path` | Dual evidence: greps Lean pins + stub + LlvmHold `llvmUnlocked` false |

**Unlock remains deferred.** A later residual may deepen Mult unit IR text from
Lean SSOT while still keeping `llvmUnlocked` false until an explicit unlock
residual with elaborator proof.

---

## 6. Unlock bar (not this residual)

`llvmUnlocked` true only via a separate residual with:

1. Explicit unlock Done when + lake elaborator proof on the pin flip
2. Real emit path evidence beyond honesty stubs (named Mult or wider surface)
3. Residual/self-host honesty that does not forge free/complete/PROVABLY

Full backend and Rust-native link tests stay after unlock + product program opens
them.

---

## 7. Suggested follow-on Names (optional; not auto-invent)

| Name | Checkable sketch | Unlock? |
|------|------------------|---------|
| **LLVM IR Mult text** | First Mult unit IR text fragment from Lean SSOT under `out/llvm-ir/` (generator-owned) | stays false -- **landed** (`LlvmMultText` / `slake_mult.ll` / `just llvm-mult-text`) |
| **LLVM IR Linear text** | Linear unit IR text peer (generator-owned; still locked) | stays false -- **landed** (`LlvmLinearText` / `slake_linear.ll` / `just llvm-linear-text`) |
| **LLVM IR Types text** | Types unit IR text peer (generator-owned; still locked) | stays false -- **landed** (`LlvmTypesText` / `slake_types.ll` / `just llvm-types-text`) |
| **LLVM IR unit package join** | Thin just fail-closed mult+linear+types gates (historical first join) | stays false at land -- **landed** (`just llvm-unit-package`) |
| **LLVM IR Program text** | Ordered IR program unit text peer (generator-owned; still locked) | stays false -- **landed** (`LlvmProgramText` / `slake_program.ll` / `just llvm-program-text`) |
| **LLVM IR Graph text** | IR graph unit text peer (generator-owned; still locked) | stays false -- **landed** (`LlvmGraphText` / `slake_graph.ll` / `just llvm-graph-text`) |
| **LLVM IR unlock** | Explicit `llvmUnlocked` true + lake proof | **true** (unlock residual 2026-08-03 + lake) |
| **LLVM IR unit package expand** | Mult..Graph fail-closed package join | living unlock true -- **landed** (`just llvm-unit-package` Mult..Graph) |
| **LLVM IR compose emit** | First generator-owned composed IR | next (Track 2d) |
| Named proofs / duals | Only when operator names a property/gap | n/a |

**Landed Mult text (2026-08-02):** `SystemsLean.LlvmMultText` owns Mult-related
LLVM IR package text from Mult SSOT grades; lake exe `slake-llvm-mult-text`
writes `out/llvm-ir/slake_mult.ll`; dual `just llvm-mult-text`. Unlock remains
false.

**Landed Linear text (2026-08-02):** `SystemsLean.LlvmLinearText` owns
Linear-related LLVM IR package text from Linear SSOT (class ids,
LINEAR-EXACT-ONCE, shareNat/polyId sketches); lake exe `slake-llvm-linear-text`
writes `out/llvm-ir/slake_linear.ll`; dual `just llvm-linear-text`. Unlock
remains false.

**Landed Types text (2026-08-03):** `SystemsLean.LlvmTypesText` owns
Types-related LLVM IR package text from Types SSOT (NodeKind VALUE/LINEAR/ERASED,
kind/mult pairing, TYPED_IR_V0, FAIL-CLOSED-UNKNOWN-KIND); lake exe
`slake-llvm-types-text` writes `out/llvm-ir/slake_types.ll`; dual
`just llvm-types-text`. Unlock remains false.

**Landed unit package join (2026-08-03):** Thin fail-closed just recipe
`llvm-unit-package` first ran `llvm-mult-text` + `llvm-linear-text` +
`llvm-types-text` and checked the three generator-owned artifacts under
`out/llvm-ir/`. Mult/Linear/Types IR text ladder joined for measurement without
inventing a second dialect (unlock still false at that land).

**Landed unit package expand (2026-08-03):** Same recipe expanded to Mult..Graph
(`+ llvm-program-text` + `llvm-graph-text`; artifacts
`slake_{mult,linear,types,program,graph}.ll`). Living `llvmUnlocked` true required
after unlock residual; local text-module unlock pins stay false.

**Landed Program text (2026-08-03):** `SystemsLean.LlvmProgramText` owns
Program-related LLVM IR package text from IrProgram SSOT (`programCap` 8 /
SLAKE_IR_PROGRAM_CAP, ORDERED-IR-PROGRAM, EMPTY-PROGRAM-FAIL-CLOSED, push /
isWellTyped / checkFailClosed sketches; not CFG/SSA); lake exe
`slake-llvm-program-text` writes `out/llvm-ir/slake_program.ll`; dual
`just llvm-program-text`. Unlock remains false.

**Landed Graph text (2026-08-03):** `SystemsLean.LlvmGraphText` owns
Graph-related LLVM IR package text from IrGraph SSOT (`edgeMax` 16 /
SLAKE_IR_EDGE_MAX, EMPTY-GRAPH-OK, IR-GRAPH-EDGES, addEdge / pushNode /
isWellTyped / checkFailClosed / edgesSound sketches; not full CFG/dominance/SSA);
lake exe `slake-llvm-graph-text` writes `out/llvm-ir/slake_graph.ll`; dual
`just llvm-graph-text`. Unlock remains false.

**Landed unlock design (2026-08-03):** research note
`doc/dev/research/llvm-ir-unlock-design-2026-08-03.md` (checklist + next Name
**LLVM IR unlock residual**). Pin still false until unlock residual + lake.

---

## 8. What this residual lands

1. This research note.
2. Host pin `SystemsLean.LlvmEmitPath` (`llvmEmitPathReady` true; local
   unlock pin false; composes hold honesty without flipping LlvmHold).
3. Measured stub + README under `out/llvm-ir/`.
4. `just llvm-emit-path` dual greps; presence dual-pin; residual lockstep.

Not freestanding residual free re-open. Not llvm unlock. Not production IR.
