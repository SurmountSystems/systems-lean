import Lake
open Lake DSL

/-
SystemsLean host Lake package (SPDX: Unlicense -- see monorepo LICENSES.md).
Offline: lake-manifest.json packages []. No mathlib / no remote deps.
Host elaborator package only: classic Lean/Lake bootstrap for Systems Lean
sources under this tree. Not product freestanding C (that wire is emit /
out/freestanding-c, generated; product residual free and self-host complete
are true on that wire -- separate from this package's elaborator role).
Config: lakefile.lean (lakefile.toml retired).
SKELETON honesty marker (unit walk; host elaborator package).

lean_exe inventory. All thin mains: supportInterpreter := true.
Table-driven registration below: one uniform lean_exe block per row.
ASCII string names (hyphenated); no guillemet identifiers.
  slake-emit-freestanding-c -> SystemsLean.FreestandingEmitMain
  slake-read-product-ssot -> SystemsLean.ProductPathReadSsotMain
  slake-compose-product-plan -> SystemsLean.ProductPathComposePlanMain
  slake-write-freestanding-hc -> SystemsLean.ProductPathWriteHcMain
  slake-freestanding-capable-gap -> SystemsLean.CapableMain
  slake-freestanding-capable-step-contract -> SystemsLean.CapableStepContractMain
  slake-freestanding-capable-read -> SystemsLean.CapableReadMain
  slake-freestanding-capable-compose -> SystemsLean.CapableComposeMain
  slake-freestanding-capable-write-hc -> SystemsLean.CapableWriteHcMain
  slake-freestanding-capable-regenerate -> SystemsLean.CapableRegenerateMain
  slake-freestanding-capable-install-out -> SystemsLean.InstallOutMain
  slake-freestanding-capable-full-bar -> SystemsLean.CapableFullBarMain
  slake-ownership-regenerate -> SystemsLean.ProductPathOwnershipRegenerateMain
  slake-freestanding-perform-evidence -> SystemsLean.PerformEvidenceMain
  slake-freestanding-perform-official-path -> SystemsLean.OfficialPathMain
  slake-freestanding-perform-official-path-alternate -> SystemsLean.OfficialPathAlternateMain
  slake-freestanding-perform-dual-equality-write-parity -> SystemsLean.DualEqWriteParityMain
  slake-freestanding-perform-dual-equality-write-close-path -> SystemsLean.DualEqWriteClosePathMain
  slake-freestanding-perform-dual-equality-write-api -> SystemsLean.DualEqWriteApiMain
  slake-freestanding-perform-dual-equality-write-capable-gap -> SystemsLean.DualEqWriteCapableGapMain
  slake-freestanding-retire-official -> SystemsLean.OfficialRetireMain
  slake-freestanding-perform-claimed -> SystemsLean.PerformClaimedMain
  slake-freestanding-ownership-claimed -> SystemsLean.OwnershipClaimedMain
  slake-freestanding-step-contract-full -> SystemsLean.StepContractFullMain
  slake-freestanding-self-host-complete -> SystemsLean.SelfHostComplete
  slake-first-surface -> SystemsLean.FirstSurfaceMain
  slake-mult-subset-emit -> SystemsLean.MultSubsetEmitMain
  slake-mult-subset-rebuild -> SystemsLean.MultSubsetRebuildMain
  slake-mult-fs-write -> SystemsLean.MultFsWriteMain
  slake-mult-fs-write-tool -> SystemsLean.MultFsWriteToolMain
  slake-product-wire-fs-write-tool -> SystemsLean.ProductWireWriteToolMain
  slake-linear-subset-emit -> SystemsLean.LinearSubsetEmitMain
  slake-linear-subset-rebuild -> SystemsLean.LinearSubsetRebuildMain
  slake-types-subset-emit -> SystemsLean.TypesSubsetEmitMain
  slake-types-subset-rebuild -> SystemsLean.TypesSubsetRebuildMain
  slake-program-subset-emit -> SystemsLean.ProgramSubsetEmitMain
  slake-program-subset-rebuild -> SystemsLean.ProgramSubsetRebuildMain
  slake-extract-subset-emit -> SystemsLean.ExtractSubsetEmitMain
  slake-extract-subset-rebuild -> SystemsLean.ExtractSubsetRebuildMain
  slake-erasure-subset-emit -> SystemsLean.ErasureSubsetEmitMain
  slake-erasure-subset-rebuild -> SystemsLean.ErasureSubsetRebuildMain
  slake-graph-subset-emit -> SystemsLean.GraphSubsetEmitMain
  slake-graph-subset-rebuild -> SystemsLean.GraphSubsetRebuildMain
  slake-compose-subset-emit -> SystemsLean.ComposeSubsetEmitMain
  slake-compose-subset-rebuild -> SystemsLean.ComposeSubsetRebuildMain
  slake-subset-front -> SystemsLean.SubsetFrontMain
  slake-front-mult-package -> SystemsLean.FrontMultPackageMain
  slake-host-front -> SystemsLean.HostFrontMain
  slake-host-fragment-check -> SystemsLean.HostCheckMain
  slake-host-graph -> SystemsLean.HostGraphMain
  slake-host-package-write -> SystemsLean.HostPackageWriteMain
  slake-host-package-roots -> SystemsLean.HostPackageRootsMain
  slake-host-import-graph -> SystemsLean.HostImportGraphMain
  slake-host-module-check -> SystemsLean.HostModuleCheckMain
  slake-llvm-mult-text -> SystemsLean.LlvmMultTextMain
  slake-llvm-linear-text -> SystemsLean.LlvmLinearTextMain
  slake-llvm-types-text -> SystemsLean.LlvmTypesTextMain
  slake-llvm-program-text -> SystemsLean.LlvmProgramTextMain
  slake-llvm-graph-text -> SystemsLean.LlvmGraphTextMain
  slake-llvm-compose-text -> SystemsLean.LlvmComposeTextMain
  slake-llvm-mult-ssa -> SystemsLean.LlvmMultSsaMain
  slake-llvm-linear-ssa -> SystemsLean.LlvmLinearSsaMain
  slake-llvm-types-ssa -> SystemsLean.LlvmTypesSsaMain
  slake-llvm-program-ssa -> SystemsLean.LlvmProgramSsaMain
  slake-llvm-graph-ssa -> SystemsLean.LlvmGraphSsaMain
  slake-llvm-compose-ssa -> SystemsLean.LlvmComposeSsaMain
  slake-runtime-bench-lean -> SystemsLean.RuntimeBenchLeanMain
  slake-runtime-bench-stack-twin -> SystemsLean.RuntimeBenchStackTwinMain
  slake-runtime-bench-fail-closed-shape -> SystemsLean.RuntimeBenchFailClosedShapeMain
-/

package SystemsLean where
  version := v!"0.1.0"
  -- SPDX id for novel work; monorepo SSoT: LICENSES.md / UNLICENSE.md
  license := "Unlicense"

@[default_target]
lean_lib SystemsLean

-- Thin host mains (table-driven: name / root / supportInterpreter).
lean_exe "slake-emit-freestanding-c" where
  root := `SystemsLean.FreestandingEmitMain
  supportInterpreter := true

lean_exe "slake-read-product-ssot" where
  root := `SystemsLean.ProductPathReadSsotMain
  supportInterpreter := true

lean_exe "slake-compose-product-plan" where
  root := `SystemsLean.ProductPathComposePlanMain
  supportInterpreter := true

lean_exe "slake-write-freestanding-hc" where
  root := `SystemsLean.ProductPathWriteHcMain
  supportInterpreter := true

lean_exe "slake-freestanding-capable-gap" where
  root := `SystemsLean.CapableMain
  supportInterpreter := true

lean_exe "slake-freestanding-capable-step-contract" where
  root := `SystemsLean.CapableStepContractMain
  supportInterpreter := true

lean_exe "slake-freestanding-capable-read" where
  root := `SystemsLean.CapableReadMain
  supportInterpreter := true

lean_exe "slake-freestanding-capable-compose" where
  root := `SystemsLean.CapableComposeMain
  supportInterpreter := true

lean_exe "slake-freestanding-capable-write-hc" where
  root := `SystemsLean.CapableWriteHcMain
  supportInterpreter := true

lean_exe "slake-freestanding-capable-regenerate" where
  root := `SystemsLean.CapableRegenerateMain
  supportInterpreter := true

lean_exe "slake-freestanding-capable-install-out" where
  root := `SystemsLean.InstallOutMain
  supportInterpreter := true

lean_exe "slake-freestanding-capable-full-bar" where
  root := `SystemsLean.CapableFullBarMain
  supportInterpreter := true

lean_exe "slake-ownership-regenerate" where
  root := `SystemsLean.ProductPathOwnershipRegenerateMain
  supportInterpreter := true

lean_exe "slake-freestanding-perform-evidence" where
  root := `SystemsLean.PerformEvidenceMain
  supportInterpreter := true

lean_exe "slake-freestanding-perform-official-path" where
  root := `SystemsLean.OfficialPathMain
  supportInterpreter := true

lean_exe "slake-freestanding-perform-official-path-alternate" where
  root := `SystemsLean.OfficialPathAlternateMain
  supportInterpreter := true

lean_exe "slake-freestanding-perform-dual-equality-write-parity" where
  root := `SystemsLean.DualEqWriteParityMain
  supportInterpreter := true

lean_exe "slake-freestanding-perform-dual-equality-write-close-path" where
  root := `SystemsLean.DualEqWriteClosePathMain
  supportInterpreter := true

lean_exe "slake-freestanding-perform-dual-equality-write-api" where
  root := `SystemsLean.DualEqWriteApiMain
  supportInterpreter := true

lean_exe "slake-freestanding-perform-dual-equality-write-capable-gap" where
  root := `SystemsLean.DualEqWriteCapableGapMain
  supportInterpreter := true

lean_exe "slake-freestanding-retire-official" where
  root := `SystemsLean.OfficialRetireMain
  supportInterpreter := true

lean_exe "slake-freestanding-perform-claimed" where
  root := `SystemsLean.PerformClaimedMain
  supportInterpreter := true

lean_exe "slake-freestanding-ownership-claimed" where
  root := `SystemsLean.OwnershipClaimedMain
  supportInterpreter := true

lean_exe "slake-freestanding-step-contract-full" where
  root := `SystemsLean.StepContractFullMain
  supportInterpreter := true

lean_exe "slake-freestanding-self-host-complete" where
  root := `SystemsLean.SelfHostComplete
  supportInterpreter := true

lean_exe "slake-first-surface" where
  root := `SystemsLean.FirstSurfaceMain
  supportInterpreter := true

lean_exe "slake-mult-subset-emit" where
  root := `SystemsLean.MultSubsetEmitMain
  supportInterpreter := true

lean_exe "slake-mult-subset-rebuild" where
  root := `SystemsLean.MultSubsetRebuildMain
  supportInterpreter := true

lean_exe "slake-mult-fs-write" where
  root := `SystemsLean.MultFsWriteMain
  supportInterpreter := true

lean_exe "slake-mult-fs-write-tool" where
  root := `SystemsLean.MultFsWriteToolMain
  supportInterpreter := true

lean_exe "slake-product-wire-fs-write-tool" where
  root := `SystemsLean.ProductWireWriteToolMain
  supportInterpreter := true

lean_exe "slake-linear-subset-emit" where
  root := `SystemsLean.LinearSubsetEmitMain
  supportInterpreter := true

lean_exe "slake-linear-subset-rebuild" where
  root := `SystemsLean.LinearSubsetRebuildMain
  supportInterpreter := true

lean_exe "slake-types-subset-emit" where
  root := `SystemsLean.TypesSubsetEmitMain
  supportInterpreter := true

lean_exe "slake-types-subset-rebuild" where
  root := `SystemsLean.TypesSubsetRebuildMain
  supportInterpreter := true

lean_exe "slake-program-subset-emit" where
  root := `SystemsLean.ProgramSubsetEmitMain
  supportInterpreter := true

lean_exe "slake-program-subset-rebuild" where
  root := `SystemsLean.ProgramSubsetRebuildMain
  supportInterpreter := true

lean_exe "slake-extract-subset-emit" where
  root := `SystemsLean.ExtractSubsetEmitMain
  supportInterpreter := true

lean_exe "slake-extract-subset-rebuild" where
  root := `SystemsLean.ExtractSubsetRebuildMain
  supportInterpreter := true

lean_exe "slake-erasure-subset-emit" where
  root := `SystemsLean.ErasureSubsetEmitMain
  supportInterpreter := true

lean_exe "slake-erasure-subset-rebuild" where
  root := `SystemsLean.ErasureSubsetRebuildMain
  supportInterpreter := true

lean_exe "slake-graph-subset-emit" where
  root := `SystemsLean.GraphSubsetEmitMain
  supportInterpreter := true

lean_exe "slake-graph-subset-rebuild" where
  root := `SystemsLean.GraphSubsetRebuildMain
  supportInterpreter := true

lean_exe "slake-compose-subset-emit" where
  root := `SystemsLean.ComposeSubsetEmitMain
  supportInterpreter := true

lean_exe "slake-compose-subset-rebuild" where
  root := `SystemsLean.ComposeSubsetRebuildMain
  supportInterpreter := true

lean_exe "slake-subset-front" where
  root := `SystemsLean.SubsetFrontMain
  supportInterpreter := true

lean_exe "slake-front-mult-package" where
  root := `SystemsLean.FrontMultPackageMain
  supportInterpreter := true

lean_exe "slake-host-front" where
  root := `SystemsLean.HostFrontMain
  supportInterpreter := true

lean_exe "slake-host-fragment-check" where
  root := `SystemsLean.HostCheckMain
  supportInterpreter := true

lean_exe "slake-host-graph" where
  root := `SystemsLean.HostGraphMain
  supportInterpreter := true

lean_exe "slake-host-package-write" where
  root := `SystemsLean.HostPackageWriteMain
  supportInterpreter := true

lean_exe "slake-host-package-roots" where
  root := `SystemsLean.HostPackageRootsMain
  supportInterpreter := true

lean_exe "slake-host-import-graph" where
  root := `SystemsLean.HostImportGraphMain
  supportInterpreter := true

lean_exe "slake-host-module-check" where
  root := `SystemsLean.HostModuleCheckMain
  supportInterpreter := true

lean_exe "slake-llvm-mult-text" where
  root := `SystemsLean.LlvmMultTextMain
  supportInterpreter := true

lean_exe "slake-llvm-linear-text" where
  root := `SystemsLean.LlvmLinearTextMain
  supportInterpreter := true

lean_exe "slake-llvm-types-text" where
  root := `SystemsLean.LlvmTypesTextMain
  supportInterpreter := true

lean_exe "slake-llvm-program-text" where
  root := `SystemsLean.LlvmProgramTextMain
  supportInterpreter := true

lean_exe "slake-llvm-graph-text" where
  root := `SystemsLean.LlvmGraphTextMain
  supportInterpreter := true

lean_exe "slake-llvm-compose-text" where
  root := `SystemsLean.LlvmComposeTextMain
  supportInterpreter := true

lean_exe "slake-llvm-mult-ssa" where
  root := `SystemsLean.LlvmMultSsaMain
  supportInterpreter := true

lean_exe "slake-llvm-linear-ssa" where
  root := `SystemsLean.LlvmLinearSsaMain
  supportInterpreter := true

lean_exe "slake-llvm-types-ssa" where
  root := `SystemsLean.LlvmTypesSsaMain
  supportInterpreter := true

lean_exe "slake-llvm-program-ssa" where
  root := `SystemsLean.LlvmProgramSsaMain
  supportInterpreter := true

lean_exe "slake-llvm-graph-ssa" where
  root := `SystemsLean.LlvmGraphSsaMain
  supportInterpreter := true

lean_exe "slake-llvm-compose-ssa" where
  root := `SystemsLean.LlvmComposeSsaMain
  supportInterpreter := true

lean_exe "slake-runtime-bench-lean" where
  root := `SystemsLean.RuntimeBenchLeanMain
  supportInterpreter := true

lean_exe "slake-runtime-bench-stack-twin" where
  root := `SystemsLean.RuntimeBenchStackTwinMain
  supportInterpreter := true

lean_exe "slake-runtime-bench-fail-closed-shape" where
  root := `SystemsLean.RuntimeBenchFailClosedShapeMain
  supportInterpreter := true
