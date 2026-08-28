# Inventory: lockstep + Nix for SystemsLean.Erasure (5 of about 206)

Read-only. Do not implement. Erasure imports only Mult (`src/systems/SystemsLean/Erasure.lean` line 55). Name 131 prefers that module.

## Residual / living docs (exact paragraphs to edit)

Living metric today: **4 of about 206** (Mult, MultTheorems, Types, TypesTheorems). After Erasure: **5 of about 206**. Do **not** treat leftover both-lessons **88 of 206** / **72 of 206** as the typecheck metric. Those leftover-walk counts stay closed; do not increment them.

### 1. `/home/hunter/Projects/ai/iso/RESIDUAL-systems.md`

**Name 131 table row (line 556):**

```
| 131 | Grow the named closed subset | **open** | add the next import-closed live module (prefer SystemsLean.Erasure, which imports only Mult) or the next Mult-adjacent unit; still not whole-package typecheck; still not slakeOwnsPackageTypecheck |
```

**Open Name block (lines 558-567), especially Status:**

```
| **Name** | Grow the named closed subset |
| **Goal** | Add the next import-closed live module to the named ElabMeet subset toward the develop seed. Prefer SystemsLean.Erasure, which imports only Mult, or the next Mult-adjacent unit. |
| **Done when** | ... Metric becomes **5 of about 206** if Erasure lands ...
| **Status** | **open**. TypesTheorems landed. Current named subset is Mult + MultTheorems + Types + TypesTheorems (**4 of about 206**). IrProgram imports only Types so it would close, but it is not Mult-adjacent; skip it the same way as Linear. Erasure is the next Mult-adjacent import-closed live module. ...
```

**Remaining-work table (lines 569-574):**

```
| Real modules Slake typechecks | **4 of about 206** (SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types, SystemsLean.TypesTheorems) |
```

**Open queue prose (line 325):** "Grow TypesTheorems is **done**. Highest-value next is **Grow the named closed subset** (open). TypesTheorems landed. Named closed subset is **4 of about 206** ..."

**Leftover kitchen-sink (do not bump as the typecheck metric):**

- Line 313 living leftover close: `both-lessons **88 of 206**`; leftover remaining **118**
- Line 360 land-time snapshot: `both-lessons **72 of 206** at that land` (MultFsWriteTool PE78)
- Done archive rows 95-126 copy `88 of 206 both-lessons`; rows 62-63 copy `72 of 206`

**Name 130 done closeout (lines 1973-1982)** is the TypesTheorems template. Archive 131 similarly; do not rewrite 130.

### 2. `/home/hunter/Projects/ai/iso/RESIDUAL.md`

**Systems Open (lines 62-69):** "Grow TypesTheorems is **done**. Highest-value next is **Grow the named closed subset** (open). ... **4 of about 206** ..." plus the remaining-work table at line 66.

**Name 131 row (line 476):** same open text as residual-systems.

**Highest value next (line 1251):** "Named closed subset is **4 of about 206** ..."

**Kitchen-sink:** line 95 / 440-471 `88 of 206`; line 107 / 407-408 `72 of 206`.

### 3. `/home/hunter/Projects/ai/iso/WATCHER.md`

`WATCHER_BEGIN` (line 6) through `WATCHER_END` (line 24). Edit Done when metric, Honesty "TypesTheorems landed", and the table row at line 20 (`**4 of about 206**`). After close, write the next grow Name or the next checkable plan step.

### 4. `/home/hunter/Projects/ai/iso/doc/SESSION-HANDOFF.md`

**Living tip (lines 87-106):** "Named closed subset is Mult, MultTheorems, Types, and TypesTheorems. Metric: **4 of about 206** ... Next: Grow the named closed subset again (prefer SystemsLean.Erasure ..."

**Table line 110:** same 4-of-206 row.

### 5. `/home/hunter/Projects/ai/iso/.agents/plans/plan-slake-replaces-lake.md`

**Living tip (lines 16-28):** "ElabMeet grow Step 5 (TypesTheorems) is **done**. Named closed subset is **4 of about 206** (Mult, MultTheorems, Types, and TypesTheorems). Next is **Grow the named closed subset** again (prefer SystemsLean.Erasure ..."

**Table line 32:** same 4-of-206 row.

### 6. `/home/hunter/Projects/ai/iso/AGENTS.md`

**Progress every turn (lines 335-348):** "how many real modules Slake typechecks (today **4 of about 206**, SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types, and SystemsLean.TypesTheorems on the Slake path; next remaining work is grow that named closed subset)"

## Nix tokens (mirror an Erasure block)

Gate file: `/home/hunter/Projects/ai/iso/nix/systems-host-presence/host-specs-hold-close.nix`.

### ElabMeetSubset spec (lines 1689-1731)

Copy these TypesTheorems strings and mint Erasure twins:

| Token |
|-------|
| `findLiveTypesTheoremsPath` |
| `namedClosedTypesTheoremsSubsetNames` |
| `barrelListsNamedTypesTheoremsSubset` |
| `tryCompileNamedTypesTheoremsSubset` |
| `tryCompileAfterTypesTheoremsDeps` |
| `elabMeetDrivesNamedTypesTheoremsSubset` |
| `elabMeetAcceptsGoodNamedTypesTheoremsSubset` |
| `elabMeetRejectsBadNamedTypesTheoremsSubset` |
| `elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset` |
| `elabMeetNamedTypesTheoremsSubsetProbe` |
| `SystemsLean.TypesTheorems` |

Suggested Erasure twins: `findLiveErasurePath`, `namedClosedErasureSubsetNames`, `barrelListsNamedErasureSubset`, `tryCompileNamedErasureSubset`, `tryCompileAfterErasureDeps`, `elabMeetDrivesNamedErasureSubset`, `elabMeetAcceptsGoodNamedErasureSubset`, `elabMeetRejectsBadNamedErasureSubset`, `elabMeetRejectsOldWalkAsNamedErasureSubset`, `elabMeetNamedErasureSubsetProbe`, `SystemsLean.Erasure`.

Keep shared tokens: `namedClosedSubsetNames`, `elabMeetDrivesNamedSubset`, `slakeOwnsPackageTypecheck stays false`, `Not FullHostElaborateRemains true`.

### ElabMeetTheorems spec (lines 1786-1789)

```
"theorem elabMeetDrivesNamedTypesTheoremsSubset_true"
"theorem elabMeetAcceptsGoodNamedTypesTheoremsSubset_true"
"theorem elabMeetRejectsBadNamedTypesTheoremsSubset_true"
"theorem elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset_true"
```

### ElabMeet.lean spec (lines 821-1120)

Does **not** list TypesTheorems subset names. Required honesty strings stay:

```
"slakeOwnsPackageTypecheck"
"elabMeetFullHostElaborateRemains"
"def slakeOwnsPackageTypecheck : Bool := false"
"def elabMeetFullHostElaborateRemains : Bool := false"
"Not FullHostElaborateRemains true"
```

Fold `elabMeetReady` in `ElabMeet.lean` lines 586-589 already AND-s the TypesTheorems drive Bools. Add the Erasure drive Bool the same way. Do not grow `ElabMeetCompile.lean` (916).

### just recipes

`just/host.just` TypesTheorems tokens are **not** the ElabMeet named subset. Do not edit them for Name 131:

- Line 75 / 177: host-library seed string `...+Types+TypesTheorems+...+Erasure+ErasureTheorems+...`
- Line 197: `TypesTheorems=14` theorem-corpus count
- Lines 659-663: `TypesTheorems-only` HOST-MODULE-CHECK proof-surface

`host-specs-compile-path-3.nix` and `host-specs-core-1.nix` TypesTheorems entries are seed / long-file-split presence, not ElabMeet.

## Previous TypesTheorems closeout

No `.agents/reports/` file matches types-theorems / grow-named. Closeout is residual Name 130 (systems lines 555 and 1973-1982).

### Probe Bools (ElabMeetSubset, recorded by `#elabMeetNamedTypesTheoremsSubsetProbe` at line 660)

- `elabMeetAcceptsGoodNamedTypesTheoremsSubset`
- `elabMeetRejectsBadNamedTypesTheoremsSubset`
- `elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset`
- `elabMeetDrivesNamedTypesTheoremsSubset`

### Theorems (ElabMeetTheorems lines 362-380)

- `elabMeetDrivesNamedTypesTheoremsSubset_true`
- `elabMeetAcceptsGoodNamedTypesTheoremsSubset_true`
- `elabMeetRejectsBadNamedTypesTheoremsSubset_true`
- `elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset_true`

### Name-list vs compile order (repeat this for Erasure)

Name list (`namedClosedTypesTheoremsSubsetNames`, lines 377-382): Mult, MultTheorems, Types, TypesTheorems.

Compile order (`tryCompileNamedTypesTheoremsSubsetIO`, lines 407-408 and 446-465): Mult first, push search path, then Types, then MultTheorems, then TypesTheorems. TypesTheorems imports all three, so the planted sidecar uses `tryCompileAfterTypesTheoremsDeps` (Mult, Types, MultTheorems oleans, then the bad copy). Isolation keeps the prior three-module walker true.

Erasure imports only Mult, so compile Mult first, then Erasure. Do not require Types or TypesTheorems on the Erasure walker. Isolation should keep the four-module TypesTheorems walk true. Do not add Linear or IrProgram.

ElabMeetSubset is **667** (under ~880). Extract first if the Erasure block would pass that.

## Pins stay false

| Pin | File | Def |
|-----|------|-----|
| `slakeOwnsPackageTypecheck` | `src/systems/SystemsLean/ElabMeet.lean` | line 385 `def slakeOwnsPackageTypecheck : Bool := false` |
| `elabMeetFullHostElaborateRemains` | same | line 389 `def elabMeetFullHostElaborateRemains : Bool := false` |
| FullHostElaborateRemains (living tip) | `src/systems/SystemsLean/HostResidualShrink.lean` | line 227 `def hostResidualShrinkFullHostElaborateRemains : Bool := false` (greppable `FullHostElaborateRemains false`; no bare `def FullHostElaborateRemains`) |
| DominanceClaimed (living tip) | `src/systems/SystemsLean/LlvmCfgHonesty.lean` | line 86 `def llvmCfgFixtureDominanceClaimed : Bool := false` |
| Band FullBackend | `src/systems/SystemsLean/LlvmMultSsa.lean` (and Linear/Types/Program/Graph/Compose twins) | line 142 `def llvmMultSsaFullBackendClaimed : Bool := false` |

Fixture tip `llvmCfgFixtureFullBackendClaimed` is **true** (Honesty line 77). That is not the band pin. Do not flip it.

## Product files to touch (not residual)

`ElabMeetSubset.lean` (probe + names + compile); `ElabMeet.lean` fold only; `ElabMeetTheorems.lean` theorems; `host-specs-hold-close.nix` token lists. Gates: `lake build SystemsLean.ElabMeet` (+ helpers); `just hygiene`; `just systems-host`.
