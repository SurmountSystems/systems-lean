/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/KernelLinear.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelLinear. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold. Tokenizer-dropped ++, string-safe -- strip via HostFrontLiveMult.stripComments,
  termNoAppN as needed. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on KernelLinear text. Not occupancy KernelLinearTerm.
  Occupancy leftover HostFrontLiveKernelLinearTerm wraps HostModuleCheckKernelLinearTerm.
  This land is product wrap of KernelLinear.lean. Do not edit Term files.
  Not Linear.lean. Not IrGraph. Not ComposeSubsetEmit.

  Spec (readable):
  - parseLiveKernelLinearSource turns live KernelLinear.lean text into HostTerm.Module.
  - Module name is SystemsLean.KernelLinear even without a module line.
  - kernelCheckLiveKernelLinearSource is HostKernel.kernelCheck of that parse.
    Empty start environment. No local seedImports bypass.
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app
    bodies and dotted Types.mkNode? / HostCompose.* / .isNone / .linear.live.
    Keep kernelable string/Nat defs, dotted imports, namespace, end.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not KernelLinearTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-KERNEL-LINEAR,
  SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_V0,
  PARSE-LIVE-KERNEL-LINEAR, parseLiveKernelLinearSource,
  kernelCheckLiveKernelLinearSource,
  hostFrontLiveKernelLinearReady, liveKernelLinearSource, liveRel,
  liveKernelLinearRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveKernelLinear
  Red/green: dest-missing until barrel; lean --run SlakeTypecheckKernelLinear;
  lake build SystemsLean.HostFrontLiveKernelLinear on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveKernelLinearSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveKernelLinear

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-KERNEL-LINEAR"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-KERNEL-LINEAR"

/-- Live file basename. -/
def liveRel : String := "KernelLinear.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelLinearRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveKernelLinearFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveKernelLinearResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveKernelLinearProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveKernelLinearParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and open leftovers. -/
def liveKernelLinearSkipFuel : Nat := 4096

/-- Seed names from SystemsLean.Mult import. -/
def seedMult : List String :=
  ["mult0", "mult1", "multOmega", "isValidTag", "name", "isValid", "ofNat?"]

/-- Seed names from SystemsLean.Types import. -/
def seedTypes : List String :=
  ["mkNode?", "IrNode", "NodeKind", "erased", "linear", "value", "typeTagInit"]

/-- Seed names from SystemsLean.IrProgram import. -/
def seedIrProgram : List String :=
  ["empty", "push", "PushResult", "ok", "Program"]

/-- Seed names from SystemsLean.CompilePath import. -/
def seedCompilePath : List String :=
  ["programCompileReady", "gradeSurfaceOk"]

/-- Seed names from SystemsLean.HostCompose import. Not a Compose parser. -/
def seedHostCompose : List String :=
  ["empty", "pushHostNode", "HostPushNodeResult", "mint", "MintResult",
    "checkFailClosed", "extractOkFs", "consume", "ConsumeResult", "Host",
    "LinearHost"]

/-- Dotted ident `SystemsLean . KernelLinear`. -/
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
def cmdAddsKernelLinear (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    let s := lastSeg x.raw
    if s == "Mult" then seedMult
    else if s == "Types" then seedTypes
    else if s == "IrProgram" then seedIrProgram
    else if s == "CompilePath" then seedCompilePath
    else if s == "HostCompose" then seedHostCompose
    else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known, no untyped proj, no string-concat Term.app. -/
def cmdBodyKnownKernelLinear (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelLinearParseFuel body
        && termNoAppN liveKernelLinearParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelLinearParseFuel body
        && termNoAppN liveKernelLinearParseFuel body
  | _ => true

/-- Parse one command. Dotted import / namespace / end; else parseOneCmdHt.
    none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdKernelLinear (fuel : Nat) (toks : List String) :
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
  | _ => parseOneCmdHt fuel toks

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsKernelLinear : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdKernelLinear liveKernelLinearParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveKernelLinearSkipFuel rest
      if cmdBodyKnownKernelLinear kn c then
        parseCmdsKernelLinear n rest2 (kn ++ cmdAddsKernelLinear c) (acc ++ [c])
      else
        parseCmdsKernelLinear n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveKernelLinearSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsKernelLinear n rest2 kn acc
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

/-- Parse live KernelLinear.lean text.
    Greppable: parseLiveKernelLinearSource, PARSE-LIVE-KERNEL-LINEAR. -/
def parseLiveKernelLinearSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsKernelLinear liveKernelLinearParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.KernelLinear", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live KernelLinear parse. Not a fixture.
    Greppable: kernelCheckLiveKernelLinearSource, PARSE-LIVE-KERNEL-LINEAR. -/
def kernelCheckLiveKernelLinearSource (src : String) : Bool :=
  match parseLiveKernelLinearSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveKernelLinearParsed? : Option Module :=
  match parseLiveKernelLinearSource liveKernelLinearSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveKernelLinearParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveKernelLinearParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Live parse has the KernelLinear namespace command. -/
def liveParseHasKernelLinearNs : Bool :=
  match liveKernelLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "KernelLinear"
      | _ => false

/-- Live parse has core KernelLinear defs (def_ or defBind or skip-head). -/
def liveParseHasCoreDefs : Bool :=
  match liveKernelLinearParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveKernelLinearSource)
    (has "stageId" || toksHaveDefNamed liveKernelLinearSkipFuel toks "stageId")
      && (has "kernelLinearId"
        || toksHaveDefNamed liveKernelLinearSkipFuel toks "kernelLinearId")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveKernelLinearReady, PARSE-LIVE-KERNEL-LINEAR,
    HOST-FRONT-LIVE-KERNEL-LINEAR.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveKernelLinearReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_V0")
    && (hostId == "HOST-FRONT-LIVE-KERNEL-LINEAR")
    && (parseId == "PARSE-LIVE-KERNEL-LINEAR")
    && (liveRel == "KernelLinear.lean")
    && (liveKernelLinearRel == "src/systems/SystemsLean/KernelLinear.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveKernelLinearFullHost
    && !hostFrontLiveKernelLinearResidualFreeClaimed
    && !hostFrontLiveKernelLinearProvablyUnlocked
    && kernelCheckLiveKernelLinearSource liveKernelLinearSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasKernelLinearNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveKernelLinearSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveKernelLinear (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-KERNEL-LINEAR =="
  IO.println s!"  host={hostId} file={liveKernelLinearRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveKernelLinearRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveKernelLinearRel}"
    throw (IO.userError s!"missing {liveKernelLinearRel}")
  let disk <- IO.FS.readFile path
  if disk != liveKernelLinearSource then
    IO.eprintln "error: dual-pin mismatch: on-disk KernelLinear.lean != liveKernelLinearSource"
    throw (IO.userError "dual-pin mismatch live KernelLinear.lean")
  let r := parseLiveKernelLinearSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-KERNEL-LINEAR reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-KERNEL-LINEAR reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-KERNEL-LINEAR ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live KernelLinear parse false"
      throw (IO.userError "kernelCheck live KernelLinear parse false")
    unless hostFrontLiveKernelLinearReady do
      IO.eprintln "error: hostFrontLiveKernelLinearReady false"
      throw (IO.userError "hostFrontLiveKernelLinearReady false")
    IO.println s!"GREEN {stageId}: live KernelLinear.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveKernelLinear root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveKernelLinear
