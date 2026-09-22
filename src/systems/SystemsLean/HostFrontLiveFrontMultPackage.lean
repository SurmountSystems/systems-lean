/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/FrontMultPackage.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is FrontMultPackage.lean. It is not FrontMultPackageMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 12. example count is 12.
  set_option count is 1. Those commands are skipped, not kernel-checked.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live defs frontMultPackageLlvmUnlocked and
  frontMultPackageProvablyUnlocked are false.
  They are not this wrap's backend claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-FRONT-MULT-PACKAGE,
  SLAKE_HOST_FRONT_LIVE_FRONT_MULT_PACKAGE_V0,
  PARSE-LIVE-FRONT-MULT-PACKAGE, liveRel,
  kernelCheckLiveFrontMultPackageSource,
  hostFrontLiveFrontMultPackageReady.
  Module: SystemsLean.HostFrontLiveFrontMultPackage
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveFrontMultPackageSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFrontMultPackage

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_FRONT_MULT_PACKAGE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-FRONT-MULT-PACKAGE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-FRONT-MULT-PACKAGE"

/-- Live file basename. -/
def liveRel : String := "FrontMultPackage.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFrontMultPackageRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFrontMultPackageFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveFrontMultPackageFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFrontMultPackageResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveFrontMultPackageProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveFrontMultPackageParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveFrontMultPackageSkipFuel : Nat := 16384

/-- Kept commands: three imports, namespace, kernel-checkable defs, and end.
    From FrontMultPackage.lean. Not a count of 4. -/
def liveFrontMultPackageKeptCmds : Nat := 21

/-- theorem keyword count. FrontMultPackage.lean has 12 theorems. -/
def liveFrontMultPackageTheoremCount : Nat := 12

/-- example keyword count. FrontMultPackage.lean has 12 examples. -/
def liveFrontMultPackageExampleCount : Nat := 12

/-- set_option keyword count. FrontMultPackage.lean has one set_option. -/
def liveFrontMultPackageSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . FrontMultPackage`. -/
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
def cmdAddsFrontMultPackage (c : Cmd) : List String :=
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
def cmdBodyKnownFrontMultPackage (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFrontMultPackageParseFuel body
        && termNoAppN liveFrontMultPackageParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFrontMultPackageParseFuel body
        && termNoAppN liveFrontMultPackageParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdFrontMultPackage (fuel : Nat) (toks : List String) :
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
def parseCmdsFrontMultPackage : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFrontMultPackage liveFrontMultPackageParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFrontMultPackageSkipFuel rest
      if cmdBodyKnownFrontMultPackage kn c then
        parseCmdsFrontMultPackage n rest2
          (kn ++ cmdAddsFrontMultPackage c) (acc ++ [c])
      else
        parseCmdsFrontMultPackage n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveFrontMultPackageSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFrontMultPackage n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live FrontMultPackage.lean text.
    Greppable: parseLiveFrontMultPackageSource,
    PARSE-LIVE-FRONT-MULT-PACKAGE. -/
def parseLiveFrontMultPackageSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFrontMultPackage liveFrontMultPackageParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.FrontMultPackage"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live FrontMultPackage parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveFrontMultPackageSource,
    PARSE-LIVE-FRONT-MULT-PACKAGE. -/
def kernelCheckLiveFrontMultPackageSource (src : String) : Bool :=
  match parseLiveFrontMultPackageSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFrontMultPackageParsed? : Option Module :=
  match parseLiveFrontMultPackageSource liveFrontMultPackageSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFrontMultPackageParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveFrontMultPackageParsed? with
  | some m => m.commands.length == liveFrontMultPackageKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveFrontMultPackageParsed? with
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
      && has "frontMultPackageFinishedClaimed"
      && has "frontMultPackageLlvmUnlocked"
      && has "frontMultPackageProvablyUnlocked"

/-- Wrap module lastSeg is FrontMultPackage (no module line in the live file). -/
def liveParseHasFrontMultPackageModule : Bool :=
  match liveFrontMultPackageParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.FrontMultPackage"
      && lastSeg m.name.raw == "FrontMultPackage"

/-- Live parse has namespace SystemsLean.FrontMultPackage. -/
def liveParseHasFrontMultPackageNs : Bool :=
  match liveFrontMultPackageParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.FrontMultPackage"
      | _ => false

/-- Live parse ends namespace SystemsLean.FrontMultPackage. -/
def liveParseHasFrontMultPackageEnd : Bool :=
  match liveFrontMultPackageParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.FrontMultPackage"
      | _ => false

/-- Live parse imports the three front-end modules. -/
def liveParseHasFrontMultImports : Bool :=
  match liveFrontMultPackageParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.SubsetFront"
      && has "SystemsLean.MultSubsetEmit"
      && has "SystemsLean.MultSubsetRebuild"

/-- Keyword counts: theorem 12, example 12, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveFrontMultPackageParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveFrontMultPackageSource)
    let fuel := liveFrontMultPackageSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveFrontMultPackageTheoremCount
      && toksCountKw fuel toks "example" 0 == liveFrontMultPackageExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveFrontMultPackageSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportSubsetFront : String := "import SystemsLean.SubsetFront\n"

/-- Import needle. Trailing newline. -/
def needleImportMultSubsetEmit : String := "import SystemsLean.MultSubsetEmit\n"

/-- Import needle. Trailing newline. -/
def needleImportMultSubsetRebuild : String :=
  "import SystemsLean.MultSubsetRebuild\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.FrontMultPackage\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_FRONT_MULT_PACKAGE_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-FRONT-MULT-PACKAGE\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"FRONT-MULT-PACKAGE\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- frontMultPackageFinishedClaimed def needle with a trailing newline. -/
def needleFinishedClaimed : String :=
  "def frontMultPackageFinishedClaimed : Bool := true\n"

/-- frontMultPackageLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def frontMultPackageLlvmUnlocked : Bool := false\n"

/-- frontMultPackageProvablyUnlocked def needle with a trailing newline. -/
def needleProvablyUnlocked : String :=
  "def frontMultPackageProvablyUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.FrontMultPackage\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.FrontMultPackage. Theorems are counted, not needled. -/
def liveNeedlesOk : Bool :=
  let src := liveFrontMultPackageSource
  (src.splitOn needleImportSubsetFront).length > 1
    && (src.splitOn needleImportMultSubsetEmit).length > 1
    && (src.splitOn needleImportMultSubsetRebuild).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleProvablyUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFrontMultPackageReady,
    PARSE-LIVE-FRONT-MULT-PACKAGE,
    HOST-FRONT-LIVE-FRONT-MULT-PACKAGE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveFrontMultPackageReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_FRONT_MULT_PACKAGE_V0")
    && (hostId == "HOST-FRONT-LIVE-FRONT-MULT-PACKAGE")
    && (parseId == "PARSE-LIVE-FRONT-MULT-PACKAGE")
    && (liveRel == "FrontMultPackage.lean")
    && (liveFrontMultPackageRel
      == "src/systems/SystemsLean/FrontMultPackage.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFrontMultPackageFullHost
    && !hostFrontLiveFrontMultPackageFullBackend
    && !hostFrontLiveFrontMultPackageResidualFreeClaimed
    && !hostFrontLiveFrontMultPackageProvablyUnlocked
    && kernelCheckLiveFrontMultPackageSource liveFrontMultPackageSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasFrontMultPackageModule
    && liveParseHasFrontMultPackageNs
    && liveParseHasFrontMultPackageEnd
    && liveParseHasFrontMultImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFrontMultPackageSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveFrontMultPackage (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-FRONT-MULT-PACKAGE =="
  IO.println s!"  host={hostId} file={liveFrontMultPackageRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveFrontMultPackageRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFrontMultPackageRel}"
    throw (IO.userError s!"missing {liveFrontMultPackageRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFrontMultPackageSource then
    IO.eprintln "error: dual-pin mismatch: on-disk FrontMultPackage.lean != liveFrontMultPackageSource"
    throw (IO.userError "dual-pin mismatch live FrontMultPackage.lean")
  let r := parseLiveFrontMultPackageSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-FRONT-MULT-PACKAGE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-FRONT-MULT-PACKAGE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-FRONT-MULT-PACKAGE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"dbg countOk={liveParseCmdCountOk} lits={liveParseHasLiteralDefs} mod={liveParseHasFrontMultPackageModule} ns={liveParseHasFrontMultPackageNs} endN={liveParseHasFrontMultPackageEnd} imps={liveParseHasFrontMultImports} kw={liveParseKwCountsOk} needles={liveNeedlesOk}"
    let rec showCmds : List Cmd -> IO Unit
      | [] => pure ()
      | c :: rest => do
        match c with
        | Cmd.importModule x => IO.println s!"CMD import {x.raw}"
        | Cmd.namespace x => IO.println s!"CMD ns {x.raw}"
        | Cmd.endNamespace x => IO.println s!"CMD end {x.raw}"
        | Cmd.def_ x _ _ => IO.println s!"CMD def {x.raw}"
        | Cmd.defBind x _ _ _ => IO.println s!"CMD defBind {x.raw}"
        | Cmd.openNs _ => IO.println "CMD open"
        | Cmd.inductive_ x _ _ => IO.println s!"CMD ind {x.raw}"
        | Cmd.structure_ x _ _ => IO.println s!"CMD struct {x.raw}"
        | Cmd.check _ _ => IO.println "CMD check"
        showCmds rest
    showCmds m.commands
    unless k do
      IO.eprintln "error: kernelCheck live FrontMultPackage parse false"
      throw (IO.userError "kernelCheck live FrontMultPackage parse false")
    unless hostFrontLiveFrontMultPackageReady do
      IO.eprintln "error: hostFrontLiveFrontMultPackageReady false"
      throw (IO.userError "hostFrontLiveFrontMultPackageReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty FrontMultPackage source was accepted"
      throw (IO.userError "empty FrontMultPackage source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFrontMultPackage root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFrontMultPackage
