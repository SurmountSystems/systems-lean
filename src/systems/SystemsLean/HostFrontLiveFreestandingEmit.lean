/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/FreestandingEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is FreestandingEmit.lean. It is not FreestandingEmitLoad.lean.
  It is not FreestandingEmitLoadScaffold.lean.
  Compound defs are skipped. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  FreestandingEmit.lean has no llvmUnlocked def and no provablyUnlocked def.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-EMIT-SSOT,
  DUAL-SSOT-EQUALITY, HOST-EMIT-BODY, liveRel,
  kernelCheckLiveFreestandingEmitSource,
  hostFrontLiveFreestandingEmitReady.
  Module: SystemsLean.HostFrontLiveFreestandingEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveFreestandingEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFreestandingEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Real token in FreestandingEmit.lean. -/
def stageId : String := "HOST-EMIT-SSOT"

/-- Greppable host map id. Real token in FreestandingEmit.lean. -/
def hostId : String := "DUAL-SSOT-EQUALITY"

/-- Greppable parse id. Real token in FreestandingEmit.lean. -/
def parseId : String := "HOST-EMIT-BODY"

/-- Live file basename. -/
def liveRel : String := "FreestandingEmit.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFreestandingEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFreestandingEmitFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveFreestandingEmitFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFreestandingEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveFreestandingEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveFreestandingEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveFreestandingEmitSkipFuel : Nat := 32768

/-- Kept commands: 22 imports, namespace, and end.
    renderHeader, renderSource, validateProduct, emitAtRoot, filterArgs,
    and main are skip-folded. From FreestandingEmit.lean. -/
def liveFreestandingEmitKeptCmds : Nat := 24

/-- theorem keyword count. FreestandingEmit.lean has no theorem. -/
def liveFreestandingEmitTheoremCount : Nat := 0

/-- example keyword count. FreestandingEmit.lean has no example. -/
def liveFreestandingEmitExampleCount : Nat := 0

/-- set_option keyword count. FreestandingEmit.lean has no set_option. -/
def liveFreestandingEmitSetOptionCount : Nat := 0

/-- Strip comments; keep dash-dash inside string payloads.
    filterArgs cites the string "--". HostFrontLiveMult.stripComments
    is not in-string safe. -/
def stripCommentsFeN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsFeN n nest false false ('\n' :: acc) rest
        else
          stripCommentsFeN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsFeN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsFeN n nest false false ('"' :: acc) rest
        else
          stripCommentsFeN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsFeN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsFeN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsFeN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsFeN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsFeN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsFeN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsFeN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsFeN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live FreestandingEmit.lean bytes. -/
def stripCommentsFe (src : String) : String :=
  String.ofList (stripCommentsFeN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . FreestandingEmit`. -/
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
def cmdAddsFreestandingEmit (c : Cmd) : List String :=
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
def cmdBodyKnownFreestandingEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFreestandingEmitParseFuel body
        && termNoAppN liveFreestandingEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFreestandingEmitParseFuel body
        && termNoAppN liveFreestandingEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdFreestandingEmit (fuel : Nat) (toks : List String) :
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
def parseCmdsFreestandingEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFreestandingEmit liveFreestandingEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFreestandingEmitSkipFuel rest
      if cmdBodyKnownFreestandingEmit kn c then
        parseCmdsFreestandingEmit n rest2
          (kn ++ cmdAddsFreestandingEmit c) (acc ++ [c])
      else
        parseCmdsFreestandingEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveFreestandingEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFreestandingEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live FreestandingEmit.lean text.
    Greppable: parseLiveFreestandingEmitSource,
    HOST-EMIT-SSOT. -/
def parseLiveFreestandingEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsFe src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFreestandingEmit liveFreestandingEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.FreestandingEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live FreestandingEmit parse. Not a fixture.
    Greppable: kernelCheckLiveFreestandingEmitSource,
    HOST-EMIT-SSOT. -/
def kernelCheckLiveFreestandingEmitSource (src : String) : Bool :=
  match parseLiveFreestandingEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFreestandingEmitParsed? : Option Module :=
  match parseLiveFreestandingEmitSource liveFreestandingEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFreestandingEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Imports, namespace, and end.
    Compound defs are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveFreestandingEmitParsed? with
  | some m => m.commands.length == liveFreestandingEmitKeptCmds
  | none => false

/-- Compound defs stay skip-folded. No def_ or defBind is kept. -/
def liveParseHasNoKeptDef : Bool :=
  match liveFreestandingEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Import module names in FreestandingEmit.lean, in file order. -/
def liveFreestandingEmitImportNames : List String :=
  [ "SystemsLean.FreestandingEmitLoad"
  , "SystemsLean.FreestandingEmitLoadScaffold"
  , "SystemsLean.EmitBanner"
  , "SystemsLean.EmitMult"
  , "SystemsLean.EmitLinear"
  , "SystemsLean.EmitErasure"
  , "SystemsLean.EmitExtract"
  , "SystemsLean.EmitExtractScaffold"
  , "SystemsLean.EmitTypes"
  , "SystemsLean.EmitTypesScaffold"
  , "SystemsLean.EmitProgram"
  , "SystemsLean.EmitProgramScaffold"
  , "SystemsLean.EmitGraph"
  , "SystemsLean.EmitGraphScaffold"
  , "SystemsLean.EmitCompose"
  , "SystemsLean.EmitComposeScaffold"
  , "SystemsLean.EmitPlan"
  , "SystemsLean.EmitPlanScaffold"
  , "SystemsLean.EmitApply"
  , "SystemsLean.EmitApplyScaffold"
  , "SystemsLean.EmitBody"
  , "SystemsLean.EmitBodyScaffold"
  ]

/-- Live parse keeps each import. -/
def liveParseHasImports : Bool :=
  match liveFreestandingEmitParsed? with
  | none => false
  | some m =>
    liveFreestandingEmitImportNames.all fun nm =>
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false

/-- Wrap module lastSeg is FreestandingEmit (no module line in the live file). -/
def liveParseHasFreestandingEmitModule : Bool :=
  match liveFreestandingEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.FreestandingEmit"
      && lastSeg m.name.raw == "FreestandingEmit"

/-- Live parse has namespace SystemsLean.FreestandingEmit. -/
def liveParseHasFreestandingEmitNs : Bool :=
  match liveFreestandingEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.FreestandingEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.FreestandingEmit. -/
def liveParseHasFreestandingEmitEnd : Bool :=
  match liveFreestandingEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.FreestandingEmit"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveFreestandingEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsFe liveFreestandingEmitSource)
    let fuel := liveFreestandingEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveFreestandingEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveFreestandingEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveFreestandingEmitSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportLoad : String := "import SystemsLean.FreestandingEmitLoad\n"

/-- Load scaffold import needle. Trailing newline. -/
def needleImportLoadScaffold : String :=
  "import SystemsLean.FreestandingEmitLoadScaffold\n"

/-- Last import needle. Trailing newline. -/
def needleImportBodyScaffold : String := "import SystemsLean.EmitBodyScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.FreestandingEmit\n"

/-- HOST-EMIT-SSOT line needle with a trailing newline. -/
def needleHostEmitSsot : String :=
  "  Greppable: SYSTEMS_LEAN_HOST, SLAKE_EMIT_FREESTANDING_C_V0, HOST-EMIT-SSOT,\n"

/-- DUAL-SSOT-EQUALITY line needle with a trailing newline. -/
def needleDualSsot : String :=
  "  - DUAL-SSOT-EQUALITY: after load, each SSOT HEADER/BODY block must equal the\n"

/-- HOST-EMIT-BODY line needle with a trailing newline. -/
def needleHostEmitBody : String :=
  "  HOST-EMIT-BODY, HOST-EMIT-BANNER, HOST-EMIT-MULT, HOST-EMIT-LINEAR,\n"

/-- renderHeader def needle with a trailing newline. -/
def needleRenderHeader : String :=
  "def renderHeader (template : String) (banner : BannerSsot) (mult : MultSsot)\n"

/-- emitAtRoot def needle with a trailing newline. -/
def needleEmitAtRoot : String :=
  "def emitAtRoot (root : System.FilePath) : IO Unit := do\n"

/-- filterArgs def needle with a trailing newline. -/
def needleFilterArgs : String := "def filterArgs : List String -> List String\n"

/-- main def needle with a trailing newline. -/
def needleMain : String := "def main (args : List String) : IO UInt32 := do\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.FreestandingEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveFreestandingEmitSource
  (src.splitOn needleImportLoad).length > 1
    && (src.splitOn needleImportLoadScaffold).length > 1
    && (src.splitOn needleImportBodyScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleHostEmitSsot).length > 1
    && (src.splitOn needleDualSsot).length > 1
    && (src.splitOn needleHostEmitBody).length > 1
    && (src.splitOn needleRenderHeader).length > 1
    && (src.splitOn needleEmitAtRoot).length > 1
    && (src.splitOn needleFilterArgs).length > 1
    && (src.splitOn needleMain).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFreestandingEmitReady,
    HOST-EMIT-SSOT,
    DUAL-SSOT-EQUALITY.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveFreestandingEmitReady : Bool :=
  (stageId == "HOST-EMIT-SSOT")
    && (hostId == "DUAL-SSOT-EQUALITY")
    && (parseId == "HOST-EMIT-BODY")
    && (liveRel == "FreestandingEmit.lean")
    && (liveFreestandingEmitRel
      == "src/systems/SystemsLean/FreestandingEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFreestandingEmitFullHost
    && !hostFrontLiveFreestandingEmitFullBackend
    && !hostFrontLiveFreestandingEmitResidualFreeClaimed
    && !hostFrontLiveFreestandingEmitProvablyUnlocked
    && kernelCheckLiveFreestandingEmitSource liveFreestandingEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoKeptDef
    && liveParseHasImports
    && liveParseHasFreestandingEmitModule
    && liveParseHasFreestandingEmitNs
    && liveParseHasFreestandingEmitEnd
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFreestandingEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveFreestandingEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: HOST-EMIT-SSOT =="
  IO.println s!"  host={hostId} file={liveFreestandingEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveFreestandingEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFreestandingEmitRel}"
    throw (IO.userError s!"missing {liveFreestandingEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFreestandingEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk FreestandingEmit.lean != liveFreestandingEmitSource"
    throw (IO.userError "dual-pin mismatch live FreestandingEmit.lean")
  let r := parseLiveFreestandingEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: HOST-EMIT-SSOT reject {reason}"
    throw (IO.userError s!"HOST-EMIT-SSOT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS HOST-EMIT-SSOT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live FreestandingEmit parse false"
      throw (IO.userError "kernelCheck live FreestandingEmit parse false")
    unless hostFrontLiveFreestandingEmitReady do
      IO.eprintln "error: hostFrontLiveFreestandingEmitReady false"
      throw (IO.userError "hostFrontLiveFreestandingEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty FreestandingEmit source was accepted"
      throw (IO.userError "empty FreestandingEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFreestandingEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFreestandingEmit
