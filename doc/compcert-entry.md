# CompCert entry map

Read-only upstream: `ref/CompCert/`.
Do not edit upstream as product source.

**Role for Systems Lean:** CompCert-oriented C backend path -- real `ccomp` when
built or resolved; PROVABLY only with resolved compiler + product matrix
evidence. Weaker "we ran something named ccomp once" is not PROVABLY.

---

## Start here

| Purpose | Path |
|---------|------|
| Overview / install | `ref/CompCert/README.md` |
| Manual / usage | `ref/CompCert/doc/` (when present) |
| Configure / build | `ref/CompCert/configure`, `ref/CompCert/Makefile` |
| Driver sources | `ref/CompCert/driver/` |
| C frontend / compiler passes | under `ref/CompCert/` (cfrontend, backend, ...) |
| Seal design | `doc/dev/research/compcert-product-seal-design-2026-08-02.md` |
| Seal plan | `.agents/plans/plan-compcert-product-seal.md` |
| Fail-closed smoke | `just ccomp-smoke` |
| Freestanding wire under ccomp | `just freestanding-under-ccomp` |
| Mult package under ccomp | `just mult-package-under-ccomp` |
| Named product matrix join | `just product-compcert-matrix` |
| Shared resolve (path only) | `just ccomp-resolve` |
| Matrix results note | `doc/dev/research/compcert-product-matrix-2026-08-02.md` |

---

## Resolved `ccomp` path (working resolve)

**Measured recipes:** `just ccomp-smoke` (driver smoke); `just
freestanding-under-ccomp` (product wire compile); `just
mult-package-under-ccomp` (Mult unit package compile); `just
product-compcert-matrix` (named join: smoke + full wire + Mult; fail closed).
Shared resolve: `just ccomp-resolve` (prints executable path; fail closed if
missing). Matrix log: `doc/dev/research/compcert-product-matrix-2026-08-02.md`.

Resolve order (thin just glue; greppable `COMPCERT-NIX-RESOLVE`):

1. **`COMPCERT_CCOMP`** -- operator override to any working `ccomp` binary.
2. **`ccomp` on `PATH`** -- system or user install.
3. **Flake-locked nixpkgs `compcert`** -- unfree CompCert package from this
   tree's `nixpkgs` input. Needs `nix` and `NIXPKGS_ALLOW_UNFREE=1` (recipe
   sets that for the one-shot resolve). First build may download/build; later
   runs use the store cache.

Example one-shot (same as recipe step 3):

```bash
# From repo root; prints store paths (man + main). Use .../bin/ccomp.
NIXPKGS_ALLOW_UNFREE=1 nix build --impure --no-link --print-out-paths --expr '
  let
    f = builtins.getFlake (toString ./.);
    pkgs = import f.inputs.nixpkgs {
      system = builtins.currentSystem;
      config.allowUnfree = true;
    };
  in pkgs.compcert
'
```

Then either:

```bash
export COMPCERT_CCOMP=/nix/store/...-coq9.0-compcert-3.17/bin/ccomp
just ccomp-smoke
```

or rely on auto-resolve inside `just ccomp-smoke`.

**Host inventory (2026-08-02 resolve slice):**

| Fact | Status |
|------|--------|
| Host system `coqc` / Rocq | 9.1.1 (outside bare `ref/CompCert` configure window 8.15--8.20.1) |
| Host `menhir` on PATH | not present |
| Host `ccomp` on PATH | not present (until PATH install) |
| `ref/CompCert` | present; version 3.17; read-only |
| nixpkgs `compcert` (flake lock) | works: CompCert **3.17** via Coq 9.0 package set (`coq9.0-compcert-3.17`); unfree |
| `just ccomp-smoke` | **GREEN** when step 1/2/3 resolves; exit 1 if none |
| `just freestanding-under-ccomp` | **GREEN** (2026-08-02): after `just build`, `ccomp -c` of `out/freestanding-c/slake_freestanding.c` with `-I` for header to object under TMPDIR; first-pass (no emit SSOT fix); exit 1 if resolve or compile fails |
| `just mult-package-under-ccomp` | **GREEN** (2026-08-02): `ccomp -c` of `src/systems/emit/slake_mult_subset.c` with `-I` emit dir to object under TMPDIR (~1760 bytes); MultSubsetEmit SSOT added `#include "slake_mult_subset.h"` after observed RED unbound enum; re-emit; exit 1 if package/include/resolve/compile fails |
| `just product-compcert-matrix` | **GREEN** (2026-08-02): orchestrates smoke + freestanding-under-ccomp + mult-package-under-ccomp; overall exit 0; log `doc/dev/research/compcert-product-matrix-2026-08-02.md`; evidence for PROVABLY claim |

**Alternate: build from `ref/CompCert` (optional):** configure wants Coq
**8.15--8.20.1** and **Menhir**. Prefer nixpkgs package when available; do not
edit `ref/CompCert` as product.

**License:** CompCert is **not** Unlicense. INRIA Non-Commercial and/or AbsInt
commercial; some `lib/` dual-licensed LGPL-2.1-or-later. See `LICENSES.md` and
`ref/CompCert/LICENSE`.

---

## Honest residual

| Claim | Meaning |
|-------|---------|
| CompCert path designed | Docs/architecture mention C for CompCert |
| `ccomp` resolved + smoke green | Real binary measurable (`just ccomp-smoke` exit 0) |
| Freestanding wire under ccomp | Product C compiles under that `ccomp` -- **done** (`just freestanding-under-ccomp`) |
| Mult package under ccomp | Mult subset package under that `ccomp` -- **done** (`just mult-package-under-ccomp`) |
| Product CompCert matrix | Named full wire + Mult join under `ccomp` -- **done** (`just product-compcert-matrix` GREEN; research log) |
| **PROVABLY** | Resolved `ccomp` + full product matrix + living pin + lake elaborator proof -- **claimed** 2026-08-02 (`provablyUnlocked` true in `SystemsLean/LlvmHold.lean`; surface-matrix CompCert row **PROVABLY**) |

`llvmUnlocked` stays **false** (llvm / `out/llvm-ir` deferred). Host elaborator
residual remains. Product residual free and freestanding complete living tips
unchanged.

---

## What Systems Lean uses this for

- Backend trusted computing base honesty for the CompCert-oriented C path
- Seal freestanding product C with real `ccomp` (plan-compcert-product-seal)

Not for shipping CompCert as a product of this repo.
Not for compiling Systems Lean **host** `.lean` with CompCert.
