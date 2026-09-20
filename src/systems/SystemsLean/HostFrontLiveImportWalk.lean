/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphWalk.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportWalk. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostImportGraphWalk text.

  Spec (readable):
  - parseLiveImportWalkSource turns live HostImportGraphWalk.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphWalk even without a module line.
  - kernelCheckLiveImportWalkSource is HostKernel.kernelCheck of that parse.
  - The IO walk def is skipped (un-kernelable); imports / namespace / end stay.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IMPORT-WALK,
  SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_V0, PARSE-LIVE-IMPORT-WALK,
  parseLiveImportWalkSource, kernelCheckLiveImportWalkSource,
  hostFrontLiveImportWalkReady, liveImportWalkSource, liveImportWalkRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveImportWalk
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveImportWalk on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveImportWalkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveImportWalk

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IMPORT-WALK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IMPORT-WALK"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportWalkRel : String :=
  "src/systems/SystemsLean/HostImportGraphWalk.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveImportWalkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveImportWalkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveImportWalkProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveImportWalkParseFuel : Nat := 256

/-- Skip fuel for the IO walk def (un-kernelable). -/
def liveImportWalkSkipFuel : Nat := 32768

/-- Dotted ident `SystemsLean . HostImportGraphWalk`. -/
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
def cmdAddsWalk (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownWalk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportWalkParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportWalkParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdWalk (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsWalk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdWalk liveImportWalkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveImportWalkSkipFuel rest
      if cmdBodyKnownWalk kn c then
        parseCmdsWalk n rest2 (kn ++ cmdAddsWalk c) (acc ++ [c])
      else
        parseCmdsWalk n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveImportWalkSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsWalk n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostImportGraphWalk.lean text.
    Greppable: parseLiveImportWalkSource, PARSE-LIVE-IMPORT-WALK. -/
def parseLiveImportWalkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsWalk liveImportWalkParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphWalk"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphWalk parse.
    Greppable: kernelCheckLiveImportWalkSource, PARSE-LIVE-IMPORT-WALK. -/
def kernelCheckLiveImportWalkSource (src : String) : Bool :=
  match parseLiveImportWalkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveImportWalkParsed? : Option Module :=
  match parseLiveImportWalkSource liveImportWalkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveImportWalkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. IO walk def is skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveImportWalkParsed? with
  | some m => m.commands.length >= 4
  | none => false

/-- Live parse has the HostImportGraph namespace command. -/
def liveParseHasImportGraphNs : Bool :=
  match liveImportWalkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has the HostImportGraph endNamespace command. -/
def liveParseHasEndNs : Bool :=
  match liveImportWalkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse imports HostImportGraphModel. -/
def liveParseHasModelImport : Bool :=
  match liveImportWalkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostImportGraphModel"
      | _ => false

/-- Live parse imports HostImportGraphWalkLater. -/
def liveParseHasWalkLaterImport : Bool :=
  match liveImportWalkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostImportGraphWalkLater"
      | _ => false

/-- Dual-pin bytes name the IO walk def even though IR skips it. -/
def liveSourceHasWalkDef : Bool :=
  (liveImportWalkSource.splitOn "checkImportOrderEdges").length > 1

/-- IO walk def is skipped (un-kernelable). Real: parsed cmds lack it. -/
def liveParseSkippedIoWalk : Bool :=
  match liveImportWalkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "checkImportOrderEdges"
      | Cmd.defBind x _ _ _ => x.raw == "checkImportOrderEdges"
      | _ => false)

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveImportWalkReady, PARSE-LIVE-IMPORT-WALK,
    HOST-FRONT-LIVE-IMPORT-WALK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveImportWalkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_V0")
    && (hostId == "HOST-FRONT-LIVE-IMPORT-WALK")
    && (parseId == "PARSE-LIVE-IMPORT-WALK")
    && (liveImportWalkRel
      == "src/systems/SystemsLean/HostImportGraphWalk.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveImportWalkFullHost
    && !hostFrontLiveImportWalkResidualFreeClaimed
    && !hostFrontLiveImportWalkProvablyUnlocked
    && kernelCheckLiveImportWalkSource liveImportWalkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasImportGraphNs
    && liveParseHasEndNs
    && liveParseHasModelImport
    && liveParseHasWalkLaterImport
    && liveSourceHasWalkDef
    && liveParseSkippedIoWalk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveImportWalkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveImportWalk (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IMPORT-WALK =="
  IO.println s!"  host={hostId} file={liveImportWalkRel}"
  let path := root / liveImportWalkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveImportWalkRel}"
    throw (IO.userError s!"missing {liveImportWalkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveImportWalkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphWalk.lean != liveImportWalkSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphWalk.lean")
  let r := parseLiveImportWalkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IMPORT-WALK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IMPORT-WALK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IMPORT-WALK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphWalk parse false"
      throw (IO.userError "kernelCheck live HostImportGraphWalk parse false")
    unless hostFrontLiveImportWalkReady do
      IO.eprintln "error: hostFrontLiveImportWalkReady false"
      throw (IO.userError "hostFrontLiveImportWalkReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphWalk.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveImportWalk root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveImportWalk
