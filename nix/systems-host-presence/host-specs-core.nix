# SPDX-License-Identifier: Unlicense
# Join of host-specs-core-* slices for hostSpecsCore. Sub-1-KLOC.
# No bash, no Python.
let
  s1 = import ./host-specs-core-1.nix;
  s2 = import ./host-specs-core-2.nix;
in
{
  hostSpecsCore =
    s1.hostSpecsCore1
    ++ s2.hostSpecsCore2;
}
