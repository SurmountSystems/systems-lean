# SelfApplyFs tip split inventory (2026-07-31)

Kind: analysis only. Not residual.


## Split results (campaign 2026-07-31)

| Metric | Value |
|--------|------:|
| Start `wc -l` | **3638** |
| After split 1 header | **2834** (-804) |
| After split 2 fold-doc | **2044** (-790) |
| After split 2b theorem-doc | **1888** (-156) |
| **Final tip** | **1888** (**-1750** total) |
| Under 2000 | **yes** |

### Splits landed

1. **Header/doc split** -- long module header (833 lines) moved to archived section below; tip keeps short header with gate-only tokens (`SYSTEMS_LEAN_HOST`, `UNIT_SURFACE`, honesty Not-* lines, `FULL-BAR-REQ-*`, `SELF-HOST-KERNEL-EMIT`).
2. **Fold-doc thin** -- multi-line `/-!` / `/--` walls on PartialReady chain compressed to greppable one-liners; living claim SSoT + chain folds unchanged; all hostSpecs/emit tokens preserved (zero gate path edits).
3. **Theorem-doc thin** -- theorem-region docs compressed; 108 theorems + 288 examples retained (gates still require `theorem X` / `example : X` forms on tip).

### Post-split region map (final **1888**)

| Region | ~Lines | Role |
|--------|-------:|------|
| Short header | 1-29 | Gate honesty + companion pointer |
| Imports | 31-69 | Home modules |
| Core + PartialReady folds + living claims | 71-992 | **STAY** claim SSoT + chain |
| Theorems | 993-1465 | **STAY** until gate-first smoke/theorem migration |
| Examples / smoke | 1466-1887 | **STAY** until gate-first |
| end | 1888 | |

### Gates (final)

- `just hygiene` GREEN
- `just systems-host` GREEN
- `just systems-emit-wire` GREEN
- `lake build SystemsLean.SelfApplyFs` GREEN
- `just freestanding-self-host-complete` GREEN (lake claim proof)

Claims: complete true; free/llvm/PROVABLY false; living perform/ownership/stepContractFull on tip.

### Remaining mass composition (if further tip shrink)

| Mass | ~Lines | Next seam |
|------|-------:|-----------|
| PartialReady chain + honesty defs | ~900 | Further fold alias thin only if gates allow (living SSoT stays tip) |
| Theorems | ~470 | Gate-first: stop requiring theorem forms on tip, then home/Smoke module |
| Examples | ~420 | Gate-first smoke split to SelfApplyFsSmoke or homes |
| CompilePath.lean (parallel) | ~3609 | Responsibility seams; not tip race |

Dual-pin theater stays **CLOSED**. Campaign join: `/tmp/grok-1000/grok-impl-summary-tip-split-camp-0731.md`.

---
## Baseline

| Metric | Value |
|--------|------:|
| Tip path | `src/systems/SystemsLean/SelfApplyFs.lean` |
| `wc -l` at campaign start | **3638** |
| Dual-pin theater | **CLOSED** (b1-33 done; do not re-open) |
| Short ProductPathFreestanding* names | **exhausted** |
| Plan | `.agents/plans/plan-long-file-refactor.md` section 8/8b |

## Region map (pre-split)

| Region | Lines | ~Count | Stay / move |
|--------|------:|-------:|-------------|
| Module header comment | 1-833 | 833 | **MOVE** bulk to this companion; keep short tip header with gate-only tokens |
| Imports | 835-873 | 39 | **STAY** |
| Core readiness + living claims + PartialReady folds | 875-2585 | 1711 | **STAY** living claim SSoT + chain folds; fold *doc* mass is later split candidate |
| Theorems (SELF-APPLY-FS-THEOREM) | 2586-3214 | ~629 | **STAY** until gate-first (hostSpecs require `theorem X` on tip) |
| Examples / smoke (SELF-APPLY-FS-SMOKE) | 3215-3637 | ~423 | **STAY** until gate-first (hostSpecs require `example : X` on tip) |
| end | 3638 | 1 | STAY |

## Gate impact (header split)

Pure Nix + emit-wire **read whole file** for substring presence. Pre-split, **10** required tokens appeared **only** in the long header:

- `SYSTEMS_LEAN_HOST`
- `UNIT_SURFACE`
- `SELF-HOST-KERNEL-EMIT`
- `Not freestanding residual free`
- `Not PROVABLY`
- `Not freestanding product`
- `Not freestanding emit residual free`
- `Not llvm unlocked`
- `FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE`
- `FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE`

Short tip header **must** keep those (and a one-line role + companion pointer). No hostSpecs / emit-wire path changes for header split alone.

**54** other required tokens appear only in body **comments** (smoke/theorem banners + family prose). Header split does not touch them. Later fold-doc split must keep one greppable line per token or move authority gate-first.

## Split 1 -- Header/doc

| Field | Value |
|-------|-------|
| Seam | Header inventory off tip into this companion |
| Expected delta | ~833 -> ~50 short header (~-780 lines) |
| Gates | hygiene, systems-host, systems-emit-wire, lake SelfApplyFs, freestanding-self-host-complete |
| Claims | complete true; free/llvm/PROVABLY false; living perform/ownership on tip |

## Later splits (not this slice unless green room)

1. **Fold-doc thin** -- shrink `/-!` / `/--` walls on PartialReady chain while keeping comment-only gate strings (or compact honesty pin block).
2. **Theorem/smoke split** -- gate-first only: hostSpecs + emit-wire must stop requiring `theorem` / `example` forms on tip before move to `SelfApplyFsSmoke.lean` or homes.
3. **PartialReady fold thin** -- further alias-only folds (living claim SSoT stays tip).
4. **CompilePath.lean** (~3609) -- parallel cold Lean seam; do not race tip writers.

## Remaining mass after header split (estimate)

| Region | ~Lines after split |
|--------|------------------:|
| Short header | ~50 |
| Imports + core/folds | ~1750 |
| Theorems + examples | ~1050 |
| **Tip total** | **~2850** (still >>2k) |

Floor while gates keep theorems+smoke+fold honesty on tip: roughly **2.5k-3.0k** until gate-first smoke/theorem migration.

## Original long header (archived)

ASCII inventory moved off tip. Historical greppable soup for humans/agents; **not** the living claim SSoT.

```
/-
  SYSTEMS_LEAN_HOST partial -- freestanding self-application deepen (SH5 deepen).
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): SelfApply.lean SH5 host structural self-application;
    ParityEmit.lean Mult+Linear+Types+Program+Emit freestanding path parity;
    KernelEmit.lean emit plan/apply/body path over program kernel; HostCompose
    extractOkFs RUNTIME-FS path; EmitBody HOST-EMIT-SSOT body fragment;
    EmitMult Mult product text honesty; self-host.md acceptance.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_SELF_APPLY_FS_V0 / HOST-SELF-APPLY-FS / SELF-HOST-SELF-APPLY-FS:
    SH5 freestanding deepen rung -- host self-apply plus freestanding extract
    and body path honesty on the kernel emit compose plus freestanding Mult..Emit
    parity ladder compose (not empty docs; not presence-only canaries alone).
  - freestandingExtractPathReady: fail-closed freestanding extract honesty on
    the self-host kernel emit compose (RUNTIME-FS / EMIT-BOUNDARY):
      empty HostCompose extractOkFs true;
      unminted program compose (KernelEmit.unmintedEmitCompose) extractOkFs false;
      KernelEmit.lowerEmitCompose some + extractOkFs true on that host.
  - freestandingBodyPathReady: freestanding body honesty on same compose
    (mirrors KernelEmit.emitBodyPathReady empty/unminted + emit host):
      empty bodyOk + emptyComposeFragmentSsot + markers;
      unminted bodyOk false;
      bodyOk + bodyIsValid + RUNTIME-FS marker on lowered emit compose body;
      EmitMult.emitMultReady (product Mult text honesty);
      reuses KernelEmit expected body fragment / HOST-EMIT-SSOT / EMIT_BODY_V0
      product wire cites (no new EMIT_* C stage).
  - freestandingSelfApplyPathReady: freestandingExtractPathReady &&
    freestandingBodyPathReady.
  - freestandingParityLadderReady: ParityEmit.multLinearTypesProgramEmitParityReady
    (freestanding Mult+Linear+Types+Program+Emit parity compose bar).
    Under current ParityEmit defs multLinearTypesProgramEmitParityReady is
    equivalent to emitParityReady (not a stronger gate; dual greppable honesty
    for Mult..Emit joint inventory). freestandingEmitParityReady aliases
    ParityEmit.emitParityReady for the same dual-greppable honesty.
  - freestandingProductSelfHostComplete: MUST decide true (claim B complete after Full).
  - freestandingSelfApplyReady: SelfApply.selfApplyReady &&
    freestandingSelfApplyPathReady && freestandingParityLadderReady &&
    surfaceOk.
    Honest scope: host self-apply + freestanding extract/body path on kernel
    emit compose + freestanding Mult..Emit parity ladder -- NOT "product
    freestanding C rebuilds full Slake end-to-end".
  - selfApplyFsDoesNotComplete: false after claim B complete (deepen does not deny complete); was freestandingSelfApplyReady &&
    !freestandingProductSelfHostComplete.
  - productKernelSelfApplyPartialReady (B2 partial / SELF-HOST-KERNEL-SELF-APPLY):
    freestandingSelfApplyReady && KernelSelfApply.productKernelSelfApplyPartialReady.
    Historical stage/bar HOST-EMIT Mult..Program cites live on KernelSelfApply
    (dual-pin thin batch 1). Tip keeps chain fold only. NOT residual free.
  - productOutKernelEvidencePartialReady (B3 partial / SELF-HOST-PRODUCT-OUT):
    productKernelSelfApplyPartialReady &&
    ProductOutKernel.productOutKernelEvidencePartialReady.
    Historical stage/path/API cites live on ProductOutKernel
    (dual-pin thin batch 2). Tip keeps chain fold only. NOT residual free.
  - productPathHostLakeBootstrapPartialReady (B4 partial /
    SELF-HOST-PRODUCT-PATH-BOOTSTRAP): productOutKernelEvidencePartialReady &&
    BootstrapHonesty.productPathHostLakeBootstrapPartialReady.
    Historical stage/writer-path cites live on BootstrapHonesty
    (dual-pin thin batch 3). Tip keeps remains := true honesty + chain fold.
    Honest residual: host Lake FreestandingEmit still writes product wire
    (bootstrap remains true) while product Out exercises B-bar contracts (B3).
    NOT complete; not residual free.
  - productWriterSurfacePartialReady (B5 partial /
    SELF-HOST-PRODUCT-WRITER-SURFACE): productPathHostLakeBootstrapPartialReady &&
    ProductPathWriterSurface.productWriterSurfacePartialReady.
    Historical stage/API/ownership cites live on ProductPathWriterSurface
    (dual-pin thin batch 4). Tip keeps chain fold only.
    Product Out ships writer-side contracts (emit plan/apply/body APIs +
    HOST-EMIT-PLAN/APPLY/BODY ownership + B-bar kernel APIs) as substrate toward
    a freestanding product writer path. Host Lake FreestandingEmit still performs
    full text regeneration (bootstrap remains via B4). NOT complete; not free.
  - productWriterPathPlanPartialReady (B6 partial /
    SELF-HOST-PRODUCT-WRITER-PATH-PLAN): productWriterSurfacePartialReady &&
    ProductPathWriterPathPlan.productWriterPathPlanPartialReady &&
    productPathHostLakeBootstrapRemains.
    Historical stage/step/Ok cites live on ProductPathWriterPathPlan
    (dual-pin thin batch 5). Tip keeps chain fold only.
    Named ordered freestanding-capable regenerate plan (read SSOT, compose
    plan/apply/body, write freestanding .h/.c, install Out) the product path
    must eventually own. Plan substrate only: Lake FreestandingEmit still
    writes full text today (B4 remains). NOT complete; not free; not surface
    re-grep of plan/apply/body alone (B5 already gates that).
  - productWriterPathExecutionPartialReady (B7 partial /
    SELF-HOST-PRODUCT-WRITER-PATH-EXEC): productWriterPathPlanPartialReady &&
    ProductPathWriterPathExec.productWriterPathExecutionPartialReady &&
    productPathHostLakeBootstrapRemains.
    Historical stage/fn/Ok cites live on ProductPathWriterPathExec
    (dual-pin thin batch 6). Tip keeps chain fold only.
    Measured host-driven **execution** of B6 plan steps: FreestandingEmit
    perform cites + just build install (cp Out). Distinct from
    B6 plan step ids alone (plan-id re-list theater banned). Still Lake
    bootstrap (B4 remains true). NOT freestanding product path complete
    without classic Lean as product path; not free.
  - productPathOwnershipInputsPartialReady (B8 partial /
    SELF-HOST-PRODUCT-PATH-OWNERSHIP): productWriterPathExecutionPartialReady &&
    productPathOwnershipInputsOk && productPathHostLakeBootstrapRemains &&
    !freestandingProductSelfHostComplete &&
    !productPathFreestandingOwnershipClaimed.
    Ownership **inputs + non-claim bar**: Mult..Out host_emit_*.ssot.txt path
    cites, emit slake_freestanding.{h,c} paths, Out install path, dual SSOT
    surface -- what a freestanding product path must own to regenerate without
    Lake elaborating FreestandingEmit as product path. productPathFreestandingOwnershipClaimed
    is proved false (inputs bar is not freestanding ownership claimed). Still
    Lake bootstrap (B4 remains). NOT complete; not free; not B7 re-grep theater.
  - productPathPerformPartialReady (B9 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM): productPathOwnershipInputsPartialReady &&
    productPathPerformOk && productPathHostLakeBootstrapRemains &&
    !freestandingProductSelfHostComplete &&
    !productPathFreestandingOwnershipClaimed &&
    !productPathFreestandingPerformClaimed &&
    productPathPerformDependsOnLake.
    Freestanding-capable **perform gap + install step-mechanism evidence**:
    product path regenerate perform still depends on Lake elaborating
    FreestandingEmit for read/compose/write (productPathPerformDependsOnLake
    true); productPathFreestandingPerformClaimed proved false (no freestanding
    product binary path owns full regenerate yet). Install Out **cp half** is
    Lake-free step mechanism when emit .h/.c already exist
    (productPathPerformInstallStepLakeFreeCapable true). Install Lake-free
    entrypoint isolation is B10 (productPathPerformInstallLakeFreeEntrypointClaimed
    true via just install-freestanding-c-out). NOT ownership claimed; NOT
    complete; NOT free; NOT B6/B7/B8 re-land theater.
  - productPathPerformStepPartialReady (B10 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-STEP): productPathPerformPartialReady &&
    productPathPerformStepOk && productPathHostLakeBootstrapRemains &&
    !freestandingProductSelfHostComplete &&
    !productPathFreestandingOwnershipClaimed &&
    !productPathFreestandingPerformClaimed &&
    productPathPerformDependsOnLake &&
    productPathPerformInstallLakeFreeEntrypointClaimed.
    First **perform step** beyond B9 gap naming: Lake-free **install-only**
    product entrypoint (`just install-freestanding-c-out`) copies emit wire
    to Out without lake build/exe when emit present. Read/compose/write still
    Lake (DependsOnLake true; FREESTANDING-PERFORM-GAP-* open). Install
    entrypoint alone does NOT flip freestanding perform claimed. NOT complete;
    NOT free; NOT B6/B7/B8/B9 re-land theater.
  - productPathPerformReadPartialReady (B11 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-READ): productPathPerformStepPartialReady &&
    ProductPathReadSsot.productPathPerformReadPartialReady &&
    productPathHostLakeBootstrapRemains &&
    productPathFreestandingOwnershipClaimed &&
    productPathFreestandingPerformClaimed &&
    productPathPerformDependsOnLake &&
    productPathPerformReadDependsOnLake &&
    productPathPerformReadEntrypointClaimed.
    First **READ-SSOT perform substrate** beyond B10: decomposed dual SSOT
    read via SystemsLean.ProductPathReadSsot (IO.FS.readFile Mult..Out) +
    just read-product-ssot / lake exe slake-read-product-ssot. Historical
    stage/Ok/moduleCite/recipe/exe dual-pins live on ProductPathReadSsot
    (dual-pin thin batch 10). Tip keeps ReadDependsOnLake +
    ReadEntrypointClaimed honesty + chain fold. Does NOT use FreestandingEmit
    renderHeader/renderSource/emitAtRoot as the read path.
    productPathPerformReadDependsOnLake true (still classic Lean Lake host
    step; not freestanding C). FREESTANDING-PERFORM-GAP-READ-SSOT not closed
    (not freestanding-capable without classic Lean). Compose/write still Lake
    FreestandingEmit. Living tip allows perform/ownership/complete true after
    later cliffs. NOT free; NOT B6..B10 re-land theater.
  - productPathPerformComposePartialReady (B12 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE): productPathPerformReadPartialReady &&
    ProductPathComposePlan.productPathPerformComposePartialReady &&
    productPathHostLakeBootstrapRemains &&
    productPathFreestandingOwnershipClaimed &&
    productPathFreestandingPerformClaimed &&
    productPathPerformDependsOnLake &&
    productPathPerformComposeDependsOnLake &&
    productPathPerformComposeEntrypointClaimed.
    First **COMPOSE plan/apply/body perform substrate** beyond B11: decomposed
    ordered compose via SystemsLean.ProductPathComposePlan
    (composePlanApplyBodyAtRoot) + just compose-product-plan / lake exe
    slake-compose-product-plan. Historical stage/Ok/moduleCite/recipe/exe
    dual-pins live on ProductPathComposePlan (dual-pin thin batch 11). Tip keeps
    ComposeDependsOnLake + ComposeEntrypointClaimed honesty + chain fold.
    Does NOT use FreestandingEmit renderHeader/renderSource/emitAtRoot as the
    compose path. Does NOT write product .h/.c.
    productPathPerformComposeDependsOnLake true (still classic Lean Lake host
    step; not freestanding C). FREESTANDING-PERFORM-GAP-COMPOSE not closed
    (not freestanding-capable without classic Lean). Full Mult..Apply template
    embed + WRITE-HC still Lake FreestandingEmit at land-time. Living tip
    allows perform/ownership/complete true after later cliffs. NOT free;
    NOT B6..B11 re-land theater.
  - productPathPerformWriteHcPartialReady (B13 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC): productPathPerformComposePartialReady &&
    ProductPathWriteHc.productPathPerformWriteHcPartialReady &&
    productPathHostLakeBootstrapRemains &&
    productPathFreestandingOwnershipClaimed &&
    productPathFreestandingPerformClaimed &&
    productPathPerformDependsOnLake &&
    productPathPerformWriteHcDependsOnLake &&
    productPathPerformWriteHcEntrypointClaimed.
    First **WRITE-HC freestanding .h/.c perform substrate** beyond B12: decomposed
    write entrypoint via SystemsLean.ProductPathWriteHc
    (writeFreestandingHcAtRoot -> FreestandingEmit.emitAtRoot) + just
    write-freestanding-hc / lake exe slake-write-freestanding-hc. Writes emit
    slake_freestanding.{h,c} only; does NOT install Out (B10). Dual-pin thin
    batch 12: tip keeps WriteHcDependsOnLake + WriteHcEntrypointClaimed honesty +
    chain fold. productPathPerformWriteHcDependsOnLake true (honest Lake
    FreestandingEmit product writer). FREESTANDING-PERFORM-GAP-WRITE-HC not
    freestanding-closed at land-time. Living tip allows perform/ownership/complete
    true after later cliffs. NOT free; NOT B6..B12 re-land theater.
  - productPathFreestandingCapablePartialReady (B14 partial /
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP):
    productPathPerformWriteHcPartialReady &&
    Capable.productPathFreestandingCapablePartialReady &&
    productPathHostLakeBootstrapRemains &&
    productPathFreestandingOwnershipClaimed &&
    productPathFreestandingPerformClaimed && productPathPerformDependsOnLake &&
    productPathFreestandingCapableInstallOnly &&
    productPathFreestandingCapableRead &&
    !productPathFreestandingCapableFullPerform.
    **Freestanding-capable gap measure + host ordered pipeline join** beyond B13.
    Dual-pin thin batch 13: tip keeps InstallOnly/Read/Compose/WriteHc/FullPerform
    honesty + chain fold; Ok/stage/recipe/exe/LakeFree on Capable home.
    CapableRead/Compose/WriteHc true after B26..B28. Full perform false.
    just regenerate-product-path + freestanding-capable-gap diagnostic.
    Living tip allows perform/ownership/complete true. NOT free.
  - productPathFreestandingCapableStepContractPartialReady (B15 partial /
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT; evolved B16..B18):
    productPathFreestandingCapablePartialReady &&
    CapableStepContract.productPathFreestandingCapableStepContractPartialReady &&
    productPathHostLakeBootstrapRemains &&
    productPathFreestandingOwnershipClaimed &&
    productPathFreestandingPerformClaimed && productPathPerformDependsOnLake &&
    productPathFreestandingCapableStepContractAuthorityNotEmit &&
    productPathFreestandingCapableStepContractReadSatisfied &&
    productPathFreestandingCapableStepContractComposeSatisfied &&
    productPathFreestandingCapableStepContractWriteHcSatisfied &&
    !productPathFreestandingCapableStepContractFullSatisfied.
    Dual-pin thin batch 14: tip keeps AuthorityNotEmit/Read/Compose/WriteHc/
    FullSatisfied/stepContractFull honesty + chain fold; Ok/stage/recipe/exe on
    CapableStepContract home. **Freestanding-capable step contract / interface**
    beyond B14 gap measure: named FREESTANDING-CAPABLE-STEP-CONTRACT-READ/COMPOSE/
    WRITE-HC + freestanding API surface (freestandingCapableReadDualSsot /
    ComposePlanApplyBody / WriteFreestandingHc) + authority-not-FreestandingEmit
    as product path + ordered blockers. B16: ReadSatisfied true; B17: Compose
    satisfied true; B18: WriteHcSatisfied true; Full long-name false; living
    stepContractFull true after later cliffs. NOT free; NOT B6..B18 re-land theater.
  - productPathFreestandingCapableReadPartialReady (B16 partial /
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ):
    productPathFreestandingCapableStepContractPartialReady &&
    CapableRead.productPathFreestandingCapableReadPartialReady &&
    productPathFreestandingCapableStepContractReadSatisfied &&
    productPathFreestandingCapableReadEntrypointClaimed &&
    productPathFreestandingCapableReadAuthorityNotEmit &&
    productPathFreestandingCapableReadDependsOnLake &&
    productPathFreestandingCapableRead (B14 CapableRead true after B26) &&
    productPathFreestandingPerformClaimed && productPathFreestandingOwnershipClaimed.
    Dual-pin thin batch 15: tip keeps EntrypointClaimed/AuthorityNotEmit/
    DependsOnLake honesty + chain fold; Ok/stage/recipe/exe on CapableRead home.
    **First freestanding-capable READ** without FreestandingEmit as product
    authority: freestandingCapableReadDualSsot (CapableRead)
    + just freestanding-capable-read (Lake exe) + just freestanding-capable-read-
    lake-free (B26 Lake-free measure; flips B14 CapableRead). Deeper than B11
    (HEADER/BODY structural). Living tip allows perform / ownership / complete.
  - productPathFreestandingCapableComposePartialReady (B17 partial /
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE; evolved B27):
    productPathFreestandingCapableReadPartialReady &&
    productPathFreestandingCapableComposeOk &&
    productPathFreestandingCapableStepContractComposeSatisfied &&
    productPathFreestandingCapableComposeEntrypointClaimed &&
    productPathFreestandingCapableComposeAuthorityNotEmit &&
    productPathFreestandingCapableComposeDependsOnLake &&
    productPathFreestandingCapableCompose (B14 CapableCompose true after B27) &&
    !productPathFreestandingPerformClaimed.
    **First freestanding-capable COMPOSE** without FreestandingEmit as product
    authority: freestandingCapableComposePlanApplyBody
    (CapableCompose) + just freestanding-capable-compose
    (Lake exe) + just freestanding-capable-compose-lake-free (B27 Lake-free
    measure; flips B14 CapableCompose). Deeper than B12 and B24 ownership
    compose-only (HEADER/BODY structural + ordered marker). NOT perform claimed;
    NOT complete; NOT free.
  - productPathFreestandingCapableWriteHcPartialReady (B18 partial /
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC; evolved B28 CapableWriteHc):
    productPathFreestandingCapableComposePartialReady &&
    productPathFreestandingCapableWriteHcOk &&
    productPathFreestandingCapableStepContractWriteHcSatisfied &&
    productPathFreestandingCapableWriteHcEntrypointClaimed &&
    productPathFreestandingCapableWriteHcAuthorityNotEmit &&
    productPathFreestandingCapableWriteHcDependsOnLake &&
    productPathFreestandingCapableWriteHc (B14 CapableWriteHc true after B28) &&
    !productPathFreestandingPerformClaimed &&
    !productPathFreestandingOwnershipClaimed.
    **First freestanding-capable WRITE-HC** without FreestandingEmit as product
    authority: freestandingCapableWriteFreestandingHc
    (CapableWriteHc) + just freestanding-capable-write-hc
    (Lake exe) + just freestanding-capable-write-hc-lake-free (B28 Lake-free
    measure; flips B14 CapableWriteHc). Deeper than B13 and B25 ownership
    write-hc-only (HEADER/BODY structural + write substrate). NOT perform claimed;
    NOT ownership claimed; NOT complete; NOT free.
  - productPathFreestandingCapableRegeneratePartialReady (B19 partial /
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE):
    productPathFreestandingCapableWriteHcPartialReady &&
    productPathFreestandingCapableRegenerateOk &&
    productPathFreestandingCapableRegenerateEntrypointClaimed &&
    productPathFreestandingCapableRegenerateAuthorityNotEmit &&
    productPathFreestandingCapableRegenerateDependsOnLake &&
    !productPathFreestandingCapableRegenerateInstallOutOpen &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    !productPathFreestandingPerformClaimed &&
    !productPathFreestandingOwnershipClaimed.
    **First freestanding-capable ordered regenerate pipeline join** without
    FreestandingEmit as product authority: freestandingCapableOrderedRegenerate
    (READ then COMPOSE then WRITE-HC then Install Out via
    CapableRegenerate) + just freestanding-capable-regenerate.
    Deeper than B14 regenerate-product-path host Lake perform join. Install Out
    closed by freestanding-capable path (B20); Full stays false.
    NOT Full satisfied; NOT perform claimed; NOT ownership claimed; NOT complete;
    NOT free; NOT WithoutLake. Capable* true after B26..B28 Lake-free measures.
  - productPathFreestandingCapableInstallOutPartialReady (B20 partial /
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT):
    productPathFreestandingCapableRegeneratePartialReady &&
    InstallOut.productPathFreestandingCapableInstallOutPartialReady &&
    productPathFreestandingCapableInstallOutEntrypointClaimed &&
    productPathFreestandingCapableInstallOutAuthorityNotEmit &&
    productPathFreestandingCapableInstallOutDependsOnLake &&
    !productPathFreestandingCapableRegenerateInstallOutOpen &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    productPathFreestandingPerformClaimed &&
    productPathFreestandingOwnershipClaimed.
    **First freestanding-capable Install Out** without FreestandingEmit as product
    authority: freestandingCapableInstallFreestandingOut
    (InstallOut) + just freestanding-capable-install-out.
    Dual-pin thin batch 19: Ok/stage/recipe/exe/step home-primary; tip honesty +
    B19 chain fold. Deeper than B10 shell install-freestanding-c-out alone
    (Lean IO install path). InstallOutOpen false. Long-name Full unsatisfied;
    living tip allows perform / ownership / complete true after later cliffs.
    Capable* true after B26..B28.
  - productPathFreestandingCapableFullBarPartialReady (B21 partial /
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR):
    productPathFreestandingCapableInstallOutPartialReady &&
    CapableFullBar.productPathFreestandingCapableFullBarPartialReady &&
    productPathFreestandingCapableFullBarStepContractsClosed &&
    productPathFreestandingCapableFullBarInstallOutClosed &&
    productPathFreestandingCapableFullBarOrderedPipelineJoined &&
    productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake &&
    productPathFreestandingCapableFullBarCapableLakeFree &&
    productPathFreestandingCapableFullBarDependsOnLake &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    productPathFreestandingPerformClaimed &&
    productPathFreestandingOwnershipClaimed.
    **Full bar / ownership-gap measure** beyond B20: proves what is closed
    (step contracts + InstallOut + ordered regenerate + B14 Capable* Lake-free
    after B26+B27+B28 + ownership regenerate WithoutLake after B30 product path
    authority) under Full-bar framing. just freestanding-capable-full-bar +
    CapableFullBar. Dual-pin thin batch 20: Ok/stage/recipe/exe/Req* home-primary;
    tip closed-substrate honesty + B20 chain fold. Long-name Full unsatisfied;
    living tip allows perform / ownership / complete true after later cliffs.
    Not B6..B29 re-land theater.
  - productPathOwnershipRegeneratePartialReady (B22..B30 partial /
    SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE):
    productPathFreestandingCapableFullBarPartialReady &&
    ProductPathOwnershipRegenerate.productPathOwnershipRegeneratePartialReady &&
    productPathOwnershipRegenerateInstallLakeFree &&
    productPathOwnershipRegenerateInstallPathClaimed &&
    productPathOwnershipRegenerateReadLakeFree &&
    productPathOwnershipRegenerateReadPathClaimed &&
    productPathOwnershipRegenerateComposeLakeFree &&
    productPathOwnershipRegenerateComposePathClaimed &&
    productPathOwnershipRegenerateWriteHcLakeFree &&
    productPathOwnershipRegenerateWriteHcPathClaimed &&
    productPathOwnershipRegenerateLakeFreeJoinClaimed &&
    productPathOwnershipRegenerateProductPathAuthorityClaimed &&
    productPathOwnershipRegenerateWithoutLake &&
    productPathOwnershipRegenerateDependsOnLake &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    productPathFreestandingPerformClaimed &&
    productPathFreestandingOwnershipClaimed.
    **Ownership regenerate substrate** beyond B21: Lake-free install/READ/
    COMPOSE/WRITE-HC path pieces, B29 ordered join, B30 product path authority;
    WithoutLake true (FullBar dual-pin). Dual-pin thin batch 21: Ok/stage/
    recipe/exe/step ids home-primary; tip honesty + B21 chain fold.
    ProductPathOwnershipRegenerate. Living tip allows perform / ownership /
    Full / complete true after later cliffs. not B6..B29 theater.
  - productPathFreestandingPerformEvidencePartialReady (B31 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE):
    productPathOwnershipRegeneratePartialReady &&
    PerformEvidence.productPathFreestandingPerformEvidencePartialReady &&
    productPathFreestandingPerformEvidenceClaimed &&
    productPathFreestandingPerformClaimed && productPathPerformDependsOnLake &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    productPathFreestandingOwnershipClaimed.
    **Freestanding perform evidence** beyond B30 under perform framing.
    Dual-pin thin batch 22: Ok/stage/recipe/exe/step ids home-primary; tip
    EvidenceClaimed honesty + B30 chain fold. PerformEvidence already short.
    Living tip allows perform / ownership / Full / complete true after later cliffs.
  - productPathFreestandingPerformOfficialPathPartialReady (B32 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH):
    productPathFreestandingPerformEvidencePartialReady &&
    OfficialPath.productPathFreestandingPerformOfficialPathPartialReady &&
    productPathFreestandingPerformOfficialPathGapMeasured &&
    productPathFreestandingPerformClaimed && productPathPerformDependsOnLake &&
    !productPathOfficialPathStillUsesFreestandingEmit &&
    productPathOfficialPathStillUsesLake &&
    !productPathOfficialPathRetireFreestandingEmitRequired &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    productPathFreestandingOwnershipClaimed.
    **Official product path gap** beyond B31. Dual-pin thin batch 23: Ok/stage/
    recipe/exe home-primary; tip GapMeasured + living StillUses false / Retire
    false (post-B38) + B31 chain fold. OfficialPath already short. Living tip
    allows perform / ownership / Full / complete true after later cliffs.
  - productPathFreestandingPerformOfficialPathAlternatePartialReady (B33 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE):
    productPathFreestandingPerformOfficialPathPartialReady &&
    OfficialPathAlternate.productPathFreestandingPerformOfficialPathAlternatePartialReady &&
    productPathFreestandingPerformOfficialPathAlternateMeasured &&
    productPathOfficialPathAlternateWriterPresent &&
    !productPathOfficialPathAlternateNotOfficial &&
    !productPathOfficialPathDualEqualityBlocksRetirement &&
    productPathFreestandingPerformClaimed && productPathPerformDependsOnLake &&
    !productPathOfficialPathStillUsesFreestandingEmit &&
    productPathOfficialPathStillUsesLake &&
    !productPathOfficialPathRetireFreestandingEmitRequired &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    productPathFreestandingOwnershipClaimed.
    **Official-path alternate writer** beyond B32. Dual-pin thin batch 24:
    Ok/stage/recipe/exe home-primary; tip Measured + WriterPresent + living
    AlternateNotOfficial false / DualEqualityBlocks false (post-B38) + B32 chain
    fold. Short-name deferred (long ProductPath* basename). Living tip allows
    perform / ownership / Full / complete true after later cliffs.
  - productPathFreestandingPerformDualEqualityWriteParityPartialReady (B34 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY; evolved B37 gap closed):
    productPathFreestandingPerformOfficialPathAlternatePartialReady &&
    DualEqWriteParity.productPathFreestandingPerformDualEqualityWriteParityPartialReady &&
    productPathFreestandingPerformDualEqualityWriteParityMeasured &&
    !productPathDualEqualityWriteParityGapOpen &&
    !productPathCapableWriteStructuralNotDualEquality &&
    productPathFreestandingPerformClaimed && productPathPerformDependsOnLake &&
    !productPathOfficialPathStillUsesFreestandingEmit &&
    productPathOfficialPathStillUsesLake &&
    !productPathOfficialPathRetireFreestandingEmitRequired &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    productPathFreestandingOwnershipClaimed.
    **Dual-equality WRITE parity** beyond B33. Dual-pin thin batch 25:
    Ok/stage/recipe/exe home-primary; tip Measured + living GapOpen false /
    StructuralNotDualEq false (post-B37) + B33 chain fold. Short-name deferred
    (long ProductPath* basename). Living tip allows perform / ownership / Full /
    complete true after later cliffs.
  - productPathFreestandingPerformDualEqualityWriteClosePathPartialReady (B35 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH; evolved B37):
    productPathFreestandingPerformDualEqualityWriteParityPartialReady &&
    DualEqWriteClosePath.productPathFreestandingPerformDualEqualityWriteClosePathPartialReady &&
    productPathFreestandingPerformDualEqualityWriteClosePathMeasured &&
    productPathDualEqualityWriteClosePathNamed &&
    !productPathDualEqualityWriteClosePathNotGapClosed &&
    productPathFreestandingPerformClaimed && productPathPerformDependsOnLake &&
    !productPathOfficialPathStillUsesFreestandingEmit &&
    productPathOfficialPathStillUsesLake &&
    !productPathOfficialPathRetireFreestandingEmitRequired &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    productPathFreestandingOwnershipClaimed.
    **Dual-equality WRITE close path** beyond B34. Dual-pin thin batch 26:
    Ok/stage/recipe/exe home-primary; tip Measured + Named + living NotGapClosed
    false (post-B37) + B34 chain fold. Short-name deferred (long ProductPath*
    basename). Living tip allows perform / ownership / Full / complete true after
    later cliffs.
  - productPathFreestandingPerformDualEqualityWriteApiPartialReady (B36 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API):
    productPathFreestandingPerformDualEqualityWriteClosePathPartialReady &&
    DualEqWriteApi.productPathFreestandingPerformDualEqualityWriteApiPartialReady &&
    five API honesty + living claims.
    **Dual-equality WRITE API** beyond B35. Dual-pin thin batch 27:
    Ok/stage/recipe/exe home-primary; tip five honesty + freestandingDualEqualityWriteFreestandingHc
    cite + B35 chain fold. Short-name deferred.
  - productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady (B37 partial /
    SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP):
    productPathFreestandingPerformDualEqualityWriteApiPartialReady &&
    productPathFreestandingPerformDualEqualityWriteCapableGapMeasured &&
    productPathDualEqualityWriteCapableGapClosed &&
    productPathCapableWriteDualEqualityLive &&
    productPathDualEqualityWriteCapableGapStepAdvanced &&
    !productPathDualEqualityWriteParityGapOpen &&
    !productPathCapableWriteStructuralNotDualEquality &&
    productPathOfficialPathDualEqualityBlocksRetirement &&
    !productPathFreestandingPerformClaimed && productPathPerformDependsOnLake &&
    productPathOfficialPathStillUsesFreestandingEmit &&
    productPathOfficialPathStillUsesLake &&
    productPathOfficialPathRetireFreestandingEmitRequired &&
    !productPathFreestandingCapableStepContractFullSatisfied &&
    !freestandingProductSelfHostComplete && !productPathFreestandingOwnershipClaimed.
    **CAPABLE-GAP close** beyond B36: freestandingCapableWriteFreestandingHc is
    dual-equality (Emit* + requireDualSsotEqual); parity gap closed; official path
    still FreestandingEmit (just freestanding-perform-dual-equality-write-capable-
    gap). CAPABLE-GAP closed is NOT perform claimed (RETIRE-OFFICIAL next).
    just freestanding-perform-dual-equality-write-capable-gap +
    DualEqWriteCapableGap.
    NOT perform claimed; NOT Full; NOT ownership claimed; NOT complete.
  - Host model = structural freestanding path honesty. Not an AI/ML model.
    Not product C residual free.

  Theorems (SELF-APPLY-FS-THEOREM / HOST-SELF-APPLY-FS-THEOREM -- partial
  SelfApplyFs only):
  - freestandingSelfApplyReady_true / freestandingProductSelfHostComplete_true
  - selfApplyFsDoesNotComplete_false / freestandingSelfApplyPathReady_true
  - stageId_eq / hostSelfApplyFsId_eq
  These SelfApplyFs theorems do NOT set SpecProof.proofCompleteClaimed true.
  freestandingProductSelfHostComplete stays false (proved false, not set true).

  Intentional non-claims / partial parity:
  - PARTIAL: freestanding extract/body path on kernel compose + host self-apply
    + freestanding Mult..Emit parity ladder compose; not freestanding product
    self-host complete; not residual free.
  - Not PROVABLY. Does not unlock llvm / out/llvm-ir (SH6 still held via
    LlvmHold.lean -- hold gate, not unlock).
  - freestandingProductSelfHostComplete remains false forever in this module
    until a later honest product residual (never set true here).
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not grow bash EMIT_* residual treadmill. No new EMIT_* C stage.
  - Does not grow check.sh.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_SELF_APPLY_FS_V0,
  HOST-SELF-APPLY-FS, SELF-HOST-SELF-APPLY-FS, SELF-APPLY-FS-SMOKE,
  HOST-SELF-APPLY-FS-SMOKE, freestandingExtractPathReady,
  freestandingBodyPathReady, freestandingSelfApplyPathReady,
  freestandingParityLadderReady, freestandingEmitParityReady,
  freestandingSelfApplyReady, freestandingProductSelfHostComplete,
  selfApplyFsDoesNotComplete, HOST-SELF-APPLY, selfApplyReady,
  HOST-PARITY-EMIT, SELF-HOST-PARITY-EMIT, SLAKE_SELF_HOST_PARITY_EMIT_V0,
  emitParityReady, multLinearTypesProgramEmitParityReady,
  RUNTIME-FS, EMIT-BOUNDARY, HOST-EMIT-SSOT, EMIT_BODY_V0, HOST-EMIT-MULT,
  HOST-EMIT-LINEAR, HOST-EMIT-ERASURE, HOST-EMIT-TYPES, HOST-EMIT-PROGRAM,
  SELF-HOST-KERNEL-EMIT, SELF-HOST-KERNEL-SELF-APPLY,
  productKernelSelfApplyPartialReady,
  product kernel self-application, KernelSelfApply,
  SELF-HOST-PRODUCT-OUT,
  productOutKernelEvidencePartialReady,
  product Out kernel evidence, ProductOutKernel,
  SELF-HOST-PRODUCT-PATH-BOOTSTRAP,
  productPathHostLakeBootstrapRemains, productPathHostLakeBootstrapPartialReady,
  product path Lake bootstrap, BootstrapHonesty,
  SELF-HOST-PRODUCT-WRITER-SURFACE,
  productWriterSurfacePartialReady, product writer surface, ProductPathWriterSurface,
  SELF-HOST-PRODUCT-WRITER-PATH-PLAN,
  productWriterPathPlanPartialReady, product writer path plan, ProductPathWriterPathPlan,
  SELF-HOST-PRODUCT-WRITER-PATH-EXEC,
  productWriterPathExecutionPartialReady, product writer path execution,
  ProductPathWriterPathExec,
  SELF-HOST-PRODUCT-PATH-OWNERSHIP, product path ownership inputs,
  productPathOwnershipInputsPartialReady, ProductPathOwnershipInputs,
  productPathFreestandingOwnershipClaimed,

  SELF-HOST-PRODUCT-PATH-PERFORM, product path perform,
  productPathPerformPartialReady, ProductPathPerform,
  productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
  productPathPerformInstallLakeFreeEntrypointClaimed,
  SELF-HOST-PRODUCT-PATH-PERFORM-STEP, product path perform step,
  productPathPerformStepPartialReady, ProductPathPerformStep,
  SELF-HOST-PRODUCT-PATH-PERFORM-READ, product path perform read,
  productPathPerformReadPartialReady,
  productPathPerformReadDependsOnLake, productPathPerformReadEntrypointClaimed,
  ProductPathReadSsot,
  SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, product path perform compose,
  productPathPerformComposePartialReady,
  productPathPerformComposeDependsOnLake, productPathPerformComposeEntrypointClaimed,
  ProductPathComposePlan,
  SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, product path perform write,
  productPathPerformWriteHcPartialReady,
  productPathPerformWriteHcDependsOnLake, productPathPerformWriteHcEntrypointClaimed,
  ProductPathWriteHc,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP,
  product path freestanding capable gap,
  productPathFreestandingCapablePartialReady,
  productPathFreestandingCapableInstallOnly, productPathFreestandingCapableRead,
  productPathFreestandingCapableCompose, productPathFreestandingCapableWriteHc,
  productPathFreestandingCapableFullPerform,
  Capable,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0,
  product path freestanding capable step contract,
  productPathFreestandingCapableStepContractPartialReady,
  productPathFreestandingCapableStepContractOk,
  productPathFreestandingCapableStepContractAuthorityNotEmit,
  productPathFreestandingCapableStepContractReadSatisfied,
  productPathFreestandingCapableStepContractComposeSatisfied,
  productPathFreestandingCapableStepContractWriteHcSatisfied,
  productPathFreestandingCapableStepContractFullSatisfied,
  FREESTANDING-CAPABLE-STEP-CONTRACT-READ,
  FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE,
  FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC,
  freestandingCapableReadDualSsot, freestandingCapableComposePlanApplyBody,
  freestandingCapableWriteFreestandingHc,
  BLOCKER-READ-STILL-LAKE-HOST-PRODUCT-PATH,
  BLOCKER-COMPOSE-STILL-LAKE-HOST-PRODUCT-PATH,
  BLOCKER-WRITE-HC-STILL-LAKE-HOST-PRODUCT-PATH,
  BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
  freestanding-capable-step-contract, slake-freestanding-capable-step-contract,
  CapableStepContract,
  lowerEmitCompose, extractOkFs, bodyOk,
  emitMultReady, SELF-APPLY-FS-THEOREM, HOST-SELF-APPLY-FS-THEOREM,
  freestandingSelfApplyReady_true, freestandingProductSelfHostComplete_true,
  productKernelSelfApplyPartialReady_true,
  productOutKernelEvidencePartialReady_true,
  productPathHostLakeBootstrapPartialReady_true,
  productWriterSurfacePartialReady_true,
  productWriterPathPlanPartialReady_true,
  productWriterPathExecutionPartialReady_true,
  productPathOwnershipInputsPartialReady_true,
  productPathFreestandingOwnershipClaimed_false,
  productPathPerformPartialReady_true,
  productPathFreestandingPerformClaimed_false,
  productPathPerformDependsOnLake_true,
  productPathPerformInstallLakeFreeEntrypointClaimed_true,
  productPathPerformStepPartialReady_true,
  productPathPerformReadPartialReady_true,
  productPathPerformReadDependsOnLake_true,
  productPathPerformReadEntrypointClaimed_true,
  productPathPerformComposePartialReady_true,
  productPathPerformComposeDependsOnLake_true,
  productPathPerformComposeEntrypointClaimed_true,
  productPathPerformWriteHcPartialReady_true,
  productPathPerformWriteHcDependsOnLake_true,
  productPathPerformWriteHcEntrypointClaimed_true,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP,
  product path freestanding capable gap,
  productPathFreestandingCapablePartialReady,
  productPathFreestandingCapableInstallOnly, productPathFreestandingCapableRead,
  productPathFreestandingCapableCompose, productPathFreestandingCapableWriteHc,
  productPathFreestandingCapableFullPerform,
  Capable,
  theorem productPathFreestandingCapablePartialReady_true,
  theorem productPathFreestandingCapableInstallOnly_true,
  theorem productPathFreestandingCapableFullPerform_false,
  theorem productPathFreestandingCapableRead_true,
  theorem productPathFreestandingCapableCompose_true,
  theorem productPathFreestandingCapableWriteHc_true,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0,
  product path freestanding capable step contract,
  productPathFreestandingCapableStepContractPartialReady,
  productPathFreestandingCapableStepContractOk,
  productPathFreestandingCapableStepContractAuthorityNotEmit,
  productPathFreestandingCapableStepContractReadSatisfied,
  productPathFreestandingCapableStepContractComposeSatisfied,
  productPathFreestandingCapableStepContractWriteHcSatisfied,
  productPathFreestandingCapableStepContractFullSatisfied,
  freestanding-capable-step-contract, slake-freestanding-capable-step-contract,
  CapableStepContract,
  theorem productPathFreestandingCapableStepContractPartialReady_true,
  theorem productPathFreestandingCapableStepContractAuthorityNotEmit_true,
  theorem productPathFreestandingCapableStepContractReadSatisfied_true,
  theorem productPathFreestandingCapableStepContractComposeSatisfied_true,
  theorem productPathFreestandingCapableStepContractWriteHcSatisfied_true,
  theorem productPathFreestandingCapableStepContractFullSatisfied_false,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ,
  product path freestanding capable read,
  productPathFreestandingCapableReadPartialReady,
  productPathFreestandingCapableReadEntrypointClaimed,
  productPathFreestandingCapableReadAuthorityNotEmit,
  productPathFreestandingCapableReadDependsOnLake,
  CapableRead, freestandingCapableReadDualSsot,
  theorem productPathFreestandingCapableReadPartialReady_true,
  theorem productPathFreestandingCapableReadEntrypointClaimed_true,
  theorem productPathFreestandingCapableReadAuthorityNotEmit_true,
  theorem productPathFreestandingCapableReadDependsOnLake_true,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE,
  product path freestanding capable compose,
  productPathFreestandingCapableComposePartialReady,
  productPathFreestandingCapableComposeEntrypointClaimed,
  productPathFreestandingCapableComposeAuthorityNotEmit,
  productPathFreestandingCapableComposeDependsOnLake,
  CapableCompose, freestandingCapableComposePlanApplyBody,
  theorem productPathFreestandingCapableComposePartialReady_true,
  theorem productPathFreestandingCapableComposeEntrypointClaimed_true,
  theorem productPathFreestandingCapableComposeAuthorityNotEmit_true,
  theorem productPathFreestandingCapableComposeDependsOnLake_true,
  productPathFreestandingCapableWriteHcPartialReady,
  productPathFreestandingCapableWriteHcEntrypointClaimed,
  productPathFreestandingCapableWriteHcAuthorityNotEmit,
  productPathFreestandingCapableWriteHcDependsOnLake,
  CapableWriteHc, freestandingCapableWriteFreestandingHc,
  theorem productPathFreestandingCapableWriteHcPartialReady_true,
  theorem productPathFreestandingCapableWriteHcEntrypointClaimed_true,
  theorem productPathFreestandingCapableWriteHcAuthorityNotEmit_true,
  theorem productPathFreestandingCapableWriteHcDependsOnLake_true,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE,
  product path freestanding capable regenerate,
  productPathFreestandingCapableRegeneratePartialReady,
  productPathFreestandingCapableRegenerateEntrypointClaimed,
  productPathFreestandingCapableRegenerateAuthorityNotEmit,
  productPathFreestandingCapableRegenerateDependsOnLake,
  productPathFreestandingCapableRegenerateInstallOutOpen,
  freestandingCapableOrderedRegenerate,
  CapableRegenerate,
  theorem productPathFreestandingCapableRegeneratePartialReady_true,
  theorem productPathFreestandingCapableRegenerateEntrypointClaimed_true,
  theorem productPathFreestandingCapableRegenerateAuthorityNotEmit_true,
  theorem productPathFreestandingCapableRegenerateDependsOnLake_true,
  theorem productPathFreestandingCapableRegenerateInstallOutOpen_false,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT,
  product path freestanding capable install out,
  productPathFreestandingCapableInstallOutPartialReady,
  productPathFreestandingCapableInstallOutEntrypointClaimed,
  productPathFreestandingCapableInstallOutAuthorityNotEmit,
  productPathFreestandingCapableInstallOutDependsOnLake,
  freestandingCapableInstallFreestandingOut,
  InstallOut,
  theorem productPathFreestandingCapableInstallOutPartialReady_true,
  theorem productPathFreestandingCapableInstallOutEntrypointClaimed_true,
  theorem productPathFreestandingCapableInstallOutAuthorityNotEmit_true,
  theorem productPathFreestandingCapableInstallOutDependsOnLake_true,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR,
  product path freestanding capable full bar,
  productPathFreestandingCapableFullBarPartialReady,
  productPathFreestandingCapableFullBarStepContractsClosed,
  productPathFreestandingCapableFullBarInstallOutClosed,
  productPathFreestandingCapableFullBarOrderedPipelineJoined,
  productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake,
  productPathFreestandingCapableFullBarCapableLakeFree,
  productPathFreestandingCapableFullBarDependsOnLake,
  CapableFullBar,
  productPathOwnershipRegeneratePartialReady,
  productPathOwnershipRegenerateInstallLakeFree,
  productPathOwnershipRegenerateReadLakeFree,
  productPathOwnershipRegenerateComposeLakeFree,
  productPathOwnershipRegenerateWriteHcLakeFree,
  productPathOwnershipRegenerateLakeFreeJoinClaimed,
  productPathOwnershipRegenerateProductPathAuthorityClaimed,
  productPathOwnershipRegenerateWithoutLake,
  productPathOwnershipRegenerateDependsOnLake,
  ProductPathOwnershipRegenerate,
  SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE,
  product path freestanding perform evidence,
  productPathFreestandingPerformEvidencePartialReady,
  productPathFreestandingPerformEvidenceClaimed,
  PerformEvidence,
  SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
  product path freestanding perform official path,
  productPathFreestandingPerformOfficialPathPartialReady,
  productPathFreestandingPerformOfficialPathGapMeasured,
  productPathOfficialPathStillUsesFreestandingEmit,
  productPathOfficialPathStillUsesLake,
  productPathOfficialPathRetireFreestandingEmitRequired,
  OfficialPath,
  productPathOwnershipRegenerateInstallPathClaimed,
  productPathOwnershipRegenerateReadPathClaimed,
  productPathOwnershipRegenerateComposePathClaimed,
  productPathOwnershipRegenerateWriteHcPathClaimed,
  ProductPathOwnershipRegenerate,
  FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE,
  FULL-BAR-REQ-B14-CAPABLE-READ-LAKE-FREE,
  FULL-BAR-REQ-B14-CAPABLE-COMPOSE-LAKE-FREE,
  FULL-BAR-REQ-B14-CAPABLE-WRITE-HC-LAKE-FREE,
  FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
  FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
  freestanding-capable-full-bar, slake-freestanding-capable-full-bar,
  CapableFullBar,
  theorem productPathFreestandingCapableFullBarPartialReady_true,
  theorem productPathFreestandingCapableFullBarStepContractsClosed_true,
  theorem productPathFreestandingCapableFullBarInstallOutClosed_true,
  theorem productPathFreestandingCapableFullBarOrderedPipelineJoined_true,
  theorem productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake_true,
  theorem productPathFreestandingCapableFullBarCapableLakeFree_true,
  theorem productPathOwnershipRegeneratePartialReady_true,
  theorem productPathOwnershipRegenerateInstallLakeFree_true,
  theorem productPathOwnershipRegenerateReadLakeFree_true,
  theorem productPathOwnershipRegenerateReadPathClaimed_true,
  theorem productPathOwnershipRegenerateComposeLakeFree_true,
  theorem productPathOwnershipRegenerateComposePathClaimed_true,
  theorem productPathOwnershipRegenerateWriteHcLakeFree_true,
  theorem productPathOwnershipRegenerateWriteHcPathClaimed_true,
  theorem productPathOwnershipRegenerateLakeFreeJoinClaimed_true,
  theorem productPathOwnershipRegenerateProductPathAuthorityClaimed_true,
  theorem productPathOwnershipRegenerateWithoutLake_true,
  theorem productPathOwnershipRegenerateDependsOnLake_true,
  theorem productPathOwnershipRegenerateInstallPathClaimed_true,
  theorem productPathFreestandingPerformEvidenceClaimed_true,
  theorem productPathFreestandingPerformEvidencePartialReady_true,
  SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
  product path freestanding perform official path,
  productPathFreestandingPerformOfficialPathPartialReady,
  productPathFreestandingPerformOfficialPathGapMeasured,
  productPathOfficialPathStillUsesFreestandingEmit,
  productPathOfficialPathStillUsesLake,
  productPathOfficialPathRetireFreestandingEmitRequired,
  OfficialPath,
  theorem productPathFreestandingPerformOfficialPathGapMeasured_true,
  theorem productPathFreestandingPerformOfficialPathPartialReady_true,
  SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE,
  product path freestanding perform official path alternate,
  productPathFreestandingPerformOfficialPathAlternatePartialReady,
  productPathFreestandingPerformOfficialPathAlternateMeasured,
  productPathOfficialPathAlternateWriterPresent,
  productPathOfficialPathAlternateNotOfficial,
  productPathOfficialPathDualEqualityBlocksRetirement,
  OfficialPathAlternate,
  theorem productPathFreestandingPerformOfficialPathAlternateMeasured_true,
  theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true,
  SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY,
  product path freestanding perform dual equality write parity,
  productPathFreestandingPerformDualEqualityWriteParityPartialReady,
  productPathFreestandingPerformDualEqualityWriteParityMeasured,
  productPathDualEqualityWriteParityGapOpen,
  productPathCapableWriteStructuralNotDualEquality,
  DualEqWriteParity,
  theorem productPathFreestandingPerformDualEqualityWriteParityMeasured_true,
  theorem productPathFreestandingPerformDualEqualityWriteParityPartialReady_true,
  SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH,
  product path freestanding perform dual equality write close path,
  productPathFreestandingPerformDualEqualityWriteClosePathPartialReady,
  productPathFreestandingPerformDualEqualityWriteClosePathMeasured,
  productPathDualEqualityWriteClosePathNamed,
  productPathDualEqualityWriteClosePathNotGapClosed,
  DualEqWriteClosePath,
  theorem productPathFreestandingPerformDualEqualityWriteClosePathMeasured_true,
  theorem productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true,
  SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API,
  product path freestanding perform dual equality write api,
  productPathFreestandingPerformDualEqualityWriteApiPartialReady,
  productPathFreestandingPerformDualEqualityWriteApiMeasured,
  productPathDualEqualityWriteApiPresent,
  productPathDualEqualityWriteApiAuthorityNotEmit,
  productPathDualEqualityWriteApiNotOfficial,
  productPathDualEqualityWriteApiStepAdvanced,
  freestandingDualEqualityWriteFreestandingHc,
  DualEqWriteApi,
  theorem productPathFreestandingPerformDualEqualityWriteApiMeasured_true,
  theorem productPathFreestandingPerformDualEqualityWriteApiPartialReady_true,
  SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP,
  product path freestanding perform dual equality write capable gap,
  productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady,
  productPathFreestandingPerformDualEqualityWriteCapableGapMeasured,
  productPathDualEqualityWriteCapableGapClosed,
  productPathCapableWriteDualEqualityLive,
  productPathDualEqualityWriteCapableGapStepAdvanced,
  DualEqWriteCapableGap,
  theorem productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true,
  theorem productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true,
  UNIT_SURFACE host surface.
  Module: SystemsLean.SelfApplyFs
  Not freestanding residual free. Not PROVABLY. Not freestanding product
  self-host complete. Not freestanding emit residual free. Not llvm unlocked.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/
```
