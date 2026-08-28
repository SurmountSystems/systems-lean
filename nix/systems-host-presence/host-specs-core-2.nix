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
