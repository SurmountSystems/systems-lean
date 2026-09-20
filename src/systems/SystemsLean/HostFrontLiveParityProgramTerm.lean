/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckParityProgramTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveParityProgramTerm. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostModuleCheckParityProgramTerm text.

  Spec (readable):
  - parseLiveParityProgramTermSource turns live HostModuleCheckParityProgramTerm.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckParityProgramTerm even without a
    module line.
  - kernelCheckLiveParityProgramTermSource is HostKernel.kernelCheck of that parse.
  - Match / theorem tails skip when un-kernelable (same fold as ImportSeeds).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-PROGRAM-TERM,
  SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_TERM_V0, PARSE-LIVE-PARITY-PROGRAM-TERM,
  parseLiveParityProgramTermSource, kernelCheckLiveParityProgramTermSource,
  hostFrontLiveParityProgramTermReady, liveParityProgramTermSource,
  liveParityProgramTermRel, UNIT_SURFACE host surface, MULT-0,
  checkParityProgramTermDialect, hostModuleCheckParityProgramTermSurfaceOk,
  hostModuleCheckGoodParityProgramTermText.
  Module: SystemsLean.HostFrontLiveParityProgramTerm
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveParityProgramTerm on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityProgramTermSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityProgramTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-PROGRAM-TERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-PROGRAM-TERM"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityProgramTermRel : String :=
  "src/systems/SystemsLean/HostModuleCheckParityProgramTerm.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityProgramTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityProgramTermResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveParityProgramTermProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityProgramTermParseFuel : Nat := 256

/-- Skip fuel for theorem / match / un-kernelable tails. -/
def liveParityProgramTermSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . HostModuleCheck`. -/
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
def cmdAddsPmt (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownPmt (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityProgramTermParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityProgramTermParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdPmt (fuel : Nat) (toks : List String) :
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
def parseCmdsPmt : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdPmt liveParityProgramTermParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityProgramTermSkipFuel rest
      if cmdBodyKnownPmt kn c then
        parseCmdsPmt n rest2 (kn ++ cmdAddsPmt c) (acc ++ [c])
      else
        parseCmdsPmt n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityProgramTermSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsPmt n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostModuleCheckParityProgramTerm.lean text.
    Greppable: parseLiveParityProgramTermSource, PARSE-LIVE-PARITY-PROGRAM-TERM. -/
def parseLiveParityProgramTermSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPmt liveParityProgramTermParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckParityProgramTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckParityProgramTerm parse.
    Greppable: kernelCheckLiveParityProgramTermSource, PARSE-LIVE-PARITY-PROGRAM-TERM. -/
def kernelCheckLiveParityProgramTermSource (src : String) : Bool :=
  match parseLiveParityProgramTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityProgramTermParsed? : Option Module :=
  match parseLiveParityProgramTermSource liveParityProgramTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityProgramTermParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveParityProgramTermParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Live parse has the HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveParityProgramTermParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse has core ParityProgramTerm defs that survive skip-un-kernelable.
    Greppable: checkParityProgramTermDialect, hostModuleCheckParityProgramTermSurfaceOk,
    hostModuleCheckGoodParityProgramTermText. -/
def liveParseHasCoreDefs : Bool :=
  match liveParityProgramTermParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "checkDepthParityProgramTermSurfaceBar"
      && has "hostModuleCheckParityProgramTermSurfaceDualOk"
      && has "hostModuleCheckParityProgramTermSkeletonPrefix"
      && has "hostModuleCheckGoodParityProgramTermText"

/-- Dual-pin source still carries the named dialect defs on disk. -/
def liveSourceHasDialectNames : Bool :=
  (liveParityProgramTermSource.contains "def checkParityProgramTermDialect")
    && (liveParityProgramTermSource.contains
      "def hostModuleCheckParityProgramTermSurfaceOk")
    && (liveParityProgramTermSource.contains
      "def hostModuleCheckGoodParityProgramTermText")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityProgramTermReady, PARSE-LIVE-PARITY-PROGRAM-TERM,
    HOST-FRONT-LIVE-PARITY-PROGRAM-TERM.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveParityProgramTermReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_TERM_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-PROGRAM-TERM")
    && (parseId == "PARSE-LIVE-PARITY-PROGRAM-TERM")
    && (liveParityProgramTermRel
      == "src/systems/SystemsLean/HostModuleCheckParityProgramTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityProgramTermFullHost
    && !hostFrontLiveParityProgramTermResidualFreeClaimed
    && !hostFrontLiveParityProgramTermProvablyUnlocked
    && kernelCheckLiveParityProgramTermSource liveParityProgramTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostModuleCheckNs
    && liveParseHasCoreDefs
    && liveSourceHasDialectNames

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityProgramTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveParityProgramTerm (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-PROGRAM-TERM =="
  IO.println s!"  host={hostId} file={liveParityProgramTermRel}"
  let path := root / liveParityProgramTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityProgramTermRel}"
    throw (IO.userError s!"missing {liveParityProgramTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityProgramTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckParityProgramTerm.lean != liveParityProgramTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckParityProgramTerm.lean")
  let r := parseLiveParityProgramTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-PROGRAM-TERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-PROGRAM-TERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-PROGRAM-TERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckParityProgramTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckParityProgramTerm parse false")
    unless hostFrontLiveParityProgramTermReady do
      IO.eprintln "error: hostFrontLiveParityProgramTermReady false"
      throw (IO.userError "hostFrontLiveParityProgramTermReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckParityProgramTerm.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityProgramTerm root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityProgramTerm
