/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostFront.lean bytes, first half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostFrontSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOST-FRONT, liveHostFrontSource0,
  HOST-FRONT-LIVE-HOST-FRONT, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostFrontSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostFront

/-- Dual-pinned live HostFront.lean bytes, first half.
    Concatenate liveHostFrontSource0 then liveHostFrontSource1 before parse.
    Greppable: liveHostFrontSource0, PARSE-LIVE-HOST-FRONT. -/
def liveHostFrontSource0 : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Mult-first host fragment front-end
  (plan-peer-elaborator Host fragment front-end). Side: classic Lean elaborator
  under src/systems/ (not freestanding C).

  Spec (readable):
  - Parse documented Mult-first host dialect text into SystemsLean.HostTerm IR
    (Module / Cmd / Term), then require HostTerm.isWellFormed (fail closed).
  - Dialect is a tiny Lean-like Mult-first subset (not full Lean 4; not only
    Mult IR node lines -- that is SubsetFront).
  - Enough to express HostTerm.multFixtureModule surface (namespace, Mult
    inductive, name / isValid / ofNat? / isValidTag / multIsValid, check).
  - Good goldens accept; bad goldens reject with greppable reasons.

  Grammar v0 (line-oriented; # comments and blank lines ignored):
    module Name
    import Name
    namespace Name
    end Name
    open Name...
    inductive Name Ctor... [deriving Class...]
    def Name : Type := Term
    check Term : Type
  Type tokens: Mult | Nat | String | Bool | Option Type | Name | Type -> Type
  Term: none | true | false | Nat | "string" | some Term | var Name | const Name
        | bare Name (= const) | app Term Term | ( Term )
        | match Term | Pat => Term | ...
  Pat: _ | Nat | Name (ctor0)

  Without-Lake (A9): host-front-without-lake + develop clean-bootstrap (pins in
  HostResidualShrink). Out of scope: Mult package write; full Lean; host free;
  PROVABLY / llvm; product tip flips.

  Theorems (HOST-FRONT-THEOREM / HOST-FRONT-SMOKE): live in
  SystemsLean.HostFrontTheorems (same namespace; long-file peel). Ready /
  G1..G7 / B1..B4 / claims_false / ids + smoke. Do NOT set proofComplete or
  DualResidual host free.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT, SLAKE_HOST_FRONT, SLAKE_HOST_FRONT_V0,
  HOST-HOST-FRONT, hostFrontReady, hostFrontGoodG1, hostFrontGoodG2,
  hostFrontGoodG3, hostFrontGoodG4, hostFrontGoodG5, hostFrontGoodG6,
  hostFrontGoodG7,
  hostFrontBadB1, hostFrontBadB2, hostFrontBadB3, hostFrontBadB4,
  hostFrontHostElaboratorResidualRemains, hostFrontDoesNotClaimPeerGreen,
  HOST-FRONT-SMOKE, HOST-FRONT-THEOREM, HostFrontTheorems, hostFrontReady_true,
  slake-host-front, just host-front, goldens/host-front, parseSource,
  EMPTY-MODULE-FAIL-CLOSED, LINE-SHAPE, UNKNOWN-CMD, NOT-WELL-FORMED,
  ZERO-CTOR-INDUCTIVE, PARSE-FAIL, multFixtureModule, goodG3Text, goodG4Text,
  goodG5Text, goodG6Text, goodG7Text, LINEAR-EXACT-ONCE, shareNat, polyId,
  TYPED_IR_V0, KIND-MULT-OK, TYPES-FIXTURE, IR_PROGRAM_V0, ORDERED-IR-PROGRAM,
  PROGRAM-FIXTURE, IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK, GRAPH-FIXTURE,
  HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-FIXTURE,
  isWellFormed, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostFront
  The one-line dialect line parser lives in SystemsLean.HostFrontLine.
  foldLines, parseSource, pins, and the driver stay here.
  parseSource still calls EdmontonChain only when that dialect rejects.
  The mutual-form reader stays last in that chain.
  Long-file peel: HOST-FRONT-THEOREM + HOST-FRONT-SMOKE in
  SystemsLean.HostFrontTheorems (same namespace). Dual-pinned golden texts +
  file names in SystemsLean.HostFrontGoldens (same namespace).
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins on dual-pinned golden String constants
  (match on-disk goldens) + lake exe / just host-front over files.
  Red/green: lake build SystemsLean.HostFront; lake exe slake-host-front;
  just host-front. Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Not llvm unlock.
-/

import SystemsLean.HostTerm
import SystemsLean.Mult
import SystemsLean.HostFrontGoldens
import SystemsLean.HostFrontLine
import SystemsLean.EdmontonChain

namespace SystemsLean.HostFront

open SystemsLean.HostTerm
open SystemsLean.Mult (Mult)

/-! ### HOST-FRONT / SLAKE_HOST_FRONT (peer elaborator Mult-first fragment front-end)

  Parse Mult-first host dialect -> HostTerm.Module; require isWellFormed.
  Driven by golden inputs (embedded dual-pinned strings + on-disk files).
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_V0"

/-- Greppable host map id. HOST-FRONT durable product token. -/
def hostId : String := "HOST-FRONT"

/-- Short surface name. -/
def surfaceId : String := "HOST-FRONT"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-FRONT"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-front"

/-- just recipe name. -/
def justRecipe : String := "host-front"

/-- Goldens directory relative to repo root. -/
def goldensRel : String := "src/systems/goldens/host-front"

/-- Host elaborator residual still remains (peer not green yet).
    Greppable: hostFrontHostElaboratorResidualRemains. -/
def hostFrontHostElaboratorResidualRemains : Bool := true

/-- Local honesty: this module is not peer elaborator green. -/
def hostFrontDoesNotClaimPeerGreen : Bool := true

/-- Local honesty: host develop surface still uses Lake (not product tip). -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostFrontStillUsesLake : Bool := stillUsesLake
def hostFrontDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostFrontResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostFrontProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostFrontProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostFrontLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostFrontProvablyUnlocked : Bool := false

/-! ### Reject reasons (greppable fail-closed tokens) -/

def reasonEmptyModule : String := "EMPTY-MODULE-FAIL-CLOSED"
def reasonLineShape : String := "LINE-SHAPE"
def reasonUnknownCmd : String := "UNKNOWN-CMD"
def reasonParseFail : String := "PARSE-FAIL"
def reasonNotWellFormed : String := "NOT-WELL-FORMED"
def reasonZeroCtor : String := "ZERO-CTOR-INDUCTIVE"
def reasonMissingModule : String := "MISSING-MODULE"

/-- Front-end check result: accept with Module, or reject with reason. -/
inductive FrontResult where
  | accept (m : Module)
  | reject (reason : String)
  deriving Repr

/-- True when accept. -/
def FrontResult.isAccept : FrontResult -> Bool
  | FrontResult.accept _ => true
  | FrontResult.reject _ => false

/-- True when reject with exact reason. -/
def FrontResult.isRejectWith (r : FrontResult) (reason : String) : Bool :=
  match r with
  | FrontResult.reject r' => r' == reason
  | FrontResult.accept _ => false

/-- Accepted command count when accept; 0 on reject. -/
def FrontResult.acceptCmdCount : FrontResult -> Nat
  | FrontResult.accept m => m.commands.length
  | FrontResult.reject _ => 0

/-- Fold source lines into a Module. Fail closed. -/
def foldLines (lines : List String) : FrontResult :=
  let rec go (modName : Option Name) (cmds : List Cmd) :
      List String -> FrontResult
    | [] =>
      match modName with
      | none =>
        if cmds.isEmpty then FrontResult.reject reasonEmptyModule
        else FrontResult.reject reasonMissingModule
      | some name =>
        let m : Module := { name := name, commands := cmds }
        if cmds.isEmpty then
          FrontResult.reject reasonEmptyModule
        else if isWellFormed m then
          FrontResult.accept m
        else
          FrontResult.reject reasonNotWellFormed
    | line :: rest =>
      if isIgnorableLine line then
        go modName cmds rest
      else
        match parseLineTokens (lineTokens line) with
        | LineParse.err reason => FrontResult.reject reason
        | LineParse.moduleName name =>
          match modName with
          | some _ => FrontResult.reject reasonLineShape
          | none => go (some name) cmds rest
        | LineParse.cmd c => go modName (cmds ++ [c]) rest
  go none [] lines

/-- Parse full source text (newline-separated). Greppable: parseSource.
    The one-line dialect stays first. EdmontonChain runs only when that
    dialect rejects. The mutual-form reader is last in that chain. -/
def parseSource (src : String) : FrontResult :=
  let folded : FrontResult := foldLines (src.splitOn "\n")
  match folded with
  | FrontResult.accept m => FrontResult.accept m
  | FrontResult.reject _ =>
    match SystemsLean.EdmontonChain.parseEdmonton src with
    | some m => FrontResult.accept m
    | none => folded

/-- Accept path: isWellFormed true on accepted module. -/
def acceptOk (r : FrontResult) : Bool :=
  match r with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-! ### Golden structural pins (embedded dual-pinned strings) -/

/-- True when module has a def_ with the given name.
    Greppable helper for golden structural pins. -/
def hasDefNamed (m : Module) (name : String) : Bool :=
  m.commands.any fun c =>
    match c with
    | Cmd.def_ n _ _ => n.raw == name
    | _ => false

/-- True when module has def_ name with litString body val.
    Greppable helper for golden structural pins. -/
def hasLitStringDef (m : Module) (name val : String) : Bool :=
  m.commands.any fun c =>
    match c with
    | Cmd.def_ n _ body =>
      n.raw == name
        && (match body with
            | Term.litString s => s == val
            | _ => false)
    | _ => false

/-- G1 parse accept + well-formed + Mult inductive present.
    Greppable: hostFrontGoodG1. -/
def hostFrontGoodG1 : Bool :=
  let r := parseSource goodG1Text
  acceptOk r
    && r.acceptCmdCount >= 8
    && (match r with
        | FrontResult.accept m =>
          m.commands.any fun c =>
            match c with
            | Cmd.inductive_ name ctors _ =>
              name.raw == "Mult" && ctors.length == 3
            | _ => false
        | _ => false)

"#

end SystemsLean.HostFrontLiveHostFront
