/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckTypesSubsetEmitTerm.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckTypesSubsetEmitTerm.lean.
  It is not a neighbor product file.
  Kept: five imports, namespace SystemsLean.HostModuleCheck,
  the literal defs the skip-fold accepts, and end. Open lines are absent.
  App bodies, match bodies, and theorems are skipped. theorem count is 3.
  example and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_TYPES_SUBSET_EMIT_TERM_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM, liveRel,
  kernelCheckLiveHostModuleCheckTypesSubsetEmitTermSource,
  hostFrontLiveHostModuleCheckTypesSubsetEmitTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_TYPES_SUBSET_EMIT_TERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckTypesSubsetEmitTerm.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckTypesSubsetEmitTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckTypesSubsetEmitTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckTypesSubsetEmitTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckTypesSubsetEmitTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckTypesSubsetEmitTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and dotted names). -/
def liveParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 8192

/-- Kept commands from this parse. Counted on this file:
    five imports, namespace, bar, scope, dual-ok, suffix, and end.
    Not a copied neighbor count. -/
def liveKeptCmds : Nat := 11

/-- theorem keyword count. Three theorem commands are skip-folded. -/
def liveTheoremCount : Nat := 3

/-- example keyword count. The live file has no example command. -/
def liveExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option command. -/
def liveSetOptionCount : Nat := 0

/-- Import commands kept. Five import lines. -/
def liveImportCount : Nat := 5

/-- On-disk HostModuleCheckTypesSubsetEmitTerm.lean bytes.
    Greppable: liveHostModuleCheckTypesSubsetEmitTermSource. -/
def liveHostModuleCheckTypesSubsetEmitTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- TypesSubsetEmit L2 term-surface (TypesSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: TypesSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  TypesSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Types emit dialect body matches product (emitTypesReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - typesSubsetEmitReady compose matches product (CompilePathTypes chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckTypesSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckTypesSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - TypesSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckTypesSubsetEmitTerm, TERM-SURFACE, TypesSubsetEmit-only,
  ILL-TYPED-TERM, checkTypesSubsetEmitTermDialect,
  hostModuleCheckTypesSubsetEmitTermDialectOk,
  hostModuleCheckTypesSubsetEmitTermSurfaceDualOk,
  hostModuleCheckTypesSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckTypesSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckTypesSubsetEmitTerm;
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

/-! ### TypesSubsetEmit L2 term-surface dual-ok pins (TypesSubsetEmit-only) -/

def checkDepthTypesSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthTypesSubsetEmitTermSurfaceScope : String := "TypesSubsetEmit-only"
def hostModuleCheckTypesSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product typesSubsetEmitReady fold (Types fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk TypesSubsetEmit match. -/
def typesSubsetEmitReadyTermBody : String :=
  "typesSubsetEmitInputReady && typesSubsetEmitTypesDialectOk && typesSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !typesSubsetEmitResidualFreeClaimed && !typesSubsetEmitProductSelfHostCompleteClaimed && !typesSubsetEmitProofCompleteClaimed && !typesSubsetEmitLlvmUnlocked && !typesSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_TYPES_SUBSET_EMIT_V0\") && (hostId == \"HOST-TYPES-SUBSET-EMIT\") && (surfaceId == \"TYPES-SUBSET-EMIT\") && (typesSubsetEmitInputId == \"SLAKE_TYPES_SUBSET_TYPES\") && (lakeExeName == \"slake-types-subset-emit\") && (justRecipe == \"types-subset-emit\")"

def typesSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetEmitTypesDialectOk" with
  | none => false
  | some body => body == "emitTypesReady"

def typesSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def typesSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def typesSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetEmitReady" with
  | none => false
  | some body => body == typesSubsetEmitReadyTermBody

def checkTypesSubsetEmitTermDialect (content : String) : Option String :=
  if !typesSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineTypesSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkTypesSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckTypesSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathTypes\n" ++
  "import SystemsLean.EmitTypes\n" ++
  "namespace SystemsLean.TypesSubsetEmit\n"

def hostModuleCheckTypesSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.TypesSubsetEmit\n"

def hostModuleCheckTypesSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodTypesSubsetEmitTermText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckTypesSubsetEmitTermGoodMid
    ++ hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetEmitResidualText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetEmitEmitText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := true\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetEmitReadyText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := true\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetEmitCompleteText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def typesSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.TypesSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadTypesSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (typesSubsetEmitTermSurfaceFrom
      hostModuleCheckBadTypesSubsetEmitResidualText)
    typesSubsetEmitExpectedNamespace typesSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathTypes")).isAccept

def hostModuleCheckBadTypesSubsetEmitResidualDialectReject : Bool :=
  match checkTypesSubsetEmitTermDialect hostModuleCheckBadTypesSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (typesSubsetEmitTermSurfaceFrom
      hostModuleCheckBadTypesSubsetEmitEmitText)
    typesSubsetEmitExpectedNamespace typesSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathTypes")).isAccept

def hostModuleCheckBadTypesSubsetEmitEmitDialectReject : Bool :=
  match checkTypesSubsetEmitTermDialect hostModuleCheckBadTypesSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (typesSubsetEmitTermSurfaceFrom
      hostModuleCheckBadTypesSubsetEmitReadyText)
    typesSubsetEmitExpectedNamespace typesSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathTypes")).isAccept

def hostModuleCheckBadTypesSubsetEmitReadyDialectReject : Bool :=
  match checkTypesSubsetEmitTermDialect hostModuleCheckBadTypesSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (typesSubsetEmitTermSurfaceFrom
      hostModuleCheckBadTypesSubsetEmitCompleteText)
    typesSubsetEmitExpectedNamespace typesSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathTypes")).isAccept

def hostModuleCheckBadTypesSubsetEmitCompleteDialectReject : Bool :=
  match checkTypesSubsetEmitTermDialect hostModuleCheckBadTypesSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckTypesSubsetEmitTermDialectOk : Bool :=
  (checkTypesSubsetEmitTermDialect hostModuleCheckGoodTypesSubsetEmitTermText).isNone

/-- On-disk TypesSubsetEmit typesSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodTypesSubsetEmitReadyMultilineText : String :=
  "def typesSubsetEmitReady : Bool :=\n" ++
  "  typesSubsetEmitInputReady\n" ++
  "    && typesSubsetEmitTypesDialectOk\n" ++
  "    && typesSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !typesSubsetEmitResidualFreeClaimed\n" ++
  "    && !typesSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !typesSubsetEmitProofCompleteClaimed\n" ++
  "    && !typesSubsetEmitLlvmUnlocked\n" ++
  "    && !typesSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_TYPES_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-TYPES-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"TYPES-SUBSET-EMIT\")\n" ++
  "    && (typesSubsetEmitInputId == \"SLAKE_TYPES_SUBSET_TYPES\")\n" ++
  "    && (lakeExeName == \"slake-types-subset-emit\")\n" ++
  "    && (justRecipe == \"types-subset-emit\")\n"

/-- Collapse of the on-disk multi-line typesSubsetEmitReady body. -/
def hostModuleCheckTypesSubsetEmitReadyMultilineOk : Bool :=
  typesSubsetEmitReadyBodyOk hostModuleCheckGoodTypesSubsetEmitReadyMultilineText

def hostModuleCheckTypesSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckTypesSubsetEmitTermSurfaceDualOk
    && (checkDepthTypesSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthTypesSubsetEmitTermSurfaceScope == "TypesSubsetEmit-only")
    && hostModuleCheckTypesSubsetEmitTermDialectOk
    && hostModuleCheckBadTypesSubsetEmitResidualDialectReject
    && hostModuleCheckBadTypesSubsetEmitEmitDialectReject
    && hostModuleCheckBadTypesSubsetEmitReadyDialectReject
    && hostModuleCheckBadTypesSubsetEmitCompleteDialectReject
    && hostModuleCheckBadTypesSubsetEmitResidualL0Accept
    && hostModuleCheckBadTypesSubsetEmitEmitL0Accept
    && hostModuleCheckBadTypesSubsetEmitReadyL0Accept
    && hostModuleCheckBadTypesSubsetEmitCompleteL0Accept
    && hostModuleCheckTypesSubsetEmitReadyMultilineOk

theorem hostModuleCheckTypesSubsetEmitTermSurfaceOk_true :
    hostModuleCheckTypesSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckTypesSubsetEmitReadyMultilineOk_true :
    hostModuleCheckTypesSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_typesSubsetEmit_term_surface_ids_eq :
    checkDepthTypesSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthTypesSubsetEmitTermSurfaceScope = "TypesSubsetEmit-only"
      && hostModuleCheckTypesSubsetEmitTermSurfaceDualOk = true := rfl

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

/-- Parse live HostModuleCheckTypesSubsetEmitTerm.lean text.
    Greppable: parseLiveHostModuleCheckTypesSubsetEmitTermSource. -/
def parseLiveHostModuleCheckTypesSubsetEmitTermSource (src : String) :
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
          { name := HostTerm.n "SystemsLean.HostModuleCheckTypesSubsetEmitTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckTypesSubsetEmitTermSource. -/
def kernelCheckLiveHostModuleCheckTypesSubsetEmitTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckTypesSubsetEmitTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckTypesSubsetEmitTermSource
      liveHostModuleCheckTypesSubsetEmitTermSource with
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
    has "checkDepthTypesSubsetEmitTermSurfaceBar"
      && has "checkDepthTypesSubsetEmitTermSurfaceScope"
      && has "hostModuleCheckTypesSubsetEmitTermSurfaceDualOk"
      && has "hostModuleCheckTypesSubsetEmitTermSkeletonSuffix"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckTypesSubsetEmitTerm"

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
      (stripComments liveHostModuleCheckTypesSubsetEmitTermSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthTypesSubsetEmitTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckTypesSubsetEmitTermSurfaceDualOk : Bool := true\n"

/-- Literal scope def needle with a trailing newline. -/
def needleScope : String :=
  "def checkDepthTypesSubsetEmitTermSurfaceScope : String := \"TypesSubsetEmit-only\"\n"

/-- Literal suffix def needle with a trailing newline. -/
def needleSuffix : String :=
  "def hostModuleCheckTypesSubsetEmitTermSkeletonSuffix : String :=\n  \"end SystemsLean.TypesSubsetEmit\\n\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckTypesSubsetEmitTermSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleScope).length > 1
    && (src.splitOn needleSuffix).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckTypesSubsetEmitTermReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckTypesSubsetEmitTermReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_TYPES_SUBSET_EMIT_TERM_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM")
    && (liveRel == "HostModuleCheckTypesSubsetEmitTerm.lean")
    && (liveHostModuleCheckTypesSubsetEmitTermRel ==
      "src/systems/SystemsLean/HostModuleCheckTypesSubsetEmitTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckTypesSubsetEmitTermFullHost
    && !hostFrontLiveHostModuleCheckTypesSubsetEmitTermFullBackend
    && !hostFrontLiveHostModuleCheckTypesSubsetEmitTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckTypesSubsetEmitTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckTypesSubsetEmitTermSource
      liveHostModuleCheckTypesSubsetEmitTermSource
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
  match parseLiveHostModuleCheckTypesSubsetEmitTermSource "" with
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
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_TYPES_SUBSET_EMIT_TERM_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM")
    ++ bad "liveRel" (liveRel == "HostModuleCheckTypesSubsetEmitTerm.lean")
    ++ bad "rel" (liveHostModuleCheckTypesSubsetEmitTermRel ==
      "src/systems/SystemsLean/HostModuleCheckTypesSubsetEmitTerm.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckTypesSubsetEmitTermFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckTypesSubsetEmitTermFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckTypesSubsetEmitTermResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckTypesSubsetEmitTermProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckTypesSubsetEmitTermSource
      liveHostModuleCheckTypesSubsetEmitTermSource)
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
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesSubsetEmitTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckTypesSubsetEmitTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckTypesSubsetEmitTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckTypesSubsetEmitTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckTypesSubsetEmitTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckTypesSubsetEmitTerm.lean != liveHostModuleCheckTypesSubsetEmitTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckTypesSubsetEmitTerm.lean")
  let r := parseLiveHostModuleCheckTypesSubsetEmitTermSource disk
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
      IO.eprintln "error: kernelCheck live HostModuleCheckTypesSubsetEmitTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckTypesSubsetEmitTerm parse false")
    unless hostFrontLiveHostModuleCheckTypesSubsetEmitTermReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckTypesSubsetEmitTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckTypesSubsetEmitTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckTypesSubsetEmitTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource
