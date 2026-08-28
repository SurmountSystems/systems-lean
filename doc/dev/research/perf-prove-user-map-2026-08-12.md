# Perf-prove user map (what Lean proves vs what benches measure)

**Date:** 2026-08-12
**Kind:** analysis / user map. Not residual invent. Not free / complete / PROVABLY /
FullHost / DominanceClaimed / band FullBackend claim flips.
**ASCII only.** Plain American English.

**Residual:** Track L **L0** (Perf-prove user map). After land: cite this path from
`RESIDUAL-systems.md` Done archive and Open remaining L2+.

**Authority companions:**

- Explore prove: `.agents/reports/explore-perf-prove-tools-2026-08-12.md`
- Explore levers: `.agents/reports/explore-runtime-perf-levers-2026-08-12.md`
- Explore bench: `.agents/reports/explore-perf-bench-tools-2026-08-12.md`
- Host model: `src/systems/SystemsLean/HostCompose.lean` (+ theorems)
- Host cost Nat model: `src/systems/SystemsLean/HostCost.lean` (L1)
- Runtime report: `doc/BENCH-RUNTIME-latest.md`
- CompCert entry: `doc/compcert-entry.md`

---

## One-screen honest split

| Claim class | What it is | What it is not |
|-------------|------------|----------------|
| **PROVABLY** | CompCert product matrix: freestanding wire (and named units) compile under resolved `ccomp` | Wall-clock speed, "fastest C," ns/op, no-GC-in-ELF |
| **Speed** | Empirical `just bench-runtime` (and compose / mint arms) vs named baselines | A Lean theorem about nanoseconds or cycles |
| **Structural cost / exact-once** | Lean `Nat` step counts, capacity bounds, mint-consume state machines, extract reuses check_fail_closed | Proof that no GC exists in the binary; proof of freestanding ns/op |

**Do not mash these three.** Selling PROVABLY as "proven fast" or "proven no GC in the
ELF" is a forge. Selling `just bench-runtime` multipliers as theorems is a forge.
Structural HostCost lemmas support **design and optimization honesty** on the host
model; they do not replace measurement.

---

## What Lean structural HostCost proves (and will prove)

Host cost work lives under Track L (L1 Host cost steps, then L2+). The living module
is `SystemsLean.HostCost`.

### Already true on the host model (HostCompose, reused by HostCost)

These are **structural** facts about the classic Lean host representation of compose
(graph + linear host live flag + erasure), not freestanding C wall time:

1. **Fixed capacities.** Ordered IR program cap is 8 nodes (`IrProgram.programCap`);
   edge max is 16 (`IrGraph.edgeMax`). Scans that walk live nodes or edges are
   bounded by construction. That is an O(n) story with **n capped**, not "infinite
   graph."
2. **One mult pre-scan shape.** `multPreScan` is "every live node passes
   `nodeMultOk`." MULT-1 needs `linear.live`; MULT-0 needs marked erased;
   MULT-OMEGA needs neither.
3. **Fail-closed bar.** `checkFailClosed = hostIsWellTyped && multPreScan`.
4. **Extract reuses the bar under freestanding goal.**
   `extractOk = isFreestandingGoal && checkFailClosed` (HostCompose). Under
   RUNTIME-FS, extract is **not** a second independent mult-scan algebra in the
   host model (definitional fuse). C drivers may still call check twice; that is
   emit/runtime measure territory (Track E / T), not a Lean wall-clock claim.
5. **Exact-once on the concrete host handle.** Theorems such as
   `mint_consume_exact_once_sequential`, `double_consume_notLive`, spent scrub +
   multPreScan reject after consume. Live once, spend once, second spend fails
   closed. This is a **state machine** on host Bool/Nat fields.
6. **HostCost Nat accounting (L1).** Explicit step constants for mint, consume,
   mult pre-scan over n nodes, check_fail_closed, and extract-under-FS shapes,
   with simple equalities and inequalities (e.g. extract step count is check
   plus freestanding-goal step). **Nat steps are not nanoseconds.**

### What later L Names add (not claimed done here)

| Name | Intent (structural only) |
|------|---------------------------|
| L2 Fixed cap complexity | Lemmas tying scan cost to programCap / edgeMax |
| L3 Extract fuse cost | Stronger extract vs check cost relationship |
| L4 Mint consume automaton | Cost of exact-once paths as Nat machine |
| L5 Fail-closed opt preserve | Opt must not break fail-closed |
| L6 No-heap host machine | Model fields are Bool/Nat; still not ELF |
| L7 Differential fuse model | Before/after fuse as Nat delta |
| L8 Joint mult cost table | Mult-grade scan costs |
| L9 RuntimeBenchLean step twin | Host measure loop + step twin, still not freestanding speed proof |

---

## What `just bench-runtime` measures

| Surface | Role |
|---------|------|
| `just bench-runtime` | Primary freestanding runtime story vs named baselines |
| Compose / mint arms | Empirical ns/op (or similar) on product wire smoke drivers |
| `doc/BENCH-RUNTIME-latest.md` | Living numbers; plain "how much faster / slower" |
| Structural no-GC checks | Link honesty (`ldd` / `nm` / freestanding-first compile); **measure**, not Lean theorem |
| `SystemsLean.RuntimeBenchLean` | Host **measurement** under classic Lean managed runtime (contrast arm); not freestanding product wire |

**Speed wins are empirical.** When freestanding is faster vs a named baseline, user-facing
docs may report the multiplier. When it is slower, docs must not claim "faster" for
that baseline. Multipliers never become PROVABLY.

---

## PROVABLY boundary (hard)

**PROVABLY** means: product freestanding wire (and the named CompCert matrix) compiles
under resolved CompCert (`ccomp`) with the project's product matrix green.

| Allowed language | Forbidden language |
|------------------|--------------------|
| "Wire is PROVABLY under CompCert matrix" | "PROVABLY fastest" / "proven ns/op" |
| "CompCert may reject bad C after an opt; keep matrix green" | "CompCert certifies speed" |
| "Linear exact-once design supports no product GC library" | "Lean proved there is no GC in the ELF" |

See `doc/compcert-entry.md` and living residual claim board for PROVABLY true pins.
Do **not** re-open or forge PROVABLY for performance work.

---

## Exact-once and "no GC" -- safe vs unsafe claims

### Safe

1. **Product design:** freestanding Mult is only 0 / 1 / omega; MULT-1 is
   LINEAR-EXACT-ONCE protocol on the product wire (mint/consume live-flag tokens).
2. **Host proof:** HostCompose mint/consume theorems prove the host **state machine**.
3. **Link / package measure:** freestanding consumer builds do not link a GC library
   (bench structural honesty). That is **measurement**, not a HostCost theorem.
4. **Research line:** linear discipline makes exact-once resources expressible without
   a garbage collector; freestanding wire implements that protocol. Causal story for
   humans, not "theorem says ELF has zero GC symbols."

### Unsafe (do not claim)

| Overclaim | Why wrong |
|-----------|-----------|
| Lean proves no GC in the binary | ELF / link is measure |
| Token axioms alone are elaborator MULT-1 enforcement | Classic Lean does not LinearCheck; axioms remain axioms |
| PROVABLY means no GC and fastest | PROVABLY is CompCert wire correctness only |
| HostCost Nat equals freestanding ns/op | Different claim classes |

---

## How agents should use this map

| Task | Use |
|------|-----|
| Prove structural bounds / fuse / exact-once | HostCompose + HostCost + later L Names; lake green |
| Report speed | `just bench-runtime` + `doc/BENCH-RUNTIME-latest.md` |
| Seal correctness after emit opt | CompCert matrix + PROVABLY pin honesty |
| Emit wire speed work | Track E (Lean SSOT + rebuild wire); still empirical for wall time |
| Measurement tools | Track T (timers, spreads, metrics); never rename as PROVABLY |

**Parent / implementer honesty:** when a residual closes a prove slice, say what **Nat
or Bool** fact was proven. When a residual closes a bench slice, say what **command
and baseline** moved. Never swap the labels.

---

## Residual cite (after L0 land)

- Open Name **Perf-prove user map (L0)** -> **done** with primary path this file.
- Living Open continues L1+ / T* / E* per `RESIDUAL-systems.md`.
- Do not treat this map as a claim flip of free, complete, PROVABLY, FullHost, or
  DominanceClaimed.
)
