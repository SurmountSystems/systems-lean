/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/ExtractSubsetEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ExtractSubsetEmit.lean. Theorems, examples, and set_option
  in that file are skipped. It is not ExtractSubsetEmitMain.lean.
  HostFrontLiveExtractSubsetEmitMain.lean already parses
  ExtractSubsetEmitMain.lean. This file does not replace that module.
  Literal String and Bool defs stay. Compound defs are skipped when the
  body is not kernel-checkable (unknown const, string append, IO do,
  equation heads). theorem count is 9. example count is 16.
  set_option count is 1.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def extractSubsetEmitLlvmUnlocked is false.
  The live def stillUsesLake is true.
  They are not this wrap's backend claim. The provably flag stays false.
  Hyphenated stage id: EXTRACT-SUBSET-EMIT.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT,
  SLAKE_HOST_FRONT_LIVE_EXTRACT_SUBSET_EMIT_V0,
  PARSE-LIVE-EXTRACT-SUBSET-EMIT, EXTRACT-SUBSET-EMIT, liveRel,
  kernelCheckLiveExtractSubsetEmitSource,
  hostFrontLiveExtractSubsetEmitReady.
  Module: SystemsLean.HostFrontLiveExtractSubsetEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveExtractSubsetEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveExtractSubsetEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EXTRACT_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT"

/-- Greppable parse id. Hyphenated stage id EXTRACT-SUBSET-EMIT. -/
def parseId : String := "PARSE-LIVE-EXTRACT-SUBSET-EMIT"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is ExtractSubsetEmit.lean, defined in the Source module. -/
def liveExtractSubsetEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveExtractSubsetEmitFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def extractSubsetEmitLlvmUnlocked is false. That def is not
    this flag. The live def stillUsesLake is true. That def is not this flag. -/
def hostFrontLiveExtractSubsetEmitFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveExtractSubsetEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveExtractSubsetEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveExtractSubsetEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveExtractSubsetEmitSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, kernel-checkable literal defs,
    and end. Skipped: open, theorem, example, set_option, and defs whose
    bodies are not kernel-checkable. From ExtractSubsetEmit.lean. -/
def liveExtractSubsetEmitKeptCmds : Nat := 19

/-- theorem keyword count. ExtractSubsetEmit.lean has 9 theorem commands.
    They are skipped, not kernel-checked. -/
def liveExtractSubsetEmitTheoremCount : Nat := 9

/-- example keyword count. ExtractSubsetEmit.lean has 16 example commands.
    They are skipped, not kernel-checked. -/
def liveExtractSubsetEmitExampleCount : Nat := 16

/-- set_option keyword count. ExtractSubsetEmit.lean has one set_option. -/
def liveExtractSubsetEmitSetOptionCount : Nat := 1

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
def cmdAddsExtractSubsetEmit (c : Cmd) : List String :=
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
def cmdBodyKnownExtractSubsetEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveExtractSubsetEmitParseFuel body
        && termNoAppN liveExtractSubsetEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveExtractSubsetEmitParseFuel body
        && termNoAppN liveExtractSubsetEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdExtractSubsetEmit (fuel : Nat) (toks : List String) :
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
def parseCmdsExtractSubsetEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdExtractSubsetEmit liveExtractSubsetEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveExtractSubsetEmitSkipFuel rest
      if cmdBodyKnownExtractSubsetEmit kn c then
        parseCmdsExtractSubsetEmit n rest2
          (kn ++ cmdAddsExtractSubsetEmit c) (acc ++ [c])
      else
        parseCmdsExtractSubsetEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveExtractSubsetEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsExtractSubsetEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ExtractSubsetEmit.lean text.
    Greppable: parseLiveExtractSubsetEmitSource,
    PARSE-LIVE-EXTRACT-SUBSET-EMIT. -/
def parseLiveExtractSubsetEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsExtractSubsetEmit liveExtractSubsetEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ExtractSubsetEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ExtractSubsetEmit parse. Not a fixture.
    Greppable: kernelCheckLiveExtractSubsetEmitSource,
    PARSE-LIVE-EXTRACT-SUBSET-EMIT. -/
def kernelCheckLiveExtractSubsetEmitSource (src : String) : Bool :=
  match parseLiveExtractSubsetEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveExtractSubsetEmitParsed? : Option Module :=
  match parseLiveExtractSubsetEmitSource liveExtractSubsetEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveExtractSubsetEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Two imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveExtractSubsetEmitParsed? with
  | some m => m.commands.length == liveExtractSubsetEmitKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, stillUsesLake,
    extractSubsetEmitLlvmUnlocked, extractSubsetEmitResidualFreeClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveExtractSubsetEmitParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "stillUsesLake"
      && has "extractSubsetEmitLlvmUnlocked"
      && has "extractSubsetEmitResidualFreeClaimed"

/-- Wrap module lastSeg is ExtractSubsetEmit (no module line in the live file). -/
def liveParseHasExtractSubsetEmitModule : Bool :=
  match liveExtractSubsetEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ExtractSubsetEmit"
      && lastSeg m.name.raw == "ExtractSubsetEmit"

/-- Live parse has namespace SystemsLean.ExtractSubsetEmit. -/
def liveParseHasExtractSubsetEmitNs : Bool :=
  match liveExtractSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ExtractSubsetEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.ExtractSubsetEmit. -/
def liveParseHasExtractSubsetEmitEnd : Bool :=
  match liveExtractSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ExtractSubsetEmit"
      | _ => false

/-- Live parse imports SystemsLean.CompilePathExtract. -/
def liveParseHasCompilePathExtractImport : Bool :=
  match liveExtractSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CompilePathExtract"
      | _ => false

/-- Live parse imports SystemsLean.EmitExtract. -/
def liveParseHasEmitExtractImport : Bool :=
  match liveExtractSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitExtract"
      | _ => false

/-- Keyword counts: theorem 9, example 16, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveExtractSubsetEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveExtractSubsetEmitSource)
    let fuel := liveExtractSubsetEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveExtractSubsetEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveExtractSubsetEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveExtractSubsetEmitSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCompilePathExtract : String :=
  "import SystemsLean.CompilePathExtract\n"

/-- Second import needle. Trailing newline. -/
def needleImportEmitExtract : String := "import SystemsLean.EmitExtract\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ExtractSubsetEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_EMIT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-EXTRACT-SUBSET-EMIT\"\n"

/-- justRecipe def needle with a trailing newline. -/
def needleJustRecipe : String :=
  "def justRecipe : String := \"extract-subset-emit\"\n"

/-- extractSubsetEmitLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def extractSubsetEmitLlvmUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ExtractSubsetEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ExtractSubsetEmit. -/
def liveNeedlesOk : Bool :=
  let src := liveExtractSubsetEmitSource
  (src.splitOn needleImportCompilePathExtract).length > 1
    && (src.splitOn needleImportEmitExtract).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleJustRecipe).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveExtractSubsetEmitReady,
    PARSE-LIVE-EXTRACT-SUBSET-EMIT,
    HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveExtractSubsetEmitReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EXTRACT_SUBSET_EMIT_V0")
    && (hostId == "HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT")
    && (parseId == "PARSE-LIVE-EXTRACT-SUBSET-EMIT")
    && (liveRel == "ExtractSubsetEmit.lean")
    && (liveExtractSubsetEmitRel
      == "src/systems/SystemsLean/ExtractSubsetEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveExtractSubsetEmitFullHost
    && !hostFrontLiveExtractSubsetEmitFullBackend
    && !hostFrontLiveExtractSubsetEmitResidualFreeClaimed
    && !hostFrontLiveExtractSubsetEmitProvablyUnlocked
    && kernelCheckLiveExtractSubsetEmitSource liveExtractSubsetEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasExtractSubsetEmitModule
    && liveParseHasExtractSubsetEmitNs
    && liveParseHasExtractSubsetEmitEnd
    && liveParseHasCompilePathExtractImport
    && liveParseHasEmitExtractImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveExtractSubsetEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveExtractSubsetEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EXTRACT-SUBSET-EMIT =="
  IO.println s!"  host={hostId} file={liveExtractSubsetEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveExtractSubsetEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveExtractSubsetEmitRel}"
    throw (IO.userError s!"missing {liveExtractSubsetEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveExtractSubsetEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ExtractSubsetEmit.lean != liveExtractSubsetEmitSource"
    throw (IO.userError "dual-pin mismatch live ExtractSubsetEmit.lean")
  let r := parseLiveExtractSubsetEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EXTRACT-SUBSET-EMIT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EXTRACT-SUBSET-EMIT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EXTRACT-SUBSET-EMIT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ExtractSubsetEmit parse false"
      throw (IO.userError "kernelCheck live ExtractSubsetEmit parse false")
    unless hostFrontLiveExtractSubsetEmitReady do
      IO.eprintln "error: hostFrontLiveExtractSubsetEmitReady false"
      IO.eprintln s!"  diag count={liveParseCmdCountOk} kw={liveParseKwCountsOk} needles={liveNeedlesOk} literals={liveParseHasLiteralDefs} mod={liveParseHasExtractSubsetEmitModule} ns={liveParseHasExtractSubsetEmitNs} endNs={liveParseHasExtractSubsetEmitEnd} impA={liveParseHasCompilePathExtractImport} impB={liveParseHasEmitExtractImport} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveExtractSubsetEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ExtractSubsetEmit source was accepted"
      throw (IO.userError "empty ExtractSubsetEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveExtractSubsetEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveExtractSubsetEmit
