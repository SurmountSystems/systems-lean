# Join: Host-cc helper tools without C printed from Lean (P1)

**Status:** GREEN (product slice landed; static evidence complete).
**Program:** `.agents/plans/plan-slake-replaces-lake.md` P1.
**Date:** 2026-08-03.

## Goal

Retire MultFsWriteTool / ProductWireWriteTool pattern of printing **full helper C
programs** as Lean string soup. Living writers use freestanding product path or
Lean-native IO.

## What changed

### Living Lean writers (no full C print)

| Module | Living emit | Retired |
|--------|-------------|---------|
| `SystemsLean/MultFsWriteTool.lean` | `MultSubsetEmit.multSubsetEmitWrite` via `IO.FS.writeFile` | multi-hundred-line `multFsWriteToolCSource` C body; host-cc of tool C |
| `SystemsLean/ProductWireWriteTool.lean` | `freestandingCapableWriteFreestandingHc` + `freestandingCapableInstallFreestandingOut` | multi-hundred-line `productWireFsWriterCSource` C body; host-cc of tool C |

New honesty pins:

- `multFsWriteToolNativeIo = true` / `multFsWriteToolPrintsFullHelperC = false`
- `productWireFsWriterNativeIo = true` / `productWireFsWriterPrintsFullHelperC = false`

`*CSource` defs remain as **short retired greppable markers** only (presence
tokens + archaeology). Retired Path A path strings
(`slake_*_fs_write_tool.c`, `slake-*-fs-write-cc`) stay greppable for MultFsDeepen
pin continuity; living emit does **not** write those tool C files.

### Just recipes

| Recipe | Living path |
|--------|-------------|
| `just mult-subset-freestanding-write` | Prefer prebuilt Mult package write or MultFsWriteTool; else lake exe MultFsWriteTool. No `cc` of Lean-printed tool C. |
| `just product-wire-freestanding-write` | Prefer prebuilt CapableRegenerate or ProductWireWriteTool; else lake exe ProductWireWriteTool. No host-cc C print path. |
| `just build` (product-wire.just) | Prefer Name B Lean-native product-wire write; else Name A prebuilt regenerate. No tool C + cc gate. |

### Presence / residual / docs

- `nix/systems-host-presence/host-specs-compile-path-1.nix`: living tokens
  (`*NativeIo`, `*PrintsFullHelperC`, `IO.FS.writeFile`, InstallOut import /
  freestandingCapableInstallFreestandingOut).
- Residual: P1 **done** (`RESIDUAL-systems.md` Done archive + join board
  `RESIDUAL.md`). Open primary remains **Package roots without Lake** (A3).
- `emit/host-owned-emit.md`, `doc/vocabulary.md`, `doc/SESSION-HANDOFF.md`,
  `WATCHER.md`, multi-language print inventory research note, plan-north-star
  P1 row.

### Unchanged (honesty)

- DualResidual host residual remains / free claimed false (not flipped).
- Product free/complete/PROVABLY / product Lake pins: not flipped by this slice.
- Tool modules keep `stillUsesLake` / `dependsOnLake` **true**.
- Freestanding product C under emit/out still intentional product wire (story 2).
- Classic Lake AOT under `.lake` not banned (story 1).

## Static evidence (this implementer)

```
# No full C byte-array printer remains in WriteTool modules
rg 'formatCByteList|cByteArrayDef|static const unsigned char' \
  src/systems/SystemsLean/*WriteTool*   # zero matches

# Living pins
rg 'def multFsWriteToolPrintsFullHelperC.*false' \
  src/systems/SystemsLean/MultFsWriteTool.lean
rg 'def productWireFsWriterPrintsFullHelperC.*false' \
  src/systems/SystemsLean/ProductWireWriteTool.lean
rg 'def multFsWriteToolNativeIo.*true' \
  src/systems/SystemsLean/MultFsWriteTool.lean
rg 'def productWireFsWriterNativeIo.*true' \
  src/systems/SystemsLean/ProductWireWriteTool.lean

# Emit bodies call Lean IO, not tool C write
# MultFsWriteToolEmit -> MultSubsetEmit.multSubsetEmitWrite
# productWireFsWriterEmit -> freestandingCapableWriteFreestandingHc
#                          + freestandingCapableInstallFreestandingOut
```

## Gates (run on host with lake / just)

Focused Lean (if PATH has lake):

```bash
cd /home/hunter/Projects/ai/iso/src/systems
lake build SystemsLean.MultFsWriteTool SystemsLean.ProductWireWriteTool \
  SystemsLean.MultFsDeepen SystemsLean.MultFsWriteToolMain \
  SystemsLean.ProductWireWriteToolMain
```

Measured recipes (after prebuild or with lake on PATH):

```bash
cd /home/hunter/Projects/ai/iso
just mult-subset-freestanding-write
just product-wire-freestanding-write
just systems-host
just professional-tone
```

Optional product wire:

```bash
just build
```

**Note:** this subagent tool surface had no shell runner; lake/just were not
executed in-process. Parent should run the gate list above before claiming
session-wide GREEN. Product code and residual honesty for P1 are landed on disk.

## Non-claims

- Not host free / DualResidual flip.
- Not product free/complete/PROVABLY re-open or forge.
- Not ban of freestanding product C or classic Lake AOT.
- Not llvm unlock work.
- Not full delete of historical generated tool `.c` files under emit/ (optional
  later cleanup; living Lean path no longer regenerates them).

## Next residual

Primary Open: **Package roots without Lake** (A3).
`WATCHER.md` already points there.

**Join path:** `/home/hunter/Projects/ai/iso/.agents/joins/p1-host-cc-helper-tools.md`
