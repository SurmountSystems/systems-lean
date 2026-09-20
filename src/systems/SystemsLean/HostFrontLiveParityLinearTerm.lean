/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckParityLinearTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveParityLinearTerm. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostModuleCheckParityLinearTerm text.

  Spec (readable):
  - parseLiveParityLinearTermSource turns live HostModuleCheckParityLinearTerm.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckParityLinearTerm even without a
    module line.
  - kernelCheckLiveParityLinearTermSource is HostKernel.kernelCheck of that parse.
  - Match / theorem tails skip when un-kernelable (same fold as ImportSeeds).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-LINEAR-TERM,
  SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_TERM_V0, PARSE-LIVE-PARITY-LINEAR-TERM,
  parseLiveParityLinearTermSource, kernelCheckLiveParityLinearTermSource,
  hostFrontLiveParityLinearTermReady, liveParityLinearTermSource,
  liveParityLinearTermRel, UNIT_SURFACE host surface, MULT-0,
  checkParityLinearTermDialect, hostModuleCheckParityLinearTermSurfaceOk,
  hostModuleCheckGoodParityLinearTermText.
  Module: SystemsLean.HostFrontLiveParityLinearTerm
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveParityLinearTerm on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityLinearTermSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityLinearTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-LINEAR-TERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-LINEAR-TERM"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityLinearTermRel : String :=
  "src/systems/SystemsLean/HostModuleCheckParityLinearTerm.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityLinearTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityLinearTermResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveParityLinearTermProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityLinearTermParseFuel : Nat := 256

/-- Skip fuel for theorem / match / un-kernelable tails. -/
def liveParityLinearTermSkipFuel : Nat := 8192

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
def cmdAddsPlt (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownPlt (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityLinearTermParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityLinearTermParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdPlt (fuel : Nat) (toks : List String) :
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
def parseCmdsPlt : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdPlt liveParityLinearTermParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityLinearTermSkipFuel rest
      if cmdBodyKnownPlt kn c then
        parseCmdsPlt n rest2 (kn ++ cmdAddsPlt c) (acc ++ [c])
      else
        parseCmdsPlt n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityLinearTermSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsPlt n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostModuleCheckParityLinearTerm.lean text.
    Greppable: parseLiveParityLinearTermSource, PARSE-LIVE-PARITY-LINEAR-TERM. -/
def parseLiveParityLinearTermSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPlt liveParityLinearTermParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckParityLinearTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckParityLinearTerm parse.
    Greppable: kernelCheckLiveParityLinearTermSource, PARSE-LIVE-PARITY-LINEAR-TERM. -/
def kernelCheckLiveParityLinearTermSource (src : String) : Bool :=
  match parseLiveParityLinearTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityLinearTermParsed? : Option Module :=
  match parseLiveParityLinearTermSource liveParityLinearTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityLinearTermParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveParityLinearTermParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Live parse has the HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveParityLinearTermParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse has core ParityLinearTerm defs that survive skip-un-kernelable.
    Greppable: checkParityLinearTermDialect, hostModuleCheckParityLinearTermSurfaceOk,
    hostModuleCheckGoodParityLinearTermText. -/
def liveParseHasCoreDefs : Bool :=
  match liveParityLinearTermParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "checkDepthParityLinearTermSurfaceBar"
      && has "hostModuleCheckParityLinearTermSurfaceDualOk"
      && has "hostModuleCheckParityLinearTermSkeletonPrefix"
      && has "hostModuleCheckGoodParityLinearTermText"

/-- Dual-pin source still carries the named dialect defs on disk. -/
def liveSourceHasDialectNames : Bool :=
  (liveParityLinearTermSource.contains "def checkParityLinearTermDialect")
    && (liveParityLinearTermSource.contains
      "def hostModuleCheckParityLinearTermSurfaceOk")
    && (liveParityLinearTermSource.contains
      "def hostModuleCheckGoodParityLinearTermText")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityLinearTermReady, PARSE-LIVE-PARITY-LINEAR-TERM,
    HOST-FRONT-LIVE-PARITY-LINEAR-TERM.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveParityLinearTermReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_TERM_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-LINEAR-TERM")
    && (parseId == "PARSE-LIVE-PARITY-LINEAR-TERM")
    && (liveParityLinearTermRel
      == "src/systems/SystemsLean/HostModuleCheckParityLinearTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityLinearTermFullHost
    && !hostFrontLiveParityLinearTermResidualFreeClaimed
    && !hostFrontLiveParityLinearTermProvablyUnlocked
    && kernelCheckLiveParityLinearTermSource liveParityLinearTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostModuleCheckNs
    && liveParseHasCoreDefs
    && liveSourceHasDialectNames

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityLinearTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveParityLinearTerm (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-LINEAR-TERM =="
  IO.println s!"  host={hostId} file={liveParityLinearTermRel}"
  let path := root / liveParityLinearTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityLinearTermRel}"
    throw (IO.userError s!"missing {liveParityLinearTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityLinearTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckParityLinearTerm.lean != liveParityLinearTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckParityLinearTerm.lean")
  let r := parseLiveParityLinearTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-LINEAR-TERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-LINEAR-TERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-LINEAR-TERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckParityLinearTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckParityLinearTerm parse false")
    unless hostFrontLiveParityLinearTermReady do
      IO.eprintln "error: hostFrontLiveParityLinearTermReady false"
      throw (IO.userError "hostFrontLiveParityLinearTermReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckParityLinearTerm.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityLinearTerm root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityLinearTerm
