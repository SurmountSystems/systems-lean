/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckTypesProof.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckTypesProof.lean.
  It is not a neighbor product file.
  Kept: two imports, namespace SystemsLean.HostModuleCheck,
  the literal defs the skip-fold accepts, and end. Open lines are absent.
  App bodies, match bodies, and theorems are skipped. theorem count is 2.
  example and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-TYPES-PROOF,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_TYPES_PROOF_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-TYPES-PROOF, liveRel,
  kernelCheckLiveHostModuleCheckTypesProofSource,
  hostFrontLiveHostModuleCheckTypesProofReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckTypesProofSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckTypesProofSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_TYPES_PROOF_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-TYPES-PROOF"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-TYPES-PROOF"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckTypesProof.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckTypesProofRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckTypesProofFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckTypesProofFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckTypesProofResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckTypesProofProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and dotted names). -/
def liveParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 8192

/-- Kept commands from this parse. The parser decides the count.
    Expected shape: two imports, namespace, literal defs, and end. -/
def liveKeptCmds : Nat := 7

/-- theorem keyword count. Two theorem commands are skip-folded. -/
def liveTheoremCount : Nat := 2

/-- example keyword count. The live file has no example command. -/
def liveExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option command. -/
def liveSetOptionCount : Nat := 0

/-- Import commands kept. Two import lines. -/
def liveImportCount : Nat := 2

/-- On-disk HostModuleCheckTypesProof.lean bytes.
    Greppable: liveHostModuleCheckTypesProofSource. -/
def liveHostModuleCheckTypesProofSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- TypesTheorems L3 proof-surface pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: TypesTheorems dialect proof checks only. Same namespace
  SystemsLean.HostModuleCheck.

  TypesTheorems L3 dialect subset (documented; not full Lean 4 tactic elaborator):
  - ofKindTag?_zero: statement must be ofKindTag? 0 = some NodeKind.value
    (reject : True); proof body after := must be rfl (reject by sorry / trivial).
  - isValidKindTag_zero: statement isValidKindTag 0 = true; proof body rfl.
  Other TypesTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckTypesProofSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckTypesProofSurfaceOk (E-good dialect +
    P1/P2 dialect reject + L0Accept). Driver smoke folds SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - TypesTheorems pilot only -- not package elaborate L4.
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged
    (HostModuleCheckMultProof).
  - LinearTheorems PROOF-SURFACE LinearTheorems-only dual-ok unchanged
    (HostModuleCheckLinearProof).
  - Mult..Extract L2 TERM-SURFACE dual-ok pins unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok for TypesTheorems is TypesTheorems-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckTypesProof,
  PROOF-SURFACE, TypesTheorems-only, ILL-TYPED-PROOF,
  checkTypesTheoremsProofDialect, refineTypesTheoremsWithProofSurface,
  hostModuleCheckBadTypesThmWrongStmtText,
  hostModuleCheckBadTypesThmSorryText,
  hostModuleCheckTypesProofSurfaceOk, TypesTheorems proof-surface pilot,
  hostModuleCheckTypesProofSurfaceDualOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckTypesProof
  Red/green: lake build SystemsLean.HostModuleCheckTypesProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultProof

namespace SystemsLean.HostModuleCheck

/-! ### TypesTheorems L3 proof-surface dual-ok pins (TypesTheorems-only) -/

/-- Named proof-surface depth bar reused for TypesTheorems L3 pilot honesty.
    Greppable: checkDepthTypesProofSurfaceBar, PROOF-SURFACE,
    TypesTheorems-only. -/
def checkDepthTypesProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: TypesTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthTypesProofSurfaceScope, TypesTheorems-only,
    PROOF-SURFACE. -/
def checkDepthTypesProofSurfaceScope : String := "TypesTheorems-only"

/-- Dual-ok when TypesTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckTypesProofSurfaceDualOk, PROOF-SURFACE,
    TypesTheorems-only. -/
def hostModuleCheckTypesProofSurfaceDualOk : Bool := true

/-! ### TypesTheorems L3 dialect checks (reuse MultProof line helpers) -/

/-- ofKindTag?_zero statement is ofKindTag? 0 = some NodeKind.value (not True).
    Greppable: typesThmOfKindTagZeroStmtOk, PROOF-SURFACE. -/
def typesThmOfKindTagZeroStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "ofKindTag?_zero" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "ofKindTag?_zero"
    let n := collapseWsProof stmt
    (n.splitOn "ofKindTag? 0 = some NodeKind.value").length > 1
      && !((n.splitOn "True").length > 1)

/-- ofKindTag?_zero proof body is exactly rfl.
    Greppable: typesThmOfKindTagZeroProofOk, PROOF-SURFACE. -/
def typesThmOfKindTagZeroProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "ofKindTag?_zero" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- isValidKindTag_zero statement is isValidKindTag 0 = true (not True).
    Greppable: typesThmIsValidKindTagZeroStmtOk, PROOF-SURFACE. -/
def typesThmIsValidKindTagZeroStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "isValidKindTag_zero" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "isValidKindTag_zero"
    let n := collapseWsProof stmt
    (n.splitOn "isValidKindTag 0 = true").length > 1
      && !((n.splitOn "True").length > 1)

/-- isValidKindTag_zero proof body is exactly rfl.
    Greppable: typesThmIsValidKindTagZeroProofOk, PROOF-SURFACE. -/
def typesThmIsValidKindTagZeroProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "isValidKindTag_zero" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- TypesTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkTypesTheoremsProofDialect, PROOF-SURFACE,
    TypesTheorems proof-surface pilot. -/
def checkTypesTheoremsProofDialect (content : String) : Option String :=
  if !typesThmOfKindTagZeroStmtOk content then some reasonIllTypedProof
  else if !typesThmOfKindTagZeroProofOk content then some reasonIllTypedProof
  else if !typesThmIsValidKindTagZeroStmtOk content then some reasonIllTypedProof
  else if !typesThmIsValidKindTagZeroProofOk content then some reasonIllTypedProof
  else none

/-- Apply TypesTheorems L3 after a structural TypesTheorems accept.
    Greppable: refineTypesTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineTypesTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkTypesTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### TypesTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed TypesTheorems L3 good text (ofKindTag?_zero + isValidKindTag_zero
    rfl pins; remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodTypesTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodTypesTheoremsProofText : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.Types\n" ++
  "theorem ofKindTag?_zero : ofKindTag? 0 = some NodeKind.value := rfl\n" ++
  "theorem ofKindTag?_one : ofKindTag? 1 = some NodeKind.linear := rfl\n" ++
  "theorem ofKindTag?_two : ofKindTag? 2 = some NodeKind.erased := rfl\n" ++
  "theorem ofKindTag?_fail_closed (n : Nat) (h : 2 < n) : ofKindTag? n = none := by sorry\n" ++
  "theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl\n" ++
  "theorem isValidKindTag_one : isValidKindTag 1 = true := rfl\n" ++
  "theorem isValidKindTag_two : isValidKindTag 2 = true := rfl\n" ++
  "theorem isValidKindTag_fail_closed (n : Nat) (h : 2 < n) : isValidKindTag n = false := by sorry\n" ++
  "theorem kindMultOk_value_omega : True := trivial\n" ++
  "theorem kindMultOk_linear_one : True := trivial\n" ++
  "theorem kindMultOk_erased_zero : True := trivial\n" ++
  "theorem expectedMult_value : True := trivial\n" ++
  "theorem expectedMult_linear : True := trivial\n" ++
  "theorem expectedMult_erased : True := trivial\n" ++
  "end SystemsLean.Types\n"

/-! ### Ill-typed TypesTheorems twins (P1/P2). L0 tokens present; L3 must reject. -/

/-- Shared TypesTheorems body with ofKindTag?_zero / isValidKindTag_zero slots.
    Keeps 14 required theorem names for L0 accept dual-pin. -/
def typesTheoremsTwinSkeleton (ofKindTagZeroLine : String)
    (isValidKindTagZeroLine : String) : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.Types\n" ++
  ofKindTagZeroLine ++ "\n" ++
  "theorem ofKindTag?_one : ofKindTag? 1 = some NodeKind.linear := rfl\n" ++
  "theorem ofKindTag?_two : ofKindTag? 2 = some NodeKind.erased := rfl\n" ++
  "theorem ofKindTag?_fail_closed (n : Nat) (h : 2 < n) : ofKindTag? n = none := by sorry\n" ++
  isValidKindTagZeroLine ++ "\n" ++
  "theorem isValidKindTag_one : isValidKindTag 1 = true := rfl\n" ++
  "theorem isValidKindTag_two : isValidKindTag 2 = true := rfl\n" ++
  "theorem isValidKindTag_fail_closed (n : Nat) (h : 2 < n) : isValidKindTag n = false := by sorry\n" ++
  "theorem kindMultOk_value_omega : True := trivial\n" ++
  "theorem kindMultOk_linear_one : True := trivial\n" ++
  "theorem kindMultOk_erased_zero : True := trivial\n" ++
  "theorem expectedMult_value : True := trivial\n" ++
  "theorem expectedMult_linear : True := trivial\n" ++
  "theorem expectedMult_erased : True := trivial\n" ++
  "end SystemsLean.Types\n"

/-- P1: wrong statement on ofKindTag?_zero (True / trivial). L0 still has
    theorem:ofKindTag?_zero.
    Greppable: hostModuleCheckBadTypesThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmWrongStmtText : String :=
  typesTheoremsTwinSkeleton
    "theorem ofKindTag?_zero : True := trivial"
    "theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl"

/-- P2: by sorry on ofKindTag?_zero where real proof is rfl. L0 still has
    theorem:ofKindTag?_zero.
    Greppable: hostModuleCheckBadTypesThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmSorryText : String :=
  typesTheoremsTwinSkeleton
    "theorem ofKindTag?_zero : ofKindTag? 0 = some NodeKind.value := by sorry"
    "theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from TypesTheorems twin text for L0 dual-pin. -/
def typesTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.TypesTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadTypesThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface
    (typesTheoremsProofSurfaceFrom hostModuleCheckBadTypesThmWrongStmtText)
    typesExpectedNamespace typesTheoremsRequiredDecls
    (some "SystemsLean.Types")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadTypesThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmSorryL0Accept : Bool :=
  (checkNamedSurface
    (typesTheoremsProofSurfaceFrom hostModuleCheckBadTypesThmSorryText)
    typesExpectedNamespace typesTheoremsRequiredDecls
    (some "SystemsLean.Types")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckTypesProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckTypesProofDialectOk : Bool :=
  (checkTypesTheoremsProofDialect
    hostModuleCheckGoodTypesTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadTypesThmWrongStmtDialectReject, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmWrongStmtDialectReject : Bool :=
  match checkTypesTheoremsProofDialect hostModuleCheckBadTypesThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadTypesThmSorryDialectReject, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmSorryDialectReject : Bool :=
  match checkTypesTheoremsProofDialect hostModuleCheckBadTypesThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined TypesTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone).
    Greppable: hostModuleCheckTypesProofSurfaceOk, PROOF-SURFACE,
    TypesTheorems-only. -/
def hostModuleCheckTypesProofSurfaceOk : Bool :=
  hostModuleCheckTypesProofSurfaceDualOk
    && (checkDepthTypesProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthTypesProofSurfaceScope == "TypesTheorems-only")
    && hostModuleCheckTypesProofDialectOk
    && hostModuleCheckBadTypesThmWrongStmtDialectReject
    && hostModuleCheckBadTypesThmSorryDialectReject
    && hostModuleCheckBadTypesThmWrongStmtL0Accept
    && hostModuleCheckBadTypesThmSorryL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckTypesProofSurfaceOk_true, PROOF-SURFACE. -/
theorem hostModuleCheckTypesProofSurfaceOk_true :
    hostModuleCheckTypesProofSurfaceOk = true := by native_decide

theorem hostModuleCheck_types_proof_surface_ids_eq :
    checkDepthTypesProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthTypesProofSurfaceScope = "TypesTheorems-only"
      && hostModuleCheckTypesProofSurfaceDualOk = true := rfl

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

/-- Parse live HostModuleCheckTypesProof.lean text.
    Greppable: parseLiveHostModuleCheckTypesProofSource. -/
def parseLiveHostModuleCheckTypesProofSource (src : String) :
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
          { name := HostTerm.n "SystemsLean.HostModuleCheckTypesProof"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckTypesProofSource. -/
def kernelCheckLiveHostModuleCheckTypesProofSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckTypesProofSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckTypesProofSource
      liveHostModuleCheckTypesProofSource with
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
    has "checkDepthTypesProofSurfaceBar"
      && has "checkDepthTypesProofSurfaceScope"
      && has "hostModuleCheckTypesProofSurfaceDualOk"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckTypesProof"

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

/-- Live parse keeps the two imports. -/
def liveParseImportCountOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let n := m.commands.foldl (fun acc c =>
      match c with
      | Cmd.importModule _ => acc + 1
      | _ => acc) 0
    n == liveImportCount

/-- Keyword counts: theorem is 2. example and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveHostModuleCheckTypesProofSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthTypesProofSurfaceBar : String := \"PROOF-SURFACE\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckTypesProofSurfaceDualOk : Bool := true\n"

/-- Literal scope def needle with a trailing newline. -/
def needleScope : String :=
  "def checkDepthTypesProofSurfaceScope : String := \"TypesTheorems-only\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckTypesProofSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleScope).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckTypesProofReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckTypesProofReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_TYPES_PROOF_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-TYPES-PROOF")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-TYPES-PROOF")
    && (liveRel == "HostModuleCheckTypesProof.lean")
    && (liveHostModuleCheckTypesProofRel ==
      "src/systems/SystemsLean/HostModuleCheckTypesProof.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckTypesProofFullHost
    && !hostFrontLiveHostModuleCheckTypesProofFullBackend
    && !hostFrontLiveHostModuleCheckTypesProofResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckTypesProofProvablyUnlocked
    && kernelCheckLiveHostModuleCheckTypesProofSource
      liveHostModuleCheckTypesProofSource
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
  match parseLiveHostModuleCheckTypesProofSource "" with
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
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_TYPES_PROOF_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-TYPES-PROOF")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-TYPES-PROOF")
    ++ bad "liveRel" (liveRel == "HostModuleCheckTypesProof.lean")
    ++ bad "rel" (liveHostModuleCheckTypesProofRel ==
      "src/systems/SystemsLean/HostModuleCheckTypesProof.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckTypesProofFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckTypesProofFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckTypesProofResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckTypesProofProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckTypesProofSource
      liveHostModuleCheckTypesProofSource)
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
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesProofRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckTypesProofRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckTypesProofRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckTypesProofRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckTypesProofSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckTypesProof.lean != liveHostModuleCheckTypesProofSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckTypesProof.lean")
  let r := parseLiveHostModuleCheckTypesProofSource disk
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
      IO.eprintln "error: kernelCheck live HostModuleCheckTypesProof parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckTypesProof parse false")
    unless hostFrontLiveHostModuleCheckTypesProofReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckTypesProofReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckTypesProof source was accepted"
      throw (IO.userError "empty HostModuleCheckTypesProof source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckTypesProofSource
