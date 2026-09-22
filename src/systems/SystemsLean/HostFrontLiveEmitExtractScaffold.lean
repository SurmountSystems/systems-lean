/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitExtractScaffold.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitExtractScaffold.lean. It is not EmitExtract.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 1. example count is 12.
  set_option count is 2. Those commands are skipped.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live namespace is SystemsLean.EmitExtract. Not PROVABLY.
  The provably flag stays false.
  liveRel is defined in HostFrontLiveEmitExtractScaffoldSource.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-EXTRACT-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_EXTRACT_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD, liveRel,
  kernelCheckLiveEmitExtractScaffoldSource,
  hostFrontLiveEmitExtractScaffoldReady.
  Module: SystemsLean.HostFrontLiveEmitExtractScaffold
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitExtractScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitExtractScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_EXTRACT_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-EXTRACT-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is EmitExtractScaffold.lean in the Source module. -/
def liveEmitExtractScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitExtractScaffoldFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveEmitExtractScaffoldFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitExtractScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The live file says NOT PROVABLY. -/
def hostFrontLiveEmitExtractScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitExtractScaffoldParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveEmitExtractScaffoldSkipFuel : Nat := 8192

/-- Kept commands: namespace, six literal string defs, emitExtractSurfaceOk, and end.
    EmitExtractScaffold.lean has no import. Compound ++ defs are skipped.
    emitExtractOk is skipped because emitExtractReady is not kernel-known.
    A count of 4 would drop the literal defs. -/
def liveEmitExtractScaffoldKeptCmds : Nat := 9

/-- theorem keyword count. EmitExtractScaffold.lean has one theorem. -/
def liveEmitExtractScaffoldTheoremCount : Nat := 1

/-- example keyword count. EmitExtractScaffold.lean has twelve examples. -/
def liveEmitExtractScaffoldExampleCount : Nat := 12

/-- set_option keyword count. EmitExtractScaffold.lean has two set_option lines. -/
def liveEmitExtractScaffoldSetOptionCount : Nat := 2

/-- Strip comments. Keep dash-dash and block-open inside string payloads.
    EmitExtractScaffold C strings contain `--` and `{`. The shared strip is
    not in-string safe: a bare `{` makes skipUntilCmd jump over `end`.
    Five in-string dash-dash lines (an odd count) also hide set_option and
    six example keywords. A backslash keeps the next char inside a string. -/
def stripCommentsEmitExtractScaffoldN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsEmitExtractScaffoldN n nest false false
            ('\n' :: acc) rest
        else
          stripCommentsEmitExtractScaffoldN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsEmitExtractScaffoldN n nest false true
              (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsEmitExtractScaffoldN n nest false false ('"' :: acc) rest
        else
          stripCommentsEmitExtractScaffoldN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsEmitExtractScaffoldN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsEmitExtractScaffoldN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsEmitExtractScaffoldN n nest false false
            ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsEmitExtractScaffoldN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsEmitExtractScaffoldN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsEmitExtractScaffoldN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsEmitExtractScaffoldN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsEmitExtractScaffoldN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live EmitExtractScaffold.lean bytes. -/
def stripCommentsEmitExtractScaffold (src : String) : String :=
  String.ofList
    (stripCommentsEmitExtractScaffoldN (src.length + 8) 0 false false []
      src.toList)

/-- Dotted ident `SystemsLean . EmitExtract`. -/
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
def cmdAddsEmitExtractScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitExtractScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitExtractScaffoldParseFuel body
        && termNoAppN liveEmitExtractScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitExtractScaffoldParseFuel body
        && termNoAppN liveEmitExtractScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdEmitExtractScaffold (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitExtractScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitExtractScaffold liveEmitExtractScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitExtractScaffoldSkipFuel rest
      if cmdBodyKnownEmitExtractScaffold kn c then
        parseCmdsEmitExtractScaffold n rest2
          (kn ++ cmdAddsEmitExtractScaffold c) (acc ++ [c])
      else
        parseCmdsEmitExtractScaffold n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitExtractScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitExtractScaffold n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live EmitExtractScaffold.lean text.
    Greppable: parseLiveEmitExtractScaffoldSource,
    PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD. -/
def parseLiveEmitExtractScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsEmitExtractScaffold src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitExtractScaffold liveEmitExtractScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitExtract"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitExtractScaffold parse. Not a fixture.
    Greppable: kernelCheckLiveEmitExtractScaffoldSource,
    PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD. -/
def kernelCheckLiveEmitExtractScaffoldSource (src : String) : Bool :=
  match parseLiveEmitExtractScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitExtractScaffoldParsed? : Option Module :=
  match parseLiveEmitExtractScaffoldSource liveEmitExtractScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitExtractScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, six literal string defs, emitExtractSurfaceOk, and end.
    Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitExtractScaffoldParsed? with
  | some m => m.commands.length == liveEmitExtractScaffoldKeptCmds
  | none => false

/-- Literal defs the kernel must keep, plus emitExtractSurfaceOk. -/
def liveParseHasLiteralDefs : Bool :=
  match liveEmitExtractScaffoldParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostEmitExtractId"
      && has "selfHostEmitExtractId"
      && has "acceptancePath"
      && has "hostModulePath"
      && has "ssotArtifactPath"
      && has "emitExtractSurfaceOk"

/-- Wrap module name is the live namespace SystemsLean.EmitExtract.
    There is no module line. The live file is EmitExtractScaffold.lean. -/
def liveParseHasEmitExtractModule : Bool :=
  match liveEmitExtractScaffoldParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitExtract"
      && lastSeg m.name.raw == "EmitExtract"

/-- Live parse has namespace SystemsLean.EmitExtract. -/
def liveParseHasEmitExtractNs : Bool :=
  match liveEmitExtractScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitExtract"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitExtract. -/
def liveParseHasEmitExtractEnd : Bool :=
  match liveEmitExtractScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitExtract"
      | _ => false

/-- Live file has no import. EmitExtractScaffold.lean does not import. -/
def liveParseHasNoImport : Bool :=
  match liveEmitExtractScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem 1, example 12, set_option 2. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitExtractScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripCommentsEmitExtractScaffold liveEmitExtractScaffoldSource)
    let fuel := liveEmitExtractScaffoldSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitExtractScaffoldTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitExtractScaffoldExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitExtractScaffoldSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitExtract\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_EXTRACT_V0\"\n"

/-- hostEmitExtractId def needle with a trailing newline. -/
def needleHostEmitExtractId : String :=
  "def hostEmitExtractId : String := \"HOST-EMIT-EXTRACT\"\n"

/-- selfHostEmitExtractId def needle with a trailing newline. -/
def needleSelfHostEmitExtractId : String :=
  "def selfHostEmitExtractId : String := \"SELF-HOST-EMIT-EXTRACT\"\n"

/-- acceptancePath def needle with a trailing newline. -/
def needleAcceptancePath : String :=
  "def acceptancePath : String := \"src/systems/self-host.md\"\n"

/-- emitExtractOk def needle with a trailing newline. -/
def needleEmitExtractOk : String := "def emitExtractOk : Bool := emitExtractReady\n"

/-- Theorem needle with a trailing newline. The theorem is skip-folded. -/
def needleTheorem : String :=
  "theorem emitExtractReady_true : emitExtractReady = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitExtract\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import. theorem, example, and set_option are counted, not parsed. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitExtractScaffoldSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostEmitExtractId).length > 1
    && (src.splitOn needleSelfHostEmitExtractId).length > 1
    && (src.splitOn needleAcceptancePath).length > 1
    && (src.splitOn needleEmitExtractOk).length > 1
    && (src.splitOn needleTheorem).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitExtractScaffoldReady,
    PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-EXTRACT-SCAFFOLD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitExtractScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_EXTRACT_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-EXTRACT-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD")
    && (liveRel == "EmitExtractScaffold.lean")
    && (liveEmitExtractScaffoldRel
      == "src/systems/SystemsLean/EmitExtractScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitExtractScaffoldFullHost
    && !hostFrontLiveEmitExtractScaffoldFullBackend
    && !hostFrontLiveEmitExtractScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitExtractScaffoldProvablyUnlocked
    && kernelCheckLiveEmitExtractScaffoldSource liveEmitExtractScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasEmitExtractModule
    && liveParseHasEmitExtractNs
    && liveParseHasEmitExtractEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitExtractScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitExtractScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitExtractScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitExtractScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitExtractScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitExtractScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitExtractScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitExtractScaffold.lean != liveEmitExtractScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitExtractScaffold.lean")
  let r := parseLiveEmitExtractScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitExtractScaffold parse false"
      throw (IO.userError "kernelCheck live EmitExtractScaffold parse false")
    unless hostFrontLiveEmitExtractScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitExtractScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitExtractScaffoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitExtractScaffold source was accepted"
      throw (IO.userError "empty EmitExtractScaffold source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitExtractScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitExtractScaffold
