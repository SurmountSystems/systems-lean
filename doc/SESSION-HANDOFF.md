# Session handoff

Reseed after compaction or a new chat. Read in order with `AGENTS.md`.

---

## Role (separate sessions -- ask once if unclear)

| Session | How to reseed | Owns |
|---------|---------------|------|
| **Watcher** | Separate session; contract in root `WATCHER.md` | Auto-continue residual from `WATCHER_BEGIN` / `WATCHER_END` |
| **Systems / Slake** | Paste `doc/fork-systems.md` PROMPT | `src/systems/`, `RESIDUAL-systems.md` |
| **Idris side** | Paste `doc/fork-idris.md` PROMPT | `src/idris2/`, `RESIDUAL-idris.md` |
| **Lean side** | Paste `doc/fork-lean.md` PROMPT | `src/lean4/`, `RESIDUAL-lean.md` |
| **Coordinator** | `doc/fork-coordinator.md` | `RESIDUAL.md` join board, fork guidance |
| **Research** | Analysis under `doc/research/` | Inventory / correspondence notes only |

**Do not confuse:** the **watcher session** (reads `WATCHER.md`) is not the **Systems / Slake session**.
`just watch` is only a progress-meter loop (any session may run it).

If role is unclear after compaction: **ask once**. Do not assume coordinator or watcher.

**Status:** foundation + dual depth (algorithm ids ConsumeToken, ErasedIndex,
UnrestrictedShare, FailClosedGrade) + IR sketch + systems skeleton + unit surface + compile path
+ **frozen** freestanding emit product wire (through emit Out / wire Body) +
**SYSTEMS_LEAN_HOST partial** (Lake + Mult..SelfHostBody under `src/systems/`;
**278** `SystemsLean/*.lean` host modules including
FirstSurface + FirstSurfaceMain + MultSubsetEmit + MultSubsetEmitMain +
MultSubsetRebuild + MultSubsetRebuildMain +
LinearSubsetEmit + LinearSubsetEmitMain +
LinearSubsetRebuild + LinearSubsetRebuildMain +
TypesSubsetEmit + TypesSubsetEmitMain +
TypesSubsetRebuild + TypesSubsetRebuildMain +
ProgramSubsetEmit + ProgramSubsetEmitMain +
ProgramSubsetRebuild + ProgramSubsetRebuildMain +
ExtractSubsetEmit + ExtractSubsetEmitMain +
ErasureSubsetEmit + ErasureSubsetEmitMain +
ErasureSubsetRebuild + ErasureSubsetRebuildMain +
GraphSubsetEmit + GraphSubsetEmitMain +
GraphSubsetRebuild + GraphSubsetRebuildMain +
ComposeSubsetEmit + ComposeSubsetEmitMain +
ComposeSubsetRebuild + ComposeSubsetRebuildMain +
SubsetFront + SubsetFrontMain + SubsetPackageJoin +
FrontMultPackage + FrontMultPackageMain +
HostTerm + HostFront + HostFrontTheorems + HostFrontMain + HostCheck + HostCheckMain +
HostGraph + HostGraphTheorems + HostGraphMain + HostPackageWrite + HostPackageWriteTheorems + HostPackageWriteMain +
HostPackageRoots + HostPackageRootsMain +
HostImportGraph + HostImportGraphSeeds + HostImportGraphModel + HostImportGraphMods +
HostImportGraphModsLater + HostImportGraphLoadOk + HostImportGraphTheorems +
HostImportGraphWalk + HostImportGraphDriver + HostImportGraphMain +
HostModuleCheck + HostModuleCheckFixtures + HostModuleCheckTheorems + HostModuleCheckMain +
HostResidualShrink + HostResidualShrinkTheorems +
LakeRetireInventory +
OfficialRetireMain + PerformClaimedMain + OwnershipClaimedMain +
StepContractFullMain + PerformClaimed + OfficialRetire +
DualEqWriteCapableGap +
DualEqWriteApi + DualEqWriteLoad +
DualEqWriteClosePath +
DualEqWriteParity +
OfficialPathAlternate +
OfficialPath +
PerformEvidence + ProductPathOwnershipRegenerate + ProductPathOwnershipRegenerateMain +
CapableFullBar + CapableFullBarMain +
InstallOut + InstallOutMain +
CapableRegenerate + CapableRegenerateMain +
CapableWriteHc + CapableWriteHcMain +
CapableRead + CapableReadMain +
CapableCompose + CapableComposeMain +
CapableStepContract +
Capable + ProductPathWriteHc +
ProductPathComposePlan + ProductPathComposePlanMain + ProductPathReadSsot +
ProductPathReadSsotMain + ProductPathPerformStep + ProductPathBars +
FreestandingEmitMain + FreestandingEmit + FreestandingEmitLoad +
EmitBanner + EmitLinear + EmitErasure + EmitExtract +
EmitTypes + EmitProgram + EmitGraph + EmitCompose + SelfHostBody + ElabMeet + ElabMeetCompile + ElabMeetProbe + ElabMeetOlean + ElabMeetDesc + ElabMeetExe + ElabMeetImpSrc + ElabMeetImpSrcTwo + ElabMeetExeSrcTwo + ElabMeetExeProbe).
Defined freestanding compile step (SelfHostBody readiness pin -- readiness only,
not a substitute for claim B). Claim B freestanding product self-host complete is
**true**. Product residual free (claim A) is **true**. Host elaborator residual free
is **claimed** (F1 dual-ok). Diagnostic / bootstrap Lake may still elaborate.
Progress meter 100% is evidence-weighted milestones, not "Lake is gone."

**Decision (product path):** `just build` = product freestanding wire (emit +
`out/freestanding-c/`). No `out-freestanding-c` just recipe. `just check` builds
first (`SYSTEMS_PRODUCT_WIRE_FRESH=1` skips double regenerate in systems-cc-probe
and freestanding-under-ccomp) and runs fail-closed `product-compcert-matrix` (ccomp).

**Living tip (2026-08-28):**

Hub reliability: `ElabMeetTheorems.lean` no longer imports the 18
historical isolation probes (HostFrontTheorems through
FixtureTextsLater). Those isolation theorems live on the probe modules.
Named-helper imports that pulled later probes are also gone from the
hub. ElabMeetTheorems is **581**. Do **not** run
`lake build SystemsLean.ElabMeetTheorems` or ElabMeet as the prove.
MemoryMax **192 GiB** is the ceiling. Never raise it. 256 GiB is the
box. Measured fat isolation peak about **167 GiB**. Max concurrent fat
Leans is `floor(192/167) = 1`. Do not set jobs from core count.
`64 * 10 GiB = 640 GiB` is not a budget we have. Fat proves:
`LEAN_NUM_THREADS=1`, one niced Lake, one lean. If more than one
`lean` process appears, stop starting jobs and tell the operator. Do
**not** kill processes unless the operator names the PID or job.
`just check` on **horizon** skips `lake build` in `_lake-if-pin`
(`just/dual-side.just`) unless hostname is `surmount-1`. Force:
`SYSTEMS_LEAN_LAKE_FORCE=1`. Named closed subset stays **49 of about 206**.
Do **not** claim **50**.
FullHost stays false. Grow HostModuleCheckParityTypesTerm subset is
**done**. Types isolation EXIT 0 on surmount-1 (1802 s, 21 jobs).
ElabMeet ANDs the four ParityTypesTerm drive Bools. Open Name is Grow
HostModuleCheckParityProgramTerm subset. That prove may already be in
flight. Do not start a second Lake. Not the theorems hub. Not FullHost.
`leakEnv := false` stays on the nixbuilder tree
(ElabMeetCompile lines 111 and 170). Report
`/home/hunter/.agents/reports/iso-2026-08-28-paritytypes-49.md`.

**Prior living tip (2026-08-26):**

Grow HostModuleCheckParityMultTerm subset is **done**. Isolation probe
EXIT 0 (2518 s; peak lean RSS about **167 GiB**). Theorems hub Lean 137
parallel probes STOPPED. Tip stays **47**. Pins stay false. Operator
STOP (2026-08-27): do **not** run `lake build SystemsLean.ElabMeetTheorems`
or ElabMeet. Report `/home/hunter/.agents/reports/iso-2026-08-27-leakenv-fix.md`.

**Prior living tip (2026-08-22):**

Grow HostModuleCheckCheckers subset is **done**. Remote niced
Lake on surmount-1 exited 0 for
`SystemsLean.ElabMeetNamedHostModuleCheckCheckersProbe` (1625 s),
`SystemsLean.ElabMeetTheorems` (1905 s), and `SystemsLean.ElabMeet`
(2 s incremental) with `set_option maxRecDepth 8192` on `elabMeetReady`
kept (ELAN_HOME=/var/lib/elan; Lake 5.0 has no `-j`). Four `_true` theorems
native_decide green. `elabMeetReady` ANDs the four Checkers drive Bools.
Named closed subset is **38 of about 206** including
HostModuleCheckCheckers. Partial named-subset capability is **true**.
Full aggregate `slakeOwnsPackageTypecheck` stays **false**.
FullHostElaborateRemains stays **false**. CheckersProbe **244**.
Emit walk **693**. FixtureTexts walk **657**. WalkLater **762**.
ElabMeet **921**. ElabMeetTheorems **975** at lake prove (header
helper-table fold **984**). Helper
ElabMeetTheoremsNamedHostModuleCheckCheckers **58**. Open Name is Grow
HostModuleCheckCheckersLater subset (barrel import 131; imports
HostModuleCheckFixtures, HostModuleCheckSurface, and
HostModuleCheckCheckers; import-closed on
the 38).
Pins stay false. Do **not** claim **39**. Do not run Lake on the laptop
(horizon). One niced Lake at a time on surmount-1.

**Prior living tip (2026-08-16):**

Freestanding product C under `out/freestanding-c/` has linear types, **no**
product garbage collection, and no Lean managed runtime on the consumer
link. Product residual free and freestanding product self-host complete
are both **true**. `just build` does **not** need Lake on that step.
**PROVABLY** is **true** (CompCert product matrix in `just check`). Host
residual free is **claimed** for day-to-day tools; that is **not** Lake
gone. Full host package elaborate remains **false**. Typecheck one live
module is **done** (SystemsLean.Mult). Typecheck one real theorem module
is **done** (SystemsLean.MultTheorems, including proof terms). Read the
real package description is **done**. Grow TypesTheorems is **done**.
Grow ErasureTheorems subset is **done**. Grow Extract closed subset is
**done**. Grow ExtractTheorems subset is **done**. Grow IrProgram subset is
**done**. Grow IrProgramTheorems subset is **done**. Grow HostTerm
subset is **done**. Grow HostFrontGoldens subset is **done**. Grow
HostFront subset is **done**. Grow HostFrontTheorems subset is **done**.
Grow HostCheck subset is **done**. Grow
HostGraph subset is **done**. Grow HostGraphTheorems subset is **done**. Grow HostPackageWrite
subset is **done**. Grow HostPackageWriteTheorems subset is **done**.
Grow HostPackageRoots subset is **done**.
Grow HostImportGraphSeeds subset is **done**. Grow HostImportGraphModel
subset is **done**. Grow HostImportGraphMods subset is **done**. Grow
HostImportGraphModsLater subset is **done**. Grow
HostImportGraphLoadOkLater subset is **done**. Grow
HostImportGraphWalkLater subset is **done**. Grow
HostImportGraphWalk subset is **done**. Grow
HostModuleCheckRequiredDecls subset is **done**. Grow
HostModuleCheckRequiredDeclsProduct subset is **done**. Grow
HostModuleCheckRequiredDeclsLater subset is **done**. Grow
HostModuleCheckFixtureTexts subset is **done**. Grow
HostModuleCheckFixtureTextsProduct subset is **done**. Grow
HostModuleCheckFixtureTextsLater subset is **done**. Grow
HostModuleCheckFixtureTextsSelfHost subset is **done**. Grow
HostModuleCheckFixtureTextsEmit subset is **done**. Grow
HostModuleCheckFixtures subset is **done**. Grow
HostModuleCheckSurface subset is **done**. Grow
HostModuleCheckCheckers subset is **done**. Grow
HostModuleCheckCheckersLater subset is **done**. Grow
HostModuleCheckRealModule subset is **done**. Grow
HostModuleCheckEmitBodyTerm subset is **done**.
Named closed subset is Mult, Types,
MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract,
ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, HostPackageWrite, HostPackageWriteTheorems,
HostPackageRoots, HostImportGraphSeeds, HostImportGraphModel,
HostImportGraphMods, HostImportGraphModsLater,
HostImportGraphLoadOkLater, HostImportGraphWalkLater,
HostImportGraphWalk, HostModuleCheckRequiredDecls,
HostModuleCheckRequiredDeclsProduct,
HostModuleCheckRequiredDeclsLater,
HostModuleCheckFixtureTexts,
HostModuleCheckFixtureTextsProduct,
HostModuleCheckFixtureTextsLater,
HostModuleCheckFixtureTextsSelfHost,
HostModuleCheckFixtureTextsEmit,
HostModuleCheckFixtures,
HostModuleCheckSurface, HostModuleCheckCheckers,
HostModuleCheckCheckersLater,
HostModuleCheckRealModule,
HostModuleCheckEmitBodyTerm,
HostModuleCheckKernelMultTerm,
HostModuleCheckKernelLinearTerm,
HostModuleCheckKernelTypesTerm,
HostModuleCheckKernelProgramTerm,
HostModuleCheckKernelEmitTerm, and
HostModuleCheckParityMultTerm.
Metric: **47 of about 206** live modules on the Slake path. Do not claim
**48**. Open Name is Grow HostModuleCheckParityLinearTerm subset
(barrel import 140; imports HostModuleCheckSurface and
HostModuleCheckEmitPlanTerm; not import-closed on the 47). Hub no longer
imports the 18 historical isolation probes. ElabMeetTheorems is **581**.
`leakEnv` false on nixbuilder; isolation probe EXIT 0 (2518 s; peak about
**167 GiB**); tip stays **47**; FullHost false.
Operator STOP: do **not** run `lake build SystemsLean.ElabMeetTheorems`
or ElabMeet. Next prove, if any: one serial niced isolation probe only
after `pgrep lake` is empty, `LEAN_NUM_THREADS=1`. Not the theorems hub.
Not FullHost. Do not fold ParityTypesTerm while this Name is ungated.
MemoryMax 192 GiB is the ceiling. `floor(192/167) = 1` concurrent fat Lean.
Prepare queue still EXTRACT_READY. Do not
open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
Do not open Grow HostImportGraphDriver (imports the LoadOk hub).
Skip HostImportGraphTheorems. Skip HostGraphMain. Skip SystemsLean.Linear as a named
member. Skip IrGraph. Skip HostCompose. Extract first: Tail is **863**
and Later is **785**; neither can absorb another leftover wrapper
without passing about 880. HostTerm walk is **841** and stays.
Emit walk stays **693**. CheckersLater walk stays **617**.
ParityMultTerm walk **173**. ParityMultTermProbe **294**. ParityMultTerm
helper **63**. ElabMeetReadyHostModuleCheck is **132**.
ElabMeetCompile is **916**. Named closed tip Isolation
command is `#elabMeetNamedHostModuleCheckParityMultTermSubsetProbe`.
Slake does **not** typecheck the whole package.
FullHost **false**. slakeOwnsPackageTypecheck **false**. Partial named
subset capability is **true**; full aggregate stays **false**. Lake still
typechecks imported modules and builds the host tools. LLVM is unlocked
and partial, not a full backend. The leftover seed walk is **closed**.
Do not invent a leftover-walk Name.

| Remaining work | Honest number |
|----------------|---------------|
| Real modules Slake typechecks | **47 of about 206** (SystemsLean.Mult through SystemsLean.HostModuleCheckParityMultTerm) |
| Real host tools that build without Lake on the step | **0 of about 69** |
| Linear use-check | **not started** |
| Same-job time | Lake idle-hot **0.459 s** (`doc/BENCH-SAME-JOB-latest.md`). Slake cannot run that full-package job. Do not invent a fake Slake wall-clock. |

Living detail: `RESIDUAL-systems.md`. Coordinator: `RESIDUAL.md`. Next
action: `WATCHER.md`.

**Systems reseed after compaction:** `RESIDUAL-systems.md` ->
`src/systems/README.md` -> `emit/host-owned-emit.md` -> `self-host.md`.
Gates: `just systems-host`, `just systems-emit-wire`, `just hygiene`,
`just systems-lake`, `just systems-cc-probe`.

---

## North star (one line)

**Systems Lean** is this project (language + freestanding systems goals). **Slake** is its compiler: meet-in-the-middle Idris 2 <-> Lean 4 (QTT + Curry-Howard), freestanding products to CompCert-oriented C and LLVM IR, Rust interop without classic FFI as the design bar -- work **here, in isolation**.

---

## Residual and progress

- Coordinator: `RESIDUAL.md`
- Forks: `RESIDUAL-idris.md`, `RESIDUAL-lean.md`, `RESIDUAL-systems.md`
- Meter: `doc/PROGRESS.md` via `just progress` (pure Nix under `nix/progress/`); `just watch` loops every 300s
- Hygiene: `just hygiene` (pure Nix ASCII under `nix/source-hygiene.nix` + professional-tone under `nix/professional-tone.nix` on novel `*.md`) -- not Python, not bash-in-Nix; focused tone gate: `just professional-tone`
- Host presence: `just systems-host` (pure Nix under `nix/systems-host-presence/`; live impure eval)
- Emit-wire presence: `just systems-emit-wire` (pure Nix under `nix/systems-emit-wire/`; live impure eval)
- Flake vs live: new `nix/` (and related flake paths) need **human** stage before `nix flake check` matches live `just` gates; stage paths from the flake error / `git status` (no fixed laundry list); agents never stage to silence WARN (see `AGENTS.md` Nix tooling + Git)
- Plan approval: full plan text in chat; freeform Approve / revise / abandon only -- no quiz UI
- Git: agents do not push local unpushed work-in-progress (WIP) unless the human asks; hands-off git otherwise
- Steering: `doc/fork-guidance-idris.md`, `doc/fork-guidance-lean.md`, `doc/fork-guidance-systems.md`

## Three languages only (reseed after compaction)

Novel work uses **only**:

1. **Idris 2** -- `src/idris2/`
2. **Lean 4** -- `src/lean4/` and `src/systems/` (Systems Lean / **Slake**)
3. **Pure Nix flakes** -- small modules under `nix/` (not bash-in-Nix, not kitchen-sink files; layout for large language model attention and compaction)

No project Python. Do not grow shell. Novel workspace `check.sh` **deleted** (process glue is just elaborator/cc recipes + optional pre-commit). Plan `.agents/plans/plan-paydown-shell-c-surfaces.md`. Freestanding C under `out/` is **product wire** (emit output), not a source language for the project. Do not accumulate labeled debt when Lean/Nix ports are available.

Read `AGENTS.md` (**Three languages only** + **Nix tooling**) and `doc/vocabulary.md` before adding any tool or gate.

