/-
  SYSTEMS_LEAN_HOST partial -- EmitApply L2 term-surface pilot (after EmitPlan).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitApply dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitApply L2 dialect subset (documented; not full Lean 4 elaborator):
  - Apply.failClosed multi-line tags=[] count=0 valid=false.
  - applyCap body exact 32 (APPLY_CAP honesty).
  - multCode match arms: mult0=>0; mult1=>1; multOmega=>2.
  - applyFromCompose fail-closed on !HostCompose.checkFailClosed, cap
    overflow, else packTag inventory valid true.
  - applyIsValid body a.valid && decide count<=cap && decide count==tags.length.
  - applyOk body applyIsValid (applyFromCompose hc).
  - packTag / kindCode / fromCompose / tagMult stay L0 token this pilot.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitApplyTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitApplyTermSurfaceOk (E-good dialect +
    EA1..EA4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitApply pilot only -- not package elaborate, not EmitApply theorems L3,
    not EmitBody term-surface in this slice.
  - Mult..Extract + EmitPlan TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for EmitApply is EmitApply-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckEmitApplyTerm,
  TERM-SURFACE, EmitApply-only, ILL-TYPED-TERM, checkEmitApplyTermDialect,
  hostModuleCheckBadEmitApplyFailClosedText,
  hostModuleCheckBadEmitApplyCapText,
  hostModuleCheckBadEmitApplyMultCodeText,
  hostModuleCheckBadEmitApplyFromComposeText,
  hostModuleCheckEmitApplyTermDialectOk, EmitApply term-surface pilot,
  hostModuleCheckEmitApplyTermSurfaceDualOk,
  hostModuleCheckEmitApplyTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitApplyTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitApplyTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitApply L2 term-surface dual-ok pins (EmitApply-only) -/

/-- Named term-surface depth bar reused for EmitApply L2 pilot honesty.
    Greppable: checkDepthEmitApplyTermSurfaceBar, TERM-SURFACE, EmitApply-only. -/
def checkDepthEmitApplyTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitApply.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthEmitApplyTermSurfaceScope, EmitApply-only, TERM-SURFACE. -/
def checkDepthEmitApplyTermSurfaceScope : String := "EmitApply-only"

/-- Dual-ok when EmitApply L2 E-good/E-bad rejects work (EmitApply pilot only).
    Greppable: hostModuleCheckEmitApplyTermSurfaceDualOk, TERM-SURFACE,
    EmitApply-only. -/
def hostModuleCheckEmitApplyTermSurfaceDualOk : Bool := true

/-! ### EmitApply dialect (reuse EmitPlan collapse / arm helpers) -/

/-- Apply.failClosed is zeroed tags/count with valid false.
    Greppable: emitApplyFailClosedBodyOk, TERM-SURFACE, EmitApply-only. -/
def emitApplyFailClosedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "Apply.failClosed" with
  | none => false
  | some body =>
    body == "{ tags := [] count := 0 valid := false }"

/-- applyCap body is 32 (APPLY_CAP / SLAKE_EMIT_APPLY_CAP honesty).
    Greppable: emitApplyCapBodyOk, TERM-SURFACE, EmitApply-only. -/
def emitApplyCapBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "applyCap" with
  | none => false
  | some body => body == "32"

/-- multCode arms: mult0=>0; mult1=>1; multOmega=>2 (length 3).
    Greppable: emitApplyMultCodeArmsOk, TERM-SURFACE, EmitApply-only. -/
def emitApplyMultCodeArmsOk (content : String) : Bool :=
  match findDefHeaderLine content "multCode" with
  | none => false
  | some _ =>
    let arms := emitPlanDefArmRhsList content "multCode"
    emitPlanArmListHas arms "0"
      && emitPlanArmListHas arms "1"
      && emitPlanArmListHas arms "2"
      && arms.length == 3

/-- applyFromCompose fail-closed + cap + packTag inventory body (collapsed).
    Greppable: emitApplyFromComposeBodyOk, TERM-SURFACE, EmitApply-only. -/
def emitApplyFromComposeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "applyFromCompose" with
  | none => false
  | some body =>
    body == "if !HostCompose.checkFailClosed hc then Apply.failClosed else let nodes := hc.graph.prog.nodes let n := nodes.length if n > applyCap then Apply.failClosed else let tags := nodes.map packTag { tags := tags, count := n, valid := true }"

/-- applyIsValid body is a.valid && decide (a.count <= applyCap) && decide (a.count == a.tags.length).
    Greppable: emitApplyIsValidBodyOk, TERM-SURFACE, EmitApply-only. -/
def emitApplyIsValidBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "applyIsValid" with
  | none => false
  | some body =>
    body == "a.valid && decide (a.count <= applyCap) && decide (a.count == a.tags.length)"

/-- applyOk body is applyIsValid (applyFromCompose hc).
    Greppable: emitApplyApplyOkBodyOk, TERM-SURFACE, EmitApply-only. -/
def emitApplyApplyOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "applyOk" with
  | none => false
  | some body => body == "applyIsValid (applyFromCompose hc)"

/-- EmitApply L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitApplyTermDialect, TERM-SURFACE,
    EmitApply term-surface pilot. -/
def checkEmitApplyTermDialect (content : String) : Option String :=
  if !emitApplyFailClosedBodyOk content then some reasonIllTypedTerm
  else if !emitApplyCapBodyOk content then some reasonIllTypedTerm
  else if !emitApplyMultCodeArmsOk content then some reasonIllTypedTerm
  else if !emitApplyFromComposeBodyOk content then some reasonIllTypedTerm
  else if !emitApplyIsValidBodyOk content then some reasonIllTypedTerm
  else if !emitApplyApplyOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitApply L2 after a structural EmitApply accept.
    Greppable: refineEmitApplyWithTermSurface, TERM-SURFACE, EmitApply-only. -/
def refineEmitApplyWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitApplyTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitApply L2 well-typed good fixture (E-good) -/

/-- Shared EmitApply skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckEmitApplyTermSkeletonPrefix, TERM-SURFACE,
    EmitApply-only. -/
def hostModuleCheckEmitApplyTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.Types\n" ++
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitApplyScaffold\n" ++
  "namespace SystemsLean.EmitApply\n" ++
  "structure Apply where\n" ++
  "  tags : List Nat\n" ++
  "  count : Nat\n" ++
  "  valid : Bool\n"

/-- Shared EmitApply skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckEmitApplyTermSkeletonSuffix, TERM-SURFACE,
    EmitApply-only. -/
def hostModuleCheckEmitApplyTermSkeletonSuffix : String :=
  "end SystemsLean.EmitApply\n"

/-- Shared good-path mid bodies for Apply failClosed/cap/mult/fromCompose/valid/ok.
    Greppable: hostModuleCheckEmitApplyTermGoodMid, TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckEmitApplyTermGoodMid : String :=
  "def Apply.failClosed : Apply := {\n" ++
  "  tags := []\n" ++
  "  count := 0\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def applyCap : Nat := 32\n" ++
  "def multCode (m : Mult) : Nat :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => 0\n" ++
  "  | Mult.mult1 => 1\n" ++
  "  | Mult.multOmega => 2\n" ++
  "def kindCode (k : NodeKind) : Nat :=\n" ++
  "  match k with\n" ++
  "  | NodeKind.value => 0\n" ++
  "  | NodeKind.linear => 1\n" ++
  "  | NodeKind.erased => 2\n" ++
  "def packTag (n : IrNode) : Nat :=\n" ++
  "  (multCode n.mult) * 16 + kindCode n.kind\n" ++
  "def tagMult (tag : Nat) : Nat := tag / 16\n" ++
  "def applyFromCompose (hc : Host) : Apply :=\n" ++
  "  if !HostCompose.checkFailClosed hc then\n" ++
  "    Apply.failClosed\n" ++
  "  else\n" ++
  "    let nodes := hc.graph.prog.nodes\n" ++
  "    let n := nodes.length\n" ++
  "    if n > applyCap then\n" ++
  "      Apply.failClosed\n" ++
  "    else\n" ++
  "      let tags := nodes.map packTag\n" ++
  "      { tags := tags, count := n, valid := true }\n" ++
  "def fromCompose (hc : Host) : Apply := applyFromCompose hc\n" ++
  "def applyIsValid (a : Apply) : Bool :=\n" ++
  "  a.valid\n" ++
  "    && decide (a.count <= applyCap)\n" ++
  "    && decide (a.count == a.tags.length)\n" ++
  "def applyOk (hc : Host) : Bool :=\n" ++
  "  applyIsValid (applyFromCompose hc)\n"

/-- Well-typed EmitApply L2 good text.
    Greppable: hostModuleCheckGoodEmitApplyTermText, TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckGoodEmitApplyTermText : String :=
  hostModuleCheckEmitApplyTermSkeletonPrefix
    ++ hostModuleCheckEmitApplyTermGoodMid
    ++ hostModuleCheckEmitApplyTermSkeletonSuffix

/-! ### Ill-typed EmitApply twins (L0 tokens present; L2 must reject). -/

/-- EA1: Apply.failClosed valid true (not fail-closed zeros).
    Greppable: hostModuleCheckBadEmitApplyFailClosedText, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyFailClosedText : String :=
  hostModuleCheckEmitApplyTermSkeletonPrefix ++
  "def Apply.failClosed : Apply := {\n" ++
  "  tags := []\n" ++
  "  count := 0\n" ++
  "  valid := true\n" ++
  "}\n" ++
  "def applyCap : Nat := 32\n" ++
  "def multCode (m : Mult) : Nat :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => 0\n" ++
  "  | Mult.mult1 => 1\n" ++
  "  | Mult.multOmega => 2\n" ++
  "def packTag (n : Nat) : Nat := n\n" ++
  "def tagMult (tag : Nat) : Nat := tag\n" ++
  "def applyFromCompose (hc : Host) : Apply :=\n" ++
  "  if !HostCompose.checkFailClosed hc then\n" ++
  "    Apply.failClosed\n" ++
  "  else\n" ++
  "    let nodes := hc.graph.prog.nodes\n" ++
  "    let n := nodes.length\n" ++
  "    if n > applyCap then\n" ++
  "      Apply.failClosed\n" ++
  "    else\n" ++
  "      let tags := nodes.map packTag\n" ++
  "      { tags := tags, count := n, valid := true }\n" ++
  "def fromCompose (hc : Host) : Apply := applyFromCompose hc\n" ++
  "def applyIsValid (a : Apply) : Bool :=\n" ++
  "  a.valid\n" ++
  "    && decide (a.count <= applyCap)\n" ++
  "    && decide (a.count == a.tags.length)\n" ++
  "def applyOk (hc : Host) : Bool :=\n" ++
  "  applyIsValid (applyFromCompose hc)\n" ++
  hostModuleCheckEmitApplyTermSkeletonSuffix

/-- EA2: applyCap 0 (not APPLY_CAP 32).
    Greppable: hostModuleCheckBadEmitApplyCapText, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyCapText : String :=
  hostModuleCheckEmitApplyTermSkeletonPrefix ++
  "def Apply.failClosed : Apply := {\n" ++
  "  tags := []\n" ++
  "  count := 0\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def applyCap : Nat := 0\n" ++
  "def multCode (m : Mult) : Nat :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => 0\n" ++
  "  | Mult.mult1 => 1\n" ++
  "  | Mult.multOmega => 2\n" ++
  "def packTag (n : Nat) : Nat := n\n" ++
  "def tagMult (tag : Nat) : Nat := tag\n" ++
  "def applyFromCompose (hc : Host) : Apply :=\n" ++
  "  if !HostCompose.checkFailClosed hc then\n" ++
  "    Apply.failClosed\n" ++
  "  else\n" ++
  "    let nodes := hc.graph.prog.nodes\n" ++
  "    let n := nodes.length\n" ++
  "    if n > applyCap then\n" ++
  "      Apply.failClosed\n" ++
  "    else\n" ++
  "      let tags := nodes.map packTag\n" ++
  "      { tags := tags, count := n, valid := true }\n" ++
  "def fromCompose (hc : Host) : Apply := applyFromCompose hc\n" ++
  "def applyIsValid (a : Apply) : Bool :=\n" ++
  "  a.valid\n" ++
  "    && decide (a.count <= applyCap)\n" ++
  "    && decide (a.count == a.tags.length)\n" ++
  "def applyOk (hc : Host) : Bool :=\n" ++
  "  applyIsValid (applyFromCompose hc)\n" ++
  hostModuleCheckEmitApplyTermSkeletonSuffix

/-- EA3: multCode always 0 (no mult nibble table).
    Greppable: hostModuleCheckBadEmitApplyMultCodeText, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyMultCodeText : String :=
  hostModuleCheckEmitApplyTermSkeletonPrefix ++
  "def Apply.failClosed : Apply := {\n" ++
  "  tags := []\n" ++
  "  count := 0\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def applyCap : Nat := 32\n" ++
  "def multCode (m : Mult) : Nat := 0\n" ++
  "def packTag (n : Nat) : Nat := n\n" ++
  "def tagMult (tag : Nat) : Nat := tag\n" ++
  "def applyFromCompose (hc : Host) : Apply :=\n" ++
  "  if !HostCompose.checkFailClosed hc then\n" ++
  "    Apply.failClosed\n" ++
  "  else\n" ++
  "    let nodes := hc.graph.prog.nodes\n" ++
  "    let n := nodes.length\n" ++
  "    if n > applyCap then\n" ++
  "      Apply.failClosed\n" ++
  "    else\n" ++
  "      let tags := nodes.map packTag\n" ++
  "      { tags := tags, count := n, valid := true }\n" ++
  "def fromCompose (hc : Host) : Apply := applyFromCompose hc\n" ++
  "def applyIsValid (a : Apply) : Bool :=\n" ++
  "  a.valid\n" ++
  "    && decide (a.count <= applyCap)\n" ++
  "    && decide (a.count == a.tags.length)\n" ++
  "def applyOk (hc : Host) : Bool :=\n" ++
  "  applyIsValid (applyFromCompose hc)\n" ++
  hostModuleCheckEmitApplyTermSkeletonSuffix

/-- EA4: applyFromCompose always Apply.failClosed (drops checkFailClosed path).
    Greppable: hostModuleCheckBadEmitApplyFromComposeText, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyFromComposeText : String :=
  hostModuleCheckEmitApplyTermSkeletonPrefix ++
  "def Apply.failClosed : Apply := {\n" ++
  "  tags := []\n" ++
  "  count := 0\n" ++
  "  valid := false\n" ++
  "}\n" ++
  "def applyCap : Nat := 32\n" ++
  "def multCode (m : Mult) : Nat :=\n" ++
  "  match m with\n" ++
  "  | Mult.mult0 => 0\n" ++
  "  | Mult.mult1 => 1\n" ++
  "  | Mult.multOmega => 2\n" ++
  "def packTag (n : Nat) : Nat := n\n" ++
  "def tagMult (tag : Nat) : Nat := tag\n" ++
  "def applyFromCompose (hc : Host) : Apply := Apply.failClosed\n" ++
  "def fromCompose (hc : Host) : Apply := applyFromCompose hc\n" ++
  "def applyIsValid (a : Apply) : Bool :=\n" ++
  "  a.valid\n" ++
  "    && decide (a.count <= applyCap)\n" ++
  "    && decide (a.count == a.tags.length)\n" ++
  "def applyOk (hc : Host) : Bool :=\n" ++
  "  applyIsValid (applyFromCompose hc)\n" ++
  hostModuleCheckEmitApplyTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitApply twin text for L0 dual-pin. -/
def emitApplyTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitApply"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept EA1 when tokens present.
    Greppable: hostModuleCheckBadEmitApplyFailClosedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyFailClosedL0Accept : Bool :=
  (checkNamedSurface (emitApplyTermSurfaceFrom
      hostModuleCheckBadEmitApplyFailClosedText)
    emitApplyExpectedNamespace emitApplyRequiredDecls
    (some "SystemsLean.EmitApplyScaffold")).isAccept

/-- L0/L1 still accept EA2 when tokens present.
    Greppable: hostModuleCheckBadEmitApplyCapL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyCapL0Accept : Bool :=
  (checkNamedSurface (emitApplyTermSurfaceFrom
      hostModuleCheckBadEmitApplyCapText)
    emitApplyExpectedNamespace emitApplyRequiredDecls
    (some "SystemsLean.EmitApplyScaffold")).isAccept

/-- L0/L1 still accept EA3 when tokens present.
    Greppable: hostModuleCheckBadEmitApplyMultCodeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyMultCodeL0Accept : Bool :=
  (checkNamedSurface (emitApplyTermSurfaceFrom
      hostModuleCheckBadEmitApplyMultCodeText)
    emitApplyExpectedNamespace emitApplyRequiredDecls
    (some "SystemsLean.EmitApplyScaffold")).isAccept

/-- L0/L1 still accept EA4 when tokens present.
    Greppable: hostModuleCheckBadEmitApplyFromComposeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyFromComposeL0Accept : Bool :=
  (checkNamedSurface (emitApplyTermSurfaceFrom
      hostModuleCheckBadEmitApplyFromComposeText)
    emitApplyExpectedNamespace emitApplyRequiredDecls
    (some "SystemsLean.EmitApplyScaffold")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckEmitApplyTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitApplyTermDialectOk : Bool :=
  (checkEmitApplyTermDialect hostModuleCheckGoodEmitApplyTermText).isNone

/-- Dialect rejects EA1.
    Greppable: hostModuleCheckBadEmitApplyFailClosedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyFailClosedDialectReject : Bool :=
  match checkEmitApplyTermDialect hostModuleCheckBadEmitApplyFailClosedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EA2.
    Greppable: hostModuleCheckBadEmitApplyCapDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyCapDialectReject : Bool :=
  match checkEmitApplyTermDialect hostModuleCheckBadEmitApplyCapText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EA3.
    Greppable: hostModuleCheckBadEmitApplyMultCodeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyMultCodeDialectReject : Bool :=
  match checkEmitApplyTermDialect hostModuleCheckBadEmitApplyMultCodeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EA4.
    Greppable: hostModuleCheckBadEmitApplyFromComposeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitApplyFromComposeDialectReject : Bool :=
  match checkEmitApplyTermDialect hostModuleCheckBadEmitApplyFromComposeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitApply L2 dual-pin (good + EA1..EA4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckEmitApplyTermSurfaceOk, TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckEmitApplyTermSurfaceOk : Bool :=
  hostModuleCheckEmitApplyTermSurfaceDualOk
    && (checkDepthEmitApplyTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitApplyTermSurfaceScope == "EmitApply-only")
    && hostModuleCheckEmitApplyTermDialectOk
    && hostModuleCheckBadEmitApplyFailClosedDialectReject
    && hostModuleCheckBadEmitApplyCapDialectReject
    && hostModuleCheckBadEmitApplyMultCodeDialectReject
    && hostModuleCheckBadEmitApplyFromComposeDialectReject
    && hostModuleCheckBadEmitApplyFailClosedL0Accept
    && hostModuleCheckBadEmitApplyCapL0Accept
    && hostModuleCheckBadEmitApplyMultCodeL0Accept
    && hostModuleCheckBadEmitApplyFromComposeL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitApplyTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitApplyTermSurfaceOk_true :
    hostModuleCheckEmitApplyTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_apply_term_surface_ids_eq :
    checkDepthEmitApplyTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitApplyTermSurfaceScope = "EmitApply-only"
      && hostModuleCheckEmitApplyTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
