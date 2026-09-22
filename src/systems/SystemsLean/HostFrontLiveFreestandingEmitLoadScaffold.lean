/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is FreestandingEmitLoadScaffold.lean.
  It is not FreestandingEmitLoad.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Structures and IO do-block defs in this file are not kernel-checkable.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_LOAD_SCAFFOLD_V0,
  PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD, liveRel,
  kernelCheckLiveFreestandingEmitLoadScaffoldSource,
  hostFrontLiveFreestandingEmitLoadScaffoldReady.
  Module: SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveFreestandingEmitLoadScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_LOAD_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD"

/-- Live file basename. -/
def liveRel : String := "FreestandingEmitLoadScaffold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFreestandingEmitLoadScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFreestandingEmitLoadScaffoldFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveFreestandingEmitLoadScaffoldFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFreestandingEmitLoadScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveFreestandingEmitLoadScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveFreestandingEmitLoadScaffoldParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveFreestandingEmitLoadScaffoldSkipFuel : Nat := 8192

/-- Kept commands: import, namespace, and end.
    Structures and IO do-block defs are skip-folded.
    From FreestandingEmitLoadScaffold.lean. -/
def liveFreestandingEmitLoadScaffoldKeptCmds : Nat := 3

/-- theorem keyword count. FreestandingEmitLoadScaffold.lean has no theorem. -/
def liveFreestandingEmitLoadScaffoldTheoremCount : Nat := 0

/-- example keyword count. FreestandingEmitLoadScaffold.lean has no example. -/
def liveFreestandingEmitLoadScaffoldExampleCount : Nat := 0

/-- set_option keyword count. FreestandingEmitLoadScaffold.lean has no set_option. -/
def liveFreestandingEmitLoadScaffoldSetOptionCount : Nat := 0

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
def cmdAddsFreestandingEmitLoadScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownFreestandingEmitLoadScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFreestandingEmitLoadScaffoldParseFuel body
        && termNoAppN liveFreestandingEmitLoadScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFreestandingEmitLoadScaffoldParseFuel body
        && termNoAppN liveFreestandingEmitLoadScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdFreestandingEmitLoadScaffold (fuel : Nat) (toks : List String) :
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
def parseCmdsFreestandingEmitLoadScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFreestandingEmitLoadScaffold
        liveFreestandingEmitLoadScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFreestandingEmitLoadScaffoldSkipFuel rest
      if cmdBodyKnownFreestandingEmitLoadScaffold kn c then
        parseCmdsFreestandingEmitLoadScaffold n rest2
          (kn ++ cmdAddsFreestandingEmitLoadScaffold c) (acc ++ [c])
      else
        parseCmdsFreestandingEmitLoadScaffold n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveFreestandingEmitLoadScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFreestandingEmitLoadScaffold n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live FreestandingEmitLoadScaffold.lean text.
    Greppable: parseLiveFreestandingEmitLoadScaffoldSource,
    PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD. -/
def parseLiveFreestandingEmitLoadScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFreestandingEmitLoadScaffold
        liveFreestandingEmitLoadScaffoldParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.FreestandingEmitLoadScaffold"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live FreestandingEmitLoadScaffold parse. Not a fixture.
    Greppable: kernelCheckLiveFreestandingEmitLoadScaffoldSource,
    PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD. -/
def kernelCheckLiveFreestandingEmitLoadScaffoldSource (src : String) : Bool :=
  match parseLiveFreestandingEmitLoadScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFreestandingEmitLoadScaffoldParsed? : Option Module :=
  match parseLiveFreestandingEmitLoadScaffoldSource
      liveFreestandingEmitLoadScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFreestandingEmitLoadScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Import, namespace, and end.
    Structures and IO defs are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveFreestandingEmitLoadScaffoldParsed? with
  | some m =>
    m.commands.length == liveFreestandingEmitLoadScaffoldKeptCmds
  | none => false

/-- Structures and IO do-block defs are skip-folded, not kept. -/
def liveParseSkippedCompoundDefs : Bool :=
  match liveFreestandingEmitLoadScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | Cmd.structure_ _ _ _ => true
      | Cmd.inductive_ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is FreestandingEmitLoadScaffold
    (no module line in the live file). -/
def liveParseHasFreestandingEmitLoadScaffoldModule : Bool :=
  match liveFreestandingEmitLoadScaffoldParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.FreestandingEmitLoadScaffold"
      && lastSeg m.name.raw == "FreestandingEmitLoadScaffold"

/-- Live parse has namespace SystemsLean.FreestandingEmit. -/
def liveParseHasFreestandingEmitNs : Bool :=
  match liveFreestandingEmitLoadScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.FreestandingEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.FreestandingEmit. -/
def liveParseHasFreestandingEmitEnd : Bool :=
  match liveFreestandingEmitLoadScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.FreestandingEmit"
      | _ => false

/-- Live parse imports SystemsLean.FreestandingEmitLoad. -/
def liveParseHasFreestandingEmitLoadImport : Bool :=
  match liveFreestandingEmitLoadScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.FreestandingEmitLoad"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveFreestandingEmitLoadScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveFreestandingEmitLoadScaffoldSource)
    let fuel := liveFreestandingEmitLoadScaffoldSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveFreestandingEmitLoadScaffoldTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveFreestandingEmitLoadScaffoldExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveFreestandingEmitLoadScaffoldSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportFreestandingEmitLoad : String :=
  "import SystemsLean.FreestandingEmitLoad\n"

/-- Namespace needle. Leading newline keeps it off the comment line.
    Trailing newline. -/
def needleNamespace : String :=
  "\nnamespace SystemsLean.FreestandingEmit\n"

/-- MultSsot structure needle with a trailing newline. -/
def needleStructureMultSsot : String := "structure MultSsot where\n"

/-- loadMultSsot def needle with a trailing newline. -/
def needleLoadMultSsot : String :=
  "def loadMultSsot (path : System.FilePath) : IO MultSsot := do\n"

/-- PlanSsot structure needle with a trailing newline. -/
def needleStructurePlanSsot : String := "structure PlanSsot where\n"

/-- ApplySsot structure needle with a trailing newline. -/
def needleStructureApplySsot : String := "structure ApplySsot where\n"

/-- loadApplySsot def needle with a trailing newline. -/
def needleLoadApplySsot : String :=
  "def loadApplySsot (path : System.FilePath) : IO ApplySsot := do\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.FreestandingEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveFreestandingEmitLoadScaffoldSource
  (src.splitOn needleImportFreestandingEmitLoad).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleStructureMultSsot).length == 2
    && (src.splitOn needleLoadMultSsot).length == 2
    && (src.splitOn needleStructurePlanSsot).length == 2
    && (src.splitOn needleStructureApplySsot).length == 2
    && (src.splitOn needleLoadApplySsot).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFreestandingEmitLoadScaffoldReady,
    PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD,
    HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveFreestandingEmitLoadScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_LOAD_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD")
    && (parseId == "PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD")
    && (liveRel == "FreestandingEmitLoadScaffold.lean")
    && (liveFreestandingEmitLoadScaffoldRel
      == "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFreestandingEmitLoadScaffoldFullHost
    && !hostFrontLiveFreestandingEmitLoadScaffoldFullBackend
    && !hostFrontLiveFreestandingEmitLoadScaffoldResidualFreeClaimed
    && !hostFrontLiveFreestandingEmitLoadScaffoldProvablyUnlocked
    && kernelCheckLiveFreestandingEmitLoadScaffoldSource
      liveFreestandingEmitLoadScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseSkippedCompoundDefs
    && liveParseHasFreestandingEmitLoadScaffoldModule
    && liveParseHasFreestandingEmitNs
    && liveParseHasFreestandingEmitEnd
    && liveParseHasFreestandingEmitLoadImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFreestandingEmitLoadScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveFreestandingEmitLoadScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveFreestandingEmitLoadScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveFreestandingEmitLoadScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFreestandingEmitLoadScaffoldRel}"
    throw (IO.userError s!"missing {liveFreestandingEmitLoadScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFreestandingEmitLoadScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk FreestandingEmitLoadScaffold.lean != liveFreestandingEmitLoadScaffoldSource"
    throw (IO.userError "dual-pin mismatch live FreestandingEmitLoadScaffold.lean")
  let r := parseLiveFreestandingEmitLoadScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live FreestandingEmitLoadScaffold parse false"
      throw (IO.userError "kernelCheck live FreestandingEmitLoadScaffold parse false")
    unless hostFrontLiveFreestandingEmitLoadScaffoldReady do
      IO.eprintln "error: hostFrontLiveFreestandingEmitLoadScaffoldReady false"
      throw (IO.userError "hostFrontLiveFreestandingEmitLoadScaffoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty FreestandingEmitLoadScaffold source was accepted"
      throw (IO.userError "empty FreestandingEmitLoadScaffold source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFreestandingEmitLoadScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold
