/-
  SYSTEMS_LEAN_HOST partial -- Mult L2 term-surface (J5 + optional J6) pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Mult dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Mult L2 dialect subset (documented; not full Lean 4 elaborator):
  - J6 (optional soft): nullary inductive Mult with ctors mult0, mult1,
    multOmega (name lines only; no telescope/universe check).
  - J5 def name: claimed type Mult -> String (reject Mult -> Nat and peers).
  - J5 def isValid: Mult -> Bool; match arms RHS true|false only.
  - J5 def multIsValid: body exactly unary app `isValid m` after :=.
  Other Mult defs (ofNat?, isValidTag) stay L0/L1 token presence only this pilot.

  Intentional non-claims:
  - Mult pilot only -- not package elaborate, not MultTheorems L3 proof surface.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok is Mult-only honesty when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckMultTerm,
  TERM-SURFACE, Mult-only, ILL-TYPED-TERM, checkMultTermDialect,
  hostModuleCheckBadMultNameReturnTypeText,
  hostModuleCheckBadMultIsValidAppText,
  hostModuleCheckBadMultIsValidArmText,
  hostModuleCheckMultTermDialectOk, Mult term-surface pilot,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckMultTerm
  Red/green: lake build SystemsLean.HostModuleCheckMultTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface

namespace SystemsLean.HostModuleCheck

/-! ### Mult L2 term-surface reasons + dialect pins -/

/-- Reject reason for Mult L2 term-surface typing / formation failure.
    Greppable: reasonIllTypedTerm, ILL-TYPED-TERM, TERM-SURFACE. -/
def reasonIllTypedTerm : String := "ILL-TYPED-TERM"

/-- Named term-surface depth bar (Mult L2 pilot only).
    Greppable: checkDepthTermSurfaceBar, TERM-SURFACE. -/
def checkDepthTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: Mult.lean pilot only (not package elaborate).
    Greppable: checkDepthTermSurfaceScope, Mult-only, TERM-SURFACE. -/
def checkDepthTermSurfaceScope : String := "Mult-only"

/-- Dual-ok when Mult L2 E-good/E-bad rejects work (Mult pilot only).
    Greppable: hostModuleCheckTermSurfaceDualOk, TERM-SURFACE, Mult-only. -/
def hostModuleCheckTermSurfaceDualOk : Bool := true

/-! ### Line helpers for Mult dialect text -/

/-- Collapse runs of spaces/tabs to single space (type token match). -/
def collapseWs (s : String) : String :=
  let rec go (seenSp : Bool) (acc : List Char) : List Char -> List Char
    | [] => acc.reverse
    | c :: rest =>
      if isWs c then
        if seenSp then go true acc rest
        else go true (' ' :: acc) rest
      else
        go false (c :: acc) rest
  String.ofList (go false [] s.toList)

/-- True when line is a `def Name` header for the given name. -/
def isDefNamed (line : String) (name : String) : Bool :=
  match parseKindName line "def" with
  | some n => n == name
  | none => false

/-- First non-comment line that is `def name`. -/
def findDefHeaderLine (content : String) (name : String) : Option String :=
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
        else if isDefNamed line name then some line
        else go false rest
  go false (content.splitOn "\n")

/-- True when Mult inductive has nullary ctor name lines mult0/mult1/multOmega.
    Greppable: multInductiveNullaryCtorsOk, TERM-SURFACE. -/
def multInductiveNullaryCtorsOk (content : String) : Bool :=
  let hasCtor (ctor : String) : Bool :=
    (content.splitOn "\n").any fun line =>
      let t := trim (stripLineComment line)
      hasPrefix t ("| " ++ ctor) || t == ("| " ++ ctor)
  hasCtor "mult0" && hasCtor "mult1" && hasCtor "multOmega"

/-- J5: def name claimed type Mult -> String.
    Greppable: multNameDefTypeOk, TERM-SURFACE. -/
def multNameDefTypeOk (content : String) : Bool :=
  match findDefHeaderLine content "name" with
  | none => false
  | some line =>
    let n := collapseWs (stripLineComment line)
    -- Accept Mult -> String; reject Mult -> Nat and other return types.
    (n.splitOn "Mult -> String").length > 1
      && !((n.splitOn "Mult -> Nat").length > 1)

/-- After `:=` on a single-line def, body trim (empty if no :=). -/
def bodyAfterAssign (line : String) : String :=
  let t := stripLineComment line
  match t.splitOn ":=" with
  | _ :: body :: _ => trim body
  | _ => ""

/-- J5: multIsValid body is exactly unary `isValid m`.
    Greppable: multIsValidAppOk, TERM-SURFACE. -/
def multIsValidAppOk (content : String) : Bool :=
  match findDefHeaderLine content "multIsValid" with
  | none => false
  | some line =>
    let body := collapseWs (bodyAfterAssign line)
    body == "isValid m"

/-- True when match-arm RHS (after =>) is a Bool literal true|false. -/
def isBoolArmRhs (rhs : String) : Bool :=
  let t := trim (stripLineComment rhs)
  t == "true" || t == "false"

/-- Collect match-arm RHS strings under def isValid until next top-level form. -/
def isValidArmRhsList (content : String) : List String :=
  let rec afterHeader (inBlock : Bool) (acc : List String) (seen : Bool) :
      List String -> List String
    | [] => acc.reverse
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          afterHeader false acc seen rest
        else
          afterHeader true acc seen rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then afterHeader false acc seen rest
          else afterHeader true acc seen rest
        else if !seen then
          if isDefNamed line "isValid" then afterHeader false acc true rest
          else afterHeader false acc false rest
        else
          -- Stop at next top-level def / inductive / theorem / end / namespace.
          if hasPrefix t "def " || hasPrefix t "inductive "
              || hasPrefix t "theorem " || hasPrefix t "end "
              || hasPrefix t "namespace " || hasPrefix t "structure "
              || hasPrefix t "axiom " then
            acc.reverse
          else
            match t.splitOn "=>" with
            | _ :: rhs :: _ =>
              afterHeader false (trim rhs :: acc) true rest
            | _ => afterHeader false acc true rest
  afterHeader false [] false (content.splitOn "\n")

/-- J5: isValid match arms return Bool literals only.
    Greppable: multIsValidArmsOk, TERM-SURFACE. -/
def multIsValidArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "isValid" with
  | none => false
  | some header =>
    let n := collapseWs (stripLineComment header)
    if !((n.splitOn "Mult -> Bool").length > 1) then false
    else
      let arms := isValidArmRhsList content
      -- Require at least one arm and every arm Bool.
      !arms.isEmpty && arms.all isBoolArmRhs

/-- Mult L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkMultTermDialect, TERM-SURFACE, Mult term-surface pilot. -/
def checkMultTermDialect (content : String) : Option String :=
  if !multInductiveNullaryCtorsOk content then some reasonIllTypedTerm
  else if !multNameDefTypeOk content then some reasonIllTypedTerm
  else if !multIsValidAppOk content then some reasonIllTypedTerm
  else if !multIsValidArmsOk content then some reasonIllTypedTerm
  else none

/-- Apply Mult L2 after a structural Mult accept.
    Greppable: refineMultWithTermSurface, TERM-SURFACE. -/
def refineMultWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkMultTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### Mult L2 well-typed good fixture (E-good; stronger type surface than L0 skeleton) -/

/-- Well-typed Mult L2 good text (nullary Mult + typed name/isValid/multIsValid).
    Greppable: hostModuleCheckGoodMultTermText, TERM-SURFACE. -/
def hostModuleCheckGoodMultTermText : String :=
  "namespace SystemsLean.Mult\n" ++
  "inductive Mult where\n" ++
  "  | mult0\n" ++
  "  | mult1\n" ++
  "  | multOmega\n" ++
  "def name : Mult -> String\n" ++
  "  | Mult.mult0 => \"MULT-0\"\n" ++
  "  | Mult.mult1 => \"MULT-1\"\n" ++
  "  | Mult.multOmega => \"MULT-OMEGA\"\n" ++
  "def isValid : Mult -> Bool\n" ++
  "  | Mult.mult0 => true\n" ++
  "  | Mult.mult1 => true\n" ++
  "  | Mult.multOmega => true\n" ++
  "def ofNat? : Nat -> Option Mult\n" ++
  "  | 0 => some Mult.mult0\n" ++
  "  | 1 => some Mult.mult1\n" ++
  "  | 2 => some Mult.multOmega\n" ++
  "  | _ => none\n" ++
  "def isValidTag (n : Nat) : Bool := (ofNat? n).isSome\n" ++
  "def multIsValid (m : Mult) : Bool := isValid m\n" ++
  "end SystemsLean.Mult\n"

/-! ### Ill-typed Mult twins (T2/T3/T5). L0 tokens present; L2 must reject. -/

/-- T2: wrong return type on name (Mult -> Nat). L0 still has def:name.
    Greppable: hostModuleCheckBadMultNameReturnTypeText, TERM-SURFACE. -/
def hostModuleCheckBadMultNameReturnTypeText : String :=
  "namespace SystemsLean.Mult\n" ++
  "inductive Mult where\n" ++
  "  | mult0\n" ++
  "  | mult1\n" ++
  "  | multOmega\n" ++
  "def name : Mult -> Nat\n" ++
  "  | Mult.mult0 => 0\n" ++
  "  | Mult.mult1 => 1\n" ++
  "  | Mult.multOmega => 2\n" ++
  "def isValid : Mult -> Bool\n" ++
  "  | _ => true\n" ++
  "def ofNat? : Nat -> Option Mult\n" ++
  "  | 0 => some Mult.mult0\n" ++
  "  | _ => none\n" ++
  "def isValidTag (n : Nat) : Bool := (ofNat? n).isSome\n" ++
  "def multIsValid (m : Mult) : Bool := isValid m\n" ++
  "end SystemsLean.Mult\n"

/-- T3: ill-typed multIsValid app (extra arg). L0 still has def:multIsValid.
    Greppable: hostModuleCheckBadMultIsValidAppText, TERM-SURFACE. -/
def hostModuleCheckBadMultIsValidAppText : String :=
  "namespace SystemsLean.Mult\n" ++
  "inductive Mult where\n" ++
  "  | mult0\n" ++
  "  | mult1\n" ++
  "  | multOmega\n" ++
  "def name : Mult -> String\n" ++
  "  | Mult.mult0 => \"MULT-0\"\n" ++
  "def isValid : Mult -> Bool\n" ++
  "  | _ => true\n" ++
  "def ofNat? : Nat -> Option Mult\n" ++
  "  | 0 => some Mult.mult0\n" ++
  "  | _ => none\n" ++
  "def isValidTag (n : Nat) : Bool := (ofNat? n).isSome\n" ++
  "def multIsValid (m : Mult) : Bool := isValid Mult.mult0 m\n" ++
  "end SystemsLean.Mult\n"

/-- T5: isValid arm returns String. L0 still has def:isValid.
    Greppable: hostModuleCheckBadMultIsValidArmText, TERM-SURFACE. -/
def hostModuleCheckBadMultIsValidArmText : String :=
  "namespace SystemsLean.Mult\n" ++
  "inductive Mult where\n" ++
  "  | mult0\n" ++
  "  | mult1\n" ++
  "  | multOmega\n" ++
  "def name : Mult -> String\n" ++
  "  | Mult.mult0 => \"MULT-0\"\n" ++
  "def isValid : Mult -> Bool\n" ++
  "  | Mult.mult0 => \"bad\"\n" ++
  "  | _ => true\n" ++
  "def ofNat? : Nat -> Option Mult\n" ++
  "  | 0 => some Mult.mult0\n" ++
  "  | _ => none\n" ++
  "def isValidTag (n : Nat) : Bool := (ofNat? n).isSome\n" ++
  "def multIsValid (m : Mult) : Bool := isValid m\n" ++
  "end SystemsLean.Mult\n"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from Mult twin text for L0 dual-pin. -/
def multTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.Mult"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept T2 when tokens present.
    Greppable: hostModuleCheckBadMultNameReturnTypeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadMultNameReturnTypeL0Accept : Bool :=
  (checkNamedSurface (multTermSurfaceFrom hostModuleCheckBadMultNameReturnTypeText)
    multExpectedNamespace multRequiredDecls none).isAccept

/-- L0/L1 still accept T3 when tokens present.
    Greppable: hostModuleCheckBadMultIsValidAppL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadMultIsValidAppL0Accept : Bool :=
  (checkNamedSurface (multTermSurfaceFrom hostModuleCheckBadMultIsValidAppText)
    multExpectedNamespace multRequiredDecls none).isAccept

/-- L0/L1 still accept T5 when tokens present.
    Greppable: hostModuleCheckBadMultIsValidArmL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadMultIsValidArmL0Accept : Bool :=
  (checkNamedSurface (multTermSurfaceFrom hostModuleCheckBadMultIsValidArmText)
    multExpectedNamespace multRequiredDecls none).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckMultTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckMultTermDialectOk : Bool :=
  (checkMultTermDialect hostModuleCheckGoodMultTermText).isNone

/-- Dialect rejects T2.
    Greppable: hostModuleCheckBadMultNameReturnTypeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadMultNameReturnTypeDialectReject : Bool :=
  match checkMultTermDialect hostModuleCheckBadMultNameReturnTypeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects T3.
    Greppable: hostModuleCheckBadMultIsValidAppDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadMultIsValidAppDialectReject : Bool :=
  match checkMultTermDialect hostModuleCheckBadMultIsValidAppText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects T5.
    Greppable: hostModuleCheckBadMultIsValidArmDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadMultIsValidArmDialectReject : Bool :=
  match checkMultTermDialect hostModuleCheckBadMultIsValidArmText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined Mult L2 dual-pin (good + three rejects + L0 still accept).
    Greppable: hostModuleCheckMultTermSurfaceOk, TERM-SURFACE, Mult-only. -/
def hostModuleCheckMultTermSurfaceOk : Bool :=
  hostModuleCheckTermSurfaceDualOk
    && (checkDepthTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthTermSurfaceScope == "Mult-only")
    && hostModuleCheckMultTermDialectOk
    && hostModuleCheckBadMultNameReturnTypeDialectReject
    && hostModuleCheckBadMultIsValidAppDialectReject
    && hostModuleCheckBadMultIsValidArmDialectReject
    && hostModuleCheckBadMultNameReturnTypeL0Accept
    && hostModuleCheckBadMultIsValidAppL0Accept
    && hostModuleCheckBadMultIsValidArmL0Accept

end SystemsLean.HostModuleCheck
