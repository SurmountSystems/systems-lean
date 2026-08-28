# Implement report: W3a ParityProgram TERM-SURFACE (2026-08-11)

**Status:** GREEN

## Goal

Land HostModuleCheck companion TERM for real unit `SystemsLean.ParityProgram`.
Pattern-clone of `HostModuleCheckParityTypesTerm.lean`. First of two W3 TERM units
(Emit is W3b).

## Done when (checklist)

| # | Outcome | Result |
|---|---------|--------|
| 1 | New module `SystemsLean/HostModuleCheckParityProgramTerm.lean` | yes |
| 2 | E-good dialect accept; E-bad ILL-TYPED-TERM twins (stageId, ready, ok, contract) | yes (PP1..PP4) |
| 3 | dualOk pin + SurfaceOk gate (not bare dualOk alone) | yes |
| 4 | RealModule refine, LoadOk smoke, harness **59->60** | yes |
| 5 | SystemsLean.lean / HostModuleCheck / pure Nix systems-host-presence | yes |
| 6 | lake build green for touched modules | yes |
| 7 | FullHost false; free/complete/PROVABLY true; DominanceClaimed false | unchanged honest |
| 8 | Sub-1-KLOC | Term module **396** lines |
| 9 | just hygiene green | yes |
| 10 | This report | yes |
| 11 | Residual: W3 left **open**; Program TERM partial noted; Emit still owed | yes |

## Commands and exits

```text
lake build SystemsLean.HostModuleCheckParityProgramTerm
  exit 0  (12 jobs)

lake build SystemsLean.HostModuleCheckRealModule \
           SystemsLean.HostModuleCheckLoadOk \
           SystemsLean.HostModuleCheck \
           SystemsLean.HostResidualShrink \
           SystemsLean.HostResidualShrinkTheorems
  exit 0  (51 jobs; LoadOk ~62s, Driver ~74s)

just hygiene
  exit 0  (source-hygiene + professional-tone OK)

just systems-host
  exit 0  (systems-host-presence OK; 273 required paths)
```

## Harness before / after

| Meter | Before | After |
|-------|--------|-------|
| measuredHostLibraryDiskPartition | seed=206+Main=59+harness=**59** | seed=206+Main=59+harness=**60** |
| measuredHostLibraryOutOfScopeHarness count | 59 | 60 |
| New harness module | (none) | `HostModuleCheckParityProgramTerm` (after ParityTypesTerm, before RealModule) |

## Paths touched

### New

- `src/systems/SystemsLean/HostModuleCheckParityProgramTerm.lean`

### Product / harness wire

- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` -- `refineParityProgramWithTermSurface`
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` -- smoke + LoadOk fold
- `src/systems/SystemsLean/HostModuleCheckDriver.lean` -- Driver unless smoke
- `src/systems/SystemsLean/HostModuleCheck.lean` -- import + greppable header
- `src/systems/SystemsLean.lean` -- root import
- `src/systems/SystemsLean/HostResidualShrink.lean` -- harness list, partition, dualOk mirror pins
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` -- partition / list rfl
- `just/host.just` -- harness string, partition, dualOk greps

### Pure Nix presence

- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-3.nix`

### Residual lockstep (not product Lean)

- `RESIDUAL-systems.md` -- W3 partial status; living tip harness 60
- `RESIDUAL.md` -- join living tip harness 60
- `WATCHER.md` -- W3 note Program done / Emit owed; living tip
- `doc/SESSION-HANDOFF.md` -- living tip reseed

## Dialect surface (ParityProgram-only)

| Check | Expectation |
|-------|-------------|
| stageId body | `"SLAKE_SELF_HOST_PARITY_PROGRAM_V0"` |
| hostParityProgramId | `"HOST-PARITY-PROGRAM"` |
| selfHostParityProgramId | `"SELF-HOST-PARITY-PROGRAM"` |
| programContractParityOk (collapsed) | KernelProgram path/graph/compose ready && ParityTypes.typesParityReady && productApiSurfaceOk |
| programParityReady (collapsed) | programContractParityOk && paritySurfaceOk |
| programParityOk (collapsed) | programParityReady |

E-bad twins:

- **PP1** wrong stageId
- **PP2** programParityReady := true
- **PP3** programParityOk := true
- **PP4** programContractParityOk := true

L0 still accepts when required tokens present; L2 rejects with `ILL-TYPED-TERM`.
Gate truth: `hostModuleCheckParityProgramTermSurfaceOk` (dualOk + bar + scope + dialect + rejects + L0Accept).

## Pins table (honesty; no forge)

| Pin | Value | Notes |
|-----|-------|-------|
| FullHostElaborateRemains | **false** | unchanged |
| free / complete / PROVABLY | **true** | unchanged |
| DominanceClaimed | **false** | unchanged |
| band FullBackend | **false** | unchanged |
| hostModuleCheckParityProgramTermSurfaceDualOk | **true** | new TERM pilot pin |
| hostModuleCheckParityProgramTermSurfaceOk | **true** | gate (not bare dualOk) |
| package-env band | Mult..ParityTypes | **not** expanded (W1 / out of scope) |
| seed / Main / harness | 206 / 59 / **60** | measurement only; not FullHost |

## Out of scope (held)

- ParityEmit TERM (W3b)
- Package-env rewrite (W1)
- FullHost flip
- Product C / shell
- git commit

## Next residual

W3 remains **open** until ParityEmit TERM lands (prefer harness **60->61**). Then W1 may
expand package-env for Program/Emit bands. W2 FullHost reseed after W1/W3 evidence.
