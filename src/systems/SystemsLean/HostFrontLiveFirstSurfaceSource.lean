/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live FirstSurface.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFirstSurfaceSource. Not occupancy name 50. Not mill 70.
  This wrap parses FirstSurface.lean only.
  Unique needles use trailing newline so HostFrontLiveFirstSurface is not a
  prefix hit on HostFrontLiveFirstSurfaceSource.
  Occupancy leftover HostModuleCheckFirstSurfaceTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveFirstSurface is not a prefix):
  HostFrontLiveFirstSurfaceSource
  PARSE-LIVE-FIRST-SURFACE
  HOST-FRONT-LIVE-FIRST-SURFACE
  FIRST-SURFACE
  Greppable: SYSTEMS_LEAN_HOST, liveFirstSurfaceSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveFirstSurfaceSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveFirstSurface

/-- Dual-pinned live FirstSurface.lean bytes (must match on-disk file).
    Greppable: liveFirstSurfaceSource, PARSE-LIVE-FIRST-SURFACE. -/
def liveFirstSurfaceSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- first Slake compiler surface (bootstrap S1).
  Named Mult-unit front-end: defined input SLAKE_FIRST_SURFACE_MULT / FIRST-SURFACE,
  structural readiness via COMPILE-PATH-MULT (multFixtureCompilePathReady),
  optional HOST-EMIT-MULT honesty (folded in Mult fixture). Lake-built host driver
  (stillUsesLake / dependsOnLake remain true). Not freestanding product-wire
  regenerate as success criterion. Not S3 self-application. Not S4 Lake retire.
  Not freestanding emit residual free forge. Not PROVABLY. Not llvm unlock.
  Greppable: SYSTEMS_LEAN_HOST, FIRST-SURFACE, SLAKE_FIRST_SURFACE,
  SLAKE_FIRST_SURFACE_MULT, HOST-FIRST-SURFACE, firstSurfaceReady,
  firstSurfaceUnitReady, firstSurfaceEmitMultOk, firstSurfaceReady_true,
  FIRST-SURFACE-SMOKE, FIRST-SURFACE-THEOREM, COMPILE-PATH-MULT, MULT-FIXTURE,
  HOST-EMIT-MULT, multFixtureCompilePathReady, unitCompileReady,
  slake-first-surface, just first-surface, StillUsesLake, DependsOnLake,
  RUNTIME-FS, UNIT_SURFACE host surface. Module: SystemsLean.FirstSurface
  Short role name (not ProductPathFreestandingBootstrapS1 kitchen-sink).
  Red/green: lake build SystemsLean.FirstSurface; lake exe slake-first-surface;
  just first-surface; just first-surface-without-lake (A10+++ prebuilt; no lake);
  just host-develop-tools-clean-bootstrap (includes slake-first-surface leanc@rsp).
  Module must stay ASCII.
-/

import SystemsLean.CompilePathMult

namespace SystemsLean.FirstSurface

open SystemsLean.CompilePath

/-! ### FIRST-SURFACE / SLAKE_FIRST_SURFACE_MULT (bootstrap S1)

  Defined Mult unit input reuses COMPILE-PATH-MULT / MULT-FIXTURE structural
  content (three-node ordered IR: MULT-0 erased, MULT-1 linear, MULT-OMEGA
  value + host mark+mint). Driver proves input -> unitCompileReady fold +
  HOST-EMIT-MULT path honesty via multFixtureCompilePathReady.
  Does NOT rewrite full freestanding C API dialect as S1 success.
-/

/-- Greppable primary stage id (bootstrap S1 first compiler surface). -/
def stageId : String := "SLAKE_FIRST_SURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FIRST-SURFACE"

/-- Short surface name (product role). -/
def surfaceId : String := "FIRST-SURFACE"

/-- Defined Mult unit input identity (same content as MULT-FIXTURE).
    Greppable: SLAKE_FIRST_SURFACE_MULT, firstSurfaceMultInputId. -/
def firstSurfaceMultInputId : String := "SLAKE_FIRST_SURFACE_MULT"

/-- Lake exe name. -/
def lakeExeName : String := "slake-first-surface"

/-- just recipe name. -/
def justRecipe : String := "first-surface"

/-- Host elaborator still Lake (bootstrap S1; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: S1 surface does not claim product residual free flip. -/
def firstSurfaceResidualFreeClaimed : Bool := false

/-- Local honesty: S1 is not freestanding product self-host complete rebrand. -/
def firstSurfaceProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: S1 does not claim proof complete. -/
def firstSurfaceProofCompleteClaimed : Bool := false

/-- Local honesty: S1 does not unlock llvm. -/
def firstSurfaceLlvmUnlocked : Bool := false

/-- Local honesty: S1 does not unlock PROVABLY. -/
def firstSurfaceProvablyUnlocked : Bool := false

/-- Mult unit input program bar (ordered IR length 3, well-typed).
    Greppable: firstSurfaceMultInputReady, MULT-0, MULT-1, MULT-OMEGA. -/
def firstSurfaceMultInputReady : Bool := multFixtureProgramReady

/-- Unit structural readiness for the Mult input (unitCompileReady after mark+mint).
    Greppable: firstSurfaceUnitReady, unitCompileReady, COMPILE-PATH-MULT. -/
def firstSurfaceUnitReady : Bool := multFixtureComposeReady

/-- Optional HOST-EMIT-MULT product text path honesty (not full wire rewrite).
    Greppable: firstSurfaceEmitMultOk, HOST-EMIT-MULT. -/
def firstSurfaceEmitMultOk : Bool := multFixtureEmitPathOk

/-- End-to-end first compiler surface ready: Mult fixture compile path + Lake host
    honesty + local free/complete/proof/llvm/PROVABLY non-claims.
    Greppable: firstSurfaceReady, FIRST-SURFACE, SLAKE_FIRST_SURFACE_MULT. -/
def firstSurfaceReady : Bool :=
  multFixtureCompilePathReady
    && firstSurfaceMultInputReady
    && firstSurfaceUnitReady
    && firstSurfaceEmitMultOk
    && stillUsesLake
    && dependsOnLake
    && !firstSurfaceResidualFreeClaimed
    && !firstSurfaceProductSelfHostCompleteClaimed
    && !firstSurfaceProofCompleteClaimed
    && !firstSurfaceLlvmUnlocked
    && !firstSurfaceProvablyUnlocked
    && (stageId == "SLAKE_FIRST_SURFACE_V0")
    && (hostId == "HOST-FIRST-SURFACE")
    && (surfaceId == "FIRST-SURFACE")
    && (firstSurfaceMultInputId == "SLAKE_FIRST_SURFACE_MULT")
    && (lakeExeName == "slake-first-surface")
    && (justRecipe == "first-surface")

/-- firstSurfaceReady does not retire Lake (S4 only).
    Greppable: firstSurfaceDoesNotRetireLake. -/
def firstSurfaceDoesNotRetireLake : Bool :=
  firstSurfaceReady && stillUsesLake && dependsOnLake

/-- firstSurfaceReady is not product residual free claim.
    Greppable: firstSurfaceDoesNotMeanResidualFree. -/
def firstSurfaceDoesNotMeanResidualFree : Bool :=
  firstSurfaceReady && !firstSurfaceResidualFreeClaimed

/-! ### FIRST-SURFACE-THEOREM (readable S1 statements, then proofs) -/

set_option maxRecDepth 8192

/-- Mult input program ready (COMPILE-PATH-MULT reuse).
    Greppable: firstSurfaceMultInputReady_true, FIRST-SURFACE-THEOREM. -/
theorem firstSurfaceMultInputReady_true :
    firstSurfaceMultInputReady = true := by
  native_decide

/-- Unit compile path ready for Mult input.
    Greppable: firstSurfaceUnitReady_true, FIRST-SURFACE-THEOREM. -/
theorem firstSurfaceUnitReady_true : firstSurfaceUnitReady = true := by
  native_decide

/-- HOST-EMIT-MULT path honesty on Mult input.
    Greppable: firstSurfaceEmitMultOk_true, FIRST-SURFACE-THEOREM. -/
theorem firstSurfaceEmitMultOk_true : firstSurfaceEmitMultOk = true := by
  native_decide

/-- End-to-end first compiler surface ready (bootstrap S1).
    Greppable: firstSurfaceReady_true, FIRST-SURFACE-THEOREM, FIRST-SURFACE. -/
theorem firstSurfaceReady_true : firstSurfaceReady = true := by
  native_decide

/-- S1 ready does not retire Lake.
    Greppable: firstSurfaceDoesNotRetireLake_true, FIRST-SURFACE-THEOREM. -/
theorem firstSurfaceDoesNotRetireLake_true :
    firstSurfaceDoesNotRetireLake = true := by
  native_decide

/-- S1 ready does not claim residual free.
    Greppable: firstSurfaceDoesNotMeanResidualFree_true, FIRST-SURFACE-THEOREM. -/
theorem firstSurfaceDoesNotMeanResidualFree_true :
    firstSurfaceDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: firstSurface_claims_false, FIRST-SURFACE-THEOREM. -/
theorem firstSurface_claims_false :
    (firstSurfaceResidualFreeClaimed = false)
      /\ (firstSurfaceProductSelfHostCompleteClaimed = false)
      /\ (firstSurfaceProofCompleteClaimed = false)
      /\ (firstSurfaceLlvmUnlocked = false)
      /\ (firstSurfaceProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe name pins.
    Greppable: firstSurface_ids_eq, FIRST-SURFACE-THEOREM. -/
theorem firstSurface_ids_eq :
    (stageId = "SLAKE_FIRST_SURFACE_V0")
      /\ (hostId = "HOST-FIRST-SURFACE")
      /\ (surfaceId = "FIRST-SURFACE")
      /\ (firstSurfaceMultInputId = "SLAKE_FIRST_SURFACE_MULT")
      /\ (lakeExeName = "slake-first-surface")
      /\ (justRecipe = "first-surface") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl (And.intro rfl rfl))))

/-! ### FIRST-SURFACE-SMOKE (lake fails if examples fail)
    Greppable: FIRST-SURFACE-SMOKE, FIRST-SURFACE, SLAKE_FIRST_SURFACE_MULT. -/

/-- FIRST-SURFACE-SMOKE: Mult input + unit ready + emit Mult path. -/
example : firstSurfaceMultInputReady = true := by native_decide
example : firstSurfaceUnitReady = true := by native_decide
example : firstSurfaceEmitMultOk = true := by native_decide

/-- FIRST-SURFACE-SMOKE: full surface ready; Lake remains; free/llvm stay local-false. -/
example : firstSurfaceReady = true := by native_decide
example : firstSurfaceDoesNotRetireLake = true := by native_decide
example : firstSurfaceDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : firstSurfaceResidualFreeClaimed = false := rfl
example : firstSurfaceLlvmUnlocked = false := rfl
example : firstSurfaceProvablyUnlocked = false := rfl
example : firstSurfaceMultInputId = "SLAKE_FIRST_SURFACE_MULT" := rfl
example : lakeExeName = "slake-first-surface" := rfl

/-- Print first compiler surface gate (host diagnostic). -/
def printFirstSurface : IO Unit := do
  IO.println s!"== {stageId}: Slake first compiler surface (bootstrap S1) =="
  IO.println s!"  host: {hostId} / surface: {surfaceId}"
  IO.println s!"  Mult unit input id: {firstSurfaceMultInputId}"
  IO.println s!"  firstSurfaceMultInputReady: {firstSurfaceMultInputReady} (COMPILE-PATH-MULT program)"
  IO.println s!"  firstSurfaceUnitReady: {firstSurfaceUnitReady} (unitCompileReady after mark+mint)"
  IO.println s!"  firstSurfaceEmitMultOk: {firstSurfaceEmitMultOk} (HOST-EMIT-MULT honesty)"
  IO.println s!"  firstSurfaceReady: {firstSurfaceReady}"
  IO.println s!"  multFixtureCompilePathReady: {multFixtureCompilePathReady} (reuse Mult fixture)"
  IO.println s!"  stillUsesLake: {stillUsesLake} (true until S4)"
  IO.println s!"  dependsOnLake: {dependsOnLake} (host elaborator bootstrap)"
  IO.println s!"  Lake exe: {lakeExeName} / just {justRecipe}"
  IO.println "  honest: S1 = Mult unit input -> structural readiness; not full product-wire regenerate"
  IO.println "  honest: Lake host remains; free/complete living tip unchanged; not PROVABLY; not llvm"
  IO.println "  honest: not S3 self-application; not S4 Lake retire"
  IO.println "  short module name FirstSurface (not ProductPathFreestandingBootstrapS1)"
  if firstSurfaceReady then
    IO.println s!"GREEN {stageId}: first compiler surface ok (Mult input ready; unitCompileReady; HOST-EMIT-MULT; Lake host remains)"
  else
    IO.eprintln s!"error: {stageId} firstSurfaceReady false"
    throw (IO.userError "firstSurfaceReady false")

/-- CLI: print first surface gate. Fail-closed if not ready. -/
def main (_args : List String) : IO UInt32 := do
  try
    printFirstSurface
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.FirstSurface
"#

end SystemsLean.HostFrontLiveFirstSurface
