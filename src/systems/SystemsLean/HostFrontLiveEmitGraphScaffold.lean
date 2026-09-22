/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitGraphScaffold.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitGraphScaffold. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckEmitGraphScaffoldTerm.
  Not live HostModuleCheckEmitGraphScaffoldTerm.lean.
  Not HostFrontLiveEmit (prefix sibling).
  Not HostFrontLiveEmitApply.
  Not HostFrontLiveEmitBannerScaffold.
  Not HostFrontLiveEmitGraph (that wrap would parse EmitGraph.lean).
  Not HostFrontLiveEmitMultScaffold.
  Not HostFrontLiveEmitProgramScaffold.
  Not HostFrontLiveEmitTypesScaffold.
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.
  Not EmitComposeScaffold.lean. Not EmitLinearScaffold.lean.

  Spec (readable):
  - parseLiveEmitGraphScaffoldSource turns live EmitGraphScaffold.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.EmitGraphScaffold even without a module line.
  - kernelCheckLiveEmitGraphScaffoldSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes) are skip-folded. Kernelable string/Nat defs plus import /
    namespace / end remain. Skip-head still sees def selfHostEmitGraphId
    and theorem emitGraphReady_true. def graphHeaderFragment sits after a
    string that contains `-- `; HostFrontLiveHostTerm stripComments is not
    string-aware, so that token walk does not see graphHeaderFragment.
  - Skip-fold ALL examples including emitGraphReady smokes.
  - Skip-fold theorem emitGraphReady_true (token walk still sees the name).
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - private is not isCmdKw; peel private then skip or drop the def.
  - Living namespace is SystemsLean.EmitGraph (shared lastSeg with
    EmitGraph.lean). Identity uses wrap lastSeg EmitGraphScaffold.
  - liveRel is the exact basename EmitGraphScaffold.lean.
  - Live product has no import line; parse keeps namespace plus end plus
    kernelable stage/path string defs.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not EmitGraph.lean wrap. Not occupancy Term wrap.
  - Not EmitMultScaffold / EmitProgramScaffold / EmitTypesScaffold wraps.

  Unique needles (trailing newline so HostFrontLiveEmit is not a prefix):
  HostFrontLiveEmitGraphScaffold
  PARSE-LIVE-EMIT-GRAPH-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-GRAPH-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_GRAPH_SCAFFOLD_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveEmitGraphScaffoldSource,
  kernelCheckLiveEmitGraphScaffoldSource,
  hostFrontLiveEmitGraphScaffoldReady, liveEmitGraphScaffoldSource,
  liveRel, liveEmitGraphScaffoldRel, UNIT_SURFACE host surface,
  liveParseDoesNotUseMultFixture, EMIT-GRAPH-SCAFFOLD.
  Module: SystemsLean.HostFrontLiveEmitGraphScaffold
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveEmitGraphScaffold on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitGraphScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitGraphScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_GRAPH_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-GRAPH-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-GRAPH-SCAFFOLD"

/-- Live file basename. -/
def liveRel : String := "EmitGraphScaffold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitGraphScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitGraphScaffoldFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitGraphScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitGraphScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitGraphScaffoldParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitGraphScaffoldSkipFuel : Nat := 8192

/-- Kept commands: namespace, six literal string defs, emitGraphSurfaceOk,
    and end. String-concat defs are skip-folded. No import.
    From EmitGraphScaffold.lean. -/
def liveEmitGraphScaffoldKeptCmds : Nat := 9

/-- theorem keyword count. One theorem: emitGraphReady_true. -/
def liveEmitGraphScaffoldTheoremCount : Nat := 1

/-- example keyword count. Twelve decide examples. -/
def liveEmitGraphScaffoldExampleCount : Nat := 12

/-- set_option keyword count. Two set_option lines. -/
def liveEmitGraphScaffoldSetOptionCount : Nat := 2

/-- Dotted ident `SystemsLean . EmitGraphScaffold`. -/
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
def cmdAddsEmitGraphScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitGraphScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitGraphScaffoldParseFuel body
        && termNoAppN liveEmitGraphScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitGraphScaffoldParseFuel body
        && termNoAppN liveEmitGraphScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdEmitGraphScaffold (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option / open / private /
    un-kernelable. private is not isCmdKw. -/
def parseCmdsEmitGraphScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitGraphScaffold liveEmitGraphScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitGraphScaffoldSkipFuel rest
      if cmdBodyKnownEmitGraphScaffold kn c then
        parseCmdsEmitGraphScaffold n rest2
          (kn ++ cmdAddsEmitGraphScaffold c) (acc ++ [c])
      else
        parseCmdsEmitGraphScaffold n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitGraphScaffold n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitGraphScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitGraphScaffold n rest2 kn acc
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

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live EmitGraphScaffold.lean text.
    Greppable: parseLiveEmitGraphScaffoldSource,
    PARSE-LIVE-EMIT-GRAPH-SCAFFOLD. -/
def parseLiveEmitGraphScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitGraphScaffold liveEmitGraphScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitGraphScaffold"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitGraphScaffold parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveEmitGraphScaffoldSource,
    PARSE-LIVE-EMIT-GRAPH-SCAFFOLD. -/
def kernelCheckLiveEmitGraphScaffoldSource (src : String) : Bool :=
  match parseLiveEmitGraphScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitGraphScaffoldParsed? : Option Module :=
  match parseLiveEmitGraphScaffoldSource liveEmitGraphScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, end, and kernel-checkable defs. Not a lower bound. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | some m => m.commands.length == liveEmitGraphScaffoldKeptCmds
  | none => false

/-- Wrap module lastSeg is EmitGraphScaffold (no module line in the live file). -/
def liveParseHasEmitGraphScaffoldModule : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitGraphScaffold"

/-- Literal defs the kernel must keep. String-concat fragments are not
    in this list. emitGraphSurfaceOk only names those literals. -/
def liveParseHasLiteralDefs : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostEmitGraphId"
      && has "selfHostEmitGraphId"
      && has "acceptancePath"
      && has "hostModulePath"
      && has "ssotArtifactPath"
      && has "emitGraphSurfaceOk"

/-- Live parse has namespace SystemsLean.EmitGraph. -/
def liveParseHasEmitGraphNs : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitGraph"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitGraph. -/
def liveParseHasEmitGraphEnd : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitGraph"
      | _ => false

/-- Live product has no import; parse must not invent one. -/
def liveParseHasNoImport : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Skip-head: def selfHostEmitGraphId and def hostEmitGraphId are in the
    live text (unique to EmitGraphScaffold.lean; not defs in sibling
    Emit* scaffolds). theorem emitGraphReady_true is skip-folded and still
    greppable. Do not use graphHeaderFragment here: a `--` inside an earlier
    string is stripped as a line comment. -/
def liveParseHasCoreDefs : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitGraphScaffoldSource)
    toksHaveDefNamed liveEmitGraphScaffoldSkipFuel toks
      "selfHostEmitGraphId"
      && toksHaveDefNamed liveEmitGraphScaffoldSkipFuel toks
        "hostEmitGraphId"
      && toksHaveTheoremNamed liveEmitGraphScaffoldSkipFuel toks
        "emitGraphReady_true"

/-- Keyword counts from the live text. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitGraphScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitGraphScaffoldSource)
    let fuel := liveEmitGraphScaffoldSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitGraphScaffoldTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitGraphScaffoldExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitGraphScaffoldSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitGraph\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_GRAPH_V0\"\n"

/-- hostEmitGraphId def needle with a trailing newline. -/
def needleHostEmitGraphId : String :=
  "def hostEmitGraphId : String := \"HOST-EMIT-GRAPH\"\n"

/-- selfHostEmitGraphId def needle with a trailing newline. -/
def needleSelfHostEmitGraphId : String :=
  "def selfHostEmitGraphId : String := \"SELF-HOST-EMIT-GRAPH\"\n"

/-- acceptancePath def needle with a trailing newline. -/
def needleAcceptancePath : String :=
  "def acceptancePath : String := \"src/systems/self-host.md\"\n"

/-- hostModulePath def needle with a trailing newline. -/
def needleHostModulePath : String :=
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitGraph.lean\"\n"

/-- ssotArtifactPath def needle with a trailing newline. -/
def needleSsotArtifactPath : String :=
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_graph.ssot.txt\"\n"

/-- Theorem needle with a trailing newline. -/
def needleTheorem : String :=
  "theorem emitGraphReady_true : emitGraphReady = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitGraph\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import needle. graphHeaderFragment is not a token-walk needle. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitGraphScaffoldSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostEmitGraphId).length > 1
    && (src.splitOn needleSelfHostEmitGraphId).length > 1
    && (src.splitOn needleAcceptancePath).length > 1
    && (src.splitOn needleHostModulePath).length > 1
    && (src.splitOn needleSsotArtifactPath).length > 1
    && (src.splitOn needleTheorem).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitGraphScaffoldReady,
    PARSE-LIVE-EMIT-GRAPH-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-GRAPH-SCAFFOLD.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveEmitGraphScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_GRAPH_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-GRAPH-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-GRAPH-SCAFFOLD")
    && (liveRel == "EmitGraphScaffold.lean")
    && (liveEmitGraphScaffoldRel
      == "src/systems/SystemsLean/EmitGraphScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitGraphScaffoldFullHost
    && !hostFrontLiveEmitGraphScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitGraphScaffoldProvablyUnlocked
    && kernelCheckLiveEmitGraphScaffoldSource liveEmitGraphScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasEmitGraphScaffoldModule
    && liveParseHasEmitGraphNs
    && liveParseHasEmitGraphEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitGraphScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitGraphScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-GRAPH-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitGraphScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitGraphScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitGraphScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitGraphScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitGraphScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitGraphScaffold.lean != liveEmitGraphScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitGraphScaffold.lean")
  let r := parseLiveEmitGraphScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-GRAPH-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-GRAPH-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-GRAPH-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitGraphScaffold parse false"
      throw (IO.userError "kernelCheck live EmitGraphScaffold parse false")
    unless hostFrontLiveEmitGraphScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitGraphScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitGraphScaffoldReady false")
    IO.println s!"GREEN {stageId}: live EmitGraphScaffold.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitGraphScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitGraphScaffold
