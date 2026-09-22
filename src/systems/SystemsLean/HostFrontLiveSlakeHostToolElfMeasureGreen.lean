/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/SlakeHostToolElfMeasureGreen.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeHostToolElfMeasureGreen. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++. Comment strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on SlakeHostToolElfMeasureGreen text.
  This file has no imports. It is string defs only, not the ELF writer.
  It is SlakeHostToolElfMeasureGreen.lean. Do not claim it imports SlakeHostToolElfMeasureGreen.
  Not a remill. Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not mill remill of mill 69. Not occupancy Term.

  Spec (readable):
  - parseLiveSlakeHostToolElfMeasureGreenSource turns live SlakeHostToolElfMeasureGreen.lean text into HostTerm.Module.
  - Module name is SystemsLean.SlakeHostToolElfMeasureGreen even without a module line.
  - kernelCheckLiveSlakeHostToolElfMeasureGreenSource is HostKernel.kernelCheck of that parse
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

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_GREEN_V0, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN,
  parseLiveSlakeHostToolElfMeasureGreenSource, kernelCheckLiveSlakeHostToolElfMeasureGreenSource,
  hostFrontLiveSlakeHostToolElfMeasureGreenReady, liveSlakeHostToolElfMeasureGreenSource, liveRel,
  liveSlakeHostToolElfMeasureGreenRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen
  Red/green: lean --run SlakeTypecheckSlakeHostToolElfMeasureGreen (horizon); dests skipped;
  lake build SystemsLean.SlakeTypecheckSlakeHostToolElfMeasureGreen on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreenSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from product SLAKE_HOST_TOOL_ELF_V0. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_GREEN_V0"

/-- Greppable host map id. Distinct from product HOST-SLAKE-HOST-TOOL-ELF. -/
def hostId : String := "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN"

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfMeasureGreen.lean. -/
def liveRel : String := "SlakeHostToolElfMeasureGreen.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureGreenRel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenProvablyUnlocked : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenMillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenOccupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenNotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenNotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenLakeGone : Bool := false

/-- Parse fuel (command fold). -/
def liveSlakeHostToolElfMeasureGreenParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveSlakeHostToolElfMeasureGreenSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . SlakeHostToolElfMeasureGreen`. -/
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
def cmdAddsSlakeHostToolElfMeasureGreen (c : Cmd) : List String :=
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
    This helper is string defs only. A hex Nat (0x) is not a decimal atom. -/
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
def cmdBodyKnownSlakeHostToolElfMeasureGreen (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureGreenParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureGreenParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfMeasureGreenParseFuel body
        && termNoAppN liveSlakeHostToolElfMeasureGreenParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. SlakeHostToolElfMeasureGreen kernelable defs are
    atoms (string / bool / nat / const). do / IO bodies fail closed.
    Leftover after the atom that is not a command start (qualified foreign
    const, tokenizer-dropped ++) is skip, not a truncated keep. -/
def parseDefSlakeHostToolElfMeasureGreen (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveSlakeHostToolElfMeasureGreenSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
              | [] =>
                let rest5 := skipNonCmd liveSlakeHostToolElfMeasureGreenSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdSlakeHostToolElfMeasureGreen (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSlakeHostToolElfMeasureGreen fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    inductive / structure / un-kernelable defs. abbrev is not isCmdKw;
    skipUntilCmd rest still advances to the next command keyword. -/
def parseCmdsSlakeHostToolElfMeasureGreen : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSlakeHostToolElfMeasureGreen liveSlakeHostToolElfMeasureGreenParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSlakeHostToolElfMeasureGreenSkipFuel rest
      if cmdBodyKnownSlakeHostToolElfMeasureGreen kn c then
        parseCmdsSlakeHostToolElfMeasureGreen n rest2 (kn ++ cmdAddsSlakeHostToolElfMeasureGreen c) (acc ++ [c])
      else
        parseCmdsSlakeHostToolElfMeasureGreen n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSlakeHostToolElfMeasureGreenSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSlakeHostToolElfMeasureGreen n rest2 kn acc
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

/-- Parse live SlakeHostToolElfMeasureGreen.lean text.
    Greppable: parseLiveSlakeHostToolElfMeasureGreenSource, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN. -/
def parseLiveSlakeHostToolElfMeasureGreenSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSlakeHostToolElfMeasureGreen liveSlakeHostToolElfMeasureGreenParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SlakeHostToolElfMeasureGreen", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SlakeHostToolElfMeasureGreen parse.
    Greppable: kernelCheckLiveSlakeHostToolElfMeasureGreenSource, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN. -/
def kernelCheckLiveSlakeHostToolElfMeasureGreenSource (src : String) : Bool :=
  match parseLiveSlakeHostToolElfMeasureGreenSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSlakeHostToolElfMeasureGreenParsed? : Option Module :=
  match parseLiveSlakeHostToolElfMeasureGreenSource liveSlakeHostToolElfMeasureGreenSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSlakeHostToolElfMeasureGreenParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / string atoms / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped.
    Lower bound is namespace, three string atoms, and end. -/
def liveParseCmdCountOk : Bool :=
  match liveSlakeHostToolElfMeasureGreenParsed? with
  | some m => m.commands.length >= 5
  | none => false

/-- Live parse has the SlakeHostToolElfMeasureGreen namespace command. -/
def liveParseHasSlakeHostToolElfMeasureGreenNs : Bool :=
  match liveSlakeHostToolElfMeasureGreenParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SlakeHostToolElfMeasureGreen"
      | _ => false

/-- Live parse has core string atoms (def_ or defBind).
    ++ strings skip-fold. Kept atoms: stageId, completeStageId, and throwMsg.
    catchEprint is not required. greenLine, failClosedEprint, and leftoverAfterGreen skip-fold. -/
def liveParseHasCoreDefs : Bool :=
  match liveSlakeHostToolElfMeasureGreenParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "completeStageId" && has "throwMsg"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSlakeHostToolElfMeasureGreenReady, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN,
    HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSlakeHostToolElfMeasureGreenReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_GREEN_V0")
    && (hostId == "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN")
    && (parseId == "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN")
    && (liveRel == "SlakeHostToolElfMeasureGreen.lean")
    && (liveSlakeHostToolElfMeasureGreenRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSlakeHostToolElfMeasureGreenFullHost
    && !hostFrontLiveSlakeHostToolElfMeasureGreenResidualFreeClaimed
    && !hostFrontLiveSlakeHostToolElfMeasureGreenProvablyUnlocked
    && (hostFrontLiveSlakeHostToolElfMeasureGreenMillCount == 69)
    && (hostFrontLiveSlakeHostToolElfMeasureGreenOccupancy == 49)
    && hostFrontLiveSlakeHostToolElfMeasureGreenNotOccupancyName50
    && hostFrontLiveSlakeHostToolElfMeasureGreenNotMill70
    && !hostFrontLiveSlakeHostToolElfMeasureGreenLakeGone
    && kernelCheckLiveSlakeHostToolElfMeasureGreenSource liveSlakeHostToolElfMeasureGreenSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSlakeHostToolElfMeasureGreenNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSlakeHostToolElfMeasureGreenSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSlakeHostToolElfMeasureGreen (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureGreenRel}"
  let path := root / liveSlakeHostToolElfMeasureGreenRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSlakeHostToolElfMeasureGreenRel}"
    throw (IO.userError s!"missing {liveSlakeHostToolElfMeasureGreenRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSlakeHostToolElfMeasureGreenSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SlakeHostToolElfMeasureGreen.lean != liveSlakeHostToolElfMeasureGreenSource"
    throw (IO.userError "dual-pin mismatch live SlakeHostToolElfMeasureGreen.lean")
  let r := parseLiveSlakeHostToolElfMeasureGreenSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SlakeHostToolElfMeasureGreen parse false"
      throw (IO.userError "kernelCheck live SlakeHostToolElfMeasureGreen parse false")
    unless hostFrontLiveSlakeHostToolElfMeasureGreenReady do
      IO.eprintln s!"error: hostFrontLiveSlakeHostToolElfMeasureGreenReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasSlakeHostToolElfMeasureGreenNs} core={liveParseHasCoreDefs} noCheck={liveParseHasNoCheckCmd} liveRelOk={liveRel == "SlakeHostToolElfMeasureGreen.lean"} kernel={k}"
      throw (IO.userError "hostFrontLiveSlakeHostToolElfMeasureGreenReady false")
    IO.println s!"GREEN {stageId}: live SlakeHostToolElfMeasureGreen.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSlakeHostToolElfMeasureGreen root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen
