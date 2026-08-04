# Plan: Freestanding product C through CompCert (`ccomp`)

ASCII only. Plain English. No ephemeral step codes in product source or APIs.

**Mission fit:** freestanding, garbage-collection-free Systems Lean. Product
wire is runtimeless C under `out/freestanding-c/`. CompCert is the path to
**seal that C** with a real verified compiler (`ccomp`), then earn **PROVABLY**
only with a full product matrix and residual honesty.

**Living copy (after approval):** write and keep
`.agents/plans/plan-compcert-product-seal.md` in lockstep. Point residual Open,
`WATCHER.md`, and `doc/SESSION-HANDOFF.md` at this program. Peer elaborator plan
stays a **parallel** program (not replaced).

**Answer to "can you compile on CompCert today?":** **Yes -- object seal and
PROVABLY claimed.** Product C exists; **`ccomp` is resolved**
(`just ccomp-smoke` GREEN via nixpkgs.compcert / COMPCERT_CCOMP / PATH; see
`doc/compcert-entry.md`). **Full freestanding wire under `ccomp` is sealed at
object compile** (`just freestanding-under-ccomp` GREEN). **Mult unit package
under `ccomp` is sealed** (`just mult-package-under-ccomp` GREEN;
MultSubsetEmit source include SSOT + re-emit). **Named product matrix join is
done** (`just product-compcert-matrix` GREEN; research
`doc/dev/research/compcert-product-matrix-2026-08-02.md`). **PROVABLY claimed**
2026-08-02 (`provablyUnlocked` true; lake elaborator proof; surface-matrix
CompCert row **PROVABLY**). llvm still held. This CompCert seal program is
**closed**; next Systems Open is peer **Host residual shrink**.

**Related living programs (not cancelled):**

| Program | Status | Relation |
|---------|--------|----------|
| Peer elaborator (`.agents/plans/plan-peer-elaborator.md`) | Steps 1-9 done; Open step 10 Host residual shrink | Primary Systems Open after CompCert seal closed. Host elaborator growth is not CompCert seal. |
| Freestanding residual free path (M0-M6) | Product path closed | Foundation: free + complete true; product Lake pins false; host residual remains. |
| CompCert product seal (this plan) | **Closed** (design + ccomp + wire + Mult + matrix + **PROVABLY evidence residual done**) | Seals freestanding C with `ccomp`; PROVABLY claimed. |

---

## 1. Goal (what "compile Slake on CompCert" means here)

| Meaning | In this plan? |
|---------|----------------|
| Compile **freestanding product C** (`out/freestanding-c/slake_freestanding.{c,h}` and unit packages) with CompCert **`ccomp`** | **Yes -- primary** |
| Earn **PROVABLY** (resolved `ccomp` + defined product matrix + honesty pins) | **Yes -- end of sequence**, never early |
| Compile Systems Lean **host** `.lean` with CompCert | **No** (wrong tool; host is Lean + Lake) |
| Unlock LLVM / `out/llvm-ir` | **No** (stays held; separate residual) |

Success for the operator ask is progressive:

1. A **resolved `ccomp`** exists and is measurable from this tree.
2. Fresh freestanding product C **compiles** under that `ccomp` (fail closed if not).
3. A **named product matrix** (full dialect + Mult unit package at minimum; expand units) is green under `ccomp`.
4. Only then: living pins / residual open PROVABLY with elaborator proof (`provablyUnlocked` today is **false** and must stay false until evidence).

---

## 2. What is true today

| Fact | Status |
|------|--------|
| Product residual free | true |
| Freestanding product self-host complete (writer path) | true (living tip; do not re-open without cause) |
| Product wire without Lake on hot path | true (`just build`) |
| Freestanding C on disk | ~1117 lines `out/freestanding-c/slake_freestanding.c` (generator output) |
| Host `cc` / systems-cc-probe / behavioral probe | Hosted dogfood, not CompCert |
| `ccomp` on PATH / resolved binary | **resolved** via `just ccomp-smoke` (flake nixpkgs.compcert 3.17 / COMPCERT_CCOMP / PATH); entry `doc/compcert-entry.md` |
| Named product matrix | **done** (`just product-compcert-matrix` GREEN; smoke + full wire + Mult; research note) |
| CompCert sources | read-only `ref/CompCert/` (configure, Makefile, x86_64, ...) |
| `provablyUnlocked` | **true** (`SystemsLean/LlvmHold.lean`, HOST-PROVABLY-HOLD claim surface; 2026-08-02) |
| Surface matrix CompCert row | **PROVABLY** (`src/systems/surface-matrix.md`) |
| CompCert license | Not Unlicense; commercial constraints -- `LICENSES.md`, `ref/CompCert/LICENSE` |

---

## 3. Non-goals

- Forging PROVABLY or `provablyUnlocked` true without real `ccomp` + matrix
- Hand-editing product C to "make CompCert happy" without fixing Lean emit SSOT
- Growing shell/Python product mills; CompCert build glue stays thin (just + documented configure)
- Treating host behavioral probe green as PROVABLY
- Auto-unlocking LLVM
- Replacing peer elaborator work; both programs can run if residual Names stay clear
- Compiling host Lean with CompCert

---

## 4. Approach (recommended)

```
Design + inventory (what C we seal; what matrix; license note)
        |
        v
Resolve ccomp (build from ref/CompCert or document operator path)
        |
        v
First compile: freestanding dialect .c under ccomp (object or allowed target)
        |
        v
Fix emit SSOT if CompCert rejects constructs (Lean-owned, not hand C)
        |
        v
Product matrix: Mult unit package + full freestanding wire (+ expand units)
        |
        v
Measured just recipes + research note (times optional; exit 0 required)
        |
        v
PROVABLY residual only when matrix + resolved ccomp + pin proof ready
```

**Rejected:** claim PROVABLY after one ad-hoc `ccomp` run; patch only
`out/freestanding-c` by hand; skip license honesty.

---

## 5. Steps (global sequence; plain residual Names)

Do not put step numbers into module names or permanent APIs. Residual Open
Names only. After each step: residual Done archive + Open + WATCHER + handoff.

| Step | Residual Name | Done when (checkable) |
|------|---------------|------------------------|
| **1** | CompCert product seal design | Research note under `doc/dev/research/`: (a) what "seal" means; (b) matrix rows (full wire + Mult package minimum); (c) `ccomp` resolve options (build `ref/CompCert` vs external); (d) license note; (e) non-claims; (f) next residual Names with Done when; residual Open advances to step 2; hygiene green |
| **2** | Resolved ccomp driver | Documented path to a working `ccomp` (built or operator-provided); just recipe or thin glue that fails closed if missing; smoke `ccomp -version` or equivalent exit 0; not PROVABLY. **Done 2026-08-02** (nixpkgs.compcert + `just ccomp-smoke` GREEN). |
| **3** | Freestanding wire under ccomp | After `just build`, compile `out/freestanding-c/slake_freestanding.c` (and header include path) with that `ccomp` to object or allowed artifact; just recipe GREEN; if rejects: inventory of constructs; fix via Lean emit SSOT, re-emit, re-run (no hand product C features). **Done 2026-08-02** (`just freestanding-under-ccomp` GREEN; first-pass object; shared `ccomp-resolve`; no emit SSOT fix). |
| **4** | Mult package under ccomp | Same for Mult subset emit package (or Out install if that is the seal target); dual evidence on-disk + recipe. **Done 2026-08-02** (`just mult-package-under-ccomp` GREEN; MultSubsetEmit `#include "slake_mult_subset.h"` SSOT after observed RED unbound enum; re-emit; ~1760-byte object). |
| **5** | Product CompCert matrix | Named matrix (full wire + Mult + any units claimed); just recipe runs matrix; research note logs results; free/complete/host residual honesty unchanged; `provablyUnlocked` still false; surface-matrix row updated to measured status (not PROVABLY until step 6). **Done 2026-08-02** (`just product-compcert-matrix` GREEN; note `doc/dev/research/compcert-product-matrix-2026-08-02.md`; surface-matrix CompCert row **measured**). |
| **6** | PROVABLY evidence residual | **Done 2026-08-02**: matrix re-run GREEN; `provablyUnlocked` true with lake elaborator proof; surface-matrix CompCert **PROVABLY**; residual / handoff / WATCHER lockstep; llvm still false; host residual remains. |

**Parallel (optional, disjoint):** peer elaborator steps 1-9 **done** (Expand
done); Systems Open is **Host residual shrink** (step 10). Do not mix CompCert
seal claims into peer elaborator modules. CompCert seal program **closed**.

**After approve (implementation lockstep, not part of this plan text alone):**

1. Copy plan body to `.agents/plans/plan-compcert-product-seal.md`.
2. Open residual Name **CompCert product seal design** in `RESIDUAL-systems.md`
   (and join board).
3. Point `WATCHER.md` at `/implement` for that Name.
4. Leave peer elaborator Open as parallel residual if still wanted.

---

## 6. Critical files

| Path | Why |
|------|-----|
| `out/freestanding-c/slake_freestanding.{c,h}` | Seal target (generator output) |
| `src/systems/emit/` | Lean-owned SSOT + dogfood; fix rejections here via emit, not hand Out |
| `src/systems/emit/host-owned-emit.md` | Ownership map |
| `src/systems/SystemsLean/LlvmHold.lean` | `provablyUnlocked` hold |
| `src/systems/self-host.md` | Acceptance / non-claims |
| `src/systems/surface-matrix.md` | CompCert PROVABLY row honesty |
| `doc/compcert-entry.md` | Upstream map |
| `ref/CompCert/` | Read-only sources to build `ccomp` |
| `LICENSES.md` | CompCert license honesty |
| `justfile` | New thin recipes (resolve + compile matrix) |
| residual / WATCHER / handoff | Open queue lockstep |
| Peer plan | Parallel program pointer |

---

## 7. Reuse

| Existing | How |
|----------|-----|
| `just build` | Always refresh wire before CompCert compile |
| `just systems-cc-probe` / behavioral probe | Hosted baseline; keep; do not call them PROVABLY |
| Mult package emit | Matrix row |
| pure Nix presence | Dual-pin new Lean modules if any; CompCert binary may stay host-local |
| LlvmHold / DualResidual | Hold pins until evidence |
| Peer elaborator Mult package path | Same Mult package is a matrix row under `ccomp` (different compiler, same wire) |

---

## 8. Risks

| Risk | Mitigation |
|------|------------|
| Freestanding C uses constructs CompCert rejects | Inventory on first fail; fix Lean emit; re-emit; document subset |
| CompCert build is heavy / needs Coq / deps | Step 2 design lists options; BLOCKED residual if deps missing with one concrete need |
| License surprise | Step 1 license note; never claim Unlicense on CompCert |
| False PROVABLY | Step 6 only; pin false until matrix green + proof |
| Hand-edited Out C | Forbidden; generator path only |
| Peer elaborator and CompCert race residual | Separate Open Names; parent serializes same-file writers |

---

## 9. Verification

| Gate | When |
|------|------|
| Design note + Open step 2 | Step 1 |
| `ccomp` smoke exit 0 | Step 2 |
| just recipe: freestanding wire under ccomp | Step 3 |
| Mult package under ccomp | Step 4 |
| Full named matrix just recipe | Step 5 |
| Lake proof on any claim pin flip | Step 6 only |
| free measure + hygiene + host residual honesty | every slice |
| Never set `provablyUnlocked` true in steps 1-5 | hard rule |

---

## 10. Defaults (if operator silent)

| Choice | Default |
|--------|---------|
| First residual after approve | **CompCert product seal design** (step 1) |
| Peer elaborator Expand host fragment set | Leave Open or queue; may run in parallel with design if no file race |
| ccomp source | Prefer build from `ref/CompCert` when deps available; else document external `ccomp` path |
| PROVABLY flip in this plan's first week | **No** -- matrix first |
| LLVM unlock | **No** |
| Target arch for first seal | x86_64 (matches host horizon); document if different |

---

## 11. Open questions (non-blocking defaults above)

- Prefer always-on just recipe that **skips** when `ccomp` missing (with clear SKIP) vs **fail closed** when measuring seal residual?
  **Default:** fail closed on seal residual recipes; optional diagnostic skip recipe separate.
- Seal only full dialect first, or Mult package first?
  **Default:** full dialect first (step 3), then Mult (step 4), then matrix join (step 5).

---

## 12. Success

1. Documented CompCert seal program on disk and residual Open starts step 1.
2. Resolved `ccomp` and freestanding product C compile under it.
3. Named matrix green under `ccomp`.
4. PROVABLY remains false until step 6 evidence; never sold as true early.
5. Peer elaborator program still honest and separate.

---

## Critical files for implementation

- `doc/dev/research/` (new CompCert seal design note)
- `out/freestanding-c/`, `src/systems/emit/`
- `SystemsLean/LlvmHold.lean` (hold only until step 6)
- `src/systems/surface-matrix.md`, `self-host.md`
- `justfile`, residual, WATCHER, handoff
- `ref/CompCert/` (read-only build)
- `.agents/plans/plan-compcert-product-seal.md` + pointer from peer plan living tip
