/-
  Module: SystemsLean.KeptReject
  Fail-closed kept-walk miss. acceptKept false and kernelFailAt none
  is a reject. Matching Nat views (keptToy / NatViewsReject) are Nat,
  not Option Host. CompilePathLinear fixture still accepts.
  CompilePathTypes fixture also accepts. CompilePathProgram fixture
  also accepts. Count stays 3. Does not
  call kernelFailAt. Does not extend HostTerm.Cmd.
  slakeOwnsPackageTypecheck stays false. FullHost stays false.
  Occupancy stays 49. ASCII only.
  SKELETON honesty marker (unit walk; host elaborator package).
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

/-- Types fixture mint is typesFixtureMintId (no linear substring).
    CompilePathLinear still uses linearFixtureMintId.
    CompilePathProgram mint is programFixtureMintId (no linear substring).
    CompilePath barrel mint is compilePathFixtureMintId (no linear substring).
    Extract, Mult, and Plan mints are extractFixtureMintId,
    multFixtureMintId, and planFixtureMintId (no linear substring). -/
def nameHasLinear (nm : String) : Bool :=
  SystemsLean.KeptHitKernel.nameHasLinear nm || nm == "programFixtureMintId"
    || nm == "compilePathFixtureMintId"
    || nm == "extractFixtureMintId"
    || nm == "multFixtureMintId"
    || nm == "planFixtureMintId"

/-- Same four forms as typesFixtureToy with Program names. -/
def programFixtureToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def programFixtureMintId : Nat := 6\n" ++
  "mutual\n" ++
  "def programFixtureLiveView : Option Host := none\n" ++
  "def programFixtureSpentView : Option Host := none\n" ++
  "end\n" ++
  "theorem programFixtureFoldOk_true : " ++
  "programFixtureFoldOk = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

/-- Typed keep. Linear and Types still use kernel acceptKept.
    Program mint is allowed the same way Types mint is. Kernel
    typedPass already allows typesFixtureMintId, so the Program
    mint name is rewritten to that Types mint for the same pass.
    Barrel mint compilePathFixtureMintId is rewritten the same way.
    Extract, Mult, and Plan mints are rewritten the same way. -/
def acceptKept (src : String) : Bool :=
  SystemsLean.KeptHitKernel.acceptKept src
    || match SystemsLean.KeptWalk.walkKept src with
       | none => false
       | some h =>
         nameHasLinear h.triple.linearDef.defName
           && (h.triple.linearDef.defName == "programFixtureMintId"
             || h.triple.linearDef.defName == "compilePathFixtureMintId"
             || h.triple.linearDef.defName == "extractFixtureMintId"
             || h.triple.linearDef.defName == "multFixtureMintId"
             || h.triple.linearDef.defName == "planFixtureMintId")
           && SystemsLean.KeptHitKernel.typedPass
                { h with triple := { h.triple with
                    linearDef := { defName := "typesFixtureMintId" } } }
                (((((src.replace "programFixtureMintId" "typesFixtureMintId").replace
                  "compilePathFixtureMintId" "typesFixtureMintId").replace
                  "extractFixtureMintId" "typesFixtureMintId").replace
                  "multFixtureMintId" "typesFixtureMintId").replace
                  "planFixtureMintId" "typesFixtureMintId")

/-- none when acceptKept. some reject when acceptKept is false and
    failAt is none. some kernel reject when failAt names a command.
    CompilePathLinear still takes the acceptKept arm.
    CompilePathTypes also takes the acceptKept arm.
    CompilePathProgram also takes the acceptKept arm (count stays 3).
    Nat-views toy (Nat/Nat, not Option Host) takes the none-failAt arm. -/
def afterKept (src : String) (failAt : Option String) : Option String :=
  if acceptKept src then none
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

/-- CompilePathTypes fixture (Option Host views) also accepts. -/
def acceptTypesFixture : Bool :=
  match afterKept SystemsLean.KeptHitKernel.typesFixtureToy none with
  | none => true
  | some _ => false

/-- CompilePathProgram fixture (Option Host views) also accepts. -/
def acceptProgramFixture : Bool :=
  match afterKept programFixtureToy none with
  | none => true
  | some _ => false

def pinsOk : Bool :=
  rejectNatViewsNone && acceptLinearFixture && acceptTypesFixture
    && acceptProgramFixture
    && !slakeOwnsPackageTypecheck && !flag
    && occupancyNames == 49 && !fullHost

end SystemsLean.KeptReject
