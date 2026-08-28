# SPDX-License-Identifier: Unlicense
# Rust IR interop partial: progressive Systems Lean <-> Rust layout/IR
# correspondence. Host Lean RustIrInterop dual-pins Mult..Graph foreign success
# rungs + Mult layout fixture / layout-IR dual evidence into
# rustIrInteropPartialClaimed true. Full multi-band claim is owned by
# rust-ir-interop-full.nix (fullBackend stays false either way).
# Not product Rust under src/. Not full rustc formalization.
# Greppable: HOST-RUST-IR-INTEROP, SLAKE_RUST_IR_INTEROP_PARTIAL_V0,
# RUST-IR-INTEROP, RUST-SYSTEMS-LEAN-CORRESPONDENCE, RUST-IR-INTEROP-PARTIAL,
# rust-ir-interop-partial, rustIrInteropPartialClaimed.
{
  requiredFiles = [
    "doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md"
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "doc/dev/research/rust-native-layout-design-2026-08-03.md"
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
        "SLAKE_RUST_IR_INTEROP_PARTIAL_V0"
        "RUST-IR-INTEROP"
        "RUST-SYSTEMS-LEAN-CORRESPONDENCE"
        "RUST-IR-INTEROP-PARTIAL"
        "RUST-IR-INTEROP-FULL"
        "rustIrInteropPartialClaimed"
        "rustIrInteropFullClaimed"
        "rustIrInteropDualMapOk"
        "multGraphForeignRungsOk"
        "multLayoutIrDualEvidenceOk"
        "rust-ir-interop-partial"
        "x86_64-unknown-linux-gnu"
        "LAYOUT-SIZE-ALIGN-FIXTURE"
        "LAYOUT-IR-TAG-DUAL-PIN"
        "out-of-tree"
        "def rustIrInteropPartialClaimed : Bool := true"
        "def rustIrInteropFullBackendClaimed : Bool := false"
        "theorem rustIrInteropPartialClaimed_true"
        "theorem rustIrInteropFullBackendClaimed_false"
      ];
      forbidden = [
        "def rustIrInteropFullBackendClaimed : Bool := true"
        "def rustIrInteropPartialClaimed : Bool := false"
      ];
    }
    {
      rel = "doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md";
      all = [
        "RUST-IR-INTEROP"
        "RUST-SYSTEMS-LEAN-CORRESPONDENCE"
        "RUST-IR-INTEROP-PARTIAL"
        "rustIrInteropPartialClaimed"
        "rust-ir-interop-partial"
        "out-of-tree"
        "Curry-Howard"
        "not product Rust"
        "Not formalization of rustc"
        "Mult..Graph"
        "fullBackend"
        "LAYOUT-SIZE-ALIGN-FIXTURE"
        "partial"
      ];
    }
    {
      rel = "doc/rust-entry.md";
      all = [
        "RUST-IR-INTEROP"
        "rust-ir-interop-partial"
        "RustIrInterop"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "rust-ir-interop-partial:"
        "HOST-RUST-IR-INTEROP"
        "SLAKE_RUST_IR_INTEROP_PARTIAL_V0"
        "RUST-IR-INTEROP"
        "RUST-SYSTEMS-LEAN-CORRESPONDENCE"
        "not full backend"
      ];
    }
  ];
}
