/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitPlan.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitPlan.lean. It is not EmitApply.lean.
  Literal structure Plan is kept. Theorem, example, open, private,
  and un-kernelable defs are skipped. planFromCompose, isReady, and
  planOk stay in the live text (token walk). Their bodies are not
  kernel-checkable (if, match, app, field proj).
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-PLAN,
  SLAKE_HOST_FRONT_LIVE_EMIT_PLAN_V0,
  PARSE-LIVE-EMIT-PLAN, EMIT-PLAN, liveRel,
  kernelCheckLiveEmitPlanSource,
  hostFrontLiveEmitPlanReady.
  Module: SystemsLean.HostFrontLiveEmitPlan
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitPlanSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitPlan

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_PLAN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-PLAN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-PLAN"

/-- Live file basename. -/
def liveRel : String := "EmitPlan.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitPlanRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitPlanFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveEmitPlanFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitPlanResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitPlanProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitPlanParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable.
    EmitPlan.lean token walk is larger than the LlvmHold file. -/
def liveEmitPlanSkipFuel : Nat := 16384

/-- Kept commands: four imports, namespace, structure Plan, and end.
    Theorems, examples, opens, private defs, and un-kernelable defs drop.
    From EmitPlan.lean. -/
def liveEmitPlanKeptCmds : Nat := 7

/-- theorem keyword count after comment strip. EmitPlan.lean has 18. -/
def liveEmitPlanTheoremCount : Nat := 18

/-- example keyword count after comment strip. EmitPlan.lean has 10. -/
def liveEmitPlanExampleCount : Nat := 10

/-- set_option keyword count. EmitPlan.lean has no set_option. -/
def liveEmitPlanSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . EmitPlan`. -/
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
def cmdAddsEmitPlan (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app and struct lits.
    Plan.failClosed and private IrNode fixtures are struct lits.
    Comma-free lits fail the term parser; this also drops any that parse.
    The kernel would reject them unless structure Plan is the expected type
    and every field is present. Do not keep them. -/
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
  | Nat.succ _, Term.structLit _ => false
  | Nat.succ _, Term.match_ _ _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, no struct lit. -/
def cmdBodyKnownEmitPlan (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitPlanParseFuel body
        && termNoAppN liveEmitPlanParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitPlanParseFuel body
        && termNoAppN liveEmitPlanParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here.
    structure Plan is parsed (where + deriving). -/
def parseOneCmdEmitPlan (fuel : Nat) (toks : List String) :
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
  | "structure" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseStructFieldDeclsHt fuel rest [] with
      | none => none
      | some (fields, rest2) =>
        if fields.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingHt rest3 with
            | some (der, rest4) =>
              some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields der, rest4)
            | none => none
          | _ =>
            some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields [], rest2)
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem, example, set_option, open, private,
    and un-kernelable defs. private is not isCmdKw. -/
def parseCmdsEmitPlan : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitPlan liveEmitPlanParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitPlanSkipFuel rest
      if cmdBodyKnownEmitPlan kn c then
        parseCmdsEmitPlan n rest2
          (kn ++ cmdAddsEmitPlan c) (acc ++ [c])
      else
        parseCmdsEmitPlan n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitPlan n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitPlanSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitPlan n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live EmitPlan.lean text.
    Greppable: parseLiveEmitPlanSource,
    PARSE-LIVE-EMIT-PLAN. -/
def parseLiveEmitPlanSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitPlan liveEmitPlanParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitPlan"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitPlan parse. Not a fixture.
    Greppable: kernelCheckLiveEmitPlanSource,
    PARSE-LIVE-EMIT-PLAN. -/
def kernelCheckLiveEmitPlanSource (src : String) : Bool :=
  match parseLiveEmitPlanSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitPlanParsed? : Option Module :=
  match parseLiveEmitPlanSource liveEmitPlanSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitPlanParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Four imports, namespace, structure Plan, end. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitPlanParsed? with
  | some m => m.commands.length == liveEmitPlanKeptCmds
  | none => false

/-- Wrap module lastSeg is EmitPlan (no module line in the live file). -/
def liveParseHasEmitPlanModule : Bool :=
  match liveEmitPlanParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitPlan"
      && lastSeg m.name.raw == "EmitPlan"

/-- Live parse has namespace SystemsLean.EmitPlan. -/
def liveParseHasEmitPlanNs : Bool :=
  match liveEmitPlanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitPlan"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitPlan. -/
def liveParseHasEmitPlanEnd : Bool :=
  match liveEmitPlanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitPlan"
      | _ => false

/-- Live parse imports Mult, Types, HostCompose, and EmitPlanScaffold. -/
def liveParseHasEmitPlanImports : Bool :=
  match liveEmitPlanParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Mult"
      && has "SystemsLean.Types"
      && has "SystemsLean.HostCompose"
      && has "SystemsLean.EmitPlanScaffold"

/-- Live parse has structure Plan and its six inventory fields. -/
def liveParseHasPlanStruct : Bool :=
  match liveEmitPlanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "Plan"
          && fields.any (fun f => f.name.raw == "nodeCount")
          && fields.any (fun f => f.name.raw == "edgeCount")
          && fields.any (fun f => f.name.raw == "runtimeNodes")
          && fields.any (fun f => f.name.raw == "erasedNodes")
          && fields.any (fun f => f.name.raw == "ready")
          && fields.any (fun f => f.name.raw == "valid")
      | _ => false

/-- Skip-head: planFromCompose, isReady, and planOk are defs in the live text.
    Bodies are skipped. Do not require them as kept Cmd.def_. -/
def liveParseHasCoreDefs : Bool :=
  match liveEmitPlanParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitPlanSource)
    toksHaveDefNamed liveEmitPlanSkipFuel toks "planFromCompose"
      && toksHaveDefNamed liveEmitPlanSkipFuel toks "isReady"
      && toksHaveDefNamed liveEmitPlanSkipFuel toks "planOk"

/-- Keyword counts: 18 theorem, 10 example, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitPlanParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitPlanSource)
    let fuel := liveEmitPlanSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitPlanTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitPlanExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitPlanSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportHostCompose : String := "import SystemsLean.HostCompose\n"

/-- Scaffold import needle. Trailing newline. -/
def needleImportScaffold : String := "import SystemsLean.EmitPlanScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitPlan\n"

/-- structure Plan needle with a trailing newline. -/
def needleStructure : String := "structure Plan where\n"

/-- planFromCompose def needle with a trailing newline. -/
def needlePlanFromCompose : String :=
  "def planFromCompose (hc : Host) : Plan :=\n"

/-- isReady def needle with a trailing newline. -/
def needleIsReady : String := "def isReady (p : Plan) : Bool :=\n"

/-- planOk def needle with a trailing newline. -/
def needlePlanOk : String := "def planOk (hc : Host) : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitPlan\n"

/-- Header needle with a trailing newline. -/
def needleHeader : String :=
  "  SYSTEMS_LEAN_HOST partial -- emit plan readiness inventory on Systems Lean host.\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitPlanSource
  (src.splitOn needleImportHostCompose).length > 1
    && (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStructure).length > 1
    && (src.splitOn needlePlanFromCompose).length > 1
    && (src.splitOn needleIsReady).length > 1
    && (src.splitOn needlePlanOk).length > 1
    && (src.splitOn needleEnd).length > 1
    && (src.splitOn needleHeader).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitPlanReady,
    PARSE-LIVE-EMIT-PLAN,
    HOST-FRONT-LIVE-EMIT-PLAN.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitPlanReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_PLAN_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-PLAN")
    && (parseId == "PARSE-LIVE-EMIT-PLAN")
    && (liveRel == "EmitPlan.lean")
    && (liveEmitPlanRel
      == "src/systems/SystemsLean/EmitPlan.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitPlanFullHost
    && !hostFrontLiveEmitPlanFullBackend
    && !hostFrontLiveEmitPlanResidualFreeClaimed
    && !hostFrontLiveEmitPlanProvablyUnlocked
    && kernelCheckLiveEmitPlanSource liveEmitPlanSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitPlanModule
    && liveParseHasEmitPlanNs
    && liveParseHasEmitPlanEnd
    && liveParseHasEmitPlanImports
    && liveParseHasPlanStruct
    && liveParseHasCoreDefs
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitPlanSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- Short command tag for a ready-failure line. -/
def cmdTag : Cmd -> String
  | Cmd.importModule x => "import:" ++ x.raw
  | Cmd.namespace x => "ns:" ++ x.raw
  | Cmd.endNamespace x => "end:" ++ x.raw
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "inductive:" ++ x.raw
  | Cmd.def_ x _ _ => "def:" ++ x.raw
  | Cmd.defBind x _ _ _ => "defBind:" ++ x.raw
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => "structure:" ++ x.raw

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitPlan (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-PLAN =="
  IO.println s!"  host={hostId} file={liveEmitPlanRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitPlanRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitPlanRel}"
    throw (IO.userError s!"missing {liveEmitPlanRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitPlanSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitPlan.lean != liveEmitPlanSource"
    throw (IO.userError "dual-pin mismatch live EmitPlan.lean")
  let r := parseLiveEmitPlanSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-PLAN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-PLAN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-PLAN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitPlan parse false"
      throw (IO.userError "kernelCheck live EmitPlan parse false")
    unless hostFrontLiveEmitPlanReady do
      let tags := String.intercalate "," (m.commands.map cmdTag)
      IO.eprintln s!"error: hostFrontLiveEmitPlanReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} module={liveParseHasEmitPlanModule} ns={liveParseHasEmitPlanNs} endNs={liveParseHasEmitPlanEnd} imports={liveParseHasEmitPlanImports} struct={liveParseHasPlanStruct} core={liveParseHasCoreDefs} kw={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd} tags={tags}"
      throw (IO.userError "hostFrontLiveEmitPlanReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitPlan source was accepted"
      throw (IO.userError "empty EmitPlan source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitPlan root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitPlan
