/* PROGRAM-SUBSET-EMIT / SLAKE_PROGRAM_SUBSET_EMIT_V0 body
 * Host-built Program subset freestanding C (ideal ladder M1).
 * Input: SLAKE_PROGRAM_SUBSET_PROGRAM; dialect HOST-EMIT-PROGRAM.
 * Not full slake_freestanding.c regenerate; Program unit only.
 * RUNTIME-FS; no product GC.
 */

/* ---- IR_PROGRAM_V0 (multi-node ordered list; not CFG; not residual free) ----
 * Collective well-typed + fail-closed over fixed-capacity node array.
 * Edges/CFG remain residual. Shared linear token across MULT-1 nodes is V0 honesty.
 * HOST-EMIT-PROGRAM: dialect from SystemsLean.EmitProgram + host_emit_program.ssot.txt
 * (Lean FreestandingEmit embeds this IR program product text).
 */

const char *slake_ir_program_id(void)
{
  return "IR_PROGRAM_V0";
}

int slake_ir_program_init(slake_ir_program *p)
{
  uint8_t i;

  if (p == 0) {
    return -1;
  }
  p->count = 0;
  p->valid = 1;
  /* Dead slots: valid=0 with consistent OMEGA+VALUE pairing (not a live node). */
  for (i = 0; i < (uint8_t)SLAKE_IR_PROGRAM_CAP; i++) {
    p->nodes[i].valid = 0;
    p->nodes[i].mult = SLAKE_MULT_OMEGA;
    p->nodes[i].kind = SLAKE_IR_KIND_VALUE;
    p->nodes[i].ty.tag = 0;
  }
  return 0;
}

int slake_ir_program_push(slake_ir_program *p, uint32_t type_tag,
                          enum slake_mult mult, enum slake_ir_kind kind)
{
  slake_ir_node tmp;

  if (p == 0 || p->valid == 0) {
    return -1;
  }
  if (p->count >= (uint8_t)SLAKE_IR_PROGRAM_CAP) {
    return -2; /* full; leave count unchanged */
  }
  /* Init into temp so a bad node never lands in the program. */
  if (slake_ir_node_init(&tmp, type_tag, mult, kind) != 0) {
    return -1;
  }
  p->nodes[p->count] = tmp;
  p->count = (uint8_t)(p->count + 1);
  return 0;
}

int slake_ir_program_is_well_typed(const slake_ir_program *p)
{
  uint8_t i;

  if (p == 0) {
    return 0;
  }
  if (p->valid == 0) {
    return 0;
  }
  /* Empty program is not well-typed as a program (fail closed). */
  if (p->count == 0) {
    return 0;
  }
  if (p->count > (uint8_t)SLAKE_IR_PROGRAM_CAP) {
    return 0;
  }
  for (i = 0; i < p->count; i++) {
    if (slake_ir_node_is_well_typed(&p->nodes[i]) != 1) {
      return 0;
    }
  }
  return 1;
}

int slake_ir_program_check_fail_closed(const slake_ir_program *p,
    const slake_linear_token *linear,
    const slake_erased *erased)
{
  uint8_t i;

  /* Null, empty, or ill-typed -> FAIL_CLOSED. */
  if (slake_ir_program_is_well_typed(p) != 1) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  for (i = 0; i < p->count; i++) {
    if (slake_ir_node_check_fail_closed(&p->nodes[i], linear, erased)
        != (int)SLAKE_EXTRACT_OK) {
      return (int)SLAKE_EXTRACT_FAIL_CLOSED;
    }
  }
  return (int)SLAKE_EXTRACT_OK;
}
