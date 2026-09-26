/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckExtractTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckExtractTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckExtractTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckExtractTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKEXTRACTTERM,
  liveHostModuleCheckExtractTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKEXTRACTTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckExtractTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckExtractTerm

/-- Dual-pinned live HostModuleCheckExtractTerm.lean bytes.
    One part. Not split. 539 product lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckExtractTermSource,
    PARSE-LIVE-HOSTMODULECHECKEXTRACTTERM. -/
def liveHostModuleCheckExtractTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Extract L2 term-surface pilot (beyond Erasure).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Extract dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Extract L2 dialect subset (documented; not full Lean 4 elaborator):
  - RuntimeClaim.name arms: "RUNTIME-FS" / "RUNTIME-CLASSIC" / "EDGE-RUNTIME".
  - isFreestandingGoal match arms: one true + at least two false.
  - ofRuntimeTag? arms: some runtimeFs / classic / edge + none (four arms).
  - isValidRuntimeTag body exact (ofRuntimeTag? n).isSome.
  - checkFailClosed multi-line collapsed freestanding + Mult.mult0 Erasure path.
  - extractOk body exact checkFailClosed m e claim.
  - extractOkFromTags? multi-line with nested { marked := erasedMarked }.
  - inductive RuntimeClaim stays L0 token presence this pilot.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckExtractTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckExtractTermSurfaceOk (E-good dialect +
    XT1..XT4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - Extract pilot only -- not package elaborate, not ExtractTheorems L3.
  - Mult/Linear/Types/IrProgram/IrGraph/HostCompose/Erasure TERM-SURFACE dual-ok
    unchanged.
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for Extract is Extract-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckExtractTerm,
  TERM-SURFACE, Extract-only, ILL-TYPED-TERM, checkExtractTermDialect,
  hostModuleCheckBadExtractCheckFailClosedText,
  hostModuleCheckBadExtractIsFreestandingGoalText,
  hostModuleCheckBadExtractExtractOkText,
  hostModuleCheckBadExtractIsValidRuntimeTagText,
  hostModuleCheckExtractTermDialectOk, Extract term-surface pilot,
  hostModuleCheckExtractTermSurfaceDualOk,
  hostModuleCheckExtractTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckExtractTerm
  Red/green: lake build SystemsLean.HostModuleCheckExtractTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

/-! ### Extract L2 term-surface dual-ok pins (Extract-only) -/

/-- Named term-surface depth bar reused for Extract L2 pilot honesty.
    Greppable: checkDepthExtractTermSurfaceBar, TERM-SURFACE, Extract-only. -/
def checkDepthExtractTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: Extract.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthExtractTermSurfaceScope, Extract-only, TERM-SURFACE. -/
def checkDepthExtractTermSurfaceScope : String := "Extract-only"

/-- Dual-ok when Extract L2 E-good/E-bad rejects work (Extract pilot only).
    Greppable: hostModuleCheckExtractTermSurfaceDualOk, TERM-SURFACE,
    Extract-only. -/
def hostModuleCheckExtractTermSurfaceDualOk : Bool := true

/-! ### Extract dialect helpers (reuse Mult collapse / def parse) -/

/-- Body after first `:=` on a line, re-joining later `:=` pieces (structure
    literals such as `{ marked := erasedMarked }` must not truncate).
    Greppable: extractBodyAfterAssign, TERM-SURFACE, Extract-only. -/
def extractBodyAfterAssign (line : String) : String :=
  let t := stripLineComment line
  match t.splitOn ":=" with
  | [] => ""
  | [_] => ""
  | _ :: rest => trim (String.intercalate ":=" rest)

/-- Collapsed def body: same-line after `:=` when closed; else multi-line after
    header. Bare open brace `{` on the header line seeds multi-line collection.
    Greppable: extractDefBodyCollapsed, TERM-SURFACE, Extract-only. -/
def extractDefBodyCollapsed (content : String) (defName : String) : Option String :=
  match findDefHeaderLine content defName with
  | none => none
  | some header =>
    let headBody := extractBodyAfterAssign header
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
    Greppable: extractDefArmRhsList, TERM-SURFACE, Extract-only. -/
def extractDefArmRhsList (content : String) (defName : String) : List String :=
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
    Greppable: extractArmListHas, TERM-SURFACE, Extract-only. -/
def extractArmListHas (arms : List String) (needle : String) : Bool :=
  arms.any fun a => collapseWs a == needle

/-- RuntimeClaim.name arms carry the three greppable runtime ids.
    Greppable: extractRuntimeClaimNameArmsOk, TERM-SURFACE, Extract-only. -/
def extractRuntimeClaimNameArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "RuntimeClaim.name" with
  | none => false
  | some _ =>
    let arms := extractDefArmRhsList content "RuntimeClaim.name"
    extractArmListHas arms "\"RUNTIME-FS\""
      && extractArmListHas arms "\"RUNTIME-CLASSIC\""
      && extractArmListHas arms "\"EDGE-RUNTIME\""

/-- isFreestandingGoal match arms: one true; at least two false.
    Greppable: extractIsFreestandingGoalArmsOk, TERM-SURFACE, Extract-only. -/
def extractIsFreestandingGoalArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "isFreestandingGoal" with
  | none => false
  | some _ =>
    let arms := extractDefArmRhsList content "isFreestandingGoal"
    extractArmListHas arms "true"
      && extractArmListHas arms "false"
      && (arms.filter (fun a => collapseWs a == "false")).length >= 2
      && (arms.filter (fun a => collapseWs a == "true")).length == 1

/-- ofRuntimeTag? equation arms: three some claims + none fail-closed.
    Greppable: extractOfRuntimeTagArmsOk, TERM-SURFACE, Extract-only. -/
def extractOfRuntimeTagArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "ofRuntimeTag?" with
  | none => false
  | some _ =>
    let arms := extractDefArmRhsList content "ofRuntimeTag?"
    extractArmListHas arms "some RuntimeClaim.runtimeFs"
      && extractArmListHas arms "some RuntimeClaim.runtimeClassic"
      && extractArmListHas arms "some RuntimeClaim.edgeRuntime"
      && extractArmListHas arms "none"
      && arms.length == 4

/-- isValidRuntimeTag body is (ofRuntimeTag? n).isSome.
    Greppable: extractIsValidRuntimeTagBodyOk, TERM-SURFACE, Extract-only. -/
def extractIsValidRuntimeTagBodyOk (content : String) : Bool :=
  match extractDefBodyCollapsed content "isValidRuntimeTag" with
  | none => false
  | some body => body == "(ofRuntimeTag? n).isSome"

/-- checkFailClosed multi-line freestanding + Mult table body.
    Greppable: extractCheckFailClosedBodyOk, TERM-SURFACE, Extract-only. -/
def extractCheckFailClosedBodyOk (content : String) : Bool :=
  match extractDefBodyCollapsed content "checkFailClosed" with
  | none => false
  | some body =>
    body == "if !isFreestandingGoal claim then false else match m with | Mult.mult0 => SystemsLean.Erasure.checkFailClosed m e | Mult.mult1 => false | Mult.multOmega => true"

/-- extractOk body is checkFailClosed m e claim.
    Greppable: extractExtractOkBodyOk, TERM-SURFACE, Extract-only. -/
def extractExtractOkBodyOk (content : String) : Bool :=
  match extractDefBodyCollapsed content "extractOk" with
  | none => false
  | some body => body == "checkFailClosed m e claim"

/-- extractOkFromTags? multi-line raw-tag path with nested marked :=.
    Greppable: extractExtractOkFromTagsBodyOk, TERM-SURFACE, Extract-only. -/
def extractExtractOkFromTagsBodyOk (content : String) : Bool :=
  match extractDefBodyCollapsed content "extractOkFromTags?" with
  | none => false
  | some body =>
    body == "match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with | some m, some claim => some (extractOk m { marked := erasedMarked } claim) | _, _ => none"

/-- Extract L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkExtractTermDialect, TERM-SURFACE,
    Extract term-surface pilot. -/
def checkExtractTermDialect (content : String) : Option String :=
  if !extractRuntimeClaimNameArmsOk content then some reasonIllTypedTerm
  else if !extractIsFreestandingGoalArmsOk content then some reasonIllTypedTerm
  else if !extractOfRuntimeTagArmsOk content then some reasonIllTypedTerm
  else if !extractIsValidRuntimeTagBodyOk content then some reasonIllTypedTerm
  else if !extractCheckFailClosedBodyOk content then some reasonIllTypedTerm
  else if !extractExtractOkBodyOk content then some reasonIllTypedTerm
  else if !extractExtractOkFromTagsBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply Extract L2 after a structural Extract accept.
    Greppable: refineExtractWithTermSurface, TERM-SURFACE, Extract-only. -/
def refineExtractWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkExtractTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### Extract L2 well-typed good fixture (E-good) -/

/-- Shared Extract skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckExtractTermSkeletonPrefix, TERM-SURFACE,
    Extract-only. -/
def hostModuleCheckExtractTermSkeletonPrefix : String :=
  "import SystemsLean.Erasure\n" ++
  "namespace SystemsLean.Extract\n" ++
  "inductive RuntimeClaim where\n" ++
  "  | runtimeFs\n" ++
  "  | runtimeClassic\n" ++
  "  | edgeRuntime\n"

/-- Shared Extract skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckExtractTermSkeletonSuffix, TERM-SURFACE,
    Extract-only. -/
def hostModuleCheckExtractTermSkeletonSuffix : String :=
  "end SystemsLean.Extract\n"

/-- Well-typed name/goal/tag/check mid.
    Greppable: hostModuleCheckExtractTermGoodMid, TERM-SURFACE, Extract-only. -/
def hostModuleCheckExtractTermGoodMid : String :=
  "def RuntimeClaim.name : RuntimeClaim -> String\n" ++
  "  | RuntimeClaim.runtimeFs => \"RUNTIME-FS\"\n" ++
  "  | RuntimeClaim.runtimeClassic => \"RUNTIME-CLASSIC\"\n" ++
  "  | RuntimeClaim.edgeRuntime => \"EDGE-RUNTIME\"\n" ++
  "def isFreestandingGoal (c : RuntimeClaim) : Bool :=\n" ++
  "  match c with\n" ++
  "  | RuntimeClaim.runtimeFs => true\n" ++
  "  | RuntimeClaim.runtimeClassic => false\n" ++
  "  | RuntimeClaim.edgeRuntime => false\n" ++
  "def ofRuntimeTag? : Nat -> Option RuntimeClaim\n" ++
  "  | 0 => some RuntimeClaim.runtimeFs\n" ++
  "  | 1 => some RuntimeClaim.runtimeClassic\n" ++
  "  | 2 => some RuntimeClaim.edgeRuntime\n" ++
  "  | _ => none\n" ++
  "def isValidRuntimeTag (n : Nat) : Bool := (ofRuntimeTag? n).isSome\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n" ++
  "  if !isFreestandingGoal claim then\n" ++
  "    false\n" ++
  "  else\n" ++
  "    match m with\n" ++
  "    | Mult.mult0 => SystemsLean.Erasure.checkFailClosed m e\n" ++
  "    | Mult.mult1 => false\n" ++
  "    | Mult.multOmega => true\n" ++
  "def extractOk (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n" ++
  "  checkFailClosed m e claim\n" ++
  "def extractOkFromTags? (multTag : Nat) (erasedMarked : Bool) (runtimeTag : Nat) : Option Bool :=\n" ++
  "  match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with\n" ++
  "  | some m, some claim =>\n" ++
  "    some (extractOk m { marked := erasedMarked } claim)\n" ++
  "  | _, _ => none\n"

/-- Well-typed Extract L2 good text.
    Greppable: hostModuleCheckGoodExtractTermText, TERM-SURFACE, Extract-only. -/
def hostModuleCheckGoodExtractTermText : String :=
  hostModuleCheckExtractTermSkeletonPrefix
    ++ hostModuleCheckExtractTermGoodMid
    ++ hostModuleCheckExtractTermSkeletonSuffix

/-! ### Ill-typed Extract twins (L0 tokens present; L2 must reject). -/

/-- XT1: checkFailClosed always true. L0 still has def:checkFailClosed.
    Greppable: hostModuleCheckBadExtractCheckFailClosedText, TERM-SURFACE. -/
def hostModuleCheckBadExtractCheckFailClosedText : String :=
  hostModuleCheckExtractTermSkeletonPrefix ++
  "def RuntimeClaim.name : RuntimeClaim -> String\n" ++
  "  | RuntimeClaim.runtimeFs => \"RUNTIME-FS\"\n" ++
  "  | RuntimeClaim.runtimeClassic => \"RUNTIME-CLASSIC\"\n" ++
  "  | RuntimeClaim.edgeRuntime => \"EDGE-RUNTIME\"\n" ++
  "def isFreestandingGoal (c : RuntimeClaim) : Bool :=\n" ++
  "  match c with\n" ++
  "  | RuntimeClaim.runtimeFs => true\n" ++
  "  | RuntimeClaim.runtimeClassic => false\n" ++
  "  | RuntimeClaim.edgeRuntime => false\n" ++
  "def ofRuntimeTag? : Nat -> Option RuntimeClaim\n" ++
  "  | 0 => some RuntimeClaim.runtimeFs\n" ++
  "  | 1 => some RuntimeClaim.runtimeClassic\n" ++
  "  | 2 => some RuntimeClaim.edgeRuntime\n" ++
  "  | _ => none\n" ++
  "def isValidRuntimeTag (n : Nat) : Bool := (ofRuntimeTag? n).isSome\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool := true\n" ++
  "def extractOk (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n" ++
  "  checkFailClosed m e claim\n" ++
  "def extractOkFromTags? (multTag : Nat) (erasedMarked : Bool) (runtimeTag : Nat) : Option Bool :=\n" ++
  "  match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with\n" ++
  "  | some m, some claim => some (extractOk m { marked := erasedMarked } claim)\n" ++
  "  | _, _ => none\n" ++
  hostModuleCheckExtractTermSkeletonSuffix

/-- XT2: isFreestandingGoal always true (no classic/edge reject).
    Greppable: hostModuleCheckBadExtractIsFreestandingGoalText, TERM-SURFACE. -/
def hostModuleCheckBadExtractIsFreestandingGoalText : String :=
  hostModuleCheckExtractTermSkeletonPrefix ++
  "def RuntimeClaim.name : RuntimeClaim -> String\n" ++
  "  | RuntimeClaim.runtimeFs => \"RUNTIME-FS\"\n" ++
  "  | RuntimeClaim.runtimeClassic => \"RUNTIME-CLASSIC\"\n" ++
  "  | RuntimeClaim.edgeRuntime => \"EDGE-RUNTIME\"\n" ++
  "def isFreestandingGoal (c : RuntimeClaim) : Bool := true\n" ++
  "def ofRuntimeTag? : Nat -> Option RuntimeClaim\n" ++
  "  | 0 => some RuntimeClaim.runtimeFs\n" ++
  "  | 1 => some RuntimeClaim.runtimeClassic\n" ++
  "  | 2 => some RuntimeClaim.edgeRuntime\n" ++
  "  | _ => none\n" ++
  "def isValidRuntimeTag (n : Nat) : Bool := (ofRuntimeTag? n).isSome\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n" ++
  "  if !isFreestandingGoal claim then\n" ++
  "    false\n" ++
  "  else\n" ++
  "    match m with\n" ++
  "    | Mult.mult0 => SystemsLean.Erasure.checkFailClosed m e\n" ++
  "    | Mult.mult1 => false\n" ++
  "    | Mult.multOmega => true\n" ++
  "def extractOk (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n" ++
  "  checkFailClosed m e claim\n" ++
  "def extractOkFromTags? (multTag : Nat) (erasedMarked : Bool) (runtimeTag : Nat) : Option Bool :=\n" ++
  "  match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with\n" ++
  "  | some m, some claim => some (extractOk m { marked := erasedMarked } claim)\n" ++
  "  | _, _ => none\n" ++
  hostModuleCheckExtractTermSkeletonSuffix

/-- XT3: extractOk always true (bypasses checkFailClosed).
    Greppable: hostModuleCheckBadExtractExtractOkText, TERM-SURFACE. -/
def hostModuleCheckBadExtractExtractOkText : String :=
  hostModuleCheckExtractTermSkeletonPrefix ++
  "def RuntimeClaim.name : RuntimeClaim -> String\n" ++
  "  | RuntimeClaim.runtimeFs => \"RUNTIME-FS\"\n" ++
  "  | RuntimeClaim.runtimeClassic => \"RUNTIME-CLASSIC\"\n" ++
  "  | RuntimeClaim.edgeRuntime => \"EDGE-RUNTIME\"\n" ++
  "def isFreestandingGoal (c : RuntimeClaim) : Bool :=\n" ++
  "  match c with\n" ++
  "  | RuntimeClaim.runtimeFs => true\n" ++
  "  | RuntimeClaim.runtimeClassic => false\n" ++
  "  | RuntimeClaim.edgeRuntime => false\n" ++
  "def ofRuntimeTag? : Nat -> Option RuntimeClaim\n" ++
  "  | 0 => some RuntimeClaim.runtimeFs\n" ++
  "  | 1 => some RuntimeClaim.runtimeClassic\n" ++
  "  | 2 => some RuntimeClaim.edgeRuntime\n" ++
  "  | _ => none\n" ++
  "def isValidRuntimeTag (n : Nat) : Bool := (ofRuntimeTag? n).isSome\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n" ++
  "  if !isFreestandingGoal claim then\n" ++
  "    false\n" ++
  "  else\n" ++
  "    match m with\n" ++
  "    | Mult.mult0 => SystemsLean.Erasure.checkFailClosed m e\n" ++
  "    | Mult.mult1 => false\n" ++
  "    | Mult.multOmega => true\n" ++
  "def extractOk (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool := true\n" ++
  "def extractOkFromTags? (multTag : Nat) (erasedMarked : Bool) (runtimeTag : Nat) : Option Bool :=\n" ++
  "  match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with\n" ++
  "  | some m, some claim => some (extractOk m { marked := erasedMarked } claim)\n" ++
  "  | _, _ => none\n" ++
  hostModuleCheckExtractTermSkeletonSuffix

/-- XT4: isValidRuntimeTag always true (ignores ofRuntimeTag?).
    Greppable: hostModuleCheckBadExtractIsValidRuntimeTagText, TERM-SURFACE. -/
def hostModuleCheckBadExtractIsValidRuntimeTagText : String :=
  hostModuleCheckExtractTermSkeletonPrefix ++
  "def RuntimeClaim.name : RuntimeClaim -> String\n" ++
  "  | RuntimeClaim.runtimeFs => \"RUNTIME-FS\"\n" ++
  "  | RuntimeClaim.runtimeClassic => \"RUNTIME-CLASSIC\"\n" ++
  "  | RuntimeClaim.edgeRuntime => \"EDGE-RUNTIME\"\n" ++
  "def isFreestandingGoal (c : RuntimeClaim) : Bool :=\n" ++
  "  match c with\n" ++
  "  | RuntimeClaim.runtimeFs => true\n" ++
  "  | RuntimeClaim.runtimeClassic => false\n" ++
  "  | RuntimeClaim.edgeRuntime => false\n" ++
  "def ofRuntimeTag? : Nat -> Option RuntimeClaim\n" ++
  "  | 0 => some RuntimeClaim.runtimeFs\n" ++
  "  | 1 => some RuntimeClaim.runtimeClassic\n" ++
  "  | 2 => some RuntimeClaim.edgeRuntime\n" ++
  "  | _ => none\n" ++
  "def isValidRuntimeTag (n : Nat) : Bool := true\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n" ++
  "  if !isFreestandingGoal claim then\n" ++
  "    false\n" ++
  "  else\n" ++
  "    match m with\n" ++
  "    | Mult.mult0 => SystemsLean.Erasure.checkFailClosed m e\n" ++
  "    | Mult.mult1 => false\n" ++
  "    | Mult.multOmega => true\n" ++
  "def extractOk (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n" ++
  "  checkFailClosed m e claim\n" ++
  "def extractOkFromTags? (multTag : Nat) (erasedMarked : Bool) (runtimeTag : Nat) : Option Bool :=\n" ++
  "  match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with\n" ++
  "  | some m, some claim => some (extractOk m { marked := erasedMarked } claim)\n" ++
  "  | _, _ => none\n" ++
  hostModuleCheckExtractTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from Extract twin text for L0 dual-pin. -/
def extractTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.Extract"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept XT1 when tokens present.
    Greppable: hostModuleCheckBadExtractCheckFailClosedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadExtractCheckFailClosedL0Accept : Bool :=
  (checkNamedSurface (extractTermSurfaceFrom
      hostModuleCheckBadExtractCheckFailClosedText)
    extractExpectedNamespace extractRequiredDecls (some "SystemsLean.Erasure")).isAccept

/-- L0/L1 still accept XT2 when tokens present.
    Greppable: hostModuleCheckBadExtractIsFreestandingGoalL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadExtractIsFreestandingGoalL0Accept : Bool :=
  (checkNamedSurface (extractTermSurfaceFrom
      hostModuleCheckBadExtractIsFreestandingGoalText)
    extractExpectedNamespace extractRequiredDecls (some "SystemsLean.Erasure")).isAccept

/-- L0/L1 still accept XT3 when tokens present.
    Greppable: hostModuleCheckBadExtractExtractOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadExtractExtractOkL0Accept : Bool :=
  (checkNamedSurface (extractTermSurfaceFrom
      hostModuleCheckBadExtractExtractOkText)
    extractExpectedNamespace extractRequiredDecls (some "SystemsLean.Erasure")).isAccept

/-- L0/L1 still accept XT4 when tokens present.
    Greppable: hostModuleCheckBadExtractIsValidRuntimeTagL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadExtractIsValidRuntimeTagL0Accept : Bool :=
  (checkNamedSurface (extractTermSurfaceFrom
      hostModuleCheckBadExtractIsValidRuntimeTagText)
    extractExpectedNamespace extractRequiredDecls (some "SystemsLean.Erasure")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckExtractTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckExtractTermDialectOk : Bool :=
  (checkExtractTermDialect hostModuleCheckGoodExtractTermText).isNone

/-- Dialect rejects XT1.
    Greppable: hostModuleCheckBadExtractCheckFailClosedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadExtractCheckFailClosedDialectReject : Bool :=
  match checkExtractTermDialect hostModuleCheckBadExtractCheckFailClosedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects XT2.
    Greppable: hostModuleCheckBadExtractIsFreestandingGoalDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadExtractIsFreestandingGoalDialectReject : Bool :=
  match checkExtractTermDialect hostModuleCheckBadExtractIsFreestandingGoalText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects XT3.
    Greppable: hostModuleCheckBadExtractExtractOkDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadExtractExtractOkDialectReject : Bool :=
  match checkExtractTermDialect hostModuleCheckBadExtractExtractOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects XT4.
    Greppable: hostModuleCheckBadExtractIsValidRuntimeTagDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadExtractIsValidRuntimeTagDialectReject : Bool :=
  match checkExtractTermDialect hostModuleCheckBadExtractIsValidRuntimeTagText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined Extract L2 dual-pin (good + XT1..XT4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckExtractTermSurfaceOk, TERM-SURFACE, Extract-only. -/
def hostModuleCheckExtractTermSurfaceOk : Bool :=
  hostModuleCheckExtractTermSurfaceDualOk
    && (checkDepthExtractTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthExtractTermSurfaceScope == "Extract-only")
    && hostModuleCheckExtractTermDialectOk
    && hostModuleCheckBadExtractCheckFailClosedDialectReject
    && hostModuleCheckBadExtractIsFreestandingGoalDialectReject
    && hostModuleCheckBadExtractExtractOkDialectReject
    && hostModuleCheckBadExtractIsValidRuntimeTagDialectReject
    && hostModuleCheckBadExtractCheckFailClosedL0Accept
    && hostModuleCheckBadExtractIsFreestandingGoalL0Accept
    && hostModuleCheckBadExtractExtractOkL0Accept
    && hostModuleCheckBadExtractIsValidRuntimeTagL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckExtractTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckExtractTermSurfaceOk_true :
    hostModuleCheckExtractTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_extract_term_surface_ids_eq :
    checkDepthExtractTermSurfaceBar = "TERM-SURFACE"
      && checkDepthExtractTermSurfaceScope = "Extract-only"
      && hostModuleCheckExtractTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckExtractTerm
