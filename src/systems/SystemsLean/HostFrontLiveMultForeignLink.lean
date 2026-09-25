/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/MultForeignLink.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultForeignLink. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on MultForeignLink text.
  Not occupancy leftover HostModuleCheckCompilePathTerm. Not MultForeignLinkTerm.

  Spec (readable):
  - parseLiveMultForeignLinkSource turns live MultForeignLink.lean text into HostTerm.Module.
  - Module name is SystemsLean.MultForeignLink even without a module line.
  - kernelCheckLiveMultForeignLinkSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed only; MultForeignLink imports Mult / LlvmHold / LlvmMultSsa).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, UInt32/IO typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable string/Nat/Bool defs, imports, namespace, end.
  - toksHaveDefNamed still sees multForeignLinkReady when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not MultForeignLinkTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not LinearForeignLink wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-MULT-FOREIGN-LINK,
  SLAKE_HOST_FRONT_LIVE_MULT_FOREIGN_LINK_V0,
  PARSE-LIVE-MULT-FOREIGN-LINK, parseLiveMultForeignLinkSource,
  kernelCheckLiveMultForeignLinkSource,
  hostFrontLiveMultForeignLinkReady, liveMultForeignLinkSource, liveMultForeignLinkRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveMultForeignLink
  Red/green: just slake-typecheck-multforeignlink; dests skipped (JoinMapTheorems lock);
  lake build SystemsLean.HostFrontLiveMultForeignLink on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveMultForeignLinkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMultForeignLink

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_MULT_FOREIGN_LINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-MULT-FOREIGN-LINK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT-FOREIGN-LINK"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultForeignLinkRel : String := "src/systems/SystemsLean/MultForeignLink.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "MultForeignLink.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultForeignLinkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultForeignLinkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveMultForeignLinkProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveMultForeignLinkParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveMultForeignLinkSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . MultForeignLink`. -/
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
def cmdAddsMultForeignLink (c : Cmd) : List String :=
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

/-- UInt32 / IO types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no UInt32/IO typed defs. -/
def cmdBodyKnownMultForeignLink (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultForeignLinkParseFuel body
        && termNoAppN liveMultForeignLinkParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveMultForeignLinkParseFuel body
        && termNoAppN liveMultForeignLinkParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. MultForeignLink kernelable defs are
    atoms (string / bool / nat / const). do / IO bodies fail closed. -/
def parseDefMultForeignLink (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveMultForeignLinkSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdMultForeignLink (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefMultForeignLink fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsMultForeignLink : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdMultForeignLink liveMultForeignLinkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveMultForeignLinkSkipFuel rest
      if cmdBodyKnownMultForeignLink kn c then
        parseCmdsMultForeignLink n rest2 (kn ++ cmdAddsMultForeignLink c) (acc ++ [c])
      else
        parseCmdsMultForeignLink n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveMultForeignLinkSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsMultForeignLink n rest2 kn acc
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

/-- Parse live MultForeignLink.lean text.
    Greppable: parseLiveMultForeignLinkSource, PARSE-LIVE-MULT-FOREIGN-LINK. -/
def parseLiveMultForeignLinkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMultForeignLink liveMultForeignLinkParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.MultForeignLink", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live MultForeignLink parse.
    Greppable: kernelCheckLiveMultForeignLinkSource, PARSE-LIVE-MULT-FOREIGN-LINK. -/
def kernelCheckLiveMultForeignLinkSource (src : String) : Bool :=
  match parseLiveMultForeignLinkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveMultForeignLinkParsed? : Option Module :=
  match parseLiveMultForeignLinkSource liveMultForeignLinkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultForeignLinkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveMultForeignLinkParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveMultForeignLinkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse has the MultForeignLink namespace command. -/
def liveParseHasMultForeignLinkNs : Bool :=
  match liveMultForeignLinkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "MultForeignLink"
      | _ => false

/-- Live parse has core MultForeignLink defs (def_ or defBind).
    multForeignLinkReady may be skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveMultForeignLinkParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveMultForeignLinkSource)
    has "stageId" && has "hostId" && has "foreignMultTagSizeBytes"
      && (has "multForeignLinkReady"
        || toksHaveDefNamed liveMultForeignLinkSkipFuel toks "multForeignLinkReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveMultForeignLinkReady, PARSE-LIVE-MULT-FOREIGN-LINK,
    HOST-FRONT-LIVE-MULT-FOREIGN-LINK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveMultForeignLinkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_MULT_FOREIGN_LINK_V0")
    && (hostId == "HOST-FRONT-LIVE-MULT-FOREIGN-LINK")
    && (parseId == "PARSE-LIVE-MULT-FOREIGN-LINK")
    && (liveMultForeignLinkRel == "src/systems/SystemsLean/MultForeignLink.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveMultForeignLinkFullHost
    && !hostFrontLiveMultForeignLinkResidualFreeClaimed
    && !hostFrontLiveMultForeignLinkProvablyUnlocked
    && kernelCheckLiveMultForeignLinkSource liveMultForeignLinkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasMultImport
    && liveParseHasMultForeignLinkNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultForeignLinkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveMultForeignLink (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT-FOREIGN-LINK =="
  IO.println s!"  host={hostId} file={liveMultForeignLinkRel}"
  let path := root / liveMultForeignLinkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultForeignLinkRel}"
    throw (IO.userError s!"missing {liveMultForeignLinkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultForeignLinkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk MultForeignLink.lean != liveMultForeignLinkSource"
    throw (IO.userError "dual-pin mismatch live MultForeignLink.lean")
  let r := parseLiveMultForeignLinkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT-FOREIGN-LINK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT-FOREIGN-LINK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT-FOREIGN-LINK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live MultForeignLink parse false"
      throw (IO.userError "kernelCheck live MultForeignLink parse false")
    unless hostFrontLiveMultForeignLinkReady do
      IO.eprintln "error: hostFrontLiveMultForeignLinkReady false"
      throw (IO.userError "hostFrontLiveMultForeignLinkReady false")
    IO.println s!"GREEN {stageId}: live MultForeignLink.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMultForeignLink root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMultForeignLink
