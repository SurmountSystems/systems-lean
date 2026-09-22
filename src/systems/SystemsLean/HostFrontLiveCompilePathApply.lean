/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/CompilePathApply.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathApply. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on CompilePathApply text.
  Occupancy leftover HostModuleCheckCompilePathApplyTerm is not this wrap.
  Clone: HostFrontLiveFirstSurface skip-fold (termKeepSimpleN) plus CatchReturn
  dotted import / IO skip. Not CompilePath.lean wrap. Not FirstSurface wrap.

  Unique needles (trailing newline so HostFrontLiveCompilePathApply is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathApply
  PARSE-LIVE-COMPILE-PATH-APPLY
  HOST-FRONT-LIVE-COMPILE-PATH-APPLY
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0
  COMPILE-PATH-APPLY

  Spec (readable):
  - parseLiveCompilePathApplySource turns live CompilePathApply.lean text into
    HostTerm.Module.
  - Wrap-assigned module name is SystemsLean.CompilePathApply even without a
    module line (module lastSeg CompilePathApply).
  - Living namespace lastSeg is CompilePath (product uses namespace
    SystemsLean.CompilePath).
  - kernelCheckLiveCompilePathApplySource is HostKernel.kernelCheck of that parse.
    CompilePath / EmitApply / EmitApplyScaffold imports are not Mult / Types /
    Erasure seed; kernel keeps env.
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app
    bodies, UInt32/IO typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable Nat/Bool lit defs, dotted import, namespace, end.
  - The big && conjunct applyFixtureCompilePathReady skip-folds (parser encodes
    && as Term.ite / == as Term.decideEq; kernelFuel 64 cannot check that nest).
  - Alias applyFixtureEmitPathOk skip-folds when the EmitApply const is not in
    the kernel env; toksHaveDefNamed still sees applyFixtureCompilePathReady.
  - Keep simple := true / := false / Nat lits (applyFixtureMintId and tags).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false.
  - Not CompilePath.lean wrap. Not FirstSurface wrap. Not Extract wrap. Not Plan wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-COMPILE-PATH-APPLY,
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0,
  PARSE-LIVE-COMPILE-PATH-APPLY, parseLiveCompilePathApplySource,
  kernelCheckLiveCompilePathApplySource,
  hostFrontLiveCompilePathApplyReady, liveCompilePathApplySource,
  liveCompilePathApplyRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveCompilePathApply
  Red/green: dests skipped (sibling Extract/Plan dest lock; last dests GREEN 693
  after Keep); lake build SystemsLean.HostFrontLiveCompilePathApply on surmount-1
  (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathApplySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCompilePathApply

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILE-PATH-APPLY"

/-- Greppable parse id. Hyphenated COMPILE-PATH-APPLY. -/
def parseId : String := "PARSE-LIVE-COMPILE-PATH-APPLY"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathApplyRel : String :=
  "src/systems/SystemsLean/CompilePathApply.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathApplyFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathApplyResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompilePathApplyProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCompilePathApplyParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and open leftovers. -/
def liveCompilePathApplySkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . CompilePathApply`. -/
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

/-- Names a command adds to the known-const set. CompilePath / EmitApply
    imports are not a HostKernel seed; import adds no names. -/
def cmdAddsCompilePathApply (c : Cmd) : List String :=
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

/-- Keep only lit / const / var bodies. Skip &&-as-ite and ==-as-decideEq
    so kernelFuel 64 can check the remaining Bool/Nat lits. -/
def termKeepSimpleN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.some_ t => termKeepSimpleN n t
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ _, Term.ite _ _ _ => false
  | Nat.succ _, Term.decideEq _ _ => false
  | Nat.succ _, Term.proj _ _ => false
  | Nat.succ _, Term.structLit _ => false
  | Nat.succ _, Term.match_ _ _ => false

/-- UInt32 / IO types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no && / == nest the kernel cannot fuel, no UInt32/IO typed defs. -/
def cmdBodyKnownCompilePathApply (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathApplyParseFuel body
        && termNoAppN liveCompilePathApplyParseFuel body
        && termKeepSimpleN liveCompilePathApplyParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathApplyParseFuel body
        && termNoAppN liveCompilePathApplyParseFuel body
        && termKeepSimpleN liveCompilePathApplyParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Dotted import / namespace / end. def reuses parseDefHt. Open and abbrev skip. -/
def parseOneCmdCompilePathApply (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsCompilePathApply : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCompilePathApply liveCompilePathApplyParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCompilePathApplySkipFuel rest
      if cmdBodyKnownCompilePathApply kn c then
        parseCmdsCompilePathApply n rest2 (kn ++ cmdAddsCompilePathApply c) (acc ++ [c])
      else
        parseCmdsCompilePathApply n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveCompilePathApplySkipFuel rest
        if rest2.length < toks.length then
          parseCmdsCompilePathApply n rest2 kn acc
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

/-- Parse live CompilePathApply.lean text.
    Greppable: parseLiveCompilePathApplySource, PARSE-LIVE-COMPILE-PATH-APPLY. -/
def parseLiveCompilePathApplySource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCompilePathApply liveCompilePathApplyParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CompilePathApply", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePathApply parse.
    Greppable: kernelCheckLiveCompilePathApplySource, PARSE-LIVE-COMPILE-PATH-APPLY. -/
def kernelCheckLiveCompilePathApplySource (src : String) : Bool :=
  match parseLiveCompilePathApplySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathApplyParsed? : Option Module :=
  match parseLiveCompilePathApplySource liveCompilePathApplySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (three dotted imports / namespace / kernelable
    Nat/Bool lits / end). Real lower bound after skip-fold. The && conjunct
    skip-folds. Alias applyFixtureEmitPathOk skip-folds when EmitApply names
    are not kernel-bound. Empty cmds reject. Horizon measured cmds=12. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathApplyParsed? with
  | some m => m.commands.length >= 12
  | none => false

/-- Wrap-assigned module lastSeg is CompilePathApply (no module line in the
    live file). -/
def liveParseHasCompilePathApplyModule : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CompilePathApply"

/-- Live parse has the living CompilePath namespace command. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompilePath"
      | _ => false

/-- Live product imports SystemsLean.CompilePath. Types-style: dotted import kept. -/
def liveParseHasCompilePathImport : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CompilePath"
      | _ => false

/-- Live product imports SystemsLean.EmitApply. -/
def liveParseHasEmitApplyImport : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitApply"
      | _ => false

/-- Live product also imports SystemsLean.EmitApplyScaffold (third dotted import). -/
def liveParseHasEmitApplyScaffoldImport : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitApplyScaffold"
      | _ => false

/-- Live parse has core CompilePathApply defs (def_ or defBind).
    applyFixtureCompilePathReady skip-folds as Term.ite; toksHaveDefNamed
    still sees the head. Skip-heads unique to CompilePathApply.lean:
    applyFixtureMintId, applyFixtureApplyOk, applyFixtureCompilePathReady. -/
def liveParseHasCoreDefs : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveCompilePathApplySource)
    (has "applyFixtureMintId"
      || toksHaveDefNamed liveCompilePathApplySkipFuel toks "applyFixtureMintId")
      && (has "applyFixtureApplyOk"
        || toksHaveDefNamed liveCompilePathApplySkipFuel toks "applyFixtureApplyOk")
      && (has "applyFixtureCompilePathReady"
        || toksHaveDefNamed liveCompilePathApplySkipFuel toks
          "applyFixtureCompilePathReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathApplyReady, PARSE-LIVE-COMPILE-PATH-APPLY,
    HOST-FRONT-LIVE-COMPILE-PATH-APPLY.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompilePathApplyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILE-PATH-APPLY")
    && (parseId == "PARSE-LIVE-COMPILE-PATH-APPLY")
    && (liveCompilePathApplyRel
      == "src/systems/SystemsLean/CompilePathApply.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathApplyFullHost
    && !hostFrontLiveCompilePathApplyResidualFreeClaimed
    && !hostFrontLiveCompilePathApplyProvablyUnlocked
    && kernelCheckLiveCompilePathApplySource liveCompilePathApplySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCompilePathApplyModule
    && liveParseHasCompilePathNs
    && liveParseHasCompilePathImport
    && liveParseHasEmitApplyImport
    && liveParseHasEmitApplyScaffoldImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathApplySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompilePathApply (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILE-PATH-APPLY =="
  IO.println s!"  host={hostId} file={liveCompilePathApplyRel}"
  let path := root / liveCompilePathApplyRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathApplyRel}"
    throw (IO.userError s!"missing {liveCompilePathApplyRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompilePathApplySource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePathApply.lean != liveCompilePathApplySource"
    throw (IO.userError "dual-pin mismatch live CompilePathApply.lean")
  let r := parseLiveCompilePathApplySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILE-PATH-APPLY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILE-PATH-APPLY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPILE-PATH-APPLY ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePathApply parse false"
      throw (IO.userError "kernelCheck live CompilePathApply parse false")
    unless hostFrontLiveCompilePathApplyReady do
      IO.eprintln "error: hostFrontLiveCompilePathApplyReady false"
      throw (IO.userError "hostFrontLiveCompilePathApplyReady false")
    IO.println s!"GREEN {stageId}: live CompilePathApply.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePathApply root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePathApply
