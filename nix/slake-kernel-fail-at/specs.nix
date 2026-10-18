# SPDX-License-Identifier: Unlicense
# Data for the kernelFailAt honesty meter. Occupancy 49. FullHost false.
# slakeOwnsPackageTypecheck stays false. Do not mill. Dual clocks unadded.
{
  checkRel = "src/systems/SystemsLean/SlakeCheckSource.lean";
  liveNeedle = "match SystemsLean.HostKernel.kernelFailAt m with";

  # Toys prove fail-closed without mutating product Lean.
  toyCommentsOnly = ''
    def rejectLayer (src : String) : Option String :=
      // match SystemsLean.HostKernel.kernelFailAt m with
      -- match SystemsLean.HostKernel.kernelFailAt m with
      none
  '';

  toyBlockOnly = ''
    def rejectLayer (src : String) : Option String :=
      /* match SystemsLean.HostKernel.kernelFailAt m with */
      /- match SystemsLean.HostKernel.kernelFailAt m with -/
      none
  '';

  toyLive = ''
    def rejectLayer (src : String) : Option String :=
      match SystemsLean.HostKernel.kernelFailAt m with
      | none => none
    def checkSource (src : String) : Bool := true
  '';

  heldRows = [
    "slakeOwnsPackageTypecheck stays false"
    "FullHost stays false"
    "occupancy names stay 49"
    "mill 69 of 69 held constant (do not mill)"
    "remote ELF proof is out of this gate"
    "clock specimen keep: count 1 (not added to day clocks)"
    "clock Lean 4 typed elaborator: 10.0 days / 40.0m"
    "clock mathlib: 5.0 days / 20.0m"
  ];
}
