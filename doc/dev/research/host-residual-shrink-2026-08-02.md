# Host residual shrink inventory (peer elaborator step 10)

Kind: analysis only. Not residual invent. Not host free forge. Not product claim
flip. ASCII only. Date: 2026-08-02.

Plan: `.agents/plans/plan-peer-elaborator.md` step 10.
Living tip at land: free true; complete true; product StillUsesLake/DependsOnLake
false; hostElaboratorResidualRemains true; PROVABLY true; llvmUnlocked false.

Related:

- `doc/dev/research/peer-elaborator-design-2026-08-01.md` (green bars + step 10)
- `doc/dev/research/m6-lake-retire-design-2026-08-01.md` (product path Lake retire)
- `doc/dev/research/slake-vs-lake-same-job-mult-2026-08-02.md` (same-job Mult only)
- Host: `DualResidual.lean`, `LakeRetireInventory.lean`, `HostCheck.lean`,
  `HostGraph.lean`, `HostPackageWrite.lean`, new `HostResidualShrink.lean`
- Gates: `just host-residual-shrink`; without-Lake peer recipes; lake build on pin

---

## 1. Goal of this inventory

Evidence that **named** host develop paths no longer require classic Lake on the
measured hot path (peer elaborator step 10). Never slogans alone. Never forge
full host residual free while classic Lake still elaborates full SystemsLean.

**Honest close shape for step 10:**

| Claim | Honest status after this inventory |
|-------|-------------------------------------|
| Named Mult-first peer hot paths Lake-free | **true** (measured; prebuilt ELF; no lake build/exe/env on hot path) |
| Full host develop residual gone | **false** (SystemsLean still needs Lake elaborator) |
| `hostElaboratorResidualRemains` | **true** (DualResidual; do not flip) |
| `hostElaboratorResidualFreeClaimed` | **false** |
| Product StillUsesLake / DependsOnLake | **false** (M6 phase 2; unchanged) |
| free / complete / PROVABLY | **true** (unchanged) |
| llvmUnlocked | **false** (held) |

---

## 2. Named host develop paths already Lake-free on hot path

These are **peer elaborator** measured paths (not product wire alone). Prebuilts
are Lake-built once (bootstrap); hot path does not call lake.

| Recipe | Role | Local without-Lake pin (examples) |
|--------|------|-----------------------------------|
| `just host-fragment-check-without-lake` | Mult-first host fragment check corpus (G1/G2/G3 accept + B1-B4 reject) | `hostFragmentCheckWithoutLakeFinished` / Ready |
| `just host-graph-without-lake` | Multi-file Mult + MultSubsetEmit (+ Linear expand) graph | `hostGraphWithoutLakeFinished` / Ready |
| `just host-package-write-without-lake` | HostFront G1 + HostGraph Mult set then Mult package write | `hostPackageWriteWithoutLakeFinished` / Ready |

**Prebuilt ELFs (examples under `src/systems/`):**

- `.lake/build/bin/slake-host-fragment-check`
- `.lake/build/bin/slake-host-graph`
- `.lake/build/bin/slake-host-package-write`

**Structural inventory module:** `SystemsLean.HostResidualShrink` pins the three
recipe names and partial-shrink honesty (`hostResidualPartialShrinkClaimed` true;
host residual remains true; host free false).

Same-job wall-clock evidence for Mult package write already lives in
`slake-vs-lake-same-job-mult-2026-08-02.md` (Job A without-Lake vs Job B Lake Mult
emit). Bench alone is not host residual free.

---

## 3. What still needs Lake for host develop

| Category | What | Why Lake remains |
|----------|------|------------------|
| **Full host elaborate** | Entire `SystemsLean` package under `src/systems/` | Classic Lean Lake elaborates host `.lean` sources |
| **Bootstrap prebuild** | `lake build` of peer bins (`slake-host-*`), claim exes, subset emit/rebuild, freestanding tools | Once (or after clean) to produce prebuilts used without lake on hot path |
| **Diagnostic / unit recipes** | Many `just *-subset-emit`, Lake-hosted rebuilds, `first-surface`, Capable* lake exes, claim recipes, `freestanding-self-host-complete` | Host verification and development surface |
| **Claim-bool flip proof (policy)** | Living claim flips while Lake is host elaborator | `AGENTS.md`: lake on PATH for claim-bool GREEN during bootstrap |
| **Peer surface local Lake pins** | HostCheck / HostGraph / HostPackageWrite `stillUsesLake` / `dependsOnLake` true | Host develop surface honesty: without-Lake hot path does not retire Lake bootstrap |
| **Dual residual host residual** | `hostElaboratorResidualRemains` true | free is product residual free, not host Lake gone |

**Not claimed by this inventory:** full Lean day-one elaborator; mathlib; Lake
deleted from tree; host residual free; llvm unlock; free alone as Lake gone.

---

## 4. Product path Lake retire vs host residual (distinct)

M6 already retired **product path** Lake pins (`StillUsesLake` /
`DependsOnLake` false with lake elaborator proof). That is orthogonal to host
develop residual.

| Surface | Lake on measured hot path | Living honesty pin |
|---------|---------------------------|--------------------|
| Product wire / Mult packages / multi-unit join | Often free (M2/M4/M5 recipes; official `just build`) | product StillUsesLake **false** |
| Peer Mult-first host fragment check / graph / Mult package write | Free on named without-Lake recipes | host residual **remains**; peer local stillUsesLake **true** |
| Full SystemsLean develop | Still Lake elaborator | `hostElaboratorResidualRemains` **true** |

---

## 5. Dual evidence for partial shrink (step 10 close)

| Evidence | Gate / path |
|----------|-------------|
| Lean structural inventory ready | `SystemsLean.HostResidualShrink` / `hostResidualShrinkReady` true |
| Partial shrink claimed; host free not claimed | `hostResidualPartialShrinkClaimed` true; host free false; host remains true |
| On-disk just dual | `just host-residual-shrink` greps module + DualResidual remains + justfile recipes |
| Measured without-Lake peer recipes | `just host-fragment-check-without-lake`; `host-graph-without-lake`; `host-package-write-without-lake` exit 0 |
| Lake elaborator on inventory pin land | `lake build SystemsLean.HostResidualShrink` exit 0 |
| Product residual free measure | `just product-residual-free-measure` (free tip unchanged) |

---

## 6. Non-claims (hard)

- Do **not** flip `hostElaboratorResidualRemains` false from this inventory alone.
- Do **not** set `hostElaboratorResidualFreeClaimed` true.
- Do **not** sell free true as Lake gone for host develop.
- Do **not** unlock llvm or re-open PROVABLY.
- Do **not** claim full SystemsLean graph or day-one Lean elaborator.
- Peer expand beyond Mult-first + Linear mini remains future residual if opened.

---

## 7. Recommended next residual after step 10 close

Per approved remaining map after peer step 10 and CompCert seal closed:

| Name | Shape |
|------|--------|
| **LLVM IR emit path** | First residual: design + measured stub under `out/llvm-ir` honesty; `llvmUnlocked` stays **false** until a later unlock residual with proof |

Not: re-open host residual free forge; not PROVABLY re-false; not mathlib day-one.

---

## 8. Pointers

| Artifact | Role |
|----------|------|
| `src/systems/SystemsLean/HostResidualShrink.lean` | Structural inventory + partial shrink pins |
| `just host-residual-shrink` | Dual evidence gate (no lake on inventory greps) |
| `DualResidual.lean` | host residual remains true (unchanged) |
| `LakeRetireInventory.lean` | Product path Lake free inventory (M6; orthogonal) |
| Residual / WATCHER / handoff | Open queue lockstep after land |
