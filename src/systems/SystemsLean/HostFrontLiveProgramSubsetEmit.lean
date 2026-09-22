/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/ProgramSubsetEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ProgramSubsetEmit.lean. Theorems, examples, and set_option
  in that file are skipped. It is not ProgramSubsetEmitMain.lean.
  HostFrontLiveProgramSubsetEmitMain.lean already parses
  ProgramSubsetEmitMain.lean. This file does not replace that module.
  Literal String and Bool defs stay. Compound defs are skipped when the
  body is not kernel-checkable (unknown const, string append, IO do,
  equation heads). theorem count is 9. example count is 16.
  set_option count is 1.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def programSubsetEmitLlvmUnlocked is false.
  The live def stillUsesLake is true.
  They are not this wrap's backend claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PROGRAM-SUBSET-EMIT,
  SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_EMIT_V0,
  PARSE-LIVE-PROGRAM-SUBSET-EMIT, PROGRAM-SUBSET-EMIT-THEOREM, liveRel,
  kernelCheckLiveProgramSubsetEmitSource,
  hostFrontLiveProgramSubsetEmitReady.
  Module: SystemsLean.HostFrontLiveProgramSubsetEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProgramSubsetEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProgramSubsetEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PROGRAM-SUBSET-EMIT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PROGRAM-SUBSET-EMIT"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is ProgramSubsetEmit.lean, defined in the Source module. -/
def liveProgramSubsetEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProgramSubsetEmitFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def programSubsetEmitLlvmUnlocked is false. That def is not
    this flag. The live def stillUsesLake is true. That def is not this flag. -/
def hostFrontLiveProgramSubsetEmitFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProgramSubsetEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProgramSubsetEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProgramSubsetEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveProgramSubsetEmitSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, kernel-checkable literal defs,
    and end. Skipped: open, theorem, example, set_option, and defs whose
    bodies are not kernel-checkable. From ProgramSubsetEmit.lean. -/
def liveProgramSubsetEmitKeptCmds : Nat := 19

/-- theorem keyword count. ProgramSubsetEmit.lean has 9 theorem commands.
    They are skipped, not kernel-checked. -/
def liveProgramSubsetEmitTheoremCount : Nat := 9

/-- example keyword count. ProgramSubsetEmit.lean has 16 example commands.
    They are skipped, not kernel-checked. -/
def liveProgramSubsetEmitExampleCount : Nat := 16

/-- set_option keyword count. ProgramSubsetEmit.lean has one set_option. -/
def liveProgramSubsetEmitSetOptionCount : Nat := 1

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
def cmdAddsProgramSubsetEmit (c : Cmd) : List String :=
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
def cmdBodyKnownProgramSubsetEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProgramSubsetEmitParseFuel body
        && termNoAppN liveProgramSubsetEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProgramSubsetEmitParseFuel body
        && termNoAppN liveProgramSubsetEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdProgramSubsetEmit (fuel : Nat) (toks : List String) :
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
def parseCmdsProgramSubsetEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProgramSubsetEmit liveProgramSubsetEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProgramSubsetEmitSkipFuel rest
      if cmdBodyKnownProgramSubsetEmit kn c then
        parseCmdsProgramSubsetEmit n rest2
          (kn ++ cmdAddsProgramSubsetEmit c) (acc ++ [c])
      else
        parseCmdsProgramSubsetEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProgramSubsetEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProgramSubsetEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProgramSubsetEmit.lean text.
    Greppable: parseLiveProgramSubsetEmitSource,
    PARSE-LIVE-PROGRAM-SUBSET-EMIT. -/
def parseLiveProgramSubsetEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProgramSubsetEmit liveProgramSubsetEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProgramSubsetEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProgramSubsetEmit parse. Not a fixture.
    Greppable: kernelCheckLiveProgramSubsetEmitSource,
    PARSE-LIVE-PROGRAM-SUBSET-EMIT. -/
def kernelCheckLiveProgramSubsetEmitSource (src : String) : Bool :=
  match parseLiveProgramSubsetEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProgramSubsetEmitParsed? : Option Module :=
  match parseLiveProgramSubsetEmitSource liveProgramSubsetEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProgramSubsetEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Two imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveProgramSubsetEmitParsed? with
  | some m => m.commands.length == liveProgramSubsetEmitKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, stillUsesLake,
    programSubsetEmitLlvmUnlocked, programSubsetEmitResidualFreeClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveProgramSubsetEmitParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "stillUsesLake"
      && has "programSubsetEmitLlvmUnlocked"
      && has "programSubsetEmitResidualFreeClaimed"

