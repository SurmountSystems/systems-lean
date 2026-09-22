/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/DualEqWriteLoad.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is DualEqWriteLoad.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not a backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-DUAL-EQ-WRITE-LOAD,
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_LOAD_V0,
  PARSE-LIVE-DUAL-EQ-WRITE-LOAD, liveRel,
  kernelCheckLiveDualEqWriteLoadSource,
  hostFrontLiveDualEqWriteLoadReady.
  Module: SystemsLean.HostFrontLiveDualEqWriteLoad
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveDualEqWriteLoadSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveDualEqWriteLoad

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_LOAD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-DUAL-EQ-WRITE-LOAD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-DUAL-EQ-WRITE-LOAD"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is DualEqWriteLoad.lean and lives in the Source module. -/
def liveDualEqWriteLoadRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveDualEqWriteLoadFullHost : Bool := false

/-- Honesty: this wrap is not a backend. FullBackend stays false. -/
def hostFrontLiveDualEqWriteLoadFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveDualEqWriteLoadResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveDualEqWriteLoadProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveDualEqWriteLoadParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveDualEqWriteLoadSkipFuel : Nat := 8192

/-- Kept commands: twenty imports, namespace, three literal defs, and end.
    Compound defs and structures are skipped. From DualEqWriteLoad.lean. -/
def liveDualEqWriteLoadKeptCmds : Nat := 25

/-- theorem keyword count. DualEqWriteLoad.lean has no theorem. -/
def liveDualEqWriteLoadTheoremCount : Nat := 0

/-- example keyword count. DualEqWriteLoad.lean has no example. -/
def liveDualEqWriteLoadExampleCount : Nat := 0

/-- set_option keyword count. DualEqWriteLoad.lean has no set_option. -/
def liveDualEqWriteLoadSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . DualEqWriteLoad`. -/
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
def cmdAddsDualEqWriteLoad (c : Cmd) : List String :=
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
def cmdBodyKnownDualEqWriteLoad (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualEqWriteLoadParseFuel body
        && termNoAppN liveDualEqWriteLoadParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualEqWriteLoadParseFuel body
        && termNoAppN liveDualEqWriteLoadParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdDualEqWriteLoad (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsDualEqWriteLoad : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdDualEqWriteLoad liveDualEqWriteLoadParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveDualEqWriteLoadSkipFuel rest
      if cmdBodyKnownDualEqWriteLoad kn c then
        parseCmdsDualEqWriteLoad n rest2
          (kn ++ cmdAddsDualEqWriteLoad c) (acc ++ [c])
      else
        parseCmdsDualEqWriteLoad n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveDualEqWriteLoadSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsDualEqWriteLoad n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live DualEqWriteLoad.lean text.
    Greppable: parseLiveDualEqWriteLoadSource,
    PARSE-LIVE-DUAL-EQ-WRITE-LOAD. -/
def parseLiveDualEqWriteLoadSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsDualEqWriteLoad liveDualEqWriteLoadParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.DualEqWriteLoad"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live DualEqWriteLoad parse. Not a fixture.
    Greppable: kernelCheckLiveDualEqWriteLoadSource,
    PARSE-LIVE-DUAL-EQ-WRITE-LOAD. -/
def kernelCheckLiveDualEqWriteLoadSource (src : String) : Bool :=
  match parseLiveDualEqWriteLoadSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveDualEqWriteLoadParsed? : Option Module :=
  match parseLiveDualEqWriteLoadSource liveDualEqWriteLoadSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveDualEqWriteLoadParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveDualEqWriteLoadParsed? with
  | some m => m.commands.length == liveDualEqWriteLoadKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, dualEqualityGateId,
    expectedEmptyFragment. -/
def liveParseHasLiteralDefs : Bool :=
  match liveDualEqWriteLoadParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "dualEqualityGateId"
      && has "expectedEmptyFragment"

/-- Wrap module lastSeg is DualEqWriteLoad (no module line in the live file). -/
def liveParseHasDualEqWriteLoadModule : Bool :=
  match liveDualEqWriteLoadParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.DualEqWriteLoad"
      && lastSeg m.name.raw == "DualEqWriteLoad"

/-- Live parse has namespace SystemsLean.DualEqWriteApi. -/
def liveParseHasDualEqWriteApiNs : Bool :=
  match liveDualEqWriteLoadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.DualEqWriteApi"
      | _ => false

/-- Live parse ends namespace SystemsLean.DualEqWriteApi. -/
def liveParseHasDualEqWriteApiEnd : Bool :=
  match liveDualEqWriteLoadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.DualEqWriteApi"
      | _ => false

/-- Live parse imports SystemsLean.EmitBanner. -/
def liveParseHasEmitBannerImport : Bool :=
  match liveDualEqWriteLoadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitBanner"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveDualEqWriteLoadParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveDualEqWriteLoadSource)
    let fuel := liveDualEqWriteLoadSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveDualEqWriteLoadTheoremCount
      && toksCountKw fuel toks "example" 0 == liveDualEqWriteLoadExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveDualEqWriteLoadSetOptionCount

/-- Import needle. Trailing newline. Real text from DualEqWriteLoad.lean. -/
def needleImportEmitBanner : String := "import SystemsLean.EmitBanner\n"

/-- Namespace needle with a trailing newline.
    Section anchor: real text from DualEqWriteLoad.lean. -/
def needleNamespace : String := "namespace SystemsLean.DualEqWriteApi\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String := "def stageId : String :=\n"

/-- dualEqualityGateId def needle with a trailing newline. -/
def needleDualEqualityGateId : String :=
  "def dualEqualityGateId : String := \"DUAL-SSOT-EQUALITY\"\n"

/-- expectedEmptyFragment def needle with a trailing newline. -/
def needleExpectedEmptyFragment : String :=
  "def expectedEmptyFragment : String := \"/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */\"\n"

/-- containsStr def needle with a trailing newline. -/
def needleContainsStr : String :=
  "def containsStr (s needle : String) : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.DualEqWriteApi\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Section anchors are real text from DualEqWriteLoad.lean.
    No LlvmHold string. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveDualEqWriteLoadSource
  (src.splitOn needleImportEmitBanner).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleDualEqualityGateId).length > 1
    && (src.splitOn needleExpectedEmptyFragment).length > 1
    && (src.splitOn needleContainsStr).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveDualEqWriteLoadReady,
    PARSE-LIVE-DUAL-EQ-WRITE-LOAD,
    HOST-FRONT-LIVE-DUAL-EQ-WRITE-LOAD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveDualEqWriteLoadReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_LOAD_V0")
    && (hostId == "HOST-FRONT-LIVE-DUAL-EQ-WRITE-LOAD")
    && (parseId == "PARSE-LIVE-DUAL-EQ-WRITE-LOAD")
    && (liveRel == "DualEqWriteLoad.lean")
    && (liveDualEqWriteLoadRel
      == "src/systems/SystemsLean/DualEqWriteLoad.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveDualEqWriteLoadFullHost
    && !hostFrontLiveDualEqWriteLoadFullBackend
    && !hostFrontLiveDualEqWriteLoadResidualFreeClaimed
    && !hostFrontLiveDualEqWriteLoadProvablyUnlocked
    && kernelCheckLiveDualEqWriteLoadSource liveDualEqWriteLoadSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasDualEqWriteLoadModule
    && liveParseHasDualEqWriteApiNs
    && liveParseHasDualEqWriteApiEnd
    && liveParseHasEmitBannerImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveDualEqWriteLoadSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveDualEqWriteLoad (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-DUAL-EQ-WRITE-LOAD =="
  IO.println s!"  host={hostId} file={liveDualEqWriteLoadRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveDualEqWriteLoadRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveDualEqWriteLoadRel}"
    throw (IO.userError s!"missing {liveDualEqWriteLoadRel}")
  let disk <- IO.FS.readFile path
  IO.println s!"diskBytes={disk.length} pinBytes={liveDualEqWriteLoadSource.length}"
  if disk != liveDualEqWriteLoadSource then
    IO.eprintln "error: dual-pin mismatch: on-disk DualEqWriteLoad.lean != liveDualEqWriteLoadSource"
    throw (IO.userError "dual-pin mismatch live DualEqWriteLoad.lean")
  let r := parseLiveDualEqWriteLoadSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-DUAL-EQ-WRITE-LOAD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-DUAL-EQ-WRITE-LOAD reject {reason}")
  | FrontResult.accept m =>
    IO.println s!"parsedCmds={m.commands.length}"
    for c in m.commands do
      match c with
      | Cmd.def_ x _ _ => IO.println s!"KEEP def {x.raw}"
      | Cmd.defBind x _ _ _ => IO.println s!"KEEP defBind {x.raw}"
      | Cmd.importModule x => IO.println s!"KEEP import {x.raw}"
      | Cmd.namespace x => IO.println s!"KEEP ns {x.raw}"
      | Cmd.endNamespace x => IO.println s!"KEEP end {x.raw}"
      | Cmd.check _ _ => IO.println "KEEP check"
      | _ => IO.println "KEEP other"
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-DUAL-EQ-WRITE-LOAD ACCEPT cmds={m.commands.length} kernelCheck={k} cmdCountOk={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} moduleOk={liveParseHasDualEqWriteLoadModule} nsOk={liveParseHasDualEqWriteApiNs} endOk={liveParseHasDualEqWriteApiEnd} importOk={liveParseHasEmitBannerImport} kwOk={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd} ready={hostFrontLiveDualEqWriteLoadReady}"
    unless k do
      IO.eprintln "error: kernelCheck live DualEqWriteLoad parse false"
      throw (IO.userError "kernelCheck live DualEqWriteLoad parse false")
    unless hostFrontLiveDualEqWriteLoadReady do
      IO.eprintln "error: hostFrontLiveDualEqWriteLoadReady false"
      throw (IO.userError "hostFrontLiveDualEqWriteLoadReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty DualEqWriteLoad source was accepted"
      throw (IO.userError "empty DualEqWriteLoad source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveDualEqWriteLoad root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveDualEqWriteLoad
