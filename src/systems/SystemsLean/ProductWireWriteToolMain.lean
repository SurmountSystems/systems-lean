/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Path A product-wire
  freestanding writer tool C emit (bootstrap). Root for lake exe
  slake-product-wire-fs-write-tool. Body lives in
  SystemsLean.ProductWireWriteTool (productWireFsWriterEmit). Measured product
  wire WRITE uses host-cc bin, not this Lake exe. Not freestanding Mult compiler.
  Greppable: SystemsLean.ProductWireWriteToolMain, slake-product-wire-fs-write-tool,
  ProductWireWriteToolMain, PRODUCT-WIRE-FS-WRITE-TOOL, PRODUCT-WIRE-FS-WRITE,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ProductWireWriteToolMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.ProductWireWriteTool

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProductWireWriteTool.main args
