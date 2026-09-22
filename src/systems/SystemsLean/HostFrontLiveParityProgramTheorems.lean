/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ParityProgramTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ParityProgramTheorems.lean. It is not ParityProgram.lean.
  The live file has no kernel-checkable def. Imports, namespace, and end
  are kept. theorem, example, and set_option are skip-folded.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-PROGRAM-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_THEOREMS_V0,
  PARSE-LIVE-PARITY-PROGRAM-THEOREMS, PARITY-PROGRAM-THEOREM, liveRel,
  kernelCheckLiveParityProgramTheoremsSource,
  hostFrontLiveParityProgramTheoremsReady.
  Module: SystemsLean.HostFrontLiveParityProgramTheorems
  liveRel is the bare basename in HostFrontLiveParityProgramTheoremsSource.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityProgramTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityProgramTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-PROGRAM-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-PROGRAM-THEOREMS"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is the bare basename from the Source module. -/
def liveParityProgramTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityProgramTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveParityProgramTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityProgramTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveParityProgramTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityProgramTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem, example, and set_option. -/
def liveParityProgramTheoremsSkipFuel : Nat := 8192

/-- Kept commands: three imports, namespace, and end.
    From ParityProgramTheorems.lean. No def is kept. -/
def liveParityProgramTheoremsKeptCmds : Nat := 5

/-- theorem keyword count. ParityProgramTheorems.lean has 24 theorems. -/
def liveParityProgramTheoremsTheoremCount : Nat := 24

/-- example keyword count. ParityProgramTheorems.lean has 34 examples. -/
def liveParityProgramTheoremsExampleCount : Nat := 34

/-- set_option keyword count. ParityProgramTheorems.lean has one set_option. -/
def liveParityProgramTheoremsSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . ParityProgram`. -/
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
def cmdAddsParityProgramTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownParityProgramTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityProgramTheoremsParseFuel body
        && termNoAppN liveParityProgramTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityProgramTheoremsParseFuel body
        && termNoAppN liveParityProgramTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdParityProgramTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsParityProgramTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdParityProgramTheorems liveParityProgramTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityProgramTheoremsSkipFuel rest
      if cmdBodyKnownParityProgramTheorems kn c then
        parseCmdsParityProgramTheorems n rest2
          (kn ++ cmdAddsParityProgramTheorems c) (acc ++ [c])
      else
        parseCmdsParityProgramTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityProgramTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsParityProgramTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live ParityProgramTheorems.lean text.
    Greppable: parseLiveParityProgramTheoremsSource,
    PARSE-LIVE-PARITY-PROGRAM-THEOREMS. -/
def parseLiveParityProgramTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsParityProgramTheorems liveParityProgramTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ParityProgramTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ParityProgramTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveParityProgramTheoremsSource,
    PARSE-LIVE-PARITY-PROGRAM-THEOREMS. -/
def kernelCheckLiveParityProgramTheoremsSource (src : String) : Bool :=
  match parseLiveParityProgramTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityProgramTheoremsParsed? : Option Module :=
  match parseLiveParityProgramTheoremsSource liveParityProgramTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityProgramTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Three imports, namespace, and end.
    Not a count that invents defs. -/
def liveParseCmdCountOk : Bool :=
  match liveParityProgramTheoremsParsed? with
  | some m => m.commands.length == liveParityProgramTheoremsKeptCmds
  | none => false

/-- This theorems file keeps no def. -/
def liveParseHasNoDefCmd : Bool :=
  match liveParityProgramTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is ParityProgramTheorems (no module line in the live file). -/
def liveParseHasParityProgramTheoremsModule : Bool :=
  match liveParityProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ParityProgramTheorems"
      && lastSeg m.name.raw == "ParityProgramTheorems"

/-- Live parse has namespace SystemsLean.ParityProgram. -/
def liveParseHasParityProgramNs : Bool :=
  match liveParityProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ParityProgram"
      | _ => false

/-- Live parse ends namespace SystemsLean.ParityProgram. -/
def liveParseHasParityProgramEnd : Bool :=
  match liveParityProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ParityProgram"
      | _ => false

/-- Live parse imports KernelProgram, ParityTypes, and ParityProgram. -/
def liveParseHasImports : Bool :=
  match liveParityProgramTheoremsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.KernelProgram"
      && has "SystemsLean.ParityTypes"
      && has "SystemsLean.ParityProgram"

/-- Keyword counts from the live text. -/
def liveParseKwCountsOk : Bool :=
  match liveParityProgramTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityProgramTheoremsSource)
    let fuel := liveParityProgramTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveParityProgramTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveParityProgramTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveParityProgramTheoremsSetOptionCount

/-- Skip-head: theorem stageId_eq and programParityReady_true are in the live text. -/
def liveParseHasCoreTheorems : Bool :=
  match liveParityProgramTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityProgramTheoremsSource)
    let fuel := liveParityProgramTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "programParityReady_true"
      && toksHaveTheoremNamed fuel toks "productApiSurfaceOk_true"

/-- Import needle. Trailing newline. -/
def needleImportKernelProgram : String := "import SystemsLean.KernelProgram\n"

/-- Import needle. Trailing newline. -/
def needleImportParityTypes : String := "import SystemsLean.ParityTypes\n"

/-- Import needle. Trailing newline. -/
def needleImportParityProgram : String := "import SystemsLean.ParityProgram\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ParityProgram\n"

/-- set_option needle with a trailing newline. -/
def needleSetOption : String := "set_option maxRecDepth 16384\n"

/-- stageId_eq theorem needle with a trailing newline. -/
def needleStageIdEq : String :=
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_PARITY_PROGRAM_V0\" := rfl\n"

/-- programParityReady_true theorem needle with a trailing newline. -/
def needleProgramParityReady : String :=
  "theorem programParityReady_true : programParityReady = true := by decide\n"

/-- productApiSurfaceOk_true theorem needle with a trailing newline. -/
def needleProductApiSurface : String :=
  "theorem productApiSurfaceOk_true : productApiSurfaceOk = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ParityProgram\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ParityProgramTheorems. Needles are lines in the live file. -/
def liveNeedlesOk : Bool :=
  let src := liveParityProgramTheoremsSource
  (src.splitOn needleImportKernelProgram).length > 1
    && (src.splitOn needleImportParityTypes).length > 1
    && (src.splitOn needleImportParityProgram).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleSetOption).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleProgramParityReady).length > 1
    && (src.splitOn needleProductApiSurface).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityProgramTheoremsReady,
    PARSE-LIVE-PARITY-PROGRAM-THEOREMS,
    HOST-FRONT-LIVE-PARITY-PROGRAM-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveParityProgramTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-PROGRAM-THEOREMS")
    && (parseId == "PARSE-LIVE-PARITY-PROGRAM-THEOREMS")
    && (liveRel == "ParityProgramTheorems.lean")
    && (liveParityProgramTheoremsRel
      == "src/systems/SystemsLean/ParityProgramTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityProgramTheoremsFullHost
    && !hostFrontLiveParityProgramTheoremsFullBackend
    && !hostFrontLiveParityProgramTheoremsResidualFreeClaimed
    && !hostFrontLiveParityProgramTheoremsProvablyUnlocked
    && kernelCheckLiveParityProgramTheoremsSource liveParityProgramTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoDefCmd
    && liveParseHasParityProgramTheoremsModule
    && liveParseHasParityProgramNs
    && liveParseHasParityProgramEnd
    && liveParseHasImports
    && liveParseKwCountsOk
    && liveParseHasCoreTheorems
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityProgramTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveParityProgramTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-PROGRAM-THEOREMS =="
  IO.println s!"  host={hostId} file={liveParityProgramTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveParityProgramTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityProgramTheoremsRel}"
    throw (IO.userError s!"missing {liveParityProgramTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityProgramTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ParityProgramTheorems.lean != liveParityProgramTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ParityProgramTheorems.lean")
  let r := parseLiveParityProgramTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-PROGRAM-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-PROGRAM-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-PROGRAM-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ParityProgramTheorems parse false"
      throw (IO.userError "kernelCheck live ParityProgramTheorems parse false")
    unless hostFrontLiveParityProgramTheoremsReady do
      IO.eprintln "error: hostFrontLiveParityProgramTheoremsReady false"
      throw (IO.userError "hostFrontLiveParityProgramTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ParityProgramTheorems source was accepted"
      throw (IO.userError "empty ParityProgramTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityProgramTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityProgramTheorems
