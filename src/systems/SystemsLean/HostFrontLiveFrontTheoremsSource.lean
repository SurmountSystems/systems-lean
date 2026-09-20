/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostFrontTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFrontTheoremsSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-FRONT-THEOREMS, liveFrontTheoremsSource,
  HOST-FRONT-LIVE-FRONT-THEOREMS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveFrontTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveFrontTheorems

/-- Dual-pinned live HostFrontTheorems.lean bytes (must match on-disk file).
    Greppable: liveFrontTheoremsSource, PARSE-LIVE-FRONT-THEOREMS. -/
def liveFrontTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostFront HOST-FRONT-THEOREM + HOST-FRONT-SMOKE
  surface.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel from SystemsLean.HostFront: theorems and behavioral smoke live
  here; dialect parse, dual-pinned goldens, readiness pins, and golden-suite
  driver IO stay in HostFront. Same namespace SystemsLean.HostFront so theorem
  names stay unqualified under that namespace.

  Spec (readable):
  - HOST-FRONT-THEOREM: G1..G7 accept, B1..B4 reject, structural goldens,
    hostFrontReady / peer / residual honesty, claims_false, ids.
  - HOST-FRONT-SMOKE: behavioral examples over the same pins.

  Intentional non-claims:
  - Partial HostFront theorems only -- NOT SpecProof.proofCompleteClaimed.
  - NOT host residual free. NOT peer elaborator green. NOT product free flip.
  - NOT freestanding residual free. NOT PROVABLY. NOT llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT, HOST-FRONT-THEOREM, HOST-FRONT-SMOKE,
  SLAKE_HOST_FRONT_V0, hostFrontReady_true, hostFrontGoodG1_true,
  hostFrontGoodG2_true, hostFrontGoodG3_true, hostFrontGoodG4_true,
  hostFrontGoodG5_true, hostFrontGoodG6_true, hostFrontGoodG7_true,
  hostFrontBadB1_true, hostFrontBadB2_true, hostFrontBadB3_true,
  hostFrontBadB4_true, hostFrontGoldensStructuralOk_true,
  hostFrontDoesNotClaimPeer_true, hostFrontKeepsHostResidual_true,
  hostFrontDoesNotMeanResidualFree_true, hostFront_claims_false,
  hostFront_ids_eq, HostFrontTheorems, theorem hostFrontReady_true, example,
  UNIT_SURFACE host surface. Module: SystemsLean.HostFrontTheorems
  Greppable: MULT-0 (host Mult IR contract cite; theorems surface honesty).
  Red/green: just systems-host; lake build SystemsLean.HostFrontTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.HostFront

namespace SystemsLean.HostFront

/-! ### HOST-FRONT-THEOREM (readable statements, then proofs) -/

set_option maxRecDepth 8192

/-- G1 Mult fixture golden accepts.
    Greppable: hostFrontGoodG1_true, HOST-FRONT-THEOREM. -/
theorem hostFrontGoodG1_true : hostFrontGoodG1 = true := by
  native_decide

/-- G2 minimal Mult golden accepts.
    Greppable: hostFrontGoodG2_true, HOST-FRONT-THEOREM. -/
theorem hostFrontGoodG2_true : hostFrontGoodG2 = true := by
  native_decide

/-- G3 Linear-shaped golden accepts.
    Greppable: hostFrontGoodG3_true, HOST-FRONT-THEOREM. -/
theorem hostFrontGoodG3_true : hostFrontGoodG3 = true := by
  native_decide

/-- G4 Types-shaped golden accepts.
    Greppable: hostFrontGoodG4_true, HOST-FRONT-THEOREM. -/
theorem hostFrontGoodG4_true : hostFrontGoodG4 = true := by
  native_decide

/-- G5 Program-shaped golden accepts.
    Greppable: hostFrontGoodG5_true, HOST-FRONT-THEOREM. -/
theorem hostFrontGoodG5_true : hostFrontGoodG5 = true := by
  native_decide

/-- G6 Graph-shaped golden accepts.
    Greppable: hostFrontGoodG6_true, HOST-FRONT-THEOREM. -/
theorem hostFrontGoodG6_true : hostFrontGoodG6 = true := by
  native_decide

/-- G7 Compose-shaped golden accepts.
    Greppable: hostFrontGoodG7_true, HOST-FRONT-THEOREM. -/
theorem hostFrontGoodG7_true : hostFrontGoodG7 = true := by
  native_decide

/-- B1 empty rejects.
    Greppable: hostFrontBadB1_true, HOST-FRONT-THEOREM. -/
theorem hostFrontBadB1_true : hostFrontBadB1 = true := by
  native_decide

/-- B2 line shape rejects.
    Greppable: hostFrontBadB2_true, HOST-FRONT-THEOREM. -/
theorem hostFrontBadB2_true : hostFrontBadB2 = true := by
  native_decide

/-- B3 unknown command rejects.
    Greppable: hostFrontBadB3_true, HOST-FRONT-THEOREM. -/
theorem hostFrontBadB3_true : hostFrontBadB3 = true := by
  native_decide

/-- B4 zero-ctor inductive rejects.
    Greppable: hostFrontBadB4_true, HOST-FRONT-THEOREM. -/
theorem hostFrontBadB4_true : hostFrontBadB4 = true := by
  native_decide

/-- All structural goldens ok.
    Greppable: hostFrontGoldensStructuralOk_true, HOST-FRONT-THEOREM. -/
theorem hostFrontGoldensStructuralOk_true :
    hostFrontGoldensStructuralOk = true := by
  native_decide

/-- End-to-end host front ready.
    Greppable: hostFrontReady_true, HOST-FRONT-THEOREM, HOST-FRONT. -/
theorem hostFrontReady_true : hostFrontReady = true := by
  native_decide

/-- Ready does not claim peer green.
    Greppable: hostFrontDoesNotClaimPeer_true, HOST-FRONT-THEOREM. -/
theorem hostFrontDoesNotClaimPeer_true :
    hostFrontDoesNotClaimPeer = true := by
  native_decide

/-- Ready keeps host elaborator residual remains.
    Greppable: hostFrontKeepsHostResidual_true, HOST-FRONT-THEOREM. -/
theorem hostFrontKeepsHostResidual_true :
    hostFrontKeepsHostResidual = true := by
  native_decide

/-- Ready does not claim residual free.
    Greppable: hostFrontDoesNotMeanResidualFree_true, HOST-FRONT-THEOREM. -/
theorem hostFrontDoesNotMeanResidualFree_true :
    hostFrontDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty; host residual remains.
    Greppable: hostFront_claims_false, HOST-FRONT-THEOREM. -/
theorem hostFront_claims_false :
    (hostFrontResidualFreeClaimed = false)
      /\ (hostFrontProductSelfHostCompleteClaimed = false)
      /\ (hostFrontProofCompleteClaimed = false)
      /\ (hostFrontLlvmUnlocked = false)
      /\ (hostFrontProvablyUnlocked = false)
      /\ (hostFrontHostElaboratorResidualRemains = true)
      /\ (hostFrontDoesNotClaimPeerGreen = true)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl
              (And.intro rfl (And.intro rfl rfl)))))))

/-- Stage / surface / exe name pins.
    Greppable: hostFront_ids_eq, HOST-FRONT-THEOREM. -/
theorem hostFront_ids_eq :
    (stageId = "SLAKE_HOST_FRONT_V0")
      /\ (hostId = "HOST-FRONT")
      /\ (surfaceId = "HOST-FRONT")
      /\ (lakeExeName = "slake-host-front")
      /\ (justRecipe = "host-front")
      /\ (goldensRel = "src/systems/goldens/host-front") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl (And.intro rfl rfl))))

/-! ### HOST-FRONT-SMOKE (lake fails if examples fail)
    Greppable: HOST-FRONT-SMOKE, HOST-FRONT, SLAKE_HOST_FRONT_V0. -/

example : hostFrontGoodG1 = true := by native_decide
example : hostFrontGoodG2 = true := by native_decide
example : hostFrontGoodG3 = true := by native_decide
example : hostFrontGoodG4 = true := by native_decide
example : hostFrontGoodG5 = true := by native_decide
example : hostFrontGoodG6 = true := by native_decide
example : hostFrontGoodG7 = true := by native_decide
example : hostFrontBadB1 = true := by native_decide
example : hostFrontBadB2 = true := by native_decide
example : hostFrontBadB3 = true := by native_decide
example : hostFrontBadB4 = true := by native_decide
example : hostFrontReady = true := by native_decide
example : hostFrontDoesNotClaimPeer = true := by native_decide
example : hostFrontKeepsHostResidual = true := by native_decide
example : hostFrontHostElaboratorResidualRemains = true := rfl
example : hostFrontDoesNotClaimPeerGreen = true := rfl
example : hostFrontResidualFreeClaimed = false := rfl
example : hostFrontLlvmUnlocked = false := rfl
example : hostFrontProvablyUnlocked = false := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : lakeExeName = "slake-host-front" := rfl
example : justRecipe = "host-front" := rfl
example : hostId = "HOST-FRONT" := rfl
example : stageId = "SLAKE_HOST_FRONT_V0" := rfl

end SystemsLean.HostFront
"#

end SystemsLean.HostFrontLiveFrontTheorems

