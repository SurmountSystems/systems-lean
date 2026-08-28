/-
  SYSTEMS_LEAN_HOST measurement -- Lean-owned stack live-flag mint twin.
  Generates the timed C driver (CLOCK_MONOTONIC stopwatch in C).
  Not a Lean IO timer (that is RuntimeBenchLean / R-lean).
  Not freestanding product wire. Not PROVABLY-as-speed.
  Not residual free / complete / FullHost forge.

  Protocol: stack id+live+state mint/consume; no malloc; no slake_* APIs.
  Hand smoke file stays until this generated twin is the live arm.

  Greppable: RuntimeBenchStackTwin, R-stack-twin, stack_twin_token,
  stackTwinProtocolOk, generatedSource, not_product_wire,
  RUNTIME-BENCH-STACK-TWIN.
  Module: SystemsLean.RuntimeBenchStackTwin
  SKELETON host measurement (not freestanding unit).
  Module must stay ASCII. Sub-1-KLOC. Measurement role only.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

namespace SystemsLean.RuntimeBenchStackTwin

/-- True when hay contains needle as a contiguous substring. -/
def containsStr (hay needle : String) : Bool :=
  if needle.isEmpty then false
  else (hay.splitOn needle).length > 1

/-- Greppable measurement stage (not a product residual claim). -/
def stageId : String := "RUNTIME-BENCH-STACK-TWIN"

/-- Generated driver path cite under out/ (not product emit wire). -/
def generatedRelPath : String := "out/runtime-bench/stack_twin.c"

/-- Lake exe name. -/
def lakeExeName : String := "slake-runtime-bench-stack-twin"

/-- just recipe that writes then compiles the generated driver. -/
def justRecipe : String := "bench-runtime-stack-twin-generated"

/-! ### Generated timed C driver (SSOT)

  Same fail-closed mint/consume codes and stack fields as the hand twin.
  Wall clock stays in C (clock_gettime). Not RuntimeBenchLean IO.monoNanosNow.
-/

def sourcePreamble : String :=
  "/* SPDX-License-Identifier: Unlicense\n"
    ++ " *\n"
    ++ " * Generated stack live-flag mint/consume twin.\n"
    ++ " * Lean SSOT: SystemsLean.RuntimeBenchStackTwin.\n"
    ++ " * Same stack fields (id + live + state) and fail-closed codes.\n"
    ++ " * No heap allocation. Does not call product APIs.\n"
    ++ " * Does not include the product header. Not product wire.\n"
    ++ " * Measurement role only. Not PROVABLY-as-speed.\n"
    ++ " *\n"
    ++ " * Fail-closed codes (match product mint/consume):\n"
    ++ " *   mint:    0 ok; -1 null or id==0; -2 already live\n"
    ++ " *   consume: 0 ok; -1 null or empty; -2 already spent\n"
    ++ " * Remint after spent is allowed (mint keys off already-live).\n"
    ++ " *\n"
    ++ " * Usage:  stack_twin [N]\n"
    ++ " * Default N: 200000000 (match freestanding mint calibration).\n"
    ++ " */\n"
    ++ "#define _POSIX_C_SOURCE 200809L\n"
    ++ "#include <stdint.h>\n"
    ++ "#include <stdio.h>\n"
    ++ "#include <stdlib.h>\n"
    ++ "#include <time.h>\n"
    ++ "\n"
    ++ "/* Flattened stack automaton: product token.id + token.live + host.state. */\n"
    ++ "typedef struct stack_twin_token {\n"
    ++ "  uint32_t id;\n"
    ++ "  uint8_t live;  /* 1 live; 0 spent/empty */\n"
    ++ "  uint8_t state; /* 0 empty; 1 live; 2 spent */\n"
    ++ "} stack_twin_token;\n"
    ++ "\n"
    ++ "static double wall_seconds(void)\n"
    ++ "{\n"
    ++ "  struct timespec ts;\n"
    ++ "  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {\n"
    ++ "    return -1.0;\n"
    ++ "  }\n"
    ++ "  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;\n"
    ++ "}\n"
    ++ "\n"

def sourceTwinOps : String :=
  "static int twin_init(stack_twin_token *t)\n"
    ++ "{\n"
    ++ "  if (t == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  t->id = 0;\n"
    ++ "  t->live = 0;\n"
    ++ "  t->state = 0;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int twin_is_live(const stack_twin_token *t)\n"
    ++ "{\n"
    ++ "  if (t == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (t->state != 1) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return (t->live != 0) ? 1 : 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "/* 0 ok; -1 null or id==0; -2 already holds a live token. Remint after spent. */\n"
    ++ "static int twin_mint(stack_twin_token *t, uint32_t id)\n"
    ++ "{\n"
    ++ "  if (t == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (id == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (t->state == 1 && t->live != 0) {\n"
    ++ "    return -2;\n"
    ++ "  }\n"
    ++ "  t->id = id;\n"
    ++ "  t->live = 1;\n"
    ++ "  t->state = 1;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "/* 0 ok; -1 null or empty; -2 already spent. Desync heal if state live but !live. */\n"
    ++ "static int twin_consume(stack_twin_token *t)\n"
    ++ "{\n"
    ++ "  if (t == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (t->state == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (t->state == 2) {\n"
    ++ "    return -2;\n"
    ++ "  }\n"
    ++ "  if (t->live == 0) {\n"
    ++ "    t->state = 2;\n"
    ++ "    return -2;\n"
    ++ "  }\n"
    ++ "  t->live = 0;\n"
    ++ "  t->id = 0;\n"
    ++ "  t->state = 2;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"

def sourceContractAndLoop : String :=
  "/* Untimed: mint/consume codes + remint after spent. */\n"
    ++ "static int contract_mint_consume_once(void)\n"
    ++ "{\n"
    ++ "  stack_twin_token t;\n"
    ++ "\n"
    ++ "  if (twin_init(0) != -1) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (twin_init(&t) != 0) {\n"
    ++ "    return 2;\n"
    ++ "  }\n"
    ++ "  if (twin_mint(&t, 0) != -1) {\n"
    ++ "    return 3;\n"
    ++ "  }\n"
    ++ "  if (twin_consume(&t) != -1) {\n"
    ++ "    return 4; /* empty */\n"
    ++ "  }\n"
    ++ "  if (twin_mint(&t, 1) != 0) {\n"
    ++ "    return 5;\n"
    ++ "  }\n"
    ++ "  if (twin_is_live(&t) != 1) {\n"
    ++ "    return 6;\n"
    ++ "  }\n"
    ++ "  if (twin_mint(&t, 8) != -2) {\n"
    ++ "    return 7; /* already live */\n"
    ++ "  }\n"
    ++ "  if (twin_consume(&t) != 0) {\n"
    ++ "    return 8;\n"
    ++ "  }\n"
    ++ "  if (twin_is_live(&t) != 0) {\n"
    ++ "    return 9;\n"
    ++ "  }\n"
    ++ "  if (twin_consume(&t) != -2) {\n"
    ++ "    return 10; /* spent */\n"
    ++ "  }\n"
    ++ "  /* Remint after spent allowed (no forced empty reset). */\n"
    ++ "  if (twin_mint(&t, 9) != 0) {\n"
    ++ "    return 11;\n"
    ++ "  }\n"
    ++ "  if (twin_is_live(&t) != 1) {\n"
    ++ "    return 12;\n"
    ++ "  }\n"
    ++ "  if (twin_consume(&t) != 0) {\n"
    ++ "    return 13;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int run_ops(unsigned long n, volatile unsigned long *sink)\n"
    ++ "{\n"
    ++ "  stack_twin_token t;\n"
    ++ "  unsigned long i;\n"
    ++ "  unsigned long acc = 0;\n"
    ++ "\n"
    ++ "  if (twin_init(&t) != 0) {\n"
    ++ "    return 20;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < n; i++) {\n"
    ++ "    uint32_t id = (uint32_t)((i % 0xfffffffeu) + 1u);\n"
    ++ "    if (twin_mint(&t, id) != 0) {\n"
    ++ "      return 21;\n"
    ++ "    }\n"
    ++ "    if (twin_consume(&t) != 0) {\n"
    ++ "      return 22;\n"
    ++ "    }\n"
    ++ "    acc += (unsigned long)id;\n"
    ++ "  }\n"
    ++ "  *sink = acc;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"

def sourceMain : String :=
  "int main(int argc, char **argv)\n"
    ++ "{\n"
    ++ "  unsigned long n = 200000000ul;\n"
    ++ "  volatile unsigned long sink = 0;\n"
    ++ "  double t0, t1, elapsed;\n"
    ++ "  int rc;\n"
    ++ "  double ns_per_op;\n"
    ++ "  double ops_per_s;\n"
    ++ "\n"
    ++ "  if (argc >= 2) {\n"
    ++ "    char *end = 0;\n"
    ++ "    unsigned long parsed = strtoul(argv[1], &end, 10);\n"
    ++ "    if (end == argv[1] || parsed == 0) {\n"
    ++ "      fprintf(stderr, \"usage: %s [N>0]\\n\", argv[0]);\n"
    ++ "      return 64;\n"
    ++ "    }\n"
    ++ "    n = parsed;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  printf(\"arm=R-stack-twin\\n\");\n"
    ++ "  printf(\"workload=stack live-flag mint then consume once (protocol twin)\\n\");\n"
    ++ "  printf(\"job_class=mint_consume\\n\");\n"
    ++ "  printf(\"N=%lu\\n\", n);\n"
    ++ "  printf(\"honesty=not_product_wire\\n\");\n"
    ++ "  printf(\"baseline=stack_live_flag_twin\\n\");\n"
    ++ "  printf(\"not_product_wire=1\\n\");\n"
    ++ "  printf(\"generated=lean_runtime_bench_stack_twin\\n\");\n"
    ++ "\n"
    ++ "  rc = contract_mint_consume_once();\n"
    ++ "  if (rc != 0) {\n"
    ++ "    fprintf(stderr, \"contract FAIL code=%d (stack twin mint/consume)\\n\", rc);\n"
    ++ "    return rc;\n"
    ++ "  }\n"
    ++ "  printf(\"contract=ok mint_consume_double_fails_closed remint_after_spent\\n\");\n"
    ++ "\n"
    ++ "  rc = run_ops(n, &sink);\n"
    ++ "  if (rc != 0) {\n"
    ++ "    fprintf(stderr, \"warmup FAIL code=%d sink=%lu\\n\", rc, (unsigned long)sink);\n"
    ++ "    return rc;\n"
    ++ "  }\n"
    ++ "  printf(\"warmup=ok\\n\");\n"
    ++ "\n"
    ++ "  t0 = wall_seconds();\n"
    ++ "  if (t0 < 0.0) {\n"
    ++ "    fprintf(stderr, \"clock_gettime failed\\n\");\n"
    ++ "    return 70;\n"
    ++ "  }\n"
    ++ "  rc = run_ops(n, &sink);\n"
    ++ "  t1 = wall_seconds();\n"
    ++ "  if (rc != 0) {\n"
    ++ "    fprintf(stderr, \"timed FAIL code=%d\\n\", rc);\n"
    ++ "    return rc;\n"
    ++ "  }\n"
    ++ "  if (t1 < 0.0) {\n"
    ++ "    fprintf(stderr, \"clock_gettime failed after timed run\\n\");\n"
    ++ "    return 71;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  elapsed = t1 - t0;\n"
    ++ "  if (elapsed <= 0.0) {\n"
    ++ "    elapsed = 1e-12;\n"
    ++ "  }\n"
    ++ "  ns_per_op = (elapsed * 1e9) / (double)n;\n"
    ++ "  ops_per_s = (double)n / elapsed;\n"
    ++ "\n"
    ++ "  printf(\"wall_seconds=%.9f\\n\", elapsed);\n"
    ++ "  printf(\"ns_per_op=%.4f\\n\", ns_per_op);\n"
    ++ "  printf(\"ops_per_s=%.2f\\n\", ops_per_s);\n"
    ++ "  printf(\"sink=%lu\\n\", (unsigned long)sink);\n"
    ++ "  printf(\"status=ok\\n\");\n"
    ++ "  return 0;\n"
    ++ "}\n"

/-- Lean-owned timed C driver text (SSOT). -/
def generatedSource : String :=
  sourcePreamble ++ sourceTwinOps ++ sourceContractAndLoop ++ sourceMain

/-- Required stack live-flag / arm / loop tokens. -/
def requiredTokens : List String := [
  "arm=R-stack-twin",
  "stack_twin_token",
  "uint8_t live",
  "twin_mint",
  "twin_consume",
  "twin_init",
  "run_ops",
  "for (i = 0; i < n; i++)",
  "CLOCK_MONOTONIC",
  "clock_gettime",
  "not_product_wire",
  "remint_after_spent"
]

/-- Product API / heap tokens the twin must not emit. -/
def forbiddenTokens : List String := [
  "malloc(",
  "calloc(",
  "realloc(",
  "slake_",
  "slake_freestanding.h"
]

def hasAllRequired (src : String) : Bool :=
  requiredTokens.all (fun t => containsStr src t)

def hasNoForbidden (src : String) : Bool :=
  forbiddenTokens.all (fun t => !(containsStr src t))

/-- Decidable protocol check on the generated driver text. -/
def stackTwinProtocolOk : Bool :=
  hasAllRequired generatedSource && hasNoForbidden generatedSource

/-- Generated source satisfies the stack mint twin protocol.
    Greppable: stackTwinProtocolOk_true. -/
theorem stackTwinProtocolOk_true : stackTwinProtocolOk = true := by
  native_decide

/-! ### Assert-only fail theorems (today's functions; no statement change above)

  These lock the reject side of hasAllRequired / hasNoForbidden.
  Not a second red of stackTwinProtocolOk_true.
-/

/-- Empty haystack is missing every required token. -/
theorem hasAllRequired_empty_false : hasAllRequired "" = false := by
  native_decide

/-- Same generated text with remint_after_spent stripped fails required tokens. -/
def sourceMissingRemint : String :=
  generatedSource.replace "remint_after_spent" "remint_omitted"

theorem hasAllRequired_missing_remint_false :
    hasAllRequired sourceMissingRemint = false := by
  native_decide

/-- malloc( is a forbidden heap token. -/
theorem hasNoForbidden_malloc_call_false :
    hasNoForbidden "malloc(" = false := by
  native_decide

/-- slake_mint is a forbidden product API stem (slake_). -/
theorem hasNoForbidden_slake_mint_false :
    hasNoForbidden "slake_mint" = false := by
  native_decide

/-- Required token list is non-empty (walk cannot vacuously pass). -/
theorem requiredTokens_nonempty : requiredTokens.length > 0 := by
  native_decide

theorem stageId_eq : stageId = "RUNTIME-BENCH-STACK-TWIN" :=
  rfl

theorem generatedRelPath_eq : generatedRelPath = "out/runtime-bench/stack_twin.c" :=
  rfl

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Write the generated timed C driver under root/out/runtime-bench/stack_twin.c. -/
def writeGenerated (root : System.FilePath) : IO Unit := do
  unless stackTwinProtocolOk do
    IO.eprintln s!"error: {stageId}: stackTwinProtocolOk false"
    throw (IO.userError "stackTwinProtocolOk false")
  let outDir := root / "out" / "runtime-bench"
  let outC := outDir / "stack_twin.c"
  IO.println s!"== {stageId}: write stack live-flag twin =="
  IO.FS.createDirAll outDir
  IO.FS.writeFile outC generatedSource
  let written <- IO.FS.readFile outC
  if written != generatedSource then
    IO.eprintln "error: generated stack twin content mismatch"
    throw (IO.userError "generated mismatch")
  unless hasAllRequired written && hasNoForbidden written do
    IO.eprintln "error: written stack twin failed protocol tokens"
    throw (IO.userError "written protocol")
  IO.println s!"wrote {outC} ({written.length})"

/-- CLI: write generated driver under repo root (default .). -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    writeGenerated root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.RuntimeBenchStackTwin
