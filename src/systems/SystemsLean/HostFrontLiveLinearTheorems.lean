/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/LinearTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses LinearTheorems.lean only. Not the Linear.lean library.
  Do not steal a library wrap. Do not create a Linear.lean parser here.
  Live namespace is SystemsLean.Linear so theorem names stay unqualified.
  That namespace command is not a wrap of Linear.lean.

  Spec (readable):
  - parseLiveLinearTheoremsSource turns live LinearTheorems.lean text
    into HostTerm.Module.
  - Module name is SystemsLean.LinearTheorems even without a module line.
  - kernelCheckLiveLinearTheoremsSource is HostKernel.kernelCheck of that
    parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, rfl and
    `by decide`) are skip-folded. Kernelable string/Nat defs plus import /
    namespace / end remain. This theorems peel has no kernelable defs;
    skip-head still sees theorem linearAxiomInventoryOk_true.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not the Linear.lean library.

  Unique needles (THEOREMS suffix plus trailing newline so a grep of a shorter
  Linear needle is not a prefix hit):
  HostFrontLiveLinearTheorems
  PARSE-LIVE-LINEAR-THEOREMS
  HOST-FRONT-LIVE-LINEAR-THEOREMS
  SLAKE_HOST_FRONT_LIVE_LINEAR_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveLinearTheoremsSource,
  kernelCheckLiveLinearTheoremsSource,
  hostFrontLiveLinearTheoremsReady,
  liveLinearTheoremsSource,
  liveLinearTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveLinearTheorems
  Red/green: dests-skipped until barrel; closed lean --run on horizon.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLinearTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLinearTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LINEAR_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LINEAR-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LINEAR-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearTheoremsRel : String :=
  "src/systems/SystemsLean/LinearTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLinearTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLinearTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLinearTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLinearTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveLinearTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    LinearTheorems has quoted phrases in comments and theorem statements.
    HostFrontLiveMult.stripComments is not in-string safe.
    Backslash keeps the next char inside a string. -/
def stripCommentsLthN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsLthN n nest false false ('\n' :: acc) rest
        else
          stripCommentsLthN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsLthN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsLthN n nest false false ('"' :: acc) rest
        else
          stripCommentsLthN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsLthN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsLthN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsLthN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsLthN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsLthN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsLthN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsLthN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsLthN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live LinearTheorems.lean bytes. -/
def stripCommentsLth (src : String) : String :=
  String.ofList (stripCommentsLthN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . Linear`. -/
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
def cmdAddsLinearTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownLinearTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearTheoremsParseFuel body
        && termNoAppN liveLinearTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearTheoremsParseFuel body
        && termNoAppN liveLinearTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdLinearTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsLinearTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLinearTheorems liveLinearTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLinearTheoremsSkipFuel rest
      if cmdBodyKnownLinearTheorems kn c then
        parseCmdsLinearTheorems n rest2
          (kn ++ cmdAddsLinearTheorems c) (acc ++ [c])
      else
        parseCmdsLinearTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLinearTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLinearTheorems n rest2 kn acc
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

/-- Parse live LinearTheorems.lean text.
    Greppable: parseLiveLinearTheoremsSource,
    PARSE-LIVE-LINEAR-THEOREMS. -/
def parseLiveLinearTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsLth src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLinearTheorems liveLinearTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LinearTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LinearTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveLinearTheoremsSource,
    PARSE-LIVE-LINEAR-THEOREMS. -/
def kernelCheckLiveLinearTheoremsSource (src : String) : Bool :=
  match parseLiveLinearTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLinearTheoremsParsed? : Option Module :=
  match parseLiveLinearTheoremsSource liveLinearTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLinearTheoremsParsed? with
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
  match liveLinearTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is LinearTheorems (no module line in the live file). -/
def liveParseHasLinearTheoremsModule : Bool :=
  match liveLinearTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "LinearTheorems"

/-- Live parse has the living Linear namespace command.
    Same namespace as Linear so theorem names stay unqualified.
    Not a wrap of Linear.lean. -/
def liveParseHasLinearNs : Bool :=
  match liveLinearTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "Linear"
      | _ => false

/-- Live parse imports SystemsLean.Linear (kept marker). Do not compile Linear.lean. -/
def liveParseHasLinearImport : Bool :=
  match liveLinearTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Linear"
      | _ => false

/-- Skip-head: theorem unique to this peel (not a Linear.lean library def). -/
def liveParseHasCoreDefs : Bool :=
  match liveLinearTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsLth liveLinearTheoremsSource)
    toksHaveTheoremNamed liveLinearTheoremsSkipFuel toks
      "linearAxiomInventoryOk_true"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLinearTheoremsReady,
    PARSE-LIVE-LINEAR-THEOREMS,
    HOST-FRONT-LIVE-LINEAR-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveLinearTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LINEAR_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-LINEAR-THEOREMS")
    && (parseId == "PARSE-LIVE-LINEAR-THEOREMS")
    && (liveLinearTheoremsRel
      == "src/systems/SystemsLean/LinearTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLinearTheoremsFullHost
    && !hostFrontLiveLinearTheoremsResidualFreeClaimed
    && !hostFrontLiveLinearTheoremsProvablyUnlocked
    && kernelCheckLiveLinearTheoremsSource liveLinearTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLinearTheoremsModule
    && liveParseHasLinearNs
    && liveParseHasLinearImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLinearTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveLinearTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LINEAR-THEOREMS =="
  IO.println s!"  host={hostId} file={liveLinearTheoremsRel}"
  let path := root / liveLinearTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLinearTheoremsRel}"
    throw (IO.userError s!"missing {liveLinearTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLinearTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LinearTheorems.lean != liveLinearTheoremsSource"
    throw (IO.userError "dual-pin mismatch live LinearTheorems.lean")
  let r := parseLiveLinearTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LINEAR-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LINEAR-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LINEAR-THEOREMS ACCEPT liveRel=LinearTheorems.lean cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LinearTheorems parse false"
      throw (IO.userError "kernelCheck live LinearTheorems parse false")
    unless hostFrontLiveLinearTheoremsReady do
      IO.eprintln "error: hostFrontLiveLinearTheoremsReady false"
      throw (IO.userError "hostFrontLiveLinearTheoremsReady false")
    IO.println s!"GREEN {stageId}: live LinearTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLinearTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLinearTheorems
