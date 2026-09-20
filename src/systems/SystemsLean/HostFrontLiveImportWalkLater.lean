/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphWalkLater.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportWalkLater. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostImportGraphWalkLater text.

  Spec (readable):
  - parseLiveImportWalkLaterSource turns live HostImportGraphWalkLater.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphWalkLater even without a
    module line.
  - kernelCheckLiveImportWalkLaterSource is HostKernel.kernelCheck of that
    parse.
  - Live file is an IO peel companion: keep namespace/end; skip the
    un-kernelable checkImportOrderEdgesLater IO Unit body.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IMPORT-WALK-LATER,
  SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_LATER_V0, PARSE-LIVE-IMPORT-WALK-LATER,
  parseLiveImportWalkLaterSource, kernelCheckLiveImportWalkLaterSource,
  hostFrontLiveImportWalkLaterReady, liveImportWalkLaterSource,
  liveImportWalkLaterRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveImportWalkLater
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveImportWalkLater on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveImportWalkLaterSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveImportWalkLater

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IMPORT-WALK-LATER"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IMPORT-WALK-LATER"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportWalkLaterRel : String :=
  "src/systems/SystemsLean/HostImportGraphWalkLater.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveImportWalkLaterFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveImportWalkLaterResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveImportWalkLaterProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveImportWalkLaterParseFuel : Nat := 256

/-- Skip fuel for un-kernelable IO edge-walk body. -/
def liveImportWalkLaterSkipFuel : Nat := 8192

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
def cmdAddsWalkLater (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownWalkLater (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportWalkLaterParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportWalkLaterParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdWalkLater (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip import / theorem / un-kernelable IO defs. -/
def parseCmdsWalkLater : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdWalkLater liveImportWalkLaterParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveImportWalkLaterSkipFuel rest
      if cmdBodyKnownWalkLater kn c then
        parseCmdsWalkLater n rest2 (kn ++ cmdAddsWalkLater c) (acc ++ [c])
      else
        parseCmdsWalkLater n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveImportWalkLaterSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsWalkLater n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostImportGraphWalkLater.lean text.
    Greppable: parseLiveImportWalkLaterSource, PARSE-LIVE-IMPORT-WALK-LATER. -/
def parseLiveImportWalkLaterSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsWalkLater liveImportWalkLaterParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphWalkLater"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphWalkLater parse.
    Greppable: kernelCheckLiveImportWalkLaterSource,
    PARSE-LIVE-IMPORT-WALK-LATER. -/
def kernelCheckLiveImportWalkLaterSource (src : String) : Bool :=
  match parseLiveImportWalkLaterSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveImportWalkLaterParsed? : Option Module :=
  match parseLiveImportWalkLaterSource liveImportWalkLaterSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveImportWalkLaterParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace + end after IO skip).
    Real lower bound for this IO peel companion, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveImportWalkLaterParsed? with
  | some m => m.commands.length >= 2
  | none => false

/-- Live parse has the HostImportGraph namespace command. -/
def liveParseHasImportGraphNs : Bool :=
  match liveImportWalkLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has the HostImportGraph endNamespace command. -/
def liveParseHasEndNs : Bool :=
  match liveImportWalkLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Dual-pin source text names the IO edge-walk def. -/
def liveSourceHasEdgeWalkDef : Bool :=
  (liveImportWalkLaterSource.splitOn "checkImportOrderEdgesLater").length > 1

/-- IO edge-walk def was skipped (not in HostTerm IR). Real peel shape. -/
def liveParseSkippedIoEdgeWalk : Bool :=
  match liveImportWalkLaterParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "checkImportOrderEdgesLater"
      | Cmd.defBind x _ _ _ => x.raw == "checkImportOrderEdgesLater"
      | _ => false)

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveImportWalkLaterReady, PARSE-LIVE-IMPORT-WALK-LATER,
    HOST-FRONT-LIVE-IMPORT-WALK-LATER.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveImportWalkLaterReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_LATER_V0")
    && (hostId == "HOST-FRONT-LIVE-IMPORT-WALK-LATER")
    && (parseId == "PARSE-LIVE-IMPORT-WALK-LATER")
    && (liveImportWalkLaterRel
      == "src/systems/SystemsLean/HostImportGraphWalkLater.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveImportWalkLaterFullHost
    && !hostFrontLiveImportWalkLaterResidualFreeClaimed
    && !hostFrontLiveImportWalkLaterProvablyUnlocked
    && kernelCheckLiveImportWalkLaterSource liveImportWalkLaterSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasImportGraphNs
    && liveParseHasEndNs
    && liveSourceHasEdgeWalkDef
    && liveParseSkippedIoEdgeWalk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveImportWalkLaterSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveImportWalkLater (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IMPORT-WALK-LATER =="
  IO.println s!"  host={hostId} file={liveImportWalkLaterRel}"
  let path := root / liveImportWalkLaterRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveImportWalkLaterRel}"
    throw (IO.userError s!"missing {liveImportWalkLaterRel}")
  let disk <- IO.FS.readFile path
  if disk != liveImportWalkLaterSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphWalkLater.lean != liveImportWalkLaterSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphWalkLater.lean")
  let r := parseLiveImportWalkLaterSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IMPORT-WALK-LATER reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IMPORT-WALK-LATER reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IMPORT-WALK-LATER ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphWalkLater parse false"
      throw (IO.userError "kernelCheck live HostImportGraphWalkLater parse false")
    unless hostFrontLiveImportWalkLaterReady do
      IO.eprintln "error: hostFrontLiveImportWalkLaterReady false"
      throw (IO.userError "hostFrontLiveImportWalkLaterReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphWalkLater.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveImportWalkLater root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveImportWalkLater
