/* TYPES-SUBSET-EMIT / SLAKE_TYPES_SUBSET_EMIT_V0
 * Host-built Types subset freestanding C (ideal ladder M1).
 * Input: SLAKE_TYPES_SUBSET_TYPES (COMPILE-PATH-TYPES / TYPES-FIXTURE).
 * Dialect: HOST-EMIT-TYPES (EmitTypes; no second Types dialect).
 * Not full freestanding API dialect rewrite; Types unit package only.
 * Lake host remains (StillUsesLake / DependsOnLake).
 * RUNTIME-FS; no product GC on this Types subset package.
 */

/* ---- Types (Types.slake / COMMON-UNIVERSE) ----
 * Host elaborator residual is not product wire residual.
 * Opaque tag only; no type checker body.
 * HOST-EMIT-TYPES: dialect from SystemsLean.EmitTypes + host_emit_types.ssot.txt
 * (Lean FreestandingEmit embeds this Types product text).
 */
typedef struct slake_type_tag {
  uint32_t tag;
} slake_type_tag;

int slake_type_tag_init(slake_type_tag *t, uint32_t tag);
uint32_t slake_type_tag_get(const slake_type_tag *t);

/* ---- TYPED_IR_V0 -- richer typed IR surface behind checker/host.
 * COMMON-UNIVERSE; not residual free; not full elaborator.
 * Kind must match mult:
 *   VALUE  <-> MULT-OMEGA
 *   LINEAR <-> MULT-1
 *   ERASED <-> MULT-0
 * HOST-EMIT-TYPES: dialect from SystemsLean.EmitTypes + host_emit_types.ssot.txt
 * (Lean FreestandingEmit embeds this Types product text).
 */
enum slake_ir_kind {
  SLAKE_IR_KIND_VALUE = 0,   /* pairs with MULT-OMEGA */
  SLAKE_IR_KIND_LINEAR = 1,  /* pairs with MULT-1 */
  SLAKE_IR_KIND_ERASED = 2   /* pairs with MULT-0 */
};

typedef struct slake_ir_node {
  slake_type_tag ty;
  enum slake_mult mult;
  enum slake_ir_kind kind;
  uint8_t valid; /* 1 after successful init */
} slake_ir_node;

/* Greppable typed IR stage id: TYPED_IR_V0 */
const char *slake_typed_ir_id(void);

/* 0 ok; -1 null or invalid mult/kind pairing or type init fail.
 * Kind must match mult (VALUE/OMEGA, LINEAR/1, ERASED/0).
 * On failure leave node invalid (valid=0) if non-null.
 * Document codes matching body exactly.
 */
int slake_ir_node_init(slake_ir_node *n, uint32_t type_tag,
                       enum slake_mult mult, enum slake_ir_kind kind);

/* 1 if non-null, valid flag set, mult valid, kind matches mult; else 0 */
int slake_ir_node_is_well_typed(const slake_ir_node *n);

/* Compose FAIL_CLOSED_CHECKER_V1 from IR node.
 * MULT-1 requires non-null live linear; MULT-0 requires marked erased;
 * MULT-OMEGA linear/erased may be null; claimed_runtime always RUNTIME_FS.
 * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.
 * Greppable: TYPED_IR_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS
 */
int slake_ir_node_check_fail_closed(const slake_ir_node *n,
    const slake_linear_token *linear,
    const slake_erased *erased);
