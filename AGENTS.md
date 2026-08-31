# AGENTS.md -- Systems Lean

Policy for humans and coding agents working on the **Systems Lean** project (checkout may live under a path like `.../iso`; **iso / Iso / SystemsLean / SystemsLeanLean4** are internal Lake or directory ids only, from when this tree first started; the project name is Systems Lean).

Global rules in `~/.grok/AGENTS.md` still apply (subagents, multi-chat, GPG). This file is project-specific and wins on conflict for work **in this tree**.

---

## Discovery after compaction (read order)

1. **This file** (`AGENTS.md`) -- policy, **Three languages only**, **Project agent skills**, **Document slices so they survive compaction**, **Repository structure**, **Nix tooling**
2. `doc/SESSION-HANDOFF.md` -- Status + **Decisions and discovery** table + three-languages reseed
3. `RESIDUAL.md` (join board) + `RESIDUAL-systems.md` (Systems Open/Done/**Decisions**) + `WATCHER.md` (next action only)
4. `doc/goals.md` and `doc/vocabulary.md` if goals or terms (including tooling terms) are unclear
5. `doc/architecture.md` / `doc/divergence.md` for technical framing
6. Entry maps when touching refs: `doc/idris-entry.md`, `doc/lean-entry.md`, `doc/compcert-entry.md`, `doc/rust-entry.md`
7. Workspace READMEs: `src/idris2/`, `src/lean4/`, `src/systems/` -- Systems also: **`src/systems/emit/host-owned-emit.md`** (freestanding C ownership SSoT)
8. **Project skills:** `.agents/skills/` (symlinks) + submodule bodies under `skills/` -- see **Project agent skills** below

Do **not** re-map the whole universe in parent context if handoff + residual already answer.
Do **not** re-derive product ownership or Open-queue rules from chat when the tables above already state them.

**Held hard work:** do not start items listed under Hold in `RESIDUAL.md` unless this chat has claimed research or primary implementor ownership for that work (supports clean chat forks).

---

## Project agent skills (discoverability)

Project-specific coding-agent skills ship **in this repository** so every clone discovers them without a global install.

| Layer | Path | Role |
|-------|------|------|
| **Discovery root** | `.agents/skills/` | What hosts walk (Grok, Cursor, OpenCode, and similar). Symlinks only + small README. |
| **Skill bodies (submodules)** | `skills/<pack>/` | Read-only upstream skill packs (git submodules). Not product Lean/Idris/Nix. |
| **Ephemeral plans** | `.agents/plans/` | Implement plans -- **not** skills. |
| **Operator skills (host)** | `~/.agents/skills` (and Grok `~/.grok/skills`) | Machine-local; not product git. |

### Current packs

| Skill name | Symlink | Submodule body | Upstream |
|------------|---------|----------------|----------|
| **lean4** | `.agents/skills/lean4` -> `../../skills/lean4-skills/plugins/lean4/skills/lean4` | `skills/lean4-skills` | [cameronfreer/lean4-skills](https://github.com/cameronfreer/lean4-skills) |

Inventory prose: `skills/README.md`, `.agents/skills/README.md`. Lean entry pointer: `doc/lean-entry.md`.

### How agents should load them

1. Prefer the **project** skill when editing `.lean` under this tree (prove / formalize / review / golf workflows from the lean4 skill).
2. Read `SKILL.md` via the discovery path (`.agents/skills/lean4/SKILL.md`); do not invent a second copy under the repo root.
3. Optional helper binaries (sorry analyzer, search wrappers): put `skills/lean4-skills/plugins/lean4/bin` on `PATH` for the session. Not required for skill-body discovery.
4. Clone/update: `git submodule update --init --recursive skills/lean4-skills`.

### When to reach for lean4 tools (planned / residual work)

**Detail:** `doc/lean4-skill-use.md` (task-shape table + workstream map + residual slice loop).

Use the project **lean4** skill as the default **host Lean** workbench when residual or plan work is mainly `.lean` / Lake under `src/systems/` or `src/lean4/`. Do **not** invent Open Names only to exercise the skill. Prefer freestanding product surface growth over pure theorem theater. Skill does **not** replace emit SSOT (`emit/host-owned-emit.md`) or pure Nix gates.

### Policy overrides (this project wins)

Upstream skill packs may suggest commits, global installs, or Python helpers. **This repository's `AGENTS.md` still applies:**

- Agents **never** run `git commit` / `git push` (human-signed commits only).
- Novel product work stays **Idris 2 / Lean 4 / pure Nix** under `src/` and `nix/`. Submodule Python/shell under `skills/` is **upstream tooling**, not a license to add project Python.
- Do **not** edit `skills/*` as product. Bump the submodule pin; send fixes upstream.
- Freestanding honesty: classic Lean ahead-of-time and mathlib workflows are **not** freestanding product wire. Skill use for host Lean proofs is fine; do not sell it as `out/freestanding-c` residual free.

### Not under `ref/`

`ref/` is **language/compiler** upstream only (Idris 2, Lean 4, CompCert, Rust). Agent skill packs live under `skills/` so isolation maps stay honest.

### Hygiene / line-count honesty

`skills/` is excluded from novel source hygiene and honest `scc` (same idea as `ref/`). See `nix/novel-source.nix` and `just progress-scc`.

---

## Isolation (hard rule)

**Default: work only in this repository.** This repo **is** Systems Lean.

- Implement the Systems Lean language and the **Slake compiler** **here**.
- Use `ref/*` as **read-only** upstream language/compiler references.
- Use `skills/*` as **read-only** upstream agent skill packs (see **Project agent skills**).
- Do **not** open other trees for routine residual, "sync," or implementation.
- Leave isolation **only** when the human says we are **absolutely desperate** for a specific off-repo solution.

This is intentional. Other trees have been unproductive places to send agents. Stay here.

---

## What this project is

| Name | Meaning |
|------|---------|
| **Systems Lean** | **This project** and its language (Lean 4 + linear/affine ownership + minimum Quantitative Type Theory grades 0/1/omega for freestanding work) |
| **Slake** | The **compiler** written in Systems Lean: meet-in-the-middle Idris 2 and Lean 4, freestanding backends |
| **Primary emit** | Runtimeless freestanding C (`out/freestanding-c`): memory safety from linear types, **no garbage collection** on the product wire |

Canonical goals: `doc/goals.md` (read **Primary product focus**). Stable words: `doc/vocabulary.md`.

**Focus:** Systems Lean + Slake + freestanding runtimeless C. Do not dilute into unrelated tooling essays or deferred LLVM work before self-host.

---

## Three languages only (hard rule)

Novel work in this repository uses **exactly three languages**. Nothing else is a home for product logic or tooling logic.

| # | Language | Where it belongs | What it is for |
|---|----------|------------------|----------------|
| 1 | **Idris 2** | `src/idris2/` | Idris-side bridge work (maps, duals, join notes that live with Idris sources) |
| 2 | **Lean 4** | `src/lean4/` and `src/systems/` | Lean-side bridge work **and** Systems Lean / **Slake** (the freestanding product and compiler host synthesis) |
| 3 | **Nix** (modern **flakes**) | `nix/` + thin root `flake.nix` | Project tooling: gates, meters, filters, continuous-integration checks -- **pure** modules, not scripts hidden inside Nix |

### What is not a fourth language

These may appear on disk but are **not** places to implement new product or tooling algorithms:

| Surface | Role | Rule |
|---------|------|------|
| **Python** | Forbidden | No `*.py`. No "temporary" Python gates or meters. Ever. |
| **Shell / bash** (`.sh`, long recipes) | **Scheduled deletion** or **thin process glue** only | Do not grow it. Port logic into Lean 4 (product/gates that belong with Slake) or pure Nix (tooling). Delete when the exit criterion is met. |
| **Bash-in-Nix / shell-in-Nix / Python-in-Nix** | Forbidden | Embedding a shell or Python program inside `writeShellApplication`, `runCommand`, or similar and calling it a flake is still shell/Python. Not allowed. |
| **Freestanding C** (`out/freestanding-c/`, emit outputs) | **Product wire** (what Slake emits) | Generated release surface -- not a language for writing the project or its tools. Not "debt"; it is the product. |
| **Markdown** | Human/agent prose | Docs and residual ledgers only -- not executable product. |
| **`just` / justfile** | Thin task runner | Root `justfile` imports `just/*.just` (same namespace). May call Nix eval, print, sleep, or invoke **existing residual** scripts / lake exe. Must not become a shell program farm. Keep recipes short. See **Sub-1-KLOC** and **Never grow long bash in justfile** below. |
| **`ref/`** | Read-only upstream | Do not treat upstream languages or scripts as our product stack. |

### Pay down, do not accumulate (hard rule)

In the era of machine intelligence, large labeled piles of shell/C are a **choice**, not a law of nature. Ports to Lean 4 and pure Nix are cheap enough that **accumulation is failure**.

| Do | Do not |
|----|--------|
| **Pay down** scheduled-deletion items until the file is gone or reduced to thin process glue | Call permanent product wire / behavioral tests / thin just orchestration "debt" forever |
| Give every removable surface an **owner language** (Lean or pure Nix) and an **exit criterion** | Freeze banners without a delete path |
| Measure novel `scc` with honest excludes (`ref/`, `skills/`, `.lake/`, `.cache/`) | Inflate C counts with classic Lean ahead-of-time intermediate representation under `.lake` or vendored skill packs |
| Keep **product wire**, **behavioral tests**, and **process glue** as honest permanent roles when they belong | Grow shell or hand-written product C and call it residual progress |

**Word "debt":** reserve it for **scheduled deletion** (must leave the tree or shrink to process glue). Prefer role names for everything else: **product wire**, **behavioral tests**, **process glue**, **tool config**.

**Line-count honesty:** if novel `scc` (excluding `ref/`, `.lake/`, `.cache/`) shows Shell dominating Nix and Lean product sources, that is **regression**, not success. Do **not** claim shell is gone while scheduled-deletion `.sh` remains.

Plan (waves): `.agents/plans/plan-paydown-shell-c-surfaces.md`.

### Scheduled deletion (must leave; exit criteria)

**Delete on sight (forbidden mills; do not restore):**

- `script/progress.py`, `script/check-source-hygiene.py`, `script/check-source-hygiene.sh`
- `script/check-all.sh`, `script/watch-forks.sh`
- Any new `*.py` under this repo (outside `ref/`)

| Path | ~Lines | Exit criterion | Owner language |
|------|--------|----------------|----------------|
| `script/slake-emit-freestanding-c.sh` | gone | **Met (Wave C):** deleted; Lean `SystemsLean.FreestandingEmit` + templates write `slake_freestanding.{c,h}` from SSOT | Lean (`SystemsLean` emit) |
| `src/idris2/check.sh` | gone | **Met (delete glue):** deleted; static mill pure Nix (`just idris-side`); optional elaborator `just idris-elaborate` | pure Nix + thin just |
| `src/lean4/check.sh` | gone | **Met (delete glue):** deleted; static mill pure Nix (`just lean-side`); optional elaborator `just lean-elaborate` | pure Nix + thin just |
| `script/build-systems.sh` | gone | **Met (Wave B):** deleted; product path is root `just build` (not a stamp-only recipe) | just product wire |
| `script/out-freestanding-c.sh` | gone | **Met (Wave B):** deleted; former `just out-freestanding-c` recipe **retired** into `just build` (Wave C Lean emit + install) | just + Lean emit |
| `script/slake-compile-path.sh` | gone | **Met (delete stamp):** shell stamp deleted; static unit walk + host presence pure Nix (`systems-emit-wire` / `systems-host`); host deepen `SLAKE_COMPILE_PATH_V1` / `HOST-COMPILE-PATH` in `SystemsLean/CompilePath.lean`; greppable retired id `SLAKE_COMPILE_PATH_V0` remains in `just/product-wire.just` honesty only | pure Nix + Lean host |
| `src/systems/check.sh` | gone | **Met (delete glue):** deleted; static mills pure Nix; optional Lake `just systems-lake`; product wire exercise `just systems-cc-probe` (no CompilePath shell re-check) | pure Nix + thin just |

**Emit shell deleted (Wave C).** Do not restore `script/slake-emit-freestanding-c.sh`. Product wire comes from Lean emit / freestanding-capable path + emit templates + SSOT.

**Compile-path stamp shell deleted.** Do not restore `script/slake-compile-path.sh`. Static compile-path / unit walk is pure Nix (`just systems-emit-wire` / `just systems-host`); host deepen is `SystemsLean/CompilePath.lean`.

### Permanent roles (not "debt")

| Role | Paths | Rule |
|------|-------|------|
| **Product wire** | `src/systems/emit/*.{c,h}`, `out/freestanding-c/*` | Generated freestanding C. Publish via git subtree / tarball. Do not hand-author features in C. |
| **Behavioral tests** | `src/systems/smoke/slake_behavioral_probe.c` | Hosted product-contract tests linked against the wire. Do not grow as Systems Lean body. Prefer shrinking only when Lean theorems **duplicate** a live `cc` contract with evidence. |
| **Process glue** | Thin just recipes (`idris-elaborate`, `lean-elaborate`, `systems-lake`, `systems-cc-probe`, `build`/`check` orchestration); tiny `script/git-hooks/pre-commit` (calls `just pre-commit` / `just check`) | Orchestration that must invoke external binaries. Keep tiny. Not a place for algorithms. Novel workspace `check.sh` **deleted**. Install optional local hook: `ln -sf ../../script/git-hooks/pre-commit .git/hooks/pre-commit` from repo root (or copy). Prefer `just check` / flake checks as the real gate surface. |
| **Host emit SSOT text** | `src/systems/emit/host_emit_*.ssot.txt` | Lean-owned fragments; not shell dialect. |
| **Tool config** | `lakefile.lean` / `lakefile.toml`, `lake-manifest.json`, CI YAML | Config only. |
| **Prose** | `doc/`, residuals, plans, README | Humans and agents; min useful. |

**Target end state:** product and gates live in **Lean 4** / **Idris 2**; tooling lives in **small pure Nix modules**; `just` is a short modular menu; scheduled-deletion shells are **gone**; remaining shell is process glue only.

### Sub-1-KLOC -- novel files stay under 1000 lines (hard rule)

**Every novel file we keep must stay under 1000 lines on disk** (sub 1 KLOC). Applies to:

| Surface | Rule |
|---------|------|
| **Root `justfile` + `just/*.just`** | Modular via `import` (same namespace so recipe names stay flat: `just check`, `just systems-host`). Root is a thin menu only (set shell, imports, `default`, `check`). Prefer each module well under ~800 so growth room exists. |
| **Pure Nix under `nix/`** | Same bar; split data/helpers when a module grows past 1000. |
| **Lean sources under `src/`** | Same as long-file residual (split seams; no full-file rebuild). |
| **Novel prose / process surfaces** | Prefer under 1000; large residual/self-host maps may still need a named split residual. |

**Growing any of the above past 1000 lines is residual** (split by role, or port gate logic to pure Nix). Do not leave an 8k-line just kitchen sink.

**Honesty exceptions (do not claim "all files" green while these remain over):** permanent **product wire** C (`src/systems/emit/*.{c,h}`, `out/freestanding-c/`), large generated writers, and living maps such as `src/systems/self-host.md` until a named generator/doc split residual. Behavioral probe C is a permanent test role, not a license to grow hand-written product C.

**Map:** `just/README.md`. Pure Nix gate paths that scan just recipes must point at the owning `just/*.just` module (not only root `justfile`).

### Never grow long bash in justfile (hard rule)

**Never** dump multi-hundred-line bash programs into root `justfile` or `just/*.just` for residual progress or presence gates. `just` is a **thin task menu only**.

| Gate / check shape | Where it lives |
|--------------------|----------------|
| File existence, token presence, pin shapes, forge bans | **Pure Nix** under `nix/<small-module>/` (idiomatic flake checks; split if >~100-150 lines; one job per file). Mirror `systems-host-presence` / `systems-emit-wire` / `systems-llvm-ir`. |
| Live impure eval | Thin just: `nix eval --impure --raw --expr ...` of the pure module (e.g. `just systems-host`, `just systems-llvm-ir`). |
| Lake / host writers | Thin just: short banner (one stage id), `lake build` / `lake exe`, then re-eval pure gate or rely on `just systems-llvm-ir`. |
| Sleep / print / recipe chain | Thin orchestration only (`just llvm-unit-package` may call `just llvm-mult-text` ... then pure join). |

**Forbidden in just recipe bodies:**

- Copy-paste token `for` loops across many nearly identical recipes
- Residual honesty / non-claims essays as the gate body on stdout (driver stdout policy still applies)
- New bash-in-Nix (`writeShellApplication` policy mills) as a "fix" for long just recipes
- Restoring `script/*.sh` mills or inventing project Python for the same greps
- Growing any single just module (or root justfile) to **>= 1000 lines** (see **Sub-1-KLOC**)

**Pattern (llvm IR paid down):** static Mult..Graph / emit-path / hold greps live in `nix/systems-llvm-ir/`; just `llvm-*-text` recipes only invoke lake writers + pure presence; `just systems-llvm-ir` is the live pure gate. Fold live pure gates into `just check` when honesty requires it (same HITL stage rule as other `nix/` modules).

### Non-product surfaces (scc honesty)

When `scc` counts Shell, C, headers, config, or plain text beyond Lean / Idris / Nix, those are **non-product surfaces**: scheduled deletion, permanent roles above, tool config, or prose -- **not** a fourth novel implementation language. Full policy SSoT is this section; terms in `doc/vocabulary.md`.

**Honest novel `scc` excludes:** `ref/`, `skills/`, `.git/`, `.lake/`, `.cache/` (and similar build junk). Classic Lean ahead-of-time intermediate representation under `.lake` is **not** freestanding product C. Agent skill submodules under `skills/` are not novel product either.

| Surface | Paths (examples) | Classification |
|---------|------------------|----------------|
| **Shell (scheduled deletion)** | none open (dual/static paid Wave A; compile-path greps paid; compile-path stamp shell deleted) | Must leave if any mill returns |
| **Shell (process glue)** | just elaborator/cc recipes (`idris-elaborate`, `lean-elaborate`, `systems-lake`, `systems-cc-probe`); `script/git-hooks/pre-commit` | Keep tiny; no static greps; novel `check.sh` gone |
| **C (product wire)** | `src/systems/emit/slake_freestanding.c`, `out/freestanding-c/` | Generated; permanent role |
| **C Header** | `*.h` beside emit | Same wire |
| **C (behavioral tests)** | `src/systems/smoke/slake_behavioral_probe.c` | Tests; not product body |
| **Plain Text** | `src/systems/emit/host_emit_*.ssot.txt` | Host SSOT fragments |
| **Plain Text** | `doc/PROGRESS-scc.txt` | Generated meter snapshot |
| **JSON / TOML / YAML** | Lake + CI | Tool config |
| **Markdown** | `doc/`, residuals, plans | Prose |

Do **not** claim shell is gone while scheduled-deletion `.sh` remains.

### Freestanding / ahead-of-time (AOT) C git policy

Hand-written product **C is forbidden** as an implementation language for Systems Lean / residual progress (see **No new C or shell product work**). Ahead-of-time (AOT) here means classic Lean managed-runtime IR -- not freestanding product wire.

| Kind | Paths | Git / authoring rule |
|------|-------|----------------------|
| **Generator outputs (product wire)** | `src/systems/emit/*.{c,h}` (from emit driver), `out/freestanding-c/*.{c,h}` | Tracked as **dogfood / release surface** only. Refresh via `just build` (and the emit driver). Do **not** author features by hand under `out/` or treat emit C as Systems Lean source. |
| **README under out** | `out/freestanding-c/README.md` | Human prose for consumers; may be edited. |
| **Host emit SSOT text** | `src/systems/emit/host_emit_*.ssot.txt` | Lean-owned fragments; not free-form product C. |
| **Behavioral tests** | `src/systems/smoke/slake_behavioral_probe.c` | Hosted product-contract tests only; shrink only when Lean covers the live contract; never grow as product body. |
| **Classic Lean AOT IR** | `.lake/build/ir/*.c` (and similar under Lake build trees) | **Not** freestanding product. Managed-runtime AOT IR only. Stay **gitignored / untracked**. Never ship as `out/freestanding-c`. |

**Release:** publish `out/freestanding-c/` via **git subtree** (or tarball) after green `just build` + `just check`. Consumers should not need `ref/*` or the full host. Detail: `out/freestanding-c/README.md`.

### Nix architecture for LLM (large language model) attention and compaction

Agents lose quality when context fills (soft band ~40% of effective context; cost knee often ~200k tokens). Nix layout must **help** that, not fight it.

1. **Small modules, one job each.** Prefer files under ~100-150 lines of one concern. Split helpers / data / render rather than one 500+ line dump.
2. **Thoughtful stable names.** Name for the job (`source-hygiene`, `progress/milestones`), never for a chat wave or session code.
3. **Thin `flake.nix`.** Only wire systems, import modules, expose `checks` / `packages` / `lib` / `devShells`. No embedded script farms.
4. **Pure evaluation first.** Hygiene and meters are Nix that *computes* pass/fail or report text. No hidden shell body doing the real work.
5. **Join on paths, not transcripts.** Parent agents keep module paths and short results; children edit small files -- do not paste whole kitchen-sink modules into context "to be sure."
6. **Same module locally and in continuous integration.** One pure check definition; `just` only orchestrates how humans run it.

Detail, mistake history, and current file map: section **Nix tooling** below. Terms: `doc/vocabulary.md` (Three languages + Tooling terms).

---

## Multi-chat roles (separate sessions)

Hunter often runs **several chats** on this repo. Do not assume which chat this is after compaction -- **ask once** if unclear.

| Session role | Owns | Does not |
|--------------|------|----------|
| **Watcher** | Separate session: residual auto-continue from root `WATCHER.md` (`WATCHER_BEGIN` / `WATCHER_END`); may run `just watch` / meters | Guess role as Slake or dual implementor; invent residual |
| **Systems / Slake** | Freestanding product under `src/systems/`, `RESIDUAL-systems.md`, paste `doc/fork-systems.md` | Race Idris/Lean dual trees; own the watcher session |
| **Idris side** | `src/idris2/`, `RESIDUAL-idris.md` | Freestanding Slake body unless reassigned |
| **Lean side** | `src/lean4/`, `RESIDUAL-lean.md` | Freestanding Slake body unless reassigned |
| **Coordinator** | Join board `RESIDUAL.md`, fork guidance, advisory join honesty | Race active implement forks by default |
| **Research / analysis** | Inventory, correspondence notes under `doc/research/` | Drive product residual unless reassigned |

**Important:** `WATCHER.md` is a **file** the watcher session reads. The watcher is **not** the same chat as Systems / Slake. `just watch` (progress meters every 300s) is tooling any session may run; it is not the watcher role by itself.

Talk in plain English. Prefer file paths and durable terms over wave numbers and ephemeral labels.

### Plans and approvals -- in chat, not only a modal

Hunter **hates approval modals**. They steal focus, hide the actual text, and accidental keypress can look like "approved."

- When a plan exists, **paste or paraphrase the full plan (or a faithful complete dump) into the chat reply**. Do not rely on a host modal as the only place the human can read it.
- Do **not** treat modal dismiss / accidental close / host "plan approved, start coding" as human approval unless the human has clearly said yes in chat (e.g. "execute", "approved", "go").
- If the host auto-approves after a modal accident: **stop, show the plan in chat, wait**.
- **No structured questionnaires** for plan approval or residual clarification. Do not use multi-choice quiz tools (`ask_user_question` or similar). Put the full plan (or the open question) in chat and wait for freeform **Approve** / revise / abandon (or a clear prose answer). Unresolved plan options use documented defaults in the plan, not a quiz.

### Language (agent UX) -- natural, precise, not lazy

### Talk like a normal person (hard rule)

Chat replies, plans, residual Names, watcher text, and handoff status use **plain American English** and complete thoughts. Jargon that needs a decoder ring is a process bug: rewrite it.

| Do | Do not |
|----|--------|
| Name the real thing in a full phrase (what it is, then a path if useful) | Short residual slang that only agents know |
| "Fixed example inputs the checker must accept or reject" | Bare words like "goldens" as if they were ordinary English |
| "Recipe that runs without calling Lake on that step" | Bare "without-Lake" as chat language |
| "Slake path meant to do the same job as Lake" | Bare "peer" with no object |
| "Checklist before we claim host develop no longer needs Lake day to day" | Bare "free bar" |
| First use of any acronym: unpack in parentheses | Acronym soup and stage codes as chat language |
| Keep classic Lean ahead-of-time C, freestanding product C, and our string-printed helpers separate | One vague "Lean prints C" ban |

Write **thoughtful, concise, natural language**. This is not a jargon dump or acronym soup.

- **Low time preference (operator 2026-08-12):** Surmount Systems finishes work
  that is already in flight. Completeness over park. Do not leave a half-done
  writer sitting while you ask another confirm. Do not rewrite a working
  mid-flight module when running it will finish the artifact. Dual-pin:
  `~/.grok/AGENTS.md` section *Low time preference and completeness*.
- **Operator questions use ordinary names (operator 2026-08-12):** never ask
  the human about residual queue numbers (for example "Name 10") or bare
  claim-bool identifiers. Ask the real product thing: "Should we unroll cold
  compose init?" Dual-pin: `~/.grok/AGENTS.md` section *Operator questions use
  ordinary names*.
- **Status reports in ordinary English (operator 2026-08-13; re-pinned
  2026-08-14):** **open every parent chat reply** with a complete
  ordinary-English progress report. Do not wait to be asked. Do not skip
  the report because you are only waiting on a mop or a review. Do not
  bury it after tool waits or end with a one-line "still waiting." After
  compaction or a continued session, the first text the operator sees
  must still be that report. A tool-only first turn is a miss. Lead
  with the real job (which compiler piece, what just compiled, what is
  running, what is next). Residual queue codes, harness counts, and
  claim-bool names belong in residual files, not as the body of a chat
  status. When they ask how much work something is, answer in ordinary
  units (one agent slice / hours / how many host modules still lack the
  check), not a decoder-ring count. Dual-pin: `~/.grok/AGENTS.md`
  section *Status reports in ordinary English*.
- **Progress every turn (operator 2026-08-14):** every parent turn and
  every implement slice starts with that natural-language progress
  report: what compiled, what still does not, and what is next. Keep a
  living remaining-work metric table in ordinary English: how many real
  modules Slake typechecks (today **49 of about 206**, SystemsLean.Mult
  through SystemsLean.HostModuleCheckParityTypesTerm on the Slake
  path; next remaining work is Grow HostModuleCheckParityProgramTerm subset;
  never `lake build SystemsLean.ElabMeetTheorems` or ElabMeet as prove;
  MemoryMax 192 GiB is the ceiling; isolation prove only,
  `LEAN_NUM_THREADS=1`; leakEnv false on the nixbuilder tree; Types
  isolation EXIT 0 (1802 s, 21 jobs) and ElabMeet fold landed; do not
  claim 50 until ProgramTerm isolation EXIT 0; ProgramTerm prove may
  already be in flight; do not start a second Lake);
  skip SystemsLean.Linear as a named membership member and skip IrGraph; FullHost stays false;
  extract first already on disk for ParityTypesTerm: probe 305 helper 63 walk 179;
  ParityProgramTerm extract-first on disk: probe 310 helper 63 walk 180;
  Tail is 863 and Later is 785 and cannot absorb another leftover
  wrapper without passing about 880; CheckersLater walk
  ElabMeetNamedWalkHostModuleCheckCheckersLater is 617 lines, under
  about 780; KernelMultTerm walk is 162; KernelLinearTerm walk is 167; KernelTypesTerm walk is 168; KernelProgramTerm walk is 170; KernelEmitTerm walk is 171; ParityMultTerm walk is 173; Emit walk stays 693; ElabMeetSubset is 865; NamedWalk is
  322; ElabMeetReadyHostModuleCheck is 132;
  helper ElabMeetTheoremsNamedHostModuleCheckParityMultTerm is 63;
  probe ElabMeetNamedHostModuleCheckParityMultTermProbe is 294;
  ElabMeetCompile is 916 and must not grow; Next extract none after SelfHostBodyTerm); how many real host tools
  build
  without Lake on the step (today **0 of about 69**); linear use-check
  status (today **not started**); same-job time (cite
  `doc/BENCH-SAME-JOB-latest.md` idle-hot **0.459 s**; Slake cannot do
  that full-package job; do not invent a fake Slake wall-clock). Same
  spirit as the Status reports in ordinary English rule in
  `~/.grok/AGENTS.md`. Documented in `AGENTS.md`.
- **Do not grow hand-written smoke C (operator 2026-08-13):** runtime
  bench twins under `src/systems/smoke/` are hand-written measurement C,
  not Slake emit. Do not add more of them unless the human explicitly
  orders a named bench. Prefer Lean-owned emit and existing probes.
- **Reports stay short (operator 2026-08-13):** `.agents/reports/` is a
  closeout, not a second documentation tree. Product truth lives in
  living docs (`emit/host-owned-emit.md`, residual, handoff, user-facing
  `doc/`). Do not farm markdown novels to look busy.

- Prefer full words. Do not invent or drop in obscure short forms (e.g. never bare **TCB** -- write **trusted computing base**).
- **First use of any acronym or short form in a reply or durable doc:** unpack in parentheses. Example: Quantitative Type Theory (QTT), garbage collection (GC). After compaction, treat the next use as a new first use.
- If a word is jargon or has multiple meanings, unpack what you mean **here** in a short parenthetical.
- Avoid project-internal slang that needs a glossary to parse. Example: do **not** say **pole** for a language side of the bridge -- say **Idris side** / **Lean side** (or "fork for Idris work" / "fork for Lean work").
- **Wire:** when you mean the freestanding product release surface, say **product wire** (or unpack once: "product wire -- the emitted freestanding C under emit/ and out/freestanding-c"). Do not use bare "wire" as if the reader already knows. Do not confuse with flake **wire-up** (connecting Nix attributes). Canonical: `doc/vocabulary.md` (**Wire / product wire**).
- **Model:** when you mean a Lean or formal representation of contracts or IR, say **host model**, **structural model**, or **representation** -- **never** bare "model" if it could read as an AI/ML model. Canonical: `doc/vocabulary.md` (**Model (host / formal)**).
- **Banned naming jargon:** do **not** use **spine** (or "program spine", stage ids like `IR_PROGRAM_*`) for intermediate-representation structure. Say what it is in plain English: **ordered IR program**, **node list**, **program nodes**, **graph edges**. Existing greppable stage ids that already ship the word may be renamed in a deliberate honesty slice; never mint new `*SPINE*` names.
- **Banned process jargon -- module-split slang (hard ban, all surfaces):** do **not** use the old residual verb for "extract a role module from a long file" (fruit-metaphor stem and its `-ed` / `-ing` forms; also `re-` + stem). That is nonsense internal slang.
  - **Surfaces (all living agent surfaces):** chat replies; **session-board todo titles and content** (new items **and** every upsert -- never mint or re-title with the slang); subagent task descriptions; implement prompts and queued `/implement` text; residual Open Names and living Open/Done status lines; WATCHER fences; SESSION-HANDOFF active/next lines; active plans under `.agents/plans/`; research notes written going forward. Not only gated markdown.
  - **Preferred words:** **long-file split**, **module split**, **seam**, **Theorems helper**, **Scaffold helper**, **extract into a role module**, **theorem/smoke move into `*Theorems`**, **scaffold split**. Residual Open Names use **long-file split**.
  - **Historical UI noise:** completed session-board titles may still show the old slang in the host UI. **Do not** bulk-rewrite hundreds of completed todos. When writing **new** board items or upserting living ones, use preferred words only. Historical research path stems under `doc/dev/research/` that still embed the old stem may stay until a deliberate rename; do not mint new path stems with that slang. Living residual Open/next/WATCHER/handoff/active-plan lines must stay clean (scrub on sight if any slip back).
  - **Gate:** banned tokens live only in `nix/professional-tone.nix` (novel `*.md` automatic fail); do **not** re-list the banned spellings in markdown or the tone gate self-fails.
  - **Agents must not echo** that slang even when a stale user prompt, old todo title, or `/tmp` join basename still uses it -- rephrase to **long-file split** / **module split** immediately.
- **Do not say "pin" / "pinning"** for saving a rule into a file. That is agent-internal jargon.
- When you put a preference or process rule into a durable file, say **documented** (and name the file). Do not use vague fillers like bare **"written"** / "wrote it down" with no object -- say **documented in `AGENTS.md`** (or residual / watcher / the named doc). Prefer "documented" or "recorded in policy" over "pinned."
- The human may be terser; **agents must not** mirror unexplained shorthand.
- **Professional tone:** agent chat and novel project prose stay professional. No profanity in agent output or novel docs. Demeaning subagent language is already banned in global `~/.grok/AGENTS.md` -- follow that; do not restate it here.
- **Professional tone gate (pure Nix, v1):** novel `*.md` only (docs, residual, plans, AGENTS, READMEs). Module `nix/professional-tone.nix` -- short ASCII banned-token list; case-insensitive whole-token match (non-alphanumeric separators). Live: `just professional-tone` or folded into `just hygiene`. Flake check `professional-tone` after human stages new `nix/` paths. Does **not** scan Lean comments, emit C, or shell in v1. Algorithm is pure evaluation (`builtins.readFile` / `lib` walks) -- no shell `rg` policy mill.
- Prose encoding: see ASCII and Unicode rule (allowlist vs strict).

---

## Identifier hygiene and modular layout

**Ephemeral** (plans, residual ledgers, chat, implement prompts only -- **never** product source or permanent APIs):

- Plan **phase** labels (`Phase 1b`, `1a`, ...), **wave** numbers, **track** names, session codes
- `REQ-*` tokens, fashion brand names for temporary ideas
- Creative synonyms for the same ephemeral idea (do not invent "streams", "lanes", "epochs", etc. as product vocabulary)

**Do not pepper the codebase** (`.lean`, `.idr`, emit C, README product maps, module names, greppable host markers that describe the product) with those plan labels. Residual files and chat may mention implement order for humans/agents; product code names **what the thing is** (Mult, Linear, Types, ordered IR program).

**Stable:**

- `Slake`, `Systems Lean`, `freestanding`, module paths, gate names
- Upstream cites under `ref/`
- Greppable honesty tokens when gates exist (e.g. `SYSTEMS_LEAN_HOST`, `MULT-0`) -- durable product/host surface, not plan choreography

**Naming:** name things for what they are (algorithms, roles, release surfaces). Thoughtful names; no thesaurus farms or wave packing. No metaphor names (`spine`, fashion brands) when a structural name exists.

### Product Lean names (hard rule -- operator 2026-07-30; identifiers 2026-07-30)

Hunter rejected the claim-B ladder **name farm**. That includes both **file basenames**
and **Lean / gate identifiers**. Names like
`ProductPathFreestandingPerformDualEqualityWriteCapableGap.lean` and defs like
`productPathFreestandingCapableStepContractFullSatisfied` are **bad product names**:
they pack residual step history into the path or symbol, need a decoder ring, and
fight tab-complete and reseed. Shortening only files while leaving kitchen-sink
claim-bools is **not** the fix.

| Do | Do not |
|----|--------|
| Name the **role** in short English for **modules and new defs** (`CapableWrite`, `DualEqWrite`, `OfficialPath`, `stepContractFull`, `ownershipClaimed`) | Stack every adjective from residual history into one CamelCase / camelCase sentence |
| Prefer a small directory or short basename a tired reader can parse | Mint `ProductPathFreestandingPerformDualEqualityWriteX.lean` for the next B-step |
| Prefer short living-tip SSoT bools when flipping a claim (`stepContractFull`, not a 50-char stack) | Mint or extend `productPathFreestandingCapableStepContract*` kitchen-sink defs as the living tip |
| Keep greppable honesty tokens **inside** the file / pure Nix when gates need them | Put stage ids (`B36`, `CAPABLE-GAP`, plan tracks) in **file names** or permanent API basenames |
| When renaming, surgical `rg` find + hand edit per site (subagents OK for disjoint scopes); green gates | Bulk find-and-replace; drive-by mass rename of the whole historical ladder mid-slice |

**Stop rule for new modules under `src/systems/SystemsLean/`:** do **not** add
another `ProductPathFreestandingPerform*` or `ProductPathFreestandingCapable*`
filename. Existing long **filenames** may stay until a named rename residual; they
are scheduled cleanup, not a template. Next new product-path modules use short
role names (optionally under a short prefix or folder such as `ProductPath/`).

**Stop rule for new / living-tip identifiers:** do **not** mint another
`productPathFreestandingCapable*` or `productPathFreestandingPerform*` kitchen-sink
def as the claim-bool SSoT. When a residual **flips** a living tip (Full, complete,
etc.), **rename the SSoT to a short role name** in that same slice (surgical hand
edits via `rg` inventory). Historical land-time modules may keep long local pins
until a deliberate rename residual; living tip in `SelfApplyFs` should read like a
product API, not residual archaeology.

**Exemplars (short):** modules `OfficialRetire`, `PerformClaimed`, `OwnershipClaimed`;
prefer living tip bools in the same spirit (`performClaimed` / `ownershipClaimed` /
`stepContractFull` style -- exact spellings chosen for greppable gates when
renamed).

**Surgical edits only:** use `rg` to **find** import, lakefile, just, pure Nix,
and Lean sites; change each site **by hand**. Large sets may fan out to subagents
with disjoint scopes -- still hand edits per site, never mass `sed -i` / bulk
`replace_all` across the tree. Same spirit as global "Edits -- no bulk
find-and-replace."

**Residual / implement choreography** (`Partial B37`, close-path step tokens) stays
in residual, `WATCHER.md`, and greppable *string* tokens -- not in module basenames
or permanent claim-bool API names.

### Stage-id density (human prose vs greppable honesty)

Greppable honesty tokens (`HOST-*`, `SLAKE_*`, `EMIT_*`, stage ids required by pure Nix gates) stay where product Lean, presence specs, and emit wire need them. Do **not** mass-rename those in residual docs as "cleanup." Density policy is about **human-facing prose**, not erasing gate tokens.

| Surface | Rule |
|---------|------|
| **Residual ledgers (living)** | Drive work from an **Open** queue of plain **Names** with Goal / Done when / Out of scope / Paths (`RESIDUAL-systems.md`). Do **not** use phase / track / wave / SH* / P* as residual item titles. Do not re-paste greppable token maps into living residual; leave tokens in Lean / Nix / optional companions. Coordinator `RESIDUAL.md` joins Open Names only. |
| **SESSION-HANDOFF** | **Summarize + link** residual (`RESIDUAL.md` join board, `RESIDUAL-systems.md` for Systems). Do not re-paste token soup after compaction. |
| **Product Lean / Nix gates** | Honesty tokens required by presence checks stay. No bulk rename of `.lean` `HOST-*` markers as a docs slice. |
| **Doc-only milestones** | Do **not** mint new `*_V0` / plan-only stage ids only to mark a prose status change. |
| **Human prose** | Prefer structural names (Mult, Linear, freestanding product path, ordered IR program, host compose) over stacking greppable tokens in one sentence. |

Ephemeral vs stable above still applies. This subsection only tightens **readability and density** so residual stays honest without becoming greppable token soup.

### Living residual work items (hard rule)

Every open Systems residual item is a named accomplishment:

| Field | Rule |
|-------|------|
| **Name** | 2-6 words; what you build. Not a stage id. |
| **Goal** | One sentence. |
| **Done when** | Checkable outcomes. Theorems only for **new** properties, not readiness re-lists. |
| **Out of scope** | Explicit non-claims for the slice. |
| **Primary paths** | Few paths the implementer may touch. |

**Focus:** bootstrap freestanding **Slake** under `src/systems/` (Lean host + freestanding emit toward `out/freestanding-c`). Prefer product surface growth over host canary theorems.

**Autonomy (walk-away loops):** when Open has Name + checkable Done when, chain short implement loops via `WATCHER.md` without inventing work and without waiting for re-confirmation of non-claims already documented. When Done when is not checkable, **BLOCKED** with one concrete need. Cap concurrent subagents (~1 implementer + ~1 reviewer at effort 1; raise only with clean disjoint scopes, including one extract-first on new files while a Lake occupies surmount-1). Parent stays thin; subagents own depth (fresh context, no compaction of child work).

**Plan defaults are residual work (hard ban on false park):** if a durable plan under `.agents/plans/` (or residual Open) already names the next residual with **checkable Done when**, agents **must** open that Name in `RESIDUAL-systems.md` and implement. **Do not** empty Open, write **done-for-now**, or park with "wait for the human to Open the next Name" while a plan default still has a checkable next phase (e.g. plan-close-six-claims Track 3 B, Phase 2 A). **Do not** park between sequential planned phases when the next phase Done when is already checkable -- open the next Name or leave remaining Done when on the current Name and put `/implement` in `WATCHER.md`. Empty-Open **done-for-now** is only honest when **no** plan (and no Open queue) still names a checkable next residual. Still do not invent unrelated Names or forge free/complete/PROVABLY/llvm.

**Do not put everything in one file.** Split modules, docs, and checks by responsibility. Prefer a small clear file over a kitchen-sink blob. New work uses the **three languages only** rule: Idris 2, Lean 4 (including Slake / Systems Lean), or pure Nix under `nix/` -- never a new Python or shell mill.

### Systems / Slake residual must grow Lean (hard rule)

**Systems Lean is Lean.** Slake is a compiler written in Systems Lean. Under `src/systems/`:

| Do | Do not |
|----|--------|
| Add real **`.lean`** sources (types, mult, linear, erasure, extract, IR, host, emit planning as Lean) | Grow another bash-generated freestanding **C API stage** (`EMIT_*_V0` ladder) as the main residual treadmill |
| Treat freestanding C under `emit/` / `out/freestanding-c/` as **emit product wire** (what Slake eventually produces) | Treat hand-written or generator-expanded C as the place Systems Lean is "implemented" |
| Pay down scheduled-deletion shell (`script/slake-*.sh`; novel `check.sh` already deleted) toward Lean/Nix | Mint new shell feature markers and call that progress |

If a Systems residual prompt only extends the C emit generator, **stop and re-scope** toward Lean sources unless the human explicitly asked for emit-wire-only work. Marker-stage theater is not residual closed.

### No new C or shell product work (hard rule -- delete-on-sight)

Hunter's bar: **writing more freestanding C sources or more shell scripts for product / residual progress is forbidden.** Unmaintainable. Already banned under **Three languages only**.

| Forbidden as "progress" | Allowed only if |
|-------------------------|-----------------|
| New or expanded `*.c` / `*.h` under `src/systems/`, `emit/`, `out/freestanding-c/` as the work of a residual slice | Human **explicitly** orders a named wire fix (rare); still not "Systems Lean implementation" |
| New or expanded `*.sh`, restoring `check.sh`, more `script/slake-*.sh` stages | Human **explicitly** orders a named paydown or process-glue fix; prefer delete/port over grow |
| Generator edits that only mint another C API stage | Never as default residual |

**Existing** emit/out C is **product wire** (generated). Existing large shells are **scheduled deletion** until replaced by Lean/Nix -- not a license to grow them. Tracked emit/out C is **generator output** (see **Freestanding / ahead-of-time (AOT) C git policy** above); do not patch product contracts only in C without updating the authoritative generator / Lean SSOT path.

If residual is about to be "solved" by editing C or shell: **stop.** Do Lean (or pure Nix for tooling) instead. Hunter may **delete** C/shell additions that violate this without further discussion.

If a process correction matters, **document it in this file** or a named durable doc **in the same turn**.

---

## Documentation hygiene

- Product is not docs. **Minimum useful text** only; document once in the single source of truth (SSoT), link elsewhere.
- SSoT map: goals `doc/goals.md` | terms `doc/vocabulary.md` | residual `RESIDUAL.md` + `RESIDUAL-systems.md` | reseed `doc/SESSION-HANDOFF.md` | this file for agent policy and Nix tooling | freestanding C ownership `src/systems/emit/host-owned-emit.md`.
- Research: `doc/research/` header **Kind: analysis only. Not residual.**
- Process corrections: document in this file or a named durable doc in the same turn.
- Do not invent residual from research unless asked.

### README min useful (hard rule)

Product and workspace **README** files are short **maps + links**, not residual ledgers.

| Do | Do not |
|----|--------|
| What the tree is, layout by **role**, short living tip (3-5 lines or link to `doc/SESSION-HANDOFF.md`) | Paste residual Open / Done when, full module essays, greppable token walls |
| Point to SSoT companions (`self-host.md`, `host-owned-emit.md`, `host-partial-inventory.md`, residual, plans, research) | Re-dump B-ladder / claim-step history (B2..B40), SH stage essays, unit translation maps |
| Short command list (`just build`, `just check`, focused recipes) | Annotate every recipe with partial residual stage ids |
| Keep pure Nix presence tokens only when a gate **requires** them (minimal cite) | Grow README so gates force archaeology; prefer gate specs on Lean/Nix/SSOT files |

**`src/systems/README.md` target:** roughly **40-100** lines. Prefer **delete** over relocating novels into another README. Ownership truth has one home: `emit/host-owned-emit.md`. Self-host claims: `self-host.md`. Module count: `host-partial-inventory.md`. Living Open: residual + handoff + `WATCHER.md` (not README).

**Root `README.md`:** north star + read-first + structure + tooling + license. Living tip at most a few lines or status entirely via handoff. No WATCHER `/implement` body. No S0-S5 bootstrap essay.

**`out/freestanding-c/README.md`:** consumer install + honesty (generated-only, free vs host residual). Not residual archaeology.

Do **not** bulk-rewrite historical research under `doc/dev/research/` for this rule.

### Benchmarks and user-facing docs (hard rule)

When a benchmark run shows a **real improvement** (or the first solid win vs a named baseline), agents **must** update user-facing living docs in the **same slice**:

| Must update | Role |
|-------------|------|
| `doc/BENCH-RUNTIME-latest.md` | Living runtime report (regenerate via `just bench-runtime`; report leads with plain **How much faster**) |
| Root `README.md` living tip (or the consumer surface that claims the win) | One plain line + link to the living report with the headline win |
| `doc/SESSION-HANDOFF.md` | Reseed tip when the digest is stale |
| Optional | `out/freestanding-c/README.md` Runtime evidence when the consumer surface is in scope; `just/README.md` recipe row |

**Honesty:** never invent improvement. If freestanding is **slower** vs a baseline, user-facing docs must **not** claim "faster" for that baseline. Multipliers use "Nx faster" / "Nx slower" (not bare ratios alone as the only human phrase). **PROVABLY** remains wire correctness, not speed. Compile-path suite (`just bench` / `doc/BENCH-latest.md`) is **secondary**; the runtime question (`just bench-runtime`) remains **primary** for the linear / no-GC story. Do not leave speed wins only in research notes or chat.

### File extensions (hard rule)

Every novel prose, config, and source file gets a **real extension** (`.md`, `.lean`, `.idr`, `.nix`, `.toml`, `.c`, `.h`, `.txt`, ...).

| Intentional exceptions (tool-required basenames) | Never invent |
|--------------------------------------------------|--------------|
| `justfile` | Extensionless agent notes or joins under the repo |
| `lean-toolchain` (elan pin files) | Extensionless licenses (use **`UNLICENSE.md`**) |
| Git hook names (`pre-commit`, ...) under `script/git-hooks/` | Plans without `.md` under `.agents/plans/` |
| Upstream/`ref/` and skill-submodule conventions we do not own | Bare `LICENSE` / `COPYING` renames of our dedication |

If an accidental extensionless novel file appears, **rename or delete** with care (do not break tool-required basenames).

### Document slices so they survive compaction (hard rule)

Chat memory dies. **Every durable implement slice and every material decision** must land on disk in the same turn, in places agents reseed first -- not only in the reply.

After a Systems / Slake slice (or any residual that changes product claims, ownership, or Open queue):

1. **Residual ledger** -- `RESIDUAL-systems.md` Done archive (capability + primary paths) and Open queue (or done-for-now). Coordinator join: `RESIDUAL.md` Systems Open table when status changes.
2. **Next action** -- `WATCHER.md` fenced block + same text as the reply final section.
3. **Reseed status** -- `doc/SESSION-HANDOFF.md` Active product residual / Next / module count when they change.
4. **Ownership / product decisions** -- if freestanding C text ownership or "what is still template" changes: update `src/systems/emit/host-owned-emit.md` (SSoT). Keep `src/systems/README.md` as a short map + link only; do not re-paste ownership essays into the README.
5. **Self-host / join map** -- when emit readiness or dual product cites change: `src/systems/self-host.md`, `src/systems/join-map.md` as needed; inventory companion `src/systems/host-partial-inventory.md` for module count and HOST-EMIT-* closed gaps.
6. **Gates** -- pure Nix presence (`nix/systems-host-presence/`, `nix/systems-emit-wire/`) when new modules or SSOT artifacts appear.
7. **Terms** -- new durable product terms go in `doc/vocabulary.md` (Unicode allowlist) when agents will re-use them after compaction.

**Prominence:** put the one-line status and "where to look next" in `SESSION-HANDOFF.md` and residual Open/Done; put the detailed map in the named companion (e.g. `host-owned-emit.md`), not only in module headers. Do not bury decisions only inside long greppable token soup.

**Do not** leave "we decided X" only in chat. **Do not** invent Open Names to fill emptiness when **neither** Open nor a durable plan names a checkable next residual -- then document done-for-now. When a plan already names the next checkable residual, **open that Name and implement** (see **Clear plan defaults** under residual implement loop); do **not** wait for a human "Open" ceremony.

### Learn preferences on every instruction (hard rule)

Hunter invests real time in tooling and process for this project. Treat each human instruction as a preference signal -- including freeform chat corrections, not only formal implement prompts.

**On every prompt that asks you to do something**, before or while acting, ask: *what durable preference or anti-mistake belongs in `AGENTS.md` (or a tighter living doc)?* Then **document it in that file in the same turn** when it is not already there. Do not call this "pinning." Do not say only that you "wrote" something -- say **documented in** the path. Do **not** collect preferences via multi-choice quiz UIs; freeform chat is enough (see **Plans and approvals**).

Examples of rules worth documenting:

- Format/extension conventions (e.g. `UNLICENSE.md`, not extensionless license files)
- Hands-off git unless asked; no push of local unpushed work-in-progress (WIP)
- ASCII-only novel work; acronym expansion for agents
- Isolation; workspace paths; freestanding vs runtime claims
- Human-in-the-loop (HITL) flake staging; professional tone / no profanity
- Slice decisions + residual status that must survive compaction (see **Document slices so they survive compaction** above)
- Product ownership maps (e.g. host-owned freestanding emit) when they change
- **Explain A/B decisions and claim tables in plain English** (operator 2026-08-10): when a residual closes by choosing among announce rules, pin flips, or "held" lists, final reports and plan living tips must unpack **why** in complete American English (what each option meant, what evidence forced the choice, what public language may and may not say). Status tables and residual codes alone are not enough. Durable home for full-readiness announce-bar B: `.agents/plans/plan-full-readiness-2026-08-09.md` section **Plain English**.
- **Low time preference / completeness** (operator 2026-08-12): finish
  mid-flight product work; do not park for another confirm.
- **Ordinary names in operator questions** (operator 2026-08-12): no residual
  queue numbers as the question.
- **Do the named edit** (operator 2026-08-28): when the operator already
  named the change (`_lake-if-pin` skip, `AGENTS.md` no-kill, a file and
  line), implement it in that turn. Restating it as "what I will do next"
  is not the work. Status may use Job / State / You / Next; the Next line
  must match an edit already in progress or just landed, not a promise
  instead of the edit.
- **Name the recipe and host** (operator 2026-08-28): say `just systems-lake`
  via `_lake-if-pin` in `just/dual-side.just`, `justfile` calling it after
  flake check, hostname **horizon** vs **surmount-1**, skip vs run. Do not
  say only "the local build."

Do **not** wait to be told "document that." Do **not** only fix the immediate file and forget the preference. The goal is fewer repeat mistakes and better agent UX after compaction.

### Residual implement loop / watcher (environment auto-continue)

Hunter's environment can **auto-run** residual implement instructions when they appear in a fixed, greppable place.

**Canonical on-disk watcher:** root file `WATCHER.md`
- Update the fenced block between `WATCHER_BEGIN` and `WATCHER_END` after every durable slice.
- Put the **same** text as the **final section** of the chat reply.

When you finish a planned slice:

1. If residual work is **clear and needs no human input**, write the next implement prompt into `WATCHER.md` using the residual **Name / Goal / Done when / Out of scope / Paths / Gates** shape **and** end the reply with that prompt so the harness can continue. Prefer freestanding Slake bootstrap Open Names over inventing theorem canaries.
2. **Always** put a next implement prompt in the reply final section when the next residual Name is already clear (plan default with checkable Done when, or Open queue non-empty). Use the full `/implement --effort N ...` form the harness expects when work remains. Do not end only with DONE-FOR-NOW prose if plan/residual already names the next clear slice.
3. **Clear plan defaults count as residual work (hard rule):** when Open is empty but a durable plan (e.g. `.agents/plans/plan-close-six-claims.md`) names a residual with checkable Done when -- first residual **or** the next sequential planned phase after a partial slice -- a `/implement` residual loop **opens that Name** in `RESIDUAL-systems.md` (or keeps remaining Done when on the current Name) and implements it. That is not "inventing Open Names" for theorem canaries -- it is executing the planned product program.
   - **Banned:** park and wait for the human to "Open" residual Names when a durable plan already names the next residual with checkable Done when.
   - **Banned:** empty Open + BLOCKED done-for-now between sequential planned phases while the plan still has a next checkable phase (e.g. Track 3 B after evidence partial, Phase 2 A after Phase 1).
   - **Required:** open next Name **or** leave remaining Done when on the current Name, and put `/implement` in `WATCHER.md` + reply final section.
   - **Still forbidden:** invent unrelated Names; forge free/complete/PROVABLY/llvm; start deferred tracks the plan holds.
4. If **blocked or ambiguous** (no plan default and no checkable Done when), put a short blocked note in `WATCHER.md` (what is unclear); do not invent fake work. The blocked fence and the reply final section must **not** contain the implement slash-command token (even as "do not auto-run ..." prose) -- the harness will re-queue it as a new implement pass.
5. Never use the loop to race git, forge freestanding/PROVABLY claims, or start deferred tracks (e.g. `out/llvm-ir` before self-host).
6. **While a niced Lake occupies surmount-1, keep a parallel extract-first agent on the next named subset** (operator 2026-08-24; restated 2026-08-25). New probe / helper / walk files only. No second Lake. No shared-fold edits until the occupying lakes exit 0. Detail: section **Lake host and niceness**.
6. Keep `RESIDUAL.md` as the join board (Open Names); `RESIDUAL-systems.md` as Systems detail; `WATCHER.md` as only the **next action**.

### Forks (Idris side / Lean side / Systems / Coordinator)

Research and implement forks are expected (each can be its **own session**). Product
freestanding work is the **Systems / Slake** session once duals are join-ready.
The **watcher** session is separate (see Multi-chat roles).

| Fork | Workspace | Paste prompt |
|------|-----------|--------------|
| Idris side | `src/idris2/` | `doc/fork-idris.md` |
| Lean side | `src/lean4/` | `doc/fork-lean.md` |
| Systems / Slake | `src/systems/` | `doc/fork-systems.md` |
| Coordinator | join board, residual honesty, fork guidance | `doc/fork-coordinator.md` |
| Watcher | `WATCHER.md` residual loop (separate session) | root `WATCHER.md` contract |

**Residuals (separate files):**

| File | Owner |
|------|--------|
| `RESIDUAL-idris.md` | Idris-side fork |
| `RESIDUAL-lean.md` | Lean-side fork |
| `RESIDUAL-systems.md` | Systems / Slake fork |
| `RESIDUAL.md` | Coordinator join board |

**Progress / watch:** `just progress` writes `doc/PROGRESS.md` from pure Nix (`nix/progress/`, flake output `progressReportText`). `just progress-scc` adds an `scc .` appendix. `just watch` is a just loop (300s sleep; process uptime is not cycle cost). Hygiene is pure Nix (`nix/source-hygiene.nix` ASCII + trailing whitespace, plus `nix/professional-tone.nix` novel markdown tone) -> live `just hygiene`; flake checks `source-hygiene` and `professional-tone`.

**Do not** implement both language sides only as Lean models of Idris unless the human redefines the goal. Honest meet-in-the-middle needs **real Idris sources** plus **real Lean sources**, then a stated map (later formalized, often in Lean). Freestanding synthesis: `src/systems/` (Slake) via the systems fork.

**Single freestanding emit stage id:** product C emit is **`SLAKE_EMIT_FREESTANDING_C_V0`**
(Lean `SystemsLean.FreestandingEmit` / lake exe `slake-emit-freestanding-c`,
`src/systems/emit/`, `just build`). Bash emit driver is **gone** (Wave C).
Do not land a second competing emit stage id in the same tree without retiring the other.
Concurrent sessions must not delete shared tooling under `script/` while another
session is mid-slice.

---

## Technical honesty

1. **Three runtime stories** -- Idris reference-counting C backend; classic Lean ahead-of-time with managed runtime; freestanding product with **no** Lean managed runtime on the wire. Never conflate.
2. **Dual residual** -- product residual != host elaborator residual; never forge either.
3. **Ahead-of-time != freestanding.** Runtimeless freestanding C is the primary product claim.
4. **PROVABLY** requires real resolved CompCert evidence; never sell weaker dogfood as PROVABLY.
5. **Rust-native link** (layout-compatible intermediate representation) is deferred until self-host; not a claim yet.
6. **`ref/` is read-only.** Novel work: `src/idris2/`, `src/lean4/`, `src/systems/`.
7. **No product garbage collection.** Memory safety from linear/affine types and checks.
8. **Reference counting** on freestanding paths only if proven unavoidable; see `src/systems/README.md`.
9. **Multiplicities:** only minimum 0 / 1 / omega for freestanding Slake in `src/systems/`.

### Finish line: Slake does everything Lake does (host develop)

**Project finish on the host side** means Slake owns every job Lake does today for Systems Lean under `src/systems/`: load the package, follow imports, elaborate and check modules (including theorems), and build the host tools we currently build with Lake. Durable program: `.agents/plans/plan-slake-replaces-lake.md`. Goals: `doc/goals.md` (north-star items 6-7). Living claim board: `RESIDUAL-systems.md`.

| Already true (do not re-open without cause) | Still unclaimed / false |
|---------------------------------------------|-------------------------|
| Freestanding product residual **free**; freestanding product self-host **complete**; product path does **not** require Lake on the normal step (product StillUsesLake / DependsOnLake **false**) | Full Lean 4 / mathlib elaborator parity (held; plan layers preserve) |
| Host elaborator residual free **claimed** under free-bar choice **(a)** (day-to-day host tools without Lake on the step; DualResidual remains false / free claimed true) | FullHostElaborateRemains stays **false** -- free claimed is **not** "full host package elaborate done" |
| Six-unit Mult / Linear / Types / Program / Graph / Compose checkers and package writers (foundation harness only) | Six units alone are **not** "Slake does everything Lake does" |
| PROVABLY true (CompCert product matrix); llvm unlocked with partial unit SSA (not full backend) | "Lake is gone" -- host free claimed is **not** Lake gone; cold / diagnostic Lake may still elaborate for bootstrap and claim proof |

**Honesty:** free claimed under free bar (a) is a measured host residual-free claim for day-to-day develop tools. It is **not** product free re-open, **not** Lake gone, **not** FullHostElaborateRemains true, and **not** full Lean 4 / mathlib parity. Do **not** empty residual Open with done-for-now while a durable plan still names checkable next work. Do **not** forge free / complete / PROVABLY / FullHost claim bools.

### Multi-language print policy (three stories -- keep separate)

Novel code may touch more than one language surface. Treat these three stories differently. Inventory: `doc/dev/research/multi-language-print-inventory-2026-08-03.md`.

| Story | What it is | Policy |
|-------|------------|--------|
| **(1) Classic Lean managed-runtime ahead-of-time C** | Upstream Lean / Lake can emit C for the **managed Lean runtime** path. Intermediate lives under build trees such as `.lake/`. Not freestanding product. Not our novel implementation language. | **Not** debt to ban because Lake emits C. Do not sell deleting `.lake/` IR as residual progress. |
| **(2) Freestanding product C** | Slake product wire under `emit/` and `out/freestanding-c`, composed by Lean-owned emit (templates and authority fragments). Intentional product generation. | **Keep generating.** Improve structure only with a named Open residual, not a slogan ban on product C. Ownership SSoT: `emit/host-owned-emit.md`. |
| **(3) Novel helpers that print another language as string soup** | Code **we** wrote that builds another language's full source mainly by string concatenation and `IO` / print (for example host-cc helper tools that are entire C programs held as Lean strings; or any real bash-as-string if found). Dense bash in `just/*.just` recipes is related temporary orchestration, not Lean-printed. | **Do not grow.** Inventory first; clean up with evidence. Supporting residual Names under plan-slake-replaces-lake Program P. Does **not** ban stories (1) or (2). |

**Do not** grow novel Lean whose main job is printing another language's full source body as temporary helpers (shell-like scripts, host-cc helper tools). **Do not** confuse that cleanup with freestanding product emit or classic Lake ahead-of-time C.

### Driver stdout policy (Lake / host drivers)

Lake and host **drivers** (subset emit/rebuild mains, Mult write/deepen, freestanding write tools, just-invoked measured steps) may print only:

| Allowed on stdout | Not allowed on stdout |
|-------------------|------------------------|
| Short stage banner (greppable stage id once) | Residual non-claims essays (free/complete/Lake-gone theater) |
| Wrote paths and byte/char counts | Design-path narratives and naming-hygiene lectures |
| Raw pin / readiness values (bools, ids) | "not PROVABLY" / "not S4" / "not llvm" / free-vs-complete slogans |

**Where honesty lives:** residual ledgers (`RESIDUAL-systems.md`), `self-host.md`, research notes under `doc/dev/research/`, module headers, pure Nix presence specs. Greppable stage ids once in headers and presence; not repeated as stdout essays.

**Why:** long driver banners restate product non-claims that already have durable homes and hide the signal (what wrote, paths, pin values). Scrub on touch when editing drivers; keep residual essays in residual and self-host. Does not block product residual.

**ASCII only** on novel driver source and banners. No banned professional-tone tokens in novel markdown. Prefer **document** (name the file) over agent jargon for saving rules.

### Product Lean edits and claim-bool proof (hard rule -- 2026-07-30)

RCA: `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md`. Plan:
`.agents/plans/plan-selfapplyfs-rca-prevention.md`.

1. **No `/tmp` full-file rebuild of product Lean.** Never rebuild a product
   `.lean` by writing a full reconstructed copy from `/tmp` (or outside the
   tree) and copying it over the live path. Surgical in-place edits only. If the
   file is too large for safe in-place work, **stop** and open a **split**
   residual; do **not** stitch sections with cut marks.
2. **Long files (>1000 lines on disk) are residual** (same **Sub-1-KLOC** bar).
   Address with coherent seams (dual-pin thin onto home modules, smoke/theorem
   module splits, pure Nix data slices, just role modules under `just/*.just`),
   not naive half-file cuts. Prefer gate-first dual-pin migration for SelfApplyFs
   tip shrink. Plan: `.agents/plans/plan-long-file-refactor.md`. Serialize tip
   writers (short-name rename vs dual-pin thin). On screw-up (red lake, cycle,
   stitch risk): **STOP**; do **not** `git revert` / undo; leave the tree for
   the human. just modules and pure Nix modules use the same 1000-line bar as Lean.
3. **Stitch / merge markers forbidden in product sources.** Lines that are agent
   cut marks (`==== ... ====` after leading whitespace) or git merge conflict
   markers (`<<<<<<<` / `>>>>>>>` prefix, or exact `=======`) must not land in
   novel product sources. Pure Nix `nix/source-hygiene.nix` (via `just hygiene`)
   bans stitch marks on `*.lean` and merge markers on all novel text.
4. **Claim-bool flips need host elaborator proof while bootstrapping.** Flips of
   living claim bools (complete, free, ownership claimed, perform claimed,
   Full / `stepContractFull`, and similar SSoT tips): **Done when** includes a
   real elaborator check of the host Lean, not greps alone. **Today** that means
   a **lake build** (and claim exe when one exists) when `lake` is on PATH.
   Grep / dual-pin recipes alone are **not** enough for APPROVE or full GREEN on
   a claim flip. Primary example: `just freestanding-self-host-complete` runs
   greps then mandatory `lake build` / `lake exe slake-freestanding-self-host-complete`
   (exit 1 if lake missing).
5. **Lake is only needed once to bootstrap Slake -- not the freestanding end
   state.** Classic Lean **Lake** elaborates the **host** Systems Lean / Slake
   sources for that bootstrap. Product goal is freestanding Slake and runtimeless
   C on the product wire (`out/freestanding-c`). After Slake is bootstrapped,
   Lake is not a forever product dependency and not part of the product claim
   story. Honest pins (`DependsOnLake`, `StillUsesLake`, bootstrap remains) stay
   true until a freestanding path actually retires them -- do **not** forge those
   false early. Do **not** sell mandatory lake-on-claim-flip as "Slake always
   needs Lake forever." It is host verification **during the one-time
   bootstrap**. Once the freestanding product path is the real proof surface,
   claim proof moves with that path and Lake drops out. Until then: lake on
   PATH => use it for claim flips.
6. **Implementer summaries:** do **not** mark GREEN on claim flips without the
   lake command and exit 0 (while Lake is still the host elaborator), or an
   explicit **BLOCKED: lake missing** (and then residual is **not** closed).
   Parent and reviewer **reject** grep-only claim-flip GREEN.

## Feedback loops: tests and proofs

Both are required. Neither replaces the other (scientific method: theory + experiment).

### Executable feedback (red / green)

- Prefer **red/green** test-driven development for product behavior: failing test or check first, then implementation, then green `just check` (and focused tests when they exist).
- Do not claim done on vibes. Gates and tests must actually run.

### Formal feedback (spec then proof)

- Separate **specification** from **proof** as cleanly as the host allows: state what must hold, then prove it.
- Take time on the specification. Do not bury the claim inside an unstructured proof script with no readable statement.
- Proofs do **not** retire tests: a theorem about a model is not a run of freestanding emit, and a green smoke is not a full proof.

---

## Subagents and token efficiency (strategic max, not wasteful)

**Detail:** `doc/subagents-project.md`. Global process law: `~/.grok/AGENTS.md`.

**Here:** parent is coordinator (goals, spawn/wait, join on disk). Multi-file research and non-trivial implementation live in tightly scoped subagents. Prefer explore/plan for read-only; general-purpose only for edits. Cap concurrency (~2-4). Soft quality band ~40% parent context; join on short on-disk summaries, not parent re-greps. Depth max L3. Isolation: work only in this repository unless the human is absolutely desperate for a named off-repo solution.

## ASCII and Unicode (hard rule)

**How the check scrubs:** pure Nix `nix/source-hygiene.nix` (`just hygiene`, flake check `source-hygiene`) evaluates novel files with `builtins.readFile`: fails non-ASCII outside the allowlist and trailing whitespace. No ripgrep, no bash, no Python in the algorithm. Upstream `ref/**` is not scanned. Related pure checks: `just professional-tone` / flake `professional-tone` (`nix/professional-tone.nix`) for novel markdown banned tokens (also folded into `just hygiene`); `just systems-host` / flake `systems-host-presence` (`nix/systems-host-presence/`) for static Systems host presence tokens; `just systems-emit-wire` / flake `systems-emit-wire` (`nix/systems-emit-wire/`) for emit-wire stage tokens, UNIT_DEEPEN, unit-surface walk, optional release surface, hosted behavioral probe path; `just idris-side` / flake `idris-side-presence` (`nix/idris-side-presence/`) and `just lean-side` / flake `lean-side-presence` (`nix/lean-side-presence/`) for dual-side static presence (Wave A; elaborator glue is `just idris-elaborate` / `just lean-elaborate`).

| Path | Unicode? |
|------|----------|
| `doc/ascii-symbol-map.md` | **Yes** -- glossary of Unicode -> ASCII spellings (source of map for `--fix`) |
| `README.md` | **Yes** -- human-facing overview may use Unicode |
| `doc/vocabulary.md` | **Yes** -- term table may use Unicode |
| All other novel work | **No** -- ASCII only; use map spellings (`--`, `"..."`, `omega`, `->`, ...) |
| `ref/**` | Upstream; not rewritten |

```bash
just check                         # full suite (hygiene + systems-host + systems-emit-wire + idris-side + lean-side + flake + residual shells)
just hygiene                       # pure Nix ASCII + trailing WS + professional-tone (novel *.md)
just professional-tone             # pure Nix novel markdown banned-token gate only
just systems-host                  # pure Nix static host/unit-surface presence
just systems-emit-wire             # pure Nix emit-wire / UNIT_DEEPEN / unit walk
just idris-side                    # pure Nix Idris-side dual presence (files + tokens + jargon)
just lean-side                     # pure Nix Lean-side dual presence (files + tokens + jargon)
nix flake check                    # pure checks (source-hygiene, professional-tone, systems-host-presence, systems-emit-wire, idris-side-presence, lean-side-presence, ...)
just progress                      # meters (pure Nix generator)
just progress --scc                # meters + scc .
just watch                         # 300s loop (short just recipe; not a flake app)
```

No success claim on novel edits without green hygiene (allowlist files still must have no trailing whitespace).


## Repository structure (evolving detail)

Keep this map current when dirs move. README has a short tree; **this section is the agent SSoT (source of truth)**.

```
.
+-- src/                      # ALL novel product sources
|   +-- idris2/               # Idris 2 side -- isomorphism, dual examples, QTT (Quantitative Type Theory) maps
|   +-- lean4/                # Lean 4 side -- novel Lean-facing bridge work (not freestanding product)
|   +-- systems/              # Freestanding Systems Lean + Slake compiler host synthesis
+-- out/
|   +-- freestanding-c/       # Runtimeless freestanding product C (release)
|   +-- llvm-ir/              # LLVM IR / Rust-native link (deferred until self-host)
+-- ref/                      # Language/compiler upstream ONLY (read-only submodules)
|   +-- Idris2/
|   +-- lean4/
|   +-- CompCert/
|   +-- rust/
+-- skills/                   # Agent skill pack submodules (read-only; not product)
|   +-- lean4-skills/         # cameronfreer/lean4-skills (Lean prove/formalize workflows)
+-- doc/                      # Goals, vocabulary, architecture, divergence, entry maps, research/
+-- nix/                      # Pure Nix tooling modules (progress, source-hygiene, professional-tone)
+-- script/                   # Process glue only (optional git-hooks); no mills
+-- .github/workflows/        # CI == just check
+-- justfile
+-- flake.nix / flake.lock
+-- AGENTS.md / README.md / RESIDUAL.md / LICENSES.md / UNLICENSE.md
+-- .agents/
|   +-- plans/                # Plans (ephemeral relative to product)
|   +-- skills/               # Project skill discovery (symlinks into skills/)
```

| Path | Write? | Role |
|------|--------|------|
| `src/idris2/` | yes | Idris side novel work; never edit `ref/Idris2` as product |
| `src/lean4/` | yes | Lean side novel work; never edit `ref/lean4` as product |
| `src/systems/` | yes | Freestanding product + Slake; min mults; no product GC (garbage collection) |
| `out/freestanding-c/` | emit | Runtimeless freestanding C (product wire via `just build`) |
| `out/llvm-ir/` | deferred | LLVM IR for Rust-native link; after self-hosted Systems Lean / Slake |
| `ref/*` | no | Language/compiler upstream references only |
| `skills/*` | no | Agent skill pack submodules (read-only); discovery via `.agents/skills/` |
| `.agents/skills/` | symlink | Project skill root for hosts; bodies under `skills/` |
| `doc/` | yes | Durable design / policy prose (min tokens) |
| `nix/` | yes | Small pure flake modules (hygiene, progress, novel-source) |
| `script/` | process glue only | Optional git-hooks; scheduled deletion inventory empty (none open) -- never a template for new tools |

**Commands vs trees:** `just build` -> product freestanding wire (emit under `src/systems/emit/` + release under `out/freestanding-c/`). `just check` -> `just build` first, then pure gates + workspace scripts (no second full regenerate; `SYSTEMS_PRODUCT_WIRE_FRESH=1`). `just out-llvm-ir` reserved (deferred). No `out-freestanding-c` just recipe (retired; former stamp-only `build` deleted).

## Nix tooling (under three languages only)

**Detail SSoT:** `doc/nix-tooling.md` (map, history of mistakes, who owns what, pure Nix file inventory).

**Hard rules stay here:** three languages only; pure evaluation for gates; no bash-in-Nix / shell-in-Nix / Python-in-Nix; no kitchen-sink `flake.nix`; **Sub-1-KLOC** on pure Nix modules under `nix/`; thin root `justfile` + `just/*.just` via `import`.

**Live pure gates:** `just hygiene`, `just systems-host`, `just systems-emit-wire`, `just systems-llvm-ir`, `just idris-side`, `just lean-side`. Flake checks see only git-tracked paths (HITL stage; agents never `git add`).

**Pattern:** presence/token algorithms live in `nix/<module>/`; just only `nix eval --impure` or thin lake/exe. Growing a pure Nix file past 1000 lines is residual (split data/eval slices).

## Lake host and niceness (operator 2026-08-17)

Run **Lake on surmount-1**, not on the laptop (**horizon**). **surmount-1**
is the allowed remote Nix builder and Lake host. Mail and Lean share that
host. That is why niceness matters.

**Laptop skip (operator 2026-08-28):** `_lake-if-pin` in `just/dual-side.just`
skips `lake build` unless `hostname -s` is `surmount-1`. `just check` on
**horizon** still calls `just lean-elaborate` (`justfile` after flake check)
and `just systems-lake`; those recipes print skip and exit 0. Pure Nix
presence gates still run. To run Lake on this laptop anyway:
`SYSTEMS_LEAN_LAKE_FORCE=1 just systems-lake`. Do not treat a screenshot of
laptop CPU as a reason to start Lake here.

**Laptop CompCert skip (operator 2026-08-28):** `just product-compcert-matrix`
in `just/compcert.just` is the last step of `just check` / `just pre-commit`.
On **horizon** it must not run `ccomp-resolve`'s `nix build` of
`nixpkgs.compcert` (that is a remote Coq/CompCert compile with no progress
line after `trying flake-locked nixpkgs.compcert`). Skip GREEN unless
hostname is `surmount-1`. Force: `SYSTEMS_COMPCERT_MATRIX_FORCE=1`. The
running pre-commit still uses the old recipe until the operator stops it;
agents do not kill that job.

**Never kill host processes (operator 2026-08-28):** Agents must not `kill`,
`pkill`, `killall`, or otherwise stop host processes unless the operator
names the PID or job in this chat. A screenshot of load, a complaint that
`just check` ran Lake locally, or leftover text about fan-out is **not** a
kill order. The operator already stopped the laptop Lake storm that
`just systems-lake` started.

Lake and other dev builds are always maximally nice: `nice -n 19` and idle
ionice when practical. Prefer a niced Lake wrapper and a niced remote-build
path. Do **not** restart a fat Lake job on **horizon**.

**Wait on Lake, still start the next extract (operator 2026-08-24):** a
niced Lake on **surmount-1** is one process and exclusive. It is **not**
a pause on every other file. While that Lake is running, the parent
**must** start the next named closed-subset extract-first on **disjoint
new files** (new probe, new helper, new walk when the 780-line bar
requires it). Do **not** start a second Lake. Do **not** edit the
occupying writer's shared fold (`ElabMeet.lean`, `ElabMeetTheorems.lean`,
`ElabMeetCompile.lean`, lakefile, Nix presence, residual, `WATCHER.md`,
handoff, living metric) until that Lake exits 0 and lockstep lands.
Then fold the prepared next-module files in a later slice. Same-file
race still serializes. This does not raise the one-Lake cap.

**Never theorems-hub fan-out (operator 2026-08-27; math 2026-08-28):**
do **not** run `lake build SystemsLean.ElabMeetTheorems` or
`lake build SystemsLean.ElabMeet` as the prove for a named isolation
Name. Isolation theorems live on the probe modules and named helpers.
`ElabMeetTheorems.lean` must not import `SystemsLean.ElabMeetNamed*Probe`
modules. Prove with one serial niced
`lake build SystemsLean.ElabMeetNamedHostModuleCheckParityProgramTermProbe`
(or the current Name's probe), `LEAN_NUM_THREADS=1`. If more than one
`lean` process appears during that prove, **stop starting jobs**. Tell
the operator the recipe and host. Do **not** kill processes unless the
operator names the PID or job.

**MemoryMax 192 GiB is the ceiling.** Never raise it. 256 GiB is the
box, not the Lean budget. One isolation probe measured about **167 GiB**
RSS. Max concurrent fat Leans is `floor(192/167) = 1`. Do **not** set
jobs from core count. 64 Xeon cores times about 10 GiB is 640 GiB,
which is not a budget we have. About 18 probes at about 10 GiB already
filled about 187 GiB of 192 while the host still had about 65 GiB free.
Mail stayed up. That is fan-out, not "need more RAM." If a hub fan-out
would start, **do not start** `lake build SystemsLean.ElabMeetTheorems`.
Do not kill a running job unless the operator names the PID or job.
Deaths at 32 / 64 / 128 GiB were a **single Name** filling the cap. The
last death was fan-out.

**Next prove, if any:** wait until `pgrep lake` is empty. Then **one**
serial niced isolation probe only (same Name, or a smaller closed set),
`LEAN_NUM_THREADS=1`, one niced Lake, one lean. Not the theorems hub.
Not FullHost. Not folding the next Name while this one is red.
`leakEnv := false` on multi-module helpers must be in the tree Lake
actually builds (`/home/nixbuilder/iso`), not only on the laptop. If a
hub job started without that, it does not count as the fix being live.
Named closed subset stays **49 of about 206**. Do not claim **50**.

Do **not** flip `FullHost` or package-typecheck pins. Skip **Linear** and
**IrGraph** unless living residual already requires them. This pin does not
open those tracks.

## License (our novel work)

- Root dedication: `UNLICENSE.md` + narrative/inventory in `LICENSES.md`.
- Author: Hunter "cryptoquick" Beast.
- For **any novel crates, modules, or packages we write** (Rust, Lean, Idris, Nix, etc.): set license metadata to the SPDX id **`Unlicense`** (e.g. Cargo `license = "Unlicense"`, Nix `meta.license = lib.licenses.unlicense`, optional `SPDX-License-Identifier: Unlicense` headers).
- Never label upstream/`ref/` code as Unlicense.

## Git (default: hands off)

**Do not think about git at all unless the human explicitly asks.**

- No `git add`, `git commit`, `git push`, `git status` for staging hygiene, no staging "to help," no commit message drafts unless requested.
- The human stages and commits as a proper software engineer. Your job is the work product on disk.
- **Local unpushed WIP:** agents do **not** push. Do not rewrite history (`git commit --amend`, rebase, force-push) of published or human WIP commits unless the human explicitly asks. Leave local commits alone.
- When (and only when) they ask for git help: follow their ask; still never unsigned-commit workarounds (`--no-gpg-sign`, `commit.gpgsign=false`, fake `gpg.program`). Surmount-style verified signatures remain mandatory if a commit is requested.
- Do not commit secrets.

---

## Success criteria

Do not claim success unless verification for the task actually ran.

**Foundation verification:**

```bash
cd /home/hunter/Projects/ai/iso
test -f AGENTS.md && test -f README.md && test -f RESIDUAL.md
test -f doc/goals.md && test -f doc/vocabulary.md
test -f doc/architecture.md && test -f doc/divergence.md
test -f doc/SESSION-HANDOFF.md
test -f doc/idris-entry.md && test -f doc/lean-entry.md
test -f doc/compcert-entry.md && test -f doc/rust-entry.md
test -f doc/research/README.md
test -f doc/ascii-symbol-map.md
test -f flake.nix
test -f ref/Idris2/README.md && test -f ref/lean4/README.md
test -f ref/CompCert/README.md && test -f ref/rust/README.md
just hygiene
git submodule status
```

Later: real builds and tests as defined in residual -- not vibes.

---

## What agents must not do

- Divert Systems Lean work to other residual mills by default
- Treat Idris RefC or classic Lean AOT as freestanding
- Edit `ref/*` or `skills/*` as product
- Use ephemeral wave-speak as permanent product vocabulary
- Forge residual / PROVABLY / host residual_free claims
- Bypass GPG signing
- Implement novel work in any language other than **Idris 2**, **Lean 4**, or **pure Nix flakes** (see Three languages only)
- Grow freestanding **C** or **shell** as Systems / Slake residual "progress" (see No new C or shell product work)
- Add or restore project Python (`*.py`) -- upstream helpers under `skills/` do not license novel project Python
- Add or grow shell/bash mills; restore deleted mills (`progress.py`, `check-source-hygiene.*`, `check-all.sh`, `watch-forks.sh`)
- Smuggle tool logic through bash-in-Nix / shell-in-Nix / Python-in-Nix or flake apps that are only shell farms
- Grow kitchen-sink `flake.nix`, mega `nix/` modules, or restore multi-thousand-line `check.sh` / emit shell instead of Lean or pure Nix
- Hide project skills only under host home dirs when the pack is already a repo submodule -- keep discovery under `.agents/skills/`
- Run a fat Lake job on the laptop (**horizon**) when **surmount-1** is the Lake host
- Restart a fat Lake job on **horizon**
- Kill, `pkill`, or stop host processes unless the operator names the PID or job
- Flip `FullHost` or package-typecheck pins, or open Linear / IrGraph unless residual already requires them
