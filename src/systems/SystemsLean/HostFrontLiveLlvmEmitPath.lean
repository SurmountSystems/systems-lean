/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmEmitPath.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmEmitPath.lean. Theorems and examples in that file are
  skipped. It is not a separate LlvmEmitPathTheorems file.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 13. example count is 12.
  set_option count is 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def llvmEmitPathLlvmUnlocked is false.
  The live def llvmEmitPathFinishedClaimed is true.
  They are not this wrap's backend claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-EMIT-PATH,
  SLAKE_HOST_FRONT_LIVE_LLVM_EMIT_PATH_V0,
  PARSE-LIVE-LLVM-EMIT-PATH, LLVM-EMIT-PATH-THEOREM, liveRel,
  kernelCheckLiveLlvmEmitPathSource,
  hostFrontLiveLlvmEmitPathReady.
  Module: SystemsLean.HostFrontLiveLlvmEmitPath
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmEmitPathSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmEmitPath

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_EMIT_PATH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-EMIT-PATH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-EMIT-PATH"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is LlvmEmitPath.lean, defined in the Source module. -/
def liveLlvmEmitPathRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmEmitPathFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def llvmEmitPathLlvmUnlocked is false. That def is not this flag.
    The live def llvmEmitPathFinishedClaimed is true. That def is not this flag. -/
def hostFrontLiveLlvmEmitPathFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmEmitPathResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveLlvmEmitPathProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmEmitPathParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmEmitPathSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, kernel-checkable defs, and end.
    Skipped: theorem, example, and defs whose bodies name LlvmHold
    (llvmEmitPathDoesNotUnlockLlvm, llvmEmitPathReady).
    A count of 4 would drop the literal defs. From LlvmEmitPath.lean. -/
def liveLlvmEmitPathKeptCmds : Nat := 26

/-- theorem keyword count. LlvmEmitPath.lean has 13 theorem commands.
    They are skipped, not kernel-checked. -/
def liveLlvmEmitPathTheoremCount : Nat := 13

/-- example keyword count. LlvmEmitPath.lean has 12 example commands.
    They are skipped, not kernel-checked. -/
def liveLlvmEmitPathExampleCount : Nat := 12

/-- set_option keyword count. LlvmEmitPath.lean has no set_option. -/
def liveLlvmEmitPathSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmEmitPath`. -/
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
def cmdAddsLlvmEmitPath (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmEmitPath (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmEmitPathParseFuel body
        && termNoAppN liveLlvmEmitPathParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmEmitPathParseFuel body
        && termNoAppN liveLlvmEmitPathParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmEmitPath (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmEmitPath : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmEmitPath liveLlvmEmitPathParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmEmitPathSkipFuel rest
      if cmdBodyKnownLlvmEmitPath kn c then
        parseCmdsLlvmEmitPath n rest2
          (kn ++ cmdAddsLlvmEmitPath c) (acc ++ [c])
      else
        parseCmdsLlvmEmitPath n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmEmitPathSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmEmitPath n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmEmitPath.lean text.
    Greppable: parseLiveLlvmEmitPathSource,
    PARSE-LIVE-LLVM-EMIT-PATH. -/
def parseLiveLlvmEmitPathSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmEmitPath liveLlvmEmitPathParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmEmitPath"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmEmitPath parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmEmitPathSource,
    PARSE-LIVE-LLVM-EMIT-PATH. -/
def kernelCheckLiveLlvmEmitPathSource (src : String) : Bool :=
  match parseLiveLlvmEmitPathSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmEmitPathParsed? : Option Module :=
  match parseLiveLlvmEmitPathSource liveLlvmEmitPathSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmEmitPathParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Import, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmEmitPathParsed? with
  | some m => m.commands.length == liveLlvmEmitPathKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId,
    llvmEmitPathFinishedClaimed, llvmEmitPathLlvmUnlocked,
    llvmEmitPathResidualFreeClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmEmitPathParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "llvmEmitPathFinishedClaimed"
      && has "llvmEmitPathLlvmUnlocked"
      && has "llvmEmitPathResidualFreeClaimed"

/-- Wrap module lastSeg is LlvmEmitPath (no module line in the live file). -/
def liveParseHasLlvmEmitPathModule : Bool :=
  match liveLlvmEmitPathParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmEmitPath"
      && lastSeg m.name.raw == "LlvmEmitPath"

/-- Live parse has namespace SystemsLean.LlvmEmitPath. -/
def liveParseHasLlvmEmitPathNs : Bool :=
  match liveLlvmEmitPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmEmitPath"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmEmitPath. -/
def liveParseHasLlvmEmitPathEnd : Bool :=
  match liveLlvmEmitPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmEmitPath"
      | _ => false

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  match liveLlvmEmitPathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Keyword counts: theorem 13, example 12, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmEmitPathParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmEmitPathSource)
    let fuel := liveLlvmEmitPathSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmEmitPathTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmEmitPathExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmEmitPathSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmEmitPath\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LLVM_EMIT_PATH_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LLVM-EMIT-PATH\"\n"

/-- justRecipeLlvmEmitPath def needle with a trailing newline. -/
def needleJustRecipe : String :=
  "def justRecipeLlvmEmitPath : String := \"llvm-emit-path\"\n"

/-- llvmEmitPathFinishedClaimed def needle with a trailing newline. -/
def needleFinishedClaimed : String :=
  "def llvmEmitPathFinishedClaimed : Bool := true\n"

/-- llvmEmitPathLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def llvmEmitPathLlvmUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmEmitPath\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.LlvmEmitPath. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmEmitPathSource
  (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleJustRecipe).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmEmitPathReady,
    PARSE-LIVE-LLVM-EMIT-PATH,
    HOST-FRONT-LIVE-LLVM-EMIT-PATH.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmEmitPathReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_EMIT_PATH_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-EMIT-PATH")
    && (parseId == "PARSE-LIVE-LLVM-EMIT-PATH")
    && (liveRel == "LlvmEmitPath.lean")
    && (liveLlvmEmitPathRel
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmEmitPathFullHost
    && !hostFrontLiveLlvmEmitPathFullBackend
    && !hostFrontLiveLlvmEmitPathResidualFreeClaimed
    && !hostFrontLiveLlvmEmitPathProvablyUnlocked
    && kernelCheckLiveLlvmEmitPathSource liveLlvmEmitPathSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmEmitPathModule
    && liveParseHasLlvmEmitPathNs
    && liveParseHasLlvmEmitPathEnd
    && liveParseHasLlvmHoldImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmEmitPathSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmEmitPath (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-EMIT-PATH =="
  IO.println s!"  host={hostId} file={liveLlvmEmitPathRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmEmitPathRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmEmitPathRel}"
    throw (IO.userError s!"missing {liveLlvmEmitPathRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmEmitPathSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmEmitPath.lean != liveLlvmEmitPathSource"
    throw (IO.userError "dual-pin mismatch live LlvmEmitPath.lean")
  let r := parseLiveLlvmEmitPathSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-EMIT-PATH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-EMIT-PATH reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-EMIT-PATH ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmEmitPath parse false"
      throw (IO.userError "kernelCheck live LlvmEmitPath parse false")
    unless hostFrontLiveLlvmEmitPathReady do
      IO.eprintln "error: hostFrontLiveLlvmEmitPathReady false"
      IO.eprintln s!"  diag count={liveParseCmdCountOk} kw={liveParseKwCountsOk} needles={liveNeedlesOk} literals={liveParseHasLiteralDefs} mod={liveParseHasLlvmEmitPathModule} ns={liveParseHasLlvmEmitPathNs} endNs={liveParseHasLlvmEmitPathEnd} imp={liveParseHasLlvmHoldImport} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveLlvmEmitPathReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmEmitPath source was accepted"
      throw (IO.userError "empty LlvmEmitPath source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmEmitPath root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmEmitPath
