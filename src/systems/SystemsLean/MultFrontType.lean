/-
  Module: SystemsLean.MultFrontType
  A type is an atom, then an optional `->` type. Arrows nest right.
  An atom is Mult, Nat, String, Bool, or Option on an atom.
  `Option Nat -> Bool` is an arrow from option Nat to Bool.
  Option alone, or `->` with no codomain, is none.
  Tokens after a finished type stay in the remainder.
  No parentheses, named types, or products.
  Recursion is on a token-list tail bound by match.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.MultFrontBinders

namespace SystemsLean.MultFrontType

open SystemsLean.HostTerm
open SystemsLean.MultFrontBinders (wrapOpts foldArrows)

mutual
def typeGo (ts : List String) (pending : Nat) (doms : List HostType) :
    Option (Prod HostType (List String)) :=
  match ts with
  | "Option" :: rest =>
    typeGo rest (pending + 1) doms
  | "Mult" :: rest =>
    atomGo rest pending doms HostType.mult
  | "Nat" :: rest =>
    atomGo rest pending doms HostType.nat
  | "String" :: rest =>
    atomGo rest pending doms HostType.string
  | "Bool" :: rest =>
    atomGo rest pending doms HostType.bool
  | _ => none
termination_by ts.length

def atomGo (ts : List String) (pending : Nat) (doms : List HostType)
    (atom : HostType) : Option (Prod HostType (List String)) :=
  match ts with
  | "->" :: rest =>
    typeGo rest 0 (doms ++ [wrapOpts pending atom])
  | _ =>
    some (foldArrows doms (wrapOpts pending atom), ts)
termination_by ts.length
end

def parseTypeOf (ts : List String) : Option (Prod HostType (List String)) :=
  typeGo ts 0 []

end SystemsLean.MultFrontType
