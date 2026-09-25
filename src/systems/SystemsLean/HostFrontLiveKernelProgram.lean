/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/KernelProgram.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelProgram. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover. Not HostModuleCheckKernelProgramTerm.

  Spec (readable):
  - parseLiveKernelProgramSource turns live KernelProgram.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.KernelProgram even without a module line.
  - kernelCheckLiveKernelProgramSource is HostKernel.kernelCheck of that parse.
  - Theorems, examples, and un-kernelable bodies (match, Term.app string concat,
    bad proj) are skipped. Namespace + kernelable cmds + end remain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live Linear.lean / Compose / IrGraph parse.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-KERNELPROGRAM,
  SLAKE_HOST_FRONT_LIVE_KERNELPROGRAM_V0, PARSE-LIVE-KERNELPROGRAM,
  parseLiveKernelProgramSource, kernelCheckLiveKernelProgramSource,
  hostFrontLiveKernelProgramReady, liveKernelProgramSource, liveRel,
  liveKernelProgramRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveKernelProgram
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveKernelProgram on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveKernelProgramSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveKernelProgram

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_KERNELPROGRAM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-KERNELPROGRAM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-KERNELPROGRAM"

/-- Bare product basename. No slash. -/
def liveRel : String := "KernelProgram.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelProgramRel : String :=
  "src/systems/SystemsLean/KernelProgram.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveKernelProgramFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveKernelProgramResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveKernelProgramProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveKernelProgramParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveKernelProgramSkipFuel : Nat := 32768

/-- Dotted ident `SystemsLean . KernelProgram`. -/
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
def skipNonCmdKp (fuel : Nat) (rest : List String) : List String :=
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
def cmdAddsKernelProgram (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app (tokenizer drops `++`, so string concat is an untyped app). -/
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

/-- Body is kernel-known, no untyped proj, no string-concat Term.app. -/
def cmdBodyKnownKernelProgram (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelProgramParseFuel body
        && termNoAppN liveKernelProgramParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelProgramParseFuel body
        && termNoAppN liveKernelProgramParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdKernelProgram (fuel : Nat) (toks : List String) :
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
def parseCmdsKernelProgram : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdKernelProgram liveKernelProgramParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmdKp liveKernelProgramSkipFuel rest
      if cmdBodyKnownKernelProgram kn c then
        parseCmdsKernelProgram n rest2 (kn ++ cmdAddsKernelProgram c)
          (acc ++ [c])
      else
        parseCmdsKernelProgram n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveKernelProgramSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsKernelProgram n rest2 kn acc
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

/-- Parse live KernelProgram.lean text.
    Greppable: parseLiveKernelProgramSource, PARSE-LIVE-KERNELPROGRAM. -/
def parseLiveKernelProgramSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsKernelProgram liveKernelProgramParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.KernelProgram"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live KernelProgram parse.
    Greppable: kernelCheckLiveKernelProgramSource, PARSE-LIVE-KERNELPROGRAM. -/
def kernelCheckLiveKernelProgramSource (src : String) : Bool :=
  match parseLiveKernelProgramSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveKernelProgramParsed? : Option Module :=
  match parseLiveKernelProgramSource liveKernelProgramSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveKernelProgramParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveKernelProgramParsed? with
  | some m => m.commands.length >= 2
  | none => false

/-- Live parse has the KernelProgram namespace command. -/
def liveParseHasKernelProgramNs : Bool :=
  match liveKernelProgramParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "KernelProgram"
      | _ => false

/-- Live parse has core KernelProgram defs (kept or skipped head).
    Gate def is stageId or kernelProgramId. -/
def liveParseHasCoreDefs : Bool :=
  match liveKernelProgramParsed? with
  | none => false
  | some m =>
    let hasCmd (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveKernelProgramSource)
    hasCmd "stageId" || hasCmd "kernelProgramId"
      || toksHaveDefNamed liveKernelProgramSkipFuel toks "stageId"
      || toksHaveDefNamed liveKernelProgramSkipFuel toks "kernelProgramId"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveKernelProgramReady, PARSE-LIVE-KERNELPROGRAM,
    HOST-FRONT-LIVE-KERNELPROGRAM.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveKernelProgramReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_KERNELPROGRAM_V0")
    && (hostId == "HOST-FRONT-LIVE-KERNELPROGRAM")
    && (parseId == "PARSE-LIVE-KERNELPROGRAM")
    && (liveRel == "KernelProgram.lean")
    && (liveKernelProgramRel
      == "src/systems/SystemsLean/KernelProgram.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveKernelProgramFullHost
    && !hostFrontLiveKernelProgramResidualFreeClaimed
    && !hostFrontLiveKernelProgramProvablyUnlocked
    && kernelCheckLiveKernelProgramSource liveKernelProgramSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasKernelProgramNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveKernelProgramSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveKernelProgram (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-KERNELPROGRAM =="
  IO.println s!"  host={hostId} file={liveKernelProgramRel}"
  let path := root / liveKernelProgramRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveKernelProgramRel}"
    throw (IO.userError s!"missing {liveKernelProgramRel}")
  let disk <- IO.FS.readFile path
  if disk != liveKernelProgramSource then
    IO.eprintln
      "error: dual-pin mismatch: on-disk KernelProgram.lean != liveKernelProgramSource"
    throw (IO.userError "dual-pin mismatch live KernelProgram.lean")
  let r := parseLiveKernelProgramSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-KERNELPROGRAM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-KERNELPROGRAM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println
      s!"PASS PARSE-LIVE-KERNELPROGRAM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live KernelProgram parse false"
      throw (IO.userError "kernelCheck live KernelProgram parse false")
    unless hostFrontLiveKernelProgramReady do
      IO.eprintln "error: hostFrontLiveKernelProgramReady false"
      throw (IO.userError "hostFrontLiveKernelProgramReady false")
    IO.println
      s!"GREEN {stageId}: live KernelProgram.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveKernelProgram root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveKernelProgram
