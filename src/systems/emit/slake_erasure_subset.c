/* ERASURE-SUBSET-EMIT / SLAKE_ERASURE_SUBSET_EMIT_V0 body
 * Host-built Erasure subset freestanding C (ideal ladder M1).
 * Input: SLAKE_ERASURE_SUBSET_ERASURE; dialect HOST-EMIT-ERASURE.
 * Not full slake_freestanding.c regenerate; Erasure unit only.
 * RUNTIME-FS; ERASE-RULE-MULT-0; ERASE-NO-RUNTIME; no product GC.
 */

/* ---- Erasure (ERASE-RULE-MULT-0 / ERASE-NO-RUNTIME) ----
 * HOST-EMIT-ERASURE: dialect from SystemsLean.EmitErasure + host_emit_erasure.ssot.txt
 * (Lean FreestandingEmit embeds this Erasure product text).
 */

int slake_erased_mark(slake_erased *e)
{
  if (e == 0) {
    return -1;
  }
  e->marked = 1;
  return 0;
}

int slake_erased_is_marked(const slake_erased *e)
{
  if (e == 0) {
    return 0;
  }
  return (e->marked != 0) ? 1 : 0;
}

int slake_erasure_is_runtime_absent(const slake_erased *e)
{
  /* Fail closed: only marked MULT-0 handles claim runtime absence. */
  if (e == 0) {
    return 0;
  }
  if (e->marked == 0) {
    return 0;
  }
  return 1;
}
