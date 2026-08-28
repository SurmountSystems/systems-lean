/-
  SYSTEMS_LEAN_HOST partial -- EmitPlan L2 term-surface pilot (beyond Extract).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitPlan dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitPlan L2 dialect subset (documented; not full Lean 4 elaborator):
  - Plan.failClosed multi-line structure zeros + ready/valid false.
  - isRuntimeMult match arms: mult0 false; mult1 true; multOmega true.
  - planFromCompose fail-closed on !HostCompose.checkFailClosed else inventory
    ready/valid true with count fields.
  - isReady body exact p.valid && p.ready.
  - planOk body exact isReady (planFromCompose hc).
  - fromCompose / countRuntimeNodes / countErasedNodes stay L0 token this pilot.
  - structure Plan stays L0 token presence this pilot.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitPlanTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitPlanTermSurfaceOk (E-good dialect +
    EP1..EP4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitPlan pilot only -- not package elaborate, not EmitPlan theorems L3,
    not EmitApply/EmitBody term-surface in this slice.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for EmitPlan is EmitPlan-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckEmitPlanTerm,
  TERM-SURFACE, EmitPlan-only, ILL-TYPED-TERM, checkEmitPlanTermDialect,
  hostModuleCheckBadEmitPlanFailClosedText,
  hostModuleCheckBadEmitPlanIsRuntimeMultText,
  hostModuleCheckBadEmitPlanFromComposeText,
  hostModuleCheckBadEmitPlanIsReadyText,
  hostModuleCheckEmitPlanTermDialectOk, EmitPlan term-surface pilot,
  hostModuleCheckEmitPlanTermSurfaceDualOk,
  hostModuleCheckEmitPlanTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitPlanTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitPlanTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitPlan L2 term-surface dual-ok pins (EmitPlan-only) -/

/-- Named term-surface depth bar reused for EmitPlan L2 pilot honesty.
    Greppable: checkDepthEmitPlanTermSurfaceBar, TERM-SURFACE, EmitPlan-only. -/
def checkDepthEmitPlanTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitPlan.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthEmitPlanTermSurfaceScope, EmitPlan-only, TERM-SURFACE. -/
def checkDepthEmitPlanTermSurfaceScope : String := "EmitPlan-only"

/-- Dual-ok when EmitPlan L2 E-good/E-bad rejects work (EmitPlan pilot only).
    Greppable: hostModuleCheckEmitPlanTermSurfaceDualOk, TERM-SURFACE,
    EmitPlan-only. -/
def hostModuleCheckEmitPlanTermSurfaceDualOk : Bool := true

/-! ### EmitPlan dialect helpers (reuse Mult collapse / Extract body parse) -/

/-- Body after first `:=` on a line, re-joining later `:=` pieces (structure
    literals such as `{ ready := false }` must not truncate).
    Greppable: emitPlanBodyAfterAssign, TERM-SURFACE, EmitPlan-only. -/
def emitPlanBodyAfterAssign (line : String) : String :=
  let t := stripLineComment line
  match t.splitOn ":=" with
  | [] => ""
  | [_] => ""
  | _ :: rest => trim (String.intercalate ":=" rest)

/-- Collapsed def body: same-line after `:=` when closed; else multi-line after
    header. Bare open brace `{` on the header line seeds multi-line collection.
    Greppable: emitPlanDefBodyCollapsed, TERM-SURFACE, EmitPlan-only. -/
def emitPlanDefBodyCollapsed (content : String) (defName : String) : Option String :=
  match findDefHeaderLine content defName with
  | none => none
  | some header =>
    let headBody := emitPlanBodyAfterAssign header
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
    Greppable: emitPlanDefArmRhsList, TERM-SURFACE, EmitPlan-only. -/
def emitPlanDefArmRhsList (content : String) (defName : String) : List String :=
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
    Greppable: emitPlanArmListHas, TERM-SURFACE, EmitPlan-only. -/
def emitPlanArmListHas (arms : List String) (needle : String) : Bool :=
  arms.any fun a => collapseWs a == needle

/-- Plan.failClosed is zeroed inventory with ready/valid false.
    Greppable: emitPlanFailClosedBodyOk, TERM-SURFACE, EmitPlan-only. -/
def emitPlanFailClosedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "Plan.failClosed" with
  | none => false
  | some body =>
    body == "{ nodeCount := 0 edgeCount := 0 runtimeNodes := 0 erasedNodes := 0 ready := false valid := false }"

/-- isRuntimeMult arms: mult0 false; mult1 true; multOmega true.
    Greppable: emitPlanIsRuntimeMultArmsOk, TERM-SURFACE, EmitPlan-only. -/
def emitPlanIsRuntimeMultArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "isRuntimeMult" with
  | none => false
  | some _ =>
    let arms := emitPlanDefArmRhsList content "isRuntimeMult"
    emitPlanArmListHas arms "false"
      && emitPlanArmListHas arms "true"
      && (arms.filter (fun a => collapseWs a == "false")).length == 1
      && (arms.filter (fun a => collapseWs a == "true")).length == 2
      && arms.length == 3

/-- planFromCompose fail-closed inventory body (collapsed multi-line).
    Greppable: emitPlanFromComposeBodyOk, TERM-SURFACE, EmitPlan-only. -/
def emitPlanFromComposeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "planFromCompose" with
  | none => false
  | some body =>
    body == "if !HostCompose.checkFailClosed hc then Plan.failClosed else let nodes := hc.graph.prog.nodes { nodeCount := nodes.length edgeCount := hc.graph.edges.length runtimeNodes := countRuntimeNodes nodes erasedNodes := countErasedNodes nodes ready := true valid := true }"

/-- isReady body is p.valid && p.ready.
    Greppable: emitPlanIsReadyBodyOk, TERM-SURFACE, EmitPlan-only. -/
def emitPlanIsReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "isReady" with
  | none => false
  | some body => body == "p.valid && p.ready"

/-- planOk body is isReady (planFromCompose hc).
    Greppable: emitPlanPlanOkBodyOk, TERM-SURFACE, EmitPlan-only. -/
def emitPlanPlanOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "planOk" with
  | none => false
  | some body => body == "isReady (planFromCompose hc)"

/-- EmitPlan L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitPlanTermDialect, TERM-SURFACE,
    EmitPlan term-surface pilot. -/
def checkEmitPlanTermDialect (content : String) : Option String :=
  if !emitPlanFailClosedBodyOk content then some reasonIllTypedTerm
  else if !emitPlanIsRuntimeMultArmsOk content then some reasonIllTypedTerm
  else if !emitPlanFromComposeBodyOk content then some reasonIllTypedTerm
  else if !emitPlanIsReadyBodyOk content then some reasonIllTypedTerm
  else if !emitPlanPlanOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitPlan L2 after a structural EmitPlan accept.
    Greppable: refineEmitPlanWithTermSurface, TERM-SURFACE, EmitPlan-only. -/
def refineEmitPlanWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitPlanTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitPlan L2 well-typed good fixture (E-good) -/

/-- Shared EmitPlan skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckEmitPlanTermSkeletonPrefix, TERM-SURFACE,
    EmitPlan-only. -/
def hostModuleCheckEmitPlanTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.Types\n" ++
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitPlanScaffold\n" ++
  "namespace SystemsLean.EmitPlan\n" ++
  "structure Plan where\n" ++
  "  nodeCount : Nat\n" ++
  "  edgeCount : Nat\n" ++
  "  runtimeNodes : Nat\n" ++
  "  erasedNodes : Nat\n" ++
  "  ready : Bool\n" ++
  "  valid : Bool\n"

/-- Shared EmitPlan skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckEmitPlanTermSkeletonSuffix, TERM-SURFACE,
    EmitPlan-only. -/
def hostModuleCheckEmitPlanTermSkeletonSuffix : String :=
  "end SystemsLean.EmitPlan\n"

/-- Well-typed failClosed/runtime/plan mid.
    Greppable: hostModuleCheckEmitPlanTermGoodMid, TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckEmitPlanTermGoodMid : String :=
  "def Plan.failClosed : Plan := {\n" ++
  "  nodeCount := 0\n" ++
  "  edgeCount := 0\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  ready := false\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def isRuntimeMult (m : Mult) : Bool :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => false\n" ++
  "  | Mult.mult1 => true\n" ++
  "  | Mult.multOmega => true\n" ++
  "def countRuntimeNodes (nodes : List Nat) : Nat := 0\n" ++
  "def countErasedNodes (nodes : List Nat) : Nat := 0\n" ++
  "def planFromCompose (hc : Host) : Plan :=\n" ++
  "  if !HostCompose.checkFailClosed hc then\n" ++
  "    Plan.failClosed\n" ++
  "  else\n" ++
  "    let nodes := hc.graph.prog.nodes\n" ++
  "    {\n" ++
  "      nodeCount := nodes.length\n" ++
  "      edgeCount := hc.graph.edges.length\n" ++
  "      runtimeNodes := countRuntimeNodes nodes\n" ++
  "      erasedNodes := countErasedNodes nodes\n" ++
  "      ready := true\n" ++
  "      valid := true\n" ++
  "    }\n" ++
  "def fromCompose (hc : Host) : Plan := planFromCompose hc\n" ++
  "def isReady (p : Plan) : Bool :=\n" ++
  "  p.valid && p.ready\n" ++
  "def planOk (hc : Host) : Bool :=\n" ++
  "  isReady (planFromCompose hc)\n"

/-- Well-typed EmitPlan L2 good text.
    Greppable: hostModuleCheckGoodEmitPlanTermText, TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckGoodEmitPlanTermText : String :=
  hostModuleCheckEmitPlanTermSkeletonPrefix
    ++ hostModuleCheckEmitPlanTermGoodMid
    ++ hostModuleCheckEmitPlanTermSkeletonSuffix

/-! ### Ill-typed EmitPlan twins (L0 tokens present; L2 must reject). -/

/-- EP1: Plan.failClosed ready true (not fail-closed zeros).
    Greppable: hostModuleCheckBadEmitPlanFailClosedText, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanFailClosedText : String :=
  hostModuleCheckEmitPlanTermSkeletonPrefix ++
  "def Plan.failClosed : Plan := {\n" ++
  "  nodeCount := 0\n" ++
  "  edgeCount := 0\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  ready := true\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def isRuntimeMult (m : Mult) : Bool :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => false\n" ++
  "  | Mult.mult1 => true\n" ++
  "  | Mult.multOmega => true\n" ++
  "def countRuntimeNodes (nodes : List Nat) : Nat := 0\n" ++
  "def countErasedNodes (nodes : List Nat) : Nat := 0\n" ++
  "def planFromCompose (hc : Host) : Plan :=\n" ++
  "  if !HostCompose.checkFailClosed hc then\n" ++
  "    Plan.failClosed\n" ++
  "  else\n" ++
  "    let nodes := hc.graph.prog.nodes\n" ++
  "    {\n" ++
  "      nodeCount := nodes.length\n" ++
  "      edgeCount := hc.graph.edges.length\n" ++
  "      runtimeNodes := countRuntimeNodes nodes\n" ++
  "      erasedNodes := countErasedNodes nodes\n" ++
  "      ready := true\n" ++
  "      valid := true\n" ++
  "    }\n" ++
  "def fromCompose (hc : Host) : Plan := planFromCompose hc\n" ++
  "def isReady (p : Plan) : Bool :=\n" ++
  "  p.valid && p.ready\n" ++
  "def planOk (hc : Host) : Bool :=\n" ++
  "  isReady (planFromCompose hc)\n" ++
  hostModuleCheckEmitPlanTermSkeletonSuffix

/-- EP2: isRuntimeMult always true (no mult0 erase).
    Greppable: hostModuleCheckBadEmitPlanIsRuntimeMultText, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanIsRuntimeMultText : String :=
  hostModuleCheckEmitPlanTermSkeletonPrefix ++
  "def Plan.failClosed : Plan := {\n" ++
  "  nodeCount := 0\n" ++
  "  edgeCount := 0\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  ready := false\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def isRuntimeMult (m : Mult) : Bool := true\n" ++
  "def countRuntimeNodes (nodes : List Nat) : Nat := 0\n" ++
  "def countErasedNodes (nodes : List Nat) : Nat := 0\n" ++
  "def planFromCompose (hc : Host) : Plan :=\n" ++
  "  if !HostCompose.checkFailClosed hc then\n" ++
  "    Plan.failClosed\n" ++
  "  else\n" ++
  "    let nodes := hc.graph.prog.nodes\n" ++
  "    {\n" ++
  "      nodeCount := nodes.length\n" ++
  "      edgeCount := hc.graph.edges.length\n" ++
  "      runtimeNodes := countRuntimeNodes nodes\n" ++
  "      erasedNodes := countErasedNodes nodes\n" ++
  "      ready := true\n" ++
  "      valid := true\n" ++
  "    }\n" ++
  "def fromCompose (hc : Host) : Plan := planFromCompose hc\n" ++
  "def isReady (p : Plan) : Bool :=\n" ++
  "  p.valid && p.ready\n" ++
  "def planOk (hc : Host) : Bool :=\n" ++
  "  isReady (planFromCompose hc)\n" ++
  hostModuleCheckEmitPlanTermSkeletonSuffix

/-- EP3: planFromCompose always Plan.failClosed (drops checkFailClosed path).
    Greppable: hostModuleCheckBadEmitPlanFromComposeText, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanFromComposeText : String :=
  hostModuleCheckEmitPlanTermSkeletonPrefix ++
  "def Plan.failClosed : Plan := {\n" ++
  "  nodeCount := 0\n" ++
  "  edgeCount := 0\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  ready := false\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def isRuntimeMult (m : Mult) : Bool :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => false\n" ++
  "  | Mult.mult1 => true\n" ++
  "  | Mult.multOmega => true\n" ++
  "def countRuntimeNodes (nodes : List Nat) : Nat := 0\n" ++
  "def countErasedNodes (nodes : List Nat) : Nat := 0\n" ++
  "def planFromCompose (hc : Host) : Plan := Plan.failClosed\n" ++
  "def fromCompose (hc : Host) : Plan := planFromCompose hc\n" ++
  "def isReady (p : Plan) : Bool :=\n" ++
  "  p.valid && p.ready\n" ++
  "def planOk (hc : Host) : Bool :=\n" ++
  "  isReady (planFromCompose hc)\n" ++
  hostModuleCheckEmitPlanTermSkeletonSuffix

/-- EP4: isReady always true (bypasses valid/ready).
    Greppable: hostModuleCheckBadEmitPlanIsReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanIsReadyText : String :=
  hostModuleCheckEmitPlanTermSkeletonPrefix ++
  "def Plan.failClosed : Plan := {\n" ++
  "  nodeCount := 0\n" ++
  "  edgeCount := 0\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  ready := false\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def isRuntimeMult (m : Mult) : Bool :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => false\n" ++
  "  | Mult.mult1 => true\n" ++
  "  | Mult.multOmega => true\n" ++
  "def countRuntimeNodes (nodes : List Nat) : Nat := 0\n" ++
  "def countErasedNodes (nodes : List Nat) : Nat := 0\n" ++
  "def planFromCompose (hc : Host) : Plan :=\n" ++
  "  if !HostCompose.checkFailClosed hc then\n" ++
  "    Plan.failClosed\n" ++
  "  else\n" ++
  "    let nodes := hc.graph.prog.nodes\n" ++
  "    {\n" ++
  "      nodeCount := nodes.length\n" ++
  "      edgeCount := hc.graph.edges.length\n" ++
  "      runtimeNodes := countRuntimeNodes nodes\n" ++
  "      erasedNodes := countErasedNodes nodes\n" ++
  "      ready := true\n" ++
  "      valid := true\n" ++
  "    }\n" ++
  "def fromCompose (hc : Host) : Plan := planFromCompose hc\n" ++
  "def isReady (p : Plan) : Bool := true\n" ++
  "def planOk (hc : Host) : Bool :=\n" ++
  "  isReady (planFromCompose hc)\n" ++
  hostModuleCheckEmitPlanTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitPlan twin text for L0 dual-pin. -/
def emitPlanTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitPlan"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept EP1 when tokens present.
    Greppable: hostModuleCheckBadEmitPlanFailClosedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanFailClosedL0Accept : Bool :=
  (checkNamedSurface (emitPlanTermSurfaceFrom
      hostModuleCheckBadEmitPlanFailClosedText)
    emitPlanExpectedNamespace emitPlanRequiredDecls
    (some "SystemsLean.EmitPlanScaffold")).isAccept

/-- L0/L1 still accept EP2 when tokens present.
    Greppable: hostModuleCheckBadEmitPlanIsRuntimeMultL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanIsRuntimeMultL0Accept : Bool :=
  (checkNamedSurface (emitPlanTermSurfaceFrom
      hostModuleCheckBadEmitPlanIsRuntimeMultText)
    emitPlanExpectedNamespace emitPlanRequiredDecls
    (some "SystemsLean.EmitPlanScaffold")).isAccept

/-- L0/L1 still accept EP3 when tokens present.
    Greppable: hostModuleCheckBadEmitPlanFromComposeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanFromComposeL0Accept : Bool :=
  (checkNamedSurface (emitPlanTermSurfaceFrom
      hostModuleCheckBadEmitPlanFromComposeText)
    emitPlanExpectedNamespace emitPlanRequiredDecls
    (some "SystemsLean.EmitPlanScaffold")).isAccept

/-- L0/L1 still accept EP4 when tokens present.
    Greppable: hostModuleCheckBadEmitPlanIsReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanIsReadyL0Accept : Bool :=
  (checkNamedSurface (emitPlanTermSurfaceFrom
      hostModuleCheckBadEmitPlanIsReadyText)
    emitPlanExpectedNamespace emitPlanRequiredDecls
    (some "SystemsLean.EmitPlanScaffold")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckEmitPlanTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitPlanTermDialectOk : Bool :=
  (checkEmitPlanTermDialect hostModuleCheckGoodEmitPlanTermText).isNone

/-- Dialect rejects EP1.
    Greppable: hostModuleCheckBadEmitPlanFailClosedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanFailClosedDialectReject : Bool :=
  match checkEmitPlanTermDialect hostModuleCheckBadEmitPlanFailClosedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EP2.
    Greppable: hostModuleCheckBadEmitPlanIsRuntimeMultDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanIsRuntimeMultDialectReject : Bool :=
  match checkEmitPlanTermDialect hostModuleCheckBadEmitPlanIsRuntimeMultText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EP3.
    Greppable: hostModuleCheckBadEmitPlanFromComposeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanFromComposeDialectReject : Bool :=
  match checkEmitPlanTermDialect hostModuleCheckBadEmitPlanFromComposeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EP4.
    Greppable: hostModuleCheckBadEmitPlanIsReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitPlanIsReadyDialectReject : Bool :=
  match checkEmitPlanTermDialect hostModuleCheckBadEmitPlanIsReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitPlan L2 dual-pin (good + EP1..EP4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckEmitPlanTermSurfaceOk, TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckEmitPlanTermSurfaceOk : Bool :=
  hostModuleCheckEmitPlanTermSurfaceDualOk
    && (checkDepthEmitPlanTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitPlanTermSurfaceScope == "EmitPlan-only")
    && hostModuleCheckEmitPlanTermDialectOk
    && hostModuleCheckBadEmitPlanFailClosedDialectReject
    && hostModuleCheckBadEmitPlanIsRuntimeMultDialectReject
    && hostModuleCheckBadEmitPlanFromComposeDialectReject
    && hostModuleCheckBadEmitPlanIsReadyDialectReject
    && hostModuleCheckBadEmitPlanFailClosedL0Accept
    && hostModuleCheckBadEmitPlanIsRuntimeMultL0Accept
    && hostModuleCheckBadEmitPlanFromComposeL0Accept
    && hostModuleCheckBadEmitPlanIsReadyL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitPlanTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitPlanTermSurfaceOk_true :
    hostModuleCheckEmitPlanTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_plan_term_surface_ids_eq :
    checkDepthEmitPlanTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitPlanTermSurfaceScope = "EmitPlan-only"
      && hostModuleCheckEmitPlanTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
