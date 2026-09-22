/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/OfficialRetireTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveOfficialRetireTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses OfficialRetireTheorems.lean only.
  Do not steal the library wrap of OfficialRetire.lean.
  Do not steal the mill-Main wrap of OfficialRetireMain.lean.

  Spec (readable):
  - parseLiveOfficialRetireTheoremsSource turns live
    OfficialRetireTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.OfficialRetireTheorems even without a
    module line.
  - kernelCheckLiveOfficialRetireTheoremsSource is HostKernel.kernelCheck
    of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem stageId_eq.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not the OfficialRetire.lean library wrap.
  - Not the OfficialRetireMain.lean mill wrap.

  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLiveOfficialRetireTheorems
  PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS
  HOST-FRONT-LIVE-OFFICIAL-RETIRE-THEOREMS
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveOfficialRetireTheoremsSource,
  kernelCheckLiveOfficialRetireTheoremsSource,
  hostFrontLiveOfficialRetireTheoremsReady,
  liveOfficialRetireTheoremsSource,
  liveOfficialRetireTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveOfficialRetireTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveOfficialRetireTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveOfficialRetireTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveOfficialRetireTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-OFFICIAL-RETIRE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialRetireTheoremsRel : String :=
  "src/systems/SystemsLean/OfficialRetireTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveOfficialRetireTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveOfficialRetireTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveOfficialRetireTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveOfficialRetireTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveOfficialRetireTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    OfficialRetireTheorems has quoted phrases in comments and theorem
    statements. HostFrontLiveMult.stripComments is not in-string safe.
    Backslash keeps the next char inside a string. -/
def stripCommentsOrttN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsOrttN n nest false false ('\n' :: acc) rest
        else
          stripCommentsOrttN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsOrttN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsOrttN n nest false false ('"' :: acc) rest
        else
          stripCommentsOrttN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsOrttN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsOrttN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsOrttN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsOrttN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsOrttN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsOrttN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsOrttN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsOrttN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live OfficialRetireTheorems.lean bytes. -/
def stripCommentsOrtt (src : String) : String :=
  String.ofList (stripCommentsOrttN (src.length + 8) 0 false false [] src.toList)

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
def cmdAddsOfficialRetireTheorems (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app (tokenizer drops `++`, so string concat is an untyped app). -/
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

/-- Body is kernel-known, no untyped proj, no string-concat Term.app. -/
def cmdBodyKnownOfficialRetireTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialRetireTheoremsParseFuel body
        && termNoAppN liveOfficialRetireTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialRetireTheoremsParseFuel body
        && termNoAppN liveOfficialRetireTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdOfficialRetireTheorems (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / un-kernelable. -/
def parseCmdsOfficialRetireTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdOfficialRetireTheorems liveOfficialRetireTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveOfficialRetireTheoremsSkipFuel rest
      if cmdBodyKnownOfficialRetireTheorems kn c then
        parseCmdsOfficialRetireTheorems n rest2
          (kn ++ cmdAddsOfficialRetireTheorems c) (acc ++ [c])
      else
        parseCmdsOfficialRetireTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveOfficialRetireTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsOfficialRetireTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live OfficialRetireTheorems.lean text.
    Greppable: parseLiveOfficialRetireTheoremsSource,
    PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS. -/
def parseLiveOfficialRetireTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOrtt src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsOfficialRetireTheorems liveOfficialRetireTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.OfficialRetireTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live OfficialRetireTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveOfficialRetireTheoremsSource,
    PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS. -/
def kernelCheckLiveOfficialRetireTheoremsSource (src : String) : Bool :=
  match parseLiveOfficialRetireTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveOfficialRetireTheoremsParsed? : Option Module :=
  match parseLiveOfficialRetireTheoremsSource liveOfficialRetireTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveOfficialRetireTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    One dotted import plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveOfficialRetireTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is OfficialRetireTheorems (no module line in the live file). -/
def liveParseHasOfficialRetireTheoremsModule : Bool :=
  match liveOfficialRetireTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "OfficialRetireTheorems"

/-- Live parse has the living OfficialRetire namespace command. -/
def liveParseHasOfficialRetireNs : Bool :=
  match liveOfficialRetireTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "OfficialRetire"
      | _ => false

/-- Live parse imports SystemsLean.OfficialRetire (kept marker). -/
def liveParseHasOfficialRetireImport : Bool :=
  match liveOfficialRetireTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "OfficialRetire"
      | _ => false

/-- Skip-head: theorems unique to this extra (not library wrap defs). -/
def liveParseHasCoreDefs : Bool :=
  match liveOfficialRetireTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOrtt liveOfficialRetireTheoremsSource)
    toksHaveTheoremNamed liveOfficialRetireTheoremsSkipFuel toks
      "stageId_eq"
      && toksHaveTheoremNamed liveOfficialRetireTheoremsSkipFuel toks
        "productPathOfficialPathRetireOfficialOk_true"
      && toksHaveTheoremNamed liveOfficialRetireTheoremsSkipFuel toks
        "lakeFreeRetireOfficialRecipe_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveOfficialRetireTheoremsReady,
    PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS,
    HOST-FRONT-LIVE-OFFICIAL-RETIRE-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveOfficialRetireTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-OFFICIAL-RETIRE-THEOREMS")
    && (parseId == "PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS")
    && (liveOfficialRetireTheoremsRel
      == "src/systems/SystemsLean/OfficialRetireTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveOfficialRetireTheoremsFullHost
    && !hostFrontLiveOfficialRetireTheoremsResidualFreeClaimed
    && !hostFrontLiveOfficialRetireTheoremsProvablyUnlocked
    && kernelCheckLiveOfficialRetireTheoremsSource liveOfficialRetireTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasOfficialRetireTheoremsModule
    && liveParseHasOfficialRetireNs
    && liveParseHasOfficialRetireImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveOfficialRetireTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveOfficialRetireTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveOfficialRetireTheoremsRel}"
  let path := root / liveOfficialRetireTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveOfficialRetireTheoremsRel}"
    throw (IO.userError s!"missing {liveOfficialRetireTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOfficialRetireTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk OfficialRetireTheorems.lean != liveOfficialRetireTheoremsSource"
    throw (IO.userError "dual-pin mismatch live OfficialRetireTheorems.lean")
  let r := parseLiveOfficialRetireTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS ACCEPT liveRel=OfficialRetireTheorems.lean cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live OfficialRetireTheorems parse false"
      throw (IO.userError "kernelCheck live OfficialRetireTheorems parse false")
    unless hostFrontLiveOfficialRetireTheoremsReady do
      IO.eprintln "error: hostFrontLiveOfficialRetireTheoremsReady false"
      throw (IO.userError "hostFrontLiveOfficialRetireTheoremsReady false")
    IO.println s!"GREEN {stageId}: live OfficialRetireTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveOfficialRetireTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOfficialRetireTheorems
