/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.RustIrInterop.
  Short role: named driver for just slake-typecheck-rustirinterop.
  Ready is HostFrontLiveRustIrInterop parse plus HostKernel.kernelCheck
  of live RustIrInterop.lean, not a hardcoded true, not lake build
  SystemsLean.RustIrInterop.
  liveRel is RustIrInterop.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a Rust toolchain. Not an LLVM backend. Not FullBackend.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-RUST-IR-INTEROP,
  SLAKE_TYPECHECK_RUST_IR_INTEROP_V0, slake-typecheck-rustirinterop,
  slakeTypecheckRustIrInteropReady,
  kernelCheckLiveRustIrInteropSource,
  PARSE-LIVE-RUST-IR-INTEROP, SKELETON.
  Module: SystemsLean.SlakeTypecheckRustIrInterop
  Checkable writer: just slake-typecheck-rustirinterop
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveRustIrInterop

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_RUST_IR_INTEROP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-RUST-IR-INTEROP"

/-- Named just recipe. Not lake build SystemsLean.RustIrInterop. -/
def justRecipeSlakeTypecheckRustIrInterop : String :=
  "slake-typecheck-rustirinterop"

/-- Live file relative to repo root. Dual-pin path. -/
def liveRustIrInteropRel : String :=
  SystemsLean.HostFrontLiveRustIrInterop.liveRustIrInteropRel

/-- Ready names HostFrontLiveRustIrInterop parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckRustIrInteropReady,
    kernelCheckLiveRustIrInteropSource. -/
def slakeTypecheckRustIrInteropReady : Bool :=
  SystemsLean.HostFrontLiveRustIrInterop.hostFrontLiveRustIrInteropReady

/-- Honesty: this command is not lake build of RustIrInterop. -/
def slakeTypecheckRustIrInteropDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckRustIrInteropFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckRustIrInteropOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live RustIrInterop.lean.
    Ready is HostFrontLiveRustIrInterop.hostFrontLiveRustIrInteropReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveRustIrInterop.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckRustIrInterop} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveRustIrInterop.liveRel}"
  IO.println s!"  host={hostId} file={liveRustIrInteropRel}"
  unless (!slakeTypecheckRustIrInteropFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckRustIrInteropOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveRustIrInterop.main args
