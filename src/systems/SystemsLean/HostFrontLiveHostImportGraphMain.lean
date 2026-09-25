/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphMain.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphMain. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses HostImportGraphMain.lean only. Do not wrap HostImportGraph.lean.
  Do not steal HostFrontLiveImportGraphMain.lean (library wrap for
  HostImportGraph.lean). Mill parser is HostFrontLiveHostImportGraphMain.
  Do not edit HostFrontLiveGraph.lean, HostFrontLiveGraphMain.lean,
  HostFrontLiveGraphSource.lean, HostFrontLiveHostGraphMain.lean, or
  HostImportGraph.lean.
  Unique needles use trailing newline so HostFrontLiveHostImportGraphMain is not a
  prefix hit on HostFrontLiveHostImportGraphMainSource or
  HostFrontLiveHostImportGraphMainMain.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not mill remill. Mill stays 69 of 69.
  Do not wrap HostModuleCheckMain. Do not wrap CapableComposeMain.
  Do not wrap ComposeSubsetEmit.lean.
  Do not collide with HostGraphMain wrap ids
  (PARSE-LIVE-HOST-GRAPH-MAIN, HOST-GRAPH-MAIN,
  SLAKE_HOST_FRONT_LIVE_HOST_GRAPH_MAIN_V0). IMPORT is in the mill ids.

  Spec (readable):
  - parseLiveHostImportGraphMainSource turns live HostImportGraphMain.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphMain even without a module line.
  - kernelCheckLiveHostImportGraphMainSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. This live mill Main has no namespace, no end, and no
    String/Nat/Bool atom defs. The one dotted import is kept. Skip-head
    still sees def main via toksHaveDefNamed on stripped tokens.
  - Skip-fold ALL theorems and examples. Compound && ready pins skip.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
    cmdBodyKnown rejects typeHasUInt32OrIo so this live
    def main (args : List String) : IO UInt32 skip-folds.
  - This live file has no living namespace command. Do not require a
    HostImportGraphMain namespace pin as true.
  - Wrap-assigned module lastSeg is HostImportGraphMain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not HostImportGraph.lean wrap. Not HostFrontLiveImportGraphMain.lean.
  - Not HostGraphMain wrap. Not HostFrontLiveHostGraphMain.lean.

  Unique needles (trailing newline so HostFrontLiveHostImportGraphMain is not a prefix):
  HostFrontLiveHostImportGraphMain
  PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MAIN
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MAIN_V0
  HOST-IMPORT-GRAPH-MAIN

  Live product needles:
  HostImportGraphMain
  slake-host-import-graph
  import SystemsLean.HostImportGraph
  HOST-IMPORT-GRAPH
  SLAKE_HOST_IMPORT_GRAPH
  hostImportGraphReady

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostImportGraphMainSource,
  kernelCheckLiveHostImportGraphMainSource,
  hostFrontLiveHostImportGraphMainReady, liveHostImportGraphMainSource,
  liveHostImportGraphMainRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostImportGraphMain
  Red/green: dests skipped this slice (no barrel, no dest rows).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostImportGraphMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostImportGraphMain

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN"

/-- Live basename. Greppable: liveRel. Must be HostImportGraphMain.lean. -/
def liveRel : String := "HostImportGraphMain.lean"

/-- Live file relative to repo root.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveHostImportGraphMainRel : String :=
  "src/systems/SystemsLean/HostImportGraphMain.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostImportGraphMainFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostImportGraphMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostImportGraphMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostImportGraphMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostImportGraphMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostImportGraphMain has no string literals; this strip stays in-string safe.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsOrN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsOrN n nest false false ('\n' :: acc) rest
        else
          stripCommentsOrN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsOrN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsOrN n nest false false ('"' :: acc) rest
        else
          stripCommentsOrN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsOrN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsOrN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsOrN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsOrN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsOrN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsOrN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsOrN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsOrN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostImportGraphMain.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostImportGraph`. -/
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
def cmdAddsHostImportGraphMain (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat is an untyped app.
    Kernel cannot apply String. Skip any Term.app. -/
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

/-- Atom bodies the kernel can type without && / ++ / struct / ite. -/
def termIsKernelAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownHostImportGraphMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphMainParseFuel body
        && termNoAppN liveHostImportGraphMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphMainParseFuel body
        && termNoAppN liveHostImportGraphMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostImportGraphMain (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
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
                  let rest5 := skipNonCmd liveHostImportGraphMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostImportGraphMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostImportGraphMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsHostImportGraphMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostImportGraphMain liveHostImportGraphMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostImportGraphMainSkipFuel rest
      if cmdBodyKnownHostImportGraphMain kn c then
        parseCmdsHostImportGraphMain n rest2
          (kn ++ cmdAddsHostImportGraphMain c) (acc ++ [c])
      else
        parseCmdsHostImportGraphMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostImportGraphMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostImportGraphMain n rest2 kn acc
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live HostImportGraphMain.lean text.
    Greppable: parseLiveHostImportGraphMainSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN. -/
def parseLiveHostImportGraphMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostImportGraphMain liveHostImportGraphMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphMain parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveHostImportGraphMainSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN. -/
def kernelCheckLiveHostImportGraphMainSource (src : String) : Bool :=
  match parseLiveHostImportGraphMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostImportGraphMainParsed? : Option Module :=
  match parseLiveHostImportGraphMainSource liveHostImportGraphMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostImportGraphMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (dotted import kept; IO main skip-folded).
    Horizon measured bound cmds=1: the one dotted import
    SystemsLean.HostImportGraph. Not HostImportGraph wrap bound. -/
def liveParseCmdCountOk : Bool :=
  match liveHostImportGraphMainParsed? with
  | some m => m.commands.length == 1
  | none => false

/-- Wrap module lastSeg is HostImportGraphMain (no module line in the live file). -/
def liveParseHasHostImportGraphMainModule : Bool :=
  match liveHostImportGraphMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostImportGraphMain"

/-- Live parse kept the one dotted import SystemsLean.HostImportGraph. -/
def liveParseHasHostImportGraphImport : Bool :=
  match liveHostImportGraphMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.HostImportGraph"
      | _ => false

/-- Skip-head: live mill Main still has def main even though the IO body
    skip-folds. Greppable: def main. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostImportGraphMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveHostImportGraphMainSource)
    toksHaveDefNamed liveHostImportGraphMainSkipFuel toks "main"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostImportGraphMainReady,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN,
    HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MAIN.
    Real conjunction: parse plus kernelCheck plus liveRel. Not hardcoded true.
    This mill Main has no namespace command; do not require one. -/
def hostFrontLiveHostImportGraphMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MAIN")
    && (parseId == "PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN")
    && (liveHostImportGraphMainRel
      == "src/systems/SystemsLean/HostImportGraphMain.lean")
    && (liveRel == "HostImportGraphMain.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostImportGraphMainFullHost
    && !hostFrontLiveHostImportGraphMainResidualFreeClaimed
    && !hostFrontLiveHostImportGraphMainProvablyUnlocked
    && kernelCheckLiveHostImportGraphMainSource liveHostImportGraphMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostImportGraphMainModule
    && liveParseHasHostImportGraphImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostImportGraphMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveHostImportGraphMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN =="
  IO.println s!"  host={hostId} file={liveHostImportGraphMainRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "HostImportGraphMain.lean") do
    IO.eprintln "error: liveRel must be HostImportGraphMain.lean"
    throw (IO.userError "liveRel must be HostImportGraphMain.lean")
  let path := root / liveHostImportGraphMainRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostImportGraphMainRel}"
    throw (IO.userError s!"missing {liveHostImportGraphMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostImportGraphMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphMain.lean != liveHostImportGraphMainSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphMain.lean")
  let r := parseLiveHostImportGraphMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphMain parse false"
      throw (IO.userError "kernelCheck live HostImportGraphMain parse false")
    unless hostFrontLiveHostImportGraphMainReady do
      IO.eprintln "error: hostFrontLiveHostImportGraphMainReady false"
      throw (IO.userError "hostFrontLiveHostImportGraphMainReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphMain.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostImportGraphMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostImportGraphMain
