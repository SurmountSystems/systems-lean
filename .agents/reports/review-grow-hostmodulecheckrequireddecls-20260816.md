# Review: Grow HostModuleCheckRequiredDecls (Name 154)

APPROVE WITH NITS

Independent L3 review. Did not re-run implementer lake. Did not edit
product, residual Open, WATCHER, or pins. Did not start Product.

## Blockers

None.

## Nits

1. `AGENTS.md` progress-metric paragraph still says **13 of about 206**
   and names Grow HostFrontTheorems as next remaining work. Living
   residual, WATCHER, and SESSION-HANDOFF already say **28 of about 206**
   and next Grow HostModuleCheckRequiredDeclsProduct. This review does
   not require an `AGENTS.md` tip update.

## May Grow HostModuleCheckRequiredDeclsProduct start

yes

This slice closed GREEN at 28 of about 206. Open Name 155 is already
Grow HostModuleCheckRequiredDeclsProduct (barrel import 121). The
twenty-ninth Product probe is not on disk. This review does not start
that Name.

## Check evidence

### 1. Four twenty-eighth Bools and native_decide theorems -- pass

Bools are defined by `#elabMeetNamedHostModuleCheckRequiredDeclsSubsetProbe`
in `src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean`
(lines 200-207):

```
let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsSubset
let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsSubset
let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsSubset
let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckRequiredDeclsSubset
```

Theorems in `src/systems/SystemsLean/ElabMeetTheorems.lean` lines 880-898
use the same names with `_true` and `native_decide`. They were not
rewritten after the reported red (same expected type
`elabMeet...Subset = true`).

### 2. Drive is good && !bad && isolation -- pass

Probe header and command body state the drive formula. Lines 195-199:

```
if good && !badCompiled && isolation then
  `(true)
```

Isolation option is `#elabMeetNamedHostModuleCheckRequiredDeclsSubsetProbe`
(probe lines 60, 104, 209). Isolation fold (lines 164-167) is live Mult
and theorems still ok, prior twenty-seven walker
`tryCompileNamedHostImportGraphWalkSubset` still ok, leftover temp
`good.lean` false, leftover fake `lean_lib ElabMeetRichLib` false, and
not an alias of the twenty-seventh walk.

### 3. New probe, wrappers on WalkLater, caps held -- pass

`wc -l` on disk:

| Lines | Path |
|------:|------|
| 216 | `src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean` |
| 470 | `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean` |
| 693 | `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` |
| 865 | `src/systems/SystemsLean/ElabMeetSubset.lean` |
| 916 | `src/systems/SystemsLean/ElabMeetCompile.lean` |

Wrappers live on WalkLater (`namedClosedHostModuleCheckRequiredDeclsSubsetNames`,
`tryCompileNamedHostModuleCheckRequiredDeclsSubset`, after-deps). Compile
and Subset were not grown. Seeds stay 693.

### 4. Live barrels are not ElabMeet wrapper plants -- pass

`src/systems/SystemsLean/HostModuleCheckRequiredDecls.lean` (667 lines)
is `namespace SystemsLean.HostModuleCheck`, header SYSTEMS_LEAN_HOST /
HOST-MODULE-CHECK. No `elabMeet`, `wrapper`, or `ElabMeetNamed` matches.

`src/systems/SystemsLean/HostImportGraphWalk.lean` (589 lines) is
`namespace SystemsLean.HostImportGraph`, header HOST-IMPORT-GRAPH. No
`elabMeet`, `wrapper`, or `ElabMeetNamed` matches.

### 5. Residual Open is Product; still 28 of about 206 -- pass

`RESIDUAL-systems.md` Name 154 is **done**. Name 155
**Grow HostModuleCheckRequiredDeclsProduct subset** is **open**
(barrel import 121; no imports; import-closed on the 28). Join board
`RESIDUAL.md` row 155 is **open**. Metric tables in residual, WATCHER,
and `doc/SESSION-HANDOFF.md` still say **28 of about 206**. Product
probe `ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean` does
not exist.

### 6. Pins still false -- pass

On-disk Lean defs:

- `slakeOwnsPackageTypecheck : Bool := false` (`ElabMeet.lean:440`)
- `elabMeetFullHostElaborateRemains : Bool := false` (`ElabMeet.lean:444`)
- `hostResidualShrinkFullHostElaborateRemains : Bool := false`
  (`HostResidualShrink.lean:227`)
- `llvmCfgFixtureDominanceClaimed : Bool := false`
  (`LlvmCfgHonesty.lean:86`)
- `llvmMultSsaFullBackendClaimed : Bool := false`
  (`LlvmMultSsa.lean:142`)

ElabMeet still proves `slakeOwnsPackageTypecheck_false` and
`elabMeetFullHostElaborateRemains_false` by `native_decide`.

### 7. TDD red then same theorems green -- pass

Implementer report (`impl-grow-hostmodulecheckrequireddecls-20260816.md`)
logged `lake build SystemsLean.ElabMeetTheorems` exit 1 with free-variable
errors on the four `_true` theorems before the Bools existed. Same
theorem names and `= true := by native_decide` remain on disk. Mop
re-ran the four lake targets at exit 0 (incremental cache). This review
did not re-run lake. Theorems were not rewritten to finish green.

### 8. No banned leftover module-split slang in living prose -- pass

No banned module-split slang tokens in living Open/next
(`RESIDUAL-systems.md` Name 155), `WATCHER.md` fence, or
`doc/SESSION-HANDOFF.md` living tip. Mop already reported
`just professional-tone` exit 0.

### 9. Forbidden HostImportGraph Names were not opened -- pass

The only open Grow Name is Grow HostModuleCheckRequiredDeclsProduct.
There is no open **Grow HostImportGraph**, **Grow HostImportGraphLoadOk**,
**Grow HostImportGraphTheorems**, or **Grow HostImportGraphDriver**.
WATCHER Out of scope and handoff living tip repeat those holds.

## TDD / mop

Implementer observed red, then extract-first, then green. Mop report is
GREEN: hygiene, professional-tone, systems-host, and the four named
lake targets exit 0. Line counts match. This review trusts those
commands because disk matches the reports.

## Issues

### Issue 1 -- Severity: nit

- File: `AGENTS.md:341`
- Description: Progress-metric paragraph still lists 13 of about 206
  and Grow HostFrontTheorems as next remaining work. Living residual
  already lists 28 of about 206.
- Suggestion: Optional later tip refresh. Not required to close this
  review or to start Product.
- Status: open

## Counts

- Blocker count: 0
- Nit count: 1
- Verdict: APPROVE WITH NITS
- May Grow HostModuleCheckRequiredDeclsProduct start: yes

Do not invent extra residual Names. Do not start Product from this
review.
