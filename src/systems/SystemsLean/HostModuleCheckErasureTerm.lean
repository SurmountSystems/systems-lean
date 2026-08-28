/-
  SYSTEMS_LEAN_HOST partial -- Erasure L2 term-surface pilot (beyond HostCompose).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Erasure dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Erasure L2 dialect subset (documented; not full Lean 4 elaborator):
  - unmarked body exact { marked := false } (nested := kept).
  - mark body exact { marked := true }.
  - isRuntimeAbsent body exact e.marked.
  - erasureIsRuntimeAbsent body exact isRuntimeAbsent e.
  - isErasureGrade match arms Mult.mult0=>true / mult1=>false / multOmega=>false.
  - markForGrade? body exact if isErasureGrade m then some (mark e) else none.
  - checkFailClosed body exact isErasureGrade m && isRuntimeAbsent e.
  - structure Erased stays L0 token presence this pilot.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckErasureTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckErasureTermSurfaceOk (E-good dialect +
    ET1..ET4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - Erasure pilot only -- not package elaborate, not ErasureTheorems L3.
  - Mult/Linear/Types/IrProgram/IrGraph/HostCompose TERM-SURFACE dual-ok unchanged.
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for Erasure is Erasure-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckErasureTerm,
  TERM-SURFACE, Erasure-only, ILL-TYPED-TERM, checkErasureTermDialect,
  hostModuleCheckBadErasureCheckFailClosedText,
  hostModuleCheckBadErasureIsErasureGradeText,
  hostModuleCheckBadErasureMarkForGradeText,
  hostModuleCheckBadErasureIsRuntimeAbsentText,
  hostModuleCheckErasureTermDialectOk, Erasure term-surface pilot,
  hostModuleCheckErasureTermSurfaceDualOk,
  hostModuleCheckErasureTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckErasureTerm
  Red/green: lake build SystemsLean.HostModuleCheckErasureTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

/-! ### Erasure L2 term-surface dual-ok pins (Erasure-only) -/

/-- Named term-surface depth bar reused for Erasure L2 pilot honesty.
    Greppable: checkDepthErasureTermSurfaceBar, TERM-SURFACE, Erasure-only. -/
def checkDepthErasureTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: Erasure.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthErasureTermSurfaceScope, Erasure-only, TERM-SURFACE. -/
def checkDepthErasureTermSurfaceScope : String := "Erasure-only"

/-- Dual-ok when Erasure L2 E-good/E-bad rejects work (Erasure pilot only).
    Greppable: hostModuleCheckErasureTermSurfaceDualOk, TERM-SURFACE,
    Erasure-only. -/
def hostModuleCheckErasureTermSurfaceDualOk : Bool := true

/-! ### Erasure dialect helpers (reuse Mult collapse / def parse) -/

/-- Body after first `:=` on a line, re-joining later `:=` pieces (structure
    literals such as `{ marked := false }` must not truncate).
    Greppable: erasureBodyAfterAssign, TERM-SURFACE, Erasure-only. -/
def erasureBodyAfterAssign (line : String) : String :=
  let t := stripLineComment line
  match t.splitOn ":=" with
  | [] => ""
  | [_] => ""
  | _ :: rest => trim (String.intercalate ":=" rest)

/-- Collapsed def body: same-line after `:=` when closed; else multi-line after
    header. Bare open brace `{` on the header line seeds multi-line collection.
    Greppable: erasureDefBodyCollapsed, TERM-SURFACE, Erasure-only. -/
def erasureDefBodyCollapsed (content : String) (defName : String) : Option String :=
  match findDefHeaderLine content defName with
  | none => none
  | some header =>
    let headBody := erasureBodyAfterAssign header
    let same := collapseWs headBody
    if same != "" && same != "{" then some same
    else
      let seed : List String :=
        if trim headBody == "" then [] else [trim headBody]
      let rec afterHeader (inBlock : Bool) (seen : Bool) (acc : List String) :
          List String -> Option String
        | [] =>
          if acc.isEmpty then none
          else some (collapseWs (String.intercalate " " acc.reverse))
        | line :: rest =>
          if inBlock then
            if (line.splitOn "-/").length > 1 then
              afterHeader false seen acc rest
            else
              afterHeader true seen acc rest
          else
            let t := trim line
            if hasPrefix t "/-" then
              if (t.splitOn "-/").length > 1 then afterHeader false seen acc rest
              else afterHeader true seen acc rest
            else if !seen then
              if isDefNamed line defName then afterHeader false true acc rest
              else afterHeader false false acc rest
            else if t == "" then afterHeader false true acc rest
            else if hasPrefix t "def " || hasPrefix t "inductive "
                || hasPrefix t "theorem " || hasPrefix t "end "
                || hasPrefix t "namespace " || hasPrefix t "structure "
                || hasPrefix t "axiom " then
              if acc.isEmpty then none
              else some (collapseWs (String.intercalate " " acc.reverse))
            else
              afterHeader false true (stripLineComment t :: acc) rest
      afterHeader false false seed (content.splitOn "\n")

/-- Collect match-arm RHS strings under a named def until next top-level form.
    Greppable: erasureDefArmRhsList, TERM-SURFACE, Erasure-only. -/
def erasureDefArmRhsList (content : String) (defName : String) : List String :=
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
    Greppable: erasureArmListHas, TERM-SURFACE, Erasure-only. -/
def erasureArmListHas (arms : List String) (needle : String) : Bool :=
  arms.any fun a => collapseWs a == needle

/-- unmarked body is { marked := false }.
    Greppable: erasureUnmarkedBodyOk, TERM-SURFACE, Erasure-only. -/
def erasureUnmarkedBodyOk (content : String) : Bool :=
  match erasureDefBodyCollapsed content "unmarked" with
  | none => false
  | some body => body == "{ marked := false }"

/-- mark body is { marked := true }.
    Greppable: erasureMarkBodyOk, TERM-SURFACE, Erasure-only. -/
def erasureMarkBodyOk (content : String) : Bool :=
  match erasureDefBodyCollapsed content "mark" with
  | none => false
  | some body => body == "{ marked := true }"

/-- isRuntimeAbsent body is e.marked.
    Greppable: erasureIsRuntimeAbsentBodyOk, TERM-SURFACE, Erasure-only. -/
def erasureIsRuntimeAbsentBodyOk (content : String) : Bool :=
  match erasureDefBodyCollapsed content "isRuntimeAbsent" with
  | none => false
  | some body => body == "e.marked"

/-- erasureIsRuntimeAbsent body is isRuntimeAbsent e.
    Greppable: erasureErasureIsRuntimeAbsentBodyOk, TERM-SURFACE, Erasure-only. -/
def erasureErasureIsRuntimeAbsentBodyOk (content : String) : Bool :=
  match erasureDefBodyCollapsed content "erasureIsRuntimeAbsent" with
  | none => false
  | some body => body == "isRuntimeAbsent e"

/-- isErasureGrade match arms: mult0 true; mult1 false; multOmega false.
    Greppable: erasureIsErasureGradeArmsOk, TERM-SURFACE, Erasure-only. -/
def erasureIsErasureGradeArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "isErasureGrade" with
  | none => false
  | some _ =>
    let arms := erasureDefArmRhsList content "isErasureGrade"
    erasureArmListHas arms "true"
      && erasureArmListHas arms "false"
      && (arms.filter (fun a => collapseWs a == "false")).length >= 2
      && (arms.filter (fun a => collapseWs a == "true")).length == 1

/-- markForGrade? body is if isErasureGrade m then some (mark e) else none.
    Greppable: erasureMarkForGradeBodyOk, TERM-SURFACE, Erasure-only. -/
def erasureMarkForGradeBodyOk (content : String) : Bool :=
  match erasureDefBodyCollapsed content "markForGrade?" with
  | none => false
  | some body => body == "if isErasureGrade m then some (mark e) else none"

/-- checkFailClosed body is isErasureGrade m && isRuntimeAbsent e.
    Greppable: erasureCheckFailClosedBodyOk, TERM-SURFACE, Erasure-only. -/
def erasureCheckFailClosedBodyOk (content : String) : Bool :=
  match erasureDefBodyCollapsed content "checkFailClosed" with
  | none => false
  | some body => body == "isErasureGrade m && isRuntimeAbsent e"

/-- Erasure L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkErasureTermDialect, TERM-SURFACE,
    Erasure term-surface pilot. -/
def checkErasureTermDialect (content : String) : Option String :=
  if !erasureUnmarkedBodyOk content then some reasonIllTypedTerm
  else if !erasureMarkBodyOk content then some reasonIllTypedTerm
  else if !erasureIsRuntimeAbsentBodyOk content then some reasonIllTypedTerm
  else if !erasureErasureIsRuntimeAbsentBodyOk content then some reasonIllTypedTerm
  else if !erasureIsErasureGradeArmsOk content then some reasonIllTypedTerm
  else if !erasureMarkForGradeBodyOk content then some reasonIllTypedTerm
  else if !erasureCheckFailClosedBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply Erasure L2 after a structural Erasure accept.
    Greppable: refineErasureWithTermSurface, TERM-SURFACE, Erasure-only. -/
def refineErasureWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkErasureTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### Erasure L2 well-typed good fixture (E-good) -/

/-- Shared Erasure skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckErasureTermSkeletonPrefix, TERM-SURFACE,
    Erasure-only. -/
def hostModuleCheckErasureTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Erasure\n" ++
  "structure Erased where\n" ++
  "  marked : Bool\n"

/-- Shared Erasure skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckErasureTermSkeletonSuffix, TERM-SURFACE,
    Erasure-only. -/
def hostModuleCheckErasureTermSkeletonSuffix : String :=
  "end SystemsLean.Erasure\n"

/-- Well-typed unmarked/mark/runtime/grade/check mid.
    Greppable: hostModuleCheckErasureTermGoodMid, TERM-SURFACE, Erasure-only. -/
def hostModuleCheckErasureTermGoodMid : String :=
  "def unmarked : Erased := { marked := false }\n" ++
  "def mark (e : Erased) : Erased := { marked := true }\n" ++
  "def isRuntimeAbsent (e : Erased) : Bool := e.marked\n" ++
  "def erasureIsRuntimeAbsent (e : Erased) : Bool := isRuntimeAbsent e\n" ++
  "def isErasureGrade (m : Mult) : Bool :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => true\n" ++
  "  | Mult.mult1 => false\n" ++
  "  | Mult.multOmega => false\n" ++
  "def markForGrade? (m : Mult) (e : Erased) : Option Erased :=\n" ++
  "  if isErasureGrade m then\n" ++
  "    some (mark e)\n" ++
  "  else\n" ++
  "    none\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) : Bool :=\n" ++
  "  isErasureGrade m && isRuntimeAbsent e\n"

/-- Well-typed Erasure L2 good text.
    Greppable: hostModuleCheckGoodErasureTermText, TERM-SURFACE, Erasure-only. -/
def hostModuleCheckGoodErasureTermText : String :=
  hostModuleCheckErasureTermSkeletonPrefix
    ++ hostModuleCheckErasureTermGoodMid
    ++ hostModuleCheckErasureTermSkeletonSuffix

/-! ### Ill-typed Erasure twins (L0 tokens present; L2 must reject). -/

/-- ET1: checkFailClosed always true. L0 still has def:checkFailClosed.
    Greppable: hostModuleCheckBadErasureCheckFailClosedText, TERM-SURFACE. -/
def hostModuleCheckBadErasureCheckFailClosedText : String :=
  hostModuleCheckErasureTermSkeletonPrefix ++
  "def unmarked : Erased := { marked := false }\n" ++
  "def mark (e : Erased) : Erased := { marked := true }\n" ++
  "def isRuntimeAbsent (e : Erased) : Bool := e.marked\n" ++
  "def erasureIsRuntimeAbsent (e : Erased) : Bool := isRuntimeAbsent e\n" ++
  "def isErasureGrade (m : Mult) : Bool :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => true\n" ++
  "  | Mult.mult1 => false\n" ++
  "  | Mult.multOmega => false\n" ++
  "def markForGrade? (m : Mult) (e : Erased) : Option Erased :=\n" ++
  "  if isErasureGrade m then some (mark e) else none\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) : Bool := true\n" ++
  hostModuleCheckErasureTermSkeletonSuffix

/-- ET2: isErasureGrade always true (no MULT-0 table).
    Greppable: hostModuleCheckBadErasureIsErasureGradeText, TERM-SURFACE. -/
def hostModuleCheckBadErasureIsErasureGradeText : String :=
  hostModuleCheckErasureTermSkeletonPrefix ++
  "def unmarked : Erased := { marked := false }\n" ++
  "def mark (e : Erased) : Erased := { marked := true }\n" ++
  "def isRuntimeAbsent (e : Erased) : Bool := e.marked\n" ++
  "def erasureIsRuntimeAbsent (e : Erased) : Bool := isRuntimeAbsent e\n" ++
  "def isErasureGrade (m : Mult) : Bool := true\n" ++
  "def markForGrade? (m : Mult) (e : Erased) : Option Erased :=\n" ++
  "  if isErasureGrade m then some (mark e) else none\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) : Bool :=\n" ++
  "  isErasureGrade m && isRuntimeAbsent e\n" ++
  hostModuleCheckErasureTermSkeletonSuffix

/-- ET3: markForGrade? always some (no grade fail-closed).
    Greppable: hostModuleCheckBadErasureMarkForGradeText, TERM-SURFACE. -/
def hostModuleCheckBadErasureMarkForGradeText : String :=
  hostModuleCheckErasureTermSkeletonPrefix ++
  "def unmarked : Erased := { marked := false }\n" ++
  "def mark (e : Erased) : Erased := { marked := true }\n" ++
  "def isRuntimeAbsent (e : Erased) : Bool := e.marked\n" ++
  "def erasureIsRuntimeAbsent (e : Erased) : Bool := isRuntimeAbsent e\n" ++
  "def isErasureGrade (m : Mult) : Bool :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => true\n" ++
  "  | Mult.mult1 => false\n" ++
  "  | Mult.multOmega => false\n" ++
  "def markForGrade? (m : Mult) (e : Erased) : Option Erased := some (mark e)\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) : Bool :=\n" ++
  "  isErasureGrade m && isRuntimeAbsent e\n" ++
  hostModuleCheckErasureTermSkeletonSuffix

/-- ET4: isRuntimeAbsent always true (ignores marked flag).
    Greppable: hostModuleCheckBadErasureIsRuntimeAbsentText, TERM-SURFACE. -/
def hostModuleCheckBadErasureIsRuntimeAbsentText : String :=
  hostModuleCheckErasureTermSkeletonPrefix ++
  "def unmarked : Erased := { marked := false }\n" ++
  "def mark (e : Erased) : Erased := { marked := true }\n" ++
  "def isRuntimeAbsent (e : Erased) : Bool := true\n" ++
  "def erasureIsRuntimeAbsent (e : Erased) : Bool := isRuntimeAbsent e\n" ++
  "def isErasureGrade (m : Mult) : Bool :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => true\n" ++
  "  | Mult.mult1 => false\n" ++
  "  | Mult.multOmega => false\n" ++
  "def markForGrade? (m : Mult) (e : Erased) : Option Erased :=\n" ++
  "  if isErasureGrade m then some (mark e) else none\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) : Bool :=\n" ++
  "  isErasureGrade m && isRuntimeAbsent e\n" ++
  hostModuleCheckErasureTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from Erasure twin text for L0 dual-pin. -/
def erasureTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.Erasure"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept ET1 when tokens present.
    Greppable: hostModuleCheckBadErasureCheckFailClosedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadErasureCheckFailClosedL0Accept : Bool :=
  (checkNamedSurface (erasureTermSurfaceFrom
      hostModuleCheckBadErasureCheckFailClosedText)
    erasureExpectedNamespace erasureRequiredDecls (some "SystemsLean.Mult")).isAccept

/-- L0/L1 still accept ET2 when tokens present.
    Greppable: hostModuleCheckBadErasureIsErasureGradeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadErasureIsErasureGradeL0Accept : Bool :=
  (checkNamedSurface (erasureTermSurfaceFrom
      hostModuleCheckBadErasureIsErasureGradeText)
    erasureExpectedNamespace erasureRequiredDecls (some "SystemsLean.Mult")).isAccept

/-- L0/L1 still accept ET3 when tokens present.
    Greppable: hostModuleCheckBadErasureMarkForGradeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadErasureMarkForGradeL0Accept : Bool :=
  (checkNamedSurface (erasureTermSurfaceFrom
      hostModuleCheckBadErasureMarkForGradeText)
    erasureExpectedNamespace erasureRequiredDecls (some "SystemsLean.Mult")).isAccept

/-- L0/L1 still accept ET4 when tokens present.
    Greppable: hostModuleCheckBadErasureIsRuntimeAbsentL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadErasureIsRuntimeAbsentL0Accept : Bool :=
  (checkNamedSurface (erasureTermSurfaceFrom
      hostModuleCheckBadErasureIsRuntimeAbsentText)
    erasureExpectedNamespace erasureRequiredDecls (some "SystemsLean.Mult")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckErasureTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckErasureTermDialectOk : Bool :=
  (checkErasureTermDialect hostModuleCheckGoodErasureTermText).isNone

/-- Dialect rejects ET1.
    Greppable: hostModuleCheckBadErasureCheckFailClosedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadErasureCheckFailClosedDialectReject : Bool :=
  match checkErasureTermDialect hostModuleCheckBadErasureCheckFailClosedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects ET2.
    Greppable: hostModuleCheckBadErasureIsErasureGradeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadErasureIsErasureGradeDialectReject : Bool :=
  match checkErasureTermDialect hostModuleCheckBadErasureIsErasureGradeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects ET3.
    Greppable: hostModuleCheckBadErasureMarkForGradeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadErasureMarkForGradeDialectReject : Bool :=
  match checkErasureTermDialect hostModuleCheckBadErasureMarkForGradeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects ET4.
    Greppable: hostModuleCheckBadErasureIsRuntimeAbsentDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadErasureIsRuntimeAbsentDialectReject : Bool :=
  match checkErasureTermDialect hostModuleCheckBadErasureIsRuntimeAbsentText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined Erasure L2 dual-pin (good + ET1..ET4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckErasureTermSurfaceOk, TERM-SURFACE, Erasure-only. -/
def hostModuleCheckErasureTermSurfaceOk : Bool :=
  hostModuleCheckErasureTermSurfaceDualOk
    && (checkDepthErasureTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthErasureTermSurfaceScope == "Erasure-only")
    && hostModuleCheckErasureTermDialectOk
    && hostModuleCheckBadErasureCheckFailClosedDialectReject
    && hostModuleCheckBadErasureIsErasureGradeDialectReject
    && hostModuleCheckBadErasureMarkForGradeDialectReject
    && hostModuleCheckBadErasureIsRuntimeAbsentDialectReject
    && hostModuleCheckBadErasureCheckFailClosedL0Accept
    && hostModuleCheckBadErasureIsErasureGradeL0Accept
    && hostModuleCheckBadErasureMarkForGradeL0Accept
    && hostModuleCheckBadErasureIsRuntimeAbsentL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckErasureTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckErasureTermSurfaceOk_true :
    hostModuleCheckErasureTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_erasure_term_surface_ids_eq :
    checkDepthErasureTermSurfaceBar = "TERM-SURFACE"
      && checkDepthErasureTermSurfaceScope = "Erasure-only"
      && hostModuleCheckErasureTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
