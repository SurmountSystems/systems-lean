/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmComposeText.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmComposeText.lean. It is not LlvmComposeTextTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 12. example count is 27.
  set_option count is 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def llvmComposeTextLlvmUnlocked is false.
  It is not this wrap's backend claim. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-COMPOSE-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_TEXT_V0,
  PARSE-LIVE-LLVM-COMPOSE-TEXT, LLVM-COMPOSE-TEXT-THEOREM, liveRel,
  kernelCheckLiveLlvmComposeTextSource,
  hostFrontLiveLlvmComposeTextReady.
  Module: SystemsLean.HostFrontLiveLlvmComposeText
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmComposeTextSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmComposeText

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-COMPOSE-TEXT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-COMPOSE-TEXT"

/-- Live file basename. -/
def liveRel : String := "LlvmComposeText.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmComposeTextRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmComposeTextFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def llvmComposeTextLlvmUnlocked is false. That def is not this flag. -/
def hostFrontLiveLlvmComposeTextFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmComposeTextResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live module does not claim provably unlock work. That is not this flag. -/
def hostFrontLiveLlvmComposeTextProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). LlvmComposeText.lean has more commands than LlvmHold.lean. -/
def liveLlvmComposeTextParseFuel : Nat := 1024

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmComposeTextSkipFuel : Nat := 65536

/-- Kept commands: imports, namespace, kernel-checkable literal defs, and end.
    A count of 4 would drop the literal defs. From LlvmComposeText.lean. -/
def liveLlvmComposeTextKeptCmds : Nat := 49

/-- theorem keyword count. LlvmComposeText.lean has 12 theorem commands. -/
def liveLlvmComposeTextTheoremCount : Nat := 12

/-- example keyword count. LlvmComposeText.lean has 27 example commands. -/
def liveLlvmComposeTextExampleCount : Nat := 27

/-- set_option keyword count. LlvmComposeText.lean has no set_option. -/
def liveLlvmComposeTextSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmComposeText`. -/
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
def cmdAddsLlvmComposeText (c : Cmd) : List String :=
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

/-- Atom bodies the kernel can type. Compound && / ++ / ! bodies skip. -/
def termIsKernelAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- Body is a kernel atom, kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownLlvmComposeText (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmComposeTextParseFuel body
        && termNoAppN liveLlvmComposeTextParseFuel body
  | Cmd.defBind _ _ _ body =>
      termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmComposeTextParseFuel body
        && termNoAppN liveLlvmComposeTextParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmComposeText (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmComposeText : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmComposeText liveLlvmComposeTextParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmComposeTextSkipFuel rest
      if cmdBodyKnownLlvmComposeText kn c then
        parseCmdsLlvmComposeText n rest2
          (kn ++ cmdAddsLlvmComposeText c) (acc ++ [c])
      else
        parseCmdsLlvmComposeText n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t || t == "open" then
          let rest2 := skipUntilCmd liveLlvmComposeTextSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmComposeText n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmComposeText.lean text.
    Greppable: parseLiveLlvmComposeTextSource,
    PARSE-LIVE-LLVM-COMPOSE-TEXT. -/
def parseLiveLlvmComposeTextSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmComposeText liveLlvmComposeTextParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmComposeText"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmComposeText parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmComposeTextSource,
    PARSE-LIVE-LLVM-COMPOSE-TEXT. -/
def kernelCheckLiveLlvmComposeTextSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmComposeTextParsed? : Option Module :=
  match parseLiveLlvmComposeTextSource liveLlvmComposeTextSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmComposeTextParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmComposeTextParsed? with
  | some m => m.commands.length == liveLlvmComposeTextKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostId,
    llvmComposeTextFinishedClaimed, llvmComposeTextLlvmUnlocked. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmComposeTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "llvmComposeTextFinishedClaimed"
      && has "llvmComposeTextLlvmUnlocked"

/-- Wrap module lastSeg is LlvmComposeText (no module line in the live file). -/
def liveParseHasLlvmComposeTextModule : Bool :=
  match liveLlvmComposeTextParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmComposeText"
      && lastSeg m.name.raw == "LlvmComposeText"

/-- Live parse has namespace SystemsLean.LlvmComposeText. -/
def liveParseHasLlvmComposeTextNs : Bool :=
  match liveLlvmComposeTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmComposeText"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmComposeText. -/
def liveParseHasLlvmComposeTextEnd : Bool :=
  match liveLlvmComposeTextParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmComposeText"
      | _ => false

/-- Live parse keeps the LlvmComposeText imports. -/
def liveParseHasComposeImports : Bool :=
  match liveLlvmComposeTextParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.HostCompose"
      && has "SystemsLean.IrProgram"
      && has "SystemsLean.IrGraph"
      && has "SystemsLean.LlvmHold"
      && has "SystemsLean.LlvmEmitPath"
      && has "SystemsLean.LlvmMultText"
      && has "SystemsLean.LlvmLinearText"
      && has "SystemsLean.LlvmTypesText"
      && has "SystemsLean.LlvmProgramText"
      && has "SystemsLean.LlvmGraphText"

/-- Keyword counts: theorem 12, example 27, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmComposeTextParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmComposeTextSource)
    let fuel := liveLlvmComposeTextSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmComposeTextTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmComposeTextExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmComposeTextSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportHostCompose : String := "import SystemsLean.HostCompose\n"

/-- Second import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmComposeText\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LLVM_COMPOSE_TEXT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LLVM-COMPOSE-TEXT\"\n"

/-- llvmComposeTextFinishedClaimed def needle with a trailing newline. -/
def needleFinishedClaimed : String :=
  "def llvmComposeTextFinishedClaimed : Bool := true\n"

/-- llvmComposeTextLlvmUnlocked def needle with a trailing newline. -/
def needleLocalUnlock : String :=
  "def llvmComposeTextLlvmUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmComposeText\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmComposeTextSource
  (src.splitOn needleImportHostCompose).length > 1
    && (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleLocalUnlock).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmComposeTextReady,
    PARSE-LIVE-LLVM-COMPOSE-TEXT,
    HOST-FRONT-LIVE-LLVM-COMPOSE-TEXT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmComposeTextReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_TEXT_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-COMPOSE-TEXT")
    && (parseId == "PARSE-LIVE-LLVM-COMPOSE-TEXT")
    && (liveRel == "LlvmComposeText.lean")
    && (liveLlvmComposeTextRel
      == "src/systems/SystemsLean/LlvmComposeText.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmComposeTextFullHost
    && !hostFrontLiveLlvmComposeTextFullBackend
    && !hostFrontLiveLlvmComposeTextResidualFreeClaimed
    && !hostFrontLiveLlvmComposeTextProvablyUnlocked
    && kernelCheckLiveLlvmComposeTextSource liveLlvmComposeTextSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmComposeTextModule
    && liveParseHasLlvmComposeTextNs
    && liveParseHasLlvmComposeTextEnd
    && liveParseHasComposeImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmComposeTextSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmComposeText (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-COMPOSE-TEXT =="
  IO.println s!"  host={hostId} file={liveLlvmComposeTextRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmComposeTextRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmComposeTextRel}"
    throw (IO.userError s!"missing {liveLlvmComposeTextRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmComposeTextSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmComposeText.lean != liveLlvmComposeTextSource"
    throw (IO.userError "dual-pin mismatch live LlvmComposeText.lean")
  let r := parseLiveLlvmComposeTextSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-COMPOSE-TEXT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-COMPOSE-TEXT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-COMPOSE-TEXT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmComposeText parse false"
      throw (IO.userError "kernelCheck live LlvmComposeText parse false")
    unless hostFrontLiveLlvmComposeTextReady do
      IO.eprintln "error: hostFrontLiveLlvmComposeTextReady false"
      IO.eprintln s!"diag kernel={kernelCheckLiveLlvmComposeTextSource liveLlvmComposeTextSource}"
      IO.eprintln s!"diag noCheck={liveParseHasNoCheckCmd} countOk={liveParseCmdCountOk} lits={liveParseHasLiteralDefs}"
      IO.eprintln s!"diag mod={liveParseHasLlvmComposeTextModule} ns={liveParseHasLlvmComposeTextNs} endNs={liveParseHasLlvmComposeTextEnd}"
      IO.eprintln s!"diag imports={liveParseHasComposeImports} kw={liveParseKwCountsOk} needles={liveNeedlesOk}"
      IO.eprintln s!"diag cmds={m.commands.length}"
      throw (IO.userError "hostFrontLiveLlvmComposeTextReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmComposeText source was accepted"
      throw (IO.userError "empty LlvmComposeText source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmComposeText root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmComposeText
