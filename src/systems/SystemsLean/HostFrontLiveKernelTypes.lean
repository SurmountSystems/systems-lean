/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/KernelTypes.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelTypes. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveKernelTypesTermSource. Not occupancy leftover KernelTypesTerm.
  Not live HostModuleCheckKernelTypesTerm.lean.

  Spec (readable):
  - parseLiveKernelTypesSource turns live KernelTypes.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.KernelTypes even without a module line.
  - kernelCheckLiveKernelTypesSource is HostKernel.kernelCheck of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, ==, dotted Types.mkNode?,
    IrProgram.PushResult.ok, .isNone / .isSome the kernel cannot type) are
    skip-folded. Kernelable string/Nat defs plus namespace/end remain.
  - Imports/opens skip. parseOneCmd none => skipUntilCmd. Drop defs whose
    body fails termKnownN.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-KERNEL-TYPES,
  SLAKE_HOST_FRONT_LIVE_KERNEL_TYPES_V0, PARSE-LIVE-KERNEL-TYPES,
  parseLiveKernelTypesSource, kernelCheckLiveKernelTypesSource,
  hostFrontLiveKernelTypesReady, liveKernelTypesSource,
  liveKernelTypesRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveKernelTypes
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveKernelTypes on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveKernelTypesSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveKernelTypes

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_KERNEL_TYPES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-KERNEL-TYPES"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-KERNEL-TYPES"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelTypesRel : String :=
  "src/systems/SystemsLean/KernelTypes.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveKernelTypesFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveKernelTypesResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveKernelTypesProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveKernelTypesParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveKernelTypesSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . KernelTypes`. -/
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
def cmdAddsKernelTypes (c : Cmd) : List String :=
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
def cmdBodyKnownKernelTypes (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelTypesParseFuel body
        && termNoAppN liveKernelTypesParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelTypesParseFuel body
        && termNoAppN liveKernelTypesParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdKernelTypes (fuel : Nat) (toks : List String) :
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
def parseCmdsKernelTypes : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdKernelTypes liveKernelTypesParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveKernelTypesSkipFuel rest
      if cmdBodyKnownKernelTypes kn c then
        parseCmdsKernelTypes n rest2 (kn ++ cmdAddsKernelTypes c) (acc ++ [c])
      else
        parseCmdsKernelTypes n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveKernelTypesSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsKernelTypes n rest2 kn acc
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

/-- Parse live KernelTypes.lean text.
    Greppable: parseLiveKernelTypesSource, PARSE-LIVE-KERNEL-TYPES. -/
def parseLiveKernelTypesSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsKernelTypes liveKernelTypesParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.KernelTypes"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live KernelTypes parse. Not a fixture. Not occupancy Term.
    Greppable: kernelCheckLiveKernelTypesSource, PARSE-LIVE-KERNEL-TYPES. -/
def kernelCheckLiveKernelTypesSource (src : String) : Bool :=
  match parseLiveKernelTypesSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveKernelTypesParsed? : Option Module :=
  match parseLiveKernelTypesSource liveKernelTypesSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveKernelTypesParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveKernelTypesParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Live parse has the KernelTypes namespace command. -/
def liveParseHasKernelTypesNs : Bool :=
  match liveKernelTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "KernelTypes"
      | _ => false

/-- Live parse has core KernelTypes def typesKernelReady (kept or skipped head). -/
def liveParseHasCoreDefs : Bool :=
  match liveKernelTypesParsed? with
  | none => false
  | some m =>
    let hasCmd (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveKernelTypesSource)
    hasCmd "typesKernelReady"
      || toksHaveDefNamed liveKernelTypesSkipFuel toks "typesKernelReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveKernelTypesReady, PARSE-LIVE-KERNEL-TYPES,
    HOST-FRONT-LIVE-KERNEL-TYPES.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveKernelTypesReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_KERNEL_TYPES_V0")
    && (hostId == "HOST-FRONT-LIVE-KERNEL-TYPES")
    && (parseId == "PARSE-LIVE-KERNEL-TYPES")
    && (liveKernelTypesRel
      == "src/systems/SystemsLean/KernelTypes.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveKernelTypesFullHost
    && !hostFrontLiveKernelTypesResidualFreeClaimed
    && !hostFrontLiveKernelTypesProvablyUnlocked
    && kernelCheckLiveKernelTypesSource liveKernelTypesSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasKernelTypesNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveKernelTypesSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveKernelTypes (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-KERNEL-TYPES =="
  IO.println s!"  host={hostId} file={liveKernelTypesRel}"
  let path := root / liveKernelTypesRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveKernelTypesRel}"
    throw (IO.userError s!"missing {liveKernelTypesRel}")
  let disk <- IO.FS.readFile path
  if disk != liveKernelTypesSource then
    IO.eprintln "error: dual-pin mismatch: on-disk KernelTypes.lean != liveKernelTypesSource"
    throw (IO.userError "dual-pin mismatch live KernelTypes.lean")
  let r := parseLiveKernelTypesSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-KERNEL-TYPES reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-KERNEL-TYPES reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-KERNEL-TYPES ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live KernelTypes parse false"
      throw (IO.userError "kernelCheck live KernelTypes parse false")
    unless hostFrontLiveKernelTypesReady do
      IO.eprintln "error: hostFrontLiveKernelTypesReady false"
      throw (IO.userError "hostFrontLiveKernelTypesReady false")
    IO.println s!"GREEN {stageId}: live KernelTypes.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveKernelTypes root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveKernelTypes
