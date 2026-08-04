# Modular just: just/subset-emit.just -- role recipes (import into root justfile).
# product-wire regenerate; not S3 self-application; not S4 Lake retire.
# Greppable: first-surface, slake-first-surface, FIRST-SURFACE,
# SLAKE_FIRST_SURFACE, SLAKE_FIRST_SURFACE_MULT, firstSurfaceReady.
# Without-Lake hot path: just first-surface-without-lake (A10+++; prebuilt ELF).
# Prefer bin relink without lake: just host-develop-tools-clean-bootstrap.
first-surface:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    echo "== first-surface (bootstrap S1 Mult unit compiler surface; Lake path) =="
    echo "  input: SLAKE_FIRST_SURFACE_MULT (COMPILE-PATH-MULT / MULT-FIXTURE)"
    echo "  output: firstSurfaceReady (unitCompileReady + HOST-EMIT-MULT); Lake host remains"
    echo "  without-Lake: just first-surface-without-lake (A10+++ inventory dual-ok)"
    mod="$lean_dir/FirstSurface.lean"
    main_mod="$lean_dir/FirstSurfaceMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'firstSurfaceReady' "$mod"; then
      echo "error: missing firstSurfaceReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_FIRST_SURFACE_MULT' "$mod"; then
      echo "error: missing SLAKE_FIRST_SURFACE_MULT in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; first-surface requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-first-surface
      lake exe slake-first-surface
    )
    echo "first-surface: GREEN (S1 Mult unit input -> structural readiness; Lake host remains; not S3/S4; not PROVABLY/llvm)"

# Bootstrap S2 Mult subset freestanding emit: S1 Mult input identity -> written
# Mult unit package (slake_mult_subset.{h,c}) reusing HOST-EMIT-MULT dialect.
# Not full freestanding API dialect rewrite as sole success. Lake host remains.
# Greppable: mult-subset-emit, slake-mult-subset-emit, MULT-SUBSET-EMIT,
# SLAKE_MULT_SUBSET_EMIT, multSubsetEmitReady, slake_mult_subset.h.
mult-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    echo "== mult-subset-emit (bootstrap S2 Mult subset freestanding emit) =="
    echo "  input: SLAKE_FIRST_SURFACE_MULT (S1 FirstSurface)"
    echo "  output: Mult unit package slake_mult_subset.h/.c (HOST-EMIT-MULT); Lake host remains"
    mod="$lean_dir/MultSubsetEmit.lean"
    main_mod="$lean_dir/MultSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetEmitReady' "$mod"; then
      echo "error: missing multSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_FIRST_SURFACE_MULT' "$mod"; then
      echo "error: missing SLAKE_FIRST_SURFACE_MULT in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetEmitWrite' "$mod"; then
      echo "error: missing multSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; mult-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-mult-subset-emit
      lake exe slake-mult-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult subset source after emit: $out_c" >&2
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
    echo "mult-subset-emit: GREEN (S2 Mult unit package wrote; subset emit evidence; Lake host remains; not S3/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Linear subset freestanding emit: COMPILE-PATH-LINEAR Linear unit
# input identity -> written Linear unit package (slake_linear_subset.{h,c}) reusing
# HOST-EMIT-LINEAR dialect. Not full freestanding API dialect rewrite as sole
# success. Lake host remains.
# Greppable: linear-subset-emit, slake-linear-subset-emit, LINEAR-SUBSET-EMIT,
# SLAKE_LINEAR_SUBSET_EMIT, linearSubsetEmitReady, slake_linear_subset.h.
linear-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_linear_subset.h"
    out_c="$emit_dir/slake_linear_subset.c"
    echo "== linear-subset-emit (ideal ladder M1 Linear subset freestanding emit) =="
    echo "  input: SLAKE_LINEAR_SUBSET_LINEAR (COMPILE-PATH-LINEAR / LINEAR-FIXTURE)"
    echo "  output: Linear unit package slake_linear_subset.h/.c (HOST-EMIT-LINEAR); Lake host remains"
    mod="$lean_dir/LinearSubsetEmit.lean"
    main_mod="$lean_dir/LinearSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetEmitReady' "$mod"; then
      echo "error: missing linearSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_LINEAR' "$mod"; then
      echo "error: missing SLAKE_LINEAR_SUBSET_LINEAR in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetEmitWrite' "$mod"; then
      echo "error: missing linearSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; linear-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-linear-subset-emit
      lake exe slake-linear-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Linear subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Linear subset source after emit: $out_c" >&2
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
    echo "linear-subset-emit: GREEN (M1 Linear unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Types subset freestanding emit: COMPILE-PATH-TYPES Types unit
# input identity -> written Types unit package (slake_types_subset.{h,c}) reusing
# HOST-EMIT-TYPES dialect. Not full freestanding API dialect rewrite as sole
# success. Lake host remains.
# Greppable: types-subset-emit, slake-types-subset-emit, TYPES-SUBSET-EMIT,
# SLAKE_TYPES_SUBSET_EMIT, typesSubsetEmitReady, slake_types_subset.h.
types-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_types_subset.h"
    out_c="$emit_dir/slake_types_subset.c"
    echo "== types-subset-emit (ideal ladder M1 Types subset freestanding emit) =="
    echo "  input: SLAKE_TYPES_SUBSET_TYPES (COMPILE-PATH-TYPES / TYPES-FIXTURE)"
    echo "  output: Types unit package slake_types_subset.h/.c (HOST-EMIT-TYPES); Lake host remains"
    mod="$lean_dir/TypesSubsetEmit.lean"
    main_mod="$lean_dir/TypesSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetEmitReady' "$mod"; then
      echo "error: missing typesSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_TYPES' "$mod"; then
      echo "error: missing SLAKE_TYPES_SUBSET_TYPES in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetEmitWrite' "$mod"; then
      echo "error: missing typesSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; types-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-types-subset-emit
      lake exe slake-types-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Types subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Types subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in TYPES-SUBSET-EMIT SLAKE_TYPES_SUBSET_EMIT_V0 SLAKE_TYPES_SUBSET_TYPES HOST-EMIT-TYPES TYPED_IR_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_type_tag' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_type_tag" >&2
      exit 1
    fi
    if ! grep -qF 'slake_type_tag_init' "$out_c"; then
      echo "error: $out_c missing slake_type_tag_init" >&2
      exit 1
    fi
    echo "types-subset-emit: GREEN (M1 Types unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# M1 Types subset rebuild / self-application: M1 Types package identity
# -> re-emit/re-validate Types unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: types-subset-rebuild, slake-types-subset-rebuild, TYPES-SUBSET-REBUILD,
# SLAKE_TYPES_SUBSET_REBUILD, typesSubsetRebuildReady, typesSubsetRebuildSelfApplyOk.
types-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_types_subset.h"
    out_c="$emit_dir/slake_types_subset.c"
    echo "== types-subset-rebuild (M1 Types subset self-application) =="
    echo "  input: SLAKE_TYPES_SUBSET_EMIT_V0 / typesSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Types unit package; typesSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/TypesSubsetRebuild.lean"
    main_mod="$lean_dir/TypesSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildReady' "$mod"; then
      echo "error: missing typesSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing typesSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildWrite' "$mod"; then
      echo "error: missing typesSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_TYPES_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; types-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-types-subset-rebuild
      lake exe slake-types-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Types subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Types subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in TYPES-SUBSET-EMIT SLAKE_TYPES_SUBSET_EMIT_V0 SLAKE_TYPES_SUBSET_TYPES HOST-EMIT-TYPES TYPED_IR_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_type_tag' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_type_tag" >&2
      exit 1
    fi
    if ! grep -qF 'slake_type_tag_init' "$out_c"; then
      echo "error: $out_c missing slake_type_tag_init" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildReady' "$mod"; then
      echo "error: typesSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_TYPES_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "types-subset-rebuild: GREEN (M1 Types subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# Ideal ladder M1 Program subset freestanding emit: COMPILE-PATH-PROGRAM Program unit
# input identity -> written Program unit package (slake_program_subset.{h,c}) reusing
# HOST-EMIT-PROGRAM dialect. Not full freestanding API dialect rewrite as sole
# success. Lake host remains.
# Greppable: program-subset-emit, slake-program-subset-emit, PROGRAM-SUBSET-EMIT,
# SLAKE_PROGRAM_SUBSET_EMIT, programSubsetEmitReady, slake_program_subset.h.
program-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_program_subset.h"
    out_c="$emit_dir/slake_program_subset.c"
    echo "== program-subset-emit (ideal ladder M1 Program subset freestanding emit) =="
    echo "  input: SLAKE_PROGRAM_SUBSET_PROGRAM (COMPILE-PATH-PROGRAM / PROGRAM-FIXTURE)"
    echo "  output: Program unit package slake_program_subset.h/.c (HOST-EMIT-PROGRAM); Lake host remains"
    mod="$lean_dir/ProgramSubsetEmit.lean"
    main_mod="$lean_dir/ProgramSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetEmitReady' "$mod"; then
      echo "error: missing programSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_PROGRAM' "$mod"; then
      echo "error: missing SLAKE_PROGRAM_SUBSET_PROGRAM in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetEmitWrite' "$mod"; then
      echo "error: missing programSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; program-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-program-subset-emit
      lake exe slake-program-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Program subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Program subset source after emit: $out_c" >&2
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
    echo "program-subset-emit: GREEN (M1 Program unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Extract subset freestanding emit: fixed Extract gate input
# (COMPILE-PATH-EXTRACT / extractRuntimeFsGateReady) -> Extract unit package write
# under emit/ (HOST-EMIT-EXTRACT dialect). Not full freestanding dialect rewrite.
# Greppable: extract-subset-emit, slake-extract-subset-emit, EXTRACT-SUBSET-EMIT,
# SLAKE_EXTRACT_SUBSET_EMIT, extractSubsetEmitReady, slake_extract_subset.h.
extract-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_extract_subset.h"
    out_c="$emit_dir/slake_extract_subset.c"
    echo "== extract-subset-emit (ideal ladder M1 Extract subset freestanding emit) =="
    echo "  input: SLAKE_EXTRACT_SUBSET_EXTRACT (COMPILE-PATH-EXTRACT / EXTRACT-RUNTIME-FS)"
    echo "  output: Extract unit package slake_extract_subset.h/.c (HOST-EMIT-EXTRACT); Lake host remains"
    mod="$lean_dir/ExtractSubsetEmit.lean"
    main_mod="$lean_dir/ExtractSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetEmitReady' "$mod"; then
      echo "error: missing extractSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_EXTRACT_SUBSET_EXTRACT' "$mod"; then
      echo "error: missing SLAKE_EXTRACT_SUBSET_EXTRACT in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetEmitWrite' "$mod"; then
      echo "error: missing extractSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; extract-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-extract-subset-emit
      lake exe slake-extract-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Extract subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Extract subset source after emit: $out_c" >&2
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
    echo "extract-subset-emit: GREEN (M1 Extract unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Erasure subset freestanding emit: COMPILE-PATH-ERASURE Erasure
# unit input identity -> written Erasure unit package (slake_erasure_subset.{h,c})
# reusing HOST-EMIT-ERASURE dialect. Not full freestanding API dialect rewrite as
# sole success. Lake host remains.
# Greppable: erasure-subset-emit, slake-erasure-subset-emit, ERASURE-SUBSET-EMIT,
# SLAKE_ERASURE_SUBSET_EMIT, erasureSubsetEmitReady, slake_erasure_subset.h.
erasure-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_erasure_subset.h"
    out_c="$emit_dir/slake_erasure_subset.c"
    echo "== erasure-subset-emit (ideal ladder M1 Erasure subset freestanding emit) =="
    echo "  input: SLAKE_ERASURE_SUBSET_ERASURE (COMPILE-PATH-ERASURE / ERASURE-FIXTURE)"
    echo "  output: Erasure unit package slake_erasure_subset.h/.c (HOST-EMIT-ERASURE); Lake host remains"
    mod="$lean_dir/ErasureSubsetEmit.lean"
    main_mod="$lean_dir/ErasureSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetEmitReady' "$mod"; then
      echo "error: missing erasureSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_ERASURE_SUBSET_ERASURE' "$mod"; then
      echo "error: missing SLAKE_ERASURE_SUBSET_ERASURE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetEmitWrite' "$mod"; then
      echo "error: missing erasureSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; erasure-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-erasure-subset-emit
      lake exe slake-erasure-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Erasure subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Erasure subset source after emit: $out_c" >&2
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
    if ! grep -qF 'slake_erasure_is_runtime_absent' "$out_c"; then
      echo "error: $out_c missing slake_erasure_is_runtime_absent" >&2
      exit 1
    fi
    echo "erasure-subset-emit: GREEN (M1 Erasure unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Graph subset freestanding emit: COMPILE-PATH-GRAPH Graph
# unit input identity -> written Graph unit package (slake_graph_subset.{h,c})
# reusing HOST-EMIT-GRAPH dialect. Not full freestanding API dialect rewrite as
# sole success. Lake host remains.
# Greppable: graph-subset-emit, slake-graph-subset-emit, GRAPH-SUBSET-EMIT,
# SLAKE_GRAPH_SUBSET_EMIT, graphSubsetEmitReady, slake_graph_subset.h.
graph-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_graph_subset.h"
    out_c="$emit_dir/slake_graph_subset.c"
    echo "== graph-subset-emit (ideal ladder M1 Graph subset freestanding emit) =="
    echo "  input: SLAKE_GRAPH_SUBSET_GRAPH (COMPILE-PATH-GRAPH / GRAPH-FIXTURE)"
    echo "  output: Graph unit package slake_graph_subset.h/.c (HOST-EMIT-GRAPH); Lake host remains"
    mod="$lean_dir/GraphSubsetEmit.lean"
    main_mod="$lean_dir/GraphSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetEmitReady' "$mod"; then
      echo "error: missing graphSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_GRAPH' "$mod"; then
      echo "error: missing SLAKE_GRAPH_SUBSET_GRAPH in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetEmitWrite' "$mod"; then
      echo "error: missing graphSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; graph-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-graph-subset-emit
      lake exe slake-graph-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Graph subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Graph subset source after emit: $out_c" >&2
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
    echo "graph-subset-emit: GREEN (M1 Graph unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Compose subset freestanding emit: COMPILE-PATH-COMPOSE Compose
# unit input identity -> written Compose unit package (slake_compose_subset.{h,c})
# reusing HOST-EMIT-COMPOSE dialect. Not full freestanding API dialect rewrite as
# sole success. Lake host remains.
# Greppable: compose-subset-emit, slake-compose-subset-emit, COMPOSE-SUBSET-EMIT,
# SLAKE_COMPOSE_SUBSET_EMIT, composeSubsetEmitReady, slake_compose_subset.h.
compose-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_compose_subset.h"
    out_c="$emit_dir/slake_compose_subset.c"
    echo "== compose-subset-emit (ideal ladder M1 Compose subset freestanding emit) =="
    echo "  input: SLAKE_COMPOSE_SUBSET_COMPOSE (COMPILE-PATH-COMPOSE / COMPOSE-FIXTURE)"
    echo "  output: Compose unit package slake_compose_subset.h/.c (HOST-EMIT-COMPOSE); Lake host remains"
    mod="$lean_dir/ComposeSubsetEmit.lean"
    main_mod="$lean_dir/ComposeSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetEmitReady' "$mod"; then
      echo "error: missing composeSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_COMPOSE' "$mod"; then
      echo "error: missing SLAKE_COMPOSE_SUBSET_COMPOSE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetEmitWrite' "$mod"; then
      echo "error: missing composeSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; compose-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-compose-subset-emit
      lake exe slake-compose-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Compose subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Compose subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in COMPOSE-SUBSET-EMIT SLAKE_COMPOSE_SUBSET_EMIT_V0 SLAKE_COMPOSE_SUBSET_COMPOSE HOST-EMIT-COMPOSE HOST_COMPOSE_V0 IR_GRAPH_EDGES_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_host_compose' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_host_compose" >&2
      exit 1
    fi
    if ! grep -qF 'slake_host_compose_add_edge' "$out_c"; then
      echo "error: $out_c missing slake_host_compose_add_edge" >&2
      exit 1
    fi
    if ! grep -qF 'slake_host_compose_mint' "$out_c"; then
      echo "error: $out_c missing slake_host_compose_mint" >&2
      exit 1
    fi
    echo "compose-subset-emit: GREEN (M1 Compose unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# M1 Compose subset rebuild / self-application: M1 Compose package identity
# -> re-emit/re-validate Compose unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: compose-subset-rebuild, slake-compose-subset-rebuild, COMPOSE-SUBSET-REBUILD,
# SLAKE_COMPOSE_SUBSET_REBUILD, composeSubsetRebuildReady, composeSubsetRebuildSelfApplyOk.
compose-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_compose_subset.h"
    out_c="$emit_dir/slake_compose_subset.c"
    echo "== compose-subset-rebuild (M1 Compose subset self-application) =="
    echo "  input: SLAKE_COMPOSE_SUBSET_EMIT_V0 / composeSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Compose unit package; composeSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/ComposeSubsetRebuild.lean"
    main_mod="$lean_dir/ComposeSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildReady' "$mod"; then
      echo "error: missing composeSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing composeSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildWrite' "$mod"; then
      echo "error: missing composeSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_COMPOSE_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; compose-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-compose-subset-rebuild
      lake exe slake-compose-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Compose subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Compose subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in COMPOSE-SUBSET-EMIT SLAKE_COMPOSE_SUBSET_EMIT_V0 SLAKE_COMPOSE_SUBSET_COMPOSE HOST-EMIT-COMPOSE HOST_COMPOSE_V0 IR_GRAPH_EDGES_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_host_compose' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_host_compose" >&2
      exit 1
    fi
    if ! grep -qF 'slake_host_compose_add_edge' "$out_c"; then
      echo "error: $out_c missing slake_host_compose_add_edge" >&2
      exit 1
    fi
    if ! grep -qF 'slake_host_compose_mint' "$out_c"; then
      echo "error: $out_c missing slake_host_compose_mint" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildReady' "$mod"; then
      echo "error: composeSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_COMPOSE_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "compose-subset-rebuild: GREEN (M1 Compose subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"
