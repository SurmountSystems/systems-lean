# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until barrel import. Thin CatchReturn. Not fat SelfHostComplete.
# Not mill leanc. Not remill mill 69. No bash, no Python.
{
  hostSpecsCompilePath41 = [
    {
      # Thin living catch role. Not fat SelfHostComplete. Catch does not
      # belong in CompleteOk.
      rel = "src/systems/SystemsLean/CatchReturn.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CatchReturn"
        "throwMsg"
        "catchEprint"
        "catchCode"
        "withCatch"
        "FullHost stays false"
        "occupancy 49"
        "Mill stays 69 of 69"
        "Not mill leanc"
      ];
    }
    {
      # Barrel dest for thin CatchReturn. Dest-missing red until
      # SystemsLean.lean imports this module. No Main file.
      # Thin CatchReturn. Not fat SelfHostComplete. Not mill leanc.
      # Not remill mill 69.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.CatchReturn"
      ];
    }
  ];
}
