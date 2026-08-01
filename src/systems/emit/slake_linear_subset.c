/* LINEAR-SUBSET-EMIT / SLAKE_LINEAR_SUBSET_EMIT_V0 body
 * Host-built Linear subset freestanding C (ideal ladder M1).
 * Input: SLAKE_LINEAR_SUBSET_LINEAR; dialect HOST-EMIT-LINEAR.
 * Not full slake_freestanding.c regenerate; Linear unit only.
 * RUNTIME-FS; no product GC.
 */

/* ---- Linear (LINEAR-EXACT-ONCE; JOIN-ALG ConsumeToken dual anchor on sides) ----
 * HOST-EMIT-LINEAR: dialect from SystemsLean.EmitLinear + host_emit_linear.ssot.txt
 * (Lean FreestandingEmit embeds this Linear product text).
 */

const char *slake_consume_token_host_id(void)
{
  return "CONSUME_TOKEN_HOST_V0";
}

int slake_linear_token_init(slake_linear_token *tok, uint32_t id)
{
  if (tok == 0) {
    return -1;
  }
  /* id 0 is the spent sentinel; refuse so is_live matches consumability. */
  if (id == 0) {
    return -1;
  }
  tok->id = id;
  tok->live = 1;
  return 0;
}

int slake_linear_consume(slake_linear_token *tok)
{
  if (tok == 0) {
    return -1;
  }
  /* Exact-once: live flag is the authority; scrub id after spend. */
  if (tok->live == 0) {
    return -2; /* already consumed -- fail closed */
  }
  tok->live = 0;
  tok->id = 0;
  return 0;
}

int slake_linear_token_consume(slake_linear_token *tok)
{
  /* Alias: single body via call-through (same return codes as canonical). */
  return slake_linear_consume(tok);
}

int slake_linear_token_is_live(const slake_linear_token *tok)
{
  if (tok == 0) {
    return 0;
  }
  return (tok->live != 0) ? 1 : 0;
}

/* ---- CONSUME_TOKEN_HOST_V0 (JOIN-ALG ConsumeToken-class freestanding host) ----
 * mint + exact-once consume at C level; duals not reimplemented.
 * LINEAR-EXACT-ONCE / MULT-1; not residual free; not PROVABLY.
 * HOST-EMIT-LINEAR: dialect from SystemsLean.EmitLinear + host_emit_linear.ssot.txt
 * (Lean FreestandingEmit embeds this Linear product text).
 */

int slake_consume_token_init(slake_consume_token *ct)
{
  if (ct == 0) {
    return -1;
  }
  ct->token.id = 0;
  ct->token.live = 0;
  ct->state = 0; /* empty */
  return 0;
}

int slake_consume_token_mint(slake_consume_token *ct, uint32_t id)
{
  if (ct == 0) {
    return -1;
  }
  if (id == 0) {
    return -1; /* spent sentinel reserved; fail closed */
  }
  /* Key off is_live (state + token.live) so remint recovers desync. */
  if (slake_consume_token_is_live(ct) == 1) {
    return -2; /* already holds live MULT-1 token */
  }
  if (slake_linear_token_init(&ct->token, id) != 0) {
    return -1;
  }
  ct->state = 1; /* live */
  return 0;
}

int slake_consume_token_consume(slake_consume_token *ct)
{
  int rc;

  if (ct == 0) {
    return -1;
  }
  if (ct->state == 0) {
    return -1; /* empty -- never minted */
  }
  if (ct->state == 2) {
    return -2; /* already spent -- LINEAR-EXACT-ONCE fail closed */
  }
  /* state == 1 believed live: compose with linear exact-once consume */
  rc = slake_linear_consume(&ct->token);
  if (rc == 0) {
    ct->state = 2; /* spent */
  } else if (rc == -2) {
    /* Heal desync if token already spent under host that believed live. */
    ct->state = 2;
  }
  return rc;
}

int slake_consume_token_is_live(const slake_consume_token *ct)
{
  if (ct == 0) {
    return 0;
  }
  if (ct->state != 1) {
    return 0;
  }
  return (slake_linear_token_is_live(&ct->token) == 1) ? 1 : 0;
}

int slake_consume_token_check_fail_closed(const slake_consume_token *ct)
{
  slake_check_bundle b;

  if (ct == 0) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  /* Host must hold live MULT-1 (is_live); checker is check-only (no consume). */
  if (slake_consume_token_is_live(ct) != 1) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  b.mult = SLAKE_MULT_1;
  b.linear = &ct->token;
  b.erased = 0;
  b.claimed_runtime = SLAKE_RUNTIME_FS;
  return slake_check_fail_closed(&b);
}
