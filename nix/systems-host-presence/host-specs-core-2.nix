# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCore). Joined by parent. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsCore2 = [
    {
      rel = "src/systems/SystemsLean/EmitBody.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EMIT_BODY_V0"
        "EMIT-BODY"
        "bodyFromCompose"
        "bodyIsValid"
        "buildFragment"
        "SystemsLean.EmitBody"
        "EmitBodyScaffold"
        "import SystemsLean.EmitBodyScaffold"
        "bodyCap"
        "EMIT-BODY-SMOKE"
        "example"
        "RUNTIME-FS"
        "EMIT-BOUNDARY"
        "HOST-EMIT-SSOT"
        "emptyComposeFragmentSsot"
        "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */"
        "EMIT-BODY-THEOREM"
        "HOST-EMIT-BODY-THEOREM"
        "bodyCap_eq_256"
        "emptyComposeFragmentSsot_eq"
        "bodyOk_empty_true"
        "bodyOk_mult1_unminted_false"
        "bodyOk_mult1_minted_true"
        "bodyFromCompose_mult1_minted_buf"
        "bodyFromCompose_mult0_marked_buf"
        "bodyOk_omega_true"
        "bodyFromCompose_linear_and_erased"
        "bodyOk_mult1_spent_false"
        "bodyFromCompose_mult1_spent_failClosed"
        "bodyOk_mult1_spent_reject"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem bodyCap_eq_256"
        "theorem emptyComposeFragmentSsot_eq"
        "theorem bodyOk_empty_true"
        "theorem bodyOk_mult1_unminted_false"
        "theorem bodyOk_mult1_minted_true"
        "theorem bodyFromCompose_mult1_minted_buf"
        "theorem bodyFromCompose_mult0_marked_buf"
        "theorem bodyOk_omega_true"
        "theorem bodyFromCompose_linear_and_erased"
        "theorem bodyOk_mult1_spent_false"
        "theorem bodyFromCompose_mult1_spent_failClosed"
        "theorem bodyOk_mult1_spent_reject"
        # Host-owned freestanding emit body scaffolding (HOST-EMIT-BODY).
        "SLAKE_SELF_HOST_EMIT_BODY_V0"
        "HOST-EMIT-BODY"
        "SELF-HOST-EMIT-BODY"
        "bodyHeaderFragment"
        "bodyBodyFragment"
        "emitBodyReady"
        "EMIT-BODY-PRODUCT-SMOKE"
        "HOST-EMIT-BODY-SMOKE"
        "bodySsotArtifactPath"
        "src/systems/emit/host_emit_body_fragment.ssot.txt"
        "NON-SSOT"
        "theorem emitBodyReady_true"
      ];
      anyGroups = [
        [
          "BODY_CAP"
          "SLAKE_EMIT_BODY_CAP"
        ]
        [
          "emitBodyOk"
          "bodyHeaderHonestyOk"
        ]
      ];
    }
    {
      # EmitBodyScaffold: HOST-EMIT-BODY product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitBodyScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitBodyScaffold"
        "SystemsLean.EmitBodyScaffold"
        "SLAKE_SELF_HOST_EMIT_BODY_V0"
        "HOST-EMIT-BODY"
        "SELF-HOST-EMIT-BODY"
        "def bodyHeaderFragment : String :="
        "def bodyBodyFragment : String :="
        "def emitBodyReady : Bool :="
        "def emitBodyOk : Bool :="
        "def bodyHeaderHonestyOk : Bool :="
        "def bodyScaffoldHonestyOk : Bool :="
        "def emitBodySurfaceOk : Bool :="
        "EMIT-BODY-PRODUCT-SMOKE"
        "HOST-EMIT-BODY-SMOKE"
        "bodySsotArtifactPath"
        "src/systems/emit/host_emit_body_fragment.ssot.txt"
        "NON-SSOT"
        "theorem emitBodyReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Host-owned freestanding banner / version product C (HOST-EMIT-BANNER).
      # Scaffolding body lives on EmitBannerScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitBanner.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.EmitBanner"
        "SLAKE_SELF_HOST_EMIT_BANNER_V0"
        "HOST-EMIT-BANNER"
        "SELF-HOST-EMIT-BANNER"
        "bannerHeaderFragment"
        "bannerBodyFragment"
        "emitBannerReady"
        "EmitBannerScaffold"
        "import SystemsLean.EmitBannerScaffold"
        "EMIT-BANNER-SMOKE"
        "HOST-EMIT-BANNER-SMOKE"
        "slake_emit_version"
        "slake_unit_translation_id"
        "UNIT_TRANSLATION_V0"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "NON-SSOT"
        "UNIT_SURFACE"
        "src/systems/emit/host_emit_banner.ssot.txt"
        "src/systems/SystemsLean/EmitBanner.lean"
        "theorem emitBannerReady_true"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
      anyGroups = [
        [
          "emitBannerOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitBannerScaffold: HOST-EMIT-BANNER product scaffolding split (same namespace).
      rel = "src/systems/SystemsLean/EmitBannerScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitBannerScaffold"
        "SystemsLean.EmitBannerScaffold"
        "SLAKE_SELF_HOST_EMIT_BANNER_V0"
        "HOST-EMIT-BANNER"
        "SELF-HOST-EMIT-BANNER"
        "def bannerHeaderFragment : String :="
        "def bannerBodyFragment : String :="
        "def emitBannerReady : Bool :="
        "def emitBannerOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitBannerSurfaceOk : Bool :="
        "EMIT-BANNER-SMOKE"
        "HOST-EMIT-BANNER-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_banner.ssot.txt"
        "NON-SSOT"
        "slake_emit_version"
        "slake_unit_translation_id"
        "UNIT_TRANSLATION_V0"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "theorem emitBannerReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Dual SSOT equality gate: FreestandingEmit fail-closed SSOT == Lean fragments.
      # (load helpers peeled to FreestandingEmitLoad; greppable pins stay on writer.)
      rel = "src/systems/SystemsLean/FreestandingEmit.lean";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "DUAL-SSOT-EQUALITY"
        "dualSsotBlockEqual"
        "requireDualSsotEqual"
        "dualSsotEqualityLive"
        "bannerHeaderFragment"
        "multHeaderFragment"
        "linearHeaderFragment"
        "erasureHeaderFragment"
        "extractHeaderFragment"
        "typesHeaderFragment"
        "programHeaderFragment"
        "graphHeaderFragment"
        "composeHeaderFragment"
        "planHeaderFragment"
        "applyHeaderFragment"
        "bodyHeaderFragment"
        "FreestandingEmitLoad"
        "product residual free"
        "not PROVABLY"
      ];
    }
    {
      # FreestandingEmitLoad: SSOT load peel (stageId + Body/Banner + Dual SSOT).
      rel = "src/systems/SystemsLean/FreestandingEmitLoad.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "FreestandingEmitLoad"
        "FreestandingEmitLoadScaffold"
        "def stageId : String := \"SLAKE_EMIT_FREESTANDING_C_V0\""
        "def loadBodySsot"
        "def loadBannerSsot"
        "def requireDualSsotEqual"
        "dualSsotBlockEqual"
        "dualSsotEqualityLive"
        "DUAL-SSOT-EQUALITY"
        "UNIT_SURFACE"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # First QTT use-check surface: ConsumeToken exact-once usage log.
      # Second: UnrestrictedShare omega (drop / once / share all ok).
      # Not all-types use-check. Not HostCompose live-flag. Not Idris LinearCheck.
      rel = "src/systems/SystemsLean/UseCheck.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "QTT-USE-CHECK-CONSUME-TOKEN"
        "QTT-USE-CHECK-UNRESTRICTED-SHARE"
        "SystemsLean.UseCheck"
        "ConsumeToken"
        "UnrestrictedShare"
        "MULT-1"
        "MULT-OMEGA"
        "checkConsumeToken"
        "checkUnrestrictedShare"
        "theorem checkConsumeToken_drop"
        "theorem checkConsumeToken_ok"
        "theorem checkConsumeToken_doubleSpend"
        "theorem checkUnrestrictedShare_drop"
        "theorem checkUnrestrictedShare_once"
        "theorem checkUnrestrictedShare_share"
        "consumeTokenUseCheckReady"
        "unrestrictedShareUseCheckReady"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Indexed MULT-1 OnceRes: second consume is not well-typed (not UseCheck log).
      rel = "src/systems/SystemsLean/LinearUseFail.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "LINEAR-USE-FAIL"
        "ILLEGAL-LINEAR-USE-FAIL"
        "SystemsLean.LinearUseFail"
        "OnceRes"
        "consume"
        "def bind"
        "IllegalSeq"
        "CanSeq"
        "BindLeftUnit"
        "BindRightUnit"
        "BindAssoc"
        "ConsumeThenKeepEq"
        "KeepThenConsumeEq"
        "ConsumeKeepCommute"
        "BindCongr"
        "CanSeqIff"
        "CanSeqFalseIff"
        "CanSeqKeepKeepTrueIff"
        "CanSeqKeepKeepFalseIff"
        "CanSeqConsumeKeepTrueIff"
        "CanSeqKeepConsumeTrueIff"
        "CanSeqKeepConsumeFalseIff"
        "CanSeqConsumeKeepFalseIff"
        "illegalLinearUseFailReady"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Theorems for indexed MULT-1 OnceRes (same namespace LinearUseFail).
      # Bind / onceUse / illegalSeq / early consume/consume false stay here.
      # Later canSeq: LinearUseFail/CanSeq Keep Consume Decide.
      rel = "src/systems/SystemsLean/LinearUseFailTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "LINEAR-USE-FAIL"
        "SystemsLean.LinearUseFail"
        "theorem onceUse_ok"
        "theorem canSeq_consume_consume_false"
        "theorem bind_consume_keep_ok"
        "theorem illegalSeq_uninh"
        "theorem bind_left_unit"
        "theorem bind_right_unit"
        "theorem bind_assoc"
        "theorem bind_consume_keep_eq_consume"
        "theorem bind_keep_consume_eq_consume"
        "theorem bind_consume_keep_commute"
        "theorem bind_congr"
        "theorem illegalLinearUseFailReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # canSeq iff (same namespace LinearUseFail).
      rel = "src/systems/SystemsLean/LinearUseFail/CanSeq.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "LINEAR-USE-FAIL"
        "SystemsLean.LinearUseFail"
        "theorem canSeq_iff"
        "theorem canSeq_false_iff"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # keep/keep canSeq algebra (same namespace LinearUseFail).
      rel = "src/systems/SystemsLean/LinearUseFail/Keep.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "LINEAR-USE-FAIL"
        "SystemsLean.LinearUseFail"
        "theorem canSeq_keep_keep_true"
        "theorem canSeq_keep_zero_keep_one_false"
        "theorem canSeq_keep_one_keep_zero_false"
        "theorem canSeq_keep_keep_neq_false"
        "theorem canSeq_keep_keep_true_iff"
        "theorem canSeq_keep_keep_false_iff"
        "theorem canSeq_keep_keep_eq_true"
        "theorem canSeq_keep_keep_true_eq"
        "theorem canSeq_keep_keep_false_neq"
        "theorem canSeq_keep_keep_true_symm"
        "theorem canSeq_keep_keep_false_symm"
        "theorem canSeq_keep_keep_comm"
        "theorem canSeq_keep_keep_trans"
        "theorem canSeq_keep_keep_cancel"
        "theorem canSeq_keep_keep_rcancel"
        "theorem canSeq_keep_keep_rcancel_false"
        "theorem canSeq_keep_keep_cancel_false"
        "theorem canSeq_keep_keep_trans_false"
        "theorem canSeq_keep_keep_rtrans_false"
        "theorem canSeq_keep_keep_congr"
        "theorem canSeq_keep_keep_rcongr"
        "theorem canSeq_keep_keep_congr2"
        "theorem canSeq_keep_keep_rcongr2"
        "theorem canSeq_keep_keep_lrcongr2"
        "theorem canSeq_keep_keep_rlcongr2"
        "theorem canSeq_keep_keep_decide"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # consume/keep canSeq duals (same namespace LinearUseFail).
      rel = "src/systems/SystemsLean/LinearUseFail/Consume.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "LINEAR-USE-FAIL"
        "SystemsLean.LinearUseFail"
        "theorem canSeq_consume_keep_true"
        "theorem canSeq_keep_consume_true"
        "theorem canSeq_keep_zero_consume_false"
        "theorem canSeq_consume_keep_one_false"
        "theorem canSeq_consume_keep_true_iff"
        "theorem canSeq_keep_consume_true_iff"
        "theorem canSeq_keep_consume_false_iff"
        "theorem canSeq_consume_keep_false_iff"
        "theorem canSeq_consume_keep_neq_false"
        "theorem canSeq_keep_consume_neq_false"
        "theorem canSeq_consume_keep_eq_true"
        "theorem canSeq_keep_consume_eq_true"
        "theorem canSeq_consume_keep_false_neq"
        "theorem canSeq_keep_consume_false_neq"
        "theorem canSeq_consume_keep_true_eq"
        "theorem canSeq_keep_consume_true_eq"
        "theorem canSeq_consume_keep_decide"
        "theorem canSeq_keep_consume_decide"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # consume/consume canSeq decide facts (same namespace LinearUseFail).
      rel = "src/systems/SystemsLean/LinearUseFail/Decide.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "LINEAR-USE-FAIL"
        "SystemsLean.LinearUseFail"
        "theorem canSeq_consume_consume_decide"
        "theorem canSeq_consume_consume_true_iff"
        "theorem canSeq_consume_consume_false_iff"
        "theorem canSeq_consume_consume_neq_false"
        "theorem canSeq_consume_consume_eq_true"
        "theorem canSeq_consume_consume_true_eq"
        "theorem canSeq_consume_consume_false_neq"
        "theorem canSeq_consume_consume_false_eq"
        "theorem canSeq_consume_consume_true_neq"
        "theorem canSeq_consume_consume_neq_true"
        "theorem canSeq_consume_consume_decide_eq"
        "theorem canSeq_consume_consume_decide_eq_false"
        "theorem canSeq_consume_consume_decide_false_eq"
        "theorem canSeq_consume_consume_decide_true_neq"
        "theorem canSeq_consume_consume_decide_neq_true"
        "theorem canSeq_consume_consume_decide_true_iff"
        "theorem canSeq_consume_consume_decide_false_iff"
        "theorem canSeq_consume_consume_decide_neq_false"
        "theorem canSeq_consume_consume_decide_eq_true"
        "theorem canSeq_consume_consume_decide_true_eq"
        "theorem canSeq_consume_consume_decide_false_neq"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # consume/consume not-eq-not mix duals (same namespace LinearUseFail).
      rel = "src/systems/SystemsLean/LinearUseFail/NotEqNot.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "LINEAR-USE-FAIL"
        "SystemsLean.LinearUseFail"
        "theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_symm"
        "theorem canSeq_consume_consume_one_zero_comm_congr_not_eq_not_comm"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # FreestandingEmitLoadScaffold: Mult..Apply unit SSOT loaders (same namespace).
      rel = "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "FreestandingEmitLoadScaffold"
        "SystemsLean.FreestandingEmitLoadScaffold"
        "def loadMultSsot"
        "def loadPlanSsot"
        "def loadApplySsot"
        "HOST-EMIT-MULT"
        "HOST-EMIT-PLAN"
        "HOST-EMIT-APPLY"
        "UNIT_SURFACE"
        "not residual free"
        "not PROVABLY"
      ];
    }
  ];
}
