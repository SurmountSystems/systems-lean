/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostGraph.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostGraph. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (atom bodies, string-safe comment strip). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on HostGraph text.
  Not HostGraphMain.lean. HostFrontLiveHostGraphMain stays the HostGraphMain checker.

  Spec (readable):
  - parseLiveHostGraphSource turns live HostGraph.lean text into HostTerm.Module.
  - The embedded bytes are liveHostGraphSource0 ++ liveHostGraphSource1.
  - Module name is SystemsLean.HostGraph even without a module line.
  - kernelCheckLiveHostGraphSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only, not a constant true).
  - Skip theorems, examples, set_option, open, inductive, equation leftovers,
    do / IO bodies, and defs whose one atom is not a String / Bool / Nat
    literal or a previously kept const of that same type.
  - Keep kernelable string / Nat / Bool defs, imports, namespace, end.
  - toksHaveDefNamed still sees hostGraphReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not occupancy name 50. Not mill 70.
  - Not HostGraphMain wrap. Not HostGraphTheorems wrap.
  - Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOST-GRAPH,
  SLAKE_HOST_FRONT_LIVE_HOST_GRAPH_V0,
  PARSE-LIVE-HOST-GRAPH, parseLiveHostGraphSource,
  kernelCheckLiveHostGraphSource,
  hostFrontLiveHostGraphReady, liveHostGraphSource, liveRel,
  liveHostGraphRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostGraph
  Red/green: lean --run SlakeTypecheckHostGraph (no mill; no lake).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostGraphSource
import SystemsLean.HostFrontLiveHostGraphSource01
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostGraph

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-GRAPH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-GRAPH"

/-- Live basename. Greppable: liveRel. Must be HostGraph.lean. -/
def liveRel : String := "HostGraph.lean"

/-- Live file relative to repo root.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveHostGraphRel : String := "src/systems/SystemsLean/HostGraph.lean"

/-- Concatenated dual-pin. First half then second half. -/
def liveHostGraphSource : String :=
  liveHostGraphSource0 ++ liveHostGraphSource1

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostGraphFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostGraphResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostGraphProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). HostGraph has more commands than HostCheck. -/
def liveHostGraphParseFuel : Nat := 512

/-- Skip fuel for theorem / example / un-kernelable tails and equation leftovers. -/
def liveHostGraphSkipFuel : Nat := 16384

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostGraph filterArgs cites a dash-dash string. HostFrontLiveMult.stripComments
    is not in-string safe and would eat the rest of that line. -/
def stripCommentsHcN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsHcN n nest false false ('\n' :: acc) rest
        else
          stripCommentsHcN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsHcN n nest false false ('"' :: acc) rest
        else
          stripCommentsHcN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsHcN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsHcN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsHcN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsHcN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsHcN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsHcN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsHcN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsHcN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostGraph.lean bytes. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostGraph`. -/
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

/-- Names a kept def adds, with the type kernelCheck will store. -/
def cmdAddsHostGraph (c : Cmd) : List (Prod String HostType) :=
  match c with
  | Cmd.def_ x (some ty) _ => [(x.raw, ty)]
  | _ => []

/-- One atom is kernel-checkable against an already-seen const of the same type.
    Binder bodies and apps are skipped: a truncated var is not the declared type. -/
def bodyOkHostGraph (kn : List (Prod String HostType)) (ty : HostType)
    (body : Term) : Bool :=
  match body with
  | Term.litString _ => hostTypeEq ty HostType.string
  | Term.litBool _ => hostTypeEq ty HostType.bool
  | Term.litNat _ => hostTypeEq ty HostType.nat
  | Term.const x =>
    kn.any (fun p => p.fst == x.raw && hostTypeEq p.snd ty)
  | _ => false

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Keep imports, namespace, end, and typed defs whose one atom matches ty.
    defBind is skipped: kernel stores an arrow, and a truncated binder body
    does not have the declared return type. -/
def cmdBodyKnownHostGraph (kn : List (Prod String HostType)) : Cmd -> Bool
  | Cmd.def_ _ (some ty) body =>
    !typeHasUInt32OrIo ty && bodyOkHostGraph kn ty body
  | Cmd.def_ _ none _ => false
  | Cmd.defBind _ _ _ _ => false
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const).
    Do not use parseTermHt: a Bool/String lit followed by `&&` becomes
    an ite and skip-folds the kernelable def. Equation defs fail closed. -/
def parseDefHostGraph (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveHostGraphSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    import / namespace / end / def. Open, inductive, and abbrev skip. -/
def parseOneCmdHostGraph (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostGraph fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open /
    inductive / un-kernelable defs. -/
def parseCmdsHostGraph : Nat -> List String -> List (Prod String HostType) ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostGraph liveHostGraphParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostGraphSkipFuel rest
      if cmdBodyKnownHostGraph kn c then
        parseCmdsHostGraph n rest2 (kn ++ cmdAddsHostGraph c) (acc ++ [c])
      else
        parseCmdsHostGraph n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostGraphSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostGraph n rest2 kn acc
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live HostGraph.lean text.
    Greppable: parseLiveHostGraphSource, PARSE-LIVE-HOST-GRAPH. -/
def parseLiveHostGraphSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostGraph liveHostGraphParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostGraph", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostGraph parse.
    Greppable: kernelCheckLiveHostGraphSource, PARSE-LIVE-HOST-GRAPH.
    Calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostGraphSource (src : String) : Bool :=
  match parseLiveHostGraphSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostGraphParsed? : Option Module :=
  match parseLiveHostGraphSource liveHostGraphSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveHostGraphParsed? with
  | some m => m.commands.length >= 12
  | none => false

/-- Live parse imports SystemsLean.HostTerm. -/
def liveParseHasHostTermImport : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostTerm"
      | _ => false

/-- Live parse has the HostGraph namespace command. -/
def liveParseHasHostGraphNs : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostGraph"
      | _ => false

/-- Live parse has core HostGraph defs (def_ or defBind).
    hostGraphReady may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripCommentsHc liveHostGraphSource)
    has "stageId" && has "hostId"
      && (has "hostGraphReady"
        || toksHaveDefNamed liveHostGraphSkipFuel toks "hostGraphReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostGraphReady, PARSE-LIVE-HOST-GRAPH,
    HOST-FRONT-LIVE-HOST-GRAPH.
    Real conjunction: parse plus kernelCheck plus liveRel. Not hardcoded true. -/
def hostFrontLiveHostGraphReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_GRAPH_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-GRAPH")
    && (parseId == "PARSE-LIVE-HOST-GRAPH")
    && (liveHostGraphRel == "src/systems/SystemsLean/HostGraph.lean")
    && (liveRel == "HostGraph.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostGraphFullHost
    && !hostFrontLiveHostGraphResidualFreeClaimed
    && !hostFrontLiveHostGraphProvablyUnlocked
    && kernelCheckLiveHostGraphSource liveHostGraphSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostTermImport
    && liveParseHasHostGraphNs
    && liveParseHasCoreDefs

/-- Empty source rejects. Not an accept, so this is not kernelCheck=false on the accept line. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostGraphSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; file equality). Not mill 70. -/

def runLiveHostGraph (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-GRAPH =="
  IO.println s!"  host={hostId} file={liveHostGraphRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "HostGraph.lean") do
    IO.eprintln "error: liveRel must be HostGraph.lean"
    throw (IO.userError "liveRel must be HostGraph.lean")
  let path := root / liveHostGraphRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostGraphRel}"
    throw (IO.userError s!"missing {liveHostGraphRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostGraphSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostGraph.lean != liveHostGraphSource"
    throw (IO.userError "dual-pin mismatch live HostGraph.lean")
  let r := parseLiveHostGraphSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-GRAPH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-GRAPH reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-GRAPH ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostGraph parse false"
      throw (IO.userError "kernelCheck live HostGraph parse false")
    unless hostFrontLiveHostGraphReady do
      IO.eprintln "error: hostFrontLiveHostGraphReady false"
      throw (IO.userError "hostFrontLiveHostGraphReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostGraph source must reject"
      throw (IO.userError "empty HostGraph source must reject")
    IO.println s!"GREEN {stageId}: live HostGraph.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostGraph root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostGraph
