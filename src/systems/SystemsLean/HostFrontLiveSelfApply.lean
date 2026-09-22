/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SelfApply.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is SelfApply.lean. It is not SelfApplyTheorems.lean.
  It is not SelfApplyFsClose.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SELF-APPLY,
  SLAKE_HOST_FRONT_LIVE_SELF_APPLY_V0,
  PARSE-LIVE-SELF-APPLY, SELF-APPLY-THEOREM, liveRel,
  kernelCheckLiveSelfApplySource,
  hostFrontLiveSelfApplyReady.
  Module: SystemsLean.HostFrontLiveSelfApply
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSelfApplySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSelfApply

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SELF_APPLY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SELF-APPLY"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SELF-APPLY"

/-- Live file basename. -/
def liveRel : String := "SelfApply.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfApplyRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSelfApplyFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveSelfApplyFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSelfApplyResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveSelfApplyProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSelfApplyParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSelfApplySkipFuel : Nat := 8192

/-- Kept commands: five imports, namespace, ten string defs,
    selfApplySurfaceOk, and end. Dotted cross-module bodies are skipped.
    From SelfApply.lean. -/
def liveSelfApplyKeptCmds : Nat := 18

/-- theorem keyword count. SelfApply.lean has no theorem. -/
def liveSelfApplyTheoremCount : Nat := 0

/-- example keyword count. SelfApply.lean has no example. -/
def liveSelfApplyExampleCount : Nat := 0

/-- set_option keyword count. SelfApply.lean has no set_option. -/
def liveSelfApplySetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . SelfApply`. -/
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
def cmdAddsSelfApply (c : Cmd) : List String :=
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
def cmdBodyKnownSelfApply (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfApplyParseFuel body
        && termNoAppN liveSelfApplyParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfApplyParseFuel body
        && termNoAppN liveSelfApplyParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdSelfApply (fuel : Nat) (toks : List String) :
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
def parseCmdsSelfApply : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSelfApply liveSelfApplyParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSelfApplySkipFuel rest
      if cmdBodyKnownSelfApply kn c then
        parseCmdsSelfApply n rest2
          (kn ++ cmdAddsSelfApply c) (acc ++ [c])
      else
        parseCmdsSelfApply n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSelfApplySkipFuel rest
          if rest2.length < toks.length then
            parseCmdsSelfApply n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live SelfApply.lean text.
    Greppable: parseLiveSelfApplySource,
    PARSE-LIVE-SELF-APPLY. -/
def parseLiveSelfApplySource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSelfApply liveSelfApplyParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SelfApply"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SelfApply parse. Not a fixture.
    Greppable: kernelCheckLiveSelfApplySource,
    PARSE-LIVE-SELF-APPLY. -/
def kernelCheckLiveSelfApplySource (src : String) : Bool :=
  match parseLiveSelfApplySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSelfApplyParsed? : Option Module :=
  match parseLiveSelfApplySource liveSelfApplySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSelfApplyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Five imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveSelfApplyParsed? with
  | some m => m.commands.length == liveSelfApplyKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostSelfApplyId,
    selfHostSelfApplyId, acceptancePath, and selfApplySurfaceOk. -/
def liveParseHasLiteralDefs : Bool :=
  match liveSelfApplyParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostSelfApplyId"
      && has "selfHostSelfApplyId"
      && has "acceptancePath"
      && has "selfApplySurfaceOk"

/-- Wrap module lastSeg is SelfApply (no module line in the live file). -/
def liveParseHasSelfApplyModule : Bool :=
  match liveSelfApplyParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.SelfApply"
      && lastSeg m.name.raw == "SelfApply"

/-- Live parse has namespace SystemsLean.SelfApply. -/
def liveParseHasSelfApplyNs : Bool :=
  match liveSelfApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.SelfApply"
      | _ => false

/-- Live parse ends namespace SystemsLean.SelfApply. -/
def liveParseHasSelfApplyEnd : Bool :=
  match liveSelfApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.SelfApply"
      | _ => false

/-- Live parse imports the five SelfApply dependencies. -/
def liveParseHasImports : Bool :=
  match liveSelfApplyParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.ParityMult"
      && has "SystemsLean.KernelLinear"
      && has "SystemsLean.KernelTypes"
      && has "SystemsLean.KernelProgram"
      && has "SystemsLean.KernelEmit"

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveSelfApplyParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveSelfApplySource)
    let fuel := liveSelfApplySkipFuel
    toksCountKw fuel toks "theorem" 0 == liveSelfApplyTheoremCount
      && toksCountKw fuel toks "example" 0 == liveSelfApplyExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveSelfApplySetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportParityMult : String := "import SystemsLean.ParityMult\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelLinear : String := "import SystemsLean.KernelLinear\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelTypes : String := "import SystemsLean.KernelTypes\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelProgram : String := "import SystemsLean.KernelProgram\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelEmit : String := "import SystemsLean.KernelEmit\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.SelfApply\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_SELF_APPLY_V0\"\n"

/-- hostSelfApplyId def needle with a trailing newline. -/
def needleHostSelfApplyId : String :=
  "def hostSelfApplyId : String := \"HOST-SELF-APPLY\"\n"

/-- selfHostSelfApplyId def needle with a trailing newline. -/
def needleSelfHostSelfApplyId : String :=
  "def selfHostSelfApplyId : String := \"SELF-HOST-SELF-APPLY\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.SelfApply\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveSelfApplySource
  (src.splitOn needleImportParityMult).length > 1
    && (src.splitOn needleImportKernelLinear).length > 1
    && (src.splitOn needleImportKernelTypes).length > 1
    && (src.splitOn needleImportKernelProgram).length > 1
    && (src.splitOn needleImportKernelEmit).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostSelfApplyId).length > 1
    && (src.splitOn needleSelfHostSelfApplyId).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSelfApplyReady,
    PARSE-LIVE-SELF-APPLY,
    HOST-FRONT-LIVE-SELF-APPLY.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveSelfApplyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SELF_APPLY_V0")
    && (hostId == "HOST-FRONT-LIVE-SELF-APPLY")
    && (parseId == "PARSE-LIVE-SELF-APPLY")
    && (liveRel == "SelfApply.lean")
    && (liveSelfApplyRel
      == "src/systems/SystemsLean/SelfApply.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSelfApplyFullHost
    && !hostFrontLiveSelfApplyFullBackend
    && !hostFrontLiveSelfApplyResidualFreeClaimed
    && !hostFrontLiveSelfApplyProvablyUnlocked
    && kernelCheckLiveSelfApplySource liveSelfApplySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasSelfApplyModule
    && liveParseHasSelfApplyNs
    && liveParseHasSelfApplyEnd
    && liveParseHasImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSelfApplySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveSelfApply (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SELF-APPLY =="
  IO.println s!"  host={hostId} file={liveSelfApplyRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveSelfApplyRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSelfApplyRel}"
    throw (IO.userError s!"missing {liveSelfApplyRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSelfApplySource then
    IO.eprintln "error: dual-pin mismatch: on-disk SelfApply.lean != liveSelfApplySource"
    throw (IO.userError "dual-pin mismatch live SelfApply.lean")
  let r := parseLiveSelfApplySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SELF-APPLY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SELF-APPLY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SELF-APPLY ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SelfApply parse false"
      throw (IO.userError "kernelCheck live SelfApply parse false")
    unless hostFrontLiveSelfApplyReady do
      IO.eprintln s!"error: hostFrontLiveSelfApplyReady false countOk={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} mod={liveParseHasSelfApplyModule} ns={liveParseHasSelfApplyNs} endOk={liveParseHasSelfApplyEnd} imports={liveParseHasImports} kw={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveSelfApplyReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty SelfApply source was accepted"
      throw (IO.userError "empty SelfApply source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSelfApply root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSelfApply
