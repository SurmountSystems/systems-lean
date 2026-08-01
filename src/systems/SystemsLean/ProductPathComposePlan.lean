/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path perform COMPOSE (B12).
  SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0 -- decomposed plan/apply/body
  COMPOSE step substrate.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Decomposed product-path compose of emit plan / apply / body dual SSOT into
  an ordered in-memory compose marker (WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY).
  Does not import FreestandingEmit / renderHeader/renderSource (full Mult..Apply
  template embed stays FreestandingEmit). No product-wire write APIs.
  Compose depth: ordered plan+apply+body presence+token join + composed-string
  token checks -- not full template embed, not freestanding WRITE-HC.
  Lake exe: slake-compose-product-plan (just compose-product-plan).
  Dual-pin thin batch 11: historical stage/Ok/moduleCite/recipe/exe/fn/gap
  home-primary; tip keeps chain fold + ComposeDependsOnLake +
  ComposeEntrypointClaimed only. Living tip owns claim-bool SSoT; this land-time
  module does NOT define perform/ownership/complete true (emit-wire forbid).
  Theorems (COMPOSE-PLAN-THEOREM / HOST-COMPOSE-PLAN-THEOREM +
  COMPOSE-PLAN-SMOKE / HOST-COMPOSE-PLAN-SMOKE):
  SystemsLean.ProductPathComposePlanTheorems (same namespace; long-file split).
  theorem productPathPerformComposePartialReady_true /
  productPathPerformComposeOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0,
  HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE,
  product path perform compose, composePlanApplyBodyAtRoot, IO.FS.readFile,
  FREESTANDING-PERFORM-GAP-COMPOSE, WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY,
  host_emit_plan.ssot.txt, host_emit_apply.ssot.txt, host_emit_body_fragment.ssot.txt,
  slake-compose-product-plan, ProductPathComposePlan, HOST-EMIT-PLAN, HOST-EMIT-APPLY,
  HOST-EMIT-BODY, productPathPerformComposeOk, productPathPerformComposePartialReady,
  productPathPerformComposeDependsOnLake, productPathPerformComposeEntrypointClaimed,
  COMPOSE-PLAN-THEOREM, HOST-COMPOSE-PLAN-THEOREM,
  COMPOSE-PLAN-SMOKE, HOST-COMPOSE-PLAN-SMOKE, ProductPathComposePlanTheorems,
  theorem productPathPerformComposePartialReady_true,
  RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.ProductPathComposePlan
  Long-file split: COMPOSE-PLAN-THEOREM + SMOKE in ProductPathComposePlanTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.ProductPathComposePlan

/-- Greppable primary stage id (partial B12 COMPOSE perform substrate). -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"

/-- Greppable short map id. -/
def selfHostId : String := "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"

/-- Named gap this step advances (not closed until freestanding-capable without
    classic Lean as product path). Greppable: FREESTANDING-PERFORM-GAP-COMPOSE. -/
def gapCompose : String := "FREESTANDING-PERFORM-GAP-COMPOSE"

/-- Ordered B6 plan step id this substrate advances. Greppable:
    WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY. -/
def writerPathStepCompose : String := "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"

/-- Lake exe name for this compose-only entrypoint. -/
def lakeExeName : String := "slake-compose-product-plan"

/-- just recipe name. -/
def justRecipeName : String := "compose-product-plan"

/-- Compose entry function cite. Greppable: composePlanApplyBodyAtRoot. -/
def composeFnCite : String := "composePlanApplyBodyAtRoot"

/-- Module cite. Greppable: ProductPathComposePlan. -/
def composeModuleCite : String := "ProductPathComposePlan"

/-- productPathPerformComposeDependsOnLake -- COMPOSE step still uses classic Lean
    Lake host exe, not freestanding C. Land-time honesty pin (true). Greppable:
    productPathPerformComposeDependsOnLake, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE. -/
def productPathPerformComposeDependsOnLake : Bool := true

/-- productPathPerformComposeEntrypointClaimed -- decomposed COMPOSE entry exists
    (just compose-product-plan / lake exe slake-compose-product-plan /
    composePlanApplyBodyAtRoot). NOT freestanding perform claimed.
    Greppable: productPathPerformComposeEntrypointClaimed,
    SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, compose-product-plan. -/
def productPathPerformComposeEntrypointClaimed : Bool := true

/-- productPathPerformComposeOk -- B12 stage ids + COMPOSE entrypoint claimed +
    recipe/exe/module cites + ComposeDependsOnLake true + gap COMPOSE +
    WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY. Land-time surface only (no living-tip
    perform/ownership/complete claim bools on this module -- emit-wire forbids
    those true defs here). Greppable: productPathPerformComposeOk,
    SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, product path perform compose. -/
def productPathPerformComposeOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE")
    && (productPathPerformComposeEntrypointClaimed == true)
    && (justRecipeName == "compose-product-plan")
    && (lakeExeName == "slake-compose-product-plan")
    && (composeModuleCite == "ProductPathComposePlan")
    && (composeFnCite == "composePlanApplyBodyAtRoot")
    && (productPathPerformComposeDependsOnLake == true)
    && (gapCompose == "FREESTANDING-PERFORM-GAP-COMPOSE")
    && (writerPathStepCompose == "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY")

/-- COMPOSE PartialReady fold (closed B12 substrate: Ok + DependsOnLake +
    entrypoint claimed). Historical readiness bulk for perform COMPOSE.
    SelfApplyFs living tip re-exports a chain fold that includes this def for
    greppable dual-pin + B11 READ PartialReady chain. Land-time module pins:
    DependsOnLake true; EntrypointClaimed true (living tip allows perform /
    ownership / stepContractFull / complete true after later cliffs). Does not
    flip residual free / llvm / PROVABLY.
    Greppable: productPathPerformComposePartialReady,
    SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, product path perform compose. -/
def productPathPerformComposePartialReady : Bool :=
  productPathPerformComposeOk
    && productPathPerformComposeDependsOnLake
    && productPathPerformComposeEntrypointClaimed

/-- Dual SSOT basename + required HOST-EMIT token for plan/apply/body compose. -/
structure DualSsotSpec where
  base : String
  token : String
  role : String
  deriving Repr

/-- True when s contains needle as a contiguous substring (empty needle => false). -/
def containsStr (s needle : String) : Bool :=
  if needle.isEmpty then false
  else (s.splitOn needle).length > 1

/-- Fail closed when path missing. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Plan / apply / body dual SSOT only (compose substrate of B6 COMPOSE step).
    Not Mult..Graph full ladder -- that remains FreestandingEmit render path.
    Greppable: host_emit_plan.ssot.txt, host_emit_apply.ssot.txt,
    host_emit_body_fragment.ssot.txt, HOST-EMIT-PLAN, HOST-EMIT-APPLY, HOST-EMIT-BODY. -/
def planApplyBodySpecs : List DualSsotSpec := [
  { base := "host_emit_plan.ssot.txt", token := "HOST-EMIT-PLAN", role := "plan" },
  { base := "host_emit_apply.ssot.txt", token := "HOST-EMIT-APPLY", role := "apply" },
  { base := "host_emit_body_fragment.ssot.txt", token := "HOST-EMIT-BODY", role := "body" }
]

/-- Read one dual SSOT file; require non-empty + greppable host token.
    Presence/token only -- not HEADER/BODY parse, not dual-equality.
    Greppable: readOneSsot, IO.FS.readFile (read for compose; no product write). -/
def readOneSsot (path : System.FilePath) (token : String) : IO String := do
  requireFile path s!"dual SSOT ({token})"
  let content <- IO.FS.readFile path
  if content.isEmpty then
    IO.eprintln s!"error: empty dual SSOT: {path}"
    throw (IO.userError s!"empty {path}")
  unless containsStr content token do
    IO.eprintln s!"error: dual SSOT missing token {token}: {path}"
    throw (IO.userError s!"missing token {token}")
  pure content

/-- Build ordered compose marker string from plan/apply/body contents.
    In-memory only -- not FreestandingEmit renderHeader/renderSource template embed,
    not product-wire write. Greppable: buildComposeMarker,
    WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY. -/
def buildComposeMarker (plan apply body : String) : String :=
  s!"{writerPathStepCompose}\n" ++
    s!"ROLE-plan:\n{plan}\n" ++
    s!"ROLE-apply:\n{apply}\n" ++
    s!"ROLE-body:\n{body}\n" ++
    s!"STAGE:{stageId}\n" ++
    s!"GAP:{gapCompose}\n"

/-- Compose plan/apply/body dual SSOT under root/src/systems/emit into ordered
    in-memory marker; verify composed string still carries HOST-EMIT-PLAN /
    HOST-EMIT-APPLY / HOST-EMIT-BODY + step id. No product-wire write.
    Greppable: composePlanApplyBodyAtRoot, FREESTANDING-PERFORM-GAP-COMPOSE,
    WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY. -/
def composePlanApplyBodyAtRoot (root : System.FilePath) : IO Unit := do
  let emitDir := root / "src" / "systems" / "emit"
  IO.println s!"== {stageId}: product path perform COMPOSE plan/apply/body (decomposed) =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  gap: {gapCompose} (partial; not freestanding perform claimed)"
  IO.println s!"  step: {writerPathStepCompose}"
  IO.println "  compose: ordered plan+apply+body in-memory marker; not template embed"
  IO.println "  not residual free; not PROVABLY; write still Lake FreestandingEmit"
  let mut planText : String := ""
  let mut applyText : String := ""
  let mut bodyText : String := ""
  for spec in planApplyBodySpecs do
    let path := emitDir / spec.base
    let content <- readOneSsot path spec.token
    IO.println s!"  compose input ok: {path} ({spec.token} / {spec.role})"
    match spec.role with
    | "plan" => planText := content
    | "apply" => applyText := content
    | "body" => bodyText := content
    | other =>
      IO.eprintln s!"error: unknown compose role {other} for {spec.base}"
      throw (IO.userError s!"unknown compose role {other}")
  if planText.isEmpty || applyText.isEmpty || bodyText.isEmpty then
    IO.eprintln "error: plan/apply/body compose inputs incomplete"
    throw (IO.userError "incomplete compose inputs")
  let composed := buildComposeMarker planText applyText bodyText
  unless containsStr composed writerPathStepCompose do
    IO.eprintln s!"error: composed missing step id {writerPathStepCompose}"
    throw (IO.userError "missing compose step id")
  unless containsStr composed "HOST-EMIT-PLAN" do
    IO.eprintln "error: composed missing HOST-EMIT-PLAN"
    throw (IO.userError "missing HOST-EMIT-PLAN in composed")
  unless containsStr composed "HOST-EMIT-APPLY" do
    IO.eprintln "error: composed missing HOST-EMIT-APPLY"
    throw (IO.userError "missing HOST-EMIT-APPLY in composed")
  unless containsStr composed "HOST-EMIT-BODY" do
    IO.eprintln "error: composed missing HOST-EMIT-BODY"
    throw (IO.userError "missing HOST-EMIT-BODY in composed")
  unless containsStr composed gapCompose do
    IO.eprintln s!"error: composed missing gap {gapCompose}"
    throw (IO.userError "missing compose gap id")
  IO.println s!"GREEN {stageId}: composed plan/apply/body marker ({composed.length} chars)"
  IO.println "  not freestanding perform claimed; FREESTANDING-PERFORM-GAP-COMPOSE not closed"
  IO.println "  full Mult..Apply template embed + write still require FreestandingEmit"

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
    unless productPathPerformComposeOk do
      IO.eprintln s!"error: {stageId} surface not ok"
      throw (IO.userError "productPathPerformComposeOk false")
    composePlanApplyBodyAtRoot root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ProductPathComposePlan

-- Theorems + smoke: SystemsLean.ProductPathComposePlanTheorems (same namespace).
-- Lake entry is SystemsLean.ProductPathComposePlanMain (no top-level main here so
-- SelfApplyFs may import this API / Ok / PartialReady bulk without main clash).
