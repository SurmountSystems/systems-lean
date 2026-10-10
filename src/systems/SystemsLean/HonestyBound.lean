/-
  Module: SystemsLean.HonestyBound
  One Bool def whose binders are String and whose body is an if.
  The then-branch is false. The else-branch is a `>` check.
  `>` is a token. A missing `>` is not this def.
  This is not `let rec` and not `System.FilePath`.
  A false then-branch stays false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront

namespace SystemsLean.HonestyBound

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (isIdent isDigit parseFuel)

inductive Bound where
  | skip
  | bad
  | got (cmd : Cmd) (rest : List String)

def mem : List String -> String -> Bool
  | [], _ => false
  | y :: ys, s => y == s || mem ys s

/-- Idents up to `: String )`. The list is in source order. -/
def parseIdents (fuel : Nat) (acc : List String) (ts : List String) :
    Option (Prod (List String) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | name :: ":" :: "String" :: ")" :: rest =>
      if isIdent name then some ((name :: acc).reverse, rest) else none
    | name :: rest =>
      if isIdent name then parseIdents k (name :: acc) rest else none
    | _ => none
termination_by fuel

def asBinders (names : List String) : List (Prod Name HostType) :=
  names.map fun s => (n s, HostType.string)

/-- Then is the written false. Else is the accepted `>` form, as a Bool.
    This does not evaluate `>`. The then-branch is not rewritten to true. -/
def boundBody (cond src : String) : Term :=
  Term.ite
    (Term.proj (Term.var (n cond)) (n "isEmpty"))
    (Term.litBool false)
    (Term.litBool true)

def digitTok (s : String) : Bool :=
  match s.toList with
  | [c] => isDigit c
  | _ => false

/-- `if name.isEmpty then false else (name.splitOn name).length > d` -/
def parseIfGt (binders : List String) (ts : List String) :
    Option (Prod Term (List String)) :=
  match ts with
  | "if" :: cond :: "." :: "isEmpty" :: "then" :: "false" :: "else"
      :: "(" :: src :: "." :: "splitOn" :: arg :: ")" :: "."
      :: "length" :: ">" :: num :: rest =>
    if mem binders cond && mem binders src && mem binders arg
        && digitTok num then
      some (boundBody cond src, rest)
    else
      none
  | _ => none

/-- `def name (binders : String) : Bool :=` the if above.
    Another return type is skip, so a later def can stop on `def`. -/
def parseBoundBool (ts : List String) : Bound :=
  match ts with
  | "def" :: name :: "(" :: rest =>
    if !isIdent name then
      Bound.bad
    else
      match parseIdents parseFuel [] rest with
      | none => Bound.skip
      | some (bs, rest2) =>
        match rest2 with
        | ":" :: "Bool" :: ":=" :: rest3 =>
          if bs.isEmpty then
            Bound.bad
          else
            match parseIfGt bs rest3 with
            | none => Bound.bad
            | some (body, rest4) =>
              let cmd :=
                Cmd.defBind (n name) (asBinders bs) HostType.bool body
              Bound.got cmd rest4
        | _ => Bound.skip
  | _ => Bound.skip

end SystemsLean.HonestyBound
