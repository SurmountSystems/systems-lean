/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/MultFsWriteTool.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is MultFsWriteTool.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 5. example count is 14.
  set_option count is 1.
  def main and proof scripts are skip-folded.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  This wrap is not an LLVM backend. The provably flag stays false.
  Not HostFrontLiveMultFsWriteToolMain (that file parses
  MultFsWriteToolMain.lean). Do not import that module here.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-MULT-FS-WRITE-TOOL,
  PARSE-LIVE-MULT-FS-WRITE-TOOL, MULT-FS-WRITE-TOOL, liveRel,
  kernelCheckLiveMultFsWriteToolSource,
  hostFrontLiveMultFsWriteToolReady.
  Module: SystemsLean.HostFrontLiveMultFsWriteTool
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveMultFsWriteToolSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMultFsWriteTool

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id (hyphenated). -/
def stageId : String := "PARSE-LIVE-MULT-FS-WRITE-TOOL"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-MULT-FS-WRITE-TOOL"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT-FS-WRITE-TOOL"

/-- Live file basename. -/
def liveRel : String := "MultFsWriteTool.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultFsWriteToolRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultFsWriteToolFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveMultFsWriteToolFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultFsWriteToolResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveMultFsWriteToolProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveMultFsWriteToolParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveMultFsWriteToolSkipFuel : Nat := 16384

/-- Kept commands:
    import SystemsLean.MultSubsetEmit,
    namespace SystemsLean.MultFsWriteTool,
    def stageId,
    def hostId,
    def surfaceId,
    def freestandingWriteToolCRel,
    def freestandingWriteToolBinRel,
    def lakeExeWriteTool,
    def justRecipeWriteTool,
    def stillUsesLake,
    def dependsOnLake,
    def multFsWriteToolResidualFreeClaimed,
    def multFsWriteToolProductSelfHostCompleteClaimed,
    def multFsWriteToolProofCompleteClaimed,
    def multFsWriteToolLlvmUnlocked,
    def multFsWriteToolProvablyUnlocked,
    def multFsWriteToolNativeIo,
    def multFsWriteToolPrintsFullHelperC,
    end SystemsLean.MultFsWriteTool.
    Skipped: open, freestandingWriteToolNotLakeBuilt, multFsWriteToolReady,
    multFsWriteToolCSource, multFsWriteToolEmit, filterArgs, def main,
    set_option, theorem, example. -/
def liveMultFsWriteToolKeptCmds : Nat := 19

/-- theorem keyword count. MultFsWriteTool.lean has five theorems. -/
def liveMultFsWriteToolTheoremCount : Nat := 5

/-- example keyword count. MultFsWriteTool.lean has fourteen examples. -/
def liveMultFsWriteToolExampleCount : Nat := 14

/-- set_option keyword count. MultFsWriteTool.lean has one set_option. -/
def liveMultFsWriteToolSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . MultFsWriteTool`. -/
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
def cmdAddsMultFsWriteTool (c : Cmd) : List String :=
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
def cmdBodyKnownMultFsWriteTool (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultFsWriteToolParseFuel body
        && termNoAppN liveMultFsWriteToolParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultFsWriteToolParseFuel body
        && termNoAppN liveMultFsWriteToolParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdMultFsWriteTool (fuel : Nat) (toks : List String) :
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
def parseCmdsMultFsWriteTool : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdMultFsWriteTool liveMultFsWriteToolParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveMultFsWriteToolSkipFuel rest
      if cmdBodyKnownMultFsWriteTool kn c then
        parseCmdsMultFsWriteTool n rest2
          (kn ++ cmdAddsMultFsWriteTool c) (acc ++ [c])
      else
        parseCmdsMultFsWriteTool n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveMultFsWriteToolSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsMultFsWriteTool n rest2 kn acc
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
    MultFsWriteTool.lean has a two-dash string in filterArgs.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. Keyword counts and the parse
    path both use this strip. -/
def stripCommentsMultFsWriteToolN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsMultFsWriteToolN n nest false false ('\n' :: acc) rest
        else
          stripCommentsMultFsWriteToolN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsMultFsWriteToolN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsMultFsWriteToolN n nest false false ('"' :: acc) rest
        else
          stripCommentsMultFsWriteToolN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsMultFsWriteToolN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsMultFsWriteToolN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsMultFsWriteToolN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsMultFsWriteToolN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsMultFsWriteToolN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsMultFsWriteToolN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsMultFsWriteToolN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsMultFsWriteToolN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for MultFsWriteTool.lean bytes. -/
def stripCommentsMultFsWriteTool (src : String) : String :=
  String.ofList
    (stripCommentsMultFsWriteToolN (src.length + 8) 0 false false [] src.toList)

/-- Parse live MultFsWriteTool.lean text.
    Greppable: parseLiveMultFsWriteToolSource,
    PARSE-LIVE-MULT-FS-WRITE-TOOL. -/
def parseLiveMultFsWriteToolSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsMultFsWriteTool src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMultFsWriteTool liveMultFsWriteToolParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.MultFsWriteTool"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live MultFsWriteTool parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a local stub.
    Greppable: kernelCheckLiveMultFsWriteToolSource,
    PARSE-LIVE-MULT-FS-WRITE-TOOL. -/
def kernelCheckLiveMultFsWriteToolSource (src : String) : Bool :=
  match parseLiveMultFsWriteToolSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveMultFsWriteToolParsed? : Option Module :=
  match parseLiveMultFsWriteToolSource liveMultFsWriteToolSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultFsWriteToolParsed? with
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
  match liveMultFsWriteToolParsed? with
  | some m => m.commands.length == liveMultFsWriteToolKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostId, surfaceId,
    stillUsesLake. -/
def liveParseHasLiteralDefs : Bool :=
  match liveMultFsWriteToolParsed? with
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
  match liveMultFsWriteToolParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "main"
      | Cmd.defBind x _ _ _ => x.raw == "main"
      | _ => false)

/-- Wrap module lastSeg is MultFsWriteTool (no module line in the live file). -/
def liveParseHasMultFsWriteToolModule : Bool :=
  match liveMultFsWriteToolParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.MultFsWriteTool"
      && lastSeg m.name.raw == "MultFsWriteTool"

/-- Live parse has namespace SystemsLean.MultFsWriteTool. -/
def liveParseHasMultFsWriteToolNs : Bool :=
  match liveMultFsWriteToolParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.MultFsWriteTool"
      | _ => false

/-- Live parse ends namespace SystemsLean.MultFsWriteTool. -/
def liveParseHasMultFsWriteToolEnd : Bool :=
  match liveMultFsWriteToolParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.MultFsWriteTool"
      | _ => false

/-- Live parse keeps the one Mult subset import. -/
def liveParseHasMultFsWriteToolImports : Bool :=
  match liveMultFsWriteToolParsed? with
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
      && has "SystemsLean.MultSubsetEmit"

/-- Keyword counts: theorem 5, example 14, set_option 1.
    Uses stripCommentsMultFsWriteTool, not stripComments. -/
def liveParseKwCountsOk : Bool :=
  match liveMultFsWriteToolParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsMultFsWriteTool liveMultFsWriteToolSource)
    let fuel := liveMultFsWriteToolSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveMultFsWriteToolTheoremCount
      && toksCountKw fuel toks "example" 0 == liveMultFsWriteToolExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveMultFsWriteToolSetOptionCount

/-- Import needle with a trailing newline. -/
def needleImportMultSubsetEmit : String :=
  "import SystemsLean.MultSubsetEmit\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.MultFsWriteTool\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_MULT_FS_WRITE_TOOL_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-MULT-FS-WRITE-TOOL\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"MULT-FS-WRITE-TOOL\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.MultFsWriteTool\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveMultFsWriteToolSource
  (src.splitOn needleImportMultSubsetEmit).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveMultFsWriteToolReady,
    PARSE-LIVE-MULT-FS-WRITE-TOOL,
    HOST-FRONT-LIVE-MULT-FS-WRITE-TOOL.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveMultFsWriteToolReady : Bool :=
  (stageId == "PARSE-LIVE-MULT-FS-WRITE-TOOL")
    && (hostId == "HOST-FRONT-LIVE-MULT-FS-WRITE-TOOL")
    && (parseId == "PARSE-LIVE-MULT-FS-WRITE-TOOL")
    && (liveRel == "MultFsWriteTool.lean")
    && (liveMultFsWriteToolRel
      == "src/systems/SystemsLean/MultFsWriteTool.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveMultFsWriteToolFullHost
    && !hostFrontLiveMultFsWriteToolFullBackend
    && !hostFrontLiveMultFsWriteToolResidualFreeClaimed
    && !hostFrontLiveMultFsWriteToolProvablyUnlocked
    && kernelCheckLiveMultFsWriteToolSource liveMultFsWriteToolSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseSkipsMain
    && liveParseHasMultFsWriteToolModule
    && liveParseHasMultFsWriteToolNs
    && liveParseHasMultFsWriteToolEnd
    && liveParseHasMultFsWriteToolImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultFsWriteToolSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveMultFsWriteTool (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT-FS-WRITE-TOOL =="
  IO.println s!"  host={hostId} file={liveMultFsWriteToolRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveMultFsWriteToolRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultFsWriteToolRel}"
    throw (IO.userError s!"missing {liveMultFsWriteToolRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultFsWriteToolSource then
    IO.eprintln "error: dual-pin mismatch: on-disk MultFsWriteTool.lean != liveMultFsWriteToolSource"
    throw (IO.userError "dual-pin mismatch live MultFsWriteTool.lean")
  let r := parseLiveMultFsWriteToolSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT-FS-WRITE-TOOL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT-FS-WRITE-TOOL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT-FS-WRITE-TOOL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live MultFsWriteTool parse false"
      throw (IO.userError "kernelCheck live MultFsWriteTool parse false")
    unless hostFrontLiveMultFsWriteToolReady do
      IO.eprintln "error: hostFrontLiveMultFsWriteToolReady false"
      throw (IO.userError "hostFrontLiveMultFsWriteToolReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty MultFsWriteTool source was accepted"
      throw (IO.userError "empty MultFsWriteTool source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMultFsWriteTool root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMultFsWriteTool
