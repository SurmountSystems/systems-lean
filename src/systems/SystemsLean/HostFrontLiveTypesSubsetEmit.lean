/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/TypesSubsetEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is TypesSubsetEmit.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 9. example count is 16.
  set_option count is 1.
  def main and proof scripts are skip-folded.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  This wrap is not an LLVM backend. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-TYPES-SUBSET-EMIT,
  SLAKE_HOST_FRONT_LIVE_TYPES_SUBSET_EMIT_V0,
  PARSE-LIVE-TYPES-SUBSET-EMIT, TYPES-SUBSET-EMIT-THEOREM, liveRel,
  kernelCheckLiveTypesSubsetEmitSource,
  hostFrontLiveTypesSubsetEmitReady.
  Module: SystemsLean.HostFrontLiveTypesSubsetEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveTypesSubsetEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveTypesSubsetEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_TYPES_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-TYPES-SUBSET-EMIT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-TYPES-SUBSET-EMIT"

/-- Live file basename. -/
def liveRel : String := "TypesSubsetEmit.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesSubsetEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveTypesSubsetEmitFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveTypesSubsetEmitFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveTypesSubsetEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveTypesSubsetEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveTypesSubsetEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveTypesSubsetEmitSkipFuel : Nat := 16384

/-- Kept commands: two imports, namespace, eight pure string defs,
    seven pure bool defs, and end.
    String defs that use ++ and bool defs that use && are not kept.
    def main, IO writers, and proof scripts are skip-folded.
    From TypesSubsetEmit.lean. -/
def liveTypesSubsetEmitKeptCmds : Nat := 19

/-- theorem keyword count. TypesSubsetEmit.lean has nine theorems. -/
def liveTypesSubsetEmitTheoremCount : Nat := 9

/-- example keyword count. TypesSubsetEmit.lean has sixteen examples. -/
def liveTypesSubsetEmitExampleCount : Nat := 16

/-- set_option keyword count. TypesSubsetEmit.lean has one set_option. -/
def liveTypesSubsetEmitSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . TypesSubsetEmit`. -/
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
def cmdAddsTypesSubsetEmit (c : Cmd) : List String :=
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
def cmdBodyKnownTypesSubsetEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveTypesSubsetEmitParseFuel body
        && termNoAppN liveTypesSubsetEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveTypesSubsetEmitParseFuel body
        && termNoAppN liveTypesSubsetEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdTypesSubsetEmit (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, open, and
    un-kernelable defs (including def main and proof scripts). -/
def parseCmdsTypesSubsetEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdTypesSubsetEmit liveTypesSubsetEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveTypesSubsetEmitSkipFuel rest
      if cmdBodyKnownTypesSubsetEmit kn c then
        parseCmdsTypesSubsetEmit n rest2
          (kn ++ cmdAddsTypesSubsetEmit c) (acc ++ [c])
      else
        parseCmdsTypesSubsetEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveTypesSubsetEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsTypesSubsetEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live TypesSubsetEmit.lean text.
    Greppable: parseLiveTypesSubsetEmitSource,
    PARSE-LIVE-TYPES-SUBSET-EMIT. -/
def parseLiveTypesSubsetEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsTypesSubsetEmit liveTypesSubsetEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.TypesSubsetEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live TypesSubsetEmit parse. Not a fixture.
    Greppable: kernelCheckLiveTypesSubsetEmitSource,
    PARSE-LIVE-TYPES-SUBSET-EMIT. -/
def kernelCheckLiveTypesSubsetEmitSource (src : String) : Bool :=
  match parseLiveTypesSubsetEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveTypesSubsetEmitParsed? : Option Module :=
  match parseLiveTypesSubsetEmitSource liveTypesSubsetEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveTypesSubsetEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Two imports, namespace, end, and kernel-checkable literal defs.
    Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveTypesSubsetEmitParsed? with
  | some m => m.commands.length == liveTypesSubsetEmitKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostId, surfaceId,
    stillUsesLake. -/
def liveParseHasLiteralDefs : Bool :=
  match liveTypesSubsetEmitParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "surfaceId"
      && has "stillUsesLake"

/-- def main is skip-folded. It is not a kept command. -/
def liveParseSkipsMain : Bool :=
  match liveTypesSubsetEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "main"
      | Cmd.defBind x _ _ _ => x.raw == "main"
      | _ => false)

/-- Wrap module lastSeg is TypesSubsetEmit (no module line in the live file). -/
def liveParseHasTypesSubsetEmitModule : Bool :=
  match liveTypesSubsetEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.TypesSubsetEmit"
      && lastSeg m.name.raw == "TypesSubsetEmit"

/-- Live parse has namespace SystemsLean.TypesSubsetEmit. -/
def liveParseHasTypesSubsetEmitNs : Bool :=
  match liveTypesSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.TypesSubsetEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.TypesSubsetEmit. -/
def liveParseHasTypesSubsetEmitEnd : Bool :=
  match liveTypesSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.TypesSubsetEmit"
      | _ => false

/-- Live parse keeps the two Types subset imports. -/
def liveParseHasTypesSubsetEmitImports : Bool :=
  match liveTypesSubsetEmitParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    let nImports :=
      (m.commands.filter fun c =>
        match c with
        | Cmd.importModule _ => true
        | _ => false).length
    nImports == 2
      && has "SystemsLean.CompilePathTypes"
      && has "SystemsLean.EmitTypes"

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. Keyword counts only.
    The parse path stays on stripComments. -/
def stripCommentsTypesSubsetEmitN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsTypesSubsetEmitN n nest false false ('\n' :: acc) rest
        else
          stripCommentsTypesSubsetEmitN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsTypesSubsetEmitN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsTypesSubsetEmitN n nest false false ('"' :: acc) rest
        else
          stripCommentsTypesSubsetEmitN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsTypesSubsetEmitN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsTypesSubsetEmitN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsTypesSubsetEmitN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsTypesSubsetEmitN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsTypesSubsetEmitN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsTypesSubsetEmitN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsTypesSubsetEmitN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsTypesSubsetEmitN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for TypesSubsetEmit keyword counts. -/
def stripCommentsTypesSubsetEmit (src : String) : String :=
  String.ofList
    (stripCommentsTypesSubsetEmitN (src.length + 8) 0 false false [] src.toList)

/-- Keyword counts: theorem 9, example 16, set_option 1.
    Uses stripCommentsTypesSubsetEmit, not stripComments. -/
def liveParseKwCountsOk : Bool :=
  match liveTypesSubsetEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsTypesSubsetEmit liveTypesSubsetEmitSource)
    let fuel := liveTypesSubsetEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveTypesSubsetEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveTypesSubsetEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveTypesSubsetEmitSetOptionCount

/-- Import needle with a trailing newline. -/
def needleImportCompilePathTypes : String :=
  "import SystemsLean.CompilePathTypes\n"

/-- Import needle with a trailing newline. -/
def needleImportEmitTypes : String := "import SystemsLean.EmitTypes\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.TypesSubsetEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"TYPES-SUBSET-EMIT\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.TypesSubsetEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveTypesSubsetEmitSource
  (src.splitOn needleImportCompilePathTypes).length > 1
    && (src.splitOn needleImportEmitTypes).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveTypesSubsetEmitReady,
    PARSE-LIVE-TYPES-SUBSET-EMIT,
    HOST-FRONT-LIVE-TYPES-SUBSET-EMIT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveTypesSubsetEmitReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_TYPES_SUBSET_EMIT_V0")
    && (hostId == "HOST-FRONT-LIVE-TYPES-SUBSET-EMIT")
    && (parseId == "PARSE-LIVE-TYPES-SUBSET-EMIT")
    && (liveRel == "TypesSubsetEmit.lean")
    && (liveTypesSubsetEmitRel
      == "src/systems/SystemsLean/TypesSubsetEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveTypesSubsetEmitFullHost
    && !hostFrontLiveTypesSubsetEmitFullBackend
    && !hostFrontLiveTypesSubsetEmitResidualFreeClaimed
    && !hostFrontLiveTypesSubsetEmitProvablyUnlocked
    && kernelCheckLiveTypesSubsetEmitSource liveTypesSubsetEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseSkipsMain
    && liveParseHasTypesSubsetEmitModule
    && liveParseHasTypesSubsetEmitNs
    && liveParseHasTypesSubsetEmitEnd
    && liveParseHasTypesSubsetEmitImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveTypesSubsetEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveTypesSubsetEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-TYPES-SUBSET-EMIT =="
  IO.println s!"  host={hostId} file={liveTypesSubsetEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveTypesSubsetEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveTypesSubsetEmitRel}"
    throw (IO.userError s!"missing {liveTypesSubsetEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveTypesSubsetEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk TypesSubsetEmit.lean != liveTypesSubsetEmitSource"
    throw (IO.userError "dual-pin mismatch live TypesSubsetEmit.lean")
  let r := parseLiveTypesSubsetEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-TYPES-SUBSET-EMIT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-TYPES-SUBSET-EMIT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-TYPES-SUBSET-EMIT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live TypesSubsetEmit parse false"
      throw (IO.userError "kernelCheck live TypesSubsetEmit parse false")
    unless hostFrontLiveTypesSubsetEmitReady do
      IO.eprintln "error: hostFrontLiveTypesSubsetEmitReady false"
      throw (IO.userError "hostFrontLiveTypesSubsetEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty TypesSubsetEmit source was accepted"
      throw (IO.userError "empty TypesSubsetEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveTypesSubsetEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveTypesSubsetEmit
