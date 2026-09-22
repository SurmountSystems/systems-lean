/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitBodyScaffold.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitBodyScaffold.lean. It is not EmitBody.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 1. example count is 12.
  set_option count is 2.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  This wrap is not an LLVM backend. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-BODY-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_BODY_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-BODY-SCAFFOLD, EMIT-BODY-SCAFFOLD-THEOREM, liveRel,
  kernelCheckLiveEmitBodyScaffoldSource,
  hostFrontLiveEmitBodyScaffoldReady.
  Module: SystemsLean.HostFrontLiveEmitBodyScaffold
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitBodyScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitBodyScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_BODY_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-BODY-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-BODY-SCAFFOLD"

/-- Live file basename. -/
def liveRel : String := "EmitBodyScaffold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitBodyScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitBodyScaffoldFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveEmitBodyScaffoldFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitBodyScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveEmitBodyScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitBodyScaffoldParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveEmitBodyScaffoldSkipFuel : Nat := 16384

/-- Kept commands: zero imports, namespace, six pure string defs, and end.
    String defs that use ++ and bool defs that use && are not kept.
    From EmitBodyScaffold.lean. -/
def liveEmitBodyScaffoldKeptCmds : Nat := 8

/-- theorem keyword count. EmitBodyScaffold.lean has one theorem. -/
def liveEmitBodyScaffoldTheoremCount : Nat := 1

/-- example keyword count. EmitBodyScaffold.lean has twelve examples. -/
def liveEmitBodyScaffoldExampleCount : Nat := 12

/-- set_option keyword count. EmitBodyScaffold.lean has two set_option. -/
def liveEmitBodyScaffoldSetOptionCount : Nat := 2

/-- Dotted ident `SystemsLean . EmitBody`. -/
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
def cmdAddsEmitBodyScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitBodyScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitBodyScaffoldParseFuel body
        && termNoAppN liveEmitBodyScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitBodyScaffoldParseFuel body
        && termNoAppN liveEmitBodyScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdEmitBodyScaffold (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitBodyScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitBodyScaffold liveEmitBodyScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitBodyScaffoldSkipFuel rest
      if cmdBodyKnownEmitBodyScaffold kn c then
        parseCmdsEmitBodyScaffold n rest2
          (kn ++ cmdAddsEmitBodyScaffold c) (acc ++ [c])
      else
        parseCmdsEmitBodyScaffold n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitBodyScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitBodyScaffold n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live EmitBodyScaffold.lean text.
    Greppable: parseLiveEmitBodyScaffoldSource,
    PARSE-LIVE-EMIT-BODY-SCAFFOLD. -/
def parseLiveEmitBodyScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitBodyScaffold liveEmitBodyScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitBody"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitBodyScaffold parse. Not a fixture.
    Greppable: kernelCheckLiveEmitBodyScaffoldSource,
    PARSE-LIVE-EMIT-BODY-SCAFFOLD. -/
def kernelCheckLiveEmitBodyScaffoldSource (src : String) : Bool :=
  match parseLiveEmitBodyScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitBodyScaffoldParsed? : Option Module :=
  match parseLiveEmitBodyScaffoldSource liveEmitBodyScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitBodyScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, end, and kernel-checkable string defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitBodyScaffoldParsed? with
  | some m => m.commands.length == liveEmitBodyScaffoldKeptCmds
  | none => false

/-- Literal defs the kernel must keep: productStageId, hostEmitBodyId,
    selfHostEmitBodyId, bodySsotArtifactPath. -/
def liveParseHasLiteralDefs : Bool :=
  match liveEmitBodyScaffoldParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "productStageId"
      && has "hostEmitBodyId"
      && has "selfHostEmitBodyId"
      && has "bodySsotArtifactPath"

/-- Wrap module lastSeg is EmitBody (no module line in the live file). -/
def liveParseHasEmitBodyScaffoldModule : Bool :=
  match liveEmitBodyScaffoldParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitBody"
      && lastSeg m.name.raw == "EmitBody"

/-- Live parse has namespace SystemsLean.EmitBody. -/
def liveParseHasEmitBodyScaffoldNs : Bool :=
  match liveEmitBodyScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitBody"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitBody. -/
def liveParseHasEmitBodyScaffoldEnd : Bool :=
  match liveEmitBodyScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitBody"
      | _ => false

/-- Live parse has zero imports. -/
def liveParseHasNoImport : Bool :=
  match liveEmitBodyScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. Keyword counts only.
    The parse path stays on stripComments. -/
def stripCommentsEmitBodyScaffoldN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsEmitBodyScaffoldN n nest false false ('\n' :: acc) rest
        else
          stripCommentsEmitBodyScaffoldN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsEmitBodyScaffoldN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsEmitBodyScaffoldN n nest false false ('"' :: acc) rest
        else
          stripCommentsEmitBodyScaffoldN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsEmitBodyScaffoldN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsEmitBodyScaffoldN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsEmitBodyScaffoldN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsEmitBodyScaffoldN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsEmitBodyScaffoldN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsEmitBodyScaffoldN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsEmitBodyScaffoldN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsEmitBodyScaffoldN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for EmitBodyScaffold keyword counts. -/
def stripCommentsEmitBodyScaffold (src : String) : String :=
  String.ofList
    (stripCommentsEmitBodyScaffoldN (src.length + 8) 0 false false [] src.toList)

/-- Keyword counts: theorem 1, example 12, set_option 2.
    Uses stripCommentsEmitBodyScaffold, not stripComments. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitBodyScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsEmitBodyScaffold liveEmitBodyScaffoldSource)
    let fuel := liveEmitBodyScaffoldSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitBodyScaffoldTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitBodyScaffoldExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitBodyScaffoldSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitBody\n"

/-- productStageId def needle with a trailing newline. -/
def needleProductStageId : String :=
  "def productStageId : String := \"SLAKE_SELF_HOST_EMIT_BODY_V0\"\n"

/-- hostEmitBodyId def needle with a trailing newline. -/
def needleHostEmitBodyId : String :=
  "def hostEmitBodyId : String := \"HOST-EMIT-BODY\"\n"

/-- bodySsotArtifactPath def needle with a trailing newline. -/
def needleBodySsotArtifactPath : String :=
  "def bodySsotArtifactPath : String := \"src/systems/emit/host_emit_body_fragment.ssot.txt\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitBody\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import needle. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitBodyScaffoldSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleProductStageId).length > 1
    && (src.splitOn needleHostEmitBodyId).length > 1
    && (src.splitOn needleBodySsotArtifactPath).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitBodyScaffoldReady,
    PARSE-LIVE-EMIT-BODY-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-BODY-SCAFFOLD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitBodyScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_BODY_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-BODY-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-BODY-SCAFFOLD")
    && (liveRel == "EmitBodyScaffold.lean")
    && (liveEmitBodyScaffoldRel
      == "src/systems/SystemsLean/EmitBodyScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitBodyScaffoldFullHost
    && !hostFrontLiveEmitBodyScaffoldFullBackend
    && !hostFrontLiveEmitBodyScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitBodyScaffoldProvablyUnlocked
    && kernelCheckLiveEmitBodyScaffoldSource liveEmitBodyScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasEmitBodyScaffoldModule
    && liveParseHasEmitBodyScaffoldNs
    && liveParseHasEmitBodyScaffoldEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitBodyScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitBodyScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-BODY-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitBodyScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitBodyScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitBodyScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitBodyScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitBodyScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitBodyScaffold.lean != liveEmitBodyScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitBodyScaffold.lean")
  let r := parseLiveEmitBodyScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-BODY-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-BODY-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-BODY-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitBodyScaffold parse false"
      throw (IO.userError "kernelCheck live EmitBodyScaffold parse false")
    unless hostFrontLiveEmitBodyScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitBodyScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitBodyScaffoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitBodyScaffold source was accepted"
      throw (IO.userError "empty EmitBodyScaffold source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitBodyScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitBodyScaffold
