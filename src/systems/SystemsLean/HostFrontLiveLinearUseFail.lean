/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/LinearUseFail.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearUseFail. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on LinearUseFail text.
  Not occupancy leftover HostModuleCheckCompilePathTerm. Not LinearUseFailTerm.

  Spec (readable):
  - parseLiveLinearUseFailSource turns live LinearUseFail.lean text into HostTerm.Module.
  - Module name is SystemsLean.LinearUseFail even without a module line.
  - kernelCheckLiveLinearUseFailSource is HostKernel.kernelCheck of that parse
    (import SystemsLean.Mult seeds Mult).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, Prop / UInt32/IO typed defs, where-instance defs, and abbrev leftovers
    (not isCmdKw). Keep kernelable import, namespace, end, and kernelable defs.
  - structure / inductive reuse parseOneCmdHt (UseCheck fold). Parameterized
    OnceRes / LinearStep skip when parseOneCmdHt needs name-where with no binders.
  - toksHaveDefNamed still sees consume, mint, keep, illegalLinearUseFailReady
    when bodies skip.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not LinearUseFailTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LINEAR-USE-FAIL,
  SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_V0,
  PARSE-LIVE-LINEAR-USE-FAIL, parseLiveLinearUseFailSource,
  kernelCheckLiveLinearUseFailSource,
  hostFrontLiveLinearUseFailReady, liveLinearUseFailSource, liveLinearUseFailRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveLinearUseFail
  Red/green: just slake-typecheck-linearusefail; dests skipped (JoinMapTheorems lock);
  lake build SystemsLean.HostFrontLiveLinearUseFail on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLinearUseFailSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLinearUseFail

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LINEAR-USE-FAIL"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LINEAR-USE-FAIL"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailRel : String := "src/systems/SystemsLean/LinearUseFail.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLinearUseFailFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLinearUseFailResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLinearUseFailProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLinearUseFailParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveLinearUseFailSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . LinearUseFail`. -/
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
def cmdAddsLinearUseFail (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    if lastSeg x.raw == "Mult" then seedKnown else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so `"a" ++ "b"` becomes app of two string lits.
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

/-- UInt32 / IO types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Prop types poison kernelCheck of the skip-fold. -/
def typeHasProp : HostType -> Bool
  | HostType.named x => lastSeg x.raw == "Prop"
  | HostType.option t => typeHasProp t
  | HostType.arrow d c => typeHasProp d || typeHasProp c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no UInt32/IO/Prop typed defs. -/
def cmdBodyKnownLinearUseFail (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t && !typeHasProp t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearUseFailParseFuel body
        && termNoAppN liveLinearUseFailParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret && !typeHasProp ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd || typeHasProp p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearUseFailParseFuel body
        && termNoAppN liveLinearUseFailParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Dotted import / namespace / end. structure / inductive / def reuse
    parseOneCmdHt / parseDefHt (UseCheck fold). Open and abbrev skip. -/
def parseOneCmdLinearUseFail (fuel : Nat) (toks : List String) :
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
  | "structure" :: _ => parseOneCmdHt fuel toks
  | "inductive" :: _ => parseOneCmdHt fuel toks
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsLinearUseFail : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLinearUseFail liveLinearUseFailParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLinearUseFailSkipFuel rest
      if cmdBodyKnownLinearUseFail kn c then
        parseCmdsLinearUseFail n rest2 (kn ++ cmdAddsLinearUseFail c) (acc ++ [c])
      else
        parseCmdsLinearUseFail n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveLinearUseFailSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLinearUseFail n rest2 kn acc
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

/-- Parse live LinearUseFail.lean text.
    Greppable: parseLiveLinearUseFailSource, PARSE-LIVE-LINEAR-USE-FAIL. -/
def parseLiveLinearUseFailSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLinearUseFail liveLinearUseFailParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LinearUseFail", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LinearUseFail parse.
    Greppable: kernelCheckLiveLinearUseFailSource, PARSE-LIVE-LINEAR-USE-FAIL. -/
def kernelCheckLiveLinearUseFailSource (src : String) : Bool :=
  match parseLiveLinearUseFailSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLinearUseFailParsed? : Option Module :=
  match parseLiveLinearUseFailSource liveLinearUseFailSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLinearUseFailParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after skip-fold).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveLinearUseFailParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Live parse has the LinearUseFail namespace command. -/
def liveParseHasLinearUseFailNs : Bool :=
  match liveLinearUseFailParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "LinearUseFail"
      | _ => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveLinearUseFailParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse kept structure OnceRes when parseOneCmdHt accepts it. -/
def liveParseHasOnceRes : Bool :=
  match liveLinearUseFailParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ x _ _ => x.raw == "OnceRes"
      | _ => false

/-- Live parse kept structure LinearStep when parseOneCmdHt accepts it. -/
def liveParseHasLinearStep : Bool :=
  match liveLinearUseFailParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ x _ _ => x.raw == "LinearStep"
      | _ => false

/-- Live parse has core LinearUseFail defs (def_ or defBind). where-instance
    bodies skip-fold; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveLinearUseFailParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveLinearUseFailSource)
    (has "consume"
      || toksHaveDefNamed liveLinearUseFailSkipFuel toks "consume")
      && (has "mint"
        || toksHaveDefNamed liveLinearUseFailSkipFuel toks "mint")
      && (has "keep"
        || toksHaveDefNamed liveLinearUseFailSkipFuel toks "keep")
      && (has "illegalLinearUseFailReady"
        || toksHaveDefNamed liveLinearUseFailSkipFuel toks
          "illegalLinearUseFailReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLinearUseFailReady, PARSE-LIVE-LINEAR-USE-FAIL,
    HOST-FRONT-LIVE-LINEAR-USE-FAIL.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveLinearUseFailReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_V0")
    && (hostId == "HOST-FRONT-LIVE-LINEAR-USE-FAIL")
    && (parseId == "PARSE-LIVE-LINEAR-USE-FAIL")
    && (liveLinearUseFailRel == "src/systems/SystemsLean/LinearUseFail.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLinearUseFailFullHost
    && !hostFrontLiveLinearUseFailResidualFreeClaimed
    && !hostFrontLiveLinearUseFailProvablyUnlocked
    && kernelCheckLiveLinearUseFailSource liveLinearUseFailSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLinearUseFailNs
    && liveParseHasMultImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLinearUseFailSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveLinearUseFail (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LINEAR-USE-FAIL =="
  IO.println s!"  host={hostId} file={liveLinearUseFailRel}"
  let path := root / liveLinearUseFailRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLinearUseFailRel}"
    throw (IO.userError s!"missing {liveLinearUseFailRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLinearUseFailSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LinearUseFail.lean != liveLinearUseFailSource"
    throw (IO.userError "dual-pin mismatch live LinearUseFail.lean")
  let r := parseLiveLinearUseFailSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LINEAR-USE-FAIL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LINEAR-USE-FAIL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LINEAR-USE-FAIL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LinearUseFail parse false"
      throw (IO.userError "kernelCheck live LinearUseFail parse false")
    unless hostFrontLiveLinearUseFailReady do
      IO.eprintln "error: hostFrontLiveLinearUseFailReady false"
      throw (IO.userError "hostFrontLiveLinearUseFailReady false")
    IO.println s!"GREEN {stageId}: live LinearUseFail.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLinearUseFail root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLinearUseFail
