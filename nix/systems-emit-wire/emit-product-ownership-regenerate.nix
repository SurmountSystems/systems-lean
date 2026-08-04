# SPDX-License-Identifier: Unlicense
# Data slice for systems-emit-wire emit product. Joined by emit-product.nix.
# No bash, no Python in eval.
rec {
  productPathOwnershipRegenerateStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0";
  productPathOwnershipRegenerateHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE";
  productPathOwnershipRegenerateSelfHostId =
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE";
  productPathOwnershipRegenerateModulePath =
    "src/systems/SystemsLean/ProductPathOwnershipRegenerate.lean";
  # Dual-pin thin batch 21: home-primary stage/host/recipe/exe/Ok/step ids.
  productPathOwnershipRegenerateModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "productPathOwnershipRegenerateOk"
    "productPathOwnershipRegeneratePartialReady"
    "def productPathOwnershipRegeneratePartialReady : Bool :="
    "productPathOwnershipRegenerateInstallLakeFree"
    "productPathOwnershipRegenerateReadLakeFree"
    "productPathOwnershipRegenerateComposeLakeFree"
    "productPathOwnershipRegenerateWriteHcLakeFree"
    "productPathOwnershipRegenerateLakeFreeJoinClaimed"
    "productPathOwnershipRegenerateProductPathAuthorityClaimed"
    "productPathOwnershipRegenerateWithoutLake"
    "productPathOwnershipRegenerateDependsOnLake"
    "productPathOwnershipRegenerateInstallPathClaimed"
    "productPathOwnershipRegenerateReadPathClaimed"
    "productPathOwnershipRegenerateComposePathClaimed"
    "productPathOwnershipRegenerateWriteHcPathClaimed"
    "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
    "OWNERSHIP-REGENERATE-READ-LAKE-FREE"
    "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
    "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
    "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
    "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
    "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"
    "ownership-regenerate"
    "ownership-regenerate-install-only"
    "ownership-regenerate-read-only"
    "ownership-regenerate-compose-only"
    "ownership-regenerate-write-hc-only"
    "ownership-regenerate-lake-free"
    "ownership-regenerate-product-path-authority"
    "slake-ownership-regenerate"
    "lakeExeName"
    "justMeasureRecipe"
    "lakeFreeInstallRecipe"
    "lakeFreeReadRecipe"
    "lakeFreeComposeRecipe"
    "lakeFreeWriteHcRecipe"
    "lakeFreeJoinRecipe"
    "productPathAuthorityRecipe"
    "sharedInstallRecipe"
    "install-freestanding-c-out"
    "ProductPathOwnershipRegenerate"
    "ProductPathComposePlan.planApplyBodySpecs"
    "ProductPathWriteHc"
    "slake_freestanding.h"
    "slake_freestanding.c"
    "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "theorem productPathOwnershipRegeneratePartialReady_true"
  ];
  productPathOwnershipRegenerateModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B30: WithoutLake dual-pin closed with product path authority; forbid dishonest false.
    "def productPathOwnershipRegenerateWithoutLake : Bool := false"
    "def productPathOwnershipRegenerateProductPathAuthorityClaimed : Bool := false"
    "def productPathOwnershipRegenerateLakeFreeJoinClaimed : Bool := false"
    "def productPathOwnershipRegenerateInstallLakeFree : Bool := false"
    "def productPathOwnershipRegenerateReadLakeFree : Bool := false"
    "def productPathOwnershipRegenerateComposeLakeFree : Bool := false"
    "def productPathOwnershipRegenerateWriteHcLakeFree : Bool := false"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "OWNERSHIP-REGENERATE-COMPOSE-STILL-LAKE"
    "OWNERSHIP-REGENERATE-WRITE-HC-STILL-LAKE"
  ];
  productPathOwnershipRegenerateLakefilePath = "src/systems/lakefile.lean";
  productPathOwnershipRegenerateLakefileTokens = [
    "slake-ownership-regenerate"
    "SystemsLean.ProductPathOwnershipRegenerateMain"
  ];
  productPathOwnershipRegenerateJustPath = "just/ownership.just";
  productPathOwnershipRegenerateJustTokens = [
    "ownership-regenerate"
    "ownership-regenerate-install-only"
    "ownership-regenerate-read-only"
    "ownership-regenerate-compose-only"
    "ownership-regenerate-write-hc-only"
    "ownership-regenerate-lake-free"
    "ownership-regenerate-product-path-authority"
    "slake-ownership-regenerate"
    "ProductPathOwnershipRegenerate"
    "lake build slake-ownership-regenerate"
    "lake exe slake-ownership-regenerate"
    "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
    "OWNERSHIP-REGENERATE-READ-LAKE-FREE"
    "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
    "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
    "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
    "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    # B23 Lake-free READ recipe banner (unique to ownership-regenerate-read-only body).
    # Measure recipe may still lake-build; this string must stay on the read-only path.
    "Lake-free: no lake build/exe; dual SSOT presence+token only"
    # List authority cite for dual SSOT pairs (ProductPathReadSsot.dualSsotSpecs).
    "ProductPathReadSsot.dualSsotSpecs"
    # B24 Lake-free COMPOSE recipe banner (unique to ownership-regenerate-compose-only).
    "Lake-free: no lake build/exe; plan/apply/body dual SSOT presence+token only"
    # List authority cite for compose SSOT pairs (ProductPathComposePlan.planApplyBodySpecs).
    "ProductPathComposePlan.planApplyBodySpecs"
    # B25 Lake-free WRITE-HC recipe banner (unique to ownership-regenerate-write-hc-only).
    "Lake-free: no lake build/exe; freestanding .h/.c presence+token only"
    # List authority cite for write-hc basenames (ProductPathWriteHc.emitHeaderBase).
    "ProductPathWriteHc.emitHeaderBase"
    # B29 ordered Lake-free join banner (unique to ownership-regenerate-lake-free).
    # Require full join body invocs (Capable* + ownership path pieces + install)
    # so a future edit cannot drop middle path-piece steps and still pass pure Nix.
    "Lake-free: no lake build/exe; joins existing Lake-free Capable* + ownership path recipes"
    "just freestanding-capable-read-lake-free"
    "just freestanding-capable-compose-lake-free"
    "just freestanding-capable-write-hc-lake-free"
    "just ownership-regenerate-read-only"
    "just ownership-regenerate-compose-only"
    "just ownership-regenerate-write-hc-only"
    "just ownership-regenerate-install-only"
    # B30 product path authority recipe banners (unique to
    # ownership-regenerate-product-path-authority; not a B29 join rebrand).
    "token: OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    "authority: freestanding-capable path (AuthorityNotEmit); not FreestandingEmit"
    "pipeline cite: FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "distinct from B29 ownership-regenerate-lake-free join"
    "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true"
  ];
  productPathOwnershipRegenerateAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    "productPathOwnershipRegeneratePartialReady"
    "productPathOwnershipRegenerateInstallLakeFree"
    "productPathOwnershipRegenerateReadLakeFree"
    "productPathOwnershipRegenerateComposeLakeFree"
    "productPathOwnershipRegenerateWriteHcLakeFree"
    "productPathOwnershipRegenerateLakeFreeJoinClaimed"
    "productPathOwnershipRegenerateProductPathAuthorityClaimed"
    "productPathOwnershipRegenerateWithoutLake"
    "productPathOwnershipRegenerateDependsOnLake"
    "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
    "OWNERSHIP-REGENERATE-READ-LAKE-FREE"
    "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
    "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
    "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
    "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    "ownership-regenerate"
    "ownership-regenerate-install-only"
    "ownership-regenerate-read-only"
    "ownership-regenerate-compose-only"
    "ownership-regenerate-write-hc-only"
    "ownership-regenerate-lake-free"
    "ownership-regenerate-product-path-authority"
    "slake-ownership-regenerate"
    "ProductPathOwnershipRegenerate"
    "product path ownership regenerate"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
    "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"
  ];

  # Partial B31: freestanding product path perform evidence beyond B30.
  # Evidence claimed true (freestanding-perform-evidence); perform claimed false;
  # DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open.
}
