/-
  SystemsLean.BootstrapHonesty stores product-path host bootstrap
  cite strings and three Bools. productPathHostLakeBootstrapRemains
  is the constant true. productPathBootstrapSurfaceOk is true when
  each string def equals the literal written in this file and remains
  is true. productPathHostLakeBootstrapPartialReady is remains and
  surfaceOk. This file has no theorem, no main, and no import. It
  does not check that Lake ran.
-/

namespace SystemsLean.BootstrapHonesty

/-- Stage id string. -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0"

/-- Host map id string. -/
def hostId : String := "HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP"

/-- Short map id string. -/
def selfHostId : String := "SELF-HOST-PRODUCT-PATH-BOOTSTRAP"

/-- Module cite string. The value is the basename, not a dotted module path. -/
def bootstrapHonestyModuleCite : String := "BootstrapHonesty"

/-- Output directory path string. -/
def productOutPath : String := "out/freestanding-c/"

/-- Path string for FreestandingEmit.lean. This file does not import it. -/
def hostLakeEmitWriterPath : String := "src/systems/SystemsLean/FreestandingEmit.lean"

/-- Executable name string. This file does not check that the executable exists. -/
def hostLakeEmitExe : String := "slake-emit-freestanding-c"

/-- Emit stage id string. -/
def hostLakeEmitStageCite : String := "SLAKE_EMIT_FREESTANDING_C_V0"

/-- Path string for self-host.md. This file does not check that file. -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Bool constant true. This file does not check that Lake bootstraps a writer. -/
def productPathHostLakeBootstrapRemains : Bool := true

/-- True when each string def equals the literal in this def and remains is true.
    This file does not define perform, ownership, or complete. -/
def productPathBootstrapSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-BOOTSTRAP")
    && (bootstrapHonestyModuleCite == "BootstrapHonesty")
    && (hostLakeEmitWriterPath == "src/systems/SystemsLean/FreestandingEmit.lean")
    && (hostLakeEmitExe == "slake-emit-freestanding-c")
    && (hostLakeEmitStageCite == "SLAKE_EMIT_FREESTANDING_C_V0")
    && (productOutPath == "out/freestanding-c/")
    && productPathHostLakeBootstrapRemains
    && (acceptancePath == "src/systems/self-host.md")

/-- True when remains and surfaceOk are both true. -/
def productPathHostLakeBootstrapPartialReady : Bool :=
  productPathHostLakeBootstrapRemains
    && productPathBootstrapSurfaceOk

end SystemsLean.BootstrapHonesty

-- This file defines no main.
