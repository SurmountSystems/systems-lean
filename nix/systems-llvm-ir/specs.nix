# SPDX-License-Identifier: Unlicense
# Thin join of systems-llvm-ir data slices (hold, emit-path, unit-text,
# unit-package, compose-text, as-smoke, abi-parity, layout-ir-dual-pin).
# Imported by ./default.nix. Keep each slice small; do not grow kitchen-sink
# tables here.
let
  hold = import ./hold.nix;
  emitPath = import ./emit-path.nix;
  unitText = import ./unit-text.nix;
  unitPackage = import ./unit-package.nix;
  composeText = import ./compose-text.nix;
  asSmoke = import ./as-smoke.nix;
  abiParity = import ./abi-parity.nix;
  layoutIrDualPin = import ./layout-ir-dual-pin.nix;
in
{
  requiredFiles =
    hold.requiredFiles
    ++ emitPath.requiredFiles
    ++ unitText.requiredFiles
    ++ unitPackage.requiredFiles
    ++ composeText.requiredFiles
    ++ asSmoke.requiredFiles
    ++ abiParity.requiredFiles
    ++ layoutIrDualPin.requiredFiles;

  contentSpecs =
    hold.contentSpecs
    ++ emitPath.contentSpecs
    ++ unitText.contentSpecs
    ++ unitPackage.contentSpecs
    ++ composeText.contentSpecs
    ++ asSmoke.contentSpecs
    ++ abiParity.contentSpecs
    ++ layoutIrDualPin.contentSpecs;
}
