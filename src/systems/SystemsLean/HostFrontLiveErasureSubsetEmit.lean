/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ErasureSubsetEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ErasureSubsetEmit.lean.
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
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-ERASURE-SUBSET-EMIT,
  SLAKE_HOST_FRONT_LIVE_ERASURE_SUBSET_EMIT_V0,
  PARSE-LIVE-ERASURE-SUBSET-EMIT, ERASURE-SUBSET-EMIT-THEOREM, liveRel,
  kernelCheckLiveErasureSubsetEmitSource,
  hostFrontLiveErasureSubsetEmitReady.
  Module: SystemsLean.HostFrontLiveErasureSubsetEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveErasureSubsetEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveErasureSubsetEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_ERASURE_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-ERASURE-SUBSET-EMIT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-ERASURE-SUBSET-EMIT"

/-- Live file basename. -/
def liveRel : String := "ErasureSubsetEmit.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureSubsetEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveErasureSubsetEmitFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveErasureSubsetEmitFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveErasureSubsetEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveErasureSubsetEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveErasureSubsetEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveErasureSubsetEmitSkipFuel : Nat := 16384

/-- Kept commands: two imports, namespace, eight pure string defs,
    seven pure bool defs, and end.
    String defs that use ++ and bool defs that use && are not kept.
    def main, IO writers, and proof scripts are skip-folded.
    From ErasureSubsetEmit.lean. -/
def liveErasureSubsetEmitKeptCmds : Nat := 19

/-- theorem keyword count. ErasureSubsetEmit.lean has nine theorems. -/
def liveErasureSubsetEmitTheoremCount : Nat := 9

/-- example keyword count. ErasureSubsetEmit.lean has sixteen examples. -/
def liveErasureSubsetEmitExampleCount : Nat := 16

/-- set_option keyword count. ErasureSubsetEmit.lean has one set_option. -/
def liveErasureSubsetEmitSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . ErasureSubsetEmit`. -/
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
def cmdAddsErasureSubsetEmit (c : Cmd) : List String :=
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
def cmdBodyKnownErasureSubsetEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveErasureSubsetEmitParseFuel body
        && termNoAppN liveErasureSubsetEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveErasureSubsetEmitParseFuel body
        && termNoAppN liveErasureSubsetEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdErasureSubsetEmit (fuel : Nat) (toks : List String) :
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
def parseCmdsErasureSubsetEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdErasureSubsetEmit liveErasureSubsetEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveErasureSubsetEmitSkipFuel rest
      if cmdBodyKnownErasureSubsetEmit kn c then
        parseCmdsErasureSubsetEmit n rest2
          (kn ++ cmdAddsErasureSubsetEmit c) (acc ++ [c])
      else
        parseCmdsErasureSubsetEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveErasureSubsetEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsErasureSubsetEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ErasureSubsetEmit.lean text.
    Greppable: parseLiveErasureSubsetEmitSource,
    PARSE-LIVE-ERASURE-SUBSET-EMIT. -/
def parseLiveErasureSubsetEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsErasureSubsetEmit liveErasureSubsetEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ErasureSubsetEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ErasureSubsetEmit parse. Not a fixture.
    Greppable: kernelCheckLiveErasureSubsetEmitSource,
    PARSE-LIVE-ERASURE-SUBSET-EMIT. -/
def kernelCheckLiveErasureSubsetEmitSource (src : String) : Bool :=
  match parseLiveErasureSubsetEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveErasureSubsetEmitParsed? : Option Module :=
  match parseLiveErasureSubsetEmitSource liveErasureSubsetEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveErasureSubsetEmitParsed? with
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
  match liveErasureSubsetEmitParsed? with
  | some m => m.commands.length == liveErasureSubsetEmitKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostId, surfaceId,
    stillUsesLake. -/
def liveParseHasLiteralDefs : Bool :=
  match liveErasureSubsetEmitParsed? with
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
  match liveErasureSubsetEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "main"
      | Cmd.defBind x _ _ _ => x.raw == "main"
      | _ => false)

/-- Wrap module lastSeg is ErasureSubsetEmit (no module line in the live file). -/
def liveParseHasErasureSubsetEmitModule : Bool :=
  match liveErasureSubsetEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ErasureSubsetEmit"
      && lastSeg m.name.raw == "ErasureSubsetEmit"

/-- Live parse has namespace SystemsLean.ErasureSubsetEmit. -/
def liveParseHasErasureSubsetEmitNs : Bool :=
  match liveErasureSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ErasureSubsetEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.ErasureSubsetEmit. -/
def liveParseHasErasureSubsetEmitEnd : Bool :=
  match liveErasureSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ErasureSubsetEmit"
      | _ => false

/-- Live parse keeps the two Erasure subset imports. -/
def liveParseHasErasureSubsetEmitImports : Bool :=
  match liveErasureSubsetEmitParsed? with
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
      && has "SystemsLean.CompilePathErasure"
      && has "SystemsLean.EmitErasure"

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. Keyword counts only.
    The parse path stays on stripComments. -/
def stripCommentsErasureSubsetEmitN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsErasureSubsetEmitN n nest false false ('\n' :: acc) rest
        else
          stripCommentsErasureSubsetEmitN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsErasureSubsetEmitN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsErasureSubsetEmitN n nest false false ('"' :: acc) rest
        else
          stripCommentsErasureSubsetEmitN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsErasureSubsetEmitN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsErasureSubsetEmitN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsErasureSubsetEmitN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsErasureSubsetEmitN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsErasureSubsetEmitN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsErasureSubsetEmitN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsErasureSubsetEmitN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsErasureSubsetEmitN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for ErasureSubsetEmit keyword counts. -/
def stripCommentsErasureSubsetEmit (src : String) : String :=
  String.ofList
    (stripCommentsErasureSubsetEmitN (src.length + 8) 0 false false [] src.toList)

/-- Keyword counts: theorem 9, example 16, set_option 1.
    Uses stripCommentsErasureSubsetEmit, not stripComments. -/
def liveParseKwCountsOk : Bool :=
  match liveErasureSubsetEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsErasureSubsetEmit liveErasureSubsetEmitSource)
    let fuel := liveErasureSubsetEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveErasureSubsetEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveErasureSubsetEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveErasureSubsetEmitSetOptionCount

/-- Import needle with a trailing newline. -/
def needleImportCompilePathErasure : String :=
  "import SystemsLean.CompilePathErasure\n"

/-- Import needle with a trailing newline. -/
def needleImportEmitErasure : String := "import SystemsLean.EmitErasure\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ErasureSubsetEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"ERASURE-SUBSET-EMIT\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ErasureSubsetEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveErasureSubsetEmitSource
  (src.splitOn needleImportCompilePathErasure).length > 1
    && (src.splitOn needleImportEmitErasure).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveErasureSubsetEmitReady,
    PARSE-LIVE-ERASURE-SUBSET-EMIT,
    HOST-FRONT-LIVE-ERASURE-SUBSET-EMIT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveErasureSubsetEmitReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_ERASURE_SUBSET_EMIT_V0")
    && (hostId == "HOST-FRONT-LIVE-ERASURE-SUBSET-EMIT")
    && (parseId == "PARSE-LIVE-ERASURE-SUBSET-EMIT")
    && (liveRel == "ErasureSubsetEmit.lean")
    && (liveErasureSubsetEmitRel
      == "src/systems/SystemsLean/ErasureSubsetEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveErasureSubsetEmitFullHost
    && !hostFrontLiveErasureSubsetEmitFullBackend
    && !hostFrontLiveErasureSubsetEmitResidualFreeClaimed
    && !hostFrontLiveErasureSubsetEmitProvablyUnlocked
    && kernelCheckLiveErasureSubsetEmitSource liveErasureSubsetEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseSkipsMain
    && liveParseHasErasureSubsetEmitModule
    && liveParseHasErasureSubsetEmitNs
    && liveParseHasErasureSubsetEmitEnd
    && liveParseHasErasureSubsetEmitImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveErasureSubsetEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveErasureSubsetEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-ERASURE-SUBSET-EMIT =="
  IO.println s!"  host={hostId} file={liveErasureSubsetEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveErasureSubsetEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveErasureSubsetEmitRel}"
    throw (IO.userError s!"missing {liveErasureSubsetEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveErasureSubsetEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ErasureSubsetEmit.lean != liveErasureSubsetEmitSource"
    throw (IO.userError "dual-pin mismatch live ErasureSubsetEmit.lean")
  let r := parseLiveErasureSubsetEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-ERASURE-SUBSET-EMIT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-ERASURE-SUBSET-EMIT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-ERASURE-SUBSET-EMIT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ErasureSubsetEmit parse false"
      throw (IO.userError "kernelCheck live ErasureSubsetEmit parse false")
    unless hostFrontLiveErasureSubsetEmitReady do
      IO.eprintln "error: hostFrontLiveErasureSubsetEmitReady false"
      throw (IO.userError "hostFrontLiveErasureSubsetEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ErasureSubsetEmit source was accepted"
      throw (IO.userError "empty ErasureSubsetEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveErasureSubsetEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveErasureSubsetEmit
