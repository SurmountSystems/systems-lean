# SPDX-License-Identifier: Unlicense
# Host presence: host tools without Lake (lean + leanc recipes).
# Joined via specs.nix. Sub-1-KLOC. No bash, no Python.
{
  hostSpecsFirstHostTool = [
    {
      rel = "just/first-host-tool.just";
      all = [
        "slake-runtime-bench-fail-closed-shape"
        "RuntimeBenchFailClosedShapeMain"
        "slake-runtime-bench-stack-twin"
        "RuntimeBenchStackTwinMain"
        "slake-read-product-ssot"
        "ProductPathReadSsotMain"
        "log_run lean"
        "log_run leanc"
        "build/first-host-tool"
        "host-tools-inventory.md"
        "second-host-tool"
        "third-host-tool"
      ];
    }
    {
      rel = "src/systems/host-tools-inventory.md";
      all = [
        "3 of 69"
        "just first-host-tool"
        "just second-host-tool"
        "just third-host-tool"
        "slake-runtime-bench-fail-closed-shape"
        "slake-runtime-bench-stack-twin"
        "slake-read-product-ssot"
      ];
    }
  ];
}
