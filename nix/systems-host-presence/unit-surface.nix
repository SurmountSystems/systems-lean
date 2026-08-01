# SPDX-License-Identifier: Unlicense
# Unit-surface docs + .slake honesty token specs (former check.sh need greps).
# types.md: COMMON-UNIVERSE only; HOST-RESIDUAL / PRODUCT-WIRE-RESIDUAL
# stay on Types.slake + SystemsLean/Types.lean.
# Imported by ./specs.nix thin join. No bash.
{
unitSurfaceSpecs = [
  {
    rel = "src/systems/types.md";
    all = [
      "COMMON-UNIVERSE"
      "FAIL-CLOSED-UNKNOWN-KIND"
      "TYPES-THEOREM"
      "HOST-TYPES-THEOREM"
      "ofKindTag?_fail_closed"
      "kindMultOk"
      "mkNode?_mismatch_none"
      "mkNode?_ok"
      "expectedMult_value"
      "isWellTyped_eq_kindMultOk"
      "IR-PROGRAM-THEOREM"
      "HOST-IR-PROGRAM-THEOREM"
      "isWellTyped_empty_false"
      "isWellTyped_single_value"
      "foldWellTyped_single_value_some"
      "EMPTY-PROGRAM-FAIL-CLOSED"
      "IR-GRAPH-THEOREM"
      "HOST-IR-GRAPH-THEOREM"
      "EMPTY-GRAPH-OK"
      "edgesSound_empty"
      "HOST-PARITY-TYPES"
      "SELF-HOST-PARITY-TYPES"
      "HOST-PARITY-PROGRAM"
      "SELF-HOST-PARITY-PROGRAM"
      "HOST-PARITY-EMIT"
      "SELF-HOST-PARITY-EMIT"
    ];
  }
  {
    rel = "src/systems/mult.md";
    all = [
      "MULT-0"
      "MULT-1"
      "MULT-OMEGA"
      "FAIL-CLOSED-UNKNOWN-GRADE"
      "MULT-THEOREM"
      "HOST-MULT-THEOREM"
      "ofNat?_fail_closed"
      "name_mult0"
      "ofNat?_some_implies_isValidTag"
      "ofNat?_name_zero"
      "ofNat?_name_fail_closed"
    ];
  }
  {
    rel = "src/systems/Mult.slake";
    all = [ "FAIL-CLOSED-UNKNOWN-GRADE" ];
  }
  {
    rel = "src/systems/linear.md";
    all = [
      "LINEAR-EXACT-ONCE"
      "SELF-HOST-KERNEL-LINEAR"
      "HOST-KERNEL-LINEAR"
      "HOST-PARITY-LINEAR"
      "SELF-HOST-PARITY-LINEAR"
      "LINEAR-THEOREM"
      "HOST-LINEAR-THEOREM"
      "shareNat_eq"
      "shareNat_zero"
      "shareNat_succ"
      "JOIN-ALG"
    ];
  }
  {
    rel = "src/systems/Linear.slake";
    all = [
      "LINEAR-EXACT-ONCE"
      "JOIN-ALG"
      "ConsumeToken"
    ];
  }
  {
    rel = "src/systems/erasure.md";
    all = [ "ERASE-RULE-MULT-0" ];
  }
  {
    rel = "src/systems/Erasure.slake";
    all = [
      "ERASE-RULE-MULT-0"
      "EDGE-PROP"
      "ERASE-PROP"
    ];
  }
  {
    rel = "src/systems/Extract.slake";
    all = [
      "RUNTIME-FS"
      "EDGE-RUNTIME"
      "RUNTIME-CLASSIC"
      "EMIT-BOUNDARY"
    ];
  }
  {
    rel = "src/systems/extract.md";
    all = [
      "EMIT-BOUNDARY"
      "COMPOSE-THEOREM"
      "HOST-COMPOSE-THEOREM"
      "multPreScan_empty_true"
      "mint_zero_badId"
      "markErased_idempotent"
      "multPreScan_omega_only_true"
      "mint_consume_roundtrip"
    ];
  }
  {
    # Host PARTIAL inventory Mult..SelfHostBody (greppable miss list / empty).
    rel = "src/systems/host-partial-inventory.md";
    all = [
      "HOST-PARTIAL-INVENTORY"
      "SYSTEMS_LEAN_HOST"
      "CLOSABLE-MISS-COUNT-0"
      "intentional PARTIAL"
      "Mult..LlvmHold"
      "Mult..InventoryClose"
      "Mult..ProductPath"
      "Mult..DualResidual"
      "Mult..ProbeWire"
      "Mult..SpecProof"
      "Mult..SelfHostBody"
      "HOST-INVENTORY-CLOSE"
      "SELF-HOST-INVENTORY-CLOSE"
      "HOST-PRODUCT-PATH"
      "SELF-HOST-PRODUCT-PATH"
      "HOST-PRODUCT-PATH-CLOSE"
      "SELF-HOST-PRODUCT-PATH-CLOSE"
      "HOST-DUAL-RESIDUAL"
      "SELF-HOST-DUAL-RESIDUAL"
      "HOST-PROBE-WIRE"
      "SELF-HOST-PROBE-WIRE"
      "HOST-SPEC-PROOF"
      "SELF-HOST-SPEC-PROOF"
      "HOST-SELF-HOST-BODY"
      "SELF-HOST-BODY"
      "SELF-HOST-KERNEL-MULT"
      "HOST-EMIT-MULT"
      "HOST-PARITY-MULT"
      "SELF-HOST-KERNEL-LINEAR"
      "HOST-KERNEL-LINEAR"
      "HOST-PARITY-LINEAR"
      "SELF-HOST-PARITY-LINEAR"
      "SELF-HOST-KERNEL-TYPES"
      "HOST-KERNEL-TYPES"
      "HOST-PARITY-TYPES"
      "SELF-HOST-PARITY-TYPES"
      "SELF-HOST-KERNEL-PROGRAM"
      "HOST-KERNEL-PROGRAM"
      "HOST-PARITY-PROGRAM"
      "SELF-HOST-PARITY-PROGRAM"
      "SELF-HOST-KERNEL-EMIT"
      "HOST-KERNEL-EMIT"
      "HOST-PARITY-EMIT"
      "SELF-HOST-PARITY-EMIT"
      "HOST-SELF-APPLY"
      "SELF-HOST-SELF-APPLY"
      "HOST-SELF-APPLY-FS"
      "SELF-HOST-SELF-APPLY-FS"
      "HOST-LLVM-HOLD"
      "SELF-HOST-LLVM-HOLD"
      "HOST-PROVABLY-HOLD"
    ];
  }
  {
    # SURFACE-MATRIX inventory prose (P7 progressive superset surface).
    rel = "src/systems/surface-matrix.md";
    all = [
      "SURFACE-MATRIX"
      "SLAKE_SURFACE_MATRIX_V0"
      "HOST-SURFACE-MATRIX"
      "present-partial"
      "open"
      "SYSTEMS_LEAN_HOST"
      "ConsumeToken"
      "ErasedIndex"
      "UnrestrictedShare"
    ];
  }
  {
    rel = "src/systems/Types.slake";
    all = [
      "COMMON-UNIVERSE"
      "HOST-RESIDUAL"
      "PRODUCT-WIRE-RESIDUAL"
    ];
  }
];
}
