# Explore: PERFORMANCE + PROOF tools for freestanding (2026-08-12)

Kind: analysis only. Not residual invent (Names below are **candidates**). Not free /
complete / PROVABLY / FullHost / DominanceClaimed / production-opt claim flips.
ASCII only. Plain American English.

**Companion:** C-side runtime levers and bench call chains live in
`.agents/reports/explore-runtime-perf-levers-2026-08-12.md`. This report is the
**prove what we can** half: cost models, structural theorems, fail-closed
preservation, CompCert seal boundary, Lean skill use.

**Honest split (do not mash):**

| Claim class | What it is | What it is not |
|-------------|------------|----------------|
| **PROVABLY** | CompCert product matrix: freestanding wire (and named units) compile under resolved `ccomp` | Wall-clock speed, "fastest C," ns/op |
| **Speed** | Empirical `just bench-runtime` vs named baselines | A Lean theorem about nanoseconds |
| **Structural cost / exact-once** | Lean Nat models, capacity bounds, mint-consume state machines, extract = checkFailClosed | Proof that no GC exists in the binary (that is link/structural measure) |

---

## 1. Inventory: cost model / resource accounting / complexity today

### 1.1 What does **not** exist (honest gap)

Under `src/systems/SystemsLean/` there is **no** dedicated:

- Cost algebra (`Cost`, `stepCount`, amortised resource accounting)
- Asymptotic complexity library (Big-O as a type)
- Differential cost before/after fuse as a pure `Nat` model module
- Wall-clock or cycle-count theorems (correct: those are empirical)

`fuel` appears only as **elaboration / parse / topo bounds** (e.g. `HostTerm.termFuel`,
`HostFront.parseFuel`, Kahn topo fuel, EmitBody decimal printer fuel, LLVM DF walk
fuel). That is **termination fuel for host checkers**, not freestanding runtime cost.

### 1.2 What **does** exist and can carry a cost story

| Surface | Path | Proof-relevant content | Cost angle |
|---------|------|------------------------|------------|
| Fixed program capacity | `IrProgram.lean` `programCap = 8`; theorem `programCap_eq_eight` | Cap honesty vs emit `SLAKE_IR_PROGRAM_CAP` | Scan is O(n) with **n <= 8** by construction |
| Fixed edge capacity | `IrGraph.lean` `edgeMax = 16`; theorem `edgeMax_eq_sixteen` | Cap honesty vs emit | Edge walks O(e) with **e <= 16** |
| Mult pre-scan | `HostCompose.multPreScan` = `nodes.all (nodeMultOk)` | Theorems on empty / mult1 / mult0 / joint | One pass over live nodes; bound by programCap |
| Fail-closed bar | `checkFailClosed = hostIsWellTyped && multPreScan` | `checkFailClosed_eq` | Definitional structure of "check cost" |
| Extract fuse (thin) | `Extract.extractOk = checkFailClosed` (thin path) | `extractOk_eq_checkFailClosed` | **extract is not a second semantic check** on thin Extract |
| Extract fuse (compose) | `HostCompose.extractOk = isFreestandingGoal && checkFailClosed` | `extractOk_eq`, `extractOkFs_eq` | FS extract **definitionally reuses** checkFailClosed (no extra mult scan in host model) |
| Linear Token axioms | `Linear.lean` `Token` / `mkToken` / `consume` axioms | `roundTrip_eq`; inventory pins | Abstract exact-once **by contract**; not elaborator MULT-1 |
| Live-flag state machine | `HostCompose.mint` / `consume` / scrub | `double_consume_notLive`, `mint_consume_exact_once_sequential`, `mint_consume_roundtrip`, spent-scrub family | **Provable** exact-once on the **concrete host handle** |
| MULT-1 / MULT-0 gap close | `nodeMultOk_*`, multPreScan_* unminted/minted/spent | COMPOSE-THEOREM suite | Ownership handles are required for check/extract OK |
| Kernel path readiness | `KernelLinear.linearHostPathReady` (Bool smoke path) | HostCompose mint/consume sequence | Executable readiness, thinner than theorems |
| Emit body fuel | `EmitBody` decimal printer | Not runtime product | Host string helper only |

**Bottom line:** the project already has a **structural cost shape** (fixed caps,
one mult scan, extract = check under FS) without naming it a "cost model." A
performance+proof program should **lift** that into explicit Nat accounting and
complexity lemmas, not invent a parallel dialect.

---

## 2. Linear / consume: what supports "exact-once implies no need for GC"

### 2.1 Honest statement (safe to claim)

1. **Product design:** freestanding Mult is only 0 / 1 / omega; MULT-1 is
   LINEAR-EXACT-ONCE; product wire exposes stack live-flag tokens
   (`slake_consume_token_*`, `slake_host_compose_*`) with **no GC library on the
   consumer link** (bench structural `ldd`/`nm` honesty).
2. **Host model proof:** `mint_consume_exact_once_sequential`,
   `double_consume_notLive`, spent scrub + multPreScan reject after consume prove
   a **state machine**: live once, spend once, second spend fails closed.
3. **Causal line (research, not theorem):** linear discipline makes exact-once
   resources expressible **without** a garbage collector; freestanding wire is the
   implementation of that protocol. See
   `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md`.

### 2.2 What must **not** be claimed

| Overclaim | Why false / incomplete |
|-----------|------------------------|
| "Lean proves there is no GC in the binary" | Link story is **measure** (`ldd`/`nm` / freestanding-first `-c`); not a Lean theorem about ELF |
| "Token axioms prove MULT-1 elaborator enforcement" | `LINEAR-AXIOMS-REMAIN`: classic Lean does not LinearCheck; axioms stay axioms |
| "roundTrip_eq is exact-once" | Definitional shape only; double consume of same `Token` is not rejected by elaborator |
| "PROVABLY means no GC and fastest" | PROVABLY = CompCert wire correctness only |

### 2.3 Best theorem targets for the GC story (structural, not speed)

- Preserve / strengthen HostCompose exact-once suite (already strong).
- **No-heap host model:** optional structure for "token state is Bool+Nat fields,
  no heap allocator in the model" as an inductive resource machine (still not ELF).
- **Erasure / MULT-0:** marked erased means runtime-absent (`nodeMultOk_mult0`);
  no retain for erased grade.
- **MULT-OMEGA share:** `shareNat_reuse` documents unrestricted reuse is **not**
  exact-once (contrast class).

---

## 3. HostCompose / Extract / check_fail_closed vs emit C SSOT

### 3.1 Lean host model

```
Host = Graph + LinearHost + Erased
nodeMultOk: MULT-0 -> erased marked; MULT-1 -> linear.live; MULT-OMEGA -> true
multPreScan = nodes.all nodeMultOk
checkFailClosed = hostIsWellTyped && multPreScan
extractOk claim = isFreestandingGoal claim && checkFailClosed
extractOkFs = extractOk runtimeFs
```

Partial vs C (documented in `HostCompose.lean` header): no null pointers, no
exact C return-code table (-1/-2), typed result inductives instead.

### 3.2 Extract thin path vs HostCompose

| Path | MULT-1 | Role |
|------|--------|------|
| `Extract.extractOk` (thin) | Intentionally always true under RUNTIME-FS | Tag / claim / MULT-0 erase only |
| `HostCompose.extractOk` | Needs `linear.live` for any MULT-1 node | Closes MULT-1 live gap for product path |

Theorems already state the fuse on **both** surfaces:
`extractOk_eq_checkFailClosed` (thin) and HostCompose `extractOk_eq`.

### 3.3 Emit C (product wire)

Authority: Lean SSOT fragments (`EmitLinear`, `EmitCompose`, ...) +
`host-owned-emit.md`; generator write to `emit/slake_freestanding.*` then
`out/freestanding-c/`. Smoke benches link wire; do not hand-author product C.

C implements the same protocol: mint reject id 0; double mint; double consume
-2; check_fail_closed walks nodes for mult handles; extract reuses fail-closed
style checks. **Compose bench cost center** (from companion report): full check +
extract per op over fixed-cap graph.

### 3.4 Fuse correctness (prove-side opportunity)

Already definitional on host: extract does not add a second mult scan in the
model. C may still **call** check twice in drivers. A useful residual:

- **Lean:** prove `extractOkFs hc = checkFailClosed hc` under FS (already true via
  `isFreestandingGoal_runtimeFs` + `extractOk_eq`).
- **Optional Nat cost:** `costExtract = costCheck` (equal step count).
- **C measure:** microbench check alone vs extract alone vs both (empirical only).

---

## 4. RuntimeBenchLean: measure vs prove

| Item | Detail |
|------|--------|
| Module | `SystemsLean/RuntimeBenchLean.lean` + `RuntimeBenchLeanMain.lean` |
| Lake exe | `slake-runtime-bench-lean` |
| Role | **Host measurement only** (Arm C): managed RT mint ByteArray then discard |
| Metrics | `IO.monoNanosNow`, key=value lines matching C drivers |
| Not freestanding | Explicit `baseline_not=freestanding_c` |
| Not a proof | No theorems; impure loop to avoid CSE faking zero time |

**What Lean can measure here:** wall time of a **logical** mint/consume class under
classic Lean GC / managed runtime (contrast).

**What Lean cannot prove via this module:** freestanding C ns/op, no-GC link, or
PROVABLY.

**Creative extension (still measure, not prove):** pure `Nat` "op steps" counter
beside the impure loop for differential **model** cost (see residual Names). Keep
wall-clock separate.

Living numbers: `doc/BENCH-RUNTIME-latest.md` (mint freestanding ~6.7x vs Boehm,
~2.8x vs Lean managed; ~4.5x slower vs heap_churn; compose ~2.8x slower vs heap).

---

## 5. CompCert path (correctness seal only)

| Artifact | Role |
|----------|------|
| `doc/compcert-entry.md` | Resolve `ccomp`, matrix recipes |
| `doc/dev/research/compcert-product-seal-design-2026-08-02.md` | Seal = wire under verified C compiler |
| `just product-compcert-matrix` | Smoke + freestanding under ccomp + Mult package |
| Living residual | PROVABLY / `provablyUnlocked` **true** (claim board) |

**Relation to performance program:** CompCert may **reject** constructs if emit
optimizations introduce unsupported C. Any SSOT "fuse" or inline optimization
must keep matrix green. CompCert does **not** certify speed.

---

## 6. Lean skill pack (how to use for prove-side work)

Discovery: `.agents/skills/lean4` -> `skills/lean4-skills`. Guidance:
`doc/lean4-skill-use.md`.

| Task | Skill workflow |
|------|----------------|
| Draft cost-step / state-machine modules | draft / formalize |
| Fill theorems on HostCompose cost lemmas | prove / autoprove |
| Refute a too-strong "no GC theorem" | disprove |
| Quality before Done when | review; gates still `just systems-host` / lake |
| Heavy proofs | refactor / golf after green |

Policy: skill does **not** replace emit SSOT or pure Nix gates; no product C growth
as residual progress; freestanding honesty non-claims stay in residual.

---

## 7. Idea bank: Lean-side tools (creative, in scope)

1. **Cost-step counters as pure functions**
   `costMint / costConsume / costMultPreScan (n) / costCheckFailClosed hc : Nat`
   with lemmas `costMultPreScan n = n` (one visit per node) and
   `n <= programCap -> costCheck <= K + programCap + edgeMax`.

2. **Complexity lemmas for fixed-cap graph scan**
   Not asymptotic theater: **absolute** bounds `<= 8` and `<= 16` as theorems
   (already half-done via `programCap_eq_eight` / `edgeMax_eq_sixteen`).

3. **Fuse correctness theorem**
   Host: `extractOkFs = checkFailClosed` under FS (strengthen packaging + Nat
   `costExtract = costCheck`). Document that C drivers may still call twice.

4. **Mint-consume state machine theorems**
   Package existing suite as a small "resource automaton" module (states:
   empty / live / spent) with exhaustive transition table theorems.

5. **Differential cost before/after as Nat model**
   `costComposeNaive` vs `costComposeFused` where fuse drops second scan in the
   **model**; prove inequality; **measure** C before/after with bench-runtime.

6. **No-heap host resource machine**
   Inductive configs with only Bool/Nat fields; prove all transitions stay
   allocation-free **in the model**. Pair with ldd honesty in docs, not as one claim.

7. **Erasure accounting**
   MULT-0 marked nodes contribute 0 retain cost; joint mult1+mult0 theorems already
   exist for OK/fail; add cost zeros for erased.

8. **Fail-closed preservation under program transforms**
   If a future "opt" rewrites graph edges under caps, prove
   `checkFailClosed g -> checkFailClosed (opt g)` or fail-closed rejection preserved.

9. **Lean skill + TDD loop**
   Red theorem for cost bound; green with pure def; lake + systems-host; never
   sell green cost theorem as faster freestanding C.

10. **Optional pure-Nix gate**
    Presence of greppable cost theorem tokens (if residual wants a gate); keep
    algorithm pure Nix, not shell.

---

## 8. Candidate residual Names (10-15)

Sizes: **S** one short implement slice; **M** multi-module or dual measure+prove;
**L** campaign-shaped. Kind: **Lean-prove** / **C-measure** / **just tools** /
**docs** (may combine).

| # | Name | S/M/L | Kind | Goal (one line) | Done when (sketch) | Out of scope |
|---|------|-------|------|-----------------|--------------------|--------------|
| 1 | **Host cost steps** | S | Lean-prove | Pure `Nat` cost functions for mint/consume/multPreScan/checkFailClosed | Module + theorems `costMultPreScan_eq_length`, `costCheck_le_bound`; lake green; non-claims in header | Wall-clock; PROVABLY; ELF no-GC |
| 2 | **Fixed cap complexity** | S | Lean-prove | Absolute O(cap) lemmas for programCap 8 / edgeMax 16 | Theorems using existing cap pins + scan cost; systems-host | Big-O library; llvm |
| 3 | **Extract fuse cost** | S | Lean-prove | Package extract = checkFailClosed as fuse + equal cost | Theorem packaging + `costExtract_eq_costCheck`; docs link | Claiming C already fuses calls |
| 4 | **Mint consume automaton** | S | Lean-prove | Explicit empty/live/spent automaton with transition theorems | Maps to existing HostCompose theorems; lake green | Elaborator MULT-1 on Token axioms |
| 5 | **No-heap host machine** | M | Lean-prove | Resource configs without heap in the model | Inductive + transition closed under mint/consume/mark | Binary ldd theorem; product free re-open |
| 6 | **Differential fuse model** | M | Lean-prove | Nat costs before/after model fuse of double check | Inequality theorem; residual honesty table | Auto speed claim without C re-bench |
| 7 | **Compose check microbench** | S | C-measure + just tools | Split check vs extract vs full compose ns/op | New smoke arm(s) or flags; `just bench-runtime` report rows labeled | Hand product C features |
| 8 | **Mint path SSOT slim** | M | Lean SSOT + C-measure | Reduce thin call-throughs on consume_token mint/consume via SSOT | Re-emit; matrix + runtime rebench; living report if real win | Patch emit C as SSoT |
| 9 | **Compose init reuse bench** | M | C-measure | Arena/reuse compose vs full re-init per op (measurement first) | Arm + report; optional SSOT only if win proven | Inventing residual free from speed |
| 10 | **Structural no-GC gate** | S | just tools + docs | Formalize ldd/nm freestanding honesty as stable recipe outputs | Documented recipe contract; fail closed if libgc/leanshared appear | Lean theorem "no GC" |
| 11 | **Cost presence Nix** | S | just tools (pure Nix) | Optional greppable tokens for cost theorems in systems-host | Pure Nix presence; flake stage HITL | Shell mill |
| 12 | **RuntimeBenchLean step model** | S | Lean-prove + measure | Pure Nat step count alongside impure Arm C loop | Def + optional theorem; wall-clock still separate keys | Claiming freestanding C cost |
| 13 | **Fail-closed opt preserve** | M | Lean-prove | Spec for future graph rewrites preserving checkFailClosed | Spec theorems + one trivial opt id | Full compiler opt pipeline |
| 14 | **Joint mult cost table** | S | Lean-prove | Cost table for joint mult1+mult0 extract OK vs either-side fail | Builds on joint_* theorems | Speed vs Boehm |
| 15 | **Perf-prove user map** | S | docs | One living map: measure vs prove vs PROVABLY | Short `doc/` map + link from README tip when program starts | New claim pins |

**Suggested first wave (highest leverage, low forge risk):** 1, 2, 3, 4, 7, 10, 15.

**Defer / hold:** 8-9 until measure shows check/extract dominance; 5-6 after 1-3;
11 only if presence gates are wanted; 13 only when a real opt transform exists.

---

## 9. Three-sentence synthesis (honest "provable optimization" story)

We can **prove** structural properties of freestanding ownership: fixed-capacity
scans (n <= 8, e <= 16), fail-closed mint/consume exact-once on the host live-flag
model, and extract definitionally reusing checkFailClosed under RUNTIME-FS. We can
**measure** wall-clock freestanding C against Boehm, heap_churn, and Lean managed
runtime, and we can measure link honesty (no libgc / no Lean RT on freestanding
arms). We must **not** call speed PROVABLY: CompCert seals wire correctness only;
optimization is "prove the structure that enables no-GC exact-once, then rebench
C under that structure," never a theorem about nanoseconds.

---

## 10. Primary paths (for implementers)

| Concern | Paths |
|---------|-------|
| Host compose + theorems | `src/systems/SystemsLean/HostCompose.lean`, `HostComposeTheorems.lean` |
| Linear axioms + limited theorems | `Linear.lean`, `LinearTheorems.lean` |
| Extract fuse | `Extract.lean`, `ExtractTheorems.lean` |
| Caps | `IrProgram.lean` / `IrProgramTheorems.lean`, `IrGraph.lean` / `IrGraphTheorems.lean` |
| Lean measure arm | `RuntimeBenchLean.lean`, `just/bench-runtime.just`, `just/bench-runtime-report.just` |
| C measure arms | `src/systems/smoke/slake_runtime_bench_*.c` |
| Emit ownership | `src/systems/emit/host-owned-emit.md`, `EmitLinear` / `EmitCompose` SSOT |
| CompCert seal | `doc/compcert-entry.md`, `just product-compcert-matrix` |
| Living speed | `doc/BENCH-RUNTIME-latest.md` |
| Lean skill | `.agents/skills/lean4/SKILL.md`, `doc/lean4-skill-use.md` |
| C levers companion | `.agents/reports/explore-runtime-perf-levers-2026-08-12.md` |

---

## 11. Non-claims (repeat for reseed)

- Not inventing Open residual by this explore alone (candidates only).
- Not free / complete / PROVABLY / FullHost / DominanceClaimed / production-opt flips.
- Not "Lean proves freestanding is fastest C."
- Not elaborator MULT-1 on `Token` axioms (LINEAR-AXIOMS-REMAIN stays).
- Not growing product C or shell as residual progress.
- Not CompCert-as-speed.

---

End of report.
