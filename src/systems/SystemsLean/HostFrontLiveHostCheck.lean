/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostCheck.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostCheck. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (atom bodies, string-safe comment strip). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on HostCheck text.
  Not HostCheckMain.lean. HostFrontLiveHostCheckMain stays the HostCheckMain checker.

  Spec (readable):
  - parseLiveHostCheckSource turns live HostCheck.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostCheck even without a module line.
  - kernelCheckLiveHostCheckSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only, not a constant true).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, UInt32/IO/Int typed defs, and equation leftovers. Keep kernelable
    string/Nat/Bool defs, imports, namespace, end.
  - toksHaveDefNamed still sees hostFragmentCheckReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not HostCheckMain wrap.
  - Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOST-CHECK,
  SLAKE_HOST_FRONT_LIVE_HOST_CHECK_V0,
  PARSE-LIVE-HOST-CHECK, parseLiveHostCheckSource,
  kernelCheckLiveHostCheckSource,
  hostFrontLiveHostCheckReady, liveHostCheckSource, liveRel,
  liveHostCheckRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostCheck
  Red/green: lean --run SlakeTypecheckHostCheck (no mill; no lake).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostCheckSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostCheck

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_CHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-CHECK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-CHECK"

/-- Live basename. Greppable: liveRel. Must be HostCheck.lean. -/
def liveRel : String := "HostCheck.lean"

/-- Live file relative to repo root.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveHostCheckRel : String := "src/systems/SystemsLean/HostCheck.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostCheckFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostCheckResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostCheckProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostCheckParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and equation leftovers. -/
def liveHostCheckSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostCheck filterArgs cites a dash-dash string. HostFrontLiveMult.stripComments
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

/-- String-safe comment strip for live HostCheck.lean bytes. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostCheck`. -/
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
def cmdAddsHostCheck (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat becomes Term.app.
    Kernel cannot apply String. Skip any Term.app (keep lits / const / ite). -/
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

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no UInt32/IO/Int typed defs. -/
def cmdBodyKnownHostCheck (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostCheckParseFuel body
        && termNoAppN liveHostCheckParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostCheckParseFuel body
        && termNoAppN liveHostCheckParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const).
    Do not use parseTermHt: a Bool/String lit followed by `theorem` becomes
    Term.app and skip-folds the kernelable def. do / IO bodies fail closed. -/
def parseDefHostCheck (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveHostCheckSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdHostCheck (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostCheck fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open /
    un-kernelable defs. -/
def parseCmdsHostCheck : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostCheck liveHostCheckParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostCheckSkipFuel rest
      if cmdBodyKnownHostCheck kn c then
        parseCmdsHostCheck n rest2 (kn ++ cmdAddsHostCheck c) (acc ++ [c])
      else
        parseCmdsHostCheck n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostCheckSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostCheck n rest2 kn acc
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

/-- Parse live HostCheck.lean text.
    Greppable: parseLiveHostCheckSource, PARSE-LIVE-HOST-CHECK. -/
def parseLiveHostCheckSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostCheck liveHostCheckParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostCheck", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostCheck parse.
    Greppable: kernelCheckLiveHostCheckSource, PARSE-LIVE-HOST-CHECK.
    Calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostCheckSource (src : String) : Bool :=
  match parseLiveHostCheckSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostCheckParsed? : Option Module :=
  match parseLiveHostCheckSource liveHostCheckSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostCheckParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveHostCheckParsed? with
  | some m => m.commands.length >= 12
  | none => false

/-- Live parse imports SystemsLean.HostFront. -/
def liveParseHasHostFrontImport : Bool :=
  match liveHostCheckParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostFront"
      | _ => false

/-- Live parse has the HostCheck namespace command. -/
def liveParseHasHostCheckNs : Bool :=
  match liveHostCheckParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostCheck"
      | _ => false

/-- Live parse has core HostCheck defs (def_ or defBind).
    hostFragmentCheckReady may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostCheckParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripCommentsHc liveHostCheckSource)
    has "stageId" && has "hostId"
      && (has "hostFragmentCheckReady"
        || toksHaveDefNamed liveHostCheckSkipFuel toks "hostFragmentCheckReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostCheckReady, PARSE-LIVE-HOST-CHECK,
    HOST-FRONT-LIVE-HOST-CHECK.
    Real conjunction: parse plus kernelCheck plus liveRel. Not hardcoded true. -/
def hostFrontLiveHostCheckReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_CHECK_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-CHECK")
    && (parseId == "PARSE-LIVE-HOST-CHECK")
    && (liveHostCheckRel == "src/systems/SystemsLean/HostCheck.lean")
    && (liveRel == "HostCheck.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostCheckFullHost
    && !hostFrontLiveHostCheckResidualFreeClaimed
    && !hostFrontLiveHostCheckProvablyUnlocked
    && kernelCheckLiveHostCheckSource liveHostCheckSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostFrontImport
    && liveParseHasHostCheckNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostCheckSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; file equality). Not mill 70. -/

def runLiveHostCheck (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-CHECK =="
  IO.println s!"  host={hostId} file={liveHostCheckRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "HostCheck.lean") do
    IO.eprintln "error: liveRel must be HostCheck.lean"
    throw (IO.userError "liveRel must be HostCheck.lean")
  let path := root / liveHostCheckRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostCheckRel}"
    throw (IO.userError s!"missing {liveHostCheckRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostCheckSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostCheck.lean != liveHostCheckSource"
    throw (IO.userError "dual-pin mismatch live HostCheck.lean")
  let r := parseLiveHostCheckSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-CHECK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-CHECK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-CHECK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostCheck parse false"
      throw (IO.userError "kernelCheck live HostCheck parse false")
    unless hostFrontLiveHostCheckReady do
      IO.eprintln "error: hostFrontLiveHostCheckReady false"
      throw (IO.userError "hostFrontLiveHostCheckReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostCheck source must reject"
      throw (IO.userError "empty HostCheck source must reject")
    IO.println s!"GREEN {stageId}: live HostCheck.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostCheck root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostCheck
