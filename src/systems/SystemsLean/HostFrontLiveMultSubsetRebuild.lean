/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/MultSubsetRebuild.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is MultSubsetRebuild.lean. It is not MultSubsetRebuildMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option are skip-folded.
  FullHost stays false. Not Lake-gone. Not Slake typechecking src/systems
  as a compiler. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def multSubsetRebuildLlvmUnlocked is false.
  That def is not this wrap's backend claim. The provably flag stays false.
  Main entry lives here because HostFrontLiveMultSubsetRebuildMain.lean
  is a different module (MultSubsetRebuildMain.lean). Do not use that path.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-MULT-SUBSET-REBUILD,
  SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_REBUILD_V0,
  PARSE-LIVE-MULT-SUBSET-REBUILD, MULT-SUBSET-REBUILD, liveRel,
  kernelCheckLiveMultSubsetRebuildSource,
  hostFrontLiveMultSubsetRebuildReady.
  Module: SystemsLean.HostFrontLiveMultSubsetRebuild
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveMultSubsetRebuildSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMultSubsetRebuild

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-MULT-SUBSET-REBUILD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT-SUBSET-REBUILD"

/-- Live file basename. -/
def liveRel : String := "MultSubsetRebuild.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultSubsetRebuildRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultSubsetRebuildFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultSubsetRebuildResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def multSubsetRebuildProvablyUnlocked is false. -/
def hostFrontLiveMultSubsetRebuildProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveMultSubsetRebuildParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveMultSubsetRebuildSkipFuel : Nat := 16384

/-- Kept commands: one import, namespace, literal defs, the bool
    conjunction of three literal bools, its alias, and end.
    Dotted consts, string-append, unknown consts, theorem, example,
    set_option, open, and IO mains are skip-folded.
    From MultSubsetRebuild.lean. -/
def liveMultSubsetRebuildKeptCmds : Nat := 20

/-- theorem keyword count. MultSubsetRebuild.lean has eleven theorems. -/
def liveMultSubsetRebuildTheoremCount : Nat := 11

/-- example keyword count. MultSubsetRebuild.lean has twenty-one examples. -/
def liveMultSubsetRebuildExampleCount : Nat := 21

/-- set_option keyword count. MultSubsetRebuild.lean has one set_option. -/
def liveMultSubsetRebuildSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . MultSubsetRebuild`. -/
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
def cmdAddsMultSubsetRebuild (c : Cmd) : List String :=
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
def cmdBodyKnownMultSubsetRebuild (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultSubsetRebuildParseFuel body
        && termNoAppN liveMultSubsetRebuildParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultSubsetRebuildParseFuel body
        && termNoAppN liveMultSubsetRebuildParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdMultSubsetRebuild (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, open, and un-kernelable defs. -/
def parseCmdsMultSubsetRebuild : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdMultSubsetRebuild liveMultSubsetRebuildParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveMultSubsetRebuildSkipFuel rest
      if cmdBodyKnownMultSubsetRebuild kn c then
        parseCmdsMultSubsetRebuild n rest2
          (kn ++ cmdAddsMultSubsetRebuild c) (acc ++ [c])
      else
        parseCmdsMultSubsetRebuild n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveMultSubsetRebuildSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsMultSubsetRebuild n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live MultSubsetRebuild.lean text.
    Greppable: parseLiveMultSubsetRebuildSource,
    PARSE-LIVE-MULT-SUBSET-REBUILD. -/
def parseLiveMultSubsetRebuildSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMultSubsetRebuild liveMultSubsetRebuildParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.MultSubsetRebuild"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live MultSubsetRebuild parse. Not a fixture.
    Greppable: kernelCheckLiveMultSubsetRebuildSource,
    PARSE-LIVE-MULT-SUBSET-REBUILD. -/
def kernelCheckLiveMultSubsetRebuildSource (src : String) : Bool :=
  match parseLiveMultSubsetRebuildSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveMultSubsetRebuildParsed? : Option Module :=
  match parseLiveMultSubsetRebuildSource liveMultSubsetRebuildSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultSubsetRebuildParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Import, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveMultSubsetRebuildParsed? with
  | some m => m.commands.length == liveMultSubsetRebuildKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveMultSubsetRebuildParsed? with
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
      && has "stillUsesLake"
      && has "dependsOnLake"
      && has "multSubsetRebuildLlvmUnlocked"
      && has "multSubsetRebuildProvablyUnlocked"

/-- Wrap module lastSeg is MultSubsetRebuild (no module line in the live file). -/
def liveParseHasMultSubsetRebuildModule : Bool :=
  match liveMultSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.MultSubsetRebuild"
      && lastSeg m.name.raw == "MultSubsetRebuild"

/-- Live parse has namespace SystemsLean.MultSubsetRebuild. -/
def liveParseHasMultSubsetRebuildNs : Bool :=
  match liveMultSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.MultSubsetRebuild"
      | _ => false

/-- Live parse ends namespace SystemsLean.MultSubsetRebuild. -/
def liveParseHasMultSubsetRebuildEnd : Bool :=
  match liveMultSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.MultSubsetRebuild"
      | _ => false

/-- Live parse imports SystemsLean.MultSubsetEmit. -/
def liveParseHasMultSubsetEmitImport : Bool :=
  match liveMultSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.MultSubsetEmit"
      | _ => false

/-- Keyword counts: eleven theorems, twenty-one examples, one set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveMultSubsetRebuildParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveMultSubsetRebuildSource)
    let fuel := liveMultSubsetRebuildSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveMultSubsetRebuildTheoremCount
      && toksCountKw fuel toks "example" 0 == liveMultSubsetRebuildExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveMultSubsetRebuildSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportMultSubsetEmit : String :=
  "import SystemsLean.MultSubsetEmit\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.MultSubsetRebuild\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_MULT_SUBSET_REBUILD_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-MULT-SUBSET-REBUILD\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"MULT-SUBSET-REBUILD\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- dependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String := "def dependsOnLake : Bool := true\n"

/-- multSubsetRebuildLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def multSubsetRebuildLlvmUnlocked : Bool := false\n"

/-- multSubsetRebuildProvablyUnlocked def needle with a trailing newline. -/
def needleProvablyUnlocked : String :=
  "def multSubsetRebuildProvablyUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.MultSubsetRebuild\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveMultSubsetRebuildSource
  (src.splitOn needleImportMultSubsetEmit).length > 1
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
    Greppable: hostFrontLiveMultSubsetRebuildReady,
    PARSE-LIVE-MULT-SUBSET-REBUILD,
    HOST-FRONT-LIVE-MULT-SUBSET-REBUILD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveMultSubsetRebuildReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_REBUILD_V0")
    && (hostId == "HOST-FRONT-LIVE-MULT-SUBSET-REBUILD")
    && (parseId == "PARSE-LIVE-MULT-SUBSET-REBUILD")
    && (liveRel == "MultSubsetRebuild.lean")
    && (liveMultSubsetRebuildRel
      == "src/systems/SystemsLean/MultSubsetRebuild.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveMultSubsetRebuildFullHost
    && !hostFrontLiveMultSubsetRebuildResidualFreeClaimed
    && !hostFrontLiveMultSubsetRebuildProvablyUnlocked
    && kernelCheckLiveMultSubsetRebuildSource liveMultSubsetRebuildSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasMultSubsetRebuildModule
    && liveParseHasMultSubsetRebuildNs
    && liveParseHasMultSubsetRebuildEnd
    && liveParseHasMultSubsetEmitImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultSubsetRebuildSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveMultSubsetRebuild (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT-SUBSET-REBUILD =="
  IO.println s!"  host={hostId} file={liveMultSubsetRebuildRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveMultSubsetRebuildRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultSubsetRebuildRel}"
    throw (IO.userError s!"missing {liveMultSubsetRebuildRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultSubsetRebuildSource then
    IO.eprintln "error: dual-pin mismatch: on-disk MultSubsetRebuild.lean != liveMultSubsetRebuildSource"
    throw (IO.userError "dual-pin mismatch live MultSubsetRebuild.lean")
  let r := parseLiveMultSubsetRebuildSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT-SUBSET-REBUILD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT-SUBSET-REBUILD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT-SUBSET-REBUILD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live MultSubsetRebuild parse false"
      throw (IO.userError "kernelCheck live MultSubsetRebuild parse false")
    unless hostFrontLiveMultSubsetRebuildReady do
      IO.eprintln "error: hostFrontLiveMultSubsetRebuildReady false"
      throw (IO.userError "hostFrontLiveMultSubsetRebuildReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty MultSubsetRebuild source was accepted"
      throw (IO.userError "empty MultSubsetRebuild source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMultSubsetRebuild root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMultSubsetRebuild
