# SPDX-License-Identifier: Unlicense
# Join of host-specs-compile-path-* slices for hostSpecsCompilePath. Sub-1-KLOC.
# No bash, no Python.
let
  s1 = import ./host-specs-compile-path-1.nix;
  s2 = import ./host-specs-compile-path-2.nix;
  s3 = import ./host-specs-compile-path-3.nix;
  s4 = import ./host-specs-compile-path-4.nix;
  s5 = import ./host-specs-compile-path-5.nix;
  s6 = import ./host-specs-compile-path-6.nix;
  s7 = import ./host-specs-compile-path-7.nix;
  s8 = import ./host-specs-compile-path-8.nix;
  s9 = import ./host-specs-compile-path-9.nix;
  s10 = import ./host-specs-compile-path-10.nix;
  s11 = import ./host-specs-compile-path-11.nix;
  s12 = import ./host-specs-compile-path-12.nix;
  s13 = import ./host-specs-compile-path-13.nix;
  s14 = import ./host-specs-compile-path-14.nix;
  s15 = import ./host-specs-compile-path-15.nix;
  s16 = import ./host-specs-compile-path-16.nix;
  s17 = import ./host-specs-compile-path-17.nix;
  s18 = import ./host-specs-compile-path-18.nix;
  s19 = import ./host-specs-compile-path-19.nix;
  s20 = import ./host-specs-compile-path-20.nix;
  s21 = import ./host-specs-compile-path-21.nix;
  s22 = import ./host-specs-compile-path-22.nix;
  s23 = import ./host-specs-compile-path-23.nix;
  s24 = import ./host-specs-compile-path-24.nix;
  s25 = import ./host-specs-compile-path-25.nix;
  s27 = import ./host-specs-compile-path-27.nix;
  s28 = import ./host-specs-compile-path-28.nix;
  s29 = import ./host-specs-compile-path-29.nix;
  s30 = import ./host-specs-compile-path-30.nix;
  s31 = import ./host-specs-compile-path-31.nix;
  s32 = import ./host-specs-compile-path-32.nix;
  s33 = import ./host-specs-compile-path-33.nix;
  s34 = import ./host-specs-compile-path-34.nix;
  s35 = import ./host-specs-compile-path-35.nix;
in
{
  hostSpecsCompilePath =
    s1.hostSpecsCompilePath1
    ++ s2.hostSpecsCompilePath2
    ++ s3.hostSpecsCompilePath3
    ++ s4.hostSpecsCompilePath4
    ++ s5.hostSpecsCompilePath5
    ++ s6.hostSpecsCompilePath6
    ++ s7.hostSpecsCompilePath7
    ++ s8.hostSpecsCompilePath8
    ++ s9.hostSpecsCompilePath9
    ++ s10.hostSpecsCompilePath10
    ++ s11.hostSpecsCompilePath11
    ++ s12.hostSpecsCompilePath12
    ++ s13.hostSpecsCompilePath13
    ++ s14.hostSpecsCompilePath14
    ++ s15.hostSpecsCompilePath15
    ++ s16.hostSpecsCompilePath16
    ++ s17.hostSpecsCompilePath17
    ++ s18.hostSpecsCompilePath18
    ++ s19.hostSpecsCompilePath19
    ++ s20.hostSpecsCompilePath20
    ++ s21.hostSpecsCompilePath21
    ++ s22.hostSpecsCompilePath22
    ++ s23.hostSpecsCompilePath23
    ++ s24.hostSpecsCompilePath24
    ++ s25.hostSpecsCompilePath25
    ++ s27.hostSpecsCompilePath27
    ++ s28.hostSpecsCompilePath28
    ++ s29.hostSpecsCompilePath29
    ++ s30.hostSpecsCompilePath30
    ++ s31.hostSpecsCompilePath31
    ++ s32.hostSpecsCompilePath32
    ++ s33.hostSpecsCompilePath33
    ++ s34.hostSpecsCompilePath34
    ++ s35.hostSpecsCompilePath35;
}
