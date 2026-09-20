# Plan: idle builder, mill extras, vtable IR

## Read this first

1. **surmount-1** (guest hostname; SSH `nixbuilder@surmount-1`, tree `/home/nixbuilder/iso`) is idle because mill `_compile-inventory-exe` compiles extra_mods **one after another**, then body, then Main. `LEAN_NUM_THREADS=16` only parallelizes **inside one** `lean` on that host. It does not compile independent extras at the same time. Raising threads further will not fill surmount-1's 60 cores.
2. OccupancyProbe cache-hit cannot occupy **surmount-1**. Inventing occupancy extras to keep Lake busy on that host is forbidden. Occupancy stays 49 names.
3. Recommended next product Name after mill: **Trait-object vtable IR** (Rust-compatible IR bar). That is the original LLVM-IR-is-Rust-compatible ask, not i32 tags only.

## Agent notes

- This file is a plan. Do not implement extra_mods fan-out or vtable IR until Approve.
- Mill 56 (`just fifty-sixth-host-tool`) is already live on nixbuilder. Do not start a second mill.
- Launch groups after Approve (not this turn): (A) extra_mods DAG parallel compile in the mill helper, (B) vtable IR dual-pin residual, (C) remaining mill recipes 58+ in `just/later-host-tools.just`.

## Context

**surmount-1** (QEMU guest, 60 cores, 256 GiB): mill lean about 1 GiB, load about 1, CPU about 2 to 3 percent, RAM about 4 percent used. That is evidence from btop on that host, not a guess, and not horizon.

Why: the mill helper on surmount-1 loops extras serially (`for dep in $extra_mods; lean ...`). One Lean at a time on that machine. Occupancy extras barrel is empty. OccupancyProbe on surmount-1 is a 1 s cache hit. Horizon does not mill.

## Approach (recommended)

1. Keep mill 56 running on **surmount-1**. Parent does not wait. Review and mill 57 after GREEN notifications. Still `ssh nixbuilder@surmount-1`.
2. After Approve (and after mill 56 GREEN so we do not race the live helper on **surmount-1**), change `_compile-inventory-exe` so independent extras compile in topological waves **on surmount-1**. Explore: mill 56 has 37 extras, max wave width **5**, about **17 waves**, then body `LlvmComposeSsa`, Main, `leanc`. Cap concurrent mill Leans on surmount-1 as `min(wave_width, floor(free_GiB / 2), 8)` (about 5 to 10 GiB for mill 56). OccupancyProbe stays `LEAN_NUM_THREADS=1`. Never lake. Report: `~/.agents/reports/explore-mill-extra-mods-waves-2026-09-09.md`.
3. Open residual **Trait-object vtable IR**: dual-pin rustc vtable slots (drop, size, align, methods) against Lean-emitted LLVM IR for one named `dyn`-shaped contract. rustc_abi is the check. No product Rust under `src/`. Not FullBackend. Not inventing occupancy 50.
4. Rank leftover mill rows after 57: LlvmTypesSsa, HostImportGraph, LlvmComposeText, LlvmProgramSsa, LlvmGraphSsa, then fat CapableWriteHc / FreestandingEmit / HostModuleCheck. Skips stay DualEqWriteApi, SelfHostComplete, ProductPathWriteHc.

Not recommended: looping OccupancyProbe; mill on horizon; two OccupancyProbe-class Leans; claiming Lake-gone.

## Critical files

- `just/first-host-tool.just` (`_compile-inventory-exe` extra_mods loop)
- `just/later-host-tools.just` (mills 55-57)
- `doc/rust-entry.md`, `out/llvm-ir/README.md` (IR is the Rust-compatible surface)
- `ref/rust/compiler/rustc_abi/` (vtable / trait object layout, read-only)
- `RESIDUAL-systems.md` / `WATCHER.md` (Open Name lockstep)

## Reuse

- Mill helper already honors `LEAN_NUM_THREADS` (default 16).
- Layout dual-pin pattern: `just richer-record-layout`, `just rust-ir-interop-full`.
- Rank report: `~/.agents/reports/rank-remaining-host-tools-after-54.md`.

## Steps

1. Extra_mods waves: group extras by import DAG; compile a wave concurrently; then body; then Main; then leanc. Proof: mill 56 or 57 wall-clock vs serial, same ELF, lake grep still misses lake as a word.
2. Vtable IR: one named trait-object shaped IR fragment + host Lean dual-pin vs rustc vtable layout on `x86_64-unknown-linux-gnu`. Optional `/tmp` rustc dogfood. No `src/` Rust crate.
3. Mill 58+ recipes in `just/later-host-tools.just` after 57 GREEN, smallest remaining import count first.

## Risks

- Parallel extras that actually import each other will fail. Waves must be topological.
- Too many concurrent mill Leans could still spike RAM. Cap from `free`, not core count.
- Vtable layout can shift across rustc versions (1.98.1 was a vtable codegen fix). Pin the rustc/ref revision in the dual-pin.

## Verification

- Extra_mods: same mill ELF GREEN on **surmount-1**; command log still lean then leanc; word-aware lake miss; more than one `lean` overlapping in a wave on `nixbuilder@surmount-1`.
- Vtable: named gate (new `just` or extend `rust-ir-interop-*`) fails before the dual-pin, passes after; occupancy 49; FullHost false.

## Open questions

- Should extra_mods waves land before mill 57, or only after mill 56 GREEN so we do not race the live helper?
- Is the first vtable fixture a Mult-band trait object, or a tiny dedicated `dyn`-shaped record with two pointers (data + vtable)?
