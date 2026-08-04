# SPDX-License-Identifier: Unlicense
# Join of host-specs-kernel-parity-* slices for hostSpecsKernelParity. Sub-1-KLOC.
# No bash, no Python.
let
  s1 = import ./host-specs-kernel-parity-1.nix;
  s2 = import ./host-specs-kernel-parity-2.nix;
in
{
  hostSpecsKernelParity =
    s1.hostSpecsKernelParity1
    ++ s2.hostSpecsKernelParity2;
}
