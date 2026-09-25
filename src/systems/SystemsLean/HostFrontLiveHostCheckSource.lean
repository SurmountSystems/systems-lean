/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostCheck.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostCheckSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOST-CHECK, liveHostCheckSource,
  HOST-FRONT-LIVE-HOST-CHECK, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostCheckSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostCheck

/-- Dual-pinned live HostCheck.lean bytes (must match on-disk file).
    Greppable: liveHostCheckSource, PARSE-LIVE-HOST-CHECK. -/
def liveHostCheckSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Mult-first host fragment check driver
  (plan-peer-elaborator Host fragment check). Side: classic Lean elaborator
  under src/systems/ (not freestanding C).

  Spec (readable):
  - Measured check over fixed Mult-first host fragment corpus
    (HostFront goldens: G1/G2 accept, B1-B4 reject with greppable reasons).
  - Reuses SystemsLean.HostFront parse + isWellFormed (fail closed).
  - Lake-built host binary OK (step 4 just host-fragment-check).
  - Without-Lake measured step (step 5): prebuilt ELF via
    just host-fragment-check-without-lake; no lake build/exe/env on hot path.

  Out of scope: Mult package write (step 7); full Lean; host residual free claim;
  PROVABLY / llvm; product free / complete tip flips; Fragment module graph (step 6).

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRAGMENT-CHECK, SLAKE_HOST_FRAGMENT_CHECK,
  SLAKE_HOST_FRAGMENT_CHECK_V0, HOST-HOST-FRAGMENT-CHECK, hostFragmentCheckReady,
  hostFragmentCheckFinishedClaimed, hostFragmentCheckCorpusOk,
  hostFragmentCheckGoodG1, hostFragmentCheckGoodG2, hostFragmentCheckGoodG3,
  hostFragmentCheckGoodG4, hostFragmentCheckGoodG5, hostFragmentCheckGoodG6,
  hostFragmentCheckGoodG7,
  hostFragmentCheckBadB1, hostFragmentCheckBadB2, hostFragmentCheckBadB3,
  hostFragmentCheckBadB4,
  hostFragmentCheckHostElaboratorResidualRemains,
  hostFragmentCheckDoesNotClaimPeerGreen, hostFragmentCheckWithoutLakeFinished,
  hostFragmentCheckWithoutLakeReady, hostFragmentCheckWithoutLakeKeepsHostLake,
  justRecipeWithoutLake, prebuiltHostFragmentCheckRel,
  host-fragment-check-without-lake, HOST-FRAGMENT-CHECK-WITHOUT-LAKE,
  HOST-FRAGMENT-CHECK-SMOKE, HOST-FRAGMENT-CHECK-THEOREM,
  hostFragmentCheckReady_true, slake-host-fragment-check, just host-fragment-check,
  goldens/host-front, EMPTY-MODULE-FAIL-CLOSED, LINE-SHAPE, UNKNOWN-CMD,
  ZERO-CTOR-INDUCTIVE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostCheck
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins (HostFront dual-pinned goldens) +
  just host-fragment-check-without-lake over on-disk goldens (prebuilt).
  Red/green: just host-fragment-check-without-lake (measured step 5);
  just host-fragment-check (Lake bootstrap path); lake build once for prebuilt.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Not llvm unlock.
  Host elaborator residual remains (Lake still for host develop bootstrap).
-/

import SystemsLean.HostFront

namespace SystemsLean.HostCheck

open SystemsLean.HostFront

/-! ### HOST-FRAGMENT-CHECK / SLAKE_HOST_FRAGMENT_CHECK
    Measured Mult-first host fragment check (Lake-built OK). -/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRAGMENT_CHECK_V0"

/-- Greppable host map id. HOST-FRAGMENT-CHECK durable product token. -/
def hostId : String := "HOST-FRAGMENT-CHECK"

/-- Short surface name. -/
def surfaceId : String := "HOST-FRAGMENT-CHECK"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-FRAGMENT-CHECK"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-fragment-check"

/-- just recipe name (Lake bootstrap path; step 4). -/
def justRecipe : String := "host-fragment-check"

/-- just recipe for without-Lake measured check (step 5; Name A prebuilt).
    Greppable: justRecipeWithoutLake, host-fragment-check-without-lake,
    HOST-FRAGMENT-CHECK-WITHOUT-LAKE. -/
def justRecipeWithoutLake : String := "host-fragment-check-without-lake"

/-- Relative path of prebuilt host fragment check binary under src/systems
    (bootstrap once: lake build slake-host-fragment-check).
    Greppable: prebuiltHostFragmentCheckRel, slake-host-fragment-check. -/
def prebuiltHostFragmentCheckRel : String :=
  ".lake/build/bin/slake-host-fragment-check"

/-- Goldens directory (same HostFront corpus). -/
def goldensRel : String := HostFront.goldensRel

/-- Host elaborator residual still remains (peer not green yet).
    Greppable: hostFragmentCheckHostElaboratorResidualRemains. -/
def hostFragmentCheckHostElaboratorResidualRemains : Bool := true

/-- Local honesty: this module is not peer elaborator green. -/
def hostFragmentCheckDoesNotClaimPeerGreen : Bool := true

/-- Local honesty: host develop surface still uses Lake (not product tip).
    Without-Lake measured step does not retire host develop Lake bootstrap. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostFragmentCheckStillUsesLake : Bool := stillUsesLake
def hostFragmentCheckDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostFragmentCheckResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostFragmentCheckProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostFragmentCheckProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostFragmentCheckLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostFragmentCheckProvablyUnlocked : Bool := false

/-- Without-Lake measured step finished (Name A prebuilt ELF; no lake on hot path).
    Greppable: hostFragmentCheckWithoutLakeFinished, HOST-FRAGMENT-CHECK-WITHOUT-LAKE. -/
def hostFragmentCheckWithoutLakeFinished : Bool := true

/-! ### Corpus pins (reuse HostFront dual-pinned structural goldens) -/

/-- G1 Mult fixture accepts under check surface.
    Greppable: hostFragmentCheckGoodG1. -/
def hostFragmentCheckGoodG1 : Bool := hostFrontGoodG1

/-- G2 mini Mult accepts.
    Greppable: hostFragmentCheckGoodG2. -/
def hostFragmentCheckGoodG2 : Bool := hostFrontGoodG2

/-- G3 Linear-shaped accepts.
    Greppable: hostFragmentCheckGoodG3, LINEAR-EXACT-ONCE. -/
def hostFragmentCheckGoodG3 : Bool := hostFrontGoodG3

/-- G4 Types-shaped accepts.
    Greppable: hostFragmentCheckGoodG4, TYPED_IR_V0, KIND-MULT-OK. -/
def hostFragmentCheckGoodG4 : Bool := hostFrontGoodG4

/-- G5 Program-shaped accepts.
    Greppable: hostFragmentCheckGoodG5, IR_PROGRAM_V0, ORDERED-IR-PROGRAM,
    PROGRAM-FIXTURE. -/
def hostFragmentCheckGoodG5 : Bool := hostFrontGoodG5

/-- G6 Graph-shaped accepts.
    Greppable: hostFragmentCheckGoodG6, IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK,
    GRAPH-FIXTURE. -/
def hostFragmentCheckGoodG6 : Bool := hostFrontGoodG6

/-- G7 Compose-shaped accepts.
    Greppable: hostFragmentCheckGoodG7, HOST_COMPOSE_V0, HOST-COMPOSE,
    COMPOSE-FIXTURE. -/
def hostFragmentCheckGoodG7 : Bool := hostFrontGoodG7

/-- B1 empty rejects fail-closed.
    Greppable: hostFragmentCheckBadB1, EMPTY-MODULE-FAIL-CLOSED. -/
def hostFragmentCheckBadB1 : Bool := hostFrontBadB1

/-- B2 line shape rejects.
    Greppable: hostFragmentCheckBadB2, LINE-SHAPE. -/
def hostFragmentCheckBadB2 : Bool := hostFrontBadB2

/-- B3 unknown command rejects.
    Greppable: hostFragmentCheckBadB3, UNKNOWN-CMD. -/
def hostFragmentCheckBadB3 : Bool := hostFrontBadB3

/-- B4 zero-ctor inductive rejects.
    Greppable: hostFragmentCheckBadB4, ZERO-CTOR-INDUCTIVE. -/
def hostFragmentCheckBadB4 : Bool := hostFrontBadB4

/-- Full fixed Mult-first corpus structural ready (all G accept, all B reject).
    Greppable: hostFragmentCheckCorpusOk. -/
def hostFragmentCheckCorpusOk : Bool :=
  hostFragmentCheckGoodG1
    && hostFragmentCheckGoodG2
    && hostFragmentCheckGoodG3
    && hostFragmentCheckGoodG4
    && hostFragmentCheckGoodG5
    && hostFragmentCheckGoodG6
    && hostFragmentCheckGoodG7
    && hostFragmentCheckBadB1
    && hostFragmentCheckBadB2
    && hostFragmentCheckBadB3
    && hostFragmentCheckBadB4
    && hostFrontGoldensStructuralOk

/-- Stage / exe / recipe identity pin. -/
def hostFragmentCheckIdsOk : Bool :=
  (stageId == "SLAKE_HOST_FRAGMENT_CHECK_V0")
    && (hostId == "HOST-FRAGMENT-CHECK")
    && (surfaceId == "HOST-FRAGMENT-CHECK")
    && (surfaceAlias == "HOST-HOST-FRAGMENT-CHECK")
    && (lakeExeName == "slake-host-fragment-check")
    && (justRecipe == "host-fragment-check")
    && (justRecipeWithoutLake == "host-fragment-check-without-lake")
    && (prebuiltHostFragmentCheckRel ==
      ".lake/build/bin/slake-host-fragment-check")
    && (goldensRel == "src/systems/goldens/host-front")

/-- Front-end surface still ready (check builds on HostFront). -/
def hostFragmentCheckReusesHostFront : Bool := hostFrontReady

/-- Without-Lake measured step keeps host Lake bootstrap (not host free).
    Greppable: hostFragmentCheckWithoutLakeKeepsHostLake,
    HOST-FRAGMENT-CHECK-WITHOUT-LAKE. -/
def hostFragmentCheckWithoutLakeKeepsHostLake : Bool :=
  hostFragmentCheckWithoutLakeFinished
    && stillUsesLake
    && dependsOnLake
    && hostFragmentCheckHostElaboratorResidualRemains

/-- End-to-end host fragment check ready (Lake-built OK; without-Lake may also
    be finished). Greppable: hostFragmentCheckReady, HOST-FRAGMENT-CHECK,
    SLAKE_HOST_FRAGMENT_CHECK_V0. -/
def hostFragmentCheckReady : Bool :=
  hostFragmentCheckCorpusOk
    && hostFragmentCheckIdsOk
    && hostFragmentCheckReusesHostFront
    && stillUsesLake
    && dependsOnLake
    && hostFragmentCheckStillUsesLake
    && hostFragmentCheckDependsOnLake
    && hostFragmentCheckHostElaboratorResidualRemains
    && hostFragmentCheckDoesNotClaimPeerGreen
    && !hostFragmentCheckResidualFreeClaimed
    && !hostFragmentCheckProductSelfHostCompleteClaimed
    && !hostFragmentCheckProofCompleteClaimed
    && !hostFragmentCheckLlvmUnlocked
    && !hostFragmentCheckProvablyUnlocked

/-- Without-Lake measured check surface ready (prebuilt hot path + corpus).
    Greppable: hostFragmentCheckWithoutLakeReady,
    HOST-FRAGMENT-CHECK-WITHOUT-LAKE. -/
def hostFragmentCheckWithoutLakeReady : Bool :=
  hostFragmentCheckReady
    && hostFragmentCheckWithoutLakeFinished
    && hostFragmentCheckWithoutLakeKeepsHostLake
    && (justRecipeWithoutLake == "host-fragment-check-without-lake")
    && (prebuiltHostFragmentCheckRel ==
      ".lake/build/bin/slake-host-fragment-check")

/-- Step 4 finished claim: measured check surface ready under Lake bootstrap.
    Greppable: hostFragmentCheckFinishedClaimed. -/
def hostFragmentCheckFinishedClaimed : Bool := hostFragmentCheckReady

/-- Ready does not claim peer elaborator green.
    Greppable: hostFragmentCheckDoesNotClaimPeer. -/
def hostFragmentCheckDoesNotClaimPeer : Bool :=
  hostFragmentCheckReady && hostFragmentCheckDoesNotClaimPeerGreen

/-- Ready keeps host elaborator residual honesty.
    Greppable: hostFragmentCheckKeepsHostResidual. -/
def hostFragmentCheckKeepsHostResidual : Bool :=
  hostFragmentCheckReady && hostFragmentCheckHostElaboratorResidualRemains

/-- Ready is not product residual free claim.
    Greppable: hostFragmentCheckDoesNotMeanResidualFree. -/
def hostFragmentCheckDoesNotMeanResidualFree : Bool :=
  hostFragmentCheckReady && !hostFragmentCheckResidualFreeClaimed

/-- Alias of hostFragmentCheckWithoutLakeKeepsHostLake (historical name from
    when step 4 required without-Lake false). Presence greps stable.
    Greppable: hostFragmentCheckDoesNotClaimWithoutLake. -/
def hostFragmentCheckDoesNotClaimWithoutLake : Bool :=
  hostFragmentCheckWithoutLakeKeepsHostLake

/-! ### HOST-FRAGMENT-CHECK-THEOREM (readable statements, then proofs) -/

set_option maxRecDepth 8192

/-- G1 Mult fixture golden accepts under check.
    Greppable: hostFragmentCheckGoodG1_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckGoodG1_true : hostFragmentCheckGoodG1 = true := by
  native_decide

/-- G2 minimal Mult golden accepts under check.
    Greppable: hostFragmentCheckGoodG2_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckGoodG2_true : hostFragmentCheckGoodG2 = true := by
  native_decide

/-- G3 Linear-shaped golden accepts under check.
    Greppable: hostFragmentCheckGoodG3_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckGoodG3_true : hostFragmentCheckGoodG3 = true := by
  native_decide

/-- G4 Types-shaped golden accepts under check.
    Greppable: hostFragmentCheckGoodG4_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckGoodG4_true : hostFragmentCheckGoodG4 = true := by
  native_decide

/-- G5 Program-shaped golden accepts under check.
    Greppable: hostFragmentCheckGoodG5_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckGoodG5_true : hostFragmentCheckGoodG5 = true := by
  native_decide

/-- G6 Graph-shaped golden accepts under check.
    Greppable: hostFragmentCheckGoodG6_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckGoodG6_true : hostFragmentCheckGoodG6 = true := by
  native_decide

/-- G7 Compose-shaped golden accepts under check.
    Greppable: hostFragmentCheckGoodG7_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckGoodG7_true : hostFragmentCheckGoodG7 = true := by
  native_decide

/-- B1 empty rejects under check.
    Greppable: hostFragmentCheckBadB1_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckBadB1_true : hostFragmentCheckBadB1 = true := by
  native_decide

/-- B2 line shape rejects under check.
    Greppable: hostFragmentCheckBadB2_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckBadB2_true : hostFragmentCheckBadB2 = true := by
  native_decide

/-- B3 unknown command rejects under check.
    Greppable: hostFragmentCheckBadB3_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckBadB3_true : hostFragmentCheckBadB3 = true := by
  native_decide

/-- B4 zero-ctor inductive rejects under check.
    Greppable: hostFragmentCheckBadB4_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckBadB4_true : hostFragmentCheckBadB4 = true := by
  native_decide

/-- Full corpus structural ok.
    Greppable: hostFragmentCheckCorpusOk_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckCorpusOk_true :
    hostFragmentCheckCorpusOk = true := by
  native_decide

/-- End-to-end host fragment check ready.
    Greppable: hostFragmentCheckReady_true, HOST-FRAGMENT-CHECK-THEOREM,
    HOST-FRAGMENT-CHECK. -/
theorem hostFragmentCheckReady_true : hostFragmentCheckReady = true := by
  native_decide

/-- Finished claim follows ready.
    Greppable: hostFragmentCheckFinishedClaimed_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckFinishedClaimed_true :
    hostFragmentCheckFinishedClaimed = true := by
  native_decide

/-- Ready does not claim peer green.
    Greppable: hostFragmentCheckDoesNotClaimPeer_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckDoesNotClaimPeer_true :
    hostFragmentCheckDoesNotClaimPeer = true := by
  native_decide

/-- Ready keeps host elaborator residual remains.
    Greppable: hostFragmentCheckKeepsHostResidual_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckKeepsHostResidual_true :
    hostFragmentCheckKeepsHostResidual = true := by
  native_decide

/-- Ready does not claim residual free.
    Greppable: hostFragmentCheckDoesNotMeanResidualFree_true,
    HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckDoesNotMeanResidualFree_true :
    hostFragmentCheckDoesNotMeanResidualFree = true := by
  native_decide

/-- Without-Lake measured step keeps host Lake (alias theorem name stable).
    Greppable: hostFragmentCheckDoesNotClaimWithoutLake_true,
    hostFragmentCheckWithoutLakeKeepsHostLake_true, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckDoesNotClaimWithoutLake_true :
    hostFragmentCheckDoesNotClaimWithoutLake = true := by
  native_decide

/-- Without-Lake finished keeps host Lake bootstrap.
    Greppable: hostFragmentCheckWithoutLakeKeepsHostLake_true,
    HOST-FRAGMENT-CHECK-WITHOUT-LAKE, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckWithoutLakeKeepsHostLake_true :
    hostFragmentCheckWithoutLakeKeepsHostLake = true := by
  native_decide

/-- Without-Lake measured check surface ready.
    Greppable: hostFragmentCheckWithoutLakeReady_true,
    HOST-FRAGMENT-CHECK-WITHOUT-LAKE, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckWithoutLakeReady_true :
    hostFragmentCheckWithoutLakeReady = true := by
  native_decide

/-- Without-Lake finished pin true.
    Greppable: hostFragmentCheckWithoutLakeFinished_true,
    HOST-FRAGMENT-CHECK-WITHOUT-LAKE, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheckWithoutLakeFinished_true :
    hostFragmentCheckWithoutLakeFinished = true :=
  rfl

/-- Local free/complete/proof/llvm/PROVABLY honesty; without-Lake finished true;
    host residual remains; host develop Lake stays.
    Greppable: hostFragmentCheck_claims_false, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheck_claims_false :
    (hostFragmentCheckResidualFreeClaimed = false)
      /\ (hostFragmentCheckProductSelfHostCompleteClaimed = false)
      /\ (hostFragmentCheckProofCompleteClaimed = false)
      /\ (hostFragmentCheckLlvmUnlocked = false)
      /\ (hostFragmentCheckProvablyUnlocked = false)
      /\ (hostFragmentCheckWithoutLakeFinished = true)
      /\ (hostFragmentCheckHostElaboratorResidualRemains = true)
      /\ (hostFragmentCheckDoesNotClaimPeerGreen = true)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl
              (And.intro rfl
                (And.intro rfl (And.intro rfl rfl))))))))

/-- Stage / surface / exe / without-Lake recipe name pins.
    Greppable: hostFragmentCheck_ids_eq, HOST-FRAGMENT-CHECK-THEOREM. -/
theorem hostFragmentCheck_ids_eq :
    (stageId = "SLAKE_HOST_FRAGMENT_CHECK_V0")
      /\ (hostId = "HOST-FRAGMENT-CHECK")
      /\ (surfaceId = "HOST-FRAGMENT-CHECK")
      /\ (lakeExeName = "slake-host-fragment-check")
      /\ (justRecipe = "host-fragment-check")
      /\ (justRecipeWithoutLake = "host-fragment-check-without-lake")
      /\ (prebuiltHostFragmentCheckRel =
        ".lake/build/bin/slake-host-fragment-check")
      /\ (goldensRel = "src/systems/goldens/host-front") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### HOST-FRAGMENT-CHECK-SMOKE (lake fails if examples fail)
    Greppable: HOST-FRAGMENT-CHECK-SMOKE, HOST-FRAGMENT-CHECK,
    SLAKE_HOST_FRAGMENT_CHECK_V0. -/

example : hostFragmentCheckGoodG1 = true := by native_decide
example : hostFragmentCheckGoodG2 = true := by native_decide
example : hostFragmentCheckGoodG3 = true := by native_decide
example : hostFragmentCheckGoodG4 = true := by native_decide
example : hostFragmentCheckGoodG5 = true := by native_decide
example : hostFragmentCheckGoodG6 = true := by native_decide
example : hostFragmentCheckGoodG7 = true := by native_decide
example : hostFragmentCheckBadB1 = true := by native_decide
example : hostFragmentCheckBadB2 = true := by native_decide
example : hostFragmentCheckBadB3 = true := by native_decide
example : hostFragmentCheckBadB4 = true := by native_decide
example : hostFragmentCheckCorpusOk = true := by native_decide
example : hostFragmentCheckReady = true := by native_decide
example : hostFragmentCheckFinishedClaimed = true := by native_decide
example : hostFragmentCheckDoesNotClaimPeer = true := by native_decide
example : hostFragmentCheckKeepsHostResidual = true := by native_decide
example : hostFragmentCheckDoesNotClaimWithoutLake = true := by native_decide
example : hostFragmentCheckWithoutLakeKeepsHostLake = true := by native_decide
example : hostFragmentCheckWithoutLakeReady = true := by native_decide
example : hostFragmentCheckHostElaboratorResidualRemains = true := rfl
example : hostFragmentCheckDoesNotClaimPeerGreen = true := rfl
example : hostFragmentCheckResidualFreeClaimed = false := rfl
example : hostFragmentCheckLlvmUnlocked = false := rfl
example : hostFragmentCheckProvablyUnlocked = false := rfl
example : hostFragmentCheckWithoutLakeFinished = true := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : lakeExeName = "slake-host-fragment-check" := rfl
example : justRecipe = "host-fragment-check" := rfl
example : justRecipeWithoutLake = "host-fragment-check-without-lake" := rfl
example :
    prebuiltHostFragmentCheckRel =
      ".lake/build/bin/slake-host-fragment-check" :=
  rfl
example : hostId = "HOST-FRAGMENT-CHECK" := rfl
example : stageId = "SLAKE_HOST_FRAGMENT_CHECK_V0" := rfl

/-! ### Driver (short banners only; AGENTS driver stdout policy) -/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Run measured host fragment check over fixed Mult-first corpus.
    Dual evidence: on-disk goldens + Lean pins (via HostFront suite).
    Greppable: runFragmentCheck, HOST-FRAGMENT-CHECK,
    HOST-FRAGMENT-CHECK-WITHOUT-LAKE. -/
def runFragmentCheck (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: Mult-first host fragment check =="
  IO.println s!"  surface={surfaceId} host={hostId} goldens={goldensRel}"
  IO.println s!"  checkReady={hostFragmentCheckReady} finished={hostFragmentCheckFinishedClaimed}"
  IO.println s!"  hostResidual={hostFragmentCheckHostElaboratorResidualRemains} withoutLake={hostFragmentCheckWithoutLakeFinished}"
  IO.println s!"  withoutLakeReady={hostFragmentCheckWithoutLakeReady} keepsHostLake={hostFragmentCheckWithoutLakeKeepsHostLake}"
  -- Measured corpus: all G accept, all B reject (HostFront dual-pin suite).
  HostFront.runGoldenSuite root
  unless hostFragmentCheckReady do
    IO.eprintln s!"error: {stageId} hostFragmentCheckReady false"
    throw (IO.userError "hostFragmentCheckReady false")
  unless hostFragmentCheckFinishedClaimed do
    IO.eprintln s!"error: {stageId} hostFragmentCheckFinishedClaimed false"
    throw (IO.userError "hostFragmentCheckFinishedClaimed false")
  unless hostFragmentCheckWithoutLakeFinished do
    IO.eprintln s!"error: {stageId} hostFragmentCheckWithoutLakeFinished false"
    throw (IO.userError "hostFragmentCheckWithoutLakeFinished false")
  unless hostFragmentCheckWithoutLakeReady do
    IO.eprintln s!"error: {stageId} hostFragmentCheckWithoutLakeReady false"
    throw (IO.userError "hostFragmentCheckWithoutLakeReady false")
  IO.println s!"GREEN {stageId}: corpus G1/G2/G3/G4/G5/G6/G7 accept B1-B4 reject; check ready; withoutLake finished; host residual remains"

/-- CLI: run measured fragment check. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runFragmentCheck root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostCheck
"#

end SystemsLean.HostFrontLiveHostCheck
