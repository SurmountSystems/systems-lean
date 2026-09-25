/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/KernelProgramTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelProgramTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveKernelProgramSource. Not occupancy leftover KernelProgramTerm.
  Not live HostModuleCheckKernelProgramTerm.lean.
  Not HostFrontLiveKernelProgram (that wrap parses KernelProgram.lean).

  Spec (readable):
  - parseLiveKernelProgramTheoremsSource turns live KernelProgramTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.KernelProgramTheorems even without a module line.
  - kernelCheckLiveKernelProgramTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem stageId_eq or
    kernelProgramId_eq.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear.lean / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-KERNEL-PROGRAM-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_PROGRAM_THEOREMS_V0,
  PARSE-LIVE-KERNEL-PROGRAM-THEOREMS,
  parseLiveKernelProgramTheoremsSource,
  kernelCheckLiveKernelProgramTheoremsSource,
  hostFrontLiveKernelProgramTheoremsReady, liveKernelProgramTheoremsSource,
  liveKernelProgramTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveKernelProgramTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveKernelProgramTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveKernelProgramTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveKernelProgramTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_KERNEL_PROGRAM_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-KERNEL-PROGRAM-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-KERNEL-PROGRAM-THEOREMS"

/-- Bare product basename. No slash. -/
def liveRel : String := "KernelProgramTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelProgramTheoremsRel : String :=
  "src/systems/SystemsLean/KernelProgramTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveKernelProgramTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveKernelProgramTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveKernelProgramTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveKernelProgramTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveKernelProgramTheoremsSkipFuel : Nat := 8192

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
def cmdAddsKernelProgramTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownKernelProgramTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelProgramTheoremsParseFuel body
        && termNoAppN liveKernelProgramTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelProgramTheoremsParseFuel body
        && termNoAppN liveKernelProgramTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdKernelProgramTheorems (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option / open / un-kernelable. -/
def parseCmdsKernelProgramTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdKernelProgramTheorems liveKernelProgramTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveKernelProgramTheoremsSkipFuel rest
      if cmdBodyKnownKernelProgramTheorems kn c then
        parseCmdsKernelProgramTheorems n rest2
          (kn ++ cmdAddsKernelProgramTheorems c) (acc ++ [c])
      else
        parseCmdsKernelProgramTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveKernelProgramTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsKernelProgramTheorems n rest2 kn acc
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

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live KernelProgramTheorems.lean text.
    Greppable: parseLiveKernelProgramTheoremsSource,
    PARSE-LIVE-KERNEL-PROGRAM-THEOREMS. -/
def parseLiveKernelProgramTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsKernelProgramTheorems liveKernelProgramTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.KernelProgramTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live KernelProgramTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveKernelProgramTheoremsSource,
    PARSE-LIVE-KERNEL-PROGRAM-THEOREMS. -/
def kernelCheckLiveKernelProgramTheoremsSource (src : String) : Bool :=
  match parseLiveKernelProgramTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveKernelProgramTheoremsParsed? : Option Module :=
  match parseLiveKernelProgramTheoremsSource liveKernelProgramTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveKernelProgramTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    Keep namespace plus end (cmds >= 2). Imports may also remain. -/
def liveParseCmdCountOk : Bool :=
  match liveKernelProgramTheoremsParsed? with
  | some m => m.commands.length >= 2
  | none => false

/-- Wrap module lastSeg is KernelProgramTheorems (no module line in the live file). -/
def liveParseHasKernelProgramTheoremsModule : Bool :=
  match liveKernelProgramTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "KernelProgramTheorems"

/-- Live parse has the living KernelProgram namespace command. -/
def liveParseHasKernelProgramNs : Bool :=
  match liveKernelProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "KernelProgram"
      | _ => false

/-- Skip-head: theorem stageId_eq or kernelProgramId_eq is in the live text.
    Do not require kept Cmd.def_ (this theorems peel has no def). -/
def liveParseHasCoreDefs : Bool :=
  match liveKernelProgramTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveKernelProgramTheoremsSource)
    toksHaveTheoremNamed liveKernelProgramTheoremsSkipFuel toks "stageId_eq"
      || toksHaveTheoremNamed liveKernelProgramTheoremsSkipFuel toks
        "kernelProgramId_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveKernelProgramTheoremsReady,
    PARSE-LIVE-KERNEL-PROGRAM-THEOREMS,
    HOST-FRONT-LIVE-KERNEL-PROGRAM-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveKernelProgramTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_KERNEL_PROGRAM_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-KERNEL-PROGRAM-THEOREMS")
    && (parseId == "PARSE-LIVE-KERNEL-PROGRAM-THEOREMS")
    && (liveRel == "KernelProgramTheorems.lean")
    && (liveKernelProgramTheoremsRel
      == "src/systems/SystemsLean/KernelProgramTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveKernelProgramTheoremsFullHost
    && !hostFrontLiveKernelProgramTheoremsResidualFreeClaimed
    && !hostFrontLiveKernelProgramTheoremsProvablyUnlocked
    && kernelCheckLiveKernelProgramTheoremsSource liveKernelProgramTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasKernelProgramNs
    && liveParseHasKernelProgramTheoremsModule
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveKernelProgramTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveKernelProgramTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-KERNEL-PROGRAM-THEOREMS =="
  IO.println s!"  host={hostId} file={liveKernelProgramTheoremsRel}"
  let path := root / liveKernelProgramTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveKernelProgramTheoremsRel}"
    throw (IO.userError s!"missing {liveKernelProgramTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveKernelProgramTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk KernelProgramTheorems.lean != liveKernelProgramTheoremsSource"
    throw (IO.userError "dual-pin mismatch live KernelProgramTheorems.lean")
  let r := parseLiveKernelProgramTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-KERNEL-PROGRAM-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-KERNEL-PROGRAM-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-KERNEL-PROGRAM-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live KernelProgramTheorems parse false"
      throw (IO.userError "kernelCheck live KernelProgramTheorems parse false")
    unless hostFrontLiveKernelProgramTheoremsReady do
      IO.eprintln "error: hostFrontLiveKernelProgramTheoremsReady false"
      throw (IO.userError "hostFrontLiveKernelProgramTheoremsReady false")
    IO.println s!"GREEN {stageId}: live KernelProgramTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveKernelProgramTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveKernelProgramTheorems
