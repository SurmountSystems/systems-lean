# SPDX-License-Identifier: Unlicense
# Join only: import data slices for systems-host-presence (Sub-1-KLOC).
# Cold: host-specs-core / compile-path / kernel-parity / join-surface / hold-close.
# Tip: host-specs-tip-selfapply-* / tip-path-* / tip-emit-*.
# Imported by ./default.nix. No bash, no competing gate module names.
let
  jargon = import ./jargon-walk.nix;
  required = import ./required-files.nix;
  leans = import ./host-leans.nix;
  unitSurface = import ./unit-surface.nix;
  hostCore = import ./host-specs-core.nix;
  hostCompilePath = import ./host-specs-compile-path.nix;
  hostKernelParity = import ./host-specs-kernel-parity.nix;
  hostJoinSurface = import ./host-specs-join-surface.nix;
  hostHoldClose = import ./host-specs-hold-close.nix;
  tipSelfApply1 = import ./host-specs-tip-selfapply-1.nix;
  tipSelfApply2 = import ./host-specs-tip-selfapply-2.nix;
  tipSelfApply3 = import ./host-specs-tip-selfapply-3.nix;
  tipSelfApply4 = import ./host-specs-tip-selfapply-4.nix;
  tipSelfApply5 = import ./host-specs-tip-selfapply-5.nix;
  tipPath1 = import ./host-specs-tip-path-1.nix;
  tipEmit1 = import ./host-specs-tip-emit-1.nix;
in
{
  inherit (jargon)
    jargonWalkRoot
    jargonWalkSkipDirs
    jargonWalkExtensions
    jargonForbidden
    ;
  inherit (required) requiredFiles;
  inherit (leans) hostLeans;
  inherit (unitSurface) unitSurfaceSpecs;

  # SYSTEMS_LEAN_HOST modules: marker + theorems + smoke helpers.
  hostSpecs =
    hostCore.hostSpecsCore
    ++ hostCompilePath.hostSpecsCompilePath
    ++ hostKernelParity.hostSpecsKernelParity
    ++ hostJoinSurface.hostSpecsJoinSurface
    ++ tipSelfApply1.hostSpecsTipSelfApply1
    ++ tipSelfApply2.hostSpecsTipSelfApply2
    ++ tipSelfApply3.hostSpecsTipSelfApply3
    ++ tipSelfApply4.hostSpecsTipSelfApply4
    ++ tipSelfApply5.hostSpecsTipSelfApply5
    ++ hostHoldClose.hostSpecsHoldCloseEarly
    ++ tipPath1.hostSpecsTipPath1
    ++ hostHoldClose.hostSpecsHoldCloseLate
    ++ tipEmit1.hostSpecsTipEmit1;
}
