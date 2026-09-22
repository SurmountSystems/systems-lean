/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/ComposeSubsetRebuild.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ComposeSubsetRebuild.lean. Theorems, examples, and set_option
  in that file are skipped. It is not ComposeSubsetRebuildMain.lean.
  HostFrontLiveComposeSubsetRebuildMain.lean is a thin forwarder for this
  wrap. It does not parse ComposeSubsetRebuildMain.lean.
  Literal String and Bool defs stay. A dotted const whose last segment is
  an already-kept def stays (ComposeSubsetEmit.stageId keeps stageId).
  Compound defs are skipped when the body is not kernel-checkable
  (unknown const, string append, IO do, equation heads).
  theorem count is 10. example count is 18. set_option count is 1.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def composeSubsetRebuildLlvmUnlocked is false.
  The live def stillUsesLake is true.
  They are not this wrap's backend claim. The provably flag stays false.
  Hyphenated stage id: COMPOSE-SUBSET-REBUILD.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD,
  SLAKE_HOST_FRONT_LIVE_COMPOSE_SUBSET_REBUILD_V0,
  PARSE-LIVE-COMPOSE-SUBSET-REBUILD, COMPOSE-SUBSET-REBUILD, liveRel,
  kernelCheckLiveComposeSubsetRebuildSource,
  hostFrontLiveComposeSubsetRebuildReady.
  Module: SystemsLean.HostFrontLiveComposeSubsetRebuild
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveComposeSubsetRebuildSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveComposeSubsetRebuild

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPOSE_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD"

/-- Greppable parse id. Hyphenated stage id COMPOSE-SUBSET-REBUILD. -/
def parseId : String := "PARSE-LIVE-COMPOSE-SUBSET-REBUILD"

/-- Live file basename. -/
def liveRel : String := "ComposeSubsetRebuild.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveComposeSubsetRebuildRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveComposeSubsetRebuildFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def composeSubsetRebuildLlvmUnlocked is false. That def is not
    this flag. The live def stillUsesLake is true. That def is not this flag. -/
def hostFrontLiveComposeSubsetRebuildFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveComposeSubsetRebuildResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def composeSubsetRebuildProvablyUnlocked is false.
    That def is not this flag. -/
def hostFrontLiveComposeSubsetRebuildProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveComposeSubsetRebuildParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveComposeSubsetRebuildSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, kernel-checkable literal defs
    (including composeSubsetRebuildInputId, whose body last-segments to
    stageId), and end. Skipped: open, theorem, example, set_option, and
    defs whose bodies are not kernel-checkable.
    From ComposeSubsetRebuild.lean. -/
def liveComposeSubsetRebuildKeptCmds : Nat := 17

/-- theorem keyword count. ComposeSubsetRebuild.lean has 10 theorem commands.
    They are skipped, not kernel-checked. -/
def liveComposeSubsetRebuildTheoremCount : Nat := 10

/-- example keyword count. ComposeSubsetRebuild.lean has 18 example commands.
    They are skipped, not kernel-checked. -/
def liveComposeSubsetRebuildExampleCount : Nat := 18

/-- set_option keyword count. ComposeSubsetRebuild.lean has one set_option. -/
def liveComposeSubsetRebuildSetOptionCount : Nat := 1

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
def cmdAddsComposeSubsetRebuild (c : Cmd) : List String :=
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
def cmdBodyKnownComposeSubsetRebuild (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveComposeSubsetRebuildParseFuel body
        && termNoAppN liveComposeSubsetRebuildParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveComposeSubsetRebuildParseFuel body
        && termNoAppN liveComposeSubsetRebuildParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdComposeSubsetRebuild (fuel : Nat) (toks : List String) :
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
def parseCmdsComposeSubsetRebuild : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdComposeSubsetRebuild liveComposeSubsetRebuildParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveComposeSubsetRebuildSkipFuel rest
      if cmdBodyKnownComposeSubsetRebuild kn c then
        parseCmdsComposeSubsetRebuild n rest2
          (kn ++ cmdAddsComposeSubsetRebuild c) (acc ++ [c])
      else
        parseCmdsComposeSubsetRebuild n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveComposeSubsetRebuildSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsComposeSubsetRebuild n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ComposeSubsetRebuild.lean text.
    Greppable: parseLiveComposeSubsetRebuildSource,
    PARSE-LIVE-COMPOSE-SUBSET-REBUILD. -/
def parseLiveComposeSubsetRebuildSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsComposeSubsetRebuild liveComposeSubsetRebuildParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ComposeSubsetRebuild"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ComposeSubsetRebuild parse. Not a fixture.
    Greppable: kernelCheckLiveComposeSubsetRebuildSource,
    PARSE-LIVE-COMPOSE-SUBSET-REBUILD. -/
def kernelCheckLiveComposeSubsetRebuildSource (src : String) : Bool :=
  match parseLiveComposeSubsetRebuildSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveComposeSubsetRebuildParsed? : Option Module :=
  match parseLiveComposeSubsetRebuildSource liveComposeSubsetRebuildSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveComposeSubsetRebuildParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    One import, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveComposeSubsetRebuildParsed? with
  | some m => m.commands.length == liveComposeSubsetRebuildKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, stillUsesLake,
    composeSubsetRebuildLlvmUnlocked,
    composeSubsetRebuildResidualFreeClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveComposeSubsetRebuildParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "stillUsesLake"
      && has "composeSubsetRebuildLlvmUnlocked"
      && has "composeSubsetRebuildResidualFreeClaimed"

/-- Wrap module lastSeg is ComposeSubsetRebuild
    (no module line in the live file). -/
def liveParseHasComposeSubsetRebuildModule : Bool :=
  match liveComposeSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ComposeSubsetRebuild"
      && lastSeg m.name.raw == "ComposeSubsetRebuild"

/-- Live parse has namespace SystemsLean.ComposeSubsetRebuild. -/
def liveParseHasComposeSubsetRebuildNs : Bool :=
  match liveComposeSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ComposeSubsetRebuild"
      | _ => false

/-- Live parse ends namespace SystemsLean.ComposeSubsetRebuild. -/
def liveParseHasComposeSubsetRebuildEnd : Bool :=
  match liveComposeSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ComposeSubsetRebuild"
      | _ => false

/-- Live parse imports SystemsLean.ComposeSubsetEmit. -/
def liveParseHasComposeSubsetEmitImport : Bool :=
  match liveComposeSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ComposeSubsetEmit"
      | _ => false

/-- Keyword counts: theorem 10, example 18, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveComposeSubsetRebuildParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveComposeSubsetRebuildSource)
    let fuel := liveComposeSubsetRebuildSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveComposeSubsetRebuildTheoremCount
      && toksCountKw fuel toks "example" 0 == liveComposeSubsetRebuildExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveComposeSubsetRebuildSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportComposeSubsetEmit : String :=
  "import SystemsLean.ComposeSubsetEmit\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ComposeSubsetRebuild\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-COMPOSE-SUBSET-REBUILD\"\n"

