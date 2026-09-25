/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckSpecProofTerm.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckSpecProofTerm.lean.
  It is not a neighbor product file.
  Kept: five imports, namespace SystemsLean.HostModuleCheck,
  four literal defs, and end. Open lines are absent. App bodies,
  match bodies, and theorems are skipped. theorem count is 3.
  example and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_SPEC_PROOF_TERM_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM, liveRel,
  kernelCheckLiveHostModuleCheckSpecProofTermSource,
  hostFrontLiveHostModuleCheckSpecProofTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckSpecProofTermSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckSpecProofTermSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_SPEC_PROOF_TERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckSpecProofTerm.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckSpecProofTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckSpecProofTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckSpecProofTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckSpecProofTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckSpecProofTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and dotted names). -/
def liveParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 8192

/-- Kept commands from this parse: five imports, namespace,
    four literal defs, and end. -/
def liveKeptCmds : Nat := 11

/-- theorem keyword count. Three theorem commands are skip-folded. -/
def liveTheoremCount : Nat := 3

/-- example keyword count. The live file has no example command. -/
def liveExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option command. -/
def liveSetOptionCount : Nat := 0

/-- Import commands kept. Five import lines. -/
def liveImportCount : Nat := 5

/-- On-disk HostModuleCheckSpecProofTerm.lean bytes.
    Greppable: liveHostModuleCheckSpecProofTermSource. -/
def liveHostModuleCheckSpecProofTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- SpecProof leftover L2 term-surface
  (SpecProof TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: SpecProof leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Host spec-proof leftover dialect subset (documented; not full Lean 4
  elaborator):
  - specProofReady compose matches product (nine conjuncts:
    ProbeWire.probeWireReady + specProofSurfaceOk + specSurfaceStated +
    proofDoesNotRetireTests + specDoesNotImplyProofComplete +
    proofCompleteClaimed + !residualFreeClaimed +
    productSelfHostCompleteClaimed +
    SelfApplyFs.freestandingProductSelfHostComplete).
  - proofCompleteClaimed is a named top-level ready conjunct that must stay
    true (SpecProof proof-complete claimed class ILL).
  - residualFreeClaimed is a ready conjunct (!residualFreeClaimed). Not a
    DualResidual ILL. Named body stays false.
  - specProofOk aliases specProofReady. L0 does not require the alias.
  - No Lake twins on the ready fold (no stillUsesLake / dependsOnLake).
  - No residual-free twin (local false + bang in the ready fold).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not FirstSurface. Not HostPackageWrite.
  - Not LLVM text. Not SpecProofTheorems. Not PackageEnv / Soft J2
    (later PE invents packageBodyImportsProbeWire).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckSpecProofTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckSpecProofTermSurfaceOk.

  Intentional non-claims:
  - Host spec-proof leftover only -- not package elaborate, not FullHost
    re-true.
  - Not SpecProofTheorems. Not SelfHostBody rewrite. Not DualResidual rewrite.
  - Not emit*Ready. Not full elaborator typecheck. Not freestanding residual
    free. Not PROVABLY.
  - Does not flip residualFreeClaimed (stays false).
  - Does not flip DualResidual residualFreeClaimed (stays true).
  - Does not flip DualResidual hostElaboratorResidualFreeClaimed (stays true).
  - Does not flip DualResidual remains pins (stay false).
  - Does not flip proofCompleteClaimed (stays true).
  - Does not flip productSelfHostCompleteClaimed or
    SelfApplyFs.freestandingProductSelfHostComplete.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckSpecProofTerm, TERM-SURFACE, SpecProof-only,
  ILL-TYPED-TERM, checkSpecProofTermDialect,
  hostModuleCheckSpecProofTermDialectOk,
  hostModuleCheckSpecProofTermSurfaceDualOk,
  hostModuleCheckSpecProofTermSurfaceOk,
  specProofReady, proofCompleteClaimed,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckSpecProofTerm
  Red/green: lake build SystemsLean.HostModuleCheckSpecProofTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckRequiredDecls
import SystemsLean.HostModuleCheckRequiredDeclsProduct
import SystemsLean.HostModuleCheckRequiredDeclsLater

namespace SystemsLean.HostModuleCheck

/-! ### SpecProof leftover L2 term-surface dual-ok pins (SpecProof-only) -/

def checkDepthSpecProofTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthSpecProofTermSurfaceScope : String := "SpecProof-only"
def hostModuleCheckSpecProofTermSurfaceDualOk : Bool := true

/-- Product specProofReady fold (nine conjuncts only). Same string
    as the collapsed on-disk SpecProof leftover body so L0 fixtures and
    product match. No Lake / llvm / dominance conjuncts. residual-free
    stays a false conjunct, not an ILL. proofCompleteClaimed stays named
    true (ILL twin). -/
def specProofReadyTermBody : String :=
  "ProbeWire.probeWireReady && specProofSurfaceOk && specSurfaceStated && proofDoesNotRetireTests && specDoesNotImplyProofComplete && proofCompleteClaimed && !residualFreeClaimed && productSelfHostCompleteClaimed && SelfApplyFs.freestandingProductSelfHostComplete"

def specProofReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "specProofReady" with
  | none => false
  | some body => body == specProofReadyTermBody

def specProofProofCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "proofCompleteClaimed" with
  | none => false
  | some body => body == "true"

def checkSpecProofTermDialect (content : String) : Option String :=
  if !specProofReadyBodyOk content then some reasonIllTypedTerm
  else if !specProofProofCompleteBodyOk content then some reasonIllTypedTerm
  else none

def refineSpecProofWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkSpecProofTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckSpecProofTermSkeletonPrefix : String :=
  "import SystemsLean.ProbeWire\n" ++
  "namespace SystemsLean.SpecProof\n"

def hostModuleCheckSpecProofTermSkeletonSuffix : String :=
  "end SystemsLean.SpecProof\n"

/-- Honest SpecProof leftover TERM mid: required L0 decls plus living
    proof-complete pin (true). Stage / host ids match product SpecProof
    leftover. residualFreeClaimed stays false (ready conjunct; not a
    DualResidual ILL). -/
def specProofTermGoodPins (readyBody proofComplete : String) : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_SPEC_PROOF_V0\"\n" ++
  "def hostSpecProofId : String := \"HOST-SPEC-PROOF\"\n" ++
  "def selfHostSpecProofId : String := \"SELF-HOST-SPEC-PROOF\"\n" ++
  "def specSurfaceStated : Bool := true\n" ++
  "def proofCompleteClaimed : Bool := " ++ proofComplete ++ "\n" ++
  "def residualFreeClaimed : Bool := false\n" ++
  "def specProofReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckSpecProofTermGoodMid : String :=
  specProofTermGoodPins specProofReadyTermBody "true"

def hostModuleCheckGoodSpecProofTermText : String :=
  hostModuleCheckSpecProofTermSkeletonPrefix
    ++ hostModuleCheckSpecProofTermGoodMid
    ++ hostModuleCheckSpecProofTermSkeletonSuffix

def hostModuleCheckBadSpecProofReadyText : String :=
  hostModuleCheckSpecProofTermSkeletonPrefix
    ++ specProofTermGoodPins "true" "true"
    ++ hostModuleCheckSpecProofTermSkeletonSuffix

def hostModuleCheckBadSpecProofProofCompleteText : String :=
  hostModuleCheckSpecProofTermSkeletonPrefix
    ++ specProofTermGoodPins specProofReadyTermBody "false"
    ++ hostModuleCheckSpecProofTermSkeletonSuffix

def specProofTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.SpecProof"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def specProofTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (specProofTermSurfaceFrom content)
    specProofExpectedNamespace specProofRequiredDecls
    (some "SystemsLean.ProbeWire")).isAccept

def specProofTermDialectReject (content : String) : Bool :=
  match checkSpecProofTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSpecProofReadyL0Accept : Bool :=
  specProofTermL0Accept hostModuleCheckBadSpecProofReadyText

def hostModuleCheckBadSpecProofReadyDialectReject : Bool :=
  specProofTermDialectReject hostModuleCheckBadSpecProofReadyText

def hostModuleCheckBadSpecProofProofCompleteL0Accept : Bool :=
  specProofTermL0Accept hostModuleCheckBadSpecProofProofCompleteText

def hostModuleCheckBadSpecProofProofCompleteDialectReject : Bool :=
  specProofTermDialectReject hostModuleCheckBadSpecProofProofCompleteText

def hostModuleCheckSpecProofTermDialectOk : Bool :=
  (checkSpecProofTermDialect hostModuleCheckGoodSpecProofTermText).isNone

/-- On-disk SpecProof leftover specProofReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodSpecProofReadyMultilineText : String :=
  "def specProofReady : Bool :=\n" ++
  "  ProbeWire.probeWireReady\n" ++
  "    && specProofSurfaceOk\n" ++
  "    && specSurfaceStated\n" ++
  "    && proofDoesNotRetireTests\n" ++
  "    && specDoesNotImplyProofComplete\n" ++
  "    && proofCompleteClaimed\n" ++
  "    && !residualFreeClaimed\n" ++
  "    && productSelfHostCompleteClaimed\n" ++
  "    && SelfApplyFs.freestandingProductSelfHostComplete\n"

/-- Collapse of the on-disk multi-line specProofReady body. -/
def hostModuleCheckSpecProofReadyMultilineOk : Bool :=
  specProofReadyBodyOk hostModuleCheckGoodSpecProofReadyMultilineText

def hostModuleCheckSpecProofTermSurfaceOk : Bool :=
  hostModuleCheckSpecProofTermSurfaceDualOk
    && (checkDepthSpecProofTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthSpecProofTermSurfaceScope == "SpecProof-only")
    && hostModuleCheckSpecProofTermDialectOk
    && hostModuleCheckBadSpecProofReadyDialectReject
    && hostModuleCheckBadSpecProofProofCompleteDialectReject
    && hostModuleCheckBadSpecProofReadyL0Accept
    && hostModuleCheckBadSpecProofProofCompleteL0Accept
    && hostModuleCheckSpecProofReadyMultilineOk

theorem hostModuleCheckSpecProofTermSurfaceOk_true :
    hostModuleCheckSpecProofTermSurfaceOk = true := by native_decide

theorem hostModuleCheckSpecProofReadyMultilineOk_true :
    hostModuleCheckSpecProofReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_spec_proof_term_surface_ids_eq :
    checkDepthSpecProofTermSurfaceBar = "TERM-SURFACE"
      && checkDepthSpecProofTermSurfaceScope = "SpecProof-only"
      && hostModuleCheckSpecProofTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#
