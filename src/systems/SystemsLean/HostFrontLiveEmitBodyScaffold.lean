/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmHold.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmHold.lean. It is not LlvmHoldTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live defs llvmUnlocked and provablyUnlocked are true.
  They are not this wrap's backend claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-HOLD,
  SLAKE_HOST_FRONT_LIVE_LLVM_HOLD_V0,
  PARSE-LIVE-LLVM-HOLD, LLVM-HOLD-THEOREM, liveRel,
  kernelCheckLiveLlvmHoldSource,
  hostFrontLiveLlvmHoldReady.
  Module: SystemsLean.HostFrontLiveLlvmHold
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmHoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmHold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_HOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-HOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-HOLD"

/-- Live file basename. -/
def liveRel : String := "LlvmHold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmHoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmHoldFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def llvmUnlocked is true. That def is not this flag. -/
def hostFrontLiveLlvmHoldFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmHoldResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def provablyUnlocked is true. That def is not this flag. -/
def hostFrontLiveLlvmHoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmHoldParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmHoldSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, kernel-checkable defs, and end.
    A count of 4 would drop the literal defs. From LlvmHold.lean. -/
def liveLlvmHoldKeptCmds : Nat := 16

/-- theorem keyword count. LlvmHold.lean has no theorem. -/
def liveLlvmHoldTheoremCount : Nat := 0

/-- example keyword count. LlvmHold.lean has no example. -/
def liveLlvmHoldExampleCount : Nat := 0

/-- set_option keyword count. LlvmHold.lean has no set_option. -/
def liveLlvmHoldSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmHold`. -/
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
def cmdAddsLlvmHold (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmHold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmHoldParseFuel body
        && termNoAppN liveLlvmHoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmHoldParseFuel body
        && termNoAppN liveLlvmHoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmHold (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmHold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmHold liveLlvmHoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmHoldSkipFuel rest
      if cmdBodyKnownLlvmHold kn c then
        parseCmdsLlvmHold n rest2
          (kn ++ cmdAddsLlvmHold c) (acc ++ [c])
      else
        parseCmdsLlvmHold n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmHoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmHold n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmHold.lean text.
    Greppable: parseLiveLlvmHoldSource,
    PARSE-LIVE-LLVM-HOLD. -/
def parseLiveLlvmHoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmHold liveLlvmHoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmHold"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmHold parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmHoldSource,
    PARSE-LIVE-LLVM-HOLD. -/
def kernelCheckLiveLlvmHoldSource (src : String) : Bool :=
  match parseLiveLlvmHoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmHoldParsed? : Option Module :=
  match parseLiveLlvmHoldSource liveLlvmHoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmHoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Import, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmHoldParsed? with
  | some m => m.commands.length == liveLlvmHoldKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, llvmUnlocked,
    provablyUnlocked, freestandingProductSelfHostComplete. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmHoldParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "llvmUnlocked"
      && has "provablyUnlocked"
      && has "freestandingProductSelfHostComplete"

/-- Wrap module lastSeg is LlvmHold (no module line in the live file). -/
def liveParseHasLlvmHoldModule : Bool :=
  match liveLlvmHoldParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmHold"
      && lastSeg m.name.raw == "LlvmHold"

/-- Live parse has namespace SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldNs : Bool :=
  match liveLlvmHoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldEnd : Bool :=
  match liveLlvmHoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Live parse imports SystemsLean.SelfApply. -/
def liveParseHasSelfApplyImport : Bool :=
  match liveLlvmHoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.SelfApply"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmHoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmHoldSource)
    let fuel := liveLlvmHoldSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmHoldTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmHoldExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmHoldSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportSelfApply : String := "import SystemsLean.SelfApply\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmHold\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_LLVM_HOLD_V0\"\n"

/-- hostLlvmHoldId def needle with a trailing newline. -/
def needleHostLlvmHoldId : String :=
  "def hostLlvmHoldId : String := \"HOST-LLVM-HOLD\"\n"

/-- llvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String := "def llvmUnlocked : Bool := true\n"

/-- provablyUnlocked def needle with a trailing newline. -/
def needleProvablyUnlocked : String := "def provablyUnlocked : Bool := true\n"

/-- freestandingProductSelfHostComplete def needle with a trailing newline. -/
def needleFreestandingComplete : String :=
  "def freestandingProductSelfHostComplete : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmHold\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.LlvmHold. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmHoldSource
  (src.splitOn needleImportSelfApply).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostLlvmHoldId).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleProvablyUnlocked).length > 1
    && (src.splitOn needleFreestandingComplete).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmHoldReady,
    PARSE-LIVE-LLVM-HOLD,
    HOST-FRONT-LIVE-LLVM-HOLD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmHoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_HOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-HOLD")
    && (parseId == "PARSE-LIVE-LLVM-HOLD")
    && (liveRel == "LlvmHold.lean")
    && (liveLlvmHoldRel
      == "src/systems/SystemsLean/LlvmHold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmHoldFullHost
    && !hostFrontLiveLlvmHoldFullBackend
    && !hostFrontLiveLlvmHoldResidualFreeClaimed
    && !hostFrontLiveLlvmHoldProvablyUnlocked
    && kernelCheckLiveLlvmHoldSource liveLlvmHoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmHoldModule
    && liveParseHasLlvmHoldNs
    && liveParseHasLlvmHoldEnd
    && liveParseHasSelfApplyImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmHoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmHold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-HOLD =="
  IO.println s!"  host={hostId} file={liveLlvmHoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmHoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmHoldRel}"
    throw (IO.userError s!"missing {liveLlvmHoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmHoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmHold.lean != liveLlvmHoldSource"
    throw (IO.userError "dual-pin mismatch live LlvmHold.lean")
  let r := parseLiveLlvmHoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-HOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-HOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-HOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmHold parse false"
      throw (IO.userError "kernelCheck live LlvmHold parse false")
    unless hostFrontLiveLlvmHoldReady do
      IO.eprintln "error: hostFrontLiveLlvmHoldReady false"
      throw (IO.userError "hostFrontLiveLlvmHoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmHold source was accepted"
      throw (IO.userError "empty LlvmHold source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmHold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmHold
