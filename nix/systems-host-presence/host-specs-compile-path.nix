# SPDX-License-Identifier: Unlicense
# Join of host-specs-compile-path-* slices for hostSpecsCompilePath. Sub-1-KLOC.
# No bash, no Python.
let
  s1 = import ./host-specs-compile-path-1.nix;
  s2 = import ./host-specs-compile-path-2.nix;
  s3 = import ./host-specs-compile-path-3.nix;
  s4 = import ./host-specs-compile-path-4.nix;
in
{
  hostSpecsCompilePath =
    s1.hostSpecsCompilePath1
    ++ s2.hostSpecsCompilePath2
    ++ s3.hostSpecsCompilePath3
    ++ s4.hostSpecsCompilePath4;
}
