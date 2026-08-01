# IrGraph long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Summary

Split still-cold `SystemsLean/IrGraph.lean` along a coherent theorem/smoke seam
matching KernelEmitTheorems / ParityEmitTheorems / HostComposeTheorems.

| Metric | Value |
|--------|-------|
| Before | **410** lines |
| After parent | **177** lines |
| Split module | `IrGraphTheorems.lean` **298** lines |
| Delta parent | **-233** |
| Seam | IR-GRAPH-THEOREM + IR-GRAPH-SMOKE (same namespace `SystemsLean.IrGraph`) |

## Seam choice

Parent keeps dialect only:

- `edgeMax`, `Edge`, `Graph`, `empty`, counts, `isEmpty`
- `PushNodeResult` / `AddEdgeResult`
- `edgeEndpointsOk`, `edgesSound`, `addEdge`, `pushNode`
- `isWellTyped`, `checkFailClosed`

`IrGraphTheorems.lean` owns:

- All IR-GRAPH-THEOREM / HOST-IR-GRAPH-THEOREM theorems
- IR-GRAPH-SMOKE behavioral examples
- Private theorem/smoke fixtures (`thmValueNode`, `smokeTwoNodes`, ...)

Not dual-pin. Not tip primary. Not claim-bool rename. Not half-file cut.
No stitch markers. No `/tmp` full-file rewrite of product Lean (draft was
assembled then installed as the split parent only).

## Wiring

- `SystemsLean.lean` imports `SystemsLean.IrGraphTheorems`
- `nix/systems-host-presence/{host-leans,required-files}.nix` list the split path
- `host-specs-core.nix`: parent drops theorem/example tokens; split module holds
  theorem forms + IR-GRAPH-SMOKE + UNIT_SURFACE honesty
- `specs.nix` package-root import list includes `import SystemsLean.IrGraphTheorems`

## Gates

| Gate | Result |
|------|--------|
| `lake build SystemsLean.IrGraph SystemsLean.IrGraphTheorems` | GREEN |
| `just systems-host` | GREEN (101 required paths) |
| `just hygiene` | GREEN |
| tip / freestanding-self-host-complete | not run (tip not touched) |

## Claims

Preserved by not touching SelfApplyFs tip:

- complete true
- free / llvm / PROVABLY false

## Next cold primary

**ParityProgram long-file split** (cold **407**; largest never-split primary after
this slice; skip tip, role scaffolds, CompilePath seams-done, already-split once).

## Join

`/tmp/grok-1000/grok-impl-summary-ir-graph-split-96e7662e.md`
