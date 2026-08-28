# Implement report: residual lockstep after approve-with-notes

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). Hygiene equivalent: `nix eval` of
`source-hygiene.nix` + `professional-tone.nix` **exit 0**.

---

## Goal

Update living residual / watcher / handoff so the queue matches the operator
**approved-with-notes** choices (2026-08-12). Do not flip claim bools. Do not
touch the mid-flight Compose SSA writer. Do not invent a C fail-closed residual.
Do not open cold compose init unroll.

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Living tip approved-with-notes; Compose SSA **in progress**; two new Open Names full schema; plan row approved-with-notes; highest-value next; Done archive row |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS**; Compose SSA first; LLVM timing and host-package elaborate meet parallel; no residual queue-number title |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next; table rows |
| `.agents/reports/impl-residual-lockstep-approve-notes-2026-08-12.md` | This report |

No product Lean. No emit C. No `just/llvm*.just`. No `just/bench-*.just`.

---

## Names opened (ordinary English)

| Name | Status | Role |
|------|--------|------|
| Compose SSA lower partial | **in progress** (kept) | Writer exists; `slake_compose_ssa.ll` still missing until sibling finishes |
| SSA llvm-as expected set | **open** (kept) | LLVM / Rust second target |
| Richer-than-i32 layout | **open** (kept) | LLVM / Rust second target |
| IR consumer link smoke | **open** (kept) | LLVM / Rust second target |
| LLVM IR compile and run timing | **open** (new) | `just bench-llvm`; not CompCert; not production backend |
| Full host package elaborate meet | **open** (new) | Slake does every Lake host-develop job; pin stays false; emit targets first |
| Cold compose init unroll | **not open** (kept) | Leftover mixed; operator notes stay not open |

Highest-value next stays **Compose SSA lower partial** until `slake_compose_ssa.ll` exists.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / harness / TERM dual-ok | 206 / 99 / 46 |
| package-env | Mult..ParityEmit + U2 + S5 (not seed-wide) |
| systems-emit-wire | green |
| FULLHOST_FLIP | no |
| Speed | empirical (`just bench-runtime`); never rename as PROVABLY |

No Lean claim-bool edits.

---

## Locked choices honored

1. Finish mid-flight Compose SSA writer (do not rewrite). Marked **in progress**.
2. No invented C product-meaning change. Completeness is both emit targets telling the same story.
3. LLVM assemble / object / execute is its own Open Name.
4. Cold compose init unroll stays **not open**.
5. Full host package elaborate meet started. FullHostElaborateRemains stays **false**.
6. Proved-dominance stays **false**.
7. Production-backend work is the four LLVM Names (SSA / layout / link). Band FullBackend stays **false**.

---

## Hygiene

`just hygiene` could not start: sibling `just/bench-llvm.just:164` fails just
parse (`ret i32 1`). This lockstep did **not** edit that file.

Same gate the recipe runs:

```
nix eval --impure --raw --expr '<source-hygiene + professional-tone>'
```

**exit 0**

Output: `source-hygiene OK (1328 files; ASCII except allowlist; no trailing
whitespace; no stitch/merge markers); professional-tone OK (669 markdown
files; 28 banned tokens; whole-token; novel *.md only)`

---

## Out of scope (honored)

- Product Lean / C / Nix implementation
- Claim-bool flips
- Opening cold compose init unroll
- Inventing a C fail-closed residual
- Touching `LlvmComposeSsa*.lean`, `just/llvm*.just`, `just/bench-*.just`, emit C
- Git add / commit / push
