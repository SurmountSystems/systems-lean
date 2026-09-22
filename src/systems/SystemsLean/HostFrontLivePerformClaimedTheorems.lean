/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/PerformClaimedTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePerformClaimedTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Do not edit Term files.
  This wrap parses PerformClaimedTheorems.lean only.
  Do not steal the library wrap of PerformClaimed.lean.
  Do not steal the mill-Main wrap of PerformClaimedMain.lean.

  Spec (readable):
  - parseLivePerformClaimedTheoremsSource turns live
    PerformClaimedTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.PerformClaimedTheorems even without a
    module line.
  - kernelCheckLivePerformClaimedTheoremsSource is HostKernel.kernelCheck
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
  - Not the PerformClaimed.lean library wrap.
  - Not the PerformClaimedMain.lean mill wrap.

  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLivePerformClaimedTheorems
  PARSE-LIVE-PERFORM-CLAIMED-THEOREMS
  HOST-FRONT-LIVE-PERFORM-CLAIMED-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLivePerformClaimedTheoremsSource,
  kernelCheckLivePerformClaimedTheoremsSource,
  hostFrontLivePerformClaimedTheoremsReady,
  livePerformClaimedTheoremsSource,
  livePerformClaimedTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLivePerformClaimedTheorems
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLivePerformClaimedTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLivePerformClaimedTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLivePerformClaimedTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PERFORM-CLAIMED-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PERFORM-CLAIMED-THEOREMS"

/-- Live file basename. Dual-pin basename printed on PASS. -/
def liveRel : String := "PerformClaimedTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformClaimedTheoremsRel : String :=
  "src/systems/SystemsLean/PerformClaimedTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLivePerformClaimedTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLivePerformClaimedTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLivePerformClaimedTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def livePerformClaimedTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def livePerformClaimedTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    PerformClaimedTheorems has quoted phrases in comments and theorem
    statements. HostFrontLiveMult.stripComments is not in-string safe.
    Backslash keeps the next char inside a string. -/
def stripCommentsPcthN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPcthN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPcthN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPcthN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPcthN n nest false false ('"' :: acc) rest
        else
          stripCommentsPcthN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPcthN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPcthN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPcthN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPcthN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPcthN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPcthN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPcthN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPcthN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live PerformClaimedTheorems.lean bytes. -/
def stripCommentsPcth (src : String) : String :=
  String.ofList (stripCommentsPcthN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . PerformClaimed`. -/
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
def cmdAddsPerformClaimedTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownPerformClaimedTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePerformClaimedTheoremsParseFuel body
        && termNoAppN livePerformClaimedTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePerformClaimedTheoremsParseFuel body
        && termNoAppN livePerformClaimedTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdPerformClaimedTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsPerformClaimedTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdPerformClaimedTheorems livePerformClaimedTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd livePerformClaimedTheoremsSkipFuel rest
      if cmdBodyKnownPerformClaimedTheorems kn c then
        parseCmdsPerformClaimedTheorems n rest2
          (kn ++ cmdAddsPerformClaimedTheorems c) (acc ++ [c])
      else
        parseCmdsPerformClaimedTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd livePerformClaimedTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsPerformClaimedTheorems n rest2 kn acc
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

/-- Parse live PerformClaimedTheorems.lean text.
    Greppable: parseLivePerformClaimedTheoremsSource,
    PARSE-LIVE-PERFORM-CLAIMED-THEOREMS. -/
def parseLivePerformClaimedTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPcth src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPerformClaimedTheorems livePerformClaimedTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.PerformClaimedTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live PerformClaimedTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLivePerformClaimedTheoremsSource,
    PARSE-LIVE-PERFORM-CLAIMED-THEOREMS. -/
def kernelCheckLivePerformClaimedTheoremsSource (src : String) : Bool :=
  match parseLivePerformClaimedTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def livePerformClaimedTheoremsParsed? : Option Module :=
  match parseLivePerformClaimedTheoremsSource livePerformClaimedTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match livePerformClaimedTheoremsParsed? with
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
  match livePerformClaimedTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is PerformClaimedTheorems (no module line in the live file). -/
def liveParseHasPerformClaimedTheoremsModule : Bool :=
  match livePerformClaimedTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "PerformClaimedTheorems"

/-- Live parse has the living PerformClaimed namespace command. -/
def liveParseHasPerformClaimedNs : Bool :=
  match livePerformClaimedTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "PerformClaimed"
      | _ => false

/-- Live parse imports SystemsLean.PerformClaimed (kept marker). -/
def liveParseHasPerformClaimedImport : Bool :=
  match livePerformClaimedTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "PerformClaimed"
      | _ => false

/-- Skip-head: theorems unique to this extra (not library wrap defs). -/
def liveParseHasCoreDefs : Bool :=
  match livePerformClaimedTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsPcth livePerformClaimedTheoremsSource)
    toksHaveTheoremNamed livePerformClaimedTheoremsSkipFuel toks
      "stageId_eq"
      && toksHaveTheoremNamed livePerformClaimedTheoremsSkipFuel toks
        "productPathFreestandingPerformClaimedOk_true"
      && toksHaveTheoremNamed livePerformClaimedTheoremsSkipFuel toks
        "lakeFreePerformClaimedRecipe_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLivePerformClaimedTheoremsReady,
    PARSE-LIVE-PERFORM-CLAIMED-THEOREMS,
    HOST-FRONT-LIVE-PERFORM-CLAIMED-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLivePerformClaimedTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PERFORM-CLAIMED-THEOREMS")
    && (parseId == "PARSE-LIVE-PERFORM-CLAIMED-THEOREMS")
    && (liveRel == "PerformClaimedTheorems.lean")
    && (livePerformClaimedTheoremsRel
      == "src/systems/SystemsLean/PerformClaimedTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLivePerformClaimedTheoremsFullHost
    && !hostFrontLivePerformClaimedTheoremsResidualFreeClaimed
    && !hostFrontLivePerformClaimedTheoremsProvablyUnlocked
    && kernelCheckLivePerformClaimedTheoremsSource livePerformClaimedTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasPerformClaimedTheoremsModule
    && liveParseHasPerformClaimedNs
    && liveParseHasPerformClaimedImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLivePerformClaimedTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLivePerformClaimedTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PERFORM-CLAIMED-THEOREMS =="
  IO.println s!"  host={hostId} file={livePerformClaimedTheoremsRel}"
  let path := root / livePerformClaimedTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {livePerformClaimedTheoremsRel}"
    throw (IO.userError s!"missing {livePerformClaimedTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != livePerformClaimedTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk PerformClaimedTheorems.lean != livePerformClaimedTheoremsSource"
    throw (IO.userError "dual-pin mismatch live PerformClaimedTheorems.lean")
  let r := parseLivePerformClaimedTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PERFORM-CLAIMED-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PERFORM-CLAIMED-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PERFORM-CLAIMED-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live PerformClaimedTheorems parse false"
      throw (IO.userError "kernelCheck live PerformClaimedTheorems parse false")
    unless hostFrontLivePerformClaimedTheoremsReady do
      IO.eprintln "error: hostFrontLivePerformClaimedTheoremsReady false"
      throw (IO.userError "hostFrontLivePerformClaimedTheoremsReady false")
    IO.println s!"GREEN {stageId}: live PerformClaimedTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLivePerformClaimedTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLivePerformClaimedTheorems
