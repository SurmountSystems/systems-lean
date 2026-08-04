# Project lean4 skill use (Systems Lean)

**Kind:** agent skill guidance. Policy index: `AGENTS.md` (**Project agent skills**). Skill body: `.agents/skills/lean4/SKILL.md`.

### When to reach for lean4 tools (planned / residual work)

Use the project **lean4** skill as the default **host Lean** workbench whenever a residual Name, implement plan under `.agents/plans/`, or human task is mainly about **Lean sources, proofs, or Lake builds** under `src/systems/`, `src/lean4/`, or related host modules. Do **not** invent Open Names just to exercise the skill. Prefer freestanding product surface growth over pure theorem theater (see **Systems / Slake residual must grow Lean**).

| Task shape (examples) | Reach for | How (host-agnostic) |
|-----------------------|-----------|---------------------|
| New host module / API surface with stubs or `sorry` | **draft** then **prove** (or **formalize** if claim + proof together) | "Use lean4 skill: draft skeletons for X, then guided prove" |
| Long unattended sorry-fill with a budget | **autoprove** | "Use lean4 skill: autoprove with max cycles / wall budget; stop when stuck" |
| Human wants to refute a bad claim, not prove it | **disprove** | Guided counterexample / negation search; do not rewrite the original theorem header |
| Lake / elaborator errors, timeouts, instance soup | **doctor** + skill error refs | Diagnose environment, then compilation-errors / instance patterns |
| Quality pass before calling a residual Name done | **review** (read-only) | After green `lake` / gates; review does not replace `just check` |
| Proof works but is heavy or unreadable | **refactor** then optional **golf** | Only after correctness; keep freestanding claims honest |
| Safe progress checkpoint (build + axiom scan) | **checkpoint** | **No agent `git commit`** -- report status; human signs commits |
| Learning mathlib / Lean idioms for a dual or host proof | **learn** | Prefer skill pathways over ad-hoc web thrash |
| Stuck mid-slice on a hard goal | **prove** cycle (plan / work / replan) | Use LSP tools when available; scripts via `skills/lean4-skills/plugins/lean4/bin` |

**Map to this repo's workstreams** (not an Open queue -- guidance only):

| Workstream | Paths | lean4 skill role |
|------------|-------|------------------|
| **Systems / Slake host** | `src/systems/**/*.lean` | Primary: draft/prove host theorems, fix Lake, review before Done when, doctor on build breaks. Product wire still comes from emit / freestanding C ownership docs -- skill does not replace emit SSOT. |
| **Lean-side dual** | `src/lean4/**/*.lean` | Primary: dual examples, correspondence proofs, mathlib leverage, review/golf. |
| **Idris-side dual** | `src/idris2/` | **Not** a lean4-skill target. Use Idris tools; skill only if you are temporarily in Lean duals. |
| **Nix gates / hygiene / just** | `nix/`, `justfile` | **Not** lean4 skill. Pure Nix + project policy. |
| **Emit / freestanding C product wire** | `emit/`, `out/freestanding-c/` | Skill helps **host Lean** that owns SSOT text and emit drivers; do not hand-author product C "with the skill." |
| **Plans under `.agents/plans/`** | implement slices | When Done when mentions Lake, theorems, or `.lean` paths, load lean4 skill at slice start; still follow residual Name / Out of scope. |

**Typical residual slice loop (host Lean):**

1. Read residual **Name / Goal / Done when / Out of scope / Paths** (or the plan phase).
2. Load `.agents/skills/lean4/SKILL.md` if any primary path is `.lean` or Lake.
3. Prefer red/green project gates first (`just systems-host`, focused Lake, `just check` as appropriate).
4. Use skill workflows for declaration/proof work; use project gates for "done."
5. Document slice outcomes in residual / handoff / ownership maps as usual.

**Do not use lean4 skill as a substitute for:** inventing residual, growing shell/C product work, forging freestanding/PROVABLY claims, agent commits, or pure Nix policy mills.

