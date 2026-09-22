# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until barrel import. Thin CompleteOk. Not fat SelfHostComplete.
# Not mill leanc. Not remill mill 69. No bash, no Python.
{
  hostSpecsCompilePath39 = [
    {
      # Thin living CompleteOk Bool helper. Not SlakeHostToolElfCompleteOk
      # (encoding dests stay in slice 36). Not fat SelfHostComplete.
      rel = "src/systems/SystemsLean/CompleteOk.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompleteOk"
        "freestandingProductSelfHostCompleteOk"
        "completeOk"
        "SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0"
        "HOST-SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
        "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "Not mill leanc"
      ];
    }
    {
      # Barrel dest for thin CompleteOk. Dest-missing red until
      # SystemsLean.lean imports this module. No Main file.
      # Thin CompleteOk. Not fat SelfHostComplete. Not mill leanc.
      # Not remill mill 69.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.CompleteOk"
      ];
    }
  ];
}
