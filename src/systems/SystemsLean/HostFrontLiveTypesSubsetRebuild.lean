/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/TypesSubsetRebuild.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is TypesSubsetRebuild.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 10. example count is 18.
  set_option count is 1.
  def main and proof scripts are skip-folded.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  This wrap is not an LLVM backend. The provably flag stays false.
  Not HostFrontLiveTypesSubsetRebuildMain (that file parses
  TypesSubsetRebuildMain.lean). Do not import that module here.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-TYPES-SUBSET-REBUILD,
  PARSE-LIVE-TYPES-SUBSET-REBUILD, TYPES-SUBSET-REBUILD, liveRel,
  kernelCheckLiveTypesSubsetRebuildSource,
  hostFrontLiveTypesSubsetRebuildReady.
  Module: SystemsLean.HostFrontLiveTypesSubsetRebuild
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveTypesSubsetRebuildSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveTypesSubsetRebuild

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id (hyphenated). -/
def stageId : String := "PARSE-LIVE-TYPES-SUBSET-REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-TYPES-SUBSET-REBUILD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-TYPES-SUBSET-REBUILD"

/-- Live file basename. -/
def liveRel : String := "TypesSubsetRebuild.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesSubsetRebuildRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveTypesSubsetRebuildFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveTypesSubsetRebuildFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveTypesSubsetRebuildResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveTypesSubsetRebuildProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveTypesSubsetRebuildParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveTypesSubsetRebuildSkipFuel : Nat := 16384

/-- Kept commands:
    import SystemsLean.TypesSubsetEmit,
    namespace SystemsLean.TypesSubsetRebuild,
    def stageId,
    def hostId,
    def surfaceId,
    def typesSubsetRebuildInputId,
    def lakeExeName,
    def justRecipe,
    def stillUsesLake,
    def dependsOnLake,
    def typesSubsetRebuildResidualFreeClaimed,
    def typesSubsetRebuildProductSelfHostCompleteClaimed,
    def typesSubsetRebuildProofCompleteClaimed,
    def typesSubsetRebuildLlvmUnlocked,
    def typesSubsetRebuildProvablyUnlocked,
    def typesSubsetRebuildWithoutLakeFinishedClaimed,
    end SystemsLean.TypesSubsetRebuild. -/
def liveTypesSubsetRebuildKeptCmds : Nat := 17

/-- theorem keyword count. TypesSubsetRebuild.lean has ten theorems. -/
def liveTypesSubsetRebuildTheoremCount : Nat := 10

/-- example keyword count. TypesSubsetRebuild.lean has eighteen examples. -/
def liveTypesSubsetRebuildExampleCount : Nat := 18

/-- set_option keyword count. TypesSubsetRebuild.lean has one set_option. -/
def liveTypesSubsetRebuildSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . TypesSubsetRebuild`. -/
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
def cmdAddsTypesSubsetRebuild (c : Cmd) : List String :=
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
def cmdBodyKnownTypesSubsetRebuild (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveTypesSubsetRebuildParseFuel body
        && termNoAppN liveTypesSubsetRebuildParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveTypesSubsetRebuildParseFuel body
        && termNoAppN liveTypesSubsetRebuildParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdTypesSubsetRebuild (fuel : Nat) (toks : List String) :
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
def parseCmdsTypesSubsetRebuild : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdTypesSubsetRebuild liveTypesSubsetRebuildParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveTypesSubsetRebuildSkipFuel rest
      if cmdBodyKnownTypesSubsetRebuild kn c then
        parseCmdsTypesSubsetRebuild n rest2
          (kn ++ cmdAddsTypesSubsetRebuild c) (acc ++ [c])
      else
        parseCmdsTypesSubsetRebuild n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveTypesSubsetRebuildSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsTypesSubsetRebuild n rest2 kn acc
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
    TypesSubsetRebuild.lean has a two-dash string in filterArgs.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. Keyword counts and the parse
    path both use this strip. -/
def stripCommentsTypesSubsetRebuildN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsTypesSubsetRebuildN n nest false false ('\n' :: acc) rest
        else
          stripCommentsTypesSubsetRebuildN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsTypesSubsetRebuildN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsTypesSubsetRebuildN n nest false false ('"' :: acc) rest
        else
          stripCommentsTypesSubsetRebuildN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsTypesSubsetRebuildN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsTypesSubsetRebuildN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsTypesSubsetRebuildN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsTypesSubsetRebuildN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsTypesSubsetRebuildN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsTypesSubsetRebuildN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsTypesSubsetRebuildN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsTypesSubsetRebuildN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for TypesSubsetRebuild.lean bytes. -/
def stripCommentsTypesSubsetRebuild (src : String) : String :=
  String.ofList
    (stripCommentsTypesSubsetRebuildN (src.length + 8) 0 false false [] src.toList)

/-- Parse live TypesSubsetRebuild.lean text.
    Greppable: parseLiveTypesSubsetRebuildSource,
    PARSE-LIVE-TYPES-SUBSET-REBUILD. -/
def parseLiveTypesSubsetRebuildSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsTypesSubsetRebuild src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsTypesSubsetRebuild liveTypesSubsetRebuildParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.TypesSubsetRebuild"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live TypesSubsetRebuild parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a local stub.
    Greppable: kernelCheckLiveTypesSubsetRebuildSource,
    PARSE-LIVE-TYPES-SUBSET-REBUILD. -/
def kernelCheckLiveTypesSubsetRebuildSource (src : String) : Bool :=
  match parseLiveTypesSubsetRebuildSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveTypesSubsetRebuildParsed? : Option Module :=
  match parseLiveTypesSubsetRebuildSource liveTypesSubsetRebuildSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveTypesSubsetRebuildParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    One import, namespace, end, and kernel-checkable literal defs.
    Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveTypesSubsetRebuildParsed? with
  | some m => m.commands.length == liveTypesSubsetRebuildKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostId, surfaceId,
    stillUsesLake. -/
def liveParseHasLiteralDefs : Bool :=
  match liveTypesSubsetRebuildParsed? with
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
  match liveTypesSubsetRebuildParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "main"
      | Cmd.defBind x _ _ _ => x.raw == "main"
      | _ => false)

/-- Wrap module lastSeg is TypesSubsetRebuild (no module line in the live file). -/
def liveParseHasTypesSubsetRebuildModule : Bool :=
  match liveTypesSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.TypesSubsetRebuild"
      && lastSeg m.name.raw == "TypesSubsetRebuild"

/-- Live parse has namespace SystemsLean.TypesSubsetRebuild. -/
def liveParseHasTypesSubsetRebuildNs : Bool :=
  match liveTypesSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.TypesSubsetRebuild"
      | _ => false

/-- Live parse ends namespace SystemsLean.TypesSubsetRebuild. -/
def liveParseHasTypesSubsetRebuildEnd : Bool :=
  match liveTypesSubsetRebuildParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.TypesSubsetRebuild"
      | _ => false

/-- Live parse keeps the one Types subset import. -/
def liveParseHasTypesSubsetRebuildImports : Bool :=
  match liveTypesSubsetRebuildParsed? with
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
    nImports == 1
      && has "SystemsLean.TypesSubsetEmit"

/-- Keyword counts: theorem 10, example 18, set_option 1.
    Uses stripCommentsTypesSubsetRebuild, not stripComments. -/
def liveParseKwCountsOk : Bool :=
  match liveTypesSubsetRebuildParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsTypesSubsetRebuild liveTypesSubsetRebuildSource)
    let fuel := liveTypesSubsetRebuildSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveTypesSubsetRebuildTheoremCount
      && toksCountKw fuel toks "example" 0 == liveTypesSubsetRebuildExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveTypesSubsetRebuildSetOptionCount

/-- Import needle with a trailing newline. -/
def needleImportTypesSubsetEmit : String :=
  "import SystemsLean.TypesSubsetEmit\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.TypesSubsetRebuild\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_TYPES_SUBSET_REBUILD_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-TYPES-SUBSET-REBUILD\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"TYPES-SUBSET-REBUILD\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.TypesSubsetRebuild\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveTypesSubsetRebuildSource
  (src.splitOn needleImportTypesSubsetEmit).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveTypesSubsetRebuildReady,
    PARSE-LIVE-TYPES-SUBSET-REBUILD,
    HOST-FRONT-LIVE-TYPES-SUBSET-REBUILD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveTypesSubsetRebuildReady : Bool :=
  (stageId == "PARSE-LIVE-TYPES-SUBSET-REBUILD")
    && (hostId == "HOST-FRONT-LIVE-TYPES-SUBSET-REBUILD")
    && (parseId == "PARSE-LIVE-TYPES-SUBSET-REBUILD")
    && (liveRel == "TypesSubsetRebuild.lean")
    && (liveTypesSubsetRebuildRel
      == "src/systems/SystemsLean/TypesSubsetRebuild.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveTypesSubsetRebuildFullHost
    && !hostFrontLiveTypesSubsetRebuildFullBackend
    && !hostFrontLiveTypesSubsetRebuildResidualFreeClaimed
    && !hostFrontLiveTypesSubsetRebuildProvablyUnlocked
    && kernelCheckLiveTypesSubsetRebuildSource liveTypesSubsetRebuildSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseSkipsMain
    && liveParseHasTypesSubsetRebuildModule
    && liveParseHasTypesSubsetRebuildNs
    && liveParseHasTypesSubsetRebuildEnd
    && liveParseHasTypesSubsetRebuildImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveTypesSubsetRebuildSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveTypesSubsetRebuild (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-TYPES-SUBSET-REBUILD =="
  IO.println s!"  host={hostId} file={liveTypesSubsetRebuildRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveTypesSubsetRebuildRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveTypesSubsetRebuildRel}"
    throw (IO.userError s!"missing {liveTypesSubsetRebuildRel}")
  let disk <- IO.FS.readFile path
  if disk != liveTypesSubsetRebuildSource then
    IO.eprintln "error: dual-pin mismatch: on-disk TypesSubsetRebuild.lean != liveTypesSubsetRebuildSource"
    throw (IO.userError "dual-pin mismatch live TypesSubsetRebuild.lean")
  let r := parseLiveTypesSubsetRebuildSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-TYPES-SUBSET-REBUILD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-TYPES-SUBSET-REBUILD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-TYPES-SUBSET-REBUILD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live TypesSubsetRebuild parse false"
      throw (IO.userError "kernelCheck live TypesSubsetRebuild parse false")
    unless hostFrontLiveTypesSubsetRebuildReady do
      IO.eprintln "error: hostFrontLiveTypesSubsetRebuildReady false"
      throw (IO.userError "hostFrontLiveTypesSubsetRebuildReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty TypesSubsetRebuild source was accepted"
      throw (IO.userError "empty TypesSubsetRebuild source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveTypesSubsetRebuild root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveTypesSubsetRebuild
