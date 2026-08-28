# out/freestanding-c -- runtimeless product C

**Release surface:** freestanding product C (and headers) that others can build with a normal C toolchain **without** a Lean managed runtime, GC (garbage collection), or host elaborator on the link line.

Name emphasizes **runtimeless / freestanding**, not classic AOT (ahead-of-time) that still ships a runtime.

## Generated only (do not hand-author)

Tracked `*.c` / `*.h` here are **generator outputs** copied from `src/systems/emit/` (Lean `SystemsLean.FreestandingEmit`). Hand-written product C is **forbidden**; re-emit will overwrite. Systems Lean lives in Lean under `src/systems/`. Lake `.lake/build/ir/*.c` is classic Lean AOT with a managed runtime, **not** this surface. Policy: `AGENTS.md`. Ownership: `src/systems/emit/host-owned-emit.md`.

## Policy

No Lean managed runtime. **No product GC.** Refresh with `just build`. Product residual **free** and freestanding self-host **complete** are **true**. That is **not** "Lake is gone." **PROVABLY** is the CompCert product matrix in `just check`, not a speed claim. LLVM work is under `out/llvm-ir/`, not this tree. Living tip: `doc/SESSION-HANDOFF.md`. Claim board: `RESIDUAL-systems.md`.

## PROVABLY / CompCert (how to verify)

**PROVABLY** means a real resolved CompCert `ccomp` fail-closed product matrix.

**CompCert license (separate from product C):** research / non-commercial `ccomp` by default (`ref/CompCert`). Commercial CompCert needs AbsInt. Novel product C here is **Unlicense**; that does **not** license CompCert. Inventory: [LICENSES.md](../../LICENSES.md).

| Step | What |
|------|------|
| Full suite | From monorepo root: `just check` (includes `product-compcert-matrix`) |
| Matrix alone | `just product-compcert-matrix` |
| Requires | CompCert `ccomp` on `PATH` (see `doc/compcert-entry.md`) |

Do **not** treat a single object compile as PROVABLY without the matrix.

## Runtime evidence (monorepo)

No GC library and no Lean managed runtime on a consumer link. Wall-clock comparison: [doc/BENCH-RUNTIME-latest.md](../../doc/BENCH-RUNTIME-latest.md) (`just bench-runtime`). PROVABLY is wire correctness, not speed.

## Release process (minimum)

1. `just build`: regenerate emit and populate this tree.
2. `just check`: full suite green.
3. Publish **this directory** so consumers need not clone `ref/*` or the host.
4. Novel emit is Unlicense. CompCert keeps its own license.

### Consumer publish options

**Preferred: git subtree:**

```bash
# From monorepo root after green just build + just check:
git subtree push --prefix=out/freestanding-c <consumer-remote> main
git subtree split --prefix=out/freestanding-c -b freestanding-c-release
```

**Tarball:**

```bash
just export-freestanding-c
# -> .cache/systems-lean-freestanding-c-<UTC>.tar.gz
```

Treat `*.c` / `*.h` as **generated product wire**.
