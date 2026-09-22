/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-RUST-IR-INTEROP.
  Root for optional lean --run of live RustIrInterop.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a Rust toolchain.
  Not an LLVM backend. Not FullBackend.
  Body lives in SystemsLean.HostFrontLiveRustIrInterop.
  Greppable: SystemsLean.HostFrontLiveRustIrInteropMain,
  HostFrontLiveRustIrInteropMain, HOST-FRONT-LIVE-RUST-IR-INTEROP,
  SLAKE_HOST_FRONT_LIVE_RUST_IR_INTEROP_V0,
  PARSE-LIVE-RUST-IR-INTEROP, RUST-IR-INTEROP,
  parseLiveRustIrInteropSource,
  kernelCheckLiveRustIrInteropSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveRustIrInteropMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveRustIrInterop

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveRustIrInterop.main args
