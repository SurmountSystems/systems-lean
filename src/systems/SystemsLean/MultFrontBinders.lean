/-
  Module: SystemsLean.MultFrontBinders
  Binders are one or more `( name : type )` groups.
  An atom is Mult, Nat, String, Bool, or Option on an atom.
  A type is an atom, then a `->` type, or it stops. Arrows nest right.
  `Option Nat -> Bool` is an arrow from option Nat to Bool.
  Option alone, or `->` with no codomain, is none.
  No parentheses, named types, or products.
  After the type, `)` is required. A following `(` must be another binder,
  or the whole parse is none. Otherwise return the binders and the rest.
  Recursion is on a token-list tail bound by match.
-/

import SystemsLean.HostTerm

namespace SystemsLean.MultFrontBinders

open SystemsLean.HostTerm

def wrapOpts : Nat -> HostType -> HostType
  | 0, t => t
  | n + 1, t => HostType.option (wrapOpts n t)

def foldArrows : List HostType -> HostType -> HostType
  | [], cod => cod
  | d :: ds, cod => HostType.arrow d (foldArrows ds cod)

mutual
def binderGo (ts : List String) (nameOk : String -> Bool)
    (acc : List (Prod String HostType)) :
    Option (Prod (List (Prod String HostType)) (List String)) :=
  match ts with
  | "(" :: x :: ":" :: rest =>
    if nameOk x then
      typeGo rest nameOk acc x 0 []
    else
      none
  | _ => none
termination_by ts.length

def typeGo (ts : List String) (nameOk : String -> Bool)
    (acc : List (Prod String HostType)) (x : String) (pending : Nat)
    (doms : List HostType) :
    Option (Prod (List (Prod String HostType)) (List String)) :=
  match ts with
  | "Option" :: rest =>
    typeGo rest nameOk acc x (pending + 1) doms
  | "Mult" :: rest =>
    atomGo rest nameOk acc x pending doms HostType.mult
  | "Nat" :: rest =>
    atomGo rest nameOk acc x pending doms HostType.nat
  | "String" :: rest =>
    atomGo rest nameOk acc x pending doms HostType.string
  | "Bool" :: rest =>
    atomGo rest nameOk acc x pending doms HostType.bool
  | _ => none
termination_by ts.length

def atomGo (ts : List String) (nameOk : String -> Bool)
    (acc : List (Prod String HostType)) (x : String) (pending : Nat)
    (doms : List HostType) (atom : HostType) :
    Option (Prod (List (Prod String HostType)) (List String)) :=
  match ts with
  | "->" :: rest =>
    typeGo rest nameOk acc x 0 (doms ++ [wrapOpts pending atom])
  | ")" :: "(" :: restTail =>
    let acc2 := acc ++ [(x, foldArrows doms (wrapOpts pending atom))]
    binderGo ("(" :: restTail) nameOk acc2
  | ")" :: rest3 =>
    some (acc ++ [(x, foldArrows doms (wrapOpts pending atom))], rest3)
  | _ => none
termination_by ts.length
end

def parseBindersOf (nameOk : String -> Bool) (ts : List String) :
    Option (Prod (List (Prod String HostType)) (List String)) :=
  binderGo ts nameOk []

end SystemsLean.MultFrontBinders
