# SPDX-License-Identifier: Unlicense
# Data only: freestanding emit product paths, APIs, stage tokens, driver path specs.
# Thin join of role slices (Sub-1-KLOC). Imported by ./specs.nix.
# Pure Nix. No bash, no ripgrep, no Python.
let
  paths = import ./emit-product-paths.nix;
  perform = import ./emit-product-perform.nix;
  capable = import ./emit-product-capable.nix;
  ownershipRegenerate = import ./emit-product-ownership-regenerate.nix;
  performEvidence = import ./emit-product-perform-evidence.nix;
  dualEq = import ./emit-product-dual-eq.nix;
  claim = import ./emit-product-claim.nix;
  apis = import ./emit-product-apis.nix;
  base =
    paths
    // perform
    // capable
    // ownershipRegenerate
    // performEvidence
    // dualEq
    // claim
    // apis;
  drivers = import ./emit-product-drivers.nix base;
in base // drivers
