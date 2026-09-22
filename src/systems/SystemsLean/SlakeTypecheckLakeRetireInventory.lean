/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LakeRetireInventory.
  Short role: named driver for the closed LakeRetireInventory check.
  Ready is HostFrontLiveLakeRetireInventory parse plus HostKernel.kernelCheck
  of live LakeRetireInventory.lean, not a hardcoded true, not lake build
  SystemsLean.LakeRetireInventory.
  liveRel is LakeRetireInventory.lean.
  This wrap is LakeRetireInventory.lean. It is a closed check of the
  inventory file. It is not a Lake retirement. Lake is not gone.
  stillUsesLake false in the live file is not a Lake-gone claim.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LAKE-RETIRE-INVENTORY,
  SLAKE_TYPECHECK_LAKE_RETIRE_INVENTORY, slake-typecheck-lakeretireinventory,
  slakeTypecheckLakeRetireInventoryReady,
  kernelCheckLiveLakeRetireInventorySource,
  PARSE-LIVE-LAKE-RETIRE-INVENTORY.
  Module: SystemsLean.SlakeTypecheckLakeRetireInventory
  Checkable writer: lean --run (no mill; no lake; no just recipe).
-/

import SystemsLean.HostFrontLiveLakeRetireInventory

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LAKE_RETIRE_INVENTORY"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LAKE-RETIRE-INVENTORY"

/-- Named closed-check id. Not lake build SystemsLean.LakeRetireInventory.
    Not a just recipe in this tree. -/
def justRecipeSlakeTypecheckLakeRetireInventory : String :=
  "slake-typecheck-lakeretireinventory"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLakeRetireInventoryRel : String :=
  SystemsLean.HostFrontLiveLakeRetireInventory.liveLakeRetireInventoryRel

/-- Ready names HostFrontLiveLakeRetireInventory parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLakeRetireInventoryReady,
    kernelCheckLiveLakeRetireInventorySource. -/
def slakeTypecheckLakeRetireInventoryReady : Bool :=
  SystemsLean.HostFrontLiveLakeRetireInventory.hostFrontLiveLakeRetireInventoryReady

/-- Honesty: this command is not lake build of LakeRetireInventory. -/
def slakeTypecheckLakeRetireInventoryDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLakeRetireInventoryFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLakeRetireInventoryFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLakeRetireInventoryOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LakeRetireInventory.lean.
    Ready is HostFrontLiveLakeRetireInventory.hostFrontLiveLakeRetireInventoryReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLakeRetireInventory.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLakeRetireInventory} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLakeRetireInventory.liveRel}"
  IO.println s!"  host={hostId} file={liveLakeRetireInventoryRel}"
  unless (!slakeTypecheckLakeRetireInventoryFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLakeRetireInventoryFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLakeRetireInventoryOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLakeRetireInventory.main args
