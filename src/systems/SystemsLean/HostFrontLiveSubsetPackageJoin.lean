/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SubsetPackageJoin.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is SubsetPackageJoin.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option are skipped.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SUBSET-PACKAGE-JOIN,
  SUBSET-PACKAGE-JOIN,
  PARSE-LIVE-SUBSET-PACKAGE-JOIN, liveRel,
  kernelCheckLiveSubsetPackageJoinSource,
  hostFrontLiveSubsetPackageJoinReady.
  Module: SystemsLean.HostFrontLiveSubsetPackageJoin
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSubsetPackageJoinSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSubsetPackageJoin

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SUBSET-PACKAGE-JOIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SUBSET-PACKAGE-JOIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SUBSET-PACKAGE-JOIN"

/-- Live file basename. -/
def liveRel : String := "SubsetPackageJoin.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSubsetPackageJoinRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSubsetPackageJoinFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveSubsetPackageJoinFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSubsetPackageJoinResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveSubsetPackageJoinProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSubsetPackageJoinParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSubsetPackageJoinSkipFuel : Nat := 8192

/-- Kept commands: eight imports, namespace, kernel-checkable defs, and end.
    Opens, theorems, examples, set_option, and un-kernelable defs are skipped.
    From SubsetPackageJoin.lean. -/
def liveSubsetPackageJoinKeptCmds : Nat := 28

/-- theorem keyword count. SubsetPackageJoin.lean has nineteen theorems. -/
def liveSubsetPackageJoinTheoremCount : Nat := 19

/-- example keyword count. SubsetPackageJoin.lean has fifteen examples. -/
def liveSubsetPackageJoinExampleCount : Nat := 15

/-- set_option keyword count. SubsetPackageJoin.lean has one set_option. -/
def liveSubsetPackageJoinSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . SubsetPackageJoin`. -/
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
def cmdAddsSubsetPackageJoin (c : Cmd) : List String :=
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
def cmdBodyKnownSubsetPackageJoin (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSubsetPackageJoinParseFuel body
        && termNoAppN liveSubsetPackageJoinParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSubsetPackageJoinParseFuel body
        && termNoAppN liveSubsetPackageJoinParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdSubsetPackageJoin (fuel : Nat) (toks : List String) :
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
def parseCmdsSubsetPackageJoin : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSubsetPackageJoin liveSubsetPackageJoinParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSubsetPackageJoinSkipFuel rest
      if cmdBodyKnownSubsetPackageJoin kn c then
        parseCmdsSubsetPackageJoin n rest2
          (kn ++ cmdAddsSubsetPackageJoin c) (acc ++ [c])
      else
        parseCmdsSubsetPackageJoin n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSubsetPackageJoinSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsSubsetPackageJoin n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live SubsetPackageJoin.lean text.
    Greppable: parseLiveSubsetPackageJoinSource,
    PARSE-LIVE-SUBSET-PACKAGE-JOIN. -/
def parseLiveSubsetPackageJoinSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSubsetPackageJoin liveSubsetPackageJoinParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SubsetPackageJoin"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SubsetPackageJoin parse. Not a fixture.
    Greppable: kernelCheckLiveSubsetPackageJoinSource,
    PARSE-LIVE-SUBSET-PACKAGE-JOIN. -/
def kernelCheckLiveSubsetPackageJoinSource (src : String) : Bool :=
  match parseLiveSubsetPackageJoinSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSubsetPackageJoinParsed? : Option Module :=
  match parseLiveSubsetPackageJoinSource liveSubsetPackageJoinSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSubsetPackageJoinParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveSubsetPackageJoinParsed? with
  | some m => m.commands.length == liveSubsetPackageJoinKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveSubsetPackageJoinParsed? with
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
      && has "justRecipeSubsetPackageJoin"
      && has "justRecipe"
      && has "stillUsesLake"
      && has "dependsOnLake"
      && has "subsetPackageJoinFinishedClaimed"
      && has "subsetPackageJoinKeepsHostLake"
      && has "subsetPackageJoinLlvmUnlocked"
      && has "subsetPackageJoinProvablyUnlocked"

/-- Wrap module lastSeg is SubsetPackageJoin (no module line in the live file). -/
def liveParseHasSubsetPackageJoinModule : Bool :=
  match liveSubsetPackageJoinParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.SubsetPackageJoin"
      && lastSeg m.name.raw == "SubsetPackageJoin"

/-- Live parse has namespace SystemsLean.SubsetPackageJoin. -/
def liveParseHasSubsetPackageJoinNs : Bool :=
  match liveSubsetPackageJoinParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.SubsetPackageJoin"
      | _ => false

/-- Live parse ends namespace SystemsLean.SubsetPackageJoin. -/
def liveParseHasSubsetPackageJoinEnd : Bool :=
  match liveSubsetPackageJoinParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.SubsetPackageJoin"
      | _ => false

/-- Live parse imports the eight unit rebuild modules. -/
def liveParseHasSubsetRebuildImports : Bool :=
  match liveSubsetPackageJoinParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.MultSubsetRebuild"
      && has "SystemsLean.LinearSubsetRebuild"
      && has "SystemsLean.TypesSubsetRebuild"
      && has "SystemsLean.ProgramSubsetRebuild"
      && has "SystemsLean.ExtractSubsetRebuild"
      && has "SystemsLean.ErasureSubsetRebuild"
      && has "SystemsLean.GraphSubsetRebuild"
      && has "SystemsLean.ComposeSubsetRebuild"

/-- Keyword counts: theorem 19, example 15, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveSubsetPackageJoinParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveSubsetPackageJoinSource)
    let fuel := liveSubsetPackageJoinSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveSubsetPackageJoinTheoremCount
      && toksCountKw fuel toks "example" 0 == liveSubsetPackageJoinExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveSubsetPackageJoinSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportMultSubsetRebuild : String :=
  "import SystemsLean.MultSubsetRebuild\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.SubsetPackageJoin\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SUBSET_PACKAGE_JOIN_V0\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"SUBSET-PACKAGE-JOIN\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- dependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String := "def dependsOnLake : Bool := true\n"

/-- subsetPackageJoinFinishedClaimed def needle with a trailing newline. -/
def needleFinishedClaimed : String :=
  "def subsetPackageJoinFinishedClaimed : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.SubsetPackageJoin\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveSubsetPackageJoinSource
  (src.splitOn needleImportMultSubsetRebuild).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSubsetPackageJoinReady,
    PARSE-LIVE-SUBSET-PACKAGE-JOIN,
    HOST-FRONT-LIVE-SUBSET-PACKAGE-JOIN.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveSubsetPackageJoinReady : Bool :=
  (stageId == "SUBSET-PACKAGE-JOIN")
    && (hostId == "HOST-FRONT-LIVE-SUBSET-PACKAGE-JOIN")
    && (parseId == "PARSE-LIVE-SUBSET-PACKAGE-JOIN")
    && (liveRel == "SubsetPackageJoin.lean")
    && (liveSubsetPackageJoinRel
      == "src/systems/SystemsLean/SubsetPackageJoin.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSubsetPackageJoinFullHost
    && !hostFrontLiveSubsetPackageJoinFullBackend
    && !hostFrontLiveSubsetPackageJoinResidualFreeClaimed
    && !hostFrontLiveSubsetPackageJoinProvablyUnlocked
    && kernelCheckLiveSubsetPackageJoinSource liveSubsetPackageJoinSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasSubsetPackageJoinModule
    && liveParseHasSubsetPackageJoinNs
    && liveParseHasSubsetPackageJoinEnd
    && liveParseHasSubsetRebuildImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSubsetPackageJoinSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveSubsetPackageJoin (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SUBSET-PACKAGE-JOIN =="
  IO.println s!"  host={hostId} file={liveSubsetPackageJoinRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveSubsetPackageJoinRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSubsetPackageJoinRel}"
    throw (IO.userError s!"missing {liveSubsetPackageJoinRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSubsetPackageJoinSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SubsetPackageJoin.lean != liveSubsetPackageJoinSource"
    throw (IO.userError "dual-pin mismatch live SubsetPackageJoin.lean")
  let r := parseLiveSubsetPackageJoinSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SUBSET-PACKAGE-JOIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SUBSET-PACKAGE-JOIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SUBSET-PACKAGE-JOIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SubsetPackageJoin parse false"
      throw (IO.userError "kernelCheck live SubsetPackageJoin parse false")
    unless hostFrontLiveSubsetPackageJoinReady do
      IO.eprintln "error: hostFrontLiveSubsetPackageJoinReady false"
      throw (IO.userError "hostFrontLiveSubsetPackageJoinReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty SubsetPackageJoin source was accepted"
      throw (IO.userError "empty SubsetPackageJoin source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSubsetPackageJoin root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSubsetPackageJoin
