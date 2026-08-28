# SPDX-License-Identifier: Unlicense
# Rust IR interop full: multi-band single out-of-tree consumer dual-pin covering
# Mult..Graph together. Host Lean RustIrInterop claims rustIrInteropFullClaimed
# true only with multiBandJointConsumerOk + partial rungs; fullBackend stays
# false. Not product Rust under src/. Not formalization of all of rustc.
# Greppable: HOST-RUST-IR-INTEROP, SLAKE_RUST_IR_INTEROP_FULL_V0,
# RUST-IR-INTEROP-FULL, MULTI-BAND-JOINT-CONSUMER, rust-ir-interop-full,
# rustIrInteropFullClaimed, multiBandJointConsumerOk.
{
  requiredFiles = [
    "doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md"
    "doc/rust-entry.md"
    "src/systems/SystemsLean/RustIrInterop.lean"
    "src/systems/SystemsLean/MultForeignLink.lean"
    "src/systems/SystemsLean/LinearForeignLink.lean"
    "src/systems/SystemsLean/TypesForeignLink.lean"
    "src/systems/SystemsLean/ProgramForeignLink.lean"
    "src/systems/SystemsLean/GraphForeignLink.lean"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/RustIrInterop.lean";
      all = [
        "HOST-RUST-IR-INTEROP"
        "SLAKE_RUST_IR_INTEROP_FULL_V0"
        "RUST-IR-INTEROP-FULL"
        "MULTI-BAND-JOINT-CONSUMER"
        "rustIrInteropFullClaimed"
        "multiBandJointConsumerOk"
        "rust-ir-interop-full"
        "def rustIrInteropFullClaimed : Bool := true"
        "def rustIrInteropPartialClaimed : Bool := true"
        "def rustIrInteropFullBackendClaimed : Bool := false"
        "theorem rustIrInteropFullClaimed_true"
        "theorem multiBandJointConsumerOk_true"
        "theorem rustIrInteropFullBackendClaimed_false"
      ];
      forbidden = [
        "def rustIrInteropFullClaimed : Bool := false"
        "def rustIrInteropFullBackendClaimed : Bool := true"
        "def rustIrInteropPartialClaimed : Bool := false"
      ];
    }
    {
      rel = "doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md";
      all = [
        "RUST-IR-INTEROP-FULL"
        "MULTI-BAND-JOINT-CONSUMER"
        "rustIrInteropFullClaimed"
        "rust-ir-interop-full"
        "multi-band"
        "not formalized all of rustc"
        "not product Rust"
        "fullBackend"
      ];
    }
    {
      rel = "doc/rust-entry.md";
      all = [
        "RUST-IR-INTEROP-FULL"
        "rust-ir-interop-full"
        "rustIrInteropFullClaimed"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "rust-ir-interop-full:"
        "SLAKE_RUST_IR_INTEROP_FULL_V0"
        "RUST-IR-INTEROP-FULL"
        "MULTI-BAND-JOINT-CONSUMER"
        "not full backend"
      ];
    }
  ];
}