/-- justRecipe def needle with a trailing newline. -/
def needleJustRecipe : String :=
  "def justRecipe : String := \"compose-subset-rebuild\"\n"

/-- composeSubsetRebuildLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def composeSubsetRebuildLlvmUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ComposeSubsetRebuild\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ComposeSubsetRebuild. -/
def liveNeedlesOk : Bool :=
  let src := liveComposeSubsetRebuildSource
  (src.splitOn needleImportComposeSubsetEmit).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleJustRecipe).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveComposeSubsetRebuildReady,
    PARSE-LIVE-COMPOSE-SUBSET-REBUILD,
    HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveComposeSubsetRebuildReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPOSE_SUBSET_REBUILD_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD")
    && (parseId == "PARSE-LIVE-COMPOSE-SUBSET-REBUILD")
    && (liveRel == "ComposeSubsetRebuild.lean")
    && (liveComposeSubsetRebuildRel
      == "src/systems/SystemsLean/ComposeSubsetRebuild.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveComposeSubsetRebuildFullHost
    && !hostFrontLiveComposeSubsetRebuildFullBackend
    && !hostFrontLiveComposeSubsetRebuildResidualFreeClaimed
    && !hostFrontLiveComposeSubsetRebuildProvablyUnlocked
    && kernelCheckLiveComposeSubsetRebuildSource liveComposeSubsetRebuildSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasComposeSubsetRebuildModule
    && liveParseHasComposeSubsetRebuildNs
    && liveParseHasComposeSubsetRebuildEnd
    && liveParseHasComposeSubsetEmitImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveComposeSubsetRebuildSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveComposeSubsetRebuild (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPOSE-SUBSET-REBUILD =="
  IO.println s!"  host={hostId} file={liveComposeSubsetRebuildRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveComposeSubsetRebuildRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveComposeSubsetRebuildRel}"
    throw (IO.userError s!"missing {liveComposeSubsetRebuildRel}")
  let disk <- IO.FS.readFile path
  if disk != liveComposeSubsetRebuildSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ComposeSubsetRebuild.lean != liveComposeSubsetRebuildSource"
    throw (IO.userError "dual-pin mismatch live ComposeSubsetRebuild.lean")
  let r := parseLiveComposeSubsetRebuildSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPOSE-SUBSET-REBUILD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPOSE-SUBSET-REBUILD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPOSE-SUBSET-REBUILD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ComposeSubsetRebuild parse false"
      throw (IO.userError "kernelCheck live ComposeSubsetRebuild parse false")
    unless hostFrontLiveComposeSubsetRebuildReady do
      IO.eprintln "error: hostFrontLiveComposeSubsetRebuildReady false"
      IO.eprintln s!"  diag count={liveParseCmdCountOk} kw={liveParseKwCountsOk} needles={liveNeedlesOk} literals={liveParseHasLiteralDefs} mod={liveParseHasComposeSubsetRebuildModule} ns={liveParseHasComposeSubsetRebuildNs} endNs={liveParseHasComposeSubsetRebuildEnd} imp={liveParseHasComposeSubsetEmitImport} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveComposeSubsetRebuildReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ComposeSubsetRebuild source was accepted"
      throw (IO.userError "empty ComposeSubsetRebuild source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveComposeSubsetRebuild root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveComposeSubsetRebuild
