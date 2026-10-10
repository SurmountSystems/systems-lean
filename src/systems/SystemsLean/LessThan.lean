/-
  Less-than token for the Mult front.
  The token text is "<".
  The character sequence "<;>" is that same token, then ";" and ">".
  It is not a tactic combinator and not a tactic language.
  A bare ";" or a bare ">" is not recognized here.
  Binders, `by` proofs, and `some` of a string are not this module.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.LessThan
  Module must stay ASCII.
-/

namespace SystemsLean.LessThan

/-- Less-than token text. -/
def lessTok : String := "<"

/-- Semicolon glued after lessTok inside the sequence "<;>". -/
def semiTok : String := ";"

/-- Greater-than that closes the sequence "<;>". -/
def gtTok : String := ">"

/-- After a consumed '<', take the rest of the characters.
    "<;>" yields lessTok, semiTok, gtTok in source order.
    Any other continuation yields only lessTok.
    This does not parse tactics. -/
def takeLess (rest : List Char) : Prod (List Char) (List String) :=
  match rest with
  | ';' :: '>' :: rest2 => (rest2, [lessTok, semiTok, gtTok])
  | _ => (rest, [lessTok])

end SystemsLean.LessThan
