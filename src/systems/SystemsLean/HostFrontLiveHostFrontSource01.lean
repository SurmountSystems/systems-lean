/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostFront.lean bytes, second half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostFrontSource01. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOST-FRONT, liveHostFrontSource1,
  HOST-FRONT-LIVE-HOST-FRONT, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostFrontSource01
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostFront

/-- Dual-pinned live HostFront.lean bytes, second half.
    Concatenate liveHostFrontSource0 then liveHostFrontSource1 before parse.
    Greppable: liveHostFrontSource1, PARSE-LIVE-HOST-FRONT. -/
def liveHostFrontSource1 : String := r#"/-- G2 parse accept + well-formed.
    Greppable: hostFrontGoodG2. -/
def hostFrontGoodG2 : Bool :=
  let r := parseSource goodG2Text
  acceptOk r && r.acceptCmdCount == 4

/-- G3 Linear-shaped parse accept + well-formed + shareNat / polyId / LINEAR-EXACT-ONCE.
    Greppable: hostFrontGoodG3, LINEAR-EXACT-ONCE, shareNat, polyId. -/
def hostFrontGoodG3 : Bool :=
  let r := parseSource goodG3Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasDefNamed m "shareNat"
            && hasDefNamed m "polyId"
            && hasLitStringDef m "linearExactOnceId" "LINEAR-EXACT-ONCE"
        | _ => false)

/-- G4 Types-shaped parse accept + well-formed + TYPED_IR_V0 / KIND-MULT-OK /
    TYPES-FIXTURE. Greppable: hostFrontGoodG4, TYPED_IR_V0, KIND-MULT-OK,
    TYPES-FIXTURE. -/
def hostFrontGoodG4 : Bool :=
  let r := parseSource goodG4Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasLitStringDef m "typedIrId" "TYPED_IR_V0"
            && hasLitStringDef m "kindMultOkId" "KIND-MULT-OK"
            && hasLitStringDef m "typesFixtureId" "TYPES-FIXTURE"
        | _ => false)

/-- G5 Program-shaped parse accept + well-formed + IR_PROGRAM_V0 /
    ORDERED-IR-PROGRAM / PROGRAM-FIXTURE. Greppable: hostFrontGoodG5,
    IR_PROGRAM_V0, ORDERED-IR-PROGRAM, PROGRAM-FIXTURE. -/
def hostFrontGoodG5 : Bool :=
  let r := parseSource goodG5Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasLitStringDef m "irProgramId" "IR_PROGRAM_V0"
            && hasLitStringDef m "orderedIrProgramId" "ORDERED-IR-PROGRAM"
            && hasLitStringDef m "programFixtureId" "PROGRAM-FIXTURE"
        | _ => false)

/-- G6 Graph-shaped parse accept + well-formed + IR_GRAPH_EDGES_V0 /
    EMPTY-GRAPH-OK / GRAPH-FIXTURE. Greppable: hostFrontGoodG6,
    IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK, GRAPH-FIXTURE. -/
def hostFrontGoodG6 : Bool :=
  let r := parseSource goodG6Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasLitStringDef m "irGraphEdgesId" "IR_GRAPH_EDGES_V0"
            && hasLitStringDef m "emptyGraphOkId" "EMPTY-GRAPH-OK"
            && hasLitStringDef m "graphFixtureId" "GRAPH-FIXTURE"
        | _ => false)

/-- G7 Compose-shaped parse accept + well-formed + HOST_COMPOSE_V0 /
    HOST-COMPOSE / COMPOSE-FIXTURE. Greppable: hostFrontGoodG7,
    HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-FIXTURE. -/
def hostFrontGoodG7 : Bool :=
  let r := parseSource goodG7Text
  acceptOk r
    && r.acceptCmdCount == 6
    && (match r with
        | FrontResult.accept m =>
          hasLitStringDef m "hostComposeId" "HOST_COMPOSE_V0"
            && hasLitStringDef m "hostComposeSurfaceId" "HOST-COMPOSE"
            && hasLitStringDef m "composeFixtureId" "COMPOSE-FIXTURE"
        | _ => false)

/-- B1 rejects empty module.
    Greppable: hostFrontBadB1, EMPTY-MODULE-FAIL-CLOSED. -/
def hostFrontBadB1 : Bool :=
  (parseSource badB1Text).isRejectWith reasonEmptyModule

/-- B2 rejects line shape.
    Greppable: hostFrontBadB2, LINE-SHAPE. -/
def hostFrontBadB2 : Bool :=
  (parseSource badB2Text).isRejectWith reasonLineShape

/-- B3 rejects unknown command.
    Greppable: hostFrontBadB3, UNKNOWN-CMD. -/
def hostFrontBadB3 : Bool :=
  (parseSource badB3Text).isRejectWith reasonUnknownCmd

/-- B4 rejects zero-ctor inductive.
    Greppable: hostFrontBadB4, ZERO-CTOR-INDUCTIVE. -/
def hostFrontBadB4 : Bool :=
  (parseSource badB4Text).isRejectWith reasonZeroCtor

/-- All minimum goldens structural ready.
    Greppable: hostFrontGoldensStructuralOk. -/
def hostFrontGoldensStructuralOk : Bool :=
  hostFrontGoodG1
    && hostFrontGoodG2
    && hostFrontGoodG3
    && hostFrontGoodG4
    && hostFrontGoodG5
    && hostFrontGoodG6
    && hostFrontGoodG7
    && hostFrontBadB1
    && hostFrontBadB2
    && hostFrontBadB3
    && hostFrontBadB4

/-- Stage / exe / recipe identity pin. -/
def hostFrontIdsOk : Bool :=
  (stageId == "SLAKE_HOST_FRONT_V0")
    && (hostId == "HOST-FRONT")
    && (surfaceId == "HOST-FRONT")
    && (surfaceAlias == "HOST-HOST-FRONT")
    && (lakeExeName == "slake-host-front")
    && (justRecipe == "host-front")
    && (goldensRel == "src/systems/goldens/host-front")

/-- Mult living Mult grade names still exist (host Mult import honesty). -/
def hostFrontMultGradesOk : Bool :=
  (Mult.name Mult.mult0 == "MULT-0")
    && (Mult.name Mult.mult1 == "MULT-1")
    && (Mult.name Mult.multOmega == "MULT-OMEGA")

/-- HostTerm mult fixture still well-formed (IR SSoT reuse). -/
def hostFrontReusesHostTerm : Bool :=
  HostTerm.hostTermGoodMult && HostTerm.hostTermReady

/-- End-to-end host fragment front-end ready.
    Greppable: hostFrontReady, HOST-FRONT, SLAKE_HOST_FRONT_V0. -/
def hostFrontReady : Bool :=
  hostFrontGoldensStructuralOk
    && hostFrontIdsOk
    && hostFrontMultGradesOk
    && hostFrontReusesHostTerm
    && stillUsesLake
    && dependsOnLake
    && hostFrontStillUsesLake
    && hostFrontDependsOnLake
    && hostFrontHostElaboratorResidualRemains
    && hostFrontDoesNotClaimPeerGreen
    && !hostFrontResidualFreeClaimed
    && !hostFrontProductSelfHostCompleteClaimed
    && !hostFrontProofCompleteClaimed
    && !hostFrontLlvmUnlocked
    && !hostFrontProvablyUnlocked

/-- Ready does not claim peer elaborator green.
    Greppable: hostFrontDoesNotClaimPeer. -/
def hostFrontDoesNotClaimPeer : Bool :=
  hostFrontReady && hostFrontDoesNotClaimPeerGreen

/-- Ready keeps host elaborator residual honesty.
    Greppable: hostFrontKeepsHostResidual. -/
def hostFrontKeepsHostResidual : Bool :=
  hostFrontReady && hostFrontHostElaboratorResidualRemains

/-- Ready is not product residual free claim.
    Greppable: hostFrontDoesNotMeanResidualFree. -/
def hostFrontDoesNotMeanResidualFree : Bool :=
  hostFrontReady && !hostFrontResidualFreeClaimed

/-! ### HOST-FRONT-THEOREM + HOST-FRONT-SMOKE peeled to HostFrontTheorems
    (same namespace). Cites: hostFrontReady_true, HostFrontTheorems.
    foldLines, parseSource, goldens, readiness, and the driver stay here. -/

/-! ### Driver (short banners only; AGENTS driver stdout policy) -/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Require file exists. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Check one golden file: dual-pin content equality + expected accept/reject. -/
def checkGoldenFile (path : System.FilePath) (expectedText : String)
    (expectAccept : Bool) (rejectReason : Option String) (label : String) :
    IO Unit := do
  requireFile path label
  let disk <- IO.FS.readFile path
  if disk != expectedText then
    IO.eprintln s!"error: dual-pin mismatch {label}: on-disk != Lean constant"
    throw (IO.userError s!"dual-pin mismatch {label}")
  let r := parseSource disk
  if expectAccept then
    unless acceptOk r do
      IO.eprintln s!"error: {label} expected ACCEPT, got reject"
      throw (IO.userError s!"{label} accept fail")
    IO.println s!"PASS {label} ACCEPT cmds={r.acceptCmdCount}"
  else
    match rejectReason with
    | none =>
      unless !r.isAccept do
        IO.eprintln s!"error: {label} expected REJECT, got accept"
        throw (IO.userError s!"{label} reject fail")
      IO.println s!"PASS {label} REJECT"
    | some reason =>
      unless r.isRejectWith reason do
        IO.eprintln s!"error: {label} expected REJECT {reason}"
        throw (IO.userError s!"{label} reject reason fail")
      IO.println s!"PASS {label} REJECT {reason}"

/-- Run golden suite under repo root. Dual evidence: files + Lean pins.
    Greppable: runGoldenSuite, HOST-FRONT. -/
def runGoldenSuite (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: Mult-first host fragment front-end =="
  IO.println s!"  surface={surfaceId} host={hostId} goldens={goldensRel}"
  IO.println
    (s!"  structuralReady={hostFrontReady} "
      ++ s!"hostResidual={hostFrontHostElaboratorResidualRemains}")
  let gdir := root / goldensRel
  requireFile gdir "goldens directory"
  checkGoldenFile (gdir / goodG1File) goodG1Text true none "G1"
  checkGoldenFile (gdir / goodG2File) goodG2Text true none "G2"
  checkGoldenFile (gdir / goodG3File) goodG3Text true none "G3"
  checkGoldenFile (gdir / goodG4File) goodG4Text true none "G4"
  checkGoldenFile (gdir / goodG5File) goodG5Text true none "G5"
  checkGoldenFile (gdir / goodG6File) goodG6Text true none "G6"
  checkGoldenFile (gdir / goodG7File) goodG7Text true none "G7"
  checkGoldenFile (gdir / badB1File) badB1Text false (some reasonEmptyModule) "B1"
  checkGoldenFile (gdir / badB2File) badB2Text false (some reasonLineShape) "B2"
  checkGoldenFile (gdir / badB3File) badB3Text false (some reasonUnknownCmd) "B3"
  checkGoldenFile (gdir / badB4File) badB4Text false (some reasonZeroCtor) "B4"
  unless hostFrontReady do
    IO.eprintln s!"error: {stageId} hostFrontReady false"
    throw (IO.userError "hostFrontReady false")
  IO.println
    (s!"GREEN {stageId}: goldens G1/G2/G3/G4/G5/G6/G7 accept "
      ++ s!"B1-B4 reject; dual-pin ok; host residual remains")

/-- CLI: run golden suite. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runGoldenSuite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFront
"#

end SystemsLean.HostFrontLiveHostFront
