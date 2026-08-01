# M3 subset language front-end design

Kind: analysis only. Not residual flip. Not product claim. Not implement.
ASCII only. Date: 2026-08-01.

Living tip at design time:

| What | Status |
|------|--------|
| Claim B complete | true |
| Claim A free | true |
| StillUsesLake / DependsOnLake | true (must stay true until M6) |
| Mult S0-S3 under Lake (M0) | done |
| M1 unit surfaces (Linear..Compose emit/rebuild) | done |
| M2 Mult without-Lake (Name A + Name B full Path A) | done (freestandingDriverComplete true; product Lake remains) |
| M3 subset language front-end | **design only here** |
| S4 / M6 Lake retire | deferred |
| Step 4 PROVABLY / LLVM | held |

Plan: `.agents/plans/plan-residual-free-freestanding.md` ideal ladder **M3**.
Related cites:

- `doc/dev/research/slake-first-compiler-surface-inventory-2026-08-01.md` (S1 FirstSurface)
- `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md` (M2 honesty matrix pattern)
- `doc/dev/research/name-b-full-mult-write-design-deepen-2026-08-01.md` (design -> implement Done when pattern)
- Host: `SystemsLean/FirstSurface.lean`, `MultSubsetEmit.lean`, `CompilePathMult.lean`,
  `Mult.lean`, `Types.lean`, `IrProgram.lean`, unit subset emit/rebuild modules
- Self-host map: `src/systems/self-host.md` Bootstrap / ideal ladder rows

---

## 1. Why M3 (gap after S1-S3 / M1 / M2)

Today the "compiler surface" is still **fixed Mult fixtures** and fixed unit
package identities, not a language front-end:

| Surface | Input | Work | Gap |
|---------|-------|------|-----|
| **FirstSurface** (S1) | `SLAKE_FIRST_SURFACE_MULT` = baked Mult fixture | `firstSurfaceReady` fold | No parse; only one fixed good path |
| **MultSubsetEmit** (S2) | same S1 Mult id | write `slake_mult_subset.{h,c}` | Package emit, not language check |
| **MultSubsetRebuild** (S3 / M2) | S2 package identity | re-emit/re-validate Mult package | Self-application of package, not front-end |
| **M1 unit surfaces** | fixed Linear..Compose fixtures | unit packages + rebuild | Parallel fixed fixtures; not variable inputs |
| **CompilePath Mult** | `lowerMultFixtureProgram` / compose | structural unitCompileReady | Library fixtures; fail-closed cases are host theorems, not golden files |
| **Product wire regenerate** | dual SSOT + templates | freestanding C dialect rewrite | Not a source language front-end (S1 inventory said this) |

Plan M3 success shape: **parse and check good and bad golden inputs** over a
**defined Mult/subset language surface**, not only fixed Mult fixtures.

M3 does **not** mean full Systems Lean elaborator, full `.lean` parse, or Lake
retire. It means a **tiny subset language** with real accept/reject evidence.

---

## 2. What "subset language" means after M1 unit packages

### 2.1 Scope of the language (M3 v1)

**Primary dialect for M3 v1: Mult unit ordered IR surface.**

After M1, unit packages exist for Mult, Linear, Types, Program, Extract,
Erasure, Graph, Compose. M3 does **not** need to parse all of them on day one.
It needs a **defined** surface that:

1. Expresses the same Mult grade + kind pairing already proven on host
   (`Mult` grades MULT-0 / MULT-1 / MULT-OMEGA; `NodeKind` VALUE / LINEAR /
   ERASED; fail-closed `kindMultOk`).
2. Builds an ordered IR program under the same rules as `IrProgram`
   (non-empty well-typed program; length <= programCap 8).
3. Optionally folds host unit readiness (`unitCompileReady` after mark MULT-0 +
   mint MULT-1) for a second check tier -- **not** required for first parse
   accept of a well-typed program alone.

**Out of M3 v1 language:** full freestanding product dialect text, full Systems
Lean modules, Graph edges as first grammar, Compose host APIs as grammar,
Linear-only / Types-only separate dialects (those stay M1 package surfaces until
a later deepen explicitly adds them).

### 2.2 Concrete grammar (proposed; implement may refine spelling)

ASCII line-oriented unit program. One node per non-comment line. Comments start
with `#`. Empty lines ignored.

```
# Mult unit program (subset language v0)
# form: node <multName> <kindName>
# multName: MULT-0 | MULT-1 | MULT-OMEGA
# kindName: ERASED | LINEAR | VALUE
# legal pairings only (kindMultOk): ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA

node MULT-0 ERASED
node MULT-1 LINEAR
node MULT-OMEGA VALUE
```

**Alternate tag form (same semantics; optional implement pick):**

```
node 0 2
# multTag 0/1/2 = MULT-0/1/OMEGA; kindTag 0/1/2 = VALUE/LINEAR/ERASED
# note Types.ofKindTag?: 0=VALUE, 1=LINEAR, 2=ERASED -- document in parser
```

Prefer **name form** for goldens (human readable). Tag form may be an internal
decode path only.

**Program rules (check):**

| Rule | Accept | Reject |
|------|--------|--------|
| At least one node | non-empty program | empty / only comments |
| Each node kind/mult pairing | `kindMultOk` | mismatch (VALUE/MULT-0, etc.) |
| Mult name/tag known | MULT-0/1/OMEGA or 0/1/2 | unknown grade (e.g. MULT-3, tag 99) |
| Kind name/tag known | ERASED/LINEAR/VALUE | unknown kind |
| Length | 1..programCap (8) | over cap |
| Lex / line shape | `node` + two tokens | garbage line, missing tokens |

**Unit compose tier (optional second check for good goldens that need host
handles):** after parse to program, host mark MULT-0 + mint MULT-1 (mint id
documented, e.g. reuse fixture mint 4) then `unitCompileReady`. Bad golden for
this tier: well-typed program nodes but compose raw without mark/mint (mirrors
`multFixtureComposeRawUnready`).

### 2.3 Relationship to existing Mult fixture

Good golden **G-mult-classic** is the **external spelling** of today's
`lowerMultFixtureProgram` three-node Mult fixture (not a second Mult dialect).
Parser output should lower to the same structural Program shape FirstSurface
already consumes via CompilePathMult.

Do **not** invent a parallel Mult grade set. Do **not** hand-author product C
as the front-end body.

---

## 3. Golden cases (good + bad)

Goldens live under a short path, proposed:

`src/systems/goldens/mult-front/` (or `src/systems/testdata/mult-front/` if
implement prefers "testdata"; **short role path**, not ProductPath*).

Each golden is a `.slake-mult` or `.txt` ASCII file plus expected verdict in the
host driver / just greps (prefer expected verdict as Lean table + on-disk file).

### 3.1 Good goldens (must accept)

| Id | File (proposed) | Content shape | Expected |
|----|-----------------|---------------|----------|
| **G1** | `good-mult-classic.slake-mult` | three nodes MULT-0/ERASED, MULT-1/LINEAR, MULT-OMEGA/VALUE | parse ok; programCompileReady true; length 3 |
| **G2** | `good-single-value.slake-mult` | one node MULT-OMEGA VALUE | parse ok; programCompileReady true (matches programCompileReady_single_value spirit) |
| **G3** | `good-mult-classic-unit.slake-mult` | same as G1 (or alias) | if unit tier implemented: after mark+mint, unitCompileReady true |

Minimum for M3 implement close: **G1 + G2** accept. G3 unit tier is **nice**
if small; do not block M3 on full host compose IO if program tier alone is
checkable with dual evidence.

### 3.2 Bad goldens (must reject)

| Id | File (proposed) | Fault | Expected |
|----|-----------------|-------|----------|
| **B1** | `bad-unknown-grade.slake-mult` | `node MULT-9 VALUE` or unknown name | parse/check reject FAIL-CLOSED-UNKNOWN-GRADE |
| **B2** | `bad-kind-mult-mismatch.slake-mult` | `node MULT-0 VALUE` (ERASED expected for MULT-0) | reject kindMultOk failure |
| **B3** | `bad-empty.slake-mult` | only comments / empty | reject EMPTY-PROGRAM-FAIL-CLOSED |
| **B4** | `bad-unknown-kind.slake-mult` | `node MULT-1 FOO` | reject unknown kind |
| **B5** | `bad-garbage-line.slake-mult` | `not-a-node ...` | reject lex / line shape |
| **B6** (optional) | `bad-over-cap.slake-mult` | 9 well-typed VALUE nodes | reject length > programCap |

Minimum for M3 implement close: **B1 + B2 + B3** reject. B4-B6 strengthen.

### 3.3 Dual evidence pattern (same spirit as Mult subset emit)

| Evidence | Role |
|----------|------|
| **Lean** | Parser/checker structural pins; theorems or `native_decide` on in-memory strings matching goldens; smoke prints GREEN/RED per case |
| **On-disk** | just recipe runs lake exe (or prebuilt) over golden directory; greps expected accept/reject markers or exit codes |
| **Honesty** | StillUsesLake / DependsOnLake true; free/complete product pins unchanged |

Do not treat Lean Bool alone as filesystem golden proof if the driver claims to
read files: dual evidence required when IO is in the Done when.

---

## 4. Host module short role names (for later implement)

AGENTS product Lean names rule: short role names; **no**
`ProductPathFreestanding*` kitchen-sink basenames.

| Role | Proposed name | Notes |
|------|---------------|-------|
| Core parse + check surface | `SystemsLean.SubsetFront` | Mult subset language front-end (M3) |
| Thin lake main | `SystemsLean.SubsetFrontMain` | exe entry |
| Lake exe | `slake-subset-front` | short |
| just recipe | `subset-front` | runs goldens measure |
| Greppable stage id (in-file only) | `SLAKE_SUBSET_FRONT_V0` / `SUBSET-FRONT` | not in basename |
| Host map id | `HOST-SUBSET-FRONT` | in-file |
| Goldens dir | `src/systems/goldens/mult-front/` | short path |
| Optional parse helper | `SystemsLean.SubsetParse` | only if SubsetFront grows long; prefer one module first |
| Optional check helper | `SystemsLean.SubsetCheck` | same -- module split only if needed |

**Reserved / do not mint:** `ProductPath*`, `FreestandingCapable*BootstrapM3*`,
wave/stage codes in basenames (`M3Front...` ok only as residual Name, not
module file `M3FrontEndParseCheckGolden...lean`).

**Reuse:** Mult / Types / IrProgram / CompilePathMult APIs. SubsetFront **calls**
existing fail-closed tables; does not fork Mult grades.

---

## 5. Honesty matrix (StillUsesLake until M6)

| Pin | Design time | After M3 implement (proposed) | After M6 only |
|-----|-------------|-------------------------------|---------------|
| Product StillUsesLake | true | **true** | may false with elaborator proof |
| Product DependsOnLake | true | **true** | may false with elaborator proof |
| Claim A free | true | unchanged | unchanged |
| Claim B complete | true | unchanged | unchanged |
| freestandingDriverComplete (M2 Mult write) | true | unchanged (orthogonal) | unchanged |
| PROVABLY / llvm | false / held | false / held | Step 4 |
| S4 / M6 Lake retire | deferred | **not started** | M6 only |
| Local subsetFrontStillUsesLake | n/a | true | true until M6 |

**Lake is allowed on M3 implement:** parser/checker host modules elaborate under
Lake; lake exe may run the golden suite. That is bootstrap, not product-path
Lake retire. Do not sell M3 as freestanding elaborator.

**Freestanding claims:** M3 implement must stay careful -- do **not** claim
freestanding product self-host re-open, residual free flip, or freestanding
source language without Lake. Optional later deepen could port checker to
freestanding C generated from Lean; **out of M3 v1 Done when**.

---

## 6. Architecture sketch (implement, not this note)

```
golden file (.slake-mult)
    -> SubsetFront.parseLines : String -> Option (List RawNode) / Except
    -> decode Mult + NodeKind (ofNat? / name tables; fail-closed)
    -> mkNode? / push into IrProgram (fail-closed)
    -> programCompileReady (good) or documented reject reason (bad)
    -> optional: lower to HostCompose mark+mint -> unitCompileReady
    -> lake exe prints per-golden PASS/FAIL; just greps aggregate GREEN
```

**I/O:** prefer reading golden files via Lean `IO.FS` in the lake exe (same
pattern as MultSubsetEmit write). Structural pins may also embed golden **text
as Lean String constants** dual-checked against on-disk files (byte equality or
token greps) so theorems can `native_decide` without IO.

**Three languages only:** no Python golden runner; no shell mill that reimplements
parse. just is thin glue (lake exe + greps).

---

## 7. Draft residual: M3 subset language front-end implement

### M3 subset language front-end implement

| Field | Content |
|-------|---------|
| **Name** | M3 subset language front-end implement |
| **Goal** | Host front-end that parses and checks defined Mult subset language goldens (good accept + bad reject), not only fixed Mult fixtures. |
| **Done when** | (checkable list below) |
| **Out of scope** | Full Systems Lean / Lean 4 parse; all M1 unit dialects as grammars; S4/M6; StillUsesLake false; free/complete re-open; PROVABLY; llvm; hand product C; shell parse mills; Mult package write redesign; freestandingDriverComplete flip |
| **Primary paths** | `SystemsLean/SubsetFront.lean` (+ Main); goldens under `src/systems/goldens/mult-front/`; just `subset-front`; presence dual-pin if needed; docs self-host / residual / handoff |

**Done when (draft for implement residual):**

1. **Surface exists.** Named short modules `SystemsLean.SubsetFront` +
   `SubsetFrontMain` (or implement-chosen short roles from section 4); lake exe
   `slake-subset-front`; just `subset-front`. Greppable in-file
   `SUBSET-FRONT` / `SLAKE_SUBSET_FRONT_V0`. No ProductPath* basenames.
2. **Grammar documented in module header** matching this note (node lines;
   Mult + kind names; fail-closed pairings; empty reject; cap).
3. **Good goldens accept:** at least G1 (classic Mult three-node) and G2
   (single MULT-OMEGA VALUE) accept under the front-end; dual evidence Lean pin
   + lake exe / just greps (or exit 0 aggregate).
4. **Bad goldens reject:** at least B1 (unknown grade), B2 (kind/mult mismatch),
   B3 (empty program) reject with fail-closed reasons; dual evidence.
5. **Not only fixtures:** front-end path is driven by golden **inputs** (files
   and/or dual-pinned String constants equal to files), not solely
   `multFixtureCompilePathReady` re-export as success. FirstSurface / Mult
   fixture may be reused as **oracle** for G1 shape equality, but accept/reject
   must go through parse+check.
6. **Lake honesty:** product and local `stillUsesLake` / `dependsOnLake` remain
   **true**. Lake build of SubsetFront (+ exe) green for claim of structural
   pins / theorems while Lake is host elaborator.
7. **Presence dual-pin** if new Lean modules require host presence tokens;
   pure Nix specs updated surgically; `just systems-host` green.
8. **Docs:** `self-host.md` M3 implement row done; residual archive; handoff /
   WATCHER next (M4 design or plan default). free/complete/StillUsesLake/
   PROVABLY/llvm **unchanged**.
9. **Gates:** `just subset-front` (or named recipe) green; lake build SubsetFront
   green; `just systems-host`; `just product-residual-free-measure`; `just hygiene`
   if md.

**Non-claims (implement residual):**

1. Not S4 / M6; not product StillUsesLake false.
2. Not free or complete product tip re-open or flip.
3. Not PROVABLY; not llvm unlock; not Step 4.
4. Not full language elaborator; Mult subset front-end only.
5. Not freestanding source compiler without Lake.
6. Not shell/Python parser; not hand product C features.
7. Not required: freestanding C port of parser; Graph/Compose grammars; M4 product-wire without Lake.

---

## 8. Explicit non-claims (this design note)

1. This note does **not** implement parser/checker or land goldens.
2. This note does **not** flip any product claim bools.
3. Not S4 / M6 / StillUsesLake false.
4. Not free / complete product changes.
5. Not PROVABLY / llvm.
6. Not inventing residual Names beyond the implement draft above.
7. Not claiming FirstSurface already is M3 (fixed fixture only).

---

## 9. Suggested residual Open switch after this design

1. Archive **M3 subset language front-end design** as Done with path to this note.
2. Open **M3 subset language front-end implement** with Done when from section 7.
3. Keep S4/M6 deferred; do not empty Open; plan Remaining continues to M4+ after implement.

WATCHER should carry `/implement` for the implement Name once residual Open
switches.
