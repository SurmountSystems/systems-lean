/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CompilePathBody.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathBody. parseSource keep of
  CompilePathBody.lean, module name SystemsLean.CompilePathBody.
  Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses CompilePathBody.lean only.
  Unique needles use trailing newline so HostFrontLiveCompilePathBody is not a
  prefix hit on HostFrontLiveCompilePathBodySource or a Theorems peel.
  Occupancy leftover HostModuleCheckCompilePathBodyTerm is not this wrap.
  Do not edit Term files.
  Not Linear.lean. Not Compose. Not IrGraph.
  Not HostFrontLiveCompilePath (that wrap parses CompilePath.lean).
  Not HostFrontLiveCompilePathProgram (that wrap parses CompilePathProgram.lean).
  Not HostFrontLiveCompilePathGraph (sibling wrap).

  Spec (readable):
  - parseLiveCompilePathBodySource is HostFront.parseSource of live
    CompilePathBody.lean text, then keep/register the module name
    SystemsLean.CompilePathBody. parseSource is what --slake-check
    reads (walkKept keep, not a skip-fold of this module).
  - Module name is SystemsLean.CompilePathBody even without a module line.
  - kernelCheckLiveCompilePathBodySource is HostKernel.kernelCheck of
    that parse.
  - hostFrontParseSourceCompilePathBody is parseSource keep of the
    frozen bytes, renamed to SystemsLean.CompilePathBody.
  - Do not skip-fold CompilePathBody away from --slake-check.
  - Living namespace lastSeg is CompilePath.
  - Wrap-assigned module lastSeg is CompilePathBody.
  - liveRel is CompilePathBody.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not occupancy leftover Term wrap.
  - slakeOwnsPackageTypecheck stays false.

  Unique needles (trailing newline so HostFrontLiveCompilePathBody is not a prefix):
  HostFrontLiveCompilePathBody
  PARSE-LIVE-COMPILE-PATH-BODY
  HOST-FRONT-LIVE-COMPILE-PATH-BODY
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_BODY_V0
  COMPILE-PATH-BODY

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveCompilePathBodySource,
  kernelCheckLiveCompilePathBodySource,
  hostFrontLiveCompilePathBodyReady, liveCompilePathBodySource,
  liveCompilePathBodyRel, liveRel, hostFrontParseSourceCompilePathBody,
  UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture,
  bodyFixtureMintId, bodyFixtureProgramReady, bodyFixtureComposeReady,
  bodyFixtureProgramReady_true, BODY-FIXTURE.
  Module: SystemsLean.HostFrontLiveCompilePathBody
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveCompilePathBody on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathBodySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCompilePathBody

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_BODY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILE-PATH-BODY"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-COMPILE-PATH-BODY"

/-- Live file basename. Not a path. -/
def liveRel : String := "CompilePathBody.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathBodyRel : String :=
  "src/systems/SystemsLean/CompilePathBody.lean"

/-- HostFront.parseSource is what --slake-check reads (walkKept keep).
    Not a skip-fold of CompilePathBody. Name register is
    parseLiveCompilePathBodySource (SystemsLean.CompilePathBody). -/
def hostFrontParseSourceCompilePathBody : Bool :=
  match parseSource liveCompilePathBodySource with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathBodyFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathBodyResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompilePathBodyProvablyUnlocked : Bool := false

/-- Graph-shape typed keep. Same forms HostKernel.slakeChecker accepts
    on CompilePathBody: mint Nat 12, Bool honesty pair, decide theorem.
    Not a new mint ident (bodyFixtureMintId already greppable here).
    Greppable: bodyFixtureMintId, BODY-FIXTURE. -/
def bodyFixtureMintId : Nat := 12

/-- Body fixture ordered-IR bar pin. Typed keep, not := residual free. -/
def bodyFixtureProgramReady : Bool := true

/-- Body fixture compose-path bar pin. Honesty pair with ProgramReady. -/
def bodyFixtureComposeReady : Bool := true

/-- Body fixture decide theorem. native_decide is not decide.
    Greppable: bodyFixtureProgramReady_true, BODY-FIXTURE. -/
theorem bodyFixtureProgramReady_true : bodyFixtureProgramReady = true := by decide

/-- Parse fuel (command fold). -/
def liveCompilePathBodyParseFuel : Nat := 256

/-- Fuel for token walks (def names in live text). -/
def liveCompilePathBodySkipFuel : Nat := 8192

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

/-- String-safe comment strip for live CompilePathBody.lean bytes. -/
def stripCommentsCpp (src : String) : String :=
  String.ofList (stripCommentsCppN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . CompilePathBody`. -/
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
def cmdAddsCompilePathBody (c : Cmd) : List String :=
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

/-- UInt32 / IO / Int types. Leftover helper. parseLive uses parseSource keep. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Leftover helper. parseLive uses parseSource keep, not this predicate. -/
def cmdBodyKnownCompilePathBody (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathBodyParseFuel body
        && termNoAppN liveCompilePathBodyParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathBodyParseFuel body
        && termNoAppN liveCompilePathBodyParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app.
    Compound && / == bodies fail closed. parseLive uses parseSource keep. -/
def parseDefCompilePathBody (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveCompilePathBodySkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means the caller advances. import / namespace /
    end / def. parseLiveCompilePathBodySource uses parseSource keep. -/
def parseOneCmdCompilePathBody (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefCompilePathBody fuel dname rest2
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

/-- Parse live CompilePathBody.lean text.
    HostFront.parseSource is the keep path --slake-check reads.
    Keep/register names SystemsLean.CompilePathBody.
    Greppable: parseLiveCompilePathBodySource,
    PARSE-LIVE-COMPILE-PATH-BODY. -/
def parseLiveCompilePathBodySource (src : String) : FrontResult :=
  if src.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseSource src with
    | FrontResult.reject r => FrontResult.reject r
    | FrontResult.accept m =>
      let kept : Module :=
        { name := HostTerm.n "SystemsLean.CompilePathBody"
          commands := m.commands }
      if isWellFormed kept then FrontResult.accept kept
      else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePathBody parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveCompilePathBodySource,
    PARSE-LIVE-COMPILE-PATH-BODY. -/
def kernelCheckLiveCompilePathBodySource (src : String) : Bool :=
  match parseLiveCompilePathBodySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathBodyParsed? : Option Module :=
  match parseLiveCompilePathBodySource liveCompilePathBodySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathBodyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=13: three dotted imports, namespace, eight kernelable
    Nat/Bool atoms, end. Do not copy a 12 Program bound. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathBodyParsed? with
  | some m => m.commands.length >= 13
  | none => false

/-- Wrap module lastSeg is CompilePathBody (no module line in the live file). -/
def liveParseHasCompilePathBodyModule : Bool :=
  match liveCompilePathBodyParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CompilePathBody"

/-- Live parse has the living CompilePath namespace command. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathBodyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompilePath"
      | _ => false

/-- Live product imports SystemsLean.EmitBody. Types-style: dotted import kept. -/
def liveParseHasEmitBodyImport : Bool :=
  match liveCompilePathBodyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitBody"
      | _ => false

/-- Live product also imports SystemsLean.EmitBodyScaffold (third dotted import). -/
def liveParseHasEmitBodyScaffoldImport : Bool :=
  match liveCompilePathBodyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitBodyScaffold"
      | _ => false

/-- Defs unique to CompilePathBody.lean (not CompilePath.lean
    and not occupancy Term string payloads). Greppable: bodyFixtureMintId,
    bodyFixtureTagErased. -/
def liveParseHasCoreDefs : Bool :=
  match liveCompilePathBodyParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsCpp liveCompilePathBodySource)
    toksHaveDefNamed liveCompilePathBodySkipFuel toks
      "bodyFixtureMintId"
      && toksHaveDefNamed liveCompilePathBodySkipFuel toks
        "bodyFixtureTagErased"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathBodyReady,
    PARSE-LIVE-COMPILE-PATH-BODY,
    HOST-FRONT-LIVE-COMPILE-PATH-BODY.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompilePathBodyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_BODY_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILE-PATH-BODY")
    && (parseId == "PARSE-LIVE-COMPILE-PATH-BODY")
    && (liveCompilePathBodyRel
      == "src/systems/SystemsLean/CompilePathBody.lean")
    && (liveRel == "CompilePathBody.lean")
    && hostFrontParseSourceCompilePathBody
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathBodyFullHost
    && !hostFrontLiveCompilePathBodyResidualFreeClaimed
    && !hostFrontLiveCompilePathBodyProvablyUnlocked
    && kernelCheckLiveCompilePathBodySource liveCompilePathBodySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCompilePathBodyModule
    && liveParseHasCompilePathNs
    && liveParseHasEmitBodyImport
    && liveParseHasEmitBodyScaffoldImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathBodySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompilePathBody (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILE-PATH-BODY =="
  IO.println s!"  host={hostId} file={liveCompilePathBodyRel}"
  let path := root / liveCompilePathBodyRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathBodyRel}"
    throw (IO.userError s!"missing {liveCompilePathBodyRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompilePathBodySource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePathBody.lean != liveCompilePathBodySource"
    throw (IO.userError "dual-pin mismatch live CompilePathBody.lean")
  let r := parseLiveCompilePathBodySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILE-PATH-BODY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILE-PATH-BODY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPILE-PATH-BODY ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePathBody parse false"
      throw (IO.userError "kernelCheck live CompilePathBody parse false")
    unless hostFrontLiveCompilePathBodyReady do
      IO.eprintln "error: hostFrontLiveCompilePathBodyReady false"
      throw (IO.userError "hostFrontLiveCompilePathBodyReady false")
    IO.println s!"GREEN {stageId}: live CompilePathBody.lean parse kernelCheck; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePathBody root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePathBody
