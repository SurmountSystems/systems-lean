/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphSeeds.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportSeeds. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostImportGraphSeeds text.

  Spec (readable):
  - parseLiveImportSeedsSource turns live HostImportGraphSeeds.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphSeeds even without a module line.
  - kernelCheckLiveImportSeedsSource is HostKernel.kernelCheck of that parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IMPORT-SEEDS,
  SLAKE_HOST_FRONT_LIVE_IMPORT_SEEDS_V0, PARSE-LIVE-IMPORT-SEEDS,
  parseLiveImportSeedsSource, kernelCheckLiveImportSeedsSource,
  hostFrontLiveImportSeedsReady, liveImportSeedsSource, liveImportSeedsRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveImportSeeds
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveImportSeeds on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveImportSeedsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveImportSeeds

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IMPORT_SEEDS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IMPORT-SEEDS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IMPORT-SEEDS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportSeedsRel : String :=
  "src/systems/SystemsLean/HostImportGraphSeeds.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveImportSeedsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveImportSeedsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveImportSeedsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveImportSeedsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails (seed lists). -/
def liveImportSeedsSkipFuel : Nat := 8192

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
def cmdAddsSeeds (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownSeeds (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportSeedsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportSeedsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdSeeds (fuel : Nat) (toks : List String) :
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
def parseCmdsSeeds : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSeeds liveImportSeedsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveImportSeedsSkipFuel rest
      if cmdBodyKnownSeeds kn c then
        parseCmdsSeeds n rest2 (kn ++ cmdAddsSeeds c) (acc ++ [c])
      else
        parseCmdsSeeds n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveImportSeedsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsSeeds n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostImportGraphSeeds.lean text.
    Greppable: parseLiveImportSeedsSource, PARSE-LIVE-IMPORT-SEEDS. -/
def parseLiveImportSeedsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSeeds liveImportSeedsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphSeeds"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphSeeds parse.
    Greppable: kernelCheckLiveImportSeedsSource, PARSE-LIVE-IMPORT-SEEDS. -/
def kernelCheckLiveImportSeedsSource (src : String) : Bool :=
  match parseLiveImportSeedsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveImportSeedsParsed? : Option Module :=
  match parseLiveImportSeedsSource liveImportSeedsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveImportSeedsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveImportSeedsParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse has the HostImportGraph namespace command. -/
def liveParseHasImportGraphNs : Bool :=
  match liveImportSeedsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has core HostImportGraphSeeds defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveImportSeedsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "hostId" && has "hostImportGraphFinishedClaimed"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveImportSeedsReady, PARSE-LIVE-IMPORT-SEEDS,
    HOST-FRONT-LIVE-IMPORT-SEEDS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveImportSeedsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IMPORT_SEEDS_V0")
    && (hostId == "HOST-FRONT-LIVE-IMPORT-SEEDS")
    && (parseId == "PARSE-LIVE-IMPORT-SEEDS")
    && (liveImportSeedsRel
      == "src/systems/SystemsLean/HostImportGraphSeeds.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveImportSeedsFullHost
    && !hostFrontLiveImportSeedsResidualFreeClaimed
    && !hostFrontLiveImportSeedsProvablyUnlocked
    && kernelCheckLiveImportSeedsSource liveImportSeedsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasImportGraphNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveImportSeedsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveImportSeeds (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IMPORT-SEEDS =="
  IO.println s!"  host={hostId} file={liveImportSeedsRel}"
  let path := root / liveImportSeedsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveImportSeedsRel}"
    throw (IO.userError s!"missing {liveImportSeedsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveImportSeedsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphSeeds.lean != liveImportSeedsSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphSeeds.lean")
  let r := parseLiveImportSeedsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IMPORT-SEEDS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IMPORT-SEEDS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IMPORT-SEEDS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphSeeds parse false"
      throw (IO.userError "kernelCheck live HostImportGraphSeeds parse false")
    unless hostFrontLiveImportSeedsReady do
      IO.eprintln "error: hostFrontLiveImportSeedsReady false"
      throw (IO.userError "hostFrontLiveImportSeedsReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphSeeds.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveImportSeeds root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveImportSeeds
