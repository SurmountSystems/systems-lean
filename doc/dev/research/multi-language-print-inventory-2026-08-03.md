# Multi-language print inventory

Kind: analysis only. Not residual invent. Not host free forge. Not DualResidual
claim flip. Not product free re-open. ASCII only. Date: 2026-08-03.

**Source explore join:** `.agents/joins/embedded-language-print-debt.md`
(read-only inventory under `src/systems/`, `src/lean4/`, `nix/`, `just/`; not
`ref/`).

**Policy home:** `AGENTS.md` (Multi-language print policy). Finish-line program:
`.agents/plans/plan-slake-replaces-lake.md` Program P. This note is **P0**
inventory landed; it is not alone a license to ban freestanding product C or
classic Lake ahead-of-time C.

---

## 1. Three stories (keep separate)

| Story | What it is | Relation to cleanup |
|-------|------------|---------------------|
| **(1) Classic Lean managed-runtime ahead-of-time C** | Upstream Lean / Lake can emit C for the managed Lean runtime path. Intermediate lives under build trees such as `.lake/`. Not freestanding product. Not our novel implementation language. | **Not** debt to delete because Lake emits C. Goals already say classic ahead-of-time still carries a managed runtime. |
| **(2) Freestanding product C** | Slake product under `emit/` and `out/freestanding-c`, composed by Lean-owned emit (templates and authority fragments such as `host_emit_*.ssot.txt`). Intentional product generation. | **Keep.** Improve structure only with a named Open residual, not a slogan ban. Ownership SSoT: `src/systems/emit/host-owned-emit.md`. |
| **(3) Novel helpers that print another language as string soup** | Code **we** wrote that builds another language's full source mainly by string concatenation and `IO` / print (for example host-cc helper tools that are entire C programs held as Lean strings). Dense bash in `just/*.just` is temporary orchestration, not Lean-printed. | **This** is the cleanup track. Inventory first; clean up with evidence. Do not grow. |

---

## 2. Executive summary (evidence)

| Class | Present in novel tree? | Story | Notes |
|-------|------------------------|-------|--------|
| Lean printing bash/shell scripts as product | **Not found** under `src/**/*.lean` | (3) suspect | Do not invent bash printers that are not there |
| Novel Nix wrapping long shell farms | **Not found** | (3) | Prefer pure Nix checks |
| Lean building full helper C tools as string concat | **Retired (P1 2026-08-03)** | **(3) paid** | `MultFsWriteTool`, `ProductWireWriteTool` living path is Lean-native MultSubsetEmit / CapableWriteHc+InstallOut `IO.FS.writeFile`; short retired greppable `*CSource` markers only; join `.agents/joins/p1-host-cc-helper-tools.md` |
| Freestanding emit modules holding large C as Lean strings (often also on disk as `host_emit_*.ssot.txt`) | **Yes** | **(2)** | Product path shape; optional later structure work only if promoted |
| LLVM IR text from Lean strings | **Yes** | Deferred product path | Separate track; not bash; not host free |
| Dense bash in `just/*.just` | **Yes** | Temporary orchestration | Already shrinking toward pure Nix; not printed from Lean |
| Long claim essays on driver stdout | **Yes** | Driver policy | Existing stdout policy; not foreign-source emit |

**Bash freestanding emit driver is already deleted.** Do not restore
`script/slake-emit-freestanding-c.sh`.

---

## 3. Top temporary-helper debt (story 3)

Ranked by "print language A inside B" severity for **temporary helpers** (not
product wire intent).

| # | Path | Why | Class |
|---|------|-----|--------|
| 1 | `src/systems/SystemsLean/ProductWireWriteTool.lean` | **P1 done:** living dual-eq WRITE+INSTALL via Lean IO; full host-cc C print retired | Novel helper C print **retired** |
| 2 | `src/systems/SystemsLean/MultFsWriteTool.lean` | **P1 done:** living MultSubsetEmit `IO.FS.writeFile`; full host-cc C print retired | Novel helper C print **retired** |

**Supporting residual Name (P1) -- done 2026-08-03:** **Host-cc helper tools
without C printed from Lean** (join `.agents/joins/p1-host-cc-helper-tools.md`).

- **Was:** Mult and product-wire freestanding write tools printed full C tool
  sources from Lean string templates.
- **Now:** Lean-native MultSubsetEmit / CapableWriteHc+InstallOut; short retired
  greppable markers only; just recipes prefer prebuilt Lean writers.

---

## 4. Product wire surface (story 2 -- keep; optional later only)

Large freestanding C as Lean string fragments lives in `Emit*Scaffold` modules
with dual `host_emit_*.ssot.txt` files. Composer shape that **loads** SSOT into
templates (`FreestandingEmit` / `FreestandingEmitLoad`) is the correct product
composer direction.

| Optional later Name (not default-required from the bash ask) | Goal |
|--------------------------------------------------------------|------|
| One authority per freestanding fragment | Collapse dual full-C copies where that is real dual maintenance; keep dual-equality honesty |
| Scaffold C as structured emit | Prefer typed builders over multi-kLOC string soup for large units (Body / Compose first) |

Default after P0: **do not** open those as required next work from this inventory
alone. Operator may promote later.

---

## 5. Just recipe bash (temporary orchestration)

Dense shebang recipes under `just/*.just` still hold gates and greps. Pattern for
paydown: pure Nix modules under `nix/` + thin just that only orchestrates (same
shape as `systems-host` / `systems-emit-wire`). Optional parallel cleanup; not
Lean-printed foreign source.

---

## 6. What not to "refactor away" by mistake

| Surface | Keep as |
|---------|---------|
| FreestandingEmit load + placeholder embed into templates | Freestanding product C generation (story 2) |
| Generated `emit/slake_freestanding.{h,c}` / `out/freestanding-c/` | Product wire |
| Classic Lean ahead-of-time under `.lake/` | Story 1; not novel product debt |
| Short stage `IO.println` banners (stage id + wrote paths) | Driver stdout policy (scrub residual essays only) |
| Pure Nix progress markdown render | Tooling text, not shell mill |

---

## 7. End intent (supporting cleanup)

Prefer not to grow **novel** helpers whose main job is printing another
language's full source body as string concatenation (especially temporary
helpers: shell-like scripts, host-cc helper tools). That does **not** ban classic
Lean ahead-of-time intermediate C, and does **not** ban freestanding product C
generation. Inventory first (this note). Clean up only what evidence shows.

This cleanup does **not** replace "Slake does everything Lake does" for host
develop. It does not flip DualResidual host residual free.

---

## 8. Pointers

| Artifact | Role |
|----------|------|
| Explore join | `.agents/joins/embedded-language-print-debt.md` |
| This note | Living P0 inventory (three-story table) |
| `AGENTS.md` | Multi-language print policy |
| `plan-slake-replaces-lake.md` | Program P order P0-P3 |
| `emit/host-owned-emit.md` | Freestanding product C ownership SSoT |
| Residual Open | Supporting Name for host-cc helpers after this note lands |
