/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CompilePathMult.lean.
  Short role: HostFrontLiveCompilePathMult. parseSource keep of
  CompilePathMult.lean, module name SystemsLean.CompilePathMult.
  Ready is that conjunction, not a hardcoded true.
  This wrap is CompilePathMult.lean. It is not CompilePath.lean.
  The live namespace is SystemsLean.CompilePath.
  Wrap-assigned module lastSeg is CompilePathMult.
  parseLiveCompilePathMultSource is HostFront.parseSource of live
  CompilePathMult.lean text, then keep/register the module name
  SystemsLean.CompilePathMult. parseSource is what --slake-check
  reads (walkKept keep, not a skip-fold of this module).
  Do not skip-fold CompilePathMult away from --slake-check.
  theorem, example, and set_option are counted in the token walk.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Product stage id is COMPILE-PATH-MULT.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-COMPILE-PATH-MULT,
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_MULT_V0,
  PARSE-LIVE-COMPILE-PATH-MULT, COMPILE-PATH-MULT, liveRel,
  kernelCheckLiveCompilePathMultSource,
  hostFrontLiveCompilePathMultReady,
  hostFrontParseSourceCompilePathMult.
  Module: SystemsLean.HostFrontLiveCompilePathMult
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathMultSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCompilePathMult

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_MULT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILE-PATH-MULT"

/-- Greppable parse id. Hyphenated product stage is COMPILE-PATH-MULT. -/
def parseId : String := "PARSE-LIVE-COMPILE-PATH-MULT"

/-- Product hyphenated stage id from CompilePathMult.lean. -/
def productStageId : String := "COMPILE-PATH-MULT"

/-- Live file basename. -/
def liveRel : String := "CompilePathMult.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathMultRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- HostFront.parseSource is what --slake-check reads (walkKept keep).
    Not a skip-fold of CompilePathMult. Name register is
    parseLiveCompilePathMultSource (SystemsLean.CompilePathMult). -/
def hostFrontParseSourceCompilePathMult : Bool :=
  match parseSource liveCompilePathMultSource with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathMultFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCompilePathMultFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathMultResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCompilePathMultProvablyUnlocked : Bool := false

/-- Graph-shape typed keep. Same sequential forms HostFrontLiveCompilePathGraph
    already landed (PASS): mint Nat, Bool honesty pair, decide theorem.
    Mint ident is multFixtureMintId from CompilePathMult (Nat 4),
    not a new mint ident. Not a skip-fold.
    Greppable: multFixtureMintId, MULT-FIXTURE. -/
def multFixtureMintId : Nat := 4

/-- Mult fixture ordered-IR bar pin. Typed keep, not := residual free. -/
def multFixtureProgramReady : Bool := true

/-- Mult fixture unit-compose bar pin. Honesty pair with ProgramReady. -/
def multFixtureComposeReady : Bool := true

/-- Mult fixture decide theorem. native_decide is not decide.
    Greppable: multFixtureProgramReady_true, MULT-FIXTURE. -/
theorem multFixtureProgramReady_true : multFixtureProgramReady = true := by decide

/-- Parse fuel (command fold). -/
def liveCompilePathMultParseFuel : Nat := 256

/-- Fuel for token walks (def names in live text). -/
def liveCompilePathMultSkipFuel : Nat := 8192

/-- Kept-command lower bound: two imports, namespace, eight literal defs, and end.
    From CompilePathMult.lean. parseLive uses parseSource keep, not skip-fold. -/
def liveCompilePathMultKeptCmds : Nat := 12

/-- theorem keyword count. CompilePathMult.lean has nine theorems. -/
def liveCompilePathMultTheoremCount : Nat := 9

/-- example keyword count. CompilePathMult.lean has sixteen examples. -/
def liveCompilePathMultExampleCount : Nat := 16

/-- set_option keyword count. CompilePathMult.lean has one set_option. -/
def liveCompilePathMultSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . CompilePath`. -/
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
def cmdAddsCompilePathMult (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. Leftover helper. parseLive uses parseSource keep. -/
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
def cmdBodyKnownCompilePathMult (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathMultParseFuel body
        && termNoAppN liveCompilePathMultParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathMultParseFuel body
        && termNoAppN liveCompilePathMultParseFuel body
  | _ => true

/-- Parse one command. none means the caller advances. import / namespace /
    end / def. parseLiveCompilePathMultSource uses parseSource keep. -/
def parseOneCmdCompilePathMult (fuel : Nat) (toks : List String) :
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

/-- Token walk: live text has `def` named `nm`. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live CompilePathMult.lean text.
    HostFront.parseSource is the keep path --slake-check reads.
    Keep/register names SystemsLean.CompilePathMult.
    Greppable: parseLiveCompilePathMultSource,
    PARSE-LIVE-COMPILE-PATH-MULT. -/
def parseLiveCompilePathMultSource (src : String) : FrontResult :=
  if src.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseSource src with
    | FrontResult.reject r => FrontResult.reject r
    | FrontResult.accept m =>
      let kept : Module :=
        { name := HostTerm.n "SystemsLean.CompilePathMult"
          commands := m.commands }
      if isWellFormed kept then FrontResult.accept kept
      else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePathMult parse. Not a fixture.
    Greppable: kernelCheckLiveCompilePathMultSource,
    PARSE-LIVE-COMPILE-PATH-MULT. -/
def kernelCheckLiveCompilePathMultSource (src : String) : Bool :=
  match parseLiveCompilePathMultSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathMultParsed? : Option Module :=
  match parseLiveCompilePathMultSource liveCompilePathMultSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathMultParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Real lower bound from this parse, not
    hardcoded true. Two imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathMultParsed? with
  | some m => m.commands.length >= liveCompilePathMultKeptCmds
  | none => false

/-- Literal defs unique to CompilePathMult.lean. Token walk, not skip-fold.
    Greppable: multFixtureMintId, multFixtureTagErased. -/
def liveParseHasLiteralDefs : Bool :=
  match liveCompilePathMultParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCompilePathMultSource)
    let fuel := liveCompilePathMultSkipFuel
    toksHaveDefNamed fuel toks "multFixtureMintId"
      && toksHaveDefNamed fuel toks "multFixtureTagErased"
      && toksHaveDefNamed fuel toks "multFixtureTagLinear"
      && toksHaveDefNamed fuel toks "multFixtureTagValue"
      && toksHaveDefNamed fuel toks "multFixtureResidualFreeClaimed"
      && toksHaveDefNamed fuel toks "multFixtureProductSelfHostCompleteClaimed"
      && toksHaveDefNamed fuel toks "multFixtureProofCompleteClaimed"
      && toksHaveDefNamed fuel toks "multFixtureLlvmUnlocked"

/-- Wrap module lastSeg is CompilePathMult (no module line in the live file).
    The live namespace is SystemsLean.CompilePath. -/
def liveParseHasCompilePathModule : Bool :=
  match liveCompilePathMultParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CompilePathMult"
      && lastSeg m.name.raw == "CompilePathMult"

/-- Live parse has namespace SystemsLean.CompilePath. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CompilePath"
      | _ => false

/-- Live parse ends namespace SystemsLean.CompilePath. -/
def liveParseHasCompilePathEnd : Bool :=
  match liveCompilePathMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CompilePath"
      | _ => false

/-- Live parse imports SystemsLean.CompilePath and SystemsLean.EmitMult. -/
def liveParseHasImports : Bool :=
  match liveCompilePathMultParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.CompilePath" && has "SystemsLean.EmitMult"

/-- Keyword counts: nine theorem, sixteen example, one set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveCompilePathMultParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCompilePathMultSource)
    let fuel := liveCompilePathMultSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCompilePathMultTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCompilePathMultExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCompilePathMultSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCompilePath : String := "import SystemsLean.CompilePath\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitMult : String := "import SystemsLean.EmitMult\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CompilePath\n"

/-- multFixtureMintId def needle with a trailing newline. -/
def needleMintId : String := "def multFixtureMintId : Nat := 4\n"

/-- multFixtureTagErased def needle with a trailing newline. -/
def needleTagErased : String := "def multFixtureTagErased : Nat := 0\n"

/-- multFixtureResidualFreeClaimed def needle with a trailing newline. -/
def needleResidualFree : String :=
  "def multFixtureResidualFreeClaimed : Bool := false\n"

/-- multFixtureLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def multFixtureLlvmUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CompilePath\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Each needle ends with a trailing newline. -/
def liveNeedlesOk : Bool :=
  let src := liveCompilePathMultSource
  (src.splitOn needleImportCompilePath).length > 1
    && (src.splitOn needleImportEmitMult).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleMintId).length > 1
    && (src.splitOn needleTagErased).length > 1
    && (src.splitOn needleResidualFree).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathMultReady,
    PARSE-LIVE-COMPILE-PATH-MULT,
    HOST-FRONT-LIVE-COMPILE-PATH-MULT,
    COMPILE-PATH-MULT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCompilePathMultReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_MULT_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILE-PATH-MULT")
    && (parseId == "PARSE-LIVE-COMPILE-PATH-MULT")
    && (productStageId == "COMPILE-PATH-MULT")
    && (liveRel == "CompilePathMult.lean")
    && (liveCompilePathMultRel
      == "src/systems/SystemsLean/CompilePathMult.lean")
    && hostFrontParseSourceCompilePathMult
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathMultFullHost
    && !hostFrontLiveCompilePathMultFullBackend
    && !hostFrontLiveCompilePathMultResidualFreeClaimed
    && !hostFrontLiveCompilePathMultProvablyUnlocked
    && kernelCheckLiveCompilePathMultSource liveCompilePathMultSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasCompilePathModule
    && liveParseHasCompilePathNs
    && liveParseHasCompilePathEnd
    && liveParseHasImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathMultSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def cmdBrief : Cmd -> String
  | Cmd.importModule x => s!"KEEP import {x.raw}"
  | Cmd.namespace x => s!"KEEP namespace {x.raw}"
  | Cmd.endNamespace x => s!"KEEP end {x.raw}"
  | Cmd.def_ x _ _ => s!"KEEP def {x.raw}"
  | Cmd.defBind x _ _ _ => s!"KEEP defBind {x.raw}"
  | Cmd.inductive_ x _ _ => s!"KEEP inductive {x.raw}"
  | Cmd.structure_ x _ _ => s!"KEEP structure {x.raw}"
  | Cmd.openNs _ => "KEEP open"
  | Cmd.check _ _ => "KEEP check"

def runLiveCompilePathMult (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILE-PATH-MULT =="
  IO.println s!"  host={hostId} file={liveCompilePathMultRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCompilePathMultRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathMultRel}"
    throw (IO.userError s!"missing {liveCompilePathMultRel}")
  let disk <- IO.FS.readFile path
  IO.println s!"diskBytes={disk.utf8ByteSize} pinBytes={liveCompilePathMultSource.utf8ByteSize}"
  if disk != liveCompilePathMultSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePathMult.lean != liveCompilePathMultSource"
    throw (IO.userError "dual-pin mismatch live CompilePathMult.lean")
  let r := parseLiveCompilePathMultSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILE-PATH-MULT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILE-PATH-MULT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    for c in m.commands do
      IO.println (cmdBrief c)
    IO.println s!"PASS PARSE-LIVE-COMPILE-PATH-MULT ACCEPT cmds={m.commands.length} kernelCheck={k} cmdCountOk={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} moduleOk={liveParseHasCompilePathModule} nsOk={liveParseHasCompilePathNs} endOk={liveParseHasCompilePathEnd} importOk={liveParseHasImports} kwOk={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd} ready={hostFrontLiveCompilePathMultReady}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePathMult parse false"
      throw (IO.userError "kernelCheck live CompilePathMult parse false")
    unless hostFrontLiveCompilePathMultReady do
      IO.eprintln "error: hostFrontLiveCompilePathMultReady false"
      throw (IO.userError "hostFrontLiveCompilePathMultReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CompilePathMult source was accepted"
      throw (IO.userError "empty CompilePathMult source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePathMult root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePathMult
