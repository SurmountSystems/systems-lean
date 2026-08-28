/-
  SYSTEMS_LEAN_HOST partial -- Linear L2 term-surface pilot (beyond Mult-only).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Linear dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Linear L2 dialect subset (documented; not full Lean 4 elaborator):
  - Checkable def shapes from Linear.lean SSOT (not Mult inductive):
    shareNat body n + n with Nat return; polyId body x; mult0ClassId "MULT-0".
  - If roundTrip def header present (incl. noncomputable), body must be
    consume (mkToken n). E-bad twin LT4 rejects wrong composition.
  - Axiom Token / mkToken / consume stay L0 token presence only (LINEAR-AXIOMS-
    REMAIN honesty: axiom *bodies* are never L2 typechecked -- only greppable
    axiom:Name tokens at L0; no twin invents typed axiom payloads).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLinearTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLinearTermSurfaceOk (E-good dialect + LT1..LT4
    dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk, not bare
    dualOk alone.

  Intentional non-claims:
  - Linear pilot only -- not package elaborate, not LinearTheorems L3 proof.
  - Mult TERM-SURFACE Mult-only dual-ok unchanged (HostModuleCheckMultTerm).
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for Linear is Linear-only honesty when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckLinearTerm,
  TERM-SURFACE, Linear-only, ILL-TYPED-TERM, checkLinearTermDialect,
  hostModuleCheckBadLinearShareNatReturnTypeText,
  hostModuleCheckBadLinearPolyIdBodyText,
  hostModuleCheckBadLinearMult0ClassIdText,
  hostModuleCheckBadLinearRoundTripBodyText,
  hostModuleCheckLinearTermDialectOk, Linear term-surface pilot,
  hostModuleCheckLinearTermSurfaceDualOk, hostModuleCheckLinearTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckLinearTerm
  Red/green: lake build SystemsLean.HostModuleCheckLinearTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

/-! ### Linear L2 term-surface dual-ok pins (Linear-only; coexists with Mult-only) -/

/-- Named term-surface depth bar reused for Linear L2 pilot honesty.
    Greppable: checkDepthLinearTermSurfaceBar, TERM-SURFACE, Linear-only. -/
def checkDepthLinearTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: Linear.lean pilot only (not package elaborate; not Mult).
    Greppable: checkDepthLinearTermSurfaceScope, Linear-only, TERM-SURFACE. -/
def checkDepthLinearTermSurfaceScope : String := "Linear-only"

/-- Dual-ok when Linear L2 E-good/E-bad rejects work (Linear pilot only).
    Greppable: hostModuleCheckLinearTermSurfaceDualOk, TERM-SURFACE, Linear-only. -/
def hostModuleCheckLinearTermSurfaceDualOk : Bool := true

/-! ### Linear dialect line helpers (reuse Mult collapse / def parse) -/

/-- Strip leading noncomputable (and spaces) so roundTrip headers parse as def.
    Greppable: stripNoncomputablePrefix, TERM-SURFACE, Linear-only. -/
def stripNoncomputablePrefix (line : String) : String :=
  let t := trim (stripLineComment line)
  if hasPrefix t "noncomputable " then
    trim (String.Slice.toString (t.drop "noncomputable ".length))
  else t

/-- True when line is def name (optionally after noncomputable).
    Greppable: isDefNamedLinear, TERM-SURFACE, Linear-only. -/
def isDefNamedLinear (line : String) (name : String) : Bool :=
  isDefNamed line name
    || isDefNamed (stripNoncomputablePrefix line) name

/-- First non-comment def name line (allows noncomputable def).
    Greppable: findDefHeaderLineLinear, TERM-SURFACE, Linear-only. -/
def findDefHeaderLineLinear (content : String) (name : String) : Option String :=
  let rec go (inBlock : Bool) : List String -> Option String
    | [] => none
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then go false rest
        else go true rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then go false rest
          else go true rest
        else if isDefNamedLinear line name then some line
        else go false rest
  go false (content.splitOn "\n")

/-- J5-style: shareNat claims Nat return and body is exactly n + n.
    Greppable: linearShareNatOk, TERM-SURFACE, Linear-only. -/
def linearShareNatOk (content : String) : Bool :=
  match findDefHeaderLineLinear content "shareNat" with
  | none => false
  | some line =>
    let n := collapseWs (stripLineComment line)
    let hasNatRet :=
      (n.splitOn ") : Nat").length > 1 || (n.splitOn ": Nat :=").length > 1
    let hasBadRet :=
      (n.splitOn ": Bool").length > 1 || (n.splitOn ": String").length > 1
    let body := collapseWs (bodyAfterAssign line)
    hasNatRet && !hasBadRet && body == "n + n"

/-- J5-style: polyId body is exactly x.
    Greppable: linearPolyIdOk, TERM-SURFACE, Linear-only. -/
def linearPolyIdOk (content : String) : Bool :=
  match findDefHeaderLineLinear content "polyId" with
  | none => false
  | some line =>
    let body := collapseWs (bodyAfterAssign line)
    body == "x"

/-- Class-id honesty pin: mult0ClassId body is "MULT-0".
    Greppable: linearMult0ClassIdOk, TERM-SURFACE, Linear-only. -/
def linearMult0ClassIdOk (content : String) : Bool :=
  match findDefHeaderLineLinear content "mult0ClassId" with
  | none => false
  | some line =>
    let body := collapseWs (bodyAfterAssign line)
    body == "\"MULT-0\""

/-- Optional roundTrip composition: if present, body consume (mkToken n).
    Greppable: linearRoundTripOk, TERM-SURFACE, Linear-only. -/
def linearRoundTripOk (content : String) : Bool :=
  match findDefHeaderLineLinear content "roundTrip" with
  | none => true
  | some line =>
    let body := collapseWs (bodyAfterAssign line)
    body == "consume (mkToken n)"

/-- Linear L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkLinearTermDialect, TERM-SURFACE, Linear term-surface pilot. -/
def checkLinearTermDialect (content : String) : Option String :=
  if !linearShareNatOk content then some reasonIllTypedTerm
  else if !linearPolyIdOk content then some reasonIllTypedTerm
  else if !linearMult0ClassIdOk content then some reasonIllTypedTerm
  else if !linearRoundTripOk content then some reasonIllTypedTerm
  else none

/-- Apply Linear L2 after a structural Linear accept.
    Greppable: refineLinearWithTermSurface, TERM-SURFACE, Linear-only. -/
def refineLinearWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLinearTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### Linear L2 well-typed good fixture (E-good; stronger than bare L0 skeleton) -/

/-- Well-typed Linear L2 good text (shareNat/polyId/class ids + roundTrip).
    Greppable: hostModuleCheckGoodLinearTermText, TERM-SURFACE, Linear-only. -/
def hostModuleCheckGoodLinearTermText : String :=
  "namespace SystemsLean.Linear\n" ++
  "def shareNat (n : Nat) : Nat := n + n\n" ++
  "axiom Token : Type\n" ++
  "axiom mkToken : Nat -> Token\n" ++
  "axiom consume : Token -> Nat\n" ++
  "noncomputable def roundTrip (n : Nat) : Nat := consume (mkToken n)\n" ++
  "def polyId {a : Type} (x : a) : a := x\n" ++
  "def mult0ClassId : String := \"MULT-0\"\n" ++
  "def mult1ClassId : String := \"MULT-1\"\n" ++
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "def linearAxiomsRemainId : String := \"LINEAR-AXIOMS-REMAIN\"\n" ++
  "def affineNotFirstClassId : String := \"AFFINE-NOT-FIRST-CLASS\"\n" ++
  "def linearAxiomInventoryOk : Bool := true\n" ++
  "end SystemsLean.Linear\n"

/-! ### Ill-typed Linear twins (L0 tokens present; L2 must reject). -/

/-- LT1: wrong shareNat return type (Bool). L0 still has def:shareNat.
    Greppable: hostModuleCheckBadLinearShareNatReturnTypeText, TERM-SURFACE. -/
def hostModuleCheckBadLinearShareNatReturnTypeText : String :=
  "namespace SystemsLean.Linear\n" ++
  "def shareNat (n : Nat) : Bool := true\n" ++
  "axiom Token : Type\n" ++
  "axiom mkToken : Nat -> Token\n" ++
  "axiom consume : Token -> Nat\n" ++
  "def polyId {a : Type} (x : a) : a := x\n" ++
  "def mult0ClassId : String := \"MULT-0\"\n" ++
  "def mult1ClassId : String := \"MULT-1\"\n" ++
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "def linearAxiomsRemainId : String := \"LINEAR-AXIOMS-REMAIN\"\n" ++
  "def affineNotFirstClassId : String := \"AFFINE-NOT-FIRST-CLASS\"\n" ++
  "def linearAxiomInventoryOk : Bool := true\n" ++
  "end SystemsLean.Linear\n"

/-- LT2: polyId body not identity. L0 still has def:polyId.
    Greppable: hostModuleCheckBadLinearPolyIdBodyText, TERM-SURFACE. -/
def hostModuleCheckBadLinearPolyIdBodyText : String :=
  "namespace SystemsLean.Linear\n" ++
  "def shareNat (n : Nat) : Nat := n + n\n" ++
  "axiom Token : Type\n" ++
  "axiom mkToken : Nat -> Token\n" ++
  "axiom consume : Token -> Nat\n" ++
  "def polyId {a : Type} (x : a) : a := true\n" ++
  "def mult0ClassId : String := \"MULT-0\"\n" ++
  "def mult1ClassId : String := \"MULT-1\"\n" ++
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "def linearAxiomsRemainId : String := \"LINEAR-AXIOMS-REMAIN\"\n" ++
  "def affineNotFirstClassId : String := \"AFFINE-NOT-FIRST-CLASS\"\n" ++
  "def linearAxiomInventoryOk : Bool := true\n" ++
  "end SystemsLean.Linear\n"

/-- LT3: mult0ClassId wrong string pin. L0 still has def:mult0ClassId.
    Greppable: hostModuleCheckBadLinearMult0ClassIdText, TERM-SURFACE. -/
def hostModuleCheckBadLinearMult0ClassIdText : String :=
  "namespace SystemsLean.Linear\n" ++
  "def shareNat (n : Nat) : Nat := n + n\n" ++
  "axiom Token : Type\n" ++
  "axiom mkToken : Nat -> Token\n" ++
  "axiom consume : Token -> Nat\n" ++
  "def polyId {a : Type} (x : a) : a := x\n" ++
  "def mult0ClassId : String := \"MULT-1\"\n" ++
  "def mult1ClassId : String := \"MULT-1\"\n" ++
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "def linearAxiomsRemainId : String := \"LINEAR-AXIOMS-REMAIN\"\n" ++
  "def affineNotFirstClassId : String := \"AFFINE-NOT-FIRST-CLASS\"\n" ++
  "def linearAxiomInventoryOk : Bool := true\n" ++
  "end SystemsLean.Linear\n"

/-- LT4: roundTrip wrong composition (consume n, not consume (mkToken n)).
    L0 does not require def:roundTrip so tokens still satisfy required decls.
    Greppable: hostModuleCheckBadLinearRoundTripBodyText, TERM-SURFACE. -/
def hostModuleCheckBadLinearRoundTripBodyText : String :=
  "namespace SystemsLean.Linear\n" ++
  "def shareNat (n : Nat) : Nat := n + n\n" ++
  "axiom Token : Type\n" ++
  "axiom mkToken : Nat -> Token\n" ++
  "axiom consume : Token -> Nat\n" ++
  "noncomputable def roundTrip (n : Nat) : Nat := consume n\n" ++
  "def polyId {a : Type} (x : a) : a := x\n" ++
  "def mult0ClassId : String := \"MULT-0\"\n" ++
  "def mult1ClassId : String := \"MULT-1\"\n" ++
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "def linearAxiomsRemainId : String := \"LINEAR-AXIOMS-REMAIN\"\n" ++
  "def affineNotFirstClassId : String := \"AFFINE-NOT-FIRST-CLASS\"\n" ++
  "def linearAxiomInventoryOk : Bool := true\n" ++
  "end SystemsLean.Linear\n"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from Linear twin text for L0 dual-pin. -/
def linearTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.Linear"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept LT1 when tokens present.
    Greppable: hostModuleCheckBadLinearShareNatReturnTypeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadLinearShareNatReturnTypeL0Accept : Bool :=
  (checkNamedSurface (linearTermSurfaceFrom
      hostModuleCheckBadLinearShareNatReturnTypeText)
    linearExpectedNamespace linearRequiredDecls none).isAccept

/-- L0/L1 still accept LT2 when tokens present.
    Greppable: hostModuleCheckBadLinearPolyIdBodyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadLinearPolyIdBodyL0Accept : Bool :=
  (checkNamedSurface (linearTermSurfaceFrom
      hostModuleCheckBadLinearPolyIdBodyText)
    linearExpectedNamespace linearRequiredDecls none).isAccept

/-- L0/L1 still accept LT3 when tokens present.
    Greppable: hostModuleCheckBadLinearMult0ClassIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadLinearMult0ClassIdL0Accept : Bool :=
  (checkNamedSurface (linearTermSurfaceFrom
      hostModuleCheckBadLinearMult0ClassIdText)
    linearExpectedNamespace linearRequiredDecls none).isAccept

/-- L0/L1 still accept LT4 when tokens present (roundTrip not required L0).
    Greppable: hostModuleCheckBadLinearRoundTripBodyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadLinearRoundTripBodyL0Accept : Bool :=
  (checkNamedSurface (linearTermSurfaceFrom
      hostModuleCheckBadLinearRoundTripBodyText)
    linearExpectedNamespace linearRequiredDecls none).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckLinearTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckLinearTermDialectOk : Bool :=
  (checkLinearTermDialect hostModuleCheckGoodLinearTermText).isNone

/-- Dialect rejects LT1.
    Greppable: hostModuleCheckBadLinearShareNatReturnTypeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadLinearShareNatReturnTypeDialectReject : Bool :=
  match checkLinearTermDialect hostModuleCheckBadLinearShareNatReturnTypeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects LT2.
    Greppable: hostModuleCheckBadLinearPolyIdBodyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadLinearPolyIdBodyDialectReject : Bool :=
  match checkLinearTermDialect hostModuleCheckBadLinearPolyIdBodyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects LT3.
    Greppable: hostModuleCheckBadLinearMult0ClassIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadLinearMult0ClassIdDialectReject : Bool :=
  match checkLinearTermDialect hostModuleCheckBadLinearMult0ClassIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects LT4 wrong roundTrip body.
    Greppable: hostModuleCheckBadLinearRoundTripBodyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadLinearRoundTripBodyDialectReject : Bool :=
  match checkLinearTermDialect hostModuleCheckBadLinearRoundTripBodyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined Linear L2 dual-pin (good + LT1..LT4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckLinearTermSurfaceOk, TERM-SURFACE, Linear-only. -/
def hostModuleCheckLinearTermSurfaceOk : Bool :=
  hostModuleCheckLinearTermSurfaceDualOk
    && (checkDepthLinearTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLinearTermSurfaceScope == "Linear-only")
    && hostModuleCheckLinearTermDialectOk
    && hostModuleCheckBadLinearShareNatReturnTypeDialectReject
    && hostModuleCheckBadLinearPolyIdBodyDialectReject
    && hostModuleCheckBadLinearMult0ClassIdDialectReject
    && hostModuleCheckBadLinearRoundTripBodyDialectReject
    && hostModuleCheckBadLinearShareNatReturnTypeL0Accept
    && hostModuleCheckBadLinearPolyIdBodyL0Accept
    && hostModuleCheckBadLinearMult0ClassIdL0Accept
    && hostModuleCheckBadLinearRoundTripBodyL0Accept

end SystemsLean.HostModuleCheck
