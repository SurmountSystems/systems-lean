# Implement report: Program foreign link success (2026-08-10)

IMPL_ID: fullready-program-foreign-20260810095000

## Outcome

GREEN. Program-band foreign / out-of-tree consumer push-status link success
landed. Graph foreign stays unclaimed. Mult/Linear/Types otherBands remain false.
Full LLVM Open remains. free/complete/PROVABLY unchanged. fullBackend false.

## Honest dual surface

Program IR is **not** a three-tag i32 kind enum. Primary dual is emit **push
status codes** already on disk:

| Code | Meaning |
|------|---------|
| 0 | ok |
| -1 | badNode |
| -2 | full |
| CAP 8 | `SLAKE_IR_PROGRAM_CAP` / `IrProgram.programCap` |

Secondary SSA `status_ix` 0/1/2 maps to those codes via
`slake_program_ssa_push_status`.

## Delivered

| Item | Path / note |
|------|-------------|
| Host Lean dual-pin | `src/systems/SystemsLean/ProgramForeignLink.lean` |
| Package import | `SystemsLean.lean` imports `ProgramForeignLink` |
| Evidence | `doc/dev/research/program-foreign-link-success-2026-08-10.md` |
| Pure Nix | `nix/systems-llvm-ir/program-foreign-link-success.nix` joined in `specs.nix` |
| just recipe | `just program-foreign-link-success` in `just/llvm.just` |
| Residual Done | `RESIDUAL-systems.md` Done archive row **Program foreign link success** |
| Tips | `doc/rust-entry.md`, `out/llvm-ir/README.md`, `doc/SESSION-HANDOFF.md`, `RESIDUAL.md` |

## Claims

| Pin | Value |
|-----|-------|
| `programForeignLinkSuccessClaimed` | **true** |
| `programForeignLinkOtherBandsClaimed` (Graph) | **false** |
| `programForeignLinkFullBackendClaimed` | **false** |
| Mult/Linear/Types otherBands | **false** (unchanged) |
| free / complete / PROVABLY / FullHost | **unchanged** |

## Gates (observed)

```
just program-foreign-link-success   # GREEN (systems-llvm-ir + lake + rustc dogfood + llvm-as)
just mult-foreign-link-success      # GREEN Mult Mult-only
just linear-foreign-link-success    # GREEN Linear Mult-class
just types-foreign-link-success     # GREEN Types kind tags
just systems-llvm-ir                # GREEN (includes Program foreign slice)
just hygiene                        # GREEN
lake build SystemsLean.ProgramForeignLink  # GREEN
```

Out-of-tree dogfood: `ProgramPushStatus` repr(i32) size 4 align 4 codes
0 / -1 / -2 CAP=8 under `/tmp` (not product Rust under `src/`).

## Non-claims

- Not Graph foreign link
- Not full LLVM production backend
- Not Mult/Linear/Types otherBands flip
- Not free/complete/PROVABLY/FullHost flip
- Did not edit `LlvmCfgFixture` (sibling long-file/general CFG)

## Full LLVM Open

Unchanged progressive Open Name **Full LLVM production backend**. R2 remaining
after this slice: **Graph foreign link**.
