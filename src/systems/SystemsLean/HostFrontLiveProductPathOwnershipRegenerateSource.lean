/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  ProductPathOwnershipRegenerate.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathOwnershipRegenerateSource.
  Not occupancy name 50. Not mill 70.
  This wrap is ProductPathOwnershipRegenerate.lean.
  It is not ProductPathOwnershipRegenerateTheorems.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveProductPathOwnershipRegenerateSource,
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE, liveRel,
  PRODUCT-PATH-OWNERSHIP-REGENERATE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipRegenerateSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProductPathOwnershipRegenerate

/-- Dual-pinned live ProductPathOwnershipRegenerate.lean bytes
    (must match on-disk file).
    Greppable: liveProductPathOwnershipRegenerateSource,
    HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
def liveProductPathOwnershipRegenerateSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- product path ownership regenerate substrate (B22..B30).
  SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0 -- ordered ownership
  regenerate path pieces under ownership framing (beyond B21 Full-bar measure).
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).

  Path pieces (Lake-free just recipes; no lake build/exe on these paths):
  - B22 INSTALL: ownership-regenerate-install-only -> install-freestanding-c-out
  - B23 READ: ownership-regenerate-read-only (dual SSOT presence+token)
  - B24 COMPOSE: ownership-regenerate-compose-only (plan/apply/body)
  - B25 WRITE-HC: ownership-regenerate-write-hc-only (freestanding .h/.c)
  - B29 JOIN: ownership-regenerate-lake-free (Capable* lake-free + path pieces +
    install; process-glue measure, not authority)
  - B30 AUTHORITY: ownership-regenerate-product-path-authority (freestanding-capable
    AuthorityNotEmit + Capable* lake-free + install is product path authority;
    FreestandingEmit is not). WithoutLake true with FullBar dual-pin.

  Dual-pin thin batch 21: home-primary Ok / stageId / hostId / recipe / exe /
  OWNERSHIP-REGENERATE-* step ids; SelfApplyFs tip keeps honesty bools +
  PartialReady chain fold only. DependsOnLake true (measure Lake exe + perform
  residual). Full step-contract land-time pin false here. Not perform claimed;
  not ownership claimed on this module. Not freestanding emit residual free.
  Not residual free. Not PROVABLY.

  Theorems (OWNERSHIP-REGENERATE-THEOREM / HOST-OWNERSHIP-REGENERATE-THEOREM +
  OWNERSHIP-REGENERATE-SMOKE / HOST-OWNERSHIP-REGENERATE-SMOKE): live in
  SystemsLean.ProductPathOwnershipRegenerateTheorems (same namespace; long-file
  peel). productPathOwnershipRegeneratePartialReady_true /
  productPathOwnershipRegenerateOk_true / stageId_eq / hostId_eq / selfHostId_eq
  + Lake-free bool / recipe / exe surface pins. Do not flip residual free /
  llvm / PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0,
  HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE,
  SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE,
  product path ownership regenerate,
  productPathOwnershipRegeneratePartialReady,
  productPathOwnershipRegenerateOk,
  productPathOwnershipRegenerateInstallLakeFree,
  productPathOwnershipRegenerateReadLakeFree,
  productPathOwnershipRegenerateComposeLakeFree,
  productPathOwnershipRegenerateWriteHcLakeFree,
  productPathOwnershipRegenerateLakeFreeJoinClaimed,
  productPathOwnershipRegenerateProductPathAuthorityClaimed,
  productPathOwnershipRegenerateWithoutLake,
  productPathOwnershipRegenerateDependsOnLake,
  productPathOwnershipRegenerateInstallPathClaimed,
  productPathOwnershipRegenerateReadPathClaimed,
  productPathOwnershipRegenerateComposePathClaimed,
  productPathOwnershipRegenerateWriteHcPathClaimed,
  OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE,
  OWNERSHIP-REGENERATE-READ-LAKE-FREE,
  OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE,
  OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE,
  OWNERSHIP-REGENERATE-LAKE-FREE-JOIN,
  OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY,
  OWNERSHIP-REGENERATE-THEOREM, HOST-OWNERSHIP-REGENERATE-THEOREM,
  OWNERSHIP-REGENERATE-SMOKE, HOST-OWNERSHIP-REGENERATE-SMOKE,
  theorem productPathOwnershipRegeneratePartialReady_true,
  theorem productPathOwnershipRegenerateOk_true,
  productPathOwnershipRegeneratePartialReady_true,
  productPathOwnershipRegenerateOk_true,
  ProductPathOwnershipRegenerateTheorems,
  BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
  FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE,
  ownership-regenerate, ownership-regenerate-install-only,
  ownership-regenerate-read-only, ownership-regenerate-compose-only,
  ownership-regenerate-write-hc-only, ownership-regenerate-lake-free,
  ownership-regenerate-product-path-authority,
  freestanding-capable-read-lake-free, freestanding-capable-compose-lake-free,
  freestanding-capable-write-hc-lake-free,
  FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE,
  slake-ownership-regenerate, install-freestanding-c-out,
  ProductPathOwnershipRegenerate, ProductPathComposePlan.planApplyBodySpecs,
  ProductPathWriteHc, slake_freestanding.h, slake_freestanding.c,
  RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.ProductPathOwnershipRegenerate
  Long-file peel: OWNERSHIP-REGENERATE-THEOREM + OWNERSHIP-REGENERATE-SMOKE in
  SystemsLean.ProductPathOwnershipRegenerateTheorems (same namespace).
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.ProductPathOwnershipRegenerate

/-- Greppable primary stage id (partial B22..B30 ownership regenerate substrate). -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"

/-- Install Lake-free (just ownership-regenerate-install-only).
    Greppable: productPathOwnershipRegenerateInstallLakeFree,
    OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE. -/
def productPathOwnershipRegenerateInstallLakeFree : Bool := true

/-- READ Lake-free (just ownership-regenerate-read-only; distinct from B14/B26
    freestanding-capable-read-lake-free). Greppable:
    productPathOwnershipRegenerateReadLakeFree, OWNERSHIP-REGENERATE-READ-LAKE-FREE. -/
def productPathOwnershipRegenerateReadLakeFree : Bool := true

/-- COMPOSE Lake-free (just ownership-regenerate-compose-only; distinct from
    B14/B27 freestanding-capable-compose-lake-free). Greppable:
    productPathOwnershipRegenerateComposeLakeFree,
    OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE. -/
def productPathOwnershipRegenerateComposeLakeFree : Bool := true

/-- WRITE-HC Lake-free (just ownership-regenerate-write-hc-only; distinct from
    B14/B28 freestanding-capable-write-hc-lake-free). Greppable:
    productPathOwnershipRegenerateWriteHcLakeFree,
    OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE. -/
def productPathOwnershipRegenerateWriteHcLakeFree : Bool := true

/-- B29 ordered Lake-free join claimed (process evidence; not authority alone).
    Greppable: productPathOwnershipRegenerateLakeFreeJoinClaimed,
    OWNERSHIP-REGENERATE-LAKE-FREE-JOIN. -/
def productPathOwnershipRegenerateLakeFreeJoinClaimed : Bool := true

/-- B30 freestanding product path authority claimed (not FreestandingEmit; not
    B29 join rebrand). Greppable:
    productPathOwnershipRegenerateProductPathAuthorityClaimed,
    OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY. -/
def productPathOwnershipRegenerateProductPathAuthorityClaimed : Bool := true

/-- WithoutLake closed after B30 + FullBar dual-pin. Greppable:
    productPathOwnershipRegenerateWithoutLake,
    FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE,
    BLOCKER-FREESTANDING-MUST-OWN-REGENERATE. -/
def productPathOwnershipRegenerateWithoutLake : Bool := true

/-- DependsOnLake remains (measure Lake exe + perform residual).
    Greppable: productPathOwnershipRegenerateDependsOnLake. -/
def productPathOwnershipRegenerateDependsOnLake : Bool := true

/-- Install path piece claimed. Greppable:
    productPathOwnershipRegenerateInstallPathClaimed. -/
def productPathOwnershipRegenerateInstallPathClaimed : Bool := true

/-- READ path piece claimed (B23). Greppable:
    productPathOwnershipRegenerateReadPathClaimed. -/
def productPathOwnershipRegenerateReadPathClaimed : Bool := true

/-- COMPOSE path piece claimed (B24). Greppable:
    productPathOwnershipRegenerateComposePathClaimed. -/
def productPathOwnershipRegenerateComposePathClaimed : Bool := true

/-- WRITE-HC path piece claimed (B25). Greppable:
    productPathOwnershipRegenerateWriteHcPathClaimed. -/
def productPathOwnershipRegenerateWriteHcPathClaimed : Bool := true

/-- Named tokens for ownership regenerate step status. -/
def ownershipRegenerateInstallLakeFreeId : String :=
  "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
def ownershipRegenerateReadLakeFreeId : String :=
  "OWNERSHIP-REGENERATE-READ-LAKE-FREE"
def ownershipRegenerateComposeLakeFreeId : String :=
  "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
def ownershipRegenerateWriteHcLakeFreeId : String :=
  "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
def ownershipRegenerateLakeFreeJoinId : String :=
  "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
def ownershipRegenerateProductPathAuthorityId : String :=
  "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"

/-- Cliff token (historical greppable; WithoutLake closed B30). -/
def blockerMustOwnRegenerate : String :=
  "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"

/-- Full-bar ownership regenerate requirement cite (closed after B30). -/
def fullBarReqOwnershipRegenerateWithoutLake : String :=
  "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"

/-- Lake-free install recipe. Greppable: ownership-regenerate-install-only. -/
def lakeFreeInstallRecipe : String := "ownership-regenerate-install-only"

/-- Lake-free READ recipe (B23). Greppable: ownership-regenerate-read-only. -/
def lakeFreeReadRecipe : String := "ownership-regenerate-read-only"

/-- Lake-free COMPOSE recipe (B24). Greppable: ownership-regenerate-compose-only. -/
def lakeFreeComposeRecipe : String := "ownership-regenerate-compose-only"

/-- Lake-free WRITE-HC recipe (B25). Greppable: ownership-regenerate-write-hc-only. -/
def lakeFreeWriteHcRecipe : String := "ownership-regenerate-write-hc-only"

/-- B29 join recipe. Greppable: ownership-regenerate-lake-free. -/
def lakeFreeJoinRecipe : String := "ownership-regenerate-lake-free"

/-- B30 authority recipe. Greppable: ownership-regenerate-product-path-authority. -/
def productPathAuthorityRecipe : String :=
  "ownership-regenerate-product-path-authority"

/-- Shared install body recipe (B10). Greppable: install-freestanding-c-out. -/
def sharedInstallRecipe : String := "install-freestanding-c-out"

/-- Diagnostic Lake exe / just measure recipe. -/
def lakeExeName : String := "slake-ownership-regenerate"
def justMeasureRecipe : String := "ownership-regenerate"

/-- Full freestanding-capable step-contract stays unsatisfied (honest land-time pin). -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- Ownership regenerate surface ok fold. Greppable:
    productPathOwnershipRegenerateOk. -/
def productPathOwnershipRegenerateOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE")
    && (productPathOwnershipRegenerateInstallLakeFree == true)
    && (productPathOwnershipRegenerateReadLakeFree == true)
    && (productPathOwnershipRegenerateComposeLakeFree == true)
    && (productPathOwnershipRegenerateWriteHcLakeFree == true)
    && (productPathOwnershipRegenerateLakeFreeJoinClaimed == true)
    && (productPathOwnershipRegenerateProductPathAuthorityClaimed == true)
    && (productPathOwnershipRegenerateWithoutLake == true)
    && (productPathOwnershipRegenerateDependsOnLake == true)
    && (productPathOwnershipRegenerateInstallPathClaimed == true)
    && (productPathOwnershipRegenerateReadPathClaimed == true)
    && (productPathOwnershipRegenerateComposePathClaimed == true)
    && (productPathOwnershipRegenerateWriteHcPathClaimed == true)
    && (productPathFreestandingCapableStepContractFullSatisfied == false)
    && (ownershipRegenerateInstallLakeFreeId
        == "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE")
    && (ownershipRegenerateReadLakeFreeId
        == "OWNERSHIP-REGENERATE-READ-LAKE-FREE")
    && (ownershipRegenerateComposeLakeFreeId
        == "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE")
    && (ownershipRegenerateWriteHcLakeFreeId
        == "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE")
    && (ownershipRegenerateLakeFreeJoinId
        == "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN")
    && (ownershipRegenerateProductPathAuthorityId
        == "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY")
    && (blockerMustOwnRegenerate == "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE")
    && (fullBarReqOwnershipRegenerateWithoutLake
        == "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE")
    && (lakeFreeInstallRecipe == "ownership-regenerate-install-only")
    && (lakeFreeReadRecipe == "ownership-regenerate-read-only")
    && (lakeFreeComposeRecipe == "ownership-regenerate-compose-only")
    && (lakeFreeWriteHcRecipe == "ownership-regenerate-write-hc-only")
    && (lakeFreeJoinRecipe == "ownership-regenerate-lake-free")
    && (productPathAuthorityRecipe
        == "ownership-regenerate-product-path-authority")
    && (sharedInstallRecipe == "install-freestanding-c-out")
    && (lakeExeName == "slake-ownership-regenerate")
    && (justMeasureRecipe == "ownership-regenerate")

/-- Print ownership regenerate substrate measure (diagnostic; not ownership claimed). -/
def printOwnershipRegenerateMeasure : IO Unit := do
  IO.println s!"== {stageId}: product path ownership regenerate substrate (B22..B30) =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println "  ownership regenerate step Lake-free status:"
  IO.println s!"    INSTALL-OUT: {productPathOwnershipRegenerateInstallLakeFree} ({ownershipRegenerateInstallLakeFreeId})"
  IO.println s!"      path: just {lakeFreeInstallRecipe} -> just {sharedInstallRecipe} (no lake)"
  IO.println s!"    READ-SSOT: {productPathOwnershipRegenerateReadLakeFree} ({ownershipRegenerateReadLakeFreeId})"
  IO.println s!"      path: just {lakeFreeReadRecipe} (dual SSOT presence+token; no lake)"
  IO.println s!"    COMPOSE: {productPathOwnershipRegenerateComposeLakeFree} ({ownershipRegenerateComposeLakeFreeId})"
  IO.println s!"      path: just {lakeFreeComposeRecipe} (plan/apply/body presence+token; no lake)"
  IO.println s!"    WRITE-HC: {productPathOwnershipRegenerateWriteHcLakeFree} ({ownershipRegenerateWriteHcLakeFreeId})"
  IO.println s!"      path: just {lakeFreeWriteHcRecipe} (freestanding .h/.c presence+token; no lake)"
  IO.println s!"    JOIN (B29): {productPathOwnershipRegenerateLakeFreeJoinClaimed} ({ownershipRegenerateLakeFreeJoinId})"
  IO.println s!"      path: just {lakeFreeJoinRecipe} (Capable* lake-free + path pieces + install; no lake)"
  IO.println s!"    AUTHORITY (B30): {productPathOwnershipRegenerateProductPathAuthorityClaimed} ({ownershipRegenerateProductPathAuthorityId})"
  IO.println s!"      path: just {productPathAuthorityRecipe} (freestanding-capable AuthorityNotEmit + Capable* lake-free + install; not FreestandingEmit)"
  IO.println s!"  productPathOwnershipRegenerateWithoutLake: {productPathOwnershipRegenerateWithoutLake} (closed B30; dual-pin FullBar)"
  IO.println s!"    req: {fullBarReqOwnershipRegenerateWithoutLake}"
  IO.println s!"    cliff token: {blockerMustOwnRegenerate} (WithoutLake closed; Full/perform/ownership claimed remain)"
  IO.println s!"  productPathOwnershipRegenerateDependsOnLake: {productPathOwnershipRegenerateDependsOnLake}"
  IO.println s!"  productPathOwnershipRegenerateInstallPathClaimed: {productPathOwnershipRegenerateInstallPathClaimed}"
  IO.println s!"  productPathOwnershipRegenerateReadPathClaimed: {productPathOwnershipRegenerateReadPathClaimed}"
  IO.println s!"  productPathOwnershipRegenerateComposePathClaimed: {productPathOwnershipRegenerateComposePathClaimed}"
  IO.println s!"  productPathOwnershipRegenerateWriteHcPathClaimed: {productPathOwnershipRegenerateWriteHcPathClaimed}"
  IO.println s!"  productPathFreestandingCapableStepContractFullSatisfied: {productPathFreestandingCapableStepContractFullSatisfied}"
  IO.println "  honest: install + READ + COMPOSE + WRITE-HC path pieces + B29 join + B30 product path authority"
  IO.println "  honest: WithoutLake true (freestanding product path authority; not FreestandingEmit; not B29 join alone)"
  IO.println "  not ownership claimed; not perform claimed; not Full; not complete; not residual free"
  IO.println "  dual-pin: freestanding CapableRead/Compose/WriteHc true via freestanding-capable-*-lake-free (distinct recipes)"
  IO.println "  not B6..B29 re-land theater (B30 is new authority evidence; WithoutLake dual-pin FullBar)"
  if productPathOwnershipRegenerateOk then
    IO.println s!"GREEN {stageId}: ownership regenerate surface ok (install+READ+COMPOSE+WRITE-HC Lake-free true; B29 join claimed; B30 authority claimed; WithoutLake true; Full false)"
  else
    IO.eprintln s!"error: {stageId} ownership regenerate surface not ok"
    throw (IO.userError "productPathOwnershipRegenerateOk false")

/-- Ownership regenerate PartialReady fold (closed B22..B30). SelfApplyFs tip
    re-exports a chain fold including this def. Land-time: WithoutLake true;
    DependsOnLake true; Full long-name false. Does not flip residual free /
    llvm / PROVABLY. Greppable: productPathOwnershipRegeneratePartialReady,
    SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE,
    OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY. -/
def productPathOwnershipRegeneratePartialReady : Bool :=
  productPathOwnershipRegenerateOk
    && productPathOwnershipRegenerateInstallLakeFree
    && productPathOwnershipRegenerateInstallPathClaimed
    && productPathOwnershipRegenerateReadLakeFree
    && productPathOwnershipRegenerateReadPathClaimed
    && productPathOwnershipRegenerateComposeLakeFree
    && productPathOwnershipRegenerateComposePathClaimed
    && productPathOwnershipRegenerateWriteHcLakeFree
    && productPathOwnershipRegenerateWriteHcPathClaimed
    && productPathOwnershipRegenerateLakeFreeJoinClaimed
    && productPathOwnershipRegenerateProductPathAuthorityClaimed
    && productPathOwnershipRegenerateWithoutLake
    && productPathOwnershipRegenerateDependsOnLake
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- CLI: print ownership regenerate substrate measure. -/
def main (_args : List String) : IO UInt32 := do
  try
    printOwnershipRegenerateMeasure
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ProductPathOwnershipRegenerate

-- Theorems + smoke: SystemsLean.ProductPathOwnershipRegenerateTheorems
-- (same namespace; long-file peel).
-- Lake entry is SystemsLean.ProductPathOwnershipRegenerateMain
-- (no top-level main here so SelfApplyFs may import ownership regenerate
-- Ok / PartialReady bulk without main clash).
"#

end SystemsLean.HostFrontLiveProductPathOwnershipRegenerate
