/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/KernelEmitTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelEmitTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveKernelEmitSource. Not occupancy leftover KernelEmitTerm.
  Not live HostModuleCheckKernelEmitTerm.lean.
  Not HostFrontLiveKernelEmit (that wrap parses KernelEmit.lean).
  Prefix: import SystemsLean.HostFrontLiveKernelEmit is a prefix of
  import SystemsLean.HostFrontLiveKernelEmitTheorems; dest needles need a
  trailing newline.

  Spec (readable):
  - parseLiveKernelEmitTheoremsSource turns live KernelEmitTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.KernelEmitTheorems even without a module line.
  - kernelCheckLiveKernelEmitTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem stageId_eq or
    kernelEmitId_eq. set_option maxRecDepth 8192 skip-folds.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear.lean / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-KERNEL-EMIT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_EMIT_THEOREMS_V0,
  PARSE-LIVE-KERNEL-EMIT-THEOREMS,
  parseLiveKernelEmitTheoremsSource,
  kernelCheckLiveKernelEmitTheoremsSource,
  hostFrontLiveKernelEmitTheoremsReady, liveKernelEmitTheoremsSource,
  liveKernelEmitTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveKernelEmitTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveKernelEmitTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveKernelEmitTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveKernelEmitTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_KERNEL_EMIT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-KERNEL-EMIT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-KERNEL-EMIT-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelEmitTheoremsRel : String :=
  "src/systems/SystemsLean/KernelEmitTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveKernelEmitTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveKernelEmitTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveKernelEmitTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveKernelEmitTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveKernelEmitTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . KernelEmit`. -/
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
def cmdAddsKernelEmitTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownKernelEmitTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelEmitTheoremsParseFuel body
        && termNoAppN liveKernelEmitTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelEmitTheoremsParseFuel body
        && termNoAppN liveKernelEmitTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdKernelEmitTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsKernelEmitTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdKernelEmitTheorems liveKernelEmitTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveKernelEmitTheoremsSkipFuel rest
      if cmdBodyKnownKernelEmitTheorems kn c then
        parseCmdsKernelEmitTheorems n rest2
          (kn ++ cmdAddsKernelEmitTheorems c) (acc ++ [c])
      else
        parseCmdsKernelEmitTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveKernelEmitTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsKernelEmitTheorems n rest2 kn acc
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

/-- Parse live KernelEmitTheorems.lean text.
    Greppable: parseLiveKernelEmitTheoremsSource,
    PARSE-LIVE-KERNEL-EMIT-THEOREMS. -/
def parseLiveKernelEmitTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsKernelEmitTheorems liveKernelEmitTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.KernelEmitTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live KernelEmitTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveKernelEmitTheoremsSource,
    PARSE-LIVE-KERNEL-EMIT-THEOREMS. -/
def kernelCheckLiveKernelEmitTheoremsSource (src : String) : Bool :=
  match parseLiveKernelEmitTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveKernelEmitTheoremsParsed? : Option Module :=
  match parseLiveKernelEmitTheoremsSource liveKernelEmitTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveKernelEmitTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    Seven dotted imports plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveKernelEmitTheoremsParsed? with
  | some m => m.commands.length >= 9
  | none => false

/-- Wrap module lastSeg is KernelEmitTheorems (no module line in the live file). -/
def liveParseHasKernelEmitTheoremsModule : Bool :=
  match liveKernelEmitTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "KernelEmitTheorems"

/-- Live parse has the living KernelEmit namespace command. -/
def liveParseHasKernelEmitNs : Bool :=
  match liveKernelEmitTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "KernelEmit"
      | _ => false

/-- Skip-head: theorem stageId_eq or kernelEmitId_eq is in the live text.
    Do not require kept Cmd.def_ (this theorems peel has no def). -/
def liveParseHasCoreDefs : Bool :=
  match liveKernelEmitTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveKernelEmitTheoremsSource)
    toksHaveTheoremNamed liveKernelEmitTheoremsSkipFuel toks "stageId_eq"
      || toksHaveTheoremNamed liveKernelEmitTheoremsSkipFuel toks
        "kernelEmitId_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveKernelEmitTheoremsReady,
    PARSE-LIVE-KERNEL-EMIT-THEOREMS,
    HOST-FRONT-LIVE-KERNEL-EMIT-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveKernelEmitTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_KERNEL_EMIT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-KERNEL-EMIT-THEOREMS")
    && (parseId == "PARSE-LIVE-KERNEL-EMIT-THEOREMS")
    && (liveKernelEmitTheoremsRel
      == "src/systems/SystemsLean/KernelEmitTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveKernelEmitTheoremsFullHost
    && !hostFrontLiveKernelEmitTheoremsResidualFreeClaimed
    && !hostFrontLiveKernelEmitTheoremsProvablyUnlocked
    && kernelCheckLiveKernelEmitTheoremsSource liveKernelEmitTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasKernelEmitNs
    && liveParseHasKernelEmitTheoremsModule
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveKernelEmitTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveKernelEmitTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-KERNEL-EMIT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveKernelEmitTheoremsRel}"
  let path := root / liveKernelEmitTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveKernelEmitTheoremsRel}"
    throw (IO.userError s!"missing {liveKernelEmitTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveKernelEmitTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk KernelEmitTheorems.lean != liveKernelEmitTheoremsSource"
    throw (IO.userError "dual-pin mismatch live KernelEmitTheorems.lean")
  let r := parseLiveKernelEmitTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-KERNEL-EMIT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-KERNEL-EMIT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-KERNEL-EMIT-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live KernelEmitTheorems parse false"
      throw (IO.userError "kernelCheck live KernelEmitTheorems parse false")
    unless hostFrontLiveKernelEmitTheoremsReady do
      IO.eprintln "error: hostFrontLiveKernelEmitTheoremsReady false"
      throw (IO.userError "hostFrontLiveKernelEmitTheoremsReady false")
    IO.println s!"GREEN {stageId}: live KernelEmitTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveKernelEmitTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveKernelEmitTheorems
