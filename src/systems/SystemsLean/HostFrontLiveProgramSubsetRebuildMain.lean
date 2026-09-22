/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProgramSubsetRebuildMain.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProgramSubsetRebuildMain. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses ProgramSubsetRebuildMain.lean only. Do not wrap ProgramSubsetRebuild.lean.
  Do not invent HostFrontLiveProgramSubsetRebuild (library wrap).
  Do not steal HostFrontLiveProgramMain (companion for Program.lean; none existed).
  Do not invent HostFrontLiveProgram (library wrap of Program.lean).
  This wrap is not ProgramSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.
  Unique needles use trailing newline so HostFrontLiveProgramSubsetRebuildMain is not a
  prefix hit on HostFrontLiveProgramSubsetRebuildMainSource or
  HostFrontLiveProgramSubsetRebuildMainMain.
  Occupancy leftover Term files are not this wrap.
  Do not edit Term files.
  Not Linear.lean. Not ComposeSubsetEmit. Not IrGraph.
  Not HostModuleCheckMain. Not Program.lean. Not ProgramSubsetRebuild.lean.
  Not mill remill (just twenty-fifth-host-tool / inventory table row 37).
  Not mill 69 remill. Mill stays 69 of 69. Occupancy 49.
  DualEqWrite.lean does not exist. Do not invent it.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.

  Spec (readable):
  - parseLiveProgramSubsetRebuildMainSource turns live ProgramSubsetRebuildMain.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.ProgramSubsetRebuildMain even without a module line.
  - kernelCheckLiveProgramSubsetRebuildMainSource is HostKernel.kernelCheck of
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
    ProgramSubsetRebuildMain namespace pin as true.
  - Wrap-assigned module lastSeg is ProgramSubsetRebuildMain.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - Not Linear / ComposeSubsetEmit / IrGraph parsers.
  - Not ProgramSubsetRebuild.lean wrap. DualEqWrite.lean does not exist.
  - This wrap is not ProgramSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.

  Unique needles (trailing newline so HostFrontLiveProgramSubsetRebuildMain is not a prefix):
  HostFrontLiveProgramSubsetRebuildMain
  PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD-MAIN
  SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_REBUILD_MAIN_V0
  PROGRAM-SUBSET-REBUILD-MAIN
  HOST-PROGRAM-SUBSET-REBUILD-MAIN

  Live product needles:
  ProgramSubsetRebuildMain
  slake-program-subset-rebuild
  import SystemsLean.ProgramSubsetRebuild
  PROGRAM-SUBSET-REBUILD
  SLAKE_PROGRAM_SUBSET_REBUILD

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveProgramSubsetRebuildMainSource,
  kernelCheckLiveProgramSubsetRebuildMainSource,
  hostFrontLiveProgramSubsetRebuildMainReady, liveProgramSubsetRebuildMainSource,
  liveProgramSubsetRebuildMainRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProgramSubsetRebuildMain
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveProgramSubsetRebuildMain on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProgramSubsetRebuildMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProgramSubsetRebuildMain

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_REBUILD_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD-MAIN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProgramSubsetRebuildMainRel : String :=
  "src/systems/SystemsLean/ProgramSubsetRebuildMain.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProgramSubsetRebuildMainFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProgramSubsetRebuildMainResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProgramSubsetRebuildMainProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProgramSubsetRebuildMainParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveProgramSubsetRebuildMainSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    ProgramSubsetRebuildMain has no string literals; this strip stays in-string safe.
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

/-- String-safe comment strip for live ProgramSubsetRebuildMain.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . ProgramSubsetRebuild`. -/
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
def cmdAddsProgramSubsetRebuildMain (c : Cmd) : List String :=
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
def cmdBodyKnownProgramSubsetRebuildMain (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProgramSubsetRebuildMainParseFuel body
        && termNoAppN liveProgramSubsetRebuildMainParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProgramSubsetRebuildMainParseFuel body
        && termNoAppN liveProgramSubsetRebuildMainParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefProgramSubsetRebuildMain (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveProgramSubsetRebuildMainSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdProgramSubsetRebuildMain (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefProgramSubsetRebuildMain fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsProgramSubsetRebuildMain : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProgramSubsetRebuildMain liveProgramSubsetRebuildMainParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProgramSubsetRebuildMainSkipFuel rest
      if cmdBodyKnownProgramSubsetRebuildMain kn c then
        parseCmdsProgramSubsetRebuildMain n rest2
          (kn ++ cmdAddsProgramSubsetRebuildMain c) (acc ++ [c])
      else
        parseCmdsProgramSubsetRebuildMain n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveProgramSubsetRebuildMainSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsProgramSubsetRebuildMain n rest2 kn acc
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

/-- Parse live ProgramSubsetRebuildMain.lean text.
    Greppable: parseLiveProgramSubsetRebuildMainSource,
    PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN. -/
def parseLiveProgramSubsetRebuildMainSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProgramSubsetRebuildMain liveProgramSubsetRebuildMainParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProgramSubsetRebuildMain"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProgramSubsetRebuildMain parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveProgramSubsetRebuildMainSource,
    PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN. -/
def kernelCheckLiveProgramSubsetRebuildMainSource (src : String) : Bool :=
  match parseLiveProgramSubsetRebuildMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProgramSubsetRebuildMainParsed? : Option Module :=
  match parseLiveProgramSubsetRebuildMainSource liveProgramSubsetRebuildMainSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProgramSubsetRebuildMainParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (dotted import kept; IO main skip-folded).
    Horizon measured bound cmds=1: the one dotted import
    SystemsLean.ProgramSubsetRebuild. Not a ProgramSubsetRebuild.lean library wrap. -/
def liveParseCmdCountOk : Bool :=
  match liveProgramSubsetRebuildMainParsed? with
  | some m => m.commands.length == 1
  | none => false

/-- Wrap module lastSeg is ProgramSubsetRebuildMain (no module line in the live file). -/
def liveParseHasProgramSubsetRebuildMainModule : Bool :=
  match liveProgramSubsetRebuildMainParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProgramSubsetRebuildMain"

/-- Live parse kept the one dotted import SystemsLean.ProgramSubsetRebuild. -/
def liveParseHasProgramSubsetRebuildImport : Bool :=
  match liveProgramSubsetRebuildMainParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ProgramSubsetRebuild"
      | _ => false

/-- Skip-head: live mill Main still has def main even though the IO body
    skip-folds. Greppable: def main. -/
def liveParseHasCoreDefs : Bool :=
  match liveProgramSubsetRebuildMainParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveProgramSubsetRebuildMainSource)
    toksHaveDefNamed liveProgramSubsetRebuildMainSkipFuel toks "main"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProgramSubsetRebuildMainReady,
    PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN,
    HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD-MAIN.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true.
    This mill Main has no namespace command; do not require one. -/
def hostFrontLiveProgramSubsetRebuildMainReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_REBUILD_MAIN_V0")
    && (hostId == "HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD-MAIN")
    && (parseId == "PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN")
    && (liveProgramSubsetRebuildMainRel
      == "src/systems/SystemsLean/ProgramSubsetRebuildMain.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProgramSubsetRebuildMainFullHost
    && !hostFrontLiveProgramSubsetRebuildMainResidualFreeClaimed
    && !hostFrontLiveProgramSubsetRebuildMainProvablyUnlocked
    && kernelCheckLiveProgramSubsetRebuildMainSource liveProgramSubsetRebuildMainSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProgramSubsetRebuildMainModule
    && liveParseHasProgramSubsetRebuildImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProgramSubsetRebuildMainSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveProgramSubsetRebuildMain (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN =="
  IO.println s!"  host={hostId} file={liveProgramSubsetRebuildMainRel}"
  let path := root / liveProgramSubsetRebuildMainRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProgramSubsetRebuildMainRel}"
    throw (IO.userError s!"missing {liveProgramSubsetRebuildMainRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProgramSubsetRebuildMainSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProgramSubsetRebuildMain.lean != liveProgramSubsetRebuildMainSource"
    throw (IO.userError "dual-pin mismatch live ProgramSubsetRebuildMain.lean")
  let r := parseLiveProgramSubsetRebuildMainSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProgramSubsetRebuildMain parse false"
      throw (IO.userError "kernelCheck live ProgramSubsetRebuildMain parse false")
    unless hostFrontLiveProgramSubsetRebuildMainReady do
      IO.eprintln "error: hostFrontLiveProgramSubsetRebuildMainReady false"
      throw (IO.userError "hostFrontLiveProgramSubsetRebuildMainReady false")
    IO.println s!"GREEN {stageId}: live ProgramSubsetRebuildMain.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProgramSubsetRebuildMain root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProgramSubsetRebuildMain
