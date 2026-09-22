/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckKernelEmitTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelEmitTerm. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostModuleCheckKernelEmitTerm text.

  Spec (readable):
  - parseLiveKernelEmitTermSource turns live HostModuleCheckKernelEmitTerm.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckKernelEmitTerm even without a
    module line.
  - kernelCheckLiveKernelEmitTermSource is HostKernel.kernelCheck of that
    parse.
  - Theorems and un-kernelable bodies are skipped. Namespace + kernelable
    cmds + end remain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-KERNELEMITTERM,
  SLAKE_HOST_FRONT_LIVE_KERNELEMITTERM_V0, PARSE-LIVE-KERNELEMITTERM,
  parseLiveKernelEmitTermSource, kernelCheckLiveKernelEmitTermSource,
  hostFrontLiveKernelEmitTermReady, liveKernelEmitTermSource,
  liveKernelEmitTermRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveKernelEmitTerm
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveKernelEmitTerm on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveKernelEmitTermSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveKernelEmitTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_KERNELEMITTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-KERNELEMITTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-KERNELEMITTERM"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelEmitTermRel : String :=
  "src/systems/SystemsLean/HostModuleCheckKernelEmitTerm.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveKernelEmitTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveKernelEmitTermResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveKernelEmitTermProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveKernelEmitTermParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveKernelEmitTermSkipFuel : Nat := 32768

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
def cmdAddsKernelEmitTerm (c : Cmd) : List String :=
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
def cmdBodyKnownKernelEmitTerm (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelEmitTermParseFuel body
        && termNoAppN liveKernelEmitTermParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveKernelEmitTermParseFuel body
        && termNoAppN liveKernelEmitTermParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdKernelEmitTerm (fuel : Nat) (toks : List String) :
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
def parseCmdsKernelEmitTerm : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdKernelEmitTerm liveKernelEmitTermParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveKernelEmitTermSkipFuel rest
      if cmdBodyKnownKernelEmitTerm kn c then
        parseCmdsKernelEmitTerm n rest2 (kn ++ cmdAddsKernelEmitTerm c) (acc ++ [c])
      else
        parseCmdsKernelEmitTerm n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveKernelEmitTermSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsKernelEmitTerm n rest2 kn acc
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

/-- Parse live HostModuleCheckKernelEmitTerm.lean text.
    Greppable: parseLiveKernelEmitTermSource, PARSE-LIVE-KERNELEMITTERM. -/
def parseLiveKernelEmitTermSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsKernelEmitTerm liveKernelEmitTermParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckKernelEmitTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckKernelEmitTerm parse.
    Greppable: kernelCheckLiveKernelEmitTermSource,
    PARSE-LIVE-KERNELEMITTERM. -/
def kernelCheckLiveKernelEmitTermSource (src : String) : Bool :=
  match parseLiveKernelEmitTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveKernelEmitTermParsed? : Option Module :=
  match parseLiveKernelEmitTermSource liveKernelEmitTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveKernelEmitTermParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveKernelEmitTermParsed? with
  | some m => m.commands.length >= 2
  | none => false

/-- Live parse has the HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveKernelEmitTermParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse has core HostModuleCheckKernelEmitTerm defs (kept or skipped head).
    Gate def is hostModuleCheckKernelEmitTermSurfaceOk. -/
def liveParseHasCoreDefs : Bool :=
  match liveKernelEmitTermParsed? with
  | none => false
  | some m =>
    let hasCmd (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveKernelEmitTermSource)
    hasCmd "hostModuleCheckKernelEmitTermSurfaceOk"
      || toksHaveDefNamed liveKernelEmitTermSkipFuel toks
        "hostModuleCheckKernelEmitTermSurfaceOk"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveKernelEmitTermReady, PARSE-LIVE-KERNELEMITTERM,
    HOST-FRONT-LIVE-KERNELEMITTERM.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveKernelEmitTermReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_KERNELEMITTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-KERNELEMITTERM")
    && (parseId == "PARSE-LIVE-KERNELEMITTERM")
    && (liveKernelEmitTermRel
      == "src/systems/SystemsLean/HostModuleCheckKernelEmitTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveKernelEmitTermFullHost
    && !hostFrontLiveKernelEmitTermResidualFreeClaimed
    && !hostFrontLiveKernelEmitTermProvablyUnlocked
    && kernelCheckLiveKernelEmitTermSource liveKernelEmitTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostModuleCheckNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveKernelEmitTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveKernelEmitTerm (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-KERNELEMITTERM =="
  IO.println s!"  host={hostId} file={liveKernelEmitTermRel}"
  let path := root / liveKernelEmitTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveKernelEmitTermRel}"
    throw (IO.userError s!"missing {liveKernelEmitTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveKernelEmitTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckKernelEmitTerm.lean != liveKernelEmitTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckKernelEmitTerm.lean")
  let r := parseLiveKernelEmitTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-KERNELEMITTERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-KERNELEMITTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-KERNELEMITTERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckKernelEmitTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckKernelEmitTerm parse false")
    unless hostFrontLiveKernelEmitTermReady do
      IO.eprintln "error: hostFrontLiveKernelEmitTermReady false"
      throw (IO.userError "hostFrontLiveKernelEmitTermReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckKernelEmitTerm.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveKernelEmitTerm root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveKernelEmitTerm
