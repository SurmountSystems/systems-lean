/-
  Module: SystemsLean.KeptReject
  Fail-closed kept-walk miss. acceptKept false and kernelFailAt none
  is a reject. Matching Nat views (keptToy / NatViewsReject) are Nat,
  not Option Host. CompilePathLinear fixture still accepts. Count
  stays 1. Does not call kernelFailAt. Does not extend HostTerm.Cmd.
  slakeOwnsPackageTypecheck stays false. FullHost stays false.
  Occupancy stays 49. ASCII only.
-/

import SystemsLean.KeptWalk
import SystemsLean.KeptHitKernel

namespace SystemsLean.KeptReject

/-- Honesty: this walk does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Flag stays false. -/
def flag : Bool := false

/-- Occupancy names stay 49. -/
def occupancyNames : Nat := 49

/-- FullHost stays false. -/
def fullHost : Bool := false

/-- Named layer when a kept-walk hit misses and the kernel did not fail. -/
def keptRejectMsg : String := "kept reject"

/-- none when acceptKept. some reject when acceptKept is false and
    failAt is none. some kernel reject when failAt names a command.
    CompilePathLinear still takes the acceptKept arm (count stays 1).
    Nat-views toy (Nat/Nat, not Option Host) takes the none-failAt arm. -/
def afterKept (src : String) (failAt : Option String) : Option String :=
  if SystemsLean.KeptHitKernel.acceptKept src then none
  else
    match failAt with
    | some label => some ("kernel reject " ++ label)
    | none => some keptRejectMsg

/-- Matching Nat views fail acceptKept. kernelFailAt none is some reject. -/
def rejectNatViewsNone : Bool :=
  match afterKept SystemsLean.KeptWalk.keptToy none with
  | some msg => msg == keptRejectMsg
  | none => false

/-- CompilePathLinear fixture (Option Host views) still accepts. -/
def acceptLinearFixture : Bool :=
  match afterKept SystemsLean.KeptHitKernel.fixtureToy none with
  | none => true
  | some _ => false

def pinsOk : Bool :=
  rejectNatViewsNone && acceptLinearFixture
    && !slakeOwnsPackageTypecheck && !flag
    && occupancyNames == 49 && !fullHost

end SystemsLean.KeptReject
