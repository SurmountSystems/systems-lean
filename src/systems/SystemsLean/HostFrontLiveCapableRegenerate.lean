/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableRegenerate.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is CapableRegenerate.lean. It is not CapableRegenerateTheorems.lean.
  It is not CapableRegenerateMain.lean.
  HostFrontLiveCapableRegenerateMain.lean already parses CapableRegenerateMain.lean.
  This module's main is the closed-check entry. Do not replace that file.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  This wrap is not an LLVM backend. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-REGENERATE,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_REGENERATE_V0,
  PARSE-LIVE-CAPABLE-REGENERATE, CAPABLE-REGENERATE-THEOREM, liveRel,
  kernelCheckLiveCapableRegenerateSource,
  hostFrontLiveCapableRegenerateReady.
  Module: SystemsLean.HostFrontLiveCapableRegenerate
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableRegenerateSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableRegenerate

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_REGENERATE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-REGENERATE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-REGENERATE"

/-- Live file basename. -/
def liveRel : String := "CapableRegenerate.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableRegenerateRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableRegenerateFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableRegenerateFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableRegenerateResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCapableRegenerateProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableRegenerateParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveCapableRegenerateSkipFuel : Nat := 16384

/-- Kept commands: four imports, namespace, ten string literals,
    seven Bool literals, and end.
    `&&` parses as Term.ite. App, IO, and equation defs are skip-folded.
    From CapableRegenerate.lean. -/
def liveCapableRegenerateKeptCmds : Nat := 23

/-- theorem keyword count. CapableRegenerate.lean has no theorem command.
    Theorem names in the header comment are stripped. -/
def liveCapableRegenerateTheoremCount : Nat := 0

/-- example keyword count. CapableRegenerate.lean has no example. -/
def liveCapableRegenerateExampleCount : Nat := 0

/-- set_option keyword count. CapableRegenerate.lean has no set_option. -/
def liveCapableRegenerateSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . CapableRegenerate`. -/
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
def cmdAddsCapableRegenerate (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app and Term.ite.
    `++` juxtaposition is Term.app. `&&` parses as Term.ite.
    Both are skip-folded. -/
def termNoAppN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ _, Term.ite _ _ _ => false
  | Nat.succ n, Term.some_ t => termNoAppN n t
  | Nat.succ n, Term.decideEq a b =>
      termNoAppN n a && termNoAppN n b
  | Nat.succ n, Term.proj o _ => termNoAppN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoAppN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, no Term.ite. -/
def cmdBodyKnownCapableRegenerate (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableRegenerateParseFuel body
        && termNoAppN liveCapableRegenerateParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableRegenerateParseFuel body
        && termNoAppN liveCapableRegenerateParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableRegenerate (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableRegenerate : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableRegenerate liveCapableRegenerateParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableRegenerateSkipFuel rest
      if cmdBodyKnownCapableRegenerate kn c then
        parseCmdsCapableRegenerate n rest2
          (kn ++ cmdAddsCapableRegenerate c) (acc ++ [c])
      else
        parseCmdsCapableRegenerate n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableRegenerateSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableRegenerate n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    CapableRegenerate.lean has dash-dash inside string literals.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. Parse and keyword counts use this. -/
def stripCommentsCapableRegenerateN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsCapableRegenerateN n nest false false ('\n' :: acc) rest
        else
          stripCommentsCapableRegenerateN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsCapableRegenerateN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsCapableRegenerateN n nest false false ('"' :: acc) rest
        else
          stripCommentsCapableRegenerateN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsCapableRegenerateN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsCapableRegenerateN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsCapableRegenerateN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsCapableRegenerateN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsCapableRegenerateN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsCapableRegenerateN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsCapableRegenerateN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsCapableRegenerateN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live CapableRegenerate.lean bytes. -/
def stripCommentsCapableRegenerate (src : String) : String :=
  String.ofList
    (stripCommentsCapableRegenerateN (src.length + 8) 0 false false [] src.toList)

/-- Parse live CapableRegenerate.lean text.
    Greppable: parseLiveCapableRegenerateSource,
    PARSE-LIVE-CAPABLE-REGENERATE. -/
def parseLiveCapableRegenerateSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsCapableRegenerate src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableRegenerate liveCapableRegenerateParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableRegenerate"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableRegenerate parse. Not a fixture.
    Greppable: kernelCheckLiveCapableRegenerateSource,
    PARSE-LIVE-CAPABLE-REGENERATE. -/
def kernelCheckLiveCapableRegenerateSource (src : String) : Bool :=
  match parseLiveCapableRegenerateSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableRegenerateParsed? : Option Module :=
  match parseLiveCapableRegenerateSource liveCapableRegenerateSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableRegenerateParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Four imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableRegenerateParsed? with
  | some m => m.commands.length == liveCapableRegenerateKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, lakeExeName,
    stillUsesLake, productPathFreestandingCapableStepContractFullSatisfied. -/
def liveParseHasLiteralDefs : Bool :=
  match liveCapableRegenerateParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "lakeExeName"
      && has "stillUsesLake"
      && has "productPathFreestandingCapableStepContractFullSatisfied"

/-- Wrap module lastSeg is CapableRegenerate (no module line in the live file). -/
def liveParseHasCapableRegenerateModule : Bool :=
  match liveCapableRegenerateParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableRegenerate"
      && lastSeg m.name.raw == "CapableRegenerate"

/-- Live parse has namespace SystemsLean.CapableRegenerate. -/
def liveParseHasCapableRegenerateNs : Bool :=
  match liveCapableRegenerateParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableRegenerate"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableRegenerate. -/
def liveParseHasCapableRegenerateEnd : Bool :=
  match liveCapableRegenerateParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableRegenerate"
      | _ => false

/-- Live parse imports CapableRead, CapableCompose, CapableWriteHc, InstallOut. -/
def liveParseHasCapableRegenerateImports : Bool :=
  match liveCapableRegenerateParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.CapableRead"
      && has "SystemsLean.CapableCompose"
      && has "SystemsLean.CapableWriteHc"
      && has "SystemsLean.InstallOut"

/-- Keyword counts: theorem, example, and set_option are 0.
    Uses stripCommentsCapableRegenerate, not stripComments. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableRegenerateParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripCommentsCapableRegenerate liveCapableRegenerateSource)
    let fuel := liveCapableRegenerateSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableRegenerateTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableRegenerateExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableRegenerateSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCapableRead : String := "import SystemsLean.CapableRead\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableRegenerate\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String := "def stageId : String :=\n"

/-- lakeExeName def needle with a trailing newline. -/
def needleLakeExeName : String :=
  "def lakeExeName : String := \"slake-freestanding-capable-regenerate\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- Full step-contract def needle with a trailing newline. -/
def needleStepContractFull : String :=
  "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableRegenerate\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableRegenerateSource
  (src.splitOn needleImportCapableRead).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleLakeExeName).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleStepContractFull).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableRegenerateReady,
    PARSE-LIVE-CAPABLE-REGENERATE,
    HOST-FRONT-LIVE-CAPABLE-REGENERATE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableRegenerateReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_REGENERATE_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-REGENERATE")
    && (parseId == "PARSE-LIVE-CAPABLE-REGENERATE")
    && (liveRel == "CapableRegenerate.lean")
    && (liveCapableRegenerateRel
      == "src/systems/SystemsLean/CapableRegenerate.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableRegenerateFullHost
    && !hostFrontLiveCapableRegenerateFullBackend
    && !hostFrontLiveCapableRegenerateResidualFreeClaimed
    && !hostFrontLiveCapableRegenerateProvablyUnlocked
    && kernelCheckLiveCapableRegenerateSource liveCapableRegenerateSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasCapableRegenerateModule
    && liveParseHasCapableRegenerateNs
    && liveParseHasCapableRegenerateEnd
    && liveParseHasCapableRegenerateImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableRegenerateSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableRegenerate (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-REGENERATE =="
  IO.println s!"  host={hostId} file={liveCapableRegenerateRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableRegenerateRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableRegenerateRel}"
    throw (IO.userError s!"missing {liveCapableRegenerateRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableRegenerateSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableRegenerate.lean != liveCapableRegenerateSource"
    throw (IO.userError "dual-pin mismatch live CapableRegenerate.lean")
  let r := parseLiveCapableRegenerateSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-REGENERATE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-REGENERATE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-REGENERATE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableRegenerate parse false"
      throw (IO.userError "kernelCheck live CapableRegenerate parse false")
    unless hostFrontLiveCapableRegenerateReady do
      IO.eprintln "error: hostFrontLiveCapableRegenerateReady false"
      throw (IO.userError "hostFrontLiveCapableRegenerateReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableRegenerate source was accepted"
      throw (IO.userError "empty CapableRegenerate source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableRegenerate root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableRegenerate
