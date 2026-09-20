/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostPackageWrite.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePackageWriteSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-PACKAGEWRITE, livePackageWriteSource,
  HOST-FRONT-LIVE-PACKAGEWRITE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLivePackageWriteSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLivePackageWrite

/-- Dual-pinned live HostPackageWrite.lean bytes (must match on-disk file).
    Greppable: livePackageWriteSource, PARSE-LIVE-PACKAGEWRITE. -/
def livePackageWriteSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Mult-first elaborator package write with peer
  unit expand Mult+Linear+Types+Program+Graph+Compose (Track 3b-9). Side:
  classic Lean elaborator under src/systems/ (not freestanding C).

  Spec (readable):
  - Peer check / graph path drives Mult unit package write (MultSubsetEmit),
    then named unit Linear (LinearSubsetEmit), then named unit Types
    (TypesSubsetEmit), then named unit Program (ProgramSubsetEmit), then
    named unit Graph (GraphSubsetEmit), then named unit Compose
    (ComposeSubsetEmit) under the same measured dual-ok surface
    (without-Lake prebuilt hot path).
  - Measured Mult: HostFront Mult golden G1; HostGraph Mult + MultSubsetEmit
    multi-file closure; MultSubsetEmit.multSubsetEmitWrite.
  - Measured Linear expand: HostGraph Mult + MultSubsetEmit + Linear expand
    accepts; LinearSubsetEmit.linearSubsetEmitWrite; dual greps
    emit/slake_linear_subset.{h,c} SLAKE_LINEAR_SUBSET_EMIT_V0.
  - Measured Types expand: HostGraph Mult + MultSubsetEmit + Linear + Types
    expand accepts; TypesSubsetEmit.typesSubsetEmitWrite; dual greps
    emit/slake_types_subset.{h,c} SLAKE_TYPES_SUBSET_EMIT_V0.
  - Measured Program expand: HostGraph Mult + MultSubsetEmit + Linear + Types
    + Program expand accepts; ProgramSubsetEmit.programSubsetEmitWrite; dual
    greps emit/slake_program_subset.{h,c} SLAKE_PROGRAM_SUBSET_EMIT_V0.
  - Measured Graph expand: HostGraph Mult + MultSubsetEmit + Linear + Types
    + Program + Graph expand accepts; GraphSubsetEmit.graphSubsetEmitWrite;
    dual greps emit/slake_graph_subset.{h,c} SLAKE_GRAPH_SUBSET_EMIT_V0.
  - Measured Compose expand: HostGraph Mult..Compose expand accepts;
    ComposeSubsetEmit.composeSubsetEmitWrite; dual greps
    emit/slake_compose_subset.{h,c} SLAKE_COMPOSE_SUBSET_EMIT_V0.
  - Dual evidence Mult/Linear/Types/Program/Graph/Compose: Lean pins + unit
    package emit stage tokens.
  - Lake-built host binary OK (just host-package-write). Without-Lake measured:
    just host-package-write-without-lake prebuilt ELF; no lake on hot path.

  Out of scope: same-job wall-clock alone as success; full SystemsLean graph;
  host residual free claim; PROVABLY / llvm; product free / complete tip flips;
  hand product C. Selling Mult..Compose package alone as host free remains
  banned (section-4 still needs cold elaborate + bootstrap prebuild).
  hostPackageWriteGraphReady keeps Mult+MultSubsetEmit closure meaning
  (hostGraphGoodClosure); Graph unit expand uses hostPackageWriteGraphExpandReady
  / hostPackageWriteGraphPackageReady; Compose uses
  hostPackageWriteComposeExpandReady / hostPackageWriteComposePackageReady
  (no name collision).

  Theorems (HOST-PACKAGE-WRITE-THEOREM / HOST-PACKAGE-WRITE-SMOKE):
  - Live in SystemsLean.HostPackageWriteTheorems (same namespace; long-file peel).
  - hostPackageWriteG1Ready_true / Graph / Mult / Linear / Types / Program /
    GraphExpand / GraphPackage / ComposeExpand / ComposePackage ready_true
  - hostPackageWriteReady_true / FinishedClaimed / KeepsHostLake / WithoutLake*
  - hostPackageWrite_claims_false / hostPackageWrite_ids_eq + smoke examples
  These HostPackageWrite theorems do NOT set SpecProof.proofCompleteClaimed true
  and do NOT flip DualResidual host free.

  Greppable: SYSTEMS_LEAN_HOST, HOST-PACKAGE-WRITE, SLAKE_HOST_PACKAGE_WRITE,
  SLAKE_HOST_PACKAGE_WRITE_V0, HOST-HOST-PACKAGE-WRITE, hostPackageWriteReady,
  hostPackageWriteFinishedClaimed, hostPackageWriteG1Ready,
  hostPackageWriteGraphReady, hostPackageWriteMultReady,
  hostPackageWriteLinearGraphReady, hostPackageWriteLinearReady,
  hostGraphGoodLinearExpand, linearSubsetEmitWrite, SLAKE_LINEAR_SUBSET_EMIT_V0,
  slake_linear_subset.h, slake_linear_subset.c, LINEAR-EXACT-ONCE,
  hostPackageWriteTypesGraphReady, hostPackageWriteTypesReady,
  hostGraphGoodTypesExpand, typesSubsetEmitWrite, SLAKE_TYPES_SUBSET_EMIT_V0,
  slake_types_subset.h, slake_types_subset.c, TYPED_IR_V0,
  hostPackageWriteProgramGraphReady, hostPackageWriteProgramReady,
  hostGraphGoodProgramExpand, programSubsetEmitWrite,
  SLAKE_PROGRAM_SUBSET_EMIT_V0, slake_program_subset.h, slake_program_subset.c,
  IR_PROGRAM_V0, ORDERED-IR-PROGRAM,
  hostPackageWriteGraphExpandReady, hostPackageWriteGraphPackageReady,
  hostGraphGoodGraphExpand, graphSubsetEmitWrite, SLAKE_GRAPH_SUBSET_EMIT_V0,
  slake_graph_subset.h, slake_graph_subset.c, IR_GRAPH_EDGES_V0,
  hostPackageWriteComposeExpandReady, hostPackageWriteComposePackageReady,
  hostGraphGoodComposeExpand, composeSubsetEmitWrite,
  SLAKE_COMPOSE_SUBSET_EMIT_V0, slake_compose_subset.h, slake_compose_subset.c,
  HOST_COMPOSE_V0, HOST-COMPOSE,
  hostPackageWriteHostElaboratorResidualRemains,
  hostPackageWriteDoesNotClaimPeerGreen, hostPackageWriteWithoutLakeFinished,
  hostPackageWriteWithoutLakeReady, hostPackageWriteWithoutLakeKeepsHostLake,
  justRecipeWithoutLake, prebuiltHostPackageWriteRel,
  host-package-write-without-lake, HOST-PACKAGE-WRITE-WITHOUT-LAKE,
  HOST-PACKAGE-WRITE-SMOKE, HOST-PACKAGE-WRITE-THEOREM, HostPackageWriteTheorems,
  hostPackageWriteReady_true, slake-host-package-write, just host-package-write,
  multSubsetEmitWrite, SLAKE_MULT_SUBSET_EMIT_V0, slake_mult_subset.h,
  slake_mult_subset.c, hostFrontGoodG1, hostGraphGoodClosure, UNIT_SURFACE
  host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostPackageWrite
  Long-file peel: HOST-PACKAGE-WRITE-THEOREM + HOST-PACKAGE-WRITE-SMOKE in
  SystemsLean.HostPackageWriteTheorems (same namespace). Core pins + driver
  stay here.
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe / just package greps.
  Red/green: just host-package-write-without-lake (measured without-Lake);
  just host-package-write (Lake bootstrap path); lake build once for prebuilt.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Not llvm unlock.
  Host elaborator residual remains (Lake still for host develop bootstrap).
-/

import SystemsLean.HostFront
import SystemsLean.HostGraph
import SystemsLean.MultSubsetEmit
import SystemsLean.LinearSubsetEmit
import SystemsLean.TypesSubsetEmit
import SystemsLean.ProgramSubsetEmit
import SystemsLean.GraphSubsetEmit
import SystemsLean.ComposeSubsetEmit

namespace SystemsLean.HostPackageWrite

open SystemsLean.HostFront
open SystemsLean.HostGraph
open SystemsLean.MultSubsetEmit
open SystemsLean.LinearSubsetEmit
open SystemsLean.TypesSubsetEmit
open SystemsLean.ProgramSubsetEmit
open SystemsLean.GraphSubsetEmit
open SystemsLean.ComposeSubsetEmit

/-! ### HOST-PACKAGE-WRITE / SLAKE_HOST_PACKAGE_WRITE
    Peer Mult-first fragment check, Mult unit package write, Linear named unit
    package expand (Track 3b-5), Types named unit package expand (Track 3b-6),
    Program named unit package expand (Track 3b-7), Graph named unit package
    expand (Track 3b-8), then Compose named unit package expand (Track 3b-9). -/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_PACKAGE_WRITE_V0"

/-- Greppable host map id. HOST-PACKAGE-WRITE durable product token. -/
def hostId : String := "HOST-PACKAGE-WRITE"

/-- Short surface name. -/
def surfaceId : String := "HOST-PACKAGE-WRITE"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-PACKAGE-WRITE"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-package-write"

/-- just recipe name (Lake bootstrap path). -/
def justRecipe : String := "host-package-write"

/-- just recipe for without-Lake measured package write (prebuilt).
    Greppable: justRecipeWithoutLake, host-package-write-without-lake,
    HOST-PACKAGE-WRITE-WITHOUT-LAKE. -/
def justRecipeWithoutLake : String := "host-package-write-without-lake"

/-- Relative path of prebuilt host package write binary under src/systems
    (bootstrap once: lake build slake-host-package-write).
    Greppable: prebuiltHostPackageWriteRel, slake-host-package-write. -/
def prebuiltHostPackageWriteRel : String :=
  ".lake/build/bin/slake-host-package-write"

/-- Goldens: HostFront Mult G1 + HostGraph Mult-first multi-file set. -/
def goldensFrontRel : String := HostFront.goldensRel
def goldensGraphRel : String := HostGraph.goldensRel

/-- Host elaborator residual still remains (peer not green yet).
    Greppable: hostPackageWriteHostElaboratorResidualRemains. -/
def hostPackageWriteHostElaboratorResidualRemains : Bool := true

/-- Local honesty: this module is not peer elaborator green
    (package write green bar only; not same-job bench / host free). -/
def hostPackageWriteDoesNotClaimPeerGreen : Bool := true

/-- Local honesty: host develop surface still uses Lake (not product tip).
    Without-Lake measured step does not retire host develop Lake bootstrap. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostPackageWriteStillUsesLake : Bool := stillUsesLake
def hostPackageWriteDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostPackageWriteResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostPackageWriteProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostPackageWriteProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostPackageWriteLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostPackageWriteProvablyUnlocked : Bool := false

/-- Without-Lake measured step finished (prebuilt ELF; no lake on hot path).
    Greppable: hostPackageWriteWithoutLakeFinished,
    HOST-PACKAGE-WRITE-WITHOUT-LAKE. -/
def hostPackageWriteWithoutLakeFinished : Bool := true

/-! ### Structural pins (HostFront G1 + HostGraph Mult set + Mult package) -/

/-- HostFront Mult golden G1 accepts.
    Greppable: hostPackageWriteG1Ready, hostFrontGoodG1. -/
def hostPackageWriteG1Ready : Bool := hostFrontGoodG1

/-- HostGraph Mult + MultSubsetEmit multi-file closure accepts.
    Greppable: hostPackageWriteGraphReady, hostGraphGoodClosure. -/
def hostPackageWriteGraphReady : Bool := hostGraphGoodClosure

/-- Mult unit package structural ready (emit identity).
    Greppable: hostPackageWriteMultReady, multSubsetEmitReady,
    multSubsetEmitWroteExpected. -/
def hostPackageWriteMultReady : Bool :=
  multSubsetEmitReady && multSubsetEmitWroteExpected

/-- HostGraph Mult + MultSubsetEmit + Linear expand accepts.
    Greppable: hostPackageWriteLinearGraphReady, hostGraphGoodLinearExpand. -/
def hostPackageWriteLinearGraphReady : Bool := hostGraphGoodLinearExpand

/-- Linear unit package structural ready (emit identity).
    Greppable: hostPackageWriteLinearReady, linearSubsetEmitReady,
    linearSubsetEmitWroteExpected. -/
def hostPackageWriteLinearReady : Bool :=
  linearSubsetEmitReady && linearSubsetEmitWroteExpected

/-- HostGraph Mult + MultSubsetEmit + Linear + Types expand accepts.
    Greppable: hostPackageWriteTypesGraphReady, hostGraphGoodTypesExpand. -/
def hostPackageWriteTypesGraphReady : Bool := hostGraphGoodTypesExpand

/-- Types unit package structural ready (emit identity).
    Greppable: hostPackageWriteTypesReady, typesSubsetEmitReady,
    typesSubsetEmitWroteExpected. -/
def hostPackageWriteTypesReady : Bool :=
  typesSubsetEmitReady && typesSubsetEmitWroteExpected

/-- HostGraph Mult + MultSubsetEmit + Linear + Types + Program expand accepts.
    Greppable: hostPackageWriteProgramGraphReady, hostGraphGoodProgramExpand. -/
def hostPackageWriteProgramGraphReady : Bool := hostGraphGoodProgramExpand

/-- Program unit package structural ready (emit identity).
    Greppable: hostPackageWriteProgramReady, programSubsetEmitReady,
    programSubsetEmitWroteExpected. -/
def hostPackageWriteProgramReady : Bool :=
  programSubsetEmitReady && programSubsetEmitWroteExpected

/-- HostGraph Mult + MultSubsetEmit + Linear + Types + Program + Graph expand.
    Distinct from hostPackageWriteGraphReady (Mult+MultSubsetEmit closure only).
    Greppable: hostPackageWriteGraphExpandReady, hostGraphGoodGraphExpand. -/
def hostPackageWriteGraphExpandReady : Bool := hostGraphGoodGraphExpand

/-- Graph unit package structural ready (emit identity).
    Greppable: hostPackageWriteGraphPackageReady, graphSubsetEmitReady,
    graphSubsetEmitWroteExpected. -/
def hostPackageWriteGraphPackageReady : Bool :=
  graphSubsetEmitReady && graphSubsetEmitWroteExpected

/-- HostGraph Mult + MultSubsetEmit + Linear + Types + Program + Graph + Compose
    expand. Greppable: hostPackageWriteComposeExpandReady,
    hostGraphGoodComposeExpand. -/
def hostPackageWriteComposeExpandReady : Bool := hostGraphGoodComposeExpand

/-- Compose unit package structural ready (emit identity).
    Greppable: hostPackageWriteComposePackageReady, composeSubsetEmitReady,
    composeSubsetEmitWroteExpected. -/
def hostPackageWriteComposePackageReady : Bool :=
  composeSubsetEmitReady && composeSubsetEmitWroteExpected

/-- HostFront + HostGraph surfaces still ready. -/
def hostPackageWriteReusesHostSurfaces : Bool :=
  hostFrontReady && hostGraphReady

/-- Stage / exe / recipe identity pin. -/
def hostPackageWriteIdsOk : Bool :=
  (stageId == "SLAKE_HOST_PACKAGE_WRITE_V0")
    && (hostId == "HOST-PACKAGE-WRITE")
    && (surfaceId == "HOST-PACKAGE-WRITE")
    && (surfaceAlias == "HOST-HOST-PACKAGE-WRITE")
    && (lakeExeName == "slake-host-package-write")
    && (justRecipe == "host-package-write")
    && (justRecipeWithoutLake == "host-package-write-without-lake")
    && (prebuiltHostPackageWriteRel ==
      ".lake/build/bin/slake-host-package-write")
    && (goldensFrontRel == "src/systems/goldens/host-front")
    && (goldensGraphRel == "src/systems/goldens/host-graph")

/-- Without-Lake measured step keeps host Lake bootstrap (not host free).
    Greppable: hostPackageWriteWithoutLakeKeepsHostLake,
    HOST-PACKAGE-WRITE-WITHOUT-LAKE. -/
def hostPackageWriteWithoutLakeKeepsHostLake : Bool :=
  hostPackageWriteWithoutLakeFinished
    && stillUsesLake
    && dependsOnLake
    && hostPackageWriteHostElaboratorResidualRemains

/-- Local finished pin (package write green bar via elaborator Mult-first path).
    Greppable: hostPackageWriteFinishedClaimed, HOST-PACKAGE-WRITE. -/
def hostPackageWriteFinishedClaimed : Bool := true

/-- Preferred honesty: finished does not retire host develop Lake residual.
    Greppable: hostPackageWriteKeepsHostLake. -/
def hostPackageWriteKeepsHostLake : Bool :=
  hostPackageWriteFinishedClaimed && stillUsesLake && dependsOnLake

/-- End-to-end elaborator Mult + Linear + Types + Program + Graph + Compose
    package write ready. Greppable: hostPackageWriteReady, HOST-PACKAGE-WRITE,
    SLAKE_HOST_PACKAGE_WRITE_V0. -/
def hostPackageWriteReady : Bool :=
  hostPackageWriteG1Ready
    && hostPackageWriteGraphReady
    && hostPackageWriteMultReady
    && hostPackageWriteLinearGraphReady
    && hostPackageWriteLinearReady
    && hostPackageWriteTypesGraphReady
    && hostPackageWriteTypesReady
    && hostPackageWriteProgramGraphReady
    && hostPackageWriteProgramReady
    && hostPackageWriteGraphExpandReady
    && hostPackageWriteGraphPackageReady
    && hostPackageWriteComposeExpandReady
    && hostPackageWriteComposePackageReady
    && hostPackageWriteReusesHostSurfaces
    && hostPackageWriteIdsOk
    && hostPackageWriteFinishedClaimed
    && hostPackageWriteKeepsHostLake
    && stillUsesLake
    && dependsOnLake
    && hostPackageWriteStillUsesLake
    && hostPackageWriteDependsOnLake
    && hostPackageWriteHostElaboratorResidualRemains
    && hostPackageWriteDoesNotClaimPeerGreen
    && !hostPackageWriteResidualFreeClaimed
    && !hostPackageWriteProductSelfHostCompleteClaimed
    && !hostPackageWriteProofCompleteClaimed
    && !hostPackageWriteLlvmUnlocked
    && !hostPackageWriteProvablyUnlocked

/-- Without-Lake measured package-write surface ready (prebuilt hot path).
    Greppable: hostPackageWriteWithoutLakeReady,
    HOST-PACKAGE-WRITE-WITHOUT-LAKE. -/
def hostPackageWriteWithoutLakeReady : Bool :=
  hostPackageWriteReady
    && hostPackageWriteWithoutLakeFinished
    && hostPackageWriteWithoutLakeKeepsHostLake
    && (justRecipeWithoutLake == "host-package-write-without-lake")
    && (prebuiltHostPackageWriteRel ==
      ".lake/build/bin/slake-host-package-write")

/-- Ready does not claim peer elaborator green (bench / host free still open).
    Greppable: hostPackageWriteDoesNotClaimPeer. -/
def hostPackageWriteDoesNotClaimPeer : Bool :=
  hostPackageWriteReady && hostPackageWriteDoesNotClaimPeerGreen

/-- Ready keeps host elaborator residual honesty.
    Greppable: hostPackageWriteKeepsHostResidual. -/
def hostPackageWriteKeepsHostResidual : Bool :=
  hostPackageWriteReady && hostPackageWriteHostElaboratorResidualRemains

/-- Ready is not product residual free claim.
    Greppable: hostPackageWriteDoesNotMeanResidualFree. -/
def hostPackageWriteDoesNotMeanResidualFree : Bool :=
  hostPackageWriteReady && !hostPackageWriteResidualFreeClaimed


/-! ### Driver (short banners only; AGENTS driver stdout policy)

  Measured path: dual-pin HostFront G1 accept + HostGraph Mult+MultSubsetEmit
  good closure, Mult unit package write (MultSubsetEmit), HostGraph
  Mult+MultSubsetEmit+Linear expand + Linear unit package write
  (LinearSubsetEmit), HostGraph Mult+MultSubsetEmit+Linear+Types expand +
  Types unit package write (TypesSubsetEmit), HostGraph
  Mult+MultSubsetEmit+Linear+Types+Program expand + Program unit package write
  (ProgramSubsetEmit), HostGraph Mult..Graph expand + Graph unit package
  write (GraphSubsetEmit), then HostGraph Mult..Compose expand + Compose unit
  package write (ComposeSubsetEmit) and dual package stage-token greps. Reuses
  multSubsetEmitWrite / linearSubsetEmitWrite / typesSubsetEmitWrite /
  programSubsetEmitWrite / graphSubsetEmitWrite / composeSubsetEmitWrite;
  no hand product C.
-/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Require path exists. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Accept HostFront Mult golden G1 from disk (dual-pin + parse). Fail-closed.
    Greppable: acceptHostFrontG1, hostFrontGoodG1, goldens/host-front. -/
def acceptHostFrontG1 (root : System.FilePath) : IO Unit := do
  let gpath := root / goldensFrontRel / HostFront.goodG1File
  requireFile gpath "HostFront G1 Mult golden"
  let disk <- IO.FS.readFile gpath
  if disk != HostFront.goodG1Text then
    IO.eprintln s!"error: dual-pin mismatch HostFront G1: on-disk != Lean goodG1Text"
    throw (IO.userError "HostFront G1 dual-pin mismatch")
  let r := HostFront.parseSource disk
  unless HostFront.acceptOk r do
    IO.eprintln s!"error: HostFront G1 expected ACCEPT"
    throw (IO.userError "HostFront G1 accept fail")
  unless hostFrontGoodG1 do
    IO.eprintln s!"error: hostFrontGoodG1 structural false"
    throw (IO.userError "hostFrontGoodG1 false")
  IO.println s!"PASS HostFront G1 ACCEPT (Mult-first fragment)"

/-- Accept HostGraph Mult + MultSubsetEmit multi-file closure. Fail-closed.
    Greppable: acceptHostGraphMultSet, hostGraphGoodClosure, goldens/host-graph. -/
def acceptHostGraphMultSet (root : System.FilePath) : IO Unit := do
  let gdir := root / goldensGraphRel
  requireFile gdir "host-graph goldens directory"
  let multDisk <-
    HostGraph.readDualPin (gdir / HostGraph.multFile) HostGraph.multText "mult"
  let mseDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.multSubsetEmitFile)
      HostGraph.multSubsetEmitText
      "mult-subset-emit"
  let good := HostGraph.resolveSources [multDisk, mseDisk]
  unless good.isAccept do
    IO.eprintln s!"error: HostGraph Mult+MultSubsetEmit closure rejected"
    throw (IO.userError "HostGraph good closure reject")
  unless good.acceptCount == 2 do
    IO.eprintln s!"error: HostGraph expected 2 modules, got {good.acceptCount}"
    throw (IO.userError "HostGraph good closure count")
  unless hostGraphGoodClosure do
    IO.eprintln s!"error: hostGraphGoodClosure structural false"
    throw (IO.userError "hostGraphGoodClosure false")
  IO.println s!"PASS HostGraph Mult+MultSubsetEmit ACCEPT order=Mult,MultSubsetEmit"

/-- Accept HostGraph Mult + MultSubsetEmit + Linear expand. Fail-closed.
    Greppable: acceptHostGraphLinearExpand, hostGraphGoodLinearExpand. -/
def acceptHostGraphLinearExpand (root : System.FilePath) : IO Unit := do
  let gdir := root / goldensGraphRel
  requireFile gdir "host-graph goldens directory"
  let multDisk <-
    HostGraph.readDualPin (gdir / HostGraph.multFile) HostGraph.multText "mult"
  let mseDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.multSubsetEmitFile)
      HostGraph.multSubsetEmitText
      "mult-subset-emit"
  let linDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.linearFile) HostGraph.linearText "linear"
  let good := HostGraph.resolveSources [multDisk, mseDisk, linDisk]
  unless good.isAccept do
    IO.eprintln s!"error: HostGraph Mult+MultSubsetEmit+Linear expand rejected"
    throw (IO.userError "HostGraph Linear expand reject")
  unless good.acceptCount == 3 do
    IO.eprintln s!"error: HostGraph Linear expand expected 3 modules, got {good.acceptCount}"
    throw (IO.userError "HostGraph Linear expand count")
  unless hostGraphGoodLinearExpand do
    IO.eprintln s!"error: hostGraphGoodLinearExpand structural false"
    throw (IO.userError "hostGraphGoodLinearExpand false")
  unless hostPackageWriteLinearGraphReady do
    IO.eprintln s!"error: hostPackageWriteLinearGraphReady structural false"
    throw (IO.userError "hostPackageWriteLinearGraphReady false")
  IO.println s!"PASS HostGraph Mult+MultSubsetEmit+Linear ACCEPT expand"

/-- Accept HostGraph Mult + MultSubsetEmit + Linear + Types expand. Fail-closed.
    Greppable: acceptHostGraphTypesExpand, hostGraphGoodTypesExpand. -/
def acceptHostGraphTypesExpand (root : System.FilePath) : IO Unit := do
  let gdir := root / goldensGraphRel
  requireFile gdir "host-graph goldens directory"
  let multDisk <-
    HostGraph.readDualPin (gdir / HostGraph.multFile) HostGraph.multText "mult"
  let mseDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.multSubsetEmitFile)
      HostGraph.multSubsetEmitText
      "mult-subset-emit"
  let linDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.linearFile) HostGraph.linearText "linear"
  let typDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.typesFile) HostGraph.typesText "types"
  let good := HostGraph.resolveSources [multDisk, mseDisk, linDisk, typDisk]
  unless good.isAccept do
    IO.eprintln s!"error: HostGraph Mult+MultSubsetEmit+Linear+Types expand rejected"
    throw (IO.userError "HostGraph Types expand reject")
  unless good.acceptCount == 4 do
    IO.eprintln s!"error: HostGraph Types expand expected 4 modules, got {good.acceptCount}"
    throw (IO.userError "HostGraph Types expand count")
  unless hostGraphGoodTypesExpand do
    IO.eprintln s!"error: hostGraphGoodTypesExpand structural false"
    throw (IO.userError "hostGraphGoodTypesExpand false")
  unless hostPackageWriteTypesGraphReady do
    IO.eprintln s!"error: hostPackageWriteTypesGraphReady structural false"
    throw (IO.userError "hostPackageWriteTypesGraphReady false")
  IO.println s!"PASS HostGraph Mult+MultSubsetEmit+Linear+Types ACCEPT expand"

/-- Accept HostGraph Mult + MultSubsetEmit + Linear + Types + Program expand.
    Fail-closed. Greppable: acceptHostGraphProgramExpand, hostGraphGoodProgramExpand. -/
def acceptHostGraphProgramExpand (root : System.FilePath) : IO Unit := do
  let gdir := root / goldensGraphRel
  requireFile gdir "host-graph goldens directory"
  let multDisk <-
    HostGraph.readDualPin (gdir / HostGraph.multFile) HostGraph.multText "mult"
  let mseDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.multSubsetEmitFile)
      HostGraph.multSubsetEmitText
      "mult-subset-emit"
  let linDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.linearFile) HostGraph.linearText "linear"
  let typDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.typesFile) HostGraph.typesText "types"
  let progDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.programFile) HostGraph.programText "program"
  let good :=
    HostGraph.resolveSources [multDisk, mseDisk, linDisk, typDisk, progDisk]
  unless good.isAccept do
    IO.eprintln s!"error: HostGraph Mult+MultSubsetEmit+Linear+Types+Program expand rejected"
    throw (IO.userError "HostGraph Program expand reject")
  unless good.acceptCount == 5 do
    IO.eprintln s!"error: HostGraph Program expand expected 5 modules, got {good.acceptCount}"
    throw (IO.userError "HostGraph Program expand count")
  unless hostGraphGoodProgramExpand do
    IO.eprintln s!"error: hostGraphGoodProgramExpand structural false"
    throw (IO.userError "hostGraphGoodProgramExpand false")
  unless hostPackageWriteProgramGraphReady do
    IO.eprintln s!"error: hostPackageWriteProgramGraphReady structural false"
    throw (IO.userError "hostPackageWriteProgramGraphReady false")
  IO.println s!"PASS HostGraph Mult+MultSubsetEmit+Linear+Types+Program ACCEPT expand"

/-- Accept HostGraph Mult + MultSubsetEmit + Linear + Types + Program + Graph
    expand. Fail-closed. Greppable: acceptHostGraphGraphExpand,
    hostGraphGoodGraphExpand. -/
def acceptHostGraphGraphExpand (root : System.FilePath) : IO Unit := do
  let gdir := root / goldensGraphRel
  requireFile gdir "host-graph goldens directory"
  let multDisk <-
    HostGraph.readDualPin (gdir / HostGraph.multFile) HostGraph.multText "mult"
  let mseDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.multSubsetEmitFile)
      HostGraph.multSubsetEmitText
      "mult-subset-emit"
  let linDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.linearFile) HostGraph.linearText "linear"
  let typDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.typesFile) HostGraph.typesText "types"
  let progDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.programFile) HostGraph.programText "program"
  let graphDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.graphFile) HostGraph.graphText "graph"
  let good :=
    HostGraph.resolveSources
      [multDisk, mseDisk, linDisk, typDisk, progDisk, graphDisk]
  unless good.isAccept do
    IO.eprintln s!"error: HostGraph Mult+MultSubsetEmit+Linear+Types+Program+Graph expand rejected"
    throw (IO.userError "HostGraph Graph expand reject")
  unless good.acceptCount == 6 do
    IO.eprintln s!"error: HostGraph Graph expand expected 6 modules, got {good.acceptCount}"
    throw (IO.userError "HostGraph Graph expand count")
  unless hostGraphGoodGraphExpand do
    IO.eprintln s!"error: hostGraphGoodGraphExpand structural false"
    throw (IO.userError "hostGraphGoodGraphExpand false")
  unless hostPackageWriteGraphExpandReady do
    IO.eprintln s!"error: hostPackageWriteGraphExpandReady structural false"
    throw (IO.userError "hostPackageWriteGraphExpandReady false")
  IO.println s!"PASS HostGraph Mult+MultSubsetEmit+Linear+Types+Program+Graph ACCEPT expand"

/-- Accept HostGraph Mult + MultSubsetEmit + Linear + Types + Program + Graph +
    Compose expand. Fail-closed. Greppable: acceptHostGraphComposeExpand,
    hostGraphGoodComposeExpand. -/
def acceptHostGraphComposeExpand (root : System.FilePath) : IO Unit := do
  let gdir := root / goldensGraphRel
  requireFile gdir "host-graph goldens directory"
  let multDisk <-
    HostGraph.readDualPin (gdir / HostGraph.multFile) HostGraph.multText "mult"
  let mseDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.multSubsetEmitFile)
      HostGraph.multSubsetEmitText
      "mult-subset-emit"
  let linDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.linearFile) HostGraph.linearText "linear"
  let typDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.typesFile) HostGraph.typesText "types"
  let progDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.programFile) HostGraph.programText "program"
  let graphDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.graphFile) HostGraph.graphText "graph"
  let composeDisk <-
    HostGraph.readDualPin
      (gdir / HostGraph.composeFile) HostGraph.composeText "compose"
  let good :=
    HostGraph.resolveSources
      [multDisk, mseDisk, linDisk, typDisk, progDisk, graphDisk, composeDisk]
  unless good.isAccept do
    IO.eprintln s!"error: HostGraph Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose expand rejected"
    throw (IO.userError "HostGraph Compose expand reject")
  unless good.acceptCount == 7 do
    IO.eprintln s!"error: HostGraph Compose expand expected 7 modules, got {good.acceptCount}"
    throw (IO.userError "HostGraph Compose expand count")
  unless hostGraphGoodComposeExpand do
    IO.eprintln s!"error: hostGraphGoodComposeExpand structural false"
    throw (IO.userError "hostGraphGoodComposeExpand false")
  unless hostPackageWriteComposeExpandReady do
    IO.eprintln s!"error: hostPackageWriteComposeExpandReady structural false"
    throw (IO.userError "hostPackageWriteComposeExpandReady false")
  IO.println s!"PASS HostGraph Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose ACCEPT expand"

/-- Measured elaborator Mult + Linear + Types + Program + Graph + Compose
    package write. Greppable: runHostPackageWrite, HOST-PACKAGE-WRITE,
    multSubsetEmitWrite, linearSubsetEmitWrite, typesSubsetEmitWrite,
    programSubsetEmitWrite, graphSubsetEmitWrite, composeSubsetEmitWrite. -/
def runHostPackageWrite (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: elaborator Mult + Linear + Types + Program + Graph + Compose package write =="
  IO.println s!"  surface={surfaceId} host={hostId} recipe={justRecipe}"
  IO.println s!"  structuralReady={hostPackageWriteReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  IO.println s!"  hostResidual={hostPackageWriteHostElaboratorResidualRemains} withoutLake={hostPackageWriteWithoutLakeFinished}"
  IO.println s!"  withoutLakeReady={hostPackageWriteWithoutLakeReady} keepsHostLake={hostPackageWriteWithoutLakeKeepsHostLake}"
  IO.println s!"  linearReady={hostPackageWriteLinearReady} linearGraph={hostPackageWriteLinearGraphReady}"
  IO.println s!"  typesReady={hostPackageWriteTypesReady} typesGraph={hostPackageWriteTypesGraphReady}"
  IO.println s!"  programReady={hostPackageWriteProgramReady} programGraph={hostPackageWriteProgramGraphReady}"
  IO.println s!"  graphPackageReady={hostPackageWriteGraphPackageReady} graphExpand={hostPackageWriteGraphExpandReady}"
  IO.println s!"  composePackageReady={hostPackageWriteComposePackageReady} composeExpand={hostPackageWriteComposeExpandReady}"
  unless hostPackageWriteReady do
    IO.eprintln s!"error: {stageId}: hostPackageWriteReady false"
    throw (IO.userError "hostPackageWriteReady false")
  -- (1) HostFront accepts Mult golden G1.
  acceptHostFrontG1 root
  -- (2) HostGraph Mult + MultSubsetEmit multi-file set accepts.
  acceptHostGraphMultSet root
  -- (3) Mult unit package write (HOST-EMIT-MULT package; reuse MultSubsetEmit).
  multSubsetEmitWrite root
  -- (4) Dual Mult package identity (same greps as Mult package path).
  let outH := root / "src" / "systems" / "emit" / MultSubsetEmit.emitHeaderBase
  let outC := root / "src" / "systems" / "emit" / MultSubsetEmit.emitSourceBase
  requireFile outH "Mult subset header after elaborator package write"
  requireFile outC "Mult subset source after elaborator package write"
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  unless (headerWritten.splitOn "SLAKE_MULT_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Mult header missing SLAKE_MULT_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "header stage token")
  unless (sourceWritten.splitOn "SLAKE_MULT_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Mult source missing SLAKE_MULT_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "source stage token")
  -- (5) HostGraph Mult + MultSubsetEmit + Linear expand accepts.
  acceptHostGraphLinearExpand root
  -- (6) Linear unit package write (HOST-EMIT-LINEAR; reuse LinearSubsetEmit).
  linearSubsetEmitWrite root
  -- (7) Dual Linear package identity.
  let linH := root / "src" / "systems" / "emit" / LinearSubsetEmit.emitHeaderBase
  let linC := root / "src" / "systems" / "emit" / LinearSubsetEmit.emitSourceBase
  requireFile linH "Linear subset header after elaborator package write"
  requireFile linC "Linear subset source after elaborator package write"
  let linHeaderWritten <- IO.FS.readFile linH
  let linSourceWritten <- IO.FS.readFile linC
  unless (linHeaderWritten.splitOn "SLAKE_LINEAR_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Linear header missing SLAKE_LINEAR_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "linear header stage token")
  unless (linSourceWritten.splitOn "SLAKE_LINEAR_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Linear source missing SLAKE_LINEAR_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "linear source stage token")
  unless hostPackageWriteLinearReady do
    IO.eprintln s!"error: {stageId} hostPackageWriteLinearReady false"
    throw (IO.userError "hostPackageWriteLinearReady false")
  -- (8) HostGraph Mult + MultSubsetEmit + Linear + Types expand accepts.
  acceptHostGraphTypesExpand root
  -- (9) Types unit package write (HOST-EMIT-TYPES; reuse TypesSubsetEmit).
  typesSubsetEmitWrite root
  -- (10) Dual Types package identity.
  let typH := root / "src" / "systems" / "emit" / TypesSubsetEmit.emitHeaderBase
  let typC := root / "src" / "systems" / "emit" / TypesSubsetEmit.emitSourceBase
  requireFile typH "Types subset header after elaborator package write"
  requireFile typC "Types subset source after elaborator package write"
  let typHeaderWritten <- IO.FS.readFile typH
  let typSourceWritten <- IO.FS.readFile typC
  unless (typHeaderWritten.splitOn "SLAKE_TYPES_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Types header missing SLAKE_TYPES_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "types header stage token")
  unless (typSourceWritten.splitOn "SLAKE_TYPES_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Types source missing SLAKE_TYPES_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "types source stage token")
  unless hostPackageWriteTypesReady do
    IO.eprintln s!"error: {stageId} hostPackageWriteTypesReady false"
    throw (IO.userError "hostPackageWriteTypesReady false")
  -- (11) HostGraph Mult + MultSubsetEmit + Linear + Types + Program expand.
  acceptHostGraphProgramExpand root
  -- (12) Program unit package write (HOST-EMIT-PROGRAM; reuse ProgramSubsetEmit).
  programSubsetEmitWrite root
  -- (13) Dual Program package identity.
  let progH := root / "src" / "systems" / "emit" / ProgramSubsetEmit.emitHeaderBase
  let progC := root / "src" / "systems" / "emit" / ProgramSubsetEmit.emitSourceBase
  requireFile progH "Program subset header after elaborator package write"
  requireFile progC "Program subset source after elaborator package write"
  let progHeaderWritten <- IO.FS.readFile progH
  let progSourceWritten <- IO.FS.readFile progC
  unless (progHeaderWritten.splitOn "SLAKE_PROGRAM_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Program header missing SLAKE_PROGRAM_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "program header stage token")
  unless (progSourceWritten.splitOn "SLAKE_PROGRAM_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Program source missing SLAKE_PROGRAM_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "program source stage token")
  unless hostPackageWriteProgramReady do
    IO.eprintln s!"error: {stageId} hostPackageWriteProgramReady false"
    throw (IO.userError "hostPackageWriteProgramReady false")
  -- (14) HostGraph Mult + MultSubsetEmit + Linear + Types + Program + Graph.
  acceptHostGraphGraphExpand root
  -- (15) Graph unit package write (HOST-EMIT-GRAPH; reuse GraphSubsetEmit).
  graphSubsetEmitWrite root
  -- (16) Dual Graph package identity.
  let graphH := root / "src" / "systems" / "emit" / GraphSubsetEmit.emitHeaderBase
  let graphC := root / "src" / "systems" / "emit" / GraphSubsetEmit.emitSourceBase
  requireFile graphH "Graph subset header after elaborator package write"
  requireFile graphC "Graph subset source after elaborator package write"
  let graphHeaderWritten <- IO.FS.readFile graphH
  let graphSourceWritten <- IO.FS.readFile graphC
  unless (graphHeaderWritten.splitOn "SLAKE_GRAPH_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Graph header missing SLAKE_GRAPH_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "graph header stage token")
  unless (graphSourceWritten.splitOn "SLAKE_GRAPH_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Graph source missing SLAKE_GRAPH_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "graph source stage token")
  unless hostPackageWriteGraphPackageReady do
    IO.eprintln s!"error: {stageId} hostPackageWriteGraphPackageReady false"
    throw (IO.userError "hostPackageWriteGraphPackageReady false")
  -- (17) HostGraph Mult + MultSubsetEmit + Linear + Types + Program + Graph + Compose.
  acceptHostGraphComposeExpand root
  -- (18) Compose unit package write (HOST-EMIT-COMPOSE; reuse ComposeSubsetEmit).
  composeSubsetEmitWrite root
  -- (19) Dual Compose package identity.
  let composeH := root / "src" / "systems" / "emit" / ComposeSubsetEmit.emitHeaderBase
  let composeC := root / "src" / "systems" / "emit" / ComposeSubsetEmit.emitSourceBase
  requireFile composeH "Compose subset header after elaborator package write"
  requireFile composeC "Compose subset source after elaborator package write"
  let composeHeaderWritten <- IO.FS.readFile composeH
  let composeSourceWritten <- IO.FS.readFile composeC
  unless (composeHeaderWritten.splitOn "SLAKE_COMPOSE_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Compose header missing SLAKE_COMPOSE_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "compose header stage token")
  unless (composeSourceWritten.splitOn "SLAKE_COMPOSE_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Compose source missing SLAKE_COMPOSE_SUBSET_EMIT_V0 after package write"
    throw (IO.userError "compose source stage token")
  unless hostPackageWriteComposePackageReady do
    IO.eprintln s!"error: {stageId} hostPackageWriteComposePackageReady false"
    throw (IO.userError "hostPackageWriteComposePackageReady false")
  unless hostPackageWriteFinishedClaimed do
    IO.eprintln s!"error: {stageId} hostPackageWriteFinishedClaimed false"
    throw (IO.userError "hostPackageWriteFinishedClaimed false")
  unless hostPackageWriteWithoutLakeFinished do
    IO.eprintln s!"error: {stageId} hostPackageWriteWithoutLakeFinished false"
    throw (IO.userError "hostPackageWriteWithoutLakeFinished false")
  unless hostPackageWriteWithoutLakeReady do
    IO.eprintln s!"error: {stageId} hostPackageWriteWithoutLakeReady false"
    throw (IO.userError "hostPackageWriteWithoutLakeReady false")
  IO.println s!"GREEN {stageId}: HostFront G1 + Mult + Linear + Types + Program + Graph + Compose package dual-ok"
  IO.println s!"  Mult wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println s!"  Linear wrote {linH} ({linHeaderWritten.length}) {linC} ({linSourceWritten.length})"
  IO.println s!"  Types wrote {typH} ({typHeaderWritten.length}) {typC} ({typSourceWritten.length})"
  IO.println s!"  Program wrote {progH} ({progHeaderWritten.length}) {progC} ({progSourceWritten.length})"
  IO.println s!"  Graph wrote {graphH} ({graphHeaderWritten.length}) {graphC} ({graphSourceWritten.length})"
  IO.println s!"  Compose wrote {composeH} ({composeHeaderWritten.length}) {composeC} ({composeSourceWritten.length})"
  IO.println s!"  pins: hostPackageWriteReady={hostPackageWriteReady} finished={hostPackageWriteFinishedClaimed}"
  IO.println s!"  multReady={hostPackageWriteMultReady} linearReady={hostPackageWriteLinearReady} typesReady={hostPackageWriteTypesReady} programReady={hostPackageWriteProgramReady} graphPackageReady={hostPackageWriteGraphPackageReady} composePackageReady={hostPackageWriteComposePackageReady}"

/-- CLI: elaborator Mult + Linear + Types + Program + Graph + Compose package
    write under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runHostPackageWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostPackageWrite
"#

end SystemsLean.HostFrontLivePackageWrite
