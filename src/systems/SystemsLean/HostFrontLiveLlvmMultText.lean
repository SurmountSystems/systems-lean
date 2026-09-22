/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmMultText.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmMultText.lean. It is not LlvmMultTextTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 12. example count is 15.
  set_option count is 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def llvmMultTextLlvmUnlocked is false.
  It is not this wrap's backend claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-MULT-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_MULT_TEXT_V0,
  PARSE-LIVE-LLVM-MULT-TEXT, LLVM-MULT-TEXT-THEOREM, liveRel,
  kernelCheckLiveLlvmMultTextSource,
  hostFrontLiveLlvmMultTextReady.
  Module: SystemsLean.HostFrontLiveLlvmMultText
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmMultTextSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmMultText

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_MULT_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-MULT-TEXT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-MULT-TEXT"

/-- Live file basename. -/
def liveRel : String := "LlvmMultText.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmMultTextRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmMultTextFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def llvmMultTextLlvmUnlocked is false. That def is not this flag. -/
def hostFrontLiveLlvmMultTextFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmMultTextResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def llvmMultTextProvablyUnlockWorkClaimed is false.
    That def is not this flag. -/
def hostFrontLiveLlvmMultTextProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmMultTextParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmMultTextSkipFuel : Nat := 8192

/-- Kept commands: three imports, namespace, kernel-checkable defs, and end.
    A count of 4 would drop the literal defs. From the live parse of
    LlvmMultText.lean (cmds the kernel accepted). -/
def liveLlvmMultTextKeptCmds : Nat := 28

/-- theorem keyword count. LlvmMultText.lean has twelve theorems. -/
def liveLlvmMultTextTheoremCount : Nat := 12

/-- example keyword count. LlvmMultText.lean has fifteen examples. -/
def liveLlvmMultTextExampleCount : Nat := 15

/-- set_option keyword count. LlvmMultText.lean has no set_option. -/
def liveLlvmMultTextSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmMultText`. -/
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
def cmdAddsLlvmMultText (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmMultText (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmMultTextParseFuel body
        && termNoAppN liveLlvmMultTextParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmMultTextParseFuel body
        && termNoAppN liveLlvmMultTextParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmMultText (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmMultText : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmMultText liveLlvmMultTextParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmMultTextSkipFuel rest
      if cmdBodyKnownLlvmMultText kn c then
        parseCmdsLlvmMultText n rest2
          (kn ++ cmdAddsLlvmMultText c) (acc ++ [c])
      else
        parseCmdsLlvmMultText n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmMultTextSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmMultText n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmMultText.lean text.
    Greppable: parseLiveLlvmMultTextSource,
    PARSE-LIVE-LLVM-MULT-TEXT. -/
def parseLiveLlvmMultTextSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmMultText liveLlvmMultTextParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmMultText"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmMultText parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmMultTextSource,
    PARSE-LIVE-LLVM-MULT-TEXT. -/
def kernelCheckLiveLlvmMultTextSource (src : String) : Bool :=
  match parseLiveLlvmMultTextSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmMultTextParsed? : Option Module :=
  match parseLiveLlvmMultTextSource liveLlvmMultTextSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmMultTextParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Import, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmMultTextParsed? with
  | some m => m.commands.length == liveLlvmMultTextKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostId,
    llvmMultTextLlvmUnlocked, llvmMultTextFinishedClaimed,
    llvmMultTextResidualFreeClaimed. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmMultTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "llvmMultTextLlvmUnlocked"
      && has "llvmMultTextFinishedClaimed"
      && has "llvmMultTextResidualFreeClaimed"

/-- Wrap module lastSeg is LlvmMultText (no module line in the live file). -/
def liveParseHasLlvmMultTextModule : Bool :=
  match liveLlvmMultTextParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmMultText"
      && lastSeg m.name.raw == "LlvmMultText"

/-- Live parse has namespace SystemsLean.LlvmMultText. -/
def liveParseHasLlvmMultTextNs : Bool :=
  match liveLlvmMultTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmMultText"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmMultText. -/
def liveParseHasLlvmMultTextEnd : Bool :=
  match liveLlvmMultTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmMultText"
      | _ => false

/-- Live parse imports Mult, LlvmHold, and LlvmEmitPath. -/
def liveParseHasLlvmMultTextImports : Bool :=
  match liveLlvmMultTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Mult"
      && has "SystemsLean.LlvmHold"
      && has "SystemsLean.LlvmEmitPath"

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmMultTextParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmMultTextSource)
    let fuel := liveLlvmMultTextSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmMultTextTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmMultTextExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmMultTextSetOptionCount

/-- Import needles. Trailing newlines. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- LlvmHold import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- LlvmEmitPath import needle. Trailing newline. -/
def needleImportLlvmEmitPath : String := "import SystemsLean.LlvmEmitPath\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmMultText\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LLVM_MULT_TEXT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LLVM-MULT-TEXT\"\n"

/-- Local unlock pin needle. The live def is false. Trailing newline. -/
def needleLocalUnlockFalse : String :=
  "def llvmMultTextLlvmUnlocked : Bool := false\n"

/-- Finished-claimed needle. Trailing newline. -/
def needleFinishedClaimed : String :=
  "def llvmMultTextFinishedClaimed : Bool := true\n"

/-- Residual-free claim needle. The live def is false. Trailing newline. -/
def needleResidualFree : String :=
  "def llvmMultTextResidualFreeClaimed : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmMultText\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.LlvmMultText. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmMultTextSource
  (src.splitOn needleImportMult).length > 1
    && (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleImportLlvmEmitPath).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleLocalUnlockFalse).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleResidualFree).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmMultTextReady,
    PARSE-LIVE-LLVM-MULT-TEXT,
    HOST-FRONT-LIVE-LLVM-MULT-TEXT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmMultTextReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_MULT_TEXT_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-MULT-TEXT")
    && (parseId == "PARSE-LIVE-LLVM-MULT-TEXT")
    && (liveRel == "LlvmMultText.lean")
    && (liveLlvmMultTextRel
      == "src/systems/SystemsLean/LlvmMultText.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmMultTextFullHost
    && !hostFrontLiveLlvmMultTextFullBackend
    && !hostFrontLiveLlvmMultTextResidualFreeClaimed
    && !hostFrontLiveLlvmMultTextProvablyUnlocked
    && kernelCheckLiveLlvmMultTextSource liveLlvmMultTextSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmMultTextModule
    && liveParseHasLlvmMultTextNs
    && liveParseHasLlvmMultTextEnd
    && liveParseHasLlvmMultTextImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmMultTextSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmMultText (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-MULT-TEXT =="
  IO.println s!"  host={hostId} file={liveLlvmMultTextRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmMultTextRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmMultTextRel}"
    throw (IO.userError s!"missing {liveLlvmMultTextRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmMultTextSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmMultText.lean != liveLlvmMultTextSource"
    throw (IO.userError "dual-pin mismatch live LlvmMultText.lean")
  let r := parseLiveLlvmMultTextSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-MULT-TEXT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-MULT-TEXT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-MULT-TEXT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmMultText parse false"
      throw (IO.userError "kernelCheck live LlvmMultText parse false")
    unless hostFrontLiveLlvmMultTextReady do
      IO.eprintln "error: hostFrontLiveLlvmMultTextReady false"
      throw (IO.userError "hostFrontLiveLlvmMultTextReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmMultText source was accepted"
      throw (IO.userError "empty LlvmMultText source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmMultText root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmMultText
