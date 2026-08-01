# Residual -- coordinator (Systems Lean)

Project-level residual and join board. **Sides own their own files:**

| File | Owner |
|------|--------|
| `RESIDUAL-idris.md` | Idris-side fork |
| `RESIDUAL-lean.md` | Lean-side fork |
| `RESIDUAL-systems.md` | Systems / Slake fork |
| `RESIDUAL.md` (this file) | Coordinator (monitor / join board) |

**Status vocabulary:** `open` | `in progress` | `done` | `blocked` | `wontfix`

Green `just check` != residual closed.

Language: **Idris side** / **Lean side** / **coordinator** -- never "pole".

---

## Join done

| Item | Evidence |
|------|----------|
| Dual MULT maps (MULT-0 / MULT-1 / MULT-OMEGA) | `src/idris2/multiplicity-map.md`, `src/lean4/multiplicity-map.md` |
| Dual algorithm ids (JOIN-ALG) | ConsumeToken, ErasedIndex, UnrestrictedShare under `src/idris2/examples/` and `src/lean4/examples/` |
| Both JOIN files | `src/idris2/JOIN.md`, `src/lean4/JOIN.md` |
| Ordered IR program stage id | Greppable `IR_PROGRAM_V0`; product prose uses ordered IR program / node list; see `AGENTS.md` ban |
| Greppable imperfect edges merged into divergence | `doc/divergence.md` section **Greppable imperfect edges (dual pair)** (EDGE-* / ERASE-* / RUNTIME-* + JOIN-ALG) |
| Shared intermediate-representation (IR) sketch | `doc/shared-ir-sketch.md` (pointer from `doc/architecture.md`; thin note in `src/systems/README.md`) |
| Slake skeleton under `src/systems/` | Layout stubs: `types.md`/`Types.slake`, `mult.md`/`Mult.slake`, `linear.md`/`Linear.slake`, `erasure.md`/`Erasure.slake`, `extract.md`/`Extract.slake`; pure Nix presence + process glue just recipes (`systems-lake`, `systems-cc-probe`); product path is `just build` (freestanding wire); unit markers (SKELETON + UNIT_SURFACE) pure Nix. **Not freestanding residual free.** |
| First freestanding unit surface | Five modules marked `UNIT_SURFACE` with thin abstract surface (grades / linear resource / erasure rule / extract boundary); check requires at least one + content bar; unit-surface path prints count and refuses product C claim from stamp alone. |
| Real freestanding compile path | Shell stamp `script/slake-compile-path.sh` **deleted**. Static unit walk pure Nix (`systems-emit-wire`); host deepen `SLAKE_COMPILE_PATH_V1` / `HOST-COMPILE-PATH` in `SystemsLean/CompilePath.lean`; retired stage id `SLAKE_COMPILE_PATH_V0` greppable in `justfile` honesty only (not product C). |
| Real freestanding emit path V0 + out/freestanding-c populate | Official product path is `just build` (B38 freestanding dual-eq WRITE via freestanding-capable-regenerate; former `out-freestanding-c` recipe retired; no alias). Writes emit + installs `out/freestanding-c/` (preserves README). `just check` runs build first and sets `SYSTEMS_PRODUCT_WIRE_FRESH=1` so `systems-cc-probe` does not double-regenerate. Still **not residual free**; **not PROVABLY**. |
| UNIT_DEEPEN_V1 abstract body + first unit translation | Mult/Linear/Erasure/Extract/Types `UNIT_DEEPEN_V1`; C APIs `slake_mult_is_valid`, `slake_linear_consume`, `slake_erasure_is_runtime_absent`; companion notes; still **not residual free**. |
| FAIL_CLOSED_CHECKER_V1 composed checker + extract path | `slake_check_bundle`, `slake_check_fail_closed`, `slake_extract_with_checks`; Extract unit map; behavioral smoke; still **not residual free**. |
| CONSUME_TOKEN_HOST_V0 freestanding JOIN-ALG host | `slake_consume_token` mint/consume/check under emit; Linear unit notes; dual cite only; still **not residual free**. |
| TYPED_IR_V0 richer typed IR surface | `slake_ir_node` kind/mult pairing + well-typed + fail-closed compose; Types unit map; still **not residual free**. |
| IR_PROGRAM_V0 multi-node ordered IR program | Ordered `slake_ir_program` (`SLAKE_IR_PROGRAM_CAP` 8) + collective well-typed + fail-closed (empty program NOT well-typed; full push -2); still **not residual free**. |
| IR_GRAPH_EDGES_V0 directed edge slots | `slake_ir_graph` shell + `SLAKE_IR_EDGE_MAX` 16 index pairs; empty graph OK; full edges -1; not full CFG/SSA; still **not residual free**. |
| HOST_COMPOSE_V0 host + IR graph composition | `slake_host_compose` owns graph + host + erased; mint / consume / mark_erased / check_fail_closed / extract; MULT-1 needs mint; MULT-0 needs mark; empty compose extract OK; still **not residual free**. |
| EMIT_PLAN_V0 emit plan from host compose | `slake_emit_plan` readiness inventory from checked host compose; Extract primary + Types light; still **not residual free**. |
| EMIT_APPLY_V0 apply plan tags | `slake_emit_apply` fixed mult/kind tag buffer from checked host compose; Extract primary + Types light; still **not residual free**. |
| EMIT_BODY_V0 body fragment | `slake_emit_body` fixed freestanding C body fragment from checked host compose via plan+apply; Extract primary + Types light; still **not residual free**. |

Dual depth, ordered IR program rename, divergence merge, IR sketch, systems skeleton, unit surface, compile path, and frozen freestanding emit product wire through emit body are **done**. **Do not** grow freestanding C as a substitute for duals or Systems Lean host. Active product residual: **Systems / Slake** Lean host deepen (`doc/fork-systems.md`, `RESIDUAL-systems.md`). Watcher session is separate (root `WATCHER.md`).

**Honesty pin:** freestanding C emit stages and shell gate mills are **product wire / debt**, not Systems Lean language progress and not meet-in-the-middle dual progress.

---

## Open (high-value next)

Prioritized backlog (plan): P0 shell/tooling -> P1 host close -> P2 host-driven emit ->
P3 compile depth -> P4 join map into Slake -> P5 self-host -> P6 llvm/PROVABLY (after
self-host / real ccomp) -> P7 superset matrix. Order is priority, not permission to skip
ordinary residual. Explicitly deferred only: llvm-ir until self-host; PROVABLY until real
ccomp + matrix.

| Priority | Work | Owner / notes |
|----------|------|----------------|
| P0 | Shell/C paydown | **done (bulk + stamp + check.sh delete):** plan `.agents/plans/plan-paydown-shell-c-surfaces.md` waves 0-E + Thin process glue + compile-path stamp delete + novel `check.sh` deleted. Dual pure Nix presence; emit bash deleted; elaborator/cc process glue is just recipes (`idris-elaborate`, `lean-elaborate`, `systems-lake`, `systems-cc-probe`) + optional `script/git-hooks/pre-commit`. Product residual free is a separate claim (true as of 2026-08-01; host residual remains). |
| P1 | Systems Lean host close PARTIAL | **done (2026-07-22):** `host-partial-inventory.md` CLOSABLE-MISS-COUNT-0; intentional PARTIAL carry |
| P2 | Host drives emit | **done (2026-07-22, partial):** host Mult/body SSOT fragments; full C ladder still frozen wire |
| P3 | Real Slake compile path | **done (partial + stamp delete):** `SystemsLean/CompilePath.lean` (`SLAKE_COMPILE_PATH_V1` / `HOST-COMPILE-PATH`); V0 shell stamp deleted; unit walk pure Nix |
| P4 | Join map into Slake | **done (2026-07-22, partial):** `SystemsLean/JoinMap.lean`; duals read-only; not formal full bridge theorems |
| P5 | Self-host direction readiness | **done (2026-07-22, partial):** `SystemsLean/SelfHost.lean`; not freestanding product self-host complete; does **not** unlock llvm alone |
| P6 | llvm-ir / PROVABLY | **held** (SH6 documented): `LlvmHold.lean` (HOST-LLVM-HOLD / HOST-PROVABLY-HOLD); unlock flags false; true freestanding product self-host required; real ccomp + matrix for PROVABLY; **not** residual-open mill |
| P7 | Superset surface matrix | **done (2026-07-22, partial):** `SystemsLean/SurfaceMatrix.lean` + `surface-matrix.md`; not day-one full dual parity; does **not** unlock llvm |
| SH0..SH5 + deepen | Freestanding self-host track | **done (claim B complete true):** Mult..Emit kernels, parity, self-apply + freestanding deepen through Full/ownership/perform. Greppable map: `RESIDUAL-systems.md` **Highest value next**. Still **not** residual free; free/llvm/PROVABLY false |
| SH6 | llvm / PROVABLY hold gate | **held (documented, 2026-07-22):** `LlvmHold.lean` (HOST-LLVM-HOLD / HOST-PROVABLY-HOLD); unlock flags false; still **not residual free**; still **not PROVABLY**; out/llvm-ir deferred |
| Inventory close | Host inventory close readiness | **done (partial):** `InventoryClose.lean`; residualFreeClaimed false; Mult..InventoryClose 30 modules; intentional PARTIAL |
| Product path | Freestanding product path readiness | **done (partial; land-time):** `ProductPath.lean` HOST-PRODUCT-PATH; productPathReady; residualFreeClaimed false. Land-time "not complete" superseded: claim B freestanding product self-host complete is **true** (see Freestanding product self-host done row) |
| Product path close | Structural product path ladder close | **done (partial):** same `ProductPath.lean` HOST-PRODUCT-PATH-CLOSE; productPathCloseReady / productPathLadderClosedOk; productPathFurtherAliasTheaterHeld; residual free still open as claim -- **not** residual free |
| Dual residual | Host elaborator residual vs product residual honesty | **done (partial):** `DualResidual.lean` HOST-DUAL-RESIDUAL; dualResidualReady; hostElaboratorResidualRemains true; productResidualRemains true; residualFreeClaimed false; Mult..DualResidual was 32-module endpoint; neither residual forged free |
| Probe-vs-wire | Hosted behavioral probe vs product freestanding wire honesty | **done (partial):** `ProbeWire.lean` HOST-PROBE-WIRE; probeWireReady; behavioralProbeIsSmokeDebt true; product freestanding wire distinct; residualFreeClaimed false; Mult..ProbeWire was 33-module endpoint; probe green is not residual free |
| Spec-proof | Formal specification vs proof separation honesty | **done (partial):** `SpecProof.lean` HOST-SPEC-PROOF; specProofReady; specSurfaceStated true; proofCompleteClaimed false; proofDoesNotRetireTests true; residualFreeClaimed false; was Mult..SpecProof endpoint at close (living host count Mult..SelfHostBody, 39 modules); not proof complete |
| Mult theorems | FAIL-CLOSED-UNKNOWN-GRADE / ofNat? + name honesty | **done (partial):** Mult.lean MULT-THEOREM; ofNat?_fail_closed + name_mult0/1/Omega + ofNat?_some_implies_isValidTag + ofNat?_name_zero/one/two + ofNat?_name_fail_closed; proofCompleteClaimed stays false |
| Types theorems | FAIL-CLOSED-UNKNOWN-KIND / mkNode success paths | **done (partial):** Types.lean TYPES-THEOREM; kindMultOk + mkNode?_ok + expectedMult_* + mkNodeFromTags? paths; proofCompleteClaimed stays false |
| IrProgram theorems | EMPTY-PROGRAM-FAIL-CLOSED + multi-node + cap full | **done (partial):** IrProgram.lean IR-PROGRAM-THEOREM; empty reject + single/two-value well-typed + fold success + push_second_value_ok + push_full_at_cap; proofCompleteClaimed stays false |
| CompilePath theorems | empty host vs empty program + path contracts | **done (partial):** CompilePath.lean COMPILE-PATH-THEOREM; empty host/program + extractFsOk_eq + extractClaimOk classic/edge/fs + single-value program + mult1 unminted/minted; proofCompleteClaimed stays false |
| IrGraph theorems | EMPTY-GRAPH-OK + multi-node one/two-edge + oversize | **done (partial):** IrGraph.lean IR-GRAPH-THEOREM; empty OK + one-node + edgesSound_one_edge + edgesSound_two_edges + addEdge_two_nodes_* + edgesSound_oversize_false; proofCompleteClaimed stays false |
| Linear theorems | JOIN-ALG honest limited surface theorems | **done (partial):** Linear.lean LINEAR-THEOREM; shareNat_eq + shareNat_zero/succ + polyId_id + roundTrip_eq; axioms remain; no MULT-1 claim; proofCompleteClaimed stays false |
| HostCompose theorems | multPreScan / mint-consume / push-edge / EMIT-BOUNDARY non-empty | **done (partial):** HostCompose.lean COMPOSE-THEOREM; mint-consume + markErased_idempotent + multPreScan_omega_only_true + mint_consume_roundtrip + pushHostNode_* + addHostEdge_* + extractOk_classic_mult1_minted_false / extractOk_edge_mult1_minted_false / extractOk_classic_mult0_marked_false / extractOk_edge_mult0_marked_false; live-flag only; proofCompleteClaimed stays false |
| Extract theorems | RUNTIME-FS-only + raw-tag success paths | **done (partial):** Extract.lean EXTRACT-THEOREM; ofRuntimeTag?_some_implies_isValidRuntimeTag + extractOkFromTags? known-tag paths + fail_closed; proofCompleteClaimed stays false |
| Erasure theorems | mark fail-closed + composition honesty | **done (partial):** Erasure.lean ERASURE-THEOREM; checkFailClosed_eq + markForGrade?_some_implies_isErasureGrade / markForGrade?_some_is_mark; proofCompleteClaimed stays false |
| EmitBody theorems | HOST-EMIT-SSOT + non-empty fixtures | **done (partial):** EmitBody.lean EMIT-BODY-THEOREM; bodyOk_empty_true + bodyOk_mult1_* + bodyFromCompose non-empty fixtures; proofCompleteClaimed stays false |
| EmitPlan theorems | EMIT-PLAN readiness inventory | **done (partial):** EmitPlan.lean EMIT-PLAN-THEOREM; empty ready/counts + fail-closed MULT-1/MULT-0 + planOk_mult1_minted_true / planFromCompose_mult1_minted_runtime + mult0 marked/omega + planFromCompose_two_values_edge + planFromCompose_linear_and_erased; proofCompleteClaimed stays false |
| EmitApply theorems | EMIT-APPLY tag buffer honesty | **done (partial):** EmitApply.lean EMIT-APPLY-THEOREM; applyCap_eq_32 + packTag_linear/erased/value + unpack + fail-closed MULT-1 + applyFromCompose_mult1_minted_tags / mult0_marked_tag / omega_tag + applyFromCompose_linear_and_erased_order + applyIsValid_count_tags_desync_false; proofCompleteClaimed stays false |
| JoinMap theorems | join path contracts + surface canaries | **done (partial):** JoinMap.lean JOIN-MAP-THEOREM; empty host/program + joinUnitCompileReady_eq + mult1 unminted/minted + joinProgramCompileReady_single_value; not formal duals; proofCompleteClaimed stays false |
| SelfHost theorems | self-host direction + path fixtures | **done (partial):** SelfHost.lean SELF-HOST-THEOREM; empty canaries + selfHostUnitReady_mult1_unminted_false / selfHostUnitReady_mult1_minted_true / selfHostProgramReady_single_value; direction only; proofCompleteClaimed stays false |
| KernelMult theorems | Mult kernel IR readiness + content | **done (partial):** KernelMult.lean KERNEL-MULT-THEOREM; multKernelReady_true + lowerMultKernel_length_three / isWellTyped + multKernelProgram content; proofCompleteClaimed stays false |
| KernelLinear theorems | Linear kernel IR + content | **done (partial):** KernelLinear.lean KERNEL-LINEAR-THEOREM; linearKernelReady_true + lowerLinearKernel_length_one / isWellTyped + linearKernelProgram content; proofCompleteClaimed stays false |
| ParityMult theorems | Mult grades closed-loop + content equality | **done (partial):** ParityMult.lean PARITY-MULT-THEOREM; multParityReady_true + gradeParityOk_true + ofNatRoundTrip_tag* / isValidTag_tag* / nameParity_mult* / enumTag_multC* / product*Api_eq; Mult grades only; proofCompleteClaimed stays false |
| KernelTypes theorems | Types kernel IR readiness + content | **done (partial):** KernelTypes.lean KERNEL-TYPES-THEOREM; typesKernelReady_true + lowerTypesKernel_length_three / isWellTyped + typesKernelProgram content; proofCompleteClaimed stays false |
| KernelProgram theorems | program / graph / compose kernel | **done (partial):** KernelProgram.lean KERNEL-PROGRAM-THEOREM; programKernelReady_true + lowerProgramKernel_length_three / isWellTyped + programKernelProgram content; program/graph/compose content; proofCompleteClaimed stays false |
| KernelEmit theorems | codegen host honesty + content | **done (partial):** KernelEmit.lean KERNEL-EMIT-THEOREM; emitKernelReady_true + lowerEmitCompose_isSome / plan_counts / apply_tags / body_fragment; codegen content; proofCompleteClaimed stays false |
| ParityLinear theorems | Linear freestanding path + product API content | **done (partial):** ParityLinear.lean PARITY-LINEAR-THEOREM; linearParityReady_true + productLinearConsumeApi_eq / productApiSurfaceOk_true; Linear freestanding path only; proofCompleteClaimed stays false |
| ParityTypes theorems | Types freestanding path + product API content | **done (partial):** ParityTypes.lean PARITY-TYPES-THEOREM; typesParityReady_true + productTypedIrId_eq / productApiSurfaceOk_true; Types freestanding path only; proofCompleteClaimed stays false |
| ParityProgram theorems | Program freestanding path + product API content | **done (partial):** ParityProgram.lean PARITY-PROGRAM-THEOREM; programParityReady_true + productIrProgramApi_eq / productApiSurfaceOk_true; Program freestanding path only; proofCompleteClaimed stays false |
| ParityEmit theorems | Emit freestanding path + product API content | **done (partial):** ParityEmit.lean PARITY-EMIT-THEOREM; emitParityReady_true + productEmitPlanApi_eq / productApiSurfaceOk_true; Emit freestanding path only; proofCompleteClaimed stays false |
| SurfaceMatrix theorems | surface inventory + path fixtures | **done (partial):** SurfaceMatrix.lean SURFACE-MATRIX-THEOREM; empty canaries + matrixUnitReady_mult1_unminted_false / matrixUnitReady_mult1_minted_true / matrixProgramReady_single_value; proofCompleteClaimed stays false |
| SelfApply theorems | host structural self-apply readiness | **done (partial):** SelfApply.lean SELF-APPLY-THEOREM; selfApplyReady_true + kernelRebuildsKernel_true; host structural only; proofCompleteClaimed stays false |
| SelfApplyFs theorems | freestanding self-apply path readiness | **done (partial):** SelfApplyFs.lean SELF-APPLY-FS-THEOREM; freestandingSelfApplyReady_true + freestandingProductSelfHostComplete_true; complete true (claim B); proofCompleteClaimed stays false |
| InventoryClose theorems | inventory close readiness canaries | **done (partial):** InventoryClose.lean INVENTORY-CLOSE-THEOREM; inventoryCloseReady_true + residualFreeClaimed_false; residual free stays false; proofCompleteClaimed stays false |
| ProductPath theorems | product path readiness canaries | **done (partial):** ProductPath.lean PRODUCT-PATH-THEOREM; productPathReady_true + productPathCloseReady_true + residualFreeClaimed_false; no alias theater growth; proofCompleteClaimed stays false |
| DualResidual theorems | dual residual honesty canaries | **done (partial):** DualResidual.lean DUAL-RESIDUAL-THEOREM; dualResidualReady_true + both residuals remain; proofCompleteClaimed stays false |
| ProbeWire theorems | probe-vs-wire honesty canaries | **done (partial):** ProbeWire.lean PROBE-WIRE-THEOREM; probeWireReady_true + behavioralProbeIsSmokeDebt_true; proofCompleteClaimed stays false |
| SpecProof theorems | formal feedback honesty canaries | **done (partial):** SpecProofTheorems.lean (split) SPEC-PROOF-THEOREM; specProofReady_true + proofCompleteClaimed_false (proved false); not proof complete |
| LlvmHold theorems | SH6 hold honesty canaries | **done (partial):** LlvmHold.lean LLVM-HOLD-THEOREM; llvmHoldReady_true + llvmUnlocked_false; hold not unlock; proofCompleteClaimed stays false |

**Systems living residual:** `RESIDUAL-systems.md` **Open** queue (plain Names).
Do not re-paste greppable token maps here. Evidence tokens stay in Lean / Nix /
companions.

### Systems Open (join)

**Living tip:** freestanding product self-host **complete true**; product residual free **true**; Lake host still used (host residual remains); bootstrap **S0+S1+S2+S3 done**; ideal ladder **M1** unit surfaces **done**; M2 including Name B full Path A **done** (freestandingDriverComplete **true**); Open **M3 subset language front-end design**; S4 / M6 Lake retire deferred; long-file campaign parked hygiene. Do not re-open claim B. Free is not Lake gone and is not complete. Never forge StillUsesLake false.

| Name | Status | Owner detail |
|------|--------|--------------|
| **M3 subset language front-end design** | **open** | `RESIDUAL-systems.md` -- plan ideal M3; design then implement |
| **Name B full freestanding Mult write** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- Path A host-cc Mult package writer; freestandingDriverComplete true |
| **Name B full Mult write design deepen** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- note `doc/dev/research/name-b-full-mult-write-design-deepen-2026-08-01.md` |
| **Compose subset rebuild** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- M1 Compose follow-on; ComposeSubsetRebuild + slake-compose-subset-rebuild / just compose-subset-rebuild; Compose subset self-application |
| **Compose subset emit** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M1 continue; ComposeSubsetEmit + slake-compose-subset-emit / just compose-subset-emit; Compose unit package write |
| **Graph subset rebuild** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- M1 Graph follow-on; GraphSubsetRebuild + slake-graph-subset-rebuild / just graph-subset-rebuild; Graph subset self-application |
| **Graph subset emit** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M1 continue; GraphSubsetEmit + slake-graph-subset-emit / just graph-subset-emit; Graph unit package write |
| **Erasure subset rebuild** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- M1 Erasure follow-on; ErasureSubsetRebuild + slake-erasure-subset-rebuild / just erasure-subset-rebuild; Erasure subset self-application |
| **Erasure subset emit** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M1 continue; ErasureSubsetEmit + slake-erasure-subset-emit / just erasure-subset-emit; Erasure unit package write |
| **Extract subset rebuild** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- M1 Extract follow-on; ExtractSubsetRebuild + slake-extract-subset-rebuild / just extract-subset-rebuild; Extract subset self-application |
| **Extract subset emit** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M1 continue; ExtractSubsetEmit + slake-extract-subset-emit / just extract-subset-emit; Extract unit package write |
| **MultSubsetEmit freestanding Mult SSOT write path** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- host Mult SSOT write; MultFsDeepen + prebuilt slake-mult-fs-write / just mult-subset-freestanding-write; multFsWritePathReady true; freestandingDriverComplete false; product Lake remains |
| **Mult freestanding surface dual-check partial** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M2 Name B greps; MultFsDeepen / just mult-subset-freestanding-deepen; freestandingDeepenPartial true; product Lake remains |
| **Mult without-Lake prebuilt driver** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M2 Name A; just mult-subset-rebuild-without-lake; withoutLakeFinished true; product Lake remains |
| **Mult without-Lake driver design** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M2 prep; note `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md` |
| **Program subset rebuild** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- M1 Program follow-on; ProgramSubsetRebuild + slake-program-subset-rebuild / just program-subset-rebuild; Program subset self-application |
| **Program subset emit** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M1 continue; ProgramSubsetEmit + slake-program-subset-emit / just program-subset-emit; Program unit package write |
| **Types subset rebuild** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- M1 Types follow-on; TypesSubsetRebuild + slake-types-subset-rebuild / just types-subset-rebuild; Types subset self-application |
| **Types subset emit** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M1 continue; TypesSubsetEmit + slake-types-subset-emit / just types-subset-emit; Types unit package write |
| **Linear subset rebuild** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- M1 follow-on; LinearSubsetRebuild + slake-linear-subset-rebuild / just linear-subset-rebuild; Linear subset self-application |
| **Linear subset emit** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- ideal M1; LinearSubsetEmit + slake-linear-subset-emit / just linear-subset-emit; Linear unit package write |
| **Slake rebuild freestanding subset** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- bootstrap S3; MultSubsetRebuild + slake-mult-subset-rebuild / just mult-subset-rebuild; Mult subset self-application |
| **Slake Mult subset emit** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- bootstrap S2; MultSubsetEmit + slake-mult-subset-emit / just mult-subset-emit; Mult unit package write |
| Slake first compiler surface | **done** (2026-08-01) | `RESIDUAL-systems.md` -- bootstrap S1; FirstSurface + slake-first-surface / just first-surface; Mult unit structural readiness |
| Slake first compiler surface inventory | **done** (2026-08-01) | `RESIDUAL-systems.md` -- plan Step 5 Phase A; note `doc/dev/research/slake-first-compiler-surface-inventory-2026-08-01.md` |
| Residual free claim | **done** (2026-08-01) | `RESIDUAL-systems.md` -- plan Step 3; free true; host residual remains; measure + DualResidual + lake GREEN; complete true |
| Linear freestanding contracts | **done** | `RESIDUAL-systems.md` -- plan Step 2 exact-once / Mult 0/1/omega; axioms documented; lake green; free still false (2026-08-01) |
| Residual free bar inventory | **done** | `RESIDUAL-systems.md` -- plan Step 1; checklist `doc/dev/research/residual-free-bar-inventory-2026-08-01.md`; measure green; free still false |
| Self-host body | **done** (partial) | `RESIDUAL-systems.md` -- SELF-HOST-BODY acceptance + SelfHostBody.lean; complete true; free stays false |
| Dual algorithms into Slake | **done** (partial) | `RESIDUAL-systems.md` -- join-map.md + JoinMap.joinAlgUseOk three dual host uses; dual trees read-only; free/complete stay false |
| Thin process glue | **done** | `RESIDUAL-systems.md` -- shell ownership note; compile-path stamp **deleted**; static pure Nix + host CompilePath; free-forge claims stay honest |
| Host owns freestanding erasure C | **done** (partial) | `RESIDUAL-systems.md` -- EmitErasure + host_emit_erasure.ssot.txt + FreestandingEmit embed; SelfHostBody folds emitErasureReady; free/complete stay false |
| Host owns freestanding Types C | **done** (partial) | `RESIDUAL-systems.md` -- EmitTypes + host_emit_types.ssot.txt + FreestandingEmit embed; SelfHostBody folds emitTypesReady; free/complete stay false |
| Host owns freestanding IR program C | **done** (partial) | `RESIDUAL-systems.md` -- EmitProgram + host_emit_program.ssot.txt + FreestandingEmit embed; SelfHostBody folds emitProgramReady; free/complete stay false |
| Host owns freestanding IR graph C | **done** (partial) | `RESIDUAL-systems.md` -- EmitGraph + host_emit_graph.ssot.txt + FreestandingEmit embed; SelfHostBody folds emitGraphReady; free/complete stay false |
| Host owns freestanding compose C | **done** (partial) | `RESIDUAL-systems.md` -- EmitCompose + host_emit_compose.ssot.txt + FreestandingEmit embed; SelfHostBody folds emitComposeReady; free/complete stay false |
| Host owns freestanding plan/apply C | **done** (partial) | `RESIDUAL-systems.md` -- EmitPlan + EmitApply product ownership + host_emit_plan/apply.ssot.txt + FreestandingEmit embed; SelfHostBody folds emitPlanReady && emitApplyReady; free/complete stay false |
| Host owns freestanding extract/check C | **done** (partial) | `RESIDUAL-systems.md` -- EmitExtract + host_emit_extract.ssot.txt + FreestandingEmit embed; SelfHostBody folds emitExtractReady; free/complete stay false |
| Host owns freestanding emit body scaffolding | **done** (partial) | `RESIDUAL-systems.md` -- EmitBody HOST-EMIT-BODY + host_emit_body_fragment.ssot.txt BODY_C_* + FreestandingEmit embed; SelfHostBody folds emitBodyReady; free/complete stay false |
| Host owns freestanding banner text | **done** (partial) | `RESIDUAL-systems.md` -- EmitBanner + host_emit_banner.ssot.txt + FreestandingEmit embed; HOST-EMIT-BANNER; not SelfHostBody fold; free/complete stay false |
| Dual SSOT equality gate | **done** | `RESIDUAL-systems.md` -- FreestandingEmit DUAL-SSOT-EQUALITY emit-time fail-closed; pure Nix live tokens; free/complete stay false |
| Freestanding product self-host | **done** (claim B complete true; stepContractFull true; ownership claimed true; perform claimed true; StillUsesFreestandingEmit false; Full true; lake proof required on complete recipe after RCA 2026-07-30) | `RESIDUAL-systems.md` -- claim B complete closed; claim A free **true** (host residual remains); llvm/PROVABLY false; Lake host remains; long-file hygiene parked; bootstrap S0-S3 done; M1 Linear/Types/Program/Extract emit+rebuild **done**; Open **empty** (done-for-now); M2 Name A Mult without-Lake prebuilt driver done; M2 Name B Mult freestanding surface dual-check partial done (freestandingDriverComplete false); design Name B full by choice; S4/Step 4 held; free foundation Steps 0-3 done; plan `plan-residual-free-freestanding.md` Step 5 ideal ladder; RCA `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 1 | **done** | `RESIDUAL-systems.md` -- B2 KernelSelfApply historical pins home-owned; tip 5755->5710 (-45); inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b1-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 2 | **done** | `RESIDUAL-systems.md` -- B3 ProductOutKernel historical pins home-owned; tip 5710->5657 (-53); inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b2-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 3 | **done** | `RESIDUAL-systems.md` -- B4 BootstrapHonesty historical pins home-owned; tip 5657->5609 (-48); remains := true kept on tip; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b3-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 4 | **done** | `RESIDUAL-systems.md` -- B5 ProductPathWriterSurface historical pins home-owned; tip 5609->5555 (-54); inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b4-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 5 | **done** | `RESIDUAL-systems.md` -- B6 ProductPathWriterPathPlan historical pins home-owned; tip 5555->5499 (-56); inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b5-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 6 | **done** | `RESIDUAL-systems.md` -- B7 ProductPathWriterPathExec historical pins home-owned; tip 5499->5415 (-84); inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b6-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 7 | **done** | `RESIDUAL-systems.md` -- B8 ProductPathOwnershipInputs historical pins home-owned; tip 5415->5361 (-54); living ownership claimed kept on tip; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b7-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 8 | **done** | `RESIDUAL-systems.md` -- B9 ProductPathPerform historical pins home-owned; tip 5361->5283 (-78); living perform claimed kept on tip; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b8-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 9 | **done** | `RESIDUAL-systems.md` -- B10 ProductPathPerformStep historical pins home-owned; tip 5283->5245 (-38); InstallLakeFreeEntrypointClaimed kept on tip; reviewer **APPROVE** `/tmp/grok-review-dual-pin-thin-b9.md`; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b9-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 10 | **done** | `RESIDUAL-systems.md` -- B11 ProductPathReadSsot historical pins home-owned; tip 5245->5204 (-41); ReadDependsOnLake + ReadEntrypointClaimed kept on tip; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b10-2026-07-30.md` |
| SelfApplyFs dual-pin thin batch 11 | **done** | `RESIDUAL-systems.md` -- B12 ProductPathComposePlan historical pins home-owned; tip 5204->5162 (-42); ComposeDependsOnLake + ComposeEntrypointClaimed kept on tip; reviewer **APPROVE** `/tmp/grok-review-dual-pin-b11-2026-07-31.md`; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b11-2026-07-31.md` |
| SelfApplyFs dual-pin thin batch 12 | **done** | `RESIDUAL-systems.md` -- B13 ProductPathWriteHc historical pins home-owned; tip 5162->5117 (-45); WriteHcDependsOnLake + WriteHcEntrypointClaimed kept on tip; reviewer **APPROVE** `/tmp/grok-review-dual-pin-b12-2026-07-31.md`; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b12-2026-07-31.md` |
| SelfApplyFs dual-pin thin batch 13 | **done** | `RESIDUAL-systems.md` -- B14 Capable historical pins home-owned; tip 5117->4999 (-118); five Capable honesty bools + PartialReady fold kept on tip; reviewer **APPROVE** `/tmp/grok-review-dual-pin-b13-2026-07-31.md`; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b13-2026-07-31.md` |
| SelfApplyFs dual-pin thin batch 14 | **done** | `RESIDUAL-systems.md` -- B15 CapableStepContract historical pins home-owned; tip 4999->4918 (-81); five step-contract honesty bools + stepContractFull + PartialReady fold kept on tip; reviewer **APPROVE** `/tmp/grok-review-dual-pin-b14-2026-07-31.md`; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b14-2026-07-31.md` |
| SelfApplyFs dual-pin thin batch 15 | **done** | `RESIDUAL-systems.md` -- B16 CapableRead historical pins home-owned; tip 4918->4877 (-41); three CapableRead honesty bools + PartialReady fold kept on tip; reviewer **APPROVE** `/tmp/grok-review-dual-pin-b15-2026-07-31.md`; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b15-2026-07-31.md` |
| SelfApplyFs dual-pin thin batch 16 | **done** | `RESIDUAL-systems.md` -- B17 CapableCompose historical pins home-owned; tip 4877->4833 (-44); three CapableCompose honesty bools + PartialReady fold kept on tip; short-name CapableCompose deferred; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b16-2026-07-31.md` |
| SelfApplyFs dual-pin thin batch 17 | **done** | `RESIDUAL-systems.md` -- B18 CapableWriteHc historical pins home-owned; tip 4833->4790 (-43); three WriteHc honesty bools + PartialReady fold kept on tip; short-name CapableWriteHc deferred; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b17-2026-07-31.md` |
| SelfApplyFs dual-pin thin batch 18 | **done** | `RESIDUAL-systems.md` -- B19 CapableRegenerate; tip 4790->4742 (-48); four honesty + PartialReady fold; inventory `doc/dev/research/selfapplyfs-dual-pin-thin-b18-2026-07-31.md` |
| SelfApplyFs dual-pin thin batch 19 | **done** | `RESIDUAL-systems.md` -- tip 4742->4700 (-42); B20 InstallOut; join b19 |
| SelfApplyFs dual-pin thin batch 20 | **done** | `RESIDUAL-systems.md` -- tip 4700->4641 (-59); B21 CapableFullBar; join b20 |
| SelfApplyFs dual-pin thin batch 21 | **done** | `RESIDUAL-systems.md` -- tip 4641->4497 (-144); B22 OwnershipRegenerate; join b21 |
| SelfApplyFs dual-pin thin batch 22 | **done** | `RESIDUAL-systems.md` -- tip 4497->4404 (-93); B31 PerformEvidence; join b22 |
| SelfApplyFs dual-pin thin batch 23 | **done** | `RESIDUAL-systems.md` -- tip 4404->4302 (-102); B32 OfficialPath; join b23 |
| SelfApplyFs dual-pin thin batch 24 | **done** | `RESIDUAL-systems.md` -- tip 4302->4206 (-96); B33 OfficialPathAlternate; join b24 |
| SelfApplyFs dual-pin thin batch 25 | **done** | `RESIDUAL-systems.md` -- tip 4206->4111 (-95); B34 DualEqualityWriteParity; join b25 |
| SelfApplyFs dual-pin thin batch 26 | **done** | `RESIDUAL-systems.md` -- tip 4111->4024 (-87); B35 DualEqualityWriteClosePath; join b26 |
| SelfApplyFs dual-pin thin batch 27 | **done** | `RESIDUAL-systems.md` -- tip 4024->3917 (-107); B36 DualEqualityWriteApi; join b27 |
| SelfApplyFs dual-pin thin batch 28 | **done** | `RESIDUAL-systems.md` -- tip 3917->3832 (-85); B37 DualEqualityWriteCapableGap; join b28 |
| SelfApplyFs dual-pin thin batch 29 | **done** | `RESIDUAL-systems.md` -- tip 3832->3787 (-45); B38 OfficialRetire; join b29 |
| SelfApplyFs dual-pin thin batch 30 | **done** | `RESIDUAL-systems.md` -- tip 3787->3750 (-37); B39 PerformClaimed; join b30 |
| SelfApplyFs dual-pin thin batch 31 | **done** | `RESIDUAL-systems.md` -- packed b31-33 one implement tip 3750->3638 (-112); B40 OwnershipClaimed; no per-family delta; join b31 |
| SelfApplyFs dual-pin thin batch 32 | **done** | `RESIDUAL-systems.md` -- packed with b31+b33; Full StepContractFull; join b32 |
| SelfApplyFs dual-pin thin batch 33 | **done** | `RESIDUAL-systems.md` -- packed close; SelfHostComplete; tip final 3638; dual-pin theater exhausted; campaign b30plus |
| Short product-path names resume | **done** | `RESIDUAL-systems.md` -- batches 11-15 closed remaining ProductPathFreestanding*; campaign shortname-camp-0731; tip **3638** |
| SelfApplyFs tip long-file split | **done** | `RESIDUAL-systems.md` -- tip **3638->1888** (-1750); under 2k; campaign tip-split-camp-0731; inventory selfapplyfs-tip-split-2026-07-31.md |
| CompilePath Lean seams | **done** | `RESIDUAL-systems.md` -- batch 4 Mult+Linear+Types+Program+Extract **1715->458**; homes +11 total; fixture splits complete; free false |
| Short product-path names batch 9 | **done** | `RESIDUAL-systems.md` -- CapableCompose; inventory short-product-path-names-capable-compose-2026-07-31; join shortname-capable-compose |
| Host presence non-tip data split | **done** | `RESIDUAL-systems.md` -- specs.nix 6012->5675 (-337); cold slices jargon-walk / required-files / host-leans / unit-surface; hostSpecs body identity verified; just systems-host + hygiene green |
| HostSpecs core split | **done** | `RESIDUAL-systems.md` -- Mult..FreestandingEmit -> host-specs-core.nix; specs 5675->~5058 then CompilePath + Kernel/Parity + JoinSurface + HoldClose splits; dual-pin-hot sha256 a1ab0623... identical; default.nix zero-edit; reviewer **APPROVE** `/tmp/grok-review-nix-hostspecs-core-split.md` |
| Emit-wire cold eval split | **done** | `RESIDUAL-systems.md` -- default 3953->3804; four eval-* modules; hostPin scanners left inline |
| HostSpecs CompilePath wall split | **done** | `RESIDUAL-systems.md` -- CompilePath wall -> host-specs-compile-path.nix; specs 5058->4741 at split; join `/tmp/grok-impl-summary-hostspecs-compilepath-wall-2026-07-31.md` |
| HostSpecs Kernel/Parity split | **done** | `RESIDUAL-systems.md` -- KernelMult..ParityEmit -> host-specs-kernel-parity.nix; specs ~3749 at split; join `/tmp/grok-impl-summary-hostspecs-cold-split-b2-2026-07-31.md` |
| HostSpecs JoinSurface split | **done** | `RESIDUAL-systems.md` -- JoinMap+SelfHost+SurfaceMatrix+self-host.md -> host-specs-join-surface.nix; specs ~3304 at split; join `/tmp/grok-impl-summary-hostspecs-cold-split-b3-2026-07-31.md` |
| HostSpecs HoldClose split | **done** | `RESIDUAL-systems.md` -- LlvmHold..SelfHostBody -> host-specs-hold-close.nix; specs **3304->2689**; join `/tmp/grok-impl-summary-hostspecs-cold-split-b4-2026-07-31.md` |
| HostSpecs further split | **done** | `RESIDUAL-systems.md` -- all named cold splits complete (core, CompilePath, KernelParity, JoinSurface, HoldClose); specs live **2689**; hostPin scanner splits later |
| Behavioral probe exit 105 | **done** | `RESIDUAL-systems.md` -- CapableWriteHc HOST-EMIT-SSOT dialect apply; probe 105 was return 361 mod 256; join `/tmp/grok-impl-summary-behavioral-105.md` |
| Short product-path module names | **done** | `RESIDUAL-systems.md` -- all SystemsLean ProductPathFreestanding* retired 2026-07-31 |
| No-sorry host inventory | **done** | `RESIDUAL-systems.md` -- **0** sorry/admit; 3 Linear axioms; inventory `doc/dev/research/no-sorry-host-inventory-2026-07-31.md`; next was FreestandingEmit split (now done) |
| FreestandingEmit long-file split | **done** | `RESIDUAL-systems.md` -- **1069->439** via FreestandingEmitLoad (**622**); inventory `doc/dev/research/freestanding-emit-split-2026-07-31.md` |
| DualEqWriteApi long-file split | **done** | `RESIDUAL-systems.md` -- **877->492** via DualEqWriteLoad (**433**); inventory `doc/dev/research/dual-eq-write-api-split-2026-07-31.md` |
| ProductPath long-file split | **done** | `RESIDUAL-systems.md` -- **864->667** via ProductPathBars (**254**); inventory `doc/dev/research/product-path-split-2026-07-31.md` |
| EmitBody long-file split | **done** | `RESIDUAL-systems.md` -- **820->480** via EmitBodyScaffold (**394**); inventory `doc/dev/research/emit-body-split-2026-07-31.md` |
| HostCompose long-file split | **done** | `RESIDUAL-systems.md` -- **669->220** via HostComposeTheorems (**485**); inventory `doc/dev/research/host-compose-split-2026-07-31.md` |
| CapableWriteHc long-file split | **done** | `RESIDUAL-systems.md` -- **668->316** via CapableWriteHcLoad (**401**); inventory `doc/dev/research/capable-write-hc-split-2026-07-31.md` |
| ProductPath further split | **done** | `RESIDUAL-systems.md` -- **667->424** via ProductPathTheorems (**289**); inventory `doc/dev/research/product-path-further-split-2026-07-31.md` |
| FreestandingEmitLoad long-file split | **done** | `RESIDUAL-systems.md` -- **622->235** via FreestandingEmitLoadScaffold (**414**); inventory `doc/dev/research/freestanding-emit-load-split-2026-07-31.md` |
| EmitCompose long-file split | **done** | `RESIDUAL-systems.md` -- **596->75** via EmitComposeScaffold (**590**); inventory `doc/dev/research/emit-compose-split-2026-07-31.md` |
| SpecProof long-file split | **done** | `RESIDUAL-systems.md` -- **527->432** via SpecProofTheorems (**161**); inventory `doc/dev/research/spec-proof-split-2026-07-31.md` |
| JoinMap long-file split | **done** | `RESIDUAL-systems.md` -- **519->294** via JoinMapTheorems (**284**); inventory `doc/dev/research/join-map-split-2026-07-31.md` |
| KernelProgram long-file split | **done** | `RESIDUAL-systems.md` -- **508->368** via KernelProgramTheorems (**213**); inventory `doc/dev/research/kernel-program-split-2026-07-31.md` |
| EmitGraph long-file split | **done** | `RESIDUAL-systems.md` -- **477->69** via EmitGraphScaffold (**474**); inventory `doc/dev/research/emit-graph-split-2026-07-31.md` |
| SurfaceMatrix long-file split | **done** | `RESIDUAL-systems.md` -- **475->271** via SurfaceMatrixTheorems (**266**); inventory `doc/dev/research/surface-matrix-split-2026-07-31.md` |
| EmitTypes long-file split | **done** | `RESIDUAL-systems.md` -- **466->66** via EmitTypesScaffold (**463**); inventory `doc/dev/research/emit-types-split-2026-07-31.md` |
| EmitLinear long-file split | **done** | `RESIDUAL-systems.md` -- **462->62** via EmitLinearScaffold (**464**); inventory `doc/dev/research/emit-linear-split-2026-07-31.md` |
| SelfHostBody long-file split | **done** | `RESIDUAL-systems.md` -- **456->328** via SelfHostBodyTheorems (**199**); inventory `doc/dev/research/selfhostbody-split-2026-07-31.md` |
| DualResidual long-file split | **done** | `RESIDUAL-systems.md` -- **427->316** via DualResidualTheorems (**180**); inventory `doc/dev/research/dual-residual-split-2026-07-31.md` |
| KernelEmit long-file split | **done** | `RESIDUAL-systems.md` -- **425->273** via KernelEmitTheorems (**219**); inventory `doc/dev/research/kernel-emit-split-2026-07-31.md` |
| EmitProgram long-file split | **done** | `RESIDUAL-systems.md` -- **422->68** via EmitProgramScaffold (**413**); inventory `doc/dev/research/emit-program-split-2026-07-31.md` |
| ParityEmit long-file split | **done** | `RESIDUAL-systems.md` -- **419->240** via ParityEmitTheorems (**243**); inventory `doc/dev/research/parity-emit-split-2026-07-31.md` |
| IrGraph long-file split | **done** | `RESIDUAL-systems.md` -- **410->177** via IrGraphTheorems (**298**); inventory `doc/dev/research/ir-graph-split-2026-07-31.md` |
| ParityProgram long-file split | **done** | `RESIDUAL-systems.md` -- **407->231** via ParityProgramTheorems (**239**); inventory `doc/dev/research/parity-program-split-2026-07-31.md` |
| ProductPathOwnershipRegenerate long-file split | **done** | `RESIDUAL-systems.md` -- **390->328** via ProductPathOwnershipRegenerateTheorems (**304**); inventory `doc/dev/research/product-path-ownership-regenerate-split-2026-07-31.md` |
| StepContractFull long-file split | **done** | `RESIDUAL-systems.md` -- **382->365** via StepContractFullTheorems (**235**); inventory `doc/dev/research/step-contract-full-split-2026-07-31.md` |
| ParityMult long-file split | **done** | `RESIDUAL-systems.md` -- **382->183** via ParityMultTheorems (**265**); inventory `doc/dev/research/parity-mult-split-2026-07-31.md` |
| ProbeWire long-file split | **done** | `RESIDUAL-systems.md` -- **379->288** via ProbeWireTheorems (**163**); inventory `doc/dev/research/probe-wire-split-2026-07-31.md` |
| EmitExtract long-file split | **done** | `RESIDUAL-systems.md` -- **370->70** via EmitExtractScaffold (**361**); inventory `doc/dev/research/emit-extract-split-2026-07-31.md` |
| OwnershipClaimed long-file split | **done** | `RESIDUAL-systems.md` -- **367->342** via OwnershipClaimedTheorems (**247**); inventory `doc/dev/research/ownership-claimed-split-2026-07-31.md` |
| SelfHostComplete long-file split | **done** | `RESIDUAL-systems.md` -- **363->338** via SelfHostCompleteTheorems (**252**); inventory `doc/dev/research/self-host-complete-split-2026-07-31.md` |
| DualEqWriteCapableGap long-file split | **done** | `RESIDUAL-systems.md` -- **354->340** via DualEqWriteCapableGapTheorems (**309**); inventory `doc/dev/research/dual-eq-write-capable-gap-split-2026-07-31.md` |
| DualEqWriteClosePath long-file split | **done** | `RESIDUAL-systems.md` -- **354->344** via DualEqWriteClosePathTheorems (**314**); inventory `doc/dev/research/dual-eq-write-close-path-split-2026-07-31.md` |
| PerformClaimed long-file split | **done** | `RESIDUAL-systems.md` -- **345->331** via PerformClaimedTheorems (**294**); inventory `doc/dev/research/perform-claimed-split-2026-07-31.md` |
| KernelTypes long-file split | **done** | `RESIDUAL-systems.md` -- **345->214** via KernelTypesTheorems (**201**); inventory `doc/dev/research/kernel-types-split-2026-07-31.md` |
| Extract long-file split | **done** | `RESIDUAL-systems.md` -- **344->156** via ExtractTheorems (**253**); inventory `doc/dev/research/extract-split-2026-07-31.md` |
| KernelLinear long-file split | **done** | `RESIDUAL-systems.md` -- **343->229** via KernelLinearTheorems (**184**); inventory `doc/dev/research/kernel-linear-split-2026-07-31.md` |
| SelfHost long-file split | **done** | `RESIDUAL-systems.md` -- **342->164** via SelfHostTheorems (**240**); inventory `doc/dev/research/self-host-split-2026-07-31.md` |
| CapableCompose long-file split | **done** | `RESIDUAL-systems.md` -- **338->323** via CapableComposeTheorems (**200**); inventory capable-compose-split-2026-07-31 |
| EmitBanner long-file split | **done** | `RESIDUAL-systems.md` -- **327->63** via EmitBannerScaffold (**325**); inventory emit-banner-split-2026-07-31 |
| ParityLinear long-file split | **done** | `RESIDUAL-systems.md` -- **304->176** via ParityLinearTheorems (**189**); inventory `doc/dev/research/parity-linear-split-2026-07-31.md` |
| Types long-file split | **done** | `RESIDUAL-systems.md` -- **302->151** via TypesTheorems (**215**); inventory `doc/dev/research/types-split-2026-07-31.md` |
| ParityTypes long-file split | **done** | `RESIDUAL-systems.md` -- **279->171** via ParityTypesTheorems (**168**); inventory `doc/dev/research/parity-types-split-2026-07-31.md` |
| EmitMult long-file split | **done** | `RESIDUAL-systems.md` -- **277->60** via EmitMultScaffold (**283**); inventory `doc/dev/research/emit-mult-split-2026-07-31.md` |
| InventoryClose long-file split | **done** | `RESIDUAL-systems.md` -- **262->193** via InventoryCloseTheorems (**135**); inventory `doc/dev/research/inventory-close-split-2026-07-31.md` |
| SelfApply long-file split | **done** | `RESIDUAL-systems.md` -- **255->187** via SelfApplyTheorems (**137**); inventory `doc/dev/research/self-apply-split-2026-07-31.md` |
| IrProgram long-file split | **done** | `RESIDUAL-systems.md` -- **254->138** via IrProgramTheorems (**179**); inventory `doc/dev/research/ir-program-split-2026-07-31.md` |
| KernelMult long-file split | **done** | `RESIDUAL-systems.md` -- **250->160** via KernelMultTheorems (**166**); inventory `doc/dev/research/kernel-mult-split-2026-07-31.md` |
| EmitErasure long-file split | **done** | `RESIDUAL-systems.md` -- **233->63** via EmitErasureScaffold (**236**); inventory `doc/dev/research/emit-erasure-split-2026-07-31.md` |
| Erasure long-file split | **done** | `RESIDUAL-systems.md` -- **226->110** via ErasureTheorems (**177**); inventory `doc/dev/research/erasure-split-2026-07-31.md` |
| LlvmHold long-file split | **done** | `RESIDUAL-systems.md` -- **211->144** via LlvmHoldTheorems (**124**); inventory `doc/dev/research/llvm-hold-split-2026-07-31.md` |
| OfficialRetire long-file split | **done** | `RESIDUAL-systems.md` -- **322->316** via OfficialRetireTheorems (**293**); inventory `doc/dev/research/official-retire-split-2026-07-31.md` |
| DualEqWriteParity long-file split | **done** | `RESIDUAL-systems.md` -- **319->302** via DualEqWriteParityTheorems (**321**); inventory `doc/dev/research/dual-eq-write-parity-split-2026-07-31.md` |
| OfficialPathAlternate long-file split | **done** | `RESIDUAL-systems.md` -- **310->295** via OfficialPathAlternateTheorems (**328**); inventory `doc/dev/research/official-path-alternate-split-2026-07-31.md` |
| CapableRead long-file split | **done** | `RESIDUAL-systems.md` -- **297->288** via CapableReadTheorems (**191**); inventory `doc/dev/research/capable-read-split-2026-07-31.md` |
| CapableStepContract long-file split | **done** | `RESIDUAL-systems.md` -- **286->262** via CapableStepContractTheorems (**280**); inventory `doc/dev/research/capable-step-contract-split-2026-07-31.md` |
| InstallOut long-file split | **done** | `RESIDUAL-systems.md` -- **279->272** via InstallOutTheorems (**249**); inventory `doc/dev/research/install-out-split-2026-07-31.md` |
| Capable long-file split | **done** | `RESIDUAL-systems.md` -- **258->233** via CapableTheorems (**279**); inventory `doc/dev/research/capable-split-2026-07-31.md` |
| OfficialPath long-file split | **done** | `RESIDUAL-systems.md` -- **256->245** via OfficialPathTheorems (**286**); inventory `doc/dev/research/official-path-split-2026-07-31.md` |
| PerformEvidence long-file split | **done** | `RESIDUAL-systems.md` -- **255->233** via PerformEvidenceTheorems (**284**); inventory `doc/dev/research/perform-evidence-split-2026-07-31.md` |
| ProductPathComposePlan long-file split | **done** | `RESIDUAL-systems.md` -- **251->247** via ProductPathComposePlanTheorems (**181**); inventory `doc/dev/research/product-path-compose-plan-split-2026-07-31.md` |
| CapableFullBar long-file split | **done** | `RESIDUAL-systems.md` -- **231->219** via CapableFullBarTheorems (**293**); inventory `doc/dev/research/capable-full-bar-split-2026-07-31.md` |
| CapableRegenerate long-file split | **done** | `RESIDUAL-systems.md` -- **218->208** via CapableRegenerateTheorems (**228**); inventory `doc/dev/research/capable-regenerate-split-2026-07-31.md` |
| ProductPathReadSsot long-file split | **done** | `RESIDUAL-systems.md` -- **208->197** via ProductPathReadSsotTheorems (**171**); inventory `doc/dev/research/product-path-read-ssot-split-2026-07-31.md` |
| ProductPathWriteHc long-file split | **done** | `RESIDUAL-systems.md` -- **194->181** via ProductPathWriteHcTheorems (**187**); inventory `doc/dev/research/product-path-write-hc-split-2026-07-31.md` |
| Mult long-file split | **done** | `RESIDUAL-systems.md` -- **184->90** via MultTheorems (**148**); inventory `doc/dev/research/mult-split-2026-07-31.md` |
| ProductPathWriterPathExec long-file split | **done** | `RESIDUAL-systems.md` -- **169->162** via ProductPathWriterPathExecTheorems (**163**); inventory `doc/dev/research/product-path-writer-path-exec-split-2026-07-31.md` |
| ProductPathPerformStep long-file split | **done** | `RESIDUAL-systems.md` -- **152->147** via ProductPathPerformStepTheorems (**165**); inventory `doc/dev/research/product-path-perform-step-split-2026-07-31.md` |
| ProductPathWriterSurface long-file split | **done** | `RESIDUAL-systems.md` -- **147->134** via ProductPathWriterSurfaceTheorems (**186**); inventory `doc/dev/research/product-path-writer-surface-split-2026-07-31.md` |
| ProductPathWriterPathPlan long-file split | **done** | `RESIDUAL-systems.md` -- **143->136** via ProductPathWriterPathPlanTheorems (**167**); inventory `doc/dev/research/product-path-writer-path-plan-split-2026-07-31.md` |
| BootstrapHonesty long-file split | **done** | `RESIDUAL-systems.md` -- **142->111** via BootstrapHonestyTheorems (**111**); inventory `doc/dev/research/bootstrap-honesty-split-2026-07-31.md` |
| ProductPathOwnershipInputs long-file split | **done** | `RESIDUAL-systems.md` -- **141->136** via ProductPathOwnershipInputsTheorems (**87**); inventory `doc/dev/research/product-path-ownership-inputs-split-2026-07-31.md` |
| ProductPathPerform long-file split | **done** | `RESIDUAL-systems.md` -- **137->134** via ProductPathPerformTheorems (**80**); inventory `doc/dev/research/product-path-perform-split-2026-07-31.md` |
| ProductOutKernel long-file split | **done** | `RESIDUAL-systems.md` -- **130->106** via ProductOutKernelTheorems (**105**); inventory `doc/dev/research/product-out-kernel-split-2026-07-31.md` |
| KernelSelfApply long-file split | **done** | `RESIDUAL-systems.md` -- **125->105** via KernelSelfApplyTheorems (**101**); inventory `doc/dev/research/kernel-self-apply-split-2026-07-31.md` |
| Linear long-file split | **done** | `RESIDUAL-systems.md` -- **118->92** via LinearTheorems (**71**); inventory `doc/dev/research/linear-split-2026-07-31.md`; never-split cold chain exhausted |
| EmitPlan long-file split | **done** | `RESIDUAL-systems.md` -- **703->424** via EmitPlanScaffold (**332**); inventory `doc/dev/research/emit-plan-split-2026-07-31.md` |
| EmitApply long-file split | **done** | `RESIDUAL-systems.md` -- **706->423** via EmitApplyScaffold (**336**); inventory `doc/dev/research/emit-apply-split-2026-07-31.md` |
| Post-hygiene destination | **open as Residual free claim** | Long-file / no-sorry hygiene parked; Linear contracts + free bar inventory done; product next = free claim when checklist 2-10 green; ccomp/CompCert (D) held; never forge |
| Compile Mult unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-MULT multFixtureCompilePathReady (grades -> IR -> compose -> HOST-EMIT-MULT); free/complete stay false |
| Compile Linear unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-LINEAR linearFixtureCompilePathReady (MULT-1 -> IR -> mint/consume -> HOST-EMIT-LINEAR); free/complete stay false |
| Compile Types unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-TYPES typesFixtureCompilePathReady (TYPED_IR kind/mult -> IR -> compose -> HOST-EMIT-TYPES); free/complete stay false |
| Compile Program unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-PROGRAM programFixtureCompilePathReady (multi-node IR + fold -> compose -> HOST-EMIT-PROGRAM); free/complete stay false |
| Extract RUNTIME-FS gate on path | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-EXTRACT extractRuntimeFsGateReady (Mult + Program classic/edge reject; RUNTIME-FS accept); free/complete stay false |
| Compile Graph unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-GRAPH graphFixtureCompilePathReady (multi-node IR + edges -> compose -> HOST-EMIT-GRAPH); free/complete stay false |
| Compile Compose unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-COMPOSE composeFixtureCompilePathReady (multi-node + edges + mark/mint/consume -> HOST-EMIT-COMPOSE); free/complete stay false |
| Compile Erasure unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-ERASURE erasureFixtureCompilePathReady (MULT-0 mark-only -> HOST-EMIT-ERASURE); free/complete stay false |
| Compile Plan unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-PLAN planFixtureCompilePathReady (planFromCompose inventory -> HOST-EMIT-PLAN); free/complete stay false |
| Compile Apply unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-APPLY applyFixtureCompilePathReady (applyFromCompose tag-buffer -> HOST-EMIT-APPLY); free/complete stay false |
| Compile Body unit end-to-end | **done** (partial) | `RESIDUAL-systems.md` -- Track 2 COMPILE-PATH-BODY bodyFixtureCompilePathReady (bodyFromCompose buffer -> HOST-EMIT-BODY); free/complete stay false |

**Open:** empty product Open (Step 4 held -- proof progressive / PROVABLY / LLVM;
do not auto-start). Step 3 Residual free claim **done**. Step 2 Linear freestanding
contracts **done**. Step 1 Residual free bar inventory **done**. Living tip:
freestanding product self-host **complete true**; product residual free **true**;
host elaborator residual remains; Lake host still used; long-file campaign parked
hygiene. Claim B closed; do not re-open. llvm/PROVABLY false. Plan:
`.agents/plans/plan-residual-free-freestanding.md`. Detail: `RESIDUAL-systems.md`.

**Product program:** `.agents/plans/plan-residual-free-freestanding.md` (living;
Steps 0-3 residual free + linear freestanding; Step 3 **done**). Historical
six-claims snapshot: `.agents/plans/plan-close-six-claims.md` (section 0: living
tip wins -- complete true, free true, host residual remains). Track 1 Mult..Out +
banner CLOSED; Track 2 e2e CLOSED; Dual SSOT done; claim B complete **true**;
claim A free **true**; Step 2 Linear contracts **done**; long-file hygiene parked;
C-E false/held.
Naming: emit stage **Out** <-> `EMIT_BODY_V0`; product Out = `out/freestanding-c/`;
SelfHostBody = defined freestanding compile step. Host Lean work uses project
lean4 skill (`.agents/skills/lean4`). Residual schema: `plan-unambiguous-residual-work.md`.

---

## What remains

Plain-English residual that is still open, held, or not claimed. Detail lives in
`RESIDUAL-systems.md` Open / Decisions / Highest value next.

| Kind | What | Status |
|------|------|--------|
| **Open (WATCHER)** | empty (done-for-now); Extract subset rebuild done; Step 4 held (PROVABLY / LLVM) | **done-for-now** (matches living tip; complete true; free true; host residual remains; S0-S3 done; M1 Linear/Types/Program/Extract emit+rebuild done; M2 Name A + Name B surface dual-check partial done; S4/M6 deferred; next by operator choice) |
| Linear freestanding contracts | Exact-once / Mult 0/1/omega; axioms documented; lake green | **done** (2026-08-01) |
| Residual free bar inventory | Checklist before free claim; measure green; honesty modules | **done** (2026-08-01; `doc/dev/research/residual-free-bar-inventory-2026-08-01.md`) |
| Linear long-file split | **118->92** via LinearTheorems (**71**) | **done** |
| KernelSelfApply long-file split | **125->105** via KernelSelfApplyTheorems (**101**) | **done** |
| ProductPathPerform long-file split | **137->134** via ProductPathPerformTheorems (**80**) | **done** |
| ProductPathOwnershipInputs long-file split | **141->136** via ProductPathOwnershipInputsTheorems (**87**) | **done** |
| BootstrapHonesty long-file split | **142->111** via BootstrapHonestyTheorems (**111**) | **done** |
| ProductPathWriterPathPlan long-file split | **143->136** via ProductPathWriterPathPlanTheorems (**167**) | **done** |
| ProductPathWriterSurface long-file split | **147->134** via ProductPathWriterSurfaceTheorems (**186**) | **done** |
| ProductPathPerformStep long-file split | **152->147** via ProductPathPerformStepTheorems (**165**) | **done** |
| ProductPathWriterPathExec long-file split | **169->162** via ProductPathWriterPathExecTheorems (**163**) | **done** |
| Mult long-file split | **184->90** via MultTheorems (**148**) | **done** |
| ProductPathWriteHc long-file split | **194->181** via ProductPathWriteHcTheorems (**187**) | **done** |
| ProductPathReadSsot long-file split | **208->197** via ProductPathReadSsotTheorems (**171**) | **done** |
| CapableRegenerate long-file split | **218->208** via CapableRegenerateTheorems (**228**) | **done** |
| CapableFullBar long-file split | **231->219** via CapableFullBarTheorems (**293**) | **done** |
| ProductPathComposePlan long-file split | **251->247** via ProductPathComposePlanTheorems (**181**) | **done** |
| PerformEvidence long-file split | **255->233** via PerformEvidenceTheorems (**284**) | **done** |
| OfficialPath long-file split | **256->245** via OfficialPathTheorems (**286**) | **done** |
| Capable long-file split | **258->233** via CapableTheorems (**279**) | **done** |
| InstallOut long-file split | **279->272** via InstallOutTheorems (**249**) | **done** |
| CapableStepContract long-file split | **286->262** via CapableStepContractTheorems (**280**) | **done** |
| CapableRead long-file split | **297->288** via CapableReadTheorems (**191**) | **done** |
| OfficialPathAlternate long-file split | **310->295** via OfficialPathAlternateTheorems (**328**) | **done** |
| DualEqWriteParity long-file split | **319->302** via DualEqWriteParityTheorems (**321**) | **done** |
| OfficialRetire long-file split | **322->316** via OfficialRetireTheorems (**293**) | **done** |
| LlvmHold long-file split | **211->144** via LlvmHoldTheorems (**124**) | **done** |
| Erasure long-file split | **226->110** via ErasureTheorems (**177**) | **done** |
| EmitErasure long-file split | **233->63** via EmitErasureScaffold (**236**) | **done** |
| KernelMult long-file split | **250->160** via KernelMultTheorems (**166**) | **done** |
| IrProgram long-file split | **254->138** via IrProgramTheorems (**179**) | **done** |
| SelfApply long-file split | **255->187** via SelfApplyTheorems (**137**) | **done** |
| InventoryClose long-file split | **262->193** via InventoryCloseTheorems (**135**) | **done** |
| EmitMult long-file split | **277->60** via EmitMultScaffold (**283**) | **done** |
| ParityTypes long-file split | **279->171** via ParityTypesTheorems (**168**) | **done** |
| Types long-file split | **302->151** via TypesTheorems (**215**) | **done** |
| ParityLinear long-file split | **304->176** via ParityLinearTheorems (**189**) | **done** |
| EmitBanner long-file split | **327->63** via EmitBannerScaffold (**325**) | **done** |
| SelfHost long-file split | **342->164** via SelfHostTheorems (**240**) | **done** |
| KernelLinear long-file split | **343->229** via KernelLinearTheorems (**184**) | **done** |
| Extract long-file split | **344->156** via ExtractTheorems (**253**) | **done** |
| KernelTypes long-file split | **345->214** via KernelTypesTheorems (**201**) | **done** |
| PerformClaimed long-file split | **345->331** via PerformClaimedTheorems (**294**) | **done** |
| DualEqWriteClosePath long-file split | **354->344** via DualEqWriteClosePathTheorems (**314**) | **done** |
| DualEqWriteCapableGap long-file split | **354->340** via DualEqWriteCapableGapTheorems (**309**) | **done** |
| SelfHostComplete long-file split | **363->338** via SelfHostCompleteTheorems (**252**) | **done** |
| OwnershipClaimed long-file split | **367->342** via OwnershipClaimedTheorems (**247**) | **done** |
| EmitExtract long-file split | **370->70** via EmitExtractScaffold (**361**) | **done** |
| ProbeWire long-file split | **379->288** via ProbeWireTheorems (**163**) | **done** |
| ParityMult long-file split | **382->183** via ParityMultTheorems (**265**) | **done** |
| StepContractFull long-file split | **382->365** via StepContractFullTheorems (**235**) | **done** |
| ProductPathOwnershipRegenerate long-file split | **390->328** via ProductPathOwnershipRegenerateTheorems (**304**) | **done** |
| ParityProgram long-file split | **407->231** via ParityProgramTheorems (**239**) | **done** |
| IrGraph long-file split | **410->177** via IrGraphTheorems (**298**) | **done** |
| ParityEmit long-file split | **419->240** via ParityEmitTheorems (**243**) | **done** |
| EmitProgram long-file split | **422->68** via EmitProgramScaffold (**413**) | **done** |
| KernelEmit long-file split | **425->273** via KernelEmitTheorems (**219**) | **done** |
| DualResidual long-file split | **427->316** via DualResidualTheorems (**180**) | **done** |
| SelfHostBody long-file split | **456->328** via SelfHostBodyTheorems (**199**) | **done** |
| EmitLinear long-file split | **462->62** via EmitLinearScaffold (**464**) | **done** |
| EmitTypes long-file split | **466->66** via EmitTypesScaffold (**463**) | **done** |
| SurfaceMatrix long-file split | **475->271** via SurfaceMatrixTheorems (**266**) | **done** |
| EmitGraph long-file split | **477->69** via EmitGraphScaffold (**474**) | **done** |
| KernelProgram long-file split | **508->368** via KernelProgramTheorems (**213**) | **done** |
| JoinMap long-file split | **519->294** via JoinMapTheorems (**284**) | **done** |
| SpecProof long-file split | **527->432** via SpecProofTheorems (**161**) | **done** |
| No-sorry host inventory | **0** sorry/admit; 3 Linear axioms; cold splits continue (PerformClaimed **345** Open) | **done** |
| Tip sizes (done hygiene) | SelfApplyFs tip **1894** (import only after split **1888**); CompilePath **458** (Mult..Body fixture splits done) | **done** (not re-open as primary) |
| Dual-pin / short names | Dual-pin b1-33; all ProductPathFreestanding* short names | **done** |
| Claim B complete | Freestanding product self-host complete true (lake on complete recipe while bootstrapping) | **done** / true |
| Claim A residual free | Measure + DualResidual honesty + wire | **true** (host residual remains; free != Lake gone) |
| llvm / PROVABLY / proof complete | Unlock only with real bars | **false** / held |
| Post-hygiene sequence | After long-file split: residual free (A) only when bar met -> ccomp/CompCert (D) held | **held** sequence; never forge |
| Optional later splits | Tip smoke/theorem gate-first; emit-wire hostPin scanner splits | later, not primary Open |

**Do not:** re-land B3..B40 under new names without new evidence; hand-author product C;
forge free/complete/PROVABLY; `/tmp` full-file stitch of product Lean; naive half-file
cuts; agent git revert on screw-up (STOP, leave tree); plan-id or gap-docs re-grep theater.

---

## Highest value next

| Priority | What | Why highest value | Where |
|----------|------|-------------------|-------|
| **open** | M3 subset language front-end design | Design note then implement residual | `RESIDUAL-systems.md`; plan ideal M3 |
| **done** | Name B full freestanding Mult write (M2) | Path A host-cc Mult package writer; freestandingDriverComplete true | `RESIDUAL-systems.md`; plan Step 5 M2 Name B full done 2026-08-01 |
| **done** | Name B full Mult write design deepen (M2 prep) | Design note Path A prefer; checkable Done when | `doc/dev/research/name-b-full-mult-write-design-deepen-2026-08-01.md`; plan Step 5 M2 design done 2026-08-01 |
| **done** | Compose subset rebuild (M1 follow-on) | ComposeSubsetRebuild self-application; just compose-subset-rebuild GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Compose rebuild done 2026-08-01 |
| **done** | Compose subset emit (ideal M1 continue) | ComposeSubsetEmit Compose unit package write; just compose-subset-emit GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Compose emit done 2026-08-01 |
| **done** | Graph subset rebuild (M1 follow-on) | GraphSubsetRebuild self-application; just graph-subset-rebuild GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Graph rebuild done 2026-08-01 |
| **done** | Graph subset emit (ideal M1 continue) | GraphSubsetEmit Graph unit package write; just graph-subset-emit GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Graph emit done 2026-08-01 |
| **done** | Erasure subset rebuild (M1 follow-on) | ErasureSubsetRebuild self-application; just erasure-subset-rebuild GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Erasure rebuild done 2026-08-01 |
| **done** | Erasure subset emit (ideal M1 continue) | ErasureSubsetEmit Erasure unit package write; just erasure-subset-emit GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Erasure emit done 2026-08-01 |
| **done** | Extract subset rebuild (M1 follow-on) | ExtractSubsetRebuild self-application; just extract-subset-rebuild GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Extract rebuild done 2026-08-01 |
| **done** | Extract subset emit (ideal M1 continue) | ExtractSubsetEmit Extract unit package write; just extract-subset-emit GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Extract emit done 2026-08-01 |
| **done** | MultSubsetEmit freestanding Mult SSOT write path (host) | MultFsDeepen + prebuilt slake-mult-fs-write / just mult-subset-freestanding-write; multFsWritePathReady true; freestandingDriverComplete false; product Lake remains | `RESIDUAL-systems.md`; plan Step 5 M2 host write path 2026-08-01 |
| **done** | Mult freestanding surface dual-check partial (M2 Name B greps) | MultFsDeepen; just mult-subset-freestanding-deepen; greps; freestandingDeepenPartial true; product Lake remains | `RESIDUAL-systems.md`; plan Step 5 M2 Name B greps done 2026-08-01 |
| **done** | Mult without-Lake prebuilt driver (M2 Name A) | just mult-subset-rebuild-without-lake; prebuilt ELF; withoutLakeFinished true; product Lake remains | `RESIDUAL-systems.md`; plan Step 5 M2 Name A done 2026-08-01 |
| **done** | Mult without-Lake driver design (M2 prep) | Design note + honesty matrix + proposed Names; no driver forge | `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md`; plan Step 5 M2 design done 2026-08-01 |
| **done** | Program subset rebuild (M1 follow-on) | ProgramSubsetRebuild self-application; just program-subset-rebuild GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Program rebuild done 2026-08-01 |
| **done** | Program subset emit (ideal M1 continue) | ProgramSubsetEmit Program unit package write; just program-subset-emit GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Program emit done 2026-08-01 |
| **done** | Types subset rebuild (M1 follow-on) | TypesSubsetRebuild self-application; just types-subset-rebuild GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Types rebuild done 2026-08-01 |
| **done** | Types subset emit (ideal M1 continue) | TypesSubsetEmit Types unit package write; just types-subset-emit GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 Types emit done 2026-08-01 |
| **done** | Linear subset rebuild (M1 follow-on) | LinearSubsetRebuild self-application; just linear-subset-rebuild GREEN | `RESIDUAL-systems.md`; plan Step 5 M1 rebuild done 2026-08-01 |
| **done** | Linear subset emit (ideal M1) | LinearSubsetEmit Linear unit package write; just linear-subset-emit GREEN | `RESIDUAL-systems.md`; plan Step 5 ideal M1 done 2026-08-01 |
| **done** | Slake rebuild freestanding subset (bootstrap S3) | MultSubsetRebuild self-application; just mult-subset-rebuild GREEN | `RESIDUAL-systems.md`; plan Step 5 Phase C S3 done 2026-08-01 |
| **done** | Slake Mult subset emit (bootstrap S2) | MultSubsetEmit Mult unit package write; just mult-subset-emit GREEN | `RESIDUAL-systems.md`; plan Step 5 Phase C S2 done 2026-08-01 |
| **done** | Residual free claim | Free true; host residual remains; checklist 2-10 green; lake + measure GREEN | `RESIDUAL-systems.md`; plan Step 3 done 2026-08-01 |
| **held** | Plan Step 4 (proof / PROVABLY / LLVM) | Do not auto-start; evidence bars separate from free | plan-residual-free-freestanding Step 4; LlvmHold |
| **done** | Linear freestanding contracts | Exact-once / Mult 0/1/omega; axioms documented; lake green; free still false | `RESIDUAL-systems.md`; plan Step 2 |
| **done** | Residual free bar inventory | Checklist + measure green; free still false | `doc/dev/research/residual-free-bar-inventory-2026-08-01.md` |
| **done (parked hygiene)** | Never-split cold long-file chain | Linear last **118->92**; not the product goal | `RESIDUAL-systems.md` |
| **done** | Linear long-file split | **118->92** via LinearTheorems (**71**) | `RESIDUAL-systems.md` |
| **done** | KernelSelfApply long-file split | **125->105** via KernelSelfApplyTheorems (**101**) | `RESIDUAL-systems.md` |
| **done** | ProductPathPerform long-file split | **137->134** via ProductPathPerformTheorems (**80**) | `RESIDUAL-systems.md` |
| **done** | ProductPathOwnershipInputs long-file split | **141->136** via ProductPathOwnershipInputsTheorems (**87**) | `RESIDUAL-systems.md` |
| **done** | BootstrapHonesty long-file split | **142->111** via BootstrapHonestyTheorems (**111**) | `RESIDUAL-systems.md` |
| **done** | ProductPathWriterPathPlan long-file split | **143->136** via ProductPathWriterPathPlanTheorems (**167**) | `RESIDUAL-systems.md` |
| **done** | ProductPathWriterSurface long-file split | **147->134** via ProductPathWriterSurfaceTheorems (**186**) | `RESIDUAL-systems.md` |
| **done** | ProductPathPerformStep long-file split | **152->147** via ProductPathPerformStepTheorems (**165**) | `RESIDUAL-systems.md` |
| **done** | ProductPathWriterPathExec long-file split | **169->162** via ProductPathWriterPathExecTheorems (**163**) | `RESIDUAL-systems.md` |
| **done** | Mult long-file split | **184->90** via MultTheorems (**148**) | `RESIDUAL-systems.md` |
| **done** | ProductPathWriteHc long-file split | **194->181** via ProductPathWriteHcTheorems (**187**) | `RESIDUAL-systems.md` |
| **done** | ProductPathReadSsot long-file split | **208->197** via ProductPathReadSsotTheorems (**171**) | `RESIDUAL-systems.md` |
| **done** | CapableRegenerate long-file split | **218->208** via CapableRegenerateTheorems (**228**) | `RESIDUAL-systems.md` |
| **done** | CapableFullBar long-file split | **231->219** via CapableFullBarTheorems (**293**) | `RESIDUAL-systems.md` |
| **done** | ProductPathComposePlan long-file split | **251->247** via ProductPathComposePlanTheorems (**181**) | `RESIDUAL-systems.md` |
| **done** | PerformEvidence long-file split | **255->233** via PerformEvidenceTheorems (**284**) | `RESIDUAL-systems.md` |
| **done** | OfficialPath long-file split | **256->245** via OfficialPathTheorems (**286**) | `RESIDUAL-systems.md` |
| **done** | Capable long-file split | **258->233** via CapableTheorems (**279**) | `RESIDUAL-systems.md` |
| **done** | CapableStepContract long-file split | **286->262** via CapableStepContractTheorems (**280**) | `RESIDUAL-systems.md` |
| **done** | CapableRead long-file split | **297->288** via CapableReadTheorems (**191**) | `RESIDUAL-systems.md` |
| **done** | OfficialPathAlternate long-file split | **310->295** via OfficialPathAlternateTheorems (**328**) | `RESIDUAL-systems.md` |
| **done** | DualEqWriteParity long-file split | **319->302** via DualEqWriteParityTheorems (**321**) | `RESIDUAL-systems.md` |
| **done** | OfficialRetire long-file split | **322->316** via OfficialRetireTheorems (**293**) | `RESIDUAL-systems.md` |
| **done** | LlvmHold long-file split | **211->144** via LlvmHoldTheorems (**124**) | `RESIDUAL-systems.md` |
| **done** | Erasure long-file split | **226->110** via ErasureTheorems (**177**) | `RESIDUAL-systems.md` |
| **done** | EmitErasure long-file split | **233->63** via EmitErasureScaffold (**236**) | `RESIDUAL-systems.md` |
| **done** | KernelMult long-file split | **250->160** via KernelMultTheorems (**166**) | `RESIDUAL-systems.md` |
| **done** | SelfApply long-file split | **255->187** via SelfApplyTheorems (**137**) | `RESIDUAL-systems.md` |
| **done** | InventoryClose long-file split | **262->193** via InventoryCloseTheorems (**135**) | `RESIDUAL-systems.md` |
| **done** | EmitMult long-file split | **277->60** via EmitMultScaffold (**283**) | `RESIDUAL-systems.md` |
| **done** | ParityTypes long-file split | **279->171** via ParityTypesTheorems (**168**) | `RESIDUAL-systems.md` |
| **done** | Types long-file split | **302->151** via TypesTheorems (**215**) | `RESIDUAL-systems.md` |
| **done** | ParityLinear long-file split | **304->176** via ParityLinearTheorems (**189**) | `RESIDUAL-systems.md`
| **done** | EmitBanner long-file split | **327->63** via EmitBannerScaffold (**325**) | `RESIDUAL-systems.md` |
| **done** | SelfHost long-file split | **342->164** via SelfHostTheorems (**240**) | `RESIDUAL-systems.md` |
| **done** | KernelLinear long-file split | **343->229** via KernelLinearTheorems (**184**) | `RESIDUAL-systems.md` |
| **done** | Extract long-file split | **344->156** via ExtractTheorems (**253**) | `RESIDUAL-systems.md` |
| **done** | KernelTypes long-file split | **345->214** via KernelTypesTheorems (**201**) | `RESIDUAL-systems.md` |
| **done** | PerformClaimed long-file split | **345->331** via PerformClaimedTheorems (**294**) | `RESIDUAL-systems.md` |
| **done** | DualEqWriteClosePath long-file split | **354->344** via DualEqWriteClosePathTheorems (**314**) | `RESIDUAL-systems.md` |
| **done** | DualEqWriteCapableGap long-file split | **354->340** via DualEqWriteCapableGapTheorems (**309**) | `RESIDUAL-systems.md` |
| **done** | SelfHostComplete long-file split | **363->338** via SelfHostCompleteTheorems (**252**) | `RESIDUAL-systems.md` |
| **done** | OwnershipClaimed long-file split | **367->342** via OwnershipClaimedTheorems (**247**) | `RESIDUAL-systems.md` |
| **done** | EmitExtract long-file split | **370->70** via EmitExtractScaffold (**361**) | `RESIDUAL-systems.md` |
| **done** | ProbeWire long-file split | **379->288** via ProbeWireTheorems (**163**) | `RESIDUAL-systems.md` |
| **done** | ParityMult long-file split | **382->183** via ParityMultTheorems (**265**) | `RESIDUAL-systems.md` |
| **done** | StepContractFull long-file split | **382->365** via StepContractFullTheorems (**235**) | `RESIDUAL-systems.md` |
| **done** | ProductPathOwnershipRegenerate long-file split | **390->328** via ProductPathOwnershipRegenerateTheorems (**304**) | `RESIDUAL-systems.md` |
| **done** | ParityProgram long-file split | **407->231** via ParityProgramTheorems (**239**) | `RESIDUAL-systems.md` |
| **done** | IrGraph long-file split | **410->177** via IrGraphTheorems (**298**) | `RESIDUAL-systems.md` |
| **done** | ParityEmit long-file split | **419->240** via ParityEmitTheorems (**243**) | `RESIDUAL-systems.md` |
| **done** | EmitProgram long-file split | **422->68** via EmitProgramScaffold (**413**) | `RESIDUAL-systems.md` |
| **done** | KernelEmit long-file split | **425->273** via KernelEmitTheorems (**219**) | `RESIDUAL-systems.md` |
| **done** | DualResidual long-file split | **427->316** via DualResidualTheorems (**180**) | `RESIDUAL-systems.md` |
| **done** | SelfHostBody long-file split | **456->328** via SelfHostBodyTheorems (**199**) | `RESIDUAL-systems.md` |
| **done** | EmitLinear long-file split | **462->62** via EmitLinearScaffold (**464**) | `RESIDUAL-systems.md` |
| **done** | EmitTypes long-file split | **466->66** via EmitTypesScaffold (**463**) | `RESIDUAL-systems.md` |
| **done** | SurfaceMatrix long-file split | **475->271** via SurfaceMatrixTheorems (**266**) | `RESIDUAL-systems.md` |
| **done** | EmitGraph long-file split | **477->69** via EmitGraphScaffold (**474**) | `RESIDUAL-systems.md` |
| **done** | KernelProgram long-file split | **508->368** via KernelProgramTheorems (**213**) | `RESIDUAL-systems.md` |
| **done** | JoinMap long-file split | **519->294** via JoinMapTheorems (**284**) | `RESIDUAL-systems.md` |
| **done** | SpecProof long-file split | **527->432** via SpecProofTheorems (**161**) | `RESIDUAL-systems.md` |
| **done** | EmitCompose long-file split | **596->75** via EmitComposeScaffold (**590**) | `RESIDUAL-systems.md` |
| **done** | FreestandingEmitLoad long-file split | **622->235** via FreestandingEmitLoadScaffold (**414**) | `RESIDUAL-systems.md` |
| **done** | ProductPath further split | **667->424** via ProductPathTheorems (**289**) | `RESIDUAL-systems.md` |
| **done** | CapableWriteHc long-file split | **668->316** via CapableWriteHcLoad (**401**) | `RESIDUAL-systems.md` |
| **done** | HostCompose long-file split | **669->220** via HostComposeTheorems (**485**) | `RESIDUAL-systems.md` |
| **done** | EmitPlan long-file split | **703->424** via EmitPlanScaffold (**332**) | `RESIDUAL-systems.md` |
| **done** | EmitApply long-file split | **706->423** via EmitApplyScaffold (**336**) | `RESIDUAL-systems.md` |
| **done** | EmitBody long-file split | **820->480** via EmitBodyScaffold (**394**) | `RESIDUAL-systems.md` |
| **done** | ProductPath long-file split | **864->667** via ProductPathBars (**254**) | `RESIDUAL-systems.md` |
| **1 (done)** | Residual free bar inventory | Checklist before free claim; measure green; free still false | plan Step 1; `doc/dev/research/residual-free-bar-inventory-2026-08-01.md` |
| **2 (done)** | Linear freestanding contracts | Exact-once / Mult 0/1/omega; affine not first-class | plan-residual-free-freestanding Step 2; Linear |
| **3 (done)** | Residual free claim | Free true; host residual remains; checklist 2-10 green | plan-residual-free-freestanding Step 3 (2026-08-01) |
| **4 (held)** | ccomp / CompCert (claim D) | Real ccomp + evidence matrix; never forge PROVABLY | LlvmHold; SpecProof |
| **5 (held)** | llvm unlock | After true freestanding self-host policy evidence | LlvmHold |
| **done** | No-sorry host inventory | 0 sorry/admit; inventory no-sorry-host-inventory-2026-07-31 | `RESIDUAL-systems.md` |
| **done parallel** | HostSpecs cold splits (all named) | specs live **2689**; hostPin scanner splits later | `RESIDUAL-systems.md` |
| **done** | Short product-path module names | All ProductPathFreestanding* retired | campaign shortname-camp-0731 |
| **done** | Dual-pin b1-33 + tip split | series ~5755->3638 then split **3638->1888** | dualpin-camp + tip-split-camp |

**Highest value next:** Open **empty** (done-for-now). Extract subset rebuild
**done**. No plan default names a next checkable residual. Next by operator
choice: freestanding Mult write driver complete (Name B full;
freestandingDriverComplete false today) or more unit surfaces
(Erasure/Graph/Compose). Do not invent unrelated Open Names. S4 / M6 Lake retire
**deferred** (never forge StillUsesLake false early). Complete true; free
**true**; host residual remains; Lake host remains; M2 Name A + Name B surface
dual-check partial done. Step 4 (proof progressive / PROVABLY / LLVM) **held**
-- do not auto-start. Never forge Lake-gone / llvm / PROVABLY.

---

## Validation gates

Operator and agents can run these without inventing product work. Prefer live `just`
gates; flake checks need human-staged `nix/` paths (see `AGENTS.md` Flake vs live).

| Gate | Command | What it proves |
|------|---------|----------------|
| Hygiene + tone | `just hygiene` | ASCII / trailing WS + novel markdown professional tone |
| Systems host presence | `just systems-host` | Host Lean / unit-surface static presence |
| Systems emit wire | `just systems-emit-wire` | Emit drivers, UNIT_DEEPEN, unit walk, residual-free measure honesty |
| Idris / Lean dual presence | `just idris-side` / `just lean-side` | Dual-side static presence |
| Product build + check | `just build` then `just check` | Freestanding product wire + full suite (build first) |
| Claim B complete (bootstrap) | `just freestanding-self-host-complete` | Greps + mandatory `lake build` / claim exe while Lake is host elaborator |
| Residual free measure only | `just product-residual-free-measure` | Measure green on release surface; **does not** flip free claimed |
| Flake (after human stage) | `nix flake check` | Pure checks on git-tracked tree only |

On no-sorry inventory slices that do **not** touch tip claim bools: hygiene is enough;
run `freestanding-self-host-complete` only if tip / claim surface is touched.

---

## Hold / deferred / blocked

| Item | Status | Why |
|------|--------|-----|
| LLVM IR emit | deferred | Until freestanding self-host is real |
| CompCert product seal | deferred | Needs real `ccomp` + evidence matrix; never forge |
| Further duals beyond three algorithm ids | deferred | Invent only for named map gaps |
| Freestanding product residual free | **claimed true** (2026-08-01) | Product wire free; host elaborator residual still remains (separate) |
| Host elaborator residual free | not claimed | Lake still elaborates Systems Lean host |
| Host readiness canaries only | deferred as residual | Exhausted under current surface |

Historical compile/emit product-wire capabilities through emit body are **done**
under Join done and `RESIDUAL-systems.md` Done archive. Product residual free is
**true** (host elaborator residual remains).

---

## Join status (auto-refreshed by `just progress` / `just watch`)

See live meter: `doc/PROGRESS.md` (generated). Do not hand-edit percentage tables there; edit evidence (side files + side residuals) instead.

---

## Foundation done

Tooling, charter, submodules, fork prompts, hygiene, Nix, just -- see `AGENTS.md`.

---

## Coordinator actions

- Read all fork residuals + `doc/PROGRESS.md` (join honesty; optional coordinator session).
- Write short directives in `doc/fork-guidance-idris.md`, `doc/fork-guidance-lean.md`, `doc/fork-guidance-systems.md`.
- Run `just watch` (300s loop) or `just progress` (once) while forks run.
- Do not race Idris / Lean / systems trees unless reassigned.
- Join-done history through frozen freestanding emit product wire is closed (see **Join done**). Lean host deepen continues under Mult..SelfHostBody (after HOST-SPEC-PROOF / HOST-SELF-HOST-BODY / host-owned emit growth); freeze C emit growth: **systems fork** owns residual (`RESIDUAL-systems.md`).

---

## Isolation

This repository **is** Systems Lean. Off-repo only if the human is desperate for a named fix.

## Watcher

Next implement prompt: root **`WATCHER.md`** (`WATCHER_BEGIN` ... `WATCHER_END`). This file is the status ledger only.
