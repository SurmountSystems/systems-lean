/-
  SYSTEMS_LEAN_HOST partial -- freestanding emit Mult..Apply SSOT load scaffold.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns fail-closed load of Mult..Apply host_emit_*.ssot.txt unit scaffolding
  (Mult, Linear, Erasure, Types, Program, Graph, Compose, Extract, Plan, Apply).
  Core string / Dual SSOT / require helpers + Body + Banner stay in
  SystemsLean.FreestandingEmitLoad. Same namespace SystemsLean.FreestandingEmit
  so call sites stay unqualified.
  Greppable: SYSTEMS_LEAN_HOST, SLAKE_EMIT_FREESTANDING_C_V0, HOST-EMIT-MULT,
  HOST-EMIT-LINEAR, HOST-EMIT-ERASURE, HOST-EMIT-TYPES, HOST-EMIT-PROGRAM,
  HOST-EMIT-GRAPH, HOST-EMIT-COMPOSE, HOST-EMIT-EXTRACT, HOST-EMIT-PLAN,
  HOST-EMIT-APPLY, loadMultSsot, loadLinearSsot, loadErasureSsot, loadTypesSsot,
  loadProgramSsot, loadGraphSsot, loadComposeSsot, loadExtractSsot, loadPlanSsot,
  loadApplySsot, MultSsot, LinearSsot, ErasureSsot, TypesSsot, ProgramSsot,
  GraphSsot, ComposeSsot, ExtractSsot, PlanSsot, ApplySsot,
  FreestandingEmitLoadScaffold, UNIT_SURFACE host surface.
  Module: SystemsLean.FreestandingEmitLoadScaffold
  Red/green: just systems-emit-wire; lake build SystemsLean.FreestandingEmit.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  Stage honesty: not residual free; not PROVABLY; no product GC.
  RUNTIME-FS path honesty only (not residual free forge).
-/

import SystemsLean.FreestandingEmitLoad

namespace SystemsLean.FreestandingEmit

/-- Mult SSOT C blocks. -/
structure MultSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadMultSsot (path : System.FilePath) : IO MultSsot := do
  requireFile path "HOST-EMIT-MULT artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-MULT" "HOST-EMIT-MULT"
  requireToken content "NON-SSOT" "HOST-EMIT-MULT"
  for tok in (["MULT-0", "MULT-1", "MULT-OMEGA", "slake_mult_is_valid",
               "FAIL-CLOSED-UNKNOWN-GRADE"] : List String) do
    requireToken content tok "HOST-EMIT-MULT"
  let get (k : String) : IO String := do
    match ssotGet content k with
    | some v => pure v
    | none =>
      red s!"HOST-EMIT-MULT missing key {k} in {path}"
      throw (IO.userError s!"missing key {k}")
  let n0 <- get "MULT_NAME_0"
  let n1 <- get "MULT_NAME_1"
  let nO <- get "MULT_NAME_OMEGA"
  if n0 != "MULT-0" || n1 != "MULT-1" || nO != "MULT-OMEGA" then
    red "HOST-EMIT-MULT MULT_NAME_* diverge from Mult.name"
    IO.eprintln s!"  got: {n0} / {n1} / {nO}"
    throw (IO.userError "MULT_NAME diverge")
  let header <- match ssotBlock content "MULT_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-MULT missing block MULT_C_HEADER in {path}"
      throw (IO.userError "missing MULT_C_HEADER")
  let body <- match ssotBlock content "MULT_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-MULT missing block MULT_C_BODY in {path}"
      throw (IO.userError "missing MULT_C_BODY")
  for tok in (["HOST-EMIT-MULT", "slake_mult_is_valid", "MULT-0", "MULT-1",
               "MULT-OMEGA"] : List String) do
    unless containsStr header tok do
      red s!"Mult SSOT header block missing token {tok}"
      throw (IO.userError s!"Mult header missing {tok}")
    unless containsStr body tok do
      red s!"Mult SSOT body block missing token {tok}"
      throw (IO.userError s!"Mult body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Linear SSOT C blocks. -/
structure LinearSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadLinearSsot (path : System.FilePath) : IO LinearSsot := do
  requireFile path "HOST-EMIT-LINEAR artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-LINEAR" "HOST-EMIT-LINEAR"
  requireToken content "NON-SSOT" "HOST-EMIT-LINEAR"
  for tok in (["LINEAR-EXACT-ONCE", "CONSUME_TOKEN_HOST_V0", "JOIN-ALG",
               "slake_linear_consume", "slake_consume_token_consume"] : List String) do
    requireToken content tok "HOST-EMIT-LINEAR"
  let header <- match ssotBlock content "LINEAR_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-LINEAR missing block LINEAR_C_HEADER in {path}"
      throw (IO.userError "missing LINEAR_C_HEADER")
  let body <- match ssotBlock content "LINEAR_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-LINEAR missing block LINEAR_C_BODY in {path}"
      throw (IO.userError "missing LINEAR_C_BODY")
  for tok in (["HOST-EMIT-LINEAR", "slake_linear_consume", "slake_consume_token_consume",
               "LINEAR-EXACT-ONCE", "CONSUME_TOKEN_HOST_V0"] : List String) do
    unless containsStr header tok do
      red s!"Linear SSOT header block missing token {tok}"
      throw (IO.userError s!"Linear header missing {tok}")
    unless containsStr body tok do
      red s!"Linear SSOT body block missing token {tok}"
      throw (IO.userError s!"Linear body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Erasure SSOT C blocks (mult-0 absence honesty on freestanding C). -/
structure ErasureSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadErasureSsot (path : System.FilePath) : IO ErasureSsot := do
  requireFile path "HOST-EMIT-ERASURE artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-ERASURE" "HOST-EMIT-ERASURE"
  requireToken content "NON-SSOT" "HOST-EMIT-ERASURE"
  for tok in (["ERASE-RULE-MULT-0", "ERASE-NO-RUNTIME", "slake_erased",
               "slake_erased_mark", "slake_erasure_is_runtime_absent"] : List String) do
    requireToken content tok "HOST-EMIT-ERASURE"
  let header <- match ssotBlock content "ERASURE_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-ERASURE missing block ERASURE_C_HEADER in {path}"
      throw (IO.userError "missing ERASURE_C_HEADER")
  let body <- match ssotBlock content "ERASURE_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-ERASURE missing block ERASURE_C_BODY in {path}"
      throw (IO.userError "missing ERASURE_C_BODY")
  for tok in (["HOST-EMIT-ERASURE", "slake_erased", "slake_erased_mark",
               "slake_erasure_is_runtime_absent", "ERASE-RULE-MULT-0"] : List String) do
    unless containsStr header tok do
      red s!"Erasure SSOT header block missing token {tok}"
      throw (IO.userError s!"Erasure header missing {tok}")
  for tok in (["HOST-EMIT-ERASURE", "slake_erased_mark", "slake_erased_is_marked",
               "slake_erasure_is_runtime_absent"] : List String) do
    unless containsStr body tok do
      red s!"Erasure SSOT body block missing token {tok}"
      throw (IO.userError s!"Erasure body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Types SSOT C blocks (type_tag + TYPED_IR_V0 slake_ir_node). -/
structure TypesSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadTypesSsot (path : System.FilePath) : IO TypesSsot := do
  requireFile path "HOST-EMIT-TYPES artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-TYPES" "HOST-EMIT-TYPES"
  requireToken content "NON-SSOT" "HOST-EMIT-TYPES"
  for tok in (["TYPED_IR_V0", "COMMON-UNIVERSE", "slake_type_tag", "slake_ir_node",
               "slake_ir_node_init", "slake_ir_node_is_well_typed"] : List String) do
    requireToken content tok "HOST-EMIT-TYPES"
  let header <- match ssotBlock content "TYPES_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-TYPES missing block TYPES_C_HEADER in {path}"
      throw (IO.userError "missing TYPES_C_HEADER")
  let body <- match ssotBlock content "TYPES_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-TYPES missing block TYPES_C_BODY in {path}"
      throw (IO.userError "missing TYPES_C_BODY")
  for tok in (["HOST-EMIT-TYPES", "slake_type_tag", "slake_ir_node", "TYPED_IR_V0",
               "slake_ir_node_init", "COMMON-UNIVERSE"] : List String) do
    unless containsStr header tok do
      red s!"Types SSOT header block missing token {tok}"
      throw (IO.userError s!"Types header missing {tok}")
  for tok in (["HOST-EMIT-TYPES", "slake_type_tag_init", "slake_ir_node_init",
               "slake_ir_node_is_well_typed", "slake_ir_node_check_fail_closed",
               "TYPED_IR_V0"] : List String) do
    unless containsStr body tok do
      red s!"Types SSOT body block missing token {tok}"
      throw (IO.userError s!"Types body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Program SSOT C blocks (ordered IR program IR_PROGRAM_V0 product text). -/
structure ProgramSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadProgramSsot (path : System.FilePath) : IO ProgramSsot := do
  requireFile path "HOST-EMIT-PROGRAM artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-PROGRAM" "HOST-EMIT-PROGRAM"
  requireToken content "NON-SSOT" "HOST-EMIT-PROGRAM"
  for tok in (["IR_PROGRAM_V0", "SLAKE_IR_PROGRAM_CAP", "slake_ir_program",
               "slake_ir_program_init", "slake_ir_program_push",
               "slake_ir_program_is_well_typed"] : List String) do
    requireToken content tok "HOST-EMIT-PROGRAM"
  let header <- match ssotBlock content "PROGRAM_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-PROGRAM missing block PROGRAM_C_HEADER in {path}"
      throw (IO.userError "missing PROGRAM_C_HEADER")
  let body <- match ssotBlock content "PROGRAM_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-PROGRAM missing block PROGRAM_C_BODY in {path}"
      throw (IO.userError "missing PROGRAM_C_BODY")
  for tok in (["HOST-EMIT-PROGRAM", "slake_ir_program", "IR_PROGRAM_V0",
               "SLAKE_IR_PROGRAM_CAP", "slake_ir_program_init",
               "slake_ir_program_push"] : List String) do
    unless containsStr header tok do
      red s!"Program SSOT header block missing token {tok}"
      throw (IO.userError s!"Program header missing {tok}")
  for tok in (["HOST-EMIT-PROGRAM", "slake_ir_program_id", "slake_ir_program_init",
               "slake_ir_program_push", "slake_ir_program_is_well_typed",
               "slake_ir_program_check_fail_closed", "IR_PROGRAM_V0"] : List String) do
    unless containsStr body tok do
      red s!"Program SSOT body block missing token {tok}"
      throw (IO.userError s!"Program body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Graph SSOT C blocks (IR graph edges IR_GRAPH_EDGES_V0 product text). -/
structure GraphSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadGraphSsot (path : System.FilePath) : IO GraphSsot := do
  requireFile path "HOST-EMIT-GRAPH artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-GRAPH" "HOST-EMIT-GRAPH"
  requireToken content "NON-SSOT" "HOST-EMIT-GRAPH"
  for tok in (["IR_GRAPH_EDGES_V0", "SLAKE_IR_EDGE_MAX", "slake_ir_graph",
               "slake_ir_edge", "slake_ir_graph_init", "slake_ir_graph_add_edge",
               "slake_ir_graph_is_well_typed"] : List String) do
    requireToken content tok "HOST-EMIT-GRAPH"
  let header <- match ssotBlock content "GRAPH_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-GRAPH missing block GRAPH_C_HEADER in {path}"
      throw (IO.userError "missing GRAPH_C_HEADER")
  let body <- match ssotBlock content "GRAPH_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-GRAPH missing block GRAPH_C_BODY in {path}"
      throw (IO.userError "missing GRAPH_C_BODY")
  for tok in (["HOST-EMIT-GRAPH", "slake_ir_graph", "IR_GRAPH_EDGES_V0",
               "SLAKE_IR_EDGE_MAX", "slake_ir_graph_init",
               "slake_ir_graph_add_edge"] : List String) do
    unless containsStr header tok do
      red s!"Graph SSOT header block missing token {tok}"
      throw (IO.userError s!"Graph header missing {tok}")
  for tok in (["HOST-EMIT-GRAPH", "slake_ir_graph_id", "slake_ir_graph_init",
               "slake_ir_graph_push_node", "slake_ir_graph_add_edge",
               "slake_ir_graph_is_well_typed", "slake_ir_graph_check_fail_closed",
               "IR_GRAPH_EDGES_V0"] : List String) do
    unless containsStr body tok do
      red s!"Graph SSOT body block missing token {tok}"
      throw (IO.userError s!"Graph body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Compose SSOT C blocks (host compose HOST_COMPOSE_V0 product text). -/
structure ComposeSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadComposeSsot (path : System.FilePath) : IO ComposeSsot := do
  requireFile path "HOST-EMIT-COMPOSE artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-COMPOSE" "HOST-EMIT-COMPOSE"
  requireToken content "NON-SSOT" "HOST-EMIT-COMPOSE"
  for tok in (["HOST_COMPOSE_V0", "slake_host_compose", "slake_host_compose_init",
               "slake_host_compose_mint", "slake_host_compose_check_fail_closed",
               "slake_host_compose_extract"] : List String) do
    requireToken content tok "HOST-EMIT-COMPOSE"
  let header <- match ssotBlock content "COMPOSE_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-COMPOSE missing block COMPOSE_C_HEADER in {path}"
      throw (IO.userError "missing COMPOSE_C_HEADER")
  let body <- match ssotBlock content "COMPOSE_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-COMPOSE missing block COMPOSE_C_BODY in {path}"
      throw (IO.userError "missing COMPOSE_C_BODY")
  for tok in (["HOST-EMIT-COMPOSE", "slake_host_compose", "HOST_COMPOSE_V0",
               "slake_host_compose_init", "slake_host_compose_mint",
               "slake_host_compose_check_fail_closed"] : List String) do
    unless containsStr header tok do
      red s!"Compose SSOT header block missing token {tok}"
      throw (IO.userError s!"Compose header missing {tok}")
  for tok in (["HOST-EMIT-COMPOSE", "slake_host_compose_id", "slake_host_compose_init",
               "slake_host_compose_push_node", "slake_host_compose_mint",
               "slake_host_compose_consume", "slake_host_compose_check_fail_closed",
               "slake_host_compose_extract", "HOST_COMPOSE_V0"] : List String) do
    unless containsStr body tok do
      red s!"Compose SSOT body block missing token {tok}"
      throw (IO.userError s!"Compose body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Extract SSOT C blocks (Extract + FAIL_CLOSED_CHECKER_V1 product text). -/
structure ExtractSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadExtractSsot (path : System.FilePath) : IO ExtractSsot := do
  requireFile path "HOST-EMIT-EXTRACT artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-EXTRACT" "HOST-EMIT-EXTRACT"
  requireToken content "NON-SSOT" "HOST-EMIT-EXTRACT"
  for tok in (["FAIL_CLOSED_CHECKER_V1", "slake_extract_status", "slake_check_bundle",
               "slake_check_fail_closed", "slake_extract_with_checks",
               "slake_extract_status_ok", "slake_extract_product_runtime"] : List String) do
    requireToken content tok "HOST-EMIT-EXTRACT"
  let header <- match ssotBlock content "EXTRACT_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-EXTRACT missing block EXTRACT_C_HEADER in {path}"
      throw (IO.userError "missing EXTRACT_C_HEADER")
  let body <- match ssotBlock content "EXTRACT_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-EXTRACT missing block EXTRACT_C_BODY in {path}"
      throw (IO.userError "missing EXTRACT_C_BODY")
  for tok in (["HOST-EMIT-EXTRACT", "slake_extract_status", "slake_check_bundle",
               "slake_check_fail_closed", "slake_extract_with_checks",
               "FAIL_CLOSED_CHECKER_V1"] : List String) do
    unless containsStr header tok do
      red s!"Extract SSOT header block missing token {tok}"
      throw (IO.userError s!"Extract header missing {tok}")
  for tok in (["HOST-EMIT-EXTRACT", "slake_extract_status_ok", "slake_extract_product_runtime",
               "slake_check_fail_closed", "slake_extract_with_checks",
               "FAIL_CLOSED_CHECKER_V1"] : List String) do
    unless containsStr body tok do
      red s!"Extract SSOT body block missing token {tok}"
      throw (IO.userError s!"Extract body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Plan SSOT C blocks (emit plan EMIT_PLAN_V0 product text). -/
structure PlanSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadPlanSsot (path : System.FilePath) : IO PlanSsot := do
  requireFile path "HOST-EMIT-PLAN artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-PLAN" "HOST-EMIT-PLAN"
  requireToken content "NON-SSOT" "HOST-EMIT-PLAN"
  for tok in (["EMIT_PLAN_V0", "slake_emit_plan", "slake_emit_plan_from_compose",
               "slake_emit_plan_is_ready"] : List String) do
    requireToken content tok "HOST-EMIT-PLAN"
  let header <- match ssotBlock content "PLAN_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-PLAN missing block PLAN_C_HEADER in {path}"
      throw (IO.userError "missing PLAN_C_HEADER")
  let body <- match ssotBlock content "PLAN_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-PLAN missing block PLAN_C_BODY in {path}"
      throw (IO.userError "missing PLAN_C_BODY")
  for tok in (["HOST-EMIT-PLAN", "slake_emit_plan", "EMIT_PLAN_V0",
               "slake_emit_plan_from_compose", "slake_emit_plan_is_ready"] : List String) do
    unless containsStr header tok do
      red s!"Plan SSOT header block missing token {tok}"
      throw (IO.userError s!"Plan header missing {tok}")
  for tok in (["HOST-EMIT-PLAN", "slake_emit_plan_id", "slake_emit_plan_from_compose",
               "slake_emit_plan_is_ready", "EMIT_PLAN_V0"] : List String) do
    unless containsStr body tok do
      red s!"Plan SSOT body block missing token {tok}"
      throw (IO.userError s!"Plan body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }

/-- Apply SSOT C blocks (emit apply EMIT_APPLY_V0 product text). -/
structure ApplySsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadApplySsot (path : System.FilePath) : IO ApplySsot := do
  requireFile path "HOST-EMIT-APPLY artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-APPLY" "HOST-EMIT-APPLY"
  requireToken content "NON-SSOT" "HOST-EMIT-APPLY"
  for tok in (["EMIT_APPLY_V0", "slake_emit_apply", "slake_emit_apply_from_compose",
               "slake_emit_apply_is_valid", "SLAKE_EMIT_APPLY_CAP"] : List String) do
    requireToken content tok "HOST-EMIT-APPLY"
  let header <- match ssotBlock content "APPLY_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-APPLY missing block APPLY_C_HEADER in {path}"
      throw (IO.userError "missing APPLY_C_HEADER")
  let body <- match ssotBlock content "APPLY_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-APPLY missing block APPLY_C_BODY in {path}"
      throw (IO.userError "missing APPLY_C_BODY")
  for tok in (["HOST-EMIT-APPLY", "slake_emit_apply", "EMIT_APPLY_V0",
               "SLAKE_EMIT_APPLY_CAP", "slake_emit_apply_from_compose",
               "slake_emit_apply_is_valid"] : List String) do
    unless containsStr header tok do
      red s!"Apply SSOT header block missing token {tok}"
      throw (IO.userError s!"Apply header missing {tok}")
  for tok in (["HOST-EMIT-APPLY", "slake_emit_apply_id", "slake_emit_apply_from_compose",
               "slake_emit_apply_is_valid", "EMIT_APPLY_V0", "SLAKE_EMIT_APPLY_CAP"] : List String) do
    unless containsStr body tok do
      red s!"Apply SSOT body block missing token {tok}"
      throw (IO.userError s!"Apply body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }


end SystemsLean.FreestandingEmit
