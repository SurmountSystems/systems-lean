/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/ExtractSubsetRebuild.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ExtractSubsetRebuild.lean. Theorems, examples, and set_option
  in that file are skipped. It is not ExtractSubsetRebuildMain.lean.
  HostFrontLiveExtractSubsetRebuildMain.lean already parses
  ExtractSubsetRebuildMain.lean. This file does not replace that module.
  Literal String and Bool defs stay. A dotted const whose last segment is
  an already-kept def stays (ExtractSubsetEmit.stageId keeps stageId).
  Compound defs are skipped when the body is not kernel-checkable
  (unknown const, string append, IO do, equation heads).
  theorem count is 10. example count is 18. set_option count is 1.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def extractSubsetRebuildLlvmUnlocked is false.
  The live def stillUsesLake is true.
  They are not this wrap's backend claim. The provably flag stays false.
  Hyphenated stage id: EXTRACT-SUBSET-REBUILD.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EXTRACT-SUBSET-REBUILD,
  SLAKE_HOST_FRONT_LIVE_EXTRACT_SUBSET_REBUILD_V0,
  PARSE-LIVE-EXTRACT-SUBSET-REBUILD, EXTRACT-SUBSET-REBUILD, liveRel,
  kernelCheckLiveExtractSubsetRebuildSource,
  hostFrontLiveExtractSubsetRebuildReady.
  Module: SystemsLean.HostFrontLiveExtractSubsetRebuild
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveExtractSubsetRebuildSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveExtractSubsetRebuild

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EXTRACT_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EXTRACT-SUBSET-REBUILD"

/-- Greppable parse id. Hyphenated stage id EXTRACT-SUBSET-REBUILD. -/
def parseId : String := "PARSE-LIVE-EXTRACT-SUBSET-REBUILD"

/-- Live file basename. -/
def liveRel : String := "ExtractSubsetRebuild.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveExtractSubsetRebuildRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveExtractSubsetRebuildFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def extractSubsetRebuildLlvmUnlocked is false. That def is not
    this flag. The live def stillUsesLake is true. That def is not this flag. -/
def hostFrontLiveExtractSubsetRebuildFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveExtractSubsetRebuildResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def extractSubsetRebuildProvablyUnlocked is false.
    That def is not this flag. -/
def hostFrontLiveExtractSubsetRebuildProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveExtractSubsetRebuildParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveExtractSubsetRebuildSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, kernel-checkable literal defs
    (including extractSubsetRebuildInputId, whose body last-segments to
    stageId), and end. Skipped: open, theorem, example, set_option, and
    defs whose bodies are not kernel-checkable.
    From ExtractSubsetRebuild.lean. -/
def liveExtractSubsetRebuildKeptCmds : Nat := 17

/-- theorem keyword count. ExtractSubsetRebuild.lean has 10 theorem commands.
    They are skipped, not kernel-checked. -/
def liveExtractSubsetRebuildTheoremCount : Nat := 10

/-- example keyword count. ExtractSubsetRebuild.lean has 18 example commands.
    They are skipped, not kernel-checked. -/
def liveExtractSubsetRebuildExampleCount : Nat := 18

/-- set_option keyword count. ExtractSubsetRebuild.lean has one set_option. -/
def liveExtractSubsetRebuildSetOptionCount : Nat := 1

/-- Dotted ident, or one already-dotted token from the tokenizer. -/
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
def cmdAddsExtractSubsetRebuild (c : Cmd) : List String :=
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
def cmdBodyKnownExtractSubsetRebuild (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveExtractSubsetRebuildParseFuel body
        && termNoAppN liveExtractSubsetRebuildParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveExtractSubsetRebuildParseFuel body
        && termNoAppN liveExtractSubsetRebuildParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdExtractSubsetRebuild (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, open,
    and un-kernelable defs. -/
def parseCmdsExtractSubsetRebuild : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdExtractSubsetRebuild liveExtractSubsetRebuildParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveExtractSubsetRebuildSkipFuel rest
      if cmdBodyKnownExtractSubsetRebuild kn c then
        parseCmdsExtractSubsetRebuild n rest2
          (kn ++ cmdAddsExtractSubsetRebuild c) (acc ++ [c])
      else
        parseCmdsExtractSubsetRebuild n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveExtractSubsetRebuildSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsExtractSubsetRebuild n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ExtractSubsetRebuild.lean text.
    Greppable: parseLiveExtractSubsetRebuildSource,
    PARSE-LIVE-EXTRACT-SUBSET-REBUILD. -/
def parseLiveExtractSubsetRebuildSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsExtractSubsetRebuild liveExtractSubsetRebuildParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ExtractSubsetRebuild"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ExtractSubsetRebuild parse. Not a fixture.
    Greppable: kernelCheckLiveExtractSubsetRebuildSource,
    PARSE-LIVE-EXTRACT-SUBSET-REBUILD. -/
def kernelCheckLiveExtractSubsetRebuildSource (src : String) : Bool :=
  match parseLiveExtractSubsetRebuildSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveExtractSubsetRebuildParsed? : Option Module :=
  match parseLiveExtractSubsetRebuildSource liveExtractSubsetRebuildSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveExtractSubsetRebuildParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    One import, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveExtractSubsetRebuildParsed? with
  | some m => m.commands.length == liveExtractSubsetRebuildKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, stillUsesLake,
    extractSubsetRebuildLlvmUnlocked,
    extractSubsetRebuildResidualFreeClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveExtractSubsetRebuildParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "stillUsesLake"
      && has "extractSubsetRebuildLlvmUnlocked"
      && has "extractSubsetRebuildResidualFreeClaimed"

/-- Wrap module lastSeg is ExtractSubsetRebuild
    (no module line in the live file). -/
def liveParseHasExtractSubsetRebuildModule : Bool :=
  match liveExtractSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ExtractSubsetRebuild"
      && lastSeg m.name.raw == "ExtractSubsetRebuild"

/-- Live parse has namespace SystemsLean.ExtractSubsetRebuild. -/
def liveParseHasExtractSubsetRebuildNs : Bool :=
  match liveExtractSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ExtractSubsetRebuild"
      | _ => false

/-- Live parse ends namespace SystemsLean.ExtractSubsetRebuild. -/
def liveParseHasExtractSubsetRebuildEnd : Bool :=
  match liveExtractSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ExtractSubsetRebuild"
      | _ => false

/-- Live parse imports SystemsLean.ExtractSubsetEmit. -/
def liveParseHasExtractSubsetEmitImport : Bool :=
  match liveExtractSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ExtractSubsetEmit"
      | _ => false

/-- Keyword counts: theorem 10, example 18, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveExtractSubsetRebuildParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveExtractSubsetRebuildSource)
    let fuel := liveExtractSubsetRebuildSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveExtractSubsetRebuildTheoremCount
      && toksCountKw fuel toks "example" 0 == liveExtractSubsetRebuildExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveExtractSubsetRebuildSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportExtractSubsetEmit : String :=
  "import SystemsLean.ExtractSubsetEmit\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ExtractSubsetRebuild\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-EXTRACT-SUBSET-REBUILD\"\n"

/-- justRecipe def needle with a trailing newline. -/
def needleJustRecipe : String :=
  "def justRecipe : String := \"extract-subset-rebuild\"\n"

/-- extractSubsetRebuildLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def extractSubsetRebuildLlvmUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ExtractSubsetRebuild\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ExtractSubsetRebuild. -/
def liveNeedlesOk : Bool :=
  let src := liveExtractSubsetRebuildSource
  (src.splitOn needleImportExtractSubsetEmit).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleJustRecipe).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveExtractSubsetRebuildReady,
    PARSE-LIVE-EXTRACT-SUBSET-REBUILD,
    HOST-FRONT-LIVE-EXTRACT-SUBSET-REBUILD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveExtractSubsetRebuildReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EXTRACT_SUBSET_REBUILD_V0")
    && (hostId == "HOST-FRONT-LIVE-EXTRACT-SUBSET-REBUILD")
    && (parseId == "PARSE-LIVE-EXTRACT-SUBSET-REBUILD")
    && (liveRel == "ExtractSubsetRebuild.lean")
    && (liveExtractSubsetRebuildRel
      == "src/systems/SystemsLean/ExtractSubsetRebuild.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveExtractSubsetRebuildFullHost
    && !hostFrontLiveExtractSubsetRebuildFullBackend
    && !hostFrontLiveExtractSubsetRebuildResidualFreeClaimed
    && !hostFrontLiveExtractSubsetRebuildProvablyUnlocked
    && kernelCheckLiveExtractSubsetRebuildSource liveExtractSubsetRebuildSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasExtractSubsetRebuildModule
    && liveParseHasExtractSubsetRebuildNs
    && liveParseHasExtractSubsetRebuildEnd
    && liveParseHasExtractSubsetEmitImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveExtractSubsetRebuildSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveExtractSubsetRebuild (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EXTRACT-SUBSET-REBUILD =="
  IO.println s!"  host={hostId} file={liveExtractSubsetRebuildRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveExtractSubsetRebuildRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveExtractSubsetRebuildRel}"
    throw (IO.userError s!"missing {liveExtractSubsetRebuildRel}")
  let disk <- IO.FS.readFile path
  if disk != liveExtractSubsetRebuildSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ExtractSubsetRebuild.lean != liveExtractSubsetRebuildSource"
    throw (IO.userError "dual-pin mismatch live ExtractSubsetRebuild.lean")
  let r := parseLiveExtractSubsetRebuildSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EXTRACT-SUBSET-REBUILD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EXTRACT-SUBSET-REBUILD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EXTRACT-SUBSET-REBUILD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ExtractSubsetRebuild parse false"
      throw (IO.userError "kernelCheck live ExtractSubsetRebuild parse false")
    unless hostFrontLiveExtractSubsetRebuildReady do
      IO.eprintln "error: hostFrontLiveExtractSubsetRebuildReady false"
      IO.eprintln s!"  diag count={liveParseCmdCountOk} kw={liveParseKwCountsOk} needles={liveNeedlesOk} literals={liveParseHasLiteralDefs} mod={liveParseHasExtractSubsetRebuildModule} ns={liveParseHasExtractSubsetRebuildNs} endNs={liveParseHasExtractSubsetRebuildEnd} imp={liveParseHasExtractSubsetEmitImport} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveExtractSubsetRebuildReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ExtractSubsetRebuild source was accepted"
      throw (IO.userError "empty ExtractSubsetRebuild source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveExtractSubsetRebuild root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveExtractSubsetRebuild
