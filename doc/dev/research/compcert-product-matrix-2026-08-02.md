# CompCert product matrix measured results (2026-08-02)

Kind: analysis only. Not residual free. Not PROVABLY. Not host residual free.
Not LLVM unlock. Not permission to flip `provablyUnlocked` true.

ASCII only. Plain English.

**Plan:** `.agents/plans/plan-compcert-product-seal.md` step 5
**Residual Name:** Product CompCert matrix (done this slice)
**Entry map:** `doc/compcert-entry.md`
**Design:** `doc/dev/research/compcert-product-seal-design-2026-08-02.md`
**Recipe:** `just product-compcert-matrix`

---

## What was measured

Named product CompCert matrix under a **resolved** CompCert driver (`ccomp`).
Minimum rows from design: **full freestanding wire** + **Mult unit package**,
plus driver **smoke**. Hosted `cc` / behavioral probe are **not** matrix rows.

Fail-closed: any missing `ccomp`, reject, or non-zero row exit fails the matrix.

---

## Resolve path (this host)

| Field | Value |
|-------|--------|
| Resolve order | COMPCERT_CCOMP, PATH, flake nixpkgs.compcert (unfree) |
| Path used | `/nix/store/ls5957lhw0s4j56yybpvncmr873dkinh-coq9.0-compcert-3.17/bin/ccomp` |
| Version string | `The CompCert C verified compiler, version 3.17` |
| Resolve recipe | `just ccomp-resolve` (shared; greppable COMPCERT-NIX-RESOLVE) |

License: CompCert is **not** Unlicense (INRIA-NC / AbsInt commercial; see
`LICENSES.md`, `ref/CompCert/LICENSE`).

---

## Matrix table

Measured with `just product-compcert-matrix` from repo root
`/home/hunter/Projects/ai/iso` on 2026-08-02. Overall **exit 0**.

| Row | Recipe | Exit | Artifact / note |
|-----|--------|------|-----------------|
| Driver smoke | `just ccomp-smoke` | **0** | `ccomp -version` prints CompCert 3.17; no object |
| Full freestanding wire | `just freestanding-under-ccomp` | **0** | After `just build`: `ccomp -c -I out/freestanding-c` of `out/freestanding-c/slake_freestanding.c` -> `/tmp/slake_freestanding_under_ccomp.o` (**15720** bytes ELF relocatable) |
| Mult unit package | `just mult-package-under-ccomp` | **0** | `ccomp -c -I src/systems/emit` of `src/systems/emit/slake_mult_subset.c` -> `/tmp/slake_mult_subset_under_ccomp.o` (**1760** bytes ELF relocatable); package includes `#include "slake_mult_subset.h"` (MultSubsetEmit SSOT) |
| **Join (matrix)** | `just product-compcert-matrix` | **0** | Orchestrates smoke + full wire + Mult; fail closed; not PROVABLY |

No additional unit rows claimed this slice (design minimum only).

---

## How to re-run

```bash
cd /home/hunter/Projects/ai/iso
just product-compcert-matrix
# optional focused rows:
just ccomp-smoke
just freestanding-under-ccomp
just mult-package-under-ccomp
```

Override binary if needed:

```bash
export COMPCERT_CCOMP=/path/to/ccomp
just product-compcert-matrix
```

---

## Honesty (unchanged)

| Claim | Status after this slice |
|-------|-------------------------|
| Product residual free | true (unchanged) |
| Freestanding product self-host complete | true (unchanged) |
| Product StillUsesLake / DependsOnLake | false (unchanged) |
| Host elaborator residual | remains (unchanged) |
| `provablyUnlocked` | **false** (`SystemsLean.LlvmHold`; HOST-PROVABLY-HOLD) |
| Surface-matrix CompCert row | **measured** (ccomp resolved; wire + Mult green under ccomp; **not** PROVABLY) |
| LLVM / `out/llvm-ir` | held |
| PROVABLY | **not claimed** -- next residual only with operator want + lake proof + pin flip |

---

## Next residual

**PROVABLY evidence residual** (plan step 6): only when operator wants the
claim; living pin flip with lake elaborator proof + residual Done when; never
forge early. Matrix green alone is **not** PROVABLY.

---

## Success for this matrix slice

1. Named rows full wire + Mult (+ smoke) under resolved `ccomp`.
2. `just product-compcert-matrix` exit 0.
3. This note logs exit codes / object paths / resolve path.
4. free/complete/host residual honesty unchanged; `provablyUnlocked` false.
5. surface-matrix CompCert row measured, not PROVABLY.
