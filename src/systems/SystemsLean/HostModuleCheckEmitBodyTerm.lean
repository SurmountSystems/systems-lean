/-
  SYSTEMS_LEAN_HOST partial -- EmitBody L2 term-surface pilot (after EmitApply).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitBody dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitBody L2 dialect subset (documented; not full Lean 4 elaborator):
  - Body.failClosed multi-line zeros with valid false and markers false.
  - bodyCap body exact 256 (BODY_CAP / SLAKE_EMIT_BODY_CAP honesty).
  - bodyFromCompose fail-closed on !plan ready, !apply valid, cap overflow,
    else inventory + markers from buf.
  - bodyIsValid body valid && len < bodyCap && buf markers.
  - bodyOk body bodyIsValid (bodyFromCompose hc).
  - buildFragment / fromCompose / hasSubstr stay L0 token this pilot.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitBodyTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitBodyTermSurfaceOk (E-good dialect +
    EB1..EB4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitBody pilot only -- not package elaborate, not EmitBody theorems L3,
    not FullHostElaborateRemains re-true.
  - Mult..Extract + EmitPlan + EmitApply TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitBody is EmitBody-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckEmitBodyTerm,
  TERM-SURFACE, EmitBody-only, ILL-TYPED-TERM, checkEmitBodyTermDialect,
  hostModuleCheckBadEmitBodyFailClosedText,
  hostModuleCheckBadEmitBodyCapText,
  hostModuleCheckBadEmitBodyFromComposeText,
  hostModuleCheckBadEmitBodyIsValidText,
  hostModuleCheckEmitBodyTermDialectOk, EmitBody term-surface pilot,
  hostModuleCheckEmitBodyTermSurfaceDualOk,
  hostModuleCheckEmitBodyTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitBodyTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitBodyTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitBody L2 term-surface dual-ok pins (EmitBody-only) -/

/-- Named term-surface depth bar reused for EmitBody L2 pilot honesty.
    Greppable: checkDepthEmitBodyTermSurfaceBar, TERM-SURFACE, EmitBody-only. -/
def checkDepthEmitBodyTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitBody.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthEmitBodyTermSurfaceScope, EmitBody-only, TERM-SURFACE. -/
def checkDepthEmitBodyTermSurfaceScope : String := "EmitBody-only"

/-- Dual-ok when EmitBody L2 E-good/E-bad rejects work (EmitBody pilot only).
    Greppable: hostModuleCheckEmitBodyTermSurfaceDualOk, TERM-SURFACE,
    EmitBody-only. -/
def hostModuleCheckEmitBodyTermSurfaceDualOk : Bool := true

/-! ### EmitBody dialect (reuse EmitPlan collapse helpers) -/

/-- Body.failClosed is zeroed inventory with valid/markers false.
    Product EmitBody follows failClosed with `private def` helpers; collapse
    may append those until the next bare `def`. Accept exact body or exact
    structure prefix (private tail allowed; wrong valid/fields still reject).
    Greppable: emitBodyFailClosedBodyOk, TERM-SURFACE, EmitBody-only. -/
def emitBodyFailClosedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "Body.failClosed" with
  | none => false
  | some body =>
    let want :=
      "{ buf := \"\" len := 0 valid := false runtimeNodes := 0 erasedNodes := 0 tagCount := 0 hasEmitBodyMarker := false hasRuntimeFsMarker := false }"
    body == want || body.startsWith want

/-- bodyCap body is 256 (BODY_CAP / SLAKE_EMIT_BODY_CAP honesty).
    Greppable: emitBodyCapBodyOk, TERM-SURFACE, EmitBody-only. -/
def emitBodyCapBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "bodyCap" with
  | none => false
  | some body => body == "256"

/-- bodyFromCompose fail-closed + plan/apply inventory body (collapsed).
    Greppable: emitBodyFromComposeBodyOk, TERM-SURFACE, EmitBody-only. -/
def emitBodyFromComposeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "bodyFromCompose" with
  | none => false
  | some body =>
    body == "let plan := EmitPlan.planFromCompose hc if !EmitPlan.isReady plan then Body.failClosed else let apply := EmitApply.applyFromCompose hc if !EmitApply.applyIsValid apply then Body.failClosed else let buf := buildFragment plan apply let len := buf.length if len >= bodyCap then Body.failClosed else { buf := buf len := len valid := true runtimeNodes := plan.runtimeNodes erasedNodes := plan.erasedNodes tagCount := apply.count hasEmitBodyMarker := bufHasEmitBodyMarker buf hasRuntimeFsMarker := bufHasRuntimeFsMarker buf }"

/-- bodyIsValid body is valid && len < bodyCap && buf markers.
    Greppable: emitBodyIsValidBodyOk, TERM-SURFACE, EmitBody-only. -/
def emitBodyIsValidBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "bodyIsValid" with
  | none => false
  | some body =>
    body == "b.valid && decide (b.len < bodyCap) && bufHasEmitBodyMarker b.buf && bufHasRuntimeFsMarker b.buf"

/-- bodyOk body is bodyIsValid (bodyFromCompose hc).
    Greppable: emitBodyBodyOkBodyOk, TERM-SURFACE, EmitBody-only. -/
def emitBodyBodyOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "bodyOk" with
  | none => false
  | some body => body == "bodyIsValid (bodyFromCompose hc)"

/-- EmitBody L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitBodyTermDialect, TERM-SURFACE,
    EmitBody term-surface pilot. -/
def checkEmitBodyTermDialect (content : String) : Option String :=
  if !emitBodyFailClosedBodyOk content then some reasonIllTypedTerm
  else if !emitBodyCapBodyOk content then some reasonIllTypedTerm
  else if !emitBodyFromComposeBodyOk content then some reasonIllTypedTerm
  else if !emitBodyIsValidBodyOk content then some reasonIllTypedTerm
  else if !emitBodyBodyOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitBody L2 after a structural EmitBody accept.
    Greppable: refineEmitBodyWithTermSurface, TERM-SURFACE, EmitBody-only. -/
def refineEmitBodyWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitBodyTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitBody L2 well-typed good fixture (E-good) -/

/-- Shared EmitBody skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckEmitBodyTermSkeletonPrefix, TERM-SURFACE,
    EmitBody-only. -/
def hostModuleCheckEmitBodyTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.Types\n" ++
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitPlan\n" ++
  "import SystemsLean.EmitApply\n" ++
  "import SystemsLean.EmitBodyScaffold\n" ++
  "namespace SystemsLean.EmitBody\n" ++
  "structure Body where\n" ++
  "  buf : String\n" ++
  "  len : Nat\n" ++
  "  valid : Bool\n" ++
  "  runtimeNodes : Nat\n" ++
  "  erasedNodes : Nat\n" ++
  "  tagCount : Nat\n" ++
  "  hasEmitBodyMarker : Bool\n" ++
  "  hasRuntimeFsMarker : Bool\n"

/-- Shared EmitBody skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckEmitBodyTermSkeletonSuffix, TERM-SURFACE,
    EmitBody-only. -/
def hostModuleCheckEmitBodyTermSkeletonSuffix : String :=
  "end SystemsLean.EmitBody\n"

/-- Shared good-path mid bodies for Body failClosed/cap/fromCompose/valid/ok.
    Greppable: hostModuleCheckEmitBodyTermGoodMid, TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckEmitBodyTermGoodMid : String :=
  "def Body.failClosed : Body := {\n" ++
  "  buf := \"\"\n" ++
  "  len := 0\n" ++
  "  valid := false\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  tagCount := 0\n" ++
  "  hasEmitBodyMarker := false\n" ++
  "  hasRuntimeFsMarker := false\n" ++
  "}\n" ++
  "def bodyCap : Nat := 256\n" ++
  "def buildFragment (plan : Nat) (apply : Nat) : String := \"\"\n" ++
  "def bufHasEmitBodyMarker (buf : String) : Bool := true\n" ++
  "def bufHasRuntimeFsMarker (buf : String) : Bool := true\n" ++
  "def bodyFromCompose (hc : Host) : Body :=\n" ++
  "  let plan := EmitPlan.planFromCompose hc\n" ++
  "  if !EmitPlan.isReady plan then\n" ++
  "    Body.failClosed\n" ++
  "  else\n" ++
  "    let apply := EmitApply.applyFromCompose hc\n" ++
  "    if !EmitApply.applyIsValid apply then\n" ++
  "      Body.failClosed\n" ++
  "    else\n" ++
  "      let buf := buildFragment plan apply\n" ++
  "      let len := buf.length\n" ++
  "      if len >= bodyCap then\n" ++
  "        Body.failClosed\n" ++
  "      else\n" ++
  "        {\n" ++
  "          buf := buf\n" ++
  "          len := len\n" ++
  "          valid := true\n" ++
  "          runtimeNodes := plan.runtimeNodes\n" ++
  "          erasedNodes := plan.erasedNodes\n" ++
  "          tagCount := apply.count\n" ++
  "          hasEmitBodyMarker := bufHasEmitBodyMarker buf\n" ++
  "          hasRuntimeFsMarker := bufHasRuntimeFsMarker buf\n" ++
  "        }\n" ++
  "def fromCompose (hc : Host) : Body := bodyFromCompose hc\n" ++
  "def bodyIsValid (b : Body) : Bool :=\n" ++
  "  b.valid\n" ++
  "    && decide (b.len < bodyCap)\n" ++
  "    && bufHasEmitBodyMarker b.buf\n" ++
  "    && bufHasRuntimeFsMarker b.buf\n" ++
  "def bodyOk (hc : Host) : Bool :=\n" ++
  "  bodyIsValid (bodyFromCompose hc)\n"

/-- Well-typed EmitBody L2 good text.
    Greppable: hostModuleCheckGoodEmitBodyTermText, TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckGoodEmitBodyTermText : String :=
  hostModuleCheckEmitBodyTermSkeletonPrefix
    ++ hostModuleCheckEmitBodyTermGoodMid
    ++ hostModuleCheckEmitBodyTermSkeletonSuffix

/-! ### Ill-typed EmitBody twins (L0 tokens present; L2 must reject). -/

/-- EB1: Body.failClosed valid true (not fail-closed zeros).
    Greppable: hostModuleCheckBadEmitBodyFailClosedText, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyFailClosedText : String :=
  hostModuleCheckEmitBodyTermSkeletonPrefix ++
  "def Body.failClosed : Body := {\n" ++
  "  buf := \"\"\n" ++
  "  len := 0\n" ++
  "  valid := true\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  tagCount := 0\n" ++
  "  hasEmitBodyMarker := false\n" ++
  "  hasRuntimeFsMarker := false\n" ++
  "}\n" ++
  "def bodyCap : Nat := 256\n" ++
  "def buildFragment (plan : Nat) (apply : Nat) : String := \"\"\n" ++
  "def bodyFromCompose (hc : Host) : Body :=\n" ++
  "  let plan := EmitPlan.planFromCompose hc\n" ++
  "  if !EmitPlan.isReady plan then\n" ++
  "    Body.failClosed\n" ++
  "  else\n" ++
  "    let apply := EmitApply.applyFromCompose hc\n" ++
  "    if !EmitApply.applyIsValid apply then\n" ++
  "      Body.failClosed\n" ++
  "    else\n" ++
  "      let buf := buildFragment plan apply\n" ++
  "      let len := buf.length\n" ++
  "      if len >= bodyCap then\n" ++
  "        Body.failClosed\n" ++
  "      else\n" ++
  "        {\n" ++
  "          buf := buf\n" ++
  "          len := len\n" ++
  "          valid := true\n" ++
  "          runtimeNodes := plan.runtimeNodes\n" ++
  "          erasedNodes := plan.erasedNodes\n" ++
  "          tagCount := apply.count\n" ++
  "          hasEmitBodyMarker := true\n" ++
  "          hasRuntimeFsMarker := true\n" ++
  "        }\n" ++
  "def fromCompose (hc : Host) : Body := bodyFromCompose hc\n" ++
  "def bodyIsValid (b : Body) : Bool :=\n" ++
  "  b.valid\n" ++
  "    && decide (b.len < bodyCap)\n" ++
  "    && true\n" ++
  "    && true\n" ++
  "def bodyOk (hc : Host) : Bool :=\n" ++
  "  bodyIsValid (bodyFromCompose hc)\n" ++
  hostModuleCheckEmitBodyTermSkeletonSuffix

/-- EB2: bodyCap 0 (not BODY_CAP 256).
    Greppable: hostModuleCheckBadEmitBodyCapText, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyCapText : String :=
  hostModuleCheckEmitBodyTermSkeletonPrefix ++
  "def Body.failClosed : Body := {\n" ++
  "  buf := \"\"\n" ++
  "  len := 0\n" ++
  "  valid := false\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  tagCount := 0\n" ++
  "  hasEmitBodyMarker := false\n" ++
  "  hasRuntimeFsMarker := false\n" ++
  "}\n" ++
  "def bodyCap : Nat := 0\n" ++
  "def buildFragment (plan : Nat) (apply : Nat) : String := \"\"\n" ++
  "def bodyFromCompose (hc : Host) : Body :=\n" ++
  "  let plan := EmitPlan.planFromCompose hc\n" ++
  "  if !EmitPlan.isReady plan then\n" ++
  "    Body.failClosed\n" ++
  "  else\n" ++
  "    let apply := EmitApply.applyFromCompose hc\n" ++
  "    if !EmitApply.applyIsValid apply then\n" ++
  "      Body.failClosed\n" ++
  "    else\n" ++
  "      let buf := buildFragment plan apply\n" ++
  "      let len := buf.length\n" ++
  "      if len >= bodyCap then\n" ++
  "        Body.failClosed\n" ++
  "      else\n" ++
  "        {\n" ++
  "          buf := buf\n" ++
  "          len := len\n" ++
  "          valid := true\n" ++
  "          runtimeNodes := plan.runtimeNodes\n" ++
  "          erasedNodes := plan.erasedNodes\n" ++
  "          tagCount := apply.count\n" ++
  "          hasEmitBodyMarker := true\n" ++
  "          hasRuntimeFsMarker := true\n" ++
  "        }\n" ++
  "def fromCompose (hc : Host) : Body := bodyFromCompose hc\n" ++
  "def bodyIsValid (b : Body) : Bool :=\n" ++
  "  b.valid\n" ++
  "    && decide (b.len < bodyCap)\n" ++
  "    && true\n" ++
  "    && true\n" ++
  "def bodyOk (hc : Host) : Bool :=\n" ++
  "  bodyIsValid (bodyFromCompose hc)\n" ++
  hostModuleCheckEmitBodyTermSkeletonSuffix

/-- EB3: bodyFromCompose always Body.failClosed (drops plan/apply path).
    Greppable: hostModuleCheckBadEmitBodyFromComposeText, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyFromComposeText : String :=
  hostModuleCheckEmitBodyTermSkeletonPrefix ++
  "def Body.failClosed : Body := {\n" ++
  "  buf := \"\"\n" ++
  "  len := 0\n" ++
  "  valid := false\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  tagCount := 0\n" ++
  "  hasEmitBodyMarker := false\n" ++
  "  hasRuntimeFsMarker := false\n" ++
  "}\n" ++
  "def bodyCap : Nat := 256\n" ++
  "def buildFragment (plan : Nat) (apply : Nat) : String := \"\"\n" ++
  "def bodyFromCompose (hc : Host) : Body := Body.failClosed\n" ++
  "def fromCompose (hc : Host) : Body := bodyFromCompose hc\n" ++
  "def bodyIsValid (b : Body) : Bool :=\n" ++
  "  b.valid\n" ++
  "    && decide (b.len < bodyCap)\n" ++
  "    && true\n" ++
  "    && true\n" ++
  "def bodyOk (hc : Host) : Bool :=\n" ++
  "  bodyIsValid (bodyFromCompose hc)\n" ++
  hostModuleCheckEmitBodyTermSkeletonSuffix

/-- EB4: bodyIsValid always true (drops marker + cap honesty).
    Greppable: hostModuleCheckBadEmitBodyIsValidText, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyIsValidText : String :=
  hostModuleCheckEmitBodyTermSkeletonPrefix ++
  "def Body.failClosed : Body := {\n" ++
  "  buf := \"\"\n" ++
  "  len := 0\n" ++
  "  valid := false\n" ++
  "  runtimeNodes := 0\n" ++
  "  erasedNodes := 0\n" ++
  "  tagCount := 0\n" ++
  "  hasEmitBodyMarker := false\n" ++
  "  hasRuntimeFsMarker := false\n" ++
  "}\n" ++
  "def bodyCap : Nat := 256\n" ++
  "def buildFragment (plan : Nat) (apply : Nat) : String := \"\"\n" ++
  "def bodyFromCompose (hc : Host) : Body :=\n" ++
  "  let plan := EmitPlan.planFromCompose hc\n" ++
  "  if !EmitPlan.isReady plan then\n" ++
  "    Body.failClosed\n" ++
  "  else\n" ++
  "    let apply := EmitApply.applyFromCompose hc\n" ++
  "    if !EmitApply.applyIsValid apply then\n" ++
  "      Body.failClosed\n" ++
  "    else\n" ++
  "      let buf := buildFragment plan apply\n" ++
  "      let len := buf.length\n" ++
  "      if len >= bodyCap then\n" ++
  "        Body.failClosed\n" ++
  "      else\n" ++
  "        {\n" ++
  "          buf := buf\n" ++
  "          len := len\n" ++
  "          valid := true\n" ++
  "          runtimeNodes := plan.runtimeNodes\n" ++
  "          erasedNodes := plan.erasedNodes\n" ++
  "          tagCount := apply.count\n" ++
  "          hasEmitBodyMarker := true\n" ++
  "          hasRuntimeFsMarker := true\n" ++
  "        }\n" ++
  "def fromCompose (hc : Host) : Body := bodyFromCompose hc\n" ++
  "def bodyIsValid (b : Body) : Bool := true\n" ++
  "def bodyOk (hc : Host) : Bool :=\n" ++
  "  bodyIsValid (bodyFromCompose hc)\n" ++
  hostModuleCheckEmitBodyTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitBody twin text for L0 dual-pin. -/
def emitBodyTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitBody"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept EB1 when tokens present.
    Greppable: hostModuleCheckBadEmitBodyFailClosedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyFailClosedL0Accept : Bool :=
  (checkNamedSurface (emitBodyTermSurfaceFrom
      hostModuleCheckBadEmitBodyFailClosedText)
    emitBodyExpectedNamespace emitBodyRequiredDecls
    (some "SystemsLean.EmitPlan")).isAccept

/-- L0/L1 still accept EB2 when tokens present.
    Greppable: hostModuleCheckBadEmitBodyCapL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyCapL0Accept : Bool :=
  (checkNamedSurface (emitBodyTermSurfaceFrom
      hostModuleCheckBadEmitBodyCapText)
    emitBodyExpectedNamespace emitBodyRequiredDecls
    (some "SystemsLean.EmitPlan")).isAccept

/-- L0/L1 still accept EB3 when tokens present.
    Greppable: hostModuleCheckBadEmitBodyFromComposeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyFromComposeL0Accept : Bool :=
  (checkNamedSurface (emitBodyTermSurfaceFrom
      hostModuleCheckBadEmitBodyFromComposeText)
    emitBodyExpectedNamespace emitBodyRequiredDecls
    (some "SystemsLean.EmitPlan")).isAccept

/-- L0/L1 still accept EB4 when tokens present.
    Greppable: hostModuleCheckBadEmitBodyIsValidL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyIsValidL0Accept : Bool :=
  (checkNamedSurface (emitBodyTermSurfaceFrom
      hostModuleCheckBadEmitBodyIsValidText)
    emitBodyExpectedNamespace emitBodyRequiredDecls
    (some "SystemsLean.EmitPlan")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckEmitBodyTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitBodyTermDialectOk : Bool :=
  (checkEmitBodyTermDialect hostModuleCheckGoodEmitBodyTermText).isNone

/-- Dialect rejects EB1.
    Greppable: hostModuleCheckBadEmitBodyFailClosedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyFailClosedDialectReject : Bool :=
  match checkEmitBodyTermDialect hostModuleCheckBadEmitBodyFailClosedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EB2.
    Greppable: hostModuleCheckBadEmitBodyCapDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyCapDialectReject : Bool :=
  match checkEmitBodyTermDialect hostModuleCheckBadEmitBodyCapText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EB3.
    Greppable: hostModuleCheckBadEmitBodyFromComposeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyFromComposeDialectReject : Bool :=
  match checkEmitBodyTermDialect hostModuleCheckBadEmitBodyFromComposeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EB4.
    Greppable: hostModuleCheckBadEmitBodyIsValidDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadEmitBodyIsValidDialectReject : Bool :=
  match checkEmitBodyTermDialect hostModuleCheckBadEmitBodyIsValidText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitBody L2 dual-pin (good + EB1..EB4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckEmitBodyTermSurfaceOk, TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckEmitBodyTermSurfaceOk : Bool :=
  hostModuleCheckEmitBodyTermSurfaceDualOk
    && (checkDepthEmitBodyTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitBodyTermSurfaceScope == "EmitBody-only")
    && hostModuleCheckEmitBodyTermDialectOk
    && hostModuleCheckBadEmitBodyFailClosedDialectReject
    && hostModuleCheckBadEmitBodyCapDialectReject
    && hostModuleCheckBadEmitBodyFromComposeDialectReject
    && hostModuleCheckBadEmitBodyIsValidDialectReject
    && hostModuleCheckBadEmitBodyFailClosedL0Accept
    && hostModuleCheckBadEmitBodyCapL0Accept
    && hostModuleCheckBadEmitBodyFromComposeL0Accept
    && hostModuleCheckBadEmitBodyIsValidL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitBodyTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitBodyTermSurfaceOk_true :
    hostModuleCheckEmitBodyTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_body_term_surface_ids_eq :
    checkDepthEmitBodyTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitBodyTermSurfaceScope = "EmitBody-only"
      && hostModuleCheckEmitBodyTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
