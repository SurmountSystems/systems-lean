# Plan: remaining work in parallel

## Read this first

Nothing here needs a host change unless you want persist to stop rewriting `TECH.md`. If you Approve without notes, these defaults apply:

1. **Do not mill the last five inventory rows.** They are honest leftovers, not the next mill. Host-module-check extras are too long for the mill helper. Dual-equality write API, self-host complete, product-path write, and Mult filesystem write stay skipped or unmillable without changing the helper.
2. **Move the living compiler map off `TECH.md`.** Host persist keeps replacing repo-root `TECH.md` with a 13k-line nested-session dump within about two seconds. New home: `doc/compiler-map.md` (ASCII, under 1000 lines). Token rows stay in `~/.agents/reports/l2-token-ledger.md` (local, not git). `TECH.md` becomes a one-paragraph pointer or is left alone until persist is fixed.
3. **Independent mill extras compile in waves on surmount-1.** The mill helper still compiles extra modules one after another. That is why 60 cores sit idle. Mill 64 is GREEN, so the helper is free to change.
4. **Open residual Trait-object vtable IR** in the same Approve. LLVM IR is the Rust-compatible surface. rustc_abi is the check. No product Rust under `src/`. Occupancy stays 49 names.

## Agent notes

Done looks like: mill metric honest at **64 of 69**; five leftovers named as skips; compiler map lives where persist cannot smash it; mill helper compiles independent extras in topological waves on surmount-1; vtable IR residual is Open with checkable Done when; occupancy 49; Lake-gone unclaimed.

Estimates: docs relocate is one slice. Mill-extras waves is one mill-helper edit plus a measured compile on surmount-1. Vtable IR is one product residual slice.

Intended depth: L1 coordinates. Four parallel L2s after Approve (see Launch groups). Each L2 spawns L3. One reviewer after mill-extras waves land. Occupancy prove stays `[lake-coord]` only.

Reports: `~/.agents/reports/impl-compiler-map.md`, `~/.agents/reports/impl-mill-extra-waves.md`, `~/.agents/reports/impl-vtable-ir.md`.

### Launch groups

Approve starts immediately, in parallel:

- **Compiler map.** Write `doc/compiler-map.md`. Point README, residual, WATCHER, AGENTS. Token ledger path: `~/.agents/reports/l2-token-ledger.md`. Do not fight persist on `TECH.md`.
- **Independent mill extras.** Edit `_compile-inventory-exe` so extra modules compile in import-order waves on surmount-1. Cap concurrent mill Leans by free memory. OccupancyProbe stays one thread. Measure one replay of `just sixty-fourth-host-tool` or a named extra-only compile. Never lake.
- **Trait-object vtable IR.** Open residual Name. Dual-pin rustc vtable slots (drop, size, align, methods) against Lean-emitted LLVM IR for one named two-pointer record. rustc_abi check. No `src/` Rust crate.
- **Residual honesty.** Lockstep 64 of 69 if inventory is not already there. Name the five leftovers. Highest-value next is mill-extras waves plus vtable IR, not a fake 65th mill.

Parent does not wait mill or Lake. One mill compile at a time. One Lake L2.

## Context

**What is already true**

| Meter | Now |
|-------|-----|
| Host tools without Lake on the step | **64 of 69** (`slake-emit-freestanding-c` GREEN on surmount-1, ELF 4844256 bytes, END 2026-09-11T22:55:46Z) |
| Occupancy | **49 names / 164 compile-order rows** |
| Named closed subset | **49 of about 206** |
| FullHost / Lake-gone | false / not claimed |

**What is left (do not mix these)**

| Work | What it is | Parallel with mill compile? |
|------|------------|-----------------------------|
| Five leftover executables | Honest skips / helper cannot mill | Yes: docs only. Do not mill them. |
| Independent mill extras | Extra modules today compile one-by-one in `_compile-inventory-exe` | After mill 64 GREEN (now). That is the mill-helper bottleneck on surmount-1. |
| Trait-object vtable IR | Rust-compatible IR bar | Yes. Lean + `out/llvm-ir` + rustc_abi. Not occupancy 50. |
| Compiler map | Persist smashes `TECH.md` | Yes. New path `doc/compiler-map.md`. |
| Two-target emit | Still OPEN | Do not start unless this plan's groups are green. |

**Names to use (and what they replace)**

| Prefer | Stop saying as if it were the product |
|--------|----------------------------------------|
| Independent mill extras | Bare extra_mods as chat language |
| Recipe that builds `slake-emit-freestanding-c` | Bare sixty-fourth as the Name |
| Host-module-check executable | Kitchen-sink mill of HostModuleCheck |
| Compiler map | Persist dump titled Nested L2 token tracking |
| Residual update after mill GREEN | Bare lockstep as the only English |
| Two-pointer trait-object record | i32 tags as if they were a vtable |

## Approach

Four disjoint write sets. No second mill. No OccupancyProbe theater.

1. **Compiler map** under `doc/`. Residual stays Open/Done. Token rows stay local.
2. **Mill extras waves** in `just/first-host-tool.just` only (plus a thin README row). Replay one already-GREEN mill on surmount-1 to prove wall-clock, same ELF, still no lake on that step.
3. **Vtable IR** as a named residual, not an occupancy extra. Default fixture: two-pointer record (data pointer + vtable pointer) matching rustc trait-object layout on `x86_64-unknown-linux-gnu`.
4. **Honesty** in residual: 64 of 69; five leftovers listed; next value is extras waves + vtable IR.

Not recommended: milling host-module-check; forging 65 of 69; looping OccupancyProbe; mill on horizon; waiting mill GREEN before starting groups 1, 3, and 4.

## Critical files

| Path | Why |
|------|-----|
| `doc/compiler-map.md` (new) | Living tree + tracking tables |
| `just/first-host-tool.just` | Independent mill extras loop |
| `src/systems/host-tools-inventory.md` | 64 of 69 |
| `RESIDUAL-systems.md` / `RESIDUAL.md` / `WATCHER.md` | Open Names |
| `doc/rust-entry.md` / `out/llvm-ir/` | IR is the Rust-compatible surface |
| `ref/rust/compiler/rustc_abi/` | Vtable layout, read-only |

## Reuse

| What | Path | How |
|------|------|-----|
| Mill extras wave explore | `~/.agents/reports/explore-mill-extra-mods-waves-2026-09-09.md` | Cap `min(wave_width, floor(free_GiB/2), 8)` |
| Leftover mill rank | `~/.agents/reports/prep-sixty-fifth-host-tool.md` | Honest skip host-module-check |
| Token overflow | `~/.agents/reports/l2-tokens-mill-wave.md` | Rename/copy to `l2-token-ledger.md` |
| Idle-builder plan | `.agents/plans/plan-idle-builder-vtable-ir-2026-09-09.md` | This plan supersedes mill-56 timing |

## Steps

1. **Compiler map:** write `doc/compiler-map.md`; pointers; do not wrestle persist on `TECH.md`.
2. **Independent mill extras:** topological waves in `_compile-inventory-exe`; replay one mill on surmount-1; occupancy probe stays one thread.
3. **Trait-object vtable IR:** Open Name + first dual-pin artifact.
4. **Residual honesty:** 64 of 69; five leftovers; WATCHER next is extras waves or vtable, not mill 65.

Steps 1, 3, and 4 run while step 2 compiles. Step 2 does not wait on 1, 3, or 4.

## Risks

- Racing the mill helper while a mill is live: mill 64 is GREEN; still one mill at a time.
- Two OccupancyProbe-class Leans: forbidden. Mill-class RSS (about 1 to 3 GiB) is not that prove.
- Persist rewriting `doc/compiler-map.md`: less likely than `TECH.md`; if it happens, keep the map under `doc/` and the ledger under `~/.agents/reports/`.
- Forging 65 of 69: residual must list skips.

## Verification

- Inventory greps **64 of 69**. No 65.
- `just hygiene` on the compiler map.
- Mill extras replay: same ELF, command log has no lake, wall-clock vs serial cited.
- Occupancy names stay 49.
- Vtable residual has a checkable Done when (rustc_abi slots vs emitted IR).

## Open questions

- None blocking. Defaults are in Read this first.
- Optional: you stop persist from writing nested dumps to `TECH.md`. Agents will not wait on that to move the map to `doc/compiler-map.md`.
