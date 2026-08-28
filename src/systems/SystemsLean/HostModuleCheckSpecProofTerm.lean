/-
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
