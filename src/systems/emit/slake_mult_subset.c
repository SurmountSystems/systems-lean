/* MULT-SUBSET-EMIT / SLAKE_MULT_SUBSET_EMIT_V0 body
 * Host-built Mult subset freestanding C (bootstrap S2).
 * Input: SLAKE_FIRST_SURFACE_MULT; dialect HOST-EMIT-MULT.
 * Not full slake_freestanding.c regenerate; Mult unit only.
 * RUNTIME-FS; no product GC.
 */

#include "slake_mult_subset.h"

/* ---- Mult (FAIL-CLOSED-UNKNOWN-GRADE) ----
 * HOST-EMIT-MULT: dialect from SystemsLean.EmitMult + host_emit_mult.ssot.txt
 * (Lean FreestandingEmit embeds this Mult product text).
 */

int slake_mult_is_valid(enum slake_mult m)
{
  if (m == SLAKE_MULT_0 || m == SLAKE_MULT_1 || m == SLAKE_MULT_OMEGA) {
    return 1;
  }
  return 0;
}

int slake_mult_is_known(enum slake_mult m)
{
  return slake_mult_is_valid(m);
}

const char *slake_mult_name(enum slake_mult m)
{
  if (m == SLAKE_MULT_0) {
    return "MULT-0";
  }
  if (m == SLAKE_MULT_1) {
    return "MULT-1";
  }
  if (m == SLAKE_MULT_OMEGA) {
    return "MULT-OMEGA";
  }
  return 0; /* unknown: fail closed; no silent coerce */
}
