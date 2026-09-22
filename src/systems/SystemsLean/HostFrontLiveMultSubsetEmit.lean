/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/MultSubsetEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is MultSubsetEmit.lean. It is not MultSubsetEmitMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option are skip-folded.
  FullHost stays false. Not Lake-gone. Not Slake typechecking src/systems
  as a compiler. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def multSubsetEmitLlvmUnlocked is false.
  That def is not this wrap's backend claim. The provably flag stays false.
  Main entry lives here because HostFrontLiveMultSubsetEmitMain.lean
  is a different module (MultSubsetEmitMain.lean). Do not use that path.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-MULT-SUBSET-EMIT,
  SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_EMIT_V0,
  PARSE-LIVE-MULT-SUBSET-EMIT, MULT-SUBSET-EMIT, liveRel,
  kernelCheckLiveMultSubsetEmitSource,
  hostFrontLiveMultSubsetEmitReady.
  Module: SystemsLean.HostFrontLiveMultSubsetEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveMultSubsetEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMultSubsetEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-MULT-SUBSET-EMIT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT-SUBSET-EMIT"

/-- Live file basename. -/
def liveRel : String := "MultSubsetEmit.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultSubsetEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultSubsetEmitFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultSubsetEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def multSubsetEmitProvablyUnlocked is false. -/
def hostFrontLiveMultSubsetEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveMultSubsetEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveMultSubsetEmitSkipFuel : Nat := 16384

/-- Kept commands: two imports, namespace, literal defs, and end.
    String-append, unknown consts, theorem, example, set_option, and
    IO mains are skip-folded. multSubsetSourceInclude is skip-folded
    too: its body has an escaped quote, so it is not one literal.
    From MultSubsetEmit.lean. -/
def liveMultSubsetEmitKeptCmds : Nat := 18

/-- theorem keyword count. MultSubsetEmit.lean has nine theorems. -/
def liveMultSubsetEmitTheoremCount : Nat := 9

/-- example keyword count. MultSubsetEmit.lean has sixteen examples. -/
def liveMultSubsetEmitExampleCount : Nat := 16

/-- set_option keyword count. MultSubsetEmit.lean has one set_option. -/
def liveMultSubsetEmitSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . MultSubsetEmit`. -/
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
def cmdAddsMultSubsetEmit (c : Cmd) : List String :=
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
def cmdBodyKnownMultSubsetEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultSubsetEmitParseFuel body
        && termNoAppN liveMultSubsetEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultSubsetEmitParseFuel body
        && termNoAppN liveMultSubsetEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdMultSubsetEmit (fuel : Nat) (toks : List String) :
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
def parseCmdsMultSubsetEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdMultSubsetEmit liveMultSubsetEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveMultSubsetEmitSkipFuel rest
      if cmdBodyKnownMultSubsetEmit kn c then
        parseCmdsMultSubsetEmit n rest2
          (kn ++ cmdAddsMultSubsetEmit c) (acc ++ [c])
      else
        parseCmdsMultSubsetEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveMultSubsetEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsMultSubsetEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live MultSubsetEmit.lean text.
    Greppable: parseLiveMultSubsetEmitSource,
    PARSE-LIVE-MULT-SUBSET-EMIT. -/
def parseLiveMultSubsetEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMultSubsetEmit liveMultSubsetEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.MultSubsetEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live MultSubsetEmit parse. Not a fixture.
    Greppable: kernelCheckLiveMultSubsetEmitSource,
    PARSE-LIVE-MULT-SUBSET-EMIT. -/
def kernelCheckLiveMultSubsetEmitSource (src : String) : Bool :=
  match parseLiveMultSubsetEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveMultSubsetEmitParsed? : Option Module :=
  match parseLiveMultSubsetEmitSource liveMultSubsetEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultSubsetEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveMultSubsetEmitParsed? with
  | some m => m.commands.length == liveMultSubsetEmitKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveMultSubsetEmitParsed? with
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
      && has "multSubsetEmitLlvmUnlocked"
      && has "multSubsetEmitProvablyUnlocked"

/-- Wrap module lastSeg is MultSubsetEmit (no module line in the live file). -/
def liveParseHasMultSubsetEmitModule : Bool :=
  match liveMultSubsetEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.MultSubsetEmit"
      && lastSeg m.name.raw == "MultSubsetEmit"

/-- Live parse has namespace SystemsLean.MultSubsetEmit. -/
def liveParseHasMultSubsetEmitNs : Bool :=
  match liveMultSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.MultSubsetEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.MultSubsetEmit. -/
def liveParseHasMultSubsetEmitEnd : Bool :=
  match liveMultSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.MultSubsetEmit"
      | _ => false

/-- Live parse imports SystemsLean.FirstSurface. -/
def liveParseHasFirstSurfaceImport : Bool :=
  match liveMultSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.FirstSurface"
      | _ => false

/-- Live parse imports SystemsLean.EmitMult. -/
def liveParseHasEmitMultImport : Bool :=
  match liveMultSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitMult"
      | _ => false

/-- Keyword counts: nine theorems, sixteen examples, one set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveMultSubsetEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveMultSubsetEmitSource)
    let fuel := liveMultSubsetEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveMultSubsetEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveMultSubsetEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveMultSubsetEmitSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportFirstSurface : String :=
  "import SystemsLean.FirstSurface\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitMult : String := "import SystemsLean.EmitMult\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.MultSubsetEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_MULT_SUBSET_EMIT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-MULT-SUBSET-EMIT\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"MULT-SUBSET-EMIT\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- dependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String := "def dependsOnLake : Bool := true\n"

/-- multSubsetEmitLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def multSubsetEmitLlvmUnlocked : Bool := false\n"

/-- multSubsetEmitProvablyUnlocked def needle with a trailing newline. -/
def needleProvablyUnlocked : String :=
  "def multSubsetEmitProvablyUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.MultSubsetEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveMultSubsetEmitSource
  (src.splitOn needleImportFirstSurface).length > 1
    && (src.splitOn needleImportEmitMult).length > 1
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
    Greppable: hostFrontLiveMultSubsetEmitReady,
    PARSE-LIVE-MULT-SUBSET-EMIT,
    HOST-FRONT-LIVE-MULT-SUBSET-EMIT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveMultSubsetEmitReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_EMIT_V0")
    && (hostId == "HOST-FRONT-LIVE-MULT-SUBSET-EMIT")
    && (parseId == "PARSE-LIVE-MULT-SUBSET-EMIT")
    && (liveRel == "MultSubsetEmit.lean")
    && (liveMultSubsetEmitRel
      == "src/systems/SystemsLean/MultSubsetEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveMultSubsetEmitFullHost
    && !hostFrontLiveMultSubsetEmitResidualFreeClaimed
    && !hostFrontLiveMultSubsetEmitProvablyUnlocked
    && kernelCheckLiveMultSubsetEmitSource liveMultSubsetEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasMultSubsetEmitModule
    && liveParseHasMultSubsetEmitNs
    && liveParseHasMultSubsetEmitEnd
    && liveParseHasFirstSurfaceImport
    && liveParseHasEmitMultImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultSubsetEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveMultSubsetEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT-SUBSET-EMIT =="
  IO.println s!"  host={hostId} file={liveMultSubsetEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveMultSubsetEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultSubsetEmitRel}"
    throw (IO.userError s!"missing {liveMultSubsetEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultSubsetEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk MultSubsetEmit.lean != liveMultSubsetEmitSource"
    throw (IO.userError "dual-pin mismatch live MultSubsetEmit.lean")
  let r := parseLiveMultSubsetEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT-SUBSET-EMIT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT-SUBSET-EMIT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT-SUBSET-EMIT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live MultSubsetEmit parse false"
      throw (IO.userError "kernelCheck live MultSubsetEmit parse false")
    unless hostFrontLiveMultSubsetEmitReady do
      IO.eprintln "error: hostFrontLiveMultSubsetEmitReady false"
      throw (IO.userError "hostFrontLiveMultSubsetEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty MultSubsetEmit source was accepted"
      throw (IO.userError "empty MultSubsetEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMultSubsetEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMultSubsetEmit
