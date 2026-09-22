/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/SlakeHostToolElfCompleteOk.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSlakeHostToolElfCompleteOk. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style). Tokenizer-dropped ++. Comment strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on this text.
  The live file imports SystemsLean.CompleteOk. It is not the link library.
  It is SlakeHostToolElfCompleteOk.lean. Do not claim it is SlakeHostToolElfLink.
  Not a remill. Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not mill remill of mill 69. Not occupancy Term.

  Spec (readable):
  - parseLiveSlakeHostToolElfCompleteOkSource turns the live text into HostTerm.Module.
  - Module name is SystemsLean.SlakeHostToolElfCompleteOk even without a module line.
  - kernelCheckLiveSlakeHostToolElfCompleteOkSource is HostKernel.kernelCheck of that parse.
  - The import SystemsLean.CompleteOk is kept. checkCmd accepts an import that is
    not Mult, Erasure, or Types without seeding those modules.
  - Kept kernelable atoms: stageId and completeOkStage (one-line String lits).
  - Skip theorems, qualified CompleteOk consts (unknown to this kernel),
    UInt32 and ByteArray bodies, if/match/do, and ++ string concat.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Occupancy stays 49. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - Not Linear / Compose / IrGraph parsers. Not the Elf link wrap.
  - Not mill remill. Not occupancy Term wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_COMPLETE_OK_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK,
  parseLiveSlakeHostToolElfCompleteOkSource,
  kernelCheckLiveSlakeHostToolElfCompleteOkSource,
  hostFrontLiveSlakeHostToolElfCompleteOkReady,
  liveSlakeHostToolElfCompleteOkSource, liveRel,
  liveSlakeHostToolElfCompleteOkRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk
  Red/green: lean --run SlakeTypecheckSlakeHostToolElfCompleteOk (horizon); dests skipped;
  lake build SystemsLean.SlakeTypecheckSlakeHostToolElfCompleteOk on surmount-1
  (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from product SLAKE_HOST_TOOL_ELF_V0. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_COMPLETE_OK_V0"

/-- Greppable host map id. Distinct from product HOST-SLAKE-HOST-TOOL-ELF. -/
def hostId : String := "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK"

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfCompleteOk.lean. -/
def liveRel : String := "SlakeHostToolElfCompleteOk.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfCompleteOkRel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSlakeHostToolElfCompleteOkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSlakeHostToolElfCompleteOkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSlakeHostToolElfCompleteOkProvablyUnlocked : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveSlakeHostToolElfCompleteOkMillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfCompleteOkOccupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveSlakeHostToolElfCompleteOkNotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveSlakeHostToolElfCompleteOkNotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveSlakeHostToolElfCompleteOkLakeGone : Bool := false

/-- Parse fuel (command fold). -/
def liveSlakeHostToolElfCompleteOkParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveSlakeHostToolElfCompleteOkSkipFuel : Nat := 8192

/-- Dotted ident, one token or `A . B` pieces. -/
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
def cmdAddsSlakeHostToolElfCompleteOk (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat becomes app of two string lits.
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
    Int is HostType.named, and litNat infers HostType.nat. -/
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
def cmdBodyKnownSlakeHostToolElfCompleteOk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfCompleteOkParseFuel body
        && termNoAppN liveSlakeHostToolElfCompleteOkParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSlakeHostToolElfCompleteOkParseFuel body
        && termNoAppN liveSlakeHostToolElfCompleteOkParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. Kept CompleteOk atoms are string lits.
    do / IO / ByteArray bodies fail closed.
    Leftover after the atom that is not a command start (qualified foreign
    const pieces, tokenizer-dropped ++) is skip, not a truncated keep. -/
def parseDefSlakeHostToolElfCompleteOk (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveSlakeHostToolElfCompleteOkSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
              | [] =>
                let rest5 := skipNonCmd liveSlakeHostToolElfCompleteOkSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdSlakeHostToolElfCompleteOk (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefSlakeHostToolElfCompleteOk fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    inductive / structure / un-kernelable defs. -/
def parseCmdsSlakeHostToolElfCompleteOk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSlakeHostToolElfCompleteOk liveSlakeHostToolElfCompleteOkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSlakeHostToolElfCompleteOkSkipFuel rest
      if cmdBodyKnownSlakeHostToolElfCompleteOk kn c then
        parseCmdsSlakeHostToolElfCompleteOk n rest2
          (kn ++ cmdAddsSlakeHostToolElfCompleteOk c) (acc ++ [c])
      else
        parseCmdsSlakeHostToolElfCompleteOk n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSlakeHostToolElfCompleteOkSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsSlakeHostToolElfCompleteOk n rest2 kn acc
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

/-- Parse live SlakeHostToolElfCompleteOk.lean text.
    Greppable: parseLiveSlakeHostToolElfCompleteOkSource,
    PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK. -/
def parseLiveSlakeHostToolElfCompleteOkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSlakeHostToolElfCompleteOk liveSlakeHostToolElfCompleteOkParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SlakeHostToolElfCompleteOk", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SlakeHostToolElfCompleteOk parse.
    Greppable: kernelCheckLiveSlakeHostToolElfCompleteOkSource,
    PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK. -/
def kernelCheckLiveSlakeHostToolElfCompleteOkSource (src : String) : Bool :=
  match parseLiveSlakeHostToolElfCompleteOkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSlakeHostToolElfCompleteOkParsed? : Option Module :=
  match parseLiveSlakeHostToolElfCompleteOkSource liveSlakeHostToolElfCompleteOkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSlakeHostToolElfCompleteOkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count.
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped.
    Expected kept commands: import, namespace, stageId, completeOkStage, end. -/
def liveParseCmdCountOk : Bool :=
  match liveSlakeHostToolElfCompleteOkParsed? with
  | some m => m.commands.length >= 5
  | none => false

/-- Live parse has the SlakeHostToolElfCompleteOk namespace command. -/
def liveParseHasSlakeHostToolElfCompleteOkNs : Bool :=
  match liveSlakeHostToolElfCompleteOkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SlakeHostToolElfCompleteOk"
      | _ => false

/-- Live parse keeps the import of thin SystemsLean.CompleteOk. -/
def liveParseHasCompleteOkImport : Bool :=
  match liveSlakeHostToolElfCompleteOkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CompleteOk"
      | _ => false

/-- Live parse has the kernelable string atoms (def_ or defBind).
    Qualified CompleteOk consts, ByteArray bodies, UInt32, ++ strings,
    and theorems skip-fold. Kept atoms: stageId, completeOkStage. -/
def liveParseHasCoreDefs : Bool :=
  match liveSlakeHostToolElfCompleteOkParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "completeOkStage"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSlakeHostToolElfCompleteOkReady,
    PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK,
    HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK.
    Real conjunction: parse plus HostKernel.kernelCheck plus honesty.
    Not hardcoded true. -/
def hostFrontLiveSlakeHostToolElfCompleteOkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_COMPLETE_OK_V0")
    && (hostId == "HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK")
    && (parseId == "PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK")
    && (liveRel == "SlakeHostToolElfCompleteOk.lean")
    && (liveSlakeHostToolElfCompleteOkRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSlakeHostToolElfCompleteOkFullHost
    && !hostFrontLiveSlakeHostToolElfCompleteOkResidualFreeClaimed
    && !hostFrontLiveSlakeHostToolElfCompleteOkProvablyUnlocked
    && (hostFrontLiveSlakeHostToolElfCompleteOkMillCount == 69)
    && (hostFrontLiveSlakeHostToolElfCompleteOkOccupancy == 49)
    && hostFrontLiveSlakeHostToolElfCompleteOkNotOccupancyName50
    && hostFrontLiveSlakeHostToolElfCompleteOkNotMill70
    && !hostFrontLiveSlakeHostToolElfCompleteOkLakeGone
    && kernelCheckLiveSlakeHostToolElfCompleteOkSource liveSlakeHostToolElfCompleteOkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSlakeHostToolElfCompleteOkNs
    && liveParseHasCompleteOkImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSlakeHostToolElfCompleteOkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSlakeHostToolElfCompleteOk (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfCompleteOkRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveSlakeHostToolElfCompleteOkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSlakeHostToolElfCompleteOkRel}"
    throw (IO.userError s!"missing {liveSlakeHostToolElfCompleteOkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSlakeHostToolElfCompleteOkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SlakeHostToolElfCompleteOk.lean != liveSlakeHostToolElfCompleteOkSource"
    throw (IO.userError "dual-pin mismatch live SlakeHostToolElfCompleteOk.lean")
  let r := parseLiveSlakeHostToolElfCompleteOkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SlakeHostToolElfCompleteOk parse false"
      throw (IO.userError "kernelCheck live SlakeHostToolElfCompleteOk parse false")
    unless hostFrontLiveSlakeHostToolElfCompleteOkReady do
      IO.eprintln s!"error: hostFrontLiveSlakeHostToolElfCompleteOkReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasSlakeHostToolElfCompleteOkNs} importOk={liveParseHasCompleteOkImport} core={liveParseHasCoreDefs} noCheck={liveParseHasNoCheckCmd} liveRelOk={liveRel == "SlakeHostToolElfCompleteOk.lean"} kernel={k}"
      throw (IO.userError "hostFrontLiveSlakeHostToolElfCompleteOkReady false")
    IO.println s!"GREEN {stageId}: live SlakeHostToolElfCompleteOk.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSlakeHostToolElfCompleteOk root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk
