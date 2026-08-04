# CompCert product seal design (2026-08-02)

Kind: analysis only. Not residual free. Not PROVABLY. Not residual Open by itself
after lockstep -- residual Names below drive implement.

ASCII only. Plain English. Greppable stage ids only where product already uses them.

**Plan:** `.agents/plans/plan-compcert-product-seal.md`
**Entry map:** `doc/compcert-entry.md`
**License inventory:** `LICENSES.md`, `ref/CompCert/LICENSE`

---

## (a) What "seal" means

**Seal** means: compile the **freestanding product C** under a real CompCert
driver binary **`ccomp`**, so the product wire is checked by a verified C
compiler path -- not by host `cc` alone and not by greps.

| In scope | Out of scope |
|----------|--------------|
| `out/freestanding-c/slake_freestanding.{c,h}` (and unit packages named in the matrix) under `ccomp` | Compiling Systems Lean **host** `.lean` with CompCert (wrong tool; host is Lean + Lake) |
| Fail-closed just recipes when `ccomp` is missing or rejects constructs | Treating hosted `systems-cc-probe` / behavioral probe green as PROVABLY |
| Fix emit **SSOT** via Lean when CompCert rejects constructs, then re-emit | Hand-editing product C under `out/` as feature work |
| Earn **PROVABLY** only after resolved `ccomp` + named matrix + residual honesty | Early `provablyUnlocked` true |

Host elaborator residual and peer elaborator work stay separate. Seal is a
**product wire** program.

---

## (b) Matrix rows (minimum)

Named product CompCert matrix (expand later only with residual Names):

| Row | Artifact | Success |
|-----|----------|---------|
| **Full freestanding wire** | After `just build`: `out/freestanding-c/slake_freestanding.c` (+ header include path) | `ccomp` compiles to object or allowed target; exit 0 |
| **Mult unit package** | Mult subset package under `src/systems/emit/slake_mult_subset.{c,h}` (or Out install if seal target is Out) | Same under that `ccomp` |
| **Join (matrix)** | Full wire + Mult (minimum); more units only when residual claims them | One just recipe runs the named matrix; logs exit codes |

Hosted dogfood (`just systems-cc-probe`, behavioral probe) remains baseline and
is **not** a matrix row for PROVABLY.

Default order: full dialect first, then Mult package, then matrix join
(plan defaults).

---

## (c) `ccomp` resolve options

| Option | How | Notes (this host, 2026-08-02 inventory + resolve slice) |
|--------|-----|------------------------------------------|
| **A. Build from `ref/CompCert`** | Read-only sources; configure + make in a build dir; install or point at `ccomp` | CompCert 3.17 `configure` wants **Coq 8.15--8.20.1** and **Menhir**. Host system Rocq **9.1.1** + **no menhir** on PATH -- bare in-tree configure does **not** match without a pin. Prefer **D** when available. |
| **B. External / operator-provided `ccomp`** | Operator installs AbsInt or self-built binary; tree discovers via PATH or `COMPCERT_CCOMP` | Fail-closed residual recipes if missing |
| **C. Deferred** | Leave Open **Resolved ccomp driver** BLOCKED with one concrete need | Only when A/B/D unavailable non-interactively |
| **D. Flake-locked nixpkgs `compcert` (preferred on this host)** | `just ccomp-smoke` auto-resolve step 3; or `NIXPKGS_ALLOW_UNFREE=1 nix build --impure ... pkgs.compcert` | **Resolved 2026-08-02:** CompCert **3.17** (`coq9.0-compcert-3.17`); unfree license gate; smoke `ccomp -version` exit 0. Entry map: `doc/compcert-entry.md`. |

**Target arch default:** `x86_64-linux` (matches host horizon; document if different).

**Recipe policy default:** seal residual recipes **fail closed** if `ccomp`
missing; optional diagnostic skip recipe is separate (plan open question default).

**Resolve order in `just ccomp-smoke`:** (1) `COMPCERT_CCOMP`, (2) PATH,
(3) flake nixpkgs.compcert (unfree). Greppable: `COMPCERT-NIX-RESOLVE`.

Do **not** treat submodule presence as a working `ccomp`.

---

## (d) License note

CompCert is **not** Unlicense and **not** public domain.

- Novel Systems Lean work: Unlicense (`UNLICENSE.md`, `LICENSES.md`).
- `ref/CompCert`: **INRIA Non-Commercial License Agreement** and/or AbsInt
  commercial agreement; some `lib/` files dual-licensed INRIA-NC +
  **LGPL-2.1-or-later**. Cite `ref/CompCert/LICENSE` and `LICENSES.md`
  CompCert special note.
- Submodule presence does **not** grant commercial rights. Educational /
  research / evaluation use may apply under upstream terms; commercial use
  needs AbsInt (or current upstream) agreement.
- Building or shipping product C **through** `ccomp` has real license
  constraints. Never label CompCert outputs or the compiler itself as Unlicense.

---

## (e) Non-claims

| Must not claim | Why |
|----------------|-----|
| **PROVABLY** / `provablyUnlocked` true | Only after resolved `ccomp` + full named matrix + elaborator proof residual (last step) |
| LLVM / `out/llvm-ir` unlocked | Held; separate residual |
| Host Lean compiled via `ccomp` | Wrong tool |
| Host residual free | Dual residual honesty; peer elaborator separate |
| Product free/complete re-open | Free + complete stay true; seal does not flip them |
| Hosted `cc` green == CompCert seal | Different compilers |
| Hand-patched Out C as seal fix | Lean emit SSOT only |

Living pin today: `provablyUnlocked` **false** (`SystemsLean.LlvmHold`,
HOST-PROVABLY-HOLD). Surface matrix CompCert PROVABLY row is **measured** after
matrix join (still not PROVABLY until PROVABLY evidence residual).

---

## (f) Next residual Names (with Done when)

Do not put step numbers into module basenames or permanent APIs. Residual Open
Names only.

| Residual Name | Done when (checkable) |
|---------------|------------------------|
| **CompCert product seal design** | This note + durable plan copy + residual Open advances to **Resolved ccomp driver**; hygiene green; `provablyUnlocked` still false. **Done this slice.** |
| **Resolved ccomp driver** | Documented path to working `ccomp` (built from `ref/CompCert` or operator-provided or nixpkgs); just recipe or thin glue that **fails closed** if missing; smoke `ccomp -version` (or equivalent) exit 0; not PROVABLY. If deps missing: BLOCKED with one concrete need (e.g. Coq 8.15--8.20.1 + menhir, or external `ccomp` on PATH). **Done 2026-08-02** via flake nixpkgs.compcert + `just ccomp-smoke` GREEN. |
| **Freestanding wire under ccomp** | After `just build`, compile `out/freestanding-c/slake_freestanding.c` with that `ccomp`; just recipe GREEN; on reject: construct inventory; fix via Lean emit SSOT, re-emit, re-run (no hand product C features). **Done 2026-08-02** (`just freestanding-under-ccomp` GREEN; first-pass object; shared `ccomp-resolve`; no emit SSOT fix). |
| **Mult package under ccomp** | Same for Mult subset emit package (or Out install if seal target); dual evidence on-disk + recipe. **Done 2026-08-02** (`just mult-package-under-ccomp` GREEN; MultSubsetEmit `#include "slake_mult_subset.h"` SSOT after RED unbound enum; re-emit; ~1760-byte object). |
| **Product CompCert matrix** | Named matrix (full wire + Mult + any units claimed); just recipe runs matrix; research note logs results; free/complete/host residual honesty unchanged; `provablyUnlocked` still false; surface-matrix row measured status (not PROVABLY until next Name). **Done 2026-08-02** (`just product-compcert-matrix` GREEN; note `doc/dev/research/compcert-product-matrix-2026-08-02.md`). |
| **PROVABLY evidence residual** | **Last only:** when matrix green and operator wants claim; living pin flip with lake elaborator proof; never before matrix. **Open next** (operator-gated). |

**Parallel (not cancelled):** peer elaborator **Expand host fragment set**
(plan `.agents/plans/plan-peer-elaborator.md` step 9) may continue under its own
Open Name. Do not mix CompCert seal claims into Host* peer modules.

---

## Inventory snapshot (design time + resolve update)

| Fact | Status |
|------|--------|
| Product residual free | true |
| Freestanding product self-host complete | true |
| Product wire without Lake on hot path | true (`just build`) |
| Freestanding C on disk | generator output under `out/freestanding-c/` |
| Host `cc` / systems-cc-probe | Hosted dogfood, not CompCert |
| `ccomp` on PATH | not present without install (checked) |
| `ccomp` via nixpkgs (flake lock) | **resolved** CompCert 3.17; `just ccomp-smoke` GREEN (2026-08-02) |
| Freestanding wire under ccomp | **done** (`just freestanding-under-ccomp` GREEN; first-pass object; 2026-08-02) |
| Mult package under ccomp | **done** (`just mult-package-under-ccomp` GREEN; MultSubsetEmit include SSOT; 2026-08-02) |
| Product CompCert matrix | **done** (`just product-compcert-matrix` GREEN; note `doc/dev/research/compcert-product-matrix-2026-08-02.md`; 2026-08-02) |
| `ref/CompCert` | present; version 3.17; configure/Makefile (read-only) |
| Coq / Rocq on host | 9.1.1 (outside bare ref configure window 8.15--8.20.1) |
| menhir | not on PATH (nixpkgs package brings its own for build) |
| `provablyUnlocked` | false |
| Surface matrix CompCert PROVABLY row | **measured** (matrix green under ccomp; not PROVABLY) |

---

## Success for this design slice

1. Durable plan at `.agents/plans/plan-compcert-product-seal.md`.
2. This research note covers (a)--(f).
3. Residual Done archive for design; Open **Resolved ccomp driver** (+ parallel Expand if still open).
4. WATCHER / handoff / peer plan pointer lockstep.
5. Hygiene green; never set `provablyUnlocked` true.
