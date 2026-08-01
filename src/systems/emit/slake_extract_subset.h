/* EXTRACT-SUBSET-EMIT / SLAKE_EXTRACT_SUBSET_EMIT_V0
 * Host-built Extract subset freestanding C (ideal ladder M1).
 * Input: SLAKE_EXTRACT_SUBSET_EXTRACT (COMPILE-PATH-EXTRACT / EXTRACT-RUNTIME-FS).
 * Dialect: HOST-EMIT-EXTRACT (EmitExtract; no second Extract dialect).
 * Not full freestanding API dialect rewrite; Extract unit package only.
 * Lake host remains (StillUsesLake / DependsOnLake).
 * RUNTIME-FS; FAIL_CLOSED_CHECKER_V1; no product GC on this Extract subset package.
 */

/* ---- Extract (Extract.slake / EMIT-BOUNDARY / RUNTIME-FS) ----
 * EDGE-RUNTIME / RUNTIME-CLASSIC mark stock-host managed residual (not this wire).
 * HOST-EMIT-EXTRACT: dialect from SystemsLean.EmitExtract + host_emit_extract.ssot.txt
 * (Lean FreestandingEmit embeds this Extract + FAIL_CLOSED product text).
 */
enum slake_extract_status {
  SLAKE_EXTRACT_OK = 0,
  SLAKE_EXTRACT_FAIL_CLOSED = 1
};

/* Runtime class tags for honesty (not a full runtime switch). */
enum slake_runtime_class {
  SLAKE_RUNTIME_FS = 0,       /* RUNTIME-FS freestanding product goal */
  SLAKE_RUNTIME_CLASSIC = 1   /* RUNTIME-CLASSIC / EDGE-RUNTIME stock host (not product) */
};

int slake_extract_status_ok(void);
/* Product wire claims RUNTIME-FS only. */
enum slake_runtime_class slake_extract_product_runtime(void);

/* FAIL_CLOSED_CHECKER_V1 -- composed checks before product extract.
 * Still not residual free; not PROVABLY; no product GC.
 */
typedef struct slake_check_bundle {
  enum slake_mult mult;
  const slake_linear_token *linear; /* required live when mult == MULT-1; else may be null */
  const slake_erased *erased;       /* required marked when mult == MULT-0; else may be null */
  enum slake_runtime_class claimed_runtime; /* must be SLAKE_RUNTIME_FS for product */
} slake_check_bundle;

/* Fail-closed checker: SLAKE_EXTRACT_OK (0) or SLAKE_EXTRACT_FAIL_CLOSED (1).
 * Rules:
 *  - mult must pass slake_mult_is_valid
 *  - MULT-1: linear non-null AND live (check-only; do not consume here)
 *  - MULT-0: erased non-null AND slake_erasure_is_runtime_absent == 1
 *  - MULT-OMEGA: linear/erased may be null (unrestricted)
 *  - claimed_runtime must be SLAKE_RUNTIME_FS (fail closed on CLASSIC / EDGE-RUNTIME product claim)
 *  - null bundle -> FAIL_CLOSED
 * Document return codes exactly matching body.
 * Greppable: FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS
 */
int slake_check_fail_closed(const slake_check_bundle *b);

/* Extract path: run checker; on OK write *out_rt = SLAKE_RUNTIME_FS and return OK;
 * on fail leave *out_rt untouched.
 * null out_rt on success path is FAIL_CLOSED.
 * Greppable: FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS
 */
int slake_extract_with_checks(const slake_check_bundle *b, enum slake_runtime_class *out_rt);
