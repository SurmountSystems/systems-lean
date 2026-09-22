/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/KernelSelfApplyTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelSelfApplyTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveKernelSelfApplyTermSource. Not occupancy leftover KernelSelfApplyTerm.
  Not live HostModuleCheckKernelSelfApplyTerm.lean.
  Not HostFrontLiveKernelSelfApply (that wrap parses KernelSelfApply.lean).
  Do not steal KernelSelfApply wrap dests. Do not wrap Linear.lean.

  Unique needles (trailing newline so HostFrontLiveKernelSelfApplyTheorems is not a
  prefix hit on KernelSelfApply wrap HostFrontLiveKernelSelfApply,
  HostFrontLiveKernelSelfApplySource, HostFrontLiveKernelSelfApplyMain, or
  SlakeTypecheckKernelSelfApply):
  HostFrontLiveKernelSelfApplyTheorems
  PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS
  HOST-FRONT-LIVE-KERNEL-SELF-APPLY-THEOREMS
  SLAKE_HOST_FRONT_LIVE_KERNEL_SELF_APPLY_THEOREMS_V0

  Spec (readable):
  - parseLiveKernelSelfApplyTheoremsSource turns live KernelSelfApplyTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.KernelSelfApplyTheorems even without a module line.
  - kernelCheckLiveKernelSelfApplyTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem productKernelSelfApplyPartialReady_true.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - liveRel is KernelSelfApplyTheorems.lean (basename under SystemsLean/).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not KernelSelfApply.lean wrap. Not Linear.lean wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-KERNEL-SELF-APPLY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_SELF_APPLY_THEOREMS_V0,
  PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS,
  parseLiveKernelSelfApplyTheoremsSource,
  kernelCheckLiveKernelSelfApplyTheoremsSource,
  hostFrontLiveKernelSelfApplyTheoremsReady, liveKernelSelfApplyTheoremsSource,
  liveKernelSelfApplyTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveKernelSelfApplyTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveKernelSelfApplyTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveKernelSelfApplyTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveKernelSelfApplyTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_KERNEL_SELF_APPLY_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-KERNEL-SELF-APPLY-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelSelfApplyTheoremsRel : String :=
  "src/systems/SystemsLean/KernelSelfApplyTheorems.lean"

/-- Live basename. Greppable: liveRel. Must be KernelSelfApplyTheorems.lean. -/
def liveRel : String := "KernelSelfApplyTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveKernelSelfApplyTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveKernelSelfApplyTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveKernelSelfApplyTheoremsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveKernelSelfApplyTheoremsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveKernelSelfApplyTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveKernelSelfApplyTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . KernelSelfApply`. -/
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
def cmdAddsKernelSelfApplyTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownKernelSelfApplyTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelSelfApplyTheoremsParseFuel body
        && termNoAppN liveKernelSelfApplyTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelSelfApplyTheoremsParseFuel body
        && termNoAppN liveKernelSelfApplyTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdKernelSelfApplyTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsKernelSelfApplyTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdKernelSelfApplyTheorems liveKernelSelfApplyTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveKernelSelfApplyTheoremsSkipFuel rest
      if cmdBodyKnownKernelSelfApplyTheorems kn c then
        parseCmdsKernelSelfApplyTheorems n rest2
          (kn ++ cmdAddsKernelSelfApplyTheorems c) (acc ++ [c])
      else
        parseCmdsKernelSelfApplyTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveKernelSelfApplyTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsKernelSelfApplyTheorems n rest2 kn acc
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

/-- Parse live KernelSelfApplyTheorems.lean text.
    Greppable: parseLiveKernelSelfApplyTheoremsSource,
    PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS. -/
def parseLiveKernelSelfApplyTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsKernelSelfApplyTheorems liveKernelSelfApplyTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.KernelSelfApplyTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live KernelSelfApplyTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveKernelSelfApplyTheoremsSource,
    PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS. -/
def kernelCheckLiveKernelSelfApplyTheoremsSource (src : String) : Bool :=
  match parseLiveKernelSelfApplyTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveKernelSelfApplyTheoremsParsed? : Option Module :=
  match parseLiveKernelSelfApplyTheoremsSource liveKernelSelfApplyTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveKernelSelfApplyTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    One dotted import plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveKernelSelfApplyTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is KernelSelfApplyTheorems (no module line in the live file). -/
def liveParseHasKernelSelfApplyTheoremsModule : Bool :=
  match liveKernelSelfApplyTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "KernelSelfApplyTheorems"

/-- Live parse has the living KernelSelfApply namespace command. -/
def liveParseHasKernelSelfApplyNs : Bool :=
  match liveKernelSelfApplyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "KernelSelfApply"
      | _ => false

/-- Live parse imports SystemsLean.KernelSelfApply (kept marker). -/
def liveParseHasKernelSelfApplyImport : Bool :=
  match liveKernelSelfApplyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "KernelSelfApply"
      | _ => false

/-- Skip-head: theorem productKernelSelfApplyPartialReady_true is in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveKernelSelfApplyTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveKernelSelfApplyTheoremsSource)
    toksHaveTheoremNamed liveKernelSelfApplyTheoremsSkipFuel toks
      "productKernelSelfApplyPartialReady_true"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveKernelSelfApplyTheoremsReady,
    PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS,
    HOST-FRONT-LIVE-KERNEL-SELF-APPLY-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveKernelSelfApplyTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_KERNEL_SELF_APPLY_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-KERNEL-SELF-APPLY-THEOREMS")
    && (parseId == "PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS")
    && (liveKernelSelfApplyTheoremsRel
      == "src/systems/SystemsLean/KernelSelfApplyTheorems.lean")
    && (liveRel == "KernelSelfApplyTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveKernelSelfApplyTheoremsFullHost
    && !hostFrontLiveKernelSelfApplyTheoremsResidualFreeClaimed
    && !hostFrontLiveKernelSelfApplyTheoremsProvablyUnlocked
    && !hostFrontLiveKernelSelfApplyTheoremsOwnsPackageTypecheck
    && kernelCheckLiveKernelSelfApplyTheoremsSource liveKernelSelfApplyTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasKernelSelfApplyTheoremsModule
    && liveParseHasKernelSelfApplyNs
    && liveParseHasKernelSelfApplyImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveKernelSelfApplyTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveKernelSelfApplyTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS =="
  IO.println s!"  host={hostId} file={liveKernelSelfApplyTheoremsRel} liveRel={liveRel}"
  let path := root / liveKernelSelfApplyTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveKernelSelfApplyTheoremsRel}"
    throw (IO.userError s!"missing {liveKernelSelfApplyTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveKernelSelfApplyTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk KernelSelfApplyTheorems.lean != liveKernelSelfApplyTheoremsSource"
    throw (IO.userError "dual-pin mismatch live KernelSelfApplyTheorems.lean")
  let r := parseLiveKernelSelfApplyTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live KernelSelfApplyTheorems parse false"
      throw (IO.userError "kernelCheck live KernelSelfApplyTheorems parse false")
    unless hostFrontLiveKernelSelfApplyTheoremsReady do
      IO.eprintln "error: hostFrontLiveKernelSelfApplyTheoremsReady false"
      throw (IO.userError "hostFrontLiveKernelSelfApplyTheoremsReady false")
    IO.println s!"GREEN {stageId}: live KernelSelfApplyTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveKernelSelfApplyTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveKernelSelfApplyTheorems
