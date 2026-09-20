/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckCheckers.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCheckers. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostModuleCheckCheckers text.

  Spec (readable):
  - parseLiveCheckersSource turns live HostModuleCheckCheckers.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckCheckers even without a module
    line.
  - kernelCheckLiveCheckersSource is HostKernel.kernelCheckN of that parse
    with checkNamedSurface / none / some seeds.
  - Keep checkMultSurface, checkMultTheoremsSurface (some), and
    checkHostPackageRootsSurface. Skip other un-kernelable check*Surface
    bodies (kernelFuel 64).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CHECKERS,
  SLAKE_HOST_FRONT_LIVE_CHECKERS_V0, PARSE-LIVE-CHECKERS,
  parseLiveCheckersSource, kernelCheckLiveCheckersSource,
  hostFrontLiveCheckersReady, liveCheckersSource, liveCheckersRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveCheckers
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveCheckers on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCheckersSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCheckers

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CHECKERS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CHECKERS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CHECKERS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCheckersRel : String :=
  "src/systems/SystemsLean/HostModuleCheckCheckers.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCheckersFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCheckersResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCheckersProvablyUnlocked : Bool := false

/-- Parse fuel (command fold; skip un-kernelable check*Surface tails). -/
def liveCheckersParseFuel : Nat := 512

/-- Skip fuel for un-kernelable check*Surface bodies. -/
def liveCheckersSkipFuel : Nat := 32768

/-- Seed names so checkNamedSurface apps (none / some) are kernel-known. -/
def seedCheckersKnown : List String :=
  ["checkNamedSurface",
    "multExpectedNamespace", "multRequiredDecls", "multTheoremsRequiredDecls",
    "hostPackageRootsExpectedNamespace", "hostPackageRootsRequiredDecls"]

/-- Kernel env: checkNamedSurface : RealModuleSurface -> String -> List ->
    Option String -> ModuleCheckResult, plus the kept-def args. -/
def seedCheckers (env : Env) : Env :=
  let surf : HostType := HostType.named (HostTerm.n "RealModuleSurface")
  let listTy : HostType := HostType.named (HostTerm.n "List")
  let result : HostType := HostType.named (HostTerm.n "ModuleCheckResult")
  let optStr : HostType := HostType.option HostType.string
  let cns : HostType :=
    HostType.arrow surf
      (HostType.arrow HostType.string
        (HostType.arrow listTy (HostType.arrow optStr result)))
  ("checkNamedSurface", cns)
    :: ("multExpectedNamespace", HostType.string)
    :: ("multRequiredDecls", listTy)
    :: ("multTheoremsRequiredDecls", listTy)
    :: ("hostPackageRootsExpectedNamespace", HostType.string)
    :: ("hostPackageRootsRequiredDecls", listTy)
    :: env

/-- Dotted ident `SystemsLean . HostModuleCheckCheckers`. -/
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
def cmdAddsCheckers (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownCheckers (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCheckersParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCheckersParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdCheckers (fuel : Nat) (toks : List String) :
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
def parseCmdsCheckers : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCheckers liveCheckersParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCheckersSkipFuel rest
      if cmdBodyKnownCheckers kn c then
        parseCmdsCheckers n rest2 (kn ++ cmdAddsCheckers c) (acc ++ [c])
      else
        parseCmdsCheckers n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCheckersSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCheckers n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostModuleCheckCheckers.lean text.
    Greppable: parseLiveCheckersSource, PARSE-LIVE-CHECKERS. -/
def parseLiveCheckersSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCheckers liveCheckersParseFuel toks seedCheckersKnown [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckCheckers"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckCheckers parse with checkNamedSurface seeds.
    Greppable: kernelCheckLiveCheckersSource, PARSE-LIVE-CHECKERS. -/
def kernelCheckLiveCheckersSource (src : String) : Bool :=
  match parseLiveCheckersSource src with
  | FrontResult.accept m =>
    HostKernel.kernelCheckN kernelFuel (seedCheckers []) [] m.commands
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCheckersParsed? : Option Module :=
  match parseLiveCheckersSource liveCheckersSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCheckersParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / kept check*Surface / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveCheckersParsed? with
  | some m => m.commands.length >= 6
  | none => false

/-- Live parse has the HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveCheckersParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse has the HostModuleCheck endNamespace command. -/
def liveParseHasEndNs : Bool :=
  match liveCheckersParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse imports HostModuleCheckFixtures. -/
def liveParseHasFixturesImport : Bool :=
  match liveCheckersParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostModuleCheckFixtures"
      | _ => false

/-- Live parse imports HostModuleCheckSurface. -/
def liveParseHasSurfaceImport : Bool :=
  match liveCheckersParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostModuleCheckSurface"
      | _ => false

/-- Live parse has core check*Surface defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveCheckersParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "checkMultSurface" && has "checkHostPackageRootsSurface"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCheckersReady, PARSE-LIVE-CHECKERS,
    HOST-FRONT-LIVE-CHECKERS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCheckersReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CHECKERS_V0")
    && (hostId == "HOST-FRONT-LIVE-CHECKERS")
    && (parseId == "PARSE-LIVE-CHECKERS")
    && (liveCheckersRel
      == "src/systems/SystemsLean/HostModuleCheckCheckers.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCheckersFullHost
    && !hostFrontLiveCheckersResidualFreeClaimed
    && !hostFrontLiveCheckersProvablyUnlocked
    && kernelCheckLiveCheckersSource liveCheckersSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostModuleCheckNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCheckersSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCheckers (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CHECKERS =="
  IO.println s!"  host={hostId} file={liveCheckersRel}"
  let path := root / liveCheckersRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCheckersRel}"
    throw (IO.userError s!"missing {liveCheckersRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCheckersSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckCheckers.lean != liveCheckersSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckCheckers.lean")
  let r := parseLiveCheckersSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CHECKERS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CHECKERS reject {reason}")
  | FrontResult.accept m =>
    let k := kernelCheckLiveCheckersSource disk
    IO.println s!"PASS PARSE-LIVE-CHECKERS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckCheckers parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckCheckers parse false")
    unless hostFrontLiveCheckersReady do
      IO.eprintln "error: hostFrontLiveCheckersReady false"
      throw (IO.userError "hostFrontLiveCheckersReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckCheckers.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCheckers root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCheckers
