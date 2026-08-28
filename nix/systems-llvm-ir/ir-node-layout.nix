# SPDX-License-Identifier: Unlicense
# Richer-than-i32 IrNodeRecord layout + IR link-smoke just module.
# Fail-closed if IrNodeLayout.lean or just/llvm-link-smoke.just vanish.
# Does not require rustc/clang/llc binaries. Does not shell out.
# Out-of-tree rustc size/align/offset dogfood stays under TMPDIR.
# Not FullBackend. Not product Rust under src/. C product wire unchanged.
# Greppable: HOST-IR-NODE-LAYOUT, SLAKE_IR_NODE_LAYOUT_V0,
# RICHER-THAN-I32-LAYOUT, IrNodeRecord, richer-record-layout,
# HOST-LLVM-LINK-SMOKE, SLAKE_LLVM_LINK_SMOKE_V0, llvm-link-smoke.
{
  requiredFiles = [
    "src/systems/SystemsLean/IrNodeLayout.lean"
    "just/llvm-link-smoke.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/IrNodeLayout.lean";
      all = [
        "HOST-IR-NODE-LAYOUT"
        "SLAKE_IR_NODE_LAYOUT_V0"
        "RICHER-THAN-I32-LAYOUT"
        "IrNodeRecord"
        "x86_64-unknown-linux-gnu"
        "richer-record-layout"
        "irNodeLayoutDualPinOk"
        "out-of-tree"
        "def irNodeLayoutFullBackendClaimed : Bool := false"
        "theorem irNodeLayoutFullBackendClaimed_false"
      ];
      forbidden = [
        "def irNodeLayoutFullBackendClaimed : Bool := true"
        "def irNodeLayoutFullHostElaborateClaimed : Bool := true"
      ];
    }
    {
      rel = "just/llvm-link-smoke.just";
      all = [
        "richer-record-layout:"
        "llvm-link-smoke:"
        "HOST-IR-NODE-LAYOUT"
        "SLAKE_IR_NODE_LAYOUT_V0"
        "RICHER-THAN-I32-LAYOUT"
        "IrNodeRecord"
        "HOST-LLVM-LINK-SMOKE"
        "SLAKE_LLVM_LINK_SMOKE_V0"
        "x86_64-unknown-linux-gnu"
        "--target x86_64-unknown-linux-gnu"
        "not full backend"
        "not product Rust"
        "mktemp"
      ];
    }
  ];
}
