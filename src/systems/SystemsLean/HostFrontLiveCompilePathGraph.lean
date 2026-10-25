/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CompilePathGraph.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathGraph. parseSource keep of
  CompilePathGraph.lean, module name SystemsLean.CompilePathGraph.
  Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses CompilePathGraph.lean only.
  Unique needles use trailing newline so HostFrontLiveCompilePathGraph is not a
  prefix hit on HostFrontLiveCompilePathGraphSource or a Theorems peel.
  Occupancy leftover HostModuleCheckCompilePathGraphTerm is not this wrap.
  Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not HostFrontLiveCompilePath (that wrap parses CompilePath.lean).
  Not HostFrontLiveCompilePathProgram (that wrap parses CompilePathProgram.lean).
  Not HostFrontLiveCompilePathTypes (that wrap parses CompilePathTypes.lean).

  Spec (readable):
  - parseLiveCompilePathGraphSource is HostFront.parseSource of live
    CompilePathGraph.lean text, then keep/register the module name
    SystemsLean.CompilePathGraph. parseSource is what --slake-check
    reads (walkKept keep, not a skip-fold of this module).
  - Module name is SystemsLean.CompilePathGraph even without a module line.
  - kernelCheckLiveCompilePathGraphSource is HostKernel.kernelCheck of
    that parse.
  - hostFrontParseSourceCompilePathGraph is parseSource keep of the
    frozen bytes, renamed to SystemsLean.CompilePathGraph.
  - Do not skip-fold CompilePathGraph away from --slake-check.
  - Living namespace lastSeg is CompilePath.
  - Wrap-assigned module lastSeg is CompilePathGraph.
  - liveRel is CompilePathGraph.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not occupancy leftover Term wrap.

  Unique needles (trailing newline so HostFrontLiveCompilePathGraph is not a prefix):
  HostFrontLiveCompilePathGraph
  PARSE-LIVE-COMPILE-PATH-GRAPH
  HOST-FRONT-LIVE-COMPILE-PATH-GRAPH
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_GRAPH_V0
  COMPILE-PATH-GRAPH

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveCompilePathGraphSource,
  kernelCheckLiveCompilePathGraphSource,
  hostFrontLiveCompilePathGraphReady, liveCompilePathGraphSource,
  liveCompilePathGraphRel, liveRel, hostFrontParseSourceCompilePathGraph,
  UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture,
  graphFixtureMintId, graphFixtureGraphReady, graphFixtureProgramReady,
  graphFixtureGraphReady_true, GRAPH-FIXTURE.
  Module: SystemsLean.HostFrontLiveCompilePathGraph
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveCompilePathGraph on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathGraphSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCompilePathGraph

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILE-PATH-GRAPH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-COMPILE-PATH-GRAPH"

/-- Live file basename. Not a path. -/
def liveRel : String := "CompilePathGraph.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathGraphRel : String :=
  "src/systems/SystemsLean/CompilePathGraph.lean"

/-- HostFront.parseSource is what --slake-check reads (walkKept keep).
    Not a skip-fold of CompilePathGraph. Name register is
    parseLiveCompilePathGraphSource (SystemsLean.CompilePathGraph). -/
def hostFrontParseSourceCompilePathGraph : Bool :=
  match parseSource liveCompilePathGraphSource with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathGraphFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathGraphResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompilePathGraphProvablyUnlocked : Bool := false

/-- Graph-shape typed keep. Same forms HostKernel.slakeChecker accepts
    on CompilePathGraph (acceptKeptGraph / graphKeepToy): mint Nat 8,
    Bool honesty pair, decide theorem. Not a new mint ident.
    Greppable: graphFixtureMintId, GRAPH-FIXTURE. -/
def graphFixtureMintId : Nat := 8

/-- Graph fixture IR-graph bar pin. Typed keep, not := residual free. -/
def graphFixtureGraphReady : Bool := true

/-- Graph fixture ordered-IR bar pin. Honesty pair with GraphReady. -/
def graphFixtureProgramReady : Bool := true

/-- Graph fixture decide theorem. native_decide is not decide.
    Greppable: graphFixtureGraphReady_true, GRAPH-FIXTURE. -/
theorem graphFixtureGraphReady_true : graphFixtureGraphReady = true := by decide

/-- Parse fuel (command fold). -/
def liveCompilePathGraphParseFuel : Nat := 256

/-- Fuel for token walks (def names in live text). -/
def liveCompilePathGraphSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsCppN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsCppN n nest false false ('\n' :: acc) rest
        else
          stripCommentsCppN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsCppN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsCppN n nest false false ('"' :: acc) rest
        else
          stripCommentsCppN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsCppN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsCppN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsCppN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsCppN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsCppN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsCppN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsCppN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsCppN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live CompilePathGraph.lean bytes. -/
def stripCommentsCpp (src : String) : String :=
  String.ofList (stripCommentsCppN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . CompilePathGraph`. -/
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

/-- If rest is not a command start, skip to the next command. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Reject field proj the kernel cannot type (keep isEmpty / isSome / length). -/
def termNoBadProjN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.app f a => termNoBadProjN n f && termNoBadProjN n a
  | Nat.succ n, Term.some_ t => termNoBadProjN n t
  | Nat.succ n, Term.ite c t e =>
      termNoBadProjN n c && termNoBadProjN n t && termNoBadProjN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoBadProjN n a && termNoBadProjN n b
  | Nat.succ n, Term.proj o f =>
      (f.raw == "isEmpty" || f.raw == "isSome" || f.raw == "length")
        && termNoBadProjN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoBadProjN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Names a command adds to the known-const set. -/
def cmdAddsCompilePathGraph (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat is an untyped app.
    Kernel cannot apply String. Skip any Term.app. -/
def termNoAppN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ n, Term.some_ t => termNoAppN n t
  | Nat.succ n, Term.ite c t e =>
      termNoAppN n c && termNoAppN n t && termNoAppN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoAppN n a && termNoAppN n b
  | Nat.succ n, Term.proj o _ => termNoAppN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoAppN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Atom bodies the kernel can type without && / ++ / struct / ite. -/
def termIsKernelAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- UInt32 / IO / Int types poison kernelCheck. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownCompilePathGraph (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathGraphParseFuel body
        && termNoAppN liveCompilePathGraphParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathGraphParseFuel body
        && termNoAppN liveCompilePathGraphParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app.
    Compound && / == bodies fail closed. parseLive uses parseSource keep. -/
def parseDefCompilePathGraph (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
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
          match parseHostTypeAllHt tyToks with
          | none => none
          | some retTy =>
            let ty := addBinderArrows bs retTy
            let bnames := bs.map (fun p => p.fst)
            let dn := HostTerm.n dname
            match parseAtomHt liveHostTermParseFuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              match rest4 with
              | [] =>
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, [])
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, [])
              | t :: _ =>
                if isCmdKw t then
                  let rest5 := skipNonCmd liveCompilePathGraphSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means the caller advances. import / namespace /
    end / def. parseLiveCompilePathGraphSource uses parseSource keep. -/
def parseOneCmdCompilePathGraph (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "import" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.importModule (HostTerm.n nm), rest2)
    | none => none
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.namespace (HostTerm.n nm), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.endNamespace (HostTerm.n nm), rest2)
    | none => none
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefCompilePathGraph fuel dname rest2
    | none => none
  | _ => none

/-- Token walk: live text has `def` named `nm`. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live CompilePathGraph.lean text.
    HostFront.parseSource is the keep path --slake-check reads.
    Keep/register names SystemsLean.CompilePathGraph.
    Greppable: parseLiveCompilePathGraphSource,
    PARSE-LIVE-COMPILE-PATH-GRAPH. -/
def parseLiveCompilePathGraphSource (src : String) : FrontResult :=
  if src.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseSource src with
    | FrontResult.reject r => FrontResult.reject r
    | FrontResult.accept m =>
      let kept : Module :=
        { name := HostTerm.n "SystemsLean.CompilePathGraph"
          commands := m.commands }
      if isWellFormed kept then FrontResult.accept kept
      else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePathGraph parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveCompilePathGraphSource,
    PARSE-LIVE-COMPILE-PATH-GRAPH. -/
def kernelCheckLiveCompilePathGraphSource (src : String) : Bool :=
  match parseLiveCompilePathGraphSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathGraphParsed? : Option Module :=
  match parseLiveCompilePathGraphSource liveCompilePathGraphSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathGraphParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=12: two dotted imports, namespace, eight kernelable
    Nat/Bool atoms, end. Do not copy a 28 bound. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathGraphParsed? with
  | some m => m.commands.length >= 12
  | none => false

/-- Wrap module lastSeg is CompilePathGraph (no module line in the live file). -/
def liveParseHasCompilePathGraphModule : Bool :=
  match liveCompilePathGraphParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CompilePathGraph"

/-- Live parse has the living CompilePath namespace command. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompilePath"
      | _ => false

/-- Live product imports SystemsLean.EmitGraph. Types-style: dotted import kept. -/
def liveParseHasEmitGraphImport : Bool :=
  match liveCompilePathGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitGraph"
      | _ => false

/-- Defs unique to CompilePathGraph.lean (not CompilePath.lean
    and not occupancy Term string payloads). Greppable: graphFixtureMintId,
    graphFixtureTagErased. -/
def liveParseHasCoreDefs : Bool :=
  match liveCompilePathGraphParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsCpp liveCompilePathGraphSource)
    toksHaveDefNamed liveCompilePathGraphSkipFuel toks
      "graphFixtureMintId"
      && toksHaveDefNamed liveCompilePathGraphSkipFuel toks
        "graphFixtureTagErased"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathGraphReady,
    PARSE-LIVE-COMPILE-PATH-GRAPH,
    HOST-FRONT-LIVE-COMPILE-PATH-GRAPH.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompilePathGraphReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_GRAPH_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILE-PATH-GRAPH")
    && (parseId == "PARSE-LIVE-COMPILE-PATH-GRAPH")
    && (liveCompilePathGraphRel
      == "src/systems/SystemsLean/CompilePathGraph.lean")
    && (liveRel == "CompilePathGraph.lean")
    && hostFrontParseSourceCompilePathGraph
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathGraphFullHost
    && !hostFrontLiveCompilePathGraphResidualFreeClaimed
    && !hostFrontLiveCompilePathGraphProvablyUnlocked
    && kernelCheckLiveCompilePathGraphSource liveCompilePathGraphSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCompilePathGraphModule
    && liveParseHasCompilePathNs
    && liveParseHasEmitGraphImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathGraphSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompilePathGraph (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILE-PATH-GRAPH =="
  IO.println s!"  host={hostId} file={liveCompilePathGraphRel}"
  let path := root / liveCompilePathGraphRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathGraphRel}"
    throw (IO.userError s!"missing {liveCompilePathGraphRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompilePathGraphSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePathGraph.lean != liveCompilePathGraphSource"
    throw (IO.userError "dual-pin mismatch live CompilePathGraph.lean")
  let r := parseLiveCompilePathGraphSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILE-PATH-GRAPH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILE-PATH-GRAPH reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPILE-PATH-GRAPH ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePathGraph parse false"
      throw (IO.userError "kernelCheck live CompilePathGraph parse false")
    unless hostFrontLiveCompilePathGraphReady do
      IO.eprintln "error: hostFrontLiveCompilePathGraphReady false"
      throw (IO.userError "hostFrontLiveCompilePathGraphReady false")
    IO.println s!"GREEN {stageId}: live CompilePathGraph.lean parse kernelCheck; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePathGraph root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePathGraph
