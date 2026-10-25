/-
  Module: SystemsLean.NatViewsReject
  Four kept forms with matching mutual views as Nat, not Option Host.
  Shape is KeptWalk.keptToy. KeptHitKernel.rejectNatViews names that pin.
  Matching Nat views are not a typedPass. optionHostTy is Option Host.
  acceptKept is false. kernelFailAt none is KeptReject.afterKept some
  kept reject. That is the fail-closed --slake-check path.
  slakeOwnsPackageTypecheck stays false.
  ASCII only.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

namespace N

def linearN : Nat := 2

mutual
def leftN : Nat := 0
def rightN : Nat := 1
end

theorem th : True := by decide

end N
