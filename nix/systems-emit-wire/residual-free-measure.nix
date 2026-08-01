# SPDX-License-Identifier: Unlicense
# Product residual free measurement (claim A) -- data only.
# Imported by ./specs.nix / used in ./default.nix on optional release surface.
#
# Greppable: PRODUCT-RESIDUAL-FREE-MEASURE, SELF-HOST-RESIDUAL-FREE-MEASURE,
# SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0
#
# What this measures (product side only; DualResidual host elaborator separate):
#   Absence of managed Lean runtime / GC / classic managed residual markers on
#   release freestanding C under out/freestanding-c when that surface is present.
# What this does NOT claim alone:
#   freestandingProductSelfHostComplete / proof complete / llvm / PROVABLY
#   nm/link of a freestanding object (source text scan only; pure Nix)
#   probe green as residual free
#   host elaborator residual free (DualResidual host remains)
#
# residualFreeClaimed may be true when measure is green AND DualResidual honesty
# + product wire honesty agree (see self-host.md SELF-HOST-RESIDUAL-FREE-MEASURE).
# Free-true wire must print product residual free honesty (not residual-remains).
{
  # Greppable measure stage ids (acceptance + DualResidual cite these).
  residualFreeMeasureStageId = "SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0";
  residualFreeMeasureHostId = "PRODUCT-RESIDUAL-FREE-MEASURE";
  residualFreeMeasureSelfHostId = "SELF-HOST-RESIDUAL-FREE-MEASURE";

  # Release paths (same as emit-product optional release).
  releaseH = "out/freestanding-c/slake_freestanding.h";
  releaseC = "out/freestanding-c/slake_freestanding.c";

  # Forbidden managed-runtime / GC residual tokens on product release source.
  # Case-sensitive exact substrings. Prefer specific symbols over bare "Lean"
  # (honesty comments may say "not Lean managed runtime").
  forbiddenManagedResidual = [
    # Classic Lean C runtime API / headers
    "lean_object"
    "lean_inc"
    "lean_dec"
    "lean_alloc_object"
    "lean_alloc_small"
    "lean_initialize"
    "lean_init_task_manager"
    "lean_runtime"
    "lean/lean.h"
    "#include <lean"
    "#include \"lean"
    "libleanrt"
    "libInit_shared"
    # Boehm / explicit GC residual
    "GC_malloc"
    "GC_gcollect"
    "GC_INIT"
    "GC_init"
    "boehm_gc"
    "libgc.so"
    # GMP often pulled by classic Lean runtime (not freestanding product)
    "#include <gmp"
    "#include \"gmp"
    "mpz_init"
    "mpq_init"
    # Managed threads / classic stdlib entrypoints that imply non-freestanding residual
    "pthread_create"
    "pthread_join"
    # Hosted libc that freestanding product wire must not pull as residual
    "#include <stdio.h>"
    "#include <stdlib.h>"
    "#include <string.h>"
    "#include <pthread.h>"
  ];

  # Required freestanding honesty markers on release when present.
  # Free-true living tip: product residual free (not residual-remains prose).
  requiredFreestandingHonesty = [
    "SLAKE_EMIT_FREESTANDING_C_V0"
    "RUNTIME-FS"
    "no product GC"
    "product residual free"
  ];
}
