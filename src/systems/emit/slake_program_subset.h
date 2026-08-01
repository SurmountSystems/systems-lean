/* PROGRAM-SUBSET-EMIT / SLAKE_PROGRAM_SUBSET_EMIT_V0
 * Host-built Program subset freestanding C (ideal ladder M1).
 * Input: SLAKE_PROGRAM_SUBSET_PROGRAM (COMPILE-PATH-PROGRAM / PROGRAM-FIXTURE).
 * Dialect: HOST-EMIT-PROGRAM (EmitProgram; no second Program dialect).
 * Not full freestanding API dialect rewrite; Program unit package only.
 * Lake host remains (StillUsesLake / DependsOnLake).
 * RUNTIME-FS; no product GC on this Program subset package.
 */

/* ---- IR_PROGRAM_V0 -- multi-node ordered IR program (ordered nodes).
 * Fixed-capacity ordered list of well-typed slake_ir_node; not CFG/edges yet.
 * not residual free; not PROVABLY; no product GC.
 * Honesty: MULT-1 / MULT-0 nodes share one linear / erased handle for V0 checks
 * (checker does not consume; not a full linear resource graph).
 * Greppable: IR_PROGRAM_V0, SLAKE_IR_PROGRAM_CAP, FAIL_CLOSED_CHECKER_V1
 * HOST-EMIT-PROGRAM: dialect from SystemsLean.EmitProgram + host_emit_program.ssot.txt
 * (Lean FreestandingEmit embeds this IR program product text).
 */
#define SLAKE_IR_PROGRAM_CAP 8

typedef struct slake_ir_program {
  slake_ir_node nodes[SLAKE_IR_PROGRAM_CAP];
  uint8_t count; /* number of live slots 0..CAP */
  uint8_t valid; /* 1 after successful init */
} slake_ir_program;

/* Greppable ordered IR program stage id: IR_PROGRAM_V0 */
const char *slake_ir_program_id(void);

/* Init empty program. 0 ok; -1 null.
 * Dead slots: valid=0 with OMEGA+VALUE pairing (consistent if misread).
 */
int slake_ir_program_init(slake_ir_program *p);

/* Append a well-typed node (copies fields after node init).
 * 0 ok; -1 null/bad; -2 full (count==CAP).
 * On failure leave program count unchanged if possible.
 * Document codes matching body exactly.
 */
int slake_ir_program_push(slake_ir_program *p, uint32_t type_tag,
                          enum slake_mult mult, enum slake_ir_kind kind);

/* 1 if non-null, valid, count>=1, every live node well-typed; else 0.
 * Empty program (count==0) is NOT well-typed as a program (fail closed).
 */
int slake_ir_program_is_well_typed(const slake_ir_program *p);

/* Fail-closed check over all live nodes. For MULT-1 nodes require non-null live
 * linear token (shared host token for V0 is OK -- not consumed by check).
 * MULT-0 nodes need marked erased when checked.
 * claimed_runtime always RUNTIME_FS.
 * Empty / ill-typed program -> FAIL_CLOSED.
 * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.
 * Greppable: IR_PROGRAM_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS
 */
int slake_ir_program_check_fail_closed(const slake_ir_program *p,
    const slake_linear_token *linear,
    const slake_erased *erased);
