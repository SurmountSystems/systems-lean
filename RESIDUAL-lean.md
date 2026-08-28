# Residual -- Lean side (`src/lean4/`)

**Chat role:** Systems Lean -- Lean side
**Owner residual file for this conversation:** this file only (`RESIDUAL-lean.md`)
**Do not** treat coordinator `RESIDUAL.md` or `RESIDUAL-idris.md` as the Lean work board.

Fork prompt: `doc/fork-lean.md`. Re-read `doc/fork-guidance-lean.md` every implement loop.

**Host Lean tooling:** for Open items (or deferred work the human unblocks) that
are mainly `.lean` / Lake proofs under `src/lean4/`, load project skill
`.agents/skills/lean4` and follow `AGENTS.md` **When to reach for lean4 tools**
(draft/prove/review/doctor/learn). Do not invent residual for the skill.

**Status vocabulary:** `open` | `in progress` | `done` | `blocked` | `wontfix`

**Language:** say **Idris side** / **Lean side** / **bridge half** / **fork**. Follow `AGENTS.md` banned-jargon list.

---

## Done

| Id | Item | Status | Paths |
|----|------|--------|-------|
| L-DONE-MAP | First-cut multiplicity / erasure map | **done** | `src/lean4/multiplicity-map.md` |
| L-DONE-EX | Classic Lean ConsumeToken sketch | **done** | `examples/ConsumeToken.lean` |
| L-DONE-ERASED | Classic Lean ErasedIndex dual (MULT-0) | **done** | `examples/ErasedIndex.lean` |
| L-DONE-SHARE | Classic Lean UnrestrictedShare dual (MULT-OMEGA) | **done** | `examples/UnrestrictedShare.lean` |
| L-DONE-FAILCLOSED | Classic Lean FailClosedGrade dual (unknown Mult tag) | **done** | `examples/FailClosedGrade.lean` (Phase C 2026-08-08) |
| L-DONE-PAIR-SWAP | Classic Lean LinearPairSwap dual (two MULT-1 resources) | **done** | `examples/LinearPairSwap.lean` |
| L-DONE-RUNTIME | Classic Lean RuntimeExtract dual (RUNTIME-FS vs classic/edge) | **done** | `examples/RuntimeExtract.lean` |
| L-DONE-AFFINE-DROP | Classic Lean AffineDrop dual (EDGE-AFFINE honesty) | **done** (Wave 1 B) | `examples/AffineDrop.lean` |
| L-DONE-AFFINE-OWN | Classic Lean AffineOwn dual (EDGE-AFFINE product ownership deepen) | **done** (2026-08-11) | `examples/AffineOwn.lean`; PRODUCT-OWN; report `.agents/reports/impl-affine-product-dual-deepen-2026-08-11.md` |
| L-DONE-TRUST | Trusted computing base notes for duals | **done** | `examples/TRUST.md` |
| L-DONE-JOIN | Greppable join table (JOIN-ALG + EDGE-AFFINE) | **done** | `JOIN.md` (six JOIN-ALG + AffineDrop + AffineOwn) |
| L-DUAL-MAP | Dual-update map + edge crosswalk from real Idris text | **done** | multiplicity-map |
| L-EDGE-XWALK | Durable Lean <-> Idris edge crosswalk | **done** | multiplicity-map edge table |
| L-README | README dual status + residual pointer | **done** | `README.md` |
| L-JARGON | Language hygiene under Lean product sources | **done** | examples clean of banned jargon |
| L-CHECK-SH | Presence/syntax red/green gate | **done** | pure Nix `just lean-side`; optional `just lean-elaborate` (check.sh deleted) |
| L-LAKE | Minimal Lake package + optional elaborator | **done** | `lakefile.toml` roots for four examples |
| L-RESIDUAL | Living inventory in this file | **done** (kept current) | this file |

---

## Open (optional / deferred)

| Id | Item | Status | Notes |
|----|------|--------|-------|
| L-FORMAL-ISO | Formal map theorems in Lean | **open** (deferred) | After duals stabilize + human prioritizes proofs |
| L-MORE-DUAL | Further duals | **held** (operator promote) | Six JOIN-ALG + AffineDrop + AffineOwn EDGE-AFFINE duals landed; further pairs only when a named map gap requires a new algorithm id |

**Living tip (JOIN-ALG):** six JOIN-ALG duals on disk both sides with Idris under
`src/idris2/examples/`. EDGE-AFFINE duals AffineDrop + AffineOwn **documented**
(product ownership deepen 2026-08-11). Dual formal map on Systems host is
**present-partial** (two edges). Full product affine ABI remains **held**.

---

## Explicit non-work

| Id | Rule |
|----|------|
| L-NO-SYSTEMS | Do not implement `src/systems/` freestanding body |
| L-NO-IDRIS-WRITE | Do not rewrite `src/idris2/` sources |
| L-NO-LLVM | Do not start `out/llvm-ir` |
| L-NO-PROVABLY | Do not claim CompCert PROVABLY |
| L-NO-GIT | Do not stage/commit/push unless the human asks |

---

## External (not Lean-fork duty)

| Id | Item | Status | Unblock |
|----|------|--------|---------|
| L-COORD-JOIN | Coordinator merge imperfect edges into `doc/divergence.md` / `RESIDUAL.md` | **done** (coordinator) | Greppable imperfect edges under `doc/divergence.md` section **Greppable imperfect edges (dual pair)**; `RESIDUAL.md` Join done row |

---

## Highest value next (if continuing Lean chat)

1. **Stop Lean autonomous loop** unless the human prioritizes **L-FORMAL-ISO** or a named new dual.
2. Do not invent residual to keep the watcher spinning.
3. **L-COORD-JOIN** is **done** (coordinator merge landed); no further Lean-fork duty there.
4. Systems finish program next is Package 1 **Full backend claim true** under
   `src/systems/` (Systems fork), not this tree.

---

## Next residual implement prompt (Lean side)

```
blocked (Lean side): dual depth residual for this fork is current
(six JOIN-ALG: ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade,
LinearPairSwap, RuntimeExtract). Further duals held (operator promote).
Imperfect edges coordinator merge is done (doc/divergence.md).
Optional formal map theorems only if human prioritizes.
Do not edit src/idris2 or src/systems.
Follow AGENTS.md language rules. No freestanding/PROVABLY forge. No git.
```
