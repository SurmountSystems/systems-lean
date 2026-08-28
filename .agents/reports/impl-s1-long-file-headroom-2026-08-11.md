# S1 Near-bar long-file headroom -- close residual (2026-08-11)

Kind: implement closeout. Product role companions already on disk; this slice
verified line counts, gates, residual lockstep, and reports only. No invent
splits. No claim-bool flips. No git.

## Done when checklist

| Item | Result |
|------|--------|
| Tips under 1000 (`wc -l`) | **GREEN** (all listed under 1000; preferred headroom under ~900 on thinned tips) |
| `just hygiene` | **GREEN** (after professional-tone scrub of banned long-file-split slang in living residual) |
| `just systems-host` | **GREEN** (298 required paths; companions already dual-pinned) |
| S1 marked **done** in Open | **yes** (`RESIDUAL-systems.md`; S2-S8 remain open) |
| Done archive row | **yes** |
| WATCHER next S2 | **yes** |
| RESIDUAL.md + SESSION-HANDOFF lockstep | **yes** |
| Reports | this file + `/tmp/grok-1000/grok-impl-summary-s0s10-s1.md` |

## Line counts (`wc -l`, verified this closeout)

| Path | Lines | Note |
|------|------:|------|
| `HostImportGraphWalk.lean` | 589 | already under bar; no invent split |
| `HostFront.lean` | 850 | already under bar |
| `SelfApplyFs.lean` | 710 | already under bar |
| `HostModuleCheckFixtureTexts.lean` | 641 | thinned tip |
| `HostModuleCheckFixtureTextsEmit.lean` | 385 | role companion |
| `HostModuleCheckFixtureTextsLater.lean` | 451 | prior companion |
| `HostModuleCheckFixtureTextsProduct.lean` | 972 | prior companion (under 1000) |
| `HostModuleCheckFixtureTextsSelfHost.lean` | 611 | prior companion |
| `HostImportGraphLoadOk.lean` | 498 | thinned tip |
| `HostImportGraphLoadOkLater.lean` | 526 | role companion |
| `HostModuleCheckAcceptsGoods.lean` | 661 | thinned tip (closeout re-wc) |
| `HostModuleCheckAcceptsGoodsTerm.lean` | 371 | role companion |
| `HostResidualShrink.lean` | 839 | thinned tip |
| `HostResidualShrinkTermOk.lean` | 186 | role companion (closeout re-wc) |

All four S1 thin tips under 950. Walk/Front/SelfApplyFs still under 1000 with
headroom; no invent role modules for those three.

## Product evidence already on disk (not re-authored this slice)

Four role companions landed before closeout residual:

1. `SystemsLean.HostModuleCheckFixtureTextsEmit`
2. `SystemsLean.HostImportGraphLoadOkLater`
3. `SystemsLean.HostModuleCheckAcceptsGoodsTerm`
4. `SystemsLean.HostResidualShrinkTermOk`

Harness: S1 carve-out **+4** role companions (pre-S1 living tip harness **78**/U2 path;
S1 land **83**). Concurrent product work during closeout also listed
`HostModuleCheckCompilePathTerm` + `HostModuleCheckJoinMapTerm` on disk, so living
product tip is `seed=206+Main=59+harness=85` in `HostResidualShrink.lean` / pure Nix.
S2/S3 residual Names stay **open** until their Done when is verified. TERM dual-ok
remains **32** for residual floor (not forged higher).

Presence dual-pin already includes S1 companion paths under
`nix/systems-host-presence/{required-files,host-leans,host-specs-compile-path-3}.nix`.

## Claim pins (unchanged free/complete/PROVABLY/FullHost)

| Pin | Value |
|-----|-------|
| free / complete / PROVABLY | **true** |
| FullHostElaborateRemains | **false** |
| DominanceClaimed | **false** |
| band FullBackend | **false** |
| seed | **206** |
| harness (S1 carve-out) | **83** (+4 companions) |
| harness (living product tip at closeout) | **85** (includes CompilePathTerm+JoinMapTerm on disk) |
| TERM dual-ok | **32** |
| package-env | Mult..ParityEmit+U2 |

## Gates run this closeout

```text
just hygiene          # exit 0 after professional-tone scrub
just systems-host     # exit 0; 300 required paths
wc -l on listed tips  # all under 1000
```

Optional lake / without-lake host-module-check not re-run for residual-only
closeout (product companions already dual-pinned; systems-host presence green).
Re-run if S2 edits those modules.

## Residual lockstep

- `RESIDUAL-systems.md`: S1 Status **done**; Living Open **S2-S8**; Done archive row S1
- `RESIDUAL.md` Systems Open: S1 **done**; next **S2**; harness **83**
- `doc/SESSION-HANDOFF.md`: Active open S2-S8; S1 done; harness **83**
- `WATCHER.md`: next `/implement` **S2** TERM CompilePath

## Out of scope (held)

- Claim-bool flips; invent TERM; seed-wide H2; FullHost true
- Product C / shell growth
- Invent splits for tips already under ~900
- S2-S8 implement in this slice

## Next

**S2** TERM CompilePath (`HostModuleCheckCompilePathTerm`; dual-ok **33** target).
