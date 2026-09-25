/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckHostPackageWriteTerm.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckHostPackageWriteTerm.lean.
  It is not a neighbor product file.
  Kept commands are the HostFrontLiveHostTerm skip-fold of this file.
  Open lines and non-literal defs are skipped. theorem commands are
  skipped. example and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_HOST_PACKAGE_WRITE_TERM_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM, liveRel,
  kernelCheckLiveHostModuleCheckHostPackageWriteTermSource,
  hostFrontLiveHostModuleCheckHostPackageWriteTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckHostPackageWriteTermSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckHostPackageWriteTermSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_HOST_PACKAGE_WRITE_TERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckHostPackageWriteTerm.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckHostPackageWriteTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckHostPackageWriteTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckHostPackageWriteTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckHostPackageWriteTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckHostPackageWriteTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and dotted names). -/
def liveParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 8192

/-- Kept-command count from the lean --run log.
    Five imports, the namespace, four literal defs, and end. -/
def liveKeptCmds : Nat := 11

/-- theorem keyword count. Three theorem commands are skip-folded. -/
def liveTheoremCount : Nat := 3

/-- example keyword count. The live file has no example command. -/
def liveExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option command. -/
def liveSetOptionCount : Nat := 0

/-- Import commands kept. Five import lines. -/
def liveImportCount : Nat := 5

/-- On-disk HostModuleCheckHostPackageWriteTerm.lean bytes.
    Greppable: liveHostModuleCheckHostPackageWriteTermSource. -/

def liveHostModuleCheckHostPackageWriteTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Host package write L2 term-surface
  (HostPackageWrite TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostPackageWrite dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Host package write L2 dialect subset (documented; not full Lean 4
  elaborator):
  - hostPackageWriteReady compose matches product (G1 + graph + Mult/Linear/
    Types/Program/Graph/Compose package surfaces + reuses + ids + finished +
    keeps host Lake + Lake + living false residual-free / complete / proof /
    llvm / PROVABLY).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - stillUsesLake / dependsOnLake true.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.
  - Not LLVM IR text. Not llvm-as / rust-link / production backend.
  - Not MultFsDeepen writer-deepen. Not HostPackageWriteTheorems proof.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckHostPackageWriteTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckHostPackageWriteTermSurfaceOk.

  Intentional non-claims:
  - Host package write only -- not fragment front-end, not package
    elaborate, not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Product StillUsesLake / DependsOnLake remain. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckHostPackageWriteTerm, TERM-SURFACE, HostPackageWrite-only,
  ILL-TYPED-TERM, checkHostPackageWriteTermDialect,
  hostModuleCheckHostPackageWriteTermDialectOk,
  hostModuleCheckHostPackageWriteTermSurfaceDualOk,
  hostModuleCheckHostPackageWriteTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckHostPackageWriteTerm
  Red/green: lake build SystemsLean.HostModuleCheckHostPackageWriteTerm;
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

/-! ### HostPackageWrite L2 term-surface dual-ok pins (HostPackageWrite-only) -/

def checkDepthHostPackageWriteTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthHostPackageWriteTermSurfaceScope : String := "HostPackageWrite-only"
def hostModuleCheckHostPackageWriteTermSurfaceDualOk : Bool := true

/-- Product hostPackageWriteReady fold (G1 + graph + unit packages + reuses +
    ids + finished + host Lake + living false claims). Same string as the
    collapsed on-disk HostPackageWrite body so L0 fixtures and product match. -/
def hostPackageWriteReadyTermBody : String :=
  "hostPackageWriteG1Ready && hostPackageWriteGraphReady && hostPackageWriteMultReady && hostPackageWriteLinearGraphReady && hostPackageWriteLinearReady && hostPackageWriteTypesGraphReady && hostPackageWriteTypesReady && hostPackageWriteProgramGraphReady && hostPackageWriteProgramReady && hostPackageWriteGraphExpandReady && hostPackageWriteGraphPackageReady && hostPackageWriteComposeExpandReady && hostPackageWriteComposePackageReady && hostPackageWriteReusesHostSurfaces && hostPackageWriteIdsOk && hostPackageWriteFinishedClaimed && hostPackageWriteKeepsHostLake && stillUsesLake && dependsOnLake && hostPackageWriteStillUsesLake && hostPackageWriteDependsOnLake && hostPackageWriteHostElaboratorResidualRemains && hostPackageWriteDoesNotClaimPeerGreen && !hostPackageWriteResidualFreeClaimed && !hostPackageWriteProductSelfHostCompleteClaimed && !hostPackageWriteProofCompleteClaimed && !hostPackageWriteLlvmUnlocked && !hostPackageWriteProvablyUnlocked"

def hostPackageWriteReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteReady" with
  | none => false
  | some body => body == hostPackageWriteReadyTermBody

def hostPackageWriteResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def hostPackageWriteCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostPackageWriteProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostPackageWriteLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def hostPackageWriteProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def hostPackageWriteStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def hostPackageWriteDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkHostPackageWriteTermDialect (content : String) : Option String :=
  if !hostPackageWriteReadyBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteCompleteBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteProofBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteLlvmBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteProvablyBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineHostPackageWriteWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkHostPackageWriteTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckHostPackageWriteTermSkeletonPrefix : String :=
  "import SystemsLean.HostFront\n" ++
  "namespace SystemsLean.HostPackageWrite\n"

def hostModuleCheckHostPackageWriteTermSkeletonSuffix : String :=
  "end SystemsLean.HostPackageWrite\n"

/-- Honest HostPackageWrite TERM mid: required L0 decls plus living claim pins. -/
def hostPackageWriteTermGoodPins (readyBody residual complete proof llvm
    provably lake : String) : String :=
  "def stageId : String := \"SLAKE_HOST_PACKAGE_WRITE_V0\"\n" ++
  "def hostId : String := \"HOST-PACKAGE-WRITE\"\n" ++
  "def surfaceId : String := \"HOST-PACKAGE-WRITE\"\n" ++
  "def justRecipe : String := \"host-package-write\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostPackageWriteResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def hostPackageWriteProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def hostPackageWriteProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def hostPackageWriteLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def hostPackageWriteProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def hostPackageWriteReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckHostPackageWriteTermGoodMid : String :=
  hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
    "false" "false" "false" "false" "false" "true"

def hostModuleCheckGoodHostPackageWriteTermText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostModuleCheckHostPackageWriteTermGoodMid
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteResidualText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "true" "false" "false" "false" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteCompleteText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "true" "false" "false" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteReadyText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins "true"
      "false" "false" "false" "false" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteProofText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "false" "true" "false" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteLlvmText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "false" "false" "true" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteProvablyText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteLakeText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostPackageWriteTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.HostPackageWrite"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostPackageWriteTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (hostPackageWriteTermSurfaceFrom content)
    hostPackageWriteExpectedNamespace hostPackageWriteRequiredDecls
    (some "SystemsLean.HostFront")).isAccept

def hostPackageWriteTermDialectReject (content : String) : Bool :=
  match checkHostPackageWriteTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadHostPackageWriteResidualL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteResidualText

def hostModuleCheckBadHostPackageWriteResidualDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteResidualText

def hostModuleCheckBadHostPackageWriteCompleteL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteCompleteText

def hostModuleCheckBadHostPackageWriteCompleteDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteCompleteText

def hostModuleCheckBadHostPackageWriteReadyL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteReadyText

def hostModuleCheckBadHostPackageWriteReadyDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteReadyText

def hostModuleCheckBadHostPackageWriteProofL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteProofText

def hostModuleCheckBadHostPackageWriteProofDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteProofText

def hostModuleCheckBadHostPackageWriteLlvmL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteLlvmText

def hostModuleCheckBadHostPackageWriteLlvmDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteLlvmText

def hostModuleCheckBadHostPackageWriteProvablyL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteProvablyText

def hostModuleCheckBadHostPackageWriteProvablyDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteProvablyText

def hostModuleCheckBadHostPackageWriteLakeL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteLakeText

def hostModuleCheckBadHostPackageWriteLakeDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteLakeText

def hostModuleCheckHostPackageWriteTermDialectOk : Bool :=
  (checkHostPackageWriteTermDialect hostModuleCheckGoodHostPackageWriteTermText).isNone

/-- On-disk HostPackageWrite hostPackageWriteReady is multi-line. Collapse must
    accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodHostPackageWriteReadyMultilineText : String :=
  "def hostPackageWriteReady : Bool :=\n" ++
  "  hostPackageWriteG1Ready\n" ++
  "    && hostPackageWriteGraphReady\n" ++
  "    && hostPackageWriteMultReady\n" ++
  "    && hostPackageWriteLinearGraphReady\n" ++
  "    && hostPackageWriteLinearReady\n" ++
  "    && hostPackageWriteTypesGraphReady\n" ++
  "    && hostPackageWriteTypesReady\n" ++
  "    && hostPackageWriteProgramGraphReady\n" ++
  "    && hostPackageWriteProgramReady\n" ++
  "    && hostPackageWriteGraphExpandReady\n" ++
  "    && hostPackageWriteGraphPackageReady\n" ++
  "    && hostPackageWriteComposeExpandReady\n" ++
  "    && hostPackageWriteComposePackageReady\n" ++
  "    && hostPackageWriteReusesHostSurfaces\n" ++
  "    && hostPackageWriteIdsOk\n" ++
  "    && hostPackageWriteFinishedClaimed\n" ++
  "    && hostPackageWriteKeepsHostLake\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && hostPackageWriteStillUsesLake\n" ++
  "    && hostPackageWriteDependsOnLake\n" ++
  "    && hostPackageWriteHostElaboratorResidualRemains\n" ++
  "    && hostPackageWriteDoesNotClaimPeerGreen\n" ++
  "    && !hostPackageWriteResidualFreeClaimed\n" ++
  "    && !hostPackageWriteProductSelfHostCompleteClaimed\n" ++
  "    && !hostPackageWriteProofCompleteClaimed\n" ++
  "    && !hostPackageWriteLlvmUnlocked\n" ++
  "    && !hostPackageWriteProvablyUnlocked\n"

def hostModuleCheckHostPackageWriteReadyMultilineOk : Bool :=
  hostPackageWriteReadyBodyOk hostModuleCheckGoodHostPackageWriteReadyMultilineText

def hostModuleCheckHostPackageWriteTermSurfaceOk : Bool :=
  hostModuleCheckHostPackageWriteTermSurfaceDualOk
    && (checkDepthHostPackageWriteTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthHostPackageWriteTermSurfaceScope == "HostPackageWrite-only")
    && hostModuleCheckHostPackageWriteTermDialectOk
    && hostModuleCheckBadHostPackageWriteResidualDialectReject
    && hostModuleCheckBadHostPackageWriteCompleteDialectReject
    && hostModuleCheckBadHostPackageWriteReadyDialectReject
    && hostModuleCheckBadHostPackageWriteProofDialectReject
    && hostModuleCheckBadHostPackageWriteLlvmDialectReject
    && hostModuleCheckBadHostPackageWriteProvablyDialectReject
    && hostModuleCheckBadHostPackageWriteLakeDialectReject
    && hostModuleCheckBadHostPackageWriteResidualL0Accept
    && hostModuleCheckBadHostPackageWriteCompleteL0Accept
    && hostModuleCheckBadHostPackageWriteReadyL0Accept
    && hostModuleCheckBadHostPackageWriteProofL0Accept
    && hostModuleCheckBadHostPackageWriteLlvmL0Accept
    && hostModuleCheckBadHostPackageWriteProvablyL0Accept
    && hostModuleCheckBadHostPackageWriteLakeL0Accept
    && hostModuleCheckHostPackageWriteReadyMultilineOk

theorem hostModuleCheckHostPackageWriteTermSurfaceOk_true :
    hostModuleCheckHostPackageWriteTermSurfaceOk = true := by native_decide

theorem hostModuleCheckHostPackageWriteReadyMultilineOk_true :
    hostModuleCheckHostPackageWriteReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_hostPackageWrite_term_surface_ids_eq :
    checkDepthHostPackageWriteTermSurfaceBar = "TERM-SURFACE"
      && checkDepthHostPackageWriteTermSurfaceScope = "HostPackageWrite-only"
      && hostModuleCheckHostPackageWriteTermSurfaceDualOk = true := rfl

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
def cmdAddsGk (c : Cmd) : List String :=
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
def cmdBodyKnownGk (kn : List String) : Cmd -> Bool
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
def parseOneCmdGk (fuel : Nat) (toks : List String) :
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
def parseCmdsGk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdGk liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      if cmdBodyKnownGk kn c then
        parseCmdsGk n rest2 (kn ++ cmdAddsGk c) (acc ++ [c])
      else
        parseCmdsGk n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsGk n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live HostModuleCheckHostPackageWriteTerm.lean text.
    Greppable: parseLiveHostModuleCheckHostPackageWriteTermSource. -/
def parseLiveHostModuleCheckHostPackageWriteTermSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsGk liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckHostPackageWriteTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckHostPackageWriteTermSource. -/
def kernelCheckLiveHostModuleCheckHostPackageWriteTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckHostPackageWriteTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckHostPackageWriteTermSource
      liveHostModuleCheckHostPackageWriteTermSource with
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
    has "checkDepthHostPackageWriteTermSurfaceBar"
      && has "checkDepthHostPackageWriteTermSurfaceScope"
      && has "hostModuleCheckHostPackageWriteTermSurfaceDualOk"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckHostPackageWriteTerm"

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

/-- Keyword counts: three theorem commands, no example, no set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveHostModuleCheckHostPackageWriteTermSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthHostPackageWriteTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckHostPackageWriteTermSurfaceDualOk : Bool := true\n"

/-- Skipped non-literal def needle with a trailing newline. -/
def needleParseOk : String :=
  "def hostModuleCheckHostPackageWriteTermDialectOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckHostPackageWriteTermSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleParseOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckHostPackageWriteTermReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckHostPackageWriteTermReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_HOST_PACKAGE_WRITE_TERM_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM")
    && (liveRel == "HostModuleCheckHostPackageWriteTerm.lean")
    && (liveHostModuleCheckHostPackageWriteTermRel ==
      "src/systems/SystemsLean/HostModuleCheckHostPackageWriteTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckHostPackageWriteTermFullHost
    && !hostFrontLiveHostModuleCheckHostPackageWriteTermFullBackend
    && !hostFrontLiveHostModuleCheckHostPackageWriteTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckHostPackageWriteTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckHostPackageWriteTermSource
      liveHostModuleCheckHostPackageWriteTermSource
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
  match parseLiveHostModuleCheckHostPackageWriteTermSource "" with
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
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_HOST_PACKAGE_WRITE_TERM_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM")
    ++ bad "liveRel" (liveRel == "HostModuleCheckHostPackageWriteTerm.lean")
    ++ bad "rel" (liveHostModuleCheckHostPackageWriteTermRel ==
      "src/systems/SystemsLean/HostModuleCheckHostPackageWriteTerm.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckHostPackageWriteTermFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckHostPackageWriteTermFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckHostPackageWriteTermResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckHostPackageWriteTermProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckHostPackageWriteTermSource
      liveHostModuleCheckHostPackageWriteTermSource)
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
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostPackageWriteTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckHostPackageWriteTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckHostPackageWriteTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckHostPackageWriteTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckHostPackageWriteTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckHostPackageWriteTerm.lean != liveHostModuleCheckHostPackageWriteTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckHostPackageWriteTerm.lean")
  let r := parseLiveHostModuleCheckHostPackageWriteTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: {parseId} reject {reason}"
    throw (IO.userError s!"{parseId} reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS {parseId} ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckHostPackageWriteTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckHostPackageWriteTerm parse false")
    unless hostFrontLiveHostModuleCheckHostPackageWriteTermReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckHostPackageWriteTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckHostPackageWriteTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckHostPackageWriteTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckHostPackageWriteTermSource
