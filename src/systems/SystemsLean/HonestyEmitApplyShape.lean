/-
  Module: SystemsLean.HonestyEmitApplyShape
  Accept and none witnesses for HonestyEmitApplyFront.
  The parser stays in HonestyEmitApplyFront.
  A held decide is the module. A flipped false pin is none.
  Four DualResidual imports are none. Five imports into
  DualResidualTheorems are none.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyEmitApplyFront

namespace SystemsLean.HonestyEmitApplyFront

open SystemsLean.HostTerm

def thmToyHead : String :=
  "import SystemsLean.Mult\n"
  ++ "import SystemsLean.Types\n"
  ++ "import SystemsLean.HostCompose\n"
  ++ "import SystemsLean.EmitApplyScaffold\n"
  ++ "namespace SystemsLean.EmitApply\n"

def thmToyNum : String :=
  "theorem applyCap_eq_32 : applyCap = 32 := rfl\n"

def thmToyFalse : String :=
  "theorem applyIsValid_failClosed_false : "
  ++ "applyIsValid Apply.failClosed = false := by decide\n"

def thmToyTrue : String :=
  "theorem applyOk_empty_true : "
  ++ "applyOk HostCompose.empty = true := by decide\n"

def thmToyEx : String :=
  "example : applyOk HostCompose.empty = true := by decide\n"

def thmToyEnd : String :=
  "end SystemsLean.EmitApply\n"

def thmToySrc : String :=
  thmToyHead ++ thmToyNum ++ thmToyFalse ++ thmToyTrue ++ thmToyEx
    ++ thmToyEnd

def thmBadSrc : String :=
  thmToyHead ++ thmToyNum
    ++ "theorem applyIsValid_failClosed_false : "
    ++ "applyIsValid Apply.failClosed = true := by decide\n"
    ++ thmToyTrue ++ thmToyEx ++ thmToyEnd

/-- Four DualResidual imports. The EmitApply seed is absent. -/
def thmFourSrc : String :=
  "import SystemsLean.ProductPath\n"
  ++ "import SystemsLean.InventoryClose\n"
  ++ "import SystemsLean.SelfApplyFs\n"
  ++ "import SystemsLean.LlvmHold\n"
  ++ "namespace SystemsLean.DualResidual\n"
  ++ "end SystemsLean.DualResidual\n"

/-- Five imports ending in DualResidual. Theorems namespace is none. -/
def thmFiveSrc : String :=
  "import SystemsLean.ProductPath\n"
  ++ "import SystemsLean.InventoryClose\n"
  ++ "import SystemsLean.SelfApplyFs\n"
  ++ "import SystemsLean.LlvmHold\n"
  ++ "import SystemsLean.DualResidual\n"
  ++ "namespace SystemsLean.DualResidualTheorems\n"
  ++ "end SystemsLean.DualResidualTheorems\n"

def cmdIsHeld (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.bool) (Term.litBool true) => true
  | _ => false

/-- One numeric rfl, one false decide, one held true, one example.
    rfl and the example stay out of the command list. -/
def thmToyShape : Bool :=
  match parseHonestyEmitApplyText thmToySrc with
  | some m =>
    match m.commands with
    | Cmd.importModule _ :: Cmd.importModule _ ::
        Cmd.importModule _ :: Cmd.importModule _ ::
        Cmd.namespace _ :: c ::
        Cmd.endNamespace _ :: [] =>
      cmdIsHeld c && isWellFormed m && seedHolds
    | _ => false
  | none => false

/-- Flipping the false pin to true is none. -/
def thmToyRejects : Bool :=
  match parseHonestyEmitApplyText thmBadSrc with
  | none => true
  | some _ => false

/-- The four-import sibling is none. The five-import sibling is none. -/
def thmSiblingNone : Bool :=
  match parseHonestyEmitApplyText thmFourSrc with
  | none =>
    match parseHonestyEmitApplyText thmFiveSrc with
    | none => true
    | some _ => false
  | some _ => false

end SystemsLean.HonestyEmitApplyFront
