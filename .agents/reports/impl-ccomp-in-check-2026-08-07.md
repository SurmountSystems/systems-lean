# Implement: ccomp product matrix in `just check` / CI

**Date:** 2026-08-07
**Repo:** `/home/hunter/Projects/ai/iso`
**Plan source:** operator-approved plan review (fold CompCert product matrix into full suite)

---

## Files changed

| Path | Change |
|------|--------|
| `justfile` | `check` body runs `just product-compcert-matrix` after `systems-cc-probe`; header comments mention CompCert matrix + FRESH skip for freestanding-under-ccomp |
| `just/compcert.just` | `freestanding-under-ccomp`: if `SYSTEMS_PRODUCT_WIRE_FRESH=1` and wire exists, skip `just build`; FRESH=1 + missing wire fails closed; else keep `just build` |
| `.github/workflows/ci.yml` | Comments that suite includes product-compcert-matrix; step `env: NIXPKGS_ALLOW_UNFREE: "1"` |
| `just/README.md` | One line: full suite includes `product-compcert-matrix` after `systems-cc-probe` |
| `WATCHER.md` | DONE-FOR-NOW notes gate surface (ccomp in check/CI); report path |
| `RESIDUAL-systems.md` | Next product work + Focus one-liners; Done archive row "ccomp in just check / CI" |
| `doc/SESSION-HANDOFF.md` | Product path decision + Next product work one line on matrix in check/CI |

No Lean pins flipped. No new Open Name. Product free / FullHost untouched.

---

## Check plug-in order

```text
check: build hygiene systems-host systems-emit-wire systems-llvm-ir idris-side lean-side
  bash body:
    SYSTEMS_PRODUCT_WIRE_FRESH=1
    nix flake check          # non-fatal for elaborator path; suite still exits flake_rc
    just idris-elaborate
    just lean-elaborate
    just systems-lake
    just systems-cc-probe
    just product-compcert-matrix   # NEW: fail-closed ccomp smoke + freestanding + Mult
    exit flake_rc if non-zero
```

`product-compcert-matrix` rows:

1. `ccomp-smoke` (resolve + `ccomp -version`)
2. `freestanding-under-ccomp` (fresh wire skip when FRESH=1)
3. `mult-package-under-ccomp`

---

## Verify commands + exit codes

| Command | Exit |
|---------|------|
| `just --show check` | 0 (shows `just product-compcert-matrix` after `systems-cc-probe`) |
| `just ccomp-resolve` | **0** -- `/nix/store/.../coq9.0-compcert-3.17/bin/ccomp` |
| `SYSTEMS_PRODUCT_WIRE_FRESH=1 just freestanding-under-ccomp` | **0** -- skip regenerate; object `/tmp/slake_freestanding_under_ccomp.o` (15720 bytes) |
| `SYSTEMS_PRODUCT_WIRE_FRESH=1 just product-compcert-matrix` | **0** -- smoke + freestanding + Mult GREEN |
| `just hygiene` | **0** -- source-hygiene + professional-tone OK |

Full end-to-end `just check` not re-run (long suite); wiring + matrix under FRESH verified.

---

## CI note

- Single job still `nix develop . --command just check`.
- Folding into `just check` folds into CI; no second CompCert job.
- Step env `NIXPKGS_ALLOW_UNFREE=1` belt-and-suspenders for flake-locked `nixpkgs.compcert`; recipe already sets it on its nix build.

---

## Residual lockstep paths

- `WATCHER.md` fenced DONE-FOR-NOW + gate surface line
- `RESIDUAL-systems.md` living tip Next/Focus + Done archive row
- `doc/SESSION-HANDOFF.md` check composition + Next product work
- Open empty; no free forge

---

## Out of scope (held)

- Pure Nix ccomp gate
- Flake devShell packaging of compcert
- Hand-editing product C
- git commit
