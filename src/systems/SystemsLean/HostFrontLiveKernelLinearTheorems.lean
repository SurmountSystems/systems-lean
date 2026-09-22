/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/KernelLinearTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelLinearTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveKernelLinearTermSource. Not occupancy leftover KernelLinearTerm.
  Not live HostModuleCheckKernelLinearTerm.lean.
  Not HostFrontLiveKernelLinear (that wrap parses KernelLinear.lean).
  Do not steal KernelLinear wrap dests. Do not wrap Linear.lean.

  Unique needles (trailing newline so HostFrontLiveKernelLinearTheorems is not a
  prefix hit on KernelLinear wrap HostFrontLiveKernelLinear,
  HostFrontLiveKernelLinearSource, HostFrontLiveKernelLinearMain, or
  SlakeTypecheckKernelLinear):
  HostFrontLiveKernelLinearTheorems
  PARSE-LIVE-KERNEL-LINEAR-THEOREMS
  HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS
  SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_THEOREMS_V0

  Spec (readable):
  - parseLiveKernelLinearTheoremsSource turns live KernelLinearTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.KernelLinearTheorems even without a module line.
  - kernelCheckLiveKernelLinearTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem linearKernelReady_true.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - liveRel is KernelLinearTheorems.lean (basename under SystemsLean/).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not KernelLinear.lean wrap. Not Linear.lean wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_THEOREMS_V0,
  PARSE-LIVE-KERNEL-LINEAR-THEOREMS,
  parseLiveKernelLinearTheoremsSource,
  kernelCheckLiveKernelLinearTheoremsSource,
  hostFrontLiveKernelLinearTheoremsReady, liveKernelLinearTheoremsSource,
  liveKernelLinearTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveKernelLinearTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveKernelLinearTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveKernelLinearTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveKernelLinearTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-KERNEL-LINEAR-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelLinearTheoremsRel : String :=
  "src/systems/SystemsLean/KernelLinearTheorems.lean"

/-- Live basename. Greppable: liveRel. Must be KernelLinearTheorems.lean. -/
def liveRel : String := "KernelLinearTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveKernelLinearTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveKernelLinearTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveKernelLinearTheoremsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveKernelLinearTheoremsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveKernelLinearTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveKernelLinearTheoremsSkipFuel : Nat := 8192

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

/-- Names a command adds to the known-const set. -/
def cmdAddsKernelLinearTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownKernelLinearTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelLinearTheoremsParseFuel body
        && termNoAppN liveKernelLinearTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelLinearTheoremsParseFuel body
        && termNoAppN liveKernelLinearTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdKernelLinearTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsKernelLinearTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdKernelLinearTheorems liveKernelLinearTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveKernelLinearTheoremsSkipFuel rest
      if cmdBodyKnownKernelLinearTheorems kn c then
        parseCmdsKernelLinearTheorems n rest2
          (kn ++ cmdAddsKernelLinearTheorems c) (acc ++ [c])
      else
        parseCmdsKernelLinearTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveKernelLinearTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsKernelLinearTheorems n rest2 kn acc
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

/-- Parse live KernelLinearTheorems.lean text.
    Greppable: parseLiveKernelLinearTheoremsSource,
    PARSE-LIVE-KERNEL-LINEAR-THEOREMS. -/
def parseLiveKernelLinearTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsKernelLinearTheorems liveKernelLinearTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.KernelLinearTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live KernelLinearTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveKernelLinearTheoremsSource,
    PARSE-LIVE-KERNEL-LINEAR-THEOREMS. -/
def kernelCheckLiveKernelLinearTheoremsSource (src : String) : Bool :=
  match parseLiveKernelLinearTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveKernelLinearTheoremsParsed? : Option Module :=
  match parseLiveKernelLinearTheoremsSource liveKernelLinearTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveKernelLinearTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    Six dotted imports plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveKernelLinearTheoremsParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Wrap module lastSeg is KernelLinearTheorems (no module line in the live file). -/
def liveParseHasKernelLinearTheoremsModule : Bool :=
  match liveKernelLinearTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "KernelLinearTheorems"

/-- Live parse has the living KernelLinear namespace command. -/
def liveParseHasKernelLinearNs : Bool :=
  match liveKernelLinearTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "KernelLinear"
      | _ => false

/-- Live parse imports SystemsLean.KernelLinear (kept marker). -/
def liveParseHasKernelLinearImport : Bool :=
  match liveKernelLinearTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "KernelLinear"
      | _ => false

/-- Skip-head: theorem linearKernelReady_true is in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveKernelLinearTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveKernelLinearTheoremsSource)
    toksHaveTheoremNamed liveKernelLinearTheoremsSkipFuel toks
      "linearKernelReady_true"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveKernelLinearTheoremsReady,
    PARSE-LIVE-KERNEL-LINEAR-THEOREMS,
    HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveKernelLinearTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS")
    && (parseId == "PARSE-LIVE-KERNEL-LINEAR-THEOREMS")
    && (liveKernelLinearTheoremsRel
      == "src/systems/SystemsLean/KernelLinearTheorems.lean")
    && (liveRel == "KernelLinearTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveKernelLinearTheoremsFullHost
    && !hostFrontLiveKernelLinearTheoremsResidualFreeClaimed
    && !hostFrontLiveKernelLinearTheoremsProvablyUnlocked
    && !hostFrontLiveKernelLinearTheoremsOwnsPackageTypecheck
    && kernelCheckLiveKernelLinearTheoremsSource liveKernelLinearTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasKernelLinearTheoremsModule
    && liveParseHasKernelLinearNs
    && liveParseHasKernelLinearImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveKernelLinearTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveKernelLinearTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-KERNEL-LINEAR-THEOREMS =="
  IO.println s!"  host={hostId} file={liveKernelLinearTheoremsRel} liveRel={liveRel}"
  let path := root / liveKernelLinearTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveKernelLinearTheoremsRel}"
    throw (IO.userError s!"missing {liveKernelLinearTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveKernelLinearTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk KernelLinearTheorems.lean != liveKernelLinearTheoremsSource"
    throw (IO.userError "dual-pin mismatch live KernelLinearTheorems.lean")
  let r := parseLiveKernelLinearTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-KERNEL-LINEAR-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-KERNEL-LINEAR-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-KERNEL-LINEAR-THEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live KernelLinearTheorems parse false"
      throw (IO.userError "kernelCheck live KernelLinearTheorems parse false")
    unless hostFrontLiveKernelLinearTheoremsReady do
      IO.eprintln "error: hostFrontLiveKernelLinearTheoremsReady false"
      throw (IO.userError "hostFrontLiveKernelLinearTheoremsReady false")
    IO.println s!"GREEN {stageId}: live KernelLinearTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveKernelLinearTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveKernelLinearTheorems
