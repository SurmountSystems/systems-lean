/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live KernelSelfApply.lean bytes.
  Module: SystemsLean.HostFrontLiveKernelSelfApplySource
  Greppable: SYSTEMS_LEAN_HOST, liveKernelSelfApplySource,
  PARSE-LIVE-KERNEL-SELF-APPLY.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69. Not a remill.
  Not Lake-gone. slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveKernelSelfApply

/-- Dual-pinned live KernelSelfApply.lean bytes.
    Greppable: liveKernelSelfApplySource. -/
def liveKernelSelfApplySource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding product kernel self-application (B2).
  SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0 -- named default B-bar kernel inputs home
  (HOST-EMIT Mult+Linear+Erasure+Types+Program cites). Side: classic Lean
  elaborator under src/systems/ (not freestanding C runtime).
  Honest scope: documents product kernel self-application inputs beyond host
  structural SelfApply alone. Distinct from B3 product Out kernel evidence and
  from freestanding product self-host complete.
  Living tip SelfApplyFs owns claim-bool SSoT (perform/ownership/complete) and
  the freestandingSelfApplyReady chain fold into this PartialReady. Dual-pin
  thin batch 1: this module owns historical stage/bar/module-cite string defs
  (tip no longer duplicates them). This land-time module does NOT define those
  claim bools true (emit-wire forbid). Does not import FreestandingEmit
  (path cite strings only). Name KernelSelfApply (not SelfApply) -- SelfApply.lean
  is host structural SH5. Not residual free. Not PROVABLY. Not freestanding
  emit residual free.
  Theorems (KERNEL-SELF-APPLY-THEOREM / HOST-KERNEL-SELF-APPLY-THEOREM +
  KERNEL-SELF-APPLY-SMOKE / HOST-KERNEL-SELF-APPLY-SMOKE):
  SystemsLean.KernelSelfApplyTheorems (same namespace; long-file split).
  theorem productKernelSelfApplyPartialReady_true.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0,
  HOST-SELF-HOST-KERNEL-SELF-APPLY, SELF-HOST-KERNEL-SELF-APPLY,
  product kernel self-application, productKernelSelfApplyPartialReady,
  productKernelBarSurfaceOk, productKernelSelfApplyModuleCite,
  productKernelBarMult, productKernelBarLinear, productKernelBarErasure,
  productKernelBarTypes, productKernelBarProgram, HOST-EMIT-MULT,
  HOST-EMIT-LINEAR, HOST-EMIT-ERASURE, HOST-EMIT-TYPES, HOST-EMIT-PROGRAM,
  theorem productKernelSelfApplyPartialReady_true,
  KERNEL-SELF-APPLY-THEOREM, HOST-KERNEL-SELF-APPLY-THEOREM,
  KERNEL-SELF-APPLY-SMOKE, HOST-KERNEL-SELF-APPLY-SMOKE,
  KernelSelfApplyTheorems, RUNTIME-FS, UNIT_SURFACE host surface,
  KernelSelfApply.
  Module: SystemsLean.KernelSelfApply
  Long-file split: KERNEL-SELF-APPLY-THEOREM + SMOKE in KernelSelfApplyTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.KernelSelfApply

/-- Greppable primary stage id (partial B2 product kernel self-application). -/
def stageId : String := "SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SELF-HOST-KERNEL-SELF-APPLY"

/-- Greppable short map id. -/
def selfHostId : String := "SELF-HOST-KERNEL-SELF-APPLY"

/-- Module cite. Greppable: KernelSelfApply. -/
def productKernelSelfApplyModuleCite : String := "KernelSelfApply"

/-- Default B-bar kernel ownership cites (Mult+Linear+Erasure+Types+IR program).
    Acceptance SSoT: self-host.md product kernel self-application section.
    Greppable: productKernelBarMult, HOST-EMIT-MULT, product kernel self-application. -/
def productKernelBarMult : String := "HOST-EMIT-MULT"
def productKernelBarLinear : String := "HOST-EMIT-LINEAR"
def productKernelBarErasure : String := "HOST-EMIT-ERASURE"
def productKernelBarTypes : String := "HOST-EMIT-TYPES"
def productKernelBarProgram : String := "HOST-EMIT-PROGRAM"

/-- Acceptance path cite. Greppable: acceptancePath. -/
def acceptancePath : String := "src/systems/self-host.md"

/-- productKernelBarSurfaceOk -- named default B-bar kernel inputs + stage cites.
    Land-time surface only (no living-tip perform/ownership/complete claim bools
    on this module -- emit-wire forbids those true defs here).
    Greppable: productKernelBarSurfaceOk, SELF-HOST-KERNEL-SELF-APPLY. -/
def productKernelBarSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0")
    && (hostId == "HOST-SELF-HOST-KERNEL-SELF-APPLY")
    && (selfHostId == "SELF-HOST-KERNEL-SELF-APPLY")
    && (productKernelSelfApplyModuleCite == "KernelSelfApply")
    && (productKernelBarMult == "HOST-EMIT-MULT")
    && (productKernelBarLinear == "HOST-EMIT-LINEAR")
    && (productKernelBarErasure == "HOST-EMIT-ERASURE")
    && (productKernelBarTypes == "HOST-EMIT-TYPES")
    && (productKernelBarProgram == "HOST-EMIT-PROGRAM")
    && (acceptancePath == "src/systems/self-host.md")

/-- KERNEL-SELF-APPLY PartialReady fold (closed B2 substrate: B-bar surface).
    Historical readiness bulk for product kernel self-application. SelfApplyFs
    living tip re-exports a chain fold that includes freestandingSelfApplyReady
    plus this def for greppable dual-pin. Land-time module pins: surface Ok only
    (living tip allows ownership / perform / stepContractFull / complete true
    after later cliffs). Does not flip residual free / llvm / PROVABLY.
    Greppable: productKernelSelfApplyPartialReady, SELF-HOST-KERNEL-SELF-APPLY,
    product kernel self-application. -/
def productKernelSelfApplyPartialReady : Bool :=
  productKernelBarSurfaceOk

/- Theorems + smoke live in SystemsLean.KernelSelfApplyTheorems
   (same namespace SystemsLean.KernelSelfApply; long-file split).
   Parent stays import-light for SelfApplyFs chain fold. Do not import
   KernelSelfApplyTheorems here (import cycle).
   Greppable: KERNEL-SELF-APPLY-THEOREM, KERNEL-SELF-APPLY-SMOKE,
   KernelSelfApplyTheorems. -/

end SystemsLean.KernelSelfApply

-- Theorems + smoke: SystemsLean.KernelSelfApplyTheorems (same namespace).
-- No Lake exe for B2 (kernel self-apply B-bar input cites only; live product
-- wire remains FreestandingEmit + just build). No top-level main so
-- SelfApplyFs may import Ok / PartialReady bulk without main clash.
"#

end SystemsLean.HostFrontLiveKernelSelfApply
