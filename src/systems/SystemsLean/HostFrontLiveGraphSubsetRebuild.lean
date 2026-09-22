/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/GraphSubsetRebuild.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is GraphSubsetRebuild.lean. Theorems and examples in that file are
  skip-folded. They are not deleted.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, open, and set_option are skipped.
  Not GraphSubsetRebuildMain.lean. Not Linear.lean.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def graphSubsetRebuildLlvmUnlocked is false.
  The live def graphSubsetRebuildProvablyUnlocked is false.
  The live def stillUsesLake is true.
  Those live defs are not this wrap's backend claim.
  The provably flag on this wrap stays false.
  Product stage id SLAKE_GRAPH_SUBSET_REBUILD_V0 stays in the live file.
  Hyphenated product ids HOST-GRAPH-SUBSET-REBUILD and GRAPH-SUBSET-REBUILD
  stay in the live file. This wrap does not mint a second product stage id.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-GRAPH-SUBSET-REBUILD,
  SLAKE_HOST_FRONT_LIVE_GRAPH_SUBSET_REBUILD_V0,
  PARSE-LIVE-GRAPH-SUBSET-REBUILD, GRAPH-SUBSET-REBUILD-THEOREM, liveRel,
  kernelCheckLiveGraphSubsetRebuildSource,
  hostFrontLiveGraphSubsetRebuildReady.
  Module: SystemsLean.HostFrontLiveGraphSubsetRebuild
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveGraphSubsetRebuildSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveGraphSubsetRebuild

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_GRAPH_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-GRAPH-SUBSET-REBUILD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-GRAPH-SUBSET-REBUILD"

/-- Live file basename. Exactly GraphSubsetRebuild.lean, not the Main file. -/
def liveRel : String := "GraphSubsetRebuild.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGraphSubsetRebuildRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveGraphSubsetRebuildFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def graphSubsetRebuildLlvmUnlocked is false. That def is not this flag. -/
def hostFrontLiveGraphSubsetRebuildFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveGraphSubsetRebuildResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def graphSubsetRebuildProvablyUnlocked is false. That def is not this flag. -/
def hostFrontLiveGraphSubsetRebuildProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveGraphSubsetRebuildParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable.
    Also walks the token list for theorem / example / set_option counts. -/
def liveGraphSubsetRebuildSkipFuel : Nat := 32768

/-- Kept commands: one import, namespace, fourteen kernel-checkable literal
    defs, and end. Not 34 (that was SubsetFront). From GraphSubsetRebuild.lean.
    graphSubsetRebuildInputId is kept: GraphSubsetEmit.stageId folds to the
    already-known const stageId. emitHeaderBase and emitSourceBase do not.
    && chains, open, theorem, example, set_option, and IO are skip-folded. -/
def liveGraphSubsetRebuildKeptCmds : Nat := 17

/-- theorem keyword count. GraphSubsetRebuild.lean has ten theorems.
    The skip-fold does not keep them. -/
def liveGraphSubsetRebuildTheoremCount : Nat := 10

/-- example keyword count. GraphSubsetRebuild.lean has eighteen examples.
    The skip-fold does not keep them. -/
def liveGraphSubsetRebuildExampleCount : Nat := 18

/-- set_option keyword count. GraphSubsetRebuild.lean has one set_option.
    The skip-fold does not keep it. -/
def liveGraphSubsetRebuildSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . GraphSubsetRebuild`. -/
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
def cmdAddsGraphSubsetRebuild (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded. -/
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

/-- Body is kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownGraphSubsetRebuild (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveGraphSubsetRebuildParseFuel body
        && termNoAppN liveGraphSubsetRebuildParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveGraphSubsetRebuildParseFuel body
        && termNoAppN liveGraphSubsetRebuildParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, open, and set_option are not parsed here. -/
def parseOneCmdGraphSubsetRebuild (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, open, set_option, and un-kernelable defs. -/
def parseCmdsGraphSubsetRebuild : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdGraphSubsetRebuild liveGraphSubsetRebuildParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveGraphSubsetRebuildSkipFuel rest
      if cmdBodyKnownGraphSubsetRebuild kn c then
        parseCmdsGraphSubsetRebuild n rest2
          (kn ++ cmdAddsGraphSubsetRebuild c) (acc ++ [c])
      else
        parseCmdsGraphSubsetRebuild n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveGraphSubsetRebuildSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsGraphSubsetRebuild n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live GraphSubsetRebuild.lean text.
    Greppable: parseLiveGraphSubsetRebuildSource,
    PARSE-LIVE-GRAPH-SUBSET-REBUILD. -/
def parseLiveGraphSubsetRebuildSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsGraphSubsetRebuild liveGraphSubsetRebuildParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.GraphSubsetRebuild"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live GraphSubsetRebuild parse. Not a fixture.
    Greppable: kernelCheckLiveGraphSubsetRebuildSource,
    PARSE-LIVE-GRAPH-SUBSET-REBUILD. -/
def kernelCheckLiveGraphSubsetRebuildSource (src : String) : Bool :=
  match parseLiveGraphSubsetRebuildSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveGraphSubsetRebuildParsed? : Option Module :=
  match parseLiveGraphSubsetRebuildSource liveGraphSubsetRebuildSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveGraphSubsetRebuildParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Import, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveGraphSubsetRebuildParsed? with
  | some m => m.commands.length == liveGraphSubsetRebuildKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveGraphSubsetRebuildParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "surfaceId"
      && has "graphSubsetRebuildInputId"
      && has "lakeExeName"
      && has "justRecipe"
      && has "stillUsesLake"
      && has "dependsOnLake"
      && has "graphSubsetRebuildLlvmUnlocked"
      && has "graphSubsetRebuildProvablyUnlocked"

/-- Wrap module lastSeg is GraphSubsetRebuild (no module line in the live file). -/
def liveParseHasGraphSubsetRebuildModule : Bool :=
  match liveGraphSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.GraphSubsetRebuild"
      && lastSeg m.name.raw == "GraphSubsetRebuild"

/-- Live parse has namespace SystemsLean.GraphSubsetRebuild. -/
def liveParseHasGraphSubsetRebuildNs : Bool :=
  match liveGraphSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.GraphSubsetRebuild"
      | _ => false

/-- Live parse ends namespace SystemsLean.GraphSubsetRebuild. -/
def liveParseHasGraphSubsetRebuildEnd : Bool :=
  match liveGraphSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.GraphSubsetRebuild"
      | _ => false

/-- Live parse imports SystemsLean.GraphSubsetEmit. -/
def liveParseHasGraphSubsetEmitImport : Bool :=
  match liveGraphSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.GraphSubsetEmit"
      | _ => false

/-- Keyword counts: ten theorems, eighteen examples, one set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveGraphSubsetRebuildParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveGraphSubsetRebuildSource)
    let fuel := liveGraphSubsetRebuildSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveGraphSubsetRebuildTheoremCount
      && toksCountKw fuel toks "example" 0 == liveGraphSubsetRebuildExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveGraphSubsetRebuildSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportGraphSubsetEmit : String := "import SystemsLean.GraphSubsetEmit\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.GraphSubsetRebuild\n"

/-- stageId def needle with a trailing newline.
    Product stage id, not this wrap's stage id. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n"

/-- hostId def needle with a trailing newline.
    Hyphenated product id HOST-GRAPH-SUBSET-REBUILD. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n"

/-- surfaceId def needle with a trailing newline.
    Hyphenated product id GRAPH-SUBSET-REBUILD. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"GRAPH-SUBSET-REBUILD\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- dependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String := "def dependsOnLake : Bool := true\n"

/-- graphSubsetRebuildLlvmUnlocked def needle with a trailing newline.
    Not the LlvmHold name llvmUnlocked. -/
def needleLlvmUnlocked : String :=
  "def graphSubsetRebuildLlvmUnlocked : Bool := false\n"

/-- graphSubsetRebuildProvablyUnlocked def needle with a trailing newline.
    Not the LlvmHold name provablyUnlocked. -/
def needleProvablyUnlocked : String :=
  "def graphSubsetRebuildProvablyUnlocked : Bool := false\n"

/-- End needle with a trailing newline.
    Not end SystemsLean.GraphSubsetRebuildMain. -/
def needleEnd : String := "end SystemsLean.GraphSubsetRebuild\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.GraphSubsetRebuild. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveGraphSubsetRebuildSource
  (src.splitOn needleImportGraphSubsetEmit).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleProvablyUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveGraphSubsetRebuildReady,
    PARSE-LIVE-GRAPH-SUBSET-REBUILD,
    HOST-FRONT-LIVE-GRAPH-SUBSET-REBUILD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveGraphSubsetRebuildReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_GRAPH_SUBSET_REBUILD_V0")
    && (hostId == "HOST-FRONT-LIVE-GRAPH-SUBSET-REBUILD")
    && (parseId == "PARSE-LIVE-GRAPH-SUBSET-REBUILD")
    && (liveRel == "GraphSubsetRebuild.lean")
    && (liveGraphSubsetRebuildRel
      == "src/systems/SystemsLean/GraphSubsetRebuild.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveGraphSubsetRebuildFullHost
    && !hostFrontLiveGraphSubsetRebuildFullBackend
    && !hostFrontLiveGraphSubsetRebuildResidualFreeClaimed
    && !hostFrontLiveGraphSubsetRebuildProvablyUnlocked
    && kernelCheckLiveGraphSubsetRebuildSource liveGraphSubsetRebuildSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasGraphSubsetRebuildModule
    && liveParseHasGraphSubsetRebuildNs
    && liveParseHasGraphSubsetRebuildEnd
    && liveParseHasGraphSubsetEmitImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveGraphSubsetRebuildSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveGraphSubsetRebuild (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-GRAPH-SUBSET-REBUILD =="
  IO.println s!"  host={hostId} file={liveGraphSubsetRebuildRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveGraphSubsetRebuildRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveGraphSubsetRebuildRel}"
    throw (IO.userError s!"missing {liveGraphSubsetRebuildRel}")
  let disk <- IO.FS.readFile path
  if disk != liveGraphSubsetRebuildSource then
    IO.eprintln "error: dual-pin mismatch: on-disk GraphSubsetRebuild.lean != liveGraphSubsetRebuildSource"
    throw (IO.userError "dual-pin mismatch live GraphSubsetRebuild.lean")
  let r := parseLiveGraphSubsetRebuildSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-GRAPH-SUBSET-REBUILD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-GRAPH-SUBSET-REBUILD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    let toks := tokenizeHostTerm (stripComments disk)
    let fuel := liveGraphSubsetRebuildSkipFuel
    let nThm := toksCountKw fuel toks "theorem" 0
    let nEx := toksCountKw fuel toks "example" 0
    let nSet := toksCountKw fuel toks "set_option" 0
    IO.println s!"PASS PARSE-LIVE-GRAPH-SUBSET-REBUILD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    for c in m.commands do
      match c with
      | Cmd.def_ x _ _ => IO.println s!"KEEP def {x.raw}"
      | Cmd.importModule x => IO.println s!"KEEP import {x.raw}"
      | Cmd.namespace x => IO.println s!"KEEP namespace {x.raw}"
      | Cmd.endNamespace x => IO.println s!"KEEP end {x.raw}"
      | _ => IO.println "KEEP other"
    IO.println s!"kw theorem={nThm} example={nEx} set_option={nSet} needles={liveNeedlesOk} literals={liveParseHasLiteralDefs} countOk={liveParseCmdCountOk}"
    unless k do
      IO.eprintln "error: kernelCheck live GraphSubsetRebuild parse false"
      throw (IO.userError "kernelCheck live GraphSubsetRebuild parse false")
    unless hostFrontLiveGraphSubsetRebuildReady do
      IO.eprintln "error: hostFrontLiveGraphSubsetRebuildReady false"
      throw (IO.userError "hostFrontLiveGraphSubsetRebuildReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty GraphSubsetRebuild source was accepted"
      throw (IO.userError "empty GraphSubsetRebuild source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveGraphSubsetRebuild root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveGraphSubsetRebuild
