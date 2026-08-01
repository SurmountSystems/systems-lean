# Slake first compiler surface inventory (2026-08-01)

Kind: analysis only. Not residual flip. Not product claim.
ASCII only. Date: 2026-08-01.

Residual Open for implement: **Slake first compiler surface** (Phase B) in
`RESIDUAL-systems.md`. This note designs that residual; it does not close it.

Living tip at inventory time:

| What | Status |
|------|--------|
| Freestanding product self-host **complete** (claim B) | **true** |
| Product residual free (claim A) | **true** (host residual remains) |
| Lake host elaborator (`DependsOnLake` / `StillUsesLake`) | still used |
| Bootstrap stage **S0** (host foundation) | **done** -- bootstrap **start**, not finish |
| Bootstrap stage **S1** (first compiler surface) | **open** -- next implement residual |
| Plan | `.agents/plans/plan-residual-free-freestanding.md` Steps 0-3 done; Step 5 bootstrap |

---

## 1. S0 is bootstrap start, not finish

**S0 host foundation is done.** Lake elaborates Systems Lean; freestanding product
wire under `out/freestanding-c` is residual free; claim B writer-path complete is
true. That is how bootstrap **starts**: a host tool builds early Slake drivers.

**S0 is not bootstrap finished.** There is still no freestanding Slake compiler
that elaborates Systems Lean without Lake. Missing freestanding binary is the
**starting state**, not a stop sign. Do not reframe S0 as "blocked by no
binary." Next work is **S1**: first named compiler surface with a defined
input and checkable output, still Lake-built if needed.

Serial wall times (analysis only; see
`doc/dev/research/lake-vs-slake-serial-bench-2026-08-01.md`):

| Work | Warm real (approx) | What it is |
|------|--------------------|------------|
| Lake package elaborator | ~108 s | Classic Lean elaborating host theorems -- not freestanding Slake |
| Capable regenerate | ~0.4 s | Lake-hosted READ+COMPOSE+WRITE-HC+INSTALL-OUT -- product wire dogfood |
| Freestanding `cc -c` | ~0.09 s | Host C compile of already-emitted product wire -- not a compiler |

---

## 2. Map of what exists today

### 2.1 Lake executables (host bootstrap tools)

Package `SystemsLean` under `src/systems/lakefile.toml`. All are **Lake-hosted**
host tools until S4 retires Lake from the product path. Grouped by role:

| Role | Lake exe names (prefix `slake-`) |
|------|----------------------------------|
| **Emit / writer** | `emit-freestanding-c` (diagnostic FreestandingEmit path); official product write is freestanding-capable dual-eq WRITE |
| **Decomposed writer path** | `read-product-ssot`, `compose-product-plan`, `write-freestanding-hc` |
| **Freestanding-capable path** | `freestanding-capable-gap`, `...-step-contract`, `...-read`, `...-compose`, `...-write-hc`, `...-regenerate`, `...-install-out`, `...-full-bar` |
| **Ownership regenerate** | `ownership-regenerate` |
| **Perform / complete claim surface** | `freestanding-perform-evidence`, `...-official-path`, `...-official-path-alternate`, dual-equality WRITE parity/close-path/api/capable-gap, `freestanding-retire-official`, `freestanding-perform-claimed`, `freestanding-ownership-claimed`, `freestanding-step-contract-full`, `freestanding-self-host-complete` |

Official product path: `just build` -> freestanding-capable-regenerate
(READ+COMPOSE+dual-eq WRITE-HC+INSTALL-OUT) + install `out/freestanding-c/`.

**None of these is a source-language front-end.** They regenerate freestanding
C product wire from host SSOT fragments and dual-equality checks, or print
claim-bar diagnostics. Inputs are repo-root dual SSOT files / emit templates,
not a user-defined Systems Lean unit or IR package.

### 2.2 CompilePath (host structural compile readiness)

| Path | Role |
|------|------|
| `SystemsLean/CompilePath.lean` | `SLAKE_COMPILE_PATH_V1` / `HOST-COMPILE-PATH`: `compileReady`, `unitCompileReady`, `programCompileReady`; not product C |
| Peels | `CompilePathMult`, `Linear`, `Types`, `Program`, `Extract`, `Graph`, `Compose`, `Erasure`, `Plan`, `Apply`, `Body` |

Fixed **fixtures** lower Mult / Linear / Types / ... grades into ordered IR +
host compose + emit-readiness folds (`multFixtureCompilePathReady`, etc.).
Theorems and smokes prove those fixed paths hold under Lake.

**Honest non-claims already in module headers:** not a filesystem unit walk;
not source-file compiler; not full elaborator type checker; not CFG/SSA; not
full product module emit; not freestanding Slake body.

### 2.3 Emit + freestanding C product wire

| Surface | Role |
|---------|------|
| `SystemsLean/FreestandingEmit*.lean` + `Emit*.lean` | Host SSOT load / plan / apply / body / Mult..Banner product C text ownership |
| `src/systems/emit/host_emit_*.ssot.txt` | Lean-owned fragments (not free-form product C) |
| `src/systems/emit/slake_freestanding.{c,h}` | Generator dogfood workspace |
| `out/freestanding-c/` | Release product wire (claim A free true) |

Product wire is a **fixed freestanding C API dialect** (Mult grades, linear
consume, erasure, extract, typed IR, ordered IR program, graph edges, host
compose, plan/apply/body, banner). Consumers link against that dialect.
Regenerate rewrites the same dialect from SSOT -- it does not compile arbitrary
programs into that dialect.

### 2.4 Freestanding C API dialect vs real compiler front-end

| | Product wire regenerate (today) | Compiler front-end (S1 target) |
|--|--------------------------------|--------------------------------|
| **Input** | Fixed dual SSOT + templates in-repo | A **defined** tiny unit set (host fixture or file) with stated shape |
| **Work** | Load SSOT, dual-eq check, write `slake_freestanding.{c,h}`, install Out | Translate / check that unit through a named compile path |
| **Output** | Full freestanding API dialect (~32 KiB C) | Checkable structural result (readiness + optional fragment or object) for **that** input |
| **Proof of "compiler"** | "We can rewrite the product wire" | "We accepted fixed input X and produced expected Y" |

CompilePath fixtures are the closest **structural** seed: they already lower
Mult..Body fixed fixtures. They are not yet a named Slake driver with a
user-facing input contract and an end-to-end host gate that is more than
"regenerate product wire."

---

## 3. Recommended S1 input and output (tiny, checkable)

### 3.1 Input (recommended)

**Mult unit fixture as the first defined compiler input**, reusing the existing
COMPILE-PATH-MULT / MULT-FIXTURE shape (three-node ordered IR: MULT-0 erased,
MULT-1 linear, MULT-OMEGA value + host mark+mint).

Why Mult first:

- Smallest closed grade surface already proven on CompilePath.
- Distinct from "rewrite all freestanding API sections."
- Extends later to Linear / Types without inventing a new IR.

**Contract shape (not implementation detail yet):**

1. A named input identity (e.g. greppable `SLAKE_FIRST_SURFACE_MULT` or plain
   `FirstSurface` Mult unit) that Phase B implements as Lean data (preferred
   first) or a tiny on-disk fixture under `src/systems/` if a file path helps
   the gate.
2. Same structural content as `lowerMultFixtureProgram` / Mult fixture compose
   readiness -- do **not** invent a parallel Mult dialect.

**Do not** choose full `.lean` package elaboration or arbitrary `.slake` source
for S1. That is later (S3+).

### 3.2 Output (recommended)

End-to-end **host** result for that Mult input:

1. **Structural check:** `unitCompileReady` (or Mult-fixture readiness fold)
   holds for the named input (Lake theorem and/or lake exe print GREEN).
2. **Named driver:** short module + lake exe (or `just` recipe) that runs the
   path -- not only "import CompilePath in a library."
3. **Optional second check (nice-to-have if tiny):** HOST-EMIT-MULT fragment
   readiness (`emitMultReady`) for the same input, without rewriting the entire
   freestanding product wire as the S1 success criterion.

Primary success is **defined Mult input -> expected readiness / structural
result**, not full Out regenerate.

### 3.3 Recommended product names (Phase B)

Prefer short role names (AGENTS product Lean names rule). Do **not** mint
`ProductPathFreestandingBootstrapS1...` kitchen-sink basenames.

| Role | Suggested name |
|------|----------------|
| Module / namespace | `SystemsLean.FirstSurface` or `SystemsLean.SlakeCompile` |
| Lake exe | `slake-first-surface` (or `slake-compile-mult`) |
| just recipe | `first-surface` or `slake-first-surface` |
| Greppable honesty | short token inside file (e.g. `FIRST-SURFACE` / `SLAKE_FIRST_SURFACE`) -- not in basename |

Default pick for residual Paths: **`FirstSurface`** (role = first compiler
surface); **`SlakeCompile`** reserved if the module is the longer-lived compile
driver name once S1+ grow.

---

## 4. What is missing for "compiler" vs "regenerate product wire"

| Gap | Today | S1 closes if |
|-----|-------|--------------|
| Named front-end / driver | Many claim/regenerate exes; no "compile this unit" surface | Named module + exe/recipe for Mult unit only |
| Defined external input contract | Fixtures are library-internal; regenerate uses fixed SSOT tree | Documented Mult input identity + checkable path |
| Output != full dialect rewrite | Success today is rewrite emit/Out | Success is Mult readiness (and optional Mult emit honesty) for that input |
| Evidence of translate/check | CompilePath theorems on fixed defs; not a driver gate | At least one host e2e gate: fixed Mult input -> expected result |
| Self-application of Slake sources | Deferred residual bar | **Out of scope for S1** (S3) |
| Lake gone | StillUsesLake / DependsOnLake true | **Out of scope for S1** (S4) |

S1 may **call** CompilePath Mult fixture and EmitMult readiness. It must not
sell freestanding-capable-regenerate as the S1 compiler surface.

---

## 5. Non-claims (keep honest)

| Non-claim | Why |
|-----------|-----|
| S1 may use Lake | Normal bootstrap; host elaborator builds the first surface |
| free != Lake gone | Claim A is product-wire residual free only |
| complete != bootstrapped | Claim B is writer-path evidence under Lake |
| StillUsesLake / DependsOnLake stay true | S4 only with elaborator proof |
| S1 is not S3 self-application | No "Slake compiles Systems Lean without Lake" |
| S1 is not PROVABLY / llvm | Step 4 held |
| S1 is not hand-authored product C | Three languages; emit remains generator wire |
| CompilePath fixtures alone are not S1 | Need named surface + e2e driver gate |

---

## 6. Draft residual Open (Phase B implement)

Copy shape for `RESIDUAL-systems.md` (refine only if evidence requires):

### Name

**Slake first compiler surface**

### Goal

Land a real, named Slake compiler surface under `src/systems/` that accepts a
**defined Mult unit input** and runs a checkable translate/check path -- more
than regenerating the freestanding C API dialect.

### Done when

1. Named short-role module(s) (prefer `FirstSurface` / `SlakeCompile`) plus
   lake exe and/or `just` recipe for the surface.
2. At least one end-to-end host test or gate: fixed Mult unit input -> expected
   structural readiness (unitCompileReady / Mult fixture fold) and GREEN
   driver path; optional Mult emit-readiness if still tiny.
3. Residual free measure still green if emit/Out is touched; prefer not
   rewriting full product wire as the S1 success criterion.
4. Docs (`src/systems/README.md` and/or `self-host.md` as needed): bootstrap
   **S1** honest; Lake still host until S4; free/complete non-claims held.
5. Lake green on touched modules; no hand-written product C features; no
   StillUsesLake / free / complete / PROVABLY / llvm flips.

### Out of scope

- S3 self-application without Lake; S4 Lake retire
- PROVABLY; llvm IR
- Claim free/complete flips; re-open claim B ladder
- Full Lean elaborator parity; arbitrary `.lean` packages
- Hand-authored freestanding product C; shell growth

### Primary paths

- `src/systems/SystemsLean/FirstSurface.lean` (or `SlakeCompile.lean`) -- new
- `src/systems/SystemsLean/CompilePath.lean` / `CompilePathMult.lean` -- reuse
- `src/systems/lakefile.toml`, `justfile` -- wire exe/recipe
- `src/systems/README.md` and/or `self-host.md` -- honest S1 line
- Inventory: this file

### Gates

- Lake build of new module + exe (while Lake is host elaborator)
- `just systems-host` if presence tokens added
- `just product-residual-free-measure` if wire touched
- `just hygiene` if markdown touched

---

## 7. Bootstrap stages (S0-S4) for residual / plan lockstep

| Stage | Name | Status after this inventory |
|-------|------|-----------------------------|
| **S0** | Host foundation | **Done** |
| **S1** | First Slake compiler surface | **Open** -- residual Name above |
| **S2** | Slake emits freestanding C for that subset | After S1 |
| **S3** | Slake rebuilds its own freestanding subset | After S2; deferred without-Lake bar lives here |
| **S4** | Retire Lake from product path | After S3; never forge early |
| **S5** | Held tracks (PROVABLY, LLVM, full iso) | Held |

---

## 8. Related paths

| Path | Role |
|------|------|
| Session plan | bootstrap freestanding Slake (operator-approved) |
| Living plan | `.agents/plans/plan-residual-free-freestanding.md` Step 5 |
| Bench analysis | `doc/dev/research/lake-vs-slake-serial-bench-2026-08-01.md` |
| Residual free inventory | `doc/dev/research/residual-free-bar-inventory-2026-08-01.md` |
| Self-host acceptance | `src/systems/self-host.md` |
| Host map | `src/systems/README.md` |
| Vocabulary | `doc/vocabulary.md` (Lake bootstrap elaborator) |
