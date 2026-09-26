/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckGraphSubsetRebuildTerm.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckGraphSubsetRebuildTerm.lean.
  It is not a neighbor product file.
  Kept: five imports, namespace SystemsLean.HostModuleCheck,
  bar, scope, dual-ok, graphSubsetRebuildWroteExpectedTermBody,
  suffix, and end. Open lines are absent.
  App bodies, match bodies, and theorems are skipped. theorem count is 3.
  example and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_GRAPH_SUBSET_REBUILD_TERM_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM, liveRel,
  kernelCheckLiveHostModuleCheckGraphSubsetRebuildTermSource,
  hostFrontLiveHostModuleCheckGraphSubsetRebuildTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_GRAPH_SUBSET_REBUILD_TERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckGraphSubsetRebuildTerm.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckGraphSubsetRebuildTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckGraphSubsetRebuildTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckGraphSubsetRebuildTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckGraphSubsetRebuildTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckGraphSubsetRebuildTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and dotted names). -/
def liveParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 8192

/-- Kept commands from this parse. Counted on this file:
    five imports, namespace, bar, scope, dual-ok,
    graphSubsetRebuildWroteExpectedTermBody, suffix, and end.
    Not a copied neighbor count. -/
def liveKeptCmds : Nat := 12

/-- theorem keyword count. Three theorem commands are skip-folded. -/
def liveTheoremCount : Nat := 3

/-- example keyword count. The live file has no example command. -/
def liveExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option command. -/
def liveSetOptionCount : Nat := 0

/-- Import commands kept. Five import lines. -/
def liveImportCount : Nat := 5

/-- On-disk HostModuleCheckGraphSubsetRebuildTerm.lean bytes.
    Greppable: liveHostModuleCheckGraphSubsetRebuildTermSource. -/
def liveHostModuleCheckGraphSubsetRebuildTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- GraphSubsetRebuild L2 term-surface (GraphSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: GraphSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  GraphSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Graph rebuild self-apply body matches product (graphSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && graphSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - graphSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckGraphSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - GraphSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetEmit TERM-SURFACE dual-ok unchanged.
  - GraphSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ComposeSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ErasureSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ExtractSubsetEmit TERM-SURFACE dual-ok unchanged.
  - MultSubsetEmit TERM-SURFACE dual-ok unchanged.
  - MultSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - LinearSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - TypesSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitGraphReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckGraphSubsetRebuildTerm, TERM-SURFACE, GraphSubsetRebuild-only,
  ILL-TYPED-TERM, checkGraphSubsetRebuildTermDialect,
  hostModuleCheckGraphSubsetRebuildTermDialectOk,
  hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckGraphSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckGraphSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckGraphSubsetRebuildTerm;
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

/-! ### GraphSubsetRebuild L2 term-surface dual-ok pins (GraphSubsetRebuild-only) -/

def checkDepthGraphSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthGraphSubsetRebuildTermSurfaceScope : String := "GraphSubsetRebuild-only"
def hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product graphSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    GraphSubsetRebuild match. Not emitGraphReady. -/
def graphSubsetRebuildSelfApplyOkTermBody : String :=
  "graphSubsetRebuildInputReady && graphSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_graph_subset.h\") && (emitSourceBase == \"slake_graph_subset.c\") && (graphSubsetRebuildInputId == \"SLAKE_GRAPH_SUBSET_EMIT_V0\") && graphSubsetEmitWroteExpected && (graphSubsetHeaderPackage.length > 0) && (graphSubsetSourcePackage.length > 0)"

/-- Product graphSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def graphSubsetRebuildWroteExpectedTermBody : String :=
  "graphSubsetRebuildSelfApplyOk && graphSubsetEmitWroteExpected"

/-- Product graphSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    GraphSubsetRebuild match. -/
def graphSubsetRebuildReadyTermBody : String :=
  "graphSubsetRebuildInputReady && graphSubsetRebuildPackagePinOk && graphSubsetRebuildSelfApplyOk && graphSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !graphSubsetRebuildResidualFreeClaimed && !graphSubsetRebuildProductSelfHostCompleteClaimed && !graphSubsetRebuildProofCompleteClaimed && !graphSubsetRebuildLlvmUnlocked && !graphSubsetRebuildProvablyUnlocked && !graphSubsetRebuildWithoutLakeFinishedClaimed && (stageId == \"SLAKE_GRAPH_SUBSET_REBUILD_V0\") && (hostId == \"HOST-GRAPH-SUBSET-REBUILD\") && (surfaceId == \"GRAPH-SUBSET-REBUILD\") && (graphSubsetRebuildInputId == \"SLAKE_GRAPH_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-graph-subset-rebuild\") && (justRecipe == \"graph-subset-rebuild\") && (emitHeaderBase == \"slake_graph_subset.h\") && (emitSourceBase == \"slake_graph_subset.c\")"

def graphSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == graphSubsetRebuildSelfApplyOkTermBody

def graphSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == graphSubsetRebuildWroteExpectedTermBody

def graphSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def graphSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def graphSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildReady" with
  | none => false
  | some body => body == graphSubsetRebuildReadyTermBody

def checkGraphSubsetRebuildTermDialect (content : String) : Option String :=
  if !graphSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineGraphSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkGraphSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.GraphSubsetEmit\n" ++
  "namespace SystemsLean.GraphSubsetRebuild\n"

def hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.GraphSubsetRebuild\n"

def hostModuleCheckGraphSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++ graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodGraphSubsetRebuildTermText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckGraphSubsetRebuildTermGoodMid
    ++ hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetRebuildResidualText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++ graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetRebuildSelfApplyText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetRebuildReadyText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++ graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := true\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetRebuildCompleteText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++ graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def graphSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.GraphSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadGraphSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (graphSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadGraphSubsetRebuildResidualText)
    graphSubsetRebuildExpectedNamespace graphSubsetRebuildRequiredDecls
    (some "SystemsLean.GraphSubsetEmit")).isAccept

def hostModuleCheckBadGraphSubsetRebuildResidualDialectReject : Bool :=
  match checkGraphSubsetRebuildTermDialect hostModuleCheckBadGraphSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (graphSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadGraphSubsetRebuildSelfApplyText)
    graphSubsetRebuildExpectedNamespace graphSubsetRebuildRequiredDecls
    (some "SystemsLean.GraphSubsetEmit")).isAccept

def hostModuleCheckBadGraphSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkGraphSubsetRebuildTermDialect hostModuleCheckBadGraphSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (graphSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadGraphSubsetRebuildReadyText)
    graphSubsetRebuildExpectedNamespace graphSubsetRebuildRequiredDecls
    (some "SystemsLean.GraphSubsetEmit")).isAccept

def hostModuleCheckBadGraphSubsetRebuildReadyDialectReject : Bool :=
  match checkGraphSubsetRebuildTermDialect hostModuleCheckBadGraphSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (graphSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadGraphSubsetRebuildCompleteText)
    graphSubsetRebuildExpectedNamespace graphSubsetRebuildRequiredDecls
    (some "SystemsLean.GraphSubsetEmit")).isAccept

def hostModuleCheckBadGraphSubsetRebuildCompleteDialectReject : Bool :=
  match checkGraphSubsetRebuildTermDialect hostModuleCheckBadGraphSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckGraphSubsetRebuildTermDialectOk : Bool :=
  (checkGraphSubsetRebuildTermDialect hostModuleCheckGoodGraphSubsetRebuildTermText).isNone

/-- On-disk GraphSubsetRebuild graphSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodGraphSubsetRebuildReadyMultilineText : String :=
  "def graphSubsetRebuildReady : Bool :=\n" ++
  "  graphSubsetRebuildInputReady\n" ++
  "    && graphSubsetRebuildPackagePinOk\n" ++
  "    && graphSubsetRebuildSelfApplyOk\n" ++
  "    && graphSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !graphSubsetRebuildResidualFreeClaimed\n" ++
  "    && !graphSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !graphSubsetRebuildProofCompleteClaimed\n" ++
  "    && !graphSubsetRebuildLlvmUnlocked\n" ++
  "    && !graphSubsetRebuildProvablyUnlocked\n" ++
  "    && !graphSubsetRebuildWithoutLakeFinishedClaimed\n" ++
  "    && (stageId == \"SLAKE_GRAPH_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-GRAPH-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"GRAPH-SUBSET-REBUILD\")\n" ++
  "    && (graphSubsetRebuildInputId == \"SLAKE_GRAPH_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-graph-subset-rebuild\")\n" ++
  "    && (justRecipe == \"graph-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_graph_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_graph_subset.c\")\n"

/-- Collapse of the on-disk multi-line graphSubsetRebuildReady body. -/
def hostModuleCheckGraphSubsetRebuildReadyMultilineOk : Bool :=
  graphSubsetRebuildReadyBodyOk hostModuleCheckGoodGraphSubsetRebuildReadyMultilineText

def hostModuleCheckGraphSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk
    && (checkDepthGraphSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthGraphSubsetRebuildTermSurfaceScope == "GraphSubsetRebuild-only")
    && hostModuleCheckGraphSubsetRebuildTermDialectOk
    && hostModuleCheckBadGraphSubsetRebuildResidualDialectReject
    && hostModuleCheckBadGraphSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadGraphSubsetRebuildReadyDialectReject
    && hostModuleCheckBadGraphSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadGraphSubsetRebuildResidualL0Accept
    && hostModuleCheckBadGraphSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadGraphSubsetRebuildReadyL0Accept
    && hostModuleCheckBadGraphSubsetRebuildCompleteL0Accept
    && hostModuleCheckGraphSubsetRebuildReadyMultilineOk

theorem hostModuleCheckGraphSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckGraphSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckGraphSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckGraphSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_graphSubsetRebuild_term_surface_ids_eq :
    checkDepthGraphSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthGraphSubsetRebuildTermSurfaceScope = "GraphSubsetRebuild-only"
      && hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk = true := rfl

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

/-- Parse live HostModuleCheckGraphSubsetRebuildTerm.lean text.
    Greppable: parseLiveHostModuleCheckGraphSubsetRebuildTermSource. -/
def parseLiveHostModuleCheckGraphSubsetRebuildTermSource (src : String) :
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
          { name := HostTerm.n "SystemsLean.HostModuleCheckGraphSubsetRebuildTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckGraphSubsetRebuildTermSource. -/
def kernelCheckLiveHostModuleCheckGraphSubsetRebuildTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckGraphSubsetRebuildTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckGraphSubsetRebuildTermSource
      liveHostModuleCheckGraphSubsetRebuildTermSource with
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
    has "checkDepthGraphSubsetRebuildTermSurfaceBar"
      && has "checkDepthGraphSubsetRebuildTermSurfaceScope"
      && has "hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk"
      && has "graphSubsetRebuildWroteExpectedTermBody"
      && has "hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckGraphSubsetRebuildTerm"

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
      (stripComments liveHostModuleCheckGraphSubsetRebuildTermSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthGraphSubsetRebuildTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk : Bool := true\n"

/-- Literal scope def needle with a trailing newline. -/
def needleScope : String :=
  "def checkDepthGraphSubsetRebuildTermSurfaceScope : String := \"GraphSubsetRebuild-only\"\n"

/-- Literal suffix def needle with a trailing newline. -/
def needleSuffix : String :=
  "def hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix : String :=\n  \"end SystemsLean.GraphSubsetRebuild\\n\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckGraphSubsetRebuildTermSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleScope).length > 1
    && (src.splitOn needleSuffix).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckGraphSubsetRebuildTermReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckGraphSubsetRebuildTermReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_GRAPH_SUBSET_REBUILD_TERM_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM")
    && (liveRel == "HostModuleCheckGraphSubsetRebuildTerm.lean")
    && (liveHostModuleCheckGraphSubsetRebuildTermRel ==
      "src/systems/SystemsLean/HostModuleCheckGraphSubsetRebuildTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckGraphSubsetRebuildTermFullHost
    && !hostFrontLiveHostModuleCheckGraphSubsetRebuildTermFullBackend
    && !hostFrontLiveHostModuleCheckGraphSubsetRebuildTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckGraphSubsetRebuildTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckGraphSubsetRebuildTermSource
      liveHostModuleCheckGraphSubsetRebuildTermSource
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
  match parseLiveHostModuleCheckGraphSubsetRebuildTermSource "" with
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
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_GRAPH_SUBSET_REBUILD_TERM_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM")
    ++ bad "liveRel" (liveRel == "HostModuleCheckGraphSubsetRebuildTerm.lean")
    ++ bad "rel" (liveHostModuleCheckGraphSubsetRebuildTermRel ==
      "src/systems/SystemsLean/HostModuleCheckGraphSubsetRebuildTerm.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckGraphSubsetRebuildTermFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckGraphSubsetRebuildTermFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckGraphSubsetRebuildTermResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckGraphSubsetRebuildTermProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckGraphSubsetRebuildTermSource
      liveHostModuleCheckGraphSubsetRebuildTermSource)
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
  IO.println s!"  host={hostId} file={liveHostModuleCheckGraphSubsetRebuildTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckGraphSubsetRebuildTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckGraphSubsetRebuildTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckGraphSubsetRebuildTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckGraphSubsetRebuildTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckGraphSubsetRebuildTerm.lean != liveHostModuleCheckGraphSubsetRebuildTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckGraphSubsetRebuildTerm.lean")
  let r := parseLiveHostModuleCheckGraphSubsetRebuildTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: {parseId} reject {reason}"
    throw (IO.userError s!"{parseId} reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS {parseId} ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      for c in m.commands do
        IO.eprintln s!"error: kept {cmdTag c}"
      IO.eprintln "error: kernelCheck live HostModuleCheckGraphSubsetRebuildTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckGraphSubsetRebuildTerm parse false")
    unless hostFrontLiveHostModuleCheckGraphSubsetRebuildTermReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckGraphSubsetRebuildTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckGraphSubsetRebuildTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckGraphSubsetRebuildTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource
