/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitLinearScaffold.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitLinearScaffold.lean. It is not a theorems file.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 0. example count is 14.
  set_option count is 2. The live file has no import.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-LINEAR-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_LINEAR_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-LINEAR-SCAFFOLD, liveRel,
  kernelCheckLiveEmitLinearScaffoldSource,
  hostFrontLiveEmitLinearScaffoldReady.
  Module: SystemsLean.HostFrontLiveEmitLinearScaffold
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitLinearScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitLinearScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_LINEAR_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-LINEAR-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-LINEAR-SCAFFOLD"

/-- Live file basename. -/
def liveRel : String := "EmitLinearScaffold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitLinearScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitLinearScaffoldFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveEmitLinearScaffoldFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitLinearScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveEmitLinearScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitLinearScaffoldParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveEmitLinearScaffoldSkipFuel : Nat := 8192

/-- Kept commands: namespace, six literal defs, and end.
    No import. A count of 8. From EmitLinearScaffold.lean. -/
def liveEmitLinearScaffoldKeptCmds : Nat := 8

/-- theorem keyword count. EmitLinearScaffold.lean has no theorem. -/
def liveEmitLinearScaffoldTheoremCount : Nat := 0

/-- example keyword count. EmitLinearScaffold.lean has 14 examples. -/
def liveEmitLinearScaffoldExampleCount : Nat := 14

/-- set_option keyword count. EmitLinearScaffold.lean has 2 set_option lines. -/
def liveEmitLinearScaffoldSetOptionCount : Nat := 2

/-- Strip comments. Keep dash-dash and block-open inside string payloads.
    EmitLinearScaffold C strings contain `--` and `{`. The shared strip is
    not in-string safe: a bare `{` makes skipUntilCmd jump over `end`.
    A backslash keeps the next char inside a string. -/
def stripCommentsEmitLinearScaffoldN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsEmitLinearScaffoldN n nest false false
            ('\n' :: acc) rest
        else
          stripCommentsEmitLinearScaffoldN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsEmitLinearScaffoldN n nest false true
              (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsEmitLinearScaffoldN n nest false false ('"' :: acc) rest
        else
          stripCommentsEmitLinearScaffoldN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsEmitLinearScaffoldN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsEmitLinearScaffoldN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsEmitLinearScaffoldN n nest false false
            ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsEmitLinearScaffoldN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsEmitLinearScaffoldN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsEmitLinearScaffoldN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsEmitLinearScaffoldN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsEmitLinearScaffoldN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live EmitLinearScaffold.lean bytes. -/
def stripCommentsEmitLinearScaffold (src : String) : String :=
  String.ofList
    (stripCommentsEmitLinearScaffoldN (src.length + 8) 0 false false []
      src.toList)

/-- Dotted ident `SystemsLean . EmitLinear`. -/
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
def cmdAddsEmitLinearScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitLinearScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitLinearScaffoldParseFuel body
        && termNoAppN liveEmitLinearScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitLinearScaffoldParseFuel body
        && termNoAppN liveEmitLinearScaffoldParseFuel body
  | _ => true

/-- Typed assign whose body is one atom. A compound body (`&&`, string
    `++`, or a paren that does not end the def) returns none. The caller
    then skipUntilCmd, which stops on `end`. parseTermHt keeps applying
    and can take the `end` token. -/
def parseDefEmitLinearScaffold (fuel : Nat) (dname : String)
    (rest : List String) : Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match kind with
        | DefBodyKind.equation => none
        | DefBodyKind.assign =>
          match parseHostTypeAllHt tyToks with
          | none => none
          | some retTy =>
            let ty := addBinderArrows bs retTy
            let bnames := bs.map (fun p => p.fst)
            let dn := HostTerm.n dname
            match parseAtomHt liveHostTermParseFuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              match rest4 with
              | [] =>
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, [])
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, [])
              | t :: _ =>
                if isCmdKw t then
                  let rest5 :=
                    skipNonCmd liveEmitLinearScaffoldSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdEmitLinearScaffold (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefEmitLinearScaffold fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsEmitLinearScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitLinearScaffold liveEmitLinearScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitLinearScaffoldSkipFuel rest
      if cmdBodyKnownEmitLinearScaffold kn c then
        parseCmdsEmitLinearScaffold n rest2
          (kn ++ cmdAddsEmitLinearScaffold c) (acc ++ [c])
      else
        parseCmdsEmitLinearScaffold n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitLinearScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitLinearScaffold n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live EmitLinearScaffold.lean text.
    Greppable: parseLiveEmitLinearScaffoldSource,
    PARSE-LIVE-EMIT-LINEAR-SCAFFOLD. -/
def parseLiveEmitLinearScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsEmitLinearScaffold src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitLinearScaffold liveEmitLinearScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitLinear"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitLinearScaffold parse. Not a fixture.
    Greppable: kernelCheckLiveEmitLinearScaffoldSource,
    PARSE-LIVE-EMIT-LINEAR-SCAFFOLD. -/
def kernelCheckLiveEmitLinearScaffoldSource (src : String) : Bool :=
  match parseLiveEmitLinearScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitLinearScaffoldParsed? : Option Module :=
  match parseLiveEmitLinearScaffoldSource liveEmitLinearScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitLinearScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Namespace, six literal defs, and end.
    No import. Count is 8. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitLinearScaffoldParsed? with
  | some m => m.commands.length == liveEmitLinearScaffoldKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostEmitLinearId,
    selfHostEmitLinearId, acceptancePath, hostModulePath, ssotArtifactPath. -/
def liveParseHasLiteralDefs : Bool :=
  match liveEmitLinearScaffoldParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostEmitLinearId"
      && has "selfHostEmitLinearId"
      && has "acceptancePath"
      && has "hostModulePath"
      && has "ssotArtifactPath"

/-- Wrap module lastSeg is EmitLinear (no module line in the live file). -/
def liveParseHasEmitLinearScaffoldModule : Bool :=
  match liveEmitLinearScaffoldParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitLinear"
      && lastSeg m.name.raw == "EmitLinear"

/-- Live parse has namespace SystemsLean.EmitLinear. -/
def liveParseHasEmitLinearScaffoldNs : Bool :=
  match liveEmitLinearScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitLinear"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitLinear. -/
def liveParseHasEmitLinearScaffoldEnd : Bool :=
  match liveEmitLinearScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitLinear"
      | _ => false

/-- Live parse has no import. EmitLinearScaffold.lean has no import line. -/
def liveParseHasNoImport : Bool :=
  match liveEmitLinearScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem 0, example 14, set_option 2. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitLinearScaffoldParsed? with
  | none => false
  | some _ =>
    let toks :=
      tokenizeHostTerm (stripCommentsEmitLinearScaffold liveEmitLinearScaffoldSource)
    let fuel := liveEmitLinearScaffoldSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitLinearScaffoldTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitLinearScaffoldExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitLinearScaffoldSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitLinear\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_LINEAR_V0\"\n"

/-- hostEmitLinearId def needle with a trailing newline. -/
def needleHostEmitLinearId : String :=
  "def hostEmitLinearId : String := \"HOST-EMIT-LINEAR\"\n"

/-- selfHostEmitLinearId def needle with a trailing newline. -/
def needleSelfHostEmitLinearId : String :=
  "def selfHostEmitLinearId : String := \"SELF-HOST-EMIT-LINEAR\"\n"

/-- acceptancePath def needle with a trailing newline. -/
def needleAcceptancePath : String :=
  "def acceptancePath : String := \"src/systems/self-host.md\"\n"

/-- hostModulePath def needle with a trailing newline. -/
def needleHostModulePath : String :=
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitLinear.lean\"\n"

/-- ssotArtifactPath def needle with a trailing newline. -/
def needleSsotArtifactPath : String :=
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_linear.ssot.txt\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitLinear\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import needle. The live file has no import line. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitLinearScaffoldSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostEmitLinearId).length > 1
    && (src.splitOn needleSelfHostEmitLinearId).length > 1
    && (src.splitOn needleAcceptancePath).length > 1
    && (src.splitOn needleHostModulePath).length > 1
    && (src.splitOn needleSsotArtifactPath).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitLinearScaffoldReady,
    PARSE-LIVE-EMIT-LINEAR-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-LINEAR-SCAFFOLD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitLinearScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_LINEAR_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-LINEAR-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-LINEAR-SCAFFOLD")
    && (liveRel == "EmitLinearScaffold.lean")
    && (liveEmitLinearScaffoldRel
      == "src/systems/SystemsLean/EmitLinearScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitLinearScaffoldFullHost
    && !hostFrontLiveEmitLinearScaffoldFullBackend
    && !hostFrontLiveEmitLinearScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitLinearScaffoldProvablyUnlocked
    && kernelCheckLiveEmitLinearScaffoldSource liveEmitLinearScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasEmitLinearScaffoldModule
    && liveParseHasEmitLinearScaffoldNs
    && liveParseHasEmitLinearScaffoldEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitLinearScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitLinearScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-LINEAR-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitLinearScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitLinearScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitLinearScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitLinearScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitLinearScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitLinearScaffold.lean != liveEmitLinearScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitLinearScaffold.lean")
  let r := parseLiveEmitLinearScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-LINEAR-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-LINEAR-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-LINEAR-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} literalDefs={liveParseHasLiteralDefs} module={liveParseHasEmitLinearScaffoldModule} namespace={liveParseHasEmitLinearScaffoldNs} end={liveParseHasEmitLinearScaffoldEnd} noImport={liveParseHasNoImport} kwCounts={liveParseKwCountsOk} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitLinearScaffold parse false"
      throw (IO.userError "kernelCheck live EmitLinearScaffold parse false")
    unless hostFrontLiveEmitLinearScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitLinearScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitLinearScaffoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitLinearScaffold source was accepted"
      throw (IO.userError "empty EmitLinearScaffold source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitLinearScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitLinearScaffold
