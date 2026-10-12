/-
  Module: SystemsLean.HonestyDecideFront
  Import, then one namespace. A String def is a literal or a dotted name.
  A dotted name is not stored and not emitted.
  A lone Bool true and a lone Bool false are emitted as those Bools.
  Any other Bool is not emitted. `!` of a stored false is noted.
  `by decide` is required. `native_decide` is none.
  Theorems and examples are not emitted. A Nat literal def is none.
  The file name is not hardcoded.
  A false Bool stays false. Bool true is not a stand-in.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyStrCatFront

namespace SystemsLean.HonestyDecideFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront
  (strip SMode parseDotted parseFuel isIdent unquote)
open SystemsLean.HonestyStrCatFront (tok tokFuel TMode)

def itemFuel : Nat := 100000

structure St where
  cmds : List Cmd
  bools : List (Prod String Bool)
  sawImport : Bool
  sawTrue : Bool
  sawFalse : Bool
  sawBang : Bool
  sawNative : Bool
  sawDecide : Bool
  sawExample : Bool
  sawNat : Bool
  ns : String

def emptySt : St :=
  { cmds := []
    bools := []
    sawImport := false
    sawTrue := false
    sawFalse := false
    sawBang := false
    sawNative := false
    sawDecide := false
    sawExample := false
    sawNat := false
    ns := "" }

structure Flags where
  bang : Bool
  native : Bool
  decide : Bool

def emptyFlags : Flags :=
  { bang := false, native := false, decide := false }

def lookupBool (xs : List (Prod String Bool)) (name : String) :
    Option Bool :=
  match xs with
  | [] => none
  | (nm, b) :: rest =>
    if nm == name then some b else lookupBool rest name

def isTop (t : String) : Bool :=
  t == "def" || t == "theorem" || t == "example" || t == "end"
    || t == "import" || t == "namespace" || t == "open"
    || t == "set_option" || t == "private"

def atTop (ts : List String) : Bool :=
  match ts with
  | t :: _ => isTop t
  | [] => false

def applyFlags (st : St) (f : Flags) : St :=
  { st with
    sawBang := st.sawBang || f.bang
    sawNative := st.sawNative || f.native
    sawDecide := st.sawDecide || f.decide }

def skipScan (fuel : Nat) (depth : Nat) (f : Flags)
    (bools : List (Prod String Bool)) (ts : List String) :
    Option (Prod Flags (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] =>
      if depth == 0 then some (f, []) else none
    | t :: rest =>
      if depth == 0 && isTop t then
        some (f, ts)
      else if t == "(" then
        skipScan k (depth + 1) f bools rest
      else if t == ")" then
        let d := if depth == 0 then 0 else depth - 1
        skipScan k d f bools rest
      else if t == "native_decide" then
        skipScan k depth { f with native := true } bools rest
      else if t == "decide" then
        skipScan k depth { f with decide := true } bools rest
      else if t == "!" then
        match rest with
        | name :: _ =>
          if isIdent name && lookupBool bools name == some false then
            skipScan k depth { f with bang := true } bools rest
          else
            skipScan k depth f bools rest
        | [] =>
          skipScan k depth f bools rest
      else
        skipScan k depth f bools rest
termination_by fuel

def storeStr (st : St) (name s : String) : St :=
  let c := Cmd.def_ (n name) (some HostType.string) (Term.litString s)
  { st with cmds := c :: st.cmds }

def storeBool (st : St) (name : String) (b : Bool) : St :=
  let c := Cmd.def_ (n name) (some HostType.bool) (Term.litBool b)
  { st with
    cmds := c :: st.cmds
    bools := (name, b) :: st.bools
    sawTrue := st.sawTrue || b
    sawFalse := st.sawFalse || (!b) }

def parseQualGo (fuel : Nat) (saw : Bool) (ts : List String) :
    Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "." :: t :: rest =>
      if isIdent t && !isTop t then parseQualGo k true rest else none
    | _ =>
      if saw then some ts else none
termination_by fuel

def parseQual (fuel : Nat) (ts : List String) : Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | t :: rest =>
      if isIdent t && !isTop t then parseQualGo k false rest else none
    | [] => none

def shapeReady (st : St) : Bool :=
  st.sawImport && st.sawTrue && st.sawFalse && st.sawBang
    && st.sawDecide && st.sawExample && !st.sawNat && !st.sawNative
    && st.ns != "" && !st.cmds.isEmpty

def finish (st : St) (ts : List String) : Option Module :=
  match parseDotted parseFuel ts with
  | some (nm, rest) =>
    if nm == st.ns && rest.isEmpty && shapeReady st then
      let cmds := st.cmds.reverse ++ [Cmd.endNamespace (n st.ns)]
      let m : Module := { name := n st.ns, commands := cmds }
      if isWellFormed m then some m else none
    else
      none
  | none => none

def parseItems (fuel : Nat) (st : St) (ts : List String) : Option Module :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "import" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        let c := Cmd.importModule (n nm)
        parseItems k
          { st with sawImport := true, cmds := c :: st.cmds } rest2
      | none => none
    | "namespace" :: rest =>
      if st.ns != "" then none
      else
        match parseDotted parseFuel rest with
        | some (nm, rest2) =>
          let c := Cmd.namespace (n nm)
          parseItems k { st with ns := nm, cmds := c :: st.cmds } rest2
        | none => none
    | "open" :: rest =>
      match parseDotted parseFuel rest with
      | some (_, rest2) => parseItems k st rest2
      | none => none
    | "set_option" :: rest =>
      match skipScan k 0 emptyFlags st.bools rest with
      | some (f, rest2) => parseItems k (applyFlags st f) rest2
      | none => none
    | "private" :: rest =>
      match skipScan k 0 emptyFlags st.bools rest with
      | some (f, rest2) => parseItems k (applyFlags st f) rest2
      | none => none
    | "theorem" :: rest =>
      match skipScan k 0 emptyFlags st.bools rest with
      | some (f, rest2) => parseItems k (applyFlags st f) rest2
      | none => none
    | "example" :: rest =>
      match skipScan k 0 emptyFlags st.bools rest with
      | some (f, rest2) =>
        let st2 := applyFlags st f
        parseItems k { st2 with sawExample := true } rest2
      | none => none
    | "def" :: name :: ":" :: "Nat" :: rest =>
      if isIdent name then
        match skipScan k 0 emptyFlags st.bools rest with
        | some (f, rest2) =>
          let st2 := applyFlags st f
          parseItems k { st2 with sawNat := true } rest2
        | none => none
      else
        none
    | "def" :: name :: ":" :: "String" :: ":=" :: lit :: rest =>
      if isIdent name then
        match unquote lit with
        | some s =>
          if atTop rest then parseItems k (storeStr st name s) rest
          else
            match skipScan k 0 emptyFlags st.bools (lit :: rest) with
            | some (f, rest2) => parseItems k (applyFlags st f) rest2
            | none => none
        | none =>
          match parseQual k (lit :: rest) with
          | some rest2 =>
            if atTop rest2 then parseItems k st rest2
            else
              match skipScan k 0 emptyFlags st.bools (lit :: rest) with
              | some (f, rest2b) => parseItems k (applyFlags st f) rest2b
              | none => none
          | none =>
            match skipScan k 0 emptyFlags st.bools (lit :: rest) with
            | some (f, rest2) => parseItems k (applyFlags st f) rest2
            | none => none
      else
        none
    | "def" :: name :: ":" :: "Bool" :: ":=" :: "true" :: rest =>
      if isIdent name && atTop rest then
        parseItems k (storeBool st name true) rest
      else if isIdent name then
        match skipScan k 0 emptyFlags st.bools ("true" :: rest) with
        | some (f, rest2) => parseItems k (applyFlags st f) rest2
        | none => none
      else
        none
    | "def" :: name :: ":" :: "Bool" :: ":=" :: "false" :: rest =>
      if isIdent name && atTop rest then
        parseItems k (storeBool st name false) rest
      else if isIdent name then
        match skipScan k 0 emptyFlags st.bools ("false" :: rest) with
        | some (f, rest2) => parseItems k (applyFlags st f) rest2
        | none => none
      else
        none
    | "def" :: name :: ":" :: "Bool" :: ":=" :: rest =>
      if isIdent name then
        match skipScan k 0 emptyFlags st.bools rest with
        | some (f, rest2) => parseItems k (applyFlags st f) rest2
        | none => none
      else
        none
    | "def" :: name :: rest =>
      if isIdent name then
        match skipScan k 0 emptyFlags st.bools rest with
        | some (f, rest2) => parseItems k (applyFlags st f) rest2
        | none => none
      else
        none
    | "end" :: rest => finish st rest
    | _ => none
termination_by fuel

def parseHonestyDecideText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok tokFuel kept TMode.norm [] with
    | none => none
    | some ts => parseItems itemFuel emptySt ts

end SystemsLean.HonestyDecideFront
