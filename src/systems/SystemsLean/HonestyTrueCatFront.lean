/-
  Module: SystemsLean.HonestyTrueCatFront
  Import, then one namespace. String literals may be joined by `++`.
  A lone Bool true and a lone Bool false are emitted as those Bools.
  `!` of a stored false reduces to true. That is a real reduction.
  A chain with an unknown name is not emitted and not stored.
  Bool true is not a stand-in for an unreduced chain.
  A false Bool stays false. Theorems and examples are not emitted.
  `native_decide` and `example` are required and are not emitted.
  A Nat literal def is none. The file name is not hardcoded.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyStrCatFront
import SystemsLean.DiaphenesNsAtoms

namespace SystemsLean.HonestyTrueCatFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront
  (strip SMode parseDotted parseFuel isIdent unquote lookupStr)
open SystemsLean.HonestyStrCatFront (tok tokFuel TMode)

def itemFuel : Nat := 100000

structure St where
  cmds : List Cmd
  strs : List (Prod String String)
  bools : List (Prod String Bool)
  sawImport : Bool
  sawCat : Bool
  sawTrue : Bool
  sawFalse : Bool
  sawBang : Bool
  sawNative : Bool
  sawExample : Bool
  sawNat : Bool
  ns : String

def emptySt : St :=
  { cmds := []
    strs := []
    bools := []
    sawImport := false
    sawCat := false
    sawTrue := false
    sawFalse := false
    sawBang := false
    sawNative := false
    sawExample := false
    sawNat := false
    ns := "" }

structure Flags where
  bang : Bool
  native : Bool
  cat : Bool

def emptyFlags : Flags :=
  { bang := false, native := false, cat := false }

structure Atom where
  val : Option Bool
  bang : Bool
  cat : Bool
  rest : List String

structure CatR where
  text : Option String
  cat : Bool
  rest : List String

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
    sawCat := st.sawCat || f.cat }

def skipNote (fuel : Nat) (depth : Nat) (f : Flags)
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
        skipNote k (depth + 1) f bools rest
      else if t == ")" then
        let d := if depth == 0 then 0 else depth - 1
        skipNote k d f bools rest
      else if t == "++" then
        skipNote k depth { f with cat := true } bools rest
      else if t == "native_decide" then
        skipNote k depth { f with native := true } bools rest
      else if t == "!" then
        match rest with
        | name :: _ =>
          if isIdent name && lookupBool bools name == some false then
            skipNote k depth { f with bang := true } bools rest
          else
            skipNote k depth f bools rest
        | [] =>
          skipNote k depth f bools rest
      else
        skipNote k depth f bools rest
termination_by fuel

def afterSkip (fuel : Nat) (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match skipNote fuel 0 emptyFlags st.bools ts with
  | none => none
  | some (f, rest) => some (applyFlags st f, rest)

def parsePiece (st : St) (ts : List String) :
    Option (Prod (Option String) (List String)) :=
  match ts with
  | t :: rest =>
    match unquote t with
    | some s => some (some s, rest)
    | none =>
      if isIdent t && !isTop t then
        match lookupStr st.strs t with
        | some s => some (some s, rest)
        | none => some (none, rest)
      else
        none
  | [] => none

def parseCatGo (fuel : Nat) (acc : String) (known saw : Bool)
    (st : St) (ts : List String) : Option CatR :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "++" :: rest =>
      match parsePiece st rest with
      | none => none
      | some (some s, rest2) =>
        if known then
          parseCatGo k (acc ++ s) true true st rest2
        else
          parseCatGo k acc false true st rest2
      | some (none, rest2) =>
        parseCatGo k acc false true st rest2
    | _ =>
      if known then some { text := some acc, cat := saw, rest := ts }
      else some { text := none, cat := saw, rest := ts }
termination_by fuel

def parseCat (fuel : Nat) (st : St) (ts : List String) : Option CatR :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match parsePiece st ts with
    | none => none
    | some (some s, rest) => parseCatGo k s true false st rest
    | some (none, rest) => parseCatGo k "" false false st rest

def parseEq (fuel : Nat) (st : St) (name : String) (ts : List String) :
    Option Atom :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "true" :: ")" :: rest =>
      match lookupBool st.bools name with
      | some b =>
        some { val := some b, bang := false, cat := false, rest := rest }
      | none =>
        some { val := none, bang := false, cat := false, rest := rest }
    | "false" :: ")" :: rest =>
      match lookupBool st.bools name with
      | some b =>
        some { val := some (!b), bang := false, cat := false, rest := rest }
      | none =>
        some { val := none, bang := false, cat := false, rest := rest }
    | _ =>
      match parseCat k st ts with
      | none => none
      | some got =>
        match got.rest with
        | ")" :: rest =>
          match got.text, lookupStr st.strs name with
          | some s, some want =>
            some
              { val := some (s == want)
                bang := false
                cat := got.cat
                rest := rest }
          | _, _ =>
            some
              { val := none
                bang := false
                cat := got.cat
                rest := rest }
        | _ => none

def parseAtom (fuel : Nat) (st : St) (ts : List String) : Option Atom :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "!" :: name :: rest =>
      if isIdent name then
        match lookupBool st.bools name with
        | some false =>
          some { val := some true, bang := true, cat := false, rest := rest }
        | some true =>
          some { val := some false, bang := false, cat := false, rest := rest }
        | none =>
          some { val := none, bang := false, cat := false, rest := rest }
      else
        none
    | "true" :: rest =>
      some { val := some true, bang := false, cat := false, rest := rest }
    | "false" :: rest =>
      some { val := some false, bang := false, cat := false, rest := rest }
    | "(" :: name :: "==" :: rest =>
      if isIdent name then parseEq k st name rest else none
    | name :: rest =>
      if isIdent name && !isTop name then
        match lookupBool st.bools name with
        | some b =>
          some { val := some b, bang := false, cat := false, rest := rest }
        | none =>
          some { val := none, bang := false, cat := false, rest := rest }
      else
        none
    | _ => none

def joinB (a b : Option Bool) : Option Bool :=
  match a, b with
  | some x, some y => some (x && y)
  | _, _ => none

def parseChain (fuel : Nat) (st : St) (acc : Option Bool) (bang cat : Bool)
    (ts : List String) : Option Atom :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "&&" :: rest =>
      match parseAtom k st rest with
      | none => none
      | some a =>
        parseChain k st (joinB acc a.val) (bang || a.bang) (cat || a.cat)
          a.rest
    | _ =>
      some { val := acc, bang := bang, cat := cat, rest := ts }
termination_by fuel

def parseBool (fuel : Nat) (st : St) (ts : List String) : Option Atom :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match parseAtom k st ts with
    | none => none
    | some a => parseChain k st a.val a.bang a.cat a.rest

def storeStr (st : St) (name s : String) (cat : Bool) : St :=
  let c := Cmd.def_ (n name) (some HostType.string) (Term.litString s)
  { st with
    cmds := c :: st.cmds
    strs := (name, s) :: st.strs
    sawCat := st.sawCat || cat }

def storeBool (st : St) (name : String) (b bang cat : Bool) : St :=
  let c := Cmd.def_ (n name) (some HostType.bool) (Term.litBool b)
  { st with
    cmds := c :: st.cmds
    bools := (name, b) :: st.bools
    sawTrue := st.sawTrue || b
    sawFalse := st.sawFalse || (!b)
    sawBang := st.sawBang || bang
    sawCat := st.sawCat || cat }

def noteAtom (st : St) (bang cat : Bool) : St :=
  { st with
    sawBang := st.sawBang || bang
    sawCat := st.sawCat || cat }

def shapeReady (st : St) : Bool :=
  st.sawImport && st.sawCat && st.sawTrue && st.sawFalse && st.sawBang
    && st.sawNative && st.sawExample && !st.sawNat && st.ns != ""
    && !st.cmds.isEmpty

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
      match afterSkip k st rest with
      | some (st2, rest2) => parseItems k st2 rest2
      | none => none
    | "private" :: rest =>
      match afterSkip k st rest with
      | some (st2, rest2) => parseItems k st2 rest2
      | none => none
    | "theorem" :: rest =>
      match afterSkip k st rest with
      | some (st2, rest2) => parseItems k st2 rest2
      | none => none
    | "example" :: rest =>
      match afterSkip k st rest with
      | some (st2, rest2) =>
        parseItems k { st2 with sawExample := true } rest2
      | none => none
    | "def" :: name :: ":" :: "Nat" :: rest =>
      if isIdent name then
        match afterSkip k st rest with
        | some (st2, rest2) =>
          parseItems k { st2 with sawNat := true } rest2
        | none => none
      else
        none
    | "def" :: name :: ":" :: "String" :: ":=" :: rest =>
      if isIdent name then
        match parseCat k st rest with
        | some got =>
          if atTop got.rest then
            match got.text with
            | some s => parseItems k (storeStr st name s got.cat) got.rest
            | none =>
              parseItems k (noteAtom st false got.cat) got.rest
          else
            match afterSkip k st rest with
            | some (st2, rest2) => parseItems k st2 rest2
            | none => none
        | none =>
          match afterSkip k st rest with
          | some (st2, rest2) => parseItems k st2 rest2
          | none => none
      else
        none
    | "def" :: name :: ":" :: "Bool" :: ":=" :: rest =>
      if isIdent name then
        match parseBool k st rest with
        | some a =>
          if atTop a.rest then
            match a.val with
            | some b =>
              parseItems k (storeBool st name b a.bang a.cat) a.rest
            | none =>
              parseItems k (noteAtom st a.bang a.cat) a.rest
          else
            match afterSkip k st rest with
            | some (st2, rest2) => parseItems k st2 rest2
            | none => none
        | none =>
          match afterSkip k st rest with
          | some (st2, rest2) => parseItems k st2 rest2
          | none => none
      else
        none
    | "def" :: name :: rest =>
      if isIdent name then
        match afterSkip k st rest with
        | some (st2, rest2) => parseItems k st2 rest2
        | none => none
      else
        none
    | "end" :: rest => finish st rest
    | _ => none
termination_by fuel

def parseHonestyTrueCatText (src : String) : Option Module :=
  let fall : Option Module :=
    SystemsLean.DiaphenesNsAtoms.parseNsAtoms src
  match strip src.toList SMode.code [] with
  | none => fall
  | some kept =>
    match tok tokFuel kept TMode.norm [] with
    | none => fall
    | some ts =>
      match parseItems itemFuel emptySt ts with
      | some m => some m
      | none => fall

end SystemsLean.HonestyTrueCatFront
