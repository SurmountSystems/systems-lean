/-
  Module: SystemsLean.KeptForm
  Holds a mutual form, a theorem form, and a linear def form.
  keptTriple returns none when any of those three is missing.
  It returns some only when all three forms are present.
  Empty strings inside a present form still count as present.
  Missing means the Option is none, not an empty name.
  This module is unwired. It imports nothing.
  ASCII only.
-/

namespace SystemsLean.KeptForm

/-- Two declaration names taken from one mutual block. -/
structure MutualForm where
  leftName : String
  rightName : String

/-- A theorem name together with its proof text. -/
structure TheoremForm where
  theoremName : String
  proofText : String

/-- A linear def, recorded by its name. -/
structure LinearDefForm where
  defName : String

/-- All three forms, each one present. -/
structure KeptTriple where
  mutualForm : MutualForm
  theoremForm : TheoremForm
  linearDef : LinearDefForm

/-- None if any form is missing. Some only when all three are some.
    A total match. No default fills a missing form. -/
def keptTriple
    (mutualForm : Option MutualForm)
    (theoremForm : Option TheoremForm)
    (linearDef : Option LinearDefForm) : Option KeptTriple :=
  match mutualForm, theoremForm, linearDef with
  | some m, some t, some d =>
    some {
      mutualForm := m
      theoremForm := t
      linearDef := d
    }
  | none, _, _ => none
  | _, none, _ => none
  | _, _, none => none

end SystemsLean.KeptForm
