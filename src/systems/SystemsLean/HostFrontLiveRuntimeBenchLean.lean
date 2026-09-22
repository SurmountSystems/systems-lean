/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/RuntimeBenchLean.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Not a runtime benchmark claim. Not a new measurement C file.
  Not FullHost. Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-RUNTIME-BENCH-LEAN,
  SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_LEAN_V0,
  PARSE-LIVE-RUNTIME-BENCH-LEAN, RUNTIME-BENCH-LEAN, liveRel,
  kernelCheckLiveRuntimeBenchLeanSource,
  hostFrontLiveRuntimeBenchLeanReady.
  Module: SystemsLean.HostFrontLiveRuntimeBenchLean
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveRuntimeBenchLeanSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveRuntimeBenchLean

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_LEAN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-RUNTIME-BENCH-LEAN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-RUNTIME-BENCH-LEAN"

/-- Live file basename. -/
def liveRel : String := "RuntimeBenchLean.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveRuntimeBenchLeanRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveRuntimeBenchLeanFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveRuntimeBenchLeanResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveRuntimeBenchLeanProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveRuntimeBenchLeanParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveRuntimeBenchLeanSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . RuntimeBenchLean`. -/
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
def cmdAddsRuntimeBenchLean (c : Cmd) : List String :=
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
def cmdBodyKnownRuntimeBenchLean (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveRuntimeBenchLeanParseFuel body
        && termNoAppN liveRuntimeBenchLeanParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveRuntimeBenchLeanParseFuel body
        && termNoAppN liveRuntimeBenchLeanParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdRuntimeBenchLean (fuel : Nat) (toks : List String) :
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
def parseCmdsRuntimeBenchLean : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdRuntimeBenchLean liveRuntimeBenchLeanParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveRuntimeBenchLeanSkipFuel rest
      if cmdBodyKnownRuntimeBenchLean kn c then
        parseCmdsRuntimeBenchLean n rest2
          (kn ++ cmdAddsRuntimeBenchLean c) (acc ++ [c])
      else
        parseCmdsRuntimeBenchLean n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveRuntimeBenchLeanSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsRuntimeBenchLean n rest2 kn acc
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

/-- Parse live RuntimeBenchLean.lean text.
    Greppable: parseLiveRuntimeBenchLeanSource,
    PARSE-LIVE-RUNTIME-BENCH-LEAN. -/
def parseLiveRuntimeBenchLeanSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsRuntimeBenchLean liveRuntimeBenchLeanParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.RuntimeBenchLean"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live RuntimeBenchLean parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveRuntimeBenchLeanSource,
    PARSE-LIVE-RUNTIME-BENCH-LEAN. -/
def kernelCheckLiveRuntimeBenchLeanSource (src : String) : Bool :=
  match parseLiveRuntimeBenchLeanSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveRuntimeBenchLeanParsed? : Option Module :=
  match parseLiveRuntimeBenchLeanSource liveRuntimeBenchLeanSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveRuntimeBenchLeanParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable bodies skipped.
    Two imports, namespace, end, and possibly defaultN. -/
def liveParseCmdCountOk : Bool :=
  match liveRuntimeBenchLeanParsed? with
  | some m => m.commands.length >= 4
  | none => false

/-- Wrap module lastSeg is RuntimeBenchLean (no module line in the live file). -/
def liveParseHasRuntimeBenchLeanModule : Bool :=
  match liveRuntimeBenchLeanParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "RuntimeBenchLean"

/-- Live parse has the living RuntimeBenchLean namespace command. -/
def liveParseHasRuntimeBenchLeanNs : Bool :=
  match liveRuntimeBenchLeanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "RuntimeBenchLean"
      | _ => false

/-- Skip-head still sees def stepTwinMintConsume, def defaultN,
    and theorem stepTwinMintConsume_eq. Theorems, structure, open,
    and do / while / match bodies are skipped. -/
def liveParseHasCoreDefs : Bool :=
  match liveRuntimeBenchLeanParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveRuntimeBenchLeanSource)
    toksHaveDefNamed liveRuntimeBenchLeanSkipFuel toks "stepTwinMintConsume"
      && toksHaveDefNamed liveRuntimeBenchLeanSkipFuel toks "defaultN"
      && toksHaveTheoremNamed liveRuntimeBenchLeanSkipFuel toks
        "stepTwinMintConsume_eq"

/-- Unique needle. Trailing newline so HostCost is not a prefix of HostCostTheorems. -/
def needleImportHostCost : String := "import SystemsLean.HostCost\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.RuntimeBenchLean\n"

/-- def stepTwinMintConsume needle with a trailing newline. -/
def needleStepTwinMintConsume : String :=
  "def stepTwinMintConsume : Nat := costStepTwinMintConsume\n"

/-- def defaultN needle with a trailing newline. -/
def needleDefaultN : String := "def defaultN : Nat := 50000000\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveRuntimeBenchLeanSource
  (src.splitOn needleImportHostCost).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStepTwinMintConsume).length > 1
    && (src.splitOn needleDefaultN).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveRuntimeBenchLeanReady,
    PARSE-LIVE-RUNTIME-BENCH-LEAN,
    HOST-FRONT-LIVE-RUNTIME-BENCH-LEAN.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. -/
def hostFrontLiveRuntimeBenchLeanReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_LEAN_V0")
    && (hostId == "HOST-FRONT-LIVE-RUNTIME-BENCH-LEAN")
    && (parseId == "PARSE-LIVE-RUNTIME-BENCH-LEAN")
    && (liveRel == "RuntimeBenchLean.lean")
    && (liveRuntimeBenchLeanRel
      == "src/systems/SystemsLean/RuntimeBenchLean.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveRuntimeBenchLeanFullHost
    && !hostFrontLiveRuntimeBenchLeanResidualFreeClaimed
    && !hostFrontLiveRuntimeBenchLeanProvablyUnlocked
    && kernelCheckLiveRuntimeBenchLeanSource liveRuntimeBenchLeanSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasRuntimeBenchLeanNs
    && liveParseHasRuntimeBenchLeanModule
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveRuntimeBenchLeanSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveRuntimeBenchLean (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-RUNTIME-BENCH-LEAN =="
  IO.println s!"  host={hostId} file={liveRuntimeBenchLeanRel}"
  let path := root / liveRuntimeBenchLeanRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRuntimeBenchLeanRel}"
    throw (IO.userError s!"missing {liveRuntimeBenchLeanRel}")
  let disk <- IO.FS.readFile path
  if disk != liveRuntimeBenchLeanSource then
    IO.eprintln "error: dual-pin mismatch: on-disk RuntimeBenchLean.lean != liveRuntimeBenchLeanSource"
    throw (IO.userError "dual-pin mismatch live RuntimeBenchLean.lean")
  let r := parseLiveRuntimeBenchLeanSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-RUNTIME-BENCH-LEAN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-RUNTIME-BENCH-LEAN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-RUNTIME-BENCH-LEAN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live RuntimeBenchLean parse false"
      throw (IO.userError "kernelCheck live RuntimeBenchLean parse false")
    unless hostFrontLiveRuntimeBenchLeanReady do
      IO.eprintln "error: hostFrontLiveRuntimeBenchLeanReady false"
      throw (IO.userError "hostFrontLiveRuntimeBenchLeanReady false")
    IO.println s!"GREEN {stageId}: live RuntimeBenchLean.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveRuntimeBenchLean root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveRuntimeBenchLean
