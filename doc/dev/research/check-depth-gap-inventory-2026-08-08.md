# Check depth gap inventory (2026-08-08)

Kind: analysis only. Not residual. Not a pin flip.
ASCII only. Plain American English.
IMPL id (bookkeeping only): `gapc2026`.

**Sources:** `HostModuleCheck*.lean`, `HostResidualShrink.lean`,
`.agents/plans/plan-fullhost-gap-close-2026-08-08.md`,
`.agents/reports/impl-fullhost-gap-close-2026-08-08.md`,
`doc/dev/research/full-elaborator-parity-design-2026-08-07.md`.

**Non-claims:** does not re-true `FullHostElaborateRemains`. Does not claim full
elaborator parity, mathlib, full LLVM backend, or product free/complete change.
Host free claimed F1 and product free/complete/PROVABLY stay as living tip.

---

## 1. Living check depth tip (measured)

| Surface | Living tip |
|---------|------------|
| Depth honesty | **PARTIAL-STRUCTURAL** for seed modules=**206** |
| Deepen bar | **FOUNDATION-KIND-SURFACE** |
| Deepen band (pre-expand) | Mult..Extract sixteen modules only (A56..A58) |
| Without-Lake recipe | `just host-module-check-without-lake` (prebuilt ELF) |
| Cold full package | `(cd src/systems && lake build)` / `just systems-lake` |
| Not claimed | Real Lean 4 kernel elaborate of defs / inductives / proof terms |

Band string (pre-expand):

```
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems
```

---

## 2. Sample table (HostModuleCheck vs cold lake)

Commands run 2026-08-08 from repo root / `src/systems`:

- `just host-module-check-without-lake` -> **exit 0** (modules=206;
  depth=PARTIAL-STRUCTURAL; bar=FOUNDATION-KIND-SURFACE; Mult..Extract band)
- `lake build SystemsLean.<Module>` for each sample module below -> **exit 0**

| Module | HostModuleCheck tokens checked (summary) | without-Lake result | cold lake exit | Gap class |
|--------|------------------------------------------|---------------------|----------------|-----------|
| Mult | inductive:Mult + grade defs (kind-surface) | accept (seed) | 0 | kind-surface (FOUNDATION) |
| Linear | axiom:Token/mkToken/consume + honesty defs | accept (seed) | 0 | kind-surface (FOUNDATION) |
| Types | structure:TypeTag/IrNode + NodeKind inductive | accept (seed) | 0 | kind-surface (FOUNDATION) |
| Extract | inductive:RuntimeClaim + extract surface | accept (seed) | 0 | kind-surface (FOUNDATION) |
| KernelMult | **def-only** stage/id/lower/ready (6 defs; no local structure/axiom) | accept (seed) | 0 | structural-only (outside Mult..Extract band) |
| KernelEmit | **def-only** stage/id/path-ready (8 defs; no local structure) | accept (seed) | 0 | structural-only (outside Mult..Extract band) |
| ParityMult | **def-only** parity readiness (8 defs) | accept (seed) | 0 | structural-only |
| SpecProof | **def-only** proof-complete bar surface (not elaborator depth) | accept (seed) | 0 | structural-only (orthogonal SpecProof pin) |

**Reject fixtures (without-Lake / driver smoke, not cold lake):** missing Mult
inductive; missing Linear axiom Token; missing Types structure; missing
IrProgram structure Program; missing Erasure structure Erased. All reject with
MISSING-DECL under PARTIAL-STRUCTURAL. Kernel band has **no** kind-surface
reject fixture yet (pre-expand).

**Gap reading:** cold lake elaborates every sample module body (exit 0). HostModuleCheck
accepts all seed modules at structural/key-decl depth. Mult..Extract alone require
structure/axiom/inductive kinds + expanded theorem corpus. Kernel Mult..KernelEmit
and Parity/SpecProof stay key-decl def/theorem lists only. That is the coverage
band gap for Slice 2.

---

## 3. Band ranking for deepen (Slice 2 first)

| Rank | Band | Why |
|-----:|------|-----|
| **1** | **Kernel Mult..KernelEmit** (KernelMult, KernelLinear, KernelTypes, KernelProgram, KernelEmit + *Theorems) | Plan default; self-host kernel surface; still structural-only after A58; on-disk theorem corpus already richer than required lists (room to dual-pin expand); product-critical path to freestanding self-host honesty. **Note:** no local structure/axiom on Kernel modules; deepen expands readiness/path def surface + theorem corpus under same FOUNDATION-KIND-SURFACE bar name (honest PARTIAL; not invent fake structures). |
| **2** | Emit plan/apply/body product (EmitPlan, EmitApply, EmitBody + scaffolds) | Local **structure Plan/Apply/Body** exist; denser structure tokens than Kernel; good Slice 3 candidate after Kernel. |
| **3** | Parity Mult..Emit | Closed-loop parity surface; structural-only today; secondary after kernel + emit product. |
| **4** | SpecProof / remaining seed | Orthogonal proof-complete bar; not first elaborator-depth band. |

**Slice 2 recommendation:** expand **Kernel Mult..KernelEmit** first (rank 1).
**Slice 3 recommendation:** Emit Plan/Apply/Body product (+ scaffolds as needed).

---

## 4. What would still remain after band expand

- PARTIAL-STRUCTURAL honesty stays (not real typecheck).
- Other seed bands outside Mult..Extract + Kernel stay structural-only.
- Proof terms do not elaborate as Lake does.
- Full classic elaborator parity surface-matrix row stays **open**.
- Cold lake remains full-package diagnostic / claim-proof elaborator.
- Real elaborator judgments need a later design (plan Slice 4 class).

---

## 5. Evidence commands (copy/paste)

```bash
cd /home/hunter/Projects/ai/iso
just host-module-check-without-lake   # exit 0; modules=206
cd src/systems
lake build SystemsLean.Mult SystemsLean.Linear SystemsLean.Types SystemsLean.Extract \
  SystemsLean.KernelMult SystemsLean.KernelEmit SystemsLean.ParityMult SystemsLean.SpecProof
# each exit 0 (2026-08-08)
```

---

## 6. Residual follow-on

Open residual Name after this inventory: **Kind-surface band expand** (Kernel
Mult..KernelEmit). Done when: dual-pin band string; expanded Kernel required
decls + *Theorems; bad reject fixture; without-Lake green modules=206; lake
HostModuleCheck family + HostResidualShrink + exe green; Sub-1-KLOC; no pin forge.
