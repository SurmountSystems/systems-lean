# Host-owned freestanding emit (ownership map)

**Kind:** product ownership SSoT (source of truth). **Discover after compaction:**
agents reseeding Systems work should open this file when asking "what freestanding
C does Lean own?" -- not only chat or residual token soup.

**Also update when ownership changes:** this file first (SSoT); short link only in
`src/systems/README.md` (no ownership essay re-paste); `RESIDUAL-systems.md` Done;
`doc/SESSION-HANDOFF.md` Decisions table; pure Nix presence/emit-wire specs;
`SelfHostBody` if readiness folds.

Purpose: which freestanding C text in the **host freestanding workspace**
(`src/systems/emit/`) is owned by Lean host SSOT + `FreestandingEmit` embed, vs
still frozen in templates. **Out-first product:** consumers link the **release**
surface under `out/freestanding-c/` (product Out). `emit/` is host workspace
(SSOT + templates + generator dogfood write target), not a peer product home.
Three languages only (Idris 2 / Lean 4 / pure Nix); freestanding C is **generated
product Out only** -- never handwritten residual. Claim A product residual free
**true** (host elaborator residual remains). Claim B freestanding product
self-host complete **true**. Not PROVABLY. Not llvm unlock. No product GC.

## Lean-owned (host SSOT + FreestandingEmit embed)

| Surface | Stage / map id | Lean module | Durable SSOT | Placeholder |
|---------|----------------|-------------|--------------|-------------|
| Banner / version / unit_translation | HOST-EMIT-BANNER | `SystemsLean/EmitBanner.lean` (+ `EmitBannerScaffold.lean` same namespace) | `emit/host_emit_banner.ssot.txt` | `__HOST_EMIT_BANNER_HEADER__` / `__HOST_EMIT_BANNER_BODY__` |
| Mult (enum + is_valid / is_known / name) | HOST-EMIT-MULT | `SystemsLean/EmitMult.lean` (+ `EmitMultScaffold.lean` same namespace) | `emit/host_emit_mult.ssot.txt` | `__HOST_EMIT_MULT_HEADER__` / `__HOST_EMIT_MULT_BODY__` |
| EMIT_BODY put_str dialect keys | HOST-EMIT-SSOT | `SystemsLean/EmitBody.lean` | `emit/host_emit_body_fragment.ssot.txt` | `__SSOT_*__` keys inside body scaffolding |
| Emit body scaffolding (put_char / put_u8 / from_compose) | HOST-EMIT-BODY | `SystemsLean/EmitBody.lean` | `emit/host_emit_body_fragment.ssot.txt` (BODY_C_HEADER / BODY_C_BODY) | `__HOST_EMIT_BODY_HEADER__` / `__HOST_EMIT_BODY_BODY__` |
| Linear + ConsumeToken freestanding APIs | HOST-EMIT-LINEAR | `SystemsLean/EmitLinear.lean` (+ `EmitLinearScaffold.lean` same namespace) | `emit/host_emit_linear.ssot.txt` | `__HOST_EMIT_LINEAR_HEADER__` / `__HOST_EMIT_LINEAR_BODY__` |
| Erasure mult-0 absence (`slake_erased` + mark / is_marked / is_runtime_absent) | HOST-EMIT-ERASURE | `SystemsLean/EmitErasure.lean` (+ `EmitErasureScaffold.lean` same namespace) | `emit/host_emit_erasure.ssot.txt` | `__HOST_EMIT_ERASURE_HEADER__` / `__HOST_EMIT_ERASURE_BODY__` |
| Extract + FAIL_CLOSED_CHECKER_V1 (`slake_extract_*` + `slake_check_*`) | HOST-EMIT-EXTRACT | `SystemsLean/EmitExtract.lean` (+ `EmitExtractScaffold.lean` same namespace) | `emit/host_emit_extract.ssot.txt` | `__HOST_EMIT_EXTRACT_HEADER__` / `__HOST_EMIT_EXTRACT_BODY__` |
| Types + typed IR (`slake_type_tag` + `TYPED_IR_V0` `slake_ir_node`) | HOST-EMIT-TYPES | `SystemsLean/EmitTypes.lean` (+ `EmitTypesScaffold.lean` same namespace) | `emit/host_emit_types.ssot.txt` | `__HOST_EMIT_TYPES_HEADER__` / `__HOST_EMIT_TYPES_BODY__` |
| Ordered IR program (`IR_PROGRAM_V0` wire id; `slake_ir_program_*`) | HOST-EMIT-PROGRAM | `SystemsLean/EmitProgram.lean` | `emit/host_emit_program.ssot.txt` | `__HOST_EMIT_PROGRAM_HEADER__` / `__HOST_EMIT_PROGRAM_BODY__` |
| IR graph edges (`IR_GRAPH_EDGES_V0` wire id; `slake_ir_graph_*`) | HOST-EMIT-GRAPH | `SystemsLean/EmitGraph.lean` (+ `EmitGraphScaffold.lean` same namespace) | `emit/host_emit_graph.ssot.txt` | `__HOST_EMIT_GRAPH_HEADER__` / `__HOST_EMIT_GRAPH_BODY__` |
| Host compose (`HOST_COMPOSE_V0` wire id; `slake_host_compose_*`) | HOST-EMIT-COMPOSE | `SystemsLean/EmitCompose.lean` | `emit/host_emit_compose.ssot.txt` | `__HOST_EMIT_COMPOSE_HEADER__` / `__HOST_EMIT_COMPOSE_BODY__` |
| Emit plan (`EMIT_PLAN_V0` wire id; `slake_emit_plan_*`) | HOST-EMIT-PLAN | `SystemsLean/EmitPlan.lean` | `emit/host_emit_plan.ssot.txt` | `__HOST_EMIT_PLAN_HEADER__` / `__HOST_EMIT_PLAN_BODY__` |
| Emit apply (`EMIT_APPLY_V0` wire id; `slake_emit_apply_*`) | HOST-EMIT-APPLY | `SystemsLean/EmitApply.lean` | `emit/host_emit_apply.ssot.txt` | `__HOST_EMIT_APPLY_HEADER__` / `__HOST_EMIT_APPLY_BODY__` |

Writer: `SystemsLean/FreestandingEmit.lean` + load helpers `SystemsLean/FreestandingEmitLoad.lean` + Mult..Apply scaffold `SystemsLean/FreestandingEmitLoadScaffold.lean` (lake exe `slake-emit-freestanding-c`).
Templates: `emit/template_slake_freestanding.{h,c}.in`. Host workspace generator
output: `emit/slake_freestanding.{h,c}` (dogfood). **Product Out / release:**
`out/freestanding-c/` via `just build` (install copy consumers use).

**Bootstrap Mult subset package (S2):** `SystemsLean/MultSubsetEmit.lean` writes
`emit/slake_mult_subset.{h,c}` from HOST-EMIT-MULT fragments (same Mult dialect;
not a second Mult ownership path). Lake exe `slake-mult-subset-emit` /
`just mult-subset-emit`. Self-application rebuild: `MultSubsetRebuild.lean`
re-emits/re-validates the same package (`slake-mult-subset-rebuild` /
`just mult-subset-rebuild`). M2 measured without-Lake step:
`just mult-subset-rebuild-without-lake` runs the prebuilt Mult rebuild binary
(no lake on hot path). M2 Name B freestanding Mult surface dual-check + Name B full Mult write:
`SystemsLean/MultFsDeepen.lean` / `just mult-subset-freestanding-deepen` (greps
dual-check) and `just mult-subset-freestanding-write` (P1 Lean-native Mult
package write: MultSubsetEmit / MultFsWriteTool via `IO.FS.writeFile`; Path A
host-cc full C print from Lean **retired**; Mult rebuild ELF not the package
writer; Lake Mult write / MultFsWriteTool prebuilt or lake exe for measure);
freestandingDeepenPartial true; multFsWritePathReady true;
freestandingDriverComplete **true**. Not the full freestanding product wire;
not product Out. Product StillUsesLake remains until M6.

**M4 product-wire without-Lake measured step (Name A):**
`just freestanding-capable-regenerate-without-lake` runs prebuilt
`.lake/build/bin/slake-freestanding-capable-regenerate` (bootstrap once:
`lake build slake-freestanding-capable-regenerate`; no lake on hot path).
Ordered READ+COMPOSE+WRITE-HC+INSTALL of full freestanding dialect + Out.
Host pins: `productWireWithoutLakeFinishedClaimed` true;
`productWireWithoutLakeKeepsHostLake`. Product StillUsesLake remains until M6.

**M4 product-wire freestanding writer (Name B, P1 Lean-native):**
`just product-wire-freestanding-write` runs dual-eq
`freestandingCapableWriteFreestandingHc` +
`freestandingCapableInstallFreestandingOut` via ProductWireWriteTool Lean IO
(or prebuilt CapableRegenerate). Path A host-cc full C print from Lean
**retired** (`productWireFsWriterPrintsFullHelperC` false). WRITE
`emit/slake_freestanding.{h,c}` + INSTALL `out/freestanding-c/`. Host pins:
`productWireFsWriterFinishedClaimed` true; `productWireFsWriterReady` true;
`productWireFsWriterNativeIo` true. freestandingDriverComplete stays
Mult-orthogonal. Product StillUsesLake remains until M6.

**M4 official build without-Lake (Name C):**
`just build` prefers Name B `product-wire-freestanding-write` (P1 Lean-native)
when ProductWireWriteTool + prebuilt/lake path exist; else Name A
`freestanding-capable-regenerate-without-lake` when prebuilt CapableRegenerate
exists; fail closed with bootstrap hints if both missing. Dual evidence on emit
+ Out after build. Product StillUsesLake remains until M6. Lake-hosted
`freestanding-capable-regenerate` stays diagnostic only.

**Bootstrap Linear subset package (M1):** `SystemsLean/LinearSubsetEmit.lean`
writes `emit/slake_linear_subset.{h,c}` from HOST-EMIT-LINEAR fragments. Lake
exe `slake-linear-subset-emit` / `just linear-subset-emit`. Self-application
rebuild: `LinearSubsetRebuild.lean` re-emits/re-validates the same package
(`slake-linear-subset-rebuild` / `just linear-subset-rebuild`).

**Bootstrap Types subset package (M1):** `SystemsLean/TypesSubsetEmit.lean`
writes `emit/slake_types_subset.{h,c}` from HOST-EMIT-TYPES fragments (same
Types dialect; not a second Types ownership path). Lake exe
`slake-types-subset-emit` / `just types-subset-emit`. Self-application rebuild:
`SystemsLean/TypesSubsetRebuild.lean` re-emits/re-validates the same package
(`slake-types-subset-rebuild` / `just types-subset-rebuild`). Not the full
freestanding product wire; not product Out.

**Bootstrap Program subset package (M1):** `SystemsLean/ProgramSubsetEmit.lean`
writes `emit/slake_program_subset.{h,c}` from HOST-EMIT-PROGRAM fragments (same
Program dialect; not a second Program ownership path). Lake exe
`slake-program-subset-emit` / `just program-subset-emit`. Self-application
rebuild: `SystemsLean/ProgramSubsetRebuild.lean` re-emits/re-validates the same
package (`slake-program-subset-rebuild` / `just program-subset-rebuild`). Not
the full freestanding product wire; not product Out.

**Bootstrap Extract subset package (M1):** `SystemsLean/ExtractSubsetEmit.lean`
writes `emit/slake_extract_subset.{h,c}` from HOST-EMIT-EXTRACT fragments (same
Extract + FAIL_CLOSED dialect; not a second Extract ownership path). Lake exe
`slake-extract-subset-emit` / `just extract-subset-emit`. Self-application
rebuild: `SystemsLean/ExtractSubsetRebuild.lean` re-emits/re-validates the same
package (`slake-extract-subset-rebuild` / `just extract-subset-rebuild`). Not
the full freestanding product wire; not product Out.

**Bootstrap Erasure subset package (M1):** `SystemsLean/ErasureSubsetEmit.lean`
writes `emit/slake_erasure_subset.{h,c}` from HOST-EMIT-ERASURE fragments (same
Erasure mult-0 absence dialect; not a second Erasure ownership path). Lake exe
`slake-erasure-subset-emit` / `just erasure-subset-emit`. Self-application
rebuild: `SystemsLean/ErasureSubsetRebuild.lean` re-emits/re-validates the same
package (`slake-erasure-subset-rebuild` / `just erasure-subset-rebuild`). Not
the full freestanding product wire; not product Out.

**Bootstrap Graph subset package (M1):** `SystemsLean/GraphSubsetEmit.lean`
writes `emit/slake_graph_subset.{h,c}` from HOST-EMIT-GRAPH fragments (same IR
graph edges dialect; not a second Graph ownership path). Lake exe
`slake-graph-subset-emit` / `just graph-subset-emit`. Self-application
rebuild: `SystemsLean/GraphSubsetRebuild.lean` re-emits/re-validates the same
package (`slake-graph-subset-rebuild` / `just graph-subset-rebuild`). Not the
full freestanding product wire; not product Out; not full CFG/SSA.

**Bootstrap Compose subset package (M1):** `SystemsLean/ComposeSubsetEmit.lean`
writes `emit/slake_compose_subset.{h,c}` from HOST-EMIT-COMPOSE fragments (same
host compose dialect; not a second Compose ownership path). Lake exe
`slake-compose-subset-emit` / `just compose-subset-emit`. Self-application
rebuild: `SystemsLean/ComposeSubsetRebuild.lean` re-emits/re-validates the same
package (`slake-compose-subset-rebuild` / `just compose-subset-rebuild`). Not the
full freestanding product wire; not product Out; not elaborator MULT-1 freestanding
residual free.

Host stage ids only (`HOST-EMIT-*` / `SLAKE_SELF_HOST_EMIT_*_V0`). Do not mint
residual-only C stage ladders (`EMIT_MULT_V0`, `EMIT_LINEAR_V0`,
`EMIT_ERASURE_V0`, `EMIT_EXTRACT_V0`, `EMIT_TYPES_V0`, `EMIT_PROGRAM_V0`,
`EMIT_GRAPH_V0`, `EMIT_COMPOSE_V0`, etc.) as freestanding residual progress.

Erasure on freestanding C is mult-0 absence honesty (`slake_erased` + mark /
is_marked / is_runtime_absent). It is not a type system in C.

Extract on freestanding C is extract status + runtime class tags +
FAIL_CLOSED_CHECKER_V1 composed checks before product extract. Product wire
stage tokens `FAIL_CLOSED_CHECKER_V1` / `EMIT-BOUNDARY` / `RUNTIME-FS` remain
(map only). Host ownership uses HOST-EMIT-EXTRACT /
SLAKE_SELF_HOST_EMIT_EXTRACT_V0. Contiguous after Erasure (depends on Mult /
Linear / Erasure decls) and before Types. Not a residual EMIT_EXTRACT_V0 stage.

Types on freestanding C is opaque type_tag + TYPED_IR kind/mult pairing and
fail-closed check compose. It is not a full elaborator type checker in C.
Product wire places Types+TYPED_IR contiguously after Extract (depends on Mult /
Linear / Erasure / FAIL_CLOSED_CHECKER decls).

IR program on freestanding C is fixed-capacity ordered list of well-typed nodes
(`SLAKE_IR_PROGRAM_CAP` 8; init/push/is_well_typed/check_fail_closed). Product
wire stage id remains `IR_PROGRAM_V0` (map only). Host ownership uses
HOST-EMIT-PROGRAM / SLAKE_SELF_HOST_EMIT_PROGRAM_V0. Contiguous after Types
(depends on typed nodes). Not CFG/edges (graph is separate HOST-EMIT-GRAPH).
`check_fail_closed` is one live-node walk (does not re-call program
`is_well_typed`; public `is_well_typed` stays).

IR graph on freestanding C is fixed-capacity edge list over nested program
(`SLAKE_IR_EDGE_MAX` 16; init/push_node/add_edge/is_well_typed/check_fail_closed).
Product wire stage id remains `IR_GRAPH_EDGES_V0` (map only). Host ownership uses
HOST-EMIT-GRAPH / SLAKE_SELF_HOST_EMIT_GRAPH_V0. Contiguous after Program
(depends on ordered program). Not full CFG/SSA. `check_fail_closed` is edge
soundness then one program fail-closed walk (does not re-call graph
`is_well_typed`; public `is_well_typed` stays).

Host compose on freestanding C is graph + ConsumeToken host + erasure mark
(init/push/add_edge/mint/consume/mark_erased/is_well_typed/check_fail_closed/extract).
Product wire stage id remains `HOST_COMPOSE_V0` (map only). Host ownership uses
HOST-EMIT-COMPOSE / SLAKE_SELF_HOST_EMIT_COMPOSE_V0. Contiguous after Graph
(depends on IR graph). Live-flag honesty: mint/consume track host live state;
not elaborator MULT-1. `check_fail_closed` is one mult pre-scan then one
graph check walk (does not re-call graph `is_well_typed`). Extract stays
the E2 fuse (one check then write `RUNTIME_FS`). Public extract / check
meanings unchanged.

Emit plan on freestanding C is readiness inventory from checked host compose
(node/edge/runtime/erased counts + ready/valid). Product wire stage id remains
`EMIT_PLAN_V0` (map only). Host ownership uses HOST-EMIT-PLAN /
SLAKE_SELF_HOST_EMIT_PLAN_V0. Contiguous after Compose. Not full IR body emit.

Emit apply on freestanding C is fixed tag buffer of live node mult/kind
(`SLAKE_EMIT_APPLY_CAP` 32). Product wire stage id remains `EMIT_APPLY_V0`
(map only). Host ownership uses HOST-EMIT-APPLY / SLAKE_SELF_HOST_EMIT_APPLY_V0.
Contiguous after Plan. Not full C body codegen.

Emit body on freestanding C is fixed-buffer ASCII fragment scaffolding
(`SLAKE_EMIT_BODY_CAP` 256; put_char / put_u8 / from_compose + is_valid) plus
HOST-EMIT-SSOT put_str dialect keys. Product wire stage id remains `EMIT_BODY_V0`
(map only). Host ownership uses HOST-EMIT-BODY / SLAKE_SELF_HOST_EMIT_BODY_V0
for scaffolding and HOST-EMIT-SSOT for dialect keys. Contiguous after Apply.
Not full product module emit / CFG/SSA.

Banner on freestanding C is file stage inventory comment + `slake_emit_version`
+ `slake_unit_translation_id` (header decls and source bodies). Host ownership
uses HOST-EMIT-BANNER / SLAKE_SELF_HOST_EMIT_BANNER_V0. Placed before Mult in
the product wire (template shell is SPDX + placeholders only). Not Mult..Out
compile-step readiness fold (hygiene ownership only; SelfHostBody stays Mult..Out).

## Naming map (residual Out vs wire Body vs whole product)

Four senses must not be mashed. Prose only -- **no** product ABI rename.

| Sense | Residual / human prose | Wire / host ids (frozen unless scheduled) |
|-------|------------------------|-------------------------------------------|
| **Out** (emit stage) | Residual short name for the last Mult..* freestanding emit stage (CAP-256 buffer scaffolding after Plan/Apply) | Product wire **`EMIT_BODY_V0`**, C ABI `slake_emit_body_*`, host **HOST-EMIT-BODY** / `EmitBody.lean`, SSOT `host_emit_body_fragment.ssot.txt` |
| **Host freestanding workspace** | `src/systems/emit/`: SSOT fragments, templates, generator dogfood C | Not a second product peer; FreestandingEmit writes here only |
| **Whole product wire dialect** | Generated freestanding header/source Banner + Mult through Out stage | Dialect stage **SLAKE_EMIT_FREESTANDING_C_V0**; dogfood under `emit/slake_freestanding.{h,c}` |
| **Out (release) / product Out** | Consumer **product** surface (Out-first) | `out/freestanding-c/` via `just build` (release copy of generated dialect, not a second dialect; not "the Body stage") |
| **Defined freestanding compile step** | Self-host **step readiness** pin (SSOT Mult..Out -> FreestandingEmit -> host workspace + release under gates); **not** claim B product self-host complete | Host module `SelfHostBody.lean`, greppable SELF-HOST-BODY / `selfHostBodyReady` (historical "Body" in name; prose prefers compile step) |

**Rules:**

- Residual / plan prose prefers **Out** for the emit stage formerly called Body.
- Product consumers and residual evidence prefer **Out (release)** =
  `out/freestanding-c/`; do not call `emit/` and `out/` equal product peers.
- Product wire keeps `EMIT_BODY_V0` and `slake_emit_body_*` (map-only frozen).
- Out (emit stage) is **one stage** on the dialect -- not the whole freestanding
  product and not the release directory.
- Template placeholders `__HOST_EMIT_*_BODY__` mean the `.c` implementation half
  vs HEADER -- do not "fix" as residual Out / Body naming.
- Residual schema field **Out of scope** is unrelated (slice non-claims).
- Handwritten freestanding product C is forbidden; regenerate via Lean emit.

## Template-owned still

| Surface | Notes |
|---------|-------|
| *(none)* | Template shells are SPDX + stage cite + `__HOST_EMIT_*` placeholders only |

## Honesty

- Claim A product residual free: **true** (measure green on release via
  PRODUCT-RESIDUAL-FREE-MEASURE; DualResidual residualFreeClaimed true;
  productResidualRemains false). Host elaborator residual **remains**
  (`hostElaboratorResidualRemains` true; DependsOnLake / StillUsesLake true).
  Free is not Lake gone.
- Claim B freestanding product self-host complete: **true** (writer path closed).
  Complete is not "Lake is gone."
- Not PROVABLY. Not llvm unlock. No product GC.
- Host elaborator residual != product wire residual (do not forge host free).
- Behavioral probe remains hosted smoke, not freestanding product body growth.
- Ownership map lives here; stage tokens stay greppable in Lean / SSOT / product.
- **Dual SSOT equality gate (CLOSED for emit-time fail-closed):** Lean fragments
  (`bannerHeaderFragment` / `multHeaderFragment` / `linearHeaderFragment` /
  `erasureHeaderFragment` / `extractHeaderFragment` / `typesHeaderFragment` /
  `programHeaderFragment` / `graphHeaderFragment` / `composeHeaderFragment` /
  `planHeaderFragment` / `applyHeaderFragment` / `bodyHeaderFragment` and body
  twins) and durable `host_emit_*.ssot.txt` HEADER/BODY blocks are both
  maintained. FreestandingEmit embeds product text from the **SSOT file only**,
  then **DUAL-SSOT-EQUALITY** compares each block to the matching Lean fragment
  (`dualSsotBlockEqual` / `requireDualSsotEqual` / `dualSsotEqualityLive`) and
  fails closed on drift (Banner + Mult..Out/Body). Pure Nix
  `systems-host` + `systems-emit-wire` require those greppable tokens so the
  gate stays live. Free true; complete true; host residual remains; not
  PROVABLY; not llvm.

## Paths (quick)

- `src/systems/SystemsLean/EmitBanner.lean` (scaffold: `EmitBannerScaffold.lean`)
- `src/systems/SystemsLean/EmitMult.lean` (scaffold: `EmitMultScaffold.lean`)
- `src/systems/SystemsLean/EmitBody.lean`
- `src/systems/SystemsLean/EmitLinear.lean` (scaffold: `EmitLinearScaffold.lean`)
- `src/systems/SystemsLean/EmitErasure.lean` (scaffold: `EmitErasureScaffold.lean`)
- `src/systems/SystemsLean/EmitExtract.lean` (scaffold: `EmitExtractScaffold.lean`)
- `src/systems/SystemsLean/EmitTypes.lean` (scaffold: `EmitTypesScaffold.lean`)
- `src/systems/SystemsLean/EmitProgram.lean`
- `src/systems/SystemsLean/EmitGraph.lean` (scaffold: `EmitGraphScaffold.lean`)
- `src/systems/SystemsLean/EmitCompose.lean`
- `src/systems/SystemsLean/EmitPlan.lean`
- `src/systems/SystemsLean/EmitApply.lean`
- `src/systems/SystemsLean/FreestandingEmit.lean`
- `src/systems/emit/host_emit_banner.ssot.txt`
- `src/systems/emit/host_emit_mult.ssot.txt`
- `src/systems/emit/host_emit_body_fragment.ssot.txt`
- `src/systems/emit/host_emit_linear.ssot.txt`
- `src/systems/emit/host_emit_erasure.ssot.txt`
- `src/systems/emit/host_emit_extract.ssot.txt`
- `src/systems/emit/host_emit_types.ssot.txt`
- `src/systems/emit/host_emit_program.ssot.txt`
- `src/systems/emit/host_emit_graph.ssot.txt`
- `src/systems/emit/host_emit_compose.ssot.txt`
- `src/systems/emit/host_emit_plan.ssot.txt`
- `src/systems/emit/host_emit_apply.ssot.txt`
- `src/systems/emit/template_slake_freestanding.h.in`
- `src/systems/emit/template_slake_freestanding.c.in`