---

## Key paths

| Path | Why |
|------|-----|
| `AGENTS.md` | Agent policy + isolation + Nix tooling + **document slices for compaction** |
| `doc/goals.md` | Canonical goals |
| `doc/vocabulary.md` | Stable product terms + tooling terms |
| `doc/architecture.md` | Meet-in-middle sketch |
| `doc/divergence.md` | Honest differences / trusted computing base |
| `RESIDUAL.md` | Coordinator join board; Hold vs Open |
| `RESIDUAL-systems.md` | Systems / Slake living residual (Open Names + Done archive) |
| `WATCHER.md` | Next implement action only (fenced block) |
| `src/systems/emit/host-owned-emit.md` | **SSoT:** which freestanding C text Lean owns vs template |
| `src/systems/self-host.md` | Self-host acceptance + body path |
| `src/systems/host-partial-inventory.md` | Host module inventory + intentional PARTIAL |
| `nix/` | Pure flake tooling modules (hygiene, professional-tone, progress, systems-host-presence, systems-emit-wire, novel-source filter) |
| `flake.nix` | Thin flake wire-up only (not a shell-script dump) |
| `justfile` | Task runner: check / progress / hygiene / professional-tone / watch / build / emit |
| `ref/Idris2/` | Upstream Idris 2 (read-only) |
| `ref/lean4/` | Upstream Lean 4 (read-only) |
| `ref/CompCert/` | AbsInt CompCert (read-only; `ccomp` source) |
| `ref/rust/` | rustc layout/ABI + codegen_llvm (read-only) |
| `src/idris2/` `src/lean4/` `src/systems/` | Novel workspaces |
| `out/freestanding-c/` | Release freestanding ahead-of-time C (no managed runtime on the wire) |
| `script/` | Residual product build/emit shells only (scheduled deletion / process glue) |
| `.agents/plans/plan-close-six-claims.md` | **Product program:** six claims A-F, tracks, lean4 skill, first Types slice |
| `.agents/plans/plan-unambiguous-residual-work.md` | Residual schema (plain Names, short loops) |
| `.agents/plans/plan-paydown-shell-c-surfaces.md` | Shell/C paydown waves 0-E (largely met) |
| `doc/idris-entry.md` | Idris map |
| `doc/lean-entry.md` | Lean map (+ lean4 skill pointer) |
| `doc/compcert-entry.md` | CompCert map |
| `doc/rust-entry.md` | Rust layout / LLVM interop map |
| `.agents/plans/plan-iso-goals-and-agent-hygiene.md` | Approved plan + isolation amendment |

---

## Isolation (do not forget)

Do **not** go work residual in other trees by default. This repo is Systems Lean. Escalate off-repo only when the human says we are desperate for a specific solution.

---

## Why `ref/rust` and not `ref/llvm` alone

Rust **type layout and ABI** live in rustc. LLVM IR is the wire shape; layout-compatible interop needs rustc's rules. Nested LLVM under rust is optional and large -- do not recursive-init unless asked. See `doc/rust-entry.md`.

---

## Verify (foundation)

```bash
cd /home/hunter/Projects/ai/iso
test -f AGENTS.md && test -f README.md && test -f RESIDUAL.md
test -f doc/goals.md && test -f doc/vocabulary.md
test -f doc/architecture.md && test -f doc/divergence.md
test -f doc/SESSION-HANDOFF.md
test -f doc/idris-entry.md && test -f doc/lean-entry.md
test -f doc/compcert-entry.md && test -f doc/rust-entry.md
test -f doc/research/README.md
test -f doc/ascii-symbol-map.md
test -f flake.nix
test -f ref/Idris2/README.md && test -f ref/lean4/README.md
test -f ref/CompCert/README.md && test -f ref/rust/README.md
just check
```

Foundation only; held residual needs a claimed role. Policy SSoT: `AGENTS.md`.
