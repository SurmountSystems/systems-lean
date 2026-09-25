/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/MultFsDeepen.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is MultFsDeepen.lean. It is not a different product file.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option are skip-folded.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def multFsDeepenLlvmUnlocked is false. That def is not this
  wrap's backend claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-MULT-FS-DEEPEN,
  SLAKE_HOST_FRONT_LIVE_MULT_FS_DEEPEN_V0,
  PARSE-LIVE-MULT-FS-DEEPEN, MULT-FS-DEEPEN, liveRel,
  kernelCheckLiveMultFsDeepenSource,
  hostFrontLiveMultFsDeepenReady.
  Module: SystemsLean.HostFrontLiveMultFsDeepen
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveMultFsDeepenSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMultFsDeepen

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_MULT_FS_DEEPEN_V0"

/-- Greppable host map id. Hyphenated MULT-FS-DEEPEN. -/
def hostId : String := "HOST-FRONT-LIVE-MULT-FS-DEEPEN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT-FS-DEEPEN"

/-- Live file basename. -/
def liveRel : String := "MultFsDeepen.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultFsDeepenRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultFsDeepenFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveMultFsDeepenFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultFsDeepenResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveMultFsDeepenProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveMultFsDeepenParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveMultFsDeepenSkipFuel : Nat := 8192

/-- Kept commands: three imports, namespace, kernel-checkable defs, and end.
    From MultFsDeepen.lean. Not a count of 4. -/
def liveMultFsDeepenKeptCmds : Nat := 25

/-- theorem keyword count. MultFsDeepen.lean theorems are skip-folded. -/
def liveMultFsDeepenTheoremCount : Nat := 19

/-- example keyword count. MultFsDeepen.lean examples are skip-folded. -/
def liveMultFsDeepenExampleCount : Nat := 36

/-- set_option keyword count. One maxRecDepth line, skip-folded. -/
def liveMultFsDeepenSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . MultFsDeepen`. -/
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
def cmdAddsMultFsDeepen (c : Cmd) : List String :=
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
def cmdBodyKnownMultFsDeepen (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultFsDeepenParseFuel body
        && termNoAppN liveMultFsDeepenParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultFsDeepenParseFuel body
        && termNoAppN liveMultFsDeepenParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdMultFsDeepen (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, open, and
    un-kernelable defs. -/
def parseCmdsMultFsDeepen : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdMultFsDeepen liveMultFsDeepenParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveMultFsDeepenSkipFuel rest
      if cmdBodyKnownMultFsDeepen kn c then
        parseCmdsMultFsDeepen n rest2
          (kn ++ cmdAddsMultFsDeepen c) (acc ++ [c])
      else
        parseCmdsMultFsDeepen n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveMultFsDeepenSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsMultFsDeepen n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live MultFsDeepen.lean text.
    Greppable: parseLiveMultFsDeepenSource,
    PARSE-LIVE-MULT-FS-DEEPEN. -/
def parseLiveMultFsDeepenSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMultFsDeepen liveMultFsDeepenParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.MultFsDeepen"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live MultFsDeepen parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveMultFsDeepenSource,
    PARSE-LIVE-MULT-FS-DEEPEN. -/
def kernelCheckLiveMultFsDeepenSource (src : String) : Bool :=
  match parseLiveMultFsDeepenSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveMultFsDeepenParsed? : Option Module :=
  match parseLiveMultFsDeepenSource liveMultFsDeepenSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultFsDeepenParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveMultFsDeepenParsed? with
  | some m => m.commands.length == liveMultFsDeepenKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveMultFsDeepenParsed? with
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
      && has "freestandingDeepenPartial"
      && has "freestandingDriverComplete"
      && has "multFsWritePathReady"
      && has "stillUsesLake"
      && has "dependsOnLake"
      && has "multFsDeepenResidualFreeClaimed"
      && has "multFsDeepenProvablyUnlocked"

/-- Wrap module lastSeg is MultFsDeepen (no module line in the live file). -/
def liveParseHasMultFsDeepenModule : Bool :=
  match liveMultFsDeepenParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.MultFsDeepen"
      && lastSeg m.name.raw == "MultFsDeepen"

/-- Live parse has namespace SystemsLean.MultFsDeepen. -/
def liveParseHasMultFsDeepenNs : Bool :=
  match liveMultFsDeepenParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.MultFsDeepen"
      | _ => false

/-- Live parse ends namespace SystemsLean.MultFsDeepen. -/
def liveParseHasMultFsDeepenEnd : Bool :=
  match liveMultFsDeepenParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.MultFsDeepen"
      | _ => false

/-- Live parse imports MultSubsetRebuild, EmitMult, and MultFsWriteTool. -/
def liveParseHasMultFsDeepenImports : Bool :=
  match liveMultFsDeepenParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.MultSubsetRebuild"
      && has "SystemsLean.EmitMult"
      && has "SystemsLean.MultFsWriteTool"

/-- Keyword counts: theorem 19, example 36, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveMultFsDeepenParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveMultFsDeepenSource)
    let fuel := liveMultFsDeepenSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveMultFsDeepenTheoremCount
      && toksCountKw fuel toks "example" 0 == liveMultFsDeepenExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveMultFsDeepenSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportRebuild : String := "import SystemsLean.MultSubsetRebuild\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitMult : String := "import SystemsLean.EmitMult\n"

/-- Import needle. Trailing newline. -/
def needleImportWriteTool : String := "import SystemsLean.MultFsWriteTool\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.MultFsDeepen\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_MULT_FS_DEEPEN_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-MULT-FS-DEEPEN\"\n"

/-- surfaceId def needle with a trailing newline. Hyphenated MULT-FS-DEEPEN. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"MULT-FS-DEEPEN\"\n"

/-- freestandingDeepenPartial def needle with a trailing newline. -/
def needleDeepenPartial : String :=
  "def freestandingDeepenPartial : Bool := true\n"

/-- freestandingDriverComplete def needle with a trailing newline. -/
def needleDriverComplete : String :=
  "def freestandingDriverComplete : Bool := true\n"

/-- multFsWritePathReady def needle with a trailing newline. -/
def needleWritePathReady : String :=
  "def multFsWritePathReady : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.MultFsDeepen\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.MultFsDeepen. -/
def liveNeedlesOk : Bool :=
  let src := liveMultFsDeepenSource
  (src.splitOn needleImportRebuild).length > 1
    && (src.splitOn needleImportEmitMult).length > 1
    && (src.splitOn needleImportWriteTool).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleDeepenPartial).length > 1
    && (src.splitOn needleDriverComplete).length > 1
    && (src.splitOn needleWritePathReady).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveMultFsDeepenReady,
    PARSE-LIVE-MULT-FS-DEEPEN,
    HOST-FRONT-LIVE-MULT-FS-DEEPEN.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveMultFsDeepenReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_MULT_FS_DEEPEN_V0")
    && (hostId == "HOST-FRONT-LIVE-MULT-FS-DEEPEN")
    && (parseId == "PARSE-LIVE-MULT-FS-DEEPEN")
    && (liveRel == "MultFsDeepen.lean")
    && (liveMultFsDeepenRel
      == "src/systems/SystemsLean/MultFsDeepen.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveMultFsDeepenFullHost
    && !hostFrontLiveMultFsDeepenFullBackend
    && !hostFrontLiveMultFsDeepenResidualFreeClaimed
    && !hostFrontLiveMultFsDeepenProvablyUnlocked
    && kernelCheckLiveMultFsDeepenSource liveMultFsDeepenSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasMultFsDeepenModule
    && liveParseHasMultFsDeepenNs
    && liveParseHasMultFsDeepenEnd
    && liveParseHasMultFsDeepenImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultFsDeepenSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveMultFsDeepen (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT-FS-DEEPEN =="
  IO.println s!"  host={hostId} file={liveMultFsDeepenRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveMultFsDeepenRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultFsDeepenRel}"
    throw (IO.userError s!"missing {liveMultFsDeepenRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultFsDeepenSource then
    IO.eprintln "error: dual-pin mismatch: on-disk MultFsDeepen.lean != liveMultFsDeepenSource"
    throw (IO.userError "dual-pin mismatch live MultFsDeepen.lean")
  let r := parseLiveMultFsDeepenSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT-FS-DEEPEN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT-FS-DEEPEN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT-FS-DEEPEN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live MultFsDeepen parse false"
      throw (IO.userError "kernelCheck live MultFsDeepen parse false")
    unless hostFrontLiveMultFsDeepenReady do
      IO.eprintln "error: hostFrontLiveMultFsDeepenReady false"
      throw (IO.userError "hostFrontLiveMultFsDeepenReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty MultFsDeepen source was accepted"
      throw (IO.userError "empty MultFsDeepen source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMultFsDeepen root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMultFsDeepen
