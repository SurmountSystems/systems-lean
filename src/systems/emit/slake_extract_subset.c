/* EXTRACT-SUBSET-EMIT / SLAKE_EXTRACT_SUBSET_EMIT_V0 body
 * Host-built Extract subset freestanding C (ideal ladder M1).
 * Input: SLAKE_EXTRACT_SUBSET_EXTRACT; dialect HOST-EMIT-EXTRACT.
 * Not full slake_freestanding.c regenerate; Extract unit only.
 * RUNTIME-FS; FAIL_CLOSED_CHECKER_V1; no product GC.
 */

/* ---- Extract (EMIT-BOUNDARY / RUNTIME-FS) ----
 * HOST-EMIT-EXTRACT: dialect from SystemsLean.EmitExtract + host_emit_extract.ssot.txt
 * (Lean FreestandingEmit embeds this Extract + FAIL_CLOSED product text).
 */

int slake_extract_status_ok(void)
{
  return (int)SLAKE_EXTRACT_OK;
}

enum slake_runtime_class slake_extract_product_runtime(void)
{
  /* Product wire is RUNTIME-FS only; EDGE-RUNTIME / RUNTIME-CLASSIC stay off-wire. */
  return SLAKE_RUNTIME_FS;
}

/* ---- FAIL_CLOSED_CHECKER_V1 (composed checks + extract path) ----
 * HOST-EMIT-EXTRACT: dialect from SystemsLean.EmitExtract + host_emit_extract.ssot.txt
 * (Lean FreestandingEmit embeds this Extract + FAIL_CLOSED product text).
 */

int slake_check_fail_closed(const slake_check_bundle *b)
{
  /* null bundle -> FAIL_CLOSED */
  if (b == 0) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  /* mult must pass slake_mult_is_valid */
  if (slake_mult_is_valid(b->mult) != 1) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  /* claimed_runtime must be SLAKE_RUNTIME_FS (fail closed on CLASSIC / EDGE-RUNTIME) */
  if (b->claimed_runtime != SLAKE_RUNTIME_FS) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  if (b->mult == SLAKE_MULT_1) {
    /* MULT-1: linear non-null AND live (check-only; do not consume here) */
    if (b->linear == 0 || slake_linear_token_is_live(b->linear) != 1) {
      return (int)SLAKE_EXTRACT_FAIL_CLOSED;
    }
  } else if (b->mult == SLAKE_MULT_0) {
    /* MULT-0: erased non-null AND runtime-absent marked */
    if (b->erased == 0 || slake_erasure_is_runtime_absent(b->erased) != 1) {
      return (int)SLAKE_EXTRACT_FAIL_CLOSED;
    }
  }
  /* MULT-OMEGA: linear/erased may be null (unrestricted) */
  return (int)SLAKE_EXTRACT_OK;
}

int slake_extract_with_checks(const slake_check_bundle *b, enum slake_runtime_class *out_rt)
{
  /* Fail closed first; leave *out_rt untouched on fail. */
  if (slake_check_fail_closed(b) != (int)SLAKE_EXTRACT_OK) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  /* null out_rt on success path is FAIL_CLOSED */
  if (out_rt == 0) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  *out_rt = SLAKE_RUNTIME_FS;
  return (int)SLAKE_EXTRACT_OK;
}
