# SelfApplyFs dual-pin thin batch 7 inventory (B8 ProductPathOwnershipInputs)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b7.md` (ephemeral)

## Family

**B8 ProductPathOwnershipInputs** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathOwnershipInputs`. Living claim SSoT
(`productPathFreestandingOwnershipClaimed := true`) and thin chain fold stay on
`SelfApplyFs`. B4 tip `productPathHostLakeBootstrapRemains := true` left untouched.
OwnershipClaimed living claim family (B40 stage/recipe/measured) not moved.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathFreestandingOwnershipClaimed : Bool := true` | Living ownership claimed SSoT (critical claim guard) |
| `theorem productPathFreestandingOwnershipClaimed_true` | host-presence tip + claim honesty |
| `def productPathOwnershipInputsPartialReady` | Chain fold: exec && home PartialReady && remains && ownership claimed |
| `theorem productPathOwnershipInputsPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productPathOwnershipInputsPartialReady = true` | host-presence tip |
| `example : productPathFreestandingOwnershipClaimed = true` | host-presence tip |
| complete + remains + exec re-smokes in B8 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathOwnershipInputs` / string `ProductPathOwnershipInputs` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-OWNERSHIP`, `product path ownership inputs` | fold doc / host-presence tip |
| B9+ `productPathOwnershipInputsPartialReady` chain uses | later family folds (untouched) |
| B40 OwnershipClaimed family dual-pins | separate family; not this batch |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathOwnershipStageId` | `ProductPathOwnershipInputs.stageId` |
| `hostProductPathOwnershipId` | `ProductPathOwnershipInputs.hostId` |
| `selfHostProductPathOwnershipId` | `ProductPathOwnershipInputs.selfHostId` |
| `productPathOwnershipInputsModuleCite` | `ProductPathOwnershipInputs.ownershipInputsModuleCite` (name differs; home string value same) |
| `productPathOwnershipSsotMult` .. `SsotBody` (11 SSOT path defs) | same names on home |
| `productPathOwnershipEmitH` / `EmitC` | same names on home |
| `productPathOwnershipDualSsotCite` | same name on home |
| `productPathOwnershipInputsOk` tip alias | home Bool bulk (`productPathOwnershipInputsOk`) |
| 10 B8 stage/path/ok examples (kept partialReady + ownership claimed + complete + remains + exec) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathOwnershipInputsPartialReady` | chain fold (B7 && home && remains && ownership claimed) | Ok Mult..Out bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `SELF-HOST-PRODUCT-PATH-OWNERSHIP` | fold comments | hostId / surface |
| `productPathFreestandingOwnershipClaimed` | living SSoT true | **forbidden** true def on home |

### Not touched

- justfile: no B8 tip-only stage/path recipe pins requiring tip stage strings
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B4 tip living pins
- OwnershipClaimed (B40) dual-pin block
- PartialReady bulk body (already home from batch 27)
- B9+ dual-pin thin, short-name track

## Gate-first edits (batch 7)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/moduleCite/path/ssot strings; keep partialReady + ownership claimed true + ProductPathOwnershipInputs + remains + exec chain |
| `nix/systems-emit-wire/emit-product.nix` | Home + ownershipInputsModuleCite + productPathOwnershipSsot*/Emit*/DualSsot/OutPath |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B8 list shrink to fold/claim/theorem/example; home ProductPathOwnershipInputs expanded |
| `SelfApplyFs.lean` | Delete B8 historical defs + stage/path/ok examples; thin B8 section + header inventory |
| `ProductPathOwnershipInputs.lean` | Header note dual-pin thin batch 7 (no new living claim true defs) |

## Line counts (batch 7)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5415 | 5361 | -54 |
| ProductPathOwnershipInputs.lean | 139 | 141 | +2 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true (living tip SSoT kept)
- productPathFreestandingPerformClaimed true
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- DependsOnLake may stay true (unchanged)
- ProductPathOwnershipInputs: no living-tip complete/perform/ownership true defs
- productPathHostLakeBootstrapRemains := true still on tip (B4)

## Lessons

1. B8 tip fold already used `ProductPathOwnershipInputs.productPathOwnershipInputsPartialReady` plus bare tip remains + ownership claimed; tip Ok alias was dual-pin theater.
2. Home moduleCite name is `ownershipInputsModuleCite` (not tip's old `productPathOwnershipInputsModuleCite`); gate home tokens use home name.
3. Home already had stage/ssot/emit defs from batch 27; slice is gate list migration + tip delete.
4. Critical: do not move `productPathFreestandingOwnershipClaimed := true` off tip; emit-wire forbids that true def on home.
5. Next family: B9 ProductPathPerform (plan section 8).
