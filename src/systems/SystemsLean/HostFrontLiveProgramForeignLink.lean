/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/ProgramForeignLink.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProgramForeignLink. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on ProgramForeignLink text.
  Not occupancy leftover HostModuleCheckCompilePathTerm. Not ProgramForeignLinkTerm.

  Spec (readable):
  - parseLiveProgramForeignLinkSource turns live ProgramForeignLink.lean text into HostTerm.Module.
  - Module name is SystemsLean.ProgramForeignLink even without a module line.
  - kernelCheckLiveProgramForeignLinkSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; ProgramForeignLink imports IrProgram / LlvmHold / LlvmProgramSsa).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, UInt32/IO typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable string/Nat/Bool defs, imports, namespace, end.
  - toksHaveDefNamed still sees programForeignLinkReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not ProgramForeignLinkTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not LinearForeignLink wrap.
  - Not MultForeignLink wrap. Not TypesForeignLink wrap. Not ForeignLink.lean.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PROGRAM-FOREIGN-LINK,
  SLAKE_HOST_FRONT_LIVE_PROGRAM_FOREIGN_LINK_V0, PROGRAM-FOREIGN-LINK,
  PARSE-LIVE-PROGRAM-FOREIGN-LINK, parseLiveProgramForeignLinkSource,
  kernelCheckLiveProgramForeignLinkSource,
  hostFrontLiveProgramForeignLinkReady, liveProgramForeignLinkSource, liveProgramForeignLinkRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveProgramForeignLink
  Red/green: just slake-typecheck-programforeignlink; dests skipped (TypesForeignLink lock);
  lake build SystemsLean.HostFrontLiveProgramForeignLink on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProgramForeignLinkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProgramForeignLink

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PROGRAM_FOREIGN_LINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PROGRAM-FOREIGN-LINK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PROGRAM-FOREIGN-LINK"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProgramForeignLinkRel : String := "src/systems/SystemsLean/ProgramForeignLink.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProgramForeignLinkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProgramForeignLinkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProgramForeignLinkProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProgramForeignLinkParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveProgramForeignLinkSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . ProgramForeignLink`. -/
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
def cmdAddsProgramForeignLink (c : Cmd) : List String :=
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

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold.
    Int is HostType.named, and litNat infers HostType.nat. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO"
        || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no UInt32/IO/Int typed defs. -/
def cmdBodyKnownProgramForeignLink (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProgramForeignLinkParseFuel body
        && termNoAppN liveProgramForeignLinkParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProgramForeignLinkParseFuel body
        && termNoAppN liveProgramForeignLinkParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. ProgramForeignLink kernelable defs are
    atoms (string / bool / nat / const). do / IO bodies fail closed. -/
def parseDefProgramForeignLink (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveProgramForeignLinkSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdProgramForeignLink (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefProgramForeignLink fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsProgramForeignLink : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProgramForeignLink liveProgramForeignLinkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProgramForeignLinkSkipFuel rest
      if cmdBodyKnownProgramForeignLink kn c then
        parseCmdsProgramForeignLink n rest2 (kn ++ cmdAddsProgramForeignLink c) (acc ++ [c])
      else
        parseCmdsProgramForeignLink n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveProgramForeignLinkSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsProgramForeignLink n rest2 kn acc
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

/-- Parse live ProgramForeignLink.lean text.
    Greppable: parseLiveProgramForeignLinkSource, PARSE-LIVE-PROGRAM-FOREIGN-LINK. -/
def parseLiveProgramForeignLinkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProgramForeignLink liveProgramForeignLinkParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProgramForeignLink", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProgramForeignLink parse.
    Greppable: kernelCheckLiveProgramForeignLinkSource, PARSE-LIVE-PROGRAM-FOREIGN-LINK. -/
def kernelCheckLiveProgramForeignLinkSource (src : String) : Bool :=
  match parseLiveProgramForeignLinkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProgramForeignLinkParsed? : Option Module :=
  match parseLiveProgramForeignLinkSource liveProgramForeignLinkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProgramForeignLinkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveProgramForeignLinkParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.IrProgram. -/
def liveParseHasIrProgramImport : Bool :=
  match liveProgramForeignLinkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "IrProgram"
      | _ => false

/-- Live parse has the ProgramForeignLink namespace command. -/
def liveParseHasProgramForeignLinkNs : Bool :=
  match liveProgramForeignLinkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProgramForeignLink"
      | _ => false

/-- Live parse has core ProgramForeignLink defs (def_ or defBind).
    programForeignLinkReady is skip-folded (`&&` body). Kept atoms:
    stageId, hostId, foreignProgramTagSizeBytes, justRecipeProgramForeignLink. -/
def liveParseHasCoreDefs : Bool :=
  match liveProgramForeignLinkParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "hostId" && has "foreignProgramTagSizeBytes"
      && has "justRecipeProgramForeignLink"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProgramForeignLinkReady, PARSE-LIVE-PROGRAM-FOREIGN-LINK,
    HOST-FRONT-LIVE-PROGRAM-FOREIGN-LINK, PROGRAM-FOREIGN-LINK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveProgramForeignLinkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PROGRAM_FOREIGN_LINK_V0")
    && (hostId == "HOST-FRONT-LIVE-PROGRAM-FOREIGN-LINK")
    && (parseId == "PARSE-LIVE-PROGRAM-FOREIGN-LINK")
    && (liveProgramForeignLinkRel == "src/systems/SystemsLean/ProgramForeignLink.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProgramForeignLinkFullHost
    && !hostFrontLiveProgramForeignLinkResidualFreeClaimed
    && !hostFrontLiveProgramForeignLinkProvablyUnlocked
    && kernelCheckLiveProgramForeignLinkSource liveProgramForeignLinkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasIrProgramImport
    && liveParseHasProgramForeignLinkNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProgramForeignLinkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProgramForeignLink (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PROGRAM-FOREIGN-LINK =="
  IO.println s!"  host={hostId} file={liveProgramForeignLinkRel}"
  let path := root / liveProgramForeignLinkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProgramForeignLinkRel}"
    throw (IO.userError s!"missing {liveProgramForeignLinkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProgramForeignLinkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProgramForeignLink.lean != liveProgramForeignLinkSource"
    throw (IO.userError "dual-pin mismatch live ProgramForeignLink.lean")
  let r := parseLiveProgramForeignLinkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PROGRAM-FOREIGN-LINK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PROGRAM-FOREIGN-LINK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PROGRAM-FOREIGN-LINK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProgramForeignLink parse false"
      throw (IO.userError "kernelCheck live ProgramForeignLink parse false")
    unless hostFrontLiveProgramForeignLinkReady do
      IO.eprintln "error: hostFrontLiveProgramForeignLinkReady false"
      throw (IO.userError "hostFrontLiveProgramForeignLinkReady false")
    IO.println s!"GREEN {stageId}: live ProgramForeignLink.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProgramForeignLink root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProgramForeignLink
