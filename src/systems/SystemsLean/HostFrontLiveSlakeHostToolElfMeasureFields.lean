/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/SlakeHostToolElfMeasureFields.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeHostToolElfMeasureFields. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++. Comment strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on SlakeHostToolElfMeasureFields text.
  This file has no imports. Kernelable atoms are stageId (String) and remainingCount (Nat).
  remainingLines is a List String of ++ pieces. leftoverAfterFields is ++ string concat.
  theorem remainingLines_length is skip-folded. Do not invent other theorems.
  It is SlakeHostToolElfMeasureFields.lean. Do not claim it imports SlakeHostToolElfMeasureFields.
  Not a remill. Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not mill remill of mill 69. Not occupancy Term.

  Spec (readable):
  - parseLiveSlakeHostToolElfMeasureFieldsSource turns live SlakeHostToolElfMeasureFields.lean text into HostTerm.Module.
  - Module name is SystemsLean.SlakeHostToolElfMeasureFields even without a module line.
  - kernelCheckLiveSlakeHostToolElfMeasureFieldsSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; the live file has zero imports).
  - isWellFormed does not require imports. Do not require any import.
  - Skip theorems, examples, set_option, open, abbrev, inductive, structure,
    un-kernelable match/let/app/do/IO bodies, ByteArray/UInt32/UInt8/IO/Int typed
    defs, and ++ string concat. Keep kernelable one-line Nat and String atoms,
    namespace, and end.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Occupancy stays 49. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - Not Linear / Compose / IrGraph parsers. Not LinearForeignLink wrap.
  - Not mill remill. Not occupancy Term wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_V0, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS,
  parseLiveSlakeHostToolElfMeasureFieldsSource, kernelCheckLiveSlakeHostToolElfMeasureFieldsSource,
  hostFrontLiveSlakeHostToolElfMeasureFieldsReady, liveSlakeHostToolElfMeasureFieldsSource, liveRel,
  liveSlakeHostToolElfMeasureFieldsRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields
  Red/green: lean --run SlakeTypecheckSlakeHostToolElfMeasureFields (horizon); dests skipped;
  lake build SystemsLean.SlakeTypecheckSlakeHostToolElfMeasureFields on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from product SLAKE_HOST_TOOL_ELF_V0. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_V0"

/-- Greppable host map id. Distinct from product HOST-SLAKE-HOST-TOOL-ELF. -/
def hostId : String := "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS"

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfMeasureFields.lean. -/
def liveRel : String := "SlakeHostToolElfMeasureFields.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureFieldsRel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsProvablyUnlocked : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsMillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsOccupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsNotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsNotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsLakeGone : Bool := false

/-- Parse fuel (command fold). -/
def liveSlakeHostToolElfMeasureFieldsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveSlakeHostToolElfMeasureFieldsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . SlakeHostToolElfMeasureFields`. -/
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
def cmdAddsSlakeHostToolElfMeasureFields (c : Cmd) : List String :=
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
    Kernelable defs here are one String atom and one Nat atom.
    A hex Nat (0x) is not a decimal atom. -/
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
def cmdBodyKnownSlakeHostToolElfMeasureFields (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureFieldsParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureFieldsParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureFieldsParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureFieldsParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. SlakeHostToolElfMeasureFields kernelable defs are
    stageId (String) and remainingCount (Nat). List bodies and ++ concat
    are not atoms: leftover that is not a command start is skip, not a
    truncated keep. -/
def parseDefSlakeHostToolElfMeasureFields (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveSlakeHostToolElfMeasureFieldsSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
              | [] =>
                let rest5 := skipNonCmd liveSlakeHostToolElfMeasureFieldsSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip.
    theorem is not a kernel command. -/
def parseOneCmdSlakeHostToolElfMeasureFields (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSlakeHostToolElfMeasureFields fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    inductive / structure / un-kernelable defs. abbrev is not isCmdKw;
    skipUntilCmd rest still advances to the next command keyword. -/
def parseCmdsSlakeHostToolElfMeasureFields : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSlakeHostToolElfMeasureFields liveSlakeHostToolElfMeasureFieldsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSlakeHostToolElfMeasureFieldsSkipFuel rest
      if cmdBodyKnownSlakeHostToolElfMeasureFields kn c then
        parseCmdsSlakeHostToolElfMeasureFields n rest2 (kn ++ cmdAddsSlakeHostToolElfMeasureFields c) (acc ++ [c])
      else
        parseCmdsSlakeHostToolElfMeasureFields n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSlakeHostToolElfMeasureFieldsSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSlakeHostToolElfMeasureFields n rest2 kn acc
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

/-- Parse live SlakeHostToolElfMeasureFields.lean text.
    Greppable: parseLiveSlakeHostToolElfMeasureFieldsSource, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS. -/
def parseLiveSlakeHostToolElfMeasureFieldsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSlakeHostToolElfMeasureFields liveSlakeHostToolElfMeasureFieldsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SlakeHostToolElfMeasureFields", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SlakeHostToolElfMeasureFields parse.
    Greppable: kernelCheckLiveSlakeHostToolElfMeasureFieldsSource, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS. -/
def kernelCheckLiveSlakeHostToolElfMeasureFieldsSource (src : String) : Bool :=
  match parseLiveSlakeHostToolElfMeasureFieldsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSlakeHostToolElfMeasureFieldsParsed? : Option Module :=
  match parseLiveSlakeHostToolElfMeasureFieldsSource liveSlakeHostToolElfMeasureFieldsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSlakeHostToolElfMeasureFieldsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / kernelable atoms / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped.
    Lower bound is namespace, stageId, remainingCount, and end. -/
def liveParseCmdCountOk : Bool :=
  match liveSlakeHostToolElfMeasureFieldsParsed? with
  | some m => m.commands.length >= 4
  | none => false

/-- Live parse has the SlakeHostToolElfMeasureFields namespace command. -/
def liveParseHasSlakeHostToolElfMeasureFieldsNs : Bool :=
  match liveSlakeHostToolElfMeasureFieldsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SlakeHostToolElfMeasureFields"
      | _ => false

/-- Live parse has the kernelable atoms (def_ or defBind).
    Kept: stageId (String) and remainingCount (Nat).
    remainingLines is List String with ++, so it is not an atom.
    leftoverAfterFields is ++ string concat, so it is not an atom. -/
def liveParseHasCoreDefs : Bool :=
  match liveSlakeHostToolElfMeasureFieldsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "remainingCount"

/-- Skip-folded names are not kept as kernel commands.
    remainingLines, leftoverAfterFields, and theorem remainingLines_length. -/
def liveParseSkippedUnkernelable : Bool :=
  match liveSlakeHostToolElfMeasureFieldsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    !(has "remainingLines") && !(has "leftoverAfterFields")
      && !(has "remainingLines_length")

/-- Token walk still sees every real def and the one real theorem.
    Greppable: liveParseSeesFieldSurface. -/
def liveParseSeesFieldSurface : Bool :=
  let toks := tokenizeHostTerm (stripComments liveSlakeHostToolElfMeasureFieldsSource)
  let fuel := liveSlakeHostToolElfMeasureFieldsSkipFuel
  toksHaveDefNamed fuel toks "stageId"
    && toksHaveDefNamed fuel toks "remainingLines"
    && toksHaveDefNamed fuel toks "remainingCount"
    && toksHaveDefNamed fuel toks "leftoverAfterFields"
    && toksHaveThmNamed fuel toks "remainingLines_length"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSlakeHostToolElfMeasureFieldsReady, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS,
    HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSlakeHostToolElfMeasureFieldsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_V0")
    && (hostId == "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS")
    && (parseId == "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS")
    && (liveRel == "SlakeHostToolElfMeasureFields.lean")
    && (liveSlakeHostToolElfMeasureFieldsRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSlakeHostToolElfMeasureFieldsFullHost
    && !hostFrontLiveSlakeHostToolElfMeasureFieldsResidualFreeClaimed
    && !hostFrontLiveSlakeHostToolElfMeasureFieldsProvablyUnlocked
    && (hostFrontLiveSlakeHostToolElfMeasureFieldsMillCount == 69)
    && (hostFrontLiveSlakeHostToolElfMeasureFieldsOccupancy == 49)
    && hostFrontLiveSlakeHostToolElfMeasureFieldsNotOccupancyName50
    && hostFrontLiveSlakeHostToolElfMeasureFieldsNotMill70
    && !hostFrontLiveSlakeHostToolElfMeasureFieldsLakeGone
    && kernelCheckLiveSlakeHostToolElfMeasureFieldsSource liveSlakeHostToolElfMeasureFieldsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSlakeHostToolElfMeasureFieldsNs
    && liveParseHasCoreDefs
    && liveParseSkippedUnkernelable
    && liveParseSeesFieldSurface

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSlakeHostToolElfMeasureFieldsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSlakeHostToolElfMeasureFields (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureFieldsRel} liveRel={liveRel}"
  let path := root / liveSlakeHostToolElfMeasureFieldsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSlakeHostToolElfMeasureFieldsRel}"
    throw (IO.userError s!"missing {liveSlakeHostToolElfMeasureFieldsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSlakeHostToolElfMeasureFieldsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SlakeHostToolElfMeasureFields.lean != liveSlakeHostToolElfMeasureFieldsSource"
    throw (IO.userError "dual-pin mismatch live SlakeHostToolElfMeasureFields.lean")
  let r := parseLiveSlakeHostToolElfMeasureFieldsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SlakeHostToolElfMeasureFields parse false"
      throw (IO.userError "kernelCheck live SlakeHostToolElfMeasureFields parse false")
    unless hostFrontLiveSlakeHostToolElfMeasureFieldsReady do
      IO.eprintln s!"error: hostFrontLiveSlakeHostToolElfMeasureFieldsReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasSlakeHostToolElfMeasureFieldsNs} core={liveParseHasCoreDefs} noCheck={liveParseHasNoCheckCmd} surface={liveParseSeesFieldSurface} skipped={liveParseSkippedUnkernelable} liveRelOk={liveRel == "SlakeHostToolElfMeasureFields.lean"} kernel={k}"
      throw (IO.userError "hostFrontLiveSlakeHostToolElfMeasureFieldsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"GREEN {stageId}: live SlakeHostToolElfMeasureFields.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSlakeHostToolElfMeasureFields root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields
