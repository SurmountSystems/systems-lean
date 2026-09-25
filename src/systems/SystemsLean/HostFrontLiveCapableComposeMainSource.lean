/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableComposeMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCapableComposeMainSource.
  Not occupancy name 50. Not mill 70.
  This wrap is CapableComposeMain.lean. It is not CapableCompose.lean.
  Not a speed claim.
  No new C.
  liveRel is the bare basename CapableComposeMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveCapableComposeMainSource,
  HOST-FRONT-LIVE-CAPABLE-COMPOSE-MAIN, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableComposeMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableComposeMainParse

/-- Dual-pinned live CapableComposeMain.lean bytes (must match on-disk file).
    Greppable: liveCapableComposeMainSource,
    HOST-FRONT-LIVE-CAPABLE-COMPOSE-MAIN. -/
def liveCapableComposeMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable COMPOSE (SKELETON).
  Root for lake exe slake-freestanding-capable-compose. Body lives in
  SystemsLean.CapableCompose
  (freestandingCapableComposePlanApplyBody). Thin main so
  CapableRegenerate may import the COMPOSE API without
  top-level main clash.
  Greppable: slake-freestanding-capable-compose,
  CapableComposeMain, freestandingCapableComposePlanApplyBody,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableCompose

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableCompose.main args
"#

end SystemsLean.HostFrontLiveCapableComposeMainParse
