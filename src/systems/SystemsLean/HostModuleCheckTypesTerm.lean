/-
  SYSTEMS_LEAN_HOST partial -- Types L2 term-surface pilot (beyond Mult/Linear).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Types dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Types L2 dialect subset (documented; not full Lean 4 elaborator):
  - Checkable def shapes from Types.lean SSOT:
    NodeKind.name arms "VALUE"/"LINEAR"/"ERASED";
    NodeKind.expectedMult arms Mult.multOmega/mult1/mult0;
    kindMultOk body decide (k.expectedMult = m) (same-line or next line);
    ofKindTag? 0/1/2 decode + none; isValidKindTag (ofKindTag? n).isSome;
    IrNode.isWellTyped body kindMultOk n.kind n.mult.
  - Structures TypeTag/IrNode and inductive NodeKind stay L0 token presence.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckTypesTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckTypesTermSurfaceOk (E-good dialect + TT1..TT4
    dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk, not bare
    dualOk alone.

  Intentional non-claims:
  - Types pilot only -- not package elaborate, not TypesTheorems L3 proof.
  - Mult TERM-SURFACE Mult-only dual-ok unchanged (HostModuleCheckMultTerm).
  - Linear TERM-SURFACE Linear-only dual-ok unchanged (HostModuleCheckLinearTerm).
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for Types is Types-only honesty when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckTypesTerm,
  TERM-SURFACE, Types-only, ILL-TYPED-TERM, checkTypesTermDialect,
  hostModuleCheckBadTypesNameArmText,
  hostModuleCheckBadTypesExpectedMultArmText,
  hostModuleCheckBadTypesKindMultOkBodyText,
  hostModuleCheckBadTypesOfKindTagArmText,
  hostModuleCheckTypesTermDialectOk, Types term-surface pilot,
  hostModuleCheckTypesTermSurfaceDualOk, hostModuleCheckTypesTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckTypesTerm
  Red/green: lake build SystemsLean.HostModuleCheckTypesTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

/-! ### Types L2 term-surface dual-ok pins (Types-only; coexists with Mult/Linear) -/

/-- Named term-surface depth bar reused for Types L2 pilot honesty.
    Greppable: checkDepthTypesTermSurfaceBar, TERM-SURFACE, Types-only. -/
def checkDepthTypesTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: Types.lean pilot only (not package elaborate; not Mult/Linear).
    Greppable: checkDepthTypesTermSurfaceScope, Types-only, TERM-SURFACE. -/
def checkDepthTypesTermSurfaceScope : String := "Types-only"

/-- Dual-ok when Types L2 E-good/E-bad rejects work (Types pilot only).
    Greppable: hostModuleCheckTypesTermSurfaceDualOk, TERM-SURFACE, Types-only. -/
def hostModuleCheckTypesTermSurfaceDualOk : Bool := true

/-! ### Types dialect helpers (reuse Mult collapse / def parse / arm list) -/

/-- Collect match-arm RHS strings under a named def until next top-level form.
    Greppable: typesDefArmRhsList, TERM-SURFACE, Types-only. -/
def typesDefArmRhsList (content : String) (defName : String) : List String :=
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
          if isDefNamed line defName then afterHeader false acc true rest
          else afterHeader false acc false rest
        else
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

/-- True when list has an arm whose collapsed text equals needle.
    Greppable: typesArmListHas, TERM-SURFACE, Types-only. -/
def typesArmListHas (arms : List String) (needle : String) : Bool :=
  arms.any fun a => collapseWs a == needle

/-- NodeKind.name match arms are VALUE/LINEAR/ERASED string literals.
    Greppable: typesNameArmsOk, TERM-SURFACE, Types-only. -/
def typesNameArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "NodeKind.name" with
  | none => false
  | some _ =>
    let arms := typesDefArmRhsList content "NodeKind.name"
    typesArmListHas arms "\"VALUE\""
      && typesArmListHas arms "\"LINEAR\""
      && typesArmListHas arms "\"ERASED\""

/-- NodeKind.expectedMult match arms pair value/omega, linear/1, erased/0.
    Greppable: typesExpectedMultArmsOk, TERM-SURFACE, Types-only. -/
def typesExpectedMultArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "NodeKind.expectedMult" with
  | none => false
  | some _ =>
    let arms := typesDefArmRhsList content "NodeKind.expectedMult"
    typesArmListHas arms "Mult.multOmega"
      && typesArmListHas arms "Mult.mult1"
      && typesArmListHas arms "Mult.mult0"

/-- Collapsed def body: same-line after `:=`, or first non-empty line after a
    multi-line `:=` header (real Types.lean kindMultOk is multi-line).
    Greppable: typesDefBodyCollapsed, TERM-SURFACE, Types-only. -/
def typesDefBodyCollapsed (content : String) (defName : String) : Option String :=
  match findDefHeaderLine content defName with
  | none => none
  | some header =>
    let same := collapseWs (bodyAfterAssign header)
    if same != "" then some same
    else
      let rec afterHeader (inBlock : Bool) (seen : Bool) :
          List String -> Option String
        | [] => none
        | line :: rest =>
          if inBlock then
            if (line.splitOn "-/").length > 1 then
              afterHeader false seen rest
            else
              afterHeader true seen rest
          else
            let t := trim line
            if hasPrefix t "/-" then
              if (t.splitOn "-/").length > 1 then afterHeader false seen rest
              else afterHeader true seen rest
            else if !seen then
              if isDefNamed line defName then afterHeader false true rest
              else afterHeader false false rest
            else if t == "" then afterHeader false true rest
            else if hasPrefix t "def " || hasPrefix t "inductive "
                || hasPrefix t "theorem " || hasPrefix t "end "
                || hasPrefix t "namespace " || hasPrefix t "structure "
                || hasPrefix t "axiom " then
              none
            else
              some (collapseWs (stripLineComment t))
      afterHeader false false (content.splitOn "\n")

/-- kindMultOk body is decide (k.expectedMult = m) (same-line or next line).
    Greppable: typesKindMultOkBodyOk, TERM-SURFACE, Types-only. -/
def typesKindMultOkBodyOk (content : String) : Bool :=
  match typesDefBodyCollapsed content "kindMultOk" with
  | none => false
  | some body => body == "decide (k.expectedMult = m)"

/-- ofKindTag? decode table 0/1/2 + fail-closed none.
    Greppable: typesOfKindTagArmsOk, TERM-SURFACE, Types-only. -/
def typesOfKindTagArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "ofKindTag?" with
  | none => false
  | some _ =>
    let arms := typesDefArmRhsList content "ofKindTag?"
    typesArmListHas arms "some NodeKind.value"
      && typesArmListHas arms "some NodeKind.linear"
      && typesArmListHas arms "some NodeKind.erased"
      && typesArmListHas arms "none"

/-- isValidKindTag body is (ofKindTag? n).isSome.
    Greppable: typesIsValidKindTagBodyOk, TERM-SURFACE, Types-only. -/
def typesIsValidKindTagBodyOk (content : String) : Bool :=
  match typesDefBodyCollapsed content "isValidKindTag" with
  | none => false
  | some body => body == "(ofKindTag? n).isSome"

/-- IrNode.isWellTyped body is kindMultOk n.kind n.mult.
    Greppable: typesIsWellTypedBodyOk, TERM-SURFACE, Types-only. -/
def typesIsWellTypedBodyOk (content : String) : Bool :=
  match typesDefBodyCollapsed content "IrNode.isWellTyped" with
  | none => false
  | some body => body == "kindMultOk n.kind n.mult"

/-- Types L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkTypesTermDialect, TERM-SURFACE, Types term-surface pilot. -/
def checkTypesTermDialect (content : String) : Option String :=
  if !typesNameArmsOk content then some reasonIllTypedTerm
  else if !typesExpectedMultArmsOk content then some reasonIllTypedTerm
  else if !typesKindMultOkBodyOk content then some reasonIllTypedTerm
  else if !typesOfKindTagArmsOk content then some reasonIllTypedTerm
  else if !typesIsValidKindTagBodyOk content then some reasonIllTypedTerm
  else if !typesIsWellTypedBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply Types L2 after a structural Types accept.
    Greppable: refineTypesWithTermSurface, TERM-SURFACE, Types-only. -/
def refineTypesWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkTypesTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### Types L2 well-typed good fixture (E-good; stronger than bare L0 skeleton) -/

/-- Shared Types skeleton prefix (structures + inductive) for good/bad twins.
    Greppable: hostModuleCheckTypesTermSkeletonPrefix, TERM-SURFACE, Types-only. -/
def hostModuleCheckTypesTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Types\n" ++
  "structure TypeTag where\n" ++
  "  tag : Nat\n" ++
  "inductive NodeKind where\n" ++
  "  | value\n" ++
  "  | linear\n" ++
  "  | erased\n" ++
  "structure IrNode where\n" ++
  "  ty : TypeTag\n" ++
  "  mult : Mult\n" ++
  "  kind : NodeKind\n" ++
  "def typeTagInit (tag : Nat) : TypeTag := { tag := tag }\n"

/-- Shared Types skeleton suffix (isValidKindTag through end) for good/bad twins.
    Greppable: hostModuleCheckTypesTermSkeletonSuffix, TERM-SURFACE, Types-only. -/
def hostModuleCheckTypesTermSkeletonSuffix : String :=
  "def isValidKindTag (n : Nat) : Bool := (ofKindTag? n).isSome\n" ++
  "def IrNode.isWellTyped (n : IrNode) : Bool := kindMultOk n.kind n.mult\n" ++
  "def mkNode? (tag : Nat) (m : Mult) (k : NodeKind) : Option IrNode := none\n" ++
  "def mkNodeFromTags? (a b c : Nat) : Option IrNode := none\n" ++
  "end SystemsLean.Types\n"

/-- Well-typed name/expectedMult/kindMultOk/ofKindTag mid-block (E-good).
    Greppable: hostModuleCheckTypesTermGoodMid, TERM-SURFACE, Types-only. -/
def hostModuleCheckTypesTermGoodMid : String :=
  "def NodeKind.name : NodeKind -> String\n" ++
  "  | NodeKind.value => \"VALUE\"\n" ++
  "  | NodeKind.linear => \"LINEAR\"\n" ++
  "  | NodeKind.erased => \"ERASED\"\n" ++
  "def NodeKind.expectedMult : NodeKind -> Mult\n" ++
  "  | NodeKind.value => Mult.multOmega\n" ++
  "  | NodeKind.linear => Mult.mult1\n" ++
  "  | NodeKind.erased => Mult.mult0\n" ++
  "def kindMultOk (k : NodeKind) (m : Mult) : Bool := decide (k.expectedMult = m)\n" ++
  "def ofKindTag? : Nat -> Option NodeKind\n" ++
  "  | 0 => some NodeKind.value\n" ++
  "  | 1 => some NodeKind.linear\n" ++
  "  | 2 => some NodeKind.erased\n" ++
  "  | _ => none\n"

/-- Well-typed Types L2 good text (name/expectedMult/kindMultOk/ofKindTag shapes).
    Greppable: hostModuleCheckGoodTypesTermText, TERM-SURFACE, Types-only. -/
def hostModuleCheckGoodTypesTermText : String :=
  hostModuleCheckTypesTermSkeletonPrefix
    ++ hostModuleCheckTypesTermGoodMid
    ++ hostModuleCheckTypesTermSkeletonSuffix

/-! ### Ill-typed Types twins (L0 tokens present; L2 must reject). -/

/-- TT1: wrong NodeKind.name value arm string. L0 still has def:NodeKind.name.
    Greppable: hostModuleCheckBadTypesNameArmText, TERM-SURFACE. -/
def hostModuleCheckBadTypesNameArmText : String :=
  hostModuleCheckTypesTermSkeletonPrefix ++
  "def NodeKind.name : NodeKind -> String\n" ++
  "  | NodeKind.value => \"WRONG\"\n" ++
  "  | NodeKind.linear => \"LINEAR\"\n" ++
  "  | NodeKind.erased => \"ERASED\"\n" ++
  "def NodeKind.expectedMult : NodeKind -> Mult\n" ++
  "  | NodeKind.value => Mult.multOmega\n" ++
  "  | NodeKind.linear => Mult.mult1\n" ++
  "  | NodeKind.erased => Mult.mult0\n" ++
  "def kindMultOk (k : NodeKind) (m : Mult) : Bool := decide (k.expectedMult = m)\n" ++
  "def ofKindTag? : Nat -> Option NodeKind\n" ++
  "  | 0 => some NodeKind.value\n" ++
  "  | 1 => some NodeKind.linear\n" ++
  "  | 2 => some NodeKind.erased\n" ++
  "  | _ => none\n" ++
  hostModuleCheckTypesTermSkeletonSuffix

/-- TT2: wrong expectedMult pairing (value -> mult0). L0 still has def token.
    Greppable: hostModuleCheckBadTypesExpectedMultArmText, TERM-SURFACE. -/
def hostModuleCheckBadTypesExpectedMultArmText : String :=
  hostModuleCheckTypesTermSkeletonPrefix ++
  "def NodeKind.name : NodeKind -> String\n" ++
  "  | NodeKind.value => \"VALUE\"\n" ++
  "  | NodeKind.linear => \"LINEAR\"\n" ++
  "  | NodeKind.erased => \"ERASED\"\n" ++
  "def NodeKind.expectedMult : NodeKind -> Mult\n" ++
  "  | NodeKind.value => Mult.mult0\n" ++
  "  | NodeKind.linear => Mult.mult1\n" ++
  "  | NodeKind.erased => Mult.mult0\n" ++
  "def kindMultOk (k : NodeKind) (m : Mult) : Bool := decide (k.expectedMult = m)\n" ++
  "def ofKindTag? : Nat -> Option NodeKind\n" ++
  "  | 0 => some NodeKind.value\n" ++
  "  | 1 => some NodeKind.linear\n" ++
  "  | 2 => some NodeKind.erased\n" ++
  "  | _ => none\n" ++
  hostModuleCheckTypesTermSkeletonSuffix

/-- TT3: kindMultOk body always true. L0 still has def:kindMultOk.
    Greppable: hostModuleCheckBadTypesKindMultOkBodyText, TERM-SURFACE. -/
def hostModuleCheckBadTypesKindMultOkBodyText : String :=
  hostModuleCheckTypesTermSkeletonPrefix ++
  "def NodeKind.name : NodeKind -> String\n" ++
  "  | NodeKind.value => \"VALUE\"\n" ++
  "  | NodeKind.linear => \"LINEAR\"\n" ++
  "  | NodeKind.erased => \"ERASED\"\n" ++
  "def NodeKind.expectedMult : NodeKind -> Mult\n" ++
  "  | NodeKind.value => Mult.multOmega\n" ++
  "  | NodeKind.linear => Mult.mult1\n" ++
  "  | NodeKind.erased => Mult.mult0\n" ++
  "def kindMultOk (k : NodeKind) (m : Mult) : Bool := true\n" ++
  "def ofKindTag? : Nat -> Option NodeKind\n" ++
  "  | 0 => some NodeKind.value\n" ++
  "  | 1 => some NodeKind.linear\n" ++
  "  | 2 => some NodeKind.erased\n" ++
  "  | _ => none\n" ++
  hostModuleCheckTypesTermSkeletonSuffix

/-- TT4: ofKindTag? 0 maps to linear (wrong decode). L0 still has def:ofKindTag?.
    Greppable: hostModuleCheckBadTypesOfKindTagArmText, TERM-SURFACE. -/
def hostModuleCheckBadTypesOfKindTagArmText : String :=
  hostModuleCheckTypesTermSkeletonPrefix ++
  "def NodeKind.name : NodeKind -> String\n" ++
  "  | NodeKind.value => \"VALUE\"\n" ++
  "  | NodeKind.linear => \"LINEAR\"\n" ++
  "  | NodeKind.erased => \"ERASED\"\n" ++
  "def NodeKind.expectedMult : NodeKind -> Mult\n" ++
  "  | NodeKind.value => Mult.multOmega\n" ++
  "  | NodeKind.linear => Mult.mult1\n" ++
  "  | NodeKind.erased => Mult.mult0\n" ++
  "def kindMultOk (k : NodeKind) (m : Mult) : Bool := decide (k.expectedMult = m)\n" ++
  "def ofKindTag? : Nat -> Option NodeKind\n" ++
  "  | 0 => some NodeKind.linear\n" ++
  "  | 1 => some NodeKind.linear\n" ++
  "  | 2 => some NodeKind.erased\n" ++
  "  | _ => none\n" ++
  hostModuleCheckTypesTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from Types twin text for L0 dual-pin. -/
def typesTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.Types"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept TT1 when tokens present.
    Greppable: hostModuleCheckBadTypesNameArmL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadTypesNameArmL0Accept : Bool :=
  (checkNamedSurface (typesTermSurfaceFrom hostModuleCheckBadTypesNameArmText)
    typesExpectedNamespace typesRequiredDecls none).isAccept

/-- L0/L1 still accept TT2 when tokens present.
    Greppable: hostModuleCheckBadTypesExpectedMultArmL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadTypesExpectedMultArmL0Accept : Bool :=
  (checkNamedSurface (typesTermSurfaceFrom
      hostModuleCheckBadTypesExpectedMultArmText)
    typesExpectedNamespace typesRequiredDecls none).isAccept

/-- L0/L1 still accept TT3 when tokens present.
    Greppable: hostModuleCheckBadTypesKindMultOkBodyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadTypesKindMultOkBodyL0Accept : Bool :=
  (checkNamedSurface (typesTermSurfaceFrom
      hostModuleCheckBadTypesKindMultOkBodyText)
    typesExpectedNamespace typesRequiredDecls none).isAccept

/-- L0/L1 still accept TT4 when tokens present.
    Greppable: hostModuleCheckBadTypesOfKindTagArmL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadTypesOfKindTagArmL0Accept : Bool :=
  (checkNamedSurface (typesTermSurfaceFrom
      hostModuleCheckBadTypesOfKindTagArmText)
    typesExpectedNamespace typesRequiredDecls none).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckTypesTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckTypesTermDialectOk : Bool :=
  (checkTypesTermDialect hostModuleCheckGoodTypesTermText).isNone

/-- Dialect rejects TT1.
    Greppable: hostModuleCheckBadTypesNameArmDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadTypesNameArmDialectReject : Bool :=
  match checkTypesTermDialect hostModuleCheckBadTypesNameArmText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects TT2.
    Greppable: hostModuleCheckBadTypesExpectedMultArmDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadTypesExpectedMultArmDialectReject : Bool :=
  match checkTypesTermDialect hostModuleCheckBadTypesExpectedMultArmText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects TT3.
    Greppable: hostModuleCheckBadTypesKindMultOkBodyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadTypesKindMultOkBodyDialectReject : Bool :=
  match checkTypesTermDialect hostModuleCheckBadTypesKindMultOkBodyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects TT4 wrong ofKindTag arm.
    Greppable: hostModuleCheckBadTypesOfKindTagArmDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadTypesOfKindTagArmDialectReject : Bool :=
  match checkTypesTermDialect hostModuleCheckBadTypesOfKindTagArmText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined Types L2 dual-pin (good + TT1..TT4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckTypesTermSurfaceOk, TERM-SURFACE, Types-only. -/
def hostModuleCheckTypesTermSurfaceOk : Bool :=
  hostModuleCheckTypesTermSurfaceDualOk
    && (checkDepthTypesTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthTypesTermSurfaceScope == "Types-only")
    && hostModuleCheckTypesTermDialectOk
    && hostModuleCheckBadTypesNameArmDialectReject
    && hostModuleCheckBadTypesExpectedMultArmDialectReject
    && hostModuleCheckBadTypesKindMultOkBodyDialectReject
    && hostModuleCheckBadTypesOfKindTagArmDialectReject
    && hostModuleCheckBadTypesNameArmL0Accept
    && hostModuleCheckBadTypesExpectedMultArmL0Accept
    && hostModuleCheckBadTypesKindMultOkBodyL0Accept
    && hostModuleCheckBadTypesOfKindTagArmL0Accept

end SystemsLean.HostModuleCheck
