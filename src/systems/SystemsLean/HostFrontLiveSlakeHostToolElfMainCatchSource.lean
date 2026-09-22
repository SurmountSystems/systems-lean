/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SlakeHostToolElfMainCatch.lean bytes.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchSource
  Greppable: SYSTEMS_LEAN_HOST, liveSlakeHostToolElfMainCatchSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69. Not a remill.
  Not Lake-gone. slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMainCatch

/-- Dual-pinned live SlakeHostToolElfMainCatch.lean bytes.
    Greppable: liveSlakeHostToolElfMainCatchSource. -/
def liveSlakeHostToolElfMainCatchSource : String := r#"/-
  SYSTEMS_LEAN_HOST -- Lean catch IR tokens. Catch moved to CatchReturn.withCatch.
  Catch eprint plus return 1. Do not import SystemsLean.SelfHostComplete (too fat).
  Dest extra-argv is still not Lean throw. Dest still must not import fat
  SelfHostComplete. Do not rewrite dest ELF .text.
  Not mill leanc. Not remill mill 69. Not slake-hello. FullHost stays false.
  slakeOwnsPackageTypecheck stays false. occupancy 49. Occupancy stays 49.
  Mill stays 69 of 69. Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_TOOL_ELF_V0,
  HOST-HOST-TOOL-MAIN-CATCH.
  Module: SystemsLean.SlakeHostToolElfMainCatch
-/

import SystemsLean.CatchReturn

namespace SystemsLean.SlakeHostToolElfMainCatch

/-- Greppable stage id (same writer family). -/
def stageId : String := "SLAKE_HOST_TOOL_ELF_V0"

/-- Lean-main catch stage. Distinct from dest HOST-HOST-TOOL-CATCH. -/
def catchStage : String := "HOST-HOST-TOOL-MAIN-CATCH"

/-- Re-export CatchReturn.throwMsg so MainCatchX86 payloadBytes stay identical. -/
def throwMsg : String := SystemsLean.CatchReturn.throwMsg

/-- Re-export CatchReturn.catchEprint (throwMsg plus dest/IR newline elsewhere). -/
def catchEprint : String := SystemsLean.CatchReturn.catchEprint

/-- Named dest. This helper does not write that path. -/
def destRel : String :=
  "out/slake-host-tool-elf/slake-freestanding-self-host-complete"

/-- Closed-subset catch insn. Local; do not import Measure NativeInsn. -/
inductive CatchInsn where
  | eprintLine (line : String)
  | returnCode (n : UInt32)
  deriving DecidableEq, Repr

/-- Catch body: eprint throwMsg then return 1. -/
def catchBody : List CatchInsn :=
  [CatchInsn.eprintLine catchEprint, CatchInsn.returnCode 1]

/-- ASCII insn render. Tokens eprintLine ... and return 1. -/
def CatchInsn.render : CatchInsn -> String
  | .eprintLine line => "eprintLine " ++ line
  | .returnCode n => "return " ++ toString n

/-- ASCII catch IR. Starts with HOST-HOST-TOOL-MAIN-CATCH plus body. -/
def catchIrText : String :=
  catchStage ++ "\n" ++
    String.intercalate "\n" (catchBody.map CatchInsn.render)

/--
  Catch moved to CatchReturn.withCatch. Dest extra-argv is still not Lean
  throw. Dest still must not import fat SelfHostComplete. Not mill.
  Not Lake-gone.
-/
def leftoverLeanCatch : String :=
  "leftover: catch moved to CatchReturn.withCatch; dest extra-argv is " ++
    "still not Lean throw; dest still must not import fat " ++
    "SelfHostComplete; not mill; not mill leanc; not slake-hello; not " ++
    "Lake-gone"

theorem catchBody_length : catchBody.length = 2 :=
  rfl

theorem catchBody_first :
    catchBody.head? = some (CatchInsn.eprintLine catchEprint) :=
  rfl

theorem catchBody_second :
    catchBody.tail.head? = some (CatchInsn.returnCode 1) :=
  rfl

theorem catchEprint_eq_throwMsg : catchEprint = throwMsg :=
  rfl

theorem catchStage_eq : catchStage = "HOST-HOST-TOOL-MAIN-CATCH" :=
  rfl

/-- Prefix of catch IR is the left operand of ++. Not startsWith. Not toUTF8 extract. -/
theorem catchIrText_prefix :
    catchIrText =
      catchStage ++ "\n" ++
        String.intercalate "\n" (catchBody.map CatchInsn.render) :=
  rfl

/-- This helper encodes Lean catch IR. It does not write dest. -/
def writesDest : Bool := false

theorem writesDest_eq_false : writesDest = false :=
  rfl

theorem destRel_named :
    destRel =
      "out/slake-host-tool-elf/slake-freestanding-self-host-complete" :=
  rfl

end SystemsLean.SlakeHostToolElfMainCatch
"#

end SystemsLean.HostFrontLiveSlakeHostToolElfMainCatch
