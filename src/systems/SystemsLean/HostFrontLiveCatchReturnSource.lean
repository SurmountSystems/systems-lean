/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CatchReturn.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCatchReturnSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-CATCH-RETURN, liveCatchReturnSource,
  HOST-FRONT-LIVE-CATCH-RETURN, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCatchReturnSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCatchReturn

/-- Dual-pinned live CatchReturn.lean bytes (must match on-disk file).
    Greppable: liveCatchReturnSource, PARSE-LIVE-CATCH-RETURN. -/
def liveCatchReturnSource : String := r#"/-
  SYSTEMS_LEAN_HOST -- thin living catch role for SelfHostComplete.main.
  Dest writers import this closed subset instead of fat SelfHostComplete
  (that import blows lean --run). Catch moved here as withCatch.
  Do not import SystemsLean.SelfHostComplete. Do not import CompleteOk
  (catch does not belong in CompleteOk). Dest extra-argv is still not
  Lean throw. Dest still must not import fat SelfHostComplete.
  Not mill leanc. Not remill mill 69. Not slake-hello.
  FullHost stays false. slakeOwnsPackageTypecheck stays false.
  occupancy 49. Occupancy stays 49. Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, throwMsg, catchEprint, catchCode, withCatch,
  FullHost stays false, occupancy 49, Mill stays 69 of 69, Not mill leanc.
  Module: SystemsLean.CatchReturn
-/

namespace SystemsLean.CatchReturn

/-- userError message thrown when Ok is false. -/
def throwMsg : String := "freestandingProductSelfHostCompleteOk false"

/-- IO.eprintln s!"{e}" of userError throwMsg. String dest/IR already use. -/
def catchEprint : String := throwMsg

/-- Catch return code. Dest extra-argv stand-in still uses 1. -/
def catchCode : UInt32 := 1

/-- Named dest. This helper does not write that path. -/
def destRel : String :=
  "out/slake-host-tool-elf/slake-freestanding-self-host-complete"

/-- eprint the exception then return catchCode. -/
def onCatch (e : IO.Error) : IO UInt32 := do
  IO.eprintln s!"{e}"
  pure catchCode

/-- try act; pure 0; catch e => onCatch e. Shared by SelfHostComplete.main. -/
def withCatch (act : IO Unit) : IO UInt32 := do
  try
    act
    pure 0
  catch e =>
    onCatch e

theorem throwMsg_eq :
    throwMsg = "freestandingProductSelfHostCompleteOk false" :=
  rfl

theorem catchEprint_eq_throwMsg : catchEprint = throwMsg :=
  rfl

theorem catchCode_eq : catchCode = 1 :=
  rfl

/-- This helper encodes Lean catch. It does not write dest. -/
def writesDest : Bool := false

theorem writesDest_eq_false : writesDest = false :=
  rfl

theorem destRel_named :
    destRel =
      "out/slake-host-tool-elf/slake-freestanding-self-host-complete" :=
  rfl

end SystemsLean.CatchReturn
"#

end SystemsLean.HostFrontLiveCatchReturn
