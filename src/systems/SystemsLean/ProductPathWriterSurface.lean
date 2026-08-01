/-
  SYSTEMS_LEAN_HOST partial -- freestanding product writer surface (B5).
  SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0 -- product Out writer-side
  plan/apply/body API + ownership substrate (not freestanding product path
  complete). Side: classic Lean elaborator under src/systems/ (not freestanding
  C runtime).
  Honest scope: documents plan/apply/body writer contracts and B-bar kernel
  APIs on product Out as substrate toward a freestanding writer path. Host Lake
  FreestandingEmit still performs full product text regeneration (B4 remains on
  living tip). This is **surface substrate + non-claim bar**, NOT freestanding
  product path complete / free / ownership claimed. Distinct from B6 ordered
  plan step ids and from B7 host execution cites.
  Living tip SelfApplyFs owns claim-bool SSoT (perform/ownership/complete) and
  the B4 chain fold into this PartialReady. Dual-pin thin batch 4: this module
  owns historical stage/API/ownership/module-cite string defs (tip no longer
  duplicates them; tip keeps chain fold only).
  This land-time module does NOT define those claim bools true (emit-wire forbid).
  Not residual free. Not PROVABLY. Not freestanding emit residual free.
  Theorems (WRITER-SURFACE-THEOREM / HOST-WRITER-SURFACE-THEOREM +
  WRITER-SURFACE-SMOKE / HOST-WRITER-SURFACE-SMOKE):
  SystemsLean.ProductPathWriterSurfaceTheorems (same namespace; long-file split).
  theorem productWriterSurfacePartialReady_true /
  productWriterSurfaceOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0,
  HOST-SELF-HOST-PRODUCT-WRITER-SURFACE, SELF-HOST-PRODUCT-WRITER-SURFACE,
  product writer surface, productWriterSurfaceOk,
  productWriterSurfacePartialReady, productWriterApiPlan,
  productWriterApiApply, productWriterApiBody, productWriterOwnPlan,
  productWriterOwnApply, productWriterOwnBody, HOST-EMIT-PLAN,
  HOST-EMIT-APPLY, HOST-EMIT-BODY, slake_emit_plan_from_compose,
  slake_emit_apply_from_compose, slake_emit_body_from_compose,
  slake_mult_is_valid, slake_linear_consume, slake_erasure_is_runtime_absent,
  slake_type_tag, slake_ir_program, theorem productWriterSurfacePartialReady_true,
  WRITER-SURFACE-THEOREM, HOST-WRITER-SURFACE-THEOREM,
  WRITER-SURFACE-SMOKE, HOST-WRITER-SURFACE-SMOKE,
  ProductPathWriterSurfaceTheorems,
  RUNTIME-FS, UNIT_SURFACE host surface, ProductPathWriterSurface.
  Module: SystemsLean.ProductPathWriterSurface
  Long-file split: WRITER-SURFACE-THEOREM + SMOKE in ProductPathWriterSurfaceTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.ProductPathWriterSurface

/-- Greppable primary stage id (partial B5 writer surface substrate). -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SELF-HOST-PRODUCT-WRITER-SURFACE"

/-- Greppable short map id. -/
def selfHostId : String := "SELF-HOST-PRODUCT-WRITER-SURFACE"

/-- Module cite. Greppable: ProductPathWriterSurface. -/
def writerSurfaceModuleCite : String := "ProductPathWriterSurface"

/-- Product Out path cite. Greppable: productOutPath, out/freestanding-c/. -/
def productOutPath : String := "out/freestanding-c/"

/-- Product Out writer-side API cites (plan / apply / body regenerate contracts).
    Greppable: productWriterApiPlan, productWriterApiApply, productWriterApiBody. -/
def productWriterApiPlan : String := "slake_emit_plan_from_compose"
def productWriterApiApply : String := "slake_emit_apply_from_compose"
def productWriterApiBody : String := "slake_emit_body_from_compose"

/-- Product Out writer ownership cites (HOST-EMIT-PLAN / APPLY / BODY).
    Greppable: productWriterOwnPlan, productWriterOwnApply, productWriterOwnBody. -/
def productWriterOwnPlan : String := "HOST-EMIT-PLAN"
def productWriterOwnApply : String := "HOST-EMIT-APPLY"
def productWriterOwnBody : String := "HOST-EMIT-BODY"

/-- Default B-bar product Out API cites (Mult+Linear+Erasure+Types+IR program).
    Greppable evidence tokens on product Out (not Lake-only substitutes). -/
def productOutApiMult : String := "slake_mult_is_valid"
def productOutApiLinear : String := "slake_linear_consume"
def productOutApiErasure : String := "slake_erasure_is_runtime_absent"
def productOutApiTypes : String := "slake_type_tag"
def productOutApiProgram : String := "slake_ir_program"

/-- Acceptance path cite. Greppable: acceptancePath. -/
def acceptancePath : String := "src/systems/self-host.md"

/-- productWriterSurfaceOk -- B5 stage ids + plan/apply/body writer APIs +
    ownership + Out path + B-bar kernel API cites (substrate toward freestanding
    writer). Land-time surface only (no living-tip perform/ownership/complete
    claim bools on this module -- emit-wire forbids those true defs here).
    Greppable: productWriterSurfaceOk, SELF-HOST-PRODUCT-WRITER-SURFACE,
    product writer surface. -/
def productWriterSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-WRITER-SURFACE")
    && (selfHostId == "SELF-HOST-PRODUCT-WRITER-SURFACE")
    && (writerSurfaceModuleCite == "ProductPathWriterSurface")
    && (productOutPath == "out/freestanding-c/")
    && (productWriterApiPlan == "slake_emit_plan_from_compose")
    && (productWriterApiApply == "slake_emit_apply_from_compose")
    && (productWriterApiBody == "slake_emit_body_from_compose")
    && (productWriterOwnPlan == "HOST-EMIT-PLAN")
    && (productWriterOwnApply == "HOST-EMIT-APPLY")
    && (productWriterOwnBody == "HOST-EMIT-BODY")
    && (productOutApiMult == "slake_mult_is_valid")
    && (productOutApiLinear == "slake_linear_consume")
    && (productOutApiErasure == "slake_erasure_is_runtime_absent")
    && (productOutApiTypes == "slake_type_tag")
    && (productOutApiProgram == "slake_ir_program")
    && (acceptancePath == "src/systems/self-host.md")

/-- WRITER-SURFACE PartialReady fold (closed B5 substrate: Ok surface cites).
    Historical readiness bulk for writer surface. SelfApplyFs living tip
    re-exports a chain fold that includes this def for greppable dual-pin +
    B4 bootstrap PartialReady chain. Land-time module pins: Ok surface only
    (living tip allows ownership / perform / stepContractFull / complete true
    after later cliffs). Does not flip residual free / llvm / PROVABLY.
    Greppable: productWriterSurfacePartialReady,
    SELF-HOST-PRODUCT-WRITER-SURFACE, product writer surface. -/
def productWriterSurfacePartialReady : Bool :=
  productWriterSurfaceOk

/- Theorems + smoke live in SystemsLean.ProductPathWriterSurfaceTheorems
   (same namespace SystemsLean.ProductPathWriterSurface; long-file split).
   Parent keeps stage / cites / Ok / PartialReady only -- do not import
   ProductPathWriterSurfaceTheorems here (import cycle).
   Greppable: theorem productWriterSurfacePartialReady_true,
   WRITER-SURFACE-THEOREM, ProductPathWriterSurfaceTheorems. -/

end SystemsLean.ProductPathWriterSurface

-- Theorems + smoke: SystemsLean.ProductPathWriterSurfaceTheorems (same namespace).
-- No Lake exe for B5 (surface API + ownership cites + honesty pins only; host
-- Lake FreestandingEmit + just build remain the live performers).
-- No top-level main so SelfApplyFs may import Ok / PartialReady bulk without
-- main clash.
