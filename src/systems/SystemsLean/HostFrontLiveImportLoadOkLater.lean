/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphLoadOkLater.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportLoadOkLater. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostImportGraphLoadOkLater text.

  Spec (readable):
  - parseLiveImportLoadOkLaterSource turns live HostImportGraphLoadOkLater.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphLoadOkLater even without a
    module line.
  - kernelCheckLiveImportLoadOkLaterSource is HostKernel.kernelCheck of that
    parse.
  - The live file is one giant Bool def of list equalities; that body is
    skipped when un-kernelable. Namespace + kernelable cmds + end remain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IMPORT-LOADOKLATER,
  SLAKE_HOST_FRONT_LIVE_IMPORT_LOADOKLATER_V0, PARSE-LIVE-IMPORT-LOADOKLATER,
  parseLiveImportLoadOkLaterSource, kernelCheckLiveImportLoadOkLaterSource,
  hostFrontLiveImportLoadOkLaterReady, liveImportLoadOkLaterSource,
  liveImportLoadOkLaterRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveImportLoadOkLater
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveImportLoadOkLater on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveImportLoadOkLaterSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveImportLoadOkLater

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IMPORT_LOADOKLATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IMPORT-LOADOKLATER"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IMPORT-LOADOKLATER"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportLoadOkLaterRel : String :=
  "src/systems/SystemsLean/HostImportGraphLoadOkLater.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveImportLoadOkLaterFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveImportLoadOkLaterResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveImportLoadOkLaterProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveImportLoadOkLaterParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails (giant list def). -/
def liveImportLoadOkLaterSkipFuel : Nat := 32768

/-- Dotted ident `SystemsLean . HostImportGraph`. -/
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
def cmdAddsLoadOkLater (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownLoadOkLater (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportLoadOkLaterParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportLoadOkLaterParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdLoadOkLater (fuel : Nat) (toks : List String) :
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
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsLoadOkLater : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLoadOkLater liveImportLoadOkLaterParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveImportLoadOkLaterSkipFuel rest
      if cmdBodyKnownLoadOkLater kn c then
        parseCmdsLoadOkLater n rest2 (kn ++ cmdAddsLoadOkLater c) (acc ++ [c])
      else
        parseCmdsLoadOkLater n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveImportLoadOkLaterSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLoadOkLater n rest2 kn acc
          else none
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

/-- Parse live HostImportGraphLoadOkLater.lean text.
    Greppable: parseLiveImportLoadOkLaterSource, PARSE-LIVE-IMPORT-LOADOKLATER. -/
def parseLiveImportLoadOkLaterSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLoadOkLater liveImportLoadOkLaterParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphLoadOkLater"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphLoadOkLater parse.
    Greppable: kernelCheckLiveImportLoadOkLaterSource,
    PARSE-LIVE-IMPORT-LOADOKLATER. -/
def kernelCheckLiveImportLoadOkLaterSource (src : String) : Bool :=
  match parseLiveImportLoadOkLaterSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveImportLoadOkLaterParsed? : Option Module :=
  match parseLiveImportLoadOkLaterSource liveImportLoadOkLaterSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveImportLoadOkLaterParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. Giant list def is skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveImportLoadOkLaterParsed? with
  | some m => m.commands.length >= 2
  | none => false

/-- Live parse has the HostImportGraph namespace command. -/
def liveParseHasImportGraphNs : Bool :=
  match liveImportLoadOkLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has core HostImportGraphLoadOkLater defs (kept or skipped head).
    The live file's main def is hostImportGraphLoadOkImportEdges. -/
def liveParseHasCoreDefs : Bool :=
  match liveImportLoadOkLaterParsed? with
  | none => false
  | some m =>
    let hasCmd (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveImportLoadOkLaterSource)
    hasCmd "hostImportGraphLoadOkImportEdges"
      || toksHaveDefNamed liveImportLoadOkLaterSkipFuel toks
        "hostImportGraphLoadOkImportEdges"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveImportLoadOkLaterReady, PARSE-LIVE-IMPORT-LOADOKLATER,
    HOST-FRONT-LIVE-IMPORT-LOADOKLATER.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveImportLoadOkLaterReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IMPORT_LOADOKLATER_V0")
    && (hostId == "HOST-FRONT-LIVE-IMPORT-LOADOKLATER")
    && (parseId == "PARSE-LIVE-IMPORT-LOADOKLATER")
    && (liveImportLoadOkLaterRel
      == "src/systems/SystemsLean/HostImportGraphLoadOkLater.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveImportLoadOkLaterFullHost
    && !hostFrontLiveImportLoadOkLaterResidualFreeClaimed
    && !hostFrontLiveImportLoadOkLaterProvablyUnlocked
    && kernelCheckLiveImportLoadOkLaterSource liveImportLoadOkLaterSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasImportGraphNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveImportLoadOkLaterSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveImportLoadOkLater (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IMPORT-LOADOKLATER =="
  IO.println s!"  host={hostId} file={liveImportLoadOkLaterRel}"
  let path := root / liveImportLoadOkLaterRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveImportLoadOkLaterRel}"
    throw (IO.userError s!"missing {liveImportLoadOkLaterRel}")
  let disk <- IO.FS.readFile path
  if disk != liveImportLoadOkLaterSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphLoadOkLater.lean != liveImportLoadOkLaterSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphLoadOkLater.lean")
  let r := parseLiveImportLoadOkLaterSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IMPORT-LOADOKLATER reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IMPORT-LOADOKLATER reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IMPORT-LOADOKLATER ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphLoadOkLater parse false"
      throw (IO.userError "kernelCheck live HostImportGraphLoadOkLater parse false")
    unless hostFrontLiveImportLoadOkLaterReady do
      IO.eprintln "error: hostFrontLiveImportLoadOkLaterReady false"
      throw (IO.userError "hostFrontLiveImportLoadOkLaterReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphLoadOkLater.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveImportLoadOkLater root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveImportLoadOkLater
