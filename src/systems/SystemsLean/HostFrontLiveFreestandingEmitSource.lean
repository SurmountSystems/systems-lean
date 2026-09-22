/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live FreestandingEmit.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFreestandingEmitSource. Not occupancy name 50. Not mill 70.
  This wrap is FreestandingEmit.lean. It is not FreestandingEmitLoad.lean.
  It is not FreestandingEmitLoadScaffold.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveFreestandingEmitSource,
  HOST-EMIT-SSOT, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveFreestandingEmitSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveFreestandingEmit

/-- Dual-pinned live FreestandingEmit.lean bytes (must match on-disk file).
    Greppable: liveFreestandingEmitSource, HOST-EMIT-SSOT. -/
def liveFreestandingEmitSource : String := r#"/-
  SLAKE_EMIT_FREESTANDING_C_V0 -- Lean-owned freestanding product C emit writer.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Writes src/systems/emit/slake_freestanding.{h,c} from frozen templates and
  host_emit_*.ssot.txt (Body + Banner + Mult..Apply). Never writes
  out/freestanding-c/ (release copy is just build).

  SSOT load helpers + Dual SSOT require helpers live in
  SystemsLean.FreestandingEmitLoad (same namespace). Mult..Apply unit SSOT
  loaders live in SystemsLean.FreestandingEmitLoadScaffold (same namespace).
  This module owns renderHeader / renderSource / validateProduct / emitAtRoot / main.

  Spec (readable):
  - DUAL-SSOT-EQUALITY: after load, each SSOT HEADER/BODY block must equal the
    matching Lean *HeaderFragment / *BodyFragment (Banner + Mult..Out/Body).
    Fail closed on drift (emit-time equality gate; pure Nix proves gate live).
  - Fail-closed load via FreestandingEmitLoad (Body + Banner) and
    FreestandingEmitLoadScaffold (Mult..Apply).
  - Templates embed Banner + Mult..Apply + Body via whole-line placeholders;
    body put_str dialect via SSOT keys after scaffolding embed.
  - Stage honesty: product residual free claimed; not PROVABLY; no product GC.

  Intentional non-claims:
  - Not freestanding residual free. Not PROVABLY. Not full Slake self-host.
  - Templates are thin shells; Mult..Body scaffolding remain SSOT-owned.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_EMIT_FREESTANDING_C_V0, HOST-EMIT-SSOT,
  HOST-EMIT-BODY, HOST-EMIT-BANNER, HOST-EMIT-MULT, HOST-EMIT-LINEAR,
  HOST-EMIT-ERASURE, HOST-EMIT-EXTRACT, HOST-EMIT-TYPES, HOST-EMIT-PROGRAM,
  HOST-EMIT-GRAPH, HOST-EMIT-COMPOSE, HOST-EMIT-PLAN, HOST-EMIT-APPLY, NON-SSOT,
  DUAL-SSOT-EQUALITY, dualSsotBlockEqual, requireDualSsotEqual, dualSsotEqualityLive,
  BODY_C_HEADER, BODY_C_BODY, BANNER_C_HEADER, BANNER_C_BODY,
  UNIT_TRANSLATION_V0, UNIT_DEEPEN_V1, RUNTIME-FS, product residual free,
  UNIT_SURFACE host surface, FreestandingEmitLoad, FreestandingEmitLoadScaffold.
  Module: SystemsLean.FreestandingEmit
  Lake exe: slake-emit-freestanding-c
  Red/green: just build; just systems-emit-wire; cc probe via check.sh
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.FreestandingEmitLoad
import SystemsLean.FreestandingEmitLoadScaffold
import SystemsLean.EmitBanner
import SystemsLean.EmitMult
import SystemsLean.EmitLinear
import SystemsLean.EmitErasure
import SystemsLean.EmitExtract
import SystemsLean.EmitExtractScaffold
import SystemsLean.EmitTypes
import SystemsLean.EmitTypesScaffold
import SystemsLean.EmitProgram
import SystemsLean.EmitProgramScaffold
import SystemsLean.EmitGraph
import SystemsLean.EmitGraphScaffold
import SystemsLean.EmitCompose
import SystemsLean.EmitComposeScaffold
import SystemsLean.EmitPlan
import SystemsLean.EmitPlanScaffold
import SystemsLean.EmitApply
import SystemsLean.EmitApplyScaffold
import SystemsLean.EmitBody
import SystemsLean.EmitBodyScaffold

namespace SystemsLean.FreestandingEmit

def renderHeader (template : String) (banner : BannerSsot) (mult : MultSsot)
    (linear : LinearSsot) (erasure : ErasureSsot) (extract : ExtractSsot)
    (types : TypesSsot) (program : ProgramSsot) (graph : GraphSsot)
    (compose : ComposeSsot) (plan : PlanSsot) (apply : ApplySsot)
    (body : BodySsot) : IO String := do
  let withBanner <- match embedPlaceholderLine template "__HOST_EMIT_BANNER_HEADER__" banner.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_BANNER_HEADER__"
      throw (IO.userError "missing banner header placeholder")
    | some s => pure s
  let withMult <- match embedPlaceholderLine withBanner "__HOST_EMIT_MULT_HEADER__" mult.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_MULT_HEADER__"
      throw (IO.userError "missing mult header placeholder")
    | some s => pure s
  let withLinear <- match embedPlaceholderLine withMult "__HOST_EMIT_LINEAR_HEADER__" linear.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_LINEAR_HEADER__"
      throw (IO.userError "missing linear header placeholder")
    | some s => pure s
  let withErasure <- match embedPlaceholderLine withLinear "__HOST_EMIT_ERASURE_HEADER__" erasure.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_ERASURE_HEADER__"
      throw (IO.userError "missing erasure header placeholder")
    | some s => pure s
  let withExtract <- match embedPlaceholderLine withErasure "__HOST_EMIT_EXTRACT_HEADER__" extract.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_EXTRACT_HEADER__"
      throw (IO.userError "missing extract header placeholder")
    | some s => pure s
  let withTypes <- match embedPlaceholderLine withExtract "__HOST_EMIT_TYPES_HEADER__" types.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_TYPES_HEADER__"
      throw (IO.userError "missing types header placeholder")
    | some s => pure s
  let withProgram <- match embedPlaceholderLine withTypes "__HOST_EMIT_PROGRAM_HEADER__" program.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_PROGRAM_HEADER__"
      throw (IO.userError "missing program header placeholder")
    | some s => pure s
  let withGraph <- match embedPlaceholderLine withProgram "__HOST_EMIT_GRAPH_HEADER__" graph.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_GRAPH_HEADER__"
      throw (IO.userError "missing graph header placeholder")
    | some s => pure s
  let withCompose <- match embedPlaceholderLine withGraph "__HOST_EMIT_COMPOSE_HEADER__" compose.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_COMPOSE_HEADER__"
      throw (IO.userError "missing compose header placeholder")
    | some s => pure s
  let withPlan <- match embedPlaceholderLine withCompose "__HOST_EMIT_PLAN_HEADER__" plan.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_PLAN_HEADER__"
      throw (IO.userError "missing plan header placeholder")
    | some s => pure s
  let withApply <- match embedPlaceholderLine withPlan "__HOST_EMIT_APPLY_HEADER__" apply.headerBlock with
    | none =>
      red "header template missing __HOST_EMIT_APPLY_HEADER__"
      throw (IO.userError "missing apply header placeholder")
    | some s => pure s
  match embedPlaceholderLine withApply "__HOST_EMIT_BODY_HEADER__" body.headerBlock with
  | none =>
    red "header template missing __HOST_EMIT_BODY_HEADER__"
    throw (IO.userError "missing body header placeholder")
  | some s =>
    if containsStr s "__HOST_EMIT_BANNER_" then
      red "Banner SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header banner")
    if containsStr s "__HOST_EMIT_MULT_" then
      red "Mult SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header mult")
    if containsStr s "__HOST_EMIT_LINEAR_" then
      red "Linear SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header linear")
    if containsStr s "__HOST_EMIT_ERASURE_" then
      red "Erasure SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header erasure")
    if containsStr s "__HOST_EMIT_EXTRACT_" then
      red "Extract SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header extract")
    if containsStr s "__HOST_EMIT_TYPES_" then
      red "Types SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header types")
    if containsStr s "__HOST_EMIT_PROGRAM_" then
      red "Program SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header program")
    if containsStr s "__HOST_EMIT_GRAPH_" then
      red "Graph SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header graph")
    if containsStr s "__HOST_EMIT_COMPOSE_" then
      red "Compose SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header compose")
    if containsStr s "__HOST_EMIT_PLAN_" then
      red "Plan SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header plan")
    if containsStr s "__HOST_EMIT_APPLY_" then
      red "Apply SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header apply")
    if containsStr s "__HOST_EMIT_BODY_" then
      red "Body SSOT placeholders remain after header embed"
      throw (IO.userError "placeholder remain header body")
    pure s

def renderSource (template : String) (body : BodySsot) (banner : BannerSsot)
    (mult : MultSsot) (linear : LinearSsot) (erasure : ErasureSsot)
    (extract : ExtractSsot) (types : TypesSsot) (program : ProgramSsot)
    (graph : GraphSsot) (compose : ComposeSsot) (plan : PlanSsot)
    (apply : ApplySsot) : IO String := do
  let withBanner <- match embedPlaceholderLine template "__HOST_EMIT_BANNER_BODY__" banner.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_BANNER_BODY__"
      throw (IO.userError "missing banner body placeholder")
    | some s => pure s
  let withMult <- match embedPlaceholderLine withBanner "__HOST_EMIT_MULT_BODY__" mult.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_MULT_BODY__"
      throw (IO.userError "missing mult body placeholder")
    | some s => pure s
  let withLinear <- match embedPlaceholderLine withMult "__HOST_EMIT_LINEAR_BODY__" linear.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_LINEAR_BODY__"
      throw (IO.userError "missing linear body placeholder")
    | some s => pure s
  let withErasure <- match embedPlaceholderLine withLinear "__HOST_EMIT_ERASURE_BODY__" erasure.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_ERASURE_BODY__"
      throw (IO.userError "missing erasure body placeholder")
    | some s => pure s
  let withExtract <- match embedPlaceholderLine withErasure "__HOST_EMIT_EXTRACT_BODY__" extract.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_EXTRACT_BODY__"
      throw (IO.userError "missing extract body placeholder")
    | some s => pure s
  let withTypes <- match embedPlaceholderLine withExtract "__HOST_EMIT_TYPES_BODY__" types.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_TYPES_BODY__"
      throw (IO.userError "missing types body placeholder")
    | some s => pure s
  let withProgram <- match embedPlaceholderLine withTypes "__HOST_EMIT_PROGRAM_BODY__" program.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_PROGRAM_BODY__"
      throw (IO.userError "missing program body placeholder")
    | some s => pure s
  let withGraph <- match embedPlaceholderLine withProgram "__HOST_EMIT_GRAPH_BODY__" graph.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_GRAPH_BODY__"
      throw (IO.userError "missing graph body placeholder")
    | some s => pure s
  let withCompose <- match embedPlaceholderLine withGraph "__HOST_EMIT_COMPOSE_BODY__" compose.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_COMPOSE_BODY__"
      throw (IO.userError "missing compose body placeholder")
    | some s => pure s
  let withPlan <- match embedPlaceholderLine withCompose "__HOST_EMIT_PLAN_BODY__" plan.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_PLAN_BODY__"
      throw (IO.userError "missing plan body placeholder")
    | some s => pure s
  let withApply <- match embedPlaceholderLine withPlan "__HOST_EMIT_APPLY_BODY__" apply.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_APPLY_BODY__"
      throw (IO.userError "missing apply body placeholder")
    | some s => pure s
  let withBody <- match embedPlaceholderLine withApply "__HOST_EMIT_BODY_BODY__" body.bodyBlock with
    | none =>
      red "source template missing __HOST_EMIT_BODY_BODY__"
      throw (IO.userError "missing body body placeholder")
    | some s => pure s
  let s := replaceAll withBody "__SSOT_EMPTY_FRAGMENT__" body.emptyFragment
  let s := replaceAll s "__SSOT_HEADER_OPEN__" body.headerOpen
  let s := replaceAll s "__SSOT_HEADER_E__" body.headerE
  let s := replaceAll s "__SSOT_HEADER_CLOSE__" body.headerClose
  let s := replaceAll s "__SSOT_TAG_OPEN__" body.tagOpen
  let s := replaceAll s "__SSOT_TAG_MULT__" body.tagMult
  let s := replaceAll s "__SSOT_TAG_KIND__" body.tagKind
  let s := replaceAll s "__SSOT_TAG_CLOSE__" body.tagClose
  if containsStr s "__HOST_EMIT_BANNER_" then
    red "Banner SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source banner")
  if containsStr s "__HOST_EMIT_MULT_" then
    red "Mult SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source mult")
  if containsStr s "__HOST_EMIT_LINEAR_" then
    red "Linear SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source linear")
  if containsStr s "__HOST_EMIT_ERASURE_" then
    red "Erasure SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source erasure")
  if containsStr s "__HOST_EMIT_EXTRACT_" then
    red "Extract SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source extract")
  if containsStr s "__HOST_EMIT_TYPES_" then
    red "Types SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source types")
  if containsStr s "__HOST_EMIT_PROGRAM_" then
    red "Program SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source program")
  if containsStr s "__HOST_EMIT_GRAPH_" then
    red "Graph SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source graph")
  if containsStr s "__HOST_EMIT_COMPOSE_" then
    red "Compose SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source compose")
  if containsStr s "__HOST_EMIT_PLAN_" then
    red "Plan SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source plan")
  if containsStr s "__HOST_EMIT_APPLY_" then
    red "Apply SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source apply")
  if containsStr s "__HOST_EMIT_BODY_" then
    red "Body SSOT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source body")
  if containsStr s "__SSOT_" then
    red "body SSOT placeholders remain after source embed"
    throw (IO.userError "ssot placeholder remain")
  pure s

/-- Post-write honesty greps (contract-stable; pure Nix also checks product wire). -/
def validateProduct (path : System.FilePath) (content : String) (isSource : Bool)
    (body : BodySsot) : IO Unit := do
  for tok in ([
      "SLAKE_EMIT_FREESTANDING_C_V0", "UNIT_TRANSLATION_V0", "UNIT_DEEPEN_V1",
      "HOST-EMIT-SSOT", "HOST-EMIT-BODY", "HOST-EMIT-BANNER", "HOST-EMIT-MULT",
      "HOST-EMIT-LINEAR", "HOST-EMIT-ERASURE", "HOST-EMIT-EXTRACT",
      "HOST-EMIT-TYPES", "HOST-EMIT-PROGRAM", "HOST-EMIT-GRAPH", "HOST-EMIT-COMPOSE",
      "HOST-EMIT-PLAN", "HOST-EMIT-APPLY",
      "RUNTIME-FS", "product residual free",
      "MULT-0", "MULT-1", "MULT-OMEGA", "slake_mult_is_valid",
      "EMIT_BODY_V0", "EMIT_PLAN_V0", "EMIT_APPLY_V0", "JOIN-ALG", "ConsumeToken",
      "LINEAR-EXACT-ONCE", "FAIL_CLOSED_CHECKER_V1", "CONSUME_TOKEN_HOST_V0",
      "ERASE-RULE-MULT-0", "slake_erased_mark", "slake_erasure_is_runtime_absent",
      "TYPED_IR_V0", "slake_type_tag", "slake_ir_node", "COMMON-UNIVERSE",
      "IR_PROGRAM_V0", "IR_GRAPH_EDGES_V0", "HOST_COMPOSE_V0",
      "SLAKE_IR_PROGRAM_CAP", "SLAKE_IR_EDGE_MAX", "SLAKE_EMIT_APPLY_CAP",
      "SLAKE_EMIT_BODY_CAP", "slake_emit_version", "slake_unit_translation_id"
    ] : List String) do
    requireToken content tok s!"{path}"
  if containsStr content "SLAKE_IR_EDGE_CAP" then
    red s!"{path} still cites SLAKE_IR_EDGE_CAP (use MAX)"
    throw (IO.userError "banned EDGE_CAP")
  if containsStr content "SLAKE_IR_PROGRAM_MAX" then
    red s!"{path} still cites SLAKE_IR_PROGRAM_MAX (use CAP)"
    throw (IO.userError "banned PROGRAM_MAX")
  if isSource then
    unless containsStr content body.headerOpen do
      red s!"{path} missing SSOT HEADER_OPEN dialect string"
      throw (IO.userError "missing HEADER_OPEN embed")
    unless containsStr content body.emptyFragment do
      red s!"{path} missing EMPTY_FRAGMENT reference from HOST-EMIT-SSOT"
      throw (IO.userError "missing EMPTY_FRAGMENT embed")

/-- Emit freestanding product C under emitDir (relative to repo root). -/
def emitAtRoot (root : System.FilePath) : IO Unit := do
  let emitDir := root / "src" / "systems" / "emit"
  let bodyPath := emitDir / "host_emit_body_fragment.ssot.txt"
  let bannerPath := emitDir / "host_emit_banner.ssot.txt"
  let multPath := emitDir / "host_emit_mult.ssot.txt"
  let linearPath := emitDir / "host_emit_linear.ssot.txt"
  let erasurePath := emitDir / "host_emit_erasure.ssot.txt"
  let extractPath := emitDir / "host_emit_extract.ssot.txt"
  let typesPath := emitDir / "host_emit_types.ssot.txt"
  let programPath := emitDir / "host_emit_program.ssot.txt"
  let graphPath := emitDir / "host_emit_graph.ssot.txt"
  let composePath := emitDir / "host_emit_compose.ssot.txt"
  let planPath := emitDir / "host_emit_plan.ssot.txt"
  let applyPath := emitDir / "host_emit_apply.ssot.txt"
  let tmplH := emitDir / "template_slake_freestanding.h.in"
  let tmplC := emitDir / "template_slake_freestanding.c.in"
  let outH := emitDir / "slake_freestanding.h"
  let outC := emitDir / "slake_freestanding.c"

  IO.println s!"== {stageId}: freestanding emit path V0 (Lean FreestandingEmit) =="
  IO.println "  product residual free claimed; host elaborator residual remains"
  IO.println "  not PROVABLY; no product GC; not Lean managed runtime"
  IO.println "  never writes out/freestanding-c/ (release surface is separate)"

  let body <- loadBodySsot bodyPath
  let banner <- loadBannerSsot bannerPath
  let mult <- loadMultSsot multPath
  let linear <- loadLinearSsot linearPath
  let erasure <- loadErasureSsot erasurePath
  let extract <- loadExtractSsot extractPath
  let types <- loadTypesSsot typesPath
  let program <- loadProgramSsot programPath
  let graph <- loadGraphSsot graphPath
  let compose <- loadComposeSsot composePath
  let plan <- loadPlanSsot planPath
  let apply <- loadApplySsot applyPath
  -- DUAL-SSOT-EQUALITY: durable host_emit_*.ssot.txt HEADER/BODY == Lean fragments.
  -- Fail closed on drift (Banner + Mult..Out/Body). Embed still uses SSOT files only.
  unless dualSsotEqualityLive do
    red s!"{dualSsotEqualityGateId}: dualSsotEqualityLive pin false"
    throw (IO.userError s!"{dualSsotEqualityGateId}: live pin")
  requireDualSsotEqual "Banner HEADER" banner.headerBlock
    SystemsLean.EmitBanner.bannerHeaderFragment
  requireDualSsotEqual "Banner BODY" banner.bodyBlock
    SystemsLean.EmitBanner.bannerBodyFragment
  requireDualSsotEqual "Mult HEADER" mult.headerBlock
    SystemsLean.EmitMult.multHeaderFragment
  requireDualSsotEqual "Mult BODY" mult.bodyBlock
    SystemsLean.EmitMult.multBodyFragment
  requireDualSsotEqual "Linear HEADER" linear.headerBlock
    SystemsLean.EmitLinear.linearHeaderFragment
  requireDualSsotEqual "Linear BODY" linear.bodyBlock
    SystemsLean.EmitLinear.linearBodyFragment
  requireDualSsotEqual "Erasure HEADER" erasure.headerBlock
    SystemsLean.EmitErasure.erasureHeaderFragment
  requireDualSsotEqual "Erasure BODY" erasure.bodyBlock
    SystemsLean.EmitErasure.erasureBodyFragment
  requireDualSsotEqual "Extract HEADER" extract.headerBlock
    SystemsLean.EmitExtract.extractHeaderFragment
  requireDualSsotEqual "Extract BODY" extract.bodyBlock
    SystemsLean.EmitExtract.extractBodyFragment
  requireDualSsotEqual "Types HEADER" types.headerBlock
    SystemsLean.EmitTypes.typesHeaderFragment
  requireDualSsotEqual "Types BODY" types.bodyBlock
    SystemsLean.EmitTypes.typesBodyFragment
  requireDualSsotEqual "Program HEADER" program.headerBlock
    SystemsLean.EmitProgram.programHeaderFragment
  requireDualSsotEqual "Program BODY" program.bodyBlock
    SystemsLean.EmitProgram.programBodyFragment
  requireDualSsotEqual "Graph HEADER" graph.headerBlock
    SystemsLean.EmitGraph.graphHeaderFragment
  requireDualSsotEqual "Graph BODY" graph.bodyBlock
    SystemsLean.EmitGraph.graphBodyFragment
  requireDualSsotEqual "Compose HEADER" compose.headerBlock
    SystemsLean.EmitCompose.composeHeaderFragment
  requireDualSsotEqual "Compose BODY" compose.bodyBlock
    SystemsLean.EmitCompose.composeBodyFragment
  requireDualSsotEqual "Plan HEADER" plan.headerBlock
    SystemsLean.EmitPlan.planHeaderFragment
  requireDualSsotEqual "Plan BODY" plan.bodyBlock
    SystemsLean.EmitPlan.planBodyFragment
  requireDualSsotEqual "Apply HEADER" apply.headerBlock
    SystemsLean.EmitApply.applyHeaderFragment
  requireDualSsotEqual "Apply BODY" apply.bodyBlock
    SystemsLean.EmitApply.applyBodyFragment
  requireDualSsotEqual "Body HEADER" body.headerBlock
    SystemsLean.EmitBody.bodyHeaderFragment
  requireDualSsotEqual "Body BODY" body.bodyBlock
    SystemsLean.EmitBody.bodyBodyFragment
  IO.println s!"  {dualSsotEqualityGateId}: Banner + Mult..Out HEADER/BODY match Lean fragments"
  requireFile tmplH "header template"
  requireFile tmplC "source template"
  let th <- IO.FS.readFile tmplH
  let tc <- IO.FS.readFile tmplC
  let header <- renderHeader th banner mult linear erasure extract types program graph compose plan apply body
  let source <- renderSource tc body banner mult linear erasure extract types program graph compose plan apply
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH header
  IO.FS.writeFile outC source
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  validateProduct outH headerWritten false body
  validateProduct outC sourceWritten true body
  IO.println s!"GREEN {stageId}: wrote freestanding emit surface under {emitDir}/"
  IO.println s!"  wrote: {outH}"
  IO.println s!"  wrote: {outC}"
  IO.println "  product residual free claimed; not PROVABLY; no product GC; not Lean managed runtime"
  IO.println "  release copy via just build (not this stage)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: optional repo root argument (default cwd). -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    emitAtRoot root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.FreestandingEmit

-- Lake exe root is FreestandingEmitMain (thin main module). Top-level main lives
-- there so other host modules may import FreestandingEmit and declare their own main.
"#

end SystemsLean.HostFrontLiveFreestandingEmit
