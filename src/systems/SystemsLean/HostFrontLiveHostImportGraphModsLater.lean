/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphModsLater.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphModsLater. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses HostImportGraphModsLater.lean only.
  Do not steal HostFrontLiveHostImportGraphMods (liveRel is
  HostImportGraphMods.lean).
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
  - parseLiveHostImportGraphModsLaterSource turns live
    HostImportGraphModsLater.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphModsLater even without a
    module line.
  - kernelCheckLiveHostImportGraphModsLaterSource is HostKernel.kernelCheck
    of that parse. Not a constant true.
  - This live file has no kernelable String/Bool atom defs. Skip-fold
    comments, open, theorem, example, structure, inductive, and
    un-kernelable defs (RealMod struct literals).
    Keep dotted import / namespace / end. Types-style atom bodies if
    any appear (none expected).
  - The embedded bytes are liveHostImportGraphModsLaterSource0 ++
    liveHostImportGraphModsLaterSource1.
  - Comment skip is stripCommentsHc, the string-safe skip from
    HostFrontLiveHostCheck. The live text contains dash-dash.
    Do not use a skip that breaks on dash-dash.
  - Living namespace lastSeg is HostImportGraph.
  - Wrap-assigned module lastSeg is HostImportGraphModsLater.
  - End namespace lastSeg is HostImportGraph.
  - One dotted import kept: SystemsLean.HostImportGraphMods.
  - Skip-head via toksHaveDefNamed: selfHostCompleteMod, selfApplyFsMod,
    specProofTheoremsMod, hostImportGraphGoodMultSeed,
    hostImportGraphGoodExpandSeed, hostImportGraphBadMissing,
    hostImportGraphBadCycle.
  - Do not copy ClosePath skip-head toksHaveDefNamed stageId/hostId.
  - Do not copy HostImportGraphMods multLeafMod skip-head.
  - Expected command count after skip-fold: 3
    (1 import SystemsLean.HostImportGraphMods + namespace + end).
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

  Unique needles (trailing newline so HostFrontLiveHostImportGraphModsLater is not a prefix):
  HostFrontLiveHostImportGraphModsLater
  PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS-LATER
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MODS_LATER_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostImportGraphModsLaterSource,
  kernelCheckLiveHostImportGraphModsLaterSource,
  hostFrontLiveHostImportGraphModsLaterReady, liveHostImportGraphModsLaterSource,
  liveHostImportGraphModsLaterRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostImportGraphModsLater
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveHostImportGraphModsLater on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostImportGraphModsLaterSource
import SystemsLean.HostFrontLiveHostImportGraphModsLaterSource01
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostImportGraphModsLater

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MODS_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS-LATER"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphModsLaterRel : String :=
  "src/systems/SystemsLean/HostImportGraphModsLater.lean"

/-- Live basename. Greppable: liveRel. Must be HostImportGraphModsLater.lean. -/
def liveRel : String := "HostImportGraphModsLater.lean"

/-- Concatenated dual-pin. First half then second half. -/
def liveHostImportGraphModsLaterSource : String :=
  liveHostImportGraphModsLaterSource0 ++ liveHostImportGraphModsLaterSource1

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostImportGraphModsLaterFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostImportGraphModsLaterResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostImportGraphModsLaterProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveHostImportGraphModsLaterOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveHostImportGraphModsLaterParseFuel : Nat := 256

/-- Skip fuel for theorem / example / structure / inductive / un-kernelable def tails. -/
def liveHostImportGraphModsLaterSkipFuel : Nat := 32768

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

/-- String-safe comment strip for live HostImportGraphModsLater.lean bytes. -/
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
def cmdAddsHostImportGraphModsLater (c : Cmd) : List String :=
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
def cmdBodyKnownHostImportGraphModsLater (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphModsLaterParseFuel body
        && termNoAppN liveHostImportGraphModsLaterParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostImportGraphModsLaterParseFuel body
        && termNoAppN liveHostImportGraphModsLaterParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefHostImportGraphModsLater (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveHostImportGraphModsLaterSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdHostImportGraphModsLater (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHostImportGraphModsLater fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. Keep dotted import / namespace / end. -/
def parseCmdsHostImportGraphModsLater : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostImportGraphModsLater liveHostImportGraphModsLaterParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostImportGraphModsLaterSkipFuel rest
      if cmdBodyKnownHostImportGraphModsLater kn c then
        parseCmdsHostImportGraphModsLater n rest2
          (kn ++ cmdAddsHostImportGraphModsLater c) (acc ++ [c])
      else
        parseCmdsHostImportGraphModsLater n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveHostImportGraphModsLaterSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsHostImportGraphModsLater n rest2 kn acc
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

/-- Parse live HostImportGraphModsLater.lean text.
    Greppable: parseLiveHostImportGraphModsLaterSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER. -/
def parseLiveHostImportGraphModsLaterSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostImportGraphModsLater liveHostImportGraphModsLaterParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphModsLater"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphModsLater parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveHostImportGraphModsLaterSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER. -/
def kernelCheckLiveHostImportGraphModsLaterSource (src : String) : Bool :=
  match parseLiveHostImportGraphModsLaterSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostImportGraphModsLaterParsed? : Option Module :=
  match parseLiveHostImportGraphModsLaterSource liveHostImportGraphModsLaterSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostImportGraphModsLaterParsed? with
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
  match liveHostImportGraphModsLaterParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Wrap module lastSeg is HostImportGraphModsLater (no module line in the live file). -/
def liveParseHasHostImportGraphModsLaterModule : Bool :=
  match liveHostImportGraphModsLaterParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostImportGraphModsLater"

/-- Live parse has the living HostImportGraph namespace command. -/
def liveParseHasHostImportGraphNs : Bool :=
  match liveHostImportGraphModsLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has the HostImportGraph end namespace command. -/
def liveParseHasHostImportGraphEnd : Bool :=
  match liveHostImportGraphModsLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse kept one named dotted import. Exact raw, not lastSeg prefix. -/
def liveParseHasImportNamed (nm : String) : Bool :=
  match liveHostImportGraphModsLaterParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == nm
      | _ => false

/-- One dotted import kept: SystemsLean.HostImportGraphMods. -/
def liveParseHasModsImport : Bool :=
  liveParseHasImportNamed "SystemsLean.HostImportGraphMods"

/-- Skip-head: core defs in this file, even though the bodies are skipped. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostImportGraphModsLaterParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHc liveHostImportGraphModsLaterSource)
    toksHaveDefNamed liveHostImportGraphModsLaterSkipFuel toks "selfHostCompleteMod"
      && toksHaveDefNamed liveHostImportGraphModsLaterSkipFuel toks "selfApplyFsMod"
      && toksHaveDefNamed liveHostImportGraphModsLaterSkipFuel toks "specProofTheoremsMod"
      && toksHaveDefNamed liveHostImportGraphModsLaterSkipFuel toks "hostImportGraphGoodMultSeed"
      && toksHaveDefNamed liveHostImportGraphModsLaterSkipFuel toks "hostImportGraphGoodExpandSeed"
      && toksHaveDefNamed liveHostImportGraphModsLaterSkipFuel toks "hostImportGraphBadMissing"
      && toksHaveDefNamed liveHostImportGraphModsLaterSkipFuel toks "hostImportGraphBadCycle"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostImportGraphModsLaterReady,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER,
    HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS-LATER.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostImportGraphModsLaterReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MODS_LATER_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS-LATER")
    && (parseId == "PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER")
    && (liveHostImportGraphModsLaterRel
      == "src/systems/SystemsLean/HostImportGraphModsLater.lean")
    && (liveRel == "HostImportGraphModsLater.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostImportGraphModsLaterFullHost
    && !hostFrontLiveHostImportGraphModsLaterResidualFreeClaimed
    && !hostFrontLiveHostImportGraphModsLaterProvablyUnlocked
    && !hostFrontLiveHostImportGraphModsLaterOwnsPackageTypecheck
    && kernelCheckLiveHostImportGraphModsLaterSource liveHostImportGraphModsLaterSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostImportGraphModsLaterModule
    && liveParseHasHostImportGraphNs
    && liveParseHasHostImportGraphEnd
    && liveParseHasModsImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostImportGraphModsLaterSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveHostImportGraphModsLater (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER =="
  IO.println s!"  host={hostId} file={liveHostImportGraphModsLaterRel} liveRel={liveRel}"
  let path := root / liveHostImportGraphModsLaterRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostImportGraphModsLaterRel}"
    throw (IO.userError s!"missing {liveHostImportGraphModsLaterRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostImportGraphModsLaterSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphModsLater.lean != liveHostImportGraphModsLaterSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphModsLater.lean")
  let r := parseLiveHostImportGraphModsLaterSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphModsLater parse false"
      throw (IO.userError "kernelCheck live HostImportGraphModsLater parse false")
    unless hostFrontLiveHostImportGraphModsLaterReady do
      IO.eprintln "error: hostFrontLiveHostImportGraphModsLaterReady false"
      throw (IO.userError "hostFrontLiveHostImportGraphModsLaterReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphModsLater.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostImportGraphModsLater root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostImportGraphModsLater
