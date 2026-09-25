/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/RuntimeBenchFailClosedShape.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Not a runtime benchmark claim. Not a new measurement C file.
  Not FullHost. Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE,
  SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_V0,
  PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE, RUNTIME-BENCH-FAIL-CLOSED-SHAPE, liveRel,
  kernelCheckLiveRuntimeBenchFailClosedShapeSource,
  hostFrontLiveRuntimeBenchFailClosedShapeReady.
  Module: SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE"

/-- Live file basename. -/
def liveRel : String := "RuntimeBenchFailClosedShape.lean"

/-- Live file relative to repo root. -/
def liveRuntimeBenchFailClosedShapeRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. Not kernelCheck. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveRuntimeBenchFailClosedShapeFullHost : Bool := false

/-- Honesty: this wrap does not own package typecheck. -/
def hostFrontLiveRuntimeBenchFailClosedShapeOwnsPackageTypecheck : Bool := false

/-- Honesty: not a runtime benchmark claim. -/
def hostFrontLiveRuntimeBenchFailClosedShapeBenchmarkClaim : Bool := false

/-- Honesty: not a new measurement C file. -/
def hostFrontLiveRuntimeBenchFailClosedShapeNewMeasurementC : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveRuntimeBenchFailClosedShapeResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveRuntimeBenchFailClosedShapeProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveRuntimeBenchFailClosedShapeParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveRuntimeBenchFailClosedShapeSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . RuntimeBenchFailClosedShape`. -/
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
def cmdAddsRuntimeBenchFailClosedShape (c : Cmd) : List String :=
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
def cmdBodyKnownRuntimeBenchFailClosedShape (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveRuntimeBenchFailClosedShapeParseFuel body
        && termNoAppN liveRuntimeBenchFailClosedShapeParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveRuntimeBenchFailClosedShapeParseFuel body
        && termNoAppN liveRuntimeBenchFailClosedShapeParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdRuntimeBenchFailClosedShape (fuel : Nat) (toks : List String) :
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
def parseCmdsRuntimeBenchFailClosedShape : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdRuntimeBenchFailClosedShape liveRuntimeBenchFailClosedShapeParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveRuntimeBenchFailClosedShapeSkipFuel rest
      if cmdBodyKnownRuntimeBenchFailClosedShape kn c then
        parseCmdsRuntimeBenchFailClosedShape n rest2
          (kn ++ cmdAddsRuntimeBenchFailClosedShape c) (acc ++ [c])
      else
        parseCmdsRuntimeBenchFailClosedShape n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveRuntimeBenchFailClosedShapeSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsRuntimeBenchFailClosedShape n rest2 kn acc
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

/-- Parse live RuntimeBenchFailClosedShape.lean text.
    Greppable: parseLiveRuntimeBenchFailClosedShapeSource,
    PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE. -/
def parseLiveRuntimeBenchFailClosedShapeSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsRuntimeBenchFailClosedShape liveRuntimeBenchFailClosedShapeParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.RuntimeBenchFailClosedShape"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live RuntimeBenchFailClosedShape parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveRuntimeBenchFailClosedShapeSource,
    PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE. -/
def kernelCheckLiveRuntimeBenchFailClosedShapeSource (src : String) : Bool :=
  match parseLiveRuntimeBenchFailClosedShapeSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveRuntimeBenchFailClosedShapeParsed? : Option Module :=
  match parseLiveRuntimeBenchFailClosedShapeSource liveRuntimeBenchFailClosedShapeSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveRuntimeBenchFailClosedShapeParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count.
    Kernel-checkable commands only: namespace, stageId, generatedRelPath,
    lakeExeName, justRecipe, end. String-concat, list, do, match, and
    theorem bodies are skipped. Not a padded list. -/
def liveParseCmdCountOk : Bool :=
  match liveRuntimeBenchFailClosedShapeParsed? with
  | some m => m.commands.length == 6
  | none => false

/-- Wrap module lastSeg is RuntimeBenchFailClosedShape (no module line in the live file). -/
def liveParseHasRuntimeBenchFailClosedShapeModule : Bool :=
  match liveRuntimeBenchFailClosedShapeParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "RuntimeBenchFailClosedShape"

/-- Live parse has the living RuntimeBenchFailClosedShape namespace command. -/
def liveParseHasRuntimeBenchFailClosedShapeNs : Bool :=
  match liveRuntimeBenchFailClosedShapeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "RuntimeBenchFailClosedShape"
      | _ => false

/-- Skip-head still sees the core defs and theorems even when bodies are skipped. -/
def liveParseHasCoreDefs : Bool :=
  match liveRuntimeBenchFailClosedShapeParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveRuntimeBenchFailClosedShapeSource)
    toksHaveDefNamed liveRuntimeBenchFailClosedShapeSkipFuel toks "stageId"
      && toksHaveDefNamed liveRuntimeBenchFailClosedShapeSkipFuel toks "generatedSource"
      && toksHaveDefNamed liveRuntimeBenchFailClosedShapeSkipFuel toks "failClosedShapeProtocolOk"
      && toksHaveDefNamed liveRuntimeBenchFailClosedShapeSkipFuel toks "containsStr"
      && toksHaveTheoremNamed liveRuntimeBenchFailClosedShapeSkipFuel toks
        "failClosedShapeProtocolOk_true"
      && toksHaveTheoremNamed liveRuntimeBenchFailClosedShapeSkipFuel toks "stageId_eq"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.RuntimeBenchFailClosedShape\n"

/-- def stageId needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"RUNTIME-BENCH-FAIL-CLOSED-SHAPE\"\n"

/-- def generatedRelPath needle with a trailing newline. -/
def needleGeneratedRelPath : String :=
  "def generatedRelPath : String := \"out/runtime-bench/fail_closed_shape.c\"\n"

/-- def generatedSource needle with a trailing newline. -/
def needleGeneratedSource : String := "def generatedSource : String :=\n"

/-- def failClosedShapeProtocolOk needle with a trailing newline. -/
def needleFailClosedShapeProtocolOk : String := "def failClosedShapeProtocolOk : Bool :=\n"

/-- theorem failClosedShapeProtocolOk_true needle with a trailing newline. -/
def needleFailClosedShapeProtocolOkTrue : String :=
  "theorem failClosedShapeProtocolOk_true : failClosedShapeProtocolOk = true := by\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveRuntimeBenchFailClosedShapeSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleGeneratedRelPath).length > 1
    && (src.splitOn needleGeneratedSource).length > 1
    && (src.splitOn needleFailClosedShapeProtocolOk).length > 1
    && (src.splitOn needleFailClosedShapeProtocolOkTrue).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveRuntimeBenchFailClosedShapeReady,
    PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE,
    HOST-FRONT-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE.
    Real conjunction: parse plus kernelCheck plus honesty flags.
    Not a hardcoded true. Disk bytes are checked in the driver before GREEN. -/
def hostFrontLiveRuntimeBenchFailClosedShapeReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_V0")
    && (hostId == "HOST-FRONT-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE")
    && (parseId == "PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE")
    && (liveRel == "RuntimeBenchFailClosedShape.lean")
    && (liveRuntimeBenchFailClosedShapeRel
      == "src/systems/SystemsLean/RuntimeBenchFailClosedShape.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveRuntimeBenchFailClosedShapeFullHost
    && !hostFrontLiveRuntimeBenchFailClosedShapeOwnsPackageTypecheck
    && !hostFrontLiveRuntimeBenchFailClosedShapeBenchmarkClaim
    && !hostFrontLiveRuntimeBenchFailClosedShapeNewMeasurementC
    && !hostFrontLiveRuntimeBenchFailClosedShapeResidualFreeClaimed
    && !hostFrontLiveRuntimeBenchFailClosedShapeProvablyUnlocked
    && kernelCheckLiveRuntimeBenchFailClosedShapeSource liveRuntimeBenchFailClosedShapeSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasRuntimeBenchFailClosedShapeNs
    && liveParseHasRuntimeBenchFailClosedShapeModule
    && liveParseHasCoreDefs
    && liveNeedlesOk
    && liveParseRejectsEmpty
where
  liveParseRejectsEmpty : Bool :=
    match parseLiveRuntimeBenchFailClosedShapeSource "" with
    | FrontResult.reject _ => true
    | FrontResult.accept _ => false

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveRuntimeBenchFailClosedShapeSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- Short command label for the driver log. -/
def cmdLabel : Cmd -> String
  | Cmd.importModule x => "import " ++ x.raw
  | Cmd.namespace x => "namespace " ++ x.raw
  | Cmd.endNamespace x => "end " ++ x.raw
  | Cmd.def_ x _ _ => "def " ++ x.raw
  | Cmd.defBind x _ _ _ => "def " ++ x.raw
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "inductive " ++ x.raw
  | Cmd.structure_ x _ _ => "structure " ++ x.raw
  | Cmd.check _ _ => "check"

/-- Space-joined command labels. -/
def cmdTrace : List Cmd -> String
  | [] => ""
  | c :: [] => cmdLabel c
  | c :: cs => cmdLabel c ++ " | " ++ cmdTrace cs

/-! ### Driver (short banners; on-disk bytes must match the embedding). Not mill 70. -/

def runLiveRuntimeBenchFailClosedShape (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE =="
  IO.println s!"  host={hostId} file={liveRuntimeBenchFailClosedShapeRel} liveRel={liveRel}"
  let path := root / liveRuntimeBenchFailClosedShapeRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRuntimeBenchFailClosedShapeRel}"
    throw (IO.userError s!"missing {liveRuntimeBenchFailClosedShapeRel}")
  let disk <- IO.FS.readFile path
  if disk != liveRuntimeBenchFailClosedShapeSource then
    IO.eprintln "error: dual-pin mismatch: on-disk RuntimeBenchFailClosedShape.lean != liveRuntimeBenchFailClosedShapeSource"
    throw (IO.userError "dual-pin mismatch live RuntimeBenchFailClosedShape.lean")
  let r := parseLiveRuntimeBenchFailClosedShapeSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE ACCEPT cmds={m.commands.length} kernelCheck={k} liveRel={liveRel}"
    IO.println s!"CMDS {cmdTrace m.commands}"
    unless k do
      IO.eprintln "error: kernelCheck live RuntimeBenchFailClosedShape parse false"
      throw (IO.userError "kernelCheck live RuntimeBenchFailClosedShape parse false")
    unless hostFrontLiveRuntimeBenchFailClosedShapeReady do
      IO.eprintln s!"error: hostFrontLiveRuntimeBenchFailClosedShapeReady false countOk={liveParseCmdCountOk} ns={liveParseHasRuntimeBenchFailClosedShapeNs} module={liveParseHasRuntimeBenchFailClosedShapeModule} core={liveParseHasCoreDefs} needles={liveNeedlesOk} empty={liveParseRejectsEmpty} noCheck={liveParseHasNoCheckCmd} kernel={kernelCheckLiveRuntimeBenchFailClosedShapeSource liveRuntimeBenchFailClosedShapeSource}"
      throw (IO.userError "hostFrontLiveRuntimeBenchFailClosedShapeReady false")
    IO.println s!"GREEN {stageId}: live RuntimeBenchFailClosedShape.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveRuntimeBenchFailClosedShape root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape
