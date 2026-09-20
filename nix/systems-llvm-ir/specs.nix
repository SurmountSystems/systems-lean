# SPDX-License-Identifier: Unlicense
# Thin join of systems-llvm-ir data slices (hold, emit-path, unit-text,
# unit-package, compose-text, as-smoke, abi-parity, layout-ir-dual-pin,
# ir-node-layout, trait-object-vtable).
# Imported by ./default.nix. Keep each slice small; do not grow kitchen-sink
# tables here.
let
  hold = import ./hold.nix;
  emitPath = import ./emit-path.nix;
  unitText = import ./unit-text.nix;
  unitPackage = import ./unit-package.nix;
  composeText = import ./compose-text.nix;
  composeSsa = import ./compose-ssa.nix;
  multSsa = import ./mult-ssa.nix;
  linearSsa = import ./linear-ssa.nix;
  typesSsa = import ./types-ssa.nix;
  programSsa = import ./program-ssa.nix;
  graphSsa = import ./graph-ssa.nix;
  cfgFixture = import ./cfg-fixture.nix;
  cfgProductionDeepen = import ./cfg-production-deepen.nix;
  cfgMultDominanceFrontierPartial = import ./cfg-mult-dominance-frontier-partial.nix;
  cfgMultDominanceFrontierDeepen = import ./cfg-mult-dominance-frontier-deepen.nix;
  cfgMultiUnitDominanceFrontierDeepen = import ./cfg-multi-unit-dominance-frontier-deepen.nix;
  cfgLinearProductionDeepen = import ./cfg-linear-production-deepen.nix;
  cfgTypesProductionDeepen = import ./cfg-types-production-deepen.nix;
  cfgProgramProductionDeepen = import ./cfg-program-production-deepen.nix;
  cfgGraphProductionDeepen = import ./cfg-graph-production-deepen.nix;
  cfgGeneralProgramPartial = import ./cfg-general-program-partial.nix;
  cfgIterativeCfgPartial = import ./cfg-iterative-cfg-partial.nix;
  asSmoke = import ./as-smoke.nix;
  abiParity = import ./abi-parity.nix;
  layoutIrDualPin = import ./layout-ir-dual-pin.nix;
  multLayoutConsumer = import ./mult-layout-consumer.nix;
  multLinkReadiness = import ./mult-link-readiness.nix;
  multLayoutIrSuccess = import ./mult-layout-ir-success.nix;
  multForeignLinkSuccess = import ./mult-foreign-link-success.nix;
  linearForeignLinkSuccess = import ./linear-foreign-link-success.nix;
  typesForeignLinkSuccess = import ./types-foreign-link-success.nix;
  programForeignLinkSuccess = import ./program-foreign-link-success.nix;
  graphForeignLinkSuccess = import ./graph-foreign-link-success.nix;
  rustIrInteropPartial = import ./rust-ir-interop-partial.nix;
  rustIrInteropFull = import ./rust-ir-interop-full.nix;
  irNodeLayout = import ./ir-node-layout.nix;
  traitObjectVtable = import ./trait-object-vtable.nix;
in
{
  requiredFiles =
    hold.requiredFiles
    ++ emitPath.requiredFiles
    ++ unitText.requiredFiles
    ++ unitPackage.requiredFiles
    ++ composeText.requiredFiles
    ++ composeSsa.requiredFiles
    ++ multSsa.requiredFiles
    ++ linearSsa.requiredFiles
    ++ typesSsa.requiredFiles
    ++ programSsa.requiredFiles
    ++ graphSsa.requiredFiles
    ++ cfgFixture.requiredFiles
    ++ cfgProductionDeepen.requiredFiles
    ++ cfgMultDominanceFrontierPartial.requiredFiles
    ++ cfgMultDominanceFrontierDeepen.requiredFiles
    ++ cfgMultiUnitDominanceFrontierDeepen.requiredFiles
    ++ cfgLinearProductionDeepen.requiredFiles
    ++ cfgTypesProductionDeepen.requiredFiles
    ++ cfgProgramProductionDeepen.requiredFiles
    ++ cfgGraphProductionDeepen.requiredFiles
    ++ cfgGeneralProgramPartial.requiredFiles
    ++ cfgIterativeCfgPartial.requiredFiles
    ++ asSmoke.requiredFiles
    ++ abiParity.requiredFiles
    ++ layoutIrDualPin.requiredFiles
    ++ multLayoutConsumer.requiredFiles
    ++ multLinkReadiness.requiredFiles
    ++ multLayoutIrSuccess.requiredFiles
    ++ multForeignLinkSuccess.requiredFiles
    ++ linearForeignLinkSuccess.requiredFiles
    ++ typesForeignLinkSuccess.requiredFiles
    ++ programForeignLinkSuccess.requiredFiles
    ++ graphForeignLinkSuccess.requiredFiles
    ++ rustIrInteropPartial.requiredFiles
    ++ rustIrInteropFull.requiredFiles
    ++ irNodeLayout.requiredFiles
    ++ traitObjectVtable.requiredFiles;

  contentSpecs =
    hold.contentSpecs
    ++ emitPath.contentSpecs
    ++ unitText.contentSpecs
    ++ unitPackage.contentSpecs
    ++ composeText.contentSpecs
    ++ composeSsa.contentSpecs
    ++ multSsa.contentSpecs
    ++ linearSsa.contentSpecs
    ++ typesSsa.contentSpecs
    ++ programSsa.contentSpecs
    ++ graphSsa.contentSpecs
    ++ cfgFixture.contentSpecs
    ++ cfgProductionDeepen.contentSpecs
    ++ cfgMultDominanceFrontierPartial.contentSpecs
    ++ cfgMultDominanceFrontierDeepen.contentSpecs
    ++ cfgMultiUnitDominanceFrontierDeepen.contentSpecs
    ++ cfgLinearProductionDeepen.contentSpecs
    ++ cfgTypesProductionDeepen.contentSpecs
    ++ cfgProgramProductionDeepen.contentSpecs
    ++ cfgGraphProductionDeepen.contentSpecs
    ++ cfgGeneralProgramPartial.contentSpecs
    ++ cfgIterativeCfgPartial.contentSpecs
    ++ asSmoke.contentSpecs
    ++ abiParity.contentSpecs
    ++ layoutIrDualPin.contentSpecs
    ++ multLayoutConsumer.contentSpecs
    ++ multLinkReadiness.contentSpecs
    ++ multLayoutIrSuccess.contentSpecs
    ++ multForeignLinkSuccess.contentSpecs
    ++ linearForeignLinkSuccess.contentSpecs
    ++ typesForeignLinkSuccess.contentSpecs
    ++ programForeignLinkSuccess.contentSpecs
    ++ graphForeignLinkSuccess.contentSpecs
    ++ rustIrInteropPartial.contentSpecs
    ++ rustIrInteropFull.contentSpecs
    ++ irNodeLayout.contentSpecs
    ++ traitObjectVtable.contentSpecs;
}
