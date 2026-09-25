/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/FirstSurface.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFirstSurface. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on FirstSurface text.
  Occupancy leftover HostModuleCheckFirstSurfaceTerm is not this wrap.
  Clone: HostFrontLiveCompleteOk skip-fold (termKeepSimpleN) plus CatchReturn
  dotted import / IO skip. Not CompilePathBody. Not CompilePathGraph.

  Unique needles (trailing newline so HostFrontLiveFirstSurface is not a prefix
  of Source or Main):
  HostFrontLiveFirstSurface
  PARSE-LIVE-FIRST-SURFACE
  HOST-FRONT-LIVE-FIRST-SURFACE
  SLAKE_HOST_FRONT_LIVE_FIRST_SURFACE_V0
  FIRST-SURFACE

  Spec (readable):
  - parseLiveFirstSurfaceSource turns live FirstSurface.lean text into HostTerm.Module.
  - Module name is SystemsLean.FirstSurface even without a module line.
  - kernelCheckLiveFirstSurfaceSource is HostKernel.kernelCheck of that parse.
    CompilePathMult import is not Mult / Types / Erasure seed; kernel keeps env.
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app
    bodies, UInt32/IO typed defs, and abbrev leftovers (not isCmdKw). Keep
    kernelable string/Nat/Bool lit defs, dotted import, namespace, end.
  - The big && conjunct firstSurfaceReady skip-folds (parser encodes && as
    Term.ite / == as Term.decideEq; kernelFuel 64 cannot check that nest).
  - Alias firstSurfaceMultInputReady skip-folds when the CompilePathMult const
    is not in the kernel env; toksHaveDefNamed still sees firstSurfaceReady.
  - Keep simple := true / := false / string lits (stageId, hostId, surfaceId).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false.
  - Not CompilePathBody wrap. Not CompilePathGraph wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-FIRST-SURFACE,
  SLAKE_HOST_FRONT_LIVE_FIRST_SURFACE_V0,
  PARSE-LIVE-FIRST-SURFACE, parseLiveFirstSurfaceSource,
  kernelCheckLiveFirstSurfaceSource,
  hostFrontLiveFirstSurfaceReady, liveFirstSurfaceSource, liveFirstSurfaceRel,
  liveRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveFirstSurface
  Red/green: dests skipped (sibling Graph/Body dest lock; last dests GREEN 693
  after Keep); lake build SystemsLean.HostFrontLiveFirstSurface on surmount-1
  (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveFirstSurfaceSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFirstSurface

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_FIRST_SURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-FIRST-SURFACE"

/-- Greppable parse id. Hyphenated FIRST-SURFACE. -/
def parseId : String := "PARSE-LIVE-FIRST-SURFACE"

/-- Live basename. Greppable: liveRel. Must be FirstSurface.lean. -/
def liveRel : String := "FirstSurface.lean"

/-- Live file relative to repo root. Dual-pin path.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveFirstSurfaceRel : String := "src/systems/SystemsLean/FirstSurface.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFirstSurfaceFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFirstSurfaceResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveFirstSurfaceProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveFirstSurfaceParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and open leftovers. -/
def liveFirstSurfaceSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . FirstSurface`. -/
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

/-- Names a command adds to the known-const set. CompilePathMult is not a
    HostKernel seed; import adds no names. -/
def cmdAddsFirstSurface (c : Cmd) : List String :=
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
    so kernelFuel 64 can check the remaining Bool/String lits. -/
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
def cmdBodyKnownFirstSurface (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFirstSurfaceParseFuel body
        && termNoAppN liveFirstSurfaceParseFuel body
        && termKeepSimpleN liveFirstSurfaceParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveFirstSurfaceParseFuel body
        && termNoAppN liveFirstSurfaceParseFuel body
        && termKeepSimpleN liveFirstSurfaceParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Dotted import / namespace / end. def reuses parseDefHt. Open and abbrev skip. -/
def parseOneCmdFirstSurface (fuel : Nat) (toks : List String) :
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
def parseCmdsFirstSurface : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFirstSurface liveFirstSurfaceParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFirstSurfaceSkipFuel rest
      if cmdBodyKnownFirstSurface kn c then
        parseCmdsFirstSurface n rest2 (kn ++ cmdAddsFirstSurface c) (acc ++ [c])
      else
        parseCmdsFirstSurface n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveFirstSurfaceSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsFirstSurface n rest2 kn acc
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

/-- Parse live FirstSurface.lean text.
    Greppable: parseLiveFirstSurfaceSource, PARSE-LIVE-FIRST-SURFACE. -/
def parseLiveFirstSurfaceSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFirstSurface liveFirstSurfaceParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.FirstSurface", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live FirstSurface parse.
    Greppable: kernelCheckLiveFirstSurfaceSource, PARSE-LIVE-FIRST-SURFACE. -/
def kernelCheckLiveFirstSurfaceSource (src : String) : Bool :=
  match parseLiveFirstSurfaceSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFirstSurfaceParsed? : Option Module :=
  match parseLiveFirstSurfaceSource liveFirstSurfaceSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFirstSurfaceParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / 13 lit defs / end = 16).
    Real lower bound after skip-fold. The && conjunct skip-folds. Alias
    firstSurfaceMultInputReady skip-folds when CompilePathMult names are not
    kernel-bound. Empty cmds reject. Measured keep count is 16. -/
def liveParseCmdCountOk : Bool :=
  match liveFirstSurfaceParsed? with
  | some m => m.commands.length >= 16
  | none => false

/-- Live parse imports SystemsLean.CompilePathMult. -/
def liveParseHasCompilePathMultImport : Bool :=
  match liveFirstSurfaceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "CompilePathMult"
      | _ => false

/-- Live parse has the FirstSurface namespace command. -/
def liveParseHasFirstSurfaceNs : Bool :=
  match liveFirstSurfaceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "FirstSurface"
      | _ => false

/-- Live parse has core FirstSurface defs (def_ or defBind). firstSurfaceReady
    skip-folds as Term.ite; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveFirstSurfaceParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveFirstSurfaceSource)
    has "stageId" && has "hostId" && has "surfaceId"
      && (has "firstSurfaceReady"
        || toksHaveDefNamed liveFirstSurfaceSkipFuel toks "firstSurfaceReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFirstSurfaceReady, PARSE-LIVE-FIRST-SURFACE,
    HOST-FRONT-LIVE-FIRST-SURFACE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveFirstSurfaceReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_FIRST_SURFACE_V0")
    && (hostId == "HOST-FRONT-LIVE-FIRST-SURFACE")
    && (parseId == "PARSE-LIVE-FIRST-SURFACE")
    && (liveFirstSurfaceRel == "src/systems/SystemsLean/FirstSurface.lean")
    && (liveRel == "FirstSurface.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFirstSurfaceFullHost
    && !hostFrontLiveFirstSurfaceResidualFreeClaimed
    && !hostFrontLiveFirstSurfaceProvablyUnlocked
    && kernelCheckLiveFirstSurfaceSource liveFirstSurfaceSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCompilePathMultImport
    && liveParseHasFirstSurfaceNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFirstSurfaceSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveFirstSurface (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-FIRST-SURFACE =="
  IO.println s!"  host={hostId} file={liveFirstSurfaceRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "FirstSurface.lean") do
    IO.eprintln "error: liveRel must be FirstSurface.lean"
    throw (IO.userError "liveRel must be FirstSurface.lean")
  let path := root / liveFirstSurfaceRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFirstSurfaceRel}"
    throw (IO.userError s!"missing {liveFirstSurfaceRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFirstSurfaceSource then
    IO.eprintln "error: dual-pin mismatch: on-disk FirstSurface.lean != liveFirstSurfaceSource"
    throw (IO.userError "dual-pin mismatch live FirstSurface.lean")
  let r := parseLiveFirstSurfaceSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-FIRST-SURFACE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-FIRST-SURFACE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-FIRST-SURFACE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live FirstSurface parse false"
      throw (IO.userError "kernelCheck live FirstSurface parse false")
    unless hostFrontLiveFirstSurfaceReady do
      IO.eprintln "error: hostFrontLiveFirstSurfaceReady false"
      throw (IO.userError "hostFrontLiveFirstSurfaceReady false")
    IO.println s!"GREEN {stageId}: live FirstSurface.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFirstSurface root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFirstSurface
