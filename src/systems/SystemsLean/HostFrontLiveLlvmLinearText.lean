/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmLinearText.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmLinearText.lean. It is not Linear.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 12. example count is 18.
  set_option count is 0.
  Not an LLVM backend. Not a full LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def llvmLinearTextLlvmUnlocked is false.
  That def is not this wrap's backend claim.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-LINEAR-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_LINEAR_TEXT_V0,
  PARSE-LIVE-LLVM-LINEAR-TEXT, LLVM-LINEAR-TEXT, liveRel,
  kernelCheckLiveLlvmLinearTextSource,
  hostFrontLiveLlvmLinearTextReady.
  Module: SystemsLean.HostFrontLiveLlvmLinearText
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmLinearTextSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmLinearText

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_LINEAR_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-LINEAR-TEXT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-LINEAR-TEXT"

/-- Live file basename. -/
def liveRel : String := "LlvmLinearText.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmLinearTextRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmLinearTextFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def llvmLinearTextLlvmUnlocked is false. That def is not
    this flag. -/
def hostFrontLiveLlvmLinearTextFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmLinearTextResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveLlvmLinearTextProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmLinearTextParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmLinearTextSkipFuel : Nat := 8192

/-- Kept commands: four imports, namespace, kernel-checkable defs, and end.
    From LlvmLinearText.lean. Not a count of 4. -/
def liveLlvmLinearTextKeptCmds : Nat := 30

/-- theorem keyword count. LlvmLinearText.lean has 12 theorems. -/
def liveLlvmLinearTextTheoremCount : Nat := 12

/-- example keyword count. LlvmLinearText.lean has 18 examples. -/
def liveLlvmLinearTextExampleCount : Nat := 18

/-- set_option keyword count. LlvmLinearText.lean has no set_option. -/
def liveLlvmLinearTextSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmLinearText`. -/
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
def cmdAddsLlvmLinearText (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmLinearText (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmLinearTextParseFuel body
        && termNoAppN liveLlvmLinearTextParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmLinearTextParseFuel body
        && termNoAppN liveLlvmLinearTextParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmLinearText (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmLinearText : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmLinearText liveLlvmLinearTextParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmLinearTextSkipFuel rest
      if cmdBodyKnownLlvmLinearText kn c then
        parseCmdsLlvmLinearText n rest2
          (kn ++ cmdAddsLlvmLinearText c) (acc ++ [c])
      else
        parseCmdsLlvmLinearText n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmLinearTextSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmLinearText n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmLinearText.lean text.
    Greppable: parseLiveLlvmLinearTextSource,
    PARSE-LIVE-LLVM-LINEAR-TEXT. -/
def parseLiveLlvmLinearTextSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmLinearText liveLlvmLinearTextParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmLinearText"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmLinearText parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmLinearTextSource,
    PARSE-LIVE-LLVM-LINEAR-TEXT. -/
def kernelCheckLiveLlvmLinearTextSource (src : String) : Bool :=
  match parseLiveLlvmLinearTextSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmLinearTextParsed? : Option Module :=
  match parseLiveLlvmLinearTextSource liveLlvmLinearTextSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmLinearTextParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmLinearTextParsed? with
  | some m => m.commands.length == liveLlvmLinearTextKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostId,
    llvmLinearTextFinishedClaimed, llvmLinearTextLlvmUnlocked. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmLinearTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "llvmLinearTextFinishedClaimed"
      && has "llvmLinearTextLlvmUnlocked"

/-- Wrap module lastSeg is LlvmLinearText (no module line in the live file). -/
def liveParseHasLlvmLinearTextModule : Bool :=
  match liveLlvmLinearTextParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmLinearText"
      && lastSeg m.name.raw == "LlvmLinearText"

/-- Live parse has namespace SystemsLean.LlvmLinearText. -/
def liveParseHasLlvmLinearTextNs : Bool :=
  match liveLlvmLinearTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmLinearText"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmLinearText. -/
def liveParseHasLlvmLinearTextEnd : Bool :=
  match liveLlvmLinearTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmLinearText"
      | _ => false

/-- Live parse imports the four live modules. -/
def liveParseHasTextImports : Bool :=
  match liveLlvmLinearTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Linear"
      && has "SystemsLean.LlvmHold"
      && has "SystemsLean.LlvmEmitPath"
      && has "SystemsLean.LlvmMultText"

/-- Keyword counts: theorem 12, example 18, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmLinearTextParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmLinearTextSource)
    let fuel := liveLlvmLinearTextSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmLinearTextTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmLinearTextExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmLinearTextSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportLinear : String := "import SystemsLean.Linear\n"

/-- Import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Import needle. Trailing newline. -/
def needleImportLlvmEmitPath : String := "import SystemsLean.LlvmEmitPath\n"

/-- Import needle. Trailing newline. -/
def needleImportLlvmMultText : String := "import SystemsLean.LlvmMultText\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmLinearText\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LLVM_LINEAR_TEXT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LLVM-LINEAR-TEXT\"\n"

/-- finished-claimed def needle with a trailing newline. -/
def needleFinishedClaimed : String :=
  "def llvmLinearTextFinishedClaimed : Bool := true\n"

/-- local unlock def needle with a trailing newline. -/
def needleLocalUnlock : String :=
  "def llvmLinearTextLlvmUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmLinearText\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.LlvmLinearText. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmLinearTextSource
  (src.splitOn needleImportLinear).length > 1
    && (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleImportLlvmEmitPath).length > 1
    && (src.splitOn needleImportLlvmMultText).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleLocalUnlock).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmLinearTextReady,
    PARSE-LIVE-LLVM-LINEAR-TEXT,
    HOST-FRONT-LIVE-LLVM-LINEAR-TEXT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmLinearTextReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_LINEAR_TEXT_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-LINEAR-TEXT")
    && (parseId == "PARSE-LIVE-LLVM-LINEAR-TEXT")
    && (liveRel == "LlvmLinearText.lean")
    && (liveLlvmLinearTextRel
      == "src/systems/SystemsLean/LlvmLinearText.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmLinearTextFullHost
    && !hostFrontLiveLlvmLinearTextFullBackend
    && !hostFrontLiveLlvmLinearTextResidualFreeClaimed
    && !hostFrontLiveLlvmLinearTextProvablyUnlocked
    && kernelCheckLiveLlvmLinearTextSource liveLlvmLinearTextSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmLinearTextModule
    && liveParseHasLlvmLinearTextNs
    && liveParseHasLlvmLinearTextEnd
    && liveParseHasTextImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmLinearTextSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmLinearText (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-LINEAR-TEXT =="
  IO.println s!"  host={hostId} file={liveLlvmLinearTextRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmLinearTextRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmLinearTextRel}"
    throw (IO.userError s!"missing {liveLlvmLinearTextRel}")
  let disk <- IO.FS.readFile path
  IO.println s!"bytes={disk.length}"
  IO.println s!"FullHost={hostFrontLiveLlvmLinearTextFullHost} FullBackend={hostFrontLiveLlvmLinearTextFullBackend}"
  if disk != liveLlvmLinearTextSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmLinearText.lean != liveLlvmLinearTextSource"
    throw (IO.userError "dual-pin mismatch live LlvmLinearText.lean")
  let r := parseLiveLlvmLinearTextSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-LINEAR-TEXT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-LINEAR-TEXT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-LINEAR-TEXT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmLinearText parse false"
      throw (IO.userError "kernelCheck live LlvmLinearText parse false")
    unless hostFrontLiveLlvmLinearTextReady do
      IO.eprintln s!"error: hostFrontLiveLlvmLinearTextReady false cmdsOk={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} mod={liveParseHasLlvmLinearTextModule} ns={liveParseHasLlvmLinearTextNs} endNs={liveParseHasLlvmLinearTextEnd} imports={liveParseHasTextImports} kw={liveParseKwCountsOk} needles={liveNeedlesOk}"
      throw (IO.userError "hostFrontLiveLlvmLinearTextReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmLinearText source was accepted"
      throw (IO.userError "empty LlvmLinearText source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmLinearText root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmLinearText
