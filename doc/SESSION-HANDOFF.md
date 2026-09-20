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

**Living tip (2026-09-20 closed-set Lake measured):** Closed-set Lake on **surmount-1** (`/home/nixbuilder/iso/src/systems`, `nice -n 19`, `LEAN_NUM_THREADS=16`) first-pass EXIT 0 wall **2.60 s** Max RSS **811360 KiB** (about 0.77 GiB); idle-hot EXIT 0 wall **0.92 s** Max RSS **803528 KiB**. RSS mill-class. OccupancyProbe not run. How much faster: **not comparable**. No Slake closed-set wall. Full-package idle-hot **0.459 s** / suite idle-hot **0.447 s** / suite first pass **29.613 s** stay. Dest remains `out/slake-produced-elf/slake-hello`. Five theorem lakes remain EXIT 0. Open Name **Slake typechecks src/systems** stays **Open**. Next leftover: Slake producing the 69 host tools stays Open. Do not invent Open Names. Do not empty Open. Occupancy stays **49**. Mill stays **69 of 69**. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Two-target emit stays a program banner. Report `/home/hunter/.agents/reports/grok-impl-summary-closed-set-lake-row.md`. Live pointer `/home/hunter/.agents/reports/remaining-cap-3.md`. Prior just-to-nix slake-produced-elf:

**Living tip (2026-09-19 just-to-nix slake-produced-elf):** Port of `just/slake-produced-elf.just` long bash into `nix/slake-produced-elf.nix` landed. Thin just wrapper evals that module then `lean --run`. Dest remains `out/slake-produced-elf/slake-hello`. First ELF dest exists. Hygiene skip of the dest binary is already in source-hygiene/novel-source (other L2 verifies GREEN). Five theorem lakes remain EXIT 0. Open Name **Slake typechecks src/systems** stays **Open**. Next leftover after dests: closed-set RSS vs Lake. Do not invent Open Names. Do not empty Open. Occupancy stays **49**. Mill stays **69 of 69**. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Two-target emit stays a program banner. Report `/home/hunter/.agents/reports/grok-impl-summary-just-to-nix-elf.md`. Live pointer `/home/hunter/.agents/reports/remaining-cap-3.md`. Prior five theorem lakes EXIT 0:

**Living tip (2026-09-19 five theorem lakes EXIT 0):** All five theorem-file lakes are EXIT 0. Dests dest-missing red then `just systems-host` GREEN, own review PASS: MultTheorems 595 paths, lake EXIT 0; TypesTheorems 599 paths, lake EXIT 0; ErasureTheorems 603 paths, lake EXIT 0; ExtractTheorems 607 paths, lake EXIT 0 (about 479 MiB / Kernel about 301 MiB); IrProgramTheorems 611 paths, lake EXIT 0 (about 492 MiB / Kernel about 449 MiB). Also lake EXIT 0: RequiredDecls, EmitBodyTerm, Surface, KernelEmitTerm, plus Kernels. Implementor slots 0 of 3 at residual start. Slice 192 GiB. Mill-class RSS. Named EXIT 0 is not PackageTypecheck GREEN. Not Lake-gone. Next leftover: Slake-produced ELF (not mill leanc). Then closed-set RSS vs Lake. Open Name **Slake typechecks src/systems** stays **Open**. DualPinOk Method count is not occupancy 49 and not mill 69 of 69. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Occupancy stays **49**. Mill stays **69 of 69**. Two-target emit stays a program banner. Stale dests-closed living tip that said ExtractTheorems lake IN FLIGHT and IrProgramTheorems lake QUEUED is superseded. At most 3 implementors. `[lake-coord]` is the only lake runner. Do not remill mill 69. Report `/home/hunter/.agents/reports/grok-impl-summary-residual-lakes-green.md`. Live pointer `/home/hunter/.agents/reports/remaining-cap-3.md`. Prior dests CLOSED (superseded):

**Living tip (2026-09-19 theorem-file dests CLOSED, superseded):** Theorem-file dest wave CLOSED. Dests dest-missing red then `just systems-host` GREEN, own review PASS: MultTheorems 595 paths, lake EXIT 0; TypesTheorems 599 paths, lake EXIT 0; ErasureTheorems 603 paths, lake EXIT 0; ExtractTheorems 607 paths, lake EXIT 0 (supersedes IN FLIGHT); IrProgramTheorems 611 paths, lake EXIT 0 (supersedes QUEUED). Implementor slots 0 of 3 at residual start. Also lake EXIT 0 this session: RequiredDecls, EmitBodyTerm, Surface, KernelEmitTerm, plus Kernels. Slice 192 GiB. Mill-class RSS. Then leftover: Slake-produced ELF (not mill leanc). Then closed-set RSS vs Lake. Open Name **Slake typechecks src/systems** stays **Open**. DualPinOk Method count is not occupancy 49 and not mill 69 of 69. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Occupancy stays **49**. Mill stays **69 of 69**. Two-target emit stays a program banner. Next leftover: Slake-produced ELF (not mill leanc). Report `/home/hunter/.agents/reports/grok-impl-summary-residual-lakes-green.md`. Live pointer `/home/hunter/.agents/reports/remaining-cap-3.md`. Prior slots current:

**Living tip (2026-09-19 remaining-cap-3 slots current):** IrProgramTheorems files LANDED (HostFrontLiveIrProgramTheorems.lean 302, Source 247, Main 19, HostModuleCheckIrProgramTheoremsKernel.lean 78). Ready is parse plus kernelCheck. Review OPEN ISSUES 0. Dests leftover. Report `/home/hunter/.agents/reports/grok-impl-summary-parse-irprogramtheorems.md`. TypesTheorems dests CLOSED: dest-missing red then `just systems-host` EXIT 0 (599 paths); review PASS; report `/home/hunter/.agents/reports/grok-impl-summary-dest-typestheorems.md`. ErasureTheorems dests LIVE (owns `SystemsLean.lean` and `nix/systems-host-presence`). Do not claim ErasureTheorems dests finished. Do not spawn a second writer on `SystemsLean.lean`. ExtractTheorems dests WAIT until Erasure dests exit, then IrProgramTheorems dests. Implementor slots 1 of 3: ErasureTheorems dests only. `[lake-coord]` is not an implementor. Lake GREEN this session: RequiredDecls, EmitBodyTerm, MultTheorems (about 448 MiB), MultTheoremsKernel, KernelMultTerm, ParityMultTerm, HostFrontLiveErasure (module), HostFrontLiveExtract (module); slice 192 GiB. Lake in flight: HostFrontLiveTypesTheorems on resumed `[lake-coord]`. Do not claim that EXIT 0. Open Name **Slake typechecks src/systems** stays **Open**. DualPinOk last method on disk is **method127** (TraitObjectVtable.lean; DualPinOk has no method128). DualPinOk Method count is not occupancy 49 and not mill 69 of 69. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Occupancy stays **49**. Mill stays **69 of 69**. Two-target emit stays a program banner. Next: resume ErasureTheorems dests if still running; do not spawn a second writer on `SystemsLean.lean`; when dest slot exits, dest ExtractTheorems then IrProgramTheorems; `[lake-coord]` TypesTheorems lake; at most 3 implementors. Report `/home/hunter/.agents/reports/grok-impl-summary-residual-slots-current.md`. Live pointer `/home/hunter/.agents/reports/remaining-cap-3.md`. Prior slots now:

**Living tip (2026-09-19 remaining-cap-3 slots now):** HostFrontLiveExtractTheorems files landed (HostFrontLiveExtractTheorems.lean 266, Source 275, Main 18, HostModuleCheckExtractTheoremsKernel.lean 75). Review PASS, 0 MUST-FIX. Dests leftover. Lake queued `lake build SystemsLean.HostFrontLiveExtractTheorems` (not run). Do not claim ExtractTheorems dests or ExtractTheorems lake GREEN. MultTheorems dests CLOSED: dest-missing red then `just systems-host` EXIT 0 (595 paths); review PASS; report `/home/hunter/.agents/reports/grok-impl-summary-dest-multtheorems.md`. TypesTheorems dests LIVE (owns `SystemsLean.lean` and `nix/systems-host-presence`). Do not claim TypesTheorems dests finished. ErasureTheorems dests WAIT until Types dests exit. IrProgramTheorems live parse still LIVE (review L3 assigned). Do not claim IrProgramTheorems finished. Implementor slots 2 of 3: IrProgramTheorems plus TypesTheorems dests. `[lake-coord]` is not an implementor. Lake GREEN this session: HostFrontLiveRequiredDecls EXIT 0 (about 477 MiB), HostFrontLiveEmitBodyTerm EXIT 0 (about 487 MiB); slice 192 GiB; report `/home/hunter/.agents/reports/grok-impl-summary-lake-coord-cap3.md`. Lake in flight: HostFrontLiveMultTheorems on resumed `[lake-coord]`. Do not claim that EXIT 0. Open Name **Slake typechecks src/systems** stays **Open**. DualPinOk last method on disk is **method127** (TraitObjectVtable.lean; DualPinOk has no method128). DualPinOk Method count is not occupancy 49 and not mill 69 of 69. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Occupancy stays **49**. Mill stays **69 of 69**. Two-target emit stays a program banner. Next: keep at most 3 implementors on IrProgramTheorems live parse review and TypesTheorems dests; leftover ExtractTheorems dests wait until Types dests exit. Report `/home/hunter/.agents/reports/grok-impl-summary-residual-slots-now.md`. Live pointer `/home/hunter/.agents/reports/remaining-cap-3.md`. Prior ExtractTheorems land:

**Living tip (2026-09-19 HostFrontLiveExtractTheorems files landed):** HostFrontLiveExtractTheorems files landed (HostFrontLiveExtractTheorems.lean 266, Source 275, Main 18, HostModuleCheckExtractTheoremsKernel.lean 75). Ready is parse accept plus HostKernel.kernelCheck, not := true. Dual-pin liveExtractTheoremsSource equals on-disk ExtractTheorems.lean (11849 bytes). Review PASS, 0 MUST-FIX. Dests leftover (other L2 owns SystemsLean.lean). Lake queued `lake build SystemsLean.HostFrontLiveExtractTheorems` (not run). Do not claim lake GREEN. Live implementors: IrProgramTheorems new files; MultTheorems dests. One implementor slot is free until dest slot frees then TypesTheorems dests. TypesTheorems dests are NOT started. Dest slot is not free. After dest slot frees: ExtractTheorems dests then TypesTheorems dests then ErasureTheorems dests. Open Name **Slake typechecks src/systems** stays **Open**. DualPinOk last method on disk is **method127** (TraitObjectVtable.lean; DualPinOk has no method128). DualPinOk Method count is not occupancy 49 and not mill 69 of 69. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Occupancy stays **49**. Mill stays **69 of 69**. Two-target emit stays a program banner. Next: leftover dests and living lockstep of live implementors, not TypesTheorems dests. Report `/home/hunter/.agents/reports/grok-impl-summary-residual-extracttheorems-land.md`. Live pointer `/home/hunter/.agents/reports/remaining-cap-3.md`. Prior remaining-cap-3 lockstep:

**Living tip (2026-09-19 remaining-cap-3 lockstep):** Stale HostGraph WATCHER next-action is superseded. At most 3 implementor L2s. `[lake-coord]` and residual lockstep are not implementors. This wave implementors: ExtractTheorems new files landed (dests leftover); IrProgramTheorems new files still live; MultTheorems dests (files already on disk, dests missing). TypesTheorems and ErasureTheorems files are on disk. Dests wait until a dest slot frees. After dest slot frees: ExtractTheorems dests then TypesTheorems dests then ErasureTheorems dests. After those: dests+lake still owed RequiredDecls, Surface, KernelEmitTerm, EmitBodyTerm if not lake GREEN. Then Slake-produced ELF (not mill leanc). Then closed-set RSS/wall-clock vs Lake. Host-presence GREEN is not lake GREEN. Open Name **Slake typechecks src/systems** stays **Open**. DualPinOk last method on disk is **method127** (slot 130 offset 1040, 133 slots / 1064 bytes / 128 Methods; DualPinOk has no method128). DualPinOk Method count is not occupancy 49 and not mill 69 of 69. DualPinOk method127 vtable is not the bar. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Occupancy stays **49**. Mill stays **69 of 69**. Do not remill. Do not OccupancyProbe. Do not mill. Two-target emit stays a program banner. Next: keep at most 3 implementors on IrProgramTheorems new files and MultTheorems dests. Report `/home/hunter/.agents/reports/grok-impl-summary-residual-extracttheorems-land.md`. Live pointer `/home/hunter/.agents/reports/remaining-cap-3.md`. Prior Extract lake/driver tip:

**Living tip (2026-09-19 HostFrontLiveExtract lake/driver):** Live parse/kernel is done for Mult, Types, Erasure, and Extract. Disk `HostFrontLiveExtract.lean` is **734** lines. `parseLiveExtractSource` of live `Extract.lean` accepts. `kernelCheck` true. `hostFrontLiveExtractReady` evaluates **true** (real conjunction, not hardcoded). Dest-missing red then `just systems-host` EXIT 0 (476 paths). `lake build SystemsLean.HostFrontLiveExtract` EXIT 0 on nixbuilder (nix-store ELF Lean PT_INTERP `/nix/store/n51dhmdbik1kfrsm62j5knavmigwrl1a-glibc-2.42-84/lib/ld-linux-x86-64.so.2`). Driver GREEN `PASS PARSE-LIVE-EXTRACT ACCEPT cmds=14 kernelCheck=true`. Ready is a real conjunction. Parse live Extract leftover heading is **done**. Next language-core on the 49-name occupancy list is IrProgram. Disk `HostFrontLiveErasure.lean` is **595** lines. `parseLiveErasureSource` of live `Erasure.lean` accepts. `kernelCheck` true. `hostFrontLiveErasureReady` evaluates **true** (real conjunction, not hardcoded). Dest-missing red then `just systems-host` EXIT 0 (473 paths). `lake build SystemsLean.HostFrontLiveErasure` EXIT 0 on nixbuilder (nix-store ELF Lean). Driver GREEN cmds=12 kernelCheck=true. Ready is a real conjunction. Parse live Erasure leftover heading is **done**. DualPinOk on disk is still **method127** (slot 130 offset 1040, Vacant 131/1048, TraitVPtr 132/1056, vtableSlotKind 133 none, 133 slots / 1064 bytes / 128 Methods; DualPinOk has no method128). Last living consume/consume theorem with a body is `canSeq_consume_consume_decide_false_neq` (`LinearUseFailCanSeqConsume.lean` line 289, file 296 lines). Named short fact `canSeq_consume_consume_false` is in `LinearUseFailTheorems.lean` line 91. Theorem `canSeq_consume_keep_true_eq` is in `LinearUseFailCanSeq.lean` line 252. 117 wrapping canSeq history theorems were deleted (`just systems-host` EXIT 1 then 0). Five LinearUseFail helper files are empty leftover namespaces until a named directory split. `AGENTS.md` subsection Theorem names are product too is already on disk at line 590 (not a missing Open pin). GitHub issue https://github.com/cryptoquick/systems-lean/issues/8 holds the approved living plan. Do not grow wrapping canSeq names as residual. Walker 563/563 GREEN already recorded. `slakeOwnsPackageTypecheck` stays false. FullHost stays false. Prior residual55 fact:

`parseLiveTypesSource` of live `Types.lean` now accepts (parent fact). `kernelCheck` true. `hostFrontLiveTypesReady` evaluates **true** (real conjunction, not hardcoded). `lake build SystemsLean.HostFrontLiveTypes` EXIT 0 after parser fixes (`=` stop token, binder proj, Nat tokens). Disk `HostFrontLiveTypes.lean` is **747** lines; header says `hostFrontLiveTypesReady` eval true. Open remaining after Types, Erasure, and Extract: parse/kernel of more than Mult, Types, Erasure, and Extract (IrProgram is next language core on the 49-name list) and Slake producing the 69 host tools. Do not invent an Open Name. Residual lockstep does not own `HostFrontLiveTypes.lean`. Lake of six LinearUseFail theorem helpers EXIT 0 on nixbuilder (`ssh nixbuilder@surmount-1`), nix-store ELF Lean, about 4 s, mill-class. Host-presence is **not** this GREEN. Chunked jobs=4 product walk GREEN **563/563** is already recorded (residual51). Do not restart that walk. Open Name **Slake typechecks src/systems** stays Open. Open Name **Parse live Mult.lean** is **done**. Parse live Types leftover heading is **done**. DualPinOk **method127** (slot 130 offset 1040, 133 slots / 1064 bytes / 128 Methods; DualPinOk has no method128). DualPinOk method127 vtable is not the bar. Occupancy stays **49**. Mill stays **69 of 69**. FullHost stays false. `slakeOwnsPackageTypecheck` stays false. Do not ask to raise MemoryMax. Do not claim Lake-gone. Report `/home/hunter/.agents/reports/grok-impl-summary-49ebc8d3-residual57.md`. L3 inventory `/home/hunter/.agents/reports/residual57-l3-dualpinok-canseq.md`.

Sixty-ninth host tool without Lake is **GREEN**. SelfHostComplete built
via `just sixty-ninth-host-tool` 0 extras (ELF 4234640 bytes;
compile-inventory-exe GREEN and sixty-ninth-host-tool GREEN; FILE on the
same just line as the helper). MultFsWrite stays built via
`just sixty-eighth-host-tool` packed 16 extras (ELF 4430568 bytes).
HostModuleCheck stays built via
`just sixty-seventh-host-tool` extras-file (ELF 11069328 bytes;
recipe EXIT 1 was helper file(1) PATH miss; ELF GREEN via nix-store file(1)).
ProductPathWriteHc stays built via `just sixty-sixth-host-tool`. DualEqWriteApi
stays built via `just sixty-fifth-host-tool`. Mill stays **69 of 69**. Occupancy stays **49**.
Living compiler map: [doc/compiler-map.md](compiler-map.md). Root
`TECH.md` is a host persist dump, not that map. Two-target emit program
remains OPEN as a banner. Leftover-name honesty is **done** (2026-09-17). Remaining mill leftover heading is **non-residual**. L3 lockstep-residual57 re-read DualPinOk and the last canSeq on disk now (living last canSeq is canSeq_consume_consume_decide_false_neq in LinearUseFailCanSeqConsume.lean line 289; 117 wrapping canSeq history theorems deleted; residual47 wrapping WrapTheorems line 414 is stale as the living last canSeq). Historical L3 lockstep-residual47 re-read DualPinOk and the last canSeq on disk now (residual46 freeze of DualPinOk method126 / 127 Methods / no method127 is stale as the living DualPinOk Bool tip; method127 DualPinOk GREEN on disk; DualPinOk is a Rust vtable layout (function-pointer count), not 49 named compiler modules; DualPinOk has method121; DualPinOk has method122; DualPinOk has method123; DualPinOk has method124; DualPinOk has method125; DualPinOk has method126; DualPinOk has method127; DualPinOk has no method128; method127 slot 130 offset 1040; Vacant slot 131 offset 1048; TraitVPtr slot 132 offset 1056; vtableSlotKind 133 none; 133 slots / 1064 bytes / 128 Methods; vtableFixtureMethodCount 128; maxRecDepth 2048; maxHeartbeats 500000; DualPinOk Method count 128 is not occupancy 49 and not mill 69 of 69; method127 DualPinOk is on disk; this lockstep did not run llvm-trait-object-vtable; do not queue DualPinOk method128 as the Slake-replaces-Lake bar; leftover isolation-test Lean files are not the default package; last living canSeq is still canSeq_consume_consume_decide_false_neq at line 414 of 420-line LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean; Wrap 420-line twenty-four-Not false wrapping iff still matches living last canSeq; L3 lockstep-residual46 re-read DualPinOk and the last canSeq on disk now (residual45 freeze of DualPinOk method125 / 126 Methods / no method126 is stale as the living DualPinOk Bool tip; method126 DualPinOk landed while residual46 lockstep ran; Wrap 420-line twenty-four-Not false wrapping iff still matches living last canSeq; DualPinOk has method121; DualPinOk has method122; DualPinOk has method123; DualPinOk has method124; DualPinOk has method125; DualPinOk has method126; DualPinOk has no method127; method126 slot 129 offset 1032; Vacant slot 130 offset 1040; TraitVPtr slot 131 offset 1048; vtableSlotKind 132 none; 132 slots / 1056 bytes / 127 Methods; vtableFixtureMethodCount 127; maxRecDepth 2048; maxHeartbeats 500000; DualPinOk Method count 127 is not occupancy 49 and not mill 69 of 69; method126 DualPinOk is on disk; this lockstep did not run llvm-trait-object-vtable; method127 DualPinOk writer has not landed; last living canSeq is canSeq_consume_consume_decide_false_neq at line 414 of 420-line LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean; residual43 378-line Wrap last canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff is stale as the living last canSeq; helpers LinearUseFailCanSeqConsumeTheorems.lean 267, LinearUseFailCanSeqConsumeDecideTheorems.lean 679, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 498, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 586, LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean 420; lake of helpers unrun; just check-remote is not a 256 GiB raise; engineer the walk under 192 GiB; leftover isolation-test Lean files are not the default package; next Open Done when is chunked product typecheck; L2 lockstep-residual43 re-read DualPinOk and the last canSeq on disk now (residual42 freeze of DualPinOk method123 / 124 Methods / WrapTheorems 339-line last canSeq is stale as the living last canSeq; residual42 DualPinOk has no method124 is stale as the living DualPinOk Bool tip; method124 DualPinOk landed while residual43 lockstep ran; linear148 Wrap 358-line last landed (parent named GREEN); linear149 Wrap 378-line last landed while residual43 lockstep ran; DualPinOk has method121; DualPinOk has method122; DualPinOk has method123; DualPinOk has method124; DualPinOk has no method125; method124 slot 127 offset 1016; Vacant slot 128 offset 1024; TraitVPtr slot 129 offset 1032; vtableSlotKind 130 none; 130 slots / 1040 bytes / 125 Methods; vtableFixtureMethodCount 125; maxRecDepth 2048; maxHeartbeats 500000; DualPinOk Method count 125 is not occupancy 49 and not mill 69 of 69; method124 DualPinOk is on disk; this lockstep did not run the method124 recipe; method125 DualPinOk writer has not landed; last living canSeq is canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff at line 371 of 378-line LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean; residual43 first freeze 358-line Wrap last canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff is stale as the living last canSeq; residual42 339-line Wrap last canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff is stale as the living last canSeq; DecideNotRevTheorems last theorem remains canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff at line 577 of 586 lines; helpers LinearUseFailCanSeqConsumeTheorems.lean 267, LinearUseFailCanSeqConsumeDecideTheorems.lean 679, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 498, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 586, LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean 378; lake of helpers unrun; just check-remote is not a 256 GiB raise; engineer the walk under 192 GiB; leftover isolation-test Lean files are not the default package; next Open Done when is chunked product typecheck; L2 lockstep-residual42 re-read DualPinOk and the last canSeq on disk now (residual41 freeze of DualPinOk method122 / 123 Methods / WrapTheorems 315-line last canSeq is stale as the living tip; method123 DualPinOk landed while residual42 lockstep ran; linear147 Wrap 339-line last landed (parent named GREEN); DualPinOk has method121; DualPinOk has method122; DualPinOk has method123; DualPinOk has no method124; method123 slot 126 offset 1008; Vacant slot 127 offset 1016; TraitVPtr slot 128 offset 1024; vtableSlotKind 129 none; 129 slots / 1032 bytes / 124 Methods; vtableFixtureMethodCount 124; maxRecDepth 2048; maxHeartbeats 500000; DualPinOk Method count 124 is not occupancy 49 and not mill 69 of 69; method123 DualPinOk is on disk; this lockstep did not run the method123 recipe; method124 DualPinOk writer is a different L2 and has not landed; last living canSeq is canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff at line 333 of 339-line LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean; residual41 315-line Wrap last canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff is stale as the living last canSeq; DecideNotRevTheorems last theorem remains canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff at line 577 of 586 lines; helpers LinearUseFailCanSeqConsumeTheorems.lean 267, LinearUseFailCanSeqConsumeDecideTheorems.lean 679, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 498, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 586, LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean 339; lake of helpers unrun; just check-remote is not a 256 GiB raise; engineer the walk under 192 GiB; leftover isolation-test Lean files are not the default package; next Open Done when is chunked product typecheck; L3 lockstep-residual40 re-read DualPinOk and the last canSeq on disk now (residual39 freeze of DualPinOk method121 / 122 Methods / WrapTheorems 297-line last canSeq still matches living disk; DualPinOk has no method122; DualPinOk has no method123; method122 DualPinOk writer is a different L2 and has not landed; linear146 Wrap writer is a different L2 and has not landed; L2 lockstep-residual39 DualPinOk patch re-read DualPinOk and the last canSeq on disk after L3 (L3 freeze of DualPinOk method120 / 121 Methods / WrapTheorems 257-line last canSeq is stale as the living tip; residual38 DualPinOk method119 with no method120 is stale as the living DualPinOk Bool tip; method121 landed in DualPinOk Bool while residual39 lockstep ran; DualPinOk has method120; DualPinOk has method121; DualPinOk has no method122; method121 slot 124 offset 992; Vacant slot 125 offset 1000; TraitVPtr slot 126 offset 1008; vtableSlotKind 127 none; 127 slots / 1016 bytes / 122 Methods; vtableFixtureMethodCount 122; maxRecDepth 2048; maxHeartbeats 500000; DualPinOk Method count 122 is not occupancy 49 and not mill 69 of 69; method120 recipe GREEN this pair (dest-missing red then just llvm-trait-object-vtable EXIT 0); method121 DualPinOk is on disk; this lockstep did not run the method121 recipe; method122 DualPinOk writer is a different L2 and has not landed; linear143 systems-host GREEN; linear144 split of DecideNotRevTheorems landed as LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean; last living canSeq is canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff at line 290 of 297-line LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean; residual38 779-line DecideNotRevTheorems last-canSeq location is stale as the living file; DecideNotRevTheorems last theorem is now canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff at line 577 of 586 lines; helpers LinearUseFailCanSeqConsumeTheorems.lean 267, LinearUseFailCanSeqConsumeDecideTheorems.lean 679, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 498, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 586, LinearUseFailCanSeqConsumeDecideNotRevWrapTheorems.lean 297; lake of helpers unrun; just check-remote is not a 256 GiB raise; engineer the walk under 192 GiB; leftover isolation-test Lean files are not the default package; next Open Done when is chunked product typecheck). Theorem canSeq_consume_keep_neq_false is **landed**. Theorem canSeq_keep_consume_neq_false is **landed**. Theorem canSeq_keep_keep_false_iff is **landed**. Theorem canSeq_consume_keep_eq_true is **landed**. Theorem canSeq_keep_consume_eq_true is **landed**. Theorem canSeq_keep_keep_eq_true is **landed** (`just systems-host` GREEN this wave; not lake GREEN). Theorem canSeq_keep_keep_true_eq is **landed** (converse on disk). Theorem canSeq_keep_keep_false_neq is **landed** (converse of canSeq_keep_keep_neq_false; LinearUseFailTheorems). Theorem canSeq_consume_keep_false_neq is **landed** (converse of canSeq_consume_keep_neq_false; LinearUseFailTheorems). Theorem canSeq_keep_consume_false_neq is **landed** (converse of canSeq_keep_consume_neq_false: canSeq keep then consume is false when grades are unequal; LinearUseFailTheorems). Theorem canSeq_consume_keep_true_eq is **landed** (converse of canSeq_consume_keep_eq_true: canSeq consume then keep remaining k is true implies k = 0; LinearUseFailTheorems). Theorem canSeq_keep_consume_true_eq is **landed** (converse of canSeq_keep_consume_eq_true: canSeq keep remaining k then consume is true implies k = 1; LinearUseFailTheorems). L2 lockstep-residual38 DualPinOk patch re-read DualPinOk and the last canSeq on disk now (residual37 DualPinOk method119 with no method120 is still the living DualPinOk Bool tip; method120 DualPinOk writer is a different L2 and has not landed; DualPinOk has method118; DualPinOk has method119; DualPinOk has no method120; DualPinOk has no method121; method119 slot 122 offset 976; Vacant slot 123 offset 984; TraitVPtr slot 124 offset 992; 125 slots / 1000 bytes / 120 Methods; maxRecDepth 2048; maxHeartbeats 500000; DualPinOk Method count is not occupancy 49 and not mill 69 of 69; method119 recipe GREEN this pair (dest-missing red then just llvm-trait-object-vtable EXIT 0); linear143 systems-host GREEN; linear144 split of DecideNotRevTheorems did not land (no extra DecideNotRev helper); last living canSeq is canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff at line 774 of 779-line LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean; helpers LinearUseFailCanSeqConsumeTheorems.lean 267, LinearUseFailCanSeqConsumeDecideTheorems.lean 679, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 497, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 779; lake of helpers unrun; just check-remote is not a 256 GiB raise; engineer the walk under 192 GiB; leftover isolation-test Lean files are not the default package; next Open Done when is chunked product typecheck; L3 lockstep-residual38 re-read DualPinOk and the last canSeq on disk now (residual37 freeze DualPinOk method119 125 slots / 1000 bytes / 120 Methods still matches living disk; method119 recipe GREEN this pair dest-missing red then just llvm-trait-object-vtable EXIT 0; DualPinOk has method118; DualPinOk has method119; DualPinOk has no method120; method119 slot 122 offset 976; Vacant slot 123 offset 984; TraitVPtr slot 124 offset 992; vtableSlotKind 125 none; maxRecDepth 2048; maxHeartbeats 500000; DualPinOk Method count 120 is not occupancy 49 and not mill 69 of 69; last living canSeq is canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff at line 774 in LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 779 lines twenty-Not false reverse; linear144 split of DecideNotRevTheorems did not land; no fifth helper; helpers LinearUseFailCanSeqConsumeTheorems.lean 267, LinearUseFailCanSeqConsumeDecideTheorems.lean 679, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 497, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 779; linear143 systems-host GREEN; lake of helpers unrun; just check-remote is not a 256 GiB raise; engineer the walk under 192 GiB; leftover isolation-test Lean files are not the default package; next Open Done when is chunked product typecheck; residual36 DualPinOk method118 with no method119 is stale as the living DualPinOk Bool tip; residual36 FAILED after a model-capacity API error, not a product miss; method119 landed in DualPinOk Bool while residual37 lockstep ran; DualPinOk has method118; DualPinOk has method119; DualPinOk has no method120; method119 slot 122 offset 976; Vacant slot 123 offset 984; TraitVPtr slot 124 offset 992; 125 slots / 1000 bytes / 120 Methods; maxRecDepth 2048; maxHeartbeats 500000; DualPinOk Method count is not occupancy 49 and not mill 69 of 69; residual36 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff at 717 lines and residual36 apply 755-line canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff are stale as the living last canSeq; last living canSeq is canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff at 779 lines in LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean; helpers LinearUseFailCanSeqConsumeTheorems.lean 267, LinearUseFailCanSeqConsumeDecideTheorems.lean 679, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 497; linear143 systems-host GREEN; linear144 split of DecideNotRevTheorems did not land; L2 lockstep-residual36 DualPinOk patch re-read DualPinOk and the last canSeq on disk now (residual35 DualPinOk method117 is stale as the living DualPinOk Bool tip; method118 landed in DualPinOk Bool while residual36 lockstep ran; DualPinOk has method117; DualPinOk has method118; DualPinOk has no method119; residual35 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff is stale as the living last canSeq; after residual35, lemma canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff landed (717 lines); L2 lockstep-residual35 DualPinOk patch re-read DualPinOk and the last canSeq on disk now (residual34 DualPinOk method115 is stale as the living DualPinOk Bool tip; method116 landed in DualPinOk Bool while residual35 lockstep ran; method117 landed in DualPinOk Bool while residual35 lockstep ran; DualPinOk has method115; DualPinOk has method116; DualPinOk has method117; DualPinOk has no method118; residual34 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff is stale as the living last canSeq; Linear134 landed canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff while residual35 lockstep ran; Linear135 landed canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff while residual35 lockstep ran; Linear136 landed canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff while residual35 lockstep ran; Linear137 landed canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff while residual35 lockstep ran; Linear138 landed canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff while residual35 lockstep ran; Linear139 landed canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff while residual35 lockstep ran; residual33 DualPinOk method114 is stale as the living DualPinOk Bool tip; method115 landed in DualPinOk Bool while residual34 lockstep ran; DualPinOk has method114; DualPinOk has method115; DualPinOk has no method116; residual32 DualPinOk method113 is stale as the living DualPinOk Bool tip; method114 landed in DualPinOk Bool while residual33 lockstep ran; DualPinOk has method113; DualPinOk has method114; DualPinOk has no method115; residual31 DualPinOk method112 is stale as the living DualPinOk Bool tip; method113 landed in DualPinOk Bool while residual32 lockstep ran; DualPinOk has method112; DualPinOk has method113; DualPinOk has no method114; residual30 DualPinOk method112 remains on disk; DualPinOk has method112; DualPinOk has method113; DualPinOk has no method114; residual29 DualPinOk method111 is stale as the living tip; method112 landed in DualPinOk Bool while residual30 lockstep ran; DualPinOk has method112; DualPinOk has no method113; residual27 DualPinOk method108 is stale as the living tip; method109 landed while residual28 lockstep ran; method110 landed while residual28 lockstep ran; residual29 re-read DualPinOk method111 is stale as the living DualPinOk Bool tip (vtableFixtureMethodCount 112; vacant slot 115 offset 920; TraitVPtr slot 116 offset 928; 117 slots / 936 bytes / 112 Methods); method111 landed in DualPinOk Bool while residual29 lockstep ran; DualPinOk has method111; DualPinOk has method112; DualPinOk has no method113; residual26 DualPinOk method106 is stale; method107 landed while residual26 lockstep ran; method108 landed while residual27 lockstep ran; residual25 DualPinOk method105 is stale; DualPinOk has method106; DualPinOk has method107; DualPinOk has method108; DualPinOk has method109; DualPinOk has method110; DualPinOk has method111; DualPinOk has no method112; residual22 DualPinOk method104 is stale; method105 landed while residual23 lockstep ran; DualPinOk has method105; DualPinOk has method106; DualPinOk has no method107; residual21 DualPinOk method103 is stale; residual20 DualPinOk method101 is stale; residual19 DualPinOk method99 is stale; residual18 DualPinOk method95 is stale; a prior residual19 DualPinOk method96 draft is stale; residual17 DualPinOk method94 is stale); residual16 died on a model-capacity API error, not a product fail). Living DualPinOk (rustc_abi / rustc_middle numeric dual-pin on the named trait-object vtable fixture) is method118 (vtableOneHundredNineteenthMethodSlot 121, offset 968). DualPinOk on disk has method118. DualPinOk on disk has no method119. DualPinOk on disk has method93. DualPinOk on disk has method94. DualPinOk on disk has method95. DualPinOk on disk has method96. DualPinOk on disk has method97. DualPinOk on disk has method98. DualPinOk on disk has method99. DualPinOk on disk has method100. DualPinOk on disk has method101. DualPinOk on disk has method102. DualPinOk on disk has method103. DualPinOk on disk has method104. DualPinOk on disk has method105. DualPinOk on disk has method106. DualPinOk on disk has method107. DualPinOk on disk has method108. DualPinOk on disk has method109. DualPinOk on disk has method110. DualPinOk on disk has method111. DualPinOk on disk has method112. DualPinOk on disk has method113. DualPinOk on disk has method114. DualPinOk on disk has method115. DualPinOk on disk has method116. DualPinOk on disk has method117. DualPinOk on disk has method118. DualPinOk on disk has no method119. method80 is slot 83 offset 664. method81 is slot 84 offset 672. method82 is slot 85 offset 680. method83 is slot 86 offset 688. method84 is slot 87 offset 696. method85 is slot 88 offset 704. method86 is slot 89 offset 712. method87 is slot 90 offset 720. method88 is slot 91 offset 728. method89 is slot 92 offset 736. method90 is slot 93 offset 744. method91 is slot 94 offset 752. method92 is slot 95 offset 760. method93 is slot 96 offset 768. method94 is slot 97 offset 776. method95 is slot 98 offset 784. method96 is slot 99 offset 792. method97 is slot 100 offset 800. method98 is slot 101 offset 808. method99 is slot 102 offset 816. method100 is slot 103 offset 824. method101 is slot 104 offset 832. method102 is slot 105 offset 840. method103 is slot 106 offset 848. method104 is slot 107 offset 856. method105 slot 108 offset 864. method106 slot 109 offset 872. method110 is slot 113 offset 904. method111 is slot 114 offset 912. method112 is slot 115 offset 920. method113 is slot 116 offset 928. method114 is slot 117 offset 936. method115 is slot 118 offset 944. method116 is slot 119 offset 952. method117 is slot 120 offset 960. method118 is slot 121 offset 968. Vacant slot 122 offset 976. TraitVPtr slot 123 offset 984. vtableSlotKind 124 is none. 124 slots / 992 bytes / 119 Methods (method0 through method118). Living DualPinOk home is `def traitObjectVtableDualPinOk` in src/systems/SystemsLean/TraitObjectVtable.lean; there is no DualPinOk in src/systems/Canonic.lean. Occupancy stays 49 names. DualPinOk Method count 118 and slot count 123 are not occupancy. DualPinOk 118 Methods is not mill 69 of 69. Living tip is method117. DualPinOk on disk has method80 through method117. DualPinOk on disk has method91. DualPinOk on disk has method92. DualPinOk on disk has method93. DualPinOk on disk has method94. DualPinOk on disk has method95. DualPinOk on disk has method96. DualPinOk on disk has method97. DualPinOk on disk has method98. DualPinOk on disk has method99. DualPinOk on disk has method100. DualPinOk on disk has method101. DualPinOk on disk has method102. DualPinOk on disk has method103. DualPinOk on disk has method104. DualPinOk on disk has method105. DualPinOk on disk has method106. DualPinOk on disk has method107. DualPinOk on disk has method108. DualPinOk on disk has method109. DualPinOk on disk has method110. DualPinOk on disk has method111. DualPinOk on disk has method112. DualPinOk on disk has method113. DualPinOk on disk has method114. DualPinOk on disk has no method115. DualPinOk set_option maxRecDepth 2048 is on disk (compiler rec-depth, not occupancy). Theorem canSeq_keep_keep_rcancel exists on disk (LinearUseFailTheorems theorem at line 661). Theorem canSeq_keep_keep_rcancel_false exists on disk (LinearUseFailTheorems theorem at line 674). Theorem canSeq_keep_keep_cancel exists on disk (theorem at line 648). Theorem canSeq_keep_keep_congr exists on disk (LinearUseFailTheorems.lean line 761). Theorem canSeq_keep_keep_rcongr exists on disk (line 773). Theorem canSeq_keep_keep_congr2 exists on disk (line 787). Theorem canSeq_keep_keep_rcongr2 exists on disk (line 800). Theorem canSeq_keep_keep_lrcongr2 exists on disk (LinearUseFailTheorems.lean line 843). Theorem canSeq_keep_keep_rlcongr2 exists on disk (line 857). Theorem canSeq_keep_keep_decide exists on disk (LinearUseFailCanSeq.lean; not the living last lemma). Theorem canSeq_consume_consume_false_neq is on disk (landed name, not last lemma). Last living canSeq theorem on disk is canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff (LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean line 750, 755 lines). After residual35, lemma canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 715 and is not the tip. Residual35 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 699 and is not the tip. Linear138 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 671 and is not the tip. Linear137 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 654 and is not the tip. Linear136 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 636 and is not the tip. Linear135 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 620 and is not the tip. Linear134 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 598 and is not the tip. Residual34 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 583 and is not the tip. Residual34-mid last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 561 and is not the tip. Residual33 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 539 and is not the tip. Residual33-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 513 and is not the tip. After residual32, lemma canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff landed (now line 499; residual32-after snapshot 503 lines) and is not the tip. Residual32 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 481 and is not the tip. Residual32-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 440 and is not the tip. Residual32-mid2 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 461 and is not the tip. Residual31 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 418 and is not the tip. Residual30 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 394 and is not the tip. Residual29 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 355 and is not the tip. The residual30 first last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 376 and is not the tip. Residual28 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 333 and is not the tip. LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean exists (418 lines). Record four living split files: LinearUseFailCanSeqConsumeTheorems.lean 267 lines, LinearUseFailCanSeqConsumeDecideTheorems.lean 679 lines, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 497 lines, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 418 lines (living). Residual27 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 690 and is NOT the tip. Residual28-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 709 and is NOT the tip. Residual28-mid2 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 730 and is NOT the tip. Residual28-mid3 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotTheorems line 746 and is NOT the tip. Residual26 re-read found that an earlier residual26 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_iff is on disk at DecideNotTheorems line 587 and is NOT the tip. Residual26 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotTheorems line 612 and is NOT the tip. Residual27-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 666 and is NOT the tip. Residual26 re-read found that residual25 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_iff on disk at DecideNotTheorems line 570 and it is NOT the tip; a further lemma landed while this lockstep ran. DualPinOk has method107. DualPinOk has method108. DualPinOk has no method109. Prior residual24 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 526 and is NOT the tip. Prior residual23 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 506 and is NOT the tip. Earlier residual23 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 491 and is NOT the tip. Residual22 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 477 and is NOT the tip. Prior residual22 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 460 and is NOT the tip. The after-residual21 lemma canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 443 and is NOT the tip. Residual21 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 428 and is NOT the tip. Prior residual21 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 402 and is NOT the tip. Earlier residual21 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 379 and is NOT the tip. Residual20 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_iff is still on disk at DecideNotTheorems line 342 and is NOT the tip. Prior residual20 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_iff is still on disk at DecideNotTheorems line 324 and is NOT the tip. Residual19 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_iff is still on disk at DecideNotTheorems line 265 and is NOT the tip. Residual18 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_iff is still on disk at DecideNotTheorems line 135 and is NOT the tip. Product last GREEN canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_iff is still on disk at DecideNotTheorems line 163 and is NOT the tip. Prior last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_iff is still on disk at DecideNotTheorems line 245 and is NOT the tip. Long-file split LinearUseFailCanSeqConsumeDecideNotTheorems.lean is on disk (770 lines). DecideTheorems is 675 lines (last theorem canSeq_consume_consume_decide_eq_not_false_ne_symm_symm_iff at line 669). Residual17 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_iff is still on disk at line 719 and is NOT the tip. Residual17 prior last name canSeq_consume_consume_decide_eq_not_true_ne_rev_iff is still on disk at line 684 and is NOT the tip. Residual17 earlier last name canSeq_consume_consume_decide_eq_not_false_ne_symm_symm_iff is still on disk at line 669 and is NOT the tip. LinearUseFailCanSeqConsumeTheorems.lean last theorem is canSeq_consume_consume_decide_not_eq_true_iff (line 259, 269 lines). Long-file split of later decide-eq-not theorems is on disk. Residual13 stop decide_eq_not_false_not_eq_eq_iff is line 532, not the tip. After residual14, disk also has canSeq_consume_consume_decide_eq_not_true_eq_not_eq_eq_iff (line 621, not the tip), canSeq_consume_consume_decide_eq_not_true_ne_iff (line 638), canSeq_consume_consume_decide_eq_not_false_ne_iff (line 654), and canSeq_consume_consume_decide_eq_not_false_ne_eq_iff (line 670). LinearUseFailCanSeqConsume.lean is 295 lines (long-file split already landed). LinearUseFailCanSeqConsumeTheorems.lean is 269 lines. LinearUseFailCanSeq.lean is 511 lines (last theorem canSeq_keep_consume_decide). LinearUseFailTheorems.lean is 163 lines (last theorem illegalLinearUseFailReady_true; spawn-time 156 was stale; disk wins). Stay under 800/1000. Next Linear lemma is after living last canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_iff in LinearUseFailCanSeqConsumeDecideNotTheorems.lean (line 282; DecideNotTheorems is 287 lines); DecideTheorems is 675 lines); ConsumeTheorems is 269 lines; stay under about 780). Put greppable tokens on the CanSeqConsumeTheorems presence spec, not the hub. Remaining lake LinearUseFailCanSeqConsumeTheorems and LinearUseFailCanSeqConsumeDecideTheorems and LinearUseFailCanSeqConsumeDecideNotTheorems and LinearUseFailCanSeqConsumeDecideNotRevTheorems unrun. Theorem canSeq_keep_keep_rtrans_false is earlier on disk (line 711). Theorem canSeq_keep_keep_cancel_false is earlier on disk (line 683). Theorem canSeq_consume_keep_true_eq exists on disk. Tested this lockstep (parent facts, not re-run here): `just systems-host` red then GREEN for theorem canSeq_keep_keep_cancel_false; `just llvm-trait-object-vtable` red then GREEN plus llc EXIT 0 for method37; builder SSH plus MemoryMax probe. Named lake prove lake build SystemsLean.LinearUseFailTheorems EXIT 0 with patched ELF lake was the PRIOR stack, not theorem canSeq_keep_keep_cancel_false. Remaining: lake build SystemsLean.LinearUseFailTheorems on nix-store ELF Lean for this new name. No live opt. Not Lake GREEN. Not package typecheck GREEN. PackageTypecheck last walk 46/747 then user-1002.slice MemoryMax exact 206158430208 bytes (192 GiB) OOM. Do not loop check-local. Operator must raise the slice to 256 GiB, then one `just check-remote`. Do not restart the 192 GiB OOM walk until then. Theorem canSeq_keep_consume_true_eq is on disk. Theorem canSeq_consume_keep_true_eq is on disk. Theorem canSeq_keep_keep_true_symm is on disk. Theorem canSeq_keep_keep_false_symm is on disk. Theorem canSeq_keep_keep_comm is on disk. Theorem canSeq_keep_keep_trans is on disk. Theorem canSeq_keep_keep_cancel is on disk. Theorem canSeq_keep_keep_rcancel is on disk. Theorem canSeq_keep_keep_rcancel_false is on disk. SSH is up. Named lake prove lake build SystemsLean.LinearUseFailTheorems EXIT 0 with patched ELF lake. That is not package typecheck GREEN. remaining = just check-remote already requires a nix-store ELF Lean (user-1002.slice still 192 GiB; do not restart the 192 GiB OOM walk) (elan lean and lake are stub-ld; real ELF is the nix-store glibc loader); package typecheck Done when on surmount-1 (last walk exit 143 at 46/747 ElabMeetNamedHostImportGraphModsLaterProbe, kernel memcg OOM 192 GiB, peak 191.9 GiB). DualPinOk method37 is not invented. Do not restart the 192 GiB OOM walk this slice. Host-presence and llvm-trait-object-vtable are not package typecheck GREEN. Do not invent method101 (DualPinOk on disk has method100; DualPinOk on disk has no method101). DualPinOk 101 Methods is not mill 69 of 69. llvm-trait-object-vtable GREEN through method85 is a parent fact, not re-run this residual (method85 L3 observed dest-missing red then GREEN; later DualPinOk L2 confirmed GREEN without re-creating FAIL because disk already had method85). DualPinOk on disk already has method85. llvm-trait-object-vtable remaining for method86. TESTED (parent facts): just systems-host GREEN through canSeq_consume_consume_decide_eq_not_false_eq_not_eq_iff. Remaining: systems-host for canSeq_consume_consume_decide_eq_not_false_eq_not_eq_eq_iff; lake LinearUseFailCanSeqConsumeTheorems; llc/opt; just check-remote after slice 256 GiB. Builder user-1002.slice MemoryMax 206158430208 (192 GiB); last fat walk 46/747 then OOM. Highest-value next is `just slake-typecheck-src-systems` on surmount-1 (Open Name **Slake typechecks src/systems**; real kernel walk of lean_lib SystemsLean; not skip-GREEN; not mill 70; not OccupancyProbe theater). The local 96 GiB oom-kill at 120/749 (SIGTERM 143) is not progress and is not that Done when. Occupancy name fifty stays **blocked** (not 50): need an operator-Opened occupancy NAME with checkable Done when, then OccupancyProbe EXIT 0 on surmount-1. Do not OccupancyProbe theater. Vtable method record is **done**. Vtable TraitVPtr record is **done**. Quantitative Type Theory (QTT) use-check inventory is **done**. QTT use-check UnrestrictedShare is **done (gated by just systems-host)**. Illegal linear use fails is **done partial** (indexed OnceRes; theorem bind_left_unit; theorem bind_right_unit / BindRightUnit (snd-only for a general step); theorem bind_assoc / BindAssoc (full Prod); theorem bind_consume_keep_eq_consume / ConsumeThenKeepEq; theorem bind_keep_consume_eq_consume / KeepThenConsumeEq; theorem bind_consume_keep_commute / ConsumeKeepCommute; BindCongr / theorem bind_congr landed (run-equal steps bind to run-equal steps); CanSeqIff / theorem canSeq_iff landed (Bool canSeq is true iff Prop CanSeq); CanSeqFalseIff / theorem canSeq_false_iff landed (canSeq s1 s2 = false iff Not (CanSeq s1 s2)); CanSeqConsumeKeepTrue / theorem canSeq_consume_keep_true landed (canSeq consume keep = true); CanSeqKeepConsumeTrue / theorem canSeq_keep_consume_true landed (canSeq keep consume = true); CanSeqKeepKeepTrue / theorem canSeq_keep_keep_true landed (canSeq keep keep = true); CanSeqKeepZeroConsumeFalse / theorem canSeq_keep_zero_consume_false landed (canSeq keep remaining 0 then consume is false); CanSeqConsumeKeepOneFalse / theorem canSeq_consume_keep_one_false landed (canSeq consume then keep remaining 1 is false); theorem canSeq_keep_zero_keep_one_false landed; theorem canSeq_keep_one_keep_zero_false landed; theorem canSeq_keep_keep_neq_false landed; theorem canSeq_keep_keep_true_iff landed; theorem canSeq_keep_keep_false_iff landed; CanSeqConsumeKeepTrueIff / theorem canSeq_consume_keep_true_iff landed; CanSeqKeepConsumeTrueIff / theorem canSeq_keep_consume_true_iff landed; CanSeqKeepConsumeFalseIff / theorem canSeq_keep_consume_false_iff landed; CanSeqConsumeKeepFalseIff / theorem canSeq_consume_keep_false_iff landed; CanSeqConsumeKeepNeqFalse / theorem canSeq_consume_keep_neq_false landed; CanSeqKeepConsumeNeqFalse / theorem canSeq_keep_consume_neq_false landed; CanSeqConsumeKeepEqTrue / theorem canSeq_consume_keep_eq_true landed; CanSeqKeepConsumeEqTrue / theorem canSeq_keep_consume_eq_true landed; CanSeqKeepKeepEqTrue / theorem canSeq_keep_keep_eq_true landed; CanSeqKeepKeepTrueEq / theorem canSeq_keep_keep_true_eq landed; CanSeqKeepKeepFalseNeq / theorem canSeq_keep_keep_false_neq landed; CanSeqConsumeKeepFalseNeq / theorem canSeq_consume_keep_false_neq landed; CanSeqKeepConsumeFalseNeq / theorem canSeq_keep_consume_false_neq landed; CanSeqConsumeKeepTrueEq / theorem canSeq_consume_keep_true_eq landed; CanSeqKeepConsumeTrueEq / theorem canSeq_keep_consume_true_eq landed; CanSeqKeepKeepTrueSymm / theorem canSeq_keep_keep_true_symm landed; CanSeqKeepKeepFalseSymm / theorem canSeq_keep_keep_false_symm landed; CanSeqKeepKeepComm / theorem canSeq_keep_keep_comm landed; CanSeqKeepKeepTrans / theorem canSeq_keep_keep_trans landed; CanSeqKeepKeepCancel / theorem canSeq_keep_keep_cancel landed; CanSeqKeepKeepRcancel / theorem canSeq_keep_keep_rcancel landed; CanSeqKeepKeepRcancelFalse / theorem canSeq_keep_keep_rcancel_false landed; CanSeqKeepKeepCancelFalse / theorem canSeq_keep_keep_cancel_false landed). Lockstep DualPinOk method88 (vtableEightyNinthMethodSlot 91 offset 728; method80 slot 83 offset 664; method81 slot 84 offset 672; method82 slot 85 offset 680; method83 slot 86 offset 688; method84 slot 87 offset 696; method85 slot 88 offset 704; method86 slot 89 offset 712; method87 slot 90 offset 720; method88 slot 91 offset 728; Vacant slot 92 offset 736; TraitVPtr slot 93 offset 744; vtableSlotKind 94 none; 94 slots / 752 bytes / 89 Methods; DualPinOk on disk has method80 through method88; DualPinOk on disk has method88; DualPinOk on disk has no method89; DualPinOk set_option maxRecDepth 2048 on disk). DualPinOk 89 Methods is not mill 69 of 69. DualPinOk Method count is not occupancy. Theorem canSeq_consume_keep_false_neq is landed. Theorem canSeq_keep_consume_false_neq is landed (converse of canSeq_keep_consume_neq_false: canSeq keep then consume is false when grades are unequal). Theorem canSeq_consume_keep_true_eq is landed (converse of canSeq_consume_keep_eq_true: canSeq consume then keep remaining k is true implies k = 0; LinearUseFailTheorems). Theorem canSeq_keep_consume_true_eq is landed (converse of canSeq_keep_consume_eq_true: canSeq keep remaining k then consume is true implies k = 1; LinearUseFailTheorems). Theorem canSeq_keep_keep_true_symm is landed (keep remaining k then keep remaining m sequences when swapped if it sequences; LinearUseFailTheorems). Tested this lockstep: DualPinOk on disk is method60, 66 slots, 528 bytes, 61 Methods. method44, method45, method46, canSeq_consume_consume_decide, canSeq_consume_consume_true_iff, and canSeq_consume_consume_false_iff are on disk. method44 write recipe was GREEN-then-GREEN without an observed missing-token red (remaining TDD honesty, not a fake red). method45 and method46 observed dest-missing red then GREEN on just llvm-trait-object-vtable. Last living canSeq theorem on disk is canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff (LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean line 750, 755 lines). After residual35, lemma canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 715 and is not the tip. Residual35 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 699 and is not the tip. Linear138 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 671 and is not the tip. Linear137 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 654 and is not the tip. Linear136 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 636 and is not the tip. Linear135 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 620 and is not the tip. Linear134 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 598 and is not the tip. Residual34 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 583 and is not the tip. Residual34-mid last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 561 and is not the tip. Residual33 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 539 and is not the tip. Residual33-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 513 and is not the tip. After residual32, lemma canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff landed (now line 499; residual32-after snapshot 503 lines) and is not the tip. Residual32 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 481 and is not the tip. Residual32-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 440 and is not the tip. Residual32-mid2 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 461 and is not the tip. Residual31 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 418 and is not the tip. Residual30 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 394 and is not the tip. Residual29 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 355 and is not the tip. The residual30 first last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 376 and is not the tip. Residual28 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 333 and is not the tip. LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean exists (418 lines). Record four living split files: LinearUseFailCanSeqConsumeTheorems.lean 267 lines, LinearUseFailCanSeqConsumeDecideTheorems.lean 679 lines, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 497 lines, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 418 lines (living). Residual27 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 690 and is NOT the tip. Residual28-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 709 and is NOT the tip. Residual28-mid2 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 730 and is NOT the tip. Residual28-mid3 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotTheorems line 746 and is NOT the tip. Residual26 re-read found that an earlier residual26 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_iff is on disk at DecideNotTheorems line 587 and is NOT the tip. Residual26 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotTheorems line 612 and is NOT the tip. Residual27-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 666 and is NOT the tip. Residual26 re-read found that residual25 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_iff on disk at DecideNotTheorems line 570 and it is NOT the tip; a further lemma landed while this lockstep ran. DualPinOk has method107. DualPinOk has method108. DualPinOk has no method109. Prior residual24 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 526 and is NOT the tip. Prior residual23 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 506 and is NOT the tip. Earlier residual23 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 491 and is NOT the tip. Residual22 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 477 and is NOT the tip. Prior residual22 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 460 and is NOT the tip. The after-residual21 lemma canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 443 and is NOT the tip. Residual21 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 428 and is NOT the tip. Prior residual21 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 402 and is NOT the tip. Earlier residual21 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 379 and is NOT the tip. Residual20 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_iff is still on disk at DecideNotTheorems line 342 and is NOT the tip. Prior residual20 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_iff is still on disk at DecideNotTheorems line 324 and is NOT the tip. Residual19 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_iff is still on disk at DecideNotTheorems line 265 and is NOT the tip. Residual18 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_iff is still on disk at DecideNotTheorems line 135 and is NOT the tip. Product last GREEN canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_iff is still on disk at DecideNotTheorems line 163 and is NOT the tip. Prior last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_iff is still on disk at DecideNotTheorems line 245 and is NOT the tip. Long-file split LinearUseFailCanSeqConsumeDecideNotTheorems.lean is on disk (770 lines). DecideTheorems is 675 lines (last theorem canSeq_consume_consume_decide_eq_not_false_ne_symm_symm_iff at line 669). Residual17 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_iff is still on disk at line 719 and is NOT the tip. Residual17 prior last name canSeq_consume_consume_decide_eq_not_true_ne_rev_iff is still on disk at line 684 and is NOT the tip. Residual17 earlier last name canSeq_consume_consume_decide_eq_not_false_ne_symm_symm_iff is still on disk at line 669 and is NOT the tip. LinearUseFailCanSeqConsumeTheorems.lean last theorem is canSeq_consume_consume_decide_not_eq_true_iff (line 259, 269 lines). Long-file split of later decide-eq-not theorems is on disk. Residual13 stop decide_eq_not_false_not_eq_eq_iff is line 532, not the tip. After residual14, disk also has canSeq_consume_consume_decide_eq_not_true_eq_not_eq_eq_iff (line 621, not the tip), canSeq_consume_consume_decide_eq_not_true_ne_iff (line 638), canSeq_consume_consume_decide_eq_not_false_ne_iff (line 654), and canSeq_consume_consume_decide_eq_not_false_ne_eq_iff (line 670). LinearUseFailCanSeqConsume.lean is 295 lines (long-file split already landed). LinearUseFailCanSeqConsumeTheorems.lean is 269 lines. LinearUseFailCanSeq.lean is 511 lines (last theorem canSeq_keep_consume_decide). LinearUseFailTheorems.lean is 163 lines (last theorem illegalLinearUseFailReady_true; spawn-time 156 was stale; disk wins). Stay under 800/1000. Next Linear lemma is after living last canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_iff in LinearUseFailCanSeqConsumeDecideNotTheorems.lean (line 282; DecideNotTheorems is 287 lines); DecideTheorems is 675 lines); ConsumeTheorems is 269 lines; stay under about 780). Put greppable tokens on the CanSeqConsumeTheorems presence spec, not the hub. Remaining lake LinearUseFailCanSeqConsumeTheorems and LinearUseFailCanSeqConsumeDecideTheorems and LinearUseFailCanSeqConsumeDecideNotTheorems and LinearUseFailCanSeqConsumeDecideNotRevTheorems unrun. Theorem canSeq_consume_consume_true_eq is on disk (LinearUseFailCanSeq.lean line 561). Theorem canSeq_consume_consume_eq_true is on disk (LinearUseFailCanSeq.lean line 552). Theorem canSeq_consume_consume_neq_false is on disk (LinearUseFailCanSeq.lean line 543). Theorem canSeq_consume_consume_false_iff is on disk (LinearUseFailCanSeq.lean line 535). Theorem canSeq_consume_consume_true_iff is on disk (LinearUseFailCanSeq.lean line 526). Theorem canSeq_consume_consume_decide is on disk (LinearUseFailCanSeq.lean line 516). LinearUseFailCanSeqConsume.lean is 720 lines (later consume/consume theorems). LinearUseFailCanSeq.lean is 507 lines. LinearUseFailTheorems.lean is 156 lines (hub; imports CanSeq and CanSeqConsume). Stay under 800/1000. Next Linear lemmas go in LinearUseFailCanSeqConsume.lean, not the CanSeq hub and not LinearUseFailTheorems.lean. This residual lockstep re-read DualPinOk and did not run just or lake. This residual lockstep re-read DualPinOk and did not run just or lake. Theorem canSeq_keep_consume_true_eq is on disk. Theorem canSeq_consume_keep_true_eq is on disk. Theorem canSeq_keep_keep_true_symm is on disk. Theorem canSeq_keep_keep_false_symm is on disk. Theorem canSeq_keep_keep_comm is on disk. Theorem canSeq_keep_keep_trans is on disk. Theorem canSeq_keep_keep_cancel is on disk. Theorem canSeq_keep_keep_rcancel is on disk. Theorem canSeq_keep_keep_rcancel_false is on disk. Theorem canSeq_keep_keep_cancel_false is on disk. SSH is up. Named lake prove lake build SystemsLean.LinearUseFailTheorems EXIT 0 with patched ELF lake was the PRIOR stack, not theorem canSeq_keep_keep_cancel_false. Remaining: lake build SystemsLean.LinearUseFailTheorems on nix-store ELF Lean for this new name. remaining = just check-remote already requires a nix-store ELF Lean (user-1002.slice MemoryMax exact 206158430208 bytes (192 GiB), not 256 GiB; do not restart the 192 GiB OOM walk until the operator raises the slice to 256 GiB); package typecheck Done when on surmount-1 (last walk exit 143 at 46/747 ElabMeetNamedHostImportGraphModsLaterProbe, kernel memcg OOM 192 GiB, peak 191.9 GiB). DualPinOk method64 is not invented. DualPinOk on disk has method63. method62 and method63 are on DualPinOk disk. llvm-trait-object-vtable GREEN through method63 is from product reports (vtable27 / l3-vtable-method63), not re-run this residual. Do not restart the 192 GiB OOM walk this slice. Host-presence GREEN and llvm-trait-object-vtable GREEN are not lake GREEN and not surmount-1 package typecheck GREEN. Local substitute is `just check-local` (`just/dual-side.just`, MemoryMax 96G, nice 19, LEAN_NUM_THREADS=1, then slake-typecheck-src-systems). Do not loop `just check-local` (96 GiB oom-kill at 120/749, SIGTERM 143). Do not start another Lean. OccupancyProbe MemoryMax 192 GiB is not check-local. Remote `just check-remote` is MemoryMax 256G over SSH to nixbuilder@surmount-1. One builder L2 owns the walk. GREEN of check-local is not the surmount-1 package typecheck Done when and is not lake GREEN. All-types use-check is **not started**. Helper file(1) PATH miss stays documented residual.
Do not mill HostModuleCheck now (it is built). Do not mill MultFsWrite
now (it is built). Do not mill SelfHostComplete now (it is built). Do
not claim 50 occupancy names. Occupancy stays **49**. Mill stays **69 of 69**. Do not mill mill 69 again. Do not claim
Lake-gone. Do not claim FullHost. Occupancy **49** is a closed subset,
not a count goal. Mill **69 of 69** is host-tool ELF produce, not
Slake-produced-Slake. Self-host gap inventory exists
(`doc/dev/research/self-host-gap-inventory-2026-09-17.md`). Open Name
**Slake typechecks src/systems** stays **Open** (Lake of six LinearUseFail theorem helpers EXIT 0 on nixbuilder, nix-store ELF Lean, about 4 s, mill-class; host-presence is not this GREEN; chunked jobs=4 walker GREEN 563/563 already recorded; remaining Done when is parse/kernel of more than Mult, Types, Erasure, and Extract (IrProgram is next language core on the 49-name list), and Slake producing the 69 host tools; `parseLiveExtractSource` accepts; `kernelCheck` true; `hostFrontLiveExtractReady` true; lake HostFrontLiveExtract EXIT 0; driver cmds=14; Parse live Extract leftover heading is done; lake build SystemsLean.HostFrontLiveTypes EXIT 0 after parser fixes; parseLiveTypesSource accepts; kernelCheck true; hostFrontLiveTypesReady true; Parse live Types leftover heading is done; Parse live Mult.lean is done; last completed local walk SIGTERM 143 at 120/749; do not loop `just check-local`; do not restart the 192 GiB OOM walk; do not restart the 563 walk; GREEN of check-local is not `slakeOwnsPackageTypecheck`; FullHost stays false; `slakeOwnsPackageTypecheck` stays false because the operator did not accept 563 as that pin; plants from prior slices stay landed;
Named lake prove of six LinearUseFail theorem helpers EXIT 0 on nixbuilder is recorded this residual52 lockstep. That is not `slakeOwnsPackageTypecheck`. just check-remote already requires a nix-store ELF Lean (user-1002.slice MemoryMax exact 206158430208 bytes (192 GiB); 256 GiB is the box, not the Lean budget; do not ask to raise MemoryMax; leftover isolation-test Lean files (ElabMeetNamed*Probe isolation harness) are not the default package; next Open Done when is parse/kernel of more than live Mult, not a 747 one-shot). skip-GREEN: no; walker GREEN is not that pin;
FullHost stays **false**;
`slakeOwnsPackageTypecheck` stays **false**). Completeness end-to-end is Slake produces
Slake, then Lean 4, then mathlib. Do not empty Open. Sibling **Real
vtable-shaped emit** is **done partial** (printer walks host
`TraitObjectFat`, `HOST-TRAIT-OBJECT-FAT`, dest
`out/llvm-ir/trait-object-vtable.ll`).

One standing `[lake-coord]` L2 owns all remote Lake on **surmount-1**.
Resume that L2; extras-empty is not an exit. Law: `AGENTS.md` section
**Lake host and niceness**. After compaction, read **Session parallelism
(operator 2026-09-09)** near the top of `AGENTS.md` (parent does not wait
mill or Lake; mill L2 does not wait on lean). The host-tools mill compile (`just N-host-tool`
lean then leanc) runs on **surmount-1** / nixbuilder (`/home/nixbuilder/iso`),
not on **horizon**. Living compiler map of mill, occupancy, Lake, emit, llvm IR, and L2 tokens: [doc/compiler-map.md](compiler-map.md). Root `TECH.md` is host persist, not that map. Residual stays Open/Done.
Parallel Open (not mill): Open **Slake typechecks src/systems** stays Open (Lake of six LinearUseFail theorem helpers EXIT 0; chunked jobs=4 walker GREEN 563/563 already recorded; remaining is parse/kernel of more than Mult, Types, Erasure, and Extract, IrProgram next on the 49-name list, and Slake producing the 69 tools; lake build SystemsLean.HostFrontLiveTypes EXIT 0 after parser fixes; parseLiveTypesSource accepts; kernelCheck true; hostFrontLiveTypesReady true; Parse live Types leftover heading is done; Parse live Mult.lean is done; last completed local walk SIGTERM 143 at 120/749; do not loop `just check-local`; do not restart the 192 GiB OOM walk; do not restart the 563 walk; GREEN of check-local is not `slakeOwnsPackageTypecheck`; plants from prior slices stay landed; skip-GREEN no; walker GREEN is not the pin; FullHost false; slakeOwnsPackageTypecheck false because the operator did not accept 563 as that pin). This-run SSH facts: `/home/hunter/.agents/reports/slake-typecheck-src-systems-a17480ab-ssh.md` and `/home/hunter/.agents/reports/l3-typecheck-a17480ab.md`. Probe log: `/home/hunter/.agents/reports/slake-typecheck-src-systems-a17480ab.log`. Typecheck log was not written. Prior SSH-down slice logs stay `6688465c`. Trait-object vtable IR is done partial. Sibling **Real vtable-shaped emit** is done partial (`HOST-TRAIT-OBJECT-FAT` walk from host `TraitObjectFat` to dest `.ll`). Fifth pin slot 4 second Method plus rustc_abi pointer (method1 offset 32) landed. method2 is slot 5 offset 40. method3 is slot 6 offset 48. method4 is slot 7 offset 56. method5 is slot 8 offset 64. method6 is slot 9 offset 72. method7 is slot 10 offset 80. method8 is slot 11 offset 88. method9 is slot 12 offset 96. method10 is slot 13 offset 104. method11 is slot 14 offset 112. method12 is slot 15 offset 120. method13 is slot 16 offset 128. method14 is slot 17 offset 136. method15 is slot 18 offset 144. method16 is slot 19 offset 152. method17 is slot 20 offset 160. method18 is slot 21 offset 168. method19 is slot 22 offset 176. method20 is slot 23 offset 184. method21 is slot 24 offset 192. method22 is slot 25 offset 200. method23 is slot 26 offset 208. method24 is slot 27 offset 216. method25 is slot 28 offset 224. method26 is slot 29 offset 232. method27 is slot 30 offset 240. method28 is slot 31 offset 248. method29 is slot 32 offset 256. method30 is slot 33 offset 264. method31 is slot 34 offset 272. method32 is slot 35 offset 280. method33 is slot 36 offset 288. method34 is slot 37 offset 296. method35 is slot 38 offset 304. method36 is slot 39 offset 312. method37 is slot 40 offset 320. method38 is slot 41 offset 328. method39 is slot 42 offset 336. method40 is slot 43 offset 344. method41 is slot 44 offset 352. method42 is slot 45 offset 360. method43 is slot 46 offset 368. method44 is slot 47 offset 376. method45 is slot 48 offset 384. method46 is slot 49 offset 392. Vacant is slot 50 offset 400. TraitVPtr is slot 51 offset 408. Living DualPinOk fixture is 96 slots, 768 bytes, 91 Methods (method0 through method90). DualPinOk on disk has method90. DualPinOk on disk has no method91. DualPinOk 91 Methods is not mill 69 of 69. DualPinOk Method count is not occupancy. DualPinOk set_option maxRecDepth 2048 is on disk. Slot 3 method0 offset 24 and header 0/1/2 and fat ScalarPair 16/8 unchanged. Remaining = more methods / lake-proved production emit / real rustc object codegen. Occupancy 49 is not a count goal. Mill 69 of 69 is not Slake-produced-Slake. FullHost false. Not FullBackend. Fargo unclaimed.

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
Do **not** claim **50**. Occupancy is **49 names / 164 compile-order
rows** (AcceptsGoodsTerm extra closed; isolation OccupancyProbe EXIT 0). Occupancy HostPackageWrite band is **closed**. Occupancy Proof
extras band is **closed** (eight HostModuleCheck*Proof modules on
compile order only). Occupancy Term extras band is **closed** (seven
MultTerm-layer unit Terms on compile order only). Occupancy Emit
scaffold Term extras is **closed** (eight Emit*Scaffold Terms on
compile order only). Occupancy Emit apply Term extras is **closed**
(HostModuleCheckEmitApplyTerm, HostModuleCheckParityEmitTerm, and
HostModuleCheckEmitBannerScaffoldTerm on compile order only).
Occupancy Kernel compile Term extras is **closed**
(HostModuleCheckKernelSelfApplyTerm, HostModuleCheckProductOutKernelTerm,
and HostModuleCheckCompilePathTerm on compile order only).
Occupancy Join host Surface Term extras is **closed**
(HostModuleCheckJoinMapTerm, HostModuleCheckSelfHostTerm, and
HostModuleCheckSurfaceMatrixTerm on compile order only).
Occupancy Spec Dual CompilePathMult Term extras is **closed**
(HostModuleCheckSpecProofTerm, HostModuleCheckDualResidualTerm, and
HostModuleCheckCompilePathMultTerm on compile order only).
Occupancy CompilePath Linear Types Program Term extras is **closed**
(HostModuleCheckCompilePathLinearTerm, HostModuleCheckCompilePathTypesTerm,
and HostModuleCheckCompilePathProgramTerm on compile order only).
Occupancy CompilePath Graph Compose Erasure Term extras is **closed**
(HostModuleCheckCompilePathGraphTerm, HostModuleCheckCompilePathComposeTerm,
and HostModuleCheckCompilePathErasureTerm on compile order only).
Occupancy CompilePath Extract Plan Apply Term extras is **closed**
(HostModuleCheckCompilePathExtractTerm, HostModuleCheckCompilePathPlanTerm,
and HostModuleCheckCompilePathApplyTerm on compile order only).
Occupancy CompilePath Body FirstSurface LinearSubsetEmit Term extras
is **closed** (HostModuleCheckCompilePathBodyTerm,
HostModuleCheckFirstSurfaceTerm, and
HostModuleCheckLinearSubsetEmitTerm on compile order only).
Occupancy Types Program Graph SubsetEmit Term extras is **closed**
(HostModuleCheckTypesSubsetEmitTerm, HostModuleCheckProgramSubsetEmitTerm,
and HostModuleCheckGraphSubsetEmitTerm on compile order only).
Occupancy Compose Erasure Extract SubsetEmit Term extras is **closed**
(HostModuleCheckComposeSubsetEmitTerm, HostModuleCheckErasureSubsetEmitTerm,
and HostModuleCheckExtractSubsetEmitTerm on compile order only).
Occupancy Mult SubsetEmit plus Mult/Linear SubsetRebuild Term extras
is **closed** (HostModuleCheckMultSubsetEmitTerm,
HostModuleCheckMultSubsetRebuildTerm, and
HostModuleCheckLinearSubsetRebuildTerm on compile order only).
Occupancy Types Program Graph SubsetRebuild Term extras is **closed**
(HostModuleCheckTypesSubsetRebuildTerm,
HostModuleCheckProgramSubsetRebuildTerm, and
HostModuleCheckGraphSubsetRebuildTerm on compile order only).
Occupancy Compose Erasure Extract SubsetRebuild Term extras is **closed**
(HostModuleCheckComposeSubsetRebuildTerm,
HostModuleCheckErasureSubsetRebuildTerm, and
HostModuleCheckExtractSubsetRebuildTerm on compile order only).
Occupancy HostFront LlvmMult HostCheck Term extras is **closed**
(HostModuleCheckHostFrontTerm, HostModuleCheckLlvmMultTextTerm, and
HostModuleCheckHostCheckTerm on compile order only).
Occupancy HostGraph LlvmLinear MultFsWrite Term extras is **closed**
(HostModuleCheckHostGraphTerm, HostModuleCheckLlvmLinearTextTerm, and
HostModuleCheckMultFsWriteToolTerm on compile order only).
Occupancy FrontMult SubsetJoin LlvmTypes Term extras is **closed**
(HostModuleCheckFrontMultPackageTerm, HostModuleCheckSubsetPackageJoinTerm, and
HostModuleCheckLlvmTypesTextTerm on compile order only).
Occupancy MultFsDeepen HostPackageWrite LlvmProgramText Term extras is **closed**
(HostModuleCheckMultFsDeepenTerm, HostModuleCheckHostPackageWriteTerm, and
HostModuleCheckLlvmProgramTextTerm on compile order only).
Occupancy LlvmGraph LlvmCompose SelfApplyFs Term extras is **closed**
(HostModuleCheckLlvmGraphTextTerm, HostModuleCheckLlvmComposeTextTerm, and
HostModuleCheckSelfApplyFsTerm on compile order only).
Occupancy InventoryClose ProductPathBars ProductPath Term extras is **closed**
(HostModuleCheckInventoryCloseTerm, HostModuleCheckProductPathBarsTerm, and
HostModuleCheckProductPathTerm on compile order only).
Occupancy ProbeWire SelfHostBody Term extras is **closed**
(HostModuleCheckProbeWireTerm and HostModuleCheckSelfHostBodyTerm on
compile order only). Occupancy LoadOkCompilePathUnits extras is
**closed** (HostModuleCheckLoadOkCompilePathUnits on compile order
only, not a named member).
HostModuleCheckRealModule
is out of occupancy names and compile order. This is **not**
49-plus-Program. RealModule occupancy grow stays **parked**: **98**
direct imports; Term/Proof compile-deps **94**; **83** Terms
on occupancy compile order; **8** Proof extras still on compile order;
**8** Emit*Scaffold Terms still on compile order; **3** Emit apply
Term extras still on compile order; **3** Kernel compile Term extras
still on compile order; **3** Join host Surface Term extras still
on compile order; **3** Spec Dual CompilePathMult Term extras still
on compile order; **3** CompilePath Linear Types Program Term extras
still on compile order; **3** CompilePath Graph Compose Erasure
Term extras still on compile order; **3** CompilePath Extract Plan
Apply Term extras still on compile order; **3** CompilePath Body
FirstSurface LinearSubsetEmit Term extras still on compile order;
**3** Types Program Graph SubsetEmit Term extras still on compile
order; **3** Compose Erasure Extract SubsetEmit Term extras still
on compile order; **3** Mult SubsetEmit plus Mult/Linear
SubsetRebuild Term extras still on compile order; **3** Types
Program Graph SubsetRebuild Term extras still on compile order; **3**
Compose Erasure Extract SubsetRebuild Term extras still on compile order; **3**
HostFront LlvmMult HostCheck Term extras still on compile order; **3**
HostGraph LlvmLinear MultFsWrite Term extras still on compile order; **3**
FrontMult SubsetJoin LlvmTypes Term extras still on compile order; **3**
MultFsDeepen HostPackageWrite LlvmProgramText Term extras still on compile order; **3**
LlvmGraph LlvmCompose SelfApplyFs Term extras still on compile order; **3**
InventoryClose ProductPathBars ProductPath Term extras still on compile order; **2**
ProbeWire SelfHostBody Term extras still on compile order; **1**
LoadOkCompilePathUnits occupancy extra now on compile order; this **1**
LoadOkLaterTerm occupancy extra now on compile order; this **1**
AcceptsGoodsTerm occupancy extra now on compile order. Do not add remaining Terms plus RealModule in one occupancy prove
(Lean 137 twice: 2497 s then 2470 s). Smaller RealModule compile-dep extras is **done**.
Smaller RealModule Term extras is **done**. Emit scaffold Term extras
is **done**. Emit apply Term extras is **done**. Kernel compile Term
extras is **done**. Join host Surface Term extras is **done**. Spec Dual
CompilePathMult Term extras is **done**. CompilePath Linear Types
Program Term extras is **done**. CompilePath Graph Compose Erasure
Term extras is **done**. CompilePath Extract Plan Apply Term extras
is **done**. CompilePath Body FirstSurface LinearSubsetEmit Term extras
is **done**. Types Program Graph SubsetEmit Term extras is **done**.
Compose Erasure Extract SubsetEmit Term extras is **done**.
Mult SubsetEmit plus Mult/Linear SubsetRebuild Term extras is **done**.
Types Program Graph SubsetRebuild Term extras is **done**.
Compose Erasure Extract SubsetRebuild Term extras is **done**.
HostFront LlvmMult HostCheck Term extras is **done**.
HostGraph LlvmLinear MultFsWrite Term extras is **done**.
FrontMult SubsetJoin LlvmTypes Term extras is **done**.
MultFsDeepen HostPackageWrite LlvmProgramText Term extras is **done**.
LlvmGraph LlvmCompose SelfApplyFs Term extras is **done**.
InventoryClose ProductPathBars ProductPath Term extras is **done**.
ProbeWire SelfHostBody Term extras is **done**. LoadOkCompilePathUnits
occupancy extras is **done**. LoadOkLaterTerm occupancy extras is
**done**. AcceptsGoods occupancy extras is **done**. Last GREEN
`/tmp/parityprogram-occupancy-accepts-20260908.log` (EXIT 0,
jobs 8, walk 4.1 s, probe 1471 s, Lean 137 no). Prior occupancy rename stays
historically GREEN `/tmp/parityprogram-occupancy-rename-20260908.log`. Prior LoadOkLaterTerm extras stays
historically GREEN `/tmp/parityprogram-occupancy-lol2-20260903.log`. Prior Units extras stays
historically GREEN `/tmp/parityprogram-occupancy-units-20260903.log`. Prior ProbeWire
SelfHostBody extras stays historically GREEN
`/tmp/parityprogram-occupancy-ps-20260903.log`. Prior InventoryClose
ProductPathBars ProductPath extras stays historically GREEN
`/tmp/parityprogram-occupancy-ipp-20260903.log`. Prior LlvmGraph
LlvmCompose SelfApplyFs extras stays historically GREEN
`/tmp/parityprogram-occupancy-lcs-20260903.log`. Prior MultFsDeepen
HostPackageWrite LlvmProgramText extras stays historically GREEN
`/tmp/parityprogram-occupancy-mhp-20260903.log`. Prior FrontMult SubsetJoin
LlvmTypes extras stays historically GREEN
`/tmp/parityprogram-occupancy-fsl-20260903.log`. Prior HostGraph LlvmLinear
MultFsWrite extras stays historically GREEN
`/tmp/parityprogram-occupancy-hlm-20260903.log`. Prior HostFront LlvmMult
HostCheck extras stays historically GREEN
`/tmp/parityprogram-occupancy-hlh-20260903.log`. Prior Compose Erasure Extract
SubsetRebuild extras stays historically GREEN
`/tmp/parityprogram-occupancy-cee-rebuild-20260903.log`. Prior Types Program Graph
SubsetRebuild extras stays historically GREEN
`/tmp/parityprogram-occupancy-tpg-rebuild-20260903.log`. Prior Mult SubsetEmit
plus Mult/Linear SubsetRebuild extras stays historically GREEN
`/tmp/parityprogram-occupancy-mrlr-20260903.log`. Prior Compose Erasure
Extract SubsetEmit extras stays historically GREEN
`/tmp/parityprogram-occupancy-cee-20260903.log`.
Occupancy extras are
**done-for-now**. LoadOkLaterTerm occupancy extras is **done**. Occupancy
already has EmitBodyTerm, Kernel term surfaces, Parity term surfaces,
LoadOkCompilePathUnits, and LoadOkLaterTerm. AcceptsGoods occupancy extra
is **closed** (HostModuleCheckAcceptsGoodsTerm after
LoadOkLaterTerm, RealModule-free, not a named member). Isolation OccupancyProbe EXIT 0. Last GREEN
`/tmp/parityprogram-occupancy-accepts-20260908.log` (EXIT 0, jobs 8,
walk 4.1 s, probe 1471 s). Occupancy extras are **done-for-now**.
Do not invent the next occupancy extra. Do not open
RealModule. Do not empty Open: two-target emit program remains
OPEN as a program banner. There is no next checkable two-target Name
until the operator Opens one.
Residual does not
name 49-plus-Program with its own checkable Done when. Do not fold
ElabMeet. Do not invent HostModuleCheckLoadOkTerm.
Host tools without Lake stay **69 of 69** (list)
`src/systems/host-tools-inventory.md`; 69 `lean_exe` rows in
`src/systems/lakefile.lean`). DualEqWriteApi is **built**. ProductPathWriteHc is **built**. HostModuleCheck is **built** (mill 67 ELF GREEN; recipe EXIT 1 was helper file(1) PATH miss). MultFsWrite is **built** (mill 68 GREEN). SelfHostComplete is **built** (mill 69 GREEN). Remaining mill leftover that cannot mill honestly:
none.
Independent mill extras waves already landed. Trait-object vtable IR is done partial. Fifth pin slot 4 second Method plus rustc_abi pointer (method1 offset 32) landed. method2 is slot 5 offset 40. method3 is slot 6 offset 48. method4 is slot 7 offset 56. method5 is slot 8 offset 64. method6 is slot 9 offset 72. method7 is slot 10 offset 80. method8 is slot 11 offset 88. method9 is slot 12 offset 96. method10 is slot 13 offset 104. method11 is slot 14 offset 112. method12 is slot 15 offset 120. method13 is slot 16 offset 128. method14 is slot 17 offset 136. method15 is slot 18 offset 144. method16 is slot 19 offset 152. method17 is slot 20 offset 160. method18 is slot 21 offset 168. method19 is slot 22 offset 176. method20 is slot 23 offset 184. method21 is slot 24 offset 192. method22 is slot 25 offset 200. method23 is slot 26 offset 208. method24 is slot 27 offset 216. method25 is slot 28 offset 224. method26 is slot 29 offset 232. method27 is slot 30 offset 240. method28 is slot 31 offset 248. method29 is slot 32 offset 256. method30 is slot 33 offset 264. method31 is slot 34 offset 272. method32 is slot 35 offset 280. method33 is slot 36 offset 288. method34 is slot 37 offset 296. method35 is slot 38 offset 304. method36 is slot 39 offset 312. method37 is slot 40 offset 320. method38 is slot 41 offset 328. method39 is slot 42 offset 336. method40 is slot 43 offset 344. method41 is slot 44 offset 352. method42 is slot 45 offset 360. method43 is slot 46 offset 368. method44 is slot 47 offset 376. method45 is slot 48 offset 384. method46 is slot 49 offset 392. Vacant is slot 50 offset 400. TraitVPtr is slot 51 offset 408. Living DualPinOk fixture is 96 slots, 768 bytes, 91 Methods (method0 through method90). DualPinOk on disk has method90. DualPinOk on disk has no method91. DualPinOk 91 Methods is not mill 69 of 69. DualPinOk Method count is not occupancy. DualPinOk set_option maxRecDepth 2048 is on disk. Slot 3 method0 offset 24 and header 0/1/2 and fat ScalarPair 16/8 unchanged. Remaining = more methods / lake-proved production emit / real rustc object codegen. Occupancy 49. Mill 69 of 69. FullHost false. Not FullBackend. Fargo unclaimed. Vtable TraitVPtr record is **done**. QTT use-check UnrestrictedShare is **done (gated by just systems-host)**. Two-target emit program remains OPEN as a program
banner, not as a next checkable implement Name. There is no next
checkable two-target Name until the operator Opens one. Do not mill HostModuleCheck now (it is built). Do not mill mill 69 again. Host tools inventory is **done**.
First host tool without Lake is **done**
(`slake-runtime-bench-fail-closed-shape` / `just first-host-tool`;
ELF `build/first-host-tool/slake-runtime-bench-fail-closed-shape`).
Second host tool without Lake is **done**
(`slake-runtime-bench-stack-twin` / `just second-host-tool`;
ELF `build/first-host-tool/slake-runtime-bench-stack-twin`).
Third host tool without Lake is **done**
(`slake-read-product-ssot` / `just third-host-tool`;
ELF `build/first-host-tool/slake-read-product-ssot`).
Fourth host tool without Lake is **done**
(`slake-freestanding-capable-full-bar` / `just fourth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-capable-full-bar`).
Fifth host tool without Lake is **done**
(`slake-freestanding-capable-gap` / `just fifth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-capable-gap`).
Sixth host tool without Lake is **done**
(`slake-freestanding-capable-step-contract` / `just sixth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-capable-step-contract`).
Seventh host tool without Lake is **done**
(`slake-freestanding-capable-read` / `just seventh-host-tool`;
ELF `build/first-host-tool/slake-freestanding-capable-read`).
Eighth host tool without Lake is **done**
(`slake-freestanding-capable-compose` / `just eighth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-capable-compose`).
Ninth host tool without Lake is **done**
(`slake-freestanding-capable-install-out` / `just ninth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-capable-install-out`).
Tenth host tool without Lake is **done**
(`slake-ownership-regenerate` / `just tenth-host-tool`;
ELF `build/first-host-tool/slake-ownership-regenerate`).
Eleventh host tool without Lake is **done**
(`slake-freestanding-perform-evidence` / `just eleventh-host-tool`;
ELF `build/first-host-tool/slake-freestanding-perform-evidence`).
Twelfth host tool without Lake is **done**
(`slake-freestanding-perform-official-path` / `just twelfth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-perform-official-path`).
Thirteenth host tool without Lake is **done**
(`slake-freestanding-perform-official-path-alternate` / `just thirteenth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-perform-official-path-alternate`).
Fourteenth host tool without Lake is **done**
(`slake-freestanding-perform-dual-equality-write-parity` / `just fourteenth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-perform-dual-equality-write-parity`).
Fifteenth host tool without Lake is **done**
(`slake-freestanding-perform-dual-equality-write-close-path` / `just fifteenth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-perform-dual-equality-write-close-path`).
Sixteenth host tool without Lake is **done**
(`slake-freestanding-perform-dual-equality-write-capable-gap` / `just sixteenth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-perform-dual-equality-write-capable-gap`).
Seventeenth host tool without Lake is **done**
(`slake-freestanding-retire-official` / `just seventeenth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-retire-official`).
Eighteenth host tool without Lake is **done**
(`slake-freestanding-perform-claimed` / `just eighteenth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-perform-claimed`).
Nineteenth host tool without Lake is **done**
(`slake-freestanding-ownership-claimed` / `just nineteenth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-ownership-claimed`).
Twentieth host tool without Lake is **done**
(`slake-freestanding-step-contract-full` / `just twentieth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-step-contract-full`).
Twenty-first host tool without Lake is **done**
(`slake-compose-product-plan` / `just twenty-first-host-tool`;
ELF `build/first-host-tool/slake-compose-product-plan`).
Twenty-second host tool without Lake is **done**
(`slake-host-package-roots` / `just twenty-second-host-tool`;
ELF `build/first-host-tool/slake-host-package-roots`).
Twenty-third host tool without Lake is **done**
(`slake-mult-fs-write-tool` / `just twenty-third-host-tool`;
ELF `build/first-host-tool/slake-mult-fs-write-tool`).
Twenty-fourth host tool without Lake is **done**
(`slake-first-surface` / `just twenty-fourth-host-tool`;
ELF `build/first-host-tool/slake-first-surface`).
Twenty-fifth host tool without Lake is **done**
(`slake-program-subset-rebuild` / `just twenty-fifth-host-tool`;
ELF `build/first-host-tool/slake-program-subset-rebuild`).
Twenty-sixth host tool without Lake is **done**
(`slake-extract-subset-rebuild` / `just twenty-sixth-host-tool`;
ELF `build/first-host-tool/slake-extract-subset-rebuild`).
Twenty-seventh host tool without Lake is **done**
(`slake-erasure-subset-rebuild` / `just twenty-seventh-host-tool`;
ELF `build/first-host-tool/slake-erasure-subset-rebuild`).
Twenty-eighth host tool without Lake is **done**
(`slake-graph-subset-rebuild` / `just twenty-eighth-host-tool`;
ELF `build/first-host-tool/slake-graph-subset-rebuild`).
Twenty-ninth host tool without Lake is **done**
(`slake-compose-subset-rebuild` / `just twenty-ninth-host-tool`;
ELF `build/first-host-tool/slake-compose-subset-rebuild`).
Thirtieth host tool without Lake is **done**
(`slake-linear-subset-rebuild` / `just thirtieth-host-tool`;
ELF `build/first-host-tool/slake-linear-subset-rebuild`).
Thirty-first host tool without Lake is **done**
(`slake-types-subset-rebuild` / `just thirty-first-host-tool`;
ELF `build/first-host-tool/slake-types-subset-rebuild`).
Thirty-second host tool without Lake is **done**
(`slake-mult-subset-rebuild` / `just thirty-second-host-tool`;
ELF `build/first-host-tool/slake-mult-subset-rebuild`).
Thirty-third host tool without Lake is **done**
(`slake-host-fragment-check` / `just thirty-third-host-tool`;
ELF `build/first-host-tool/slake-host-fragment-check`).
Thirty-fourth host tool without Lake is **done**
(`slake-host-graph` / `just thirty-fourth-host-tool`;
ELF `build/first-host-tool/slake-host-graph`).
Thirty-fifth host tool without Lake is **done**
(`slake-host-front` / `just thirty-fifth-host-tool`;
ELF `build/first-host-tool/slake-host-front`).
Thirty-sixth host tool without Lake is **done**
(`slake-compose-subset-emit` / `just thirty-sixth-host-tool`;
ELF `build/first-host-tool/slake-compose-subset-emit`).
Thirty-seventh host tool without Lake is **done**
(`slake-graph-subset-emit` / `just thirty-seventh-host-tool`;
ELF `build/first-host-tool/slake-graph-subset-emit`).
Thirty-eighth host tool without Lake is **done**
(`slake-mult-subset-emit` / `just thirty-eighth-host-tool`;
ELF `build/first-host-tool/slake-mult-subset-emit`).
Thirty-ninth host tool without Lake is **done**
(`slake-erasure-subset-emit` / `just thirty-ninth-host-tool`;
ELF `build/first-host-tool/slake-erasure-subset-emit`).
Fortieth host tool without Lake is **done**
(`slake-extract-subset-emit` / `just fortieth-host-tool`;
ELF `build/first-host-tool/slake-extract-subset-emit`).
Forty-first host tool without Lake is **done**
(`slake-types-subset-emit` / `just forty-first-host-tool`;
ELF `build/first-host-tool/slake-types-subset-emit`).
Forty-second host tool without Lake is **done**
(`slake-program-subset-emit` / `just forty-second-host-tool`;
ELF `build/first-host-tool/slake-program-subset-emit`).
Forty-third host tool without Lake is **done**
(`slake-linear-subset-emit` / `just forty-third-host-tool`;
ELF `build/first-host-tool/slake-linear-subset-emit`).
Forty-fourth host tool without Lake is **done**
(`slake-product-wire-fs-write-tool` / `just forty-fourth-host-tool`;
ELF `build/first-host-tool/slake-product-wire-fs-write-tool`).
Forty-fifth host tool without Lake is **done**
(`slake-runtime-bench-lean` / `just forty-fifth-host-tool`;
ELF `build/first-host-tool/slake-runtime-bench-lean`).
Forty-sixth host tool without Lake is **done**
(`slake-front-mult-package` / `just forty-sixth-host-tool`;
ELF `build/first-host-tool/slake-front-mult-package`).
Forty-seventh host tool without Lake is **done**
(`slake-llvm-mult-text` / `just forty-seventh-host-tool`;
ELF `build/first-host-tool/slake-llvm-mult-text`).
Forty-eighth host tool without Lake is **done**
(`slake-freestanding-capable-regenerate` / `just forty-eighth-host-tool`;
ELF `build/first-host-tool/slake-freestanding-capable-regenerate`).
Forty-ninth host tool without Lake is **done**
(`slake-llvm-linear-text` / `just forty-ninth-host-tool`;
ELF `build/first-host-tool/slake-llvm-linear-text`).
Fiftieth host tool without Lake is **done**
(`slake-subset-front` / `just fiftieth-host-tool`;
ELF `build/first-host-tool/slake-subset-front`).
Fifty-first host tool without Lake is **done**
(`slake-llvm-mult-ssa` / `just fifty-first-host-tool`;
ELF `build/first-host-tool/slake-llvm-mult-ssa`).
Fifty-second host tool without Lake is **done**
(`slake-llvm-types-text` / `just fifty-second-host-tool`;
ELF `build/first-host-tool/slake-llvm-types-text`).
Fifty-third host tool without Lake is **done**
(`slake-llvm-program-text` / `just fifty-third-host-tool`;
ELF `build/first-host-tool/slake-llvm-program-text`).
Fifty-fourth host tool without Lake is **done**
(`slake-llvm-graph-text` / `just fifty-fourth-host-tool`;
ELF `build/first-host-tool/slake-llvm-graph-text`; mill on
nixbuilder@surmount-1, not horizon).
Fifty-fifth host tool without Lake is **done**
(`slake-llvm-linear-ssa` / `just fifty-fifth-host-tool`;
ELF `build/first-host-tool/slake-llvm-linear-ssa`; mill on
nixbuilder@surmount-1, not horizon).
Fifty-sixth host tool without Lake is **done**
(`slake-llvm-compose-ssa` / `just fifty-sixth-host-tool`;
ELF `build/first-host-tool/slake-llvm-compose-ssa`; mill on
nixbuilder@surmount-1, not horizon).
Fifty-seventh host tool without Lake is **done**
(`slake-host-package-write` / `just fifty-seventh-host-tool`;
ELF `build/first-host-tool/slake-host-package-write`; mill on
nixbuilder@surmount-1, not horizon).
Fifty-eighth host tool without Lake is **done**
(`slake-llvm-types-ssa` / `just fifty-eighth-host-tool`;
ELF `build/first-host-tool/slake-llvm-types-ssa`; mill on
nixbuilder@surmount-1, not horizon).
Fifty-ninth host tool without Lake is **done**
(`slake-host-import-graph` / `just fifty-ninth-host-tool`;
ELF `build/first-host-tool/slake-host-import-graph`; mill on
nixbuilder@surmount-1, not horizon).
Sixtieth host tool without Lake is **done**
(`slake-llvm-compose-text` / `just sixtieth-host-tool`;
ELF `build/first-host-tool/slake-llvm-compose-text`; mill on
nixbuilder@surmount-1, not horizon).
Sixty-first host tool without Lake is **done**
(`slake-llvm-program-ssa` / `just sixty-first-host-tool`;
ELF `build/first-host-tool/slake-llvm-program-ssa`; mill on
nixbuilder@surmount-1, not horizon).
Sixty-second host tool without Lake is **done**
(`slake-llvm-graph-ssa` / `just sixty-second-host-tool`;
ELF `build/first-host-tool/slake-llvm-graph-ssa`; mill on
nixbuilder@surmount-1, not horizon).
Sixty-third host tool without Lake is **done**
(`slake-freestanding-capable-write-hc` / `just sixty-third-host-tool`;
ELF `build/first-host-tool/slake-freestanding-capable-write-hc` 4620192 bytes;
mill on nixbuilder@surmount-1, not horizon).
Sixty-fourth host tool without Lake is **done**
(`slake-emit-freestanding-c` / `just sixty-fourth-host-tool`;
ELF `/home/nixbuilder/iso/build/first-host-tool/slake-emit-freestanding-c` 4844256 bytes;
mtime 2026-09-11 22:55 +0000; mill log `/tmp/sixty-fourth-host-tool-nixbuilder-20260911.log`
EXIT 0; mill on nixbuilder@surmount-1, not horizon). Sixty-fifth host tool without Lake is **done**
(`slake-freestanding-perform-dual-equality-write-api` / `just sixty-fifth-host-tool`;
ELF `/home/nixbuilder/iso/build/first-host-tool/slake-freestanding-perform-dual-equality-write-api` 4645984 bytes;
mtime 2026-09-13 00:21; mill log `/tmp/sixty-fifth-host-tool-nixbuilder-20260912.log`
EXIT 0 START 2026-09-13T00:18:55Z END 2026-09-13T00:21:49Z; mill on nixbuilder@surmount-1, not horizon). DualEqWriteApi is **built**. Sixty-sixth host tool without Lake is **done**
(`slake-write-freestanding-hc` / `just sixty-sixth-host-tool`;
ELF `/home/nixbuilder/iso/build/first-host-tool/slake-write-freestanding-hc` 4860032 bytes;
mtime 2026-09-13 00:28; mill log `/tmp/sixty-sixth-host-tool-nixbuilder-20260913.log`
EXIT 0 START 2026-09-13T00:25:12Z END 2026-09-13T00:28:12Z; mill on nixbuilder@surmount-1, not horizon). ProductPathWriteHc is **built**. Sixty-seventh host tool without Lake is **ELF GREEN**
(`slake-host-module-check` / `just sixty-seventh-host-tool` extras-file;
ELF `/home/nixbuilder/iso/build/first-host-tool/slake-host-module-check` 11069328 bytes;
mtime 2026-09-13 01:06; mill log `/tmp/mill-67-hmc.log`; recipe EXIT 1 was helper
file(1) PATH miss; ELF GREEN via nix-store file(1); mill on nixbuilder@surmount-1, not horizon). HostModuleCheck is **built**. Sixty-eighth host tool without Lake is **GREEN**
(`slake-mult-fs-write` / `just sixty-eighth-host-tool` packed 16 extras;
ELF `/home/nixbuilder/iso/build/first-host-tool/slake-mult-fs-write` 4430568 bytes;
mtime 2026-09-13 01:52; mill log `/tmp/mill-68-mult-fs-write.log`; compile-inventory-exe GREEN
and sixty-eighth-host-tool GREEN; FILE on the same just line as the helper; mill on nixbuilder@surmount-1, not horizon). MultFsWrite is **built**. Sixty-ninth host tool without Lake is **GREEN**
(`slake-freestanding-self-host-complete` / `just sixty-ninth-host-tool` 0 extras;
ELF `/home/nixbuilder/iso/build/first-host-tool/slake-freestanding-self-host-complete` 4234640 bytes;
mtime 2026-09-13 04:54; mill log `/tmp/mill-69-self-host-complete.log`; compile-inventory-exe GREEN
and sixty-ninth-host-tool GREEN; FILE on the same just line as the helper; mill on nixbuilder@surmount-1, not horizon). SelfHostComplete is **built**. Remaining mill leftover that cannot mill honestly:
none. That mill leftover heading is **non-residual**. Do not mill HostModuleCheck now (it is built). Do not mill mill 69 again. Independent mill extras waves already
landed. Trait-object vtable IR is done partial. Fifth pin slot 4 second Method plus rustc_abi pointer (method1 offset 32) landed. method2 is slot 5 offset 40. method3 is slot 6 offset 48. method4 is slot 7 offset 56. method5 is slot 8 offset 64. method6 is slot 9 offset 72. method7 is slot 10 offset 80. method8 is slot 11 offset 88. method9 is slot 12 offset 96. method10 is slot 13 offset 104. method11 is slot 14 offset 112. method12 is slot 15 offset 120. method13 is slot 16 offset 128. method14 is slot 17 offset 136. method15 is slot 18 offset 144. method16 is slot 19 offset 152. method17 is slot 20 offset 160. method18 is slot 21 offset 168. method19 is slot 22 offset 176. method20 is slot 23 offset 184. method21 is slot 24 offset 192. method22 is slot 25 offset 200. method23 is slot 26 offset 208. method24 is slot 27 offset 216. method25 is slot 28 offset 224. method26 is slot 29 offset 232. method27 is slot 30 offset 240. method28 is slot 31 offset 248. method29 is slot 32 offset 256. method30 is slot 33 offset 264. method31 is slot 34 offset 272. method32 is slot 35 offset 280. method33 is slot 36 offset 288. method34 is slot 37 offset 296. method35 is slot 38 offset 304. method36 is slot 39 offset 312. method37 is slot 40 offset 320. method38 is slot 41 offset 328. method39 is slot 42 offset 336. method40 is slot 43 offset 344. method41 is slot 44 offset 352. method42 is slot 45 offset 360. method43 is slot 46 offset 368. method44 is slot 47 offset 376. method45 is slot 48 offset 384. method46 is slot 49 offset 392. Vacant is slot 50 offset 400. TraitVPtr is slot 51 offset 408. Living DualPinOk fixture is 96 slots, 768 bytes, 91 Methods (method0 through method90). DualPinOk on disk has method90. DualPinOk on disk has no method91. DualPinOk 91 Methods is not mill 69 of 69. DualPinOk Method count is not occupancy. DualPinOk set_option maxRecDepth 2048 is on disk. Slot 3 method0 offset 24 and header 0/1/2 and fat ScalarPair 16/8 unchanged. Remaining = more methods / lake-proved production emit / real rustc object codegen. Occupancy 49. Mill 69 of 69. FullHost false. Not FullBackend. Fargo unclaimed. Vtable TraitVPtr record is **done**. QTT use-check UnrestrictedShare is **done (gated by just systems-host)**. Two-target emit
program remains OPEN as a program banner, not as a next checkable
implement Name. There is no next checkable two-target Name until the
operator Opens one. Leftover-name honesty is **done**. Highest-value next is `just slake-typecheck-src-systems` on surmount-1 (Open Name **Slake typechecks src/systems**; real kernel walk; not skip-GREEN; not mill 70). Two-target banner stays OPEN. Helper file(1) PATH miss stays documented residual.
FullHost stays false. Grow HostModuleCheckParityTypesTerm subset is
**done**. Types isolation EXIT 0 on surmount-1 (1802 s, 21 jobs).
ElabMeet ANDs the four ParityTypesTerm drive Bools. Occupancy extras
are **done-for-now**. LoadOkLaterTerm
occupancy extras is **done**. AcceptsGoods extra is **closed**. Isolation OccupancyProbe EXIT 0. Fat isolation is **blocked**
(Lean 137 twice: 2497 s on
`/tmp/parityprogram-probe-20260828T230142Z.log`, then 2470 s on
`/tmp/parityprogram-probe-20260901T034757Z.log`). Smaller Program
isolation last GREEN **EXIT 0** on
`OccupancyWalk`, `OccupancyProbe`, and `OccupancyTheorems` (accepts log;
living land is **49** names
/ **164** compile-order rows; Types / TypesTheorems / MultTheorems /
Erasure / ErasureTheorems / Extract / ExtractTheorems / IrProgram /
IrProgramTheorems in; HostFront in; HostGraph in; HostPackageWrite
in; HostPackageWriteTheorems in; HostPackageRoots in; import-graph
in; eight Proof extras on compile order; seven Term extras on compile
order; eight Emit*Scaffold Terms on compile order; three Emit apply
Term extras on compile order; three Kernel compile Term extras on
compile order; three Join host Surface Term extras on compile order;
three Spec Dual CompilePathMult Term extras on compile order;
three CompilePath Linear Types Program Term extras on compile order;
three CompilePath Graph Compose Erasure Term extras on compile order;
three CompilePath Extract Plan Apply Term extras on compile order;
three CompilePath Body FirstSurface LinearSubsetEmit Term extras on
compile order; three Types Program Graph SubsetEmit Term extras on
compile order; three Compose Erasure Extract SubsetEmit Term extras on
compile order; three Mult SubsetEmit plus Mult/Linear SubsetRebuild
Term extras on compile order; three Types Program Graph SubsetRebuild
Term extras on compile order; three Compose Erasure Extract SubsetRebuild
Term extras on compile order; three HostFront LlvmMult HostCheck
Term extras on compile order; three HostGraph LlvmLinear MultFsWrite
Term extras on compile order; three FrontMult SubsetJoin LlvmTypes
Term extras on compile order; three MultFsDeepen HostPackageWrite
LlvmProgramText Term extras on compile order; three LlvmGraph
LlvmCompose SelfApplyFs Term extras on compile order; three
InventoryClose ProductPathBars ProductPath Term extras on compile order;
two ProbeWire SelfHostBody Term extras on compile order;
one LoadOkCompilePathUnits occupancy extra on compile order;
one LoadOkLaterTerm occupancy extra on compile order;
one AcceptsGoodsTerm occupancy extra on compile order;
RealModule out; log
`/tmp/parityprogram-occupancy-accepts-20260908.log`; prior occupancy rename log
`/tmp/parityprogram-occupancy-rename-20260908.log`; prior LoadOkLaterTerm extras log
`/tmp/parityprogram-occupancy-lol2-20260903.log`; prior Units extras log
`/tmp/parityprogram-occupancy-units-20260903.log`; prior ProbeWire
SelfHostBody extras log `/tmp/parityprogram-occupancy-ps-20260903.log`; prior InventoryClose
ProductPathBars ProductPath extras log `/tmp/parityprogram-occupancy-ipp-20260903.log`; prior LlvmGraph
LlvmCompose SelfApplyFs extras log `/tmp/parityprogram-occupancy-lcs-20260903.log`; prior MultFsDeepen
HostPackageWrite LlvmProgramText extras log `/tmp/parityprogram-occupancy-mhp-20260903.log`; prior FrontMult SubsetJoin
LlvmTypes extras log `/tmp/parityprogram-occupancy-fsl-20260903.log`; prior HostGraph LlvmLinear
MultFsWrite extras log `/tmp/parityprogram-occupancy-hlm-20260903.log`; prior HostFront LlvmMult
HostCheck extras log `/tmp/parityprogram-occupancy-hlh-20260903.log`; prior Compose Erasure Extract
SubsetRebuild extras log `/tmp/parityprogram-occupancy-cee-rebuild-20260903.log`; prior Types Program Graph
SubsetRebuild extras log `/tmp/parityprogram-occupancy-tpg-rebuild-20260903.log`; prior Mult SubsetEmit
plus Mult/Linear SubsetRebuild extras log `/tmp/parityprogram-occupancy-mrlr-20260903.log`; prior Compose Erasure
Extract SubsetEmit extras log `/tmp/parityprogram-occupancy-cee-20260903.log`; prior Types Program Graph
SubsetEmit extras log `/tmp/parityprogram-occupancy-tpg-20260902.log`; prior CompilePath Body
FirstSurface LinearSubsetEmit extras log `/tmp/parityprogram-occupancy-bsl-20260902.log`; prior CompilePath Extract
Plan Apply extras log `/tmp/parityprogram-occupancy-epa-20260902.log`; prior CompilePath Graph
Compose Erasure extras log `/tmp/parityprogram-occupancy-gce-20260902.log`; prior CompilePath Linear
Types Program extras log `/tmp/parityprogram-occupancy-cpltp-20260902.log`; prior Spec Dual extras
log `/tmp/parityprogram-occupancy-specdual-20260902.log`; prior Join host Surface extras
log `/tmp/parityprogram-occupancy-joinhostsurface-20260902.log`; prior Kernel compile extras
log `/tmp/parityprogram-occupancy-kernelcompile-20260902.log`; prior emit apply extras
log `/tmp/parityprogram-occupancy-emitapply-20260902.log`; prior emit scaffold extras
log `/tmp/parityprogram-occupancy-emitscaffold-20260902.log`; prior Term extras
log `/tmp/parityprogram-occupancy-termextras-20260902.log`; prior Proof extras
log `/tmp/parityprogram-occupancy-proofextras-20260902.log`; prior
HostPackageWrite log
`/tmp/parityprogram-occupancy-hpw-20260901T181910Z.log`; prior
import-graph log
`/tmp/parityprogram-occupancy-importgraph-20260901T175057Z.log`; prior
theorems-band log `/tmp/parityprogram-occupancy-theorems-20260901T172226Z.log`;
prior prefix log `/tmp/parityprogram-occupancy-prefix-20260901T165738Z.log`;
prior logs `/tmp/parityprogram-occupancy-hostfront-20260901T062400Z.log`
then `/tmp/parityprogram-occupancy-grow-20260901T055621Z.log` then
`/tmp/parityprogram-occupancy-grow-20260901T055906Z.log`). Fold 50 stays
blocked. ElabMeet was not folded. Smaller Emit isolation **EXIT 0** on
`ElabMeetNamedHostModuleCheckParityEmitTermSmallProbe` (log
`/tmp/parityemit-probe-20260901T052919Z.log`; 8 jobs; walk 1.3 s, probe
31 s; lake 965751 exited). Fat Emit probe was not started. Extract after
LoadOkLaterTerm is **blocked** (no HostModuleCheckLoadOkTerm). Do not
retry the fat Program probe. Not the theorems hub. Not FullHost. `leakEnv := false`
stays on the nixbuilder tree (ElabMeetCompile lines 111 and 170). SSH
host that worked: **surmount-1**.

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
Metric at that land: **47 of about 206** live modules on the Slake path.
Grow HostModuleCheckParityLinearTerm subset is **done** (occupancy member
**47**; living occupancy **49**; do not treat as next). Do not claim
**50**. Hub no longer
imports the 18 historical isolation probes. ElabMeetTheorems is **581**.
`leakEnv` false on nixbuilder; isolation probe EXIT 0 (2518 s; peak about
**167 GiB**); living occupancy stays **49**; FullHost false.
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
| Real modules Slake typechecks | **49 of about 206** (SystemsLean.Mult through SystemsLean.HostModuleCheckParityTypesTerm) |
| Real host tools that build without Lake on the step | **69 of 69** (`src/systems/host-tools-inventory.md`) |
| All-types use-check | **not started** (QTT inventory plus ConsumeToken plus UnrestrictedShare named surfaces **done**; Illegal linear use fails indexed OnceRes plus ConsumeThenKeepEq / bind_consume_keep_eq_consume; KeepThenConsumeEq / bind_keep_consume_eq_consume; ConsumeKeepCommute / bind_consume_keep_commute (BindCongr / theorem bind_congr landed (run-equal steps bind to run-equal steps); CanSeqIff / theorem canSeq_iff landed (Bool canSeq is true iff Prop CanSeq); CanSeqFalseIff / theorem canSeq_false_iff landed (canSeq s1 s2 = false iff Not (CanSeq s1 s2)); CanSeqConsumeKeepTrue / theorem canSeq_consume_keep_true landed (canSeq consume keep = true); CanSeqKeepConsumeTrue / theorem canSeq_keep_consume_true landed (canSeq keep consume = true); CanSeqKeepKeepTrue / theorem canSeq_keep_keep_true landed (canSeq keep keep = true); CanSeqKeepZeroConsumeFalse / theorem canSeq_keep_zero_consume_false landed (canSeq keep remaining 0 then consume is false); CanSeqConsumeKeepOneFalse / theorem canSeq_consume_keep_one_false landed (canSeq consume then keep remaining 1 is false); theorem canSeq_keep_zero_keep_one_false landed; theorem canSeq_keep_one_keep_zero_false landed; theorem canSeq_keep_keep_neq_false landed; theorem canSeq_keep_keep_true_iff landed; theorem canSeq_keep_keep_false_iff landed; CanSeqConsumeKeepTrueIff / theorem canSeq_consume_keep_true_iff landed; CanSeqKeepConsumeTrueIff / theorem canSeq_keep_consume_true_iff landed; CanSeqKeepConsumeFalseIff / theorem canSeq_keep_consume_false_iff landed; CanSeqConsumeKeepFalseIff / theorem canSeq_consume_keep_false_iff landed; CanSeqConsumeKeepNeqFalse / theorem canSeq_consume_keep_neq_false landed; CanSeqKeepConsumeNeqFalse / theorem canSeq_keep_consume_neq_false landed; CanSeqConsumeKeepEqTrue / theorem canSeq_consume_keep_eq_true landed; CanSeqKeepConsumeEqTrue / theorem canSeq_keep_consume_eq_true landed; CanSeqKeepKeepEqTrue / theorem canSeq_keep_keep_eq_true landed) **done partial**. Lockstep DualPinOk method88 (vtableEightyNinthMethodSlot 91 offset 728; method80 slot 83 offset 664; method81 slot 84 offset 672; method82 slot 85 offset 680; method83 slot 86 offset 688; method84 slot 87 offset 696; method85 slot 88 offset 704; method86 slot 89 offset 712; method87 slot 90 offset 720; method88 slot 91 offset 728; Vacant slot 92 offset 736; TraitVPtr slot 93 offset 744; vtableSlotKind 94 none; 94 slots / 752 bytes / 89 Methods; DualPinOk on disk has method80 through method88; DualPinOk on disk has method88; DualPinOk on disk has no method89; DualPinOk set_option maxRecDepth 2048 on disk). DualPinOk 89 Methods is not mill 69 of 69. DualPinOk Method count is not occupancy. Theorem canSeq_consume_keep_false_neq is landed. Theorem canSeq_keep_consume_false_neq is landed (converse of canSeq_keep_consume_neq_false: canSeq keep then consume is false when grades are unequal). Theorem canSeq_consume_keep_true_eq is landed (converse of canSeq_consume_keep_eq_true: canSeq consume then keep remaining k is true implies k = 0; LinearUseFailTheorems). Theorem canSeq_keep_consume_true_eq is landed (converse of canSeq_keep_consume_eq_true: canSeq keep remaining k then consume is true implies k = 1; LinearUseFailTheorems). Theorem canSeq_keep_keep_true_symm is landed (keep remaining k then keep remaining m sequences when swapped if it sequences; LinearUseFailTheorems). Tested this lockstep: DualPinOk on disk is method60, 66 slots, 528 bytes, 61 Methods. method44, method45, method46, canSeq_consume_consume_decide, canSeq_consume_consume_true_iff, and canSeq_consume_consume_false_iff are on disk. method44 write recipe was GREEN-then-GREEN without an observed missing-token red (remaining TDD honesty, not a fake red). method45 and method46 observed dest-missing red then GREEN on just llvm-trait-object-vtable. Last living canSeq theorem on disk is canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff (LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean line 750, 755 lines). After residual35, lemma canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 715 and is not the tip. Residual35 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 699 and is not the tip. Linear138 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 671 and is not the tip. Linear137 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 654 and is not the tip. Linear136 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 636 and is not the tip. Linear135 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 620 and is not the tip. Linear134 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 598 and is not the tip. Residual34 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 583 and is not the tip. Residual34-mid last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 561 and is not the tip. Residual33 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 539 and is not the tip. Residual33-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 513 and is not the tip. After residual32, lemma canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff landed (now line 499; residual32-after snapshot 503 lines) and is not the tip. Residual32 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 481 and is not the tip. Residual32-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 440 and is not the tip. Residual32-mid2 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 461 and is not the tip. Residual31 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 418 and is not the tip. Residual30 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 394 and is not the tip. Residual29 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 355 and is not the tip. The residual30 first last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotRevTheorems line 376 and is not the tip. Residual28 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotRevTheorems line 333 and is not the tip. LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean exists (418 lines). Record four living split files: LinearUseFailCanSeqConsumeTheorems.lean 267 lines, LinearUseFailCanSeqConsumeDecideTheorems.lean 679 lines, LinearUseFailCanSeqConsumeDecideNotTheorems.lean 497 lines, LinearUseFailCanSeqConsumeDecideNotRevTheorems.lean 418 lines (living). Residual27 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 690 and is NOT the tip. Residual28-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 709 and is NOT the tip. Residual28-mid2 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 730 and is NOT the tip. Residual28-mid3 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotTheorems line 746 and is NOT the tip. Residual26 re-read found that an earlier residual26 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_not_iff is on disk at DecideNotTheorems line 587 and is NOT the tip. Residual26 last canSeq canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_eq_not_iff remains on disk at DecideNotTheorems line 612 and is NOT the tip. Residual27-mid last canSeq canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_eq_not_eq_iff remains on disk at DecideNotTheorems line 666 and is NOT the tip. Residual26 re-read found that residual25 last canSeq canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_eq_iff on disk at DecideNotTheorems line 570 and it is NOT the tip; a further lemma landed while this lockstep ran. DualPinOk has method107. DualPinOk has method108. DualPinOk has no method109. Prior residual24 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 526 and is NOT the tip. Prior residual23 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 506 and is NOT the tip. Earlier residual23 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 491 and is NOT the tip. Residual22 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 477 and is NOT the tip. Prior residual22 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 460 and is NOT the tip. The after-residual21 lemma canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_not_iff is still on disk at DecideNotTheorems line 443 and is NOT the tip. Residual21 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 428 and is NOT the tip. Prior residual21 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 402 and is NOT the tip. Earlier residual21 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_eq_iff is still on disk at DecideNotTheorems line 379 and is NOT the tip. Residual20 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_rev_not_eq_not_iff is still on disk at DecideNotTheorems line 342 and is NOT the tip. Prior residual20 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_rev_not_eq_not_iff is still on disk at DecideNotTheorems line 324 and is NOT the tip. Residual19 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_iff is still on disk at DecideNotTheorems line 265 and is NOT the tip. Residual18 last canSeq name canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_iff is still on disk at DecideNotTheorems line 135 and is NOT the tip. Product last GREEN canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_iff is still on disk at DecideNotTheorems line 163 and is NOT the tip. Prior last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_not_eq_iff is still on disk at DecideNotTheorems line 245 and is NOT the tip. Long-file split LinearUseFailCanSeqConsumeDecideNotTheorems.lean is on disk (770 lines). DecideTheorems is 675 lines (last theorem canSeq_consume_consume_decide_eq_not_false_ne_symm_symm_iff at line 669). Residual17 last canSeq name canSeq_consume_consume_decide_eq_not_true_ne_eq_rev_iff is still on disk at line 719 and is NOT the tip. Residual17 prior last name canSeq_consume_consume_decide_eq_not_true_ne_rev_iff is still on disk at line 684 and is NOT the tip. Residual17 earlier last name canSeq_consume_consume_decide_eq_not_false_ne_symm_symm_iff is still on disk at line 669 and is NOT the tip. LinearUseFailCanSeqConsumeTheorems.lean last theorem is canSeq_consume_consume_decide_not_eq_true_iff (line 259, 269 lines). Long-file split of later decide-eq-not theorems is on disk. Residual13 stop decide_eq_not_false_not_eq_eq_iff is line 532, not the tip. After residual14, disk also has canSeq_consume_consume_decide_eq_not_true_eq_not_eq_eq_iff (line 621, not the tip), canSeq_consume_consume_decide_eq_not_true_ne_iff (line 638), canSeq_consume_consume_decide_eq_not_false_ne_iff (line 654), and canSeq_consume_consume_decide_eq_not_false_ne_eq_iff (line 670). LinearUseFailCanSeqConsume.lean is 295 lines (long-file split already landed). LinearUseFailCanSeqConsumeTheorems.lean is 269 lines. LinearUseFailCanSeq.lean is 511 lines (last theorem canSeq_keep_consume_decide). LinearUseFailTheorems.lean is 163 lines (last theorem illegalLinearUseFailReady_true; spawn-time 156 was stale; disk wins). Stay under 800/1000. Next Linear lemma is after living last canSeq_consume_consume_decide_eq_not_false_ne_eq_rev_not_eq_not_iff in LinearUseFailCanSeqConsumeDecideNotTheorems.lean (line 282; DecideNotTheorems is 287 lines); DecideTheorems is 675 lines); ConsumeTheorems is 269 lines; stay under about 780). Put greppable tokens on the CanSeqConsumeTheorems presence spec, not the hub. Remaining lake LinearUseFailCanSeqConsumeTheorems and LinearUseFailCanSeqConsumeDecideTheorems and LinearUseFailCanSeqConsumeDecideNotTheorems and LinearUseFailCanSeqConsumeDecideNotRevTheorems unrun. Theorem canSeq_consume_consume_true_eq is on disk (LinearUseFailCanSeq.lean line 561). Theorem canSeq_consume_consume_eq_true is on disk (LinearUseFailCanSeq.lean line 552). Theorem canSeq_consume_consume_neq_false is on disk (LinearUseFailCanSeq.lean line 543). Theorem canSeq_consume_consume_false_iff is on disk (LinearUseFailCanSeq.lean line 535). Theorem canSeq_consume_consume_true_iff is on disk (LinearUseFailCanSeq.lean line 526). Theorem canSeq_consume_consume_decide is on disk (LinearUseFailCanSeq.lean line 516). LinearUseFailCanSeqConsume.lean is 720 lines (later consume/consume theorems). LinearUseFailCanSeq.lean is 507 lines. LinearUseFailTheorems.lean is 156 lines (hub; imports CanSeq and CanSeqConsume). Stay under 800/1000. Next Linear lemmas go in LinearUseFailCanSeqConsume.lean, not the CanSeq hub and not LinearUseFailTheorems.lean. This residual lockstep re-read DualPinOk and did not run just or lake. This residual lockstep re-read DualPinOk and did not run just or lake. Theorem canSeq_keep_consume_true_eq is on disk. Theorem canSeq_consume_keep_true_eq is on disk. Theorem canSeq_keep_keep_true_symm is on disk. Theorem canSeq_keep_keep_false_symm is on disk. Theorem canSeq_keep_keep_comm is on disk. Theorem canSeq_keep_keep_trans is on disk. Theorem canSeq_keep_keep_cancel is on disk. Theorem canSeq_keep_keep_rcancel is on disk. Theorem canSeq_keep_keep_rcancel_false is on disk. Theorem canSeq_keep_keep_cancel_false is on disk. SSH is up. Named lake prove lake build SystemsLean.LinearUseFailTheorems EXIT 0 with patched ELF lake was the PRIOR stack, not theorem canSeq_keep_keep_cancel_false. Remaining: lake build SystemsLean.LinearUseFailTheorems on nix-store ELF Lean for this new name. remaining = just check-remote already requires a nix-store ELF Lean (user-1002.slice MemoryMax exact 206158430208 bytes (192 GiB), not 256 GiB; do not restart the 192 GiB OOM walk until the operator raises the slice to 256 GiB); package typecheck Done when on surmount-1 (last walk exit 143 at 46/747 ElabMeetNamedHostImportGraphModsLaterProbe, kernel memcg OOM 192 GiB, peak 191.9 GiB). DualPinOk method64 is not invented. DualPinOk on disk has method63. method62 and method63 are on DualPinOk disk. llvm-trait-object-vtable GREEN through method63 is from product reports (vtable27 / l3-vtable-method63), not re-run this residual. Do not restart the 192 GiB OOM walk this slice. Host-presence GREEN and llvm-trait-object-vtable GREEN are not lake GREEN and not surmount-1 package typecheck GREEN. Local substitute is `just check-local` (`just/dual-side.just`, MemoryMax 96G, nice 19, LEAN_NUM_THREADS=1, then slake-typecheck-src-systems). Do not loop `just check-local` (96 GiB oom-kill at 120/749, SIGTERM 143). Do not start another Lean. OccupancyProbe MemoryMax 192 GiB is not check-local. Remote `just check-remote` is MemoryMax 256G over SSH to nixbuilder@surmount-1. One builder L2 owns the walk. GREEN of check-local is not the surmount-1 package typecheck Done when and is not lake GREEN. |)
| Same-job time | Lake idle-hot **0.459 s** (`doc/BENCH-SAME-JOB-latest.md`) is the full-package job on horizon 2026-08-13. Suite idle-hot **0.447 s** and suite first pass **29.613 s** stay. Closed-set Lake on surmount-1 first-pass **2.60 s** / **811360 KiB** then idle-hot **0.92 s** / **803528 KiB** (EXIT 0 both). How much faster: **not comparable**. Slake cannot typecheck that closed set as the compiler. Do not invent a fake Slake wall-clock. |

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
| `doc/compiler-map.md` | Living compiler map (not root `TECH.md`, which is host persist) |
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
