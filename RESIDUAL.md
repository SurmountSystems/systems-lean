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

Historical prioritized backlog labels (P0..P7 / SH*) are land-time plan order only.
**Living tip wins** for claim status: free true; complete true; PROVABLY claimed;
product Lake pins false; host residual remains; llvm **unlocked** with evidence (Systems Open join; not full backend). Do not re-read P6/SH6 land-time prose as current
PROVABLY-false or complete-false.

| Priority | Work | Owner / notes |
|----------|------|----------------|
| P0 | Shell/C paydown | **done (bulk + stamp + check.sh delete):** plan `.agents/plans/plan-paydown-shell-c-surfaces.md` waves 0-E + Thin process glue + compile-path stamp delete + novel `check.sh` deleted. Dual pure Nix presence; emit bash deleted; elaborator/cc process glue is just recipes (`idris-elaborate`, `lean-elaborate`, `systems-lake`, `systems-cc-probe`) + optional `script/git-hooks/pre-commit`. Product residual free is a separate claim (true as of 2026-08-01; host residual remains). |
| P1 | Systems Lean host close PARTIAL | **done (2026-07-22):** `host-partial-inventory.md` CLOSABLE-MISS-COUNT-0; intentional PARTIAL carry |
| P2 | Host drives emit | **done (2026-07-22, partial):** host Mult/body SSOT fragments; full C ladder still frozen wire |
| P3 | Real Slake compile path | **done (partial + stamp delete):** `SystemsLean/CompilePath.lean` (`SLAKE_COMPILE_PATH_V1` / `HOST-COMPILE-PATH`); V0 shell stamp deleted; unit walk pure Nix |
| P4 | Join map into Slake | **done (2026-07-22, partial):** `SystemsLean/JoinMap.lean`; duals read-only; not formal full bridge theorems |
| P5 | Self-host direction readiness | **done (2026-07-22, partial):** `SystemsLean/SelfHost.lean`; not freestanding product self-host complete; does **not** unlock llvm alone |
| P6 | llvm-ir / PROVABLY | **living tip wins (supersedes land-time row):** PROVABLY **claimed** (`provablyUnlocked` true; matrix + lake); freestanding product self-host complete **true**; free **true**; llvm **unlocked** (`llvmUnlocked` true; unlock residual done; not full backend). Parallel Open continues. Historical land-time text required self-host + ccomp for PROVABLY -- both met. See Systems Open join. |
| P7 | Superset surface matrix | **done (2026-07-22, partial):** `SystemsLean/SurfaceMatrix.lean` + `surface-matrix.md`; not day-one full dual parity; does **not** unlock llvm |
| SH0..SH5 + deepen | Freestanding self-host track | **done (claim B complete true):** Mult..Emit kernels, parity, self-apply + freestanding deepen through Full/ownership/perform. Living tip: free **true**; complete **true**; PROVABLY **true**; llvm **true** (unlock residual). Greppable map: Systems Open join / `RESIDUAL-systems.md`. |
| SH6 | llvm / PROVABLY hold gate | **living tip wins (supersedes 2026-07-22 land-time row):** `LlvmHold.lean` (HOST-LLVM-HOLD / HOST-PROVABLY-HOLD); `provablyUnlocked` **true**; free **true**; complete **true**; `llvmUnlocked` **true** (unlock residual + lake); Mult..Graph IR text + unlock design **done**. Not residual-open mill for full backend. See Systems Open join. |
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
| IrGraph theorems | EMPTY-GRAPH-OK + multi-node one/two-edge + oversize + capacity full | **done (partial):** IrGraphTheorems IR-GRAPH-THEOREM; empty OK + one-node + edgesSound_one_edge + edgesSound_two_edges + addEdge_two_nodes_* + edgesSound_oversize_false + edgesSound_at_edgeMax + isWellTyped_at_edgeMax + addEdge_full_at_edgeMax + isWellTyped_oversize_false; proofCompleteClaimed stays false |
| Linear theorems | JOIN-ALG honest limited surface theorems | **done (partial):** Linear.lean LINEAR-THEOREM; shareNat_eq + shareNat_zero/succ + polyId_id + roundTrip_eq; axioms remain; no MULT-1 claim; proofCompleteClaimed stays false |
| HostCompose theorems | multPreScan / mint-consume / spent MULT-1 reject / push-edge / EMIT-BOUNDARY non-empty | **done (partial):** HostComposeTheorems COMPOSE-THEOREM; mint-consume + spent mult1 reject (`consume_mult1_spent_reject` family) + markErased_idempotent + multPreScan_omega_only_true + mint_consume_roundtrip + pushHostNode_* + addHostEdge_* + extractOk_classic_mult1_minted_false / extractOk_edge_mult1_minted_false / extractOk_classic_mult0_marked_false / extractOk_edge_mult0_marked_false; live-flag only; proofCompleteClaimed stays false |
| Extract theorems | RUNTIME-FS-only + raw-tag success paths | **done (partial):** Extract.lean EXTRACT-THEOREM; ofRuntimeTag?_some_implies_isValidRuntimeTag + extractOkFromTags? known-tag paths + fail_closed; proofCompleteClaimed stays false |
| Erasure theorems | mark fail-closed + composition honesty | **done (partial):** Erasure.lean ERASURE-THEOREM; checkFailClosed_eq + markForGrade?_some_implies_isErasureGrade / markForGrade?_some_is_mark; proofCompleteClaimed stays false |
| EmitBody theorems | HOST-EMIT-SSOT + non-empty fixtures | **done (partial):** EmitBody.lean EMIT-BODY-THEOREM; bodyOk_empty_true + bodyOk_mult1_* + bodyFromCompose non-empty fixtures; proofCompleteClaimed stays false |
| EmitPlan theorems | EMIT-PLAN readiness inventory | **done (partial):** EmitPlan.lean EMIT-PLAN-THEOREM; empty ready/counts + fail-closed MULT-1/MULT-0 + planOk_mult1_minted_true / planFromCompose_mult1_minted_runtime + mult0 marked/omega + planFromCompose_two_values_edge + planFromCompose_linear_and_erased; proofCompleteClaimed stays false |
| EmitApply theorems | EMIT-APPLY tag buffer honesty | **done (partial):** EmitApply.lean EMIT-APPLY-THEOREM; applyCap_eq_32 + packTag_linear/erased/value + unpack + fail-closed MULT-1 + applyFromCompose_mult1_minted_tags / mult0_marked_tag / omega_tag + applyFromCompose_linear_and_erased_order + applyIsValid_count_tags_desync_false + applyIsValid_oversize_count_false + applyFromCompose_sound_inventory; proofCompleteClaimed stays false |
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
| SelfApplyFs theorems | freestanding self-apply path readiness | **done (partial):** SelfApplyFs.lean + SelfApplyFsTheorems.lean SELF-APPLY-FS-THEOREM / SELF-APPLY-FS-SMOKE; freestandingSelfApplyReady_true + freestandingProductSelfHostComplete_true; complete true (claim B); proofCompleteClaimed stays false |
| InventoryClose theorems | inventory close readiness canaries | **done (partial):** InventoryClose.lean INVENTORY-CLOSE-THEOREM; inventoryCloseReady_true + residualFreeClaimed_false; residual free stays false; proofCompleteClaimed stays false |
| ProductPath theorems | product path readiness canaries | **done (partial):** ProductPath.lean PRODUCT-PATH-THEOREM; productPathReady_true + productPathCloseReady_true + residualFreeClaimed_false; no alias theater growth; proofCompleteClaimed stays false |
| DualResidual theorems | dual residual honesty canaries | **done (partial):** DualResidual.lean DUAL-RESIDUAL-THEOREM; dualResidualReady_true + both residuals remain; proofCompleteClaimed stays false |
| ProbeWire theorems | probe-vs-wire honesty canaries | **done (partial):** ProbeWire.lean PROBE-WIRE-THEOREM; probeWireReady_true + behavioralProbeIsSmokeDebt_true; proofCompleteClaimed stays false |
| SpecProof theorems | formal feedback honesty canaries | **done (partial):** SpecProofTheorems.lean (split) SPEC-PROOF-THEOREM; specProofReady_true + proofCompleteClaimed_false (proved false); not proof complete |
| LlvmHold theorems | SH6 hold honesty canaries | **done (partial):** LlvmHold.lean LLVM-HOLD-THEOREM; llvmHoldReady_true + llvmUnlocked_true; unlock with evidence not full backend; proofCompleteClaimed stays false |

**Systems living residual:** `RESIDUAL-systems.md` **Open** queue (plain Names).
Do not re-paste greppable token maps here. Evidence tokens stay in Lean / Nix /
companions.

### Systems Open (join)

**Living tip:** freestanding product self-host **complete true**; product residual free **true**; product path StillUsesLake/DependsOnLake **false** (M6 phase 2 lake proof); host elaborator residual **remains** (DualResidual not host free; free claimed **false** -- do not flip); **finish line:** Slake does everything Lake does for host develop under `src/systems/` -- **claim false; living work program true** (plan `.agents/plans/plan-slake-replaces-lake.md` mid-ladder refresh 2026-08-03; full goal chain Systems Lean + linear types + freestanding C + CompCert `ccomp` validate); Mult..Compose six-unit path is **foundation only**, not host free; operator choice **(a)** full host develop; A1-A30 foundation through library seed L19 **done** (seed modules=75 Mult..Compose+Erasure/Extract+CompilePath+Kernel+Kernel *Theorems+JoinMap/SelfHost+SurfaceMatrix+Emit scaffolds+KernelSelfApply+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems); Open primary **Host library seed expand continue** (beyond modules=75; next coherent band); hygiene on touch including markdown (`just hygiene`; gradual scrub); freestanding product path **M0-M6 closed**; Peer elaborator steps 1-10 **done** (foundation); CompCert product seal **closed** (PROVABLY **claimed**); llvm **unlocked** (not full backend); Mult..Compose package dual-ok **done** (not host free); HostPackageWrite/Front/Graph long-file splits **done**; Track 3c free flip **held** until full host checklist; proofCompleteClaimed false. Foundation product claims unchanged.

| Name | Status | Owner detail |
|------|--------|--------------|
| **Layout IR tag dual-pin** | **done** (2026-08-03) | `just layout-ir-dual-pin`; pure Nix `nix/systems-llvm-ir/layout-ir-dual-pin.nix`; Mult IR tags dual-pin vs fixture; Mult-first ladder closed; join `/tmp/grok-1000/grok-impl-summary-4b236baf.md` |
| **ABI parity smoke** | **done** (2026-08-03) | `just abi-parity-smoke`; pure Nix `nix/systems-llvm-ir/abi-parity.nix`; Mult fixture/header/IR 0/1/2 i32 align 4; join `/tmp/grok-1000/grok-impl-summary-b1aa23ee.md` |
| **Layout size/align fixture** | **done** (2026-08-03) | Mult-first size/align table; research `doc/dev/research/layout-size-align-fixture-2026-08-03.md`; join `/tmp/grok-1000/grok-impl-summary-509af6bb.md` |
| **Rust-native layout design** | **done** (2026-08-03) | Track 2f; research layout/ABI bar + residual Names; not Rust link claim; join `/tmp/grok-1000/grok-impl-summary-e4e35312.md` |
| **Optional llvm-as smoke** | **done** (2026-08-03) | Track 2e; `just llvm-as-smoke` skip-if-missing / RED when present; pure Nix as-smoke honesty; join `/tmp/grok-1000/grok-impl-summary-dc10524b.md` |
| **LLVM IR compose emit** | **done** (2026-08-03) | Track 2d; `LlvmComposeText` / `slake_compose.ll` / `just llvm-compose-text`; host compose + program+graph SSOT; join `/tmp/grok-1000/grok-impl-summary-01c8c98d.md` |
| **LLVM IR unit package expand** | **done** (2026-08-03) | Track 2c; `just llvm-unit-package` Mult..Graph; unlock honesty true; join `/tmp/grok-1000/grok-impl-summary-94e29f6c.md` |
| **LLVM IR unlock residual** | **done** (2026-08-03) | Track 2b; `llvmUnlocked` true + lake blast-radius proof; join `/tmp/grok-1000/grok-impl-summary-40ecf6cb.md` |
| **LLVM IR unlock design** | **done** (2026-08-03) | Track 2a; research unlock evidence checklist; does **not** flip pin; join `/tmp/grok-1000/grok-impl-summary-a67e230a.md` |
| **Long-file inventory reseed** | **done** (2026-08-03) | Track 6a; research `doc/dev/research/sub-1kloc-inventory-reseed-2026-08-03.md`; AGENTS+host-presence+emit-wire under 1000; join `/tmp/grok-1000/grok-impl-summary-sub-1kloc-nix-agents.md` |
| **SelfApplyFs long-file split** | **done** (2026-08-03) | Tip **1922->999**; `SelfApplyFsTheorems` theorem/smoke role seam; lake + systems-host + hygiene GREEN; join `/tmp/grok-1000/grok-impl-summary-selfapplyfs-lfs.md` |
| **Self-host map long-file split** | **done** (2026-08-03) | Map **5525->901**; companions bootstrap/product-path/host-surface; greppable cites on living index; join `/tmp/grok-1000/grok-impl-summary-66e1b03b.md` |
| **Superset surface inventory** | **done** (2026-08-03) | Track 1a; research `doc/dev/research/superset-surface-inventory-2026-08-03.md`; surface-matrix reseed; join `/tmp/grok-1000/grok-impl-summary-67e88df0.md` |
| **Matrix claim-row honesty** | **done** (2026-08-03) | Track 1b; freestanding+llvm inventory measured; lake SurfaceMatrix + Theorems green; join `/tmp/grok-1000/grok-impl-summary-9ec150d0.md` |
| **Proof complete inventory** | **done** (2026-08-03) | Track 4a; research `doc/dev/research/proof-complete-inventory-2026-08-03.md`; next Open HostCompose spent mult1 reject; `proofCompleteClaimed` not flipped; join `/tmp/grok-1000/grok-impl-summary-542dd76c.md` |
| **HostCompose spent mult1 reject** | **done** (2026-08-03) | Track 4b; `consume_mult1_spent_reject` family; lake HostComposeTheorems exit 0; complete stays false; join `/tmp/grok-1000/grok-impl-summary-76b0ab44.md` |
| **IrGraph edge capacity full reject** | **done** (2026-08-03) | Track 4b; edgesSound_at_edgeMax / isWellTyped_at_edgeMax / addEdge_full_at_edgeMax / isWellTyped_oversize_false; lake IrGraphTheorems exit 0; complete stays false; join `/tmp/grok-1000/grok-impl-summary-0833b7d7.md` |
| **EmitApply desync fail-closed deepen** | **done** (2026-08-03) | Track 4b continuous; applyIsValid_oversize_count_false + applyFromCompose_sound_inventory; lake EmitApply exit 0; complete stays false; join `/tmp/grok-1000/grok-impl-summary-87a47993.md` |
| **Types multi-node mixed kind program** | **done** (2026-08-03) | Track 4b continuous / 4b-cont3; isWellTyped_mixed_kinds + foldWellTyped_mixed_kinds_some + isWellTyped_mixed_bad_false; lake IrProgramTheorems exit 0; complete stays false; join `/tmp/grok-1000/grok-impl-summary-44784b63.md` |
| **Host residual free design** | **done** (2026-08-03) | Track 3a; research `doc/dev/research/host-residual-free-design-2026-08-03.md`; DualResidual pins not flipped; join `/tmp/grok-1000/grok-impl-summary-e4059bfe.md` |
| **Host Types fragment expand** | **done** (2026-08-03) | Track 3b-1; HostFront G4 Types + HostGraph Types expand; without-Lake green; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-143ef620.md` |
| **Host Program fragment expand** | **done** (2026-08-03) | Track 3b-2; HostFront G5 Program + HostGraph Program expand count 5; without-Lake green; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-6fe54900.md` |
| **Host Graph fragment expand** | **done** (2026-08-03) | Track 3b-3; HostFront G6 Graph + HostGraph Graph expand count 6; without-Lake green; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-ec338445.md` |
| **Host Compose fragment expand** | **done** (2026-08-03) | Track 3b-4; HostFront G7 + HostGraph Compose expand count 7; without-Lake green; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-6fae5d71.md` |
| **Peer unit package expand beyond Mult** | **done** (2026-08-03) | Track 3b-5; named unit **Linear**; HostPackageWrite Mult + Linear package dual-ok under without-Lake; Mult still green; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-c8e3b74b.md` |
| **Host residual shrink inventory reseed** | **done** (2026-08-03) | Track 3b-N; HostResidualShrink fragment Mult..Compose + package Mult+Linear dual-ok inventory; partial shrink true; host free false; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-host-shrink-reseed-3bn.md` |
| **Peer Types unit package expand** | **done** (2026-08-03) | Track 3b-6; Mult+Linear+Types package dual-ok under without-Lake; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-peer-types-package-3b6.md` |
| **Peer Program unit package expand** | **done** (2026-08-03) | Track 3b-7; Mult+Linear+Types+Program package dual-ok under without-Lake; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-peer-program-package-3b7.md` |
| **Peer Graph unit package expand** | **done** (2026-08-03) | Track 3b-8; Mult+Linear+Types+Program+Graph package dual-ok under without-Lake; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-peer-graph-package-3b8.md` |
| **Peer Compose unit package expand** | **done** (2026-08-03) | Track 3b-9; Mult+Linear+Types+Program+Graph+Compose package dual-ok under without-Lake; DualResidual not flipped; join `/tmp/grok-1000/grok-impl-summary-peer-compose-package-3b9.md` |
| **Host residual free bar inventory** | **done** (2026-08-03) | Research `doc/dev/research/host-residual-free-bar-inventory-2026-08-03.md`; section-4 not met under choice (a) full host develop; DualResidual not flipped; Mult..Compose not host free; join `/tmp/grok-1000/grok-impl-summary-host-residual-free-bar-inventory.md` |
| **Full host elaborator intent in living docs (A1)** | **done** (2026-08-03) | Finish line reseed: Slake owns Lake host jobs; six-unit foundation only; print policy three stories; Open A2 + P1; DualResidual unchanged; join `.agents/joins/a1-slake-as-lake-intent-reseed.md` |
| **Multi-language print inventory** | **done** (2026-08-03) | Research `doc/dev/research/multi-language-print-inventory-2026-08-03.md`; host-cc helpers top temporary debt |
| **Full host elaborator design (A2)** | **done** (2026-08-03) | Research `doc/dev/research/full-host-elaborator-design-2026-08-03.md`; Lake jobs L1-L10; gap vs six-unit; queue A3..A-last; dialect hybrid; DualResidual unchanged; join `.agents/joins/a2-full-host-elaborator-design.md` |
| **Package roots without Lake** | **done** (2026-08-03 A3) | `HostPackageRoots` + `host-package-roots-without-lake`; package map + module list walk; HostResidualShrink cites dual-ok; DualResidual unchanged; join `.agents/joins/a3-package-roots-without-lake.md` |
| **Real Mult import graph** | **done** (2026-08-03 A4) | `HostImportGraph` + `host-import-graph-without-lake`; Mult+MultTheorems real import edges; missing/cycle fail-closed; HostResidualShrink dual-ok; DualResidual unchanged; join `.agents/joins/a4-real-mult-import-graph.md` |
| **First real host module check** | **done** (2026-08-03 A5) | `HostModuleCheck` + `host-module-check-without-lake`; PARTIAL-STRUCTURAL Mult+MultTheorems key decls; fail-closed missing decl/namespace/empty; HostResidualShrink dual-ok; DualResidual unchanged; join `.agents/joins/a5-first-real-host-module-check.md` |
| **Host module set expand** | **done** (2026-08-03 A6 Mult+Linear+Types) | Seed Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems on import graph + PARTIAL-STRUCTURAL module check without Lake hot path; HostResidualShrink expand dual-ok; HostModuleCheckTheorems split; DualResidual unchanged; join `.agents/joins/a6-host-module-set-expand.md` |
| **Host program module expand** | **done** (2026-08-03 A6 continue) | Seed +IrProgram+IrProgramTheorems on import graph + PARTIAL-STRUCTURAL module check without Lake hot path; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a6-host-program-module-expand.md` |
| **Host graph module expand** | **done** (2026-08-03 A6 continue) | Seed +IrGraph+IrGraphTheorems on import graph + PARTIAL-STRUCTURAL module check without Lake hot path; HostResidualShrink Graph seed reseed; DualResidual unchanged; join `.agents/joins/a6-host-graph-module-expand.md` |
| **Host compose module expand** | **done** (2026-08-03 A6 continue) | Seed +HostCompose+HostComposeTheorems modules=12 Mult..Compose foundation; PARTIAL-STRUCTURAL; seed-local edges; HostResidualShrink Compose seed reseed; DualResidual unchanged; join `.agents/joins/a6-host-compose-module-expand.md` |
| **Host theorem check expand** | **done** (2026-08-03 A7) | Mult..Compose `*Theorems` required corpus 8/8/8/6/6/8; PARTIAL-STRUCTURAL; HostResidualShrink A7 reseed; DualResidual unchanged; join `.agents/joins/a7-host-theorem-check-expand.md` |
| **Foundation tools without Lake bootstrap** | **done** (2026-08-03 A8) | `host-foundation-tools-clean-bootstrap` leanc relink; BootstrapPrebuildRemains false; FullHostElaborateRemains true; DualResidual unchanged; join `.agents/joins/a8-foundation-tools-without-lake-bootstrap.md` |
| **Host real module seed expand** | **done** (2026-08-03 A11) | Seed +Erasure+ErasureTheorems+Extract+ExtractTheorems modules=16; PARTIAL-STRUCTURAL; HostCompose seed-local Erasure/Extract edges; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a11-host-real-module-seed-expand.md` |
| **Host library seed expand continue (L1)** | **done** (2026-08-03 A12) | Seed +CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram modules=21; PARTIAL-STRUCTURAL; expandSliceName Host library seed expand continue; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a12-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L2 Kernel *Theorems)** | **done** (2026-08-03 A13) | Seed +KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems modules=25; PARTIAL-STRUCTURAL theorem corpus 8/8/8/8; HostResidualShrink seed + corpus reseed; DualResidual unchanged; join `.agents/joins/a13-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L3 JoinMap/SelfHost)** | **done** (2026-08-03 A14) | Seed +JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems modules=29; PARTIAL-STRUCTURAL JoinMap/SelfHost key decls + theorem corpus 8/8; HostResidualShrink seed + corpus reseed; DualResidual unchanged; join `.agents/joins/a14-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L4 SurfaceMatrix)** | **done** (2026-08-03 A15) | Seed +SurfaceMatrix+SurfaceMatrixTheorems modules=31; PARTIAL-STRUCTURAL SurfaceMatrix key decls + theorem corpus 8; HostResidualShrink seed + corpus reseed; DualResidual unchanged; join `.agents/joins/a15-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L5 Emit Mult..Compose scaffolds)** | **done** (2026-08-03 A16) | Seed +EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold modules=37; PARTIAL-STRUCTURAL Emit scaffold key decls; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a16-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L6 Emit Plan/Apply/Body scaffolds)** | **done** (2026-08-03 A17) | Seed +EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold modules=40; PARTIAL-STRUCTURAL Plan/Apply/Body productStageId + path key decls; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a17-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L7 Emit Erasure/Extract/Banner scaffolds)** | **done** (2026-08-03 A18) | Seed +EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold modules=43; PARTIAL-STRUCTURAL Erasure/Extract/Banner stageId + path key decls; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a18-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L8 KernelSelfApply)** | **done** (2026-08-03 A19) | Seed +KernelSelfApply+KernelSelfApplyTheorems modules=45; PARTIAL-STRUCTURAL KernelSelfApply leaf + theorems parent import; HostResidualShrink seed reseed; DualResidual unchanged; KernelEmit held (Emit product deps); join `.agents/joins/a19-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L9 Emit product)** | **done** (2026-08-03 A20) | Seed +EmitMult+EmitPlan+EmitApply+EmitBody modules=49; PARTIAL-STRUCTURAL product key decls + honest import edges; HostResidualShrink seed reseed; DualResidual unchanged; KernelEmit deps now seeded; join `.agents/joins/a20-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L10 KernelEmit)** | **done** (2026-08-03 A21) | Seed +KernelEmit+KernelEmitTheorems modules=51; PARTIAL-STRUCTURAL multi-import HostCompose+EmitPlan+EmitApply+EmitBody+EmitMult+KernelProgram + stage/ready decls + theorem corpus; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a21-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L11 ParityMult)** | **done** (2026-08-03 A22) | Seed +ParityMult+ParityMultTheorems modules=53; PARTIAL-STRUCTURAL Mult+KernelMult+EmitMult imports + stage/ready/parity decls + theorem corpus; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a22-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L12 ParityLinear)** | **done** (2026-08-03 A23) | Seed +ParityLinear+ParityLinearTheorems modules=55; PARTIAL-STRUCTURAL KernelLinear+ParityMult imports + stage/ready/parity decls + theorem corpus; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a23-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L13 ParityTypes)** | **done** (2026-08-03 A24) | Seed +ParityTypes+ParityTypesTheorems modules=57; PARTIAL-STRUCTURAL KernelTypes+ParityLinear imports + stage/ready/parity decls + theorem corpus; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a24-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L14 ParityProgram)** | **done** (2026-08-03 A25) | Seed +ParityProgram+ParityProgramTheorems modules=59; PARTIAL-STRUCTURAL KernelProgram+ParityTypes imports + stage/ready/parity decls + theorem corpus; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a25-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L15 ParityEmit)** | **done** (2026-08-03 A26) | Seed +ParityEmit+ParityEmitTheorems modules=61; PARTIAL-STRUCTURAL KernelEmit+ParityProgram+EmitMult imports + stage/ready/parity decls + theorem corpus; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a26-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L16 SelfApply)** | **done** (2026-08-03 A27) | Seed +SelfApply+SelfApplyTheorems modules=63; PARTIAL-STRUCTURAL ParityMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit imports + stage/ready decls + theorem corpus; HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a27-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L17 Emit Mult..Compose product)** | **done** (2026-08-03 A28) | Seed +EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose modules=68; PARTIAL-STRUCTURAL scaffold-import product shells; SelfApplyFs held (ProductPath/Capable deps); HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a28-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L18 Emit Erasure/Extract/Banner product)** | **done** (2026-08-03 A29) | Seed +EmitErasure+EmitExtract+EmitBanner modules=71; PARTIAL-STRUCTURAL scaffold-import product shells; SelfApplyFs held (ProductPath/Capable deps); HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a29-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L19 SelfApplyFs leaf foundation)** | **done** (2026-08-03 A30) | Seed +ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems modules=75; PARTIAL-STRUCTURAL SelfApplyFs direct leaf deps + theorems; SelfApplyFs still held (ProductPath/Capable deps remain); HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a30-host-library-seed-expand-continue.md` |
| **Host library seed expand continue (L20 ProductPath writer pure leaves)** | **done** (2026-08-03 A31) | Seed +ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems modules=81; PARTIAL-STRUCTURAL pure leaves B5-B7 + theorems; SelfApplyFs still held (remaining ProductPath/Capable); HostResidualShrink seed reseed; DualResidual unchanged; join `.agents/joins/a31-host-library-seed-expand-continue.md` |
| **Host library seed expand continue** | **open** (primary remain L21+) | Grow HostImportGraph + HostModuleCheck seed beyond Mult..Compose+Erasure/Extract+CompilePath/Kernel+Kernel *Theorems+JoinMap/SelfHost+SurfaceMatrix+Emit scaffolds+KernelSelfApply+Emit product+KernelEmit+Parity*+SelfApply+ProductOutKernel+BootstrapHonesty+ProductPathWriterSurface+ProductPathWriterPathPlan+ProductPathWriterPathExec modules=81 (next real library band; inventory remaining vs ~270; more ProductPathOwnershipInputs/Perform/Capable pure leaves; HostFront/Llvm leaves candidates); plan-slake claim false / living program true; DualResidual host remains true / free claimed false; free/complete/PROVABLY true; product Lake pins false; proofCompleteClaimed unchanged; `just hygiene` |
| **First surface without Lake** | **done** (A10+++) | first-surface clean-bootstrap + without-Lake; day-to-day remain empty; join `.agents/joins/a10-first-surface-without-lake.md` |
| **Subset emit rebuild without Lake** | **done** (A10++) | mult-subset-rebuild clean-bootstrap + without-Lake inventory dual-ok; day-to-day remain first-surface; join `.agents/joins/a10-subset-emit-rebuild-without-lake.md` |
| **Front mult package without Lake** | **done** (A10+) | front-mult-package clean-bootstrap + without-Lake; inventory reseed remain subset-emit-rebuild+first-surface; join `.agents/joins/a10-front-mult-package-without-lake.md` |
| **Host develop tool expand continue** | **done** (A10) | subset-front clean-bootstrap + without-Lake; inventory reseed; join `.agents/joins/a10-host-develop-tool-expand-continue.md` |
| **Host tool build expand** | **done** (A9) | Inventory + host-front without-Lake + develop clean-bootstrap; join `.agents/joins/a9-host-tool-build-expand.md` |
| **Host-cc helper tools without C printed from Lean** | **done** (2026-08-03 P1) | Lean-native Mult/ProductWire write; full host-cc C print retired; DualResidual unchanged; join `.agents/joins/p1-host-cc-helper-tools.md` |
| **HostGraph long-file split** | **done** | Tip **1116->939** via HostGraphTheorems (**230**); lake + host-graph-without-lake GREEN; DualResidual unchanged; peer Host tips under 1000; Track 3c held; join `/tmp/grok-1000/grok-impl-summary-hostgraph-long-file-split.md` |
| **HostFront long-file split** | **done** | Tip **1215->999** via HostFrontTheorems (**190**); lake + without-lake GREEN; DualResidual unchanged; join `/tmp/grok-1000/grok-impl-summary-hostfront-long-file-split.md` |
| **HostPackageWrite long-file split** | **done** | Tip **1015->784** via HostPackageWriteTheorems (**299**); lake + without-lake GREEN; DualResidual unchanged; join `/tmp/grok-1000/grok-impl-summary-hostpackagewrite-long-file-split.md` |
| **LLVM IR Graph text** | **done** (2026-08-03) | `LlvmGraphText` / `slake_graph.ll` / `just llvm-graph-text`; Graph SSOT EDGE_MAX/EMPTY-GRAPH-OK; llvmUnlocked false; join `/tmp/grok-1000/grok-impl-summary-llvm-ir-graph-text.md` |
| **LLVM IR Program text** | **done** (2026-08-03) | `LlvmProgramText` / `slake_program.ll` / `just llvm-program-text`; Program SSOT CAP/push/well-typed; llvmUnlocked false; join `/tmp/grok-1000/grok-impl-summary-llvm-ir-program-text.md` |
| **LLVM IR unit package join** | **done** (2026-08-03) | `just llvm-unit-package` fail-closed mult+linear+types; llvmUnlocked false; join `/tmp/grok-1000/grok-impl-summary-llvm-ir-unit-package-join.md` |
| **LLVM IR Types text** | **done** (2026-08-03) | `LlvmTypesText` / `slake_types.ll` / `just llvm-types-text`; Types SSOT; llvmUnlocked false; join `/tmp/grok-1000/grok-impl-summary-llvm-ir-types-text.md` |
| **LLVM IR Linear text** | **done** (2026-08-02) | `LlvmLinearText` / `slake_linear.ll` / `just llvm-linear-text`; Linear SSOT; llvmUnlocked false; join `/tmp/grok-1000/grok-impl-summary-llvm-ir-linear-text.md` |
| **LLVM IR Mult text** | **done** (2026-08-02) | `LlvmMultText` / `slake_mult.ll` / `just llvm-mult-text`; Mult grades SSOT; llvmUnlocked false; join `/tmp/grok-1000/grok-impl-summary-llvm-ir-mult-text.md` |
| **LLVM IR emit path** | **done** (2026-08-02) | Design + MEASURED-STUB + `LlvmEmitPath`; llvmUnlocked false; join `/tmp/grok-1000/grok-impl-summary-llvm-ir-emit-path.md` |
| **Host residual shrink** | **done** (2026-08-02) | Peer step 10 partial Mult-first peer Lake-free inventory; host residual remains; join `/tmp/grok-1000/grok-impl-summary-host-residual-shrink.md` |
| **PROVABLY evidence residual** | **done** (2026-08-02) | `provablyUnlocked` true; `just product-compcert-matrix` GREEN; lake proof; surface-matrix CompCert **PROVABLY**; join `/tmp/grok-1000/grok-impl-summary-provably-evidence.md` |
| **Product CompCert matrix** | **done** (2026-08-02) | `just product-compcert-matrix` GREEN; research `doc/dev/research/compcert-product-matrix-2026-08-02.md`; join `/tmp/grok-1000/grok-impl-summary-4e231152.md` |
| **Mult package under ccomp** | **done** (2026-08-02) | `just mult-package-under-ccomp` GREEN (~1760-byte object); MultSubsetEmit include SSOT; not PROVABLY; join `/tmp/grok-1000/grok-impl-summary-d378620f.md` |
| **Freestanding wire under ccomp** | **done** (2026-08-02) | `just freestanding-under-ccomp` GREEN (build + ccomp -c object); first-pass; not PROVABLY; join `/tmp/grok-1000/grok-impl-summary-d8e4f029.md` |
| **Resolved ccomp driver** | **done** (2026-08-02) | `doc/compcert-entry.md`; `just ccomp-smoke` GREEN (nixpkgs.compcert 3.17); not PROVABLY |
| **Expand host fragment set** | **done** (2026-08-02) | HostFront G3 Linear + HostGraph Mult+MultSubsetEmit+Linear; without-Lake green; join this slice |
| **CompCert product seal design** | **done** (2026-08-02) | plan `.agents/plans/plan-compcert-product-seal.md`; note `doc/dev/research/compcert-product-seal-design-2026-08-02.md` |
| **Same-job peer wall-clock** | **done** (2026-08-02) | `doc/dev/research/slake-vs-lake-same-job-mult-2026-08-02.md`; Job A host-package-write-without-lake median 0.025 s vs Job B mult-subset-emit 0.906 s; join `/tmp/grok-1000/grok-impl-summary-same-job-peer-wall-clock.md` |
| **Elaborator Mult package write** | **done** (2026-08-01) | `SystemsLean.HostPackageWrite` / just host-package-write + host-package-write-without-lake; HostFront G1 + HostGraph Mult set then Mult package write; hostPackageWriteFinishedClaimed true; join `/tmp/grok-1000/grok-impl-summary-elaborator-mult-package-write.md` |
| **Fragment module graph** | **done** (2026-08-01) | `SystemsLean.HostGraph` / just host-graph + host-graph-without-lake; Mult+MultSubsetEmit multi-file; hostGraphWithoutLakeFinished true; join `/tmp/grok-1000/grok-impl-summary-fragment-module-graph.md` |
| **Check without Lake** | **done** (2026-08-01) | just host-fragment-check-without-lake; Name A prebuilt; hostFragmentCheckWithoutLakeFinished true; join `/tmp/grok-1000/grok-impl-summary-check-without-lake.md` |
| **Host fragment check** | **done** (2026-08-01) | `SystemsLean.HostCheck` / just host-fragment-check; corpus G1/G2+B1-B4; hostFragmentCheckReady; join `/tmp/grok-1000/grok-impl-summary-host-fragment-check.md` |
| **Host fragment front-end** | **done** (2026-08-01) | `SystemsLean.HostFront` / just host-front; goldens G1/G2+B1-B4; join `/tmp/grok-1000/grok-impl-summary-host-fragment-front-end.md` |
| **Host term representation** | **done** (2026-08-01) | `SystemsLean.HostTerm` HOST-TERM-IR / hostTermReady; lake + systems-host + hygiene; join `/tmp/grok-1000/grok-impl-summary-host-term-representation.md` |
| **Peer elaborator design** | **done** (2026-08-01) | `doc/dev/research/peer-elaborator-design-2026-08-01.md` -- Mult-first list, green bars, steps 2-10 Names; join `/tmp/grok-1000/grok-impl-summary-peer-design-close.md` |
| **M6 product-path Lake pins flip** | **done** (2026-08-01) | Living tip StillUsesLake/DependsOnLake false with lake proof; join `/tmp/grok-1000/grok-impl-summary-m6-phase2-pin-flip.md` |
| **M6 Lake retire implement phase 1** | **done** (2026-08-01) | `LakeRetireInventory` / `just lake-retire-inventory`; StillUsesLake stayed true at phase 1; join `/tmp/grok-1000/grok-impl-summary-m6-phase1.md` |
| **M6 Lake retire design** | **done** (2026-08-01) | `doc/dev/research/m6-lake-retire-design-2026-08-01.md` -- inventory + honesty + phase 1/2/3 Names; no pin flips |
| **M5 without-Lake package join deepen** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- plan ideal M5 Name C; just subset-packages-rebuild-join-without-lake; subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed true |
| **M5 front-end Mult package path** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- plan ideal M5 Name B; FrontMultPackage / just front-mult-package; G1 accept then Mult package write |
| **M5 multi-unit package rebuild join** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- plan ideal M5 Name A; SubsetPackageJoin / just subset-packages-rebuild-join; dual evidence Mult..Compose |
| **M5 design** | **done** (2026-08-01) | `doc/dev/research/m5-compiler-packages-self-application-design-2026-08-01.md` -- inventory + honesty + Names A/B/C; cites M1/M3/M4 |
| **M4 official build without-Lake wire-up** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- plan ideal M4 Name C; just build without lake on hot path; StillUsesLake true until M6 |
| **M4 product-wire freestanding writer** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- plan ideal M4 Name B; Path A host-cc product-wire writer; productWireFsWriterFinished true |
| **M4 product-wire without-Lake prebuilt** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- plan ideal M4 Name A; just freestanding-capable-regenerate-without-lake; productWireWithoutLakeFinished true; product Lake remains |
| **M4 product-wire without-Lake design** | **done** | `doc/dev/research/m4-product-wire-without-lake-design-2026-08-01.md` |
| **M3 subset language front-end implement** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- SubsetFront + goldens G1/G2+B1-B3; just subset-front GREEN |
| **M3 subset language front-end design** | **done** (2026-08-01) | `RESIDUAL-systems.md` -- note `doc/dev/research/m3-subset-language-frontend-design-2026-08-01.md` |
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
| Freestanding product self-host | **done** (claim B complete true; stepContractFull true; ownership claimed true; perform claimed true; StillUsesFreestandingEmit false; Full true; lake proof required on complete recipe after RCA 2026-07-30) | `RESIDUAL-systems.md` -- claim B complete closed; claim A free **true** (host residual remains); product StillUsesLake/DependsOnLake **false** (M6 phase 2); PROVABLY **true** (2026-08-02); llvm **unlocked** (`llvmUnlocked` true; unlock residual 2026-08-03; not full backend / not Rust link; land-time "llvm false" superseded); bootstrap S0-S3 done; freestanding product path M0-M6 **done**; Peer elaborator steps 1-10 **done** (host residual partial shrink); CompCert seal **closed**; LLVM IR Mult..Graph + unit package expand + compose emit + optional llvm-as smoke + Rust-native layout design + Layout size/align fixture + ABI parity smoke **done** (Track 2a-2f + fixture + ABI); Layout IR tag dual-pin **done**; SelfApplyFs long-file split **done** (tip 1922->999; SelfApplyFsTheorems); Self-host map long-file split **done** (map 5525->901 + companions); living Open primary **Superset surface inventory** (north-star `plan-north-star-remaining.md`); free foundation Steps 0-3 done; prior plan `plan-residual-free-freestanding.md`; RCA `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md` |
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
| **Open (WATCHER)** | Long-file peer Host tips **done-for-now** (HostGraph **1116->939** + Theorems **230**; HostFront **999** + Theorems **190**; HostPackageWrite **784** + Theorems **299**; HostCheck **519**; join `/tmp/grok-1000/grok-impl-summary-hostgraph-long-file-split.md`); Track 3c free flip **held** (section-4 free bar not met; operator free-bar scope); Host residual free bar inventory **done** (join `/tmp/grok-1000/grok-impl-summary-host-residual-free-bar-inventory.md`); Peer Compose unit package expand **done** (Track 3b-9; join `/tmp/grok-1000/grok-impl-summary-peer-compose-package-3b9.md`); Peer Graph unit package expand **done** (Track 3b-8; join `/tmp/grok-1000/grok-impl-summary-peer-graph-package-3b8.md`); Peer Program unit package expand **done** (Track 3b-7; join `/tmp/grok-1000/grok-impl-summary-peer-program-package-3b7.md`); Peer Types unit package expand **done** (Track 3b-6; join `/tmp/grok-1000/grok-impl-summary-peer-types-package-3b6.md`); Host residual shrink inventory reseed **done** (Track 3b-N; join `/tmp/grok-1000/grok-impl-summary-host-shrink-reseed-3bn.md`); Peer unit package expand beyond Mult **done** (Track 3b-5; named unit Linear; join `/tmp/grok-1000/grok-impl-summary-c8e3b74b.md`); Host Compose fragment expand **done** (Track 3b-4); Host Graph fragment expand **done** (Track 3b-3); Host Program fragment expand **done** (Track 3b-2); Host Types fragment expand **done** (Track 3b-1); Host residual free design **done** (Track 3a); Types multi-node mixed kind program **done** (Track 4b continuous / 4b-cont3); EmitApply desync fail-closed deepen **done** (Track 4b); IrGraph edge capacity full reject **done** (Track 4b); HostCompose spent mult1 reject **done** (Track 4b); Proof complete inventory **done** (Track 4a); Matrix claim-row honesty **done**; Superset surface inventory **done**; Self-host map long-file split **done** (map 5525->901 + companions); SelfApplyFs long-file split **done** (tip 1922->999; SelfApplyFsTheorems); Layout IR tag dual-pin **done**; Mult-first layout ladder closed; Track 2a-2f **done** (`llvmUnlocked` **true**); Mult..Graph IR text + package join **done**; Host residual shrink **done** (partial); PROVABLY **claimed**; CompCert seal closed; peer elaborator steps 1-10 done; freestanding product path M0-M6 closed; M6 phase 2 StillUsesLake/DependsOnLake false; proofCompleteClaimed false | **open** (complete true; free true; PROVABLY true; product Lake pins false; host residual remains; llvm **true** unlocked with evidence, not full backend / not Rust link; proof complete false) |
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
| **held** | Track 3c host residual free flip | Section-4 free bar not met; operator free-bar scope | free bar inventory research; DualResidual remains true free false |
| **done-for-now** | Long-file peer Host tips | PackageWrite/Front/Graph under 1000 | join `/tmp/grok-1000/grok-impl-summary-hostgraph-long-file-split.md` |
| **done** | **HostGraph long-file split** | Tip **1116->939** via HostGraphTheorems **230** | join `/tmp/grok-1000/grok-impl-summary-hostgraph-long-file-split.md` |
| **done** | **HostFront long-file split** | Tip **1215->999** via HostFrontTheorems **190**; lake + without-lake GREEN; DualResidual unchanged | join `/tmp/grok-1000/grok-impl-summary-hostfront-long-file-split.md` |
| **done** | **Host residual free bar inventory** | Section-4 living gap after Mult..Compose package dual-ok; DualResidual not flipped | join `/tmp/grok-1000/grok-impl-summary-host-residual-free-bar-inventory.md` |
| **done** | **Peer Compose unit package expand** | Track 3b-9; Mult+Linear+Types+Program+Graph+Compose package dual-ok without-Lake; DualResidual not flipped | join `/tmp/grok-1000/grok-impl-summary-peer-compose-package-3b9.md` |
| **done** | **Peer Graph unit package expand** | Track 3b-8; Mult+Linear+Types+Program+Graph package dual-ok without-Lake; DualResidual not flipped | join `/tmp/grok-1000/grok-impl-summary-peer-graph-package-3b8.md` |
| **done** | **Host Graph fragment expand** | Track 3b-3; HostFront G6 + HostGraph Graph expand count 6; without-Lake green; DualResidual not flipped | join `/tmp/grok-1000/grok-impl-summary-ec338445.md` |
| **done** | **Host Program fragment expand** | Track 3b-2; HostFront G5 + HostGraph Program expand count 5; without-Lake green; DualResidual not flipped | join `/tmp/grok-1000/grok-impl-summary-6fe54900.md` |
| **done** | **Host Types fragment expand** | Track 3b-1; HostFront G4 + HostGraph Types expand; without-Lake green; DualResidual not flipped | join `/tmp/grok-1000/grok-impl-summary-143ef620.md` |
| **done** | **Host residual free design** | Track 3a; Lake host develop inventory + 3b queue; DualResidual not flipped | join `/tmp/grok-1000/grok-impl-summary-e4059bfe.md` |
| **done** | **Types multi-node mixed kind program** | Track 4b continuous / 4b-cont3; isWellTyped_mixed_kinds + foldWellTyped_mixed_kinds_some + isWellTyped_mixed_bad_false; lake IrProgramTheorems exit 0 | join `/tmp/grok-1000/grok-impl-summary-44784b63.md` |
| **done** | **EmitApply desync fail-closed deepen** | Track 4b continuous; applyIsValid_oversize_count_false + applyFromCompose_sound_inventory; lake EmitApply exit 0 | join `/tmp/grok-1000/grok-impl-summary-87a47993.md` |
| **done** | **IrGraph edge capacity full reject** | Track 4b; edgeMax full addEdge + oversize isWellTyped; lake IrGraphTheorems exit 0 | join `/tmp/grok-1000/grok-impl-summary-0833b7d7.md` |
| **done** | **HostCompose spent mult1 reject** | Track 4b; spent MULT-1 graph reject + scrub; lake HostComposeTheorems exit 0 | join `/tmp/grok-1000/grok-impl-summary-76b0ab44.md` |
| **done** | **Proof complete inventory** | Track 4a; research note + next 4b Name; complete stays false | join `/tmp/grok-1000/grok-impl-summary-542dd76c.md` |
| **done** | **Matrix claim-row honesty** | Track 1b; freestanding+llvm inventory measured; lake green | join `/tmp/grok-1000/grok-impl-summary-9ec150d0.md` |
| **done** | **Superset surface inventory** | Track 1a; research + surface-matrix reseed | join `/tmp/grok-1000/grok-impl-summary-67e88df0.md` |
| **done** | Self-host map long-file split | Map 5525->901; companions bootstrap/product-path/host-surface | join `/tmp/grok-1000/grok-impl-summary-66e1b03b.md` |
| **done** | SelfApplyFs long-file split | Tip 1922->999; SelfApplyFsTheorems theorem/smoke role seam | join `/tmp/grok-1000/grok-impl-summary-selfapplyfs-lfs.md` |
| **done** | Layout IR tag dual-pin | Mult IR tags vs fixture; pure Nix dual-pin; Mult-first ladder closed | join `/tmp/grok-1000/grok-impl-summary-4b236baf.md` |
| **done** | ABI parity smoke | `just abi-parity-smoke`; pure Nix abi-parity Mult fixture/header/IR | join `/tmp/grok-1000/grok-impl-summary-b1aa23ee.md` |
| **done** | Layout size/align fixture | Mult-first size/align table vs rustc_abi; not Rust link claim | join `/tmp/grok-1000/grok-impl-summary-509af6bb.md` |
| **done** | Rust-native layout design | Track 2f; research layout/ABI bar + residual Names; not Rust link claim | join `/tmp/grok-1000/grok-impl-summary-e4e35312.md` |
| **done** | Optional llvm-as smoke | Track 2e; `just llvm-as-smoke` skip-if-missing / RED when present | join `/tmp/grok-1000/grok-impl-summary-dc10524b.md` |
| **done** | LLVM IR compose emit | Track 2d; `LlvmComposeText` / `slake_compose.ll` / `just llvm-compose-text` | join `/tmp/grok-1000/grok-impl-summary-01c8c98d.md` |
| **done** | LLVM IR unit package expand | Track 2c; Mult..Graph `just llvm-unit-package` | join `/tmp/grok-1000/grok-impl-summary-94e29f6c.md` |
| **done** | LLVM IR unlock residual | Track 2b; `llvmUnlocked` true + lake blast-radius proof (2026-08-03) | join `/tmp/grok-1000/grok-impl-summary-40ecf6cb.md` |
| **done** | LLVM IR unlock design | Track 2a; research checklist; pin not flipped at design land | join `/tmp/grok-1000/grok-impl-summary-a67e230a.md` |
| **done** | LLVM IR Graph text | `LlvmGraphText` / `slake_graph.ll` / `just llvm-graph-text`; Graph SSOT; llvmUnlocked false | join `/tmp/grok-1000/grok-impl-summary-llvm-ir-graph-text.md` |
| **done** | LLVM IR Program text | `LlvmProgramText` / `slake_program.ll` / `just llvm-program-text`; Program SSOT; llvmUnlocked false | join `/tmp/grok-1000/grok-impl-summary-llvm-ir-program-text.md` |
| **done** | LLVM IR unit package join | `just llvm-unit-package` fail-closed mult+linear+types; llvmUnlocked false | join `/tmp/grok-1000/grok-impl-summary-llvm-ir-unit-package-join.md` |
| **done** | LLVM IR Types text | `LlvmTypesText` / `slake_types.ll` / `just llvm-types-text`; Types SSOT; llvmUnlocked false | join `/tmp/grok-1000/grok-impl-summary-llvm-ir-types-text.md` |
| **done** | LLVM IR Linear text | `LlvmLinearText` / `slake_linear.ll` / `just llvm-linear-text`; Linear SSOT; llvmUnlocked false | join `/tmp/grok-1000/grok-impl-summary-llvm-ir-linear-text.md` |
| **done** | LLVM IR Mult text | `LlvmMultText` / `slake_mult.ll` / `just llvm-mult-text`; Mult grades SSOT; llvmUnlocked false | join `/tmp/grok-1000/grok-impl-summary-llvm-ir-mult-text.md` |
| **done** | LLVM IR emit path | Design + MEASURED-STUB + LlvmEmitPath; llvmUnlocked false | join `/tmp/grok-1000/grok-impl-summary-llvm-ir-emit-path.md` |
| **done** | Host residual shrink | Peer step 10 partial Mult-first peer Lake-free; host residual remains | join `/tmp/grok-1000/grok-impl-summary-host-residual-shrink.md` |
| **done** | PROVABLY evidence residual | `provablyUnlocked` true; matrix + lake proof; surface-matrix CompCert PROVABLY (2026-08-02) | join `/tmp/grok-1000/grok-impl-summary-provably-evidence.md` |
| **done** | Product CompCert matrix | `just product-compcert-matrix` GREEN; research note; surface-matrix CompCert **measured**; not PROVABLY | join `/tmp/grok-1000/grok-impl-summary-4e231152.md` |
| **done** | Mult package under ccomp | `just mult-package-under-ccomp` GREEN (~1760-byte object); MultSubsetEmit include SSOT; not PROVABLY | join `/tmp/grok-1000/grok-impl-summary-d378620f.md` |
| **done** | Freestanding wire under ccomp | `just freestanding-under-ccomp` GREEN (build + ccomp -c object); first-pass; not PROVABLY | join `/tmp/grok-1000/grok-impl-summary-d8e4f029.md` |
| **done** | Resolved ccomp driver | Documented resolve + `just ccomp-smoke` GREEN (nixpkgs.compcert 3.17); not PROVABLY | `doc/compcert-entry.md`; join `/tmp/grok-1000/grok-impl-summary-3ca8a332.md` |
| **done** | Expand host fragment set | HostFront G3 Linear + HostGraph Mult+MultSubsetEmit+Linear; without-Lake green; package Mult+MultSubsetEmit subset preserved (same-job Mult numbers still apply) | join this slice (2026-08-02) |
| **done** | CompCert product seal design | Durable plan + research a-f; Open advances to Resolved ccomp; provablyUnlocked false | `.agents/plans/plan-compcert-product-seal.md`; `doc/dev/research/compcert-product-seal-design-2026-08-02.md` |
| **done** | Same-job peer wall-clock | Mult package Job A 0.025 s vs Job B mult-subset-emit 0.906 s; note slake-vs-lake-same-job-mult-2026-08-02; numbers still apply after Expand (package closure unchanged) | join `/tmp/grok-1000/grok-impl-summary-same-job-peer-wall-clock.md` |
| **done** | Elaborator Mult package write | HostPackageWrite / host-package-write-without-lake; HostFront G1 + HostGraph Mult set then Mult package write; hostPackageWriteFinishedClaimed true | join `/tmp/grok-1000/grok-impl-summary-elaborator-mult-package-write.md` |
| **done** | Fragment module graph | HostGraph / host-graph-without-lake; Mult+MultSubsetEmit multi-file; hostGraphWithoutLakeFinished true | join `/tmp/grok-1000/grok-impl-summary-fragment-module-graph.md` |
| **done** | Check without Lake | just host-fragment-check-without-lake; Name A prebuilt; hostFragmentCheckWithoutLakeFinished true | join `/tmp/grok-1000/grok-impl-summary-check-without-lake.md` |
| **done** | Host fragment check | `SystemsLean.HostCheck` / just host-fragment-check; corpus G1/G2+B1-B4; hostFragmentCheckReady | join `/tmp/grok-1000/grok-impl-summary-host-fragment-check.md` |
| **done** | Host fragment front-end | Parse Mult-first fragment sources into HostTerm IR; goldens accept/reject; just host-front; plan-peer-elaborator step 3 | join `/tmp/grok-1000/grok-impl-summary-host-fragment-front-end.md` |
| **done** | Host term representation | Closed Mult-first host term/command IR (`SystemsLean.HostTerm`); lake + systems-host + hygiene | join `/tmp/grok-1000/grok-impl-summary-host-term-representation.md` |
| **done** | Peer elaborator design | Mult-first list, green bars, steps 2-10 Names; research note | `doc/dev/research/peer-elaborator-design-2026-08-01.md`; join `/tmp/grok-1000/grok-impl-summary-peer-design-close.md` |
| **done** | M6 product-path Lake pins flip | Living tip StillUsesLake/DependsOnLake false with lake elaborator proof | join `/tmp/grok-1000/grok-impl-summary-m6-phase2-pin-flip.md` |
| **done** | M6 Lake retire implement phase 1 | Inventory gate `LakeRetireInventory` / `just lake-retire-inventory`; StillUsesLake stayed true at phase 1 | join `/tmp/grok-1000/grok-impl-summary-m6-phase1.md` |
| **done** | M6 Lake retire design | Inventory Lake vs Lake-free hot path; operational M6; honesty; phase 1/2/3 | `doc/dev/research/m6-lake-retire-design-2026-08-01.md` |
| **done** | M5 without-Lake package join deepen (M5 Name C) | just subset-packages-rebuild-join-without-lake; prebuilt Mult..Compose; multi-unit without-Lake pin true | `RESIDUAL-systems.md`; plan ideal M5 Name C done 2026-08-01 |
| **done** | M5 front-end Mult package path (M5 Name B) | FrontMultPackage / just front-mult-package; G1 accept then Mult package write | `RESIDUAL-systems.md`; plan ideal M5 Name B done 2026-08-01 |
| **done** | M5 multi-unit package rebuild join (M5 Name A) | SubsetPackageJoin / just subset-packages-rebuild-join; Mult..Compose dual evidence | `RESIDUAL-systems.md`; plan ideal M5 Name A done 2026-08-01 |
| **done** | M5 design | Inventory subset packages vs product wire; honesty; Names A/B/C | `doc/dev/research/m5-compiler-packages-self-application-design-2026-08-01.md` |
| **done** | M4 official build without-Lake wire-up (M4 Name C) | just build prefers Name B host-cc else Name A prebuilt; no lake hot path; StillUsesLake true | `RESIDUAL-systems.md`; plan ideal M4 Name C done 2026-08-01 |
| **done** | M4 product-wire freestanding writer (M4 Name B) | Path A host-cc product-wire writer; productWireFsWriterFinished true; just product-wire-freestanding-write | `RESIDUAL-systems.md`; plan ideal M4 Name B done 2026-08-01 |
| **done** | M4 product-wire without-Lake prebuilt (M4 Name A) | just freestanding-capable-regenerate-without-lake; prebuilt CapableRegenerate; productWireWithoutLakeFinished true; product Lake remains | `RESIDUAL-systems.md`; plan ideal M4 Name A done 2026-08-01 |
| **done** | M4 product-wire without-Lake design | Design note inventory + honesty + Names A/B/C | `doc/dev/research/m4-product-wire-without-lake-design-2026-08-01.md` |
| **done** | M3 subset language front-end implement | SubsetFront parse/check G1/G2+B1-B3; just subset-front GREEN | `RESIDUAL-systems.md`; plan ideal M3 implement done 2026-08-01 |
| **done** | M3 subset language front-end design | Research note + implement Done when draft | `doc/dev/research/m3-subset-language-frontend-design-2026-08-01.md`; plan ideal M3 design done 2026-08-01 |
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
| **4 (done)** | ccomp / CompCert (claim D) / PROVABLY | Green product matrix + `provablyUnlocked` true + lake proof (2026-08-02) | LlvmHold; product-compcert-matrix |
| **5 (done)** | llvm unlock | `llvmUnlocked` true + lake blast-radius proof (2026-08-03); not full backend / not Rust link | LlvmHold; join `/tmp/grok-1000/grok-impl-summary-40ecf6cb.md` |
| **done** | No-sorry host inventory | 0 sorry/admit; inventory no-sorry-host-inventory-2026-07-31 | `RESIDUAL-systems.md` |
| **done parallel** | HostSpecs cold splits (all named) | specs live **2689**; hostPin scanner splits later | `RESIDUAL-systems.md` |
| **done** | Short product-path module names | All ProductPathFreestanding* retired | campaign shortname-camp-0731 |
| **done** | Dual-pin b1-33 + tip split | series ~5755->3638 then split **3638->1888** | dualpin-camp + tip-split-camp |

**Highest value next:** long-file peer Host tips **done-for-now** (HostGraph **1116->939** + Theorems **230**; HostFront **999**; HostPackageWrite **784**; HostCheck **519**). Track 3c free flip **held** (section-4 free bar not met; needs operator free-bar scope decision). Host residual free bar inventory **done** (research `doc/dev/research/host-residual-free-bar-inventory-2026-08-03.md`; join `/tmp/grok-1000/grok-impl-summary-host-residual-free-bar-inventory.md`). Peer Compose unit package expand **done** (3b-9; Mult..Compose dual-ok). Peer Graph unit package expand **done** (3b-8). Peer Program unit package expand **done** (3b-7). Peer Types unit package expand **done** (3b-6). Host residual shrink inventory reseed **done** (3b-N).
Peer unit package expand beyond Mult **done** (Track 3b-5; Linear dual-ok).
Host Graph fragment expand **done** (Track 3b-3; join
`/tmp/grok-1000/grok-impl-summary-ec338445.md`; DualResidual pins **not** flipped).
Host Program fragment expand **done** (Track 3b-2; join
`/tmp/grok-1000/grok-impl-summary-6fe54900.md`). Host Types fragment expand **done**
(Track 3b-1; join `/tmp/grok-1000/grok-impl-summary-143ef620.md`). Host residual
free design **done** (Track 3a; research
`doc/dev/research/host-residual-free-design-2026-08-03.md`; join
`/tmp/grok-1000/grok-impl-summary-e4059bfe.md`). Types multi-node mixed kind
program **done** (Track 4b continuous / 4b-cont3; join
`/tmp/grok-1000/grok-impl-summary-44784b63.md`). EmitApply desync fail-closed deepen
**done** (Track 4b; join `/tmp/grok-1000/grok-impl-summary-87a47993.md`). IrGraph
edge capacity full reject **done** (Track 4b; join
`/tmp/grok-1000/grok-impl-summary-0833b7d7.md`). HostCompose spent mult1 reject
**done** (Track 4b; join `/tmp/grok-1000/grok-impl-summary-76b0ab44.md`). Proof
complete inventory **done** (Track 4a; research
`doc/dev/research/proof-complete-inventory-2026-08-03.md`; join
`/tmp/grok-1000/grok-impl-summary-542dd76c.md`). Matrix claim-row honesty
**done**. Superset surface inventory **done**. Self-host map long-file split
**done** (map **5525->901**; companions bootstrap/product-path/host-surface;
join `/tmp/grok-1000/grok-impl-summary-66e1b03b.md`). SelfApplyFs long-file
split **done** (tip 1922->999; SelfApplyFsTheorems; join
`/tmp/grok-1000/grok-impl-summary-selfapplyfs-lfs.md`). Layout IR tag dual-pin
**done** (`just layout-ir-dual-pin`; pure Nix layout-ir-dual-pin; Mult-first
ladder closed). ABI parity smoke **done** (`just abi-parity-smoke`; pure Nix
`nix/systems-llvm-ir/abi-parity.nix`; join
`/tmp/grok-1000/grok-impl-summary-b1aa23ee.md`). Layout size/align fixture
**done** (`doc/dev/research/layout-size-align-fixture-2026-08-03.md`; join
`/tmp/grok-1000/grok-impl-summary-509af6bb.md`). Rust-native layout design
**done** (`doc/dev/research/rust-native-layout-design-2026-08-03.md`; join
`/tmp/grok-1000/grok-impl-summary-e4e35312.md`). Optional llvm-as smoke
**done** (`just llvm-as-smoke`; pure Nix as-smoke honesty; join
`/tmp/grok-1000/grok-impl-summary-dc10524b.md`). LLVM IR compose emit **done**
(`LlvmComposeText` / `slake_compose.ll` / `just llvm-compose-text`).
Unit package expand **done** (`just llvm-unit-package` Mult..Graph). Unlock
residual **done** (`llvmUnlocked` true + lake). Unlock design **done**. Track 2
LLVM/Rust path design slice closed at 2f. Graph IR text **done**.
Program IR text **done**. Types / Linear / Mult IR text **done**. LLVM IR emit path
first residual **done**. Host residual shrink **done** (partial; host residual
remains). PROVABLY **claimed**. CompCert seal program **closed**. Peer elaborator
steps 1-10 **done**. Freestanding product path M0-M6 **closed**. Product
StillUsesLake/DependsOnLake **false**. Host elaborator residual **remains**.
Complete true; free **true**; PROVABLY **true**; llvm **true** (unlocked with
evidence; not full backend / not Rust link).

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
| LLVM IR Graph text | **done** (2026-08-03) | `LlvmGraphText` / `slake_graph.ll` / `just llvm-graph-text`; Graph SSOT; llvmUnlocked false |
| LLVM IR Program text | **done** (2026-08-03) | `LlvmProgramText` / `slake_program.ll` / `just llvm-program-text`; Program SSOT; llvmUnlocked false |
| LLVM IR unit package join | **done** (2026-08-03) | `just llvm-unit-package` fail-closed mult+linear+types; llvmUnlocked false |
| LLVM IR Types text | **done** (2026-08-03) | `LlvmTypesText` / `slake_types.ll` / `just llvm-types-text`; Types SSOT; llvmUnlocked false |
| LLVM IR Linear text | **done** (2026-08-02) | `LlvmLinearText` / `slake_linear.ll` / `just llvm-linear-text`; Linear SSOT; llvmUnlocked false |
| LLVM IR Mult text | **done** (2026-08-02) | `LlvmMultText` / `slake_mult.ll` / `just llvm-mult-text`; Mult grades SSOT; llvmUnlocked false |
| LLVM IR emit path | **done** (2026-08-02) | Design + MEASURED-STUB + LlvmEmitPath; llvmUnlocked false |
| LLVM IR unlock design | **done** (2026-08-03) | Research checklist; pin still false at design land; join `/tmp/grok-1000/grok-impl-summary-a67e230a.md` |
| LLVM IR unlock residual (`llvmUnlocked` true) | **done** (2026-08-03) | Pin true + lake blast-radius proof; join `/tmp/grok-1000/grok-impl-summary-40ecf6cb.md` |
| LLVM IR unit package expand | **done** (2026-08-03) | Mult..Graph `just llvm-unit-package`; join `/tmp/grok-1000/grok-impl-summary-94e29f6c.md` |
| LLVM IR compose emit | **done** (2026-08-03) | `LlvmComposeText` / `slake_compose.ll` / `just llvm-compose-text`; join `/tmp/grok-1000/grok-impl-summary-01c8c98d.md` |
| Optional llvm-as smoke | **done** (2026-08-03) | Track 2e; `just llvm-as-smoke` skip-if-missing / RED when present; pure Nix as-smoke honesty; join `/tmp/grok-1000/grok-impl-summary-dc10524b.md` |
| Rust-native layout design | **done** (2026-08-03) | Track 2f; research layout/ABI bar; join `/tmp/grok-1000/grok-impl-summary-e4e35312.md` |
| Layout size/align fixture | **done** (2026-08-03) | Mult-first size/align table; research `doc/dev/research/layout-size-align-fixture-2026-08-03.md`; join `/tmp/grok-1000/grok-impl-summary-509af6bb.md` |
| ABI parity smoke | **done** (2026-08-03) | `just abi-parity-smoke`; pure Nix abi-parity Mult fixture/header/IR; join `/tmp/grok-1000/grok-impl-summary-b1aa23ee.md` |
| Layout IR tag dual-pin | **done** (2026-08-03) | `just layout-ir-dual-pin`; pure Nix Mult dual-pin; Mult-first ladder closed; join `/tmp/grok-1000/grok-impl-summary-4b236baf.md` |
| CompCert product seal | **closed** (2026-08-02) | PROVABLY claimed (`provablyUnlocked` true; matrix + lake proof); llvm unlocked orthogonal |
| Host residual shrink | **done** (2026-08-02) | Partial Mult-first peer Lake-free; host residual remains; join `/tmp/grok-1000/grok-impl-summary-host-residual-shrink.md` |
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
