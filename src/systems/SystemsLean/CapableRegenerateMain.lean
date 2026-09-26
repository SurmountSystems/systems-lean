/-
  Thin main. Forwards argv to SystemsLean.CapableRegenerate.main.
-/

import SystemsLean.CapableRegenerate

/-- Forwards argv to SystemsLean.CapableRegenerate.main. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableRegenerate.main args
