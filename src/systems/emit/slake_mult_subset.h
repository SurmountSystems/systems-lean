/* MULT-SUBSET-EMIT / SLAKE_MULT_SUBSET_EMIT_V0
 * Host-built Mult subset freestanding C (bootstrap S2).
 * Input: SLAKE_FIRST_SURFACE_MULT (S1 FirstSurface).
 * Dialect: HOST-EMIT-MULT (EmitMult; no second Mult dialect).
 * Not full freestanding API dialect rewrite; Mult unit package only.
 * Lake host remains (StillUsesLake / DependsOnLake).
 * RUNTIME-FS; no product GC on this Mult subset package.
 */

/* ---- Mult (Mult.slake) ----
 * MULT-0 / MULT-1 / MULT-OMEGA only. FAIL-CLOSED-UNKNOWN-GRADE.
 * HOST-EMIT-MULT: dialect from SystemsLean.EmitMult + host_emit_mult.ssot.txt
 * (Lean FreestandingEmit embeds this Mult product text).
 */
enum slake_mult {
  SLAKE_MULT_0 = 0,     /* MULT-0 */
  SLAKE_MULT_1 = 1,     /* MULT-1 */
  SLAKE_MULT_OMEGA = 2  /* MULT-OMEGA */
};

/* 1 if m is one of MULT-0 / MULT-1 / MULT-OMEGA; 0 otherwise (fail closed).
 * Canonical UNIT_DEEPEN_V1 map name: slake_mult_is_valid (alias multIsValid).
 */
int slake_mult_is_valid(enum slake_mult m);
/* Alias of slake_mult_is_valid (UNIT_TRANSLATION_V0 name). */
int slake_mult_is_known(enum slake_mult m);

/* Greppable grade name: "MULT-0" | "MULT-1" | "MULT-OMEGA" | 0 if unknown. */
const char *slake_mult_name(enum slake_mult m);
