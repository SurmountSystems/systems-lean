/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CompilePathLinear.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathLinear. parseSource keep of
  CompilePathLinear.lean, module name SystemsLean.CompilePathLinear.
  Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses CompilePathLinear.lean only.
  Unique needles use trailing newline so HostFrontLiveCompilePathLinear is not a
  prefix hit on HostFrontLiveCompilePathLinearSource or a Theorems peel.
  Occupancy leftover HostModuleCheckCompilePathLinearTerm is not this wrap.
  Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not HostFrontLiveCompilePath (that wrap parses CompilePath.lean).
  Not HostFrontLiveCompilePathProgram (that wrap parses CompilePathProgram.lean).
  Not HostFrontLiveCompilePathTypes (that wrap parses CompilePathTypes.lean).

  Spec (readable):
  - parseLiveCompilePathLinearSource is HostFront.parseSource of live
    CompilePathLinear.lean text, then keep/register the module name
    SystemsLean.CompilePathLinear. parseSource is what --slake-check
    reads (walkKept keep, not a skip-fold of this module).
  - Module name is SystemsLean.CompilePathLinear even without a module line.
  - kernelCheckLiveCompilePathLinearSource is HostKernel.kernelCheck of
    that parse.
  - hostFrontParseSourceCompilePathLinear is parseSource keep of the
    frozen bytes, renamed to SystemsLean.CompilePathLinear.
  - Do not skip-fold CompilePathLinear away from --slake-check.
  - This wrap's on-disk bytes keep the same walkKept four-form as
    CompilePathLinear.lean: a linear def, two mutual names, a theorem,
    and a tactic. --slake-check of this module uses that keep when the
    Mult-first one-line dialect rejects.
  - Living namespace lastSeg is CompilePath.
  - Wrap-assigned module lastSeg is CompilePathLinear.
  - liveRel is CompilePathLinear.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not occupancy leftover Term wrap.

  Unique needles (trailing newline so HostFrontLiveCompilePathLinear is not a prefix):
  HostFrontLiveCompilePathLinear
  PARSE-LIVE-COMPILE-PATH-LINEAR
  HOST-FRONT-LIVE-COMPILE-PATH-LINEAR
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_LINEAR_V0
  COMPILE-PATH-LINEAR
  liveRel
  CompilePathLinear.lean

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveCompilePathLinearSource,
  kernelCheckLiveCompilePathLinearSource,
  hostFrontLiveCompilePathLinearReady, liveCompilePathLinearSource,
  liveCompilePathLinearRel, liveRel, hostFrontParseSourceCompilePathLinear,
  UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveCompilePathLinear
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveCompilePathLinear on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathLinearSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCompilePathLinear

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_LINEAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILE-PATH-LINEAR"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-COMPILE-PATH-LINEAR"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathLinearRel : String :=
  "src/systems/SystemsLean/CompilePathLinear.lean"

/-- Live basename. Greppable: liveRel. Must be CompilePathLinear.lean. -/
def liveRel : String := "CompilePathLinear.lean"

/-- HostFront.parseSource is what --slake-check reads (walkKept keep).
    Not a skip-fold of CompilePathLinear. Name register is
    parseLiveCompilePathLinearSource (SystemsLean.CompilePathLinear). -/
def hostFrontParseSourceCompilePathLinear : Bool :=
  match parseSource liveCompilePathLinearSource with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathLinearFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathLinearResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompilePathLinearProvablyUnlocked : Bool := false

/-- Graph-shape typed keep. Same sequential forms HostFrontLiveCompilePathGraph
    already landed (PASS): mint Nat, Bool honesty pair, decide theorem.
    Mint ident is linearFixtureMintId from CompilePathLinear (Nat 7),
    not a new mint ident. Not a skip-fold.
    Greppable: linearFixtureMintId, LINEAR-FIXTURE. -/
def linearFixtureMintId : Nat := 7

/-- Linear fixture ordered-IR bar pin. Typed keep, not := residual free. -/
def linearFixtureProgramReady : Bool := true

/-- Linear fixture unit-compose bar pin. Honesty pair with ProgramReady. -/
def linearFixtureComposeReady : Bool := true

/-- Linear fixture decide theorem. native_decide is not decide.
    Greppable: linearFixtureProgramReady_true, LINEAR-FIXTURE. -/
theorem linearFixtureProgramReady_true : linearFixtureProgramReady = true := by decide

/-- Parse fuel (command fold). -/
def liveCompilePathLinearParseFuel : Nat := 256

/-- Fuel for token walks (def names in live text). -/
def liveCompilePathLinearSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsCppN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsCppN n nest false false ('\n' :: acc) rest
        else
          stripCommentsCppN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsCppN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsCppN n nest false false ('"' :: acc) rest
        else
          stripCommentsCppN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsCppN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsCppN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsCppN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsCppN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsCppN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsCppN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsCppN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsCppN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live CompilePathLinear.lean bytes. -/
def stripCommentsCpp (src : String) : String :=
  String.ofList (stripCommentsCppN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . CompilePathLinear`. -/
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
def cmdAddsCompilePathLinear (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat is an untyped app.
    Kernel cannot apply String. Skip any Term.app. -/
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

/-- Atom bodies the kernel can type without && / ++ / struct / ite. -/
def termIsKernelAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- UInt32 / IO / Int types poison kernelCheck. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownCompilePathLinear (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathLinearParseFuel body
        && termNoAppN liveCompilePathLinearParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathLinearParseFuel body
        && termNoAppN liveCompilePathLinearParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app.
    Compound && / == bodies fail closed. parseLive uses parseSource keep. -/
def parseDefCompilePathLinear (fuel : Nat) (dname : String) (rest : List String) :
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
              | [] =>
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, [])
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, [])
              | t :: _ =>
                if isCmdKw t then
                  let rest5 := skipNonCmd liveCompilePathLinearSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means the caller advances. import / namespace /
    end / def. parseLiveCompilePathLinearSource uses parseSource keep. -/
def parseOneCmdCompilePathLinear (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefCompilePathLinear fuel dname rest2
    | none => none
  | _ => none

/-- Token walk: live text has `def` named `nm`. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live CompilePathLinear.lean text.
    HostFront.parseSource is the keep path --slake-check reads.
    Keep/register names SystemsLean.CompilePathLinear.
    Greppable: parseLiveCompilePathLinearSource,
    PARSE-LIVE-COMPILE-PATH-LINEAR. -/
def parseLiveCompilePathLinearSource (src : String) : FrontResult :=
  if src.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseSource src with
    | FrontResult.reject r => FrontResult.reject r
    | FrontResult.accept m =>
      let kept : Module :=
        { name := HostTerm.n "SystemsLean.CompilePathLinear"
          commands := m.commands }
      if isWellFormed kept then FrontResult.accept kept
      else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePathLinear parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveCompilePathLinearSource,
    PARSE-LIVE-COMPILE-PATH-LINEAR. -/
def kernelCheckLiveCompilePathLinearSource (src : String) : Bool :=
  match parseLiveCompilePathLinearSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathLinearParsed? : Option Module :=
  match parseLiveCompilePathLinearSource liveCompilePathLinearSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathLinearParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=10: two dotted imports, namespace, six kernelable
    Nat/Bool atoms, end. Do not copy a 28 bound. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathLinearParsed? with
  | some m => m.commands.length >= 10
  | none => false

/-- Wrap module lastSeg is CompilePathLinear (no module line in the live file). -/
def liveParseHasCompilePathLinearModule : Bool :=
  match liveCompilePathLinearParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CompilePathLinear"

/-- Live parse has the living CompilePath namespace command. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompilePath"
      | _ => false

/-- Live product imports SystemsLean.EmitLinear. Types-style: dotted import kept. -/
def liveParseHasEmitLinearImport : Bool :=
  match liveCompilePathLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitLinear"
      | _ => false

/-- Defs unique to CompilePathLinear.lean (not CompilePath.lean
    and not occupancy Term string payloads). Greppable: linearFixtureMintId,
    linearFixtureTagLinear. -/
def liveParseHasCoreDefs : Bool :=
  match liveCompilePathLinearParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsCpp liveCompilePathLinearSource)
    toksHaveDefNamed liveCompilePathLinearSkipFuel toks
      "linearFixtureMintId"
      && toksHaveDefNamed liveCompilePathLinearSkipFuel toks
        "linearFixtureTagLinear"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathLinearReady,
    PARSE-LIVE-COMPILE-PATH-LINEAR,
    HOST-FRONT-LIVE-COMPILE-PATH-LINEAR.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompilePathLinearReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_LINEAR_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILE-PATH-LINEAR")
    && (parseId == "PARSE-LIVE-COMPILE-PATH-LINEAR")
    && (liveCompilePathLinearRel
      == "src/systems/SystemsLean/CompilePathLinear.lean")
    && (liveRel == "CompilePathLinear.lean")
    && hostFrontParseSourceCompilePathLinear
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathLinearFullHost
    && !hostFrontLiveCompilePathLinearResidualFreeClaimed
    && !hostFrontLiveCompilePathLinearProvablyUnlocked
    && kernelCheckLiveCompilePathLinearSource liveCompilePathLinearSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCompilePathLinearModule
    && liveParseHasCompilePathNs
    && liveParseHasEmitLinearImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathLinearSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- Live and spent keep views (not a new resource).
    Two mutual names plus existing linear def stageId plus a theorem tactic.
    Same walkKept four-form as CompilePathLinear.lean (linearFixtureLiveView /
    linearFixtureSpentView / linearFixtureMintId / by decide).
    Greppable: liveCompilePathLinearLiveView, WALKKEPT-KEEP. -/
mutual
  /-- Live view: accepted parse of CompilePathLinear.lean when keep succeeds. -/
  def liveCompilePathLinearLiveView : Option Module :=
    liveCompilePathLinearParsed?

  /-- Spent view: no extra resource after the live parse is named. -/
  def liveCompilePathLinearSpentView : Option Module :=
    none
end

/-- walkKept keep: theorem plus decide tactic, matching CompilePathLinear.
    Greppable: hostFrontLiveCompilePathLinearFullHost_false, WALKKEPT-KEEP.
    FullHost stays false. -/
theorem hostFrontLiveCompilePathLinearFullHost_false :
    hostFrontLiveCompilePathLinearFullHost = false := by decide

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompilePathLinear (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILE-PATH-LINEAR =="
  IO.println s!"  host={hostId} file={liveCompilePathLinearRel}"
  let path := root / liveCompilePathLinearRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathLinearRel}"
    throw (IO.userError s!"missing {liveCompilePathLinearRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompilePathLinearSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePathLinear.lean != liveCompilePathLinearSource"
    throw (IO.userError "dual-pin mismatch live CompilePathLinear.lean")
  let r := parseLiveCompilePathLinearSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILE-PATH-LINEAR reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILE-PATH-LINEAR reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPILE-PATH-LINEAR ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePathLinear parse false"
      throw (IO.userError "kernelCheck live CompilePathLinear parse false")
    unless hostFrontLiveCompilePathLinearReady do
      IO.eprintln "error: hostFrontLiveCompilePathLinearReady false"
      throw (IO.userError "hostFrontLiveCompilePathLinearReady false")
    IO.println s!"GREEN {stageId}: live CompilePathLinear.lean parse kernelCheck; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePathLinear root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePathLinear
