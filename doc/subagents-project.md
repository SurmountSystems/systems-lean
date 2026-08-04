# Subagents and token efficiency (project)

**Kind:** process detail. Global law: `~/.grok/AGENTS.md`. Project hard isolation and residual still win in tree.

## Overview

**Goal: token efficiency under attention limits.** Maximal **strategic** use of parallel subagents -- not maximal spawn count, not parent solo on deep work, not thrash.

### Context economics (plan against these)

- **Attention dilution:** parent quality drops as context fills -- often well before the hard cap. Parent is a **coordinator budget**, not a tool-output warehouse.
- **Soft quality band:** keep the parent near **~40%** of its effective context when you can.
- **Cost knee:** treat **~200k** parent tokens as a soft ceiling where further tokens get expensive (often ~**2x**). Hard ceiling may be higher (e.g. **500k**); do **not** treat "room left" as "fill it."
- **Child isolation is the win:** each subagent has a fresh context. Heavy read/search/edit loops belong in children; parent holds goals, artifact paths, and short join results.

### Maximal strategic use

| Pattern | When | Parent keeps |
|---------|------|----------------|
| Parallel **explore** (read-only) | Disjoint dirs/files | Bullet map + paths only |
| Independent research | Live contract vs local inventory | One-line results each |
| Implementer + true-independent background | Scopes do not race | Exit codes + log paths |

Rules of thumb:

1. **Spawn for depth, not ceremony.** Many greps/reads/edits -> child. 1-2 lookups -> parent.
2. **Join on disk.** Children write short summary files; parent reads those, not full transcripts or whole hot modules "to be sure."
3. **Tight prompts.** Self-contained: goal, paths, acceptance, hard non-claims, output path. No parent history dump.
4. **Short returns.** Verdict, files, residual bullets -- not novels.
5. **One wait for many.** Launch independent children together; multi-id wait. Do not serialize independent explores.
6. **`resume_from` for rounds.** Fix/re-review resumes the same agent when possible.
7. **Right type.** Prefer explore/plan (read-only) for mapping; general-purpose only when writes are required.
8. **Cap concurrency** (~2-4 typical). Raise only with clean disjoint scopes.
9. **Right-size effort.** effort=1 is the token-efficient default; escalate only when risk justifies multi-reviewer cost.

### Anti-patterns (waste)

- Spawning for pure status ("is the file there?")
- Fan-out of N identical explores over the same scope
- Parallelizing a serial dependency
- Parent re-implementing or re-grepping after a child finished
- Stuffing the parent with raw logs when path + exit + short tail would do
- Nested spawn fantasies (children cannot spawn children in this host)
- Gate-only mills with no new named delta

### After compaction

Reseed from `RESIDUAL.md`, handoff, and on-disk summaries. Prefer `resume_from` when the host still has the child id. Soft ~40% / ~200k knee still apply to the **new** parent window.

Fork prompts embed the same implement-loop design: `doc/fork-idris.md`, `doc/fork-lean.md`, `doc/fork-systems.md`.

---

