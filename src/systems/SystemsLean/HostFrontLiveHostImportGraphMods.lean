/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphMods.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphMods. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses HostImportGraphMods.lean only.
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not steal HostFrontLiveHostImportGraph extra wrap
  (liveRel is HostImportGraph.lean). Do not steal HostImportGraphSeeds wrap.
  Do not steal HostImportGraphWalk wrap. Do not steal HostImportGraphTheorems
  wrap. Do not steal HostImportGraphModel wrap (liveRel is
  HostImportGraphModel.lean). Do not edit occupancy leftover
  HostFrontLiveImportLoadOkLater.
  Do not edit HostFrontLiveHostImportGraphLoadOkLater.
  Do not edit HostFrontLiveHostImportGraphLoadOk.
  Unique needles use a trailing newline so this module id is not the
  shorter LoadOk id and is not mill wrap HostFrontLiveHostImportGraphMain.
  MODS is on every wrap id.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not HostImportGraphWalk wrap. Not HostPackageWriteTheorems wrap.

  Spec (readable):
  - parseLiveHostImportGraphModsSource turns live
    HostImportGraphMods.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphMods even without a
    module line.
  - kernelCheckLiveHostImportGraphModsSource is HostKernel.kernelCheck
    of that parse. Not a constant true.
  - This live file has no kernelable String/Bool atom defs. Skip-fold
    comments, open, theorem, example, structure, inductive, and
    un-kernelable defs (RealMod struct literals).
    Keep dotted import / namespace / end. Types-style atom bodies if
    any appear (none expected).
  - The embedded bytes are liveHostImportGraphModsSource0 ++
    liveHostImportGraphModsSource1.
  - Comment skip is stripCommentsHc, the string-safe skip from
    HostFrontLiveHostCheck. The live text contains dash-dash.
    Do not use a skip that breaks on dash-dash.
  - Living namespace lastSeg is HostImportGraph.
  - Wrap-assigned module lastSeg is HostImportGraphMods.
  - End namespace lastSeg is HostImportGraph.
  - One dotted import kept: SystemsLean.HostImportGraphModel.
  - Skip-head via toksHaveDefNamed: multLeafMod, hostComposeMod,
    emitMultMod, parityMultMod, stepContractFullTheoremsMod.
  - Do not copy ClosePath skip-head toksHaveDefNamed stageId/hostId.
  - Expected command count after skip-fold: 3
    (1 import SystemsLean.HostImportGraphModel + namespace + end).
    Under kernelFuel 64.
    Do not copy HostImportGraphLoadOk cmds=4.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69. Not Lake-gone.
  - Not PROVABLY. Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not mill HostImportGraphMain wrap. Not HostImportGraph extra wrap.
  - Not HostImportGraphSeeds wrap. Not HostImportGraphWalk wrap.
  - Not HostImportGraphTheorems wrap. Not ImportLoadOkLater wrap.

  Unique needles (trailing newline so HostFrontLiveHostImportGraphMods is not a prefix):
  HostFrontLiveHostImportGraphMods
  PARSE-LIVE-HOST-IMPORT-GRAPH-MODS
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MODS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostImportGraphModsSource,
  kernelCheckLiveHostImportGraphModsSource,
  hostFrontLiveHostImportGraphModsReady, liveHostImportGraphModsSource,
  liveHostImportGraphModsRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostImportGraphMods
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveHostImportGraphMods on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostImportGraphModsSource
import SystemsLean.HostFrontLiveHostImportGraphModsSource01
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostImportGraphMods

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MODS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-IMPORT-GRAPH-MODS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphModsRel : String :=
  "src/systems/SystemsLean/HostImportGraphMods.lean"

/-- Live basename. Greppable: liveRel. Must be HostImportGraphMods.lean. -/
def liveRel : String := "HostImportGraphMods.lean"

/-- Concatenated dual-pin. First half then second half. -/
def liveHostImportGraphModsSource : String :=
  liveHostImportGraphModsSource0 ++ liveHostImportGraphModsSource1

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostImportGraphModsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostImportGraphModsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostImportGraphModsProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveHostImportGraphModsOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveHostImportGraphModsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / structure / inductive / un-kernelable def tails. -/
def liveHostImportGraphModsSkipFuel : Nat := 32768

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    Same algorithm as HostFrontLiveHostCheck.stripCommentsHc.
    HostFrontLiveMult.stripComments is not in-string safe. The live text
    contains dash-dash in comments. -/
def stripCommentsHcN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsHcN n nest false false ('\n' :: acc) rest
        else
          stripCommentsHcN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsHcN n nest false false ('"' :: acc) rest
        else
          stripCommentsHcN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsHcN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsHcN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsHcN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsHcN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsHcN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsHcN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsHcN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsHcN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostImportGraphMods.lean bytes. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

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
def cmdAddsHostImportGraphMods (c : Cmd) : List String :=
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
def cmdBodyKnownHostImportGraphMods (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphModsParseFuel body
        && termNoAppN liveHostImportGraphModsParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphModsParseFuel body
        && termNoAppN liveHostImportGraphModsParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostImportGraphMods (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostImportGraphModsSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostImportGraphMods (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostImportGraphMods fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. Keep dotted import / namespace / end. -/
def parseCmdsHostImportGraphMods : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostImportGraphMods liveHostImportGraphModsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostImportGraphModsSkipFuel rest
      if cmdBodyKnownHostImportGraphMods kn c then
        parseCmdsHostImportGraphMods n rest2
          (kn ++ cmdAddsHostImportGraphMods c) (acc ++ [c])
      else
        parseCmdsHostImportGraphMods n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostImportGraphModsSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostImportGraphMods n rest2 kn acc
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped.
    Same shape as the LoadOk checker. Not a retarget of the occupancy
    leftover. Not ClosePath stageId/hostId skip-head. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live HostImportGraphMods.lean text.
    Greppable: parseLiveHostImportGraphModsSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODS. -/
def parseLiveHostImportGraphModsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostImportGraphMods liveHostImportGraphModsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphMods"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphMods parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveHostImportGraphModsSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODS. -/
def kernelCheckLiveHostImportGraphModsSource (src : String) : Bool :=
  match parseLiveHostImportGraphModsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostImportGraphModsParsed? : Option Module :=
  match parseLiveHostImportGraphModsSource liveHostImportGraphModsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostImportGraphModsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (1 dotted import + namespace + end).
    Real bound from this parse, not hardcoded true. Horizon expected
    cmds=3. Under kernelFuel 64. Do not copy HostImportGraphLoadOk
    cmds=4, HostImportGraph cmds=11, or Seeds cmds=32. -/
def liveParseCmdCountOk : Bool :=
  match liveHostImportGraphModsParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Wrap module lastSeg is HostImportGraphMods (no module line in the live file). -/
def liveParseHasHostImportGraphModsModule : Bool :=
  match liveHostImportGraphModsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostImportGraphMods"

/-- Live parse has the living HostImportGraph namespace command. -/
def liveParseHasHostImportGraphNs : Bool :=
  match liveHostImportGraphModsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has the HostImportGraph end namespace command. -/
def liveParseHasHostImportGraphEnd : Bool :=
  match liveHostImportGraphModsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse kept one named dotted import. Exact raw, not lastSeg prefix. -/
def liveParseHasImportNamed (nm : String) : Bool :=
  match liveHostImportGraphModsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == nm
      | _ => false

/-- One dotted import kept: SystemsLean.HostImportGraphModel. -/
def liveParseHasModelImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostImportGraphModel"

/-- Skip-head: core defs in this file, even though the bodies are skipped. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostImportGraphModsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHc liveHostImportGraphModsSource)
    toksHaveDefNamed liveHostImportGraphModsSkipFuel toks "multLeafMod"
      && toksHaveDefNamed liveHostImportGraphModsSkipFuel toks "hostComposeMod"
      && toksHaveDefNamed liveHostImportGraphModsSkipFuel toks "emitMultMod"
      && toksHaveDefNamed liveHostImportGraphModsSkipFuel toks "parityMultMod"
      && toksHaveDefNamed liveHostImportGraphModsSkipFuel toks "stepContractFullTheoremsMod"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostImportGraphModsReady,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODS,
    HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostImportGraphModsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MODS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS")
    && (parseId == "PARSE-LIVE-HOST-IMPORT-GRAPH-MODS")
    && (liveHostImportGraphModsRel
      == "src/systems/SystemsLean/HostImportGraphMods.lean")
    && (liveRel == "HostImportGraphMods.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostImportGraphModsFullHost
    && !hostFrontLiveHostImportGraphModsResidualFreeClaimed
    && !hostFrontLiveHostImportGraphModsProvablyUnlocked
    && !hostFrontLiveHostImportGraphModsOwnsPackageTypecheck
    && kernelCheckLiveHostImportGraphModsSource liveHostImportGraphModsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostImportGraphModsModule
    && liveParseHasHostImportGraphNs
    && liveParseHasHostImportGraphEnd
    && liveParseHasModelImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostImportGraphModsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveHostImportGraphMods (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-IMPORT-GRAPH-MODS =="
  IO.println s!"  host={hostId} file={liveHostImportGraphModsRel} liveRel={liveRel}"
  let path := root / liveHostImportGraphModsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostImportGraphModsRel}"
    throw (IO.userError s!"missing {liveHostImportGraphModsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostImportGraphModsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphMods.lean != liveHostImportGraphModsSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphMods.lean")
  let r := parseLiveHostImportGraphModsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-IMPORT-GRAPH-MODS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-IMPORT-GRAPH-MODS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-IMPORT-GRAPH-MODS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphMods parse false"
      throw (IO.userError "kernelCheck live HostImportGraphMods parse false")
    unless hostFrontLiveHostImportGraphModsReady do
      IO.eprintln "error: hostFrontLiveHostImportGraphModsReady false"
      throw (IO.userError "hostFrontLiveHostImportGraphModsReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphMods.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostImportGraphMods root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostImportGraphMods
