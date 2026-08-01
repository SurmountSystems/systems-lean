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
UnrestrictedShare) + IR sketch + systems skeleton + unit surface + compile path
+ **frozen** freestanding emit product wire (through emit Out / wire Body) +
**SYSTEMS_LEAN_HOST partial** (Lake + Mult..SelfHostBody under `src/systems/`;
**235** `SystemsLean/*.lean` host modules including
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
FrontMultPackage + FrontMultPackageMain + LakeRetireInventory +
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
EmitTypes + EmitProgram + EmitGraph + EmitCompose + SelfHostBody).
Defined freestanding compile step (SelfHostBody readiness pin -- readiness only,
not a substitute for claim B). Claim B freestanding product self-host complete is
**true**. Product residual free (claim A) is **true** (host elaborator residual
remains). Lake host still used. Progress meter 100% is evidence-weighted
milestones, not "Lake is gone."

**Decision (product path):** `just build` = product freestanding wire (emit +
`out/freestanding-c/`). No `out-freestanding-c` just recipe. `just check` builds
first (`SYSTEMS_PRODUCT_WIRE_FRESH=1` skips double regenerate in systems check).

**Living tip (2026-08-01):** freestanding product self-host **complete true**;
product residual free **true**; product path StillUsesLake/DependsOnLake
**false** (M6 phase 2 lake elaborator proof); host elaborator residual
**remains** (free is not host free); bootstrap **S0+S1+S2+S3 done**
(Mult under Lake; ideal **M0**). Ideal ladder **M1** Linear + Types + Program +
Extract + Erasure + Graph + Compose emit/rebuild **done**.
M5 ladder **done** (design + Name A/B/C). M6 design + phase 1 inventory +
phase 2 product-path Lake pins flip **all done** (living tip
`productPathOfficialPathStillUsesLake` / `productPathPerformDependsOnLake`
false; `LakeRetireInventory` product pins false; join
`/tmp/grok-1000/grok-impl-summary-m6-phase2-pin-flip.md`). Open **empty**
(ideal ladder M0-M6 product path closed). M4 Name C/B/A **done**. M3
subset language front-end **done**. M2 Name B full freestanding Mult write
**done** (`freestandingDriverComplete` **true**).
**S4** / **M6** Lake retire: **product path done** (pins false with lake proof;
host residual remains). Step 4 PROVABLY/LLVM **held**. beastdb orthogonal
(soft couple only). Long-file split campaign is **parked hygiene**, not the
product goal. **Dual rail:** product ladder done-for-now + runtime residual
archaeology stdout hygiene (P0-P5; policy in `AGENTS.md` Driver stdout policy)
run without blocking each other. Complete is not "Lake is gone." Free is not
Lake gone, not proof complete, not PROVABLY, not LLVM unlock.
Missing freestanding binary does **not** block bootstrap. Proper post-M6 wall
bench: `doc/dev/research/lake-vs-slake-proper-bench-2026-08-01.md` (earlier
same-day ceremony: `lake-vs-slake-serial-bench-2026-08-01.md`).

**Active product residual:** **done-for-now** (Open empty). Ideal freestanding
ladder M0-M6 product path **closed**. M6 phase 2 product-path Lake pins flip
**done** (lake elaborator proof). Host elaborator residual remains. M5 A/B/C
**done**. M4 A/B/C **done**. M3 design+implement **done**. Dual rail hygiene
P0-P5 non-blocking. Mult S0-S3 **done**. Plan
`.agents/plans/plan-residual-free-freestanding.md` Steps 0-3 **done**; Step 5
ideal ladder M1-M6 **done**; Step 4 **held**. Claim B complete closed; do not
re-open.
Long-file campaign parked (Linear last **118->92** via LinearTheorems **71**). Linear split **done** **118->92**;
KernelSelfApply split **done** **125->105**;
ProductOutKernel split **done** **130->106**;
ProductPathPerform split **done** **137->134** via ProductPathPerformTheorems **80**;
ProductPathOwnershipInputs split **done** **141->136** via ProductPathOwnershipInputsTheorems **87**;
BootstrapHonesty split **done** **142->111** via BootstrapHonestyTheorems **111**;
ProductPathWriterPathPlan split **done** **143->136** via ProductPathWriterPathPlanTheorems **167**;
ProductPathWriterSurface split **done** **147->134** via ProductPathWriterSurfaceTheorems **186**;
ProductPathPerformStep split **done** **152->147** via ProductPathPerformStepTheorems **165**;
ProductPathWriterPathExec split **done** **169->162** via ProductPathWriterPathExecTheorems **163**;
Mult split **done** **184->90** via MultTheorems **148**;
ProductPathWriteHc split **done** **194->181** via ProductPathWriteHcTheorems **187**;
ProductPathReadSsot split **done** **208->197** via ProductPathReadSsotTheorems **171**;
CapableRegenerate split **done** **218->208** via CapableRegenerateTheorems **228**;
CapableFullBar split **done** **231->219** via CapableFullBarTheorems **293**;
ProductPathComposePlan split **done** **251->247** via ProductPathComposePlanTheorems **181**;
PerformEvidence split **done** **255->233** via PerformEvidenceTheorems **284**;
OfficialPath split **done** **256->245** via OfficialPathTheorems **286**;
Capable split **done** **258->233** via CapableTheorems **279**;
InstallOut split **done** **279->272** via InstallOutTheorems **249**;
CapableStepContract split **done** **286->262** via CapableStepContractTheorems **280**;
CapableRead split **done** **297->288** via CapableReadTheorems **191**;
OfficialPathAlternate split done **310->295**;
DualEqWriteParity split **done** **319->302** via DualEqWriteParityTheorems **321**;
OfficialRetire split **done** **322->316** via OfficialRetireTheorems **293**;
LlvmHold split **done** **211->144** via LlvmHoldTheorems **124**; Erasure
split **done** **226->110** via ErasureTheorems **177**; EmitErasure
split **done** **233->63** via EmitErasureScaffold **236**; KernelMult
split **done** **250->160** via KernelMultTheorems **166**; IrProgram
split **done** **254->138** via IrProgramTheorems **179**; SelfApply
split **done** **255->187** via SelfApplyTheorems **137**; InventoryClose
split **done** **262->193** via InventoryCloseTheorems **135**; EmitMult
split **done** **277->60** via EmitMultScaffold **283**; ParityTypes split **done** **279->171** via
ParityTypesTheorems **168**; Types split **done** **302->151** via
TypesTheorems **215**; ParityLinear split **done** **304->176** via
ParityLinearTheorems **189**; EmitBanner split **done** **327->63** via
EmitBannerScaffold **325**; CapableCompose split **done** **338->323** via
CapableComposeTheorems **200**; SelfHost split **done** **342->164** via
SelfHostTheorems **240**; KernelLinear split **done** **343->229** via
KernelLinearTheorems **184**; Extract split **done** **344->156** via
ExtractTheorems **253**; KernelTypes split **done** **345->214** via
KernelTypesTheorems **201**; PerformClaimed split **done** **345->331** via
PerformClaimedTheorems **294**; DualEqWriteClosePath split **done** **354->344**
via DualEqWriteClosePathTheorems **314**; DualEqWriteCapableGap split **done**
**354->340** via DualEqWriteCapableGapTheorems **309**; SelfHostComplete split
**done** **363->338** via SelfHostCompleteTheorems **252**; OwnershipClaimed
split **done** **367->342** via OwnershipClaimedTheorems **247**; EmitExtract
split **done** **370->70** via EmitExtractScaffold **361**; ProbeWire split
**done** **379->288** via ProbeWireTheorems **163**; ParityMult split **done**
**382->183** via ParityMultTheorems **265**; StepContractFull split **done**
**382->365** via StepContractFullTheorems **235**;
ProductPathOwnershipRegenerate split **done** **390->328** via
ProductPathOwnershipRegenerateTheorems **304**; ParityProgram split **done**
**407->231** via ParityProgramTheorems **239**; IrGraph split **done** **410->177**
via IrGraphTheorems **298**; ParityEmit split **done** **419->240** via
ParityEmitTheorems **243**; EmitProgram split **done** **422->68** via
EmitProgramScaffold **413**; KernelEmit split **done** **425->273** via
KernelEmitTheorems **219**; DualResidual split **done** **427->316** via
DualResidualTheorems **180**; SelfHostBody split **done** **456->328** via
SelfHostBodyTheorems **199**; EmitLinear split **done** **462->62** via
EmitLinearScaffold **464**; EmitTypes split **done** **466->66** via
EmitTypesScaffold **463**; SurfaceMatrix split **done** **475->271** via
SurfaceMatrixTheorems **266**; EmitGraph split **done** **477->69**; KernelProgram
split **done** **508->368** via KernelProgramTheorems **213**; JoinMap split
**done** **519->294** via JoinMapTheorems **284**; SpecProof split **done**
**527->432** via SpecProofTheorems **161**; EmitCompose split **done** **596->75**
via EmitComposeScaffold **590**; FreestandingEmitLoad split **done** **622->235**
via FreestandingEmitLoadScaffold **414**; ProductPath further split **done**
**667->424** via ProductPathTheorems **289**; CapableWriteHc split **done**
**668->316** via CapableWriteHcLoad **401**; HostCompose split **done**
**669->220** via HostComposeTheorems **485**; EmitPlan split **done** **703->424**
via EmitPlanScaffold **332**; EmitApply split **done** **706->423** via
EmitApplyScaffold **336**; EmitBody split **done** **820->480** via
EmitBodyScaffold **394**; ProductPath first split **done** **864->667** via
ProductPathBars **254**; DualEqWriteApi split **done** **877->492** via
DualEqWriteLoad **433**; FreestandingEmit split **done** **1069->439**). No-sorry
host inventory **done** 2026-07-31 (**0** sorry/admit; 3 Linear axioms only;
inventory `doc/dev/research/no-sorry-host-inventory-2026-07-31.md`). CompilePath
seams **done** at **458** (not re-open); SelfApplyFs tip long-file split **done**
**3638->1888** then import-only tip **1895** (campaign tip-split-camp-0731).
ProductPathFreestanding* short names **done**. Dual-pin b1-33 **done** (series
~5755->3638 then tip split to 1888 / living tip **1895**). Dual-pin claim-last theater **exhausted**.
Campaigns: `/tmp/grok-1000/grok-impl-summary-tip-split-camp-0731.md`,
`/tmp/grok-1000/grok-impl-summary-dualpin-camp-b30plus-0731.md`. Long-file /
dual-pin / short-name campaigns **done or parked hygiene**. WATCHER = **implement
Linear subset emit** (ideal M1; plan Step 5). Mult S0-S3 **done**
(`FirstSurface` / `MultSubsetEmit` / `MultSubsetRebuild`). Phase A inventory
**done**
(`doc/dev/research/slake-first-compiler-surface-inventory-2026-08-01.md`). Steps
0-3 free foundation **done** (free true; complete true; Lake host remains). Step
4 held (do not auto-start PROVABLY / LLVM). Product next: Linear subset emit under
Lake; follow-on Linear subset rebuild then M2+; ccomp/CompCert held; never forge
free/PROVABLY or StillUsesLake false.
Short-name batch 8 done (B16 Read family ->
CapableRead + CapableReadMain; dual-pin green). Short-name batch 7 done (B15 step-contract family ->
CapableStepContract + CapableStepContractMain; dual-pin green). Short-name batch 6 done (B20 InstallOut family ->
InstallOut + InstallOutMain; dual-pin green). Short-name batch 5 done (B14 capable-gap family ->
Capable + CapableMain; dual-pin green). Short-name batch 4 done (B21 FullBar family ->
CapableFullBar + CapableFullBarMain; dual-pin green). Short-name batch 3 done (B19 regenerate family ->
CapableRegenerate + CapableRegenerateMain; dual-pin green). Short-name batch 2 done (B32 official-path family ->
OfficialPath + OfficialPathMain; dual-pin green). Short-name batch 1 done (B31 perform evidence family ->
PerformEvidence + PerformEvidenceMain; dual-pin green). Batch 33 done (B2 kernel self-apply family ->
KernelSelfApply; tip dual-pin + freestandingSelfApplyReady chain fold; PartialReady bulk remaining = 0);
Batch 32 done (B3 product Out kernel evidence family ->
ProductOutKernel; tip dual-pin + B2 chain fold); Batch 31 done (B4 Lake bootstrap honesty family ->
BootstrapHonesty; tip 5722->5735 ~flat dual-pin; remains := true kept on tip); Batch 30 done (B5 writer surface family ->
ProductPathWriterSurface; tip 5717->5722 ~flat dual-pin); Batch 29 done (B6 writer path plan family ->
ProductPathWriterPathPlan; tip 5708->5717 ~flat dual-pin); Batch 28 done (B7 writer path exec family ->
ProductPathWriterPathExec; tip 5700->5708 ~flat dual-pin); Batch 27 done (B8 ownership inputs family ->
ProductPathOwnershipInputs; tip 5703->5700 ~flat dual-pin); Batch 26 done (B9 perform gap family ->
ProductPathPerform; tip 5698->5703 ~flat dual-pin); Batch 25 done (B10 STEP perform family ->
ProductPathPerformStep; tip 5695->5698 ~flat dual-pin); Batch 24 done (B11 READ perform family ->
ProductPathReadSsot + ReadSsotMain); Batch 23 done (B12 COMPOSE perform family ->
ProductPathComposePlan + ComposePlanMain; tip 5706->5700); Batch 22 done (B13 WRITE-HC perform family ->
ProductPathWriteHc + WriteHcMain; tip 5712->5706); Batch 21 done (B14 Capable gap family ->
Capable + CapableMain; tip 5743->5712); Batch 20 done (B15 StepContract family ->
CapableStepContract + CapableStepContractMain; short-name batch 7; tip 5778->5743); Batch 19 done (B16 Read family ->
CapableRead (short-name batch 8; was ProductPathFreestandingCapableRead); ReadMain split; tip 5790->5778); Batch 18 done (B17 Compose family ->
CapableCompose; ComposeMain already split; tip 5802->5790); Batch 17 done (B18 WriteHc family ->
CapableWriteHc; WriteHcMain already split; tip 5815->5802); Batch 16 done (B19 Regenerate family ->
CapableRegenerate + CapableRegenerateMain; tip 5830->5815); Batch 15 done (B20 InstallOut family ->
InstallOut (was ProductPathFreestandingCapableInstallOut; short-name batch 6); InstallOutMain already split; tip 5845->5830); Batch 14 done (B21 FullBar family ->
CapableFullBar + FullBarMain; tip 5866->5845); Batch 13 done (B22..B30 ownership regenerate family ->
ProductPathOwnershipRegenerate + OwnershipRegenerateMain; tip 5917->5866); Batch 12 done (B31 perform evidence family ->
ProductPathFreestandingPerformEvidence + EvidenceMain, later renamed PerformEvidence + PerformEvidenceMain; tip 5949->5917); Batch 11 done (B32 official-path family ->
OfficialPath + OfficialPathMain; tip 5979->5949);
batch 10 done (B33 official-path alternate family ->
OfficialPathAlternate + OfficialPathAlternateMain; tip 6016->5979);
batch 9 done (B34 dual-eq WRITE parity family ->
DualEqWriteParity + DualEqualityWriteParityMain; tip 6059->6016);
batch 8 done (B35 dual-eq WRITE close path family ->
DualEqWriteClosePath + DualEqualityWriteClosePathMain; tip 6111->6059);
batch 7 done (B36 dual-eq WRITE API family ->
DualEqWriteApi + DualEqualityWriteApiMain; tip 6162->6111);
batch 6 done (B37 capable gap family ->
DualEqWriteCapableGap + CapableGapMain; tip 6214->6162);
batch 5 done (retire official family -> OfficialRetire +
OfficialRetireMain; tip 6262->6214); batch 4 done (perform family -> PerformClaimed +
PerformClaimedMain; tip 6315->6262); batch 3 done (ownership family -> OwnershipClaimed +
OwnershipClaimedMain; tip 6376->6315); batch 2 done (Full family -> StepContractFull +
StepContractFullMain; tip 6438->6376); batch 1 done (complete -> SelfHostComplete;
tip 6498->6438; inventory companion). Claim B complete **closed** (host elaborator / lake proof required on
`just freestanding-self-host-complete` while bootstrapping -- Lake is bootstrap
only, not freestanding end state; RCA prevention 2026-07-30)
via `just freestanding-step-contract-full` / `StepContractFull` (`stepContractFull` **true**
with ownership-claimed + perform-claimed + official dual-eq WRITE evidence; short living tip);
**partial B40** freestanding ownership **OWNERSHIP-CLAIMED** remains true via
`just freestanding-ownership-claimed` / `OwnershipClaimed` (+ OwnershipClaimedMain Lake entry)
(`productPathFreestandingOwnershipClaimedMeasured` true;
`productPathFreestandingOwnershipClaimed` **true**;
FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed;
`productPathFreestandingPerformClaimed` **true**;
`productPathOfficialPathUsesDualEqualityWrite` true;
`productPathOfficialPathStillUsesFreestandingEmit` false;
`productPathOfficialPathDualEqualityBlocksRetirement` false;
`productPathOfficialPathStillUsesLake` true; official just build ->
freestanding-capable-regenerate dual-eq WRITE; CAPABLE-GAP closed remains B37;
B39 PERFORM-CLAIMED remains; B38 RETIRE-OFFICIAL remains);
B37 CAPABLE-GAP closed true remains; B36 dual-equality WRITE API measured true remains;
B35..B31 measured/claimed remain;
DependsOnLake true;
B30 product path authority + WithoutLake true remain; B29 process-glue join remains;
claim B complete closed (Full met);
B28 CapableWriteHc true (B37 dual-eq live); B27 CapableCompose true; B26 CapableRead true remain;
FullBar CapableLakeFree true; B22..B25 ownership path pieces remain; Full true; complete true (claim B);
B21 Full bar closed pins true / CapableLakeFree true / WithoutLake true after B30;
host B11..B40 + Full landed;
`productPathFreestandingPerformClaimed` true; `productPathFreestandingOwnershipClaimed`
true; `stepContractFull` true; complete true). Done (archive): **Full step-contract**
(stepContractFull true; ownership/perform true; complete true);
**Product path freestanding ownership OWNERSHIP-CLAIMED** (B40 partial; ownership claimed true
with perform-claimed + dual-eq WRITE; FULL-BAR-REQ closed; land-time Full false);
**Product path freestanding perform PERFORM-CLAIMED** (B39 partial; perform claimed true with
official dual-eq WRITE; FULL-BAR-REQ closed; land-time ownership false); **Product path
freestanding perform RETIRE-OFFICIAL** (B38 partial; RETIRE-OFFICIAL measured true; official
dual-eq WRITE; StillUsesFreestandingEmit false; Blocks false; land-time perform claimed false);
**Product path freestanding perform dual-equality WRITE CAPABLE-GAP** (B37 partial; CAPABLE-GAP measured true; gap closed true; dual-eq live true; step advanced; gap open false; perform claimed false);
**Product path freestanding perform dual-equality WRITE API** (B36 partial; API measured true; present true; authority not emit; not official; step advanced; land-time gap open true; SelfApplyFs SSoT gap closed after B37; perform claimed false);
**Product path freestanding perform dual-equality WRITE close path** (B35 partial; close path measured true; named true; not gap closed at land; SSoT gap closed after B37; perform claimed false);
**Product path freestanding perform dual-equality WRITE parity** (B34 partial; parity measured true; gap open true; perform claimed false);
**Product path freestanding perform official-path alternate** (B33 partial; alternate measured true; perform claimed false);
**Product path freestanding perform official-path gap** (B32 partial; gap measured true; perform claimed false);
**Product path freestanding perform evidence** (B31 partial; evidence claimed true; perform claimed false);
**Product path ownership regenerate product path authority / WithoutLake** (B30 partial);
**Ownership regenerate Lake-free ordered join** (B29 partial); **Freestanding-capable
WRITE-HC Lake-free / CapableWriteHc** (B28 partial); **Freestanding-capable COMPOSE
Lake-free / CapableCompose** (B27 partial); **Freestanding-capable READ Lake-free /
CapableRead** (B26 partial); **Ownership regenerate WRITE-HC Lake-free** (B25 partial);
**Ownership regenerate COMPOSE Lake-free** (B24 partial); **Ownership regenerate READ
Lake-free** (B23 partial); **Ownership regenerate substrate** (B22 partial);
**Freestanding-capable Full bar measure** (B21 partial); **Freestanding-capable Install
Out** (B20 partial); **Freestanding-capable ordered regenerate** (B19 partial);
**Freestanding-capable WRITE-HC** (B18 partial); **Freestanding-capable COMPOSE**
(B17 partial); **Freestanding-capable READ** (B16 partial); **Freestanding-capable
step contract** (B15 partial); **Freestanding-capable gap measure** (B14 partial);
**Host product-path WRITE-HC** (B13 partial); **Host product-path COMPOSE plan**
(B12 partial); **Host product-path READ SSOT** (B11 partial); **Dual SSOT equality
gate**; **Host owns freestanding banner text** (HOST-EMIT-BANNER); Track 4 A
**Product residual free gate** (measurement; `residualFreeClaimed` stayed false);
Track 3 B/B2..B36 partial; Track 2 Mult..Out unit e2e; Track 1 host-owned
Mult..Out emit (residual stage name **Out**); **defined freestanding compile
step** (`SelfHostBody`); dual algorithms into
Slake; thin process glue. Detail: **`RESIDUAL-systems.md`**. Join board:
**`RESIDUAL.md`** (see **Remaining work and highest value next**). Watcher:
**`WATCHER.md`**.
**Product program plan (claims A-F):**
`.agents/plans/plan-close-six-claims.md` (section 3/7/8/11b13: Track 1 Mult..Out +
banner **CLOSED**; Track 2 Mult..Out e2e **CLOSED**; Dual SSOT **done**; Track 3
B/B2..B40 **partial** + Full + claim B complete **true** (
stepContractFull **true**; ownership claimed **true**; perform claimed **true**;
StillUsesFreestandingEmit false; B38 RETIRE-OFFICIAL / B37 CAPABLE-GAP / B36..B31
measured remain; B30 WithoutLake true; B29 join claimed; Capable* true; FullBar
CapableLakeFree true); Track 4 A **measurement closed** (free claim still **false**);
claim B complete closed; next short-name rename and/or free/C/D/E held programs; Out-first; three languages only; Phase C
RC/TLS/atomic/parallel conditional; E/D held (B complete closed); F duals parallel; C
proofs continuous; lean4 skill on Lean paths).
Residual schema:
`.agents/plans/plan-unambiguous-residual-work.md`. Still **not** residual free
claimed, freestanding product self-host complete **true**, **not** PROVABLY,
**not** proof complete; llvm deferred. Naming: residual emit stage **Out** <->
wire `EMIT_BODY_V0`; product **Out (release)** = `out/freestanding-c/`;
SelfHostBody prose = defined freestanding compile step.
Product wire / host model jargon: `doc/vocabulary.md`. Ownership:
`emit/host-owned-emit.md`. Acceptance: `src/systems/self-host.md`.

**Next:** **Residual free claim** (plan Step 3; complete true; free false until
checklist 2-10 green; Lake host remains; never forge).
Step 2 Linear freestanding contracts done. Step 1 free bar inventory done
(`doc/dev/research/residual-free-bar-inventory-2026-08-01.md`).
Long-file hygiene parked (Linear last **118->92**).
KernelSelfApply split **done** **125->105** (KernelSelfApplyTheorems **101**).
ProductOutKernel split **done** **130->106** (ProductOutKernelTheorems **105**).
ProductPathPerform split **done** **137->134** (ProductPathPerformTheorems **80**).
ProductPathOwnershipInputs split **done** **141->136** (ProductPathOwnershipInputsTheorems **87**).
BootstrapHonesty split **done** **142->111** (BootstrapHonestyTheorems **111**).
ProductPathWriterPathPlan split **done** **143->136** (ProductPathWriterPathPlanTheorems **167**).
ProductPathWriterSurface split **done** **147->134** (ProductPathWriterSurfaceTheorems **186**).
ProductPathPerformStep split **done** **152->147** (ProductPathPerformStepTheorems **165**).
ProductPathWriterPathExec split **done** **169->162** (ProductPathWriterPathExecTheorems **163**).
Mult split **done** **184->90** (MultTheorems **148**).
ProductPathWriteHc split **done** **194->181** (ProductPathWriteHcTheorems **187**).
ProductPathReadSsot split **done** **208->197** (ProductPathReadSsotTheorems **171**).
CapableRegenerate split **done** **218->208** (CapableRegenerateTheorems **228**).
CapableFullBar split **done** **231->219** (CapableFullBarTheorems **293**).
ProductPathComposePlan split **done** **251->247** (ProductPathComposePlanTheorems **181**).
PerformEvidence split **done** **255->233** (PerformEvidenceTheorems **284**).
OfficialPath split **done** **256->245** (OfficialPathTheorems **286**).
Capable split **done** **258->233** (CapableTheorems **279**).
InstallOut split **done** **279->272** (InstallOutTheorems **249**).
CapableStepContract split **done** **286->262** (CapableStepContractTheorems **280**).
CapableRead split **done** **297->288** (CapableReadTheorems **191**).
OfficialPathAlternate split **done** **310->295** (OfficialPathAlternateTheorems **328**).
DualEqWriteParity split **done** **319->302** (DualEqWriteParityTheorems **321**).
OfficialRetire split **done** **322->316** (OfficialRetireTheorems **293**).
ParityTypes split **done** **279->171** (ParityTypesTheorems **168**).
Types split **done** **302->151** (TypesTheorems **215**).
ParityLinear split **done** **304->176** (ParityLinearTheorems **189**).
EmitBanner split **done** **327->63** (EmitBannerScaffold **325**).
SelfHost split **done** **342->164** (SelfHostTheorems **240**).
KernelLinear split **done** **343->229** (KernelLinearTheorems **184**).
Extract split **done** **344->156** (ExtractTheorems **253**).
KernelTypes split **done** **345->214** (KernelTypesTheorems **201**).
PerformClaimed split **done** **345->331** (PerformClaimedTheorems **294**).
DualEqWriteClosePath split **done** **354->344** (DualEqWriteClosePathTheorems **314**).
DualEqWriteCapableGap split **done** **354->340** (DualEqWriteCapableGapTheorems **309**).
SelfHostComplete split **done** **363->338** (SelfHostCompleteTheorems **252**).
OwnershipClaimed split **done** **367->342** (OwnershipClaimedTheorems **247**).
EmitExtract split **done** **370->70** (EmitExtractScaffold **361**).
ProbeWire split **done** **379->288** (ProbeWireTheorems **163**).
ParityMult split **done** **382->183** (ParityMultTheorems **265**).
ProductPathOwnershipRegenerate split **done** **390->328**
(ProductPathOwnershipRegenerateTheorems **304**).
ParityProgram split **done** **407->231** (ParityProgramTheorems **239**). IrGraph split
**done** **410->177** (IrGraphTheorems **298**). ParityEmit split **done** **419->240**
(ParityEmitTheorems **243**). EmitProgram split **done** **422->68** (EmitProgramScaffold
**413**). KernelEmit split **done** **425->273** (KernelEmitTheorems **219**). DualResidual
split **done** **427->316** (DualResidualTheorems **180**). SelfHostBody split **done**
**456->328** (SelfHostBodyTheorems **199**). EmitLinear split **done** **462->62**
(EmitLinearScaffold **464**). EmitTypes split **done** **466->66** (EmitTypesScaffold **463**).
SurfaceMatrix split **done** **475->271** (SurfaceMatrixTheorems **266**). EmitGraph split
**done** **477->69** (EmitGraphScaffold **474**). KernelProgram split **done** **508->368**
(KernelProgramTheorems **213**). JoinMap split **done** **519->294** (JoinMapTheorems **284**).
SpecProof split **done** **527->432** (SpecProofTheorems **161**). EmitCompose split **done**
**596->75** (EmitComposeScaffold **590**). FreestandingEmitLoad split **done** **622->235**.
ProductPath further split **done** **667->424**. CapableWriteHc split **done** **668->316**.
HostCompose split **done** **669->220**. EmitPlan split **done** **703->424**. EmitApply split
**done** **706->423**. EmitBody split **done** **820->480**. DualEqWriteApi split **done**
**877->492** (DualEqWriteLoad **433**). FreestandingEmit split **done** **1069->439**.
No-sorry inventory **done** (**0** sorry/admit; inventory
`doc/dev/research/no-sorry-host-inventory-2026-07-31.md`). CompilePath seams
**done** at **458** (not re-open). SelfApplyFs tip split **done** **3638->1888**. Short-name
ProductPathFreestanding* **done**. Dual-pin theater exhausted. Plan:
`plan-residual-free-freestanding.md` (living product program); long-file plan is
hygiene only. WATCHER = Residual free claim (plan Step 3). Linear freestanding
contracts done. Step 1 free bar inventory done. Claim B complete closed with lake
proof; product residual free false (checklist 2-10 open); do not forge free/llvm/PROVABLY.
Living perform/ownership/complete true; StillUsesFreestandingEmit false;
StillUsesLake true; DependsOnLake true.
Batch 16 split: B19 Regenerate PartialReady/Ok bulk in CapableRegenerate + RegenerateMain.
Batch 15 split: B20 InstallOut PartialReady/Ok bulk in InstallOut (InstallOutMain already split; short-name batch 6).
Batch 14 split: B21 FullBar PartialReady/Ok bulk in CapableFullBar + FullBarMain.
Batch 9 split: B34 dual-eq WRITE parity PartialReady/Ok bulk in DualEqWriteParity + DualEqualityWriteParityMain.
Batch 8 split: B35 dual-eq WRITE close path PartialReady/Ok bulk in DualEqWriteClosePath + DualEqualityWriteClosePathMain.
Batch 7 split: B36 dual-eq WRITE API PartialReady/Ok bulk in DualEqWriteApi + DualEqualityWriteApiMain.
Batch 6 split: B37 capable-gap PartialReady/Ok bulk in DualEqWriteCapableGap + CapableGapMain.
Batch 5 split: retire official PartialReady/Ok bulk in OfficialRetire + OfficialRetireMain.
Batch 4 split: perform PartialReady/Ok bulk in PerformClaimed + PerformClaimedMain.
Batch 3 split: ownership PartialReady/Ok bulk in OwnershipClaimed + OwnershipClaimedMain.

Living tip pins:
`stepContractFull` **true**;
`productPathFreestandingPerformClaimed` **true**;
`productPathFreestandingOwnershipClaimed` **true**;
`productPathOfficialPathUsesDualEqualityWrite` true;
`productPathOfficialPathStillUsesFreestandingEmit` false;
`productPathOfficialPathDualEqualityBlocksRetirement` false;
`productPathOfficialPathStillUsesLake` true;
`freestandingProductSelfHostComplete` **true** (claim B complete closed).
Product residual free stays **false** until the free bar and honesty modules agree.
Do not forge residual free / proof complete / llvm unlock. Do not re-open claim B.
Do not re-land B6..B40 or Full as open product work (including Full step-contract / B40 OWNERSHIP-CLAIMED
/ B39 PERFORM-CLAIMED / B38 RETIRE-OFFICIAL / B37 CAPABLE-GAP theater).
Watcher tip: Partial **complete** after Full step-contract (`WATCHER.md`); Full landed
(stepContractFull true; ownership claimed true; perform claimed true; complete true;
StillUsesFreestandingEmit false).

### Decisions and discovery (survive compaction)

Read this block after status. Detail lives in the linked paths -- do not re-derive
from chat.

| Topic | Decision / fact | Where documented |
|-------|-----------------|------------------|
| Goal / north star | Systems Lean + Slake; freestanding runtimeless C primary product; isolation; self-host is freestanding product path (claim B), not Lake twin as product | `doc/goals.md`, this file North star, plan-close-six-claims |
| Out-first product | Product consumers = `out/freestanding-c/`; `src/systems/emit/` = host freestanding workspace (SSOT + templates + dogfood); freestanding C generated only (three languages only) | `doc/vocabulary.md`, `emit/host-owned-emit.md`, plan section 3/8 |
| Three languages only | Novel work: Idris 2 / Lean 4 / pure Nix only; no handwritten product C residual; no Python; no new shell mills | `AGENTS.md`, `doc/vocabulary.md` |
| Project Lean agent skill | Submodule `skills/lean4-skills`; discover `.agents/skills/lean4`; use for host Lean residual/plans (draft/prove/review/doctor); not under `ref/` | `AGENTS.md` (**Project agent skills** + **When to reach for lean4 tools**), `skills/README.md`, `doc/lean-entry.md` |
| Open residual | **Residual free claim** (plan Step 3); Linear freestanding contracts **done**; Step 1 free bar inventory **done**; complete true; product residual free false (checklist 2-10 open); Lake host remains; long-file campaign parked hygiene | `RESIDUAL-systems.md`, `WATCHER.md`, `plan-residual-free-freestanding.md` |
| Plan approval notes (2026-07-31) | Chip away >1 KLOC was hygiene; living product program is residual free + linear freestanding; free claim only when bar met; ccomp/CompCert held; never forge free/PROVABLY | `.agents/plans/plan-residual-free-freestanding.md`; `plan-long-file-refactor.md` hygiene only |
| SelfApplyFs rebuild RCA | 2026-07-30 failed `/tmp` full-file stitch left four `====` markers + foreign paste; grep-only GREEN lied. Prevention: hygiene marker ban; lake on complete recipe; AGENTS no-stitch / claim-bool lake law | `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md`; `.agents/plans/plan-selfapplyfs-rca-prevention.md`; `nix/source-hygiene.nix`; `AGENTS.md` Product Lean edits |
| Product program | Claim B complete **true**; product residual free **false**; Lake host still used; living program = residual free + linear freestanding (Steps 0-3); long-file hygiene parked; C/D/E false/held | `.agents/plans/plan-residual-free-freestanding.md`; historical `.agents/plans/plan-close-six-claims.md` (section 0 living tip wins) |
| B6 writer path plan | Ordered freestanding-capable regenerate steps (READ-SSOT, COMPOSE-PLAN-APPLY-BODY, WRITE-FREESTANDING-HC, INSTALL-OUT); plan substrate only; Lake bootstrap remains; complete false | `self-host.md` SELF-HOST-PRODUCT-WRITER-PATH-PLAN; `SelfApplyFs.productWriterPathPlanPartialReady` |
| B7 writer path execution | Host FreestandingEmit + just build perform B6 plan steps (load/render/write/install cites); still Lake bootstrap; complete false | `self-host.md` SELF-HOST-PRODUCT-WRITER-PATH-EXEC; `SelfApplyFs.productWriterPathExecutionPartialReady` |
| B8 ownership inputs | Mult..Out SSOT + emit + Out surfaces; Ok/PartialReady bulk in ProductPathOwnershipInputs (batch-27); living tip ownership claimed true after B40 | `self-host.md` SELF-HOST-PRODUCT-PATH-OWNERSHIP; `SelfApplyFs.productPathOwnershipInputsPartialReady`; `ProductPathOwnershipInputs` |
| B9 perform gap | Lake still read/compose/write; install step mechanism; Ok/PartialReady bulk in ProductPathPerform (batch-26); living tip perform claimed true after B39 | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM; `SelfApplyFs.productPathPerformPartialReady`; `ProductPathPerform` |
| B10 perform step | Lake-free install entrypoint `just install-freestanding-c-out`; entrypoint claimed true; DependsOnLake true; Ok/PartialReady bulk in ProductPathPerformStep (batch-25) | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-STEP; `SelfApplyFs.productPathPerformStepPartialReady`; `ProductPathPerformStep` |
| B11 perform READ | Decomposed dual SSOT read ProductPathReadSsot + `just read-product-ssot`; ReadDependsOnLake true; perform claimed false | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-READ; `SelfApplyFs.productPathPerformReadPartialReady` |
| B12 perform COMPOSE | Decomposed plan/apply/body compose ProductPathComposePlan + `just compose-product-plan`; ComposeDependsOnLake true; perform claimed false; not full FreestandingEmit template embed | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE; `SelfApplyFs.productPathPerformComposePartialReady` |
| B13 perform WRITE-HC | Decomposed freestanding .h/.c write ProductPathWriteHc + `just write-freestanding-hc` -> FreestandingEmit.emitAtRoot; WriteHcDependsOnLake true; perform claimed false; not freestanding WRITE close | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC; `SelfApplyFs.productPathPerformWriteHcPartialReady` |
| B14 freestanding-capable gap | Gap measure install Lake-free true; CapableRead true after B26; CapableCompose true after B27; CapableWriteHc true after B28; full perform false; `just regenerate-product-path` ordered host join; `just freestanding-capable-read-lake-free` + `just freestanding-capable-compose-lake-free` + `just freestanding-capable-write-hc-lake-free`; perform claimed false | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP; `SelfApplyFs.productPathFreestandingCapablePartialReady` |
| B15 freestanding-capable step contract | Named freestanding-capable READ/COMPOSE/WRITE-HC contracts + freestandingCapable* API surface; authority-not-emit true; ReadSatisfied true after B16; ComposeSatisfied true after B17; WriteHcSatisfied true after B18; Full false; B14 CapableRead true after B26; CapableCompose true after B27; CapableWriteHc true after B28; perform claimed false; complete false; `just freestanding-capable-step-contract` | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT; `SelfApplyFs.productPathFreestandingCapableStepContractPartialReady`; `CapableStepContract` |
| B16 freestanding-capable READ | Real `freestandingCapableReadDualSsot` (token + HEADER/BODY structural dual SSOT; no FreestandingEmit import); ReadSatisfied true; B14 CapableRead true after B26; DependsOnLake true (Lake exe diagnostic); perform claimed false; complete false; `just freestanding-capable-read` + `just freestanding-capable-read-lake-free` | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ; `SelfApplyFs.productPathFreestandingCapableReadPartialReady`; `CapableRead` |
| B17 freestanding-capable COMPOSE | Real `freestandingCapableComposePlanApplyBody` (plan/apply/body token + HEADER/BODY + ordered marker; no FreestandingEmit import); ComposeSatisfied true; B14 CapableCompose true after B27; DependsOnLake true (Lake exe diagnostic); perform claimed false; complete false; `just freestanding-capable-compose` + `just freestanding-capable-compose-lake-free` | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE; `SelfApplyFs.productPathFreestandingCapableComposePartialReady`; `CapableCompose` |
| B18 freestanding-capable WRITE-HC | Real `freestandingCapableWriteFreestandingHc` (dual SSOT HEADER/BODY + template embed + write emit .h/.c; no FreestandingEmit import); WriteHcSatisfied true; B14 CapableWriteHc true after B28; DependsOnLake true (Lake exe diagnostic); Full false; perform claimed false; complete false; `just freestanding-capable-write-hc` + `just freestanding-capable-write-hc-lake-free` | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC; `SelfApplyFs.productPathFreestandingCapableWriteHcPartialReady`; `CapableWriteHc` |
| B19 freestanding-capable ordered regenerate | Real `freestandingCapableOrderedRegenerate` (READ then COMPOSE then WRITE-HC then Install Out; no FreestandingEmit import); Full false; InstallOutOpen false after B20; DependsOnLake true (Lake exe host); perform claimed false; complete false; `just freestanding-capable-regenerate` | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE; `SelfApplyFs.productPathFreestandingCapableRegeneratePartialReady`; `CapableRegenerate` |
| B20 freestanding-capable Install Out | Real `freestandingCapableInstallFreestandingOut` (emit .h/.c -> out/freestanding-c/; no FreestandingEmit import); Full false; InstallOutOpen false; DependsOnLake true (Lake exe host); perform claimed false; complete false; `just freestanding-capable-install-out` | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT; `SelfApplyFs.productPathFreestandingCapableInstallOutPartialReady`; `InstallOut` |
| B21 freestanding-capable Full bar | Full-bar / ownership-gap measure: closed step contracts + InstallOut + ordered regenerate true; ownership regenerate WithoutLake true after B30 (measure of closed dual-pin); CapableLakeFree true after B26+B27+B28 (Read+Compose+WriteHc); Full false; DependsOnLake true (Lake diagnostic host); perform claimed false; ownership claimed false; complete false; `just freestanding-capable-full-bar` | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR; `SelfApplyFs.productPathFreestandingCapableFullBarPartialReady`; `CapableFullBar` |
| B22 ownership regenerate substrate | Ownership regenerate path: install Lake-free true (`just ownership-regenerate-install-only`); WithoutLake true (B30); DependsOnLake true; ownership claimed false; perform claimed false; complete false; `just ownership-regenerate` | `self-host.md` SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE; `SelfApplyFs.productPathOwnershipRegeneratePartialReady`; `ProductPathOwnershipRegenerate` |
| B23 ownership regenerate READ Lake-free | Ownership regenerate READ path piece: READ Lake-free true (`just ownership-regenerate-read-only` dual SSOT presence+token; no lake); WithoutLake true (B30); DependsOnLake true; distinct from B26 CapableRead freestanding-capable-read-lake-free; ownership claimed false; perform claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE; `SelfApplyFs.productPathOwnershipRegenerateReadLakeFree`; `ProductPathOwnershipRegenerate` |
| B24 ownership regenerate COMPOSE Lake-free | Ownership regenerate COMPOSE path piece: COMPOSE Lake-free true (`just ownership-regenerate-compose-only` plan/apply/body presence+token; no lake); WithoutLake true (B30); DependsOnLake true; distinct from B27 CapableCompose freestanding-capable-compose-lake-free; ownership claimed false; perform claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE; `SelfApplyFs.productPathOwnershipRegenerateComposeLakeFree`; `ProductPathOwnershipRegenerate` |
| B25 ownership regenerate WRITE-HC Lake-free | Ownership regenerate WRITE-HC path piece: WRITE-HC Lake-free true (`just ownership-regenerate-write-hc-only` freestanding .h/.c presence+token; no lake); WithoutLake true (B30) (path pieces != freestanding Capable* / Full dual-pin); DependsOnLake true; B14 CapableWriteHc was false at B25 land (true after B28 freestanding-capable-write-hc-lake-free); ownership claimed false; perform claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE; `SelfApplyFs.productPathOwnershipRegenerateWriteHcLakeFree`; `ProductPathOwnershipRegenerate` |
| B26 freestanding-capable READ Lake-free / CapableRead | First B14 CapableRead true: `just freestanding-capable-read-lake-free` Mult..Out token+HEADER/BODY structural (no lake; freestanding-capable contract depth matching B16); not ownership-regenerate-read-only; WithoutLake true (B30); Full false; CapableWriteHc true after B28; perform claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP / READ; `SelfApplyFs.productPathFreestandingCapableRead`; `Capable` |
| B27 freestanding-capable COMPOSE Lake-free / CapableCompose | First B14 CapableCompose true: `just freestanding-capable-compose-lake-free` plan/apply/body token+HEADER/BODY structural (no lake; freestanding-capable contract depth matching B17); not ownership-regenerate-compose-only; WithoutLake true (B30); Full false; CapableWriteHc true after B28; CapableRead true remains; perform claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP / COMPOSE; `SelfApplyFs.productPathFreestandingCapableCompose`; `Capable` |
| B28 freestanding-capable WRITE-HC Lake-free / CapableWriteHc | First B14 CapableWriteHc true: `just freestanding-capable-write-hc-lake-free` Mult..Out dual SSOT token+HEADER/BODY + write substrate (templates + freestanding .h/.c stage token + host markers; no lake; freestanding-capable contract depth matching B18); not ownership-regenerate-write-hc-only; FullBar CapableLakeFree true; WithoutLake true (B30); Full false; CapableRead+Compose true remain; perform claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP / WRITE-HC; `SelfApplyFs.productPathFreestandingCapableWriteHc`; `Capable` |
| B29 ownership regenerate Lake-free ordered join | Ordered Lake-free join claimed: `just ownership-regenerate-lake-free` runs freestanding-capable-*-lake-free then ownership-regenerate-*-only then install (no lake); `productPathOwnershipRegenerateLakeFreeJoinClaimed` true; WithoutLake true (B30) (join measure != freestanding product path authority); Full false; DependsOnLake true; ownership claimed false; perform claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE; `SelfApplyFs.productPathOwnershipRegenerateLakeFreeJoinClaimed`; `ProductPathOwnershipRegenerate` |
| B30 ownership regenerate product path authority / WithoutLake | Freestanding product path authority claimed: `just ownership-regenerate-product-path-authority` (AuthorityNotEmit pins + freestanding-capable-*-lake-free + install; no lake; not B29 join rebrand); `productPathOwnershipRegenerateProductPathAuthorityClaimed` true; `productPathOwnershipRegenerateWithoutLake` true; FullBar dual-pin true; Full false; perform claimed false; ownership claimed false; complete false; DependsOnLake true | `self-host.md` SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE; `SelfApplyFs.productPathOwnershipRegenerateProductPathAuthorityClaimed`; `ProductPathOwnershipRegenerate`; `CapableFullBar` |
| B31 freestanding perform evidence | Freestanding perform **evidence claimed** true: `just freestanding-perform-evidence` (AuthorityNotEmit + freestandingCapable* APIs + Capable* lake-free + install under perform framing; not B30 ownership authority rebrand); `productPathFreestandingPerformEvidenceClaimed` true; land-time perform claimed false / DependsOnLake true on home; living tip later cliffs may be true | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE; `SelfApplyFs.productPathFreestandingPerformEvidencePartialReady`; short role module `PerformEvidence` (+ `PerformEvidenceMain`) |
| B38 freestanding perform RETIRE-OFFICIAL | Official FreestandingEmit **retired** with dual-eq WRITE: `just freestanding-retire-official` (just build -> freestanding-capable-regenerate; OfficialRetire short module; B37 CAPABLE-GAP re-green; not B37 rebrand as perform claimed); `productPathOfficialPathRetireOfficialMeasured` true; `productPathOfficialPathUsesDualEqualityWrite` true; `productPathOfficialPathStillUsesFreestandingEmit` false; `productPathOfficialPathDualEqualityBlocksRetirement` false; `productPathOfficialPathRetireFreestandingEmitRequired` false; `productPathOfficialPathStillUsesLake` true; `productPathFreestandingPerformClaimed` false proved; DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open; Full false; ownership claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL; `SelfApplyFs.productPathOfficialPathRetireOfficialPartialReady`; `OfficialRetire` |
| B37 freestanding perform dual-equality WRITE CAPABLE-GAP | Dual-equality WRITE **CAPABLE-GAP closed** true: `just freestanding-perform-dual-equality-write-capable-gap` (Capable WRITE dual-eq live Emit* + requireDualSsotEqual + write; gap closed; gap open false; B36 API re-green; land-time StillUses true; SelfApplyFs living tip after B38 StillUses false; not B36 rebrand as perform claimed); `productPathFreestandingPerformDualEqualityWriteCapableGapMeasured` true; `productPathDualEqualityWriteCapableGapClosed` true; `productPathCapableWriteDualEqualityLive` true; `productPathDualEqualityWriteCapableGapStepAdvanced` true; `productPathDualEqualityWriteParityGapOpen` false; `productPathCapableWriteStructuralNotDualEquality` false; `productPathFreestandingPerformClaimed` false proved; DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open; Full false; ownership claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP; `SelfApplyFs.productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady`; `DualEqWriteCapableGap`; `CapableWriteHc` |
| B36 freestanding perform dual-equality WRITE API | Dual-equality freestanding WRITE **API measured** true: `just freestanding-perform-dual-equality-write-api` (Emit* + requireDualSsotEqual + write; present; authority not emit; not official; step advanced; land-time gap open; SelfApplyFs SSoT gap closed after B37; B35 close path re-green; not B35 rebrand as perform claimed); `productPathFreestandingPerformDualEqualityWriteApiMeasured` true; present / authority not emit / not official / step advanced true; `productPathFreestandingPerformClaimed` false proved; DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open; Full false; ownership claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API; `SelfApplyFs.productPathFreestandingPerformDualEqualityWriteApiPartialReady`; `DualEqWriteApi` |
| B35 freestanding perform dual-equality WRITE close path | Dual-equality WRITE **close path measured** true: `just freestanding-perform-dual-equality-write-close-path` (ordered close-path steps named + land-time not gap closed + B34 parity re-green; not B34 parity rebrand as gap closed or perform claimed); `productPathFreestandingPerformDualEqualityWriteClosePathMeasured` true; `productPathDualEqualityWriteClosePathNamed` true; SelfApplyFs SSoT gap closed after B37; `productPathOfficialPathDualEqualityBlocksRetirement` true; StillUsesFreestandingEmit true; RetireRequired true; `productPathFreestandingPerformClaimed` false proved; DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open; Full false; ownership claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH; `SelfApplyFs.productPathFreestandingPerformDualEqualityWriteClosePathPartialReady`; `DualEqWriteClosePath` |
| B34 freestanding perform dual-equality WRITE parity | Dual-equality WRITE **parity measured** true: `just freestanding-perform-dual-equality-write-parity` (Capable WRITE structural HEADER/BODY embed vs FreestandingEmit DUAL-SSOT-EQUALITY / requireDualSsotEqual gap open + B33 alternate re-green; not B33 alternate rebrand as perform claimed; not dual-equality closed); `productPathFreestandingPerformDualEqualityWriteParityMeasured` true; `productPathDualEqualityWriteParityGapOpen` true; `productPathCapableWriteStructuralNotDualEquality` true; `productPathOfficialPathDualEqualityBlocksRetirement` true; StillUsesFreestandingEmit true; RetireRequired true; `productPathFreestandingPerformClaimed` false proved; DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open; Full false; ownership claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY; `SelfApplyFs.productPathFreestandingPerformDualEqualityWriteParityPartialReady`; `DualEqWriteParity` |
| B33 freestanding perform official-path alternate | Official-path **alternate measured** true: `just freestanding-perform-official-path-alternate` (freestanding-capable-regenerate alternate present + not official + dual-equality blocks retirement + B32 gap re-green; not B32 gap rebrand as perform claimed); `productPathFreestandingPerformOfficialPathAlternateMeasured` true; `productPathOfficialPathDualEqualityBlocksRetirement` true; `productPathFreestandingPerformClaimed` false proved; DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open; Full false; ownership claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE; `SelfApplyFs.productPathFreestandingPerformOfficialPathAlternatePartialReady`; `OfficialPathAlternate` |
| B32 freestanding perform official-path gap | Official-path **gap measured** true: `just freestanding-perform-official-path` (dual-pin official path still Lake FreestandingEmit / just build + B31 evidence re-green; not B31 evidence rebrand as perform claimed); `productPathFreestandingPerformOfficialPathGapMeasured` true; `productPathFreestandingPerformClaimed` false proved; DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open; Full false; ownership claimed false; complete false | `self-host.md` SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH; `SelfApplyFs.productPathFreestandingPerformOfficialPathPartialReady`; `OfficialPath` |
| Track 3 B evidence | Acceptance + measured `just build` regenerate Mult..Out HOST-EMIT-* on emit/out; freestanding cc green; complete stayed false | `self-host.md` SELF-HOST-KERNEL-REBUILD, `RESIDUAL-systems.md` Done |
| Track 3 B2 product kernel self-application | Acceptance SELF-HOST-KERNEL-SELF-APPLY; SelfApplyFs `productKernelSelfApplyPartialReady`; pure Nix emit/out match; complete stayed false | `self-host.md`, `SelfApplyFs.lean`, `nix/systems-emit-wire/default.nix` |
| Track 3 B3 product Out kernel evidence | Acceptance SELF-HOST-PRODUCT-OUT; SelfApplyFs `productOutKernelEvidencePartialReady`; pure Nix Out B-bar ownership+APIs; complete stayed false | `self-host.md`, `SelfApplyFs.lean`, `nix/systems-emit-wire/` |
| Track 3 B4 product path Lake bootstrap | Acceptance SELF-HOST-PRODUCT-PATH-BOOTSTRAP; SelfApplyFs `productPathHostLakeBootstrapPartialReady` / `productPathHostLakeBootstrapRemains` true; pure Nix writer+honesty; complete stayed false | `self-host.md`, `SelfApplyFs.lean`, `nix/systems-emit-wire/` |
| Track 3 B5 product writer surface | Acceptance SELF-HOST-PRODUCT-WRITER-SURFACE; SelfApplyFs `productWriterSurfacePartialReady`; pure Nix plan/apply/body + ownership on Out; B4 bootstrap remains; complete stayed false | `self-host.md`, `SelfApplyFs.lean`, `nix/systems-emit-wire/` |
| Track 4 A residual free measurement | Acceptance SELF-HOST-RESIDUAL-FREE-MEASURE; pure Nix PRODUCT-RESIDUAL-FREE-MEASURE on release; DualResidual free stayed false; measure green != free claimed | `self-host.md`, `DualResidual.lean`, `nix/systems-emit-wire/residual-free-measure.nix` |
| Naming: emit stage **Out** vs product Out | Emit stage **Out** = last Mult..* stage (`EMIT_BODY_V0`); product **Out (release)** = `out/freestanding-c/`; host workspace = `emit/` | `emit/host-owned-emit.md`, `doc/vocabulary.md`, `RESIDUAL-systems.md` Decisions |
| Naming: freestanding compile step | SelfHostBody prose = defined freestanding compile step / self-host step readiness; not claim B complete | `vocabulary.md`, `self-host.md`, `SelfHostBody.lean` |
| Parent coordinator / subagents | Parent = HITL goals + spawn/wait + join on disk; multi-file residual research/impl in subagents | `AGENTS.md` (global + project), plan-close-six-claims process |
| Plan defaults = residual work | Durable plan with checkable Done when is residual work: open Name and implement; ban empty-Open done-for-now / "wait for human Open" while plan still has a next checkable phase | `AGENTS.md` autonomy + residual implement loop (**Clear plan defaults**) |
| Mult e2e compile path | Track 2 Mult fixture closed: `multFixtureCompilePathReady` (grades -> IR -> compose -> HOST-EMIT-MULT); free/complete stay false | `CompilePathMult.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Linear e2e compile path | Track 2 Linear fixture closed: `linearFixtureCompilePathReady` (MULT-1 -> IR -> mint/consume -> HOST-EMIT-LINEAR); free/complete stay false | `CompilePathLinear.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Types e2e compile path | Track 2 Types fixture closed: `typesFixtureCompilePathReady` (TYPED_IR kind/mult -> IR -> compose -> HOST-EMIT-TYPES); free/complete stay false | `CompilePathTypes.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Program e2e compile path | Track 2 Program fixture closed: `programFixtureCompilePathReady` (multi-node IR + fold -> compose -> HOST-EMIT-PROGRAM); free/complete stay false | `CompilePathProgram.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Extract RUNTIME-FS gate | Track 2 extract gate closed: `extractRuntimeFsGateReady` on Mult + Program fixtures (classic/edge reject; RUNTIME-FS accept); free/complete stay false | `CompilePathExtract.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Graph e2e compile path | Track 2 Graph fixture closed: `graphFixtureCompilePathReady` (multi-node IR + edges -> compose -> HOST-EMIT-GRAPH); free/complete stay false | `CompilePathGraph.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Compose e2e compile path | Track 2 Compose fixture closed: `composeFixtureCompilePathReady` (multi-node + edges + mark/mint/consume -> HOST-EMIT-COMPOSE); free/complete stay false | `CompilePathCompose.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Erasure e2e compile path | Track 2 Erasure fixture closed: `erasureFixtureCompilePathReady` (MULT-0 mark-only -> HOST-EMIT-ERASURE); free/complete stay false | `CompilePathErasure.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Plan e2e compile path | Track 2 Plan fixture closed: `planFixtureCompilePathReady` (planFromCompose inventory + mark+mint id 10 -> HOST-EMIT-PLAN); free/complete stay false | `CompilePathPlan.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Apply e2e compile path | Track 2 Apply fixture closed: `applyFixtureCompilePathReady` (applyFromCompose + mark+mint id 11 -> HOST-EMIT-APPLY); free/complete stay false | `CompilePathApply.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Out e2e compile path (historical Body) | Track 2 Out fixture closed: `bodyFixtureCompilePathReady` (bodyFromCompose buffer r=2 e=1 tagCount 3 + mark+mint id 12 -> HOST-EMIT-BODY); residual name **Out**; free/complete stay false | `CompilePathBody.lean` (namespace CompilePath), `RESIDUAL-systems.md` Done |
| Host-owned freestanding C text | Banner/version/unit_translation + Mult + Linear/ConsumeToken + Erasure + Extract/FAIL_CLOSED + Types/TYPED_IR + IR program + IR graph + host compose + emit plan + emit apply + EMIT_BODY dialect keys + Out scaffolding are Lean SSOT + FreestandingEmit embed; templates thin shells only | `src/systems/emit/host-owned-emit.md` (**ownership SSoT**) |
| HOST-EMIT-BANNER | Banner inventory + `slake_emit_version` + `slake_unit_translation_id`; host stage only; not Mult..Out SelfHostBody fold; scaffolding split to EmitBannerScaffold | `EmitBanner.lean`, `EmitBannerScaffold.lean`, `host_emit_banner.ssot.txt`, ownership map |
| HOST-EMIT-ERASURE | Erasure on freestanding C is **mult-0 absence honesty** (`slake_erased` + mark / is_marked / is_runtime_absent) -- **not** a type system in C; not elaborator Types on the product wire; scaffolding split to EmitErasureScaffold | `EmitErasure.lean`, `EmitErasureScaffold.lean`, `host_emit_erasure.ssot.txt`, ownership map, README C emit bullets |
| HOST-EMIT-EXTRACT | Extract + FAIL_CLOSED freestanding C is extract status + runtime class + check_bundle + check_fail_closed + extract_with_checks; stage tokens FAIL_CLOSED_CHECKER_V1 stay; host stage only -- not residual EMIT_EXTRACT treadmill; scaffolding split to EmitExtractScaffold | `EmitExtract.lean`, `EmitExtractScaffold.lean`, `host_emit_extract.ssot.txt`, ownership map, README C emit bullets |
| HOST-EMIT-TYPES | Types freestanding C is type_tag + TYPED_IR_V0 ir_node (kind/mult + fail-closed) -- **not** full elaborator type checker in C; scaffolding split to EmitTypesScaffold | `EmitTypes.lean`, `EmitTypesScaffold.lean`, `host_emit_types.ssot.txt`, ownership map, README C emit bullets |
| HOST-EMIT-PROGRAM | IR program freestanding C is ordered list CAP 8 + init/push/well-typed/fail-closed; wire id `IR_PROGRAM_V0`; host stage only -- **not** CFG/edges; scaffolding split to EmitProgramScaffold | `EmitProgram.lean`, `EmitProgramScaffold.lean`, `host_emit_program.ssot.txt`, ownership map, README C emit bullets |
| HOST-EMIT-GRAPH | IR graph freestanding C is edge list MAX 16 + init/push_node/add_edge/well-typed/fail-closed; wire id `IR_GRAPH_EDGES_V0`; host stage only -- **not** full CFG/SSA | `EmitGraph.lean`, `host_emit_graph.ssot.txt`, ownership map, README C emit bullets |
| HOST-EMIT-COMPOSE | Host compose freestanding C is graph + host + erasure (mint/consume/mark/check/extract); wire id `HOST_COMPOSE_V0`; live-flag honesty not elaborator MULT-1 | `EmitCompose.lean`, `host_emit_compose.ssot.txt`, ownership map, README C emit bullets |
| HOST-EMIT-PLAN | Emit plan freestanding C is readiness inventory; wire id `EMIT_PLAN_V0`; host stage HOST-EMIT-PLAN -- not full IR body emit; scaffolding split to EmitPlanScaffold | `EmitPlan.lean`, `EmitPlanScaffold.lean`, `host_emit_plan.ssot.txt`, ownership map |
| HOST-EMIT-APPLY | Emit apply freestanding C is fixed tag buffer CAP 32; wire id `EMIT_APPLY_V0`; host stage HOST-EMIT-APPLY -- not full C body codegen; scaffolding split to EmitApplyScaffold | `EmitApply.lean`, `EmitApplyScaffold.lean`, `host_emit_apply.ssot.txt`, ownership map |
| HOST-EMIT-BODY / residual **Out** | Emit Out freestanding C is CAP 256 scaffolding (put_char / put_u8 / from_compose) + HOST-EMIT-SSOT dialect keys; residual name **Out**; wire id `EMIT_BODY_V0` frozen; host stage HOST-EMIT-BODY -- one stage not whole product | `EmitBody.lean`, `host_emit_body_fragment.ssot.txt`, ownership map naming section |
| Defined freestanding compile step | `selfHostBodyReady` folds Mult..Out emit readiness + freestanding emit stage (native_decide for large honesty folds); complete true via SelfApplyFs alias; free stays false; not llvm unlock; theorems/smoke in SelfHostBodyTheorems | `SelfHostBody.lean`, `SelfHostBodyTheorems.lean`, `self-host.md` |
| Recommended next residual Name | **Residual free claim** -- plan Step 3; free flip only when inventory checklist 2-10 green; Linear contracts done; complete true; free false; Lake host remains; never forge | `RESIDUAL-systems.md`, `WATCHER.md`, `plan-residual-free-freestanding.md` |
| Dual SSOT equality | **Done:** emit-time DUAL-SSOT-EQUALITY fail-closed; pure Nix systems-host + systems-emit-wire live tokens | `FreestandingEmit.lean`, `host-owned-emit.md`, residual Done |
| Dual ErasedIndex product cite | Freestanding path via **HOST-EMIT-ERASURE** (not "frozen wire only") | `join-map.md` |
| Process glue | Remaining novel shell is process glue only; static presence pure Nix; compile-path stamp only | `src/systems/README.md` Shell ownership |
| Host Lean skill on residual | Load `.agents/skills/lean4` for `.lean`/Lake slices; draft/prove/review/doctor; not claim forge; no invent Names for skill | `AGENTS.md` Project agent skills; plan section 4 |
| Still false | residual free; proof complete; PROVABLY; llvm / CompCert seal (claim B freestanding product self-host complete is **true**) | residual files, SelfApplyFs / LlvmHold / SpecProof |

**Systems reseed after compaction:** `RESIDUAL-systems.md` -> `src/systems/README.md` ->
`emit/host-owned-emit.md` -> `self-host.md` -> module headers. Gates:
`just systems-host`, `just systems-emit-wire`, `just hygiene`, `just systems-lake`, `just systems-cc-probe`.

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