/-- Wrap module lastSeg is ProgramSubsetEmit (no module line in the live file). -/
def liveParseHasProgramSubsetEmitModule : Bool :=
  match liveProgramSubsetEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProgramSubsetEmit"
      && lastSeg m.name.raw == "ProgramSubsetEmit"

/-- Live parse has namespace SystemsLean.ProgramSubsetEmit. -/
def liveParseHasProgramSubsetEmitNs : Bool :=
  match liveProgramSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProgramSubsetEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProgramSubsetEmit. -/
def liveParseHasProgramSubsetEmitEnd : Bool :=
  match liveProgramSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProgramSubsetEmit"
      | _ => false

/-- Live parse imports SystemsLean.CompilePathProgram. -/
def liveParseHasCompilePathProgramImport : Bool :=
  match liveProgramSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CompilePathProgram"
      | _ => false

/-- Live parse imports SystemsLean.EmitProgram. -/
def liveParseHasEmitProgramImport : Bool :=
  match liveProgramSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitProgram"
      | _ => false

/-- Keyword counts: theorem 9, example 16, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveProgramSubsetEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveProgramSubsetEmitSource)
    let fuel := liveProgramSubsetEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveProgramSubsetEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveProgramSubsetEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProgramSubsetEmitSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCompilePathProgram : String :=
  "import SystemsLean.CompilePathProgram\n"

/-- Second import needle. Trailing newline. -/
def needleImportEmitProgram : String := "import SystemsLean.EmitProgram\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ProgramSubsetEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n"

/-- justRecipe def needle with a trailing newline. -/
def needleJustRecipe : String :=
  "def justRecipe : String := \"program-subset-emit\"\n"

/-- programSubsetEmitLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def programSubsetEmitLlvmUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProgramSubsetEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ProgramSubsetEmit. -/
def liveNeedlesOk : Bool :=
  let src := liveProgramSubsetEmitSource
  (src.splitOn needleImportCompilePathProgram).length > 1
    && (src.splitOn needleImportEmitProgram).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleJustRecipe).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProgramSubsetEmitReady,
    PARSE-LIVE-PROGRAM-SUBSET-EMIT,
    HOST-FRONT-LIVE-PROGRAM-SUBSET-EMIT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProgramSubsetEmitReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_EMIT_V0")
    && (hostId == "HOST-FRONT-LIVE-PROGRAM-SUBSET-EMIT")
    && (parseId == "PARSE-LIVE-PROGRAM-SUBSET-EMIT")
    && (liveRel == "ProgramSubsetEmit.lean")
    && (liveProgramSubsetEmitRel
      == "src/systems/SystemsLean/ProgramSubsetEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProgramSubsetEmitFullHost
    && !hostFrontLiveProgramSubsetEmitFullBackend
    && !hostFrontLiveProgramSubsetEmitResidualFreeClaimed
    && !hostFrontLiveProgramSubsetEmitProvablyUnlocked
    && kernelCheckLiveProgramSubsetEmitSource liveProgramSubsetEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasProgramSubsetEmitModule
    && liveParseHasProgramSubsetEmitNs
    && liveParseHasProgramSubsetEmitEnd
    && liveParseHasCompilePathProgramImport
    && liveParseHasEmitProgramImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProgramSubsetEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProgramSubsetEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PROGRAM-SUBSET-EMIT =="
  IO.println s!"  host={hostId} file={liveProgramSubsetEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProgramSubsetEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProgramSubsetEmitRel}"
    throw (IO.userError s!"missing {liveProgramSubsetEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProgramSubsetEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProgramSubsetEmit.lean != liveProgramSubsetEmitSource"
    throw (IO.userError "dual-pin mismatch live ProgramSubsetEmit.lean")
  let r := parseLiveProgramSubsetEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PROGRAM-SUBSET-EMIT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PROGRAM-SUBSET-EMIT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PROGRAM-SUBSET-EMIT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProgramSubsetEmit parse false"
      throw (IO.userError "kernelCheck live ProgramSubsetEmit parse false")
    unless hostFrontLiveProgramSubsetEmitReady do
      IO.eprintln "error: hostFrontLiveProgramSubsetEmitReady false"
      IO.eprintln s!"  diag count={liveParseCmdCountOk} kw={liveParseKwCountsOk} needles={liveNeedlesOk} literals={liveParseHasLiteralDefs} mod={liveParseHasProgramSubsetEmitModule} ns={liveParseHasProgramSubsetEmitNs} endNs={liveParseHasProgramSubsetEmitEnd} impA={liveParseHasCompilePathProgramImport} impB={liveParseHasEmitProgramImport} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveProgramSubsetEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProgramSubsetEmit source was accepted"
      throw (IO.userError "empty ProgramSubsetEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProgramSubsetEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProgramSubsetEmit
