/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/BootstrapHonesty.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveBootstrapHonesty. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on BootstrapHonesty text.
  Not occupancy leftover HostModuleCheckCompilePathTerm. Not BootstrapHonestyTheorems.

  Spec (readable):
  - parseLiveBootstrapHonestySource turns live BootstrapHonesty.lean text into HostTerm.Module.
  - Module name is SystemsLean.BootstrapHonesty even without a module line.
  - kernelCheckLiveBootstrapHonestySource is HostKernel.kernelCheck of that parse
    (not kernelCheckN import-seed; BootstrapHonesty has no imports).
  - Skip un-kernelable == / && bodies. Keep kernelable string and Bool atom defs,
    namespace, end.
  - toksHaveDefNamed still sees productPathBootstrapSurfaceOk and
    productPathHostLakeBootstrapPartialReady when those bodies are skipped.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not BootstrapHonestyTheorems.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-BOOTSTRAP-HONESTY,
  SLAKE_HOST_FRONT_LIVE_BOOTSTRAP_HONESTY_V0,
  PARSE-LIVE-BOOTSTRAP-HONESTY, parseLiveBootstrapHonestySource,
  kernelCheckLiveBootstrapHonestySource,
  hostFrontLiveBootstrapHonestyReady, liveBootstrapHonestySource, liveBootstrapHonestyRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveBootstrapHonesty
  Red/green: just slake-typecheck-bootstraphonesty; dests skipped;
  lake build SystemsLean.HostFrontLiveBootstrapHonesty on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveBootstrapHonestySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveBootstrapHonesty

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_BOOTSTRAP_HONESTY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-BOOTSTRAP-HONESTY"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-BOOTSTRAP-HONESTY"

/-- Live file relative to repo root. Dual-pin path. -/
def liveBootstrapHonestyRel : String := "src/systems/SystemsLean/BootstrapHonesty.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveBootstrapHonestyFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveBootstrapHonestyResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveBootstrapHonestyProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveBootstrapHonestyParseFuel : Nat := 256

/-- Skip fuel for un-kernelable tails. -/
def liveBootstrapHonestySkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . BootstrapHonesty`. -/
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
def cmdAddsBootstrapHonesty (c : Cmd) : List String :=
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
def cmdBodyKnownBootstrapHonesty (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveBootstrapHonestyParseFuel body
        && termNoAppN liveBootstrapHonestyParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveBootstrapHonestyParseFuel body
        && termNoAppN liveBootstrapHonestyParseFuel body
  | _ => true

/-- Literal, const, or var. decideEq / ite / app are not atoms. -/
def termIsPureAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- True when nothing remains, or the next token is a command keyword.
    A following `&&` or `==` means the body is not one atom. -/
def restAtCmd : List String -> Bool
  | [] => true
  | t :: _ => isCmdKw t

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: `==` and `&&` become decideEq / ite, which are not atom
    bodies. A prefix atom followed by `&&` returns none so the caller
    skips the whole def. String and Bool literals still enter. -/
def parseDefBootstrapHonesty (fuel : Nat) (dname : String) (rest : List String) :
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
              if termIsPureAtom body && restAtCmd rest4 then
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest4)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest4)
              else
                none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open and abbrev skip. -/
def parseOneCmdBootstrapHonesty (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefBootstrapHonesty fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip un-kernelable defs (`==` / `&&` bodies). -/
def parseCmdsBootstrapHonesty : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdBootstrapHonesty liveBootstrapHonestyParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveBootstrapHonestySkipFuel rest
      if cmdBodyKnownBootstrapHonesty kn c then
        parseCmdsBootstrapHonesty n rest2 (kn ++ cmdAddsBootstrapHonesty c) (acc ++ [c])
      else
        parseCmdsBootstrapHonesty n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveBootstrapHonestySkipFuel rest
        if rest2.length < toks.length then
          parseCmdsBootstrapHonesty n rest2 kn acc
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

/-- Parse live BootstrapHonesty.lean text.
    Greppable: parseLiveBootstrapHonestySource, PARSE-LIVE-BOOTSTRAP-HONESTY. -/
def parseLiveBootstrapHonestySource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsBootstrapHonesty liveBootstrapHonestyParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.BootstrapHonesty", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live BootstrapHonesty parse.
    Greppable: kernelCheckLiveBootstrapHonestySource, PARSE-LIVE-BOOTSTRAP-HONESTY. -/
def kernelCheckLiveBootstrapHonestySource (src : String) : Bool :=
  match parseLiveBootstrapHonestySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveBootstrapHonestyParsed? : Option Module :=
  match parseLiveBootstrapHonestySource liveBootstrapHonestySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveBootstrapHonestyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / atom defs / end).
    Real lower bound, not hardcoded true. `==` / `&&` defs are skipped.
    Namespace + 10 atom defs + end is 12. -/
def liveParseCmdCountOk : Bool :=
  match liveBootstrapHonestyParsed? with
  | some m => m.commands.length >= 12
  | none => false

/-- Live parse has the BootstrapHonesty namespace command. BootstrapHonesty has no imports. -/
def liveParseHasBootstrapHonestyNs : Bool :=
  match liveBootstrapHonestyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "BootstrapHonesty"
      | _ => false

/-- Live parse has kernelable atom defs as Cmd.def_. The two `==` / `&&`
    defs stay out of the module; toksHaveDefNamed still sees their names. -/
def liveParseHasCoreDefs : Bool :=
  match liveBootstrapHonestyParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    let anyDef (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveBootstrapHonestySource)
    let skipped (nm : String) : Bool :=
      !anyDef nm && toksHaveDefNamed liveBootstrapHonestySkipFuel toks nm
    has "stageId" && has "hostId" && has "selfHostId"
      && has "bootstrapHonestyModuleCite" && has "productOutPath"
      && has "hostLakeEmitWriterPath" && has "hostLakeEmitExe"
      && has "hostLakeEmitStageCite" && has "acceptancePath"
      && has "productPathHostLakeBootstrapRemains"
      && skipped "productPathBootstrapSurfaceOk"
      && skipped "productPathHostLakeBootstrapPartialReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveBootstrapHonestyReady, PARSE-LIVE-BOOTSTRAP-HONESTY,
    HOST-FRONT-LIVE-BOOTSTRAP-HONESTY.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveBootstrapHonestyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_BOOTSTRAP_HONESTY_V0")
    && (hostId == "HOST-FRONT-LIVE-BOOTSTRAP-HONESTY")
    && (parseId == "PARSE-LIVE-BOOTSTRAP-HONESTY")
    && (liveBootstrapHonestyRel == "src/systems/SystemsLean/BootstrapHonesty.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveBootstrapHonestyFullHost
    && !hostFrontLiveBootstrapHonestyResidualFreeClaimed
    && !hostFrontLiveBootstrapHonestyProvablyUnlocked
    && kernelCheckLiveBootstrapHonestySource liveBootstrapHonestySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasBootstrapHonestyNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveBootstrapHonestySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveBootstrapHonesty (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-BOOTSTRAP-HONESTY =="
  IO.println s!"  host={hostId} file={liveBootstrapHonestyRel} liveRel={liveBootstrapHonestyRel}"
  let path := root / liveBootstrapHonestyRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveBootstrapHonestyRel}"
    throw (IO.userError s!"missing {liveBootstrapHonestyRel}")
  let disk <- IO.FS.readFile path
  if disk != liveBootstrapHonestySource then
    IO.eprintln "error: dual-pin mismatch: on-disk BootstrapHonesty.lean != liveBootstrapHonestySource"
    throw (IO.userError "dual-pin mismatch live BootstrapHonesty.lean")
  let r := parseLiveBootstrapHonestySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-BOOTSTRAP-HONESTY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-BOOTSTRAP-HONESTY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-BOOTSTRAP-HONESTY ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live BootstrapHonesty parse false"
      throw (IO.userError "kernelCheck live BootstrapHonesty parse false")
    unless hostFrontLiveBootstrapHonestyReady do
      IO.eprintln "error: hostFrontLiveBootstrapHonestyReady false"
      throw (IO.userError "hostFrontLiveBootstrapHonestyReady false")
    IO.println s!"GREEN {stageId}: live BootstrapHonesty.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveBootstrapHonesty root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveBootstrapHonesty
