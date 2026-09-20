# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# First Slake-produced ELF (lean --run writer; not mill leanc, not lake exe).
# No bash, no Python.
{
  hostSpecsCompilePath35 = [
    {
      # HOST-SLAKE-PRODUCED-ELF: Lean printer + clang link of generator
      # Compose SSA. Dest is not build/first-host-tool. Not mill 70.
      rel = "src/systems/SystemsLean/SlakeProducedElf.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeProducedElf"
        "HOST-SLAKE-PRODUCED-ELF"
        "SLAKE_PRODUCED_ELF_V0"
        "slake-produced-elf"
        "slakeProducedElfWrapIr"
        "slake_compose_ssa_mint_status"
        "first-host-tool"
        "slakeProducedElfWrite"
        "slakeProducedElfCheck"
        "slakeProducedElfMain"
        "FullHost stays false"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "occupancy 49"
        "not mill leanc"
      ];
    }
    {
      # Barrel dest for HOST-SLAKE-PRODUCED-ELF. Missing-token red
      # until SystemsLean.lean imports this module. No Main file.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeProducedElf"
      ];
    }
  ];
}
