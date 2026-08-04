# Join: LLVM IR compose emit (Track 2d) verify

**Date:** 2026-08-03
**Scope:** read-only on-disk verify of residual "LLVM IR compose emit" (north-star Track 2d)
**Verdict: COMPLETE**

## Checklist evidence

### 1. Lean compose write path
| Path | Evidence |
|------|----------|
| `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/LlvmComposeText.lean` | Exists; stage `SLAKE_LLVM_COMPOSE_TEXT_V0` / `HOST-LLVM-COMPOSE-TEXT`; HostCompose + IrProgram + IrGraph compose IR write |
| `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/LlvmComposeTextMain.lean` | Exists; `main` -> `LlvmComposeText.main` for lake exe |
| `/home/hunter/Projects/ai/iso/src/systems/lakefile.lean` | `lean_exe "slake-llvm-compose-text"` root `SystemsLean.LlvmComposeTextMain` (~L304-305) |
| `/home/hunter/Projects/ai/iso/just/llvm.just` | Recipe `llvm-compose-text:` lake build/exe + `just systems-llvm-ir` (~L129-144) |

### 2. out/llvm-ir artifacts
| Path | Evidence |
|------|----------|
| `/home/hunter/Projects/ai/iso/out/llvm-ir/slake_compose.ll` | Generator-owned compose IR (banner + CAP/EDGE_MAX + mint/consume/check/extract sketches) |
| `/home/hunter/Projects/ai/iso/out/llvm-ir/README.md` | Status names compose emit + Mult..Graph; maps `LlvmComposeText` / `slake_compose.ll` |
| `/home/hunter/Projects/ai/iso/out/llvm-ir/MEASURED-STUB.txt` | Present as emit-path honesty stub (still Mult/Linear-focused body; compose lives in `slake_compose.ll` + README, not this stub body) |

### 3. Dual greps / pure Nix
| Path | Evidence |
|------|----------|
| `/home/hunter/Projects/ai/iso/nix/systems-llvm-ir/compose-text.nix` | requiredFiles: LlvmComposeText{,Main}.lean + slake_compose.ll; contentSpecs + just recipe token |
| `/home/hunter/Projects/ai/iso/nix/systems-llvm-ir/default.nix` | Joins hold / emit-path / unit-text / unit-package / compose-text via specs |
| `/home/hunter/Projects/ai/iso/just/llvm.just` | `llvm-compose-text` + pure join `systems-llvm-ir` |

### 4. Living SSoT honesty
| Claim | Evidence |
|-------|----------|
| `LlvmHold.llvmUnlocked` **true** | `src/systems/SystemsLean/LlvmHold.lean` L104: `def llvmUnlocked : Bool := true` |
| free/complete/PROVABLY not forged false | Residual/handoff/self-host tip: free true, complete true, PROVABLY claimed (`provablyUnlocked` true L109); local compose pin stays locked (`llvmComposeTextLlvmUnlocked` false forbidden-true in compose-text.nix) |
| Not production opt pipeline | Module header + artifact banner: not full CFG/SSA / llvm-as / production backend |

### 5. Residual lockstep
| Path | Evidence |
|------|----------|
| `RESIDUAL-systems.md` | Open next: Optional llvm-as smoke; Done archive row **LLVM IR compose emit** done Track 2d |
| `RESIDUAL.md` | Systems join: compose emit **done** 2026-08-03; living tip Mult..Graph + compose |
| `WATCHER.md` | Next: `/implement` Optional llvm-as smoke (Track 2e); context compose emit done |
| `doc/SESSION-HANDOFF.md` | Compose emit **done**; primary next Optional llvm-as smoke |
| `src/systems/self-host.md` | llvm unlock row + SH6: compose emit done Track 2d; next 2e |

### 6. Plan Track 2d
| Path | Evidence |
|------|----------|
| `.agents/plans/plan-north-star-remaining.md` | Row 2d Name/Goal/Done when matches landed surface (Lean write + out/llvm-ir + dual greps + lake; out of scope production opt). Residual program Open advanced past 2d; plan table is program spec (not a status column). Preconditions prose still says `llvmUnlocked` false (stale vs living tip). |

### 7. Implement Done when
| Criterion | Status |
|-----------|--------|
| Lean write path + out/llvm-ir artifact(s) | Met |
| Dual greps | Met (compose-text.nix + just) |
| Lake green when claim logic changes | Path present (recipe requires lake); not re-run this verify pass |
| llvmUnlocked stays true | Met (living SSoT true; local compose unlock false) |
| free/complete/PROVABLY/product Lake/host residual unchanged | Met per residual/self-host tip |
| Not production opt pipeline | Met (explicit non-claims) |

## Remaining bullets
None for Track 2d product Done when.

**Cosmetic only (not blocking COMPLETE):**
- `out/llvm-ir/MEASURED-STUB.txt` body still Mult/Linear-only; compose documented on `slake_compose.ll` + README
- Plan Track 2 preconditions still list `llvmUnlocked` false (living tip supersedes)

**Primary next residual (already Open):** Optional llvm-as smoke (Track 2e)
