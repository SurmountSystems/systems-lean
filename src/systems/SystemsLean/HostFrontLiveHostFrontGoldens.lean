/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostFrontGoldens.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostFrontGoldens. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (atom bodies, string-safe comment strip).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostFrontGoldens text.
  Not HostFront.lean. HostFrontLiveHostFront stays the HostFront checker.
  Not HostFrontMain.lean.

  Spec (readable):
  - parseLiveHostFrontGoldensSource turns live HostFrontGoldens.lean text
    into HostTerm.Module.
  - One embedded copy: liveHostFrontGoldensSource. Not split.
  - Module name is SystemsLean.HostFront even without a module line.
  - kernelCheckLiveHostFrontGoldensSource is HostKernel.kernelCheck of that
    parse (not kernelCheckN import-seed only, not a constant true).
  - Skip theorems, examples, set_option, open, inductive, equation leftovers,
    do / IO bodies, and defs whose one atom is not a String / Bool / Nat
    literal or a previously kept const of that same type.
  - String concat (`++`) is not a token. The first string atom is the body.
    Later string pieces are skip-folded. Dash-dash inside a string stays.
  - Keep kernelable string / Nat / Bool defs, namespace, end.
  - toksHaveDefNamed still sees goodG1Text when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not occupancy name 50. Not mill 70.
  - Not HostFront wrap. Not HostFrontMain wrap. Not HostFrontTheorems wrap.
  - Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOST-FRONT-GOLDENS,
  SLAKE_HOST_FRONT_LIVE_HOST_FRONT_GOLDENS_V0,
  PARSE-LIVE-HOST-FRONT-GOLDENS, parseLiveHostFrontGoldensSource,
  kernelCheckLiveHostFrontGoldensSource,
  hostFrontLiveHostFrontGoldensReady, liveHostFrontGoldensSource, liveRel,
  liveHostFrontGoldensRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostFrontGoldens
  Red/green: lean --run SlakeTypecheckHostFrontGoldens (no mill; no lake).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostFrontGoldensSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostFrontGoldens

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_FRONT_GOLDENS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-FRONT-GOLDENS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-FRONT-GOLDENS"

/-- Live basename. Greppable: liveRel. Must be HostFrontGoldens.lean. -/
def liveRel : String := "HostFrontGoldens.lean"

/-- Live file relative to repo root.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveHostFrontGoldensRel : String := "src/systems/SystemsLean/HostFrontGoldens.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostFrontGoldensFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostFrontGoldensResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostFrontGoldensProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostFrontGoldensParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and equation leftovers. -/
def liveHostFrontGoldensSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostFrontGoldens golden texts cite dash-dash inside quotes.
    HostFrontLiveMult.stripComments is not in-string safe and would eat the
    rest of that line. -/
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

/-- String-safe comment strip for live HostFrontGoldens.lean bytes. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

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

/-- Names a kept def adds, with the type kernelCheck will store. -/
def cmdAddsHostFrontGoldens (c : Cmd) : List (Prod String HostType) :=
  match c with
  | Cmd.def_ x (some ty) _ => [(x.raw, ty)]
  | _ => []

/-- One atom is kernel-checkable against an already-seen const of the same type.
    Binder bodies and apps are skipped: a truncated var is not the declared type. -/
def bodyOkHostFrontGoldens (kn : List (Prod String HostType)) (ty : HostType)
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

/-- Keep namespace, end, and typed defs whose one atom matches ty.
    defBind is skipped: kernel stores an arrow, and a truncated binder body
    does not have the declared return type. -/
def cmdBodyKnownHostFrontGoldens (kn : List (Prod String HostType)) : Cmd -> Bool
  | Cmd.def_ _ (some ty) body =>
    !typeHasUInt32OrIo ty && bodyOkHostFrontGoldens kn ty body
  | Cmd.def_ _ none _ => false
  | Cmd.defBind _ _ _ _ => false
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const).
    Do not use parseTermHt: a String lit followed by another string (the
    `++` pieces) must not become an app. Equation defs fail closed. -/
def parseDefHostFrontGoldens (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveHostFrontGoldensSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    namespace / end / def. This file has no import. Open and inductive skip. -/
def parseOneCmdHostFrontGoldens (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostFrontGoldens fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open /
    inductive / un-kernelable defs. -/
def parseCmdsHostFrontGoldens : Nat -> List String -> List (Prod String HostType) ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostFrontGoldens liveHostFrontGoldensParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostFrontGoldensSkipFuel rest
      if cmdBodyKnownHostFrontGoldens kn c then
        parseCmdsHostFrontGoldens n rest2 (kn ++ cmdAddsHostFrontGoldens c) (acc ++ [c])
      else
        parseCmdsHostFrontGoldens n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostFrontGoldensSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostFrontGoldens n rest2 kn acc
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

/-- Parse live HostFrontGoldens.lean text.
    Greppable: parseLiveHostFrontGoldensSource, PARSE-LIVE-HOST-FRONT-GOLDENS. -/
def parseLiveHostFrontGoldensSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostFrontGoldens liveHostFrontGoldensParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostFront", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostFrontGoldens parse.
    Greppable: kernelCheckLiveHostFrontGoldensSource,
    PARSE-LIVE-HOST-FRONT-GOLDENS.
    Calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostFrontGoldensSource (src : String) : Bool :=
  match parseLiveHostFrontGoldensSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostFrontGoldensParsed? : Option Module :=
  match parseLiveHostFrontGoldensSource liveHostFrontGoldensSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostFrontGoldensParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveHostFrontGoldensParsed? with
  | some m => m.commands.length >= 12
  | none => false

/-- Live parse has the HostFront namespace command. -/
def liveParseHasHostFrontNs : Bool :=
  match liveHostFrontGoldensParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostFront"
      | _ => false

/-- Live parse has core HostFrontGoldens defs (def_ or defBind).
    goodG1Text may be skip-folded; toksHaveDefNamed still sees the head.
    goodG1File and badB4File are single string literals and stay. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostFrontGoldensParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripCommentsHc liveHostFrontGoldensSource)
    has "goodG1File" && has "badB4File"
      && (has "goodG1Text"
        || toksHaveDefNamed liveHostFrontGoldensSkipFuel toks "goodG1Text")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostFrontGoldensReady,
    PARSE-LIVE-HOST-FRONT-GOLDENS, HOST-FRONT-LIVE-HOST-FRONT-GOLDENS.
    Real conjunction: parse plus kernelCheck plus liveRel. Not hardcoded true. -/
def hostFrontLiveHostFrontGoldensReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_FRONT_GOLDENS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-FRONT-GOLDENS")
    && (parseId == "PARSE-LIVE-HOST-FRONT-GOLDENS")
    && (liveHostFrontGoldensRel == "src/systems/SystemsLean/HostFrontGoldens.lean")
    && (liveRel == "HostFrontGoldens.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostFrontGoldensFullHost
    && !hostFrontLiveHostFrontGoldensResidualFreeClaimed
    && !hostFrontLiveHostFrontGoldensProvablyUnlocked
    && kernelCheckLiveHostFrontGoldensSource liveHostFrontGoldensSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostFrontNs
    && liveParseHasCoreDefs

/-- Empty source rejects. Not an accept, so this is not kernelCheck=false
    on the accept line. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostFrontGoldensSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; file equality). Not mill 70. -/

def runLiveHostFrontGoldens (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-FRONT-GOLDENS =="
  IO.println s!"  host={hostId} file={liveHostFrontGoldensRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "HostFrontGoldens.lean") do
    IO.eprintln "error: liveRel must be HostFrontGoldens.lean"
    throw (IO.userError "liveRel must be HostFrontGoldens.lean")
  let path := root / liveHostFrontGoldensRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostFrontGoldensRel}"
    throw (IO.userError s!"missing {liveHostFrontGoldensRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostFrontGoldensSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostFrontGoldens.lean != liveHostFrontGoldensSource"
    throw (IO.userError "dual-pin mismatch live HostFrontGoldens.lean")
  let r := parseLiveHostFrontGoldensSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-FRONT-GOLDENS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-FRONT-GOLDENS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-FRONT-GOLDENS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostFrontGoldens parse false"
      throw (IO.userError "kernelCheck live HostFrontGoldens parse false")
    unless hostFrontLiveHostFrontGoldensReady do
      IO.eprintln "error: hostFrontLiveHostFrontGoldensReady false"
      throw (IO.userError "hostFrontLiveHostFrontGoldensReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostFrontGoldens source must reject"
      throw (IO.userError "empty HostFrontGoldens source must reject")
    IO.println s!"GREEN {stageId}: live HostFrontGoldens.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostFrontGoldens root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostFrontGoldens
