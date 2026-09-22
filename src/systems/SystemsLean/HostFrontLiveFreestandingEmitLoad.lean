/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/FreestandingEmitLoad.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is FreestandingEmitLoad.lean.
  It is not FreestandingEmitLoadScaffold.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  The live namespace is SystemsLean.FreestandingEmit.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD,
  SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_LOAD_V0,
  PARSE-LIVE-FREESTANDING-EMIT-LOAD, FREESTANDING-EMIT-LOAD-THEOREM, liveRel,
  kernelCheckLiveFreestandingEmitLoadSource,
  hostFrontLiveFreestandingEmitLoadReady.
  Module: SystemsLean.HostFrontLiveFreestandingEmitLoad
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveFreestandingEmitLoadSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFreestandingEmitLoad

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_LOAD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-FREESTANDING-EMIT-LOAD"

/-- Live file basename. -/
def liveRel : String := "FreestandingEmitLoad.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFreestandingEmitLoadRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFreestandingEmitLoadFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveFreestandingEmitLoadFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFreestandingEmitLoadResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveFreestandingEmitLoadProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveFreestandingEmitLoadParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveFreestandingEmitLoadSkipFuel : Nat := 8192

/-- Kept commands: namespace, three string literals, dualSsotEqualityLive, end.
    No import. IO, structure, and app bodies are skip-folded.
    From FreestandingEmitLoad.lean. -/
def liveFreestandingEmitLoadKeptCmds : Nat := 6

/-- theorem keyword count. FreestandingEmitLoad.lean has no theorem. -/
def liveFreestandingEmitLoadTheoremCount : Nat := 0

/-- example keyword count. FreestandingEmitLoad.lean has no example. -/
def liveFreestandingEmitLoadExampleCount : Nat := 0

/-- set_option keyword count. FreestandingEmitLoad.lean has no set_option. -/
def liveFreestandingEmitLoadSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . FreestandingEmit`. -/
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
def cmdAddsFreestandingEmitLoad (c : Cmd) : List String :=
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
def cmdBodyKnownFreestandingEmitLoad (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFreestandingEmitLoadParseFuel body
        && termNoAppN liveFreestandingEmitLoadParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFreestandingEmitLoadParseFuel body
        && termNoAppN liveFreestandingEmitLoadParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdFreestandingEmitLoad (fuel : Nat) (toks : List String) :
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
def parseCmdsFreestandingEmitLoad : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFreestandingEmitLoad liveFreestandingEmitLoadParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFreestandingEmitLoadSkipFuel rest
      if cmdBodyKnownFreestandingEmitLoad kn c then
        parseCmdsFreestandingEmitLoad n rest2
          (kn ++ cmdAddsFreestandingEmitLoad c) (acc ++ [c])
      else
        parseCmdsFreestandingEmitLoad n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveFreestandingEmitLoadSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFreestandingEmitLoad n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live FreestandingEmitLoad.lean text.
    Greppable: parseLiveFreestandingEmitLoadSource,
    PARSE-LIVE-FREESTANDING-EMIT-LOAD. -/
def parseLiveFreestandingEmitLoadSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFreestandingEmitLoad liveFreestandingEmitLoadParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.FreestandingEmitLoad"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live FreestandingEmitLoad parse. Not a fixture.
    Greppable: kernelCheckLiveFreestandingEmitLoadSource,
    PARSE-LIVE-FREESTANDING-EMIT-LOAD. -/
def kernelCheckLiveFreestandingEmitLoadSource (src : String) : Bool :=
  match parseLiveFreestandingEmitLoadSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFreestandingEmitLoadParsed? : Option Module :=
  match parseLiveFreestandingEmitLoadSource liveFreestandingEmitLoadSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFreestandingEmitLoadParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, kernel-checkable defs, and end. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveFreestandingEmitLoadParsed? with
  | some m => m.commands.length == liveFreestandingEmitLoadKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, dualSsotEqualityGateId,
    expectedEmptyFragment, dualSsotEqualityLive. -/
def liveParseHasLiteralDefs : Bool :=
  match liveFreestandingEmitLoadParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "dualSsotEqualityGateId"
      && has "expectedEmptyFragment"
      && has "dualSsotEqualityLive"

/-- Wrap module lastSeg is FreestandingEmitLoad (no module line in the live file). -/
def liveParseHasFreestandingEmitLoadModule : Bool :=
  match liveFreestandingEmitLoadParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.FreestandingEmitLoad"
      && lastSeg m.name.raw == "FreestandingEmitLoad"

/-- Live parse has namespace SystemsLean.FreestandingEmit. -/
def liveParseHasFreestandingEmitNs : Bool :=
  match liveFreestandingEmitLoadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.FreestandingEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.FreestandingEmit. -/
def liveParseHasFreestandingEmitEnd : Bool :=
  match liveFreestandingEmitLoadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.FreestandingEmit"
      | _ => false

/-- This live file has no import. -/
def liveParseHasNoImport : Bool :=
  match liveFreestandingEmitLoadParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveFreestandingEmitLoadParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveFreestandingEmitLoadSource)
    let fuel := liveFreestandingEmitLoadSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveFreestandingEmitLoadTheoremCount
      && toksCountKw fuel toks "example" 0 == liveFreestandingEmitLoadExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveFreestandingEmitLoadSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.FreestandingEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_EMIT_FREESTANDING_C_V0\"\n"

/-- dualSsotEqualityGateId def needle with a trailing newline. -/
def needleDualSsotEqualityGateId : String :=
  "def dualSsotEqualityGateId : String := \"DUAL-SSOT-EQUALITY\"\n"

/-- expectedEmptyFragment def needle with a trailing newline. -/
def needleExpectedEmptyFragment : String :=
  "def expectedEmptyFragment : String := \"/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */\"\n"

/-- dualSsotEqualityLive def needle with a trailing newline. -/
def needleDualSsotEqualityLive : String := "def dualSsotEqualityLive : Bool :=\n"

/-- BodySsot structure needle with a trailing newline. -/
def needleBodySsot : String := "structure BodySsot where\n"

/-- loadBodySsot def needle with a trailing newline. -/
def needleLoadBodySsot : String :=
  "def loadBodySsot (path : System.FilePath) : IO BodySsot := do\n"

/-- BannerSsot structure needle with a trailing newline. -/
def needleBannerSsot : String := "structure BannerSsot where\n"

/-- loadBannerSsot def needle with a trailing newline. -/
def needleLoadBannerSsot : String :=
  "def loadBannerSsot (path : System.FilePath) : IO BannerSsot := do\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.FreestandingEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveFreestandingEmitLoadSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleDualSsotEqualityGateId).length > 1
    && (src.splitOn needleExpectedEmptyFragment).length > 1
    && (src.splitOn needleDualSsotEqualityLive).length > 1
    && (src.splitOn needleBodySsot).length > 1
    && (src.splitOn needleLoadBodySsot).length > 1
    && (src.splitOn needleBannerSsot).length > 1
    && (src.splitOn needleLoadBannerSsot).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFreestandingEmitLoadReady,
    PARSE-LIVE-FREESTANDING-EMIT-LOAD,
    HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveFreestandingEmitLoadReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_LOAD_V0")
    && (hostId == "HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD")
    && (parseId == "PARSE-LIVE-FREESTANDING-EMIT-LOAD")
    && (liveRel == "FreestandingEmitLoad.lean")
    && (liveFreestandingEmitLoadRel
      == "src/systems/SystemsLean/FreestandingEmitLoad.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFreestandingEmitLoadFullHost
    && !hostFrontLiveFreestandingEmitLoadFullBackend
    && !hostFrontLiveFreestandingEmitLoadResidualFreeClaimed
    && !hostFrontLiveFreestandingEmitLoadProvablyUnlocked
    && kernelCheckLiveFreestandingEmitLoadSource liveFreestandingEmitLoadSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasFreestandingEmitLoadModule
    && liveParseHasFreestandingEmitNs
    && liveParseHasFreestandingEmitEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFreestandingEmitLoadSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveFreestandingEmitLoad (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-FREESTANDING-EMIT-LOAD =="
  IO.println s!"  host={hostId} file={liveFreestandingEmitLoadRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveFreestandingEmitLoadRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFreestandingEmitLoadRel}"
    throw (IO.userError s!"missing {liveFreestandingEmitLoadRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFreestandingEmitLoadSource then
    IO.eprintln "error: dual-pin mismatch: on-disk FreestandingEmitLoad.lean != liveFreestandingEmitLoadSource"
    throw (IO.userError "dual-pin mismatch live FreestandingEmitLoad.lean")
  let r := parseLiveFreestandingEmitLoadSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-FREESTANDING-EMIT-LOAD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-FREESTANDING-EMIT-LOAD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-FREESTANDING-EMIT-LOAD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live FreestandingEmitLoad parse false"
      throw (IO.userError "kernelCheck live FreestandingEmitLoad parse false")
    unless hostFrontLiveFreestandingEmitLoadReady do
      IO.eprintln "error: hostFrontLiveFreestandingEmitLoadReady false"
      throw (IO.userError "hostFrontLiveFreestandingEmitLoadReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty FreestandingEmitLoad source was accepted"
      throw (IO.userError "empty FreestandingEmitLoad source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFreestandingEmitLoad root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFreestandingEmitLoad
