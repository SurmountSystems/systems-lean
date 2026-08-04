# Join: embedded-language print debt

**Kind:** read-only inventory (explore).
**Scope:** `src/systems/`, `src/lean4/`, `nix/`, `just/` (novel only; not `ref/`).
**Goal:** places where language B embeds/emits language A source via print/IO/string templates, for a refactor track away from "print code of A inside B."

## Executive summary

| Class | Present? | Notes |
|-------|----------|--------|
| Lean prints **bash/shell scripts** as product | **No** | No `#!/`, `set -e`, or `.sh` writers under `src/**/*.lean` |
| Lean prints **freestanding C** as string templates | **Yes (large)** | `Emit*Scaffold` + dual `host_emit_*.ssot.txt`; freestanding product wire |
| Lean prints **host-cc C tools** (stdio writers) | **Yes (worst debt)** | `MultFsWriteTool`, `ProductWireWriteTool` emit full C tools |
| Lean prints **subset C packages** | **Yes** | `*SubsetEmit` banners + fragment re-export |
| Lean prints **LLVM IR text** | **Yes (deferred track)** | `Llvm*Text` -> `out/llvm-ir/*.ll` |
| Lean host **driver banners** (`IO.println`) | **Yes (policy noise)** | Many stage mains print residual essays; not foreign-language emit |
| Nix `writeShellApplication` / long script bodies | **No** | No hits; pure gates; `progress/render.nix` is markdown report text only |
| just shebang bash recipes | **Yes (process glue)** | Dense `#!/usr/bin/env bash` + `set -euo pipefail` across `just/*.just` |
| `src/lean4/` string-embed of C/shell | **No** | No `++ "` / C template hits in novel lean4 side |

**Bash emit driver is already deleted** (Wave C). Remaining debt is mostly **Lean string-embedding C** (and LLVM IR), plus **just process-glue bash** (not printed from Lean).

## Classification key

1. **product wire emit** -- freestanding C SSOT / templates / generator output; intentional product path
2. **template SSOT** -- Lean-owned text fragments / dual file map that should stay Lean-owned authority
3. **multi-language print debt** -- host/process C (or shell) printed from Lean as glue; refactor target
4. **host driver banner** -- `IO.println` stage ids / pin dumps (stdout policy; not foreign-source emit)
5. **process glue** -- just recipes / thin orchestration (bash lives in just, not printed by Lean)
6. **deferred IR text** -- LLVM IR string packages (honest hold track; still embed pattern)

---

## Top 15 worst offenders

Ranked by "print language A inside B" severity (bytes of foreign source + how far from product freestanding wire ownership).

| # | File:line | Why | Class |
|---|-----------|-----|--------|
| 1 | `src/systems/SystemsLean/ProductWireWriteTool.lean:174` | `productWireFsWriterCSource` builds a **full host-cc C tool** (`main`, mkdir, fwrite, dual byte arrays) as Lean `++` strings; writes `emit/slake_product_wire_fs_write_tool.c` | multi-language print debt |
| 2 | `src/systems/SystemsLean/MultFsWriteTool.lean:150` | `multFsWriteToolCSource` same pattern for Mult package writer; embeds Mult subset bytes as `static const unsigned char[]` | multi-language print debt |
| 3 | `src/systems/SystemsLean/EmitBodyScaffold.lean:119` / `:135` / `:317` | Large freestanding C (`typedef`, `put_char`/`put_u8`/`from_compose`) as Lean string concat; dual map with `host_emit_body_fragment.ssot.txt` | product wire emit + dual template SSOT (debt shape: C-in-Lean) |
| 4 | `src/systems/SystemsLean/EmitComposeScaffold.lean:159` / `:312` | Full `slake_host_compose_*` header/body C as Lean strings (`check_fail_closed` pre-scan loop etc.) | product wire emit + dual template SSOT |
| 5 | `src/systems/SystemsLean/EmitLinearScaffold.lean:153` / `:312` | Linear + ConsumeToken freestanding C APIs as Lean string fragments | product wire emit + dual template SSOT |
| 6 | `src/systems/SystemsLean/EmitTypesScaffold.lean:133` / `:253` | Types + typed IR C (`slake_type_tag`, `slake_ir_node`) as Lean strings | product wire emit + dual template SSOT |
| 7 | `src/systems/SystemsLean/EmitGraphScaffold.lean:131` / `:251` | IR graph edge C APIs as Lean strings | product wire emit + dual template SSOT |
| 8 | `src/systems/SystemsLean/EmitProgramScaffold.lean:115` / `:218` | Ordered IR program C APIs as Lean strings | product wire emit + dual template SSOT |
| 9 | `src/systems/SystemsLean/EmitApplyScaffold.lean:114` / `:189` | Emit-apply CAP + packed tags C as Lean strings | product wire emit + dual template SSOT |
| 10 | `src/systems/SystemsLean/EmitPlanScaffold.lean:104` / `:180` | Emit-plan typedef + plan-from-compose C as Lean strings | product wire emit + dual template SSOT |
| 11 | `src/systems/SystemsLean/EmitExtractScaffold.lean:117` / `:192` | Extract + fail-closed checker C as Lean strings | product wire emit + dual template SSOT |
| 12 | `src/systems/SystemsLean/LlvmComposeText.lean:362` | `composeIrPackage` multi-line **LLVM IR** printed from Lean; `IO.FS.writeFile` `out/llvm-ir/slake_compose.ll` | deferred IR text (same embed pattern) |
| 13 | `src/systems/SystemsLean/LlvmTypesText.lean:272` (+ peers Mult/Linear/Program/Graph ~`:194`/`:239`/`:265`/`:293`) | Unit LLVM IR packages as Lean string builders | deferred IR text |
| 14 | `src/systems/SystemsLean/MultSubsetEmit.lean:127` / `:132` (+ Linear/Types/Program/Graph/Compose/Erasure/Extract peers) | Subset `*.{h,c}` packages: Lean banners + `#include` + re-export of HOST-EMIT fragments; `IO.FS.writeFile` under `emit/` | product wire emit (bootstrap) / C-in-Lean packaging |
| 15 | `just/subset-emit.just:6` (pattern across `just/*.just`) | Dense **shebang bash** gates (`set -euo pipefail`, greps, lake invokes). Not Lean-printed, but still "process logic in shell" and largest remaining non-Lean surface | process glue (scheduled paydown to pure Nix / thin just) |

### Honorable mentions (not top 15, still relevant)

| Path | Note | Class |
|------|------|--------|
| `src/systems/SystemsLean/FreestandingEmit.lean:67` / `:333` | Placeholder embed of SSOT into `template_slake_freestanding.{h,c}.in`; **correct product composer** (loads files, does not invent C APIs as new strings) | product wire emit (keep) |
| `src/systems/SystemsLean/FreestandingEmitLoad.lean:86` | "bash embed parity" comment; load/replace helpers only | product wire emit |
| `src/systems/emit/host_emit_*.ssot.txt` (13 files) | Durable dual SSOT dialect files; authority map in `emit/host-owned-emit.md` | template SSOT (should stay Lean-owned *authority*, ideally single copy) |
| `src/systems/emit/template_slake_freestanding.{h,c}.in` | Thin template shells with placeholders | product wire emit |
| `src/systems/SystemsLean/EmitBannerScaffold.lean`, `EmitMultScaffold.lean`, `EmitErasureScaffold.lean` | Same dual-fragment family as #3-#11 (smaller or simpler than Body/Compose) | product wire emit + dual template SSOT |
| `src/systems/SystemsLean/SelfHostComplete.lean:255` (+ Capable*/Perform*/Official*/StepContractFull mains) | Long `IO.println` residual / claim essays | host driver banner (stdout policy debt) |
| `nix/progress/render.nix:51` | Multi-line `''...''` for **markdown progress report**, not shell | OK (Nix text gen, not shell mill) |
| `src/lean4/` | No foreign-language string embed found | clean |

---

## Architecture map (current intentional path)

```
Lean Emit*Scaffold *HeaderFragment/*BodyFragment  (C text in Lean strings)
        | dual-equality at emit time
host_emit_*.ssot.txt  (same C text on disk)
        |
FreestandingEmit embed placeholders -> template_*.in
        |
emit/slake_freestanding.{h,c}  -> just build -> out/freestanding-c/
```

**Path A host-cc tools** (debt):

```
Lean MultFsWriteTool / ProductWireWriteTool
  print entire tool .c (with embedded package/wire bytes)
    -> emit/slake_*_fs_write_tool.c
    -> host cc -> bin/slake-*-fs-write-cc
```

Ownership SSoT: `src/systems/emit/host-owned-emit.md`.

---

## Negative findings (important)

1. **No Lean-generated shell scripts** as product or glue writers.
2. **No novel Nix `writeShellApplication` / `runCommand` script farms.** Gates are pure eval.
3. **Bash freestanding emit driver deleted** (do not restore `script/slake-emit-freestanding-c.sh`).
4. **`src/lean4/`** is not part of the C-embed surface today.

---

## Recommended residual Names (refactor track)

Use living residual Open Names (not stage ids). Checkable Done when suggested.

### 1. Host-cc tool without C-in-Lean

- **Goal:** Mult and product-wire freestanding write tools no longer print full C tool sources from Lean string templates.
- **Done when:** `MultFsWriteTool` / `ProductWireWriteTool` do not define `*CSource` multi-hundred-line C; measured without-Lake write still green via a non-print path (e.g. Lean `IO.FS.writeFile` of packages only, or a tiny fixed C stub outside Lean that only dumps prebuilt bytes from a non-C host path). No new shell mill.
- **Out of scope:** freestanding product dialect content; llvm unlock.
- **Paths:** `SystemsLean/MultFsWriteTool.lean`, `ProductWireWriteTool.lean`, related just recipes, `emit/slake_*_fs_write_tool.c` generator contract.
- **Class closed:** multi-language print debt #1-#2.

### 2. Single freestanding C fragment authority

- **Goal:** one SSoT per unit for freestanding C text (prefer durable `host_emit_*.ssot.txt` **or** Lean structure, not both full C bodies).
- **Done when:** dual full-C copies gone or reduced to thin equality that does not re-store entire APIs twice; `DUAL-SSOT-EQUALITY` still honest; `just systems-emit-wire` green; `host-owned-emit.md` updated.
- **Out of scope:** inventing a second emit stage id; growing hand-written product C.
- **Paths:** `Emit*Scaffold.lean`, `emit/host_emit_*.ssot.txt`, `FreestandingEmit*.lean`, pure Nix emit-wire specs.
- **Class closed:** dual template SSOT debt inside product wire emit (#3-#11 family).

### 3. Scaffold C as structured emit, not raw string soup

- **Goal:** product freestanding C APIs composed from typed host IR / small builders, not multi-kLOC `++ "  return 0;\\n"` farms in Lean.
- **Done when:** at least one large unit (Body or Compose) no longer stores full function bodies as string literals; regenerate path still produces greppable wire tokens; behavioral probe still green where it covers that unit.
- **Out of scope:** full CFG/SSA; PROVABLY; llvm backend.
- **Paths:** start `EmitBodyScaffold` / `EmitComposeScaffold`; keep templates + FreestandingEmit composer.
- **Class closed:** C-in-Lean shape while remaining product wire emit.

### 4. Just presence bash to pure Nix (process glue)

- **Goal:** cut dense shebang grep mills in `just/subset-*.just` / freestanding-*.just toward pure Nix modules + thin just (same pattern as `systems-host` / `systems-emit-wire`).
- **Done when:** named recipes no longer re-implement token greps in bash; just only invokes lake/exe or `nix eval` pure gates; no new `script/*.sh`.
- **Out of scope:** product freestanding dialect; Lean claim flips.
- **Paths:** `just/subset-emit.just`, `just/host.just`, `just/freestanding-*.just`, new/split `nix/` presence slices as needed.
- **Class closed:** process glue density (not Lean-print, but same "language A inside B" operator pain).

**Suggested implement order:** Name 1 (clear debt, not product dialect) -> Name 2 (stop dual copy) -> Name 3 (structured emit) -> Name 4 (just/Nix paydown, can parallel if disjoint).

---

## Not residual (do not "refactor away" by mistake)

| Surface | Keep as |
|---------|---------|
| FreestandingEmit load + placeholder embed into templates | product wire emit |
| Generated `emit/slake_freestanding.{h,c}` / `out/freestanding-c/` | product wire |
| Short stage `IO.println` banners (stage id + wrote paths) | host driver banner (scrub essays only) |
| Pure Nix progress markdown render | tooling text, not shell |

---

## Evidence commands (already used)

- `rg` under `src/systems`, `src/lean4`, `nix`, `just` for `IO.println`, `set -e`, `#!/`, `writeShellApplication`, C tokens in `.lean`, `IO.FS.writeFile`, `*Fragment`, `*IrPackage`, `*CSource`.
- File map: `emit/host-owned-emit.md`, scaffold/subset/llvm module inventory.

**Join path:** `/home/hunter/Projects/ai/iso/.agents/joins/embedded-language-print-debt.md`
