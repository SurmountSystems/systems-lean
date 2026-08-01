# Project agent skill submodules

Read-only **upstream skill packs** vendored as git submodules. Not product source.
Not novel Systems Lean implementation.

| Path | Upstream | Role |
|------|----------|------|
| `skills/lean4-skills` | [cameronfreer/lean4-skills](https://github.com/cameronfreer/lean4-skills) | Lean 4 prove / formalize / review / golf workflows for coding agents |

## Discovery (project skill root)

Agents discover skills under **`.agents/skills/`** (Grok, Cursor, OpenCode, and similar hosts walk that path from the repo root).

| Symlink (tracked) | Target |
|-------------------|--------|
| `.agents/skills/lean4` | `skills/lean4-skills/plugins/lean4/skills/lean4` |

SSoT for layout and policy: root **`AGENTS.md`** section **Project agent skills**
(including **When to reach for lean4 tools** for residual / plan work).
Entry notes: `doc/lean-entry.md`. License: `LICENSES.md`.

## Reach for lean4 tools when...

Agents should load the project **lean4** skill for planned residual that is
mostly **host Lean** (not invent work for the skill):

| Residual / plan focus | Workflows (see skill SKILL.md) |
|-----------------------|--------------------------------|
| New host modules, `sorry`, dual examples | draft, formalize, prove |
| Unattended sorry budgets | autoprove |
| Refute a claim | disprove |
| Build / elaborator pain | doctor |
| Pre-done quality | review (plus project `just check`) |
| Cleanup after green | refactor, golf |
| Progress report without agent commit | checkpoint (human commits) |

**Systems host** (`src/systems/`) and **Lean-side dual** (`src/lean4/`) are the
main consumers. **Idris side**, pure **Nix** gates, and hand-authored freestanding
**C** are not lean4-skill work. Skill helps Lean that owns emit SSOT; it does not
replace freestanding product wire policy.

## Rules

- **Do not edit** submodule trees as product. Bump the pin; send upstream fixes upstream.
- **Not** under `ref/` -- `ref/` is language/compiler upstream only (Idris 2, Lean 4, CompCert, Rust).
- **Excluded** from novel source hygiene and honest `scc` (same idea as `ref/`).
- Project policy in `AGENTS.md` **wins** over skill defaults (e.g. agents never run `git commit`; freestanding vs classic Lean honesty).

## Clone / update

```bash
git submodule update --init --recursive skills/lean4-skills
# or full tree:
git submodule update --init --recursive
```

Optional helper PATH for full lean4-skills scripts (not required for skill body discovery):

```bash
export PATH="$PWD/skills/lean4-skills/plugins/lean4/bin:$PATH"
```

See upstream `skills/lean4-skills/INSTALLATION.md` and `skills/lean4-skills/README.md`.
