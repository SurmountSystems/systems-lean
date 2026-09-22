/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ParityMultTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ParityMultTheorems.lean. It is not ParityMult.lean.
  The live file has no kernel-checkable def. Imports, namespace, and end
  are kept. theorem, example, set_option, and open are skip-folded.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-MULT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PARITY_MULT_THEOREMS_V0,
  PARSE-LIVE-PARITY-MULT-THEOREMS, PARITY-MULT-THEOREM, liveRel,
  kernelCheckLiveParityMultTheoremsSource,
  hostFrontLiveParityMultTheoremsReady.
  Module: SystemsLean.HostFrontLiveParityMultTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityMultTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityMultTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_MULT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-MULT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-MULT-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "ParityMultTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityMultTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityMultTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveParityMultTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityMultTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveParityMultTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityMultTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem, example, set_option, and open. -/
def liveParityMultTheoremsSkipFuel : Nat := 8192

/-- Kept commands: four imports, namespace, and end.
    From ParityMultTheorems.lean. No def is kept. -/
def liveParityMultTheoremsKeptCmds : Nat := 6

/-- theorem keyword count. ParityMultTheorems.lean has 31 theorems. -/
def liveParityMultTheoremsTheoremCount : Nat := 31

/-- example keyword count. ParityMultTheorems.lean has 31 examples. -/
def liveParityMultTheoremsExampleCount : Nat := 31

/-- set_option keyword count. ParityMultTheorems.lean has one set_option. -/
def liveParityMultTheoremsSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . ParityMult`. -/
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
def cmdAddsParityMultTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownParityMultTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityMultTheoremsParseFuel body
        && termNoAppN liveParityMultTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityMultTheoremsParseFuel body
        && termNoAppN liveParityMultTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdParityMultTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsParityMultTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdParityMultTheorems liveParityMultTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityMultTheoremsSkipFuel rest
      if cmdBodyKnownParityMultTheorems kn c then
        parseCmdsParityMultTheorems n rest2
          (kn ++ cmdAddsParityMultTheorems c) (acc ++ [c])
      else
        parseCmdsParityMultTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityMultTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsParityMultTheorems n rest2 kn acc
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

/-- Parse live ParityMultTheorems.lean text.
    Greppable: parseLiveParityMultTheoremsSource,
    PARSE-LIVE-PARITY-MULT-THEOREMS. -/
def parseLiveParityMultTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsParityMultTheorems liveParityMultTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ParityMultTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ParityMultTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveParityMultTheoremsSource,
    PARSE-LIVE-PARITY-MULT-THEOREMS. -/
def kernelCheckLiveParityMultTheoremsSource (src : String) : Bool :=
  match parseLiveParityMultTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityMultTheoremsParsed? : Option Module :=
  match parseLiveParityMultTheoremsSource liveParityMultTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityMultTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Four imports, namespace, and end.
    Not a count that invents defs. -/
def liveParseCmdCountOk : Bool :=
  match liveParityMultTheoremsParsed? with
  | some m => m.commands.length == liveParityMultTheoremsKeptCmds
  | none => false

/-- This theorems peel keeps no def. -/
def liveParseHasNoDefCmd : Bool :=
  match liveParityMultTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is ParityMultTheorems (no module line in the live file). -/
def liveParseHasParityMultTheoremsModule : Bool :=
  match liveParityMultTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ParityMultTheorems"
      && lastSeg m.name.raw == "ParityMultTheorems"

/-- Live parse has namespace SystemsLean.ParityMult. -/
def liveParseHasParityMultNs : Bool :=
  match liveParityMultTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ParityMult"
      | _ => false

/-- Live parse ends namespace SystemsLean.ParityMult. -/
def liveParseHasParityMultEnd : Bool :=
  match liveParityMultTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ParityMult"
      | _ => false

/-- Live parse imports Mult, KernelMult, EmitMult, and ParityMult. -/
def liveParseHasImports : Bool :=
  match liveParityMultTheoremsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Mult"
      && has "SystemsLean.KernelMult"
      && has "SystemsLean.EmitMult"
      && has "SystemsLean.ParityMult"

/-- Keyword counts from the live text. -/
def liveParseKwCountsOk : Bool :=
  match liveParityMultTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityMultTheoremsSource)
    let fuel := liveParityMultTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveParityMultTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveParityMultTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveParityMultTheoremsSetOptionCount

/-- Skip-head: theorem stageId_eq and multParityReady_true are in the live text. -/
def liveParseHasCoreTheorems : Bool :=
  match liveParityMultTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityMultTheoremsSource)
    let fuel := liveParityMultTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "multParityReady_true"

/-- Import needle. Trailing newline. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelMult : String := "import SystemsLean.KernelMult\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitMult : String := "import SystemsLean.EmitMult\n"

/-- Import needle. Trailing newline. -/
def needleImportParityMult : String := "import SystemsLean.ParityMult\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ParityMult\n"

/-- set_option needle with a trailing newline. -/
def needleSetOption : String := "set_option maxRecDepth 4096\n"

/-- stageId_eq theorem needle with a trailing newline. -/
def needleStageIdEq : String :=
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_PARITY_MULT_V0\" := rfl\n"

/-- multParityReady_true theorem needle with a trailing newline. -/
def needleMultParityReady : String :=
  "theorem multParityReady_true : multParityReady = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ParityMult\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ParityMultTheorems. Needles are lines in the live file. -/
def liveNeedlesOk : Bool :=
  let src := liveParityMultTheoremsSource
  (src.splitOn needleImportMult).length > 1
    && (src.splitOn needleImportKernelMult).length > 1
    && (src.splitOn needleImportEmitMult).length > 1
    && (src.splitOn needleImportParityMult).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleSetOption).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleMultParityReady).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityMultTheoremsReady,
    PARSE-LIVE-PARITY-MULT-THEOREMS,
    HOST-FRONT-LIVE-PARITY-MULT-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveParityMultTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_MULT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-MULT-THEOREMS")
    && (parseId == "PARSE-LIVE-PARITY-MULT-THEOREMS")
    && (liveRel == "ParityMultTheorems.lean")
    && (liveParityMultTheoremsRel
      == "src/systems/SystemsLean/ParityMultTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityMultTheoremsFullHost
    && !hostFrontLiveParityMultTheoremsFullBackend
    && !hostFrontLiveParityMultTheoremsResidualFreeClaimed
    && !hostFrontLiveParityMultTheoremsProvablyUnlocked
    && kernelCheckLiveParityMultTheoremsSource liveParityMultTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoDefCmd
    && liveParseHasParityMultTheoremsModule
    && liveParseHasParityMultNs
    && liveParseHasParityMultEnd
    && liveParseHasImports
    && liveParseKwCountsOk
    && liveParseHasCoreTheorems
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityMultTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveParityMultTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-MULT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveParityMultTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveParityMultTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityMultTheoremsRel}"
    throw (IO.userError s!"missing {liveParityMultTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityMultTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ParityMultTheorems.lean != liveParityMultTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ParityMultTheorems.lean")
  let r := parseLiveParityMultTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-MULT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-MULT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-MULT-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ParityMultTheorems parse false"
      throw (IO.userError "kernelCheck live ParityMultTheorems parse false")
    unless hostFrontLiveParityMultTheoremsReady do
      IO.eprintln "error: hostFrontLiveParityMultTheoremsReady false"
      throw (IO.userError "hostFrontLiveParityMultTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ParityMultTheorems source was accepted"
      throw (IO.userError "empty ParityMultTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityMultTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityMultTheorems
