/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/SlakeHostToolElfMeasure.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeHostToolElfMeasure. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++. Comment strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on this text.
  Source-text parse only. Do not import SystemsLean.SelfHostComplete.
  Do not import the product module (this driver parses text only).
  The live file imports Fields and Green, not itself.
  It is SlakeHostToolElfMeasure.lean. Not SlakeHostToolElfMeasureGreen.
  Not SlakeHostToolElfMeasureFields.
  Not a remill. Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not mill remill of mill 69. Not occupancy Term.

  Spec (readable):
  - parseLiveSlakeHostToolElfMeasureSource turns live text into HostTerm.Module.
  - Module name is SystemsLean.SlakeHostToolElfMeasure even without a module line.
  - kernelCheckLiveSlakeHostToolElfMeasureSource is HostKernel.kernelCheck of that parse.
  - The two imports SystemsLean.SlakeHostToolElfMeasureFields and
    SystemsLean.SlakeHostToolElfMeasureGreen are kept. An unknown import
    does not seed the env. It is not kernelCheck := true.
  - Keep kernelable one-line String atoms: stageId, destRel, measureNativeIrRel,
    measureFunName, and firstBanner.
  - Skip theorems, set_option, open, inductive, structure, match/let/do/IO
    bodies, ByteArray defs, string-concat bodies, and unknown consts
    (leftoverNative := leftoverAfterGreen).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Occupancy stays 49. Mill stays 69 of 69.
  - Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - Not Linear / Compose / IrGraph parsers.
  - Not mill remill. Not occupancy Term wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_V0, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE,
  parseLiveSlakeHostToolElfMeasureSource, kernelCheckLiveSlakeHostToolElfMeasureSource,
  hostFrontLiveSlakeHostToolElfMeasureReady, liveSlakeHostToolElfMeasureSource, liveRel,
  liveSlakeHostToolElfMeasureRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasure
  Red/green: lean --run SlakeTypecheckSlakeHostToolElfMeasure (horizon); dests were absent;
  lake build on surmount-1 is not run here.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMeasure

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from product SLAKE_HOST_TOOL_ELF_V0. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_V0"

/-- Greppable host map id. Distinct from product HOST-SLAKE-HOST-TOOL-ELF. -/
def hostId : String := "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE"

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfMeasure.lean. -/
def liveRel : String := "SlakeHostToolElfMeasure.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureRel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSlakeHostToolElfMeasureFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSlakeHostToolElfMeasureResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSlakeHostToolElfMeasureProvablyUnlocked : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveSlakeHostToolElfMeasureMillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMeasureOccupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMeasureNotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveSlakeHostToolElfMeasureNotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveSlakeHostToolElfMeasureLakeGone : Bool := false

/-- Parse fuel (command fold). -/
def liveSlakeHostToolElfMeasureParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveSlakeHostToolElfMeasureSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . SlakeHostToolElfMeasure`. -/
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
def cmdAddsSlakeHostToolElfMeasure (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so `"a" ++ "b"` becomes app of two string lits.
    Kernel cannot apply String. Skip any Term.app (keep lits / const / ite). -/
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

/-- UInt32 / UInt8 / ByteArray / IO / Int types poison kernelCheck of the skip-fold.
    Int is HostType.named, and litNat infers HostType.nat.
    Kernelable defs here are five String atoms: stageId, destRel,
    measureNativeIrRel, measureFunName, and firstBanner. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO"
        || lastSeg x.raw == "Int" || lastSeg x.raw == "UInt8"
        || lastSeg x.raw == "ByteArray"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no UInt32/UInt8/ByteArray/IO/Int typed defs. -/
def cmdBodyKnownSlakeHostToolElfMeasure (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. Kernelable defs are stageId, destRel,
    measureNativeIrRel, measureFunName, and firstBanner (String atoms).
    ByteArray, match, string-concat, and unknown consts are not atoms:
    leftover that is not a command start is skip. -/
def parseDefSlakeHostToolElfMeasure (fuel : Nat) (dname : String) (rest : List String) :
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
              | t :: _ =>
                if !isCmdKw t then none
                else
                  let rest5 := skipNonCmd liveSlakeHostToolElfMeasureSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
              | [] =>
                let rest5 := skipNonCmd liveSlakeHostToolElfMeasureSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip.
    theorem is not a kernel command. -/
def parseOneCmdSlakeHostToolElfMeasure (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSlakeHostToolElfMeasure fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    inductive / structure / un-kernelable defs. abbrev is not isCmdKw;
    skipUntilCmd rest still advances to the next command keyword. -/
def parseCmdsSlakeHostToolElfMeasure : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSlakeHostToolElfMeasure liveSlakeHostToolElfMeasureParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSlakeHostToolElfMeasureSkipFuel rest
      if cmdBodyKnownSlakeHostToolElfMeasure kn c then
        parseCmdsSlakeHostToolElfMeasure n rest2 (kn ++ cmdAddsSlakeHostToolElfMeasure c) (acc ++ [c])
      else
        parseCmdsSlakeHostToolElfMeasure n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSlakeHostToolElfMeasureSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSlakeHostToolElfMeasure n rest2 kn acc
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

/-- Token walk: live text has `theorem` named `nm`. Not a kernel command. -/
def toksHaveThmNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveThmNamed n rest2 nm
    | none => toksHaveThmNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveThmNamed n rest nm

/-- Parse live SlakeHostToolElfMeasure.lean text.
    Greppable: parseLiveSlakeHostToolElfMeasureSource, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE. -/
def parseLiveSlakeHostToolElfMeasureSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSlakeHostToolElfMeasure liveSlakeHostToolElfMeasureParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SlakeHostToolElfMeasure", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SlakeHostToolElfMeasure parse.
    Greppable: kernelCheckLiveSlakeHostToolElfMeasureSource, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE. -/
def kernelCheckLiveSlakeHostToolElfMeasureSource (src : String) : Bool :=
  match parseLiveSlakeHostToolElfMeasureSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSlakeHostToolElfMeasureParsed? : Option Module :=
  match parseLiveSlakeHostToolElfMeasureSource liveSlakeHostToolElfMeasureSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSlakeHostToolElfMeasureParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / string atoms / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped.
    Lower bound is two imports, namespace, five String atoms, and end. -/
def liveParseCmdCountOk : Bool :=
  match liveSlakeHostToolElfMeasureParsed? with
  | some m => m.commands.length >= 9
  | none => false

/-- Live parse has the SlakeHostToolElfMeasure namespace command. -/
def liveParseHasSlakeHostToolElfMeasureNs : Bool :=
  match liveSlakeHostToolElfMeasureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SlakeHostToolElfMeasure"
      | _ => false

/-- Live parse keeps both product imports. The driver does not import them.
    Unknown imports do not seed the kernel env. -/
def liveParseHasMeasureImport : Bool :=
  match liveSlakeHostToolElfMeasureParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.SlakeHostToolElfMeasureFields"
      && has "SystemsLean.SlakeHostToolElfMeasureGreen"

/-- Live parse has the kernelable String atoms (def_ or defBind).
    Kept: stageId, destRel, measureNativeIrRel, measureFunName, firstBanner.
    leftoverNative names an unknown const. ByteArray, IO, match, inductive,
    structure, and string-concat bodies are not single atoms. -/
def liveParseHasCoreDefs : Bool :=
  match liveSlakeHostToolElfMeasureParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "destRel" && has "measureNativeIrRel"
      && has "measureFunName" && has "firstBanner"

/-- Skip-folded names are not kept as kernel commands.
    Dotted defs are stored as the last segment (render, wellTyped). -/
def liveParseSkippedUnkernelable : Bool :=
  match liveSlakeHostToolElfMeasureParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    !(has "leftoverNative") && !(has "render") && !(has "renderBody")
      && !(has "measureBody") && !(has "wellTyped")
      && !(has "measureNativeIr") && !(has "firstInsn")
      && !(has "measureNativeIrText") && !(has "measureNativeIrDump")
      && !(has "elfMagic") && !(has "bytesAreElfMagic")
      && !(has "writeMeasureNativeIr")

/-- Token walk still sees every real def (last segment) and the six theorems.
    Greppable: liveParseSeesMeasureSurface. -/
def liveParseSeesMeasureSurface : Bool :=
  let toks := tokenizeHostTerm (stripComments liveSlakeHostToolElfMeasureSource)
  let fuel := liveSlakeHostToolElfMeasureSkipFuel
  toksHaveDefNamed fuel toks "stageId"
    && toksHaveDefNamed fuel toks "destRel"
    && toksHaveDefNamed fuel toks "measureNativeIrRel"
    && toksHaveDefNamed fuel toks "measureFunName"
    && toksHaveDefNamed fuel toks "firstBanner"
    && toksHaveDefNamed fuel toks "leftoverNative"
    && toksHaveDefNamed fuel toks "render"
    && toksHaveDefNamed fuel toks "renderBody"
    && toksHaveDefNamed fuel toks "measureBody"
    && toksHaveDefNamed fuel toks "wellTyped"
    && toksHaveDefNamed fuel toks "measureNativeIr"
    && toksHaveDefNamed fuel toks "firstInsn"
    && toksHaveDefNamed fuel toks "measureNativeIrText"
    && toksHaveDefNamed fuel toks "measureNativeIrDump"
    && toksHaveDefNamed fuel toks "elfMagic"
    && toksHaveDefNamed fuel toks "bytesAreElfMagic"
    && toksHaveDefNamed fuel toks "writeMeasureNativeIr"
    && toksHaveThmNamed fuel toks "measureNativeIr_wellTyped"
    && toksHaveThmNamed fuel toks "measureNativeIr_name"
    && toksHaveThmNamed fuel toks "measureNativeIr_body_length"
    && toksHaveThmNamed fuel toks "measureNativeIr_first"
    && toksHaveThmNamed fuel toks "measureNativeIrDump_isSome"
    && toksHaveThmNamed fuel toks "measureNativeIrRel_ne_destRel"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSlakeHostToolElfMeasureReady, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE,
    HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSlakeHostToolElfMeasureReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_V0")
    && (hostId == "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE")
    && (parseId == "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE")
    && (liveRel == "SlakeHostToolElfMeasure.lean")
    && (liveSlakeHostToolElfMeasureRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSlakeHostToolElfMeasureFullHost
    && !hostFrontLiveSlakeHostToolElfMeasureResidualFreeClaimed
    && !hostFrontLiveSlakeHostToolElfMeasureProvablyUnlocked
    && (hostFrontLiveSlakeHostToolElfMeasureMillCount == 69)
    && (hostFrontLiveSlakeHostToolElfMeasureOccupancy == 49)
    && hostFrontLiveSlakeHostToolElfMeasureNotOccupancyName50
    && hostFrontLiveSlakeHostToolElfMeasureNotMill70
    && !hostFrontLiveSlakeHostToolElfMeasureLakeGone
    && kernelCheckLiveSlakeHostToolElfMeasureSource liveSlakeHostToolElfMeasureSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSlakeHostToolElfMeasureNs
    && liveParseHasMeasureImport
    && liveParseHasCoreDefs
    && liveParseSkippedUnkernelable
    && liveParseSeesMeasureSurface

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSlakeHostToolElfMeasureSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSlakeHostToolElfMeasure (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureRel} liveRel={liveRel}"
  let path := root / liveSlakeHostToolElfMeasureRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSlakeHostToolElfMeasureRel}"
    throw (IO.userError s!"missing {liveSlakeHostToolElfMeasureRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSlakeHostToolElfMeasureSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SlakeHostToolElfMeasure.lean != liveSlakeHostToolElfMeasureSource"
    throw (IO.userError "dual-pin mismatch live SlakeHostToolElfMeasure.lean")
  let r := parseLiveSlakeHostToolElfMeasureSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck {k} liveRel {liveRel}"
    unless k do
      IO.eprintln "error: kernelCheck live SlakeHostToolElfMeasure parse false"
      throw (IO.userError "kernelCheck live SlakeHostToolElfMeasure parse false")
    unless hostFrontLiveSlakeHostToolElfMeasureReady do
      IO.eprintln s!"error: hostFrontLiveSlakeHostToolElfMeasureReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasSlakeHostToolElfMeasureNs} import={liveParseHasMeasureImport} core={liveParseHasCoreDefs} noCheck={liveParseHasNoCheckCmd} surface={liveParseSeesMeasureSurface} skipped={liveParseSkippedUnkernelable} liveRelOk={liveRel == "SlakeHostToolElfMeasure.lean"} kernel={k}"
      throw (IO.userError "hostFrontLiveSlakeHostToolElfMeasureReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"GREEN {stageId}: live SlakeHostToolElfMeasure.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSlakeHostToolElfMeasure root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSlakeHostToolElfMeasure
