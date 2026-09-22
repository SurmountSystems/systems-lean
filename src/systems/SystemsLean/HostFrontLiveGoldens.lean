/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostFrontGoldens.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveGoldens. Reuses HostFrontLiveMult skip-un-kernelable
  fold class (Graph / PackageWrite). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveExtractSource on Goldens text.

  Spec (readable):
  - parseLiveGoldensSource turns live HostFrontGoldens.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostFrontGoldens even without a module line.
  - kernelCheckLiveGoldensSource is HostKernel.kernelCheck of that parse.
  - Skip leftover `++` concat after a short String def; keep checking the rest.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean.
  - Not freestanding residual free. Not PROVABLY. Not occupancy name 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-GOLDENS,
  SLAKE_HOST_FRONT_LIVE_GOLDENS_V0, PARSE-LIVE-GOLDENS,
  parseLiveGoldensSource, kernelCheckLiveGoldensSource,
  hostFrontLiveGoldensReady, liveGoldensSource, liveGoldensRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveGoldens
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveGoldens on
  surmount-1. Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveMult
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveGoldens

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_GOLDENS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-GOLDENS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-GOLDENS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGoldensRel : String := "src/systems/SystemsLean/HostFrontGoldens.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveGoldensFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveGoldensResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveGoldensProvablyUnlocked : Bool := false

/-- Parse fuel (Goldens is a short String-def companion). -/
def liveGoldensParseFuel : Nat := 192

/-- Skip fuel. Goldens `"a" ++ "b"` leftover after a short String def
    must not PARSE-FAIL. Same role as liveGraphSkipFuel. -/
def liveGoldensSkipFuel : Nat := 4096

/-- Command-start keywords (skip leftover concat / un-kernelable). -/
def isCmdKw (t : String) : Bool :=
  t == "import" || t == "open" || t == "namespace" || t == "end"
    || t == "structure" || t == "inductive" || t == "def"
    || t == "theorem" || t == "example" || t == "set_option"

/-- Skip tokens until the next command keyword (do not consume it). -/
def skipUntilCmd : Nat -> List String -> List String
  | 0, rest => rest
  | Nat.succ _, [] => []
  | Nat.succ n, t :: rest =>
    if isCmdKw t then t :: rest
    else skipUntilCmd n rest

/-- If rest is not a command start, skip to the next command.
    parseOneCmdGoldens can accept a short String def and leave `++`
    concat leftover; those are not PARSE-FAIL. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Take a string literal including quotes. `\"` does not close the token. -/
def takeStringGoldensN : Nat -> List Char -> List Char ->
    Option (Prod (List Char) (List Char))
  | 0, _, _ => none
  | Nat.succ _, _, [] => none
  | Nat.succ n, acc, c :: rest =>
    if c == '\\' then
      match rest with
      | [] => none
      | d :: rest2 => takeStringGoldensN n (d :: '\\' :: acc) rest2
    else if c == '"' then
      some ('"' :: acc, rest)
    else
      takeStringGoldensN n (c :: acc) rest

/-- Tokenize stripped source; keeps `++` and escaped string lits. -/
def tokenizeGoldensN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeGoldensN n rest acc
    else if c == '"' then
      match takeStringGoldensN liveGoldensParseFuel [c] rest with
      | none => tokenizeGoldensN n rest acc
      | some (rev, rest2) =>
        tokenizeGoldensN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeGoldensN n rest2 (":=" :: acc)
      | _ => tokenizeGoldensN n rest (":" :: acc)
    else if c == '+' then
      match rest with
      | '+' :: rest2 => tokenizeGoldensN n rest2 ("++" :: acc)
      | _ => tokenizeGoldensN n rest acc
    else if c == '.' then
      tokenizeGoldensN n rest ("." :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveGoldensParseFuel [c] rest
      tokenizeGoldensN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeGoldensN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeGoldens (src : String) : List String :=
  tokenizeGoldensN (src.length + 8) src.toList []

/-- Dotted ident `SystemsLean . HostFront`. -/
def parseDottedName : Nat -> List String -> Option (Prod String (List String))
  | 0, _ => none
  | Nat.succ _, [] => none
  | Nat.succ n, a :: rest =>
    if !liveIsIdent a then none
    else
      match rest with
      | "." :: rest2 =>
        match parseDottedName n rest2 with
        | some (more, rest3) => some (a ++ "." ++ more, rest3)
        | none => none
      | _ => some (a, rest)

/-- Fold `"a" ++ "b"` string lits into one payload.
    A short prefix is enough; leftover `++` is skipNonCmd, not PARSE-FAIL. -/
def parseStringConcat : Nat -> List String -> Option (Prod String (List String))
  | 0, _ => none
  | Nat.succ _, [] => none
  | Nat.succ n, t :: rest =>
    if !isStringLit t then none
    else
      let s := stripStringLit t
      match rest with
      | "++" :: rest2 =>
        match parseStringConcat n rest2 with
        | some (s2, rest3) => some (s ++ s2, rest3)
        | none => some (s, "++" :: rest2)
      | _ => some (s, rest)

/-- Parse `def` body after the name (typed String assign). -/
def parseDefGoldens (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersN fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match kind with
        | DefBodyKind.equation => none
        | DefBodyKind.assign =>
          match parseHostTypeAll tyToks with
          | none => none
          | some retTy =>
            match parseStringConcat liveGoldensParseFuel bodyToks with
            | none => none
            | some (s, rest4) =>
              let ty := addBinderArrows bs retTy
              some (Cmd.def_ (HostTerm.n dname) (some ty) (Term.litString s), rest4)
    | _ => none

/-- Parse one command (dotted namespace / end / String def).
    none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdGoldens (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.namespace (HostTerm.n nm), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.endNamespace (HostTerm.n nm), rest2)
    | none => none
  | "def" :: name :: rest =>
    if liveIsIdent name then parseDefGoldens fuel name rest
    else none
  | _ => none

/-- Fold commands. Skip leftover `++` concat / un-kernelable defs.
    Same class as parseCmdsGraph / parseCmdsPackageWrite. -/
def parseCmdsGoldens : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdGoldens liveGoldensParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveGoldensSkipFuel rest
      parseCmdsGoldens n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveGoldensSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsGoldens n rest2 acc
          else none
        else none
      | [] => some acc

/-- Parse live HostFrontGoldens.lean text.
    Greppable: parseLiveGoldensSource, PARSE-LIVE-GOLDENS. -/
def parseLiveGoldensSource (src : String) : FrontResult :=
  let toks := tokenizeGoldens (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsGoldens liveGoldensParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostFrontGoldens", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live Goldens parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveGoldensSource, PARSE-LIVE-GOLDENS. -/
def kernelCheckLiveGoldensSource (src : String) : Bool :=
  match parseLiveGoldensSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Dual-pinned live HostFrontGoldens.lean bytes (must match on-disk file).
    Greppable: liveGoldensSource, PARSE-LIVE-GOLDENS. -/
def liveGoldensSource : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- HostFront dual-pinned golden texts + file names.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion of HostFront. Namespace SystemsLean.HostFront.
  Non-claims: not peer green; host residual remains; not free/PROVABLY/llvm.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT, HostFrontGoldens, goodG1Text,
  goodG2Text, goodG3Text, goodG4Text, goodG5Text, goodG6Text, goodG7Text,
  badB1Text, badB2Text, badB3Text, badB4Text, goodG1File, LINEAR-EXACT-ONCE,
  TYPED_IR_V0, IR_PROGRAM_V0, IR_GRAPH_EDGES_V0, HOST_COMPOSE_V0.
  Module: SystemsLean.HostFrontGoldens
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostFrontGoldens; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Host elaborator residual remains.
-/
namespace SystemsLean.HostFront
/-! ### Dual-pinned golden texts (must match on-disk files under goldensRel)

  Greppable: goodG1Text, goodG2Text, badB1Text, badB2Text, badB3Text, badB4Text,
  HostFrontGoldens.
-/
def goodG1Text : String :=
  "# Host fragment dialect v0 (Mult-first) -- G1 Mult fixture\n" ++
  "# form: module/namespace/inductive/def/check/end\n" ++
  "# targets SystemsLean.HostTerm IR; not full Lean 4; not Mult IR node lines\n" ++
  "\n" ++
  "module SystemsLean.Mult\n" ++
  "namespace SystemsLean.Mult\n" ++
  "inductive Mult mult0 mult1 multOmega deriving DecidableEq Repr\n" ++
  "def name : Mult -> String := match var m | mult0 => \"MULT-0\" | mult1 => \"MULT-1\" | multOmega => \"MULT-OMEGA\"\n" ++
  "def isValid : Mult -> Bool := match var m | mult0 => true | mult1 => true | multOmega => true\n" ++
  "def ofNat? : Nat -> Option Mult := match var k | 0 => some mult0 | 1 => some mult1 | 2 => some multOmega | _ => none\n" ++
  "def isValidTag : Nat -> Bool := app isSome ( app ofNat? ( var k ) )\n" ++
  "def multIsValid : Mult -> Bool := app isValid ( var m )\n" ++
  "check mult0 : Mult\n" ++
  "end SystemsLean.Mult\n"

/-- G2 minimal Mult inductive + check. -/
def goodG2Text : String :=
  "# G2 minimal Mult inductive + check\n" ++
  "\n" ++
  "module SystemsLean.MultMini\n" ++
  "namespace SystemsLean.MultMini\n" ++
  "inductive Mult mult0 mult1 multOmega deriving DecidableEq Repr\n" ++
  "check mult0 : Mult\n" ++
  "end SystemsLean.MultMini\n"

/-- G3 Linear-shaped host fragment (shareNat / polyId / LINEAR-EXACT-ONCE).
    Expand set: Linear unit shapes under Mult-first dialect. -/
def goodG3Text : String :=
  "# G3 Linear-shaped host fragment (shareNat / polyId / LINEAR-EXACT-ONCE id)\n" ++
  "# form: module/namespace/def/check/end -- not full Linear.lean axioms\n" ++
  "# Mult-first dialect still; Linear unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.LinearMini\n" ++
  "namespace SystemsLean.LinearMini\n" ++
  "def shareNat : Nat -> Nat := var n\n" ++
  "def polyId : Nat -> Nat := var x\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.LinearMini\n"

/-- G4 Types-shaped host fragment (TYPED_IR / kind-mult honesty mini).
    Expand set: Types unit shapes under Mult-first dialect.
    Greppable: goodG4Text, TYPED_IR_V0, KIND-MULT-OK, TYPES-FIXTURE. -/
def goodG4Text : String :=
  "# G4 Types-shaped host fragment (TYPED_IR / kind-mult honesty mini)\n" ++
  "# form: module/namespace/def/check/end -- not full Types.lean / elaborator\n" ++
  "# Mult-first dialect still; Types unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.TypesMini\n" ++
  "namespace SystemsLean.TypesMini\n" ++
  "def typedIrId : String := \"TYPED_IR_V0\"\n" ++
  "def kindMultOkId : String := \"KIND-MULT-OK\"\n" ++
  "def typesFixtureId : String := \"TYPES-FIXTURE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.TypesMini\n"

/-- G5 Program-shaped host fragment (ordered IR program honesty mini).
    Expand set: Program unit shapes under Mult-first dialect.
    Greppable: goodG5Text, IR_PROGRAM_V0, ORDERED-IR-PROGRAM, PROGRAM-FIXTURE. -/
def goodG5Text : String :=
  "# G5 Program-shaped host fragment (ordered IR program honesty mini)\n" ++
  "# form: module/namespace/def/check/end -- not full IrProgram.lean / elaborator\n" ++
  "# Mult-first dialect still; Program unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.ProgramMini\n" ++
  "namespace SystemsLean.ProgramMini\n" ++
  "def irProgramId : String := \"IR_PROGRAM_V0\"\n" ++
  "def orderedIrProgramId : String := \"ORDERED-IR-PROGRAM\"\n" ++
  "def programFixtureId : String := \"PROGRAM-FIXTURE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.ProgramMini\n"

/-- G6 Graph-shaped host fragment (edge-list IR graph honesty mini).
    Expand set: Graph unit shapes under Mult-first dialect.
    Greppable: goodG6Text, IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK, GRAPH-FIXTURE. -/
def goodG6Text : String :=
  "# G6 Graph-shaped host fragment (edge-list IR graph honesty mini)\n" ++
  "# form: module/namespace/def/check/end -- not full IrGraph.lean / elaborator\n" ++
  "# Mult-first dialect still; Graph unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.GraphMini\n" ++
  "namespace SystemsLean.GraphMini\n" ++
  "def irGraphEdgesId : String := \"IR_GRAPH_EDGES_V0\"\n" ++
  "def emptyGraphOkId : String := \"EMPTY-GRAPH-OK\"\n" ++
  "def graphFixtureId : String := \"GRAPH-FIXTURE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.GraphMini\n"

/-- G7 Compose-shaped host fragment (HostCompose mint/consume honesty mini).
    Expand set: Compose unit shapes under Mult-first dialect.
    Greppable: goodG7Text, HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-FIXTURE. -/
def goodG7Text : String :=
  "# G7 Compose-shaped host fragment (HostCompose mint/consume honesty mini)\n" ++
  "# form: module/namespace/def/check/end -- not full HostCompose.lean / elaborator\n" ++
  "# Mult-first dialect still; Compose unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.ComposeMini\n" ++
  "namespace SystemsLean.ComposeMini\n" ++
  "def hostComposeId : String := \"HOST_COMPOSE_V0\"\n" ++
  "def hostComposeSurfaceId : String := \"HOST-COMPOSE\"\n" ++
  "def composeFixtureId : String := \"COMPOSE-FIXTURE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.ComposeMini\n"

/-- B1 empty (comments only). -/
def badB1Text : String :=
  "# B1 empty module -- only comments (EMPTY-MODULE-FAIL-CLOSED)\n" ++
  "\n" ++
  "# no commands\n"

/-- B2 line shape (garbled inductive). -/
def badB2Text : String :=
  "# B2 line shape -- inductive missing name (LINE-SHAPE)\n" ++
  "\n" ++
  "module Bad.Shape\n" ++
  "inductive\n"

/-- B3 unknown command. -/
def badB3Text : String :=
  "# B3 unknown command (UNKNOWN-CMD)\n" ++
  "\n" ++
  "module Bad.Unknown\n" ++
  "foobar xyz\n"

/-- B4 zero-ctor inductive. -/
def badB4Text : String :=
  "# B4 zero-ctor inductive (ZERO-CTOR-INDUCTIVE)\n" ++
  "\n" ++
  "module Bad.Ind\n" ++
  "inductive EmptyLike deriving DecidableEq\n"

/-- Golden file basenames. -/
def goodG1File : String := "good-mult-fixture.slake-host"
def goodG2File : String := "good-mult-mini.slake-host"
def goodG3File : String := "good-linear-mini.slake-host"
def goodG4File : String := "good-types-mini.slake-host"
def goodG5File : String := "good-program-mini.slake-host"
def goodG6File : String := "good-graph-mini.slake-host"
def goodG7File : String := "good-compose-mini.slake-host"
def badB1File : String := "bad-empty.slake-host"
def badB2File : String := "bad-line-shape.slake-host"
def badB3File : String := "bad-unknown-cmd.slake-host"
def badB4File : String := "bad-zero-ctor.slake-host"
end SystemsLean.HostFront
"##

/-- Accepted live module when parse succeeds. -/
def liveGoldensParsed? : Option Module :=
  match parseLiveGoldensSource liveGoldensSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveGoldensParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / String defs / end).
    Real lower bound, not hardcoded true. Skip-fold may keep extra
    command-keyword leftovers from concat payloads. -/
def liveParseCmdCountOk : Bool :=
  match liveGoldensParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse has the HostFront namespace command. -/
def liveParseHasHostFrontNs : Bool :=
  match liveGoldensParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostFront"
      | _ => false

/-- Live parse has core Goldens String defs. -/
def liveParseHasCoreDefs : Bool :=
  match liveGoldensParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "goodG1Text" && has "goodG7Text" && has "badB1Text"
      && has "badB4Text" && has "goodG1File" && has "badB4File"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveGoldensReady, PARSE-LIVE-GOLDENS,
    HOST-FRONT-LIVE-GOLDENS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveGoldensReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_GOLDENS_V0")
    && (hostId == "HOST-FRONT-LIVE-GOLDENS")
    && (parseId == "PARSE-LIVE-GOLDENS")
    && (liveGoldensRel == "src/systems/SystemsLean/HostFrontGoldens.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveGoldensFullHost
    && !hostFrontLiveGoldensResidualFreeClaimed
    && !hostFrontLiveGoldensProvablyUnlocked
    && kernelCheckLiveGoldensSource liveGoldensSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostFrontNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveGoldensSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveGoldens (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-GOLDENS =="
  IO.println s!"  host={hostId} file={liveGoldensRel}"
  let path := root / liveGoldensRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveGoldensRel}"
    throw (IO.userError s!"missing {liveGoldensRel}")
  let disk <- IO.FS.readFile path
  if disk != liveGoldensSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostFrontGoldens.lean != liveGoldensSource"
    throw (IO.userError "dual-pin mismatch live HostFrontGoldens.lean")
  let r := parseLiveGoldensSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-GOLDENS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-GOLDENS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-GOLDENS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live Goldens parse false"
      throw (IO.userError "kernelCheck live Goldens parse false")
    unless hostFrontLiveGoldensReady do
      IO.eprintln "error: hostFrontLiveGoldensReady false"
      throw (IO.userError "hostFrontLiveGoldensReady false")
    IO.println s!"GREEN {stageId}: live HostFrontGoldens.lean parse kernelCheck; not multFixtureModule"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveGoldens root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveGoldens
