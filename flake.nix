{
  description = "Systems Lean";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forEachSystem =
        f:
        lib.genAttrs systems (
          system:
          f {
            inherit system;
            pkgs = nixpkgs.legacyPackages.${system};
          }
        );

      novelSource = import ./nix/novel-source.nix {
        inherit lib;
        src = ./.;
      };

      progress = import ./nix/progress { inherit lib; };
      progressAt = progress.mk self;

      sourceHygiene = import ./nix/source-hygiene.nix {
        inherit lib;
        root = novelSource;
      };

      professionalTone = import ./nix/professional-tone.nix {
        inherit lib;
        root = novelSource;
      };

      systemsHostPresence = import ./nix/systems-host-presence {
        inherit lib;
        root = novelSource;
      };

      systemsEmitWire = import ./nix/systems-emit-wire {
        inherit lib;
        root = novelSource;
      };

      systemsLlvmIr = import ./nix/systems-llvm-ir {
        inherit lib;
        root = novelSource;
      };

      idrisSidePresence = import ./nix/idris-side-presence {
        inherit lib;
        root = novelSource;
      };

      leanSidePresence = import ./nix/lean-side-presence {
        inherit lib;
        root = novelSource;
      };

      systemsMillExtrasFit = import ./nix/systems-mill-extras-fit {
        inherit lib;
        root = novelSource;
      };

      slakeProducedElf = import ./nix/slake-produced-elf.nix {
        inherit lib;
        root = novelSource;
      };

      slakeHostToolElf = import ./nix/slake-host-tool-elf.nix {
        inherit lib;
        root = novelSource;
      };

      systemsMillInventory = import ./nix/systems-mill-inventory.nix {
        inherit lib;
        root = novelSource;
      };

      systemsMillPackedExtras = import ./nix/systems-mill-packed-extras.nix {
        inherit lib;
        root = novelSource;
      };

      systemsMillFilePath = import ./nix/systems-mill-file-path.nix {
        inherit lib;
        root = novelSource;
      };

      systemsMillRecipeCount = import ./nix/systems-mill-recipe-count.nix {
        inherit lib;
        root = novelSource;
      };

      freestandingCapableReadLakeFree = import ./nix/freestanding-capable-read-lake-free.nix {
        inherit lib;
        root = novelSource;
      };

      freestandingCapableComposeLakeFree = import ./nix/freestanding-capable-compose-lake-free.nix {
        inherit lib;
        root = novelSource;
      };

      freestandingCapableWriteHcLakeFree = import ./nix/freestanding-capable-write-hc-lake-free.nix {
        inherit lib;
        root = novelSource;
      };

      freestandingCapableRegenerateWithoutLake = import ./nix/freestanding-capable-regenerate-without-lake.nix {
        inherit lib;
        root = novelSource;
      };

      ownershipRegenerateReadOnly = import ./nix/ownership-regenerate-read-only.nix {
        inherit lib;
        root = novelSource;
      };

      ownershipRegenerateComposeOnly = import ./nix/ownership-regenerate-compose-only.nix {
        inherit lib;
        root = novelSource;
      };

      ownershipRegenerateWriteHcOnly = import ./nix/ownership-regenerate-write-hc-only.nix {
        inherit lib;
        root = novelSource;
      };

      lakeRetireInventory = import ./nix/lake-retire-inventory.nix {
        inherit lib;
        root = novelSource;
      };

      multSubsetFreestandingDeepen = import ./nix/mult-subset-freestanding-deepen.nix {
        inherit lib;
        root = novelSource;
      };

      hostResidualShrink = import ./nix/host-residual-shrink.nix {
        inherit lib;
        root = novelSource;
      };

      # Pure check: throw at eval time with violation list, or a tiny text drv.
      mkSourceHygieneCheck =
        pkgs:
        if sourceHygiene.ok then
          pkgs.writeText "source-hygiene-ok" sourceHygiene.summary
        else
          throw sourceHygiene.summary;

      mkProfessionalToneCheck =
        pkgs:
        if professionalTone.ok then
          pkgs.writeText "professional-tone-ok" professionalTone.summary
        else
          throw professionalTone.summary;

      mkSystemsHostPresenceCheck =
        pkgs:
        if systemsHostPresence.ok then
          pkgs.writeText "systems-host-presence-ok" systemsHostPresence.summary
        else
          throw systemsHostPresence.summary;

      mkSystemsEmitWireCheck =
        pkgs:
        if systemsEmitWire.ok then
          pkgs.writeText "systems-emit-wire-ok" systemsEmitWire.summary
        else
          throw systemsEmitWire.summary;

      mkSystemsLlvmIrPresenceCheck =
        pkgs:
        if systemsLlvmIr.ok then
          pkgs.writeText "systems-llvm-ir-presence-ok" systemsLlvmIr.summary
        else
          throw systemsLlvmIr.summary;

      mkIdrisSidePresenceCheck =
        pkgs:
        if idrisSidePresence.ok then
          pkgs.writeText "idris-side-presence-ok" idrisSidePresence.summary
        else
          throw idrisSidePresence.summary;

      mkLeanSidePresenceCheck =
        pkgs:
        if leanSidePresence.ok then
          pkgs.writeText "lean-side-presence-ok" leanSidePresence.summary
        else
          throw leanSidePresence.summary;

      mkSystemsMillExtrasFitCheck =
        pkgs:
        if systemsMillExtrasFit.ok then
          pkgs.writeText "systems-mill-extras-fit-ok" systemsMillExtrasFit.summary
        else
          throw systemsMillExtrasFit.summary;

      mkSlakeProducedElfCheck =
        pkgs:
        if slakeProducedElf.ok then
          pkgs.writeText "slake-produced-elf-ok" slakeProducedElf.summary
        else
          throw slakeProducedElf.summary;

      mkSlakeHostToolElfCheck =
        pkgs:
        if slakeHostToolElf.ok then
          pkgs.writeText "slake-host-tool-elf-ok" slakeHostToolElf.summary
        else
          throw slakeHostToolElf.summary;

      mkSystemsMillInventoryCheck =
        pkgs:
        if systemsMillInventory.ok then
          pkgs.writeText "systems-mill-inventory-ok" systemsMillInventory.summary
        else
          throw systemsMillInventory.summary;

      mkSystemsMillPackedExtrasCheck =
        pkgs:
        if systemsMillPackedExtras.ok then
          pkgs.writeText "systems-mill-packed-extras-ok" systemsMillPackedExtras.summary
        else
          throw systemsMillPackedExtras.summary;

      mkSystemsMillFilePathCheck =
        pkgs:
        if systemsMillFilePath.ok then
          pkgs.writeText "systems-mill-file-path-ok" systemsMillFilePath.summary
        else
          throw systemsMillFilePath.summary;

      mkSystemsMillRecipeCountCheck =
        pkgs:
        if systemsMillRecipeCount.ok then
          pkgs.writeText "systems-mill-recipe-count-ok" systemsMillRecipeCount.summary
        else
          throw systemsMillRecipeCount.summary;

      mkFreestandingCapableReadLakeFreeCheck =
        pkgs:
        if freestandingCapableReadLakeFree.ok then
          pkgs.writeText "freestanding-capable-read-lake-free-ok" freestandingCapableReadLakeFree.summary
        else
          throw freestandingCapableReadLakeFree.summary;

      mkFreestandingCapableComposeLakeFreeCheck =
        pkgs:
        if freestandingCapableComposeLakeFree.ok then
          pkgs.writeText "freestanding-capable-compose-lake-free-ok" freestandingCapableComposeLakeFree.summary
        else
          throw freestandingCapableComposeLakeFree.summary;

      mkFreestandingCapableWriteHcLakeFreeCheck =
        pkgs:
        if freestandingCapableWriteHcLakeFree.ok then
          pkgs.writeText "freestanding-capable-write-hc-lake-free-ok" freestandingCapableWriteHcLakeFree.summary
        else
          throw freestandingCapableWriteHcLakeFree.summary;

      mkFreestandingCapableRegenerateWithoutLakeCheck =
        pkgs:
        if freestandingCapableRegenerateWithoutLake.ok then
          pkgs.writeText "freestanding-capable-regenerate-without-lake-ok" freestandingCapableRegenerateWithoutLake.summary
        else
          throw freestandingCapableRegenerateWithoutLake.summary;

      mkOwnershipRegenerateReadOnlyCheck =
        pkgs:
        if ownershipRegenerateReadOnly.ok then
          pkgs.writeText "ownership-regenerate-read-only-ok" ownershipRegenerateReadOnly.summary
        else
          throw ownershipRegenerateReadOnly.summary;

      mkOwnershipRegenerateComposeOnlyCheck =
        pkgs:
        if ownershipRegenerateComposeOnly.ok then
          pkgs.writeText "ownership-regenerate-compose-only-ok" ownershipRegenerateComposeOnly.summary
        else
          throw ownershipRegenerateComposeOnly.summary;

      mkOwnershipRegenerateWriteHcOnlyCheck =
        pkgs:
        if ownershipRegenerateWriteHcOnly.ok then
          pkgs.writeText "ownership-regenerate-write-hc-only-ok" ownershipRegenerateWriteHcOnly.summary
        else
          throw ownershipRegenerateWriteHcOnly.summary;

      mkLakeRetireInventoryCheck =
        pkgs:
        if lakeRetireInventory.ok then
          pkgs.writeText "lake-retire-inventory-ok" lakeRetireInventory.summary
        else
          throw lakeRetireInventory.summary;

      mkMultSubsetFreestandingDeepenCheck =
        pkgs:
        if multSubsetFreestandingDeepen.ok then
          pkgs.writeText "mult-subset-freestanding-deepen-ok" multSubsetFreestandingDeepen.summary
        else
          throw multSubsetFreestandingDeepen.summary;

      mkHostResidualShrinkCheck =
        pkgs:
        if hostResidualShrink.ok then
          pkgs.writeText "host-residual-shrink-ok" hostResidualShrink.summary
        else
          throw hostResidualShrink.summary;

      mkProgressReport =
        pkgs:
        pkgs.writeText "PROGRESS.md" progressAt.report;
    in
    {
      # Reusable pure APIs (no packages, no shell).
      lib = {
        inherit progress;
        novelSource = import ./nix/novel-source.nix;
        sourceHygiene = import ./nix/source-hygiene.nix;
        professionalTone = import ./nix/professional-tone.nix;
        systemsHostPresence = import ./nix/systems-host-presence;
        systemsEmitWire = import ./nix/systems-emit-wire;
        systemsLlvmIr = import ./nix/systems-llvm-ir;
        idrisSidePresence = import ./nix/idris-side-presence;
        leanSidePresence = import ./nix/lean-side-presence;
        systemsMillExtrasFit = import ./nix/systems-mill-extras-fit;
        slakeProducedElf = import ./nix/slake-produced-elf.nix;
        slakeHostToolElf = import ./nix/slake-host-tool-elf.nix;
        systemsMillInventory = import ./nix/systems-mill-inventory.nix;
        systemsMillPackedExtras = import ./nix/systems-mill-packed-extras.nix;
        systemsMillFilePath = import ./nix/systems-mill-file-path.nix;
        systemsMillRecipeCount = import ./nix/systems-mill-recipe-count.nix;
        freestandingCapableReadLakeFree = import ./nix/freestanding-capable-read-lake-free.nix;
        freestandingCapableComposeLakeFree = import ./nix/freestanding-capable-compose-lake-free.nix;
        freestandingCapableWriteHcLakeFree = import ./nix/freestanding-capable-write-hc-lake-free.nix;
        freestandingCapableRegenerateWithoutLake = import ./nix/freestanding-capable-regenerate-without-lake.nix;
        ownershipRegenerateReadOnly = import ./nix/ownership-regenerate-read-only.nix;
        ownershipRegenerateComposeOnly = import ./nix/ownership-regenerate-compose-only.nix;
        ownershipRegenerateWriteHcOnly = import ./nix/ownership-regenerate-write-hc-only.nix;
        lakeRetireInventory = import ./nix/lake-retire-inventory.nix;
        multSubsetFreestandingDeepen = import ./nix/mult-subset-freestanding-deepen.nix;
        hostResidualShrink = import ./nix/host-residual-shrink.nix;
      };

      # Live pure-Nix meter text (system-independent). `just progress` redirects these.
      progressReportText = progressAt.report;
      progressConsoleText = progressAt.console;

      checks = forEachSystem (
        { pkgs, ... }:
        {
          source-hygiene = mkSourceHygieneCheck pkgs;
          professional-tone = mkProfessionalToneCheck pkgs;
          systems-host-presence = mkSystemsHostPresenceCheck pkgs;
          systems-emit-wire = mkSystemsEmitWireCheck pkgs;
          systems-llvm-ir-presence = mkSystemsLlvmIrPresenceCheck pkgs;
          idris-side-presence = mkIdrisSidePresenceCheck pkgs;
          lean-side-presence = mkLeanSidePresenceCheck pkgs;
          systems-mill-extras-fit = mkSystemsMillExtrasFitCheck pkgs;
          slake-produced-elf = mkSlakeProducedElfCheck pkgs;
          slake-host-tool-elf = mkSlakeHostToolElfCheck pkgs;
          systems-mill-inventory = mkSystemsMillInventoryCheck pkgs;
          systems-mill-packed-extras = mkSystemsMillPackedExtrasCheck pkgs;
          systems-mill-file-path = mkSystemsMillFilePathCheck pkgs;
          systems-mill-recipe-count = mkSystemsMillRecipeCountCheck pkgs;
          freestanding-capable-read-lake-free = mkFreestandingCapableReadLakeFreeCheck pkgs;
          freestanding-capable-compose-lake-free = mkFreestandingCapableComposeLakeFreeCheck pkgs;
          freestanding-capable-write-hc-lake-free = mkFreestandingCapableWriteHcLakeFreeCheck pkgs;
          freestanding-capable-regenerate-without-lake = mkFreestandingCapableRegenerateWithoutLakeCheck pkgs;
          ownership-regenerate-read-only = mkOwnershipRegenerateReadOnlyCheck pkgs;
          ownership-regenerate-compose-only = mkOwnershipRegenerateComposeOnlyCheck pkgs;
          ownership-regenerate-write-hc-only = mkOwnershipRegenerateWriteHcOnlyCheck pkgs;
          lake-retire-inventory = mkLakeRetireInventoryCheck pkgs;
          mult-subset-freestanding-deepen = mkMultSubsetFreestandingDeepenCheck pkgs;
          host-residual-shrink = mkHostResidualShrinkCheck pkgs;
        }
      );

      packages = forEachSystem (
        { pkgs, system }:
        {
          # Frozen snapshot of the pure progress report (CI artifact / nix build).
          progress-report = mkProgressReport pkgs;
          default = mkSourceHygieneCheck pkgs;
        }
        // lib.optionalAttrs (system == "x86_64-linux") {
          slake-bootstrap = import ./nix/slake-bootstrap.nix {
            inherit lib pkgs system;
            driver = ./src/systems/SystemsLean/PackageTypecheck.lean;
          };
        }
      );

      devShells = forEachSystem (
        { pkgs, ... }:
        {
          default = pkgs.mkShell {
            name = "systems-lean";
            packages = [
              pkgs.git
              pkgs.just
              pkgs.nixfmt
              pkgs.scc
              # Search: agents and humans use `rg` (ripgrep), not ad-hoc grep mills.
              pkgs.ripgrep
              # Lean/Lake: elan manages the offline pin in src/systems/lean-toolchain
              # and src/lean4/lean-toolchain (leanprover/lean4:v4.35.0). Do not put
              # pkgs.lean4 here -- nixpkgs lean4 lags the pin and would mismatch.
              # Install once: elan toolchain install "$(tr -d '[:space:]' < src/systems/lean-toolchain)"
              # Workspace checks skip Lake when the pin is not installed (no network).
              pkgs.elan
              # Idris 2 elaborator for bridge-side checks (skip-if-missing honesty in
              # just idris-elaborate when binary absent outside this shell).
              pkgs.idris2
            ];
            shellHook = ''
              echo "systems-lean: just | just check | just progress | just watch | just build"
              echo "tooling: pure Nix under nix/; search with rg; elan + idris2 in PATH"
              echo "Lean pin: install via elan from src/systems/lean-toolchain (or src/lean4/)"
            '';
          };
        }
      );

      formatter = forEachSystem ({ pkgs, ... }: pkgs.nixfmt);
    };
}
