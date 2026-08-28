# Implement report: Types foreign link success (2026-08-10)

IMPL_ID: fullready-types-foreign-20260810094000

## Summary

Landed **Types foreign link success** (full readiness R2 progressive after
Linear). Mirror of LinearForeignLink / MultForeignLink for Types kind tags
VALUE/LINEAR/ERASED (i32 0/1/2, size 4, align 4 on x86_64-unknown-linux-gnu).
Did **not** edit LlvmCfgFixture. Did **not** flip Mult/Linear otherBands or
fullBackend. free/complete/PROVABLY / FullHostElaborateRemains unchanged.

## Deliverables

| Path | Role |
|------|------|
| `src/systems/SystemsLean/TypesForeignLink.lean` | Host dual-pin; `typesForeignLinkSuccessClaimed` true; otherBands false; fullBackend false; FOREIGN-TYPES-CONSUMER-CONTRACT + TYPES-FOREIGN-DUAL-AGREEMENT |
| `src/systems/SystemsLean.lean` | Import TypesForeignLink |
| `doc/dev/research/types-foreign-link-success-2026-08-10.md` | Evidence / dual recipe / out-of-tree dogfood |
| `nix/systems-llvm-ir/types-foreign-link-success.nix` | Pure Nix requiredFiles + contentSpecs + forge bans |
| `nix/systems-llvm-ir/specs.nix` | Join typesForeignLinkSuccess |
| `nix/systems-llvm-ir/default.nix` | Summary string includes Types foreign link success |
| `just/llvm.just` | `types-foreign-link-success` recipe |
| Residual / handoff / rust-entry / out/llvm-ir README | Tip lockstep |
| `doc/dev/research/general-program-cfg-posture-2026-08-10.md` | P2 research only (unit diamonds honesty; not fullBackend) |

## Gates (observed GREEN)

```
just hygiene                          # exit 0
just systems-llvm-ir                  # Types foreign in summary; 114 paths
lake build SystemsLean.TypesForeignLink  # exit 0 (34 jobs)
just types-foreign-link-success       # systems-llvm-ir + lake + rustc dogfood + llvm-as
just mult-foreign-link-success        # still GREEN Mult-only
just linear-foreign-link-success      # still GREEN Linear Mult-class tags
```

Out-of-tree: `TypesKindTag` Value/Linear/Erased = 0/1/2; size 4; align 4.
Optional `llvm-as` on `slake_types.ll` + `slake_types_ssa.ll` GREEN.

## Honesty pins

| Pin | Value |
|-----|-------|
| typesForeignLinkSuccessClaimed | true |
| typesForeignLinkOtherBandsClaimed | false (Program/Graph) |
| typesForeignLinkFullBackendClaimed | false |
| llvmTypesSsaRustNativeLinkClaimed | false (local; success lives in TypesForeignLink) |
| Mult multForeignLinkOtherBandsClaimed | false unchanged |
| Linear linearForeignLinkOtherBandsClaimed | false unchanged |
| free / complete / PROVABLY | unchanged |
| FullHostElaborateRemains | false unchanged |

## P2

Research note only for general CFG beyond unit diamonds. Optional host bool
`productionCfgUnitDiamondsOnlyClaimed` **not** landed (serialize LlvmCfgFixture
long-file residual). WATCHER remains general program CFG posture.

## Not done

- Program/Graph foreign link
- fullBackend true / R1e
- Product Rust under `src/`
- LlvmCfgFixture edits