/-- Dotted ident `SystemsLean . HostModuleCheck`. -/
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
def cmdAddsFk (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded. -/
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

/-- Body is kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownFk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParseFuel body
        && termNoAppN liveParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParseFuel body
        && termNoAppN liveParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdFk (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip open, theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsFk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFk liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      if cmdBodyKnownFk kn c then
        parseCmdsFk n rest2 (kn ++ cmdAddsFk c) (acc ++ [c])
      else
        parseCmdsFk n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFk n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live HostModuleCheckSpecProofTerm.lean text.
    Greppable: parseLiveHostModuleCheckSpecProofTermSource. -/
def parseLiveHostModuleCheckSpecProofTermSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFk liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckSpecProofTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckSpecProofTermSource. -/
def kernelCheckLiveHostModuleCheckSpecProofTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckSpecProofTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckSpecProofTermSource
      liveHostModuleCheckSpecProofTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count is the kept set, not a neighbor count. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "checkDepthSpecProofTermSurfaceBar"
      && has "checkDepthSpecProofTermSurfaceScope"
      && has "hostModuleCheckSpecProofTermSurfaceDualOk"
      && has "hostModuleCheckSpecProofTermSkeletonSuffix"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckSpecProofTerm"

/-- Live parse has namespace SystemsLean.HostModuleCheck. -/
def liveParseHasNs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostModuleCheck. -/
def liveParseHasEnd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse keeps the five imports. -/
def liveParseImportCountOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let n := m.commands.foldl (fun acc c =>
      match c with
      | Cmd.importModule _ => acc + 1
      | _ => acc) 0
    n == liveImportCount

/-- Keyword counts: theorem is 3. example and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveHostModuleCheckSpecProofTermSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthSpecProofTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckSpecProofTermSurfaceDualOk : Bool := true\n"

/-- Literal body def needle with a trailing newline. -/
def needleParseOk : String :=
  "def specProofReadyTermBody : String :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckSpecProofTermSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleParseOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckSpecProofTermReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckSpecProofTermReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_SPEC_PROOF_TERM_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM")
    && (liveRel == "HostModuleCheckSpecProofTerm.lean")
    && (liveHostModuleCheckSpecProofTermRel ==
      "src/systems/SystemsLean/HostModuleCheckSpecProofTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckSpecProofTermFullHost
    && !hostFrontLiveHostModuleCheckSpecProofTermFullBackend
    && !hostFrontLiveHostModuleCheckSpecProofTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckSpecProofTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckSpecProofTermSource
      liveHostModuleCheckSpecProofTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasModuleName
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseImportCountOk
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckSpecProofTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- One kept command, for a failure line. -/
def cmdTag : Cmd -> String
  | Cmd.importModule x => s!"import {x.raw}"
  | Cmd.namespace x => s!"namespace {x.raw}"
  | Cmd.endNamespace x => s!"end {x.raw}"
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => s!"inductive {x.raw}"
  | Cmd.def_ x _ _ => s!"def {x.raw}"
  | Cmd.defBind x _ _ _ => s!"defBind {x.raw}"
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => s!"structure {x.raw}"

/-- Which ready conjuncts failed. Empty when ready holds. -/
def readyFailures : List String :=
  let bad (name : String) (ok : Bool) : List String :=
    if ok then [] else [name]
  bad "stageId" (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_SPEC_PROOF_TERM_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM")
    ++ bad "liveRel" (liveRel == "HostModuleCheckSpecProofTerm.lean")
    ++ bad "rel" (liveHostModuleCheckSpecProofTermRel ==
      "src/systems/SystemsLean/HostModuleCheckSpecProofTerm.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckSpecProofTermFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckSpecProofTermFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckSpecProofTermResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckSpecProofTermProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckSpecProofTermSource
      liveHostModuleCheckSpecProofTermSource)
    ++ bad "noCheck" liveParseHasNoCheckCmd
    ++ bad "count" liveParseCmdCountOk
    ++ bad "literals" liveParseHasLiteralDefs
    ++ bad "module" liveParseHasModuleName
    ++ bad "ns" liveParseHasNs
    ++ bad "endNs" liveParseHasEnd
    ++ bad "imports" liveParseImportCountOk
    ++ bad "kw" liveParseKwCountsOk
    ++ bad "needles" liveNeedlesOk

/-! ### Driver (short banners; on-disk bytes must match the embedded source). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: {parseId} =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckSpecProofTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckSpecProofTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckSpecProofTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckSpecProofTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckSpecProofTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckSpecProofTerm.lean != liveHostModuleCheckSpecProofTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckSpecProofTerm.lean")
  let r := parseLiveHostModuleCheckSpecProofTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: {parseId} reject {reason}"
    throw (IO.userError s!"{parseId} reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS {parseId} ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckSpecProofTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckSpecProofTerm parse false")
    unless hostFrontLiveHostModuleCheckSpecProofTermReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckSpecProofTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckSpecProofTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckSpecProofTerm source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckSpecProofTermSource
