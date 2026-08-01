/* ERASURE-SUBSET-EMIT / SLAKE_ERASURE_SUBSET_EMIT_V0
 * Host-built Erasure subset freestanding C (ideal ladder M1).
 * Input: SLAKE_ERASURE_SUBSET_ERASURE (COMPILE-PATH-ERASURE / ERASURE-FIXTURE).
 * Dialect: HOST-EMIT-ERASURE (EmitErasure; no second Erasure dialect).
 * Not full freestanding API dialect rewrite; Erasure unit package only.
 * Lake host remains (StillUsesLake / DependsOnLake).
 * RUNTIME-FS; ERASE-RULE-MULT-0; ERASE-NO-RUNTIME; no product GC on this Erasure subset package.
 */

/* ---- Erasure (Erasure.slake / ERASE-RULE-MULT-0 / ERASE-NO-RUNTIME) ----
 * Zero-payload marker for MULT-0; EDGE-PROP / ERASE-PROP imperfect on sides.
 * HOST-EMIT-ERASURE: dialect from SystemsLean.EmitErasure + host_emit_erasure.ssot.txt
 * (Lean FreestandingEmit embeds this Erasure product text).
 */
typedef struct slake_erased {
  uint8_t marked; /* 1 after mark; no product payload */
} slake_erased;

int slake_erased_mark(slake_erased *e);
int slake_erased_is_marked(const slake_erased *e);
/* 1 if non-null and marked (erased MULT-0 runtime-absent); 0 for null or unmarked.
 * Canonical UNIT_DEEPEN_V1 map name: slake_erasure_is_runtime_absent.
 * Fail closed: unmarked handles do not claim runtime absence.
 */
int slake_erasure_is_runtime_absent(const slake_erased *e);
