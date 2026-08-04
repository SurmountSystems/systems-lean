# Modular just: just/subset-rebuild.just -- role recipes (import into root justfile).
# M1 Graph subset rebuild / self-application: M1 Graph package identity
# -> re-emit/re-validate Graph unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: graph-subset-rebuild, slake-graph-subset-rebuild, GRAPH-SUBSET-REBUILD,
# SLAKE_GRAPH_SUBSET_REBUILD, graphSubsetRebuildReady, graphSubsetRebuildSelfApplyOk.
graph-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_graph_subset.h"
    out_c="$emit_dir/slake_graph_subset.c"
    echo "== graph-subset-rebuild (M1 Graph subset self-application) =="
    echo "  input: SLAKE_GRAPH_SUBSET_EMIT_V0 / graphSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Graph unit package; graphSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/GraphSubsetRebuild.lean"
    main_mod="$lean_dir/GraphSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildReady' "$mod"; then
      echo "error: missing graphSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing graphSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildWrite' "$mod"; then
      echo "error: missing graphSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_GRAPH_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; graph-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-graph-subset-rebuild
      lake exe slake-graph-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Graph subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Graph subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in GRAPH-SUBSET-EMIT SLAKE_GRAPH_SUBSET_EMIT_V0 SLAKE_GRAPH_SUBSET_GRAPH HOST-EMIT-GRAPH IR_GRAPH_EDGES_V0 SLAKE_IR_EDGE_MAX; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_ir_graph' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_ir_graph" >&2
      exit 1
    fi
    if ! grep -qF 'slake_ir_graph_add_edge' "$out_c"; then
      echo "error: $out_c missing slake_ir_graph_add_edge" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildReady' "$mod"; then
      echo "error: graphSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_GRAPH_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "graph-subset-rebuild: GREEN (M1 Graph subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# M1 Erasure subset rebuild / self-application: M1 Erasure package identity
# -> re-emit/re-validate Erasure unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: erasure-subset-rebuild, slake-erasure-subset-rebuild, ERASURE-SUBSET-REBUILD,
# SLAKE_ERASURE_SUBSET_REBUILD, erasureSubsetRebuildReady, erasureSubsetRebuildSelfApplyOk.
erasure-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_erasure_subset.h"
    out_c="$emit_dir/slake_erasure_subset.c"
    echo "== erasure-subset-rebuild (M1 Erasure subset self-application) =="
    echo "  input: SLAKE_ERASURE_SUBSET_EMIT_V0 / erasureSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Erasure unit package; erasureSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/ErasureSubsetRebuild.lean"
    main_mod="$lean_dir/ErasureSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildReady' "$mod"; then
      echo "error: missing erasureSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing erasureSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildWrite' "$mod"; then
      echo "error: missing erasureSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_ERASURE_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_ERASURE_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; erasure-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-erasure-subset-rebuild
      lake exe slake-erasure-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Erasure subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Erasure subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in ERASURE-SUBSET-EMIT SLAKE_ERASURE_SUBSET_EMIT_V0 SLAKE_ERASURE_SUBSET_ERASURE HOST-EMIT-ERASURE ERASE-RULE-MULT-0 ERASE-NO-RUNTIME; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_erased' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_erased" >&2
      exit 1
    fi
    if ! grep -qF 'slake_erased_mark' "$out_c"; then
      echo "error: $out_c missing slake_erased_mark" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildReady' "$mod"; then
      echo "error: erasureSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_ERASURE_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_ERASURE_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "erasure-subset-rebuild: GREEN (M1 Erasure subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# M1 Extract subset rebuild / self-application: M1 Extract package identity
# -> re-emit/re-validate Extract unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: extract-subset-rebuild, slake-extract-subset-rebuild, EXTRACT-SUBSET-REBUILD,
# SLAKE_EXTRACT_SUBSET_REBUILD, extractSubsetRebuildReady, extractSubsetRebuildSelfApplyOk.
extract-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_extract_subset.h"
    out_c="$emit_dir/slake_extract_subset.c"
    echo "== extract-subset-rebuild (M1 Extract subset self-application) =="
    echo "  input: SLAKE_EXTRACT_SUBSET_EMIT_V0 / extractSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Extract unit package; extractSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/ExtractSubsetRebuild.lean"
    main_mod="$lean_dir/ExtractSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildReady' "$mod"; then
      echo "error: missing extractSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing extractSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildWrite' "$mod"; then
      echo "error: missing extractSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_EXTRACT_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_EXTRACT_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; extract-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-extract-subset-rebuild
      lake exe slake-extract-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Extract subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Extract subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in EXTRACT-SUBSET-EMIT SLAKE_EXTRACT_SUBSET_EMIT_V0 SLAKE_EXTRACT_SUBSET_EXTRACT HOST-EMIT-EXTRACT FAIL_CLOSED_CHECKER_V1; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'enum slake_extract_status' "$out_h"; then
      echo "error: $out_h missing enum slake_extract_status" >&2
      exit 1
    fi
    if ! grep -qF 'slake_extract_with_checks' "$out_c"; then
      echo "error: $out_c missing slake_extract_with_checks" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildReady' "$mod"; then
      echo "error: extractSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_EXTRACT_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_EXTRACT_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "extract-subset-rebuild: GREEN (M1 Extract subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# M1 Program subset rebuild / self-application: M1 Program package identity
# -> re-emit/re-validate Program unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: program-subset-rebuild, slake-program-subset-rebuild, PROGRAM-SUBSET-REBUILD,
# SLAKE_PROGRAM_SUBSET_REBUILD, programSubsetRebuildReady, programSubsetRebuildSelfApplyOk.
program-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_program_subset.h"
    out_c="$emit_dir/slake_program_subset.c"
    echo "== program-subset-rebuild (M1 Program subset self-application) =="
    echo "  input: SLAKE_PROGRAM_SUBSET_EMIT_V0 / programSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Program unit package; programSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/ProgramSubsetRebuild.lean"
    main_mod="$lean_dir/ProgramSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildReady' "$mod"; then
      echo "error: missing programSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing programSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildWrite' "$mod"; then
      echo "error: missing programSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_PROGRAM_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; program-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-program-subset-rebuild
      lake exe slake-program-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Program subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Program subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in PROGRAM-SUBSET-EMIT SLAKE_PROGRAM_SUBSET_EMIT_V0 SLAKE_PROGRAM_SUBSET_PROGRAM HOST-EMIT-PROGRAM IR_PROGRAM_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_ir_program' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_ir_program" >&2
      exit 1
    fi
    if ! grep -qF 'slake_ir_program_init' "$out_c"; then
      echo "error: $out_c missing slake_ir_program_init" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildReady' "$mod"; then
      echo "error: programSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_PROGRAM_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "program-subset-rebuild: GREEN (M1 Program subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# M1 Linear subset rebuild / self-application: M1 Linear package identity
# -> re-emit/re-validate Linear unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: linear-subset-rebuild, slake-linear-subset-rebuild, LINEAR-SUBSET-REBUILD,
# SLAKE_LINEAR_SUBSET_REBUILD, linearSubsetRebuildReady, linearSubsetRebuildSelfApplyOk.
linear-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_linear_subset.h"
    out_c="$emit_dir/slake_linear_subset.c"
    echo "== linear-subset-rebuild (M1 Linear subset self-application) =="
    echo "  input: SLAKE_LINEAR_SUBSET_EMIT_V0 / linearSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Linear unit package; linearSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/LinearSubsetRebuild.lean"
    main_mod="$lean_dir/LinearSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildReady' "$mod"; then
      echo "error: missing linearSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing linearSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildWrite' "$mod"; then
      echo "error: missing linearSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_LINEAR_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; linear-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-linear-subset-rebuild
      lake exe slake-linear-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Linear subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Linear subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in LINEAR-SUBSET-EMIT SLAKE_LINEAR_SUBSET_EMIT_V0 SLAKE_LINEAR_SUBSET_LINEAR HOST-EMIT-LINEAR LINEAR-EXACT-ONCE; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_linear_token' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_linear_token" >&2
      exit 1
    fi
    if ! grep -qF 'slake_consume_token_consume' "$out_c"; then
      echo "error: $out_c missing slake_consume_token_consume" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildReady' "$mod"; then
      echo "error: linearSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_LINEAR_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "linear-subset-rebuild: GREEN (M1 Linear subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# Bootstrap S3 Mult subset rebuild / self-application: S2 Mult package identity
# -> re-emit/re-validate Mult unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: mult-subset-rebuild, slake-mult-subset-rebuild, MULT-SUBSET-REBUILD,
# SLAKE_MULT_SUBSET_REBUILD, multSubsetRebuildReady, multSubsetRebuildSelfApplyOk.
mult-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    echo "== mult-subset-rebuild (bootstrap S3 Mult subset self-application) =="
    echo "  input: SLAKE_MULT_SUBSET_EMIT_V0 / multSubsetEmitReady (S2 package identity)"
    echo "  output: re-emit/re-validate Mult unit package; multSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/MultSubsetRebuild.lean"
    main_mod="$lean_dir/MultSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildReady' "$mod"; then
      echo "error: missing multSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing multSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWrite' "$mod"; then
      echo "error: missing multSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing S2 package input pin SLAKE_MULT_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing multSubsetRebuildWithoutLakeFinishedClaimed pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing multSubsetRebuildWithoutLakeKeepsHostLake (M2 keeps product Lake) in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; mult-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-mult-subset-rebuild
      lake exe slake-mult-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in MULT-SUBSET-EMIT SLAKE_MULT_SUBSET_EMIT_V0 SLAKE_FIRST_SURFACE_MULT HOST-EMIT-MULT MULT-0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'enum slake_mult' "$out_h"; then
      echo "error: $out_h missing enum slake_mult" >&2
      exit 1
    fi
    if ! grep -qF 'slake_mult_is_valid' "$out_c"; then
      echo "error: $out_c missing slake_mult_is_valid" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildReady' "$mod"; then
      echo "error: multSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_MULT_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "mult-subset-rebuild: GREEN (S3 Mult subset self-application measured; Lake path; product Lake remains; M2 without-Lake is just mult-subset-rebuild-without-lake; not S4; not PROVABLY/llvm)"

# Mult without-Lake prebuilt driver (ideal M2 partial / design Name A).
# Measured Mult unit package re-emit/re-validate without invoking lake on the
# hot path. A10++ HostResidualShrink inventory dual-ok owns this path.
# Prefer bin relink without lake: just host-develop-tools-clean-bootstrap
# (includes slake-mult-subset-rebuild leanc@rsp). Total .lake wipe still needs
# classic Lake once for IR+rsp: (cd src/systems && lake build slake-mult-subset-rebuild).
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# Greppable: mult-subset-rebuild-without-lake, MULT-WITHOUT-LAKE,
# multSubsetRebuildWithoutLakeFinishedClaimed, multSubsetRebuildWithoutLakeDualOk,
# measuredHostLakeFreeMultSubsetRebuild, prebuilt Mult rebuild.
mult-subset-rebuild-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    prebuilt="$systems_dir/.lake/build/bin/slake-mult-subset-rebuild"
    mod="$lean_dir/MultSubsetRebuild.lean"
    shrink="$lean_dir/HostResidualShrink.lean"
    echo "== mult-subset-rebuild-without-lake (M2/A10++ Mult measured step; no lake on hot path) =="
    echo "  input: S2 Mult package identity; prebuilt $prebuilt"
    echo "  output: re-emit/re-validate Mult unit package; dual evidence greps"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$shrink" ]]; then
      echo "error: missing $shrink" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing multSubsetRebuildWithoutLakeFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeWithoutLake' "$mod"; then
      echo "error: missing justRecipeWithoutLake pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'mult-subset-rebuild-without-lake' "$mod"; then
      echo "error: missing mult-subset-rebuild-without-lake cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing multSubsetRebuildWithoutLakeKeepsHostLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    for tok in \
      mult-subset-rebuild-without-lake \
      measuredHostLakeFreeMultSubsetRebuild \
      multSubsetRebuildWithoutLakeDualOk \
      measuredHostDevelopToolsInventory \
      host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface
    do
      if ! grep -qF "$tok" "$shrink"; then
        echo "error: missing $tok in $shrink" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def multSubsetRebuildWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$shrink"; then
      echo "error: multSubsetRebuildWithoutLakeDualOk must be true (A10++)" >&2
      exit 1
    fi
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt Mult rebuild binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-develop-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-mult-subset-rebuild)" >&2
      echo "  then re-run: just mult-subset-rebuild-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt Mult rebuild (no lake)"
    "$prebuilt" "$root"
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult subset header after without-Lake rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult subset source after without-Lake rebuild: $out_c" >&2
      exit 1
    fi
    for tok in MULT-SUBSET-EMIT SLAKE_MULT_SUBSET_EMIT_V0 SLAKE_FIRST_SURFACE_MULT HOST-EMIT-MULT MULT-0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'enum slake_mult' "$out_h"; then
      echo "error: $out_h missing enum slake_mult" >&2
      exit 1
    fi
    if ! grep -qF 'slake_mult_is_valid' "$out_c"; then
      echo "error: $out_c missing slake_mult_is_valid" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_MULT_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildReady' "$mod"; then
      echo "error: multSubsetRebuildReady missing after without-Lake rebuild (host bar)" >&2
      exit 1
    fi
    # Structural without-Lake finished pin must be true in host Lean (M2 closed).
    if ! grep -qE 'def multSubsetRebuildWithoutLakeFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: multSubsetRebuildWithoutLakeFinishedClaimed must be true for M2 without-Lake finished" >&2
      exit 1
    fi
    if ! grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: stillUsesLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: dependsOnLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    echo "mult-subset-rebuild-without-lake: GREEN (A10++ mult-subset-rebuild develop tool inventory dual-ok; no lake on hot path; host residual remains; not PROVABLY/llvm)"

# Mult freestanding deepen greps (ideal M2 Name B partial bar).
# Measured Mult freestanding package surface dual-check: freestanding product
# Mult dialect (HOST-EMIT-MULT on slake_freestanding + host_emit_mult SSOT) and
# Mult unit package (slake_mult_subset) without lake and without Mult rebuild
# prebuilt ELF as the measured greps driver. freestandingDeepenPartial true.
# Does not require freestandingDriverComplete (partial independent of design full).
# Name A prebuilt path remains valid. Product StillUsesLake/DependsOnLake stay.
# Greppable: mult-subset-freestanding-deepen, MULT-FS-DEEPEN,
# freestandingDeepenPartial, freestandingDriverComplete.
