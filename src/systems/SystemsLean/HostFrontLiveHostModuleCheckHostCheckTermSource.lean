/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckHostCheckTerm.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckHostCheckTerm.lean.
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
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_HOST_CHECK_TERM_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM, liveRel,
  kernelCheckLiveHostModuleCheckHostCheckTermSource,
  hostFrontLiveHostModuleCheckHostCheckTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckHostCheckTermSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckHostCheckTermSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_HOST_CHECK_TERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckHostCheckTerm.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckHostCheckTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckHostCheckTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckHostCheckTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckHostCheckTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckHostCheckTermProvablyUnlocked : Bool :=
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

/-- On-disk HostModuleCheckHostCheckTerm.lean bytes.
    Greppable: liveHostModuleCheckHostCheckTermSource. -/

def liveHostModuleCheckHostCheckTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostCheck L2 term-surface (HostCheck TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Host fragment check dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  HostCheck L2 dialect subset (documented; not full Lean 4 elaborator):
  - hostFragmentCheckReady compose matches product (corpus + ids + HostFront
    reuse + Lake + residual remains + peer-green + living false residual-free
    / complete / proof / llvm / PROVABLY).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - peer-green honesty pin true (does not claim peer green).
  - host residual remains true; stillUsesLake / dependsOnLake true.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckHostCheckTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckHostCheckTermSurfaceOk.

  Intentional non-claims:
  - HostCheck Mult-first fragment check only -- not package elaborate,
    not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckHostCheckTerm, TERM-SURFACE, HostCheck-only,
  ILL-TYPED-TERM, checkHostCheckTermDialect,
  hostModuleCheckHostCheckTermDialectOk,
  hostModuleCheckHostCheckTermSurfaceDualOk,
  hostModuleCheckHostCheckTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckHostCheckTerm
  Red/green: lake build SystemsLean.HostModuleCheckHostCheckTerm;
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

/-! ### HostCheck L2 term-surface dual-ok pins (HostCheck-only) -/

def checkDepthHostCheckTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthHostCheckTermSurfaceScope : String := "HostCheck-only"
def hostModuleCheckHostCheckTermSurfaceDualOk : Bool := true

/-- Product hostFragmentCheckReady fold (corpus + ids + HostFront reuse +
    Lake + residual + peer-green + living false claims). Same string as the
    collapsed on-disk HostCheck body so L0 fixtures and product match. -/
def hostFragmentCheckReadyTermBody : String :=
  "hostFragmentCheckCorpusOk && hostFragmentCheckIdsOk && hostFragmentCheckReusesHostFront && stillUsesLake && dependsOnLake && hostFragmentCheckStillUsesLake && hostFragmentCheckDependsOnLake && hostFragmentCheckHostElaboratorResidualRemains && hostFragmentCheckDoesNotClaimPeerGreen && !hostFragmentCheckResidualFreeClaimed && !hostFragmentCheckProductSelfHostCompleteClaimed && !hostFragmentCheckProofCompleteClaimed && !hostFragmentCheckLlvmUnlocked && !hostFragmentCheckProvablyUnlocked"

def hostFragmentCheckReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckReady" with
  | none => false
  | some body => body == hostFragmentCheckReadyTermBody

def hostFragmentCheckResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckPeerGreenBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckDoesNotClaimPeerGreen" with
  | none => false
  | some body => body == "true"

def hostFragmentCheckHostResidualBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckHostElaboratorResidualRemains" with
  | none => false
  | some body => body == "true"

def hostFragmentCheckStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def hostFragmentCheckDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkHostCheckTermDialect (content : String) : Option String :=
  if !hostFragmentCheckReadyBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckCompleteBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckProofBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckLlvmBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckProvablyBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckPeerGreenBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckHostResidualBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineHostCheckWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkHostCheckTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckHostCheckTermSkeletonPrefix : String :=
  "import SystemsLean.HostFront\n" ++
  "namespace SystemsLean.HostCheck\n"

def hostModuleCheckHostCheckTermSkeletonSuffix : String :=
  "end SystemsLean.HostCheck\n"

/-- Honest HostCheck TERM mid: required L0 decls plus living claim pins. -/
def hostCheckTermGoodPins (readyBody residual complete proof llvm provably
    peerGreen hostResidual lake : String) : String :=
  "def stageId : String := \"SLAKE_HOST_FRAGMENT_CHECK_V0\"\n" ++
  "def hostId : String := \"HOST-FRAGMENT-CHECK\"\n" ++
  "def surfaceId : String := \"HOST-FRAGMENT-CHECK\"\n" ++
  "def justRecipe : String := \"host-fragment-check\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostFragmentCheckHostElaboratorResidualRemains : Bool := " ++ hostResidual ++ "\n" ++
  "def hostFragmentCheckDoesNotClaimPeerGreen : Bool := " ++ peerGreen ++ "\n" ++
  "def hostFragmentCheckResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def hostFragmentCheckProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def hostFragmentCheckProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def hostFragmentCheckLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def hostFragmentCheckProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def hostFragmentCheckReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckHostCheckTermGoodMid : String :=
  hostCheckTermGoodPins hostFragmentCheckReadyTermBody
    "false" "false" "false" "false" "false" "true" "true" "true"

def hostModuleCheckGoodHostCheckTermText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostModuleCheckHostCheckTermGoodMid
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckResidualText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "true" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckCompleteText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "true" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckReadyText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins "true"
      "false" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckPeerGreenText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckProofText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "true" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckLlvmText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "false" "true" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckProvablyText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "false" "false" "true" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckLakeText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "false" "false" "false" "true" "true" "false"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostCheckTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.HostCheck"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostCheckTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (hostCheckTermSurfaceFrom content)
    hostCheckExpectedNamespace hostCheckRequiredDecls
    (some "SystemsLean.HostFront")).isAccept

def hostCheckTermDialectReject (content : String) : Bool :=
  match checkHostCheckTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadHostCheckResidualL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckResidualText

def hostModuleCheckBadHostCheckResidualDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckResidualText

def hostModuleCheckBadHostCheckCompleteL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckCompleteText

def hostModuleCheckBadHostCheckCompleteDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckCompleteText

def hostModuleCheckBadHostCheckReadyL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckReadyText

def hostModuleCheckBadHostCheckReadyDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckReadyText

def hostModuleCheckBadHostCheckPeerGreenL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckPeerGreenText

def hostModuleCheckBadHostCheckPeerGreenDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckPeerGreenText

def hostModuleCheckBadHostCheckProofL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckProofText

def hostModuleCheckBadHostCheckProofDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckProofText

def hostModuleCheckBadHostCheckLlvmL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckLlvmText

def hostModuleCheckBadHostCheckLlvmDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckLlvmText

def hostModuleCheckBadHostCheckProvablyL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckProvablyText

def hostModuleCheckBadHostCheckProvablyDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckProvablyText

def hostModuleCheckBadHostCheckLakeL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckLakeText

def hostModuleCheckBadHostCheckLakeDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckLakeText

def hostModuleCheckHostCheckTermDialectOk : Bool :=
  (checkHostCheckTermDialect hostModuleCheckGoodHostCheckTermText).isNone

/-- On-disk HostCheck hostFragmentCheckReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodHostCheckReadyMultilineText : String :=
  "def hostFragmentCheckReady : Bool :=\n" ++
  "  hostFragmentCheckCorpusOk\n" ++
  "    && hostFragmentCheckIdsOk\n" ++
  "    && hostFragmentCheckReusesHostFront\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && hostFragmentCheckStillUsesLake\n" ++
  "    && hostFragmentCheckDependsOnLake\n" ++
  "    && hostFragmentCheckHostElaboratorResidualRemains\n" ++
  "    && hostFragmentCheckDoesNotClaimPeerGreen\n" ++
  "    && !hostFragmentCheckResidualFreeClaimed\n" ++
  "    && !hostFragmentCheckProductSelfHostCompleteClaimed\n" ++
  "    && !hostFragmentCheckProofCompleteClaimed\n" ++
  "    && !hostFragmentCheckLlvmUnlocked\n" ++
  "    && !hostFragmentCheckProvablyUnlocked\n"

/-- Collapse of the on-disk multi-line hostFragmentCheckReady body. -/
def hostModuleCheckHostCheckReadyMultilineOk : Bool :=
  hostFragmentCheckReadyBodyOk hostModuleCheckGoodHostCheckReadyMultilineText

def hostModuleCheckHostCheckTermSurfaceOk : Bool :=
  hostModuleCheckHostCheckTermSurfaceDualOk
    && (checkDepthHostCheckTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthHostCheckTermSurfaceScope == "HostCheck-only")
    && hostModuleCheckHostCheckTermDialectOk
    && hostModuleCheckBadHostCheckResidualDialectReject
    && hostModuleCheckBadHostCheckCompleteDialectReject
    && hostModuleCheckBadHostCheckReadyDialectReject
    && hostModuleCheckBadHostCheckPeerGreenDialectReject
    && hostModuleCheckBadHostCheckProofDialectReject
    && hostModuleCheckBadHostCheckLlvmDialectReject
    && hostModuleCheckBadHostCheckProvablyDialectReject
    && hostModuleCheckBadHostCheckLakeDialectReject
    && hostModuleCheckBadHostCheckResidualL0Accept
    && hostModuleCheckBadHostCheckCompleteL0Accept
    && hostModuleCheckBadHostCheckReadyL0Accept
    && hostModuleCheckBadHostCheckPeerGreenL0Accept
    && hostModuleCheckBadHostCheckProofL0Accept
    && hostModuleCheckBadHostCheckLlvmL0Accept
    && hostModuleCheckBadHostCheckProvablyL0Accept
    && hostModuleCheckBadHostCheckLakeL0Accept
    && hostModuleCheckHostCheckReadyMultilineOk

theorem hostModuleCheckHostCheckTermSurfaceOk_true :
    hostModuleCheckHostCheckTermSurfaceOk = true := by native_decide

theorem hostModuleCheckHostCheckReadyMultilineOk_true :
    hostModuleCheckHostCheckReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_hostCheck_term_surface_ids_eq :
    checkDepthHostCheckTermSurfaceBar = "TERM-SURFACE"
      && checkDepthHostCheckTermSurfaceScope = "HostCheck-only"
      && hostModuleCheckHostCheckTermSurfaceDualOk = true := rfl

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

/-- Parse live HostModuleCheckHostCheckTerm.lean text.
    Greppable: parseLiveHostModuleCheckHostCheckTermSource. -/
def parseLiveHostModuleCheckHostCheckTermSource (src : String) :
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
          { name := HostTerm.n "SystemsLean.HostModuleCheckHostCheckTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckHostCheckTermSource. -/
def kernelCheckLiveHostModuleCheckHostCheckTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckHostCheckTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckHostCheckTermSource
      liveHostModuleCheckHostCheckTermSource with
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
    has "checkDepthHostCheckTermSurfaceBar"
      && has "checkDepthHostCheckTermSurfaceScope"
      && has "hostModuleCheckHostCheckTermSurfaceDualOk"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckHostCheckTerm"

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
      (stripComments liveHostModuleCheckHostCheckTermSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthHostCheckTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckHostCheckTermSurfaceDualOk : Bool := true\n"

/-- Skipped non-literal def needle with a trailing newline. -/
def needleParseOk : String :=
  "def hostModuleCheckHostCheckTermDialectOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckHostCheckTermSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleParseOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckHostCheckTermReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckHostCheckTermReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_HOST_CHECK_TERM_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM")
    && (liveRel == "HostModuleCheckHostCheckTerm.lean")
    && (liveHostModuleCheckHostCheckTermRel ==
      "src/systems/SystemsLean/HostModuleCheckHostCheckTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckHostCheckTermFullHost
    && !hostFrontLiveHostModuleCheckHostCheckTermFullBackend
    && !hostFrontLiveHostModuleCheckHostCheckTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckHostCheckTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckHostCheckTermSource
      liveHostModuleCheckHostCheckTermSource
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
  match parseLiveHostModuleCheckHostCheckTermSource "" with
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
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_HOST_CHECK_TERM_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM")
    ++ bad "liveRel" (liveRel == "HostModuleCheckHostCheckTerm.lean")
    ++ bad "rel" (liveHostModuleCheckHostCheckTermRel ==
      "src/systems/SystemsLean/HostModuleCheckHostCheckTerm.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckHostCheckTermFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckHostCheckTermFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckHostCheckTermResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckHostCheckTermProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckHostCheckTermSource
      liveHostModuleCheckHostCheckTermSource)
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
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostCheckTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckHostCheckTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckHostCheckTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckHostCheckTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckHostCheckTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckHostCheckTerm.lean != liveHostModuleCheckHostCheckTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckHostCheckTerm.lean")
  let r := parseLiveHostModuleCheckHostCheckTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: {parseId} reject {reason}"
    throw (IO.userError s!"{parseId} reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS {parseId} ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckHostCheckTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckHostCheckTerm parse false")
    unless hostFrontLiveHostModuleCheckHostCheckTermReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckHostCheckTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckHostCheckTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckHostCheckTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckHostCheckTermSource
