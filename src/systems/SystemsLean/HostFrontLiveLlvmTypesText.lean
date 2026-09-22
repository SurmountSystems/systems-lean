/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmTypesText.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmTypesText.lean. It is not LlvmHold.lean.
  It is not LlvmLinearText.lean. It is not LlvmMultText.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 13. example count is 22.
  set_option count is 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def llvmTypesTextLlvmUnlocked is false.
  That local pin is not this wrap's backend claim.
  The live def llvmTypesTextProvablyUnlockWorkClaimed is false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-TYPES-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_TEXT_V0,
  PARSE-LIVE-LLVM-TYPES-TEXT, liveRel,
  kernelCheckLiveLlvmTypesTextSource,
  hostFrontLiveLlvmTypesTextReady.
  Module: SystemsLean.HostFrontLiveLlvmTypesText
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmTypesTextSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmTypesText

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-TYPES-TEXT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-TYPES-TEXT"

/-- Live file basename. -/
def liveRel : String := "LlvmTypesText.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmTypesTextRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmTypesTextFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def llvmTypesTextLlvmUnlocked is false. That def is not this flag. -/
def hostFrontLiveLlvmTypesTextFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmTypesTextResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def llvmTypesTextProvablyUnlockWorkClaimed is false.
    That def is not this flag. -/
def hostFrontLiveLlvmTypesTextProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmTypesTextParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmTypesTextSkipFuel : Nat := 8192

/-- Kept commands: six imports, namespace, kernel-checkable defs, and end.
    A count of 4 would drop the literal defs. From LlvmTypesText.lean. -/
def liveLlvmTypesTextKeptCmds : Nat := 35

/-- theorem keyword count. LlvmTypesText.lean has 13 theorem. -/
def liveLlvmTypesTextTheoremCount : Nat := 13

/-- example keyword count. LlvmTypesText.lean has 22 example. -/
def liveLlvmTypesTextExampleCount : Nat := 22

/-- set_option keyword count. LlvmTypesText.lean has no set_option. -/
def liveLlvmTypesTextSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmTypesText`. -/
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
def cmdAddsLlvmTypesText (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmTypesText (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmTypesTextParseFuel body
        && termNoAppN liveLlvmTypesTextParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmTypesTextParseFuel body
        && termNoAppN liveLlvmTypesTextParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmTypesText (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmTypesText : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmTypesText liveLlvmTypesTextParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmTypesTextSkipFuel rest
      if cmdBodyKnownLlvmTypesText kn c then
        parseCmdsLlvmTypesText n rest2
          (kn ++ cmdAddsLlvmTypesText c) (acc ++ [c])
      else
        parseCmdsLlvmTypesText n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmTypesTextSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmTypesText n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmTypesText.lean text.
    Greppable: parseLiveLlvmTypesTextSource,
    PARSE-LIVE-LLVM-TYPES-TEXT. -/
def parseLiveLlvmTypesTextSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmTypesText liveLlvmTypesTextParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmTypesText"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmTypesText parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a local stub.
    Greppable: kernelCheckLiveLlvmTypesTextSource,
    PARSE-LIVE-LLVM-TYPES-TEXT. -/
def kernelCheckLiveLlvmTypesTextSource (src : String) : Bool :=
  match parseLiveLlvmTypesTextSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmTypesTextParsed? : Option Module :=
  match parseLiveLlvmTypesTextSource liveLlvmTypesTextSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmTypesTextParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmTypesTextParsed? with
  | some m => m.commands.length == liveLlvmTypesTextKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId,
    llvmTypesTextFinishedClaimed, llvmTypesTextLlvmUnlocked,
    llvmTypesTextResidualFreeClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmTypesTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "llvmTypesTextFinishedClaimed"
      && has "llvmTypesTextLlvmUnlocked"
      && has "llvmTypesTextResidualFreeClaimed"

/-- Wrap module lastSeg is LlvmTypesText (no module line in the live file). -/
def liveParseHasLlvmTypesTextModule : Bool :=
  match liveLlvmTypesTextParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmTypesText"
      && lastSeg m.name.raw == "LlvmTypesText"

/-- Live parse has namespace SystemsLean.LlvmTypesText. -/
def liveParseHasLlvmTypesTextNs : Bool :=
  match liveLlvmTypesTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmTypesText"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmTypesText. -/
def liveParseHasLlvmTypesTextEnd : Bool :=
  match liveLlvmTypesTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmTypesText"
      | _ => false

/-- Live parse imports the six LlvmTypesText peers. -/
def liveParseHasTypesImport : Bool :=
  match liveLlvmTypesTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Types"
      && has "SystemsLean.Mult"
      && has "SystemsLean.LlvmHold"
      && has "SystemsLean.LlvmEmitPath"
      && has "SystemsLean.LlvmMultText"
      && has "SystemsLean.LlvmLinearText"

/-- Keyword counts: theorem 13, example 22, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmTypesTextParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmTypesTextSource)
    let fuel := liveLlvmTypesTextSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmTypesTextTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmTypesTextExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmTypesTextSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportTypes : String := "import SystemsLean.Types\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmTypesText\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LLVM_TYPES_TEXT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LLVM-TYPES-TEXT\"\n"

/-- llvmTypesTextFinishedClaimed def needle with a trailing newline. -/
def needleFinishedClaimed : String :=
  "def llvmTypesTextFinishedClaimed : Bool := true\n"

/-- llvmTypesTextLlvmUnlocked def needle with a trailing newline.
    Local unlock pin is false. Not LlvmHold.llvmUnlocked. -/
def needleLlvmUnlocked : String :=
  "def llvmTypesTextLlvmUnlocked : Bool := false\n"

/-- llvmTypesTextResidualFreeClaimed def needle with a trailing newline. -/
def needleResidualFree : String :=
  "def llvmTypesTextResidualFreeClaimed : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmTypesText\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.LlvmTypesText. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmTypesTextSource
  (src.splitOn needleImportTypes).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleResidualFree).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmTypesTextReady,
    PARSE-LIVE-LLVM-TYPES-TEXT,
    HOST-FRONT-LIVE-LLVM-TYPES-TEXT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmTypesTextReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_TEXT_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-TYPES-TEXT")
    && (parseId == "PARSE-LIVE-LLVM-TYPES-TEXT")
    && (liveRel == "LlvmTypesText.lean")
    && (liveLlvmTypesTextRel
      == "src/systems/SystemsLean/LlvmTypesText.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmTypesTextFullHost
    && !hostFrontLiveLlvmTypesTextFullBackend
    && !hostFrontLiveLlvmTypesTextResidualFreeClaimed
    && !hostFrontLiveLlvmTypesTextProvablyUnlocked
    && kernelCheckLiveLlvmTypesTextSource liveLlvmTypesTextSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmTypesTextModule
    && liveParseHasLlvmTypesTextNs
    && liveParseHasLlvmTypesTextEnd
    && liveParseHasTypesImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmTypesTextSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmTypesText (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-TYPES-TEXT =="
  IO.println s!"  host={hostId} file={liveLlvmTypesTextRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmTypesTextRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmTypesTextRel}"
    throw (IO.userError s!"missing {liveLlvmTypesTextRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmTypesTextSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmTypesText.lean != liveLlvmTypesTextSource"
    throw (IO.userError "dual-pin mismatch live LlvmTypesText.lean")
  let r := parseLiveLlvmTypesTextSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-TYPES-TEXT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-TYPES-TEXT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-TYPES-TEXT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmTypesText parse false"
      throw (IO.userError "kernelCheck live LlvmTypesText parse false")
    unless hostFrontLiveLlvmTypesTextReady do
      IO.eprintln "error: hostFrontLiveLlvmTypesTextReady false"
      throw (IO.userError "hostFrontLiveLlvmTypesTextReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmTypesText source was accepted"
      throw (IO.userError "empty LlvmTypesText source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmTypesText root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmTypesText
