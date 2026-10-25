/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CompilePathCompose.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathCompose. parseSource keep of
  CompilePathCompose.lean, module name SystemsLean.CompilePathCompose.
  Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on CompilePathCompose text.
  This wrap parses CompilePathCompose.lean only.
  Unique needles use trailing newline so HostFrontLiveCompilePathCompose is not a
  prefix hit on HostFrontLiveCompilePathComposeSource or a Theorems peel.
  Occupancy leftover HostModuleCheckCompilePathComposeTerm is not this wrap.
  Do not edit Term files.
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.
  Not HostFrontLiveCompilePath (that wrap parses CompilePath.lean).
  Not HostFrontLiveCompilePathGraph (that wrap parses CompilePathGraph.lean).
  Not HostFrontLiveCompilePathExtract (that wrap parses CompilePathExtract.lean).
  Not HostFrontLiveCompilePathPlan (that wrap parses CompilePathPlan.lean).
  Not HostFrontLiveCompilePathApply. Not HostFrontLiveCompilePathErasure.

  Spec (readable):
  - parseLiveCompilePathComposeSource is HostFront.parseSource of live
    CompilePathCompose.lean text, then keep/register the module name
    SystemsLean.CompilePathCompose. parseSource is what --slake-check
    reads (walkKept keep, not a skip-fold of this module).
  - Wrap-assigned module name is SystemsLean.CompilePathCompose even without a
    module line (module lastSeg CompilePathCompose).
  - Living namespace lastSeg is CompilePath (product uses namespace
    SystemsLean.CompilePath).
  - kernelCheckLiveCompilePathComposeSource is HostKernel.kernelCheck of that parse.
  - hostFrontParseSourceCompilePathCompose is parseSource keep of the
    frozen bytes, renamed to SystemsLean.CompilePathCompose.
  - Graph-shape sequential keep on this on-disk module matching
    CompilePathCompose: composeFixtureMintId (Nat 9),
    lowerComposeFixtureCompose, composeFixtureLiveView,
    composeFixtureSpentView, keep lowerComposeFixtureCompose_isSome
    with decide. Sequential, not mutual.
  - Do not skip-fold CompilePathCompose away from --slake-check.
  - liveRel is CompilePathCompose.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / ComposeSubsetEmit / IrGraph parsers.
  - Not occupancy leftover Term wrap.

  Unique needles (trailing newline so HostFrontLiveCompilePathCompose is not a prefix):
  HostFrontLiveCompilePathCompose
  PARSE-LIVE-COMPILE-PATH-COMPOSE
  HOST-FRONT-LIVE-COMPILE-PATH-COMPOSE
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_COMPOSE_V0
  COMPILE-PATH-COMPOSE

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveCompilePathComposeSource,
  kernelCheckLiveCompilePathComposeSource,
  hostFrontLiveCompilePathComposeReady, liveCompilePathComposeSource,
  liveCompilePathComposeRel, liveRel, hostFrontParseSourceCompilePathCompose,
  composeFixtureMintId, composeFixtureLiveView, composeFixtureSpentView,
  lowerComposeFixtureCompose, lowerComposeFixtureCompose_isSome,
  UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveCompilePathCompose
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveCompilePathCompose on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathComposeSource
import SystemsLean.HostKernel
import SystemsLean.HostCompose

namespace SystemsLean.HostFrontLiveCompilePathCompose

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm
open SystemsLean.HostCompose (Host)

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_COMPOSE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILE-PATH-COMPOSE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-COMPILE-PATH-COMPOSE"

/-- Live file basename. Not a path. -/
def liveRel : String := "CompilePathCompose.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathComposeRel : String :=
  "src/systems/SystemsLean/CompilePathCompose.lean"

/-- HostFront.parseSource is what --slake-check reads (walkKept keep).
    Not a skip-fold of CompilePathCompose. Name register is
    parseLiveCompilePathComposeSource (SystemsLean.CompilePathCompose). -/
def hostFrontParseSourceCompilePathCompose : Bool :=
  match parseSource liveCompilePathComposeSource with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathComposeFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathComposeResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompilePathComposeProvablyUnlocked : Bool := false

/-- Fixed Compose fixture mint id (nonzero; Graph 8, Compose 9). -/
def composeFixtureMintId : Nat := 9

/-- Mint-id honesty: Compose fixture uses 9. -/
theorem composeFixtureMintId_eq : composeFixtureMintId = 9 := rfl

/-- Compose fixture host ready for unit compile path.
    mint MULT-1 live token on empty compose. FAIL-CLOSED: none if mint fails.
    Greppable: lowerComposeFixtureCompose, HOST-COMPOSE. -/
def lowerComposeFixtureCompose : Option Host :=
  match HostCompose.mint HostCompose.empty composeFixtureMintId with
  | HostCompose.MintResult.ok hc' => some hc'
  | _ => none

/-- Live view: minted MULT-1 host (ConsumeToken). -/
def composeFixtureLiveView : Option Host :=
  lowerComposeFixtureCompose

/-- Spent view: ConsumeToken consume of composeFixtureLiveView. -/
def composeFixtureSpentView : Option Host :=
  match composeFixtureLiveView with
  | none => none
  | some hcLive =>
      match HostCompose.consume hcLive with
      | HostCompose.ConsumeResult.ok hcSpent _ => some hcSpent
      | HostCompose.ConsumeResult.notLive => none

/-- lowerComposeFixtureCompose is some (mint path).
    Greppable: lowerComposeFixtureCompose_isSome. -/
theorem lowerComposeFixtureCompose_isSome :
    lowerComposeFixtureCompose.isSome = true := by decide

/-- Parse fuel (command fold). -/
def liveCompilePathComposeParseFuel : Nat := 256

/-- Fuel for token walks (def names in live text). -/
def liveCompilePathComposeSkipFuel : Nat := 8192

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

/-- String-safe comment strip for live CompilePathCompose.lean bytes. -/
def stripCommentsCpp (src : String) : String :=
  String.ofList (stripCommentsCppN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . CompilePathCompose`. -/
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
def cmdAddsCompilePathCompose (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat is an untyped app.
    Kernel cannot apply String. Leftover helper. parseLive uses parseSource keep. -/
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

/-- Atom bodies the kernel can type without && / ++ / struct / ite.
    Leftover helper. parseLive uses parseSource keep. -/
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
def cmdBodyKnownCompilePathCompose (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathComposeParseFuel body
        && termNoAppN liveCompilePathComposeParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathComposeParseFuel body
        && termNoAppN liveCompilePathComposeParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app.
    Compound && / == bodies fail closed. parseLive uses parseSource keep. -/
def parseDefCompilePathCompose (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveCompilePathComposeSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means the caller advances. import / namespace /
    end / def. parseLiveCompilePathComposeSource uses parseSource keep. -/
def parseOneCmdCompilePathCompose (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefCompilePathCompose fuel dname rest2
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

/-- Parse live CompilePathCompose.lean text.
    HostFront.parseSource is the keep path --slake-check reads.
    Keep/register names SystemsLean.CompilePathCompose.
    Greppable: parseLiveCompilePathComposeSource,
    PARSE-LIVE-COMPILE-PATH-COMPOSE. -/
def parseLiveCompilePathComposeSource (src : String) : FrontResult :=
  if src.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseSource src with
    | FrontResult.reject r => FrontResult.reject r
    | FrontResult.accept m =>
      let kept : Module :=
        { name := HostTerm.n "SystemsLean.CompilePathCompose"
          commands := m.commands }
      if isWellFormed kept then FrontResult.accept kept
      else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePathCompose parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveCompilePathComposeSource,
    PARSE-LIVE-COMPILE-PATH-COMPOSE. -/
def kernelCheckLiveCompilePathComposeSource (src : String) : Bool :=
  match parseLiveCompilePathComposeSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathComposeParsed? : Option Module :=
  match parseLiveCompilePathComposeSource liveCompilePathComposeSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathComposeParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=12: two dotted imports, namespace, eight kernelable
    Nat/Bool atoms, end. Do not copy a 9 Extract bound. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathComposeParsed? with
  | some m => m.commands.length >= 12
  | none => false

/-- Wrap module lastSeg is CompilePathCompose (no module line in the live file). -/
def liveParseHasCompilePathComposeModule : Bool :=
  match liveCompilePathComposeParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CompilePathCompose"

/-- Live parse has the living CompilePath namespace command. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompilePath"
      | _ => false

/-- Live product imports SystemsLean.CompilePath. Types-style: dotted import kept. -/
def liveParseHasCompilePathImport : Bool :=
  match liveCompilePathComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CompilePath"
      | _ => false

/-- Live product also imports SystemsLean.EmitCompose. Types-style: dotted import kept. -/
def liveParseHasEmitComposeImport : Bool :=
  match liveCompilePathComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitCompose"
      | _ => false

/-- Defs unique to CompilePathCompose.lean (not CompilePath.lean
    and not occupancy Term string payloads). Greppable: composeFixtureMintId,
    composeFixtureTagErased. -/
def liveParseHasCoreDefs : Bool :=
  match liveCompilePathComposeParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsCpp liveCompilePathComposeSource)
    toksHaveDefNamed liveCompilePathComposeSkipFuel toks
      "composeFixtureMintId"
      && toksHaveDefNamed liveCompilePathComposeSkipFuel toks
        "composeFixtureTagErased"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathComposeReady,
    PARSE-LIVE-COMPILE-PATH-COMPOSE,
    HOST-FRONT-LIVE-COMPILE-PATH-COMPOSE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompilePathComposeReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_COMPOSE_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILE-PATH-COMPOSE")
    && (parseId == "PARSE-LIVE-COMPILE-PATH-COMPOSE")
    && (liveCompilePathComposeRel
      == "src/systems/SystemsLean/CompilePathCompose.lean")
    && (liveRel == "CompilePathCompose.lean")
    && hostFrontParseSourceCompilePathCompose
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathComposeFullHost
    && !hostFrontLiveCompilePathComposeResidualFreeClaimed
    && !hostFrontLiveCompilePathComposeProvablyUnlocked
    && kernelCheckLiveCompilePathComposeSource liveCompilePathComposeSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCompilePathComposeModule
    && liveParseHasCompilePathNs
    && liveParseHasCompilePathImport
    && liveParseHasEmitComposeImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathComposeSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompilePathCompose (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILE-PATH-COMPOSE =="
  IO.println s!"  host={hostId} file={liveCompilePathComposeRel}"
  let path := root / liveCompilePathComposeRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathComposeRel}"
    throw (IO.userError s!"missing {liveCompilePathComposeRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompilePathComposeSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePathCompose.lean != liveCompilePathComposeSource"
    throw (IO.userError "dual-pin mismatch live CompilePathCompose.lean")
  let r := parseLiveCompilePathComposeSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILE-PATH-COMPOSE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILE-PATH-COMPOSE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPILE-PATH-COMPOSE ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePathCompose parse false"
      throw (IO.userError "kernelCheck live CompilePathCompose parse false")
    unless hostFrontLiveCompilePathComposeReady do
      IO.eprintln "error: hostFrontLiveCompilePathComposeReady false"
      throw (IO.userError "hostFrontLiveCompilePathComposeReady false")
    IO.println s!"GREEN {stageId}: live CompilePathCompose.lean parse kernelCheck; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePathCompose root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePathCompose
