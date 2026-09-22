/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/OfficialRetire.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveOfficialRetire. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses OfficialRetire.lean only.
  Unique needles use trailing newline so HostFrontLiveOfficialRetire is not a
  prefix hit on HostFrontLiveOfficialRetireSource or a Theorems peel.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not OfficialRetireTheorems wrap (do not invent that peel wrap).
  Not CapableWrite.lean. Not DualEqWrite.lean (those files do not exist).

  Spec (readable):
  - parseLiveOfficialRetireSource turns live OfficialRetire.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.OfficialRetire even without a module line.
  - kernelCheckLiveOfficialRetireSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. Kernelable string/Nat/Bool atom defs plus namespace /
    end remain. This live file has no import lines. Skip-head still sees
    def productPathOfficialPathRetireOfficialMeasured and
    def productPathOfficialPathRetireOfficialPartialReady.
  - Skip-fold ALL theorems and examples. Compound && Ok / PartialReady skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
  - Living namespace lastSeg is OfficialRetire.
  - Wrap-assigned module lastSeg is OfficialRetire.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not an OfficialRetireTheorems peel wrap.

  Unique needles (trailing newline so HostFrontLiveOfficialRetire is not a prefix):
  HostFrontLiveOfficialRetire
  PARSE-LIVE-OFFICIAL-RETIRE
  HOST-FRONT-LIVE-OFFICIAL-RETIRE
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_V0
  OFFICIAL-RETIRE

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveOfficialRetireSource,
  kernelCheckLiveOfficialRetireSource,
  hostFrontLiveOfficialRetireReady, liveOfficialRetireSource,
  liveOfficialRetireRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveOfficialRetire
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveOfficialRetire on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveOfficialRetireSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveOfficialRetire

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-OFFICIAL-RETIRE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-OFFICIAL-RETIRE"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialRetireRel : String :=
  "src/systems/SystemsLean/OfficialRetire.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveOfficialRetireFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveOfficialRetireResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveOfficialRetireProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveOfficialRetireParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveOfficialRetireSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    OfficialRetire has quoted phrases in comments and s! interpolations.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsOrN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsOrN n nest false false ('\n' :: acc) rest
        else
          stripCommentsOrN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsOrN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsOrN n nest false false ('"' :: acc) rest
        else
          stripCommentsOrN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsOrN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsOrN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsOrN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsOrN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsOrN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsOrN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsOrN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsOrN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live OfficialRetire.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . OfficialRetire`. -/
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
def cmdAddsOfficialRetire (c : Cmd) : List String :=
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

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownOfficialRetire (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialRetireParseFuel body
        && termNoAppN liveOfficialRetireParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialRetireParseFuel body
        && termNoAppN liveOfficialRetireParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefOfficialRetire (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveOfficialRetireSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdOfficialRetire (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefOfficialRetire fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsOfficialRetire : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdOfficialRetire liveOfficialRetireParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveOfficialRetireSkipFuel rest
      if cmdBodyKnownOfficialRetire kn c then
        parseCmdsOfficialRetire n rest2
          (kn ++ cmdAddsOfficialRetire c) (acc ++ [c])
      else
        parseCmdsOfficialRetire n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveOfficialRetireSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsOfficialRetire n rest2 kn acc
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

/-- Parse live OfficialRetire.lean text.
    Greppable: parseLiveOfficialRetireSource,
    PARSE-LIVE-OFFICIAL-RETIRE. -/
def parseLiveOfficialRetireSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsOfficialRetire liveOfficialRetireParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.OfficialRetire"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live OfficialRetire parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveOfficialRetireSource,
    PARSE-LIVE-OFFICIAL-RETIRE. -/
def kernelCheckLiveOfficialRetireSource (src : String) : Bool :=
  match parseLiveOfficialRetireSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveOfficialRetireParsed? : Option Module :=
  match parseLiveOfficialRetireSource liveOfficialRetireSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveOfficialRetireParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=38: namespace, thirty-six kernelable String/Bool
    atoms, end. OfficialRetire has no import lines. Do not copy a
    HostCost bound of 16. -/
def liveParseCmdCountOk : Bool :=
  match liveOfficialRetireParsed? with
  | some m => m.commands.length >= 38
  | none => false

/-- Wrap module lastSeg is OfficialRetire (no module line in the live file). -/
def liveParseHasOfficialRetireModule : Bool :=
  match liveOfficialRetireParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "OfficialRetire"

/-- Live parse has the living OfficialRetire namespace command. -/
def liveParseHasOfficialRetireNs : Bool :=
  match liveOfficialRetireParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "OfficialRetire"
      | _ => false

/-- Skip-head: defs unique to OfficialRetire.lean (not OfficialRetireTheorems
    theorem names). Greppable: productPathOfficialPathRetireOfficialMeasured,
    productPathOfficialPathRetireOfficialPartialReady. -/
def liveParseHasCoreDefs : Bool :=
  match liveOfficialRetireParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveOfficialRetireSource)
    toksHaveDefNamed liveOfficialRetireSkipFuel toks
      "productPathOfficialPathRetireOfficialMeasured"
      && toksHaveDefNamed liveOfficialRetireSkipFuel toks
        "productPathOfficialPathRetireOfficialPartialReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveOfficialRetireReady,
    PARSE-LIVE-OFFICIAL-RETIRE,
    HOST-FRONT-LIVE-OFFICIAL-RETIRE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveOfficialRetireReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_V0")
    && (hostId == "HOST-FRONT-LIVE-OFFICIAL-RETIRE")
    && (parseId == "PARSE-LIVE-OFFICIAL-RETIRE")
    && (liveOfficialRetireRel
      == "src/systems/SystemsLean/OfficialRetire.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveOfficialRetireFullHost
    && !hostFrontLiveOfficialRetireResidualFreeClaimed
    && !hostFrontLiveOfficialRetireProvablyUnlocked
    && kernelCheckLiveOfficialRetireSource liveOfficialRetireSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasOfficialRetireModule
    && liveParseHasOfficialRetireNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveOfficialRetireSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveOfficialRetire (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-OFFICIAL-RETIRE =="
  IO.println s!"  host={hostId} file={liveOfficialRetireRel}"
  let path := root / liveOfficialRetireRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveOfficialRetireRel}"
    throw (IO.userError s!"missing {liveOfficialRetireRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOfficialRetireSource then
    IO.eprintln "error: dual-pin mismatch: on-disk OfficialRetire.lean != liveOfficialRetireSource"
    throw (IO.userError "dual-pin mismatch live OfficialRetire.lean")
  let r := parseLiveOfficialRetireSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-OFFICIAL-RETIRE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-OFFICIAL-RETIRE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-OFFICIAL-RETIRE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live OfficialRetire parse false"
      throw (IO.userError "kernelCheck live OfficialRetire parse false")
    unless hostFrontLiveOfficialRetireReady do
      IO.eprintln "error: hostFrontLiveOfficialRetireReady false"
      throw (IO.userError "hostFrontLiveOfficialRetireReady false")
    IO.println s!"GREEN {stageId}: live OfficialRetire.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveOfficialRetire root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOfficialRetire
