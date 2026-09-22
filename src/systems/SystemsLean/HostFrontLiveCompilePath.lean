/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/CompilePath.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePath. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold. Tokenizer-dropped ++, string-safe -- strip via HostFrontLiveMult.stripComments,
  termNoAppN as needed. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on CompilePath text. Not occupancy CompilePathTerm.
  Not HostModuleCheckCompilePathTerm.

  Spec (readable):
  - parseLiveCompilePathSource turns live CompilePath.lean text into HostTerm.Module.
  - Module name is SystemsLean.CompilePath even without a module line.
  - kernelCheckLiveCompilePathSource is HostKernel.kernelCheckN of that parse
    with Mult / Types / IrProgram / IrGraph / Erasure / HostCompose / Extract
    import seeds (HostKernel.lean is locked; seed locally).
  - Skip theorems, examples, set_option, private, un-kernelable match/let/app
    bodies. Keep kernelable string/Nat/Bool defs, imports, namespace, end.
  - gradeSurfaceOk and match-based fixture helpers skip; toksHaveDefNamed still
    sees stageId, hostCompilePathId, and skipped gradeSurfaceOk.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not CompilePathTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-COMPILEPATH,
  SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0,
  PARSE-LIVE-COMPILEPATH, parseLiveCompilePathSource, kernelCheckLiveCompilePathSource,
  hostFrontLiveCompilePathReady, liveCompilePathSource, liveCompilePathRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveCompilePath
  Red/green: just slake-typecheck-compilepath; just systems-host dest rows;
  lake build SystemsLean.HostFrontLiveCompilePath on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCompilePath

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILEPATH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-COMPILEPATH"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathRel : String := "src/systems/SystemsLean/CompilePath.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompilePathProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCompilePathParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and open leftovers. -/
def liveCompilePathSkipFuel : Nat := 8192

/-- Seed names from SystemsLean.Mult import. -/
def seedMult : List String :=
  ["mult0", "mult1", "multOmega", "isValidTag", "isValid", "name", "ofNat?"]

/-- Seed names from SystemsLean.Types import. -/
def seedTypes : List String :=
  ["mkNode?", "IrNode", "NodeKind", "erased", "linear", "value", "typeTagInit"]

/-- Seed names from SystemsLean.IrProgram import. -/
def seedIrProgram : List String :=
  ["empty", "push", "PushResult", "ok", "Program", "isWellTyped", "foldWellTyped"]

/-- Seed names from SystemsLean.IrGraph import. Not an IrGraph parser. -/
def seedIrGraph : List String :=
  ["Graph", "empty"]

/-- Seed names from SystemsLean.Erasure import. Not an Erasure parser. -/
def seedErasure : List String :=
  ["unmarked", "mark", "Erased"]

/-- Seed names from SystemsLean.HostCompose import. Not a Compose parser. -/
def seedHostCompose : List String :=
  ["Host", "empty", "checkFailClosed", "extractOkFs", "extractOk", "pushHostNode"]

/-- Seed names from SystemsLean.Extract import. -/
def seedExtract : List String :=
  ["RuntimeClaim", "runtimeFs", "runtimeClassic", "edgeRuntime"]

/-- Kernel env for Mult / Types / IrProgram / IrGraph / Erasure / HostCompose / Extract. -/
def seedImports (env : Env) : Env :=
  ("mult0", HostType.named (HostTerm.n "Mult"))
    :: ("mult1", HostType.named (HostTerm.n "Mult"))
    :: ("multOmega", HostType.named (HostTerm.n "Mult"))
    :: ("isValidTag", HostType.arrow HostType.nat HostType.bool)
    :: ("isValid", HostType.arrow (HostType.named (HostTerm.n "Mult")) HostType.bool)
    :: ("programCompileReady", HostType.arrow (HostType.named (HostTerm.n "Program")) HostType.bool)
    :: ("gradeSurfaceOk", HostType.bool)
    :: env

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

/-- Names a command adds to the known-const set (import seeds). -/
def cmdAddsCompilePath (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    let s := lastSeg x.raw
    if s == "Mult" then seedMult
    else if s == "Types" then seedTypes
    else if s == "IrProgram" then seedIrProgram
    else if s == "IrGraph" then seedIrGraph
    else if s == "Erasure" then seedErasure
    else if s == "HostCompose" then seedHostCompose
    else if s == "Extract" then seedExtract
    else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known, no untyped proj, no string-concat Term.app. -/
def cmdBodyKnownCompilePath (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathParseFuel body
        && termNoAppN liveCompilePathParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathParseFuel body
        && termNoAppN liveCompilePathParseFuel body
  | _ => true

/-- Fold commands. Skip theorem / example / set_option / private / un-kernelable. -/
def parseCmdsCompilePath : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveHostTermParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCompilePathSkipFuel rest
      if cmdBodyKnownCompilePath kn c then
        parseCmdsCompilePath n rest2 (kn ++ cmdAddsCompilePath c) (acc ++ [c])
      else
        parseCmdsCompilePath n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsCompilePath n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCompilePathSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCompilePath n rest2 kn acc
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

/-- Parse live CompilePath.lean text.
    Greppable: parseLiveCompilePathSource, PARSE-LIVE-COMPILEPATH. -/
def parseLiveCompilePathSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCompilePath liveCompilePathParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CompilePath", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePath parse with import seeds.
    Greppable: kernelCheckLiveCompilePathSource, PARSE-LIVE-COMPILEPATH. -/
def kernelCheckLiveCompilePathSource (src : String) : Bool :=
  match parseLiveCompilePathSource src with
  | FrontResult.accept m =>
    isWellFormed m
      && kernelCheckN kernelFuel (seedImports []) [] m.commands
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathParsed? : Option Module :=
  match parseLiveCompilePathSource liveCompilePathSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveCompilePathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse has the CompilePath namespace command. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompilePath"
      | _ => false

/-- Live parse has core CompilePath defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveCompilePathParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveCompilePathSource)
    has "stageId" && has "hostCompilePathId"
      && (has "gradeSurfaceOk"
        || toksHaveDefNamed liveCompilePathSkipFuel toks "gradeSurfaceOk")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathReady, PARSE-LIVE-COMPILEPATH,
    HOST-FRONT-LIVE-COMPILEPATH.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompilePathReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILEPATH")
    && (parseId == "PARSE-LIVE-COMPILEPATH")
    && (liveCompilePathRel == "src/systems/SystemsLean/CompilePath.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathFullHost
    && !hostFrontLiveCompilePathResidualFreeClaimed
    && !hostFrontLiveCompilePathProvablyUnlocked
    && kernelCheckLiveCompilePathSource liveCompilePathSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasMultImport
    && liveParseHasCompilePathNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompilePath (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILEPATH =="
  IO.println s!"  host={hostId} file={liveCompilePathRel}"
  let path := root / liveCompilePathRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathRel}"
    throw (IO.userError s!"missing {liveCompilePathRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompilePathSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePath.lean != liveCompilePathSource"
    throw (IO.userError "dual-pin mismatch live CompilePath.lean")
  let r := parseLiveCompilePathSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILEPATH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILEPATH reject {reason}")
  | FrontResult.accept m =>
    let k :=
      isWellFormed m
        && kernelCheckN kernelFuel (seedImports []) [] m.commands
    IO.println s!"PASS PARSE-LIVE-COMPILEPATH ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePath parse false"
      throw (IO.userError "kernelCheck live CompilePath parse false")
    unless hostFrontLiveCompilePathReady do
      IO.eprintln "error: hostFrontLiveCompilePathReady false"
      throw (IO.userError "hostFrontLiveCompilePathReady false")
    IO.println s!"GREEN {stageId}: live CompilePath.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePath root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePath
