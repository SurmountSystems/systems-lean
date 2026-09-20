# Nix tooling (Systems Lean)

**Kind:** process / tooling map. Detail for agents and humans. Policy index remains `AGENTS.md` (**Three languages only**, **Sub-1-KLOC**, pure Nix rules).

Live impure gates: `just hygiene`, `just systems-host`, `just systems-emit-wire`, `just systems-llvm-ir`, `just idris-side`, `just lean-side`, `just systems-mill-extras-fit`. Flake checks after human stages `nix/`.

## Overview

This section details language **3** (pure Nix flakes). Read **Three languages only** first.

**Product and bridge code** is Idris 2 or Lean 4 under `src/`.
**Repo tooling** (meters, source hygiene, flake checks) is **pure Nix** under `nix/`, with a **thin** `justfile` only for orchestration. Not Python. Not shell. Not shell wrapped to look like Nix.

Terms (plain English); full glossary in `doc/vocabulary.md`:

| Phrase | Meaning |
|--------|---------|
| **Nix** | Build and configuration language for project tools and continuous integration. |
| **Flake** | Nix project entry (`flake.nix` + lock file) that exports named outputs (checks, packages, shell). |
| **Pure Nix / pure evaluation** | The tool is ordinary Nix that *computes* a result (report text, pass/fail). No hidden shell doing the real work. |
| **Bash-in-Nix** | Long shell inside `writeShellApplication` / `runCommand` sold as a flake tool. Forbidden. |
| **`just` / justfile** | Thin task runner. Loops and redirects only -- not the policy algorithm. |
| **Orchestration** | Gluing steps (write `doc/PROGRESS.md`, sleep, run `scc`). Not product logic. |
| **ripgrep (`rg`)** | Default code search in the flake **devShell** (`pkgs.ripgrep`). Agents and humans search with `rg`, not ad-hoc `grep` mills. Pure Nix checks still must not shell out to ripgrep for policy algorithms. |
| **elan** | Lean toolchain manager in the flake **devShell**. Install the pin from `src/systems/lean-toolchain` / `src/lean4/lean-toolchain` (`leanprover/lean4:v4.32.0`). Do not default to lagged `pkgs.lean4` as the elaborator. Workspace checks skip Lake when the pin is not installed (no surprise network download). |
| **idris2 (devShell)** | Idris 2 elaborator package in the flake **devShell** for bridge-side checks. `just idris-elaborate` skips when the binary is absent. |
| **Novel source** | Our tree -- not `ref/`, not `skills/` (agent skill submodules), not `.git/`, not caches. |
| **Source hygiene** | Novel text is printable ASCII (plus tab/newline) except a small allowlist; no trailing spaces/tabs. |
| **Professional tone** | Novel `*.md` only (v1): short banned-token list in pure Nix; no profanity / demeaning slurs in project markdown. |
| **Progress meters** | Evidence-weighted bars in `doc/PROGRESS.md` (not a calendar guess). |
| **Kitchen-sink file** | One huge file mixing unrelated jobs. Split instead. Designed against large language model attention limits. |

### What went wrong (do not repeat)

1. Progress meters and source hygiene as **project Python** under `script/`.
2. "Fix" by stuffing the same work into **shell strings inside Nix** (bash-in-Nix) and flake apps.
3. Product/build gates grown as **multi-thousand-line shell** under `script/` and former `src/**/check.sh` instead of Lean or pure Nix.
4. Human rejection: **three languages only**; pure small Nix modules; architecture that respects large language model attention and compaction -- not Python, not bash-in-Nix, not kitchen-sink files.

**Core lesson:** ask **where the algorithm lives**. If it lives in `.py` or a long shell string (including inside Nix), you have not done the work.

### Who owns what

| Layer | Owns | Does not own |
|-------|------|----------------|
| **`nix/` (pure Nix)** | Tooling policy, meters, filters, report text; flake checks; pure text packages | Product language semantics; multi-kLOC shell; sleep loops as "Nix packages" |
| **`justfile` + `just/*.just`** | Short orchestration via modular imports; eval redirect, watch interval, lake/exe invoke, optional scc | New algorithms; kitchen-sink just modules; long bash token mills (see **Sub-1-KLOC** + **Never grow long bash in justfile**) |
| **`flake.nix`** | Thin wire-up only | Embedded script farms |
| **`script/` and `*.sh`** | Scheduled deletion / thin process glue only (see three-languages inventory) | New tools; expanding check/emit bash |

### Before you add anything

1. **Is it Idris-side product/bridge?** -> Idris 2 under `src/idris2/`.
2. **Is it Lean-side or Slake / Systems Lean?** -> Lean 4 under `src/lean4/` or `src/systems/`.
3. **Is it repo tooling (gate, meter, filter)?** -> Pure Nix module under `nix/`, small and named; wire a check or pure package; thin `just` line.
4. **Is it only orchestration?** -> Short `just` recipe. Not a flake app whose body is bash.
5. **Would you reach for Python or a new `.sh`?** -> Stop. Wrong language. Port or design in Lean/Nix.
6. **Would the file exceed ~100-150 lines of mixed concerns?** -> Split for humans and for large language model context. Names describe the job.

### Hard bans

- No project Python.
- No new shell mills; do not grow residual `.sh` files.
- No bash-in-Nix / shell-in-Nix / Python-in-Nix.
- No flake apps that are only shell farms.
- No kitchen-sink `flake.nix` or mega `nix/` modules.
- No "I removed Python" victory that leaves the algorithm in shell.
- No long bash presence/token mills in `justfile` (static greps -> pure Nix under `nix/`).

### Current pure Nix map (keep small; update when tools move)

| Tool | How you run it | Where the logic lives |
|------|----------------|------------------------|
| Source hygiene | `just hygiene` (includes professional-tone) or flake `source-hygiene` | `nix/source-hygiene.nix` -> check `source-hygiene` |
| Professional tone | `just professional-tone` or folded into `just hygiene`; flake after human stages | `nix/professional-tone.nix` -> check `professional-tone` (novel `*.md` banned tokens) |
| Systems host presence | `just systems-host` (live); flake after human stages | `nix/systems-host-presence/` -> check `systems-host-presence` |
| Systems emit-wire presence | `just systems-emit-wire` (live); flake after human stages | `nix/systems-emit-wire/` -> check `systems-emit-wire` (drivers, emit product, unit walk, optional release, hosted probe path) |
| Systems LLVM IR presence | `just systems-llvm-ir` (live); flake after human stages | `nix/systems-llvm-ir/` -> check `systems-llvm-ir-presence` (hold unlock, emit-path, Mult..Graph unit text, unit-package artifacts, compose text, optional as-smoke honesty, Mult ABI parity fixture/header/IR; no llvm-as binary require) |
| Idris-side dual presence | `just idris-side` (live); flake after human stages | `nix/idris-side-presence/` -> check `idris-side-presence` (files + tokens + examples jargon) |
| Lean-side dual presence | `just lean-side` (live); flake after human stages | `nix/lean-side-presence/` -> check `lean-side-presence` (files + tokens + examples jargon) |
| Systems mill extras-fit | `just systems-mill-extras-fit` (live); flake after human stages | `nix/systems-mill-extras-fit/` -> check `systems-mill-extras-fit` (HostModuleCheck extras file + mill-class just-line; does not mill) |
| Progress meters | `just progress` | `nix/progress/` -> text outputs / package `progress-report` |
| Line-count appendix | `just progress-scc` | `just` + `scc` on PATH |
| Watch loop | `just watch` | short `just` loop only |
| Full suite | `just check` | hygiene (+ professional-tone) + systems-host + systems-emit-wire + systems-llvm-ir + idris-side + lean-side + systems-mill-extras-fit + flake check + residual workspace scripts |

**New pure Nix modules and flakes (HITL stage):** `just systems-host` / `just
systems-emit-wire` / `just systems-llvm-ir` / `just idris-side` / `just lean-side` /
`just hygiene` / `just professional-tone` / `just systems-mill-extras-fit` evaluate the live worktree (impure) and
do not require the new path to be git-tracked. `nix flake check` and
`nix build .#checks.*.systems-host-presence` (or `systems-emit-wire`,
`systems-llvm-ir-presence`, `idris-side-presence`, `lean-side-presence`,
`systems-mill-extras-fit`,
`professional-tone`) only see files git tracks. After adding under `nix/` (and
any related paths the flake copy needs), the **human** must `git add` those
paths before flake/continuous integration (CI) match. Agents must **not** stage
files to "help," silence flake WARN, or force flake/CI green. Prefer impure
`just` pure-eval gates until the human stages. The `justfile` `check` recipe
WARN states the same policy without a hardcoded path list -- stage what the
flake error names (or `git status` under `nix/` and related flake copy paths).
Same idea in `doc/SESSION-HANDOFF.md` (**Flake vs live**).

```
nix/
  novel-source.nix            # which paths count as novel work
  source-hygiene.nix          # pure ASCII + no trailing whitespace
  professional-tone.nix       # novel *.md professional tone / banned tokens (v1)
  string-contains.nix         # stack-safe substring (not lib.hasInfix)
  systems-host-presence/      # skeleton + unit-surface + SYSTEMS_LEAN_HOST + tree-wide jargon
    default.nix               # pure eval: { ok, violations, summary }
    specs.nix                 # required paths + token tables
  systems-emit-wire/          # compile/emit drivers, UNIT_DEEPEN, emit stages, unit walk, probe path, claim A residual free measure
    default.nix               # pure eval: { ok, violations, summary, residualFreeMeasureGreen, ... }
    specs.nix                 # thin join of data slices below
    emit-product.nix          # drivers + emit product APIs/stages + optional release + smoke probe path
    residual-free-measure.nix # PRODUCT-RESIDUAL-FREE-MEASURE forbidden managed residual + honesty (claim A)
    unit-deepen.nix           # UNIT_DEEPEN_V1 units + companions
    unit-walk.nix             # dynamic SKELETON|UNIT_SURFACE walk + skip dirs
  systems-llvm-ir/            # LLVM IR hold + emit-path + Mult..Graph unit text + unit-package + compose + as-smoke + abi-parity + layout-ir-dual-pin
    default.nix               # pure eval: { ok, violations, summary }
    specs.nix                 # thin join of data slices below
    hold.nix                  # living LlvmHold.llvmUnlocked true + forge ban
    emit-path.nix             # design note + MEASURED-STUB + LlvmEmitPath pins
    unit-text.nix             # Mult..Graph Lean modules + local unlock false
    unit-package.nix          # out/llvm-ir slake_*.ll HOST tokens (join)
    compose-text.nix          # compose Lean + slake_compose.ll + just recipe
    as-smoke.nix              # optional llvm-as-smoke recipe honesty (no binary require)
    abi-parity.nix            # Mult layout fixture + freestanding header + IR tag agreement
    layout-ir-dual-pin.nix    # Mult IR full tag lines dual-pin vs fixture (LAYOUT-IR-TAG-DUAL-PIN)
  idris-side-presence/        # dual Idris static presence (Wave A; check.sh deleted)
    default.nix               # pure eval: { ok, violations, summary }
    specs.nix                 # required paths + tokens + examples jargon
  lean-side-presence/         # dual Lean static presence (Wave A; check.sh deleted)
    default.nix               # pure eval: { ok, violations, summary }
    specs.nix                 # required paths + tokens + examples jargon
  systems-mill-extras-fit/    # HostModuleCheck extras file + mill-class just-line
    default.nix               # pure eval: { ok, violations, summary }
  progress/
    default.nix               # entry: report and scores from a tree root
    helpers.nix               # path probes
    milestones.nix            # weighted evidence list
    bars.nix                  # ASCII meter bars
    render.nix                # markdown + console text
```

