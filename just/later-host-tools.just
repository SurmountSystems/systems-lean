# Modular just: just/later-host-tools.just -- compile+link inventory host
# tools after mill 54 without Lake on the step (lean + leanc). Helper
# `_compile-inventory-exe` lives in just/first-host-tool.just. This module
# does not grow bash mills. Never lake on these recipes. Do not rewrite
# diagnostic llvm-linear-ssa / llvm-compose-ssa / host-package-write /
# llvm-types-ssa / host-import-graph / llvm-compose-text /
# llvm-program-ssa.
# Mills 55-66 pass LEAN_NUM_THREADS=16 on the helper. Do not just-export
# that at module scope: imports share a namespace with OccupancyProbe /
# lake recipes, which stay LEAN_NUM_THREADS=1.
# sixty-seventh uses --extras-file, not packed argv. sixty-eighth is packed
# 16 extras for MultFsWrite (FILE on the same just line as the helper).
# sixty-ninth is SelfHostComplete (0 extras; FILE on the same just line).
# Living mill metric is 69 of 69 after mill 69 ELF GREEN. Do not mill
# mill 69 again. Do not mill HostModuleCheck. Do not mill MultFsWrite.
# Occupancy stays 49 names.

# Fifty-fifth inventory ELF. Depends on fifty-fourth so one recipe yields 55 of 69.
# 7-import LlvmLinearSsa: mill 49 extras plus LlvmLinearText plus mill 51 body
# LlvmMultSsa. Do not pass LlvmTypesText / LlvmProgramText / LlvmGraphText.
fifty-fifth-host-tool: fifty-fourth-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-llvm-linear-ssa LlvmLinearSsa command-llvm-linear-ssa.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText LlvmMultSsa
    echo "fifty-fifth-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-linear-ssa"

# Fifty-sixth inventory ELF. Depends on fifty-fifth so one recipe yields 56 of 69.
# 7-import LlvmComposeSsa: mill 54 extras plus Graph-text body and SSA peers
# plus Compose Text. Do not put LlvmComposeSsa in extras.
fifty-sixth-host-tool: fifty-fifth-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-llvm-compose-ssa LlvmComposeSsa command-llvm-compose-ssa.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText LlvmTypesText LlvmProgramText LlvmGraphText LlvmMultSsa LlvmLinearSsa LlvmTypesSsa LlvmProgramSsa LlvmGraphSsa LlvmComposeText
    echo "fifty-sixth-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-compose-ssa"

# Fifty-seventh inventory ELF. Depends on fifty-sixth so one recipe yields 57 of 69.
# 8-import HostPackageWrite: HostFront/HostGraph plus six unit subset-emit
# closed tails. Not the mill 52-56 LLVM extras list.
fifty-seventh-host-tool: fifty-sixth-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-host-package-write HostPackageWrite command-host-package-write.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath HostTerm HostFrontGoldens HostFront HostGraph EmitMultScaffold EmitMult CompilePathMult FirstSurface MultSubsetEmit EmitLinearScaffold EmitLinear CompilePathLinear LinearSubsetEmit EmitTypesScaffold EmitTypes CompilePathTypes TypesSubsetEmit EmitProgramScaffold EmitProgram CompilePathProgram ProgramSubsetEmit EmitGraphScaffold EmitGraph CompilePathGraph GraphSubsetEmit EmitComposeScaffold EmitCompose CompilePathCompose ComposeSubsetEmit
    echo "fifty-seventh-host-tool: GREEN $PWD/build/first-host-tool/slake-host-package-write"

# Fifty-eighth inventory ELF. Depends on fifty-seventh so one recipe yields 58 of 69.
# 8-import LlvmTypesSsa: mill 55 extras plus mill 52 body LlvmTypesText plus mill 55
# body LlvmLinearSsa. Do not put LlvmTypesSsa in extras.
fifty-eighth-host-tool: fifty-seventh-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-llvm-types-ssa LlvmTypesSsa command-llvm-types-ssa.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText LlvmTypesText LlvmMultSsa LlvmLinearSsa
    echo "fifty-eighth-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-types-ssa"

# Fifty-ninth inventory ELF. Depends on fifty-eighth so one recipe yields 59 of 69.
# 9-import HostImportGraph: HostImportGraphSeeds, HostImportGraphModel,
# HostImportGraphMods, HostImportGraphModsLater, HostImportGraphLoadOk,
# HostImportGraphTheorems, HostImportGraphWalkLater, HostImportGraphWalk, and
# HostImportGraphDriver. LoadOkLater is LoadOk's extra (not a body import).
# Do not put HostImportGraph in extras.
fifty-ninth-host-tool: fifty-eighth-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-host-import-graph HostImportGraph command-host-import-graph.log HostImportGraphSeeds HostImportGraphModel HostImportGraphMods HostImportGraphModsLater HostImportGraphLoadOkLater HostImportGraphLoadOk HostImportGraphTheorems HostImportGraphWalkLater HostImportGraphWalk HostImportGraphDriver
    echo "fifty-ninth-host-tool: GREEN $PWD/build/first-host-tool/slake-host-import-graph"

# Sixtieth inventory ELF. Depends on fifty-ninth so one recipe yields 60 of 69.
# 10-import LlvmComposeText: mill 54 extras plus mill 54 body LlvmGraphText.
# Body imports HostCompose, IrProgram, IrGraph, LlvmHold, LlvmEmitPath,
# LlvmMultText, LlvmLinearText, LlvmTypesText, LlvmProgramText, and
# LlvmGraphText. Do not put LlvmComposeText in extras. Do not pass SSA
# modules. Do not rewrite lake-using just llvm-compose-text.
sixtieth-host-tool: fifty-ninth-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-llvm-compose-text LlvmComposeText command-llvm-compose-text.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText LlvmTypesText LlvmProgramText LlvmGraphText
    echo "sixtieth-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-compose-text"

# Sixty-first inventory ELF. Depends on sixtieth so one recipe yields 61 of 69.
# 10-import LlvmProgramSsa: mill 58 extras plus mill 53 body LlvmProgramText
# plus mill 58 body LlvmTypesSsa. mill 58 extras already include LlvmMultSsa
# and LlvmLinearSsa. Body imports Mult, Types, IrProgram, KernelProgram,
# LlvmHold, LlvmEmitPath, LlvmProgramText, LlvmTypesSsa, LlvmLinearSsa, and
# LlvmMultSsa. Do not put LlvmProgramSsa in extras. Do not pass GraphText,
# GraphSsa, or ComposeText. Do not rewrite lake-using just llvm-program-ssa.
sixty-first-host-tool: sixtieth-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-llvm-program-ssa LlvmProgramSsa command-llvm-program-ssa.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText LlvmTypesText LlvmProgramText LlvmMultSsa LlvmLinearSsa LlvmTypesSsa
    echo "sixty-first-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-program-ssa"

# Sixty-second inventory ELF. Depends on sixty-first so one recipe yields 62 of 69.
# 11-import LlvmGraphSsa: mill 61 extras plus mill 54 body LlvmGraphText plus mill 61
# body LlvmProgramSsa. mill 61 extras already include LlvmTypesSsa, LlvmLinearSsa,
# and LlvmMultSsa. Body imports Mult, Types, IrGraph, KernelProgram, LlvmHold,
# LlvmEmitPath, LlvmGraphText, LlvmProgramSsa, LlvmTypesSsa, LlvmLinearSsa, and
# LlvmMultSsa. Do not put LlvmGraphSsa in extras. mill 56 extras included GraphSsa
# because ComposeSsa imported it; mill 62 body is GraphSsa so extras are that
# closed chain without LlvmGraphSsa and without ComposeText. Do not rewrite
# lake-using just llvm-graph-ssa.
sixty-second-host-tool: sixty-first-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-llvm-graph-ssa LlvmGraphSsa command-llvm-graph-ssa.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText LlvmTypesText LlvmProgramText LlvmGraphText LlvmMultSsa LlvmLinearSsa LlvmTypesSsa LlvmProgramSsa
    echo "sixty-second-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-graph-ssa"

# Sixty-third inventory ELF. Depends on sixty-second so one recipe yields 63 of 69.
# 21-import CapableWriteHc: mill 44 extras without CapableWriteHc and without
# InstallOut. Body imports CapableWriteHcLoad, EmitBanner, EmitMult,
# EmitLinear, EmitErasure, EmitExtract, EmitExtractScaffold, EmitTypes,
# EmitTypesScaffold, EmitProgram, EmitProgramScaffold, EmitGraph,
# EmitGraphScaffold, EmitCompose, EmitComposeScaffold, EmitPlan,
# EmitPlanScaffold, EmitApply, EmitApplyScaffold, EmitBody, and
# EmitBodyScaffold. Do not put CapableWriteHc in extras. Do not rewrite
# lake-using just freestanding-capable-write-hc.
sixty-third-host-tool: sixty-second-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-freestanding-capable-write-hc CapableWriteHc command-capable-write-hc.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitBannerScaffold EmitBanner EmitMultScaffold EmitMult EmitLinearScaffold EmitLinear EmitErasureScaffold EmitErasure EmitExtractScaffold EmitExtract EmitTypesScaffold EmitTypes EmitProgramScaffold EmitProgram EmitGraphScaffold EmitGraph EmitComposeScaffold EmitCompose EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody CapableWriteHcLoad
    echo "sixty-third-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-capable-write-hc"

# Sixty-fourth inventory ELF. Depends on sixty-third so one recipe yields 64 of 69.
# 22-import FreestandingEmit; mill 63 extras without CapableWriteHcLoad plus
# FreestandingEmitLoad plus FreestandingEmitLoadScaffold. Do not put
# FreestandingEmit in extras. Do not rewrite lake-using emit recipes.
sixty-fourth-host-tool: sixty-third-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-emit-freestanding-c FreestandingEmit command-emit-freestanding-c.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitBannerScaffold EmitBanner EmitMultScaffold EmitMult EmitLinearScaffold EmitLinear EmitErasureScaffold EmitErasure EmitExtractScaffold EmitExtract EmitTypesScaffold EmitTypes EmitProgramScaffold EmitProgram EmitGraphScaffold EmitGraph EmitComposeScaffold EmitCompose EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody FreestandingEmitLoad FreestandingEmitLoadScaffold
    echo "sixty-fourth-host-tool: GREEN $PWD/build/first-host-tool/slake-emit-freestanding-c"

# Sixty-fifth inventory ELF. Depends on sixty-fourth so one recipe yields 65 of 69.
# 21-import DualEqWriteApi: mill 64 extras without FreestandingEmitLoad and
# FreestandingEmitLoadScaffold plus DualEqWriteLoad. Do not put DualEqWriteApi
# in extras. Do not import FreestandingEmit. Do not rewrite lake-using
# dual-eq write-api recipes. ProductPathWriteHc stays a leftover skip.
sixty-fifth-host-tool: sixty-fourth-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-freestanding-perform-dual-equality-write-api DualEqWriteApi command-perform-dual-equality-write-api.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitBannerScaffold EmitBanner EmitMultScaffold EmitMult EmitLinearScaffold EmitLinear EmitErasureScaffold EmitErasure EmitExtractScaffold EmitExtract EmitTypesScaffold EmitTypes EmitProgramScaffold EmitProgram EmitGraphScaffold EmitGraph EmitComposeScaffold EmitCompose EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody DualEqWriteLoad
    echo "sixty-fifth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-perform-dual-equality-write-api"

# Sixty-sixth inventory ELF. Depends on sixty-fifth so one recipe yields 66 of 69.
# 1-import ProductPathWriteHc: mill 64 extras plus FreestandingEmit. Do not put
# ProductPathWriteHc in extras. Do not rewrite lake-using write-freestanding-hc.
sixty-sixth-host-tool: sixty-fifth-host-tool
    export LEAN_NUM_THREADS=16
    just _compile-inventory-exe slake-write-freestanding-hc ProductPathWriteHc command-write-freestanding-hc.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitBannerScaffold EmitBanner EmitMultScaffold EmitMult EmitLinearScaffold EmitLinear EmitErasureScaffold EmitErasure EmitExtractScaffold EmitExtract EmitTypesScaffold EmitTypes EmitProgramScaffold EmitProgram EmitGraphScaffold EmitGraph EmitComposeScaffold EmitCompose EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody FreestandingEmitLoad FreestandingEmitLoadScaffold FreestandingEmit
    echo "sixty-sixth-host-tool: GREEN $PWD/build/first-host-tool/slake-write-freestanding-hc"

# Sixty-seventh inventory compile. Uses extras-file, not 130 argv tokens.
# HostModuleCheck ELF is GREEN (11069328 bytes). Mill 67 fire missed
# file(1) on PATH (recipe EXIT 1). Sibling PATH prepend now lives here.
# Occupancy stays 49 names. Living mill metric is 69 of 69.
sixty-seventh-host-tool:
    export LEAN_NUM_THREADS=16
    export FILE="${FILE:-/nix/store/36cxvi2s369aw85pp7fyzq2dqv459d7c-file-5.48/bin/file}"
    export PATH="$(dirname "$FILE"):${PATH}"
    just _compile-inventory-exe slake-host-module-check HostModuleCheck command-host-module-check.log --extras-file src/systems/mill-extras-host-module-check.txt
    echo "sixty-seventh-host-tool: GREEN $PWD/build/first-host-tool/slake-host-module-check"

# Sixty-eighth inventory compile. Packed 16 extras (not extras-file).
# Body MultFsWrite imports MultFsDeepen. Do not put MultFsWrite in extras.
# HostModuleCheck is mill 67 ELF GREEN; do not re-run sixty-seventh-host-tool.
# Occupancy stays 49 names. Living mill metric is 69 of 69 after mill 69 ELF GREEN.
sixty-eighth-host-tool:
    LEAN_NUM_THREADS=16 FILE="/nix/store/36cxvi2s369aw85pp7fyzq2dqv459d7c-file-5.48/bin/file" PATH="/nix/store/36cxvi2s369aw85pp7fyzq2dqv459d7c-file-5.48/bin:${PATH}" just _compile-inventory-exe slake-mult-fs-write MultFsWrite command-mult-fs-write.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitMultScaffold EmitMult CompilePath CompilePathMult FirstSurface MultSubsetEmit MultSubsetRebuild MultFsWriteTool MultFsDeepen
    echo "sixty-eighth-host-tool: GREEN $PWD/build/first-host-tool/slake-mult-fs-write"

# Sixty-ninth inventory compile. Zero extras (0-import body SelfHostComplete).
# Main is SystemsLean.SelfHostCompleteMain. Do not put SelfHostComplete or
# SelfHostCompleteMain in extras. Do not depend on sixty-eighth-host-tool or
# sixty-seventh-host-tool (those rows are built; re-milling them is forbidden).
# FILE lives on the same just line as the helper (mill 67 PATH miss).
# Occupancy stays 49 names. Living mill metric is 69 of 69 after mill 69 ELF GREEN.
# Do not mill mill 69 again.
sixty-ninth-host-tool:
    LEAN_NUM_THREADS=16 FILE="/nix/store/36cxvi2s369aw85pp7fyzq2dqv459d7c-file-5.48/bin/file" PATH="/nix/store/36cxvi2s369aw85pp7fyzq2dqv459d7c-file-5.48/bin:${PATH}" just _compile-inventory-exe slake-freestanding-self-host-complete SelfHostComplete command-self-host-complete.log
    echo "sixty-ninth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-self-host-complete"
