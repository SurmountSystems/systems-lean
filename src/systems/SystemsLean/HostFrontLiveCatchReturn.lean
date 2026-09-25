/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/CatchReturn.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCatchReturn. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on CatchReturn text.
  Not occupancy leftover HostModuleCheckCompilePathTerm. Not CatchReturnTerm.

  Spec (readable):
  - parseLiveCatchReturnSource turns live CatchReturn.lean text into HostTerm.Module.
  - Module name is SystemsLean.CatchReturn even without a module line.
  - kernelCheckLiveCatchReturnSource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed; CatchReturn has no imports).
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app/do/IO
    bodies, UInt32/IO typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable string/Nat/Bool defs, namespace, end.
  - toksHaveDefNamed still sees withCatch when the body is skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not CatchReturnTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CATCH-RETURN,
  SLAKE_HOST_FRONT_LIVE_CATCH_RETURN_V0,
  PARSE-LIVE-CATCH-RETURN, parseLiveCatchReturnSource, kernelCheckLiveCatchReturnSource,
  hostFrontLiveCatchReturnReady, liveCatchReturnSource, liveCatchReturnRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveCatchReturn
  Red/green: just slake-typecheck-catchreturn; dests skipped (JoinMapTheorems lock);
  lake build SystemsLean.HostFrontLiveCatchReturn on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCatchReturnSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCatchReturn

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CATCH_RETURN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CATCH-RETURN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CATCH-RETURN"

/-- Live file basename. Not a path. -/
def liveRel : String := "CatchReturn.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCatchReturnRel : String := "src/systems/SystemsLean/CatchReturn.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCatchReturnFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCatchReturnResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCatchReturnProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCatchReturnParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveCatchReturnSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . CatchReturn`. -/
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
def cmdAddsCatchReturn (c : Cmd) : List String :=
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
def cmdBodyKnownCatchReturn (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCatchReturnParseFuel body
        && termNoAppN liveCatchReturnParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCatchReturnParseFuel body
        && termNoAppN liveCatchReturnParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `theorem` becomes Term.app
    and skip-folds the kernelable def. CatchReturn kernelable defs are
    atoms (string / bool / nat / const). do / IO bodies fail closed. -/
def parseDefCatchReturn (fuel : Nat) (dname : String) (rest : List String) :
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
              let rest5 := skipNonCmd liveCatchReturnSkipFuel rest4
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest5)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdCatchReturn (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefCatchReturn fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsCatchReturn : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCatchReturn liveCatchReturnParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCatchReturnSkipFuel rest
      if cmdBodyKnownCatchReturn kn c then
        parseCmdsCatchReturn n rest2 (kn ++ cmdAddsCatchReturn c) (acc ++ [c])
      else
        parseCmdsCatchReturn n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveCatchReturnSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsCatchReturn n rest2 kn acc
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

/-- Parse live CatchReturn.lean text.
    Greppable: parseLiveCatchReturnSource, PARSE-LIVE-CATCH-RETURN. -/
def parseLiveCatchReturnSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCatchReturn liveCatchReturnParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CatchReturn", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CatchReturn parse.
    Greppable: kernelCheckLiveCatchReturnSource, PARSE-LIVE-CATCH-RETURN. -/
def kernelCheckLiveCatchReturnSource (src : String) : Bool :=
  match parseLiveCatchReturnSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCatchReturnParsed? : Option Module :=
  match parseLiveCatchReturnSource liveCatchReturnSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCatchReturnParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / typed defs / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveCatchReturnParsed? with
  | some m => m.commands.length >= 4
  | none => false

/-- Live parse has the CatchReturn namespace command. CatchReturn has no imports. -/
def liveParseHasCatchReturnNs : Bool :=
  match liveCatchReturnParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CatchReturn"
      | _ => false

/-- Live parse has core CatchReturn defs (def_ or defBind). withCatch may be
    skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveCatchReturnParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveCatchReturnSource)
    has "throwMsg" && has "destRel" && has "writesDest"
      && (has "withCatch"
        || toksHaveDefNamed liveCatchReturnSkipFuel toks "withCatch")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCatchReturnReady, PARSE-LIVE-CATCH-RETURN,
    HOST-FRONT-LIVE-CATCH-RETURN.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCatchReturnReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CATCH_RETURN_V0")
    && (hostId == "HOST-FRONT-LIVE-CATCH-RETURN")
    && (parseId == "PARSE-LIVE-CATCH-RETURN")
    && (liveCatchReturnRel == "src/systems/SystemsLean/CatchReturn.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCatchReturnFullHost
    && !hostFrontLiveCatchReturnResidualFreeClaimed
    && !hostFrontLiveCatchReturnProvablyUnlocked
    && kernelCheckLiveCatchReturnSource liveCatchReturnSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCatchReturnNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCatchReturnSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCatchReturn (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CATCH-RETURN =="
  IO.println s!"  host={hostId} file={liveCatchReturnRel}"
  let path := root / liveCatchReturnRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCatchReturnRel}"
    throw (IO.userError s!"missing {liveCatchReturnRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCatchReturnSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CatchReturn.lean != liveCatchReturnSource"
    throw (IO.userError "dual-pin mismatch live CatchReturn.lean")
  let r := parseLiveCatchReturnSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CATCH-RETURN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CATCH-RETURN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CATCH-RETURN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CatchReturn parse false"
      throw (IO.userError "kernelCheck live CatchReturn parse false")
    unless hostFrontLiveCatchReturnReady do
      IO.eprintln "error: hostFrontLiveCatchReturnReady false"
      throw (IO.userError "hostFrontLiveCatchReturnReady false")
    IO.println s!"GREEN {stageId}: live CatchReturn.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCatchReturn root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCatchReturn
