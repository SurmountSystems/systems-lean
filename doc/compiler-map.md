# Compiler map (Systems Lean / Slake)

This file is the living compiler map. It tracks mill, occupancy, product
wire, and LLVM IR in one short ASCII place. Repo-root `TECH.md` is a host
persist dump of nested session rows (about 13k lines). That dump is not this
map. Do not fight persist. Token numbers live in
`/home/hunter/.agents/reports/l2-token-ledger.md`. Isolation is this
repository plus that local ledger path.

## Dependency tree

Work stays in this repository. Lake and mill compile run on **surmount-1**
(`ssh nixbuilder@surmount-1`, tree `/home/nixbuilder/iso`), not on
**horizon**. Parent does not wait mill or Lake. Completion is a host
notification.

```
Systems Lean (this repo)
|
+-- Host-tools mill  [implementer] mill-on-nixbuilder
|     Recipe: just N-host-tool
|     Step: lean then leanc. Never lake on that step.
|     Shared dir: build/first-host-tool/ on the nixbuilder tree
|     Now: 69 of 69 (WATCHER: slake-freestanding-self-host-complete ELF GREEN 4234640)
|     Leftover that cannot mill: none. Do not mill mill 69 again.
|
+-- Occupancy isolation Lake  exactly one [lake-coord] L2
|     Prove: lake build SystemsLean.OccupancyProbe
|     Threads: LEAN_NUM_THREADS=1 (fat prove; MemoryMax 192 GiB)
|     Names: 49. Compile-order rows: 164.
|     Named subset: 49 of about 206. Do not claim 50.
|     RealModule stays out. Do not fold ElabMeet as the prove.
|     FullHost stays false. Lake-gone stays unclaimed.
|
+-- Product wire (freestanding C)
|     just build writes emit and installs out/freestanding-c/
|     Lean-owned SSOT: src/systems/emit/host-owned-emit.md
|     Product residual free and self-host complete are already true.
|     Product path does not need Lake on the normal just build step.
|
+-- LLVM IR (Rust-compatible surface)
      out/llvm-ir/ plus llvm-* host tools already milled
      named fixture out/llvm-ir/trait-object-vtable.ll (Lean SSOT;
      HOST-TRAIT-OBJECT-FAT walk from host TraitObjectFat to dest .ll)
      llvmUnlocked is true. Full backend is false.
      Rust-native link stays deferred until self-host.
      This is not the C product wire and not CompCert PROVABLY.

Horizon (this laptop)
  _lake-if-pin skips lake unless hostname is surmount-1.
  Mill compile and occupancy Lake do not start here.
```

Mill Lean may use up to 16 threads when RSS is mill-class (about 1 GiB,
hundreds of GiB free). OccupancyProbe stays one thread because that prove
measured about 167 GiB. Two OccupancyProbe-class Leans still exceed
MemoryMax 192 GiB. Do not assume mill fills the builder without `free`,
Lean RSS, and `pgrep lean` / `pgrep lake` on nixbuilder.

## Tracking tables

Columns: Now / Goal / Blocked by / Next / Authority.

### Host tools without Lake

| Now | Goal | Blocked by | Next | Authority |
|-----|------|------------|------|-----------|
| **69 of 69**. Sixty-ninth row is `slake-freestanding-self-host-complete` / `SystemsLean.SelfHostCompleteMain`. ELF `/home/nixbuilder/iso/build/first-host-tool/slake-freestanding-self-host-complete` is 4234640 bytes (mtime 2026-09-13 04:54). Recipe `just sixty-ninth-host-tool` 0 extras is lean then leanc. FILE on the same just line as the helper. compile-inventory-exe GREEN and sixty-ninth-host-tool GREEN. SelfHostComplete is built. MultFsWrite stays built (mill 68 GREEN). HostModuleCheck stays built (mill 67 ELF GREEN; recipe EXIT 1 was helper file(1) PATH miss). ProductPathWriteHc stays built. DualEqWriteApi stays built. Independent mill extras waves already landed. | Every inventory `lean_exe` that is not a named skip builds without Lake on the step. Denominator stays **69** (`src/systems/lakefile.lean`). The mill fence is **69 of 69**. | There is no leftover inventory `lean_exe` that cannot mill honestly. Do not mill HostModuleCheck now (it is built). Do not mill MultFsWrite now (it is built). Do not mill SelfHostComplete now (it is built). Do not mill mill 69 again. Do not claim mill 67 recipe EXIT 0. | Operator Opens a two-target Name with a real test. Helper file(1) PATH miss stays documented residual. Occupancy extras stay done-for-now. Two-target emit program remains OPEN as a program banner. Do not mill HostModuleCheck now. Do not mill mill 69 again. | `src/systems/host-tools-inventory.md`; `WATCHER.md` mill fence; `RESIDUAL-systems.md` Sixty-ninth host tool without Lake |

### Occupancy named subset

| Now | Goal | Blocked by | Next | Authority |
|-----|------|------------|------|-----------|
| Occupancy **49 names / 164 compile-order rows**. Named subset **49 of about 206**. Last GREEN `/tmp/parityprogram-occupancy-accepts-20260908.log` (EXIT 0, jobs 8, walk 4.1 s, probe 1471 s). Isolation prove is `SystemsLean.OccupancyProbe`. Occupancy extras stay done-for-now. | Honest closed subset that OccupancyProbe typechecks. Not FullHost. Not seed-wide 206 in one prove. | Do not claim 50. Do not fold ElabMeet. RealModule stays out. MemoryMax 192 GiB. One niced Lake. | Keep one `[lake-coord]` standing funnel. Do not theater-rebuild OccupancyProbe when extras are empty. Extras-empty is not an exit. | `AGENTS.md` Lake host and niceness; occupancy living files OccupancyWalk / OccupancyProbe / OccupancyTheorems |

### FullHost

| Now | Goal | Blocked by | Next | Authority |
|-----|------|------------|------|-----------|
| **false**. `FullHostElaborateRemains` stays false. `slakeOwnsPackageTypecheck` stays false. Host elaborator residual free is claimed under free bar (a) and is not FullHost. | Whole-package typecheck remains unclaimed until a named residual with checkable Done when exists. | Do not flip FullHost from mill GREEN, occupancy GREEN, or inventory count. | Leave the pin false. | `RESIDUAL-systems.md` living tip; `AGENTS.md` Lake host and niceness |

### Lake-gone

| Now | Goal | Blocked by | Next | Authority |
|-----|------|------------|------|-----------|
| **Unclaimed.** Host free claimed is not Lake gone. Cold / diagnostic Lake may still elaborate. Horizon skip is not Lake gone. | Do not claim Lake is gone while Lake still typechecks imported modules, builds remaining host tools, or proves occupancy. | Honesty. Product StillUsesLake / DependsOnLake are already false on the product path. That is not Lake gone. | Do not forge the claim. | `RESIDUAL-systems.md`; `AGENTS.md` Finish line; `src/systems/README.md` living tip |

### LLVM IR / Rust-compatible surface

| Now | Goal | Blocked by | Next | Authority |
|-----|------|------------|------|-----------|
| LLVM IR is the Rust-compatible surface. `llvmUnlocked` is true. Partial unit SSA and text writers exist under `out/llvm-ir/` and milled `slake-llvm-*` tools. Named trait-object vtable fixture: `out/llvm-ir/trait-object-vtable.ll` (Lean SSOT `SystemsLean.TraitObjectVtable`; printer walks host `TraitObjectFat` plus ordered slots (`HOST-TRAIT-OBJECT-FAT`) from host value to dest `.ll`; first pin fat ScalarPair plus header drop/size/align; second pin slot 3 Method plus rustc_abi pointer (method0 offset 24); fifth pin slot 4 Method plus rustc_abi pointer (method1 offset 32); sixth pin slot 5 Method plus rustc_abi pointer (method2 offset 40); seventh pin slot 6 Method plus rustc_abi pointer (method3 offset 48); eighth pin slot 7 Method plus rustc_abi pointer (method4 offset 56); ninth pin slot 8 Method plus rustc_abi pointer (method5 offset 64); tenth pin slot 9 Method plus rustc_abi pointer (method6 offset 72); eleventh pin slot 10 Method plus rustc_abi pointer (method7 offset 80); twelfth pin slot 11 Method plus rustc_abi pointer (method8 offset 88); thirteenth pin slot 12 Method plus rustc_abi pointer (method9 offset 96); fourteenth pin slot 13 Method plus rustc_abi pointer (method10 offset 104); fifteenth pin slot 14 Method plus rustc_abi pointer (method11 offset 112); sixteenth pin slot 15 Method plus rustc_abi pointer (method12 offset 120); seventeenth pin slot 16 Method plus rustc_abi pointer (method13 offset 128); eighteenth pin slot 17 Method plus rustc_abi pointer (method14 offset 136); nineteenth pin slot 18 Method plus rustc_abi pointer (method15 offset 144); twentieth pin slot 19 Method plus rustc_abi pointer (method16 offset 152); twenty-first pin slot 20 Method plus rustc_abi pointer (method17 offset 160); twenty-second pin slot 21 Method plus rustc_abi pointer (method18 offset 168); twenty-third pin slot 22 Method plus rustc_abi pointer (method19 offset 176); twenty-fourth pin slot 23 Method plus rustc_abi pointer (method20 offset 184); twenty-fifth pin slot 24 Method plus rustc_abi pointer (method21 offset 192); twenty-sixth pin slot 25 Method plus rustc_abi pointer (method22 offset 200); twenty-seventh pin slot 26 Method plus rustc_abi pointer (method23 offset 208); twenty-eighth pin slot 27 Method plus rustc_abi pointer (method24 offset 216); twenty-ninth pin slot 28 Method plus rustc_abi pointer (method25 offset 224); thirtieth pin slot 29 Method plus rustc_abi pointer (method26 offset 232); thirty-first pin slot 30 Method plus rustc_abi pointer (method27 offset 240); thirty-second pin slot 31 Method plus rustc_abi pointer (method28 offset 248); thirty-third pin slot 32 Method plus rustc_abi pointer (method29 offset 256); thirty-fourth pin slot 33 Method plus rustc_abi pointer (method30 offset 264); thirty-fifth pin slot 34 Method plus rustc_abi pointer (method31 offset 272); thirty-sixth pin slot 35 Method plus rustc_abi pointer (method32 offset 280); thirty-seventh pin slot 36 Method plus rustc_abi pointer (method33 offset 288); thirty-eighth pin slot 37 Method plus rustc_abi pointer (method34 offset 296); thirty-ninth pin slot 38 Method plus rustc_abi pointer (method35 offset 304); fortieth pin slot 39 Method plus rustc_abi pointer (method36 offset 312); 128 Methods (method0 through method127); method127 slot 130 offset 1040; slot 131 Vacant plus rustc_abi pointer (offset 1048); slot 132 TraitVPtr plus rustc_abi pointer (offset 1056); 133 slots / 1064 bytes / align 8; fourth-pin Vacant-at-slot-4 is history only). Full backend stays false. Occupancy stays 49. Mill stays 69 of 69. Rust-native link is deferred. | Keep LLVM IR as the layout-compatible surface for a later Rust link. Do not sell it as full backend or as the C product wire. | Self-host finish line and FullBackend bar. Not CompCert PROVABLY. Not `out/freestanding-c`. | Do not open deferred LLVM as residual progress before self-host unless a named Open residual already requires it. | `RESIDUAL-systems.md` llvm pin; `doc/goals.md`; `out/llvm-ir/` |

### Leftover mill skips

| Now | Goal | Blocked by | Next | Authority |
|-----|------|------------|------|-----------|
| DualEqWriteApi is **built** (mill 65 GREEN). ProductPathWriteHc is **built** (mill 66 GREEN). HostModuleCheck is **built** (mill 67 ELF GREEN; recipe EXIT 1 was helper file(1) PATH miss). MultFsWrite is **built** (mill 68 GREEN). SelfHostComplete is **built** (mill 69 ELF GREEN). Inventory leftover table lists those built rows so nobody remills them. There is no leftover that cannot mill honestly. | Do not mill HostModuleCheck now (it is built). Do not mill MultFsWrite now (it is built). Do not mill SelfHostComplete now (it is built). Do not mill mill 69 again. | Operator mill fence. Mill fence is **69 of 69**. Helper file(1) PATH miss is sibling residual. | Operator Opens a two-target Name with a real test. Inventory lists built do-not-mill rows among the 69. Do not mill mill 69 again. | `WATCHER.md` mill fence; `RESIDUAL-systems.md` Sixty-ninth close; lakefile names in `src/systems/host-tools-inventory.md` |

Lake executable names (inventory):

- DualEqWriteApi (built): `slake-freestanding-perform-dual-equality-write-api` / `SystemsLean.DualEqWriteApiMain`
- ProductPathWriteHc (built): `slake-write-freestanding-hc` / `SystemsLean.ProductPathWriteHcMain`
- HostModuleCheck (built): `slake-host-module-check` / `SystemsLean.HostModuleCheckMain`
- SelfHostComplete (built): `slake-freestanding-self-host-complete` / `SystemsLean.SelfHostCompleteMain`
- MultFsWrite (built): `slake-mult-fs-write` / `SystemsLean.MultFsWriteMain`

`slake-mult-fs-write-tool` is a different row and is already milled. Do not
confuse it with the MultFsWrite mill-68 row.

### Product wire / freestanding C

| Now | Goal | Blocked by | Next | Authority |
|-----|------|------------|------|-----------|
| Product residual free is true. Freestanding product self-host complete is true. `just build` writes Lean-owned emit and installs `out/freestanding-c/`. No product garbage collection. No Lean managed runtime on that wire. PROVABLY is CompCert product matrix, not speed. | Keep generated product wire honest. Do not hand-author product C. Two-target emit program remains OPEN as a program banner. | Two-target emit is the living Open product residual, not mill leftovers, and not a next checkable implement Name until the operator Opens one. | Do not grow hand-written C. Do not invent a next two-target Name. Ownership changes land in the emit SSOT first. | `src/systems/emit/host-owned-emit.md`; `just build`; `out/freestanding-c/README.md` |

### Token ledger

| Now | Goal | Blocked by | Next | Authority |
|-----|------|------------|------|-----------|
| Living ledger is `/home/hunter/.agents/reports/l2-token-ledger.md` (copied from `l2-tokens-mill-wave.md`). Session usage counts are not included SuperGrok period limits, not SuperGrok dollar credits, and not console team prepaid. Do not invent token numbers. Mill 63 fire has no finished token row in that file. | Append later mill / occupancy / coordinator rows to that ledger. Keep this map free of token tables. | Host persist overwrites `TECH.md`. Do not put the ledger in `TECH.md`. | Point new L2 closeouts at the ledger path. | `/home/hunter/.agents/reports/l2-token-ledger.md` |

## Pointers (do not wipe WATCHER)

These living files remain themselves. This map points at them. It does not
replace residual Open/Done or the mill fence.

| Path | Role |
|------|------|
| Root `README.md` living tip | User-facing product claims (free, complete, PROVABLY, host tools without Lake, LLVM partial). Living tip names `doc/compiler-map.md` as the compiler map, not `TECH.md`. |
| `doc/SESSION-HANDOFF.md` | Reseed after compaction. Occupancy 49 / 164. Named subset 49 of about 206. One `[lake-coord]`. |
| `AGENTS.md` | Policy. One sentence: mill is `just N-host-tool` lean then leanc on nixbuilder; occupancy prove is `SystemsLean.OccupancyProbe`; never claim 50, FullHost, or Lake-gone. |
| `RESIDUAL.md` | Coordinator Open/Done join board. Not the mill fence. |
| `WATCHER.md` mill fence | Mill next-action fence. Do not wipe. Sixty-ninth is GREEN. SelfHostComplete is built. MultFsWrite is built. HostModuleCheck is built. ProductPathWriteHc is built. DualEqWriteApi is built. No mill leftover remains that cannot mill honestly. Occupancy stays 49. |
| `RESIDUAL-systems.md` | Systems Open/Done and claim flags. |

## Authority paths

| Path | What it owns |
|------|----------------|
| `AGENTS.md` section **Lake host and niceness** (and Session parallelism) | One `[lake-coord]`; mill on nixbuilder; OccupancyProbe; MemoryMax 192 GiB; fire-and-return; never Lake on horizon |
| `RESIDUAL-systems.md` | Claim flags, Open queue, mill Names done, leftover skips |
| `src/systems/host-tools-inventory.md` | Denominator 69 and the named `lean_exe` list; living metric 69 of 69 |
| `src/systems/emit/host-owned-emit.md` | Freestanding C ownership SSOT |
| `WATCHER.md` | Mill next-action fence only |
| `/home/hunter/.agents/reports/l2-token-ledger.md` | Nested L2 token rows |

## Honesty (do not forge)

- Host tools without Lake: **69 of 69**. DualEqWriteApi is built. ProductPathWriteHc is built. HostModuleCheck is built (ELF GREEN; recipe EXIT 1 was helper file(1) PATH miss). MultFsWrite is built (mill 68 GREEN). SelfHostComplete is built (mill 69 GREEN). Do not mill mill 69 again.
- Occupancy: **49 / 164** compile-order rows. Named subset **49 of about 206**.
- FullHost is **false**.
- Lake-gone is **unclaimed**.
- LLVM IR is the Rust-compatible surface, not a full backend and not the C wire.
- Remaining mill leftover that cannot mill honestly: none. HostModuleCheck is built. ProductPathWriteHc is built. MultFsWrite is built. SelfHostComplete is built.
- Isolation: this repo, plus `~/.agents/reports` for the ledger only.
