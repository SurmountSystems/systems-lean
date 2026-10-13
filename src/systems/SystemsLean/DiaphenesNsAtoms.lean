/-
  Module: SystemsLean.DiaphenesNsAtoms
  One namespace, SystemsLean.SlakeHostTool or
  SystemsLean.SlakeProducedElf, and at least one String literal def.
  An import of SystemsLean.HostKernel is none.
  A raw-string opener is none. IO, theorems, and Nat defs are skipped.
  A String body with ++ is skipped. A false Bool stays false.
  The module file name is not stored.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront

namespace SystemsLean.DiaphenesNsAtoms

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip SMode)

def toolPfx : String := "SystemsLean.SlakeHostTool"

def elfPfx : String := "SystemsLean.SlakeProducedElf"

def hostKernel : String := "SystemsLean.HostKernel"

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

def matchStr : List Char -> List Char -> Option (List Char)
  | [], cs => some cs
  | _, [] => none
  | a :: as, b :: bs =>
    if a == b then matchStr as bs else none

def skipSp : List Char -> List Char
  | ' ' :: rest => skipSp rest
  | '\t' :: rest => skipSp rest
  | cs => cs

def onlyWs : List Char -> Bool
  | [] => true
  | ' ' :: rest => onlyWs rest
  | '\t' :: rest => onlyWs rest
  | _ => false

def trimL : List Char -> List Char
  | ' ' :: rest => trimL rest
  | '\t' :: rest => trimL rest
  | cs => cs

def trimR (cs : List Char) : List Char :=
  (trimL cs.reverse).reverse

def trim (s : String) : String :=
  String.mk (trimR (trimL s.toList))

def startsWith (s pre : String) : Bool :=
  match matchStr pre.toList s.toList with
  | some _ => true
  | none => false

def hashesThenQuote : List Char -> Bool
  | '#' :: '"' :: _ => true
  | '#' :: rest => hashesThenQuote rest
  | _ => false

def hasRawOpen : List Char -> Bool
  | [] => false
  | 'r' :: rest =>
    if hashesThenQuote rest then true else hasRawOpen rest
  | _ :: rest => hasRawOpen rest

def linesGo (cur : List Char) (acc : List String) :
    List Char -> List String
  | [] => (String.mk cur.reverse :: acc).reverse
  | '\r' :: rest => linesGo cur acc rest
  | '\n' :: rest =>
    linesGo [] (String.mk cur.reverse :: acc) rest
  | c :: rest => linesGo (c :: cur) acc rest

def linesOf (cs : List Char) : List String :=
  linesGo [] [] cs

def isBlank (s : String) : Bool :=
  trim s == ""

def col0 (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: _ => c != ' ' && c != '\t'

def joinSp : List String -> String
  | [] => ""
  | s :: rest =>
    let t := trim s
    let r := joinSp rest
    if t == "" then r
    else if r == "" then t
    else t ++ " " ++ r

def flush (cur : List String) (acc : List String) : List String :=
  match cur with
  | [] => acc
  | _ => joinSp cur.reverse :: acc

def groupGo (cur : List String) (acc : List String) :
    List String -> List String
  | [] => (flush cur acc).reverse
  | l :: rest =>
    if isBlank l then groupGo cur acc rest
    else if col0 l then groupGo [l] (flush cur acc) rest
    else groupGo (l :: cur) acc rest

def group (ls : List String) : List String :=
  groupGo [] [] ls

def afterWord (word : String) (s : String) : Option (List Char) :=
  match matchStr (word.toList ++ [' ']) (trim s).toList with
  | some rest => some (skipSp rest)
  | none => none

def readIdentGo (acc : List Char) : List Char ->
    Prod (List Char) (List Char)
  | [] => (acc.reverse, [])
  | c :: rest =>
    if isIdentChar c then readIdentGo (c :: acc) rest
    else (acc.reverse, c :: rest)

def readIdent : List Char -> Option (Prod String (List Char))
  | [] => none
  | c :: rest =>
    if isLetter c || c == '_' then
      match readIdentGo [c] rest with
      | (acc, rest2) => some (String.mk acc, rest2)
    else
      none

/-- Unread ident suffix is no longer than the scanned list. -/
theorem readIdentGo_snd_len_le (acc xs : List Char) :
    (readIdentGo acc xs).snd.length <= xs.length := by
  match xs with
  | [] => simp [readIdentGo]
  | c :: rest =>
    unfold readIdentGo
    split
    . exact Nat.le_succ_of_le (readIdentGo_snd_len_le (c :: acc) rest)
    . exact Nat.le_refl _

/-- readIdent returns some only after a first letter or underscore. -/
theorem readIdent_some_rest_len_lt
    {cs : List Char} {id : String} {rest : List Char}
    (h : readIdent cs = some (id, rest)) :
    rest.length < cs.length := by
  match cs with
  | [] => simp [readIdent] at h
  | c :: rest0 =>
    by_cases hstart : isLetter c || c == '_'
    . simp [readIdent, hstart] at h
      match hgo : readIdentGo [c] rest0 with
      | (acc, rest2) =>
        simp [hgo] at h
        cases h with
        | intro hid hrest =>
          subst hrest
          exact Nat.lt_succ_of_le (by
            simpa [hgo] using
              readIdentGo_snd_len_le [c] rest0)
    . simp [readIdent, hstart] at h

def readDotted (cs : List Char) : Option (Prod String (List Char)) :=
  match h : readIdent cs with
  | none => none
  | some (id, rest) =>
    match hdot : rest with
    | '.' :: more =>
      match readDotted more with
      | some (tail, rest2) =>
        some (id ++ "." ++ tail, rest2)
      | none => some (id, rest)
    | _ => some (id, rest)
termination_by cs.length
decreasing_by
  simp_wf
  . have hlen :
      ('.' :: more).length < cs.length :=
      readIdent_some_rest_len_lt
        (rest := '.' :: more) h
    exact Nat.lt_of_succ_lt hlen

def dotted (cs : List Char) : Option String :=
  match readDotted cs with
  | some (m, tail) =>
    if m != "" && onlyWs tail then some m else none
  | none => none

def findKey (key : List Char) : List Char -> Option (List Char)
  | [] => none
  | c :: rest =>
    match matchStr key (c :: rest) with
    | some after => some after
    | none => findKey key rest

def readStr (acc : List Char) : List Char ->
    Option (Prod String (List Char))
  | [] => none
  | '\\' :: c :: rest => readStr (c :: acc) rest
  | '"' :: rest => some (String.mk acc.reverse, rest)
  | c :: rest => readStr (c :: acc) rest

inductive Kind where
  | imp (mod : String)
  | ns (name : String)
  | str (name : String) (lit : String)
  | bool (name : String) (val : Bool)
  | skip

def takeBool (nm : String) (cs : List Char) : Kind :=
  match findKey (": Bool :=".toList) cs with
  | none => Kind.skip
  | some after =>
    match readIdent (skipSp after) with
    | some ("true", rest) =>
      if onlyWs rest then Kind.bool nm true else Kind.skip
    | some ("false", rest) =>
      if onlyWs rest then Kind.bool nm false else Kind.skip
    | _ => Kind.skip

def takeStr (nm : String) (cs : List Char) : Kind :=
  match findKey (": String :=".toList) cs with
  | none => takeBool nm cs
  | some after =>
    match skipSp after with
    | '"' :: body =>
      match readStr [] body with
      | some (lit, rest) =>
        match skipSp rest with
        | '+' :: '+' :: _ => Kind.skip
        | _ => Kind.str nm lit
      | none => Kind.skip
    | _ => Kind.skip

def classifyDef (cs : List Char) : Kind :=
  match readIdent cs with
  | none => Kind.skip
  | some (nm, rest) =>
    if nm == "main" then Kind.skip else takeStr nm rest

def impName (cs : List Char) : Kind :=
  match dotted cs with
  | some m => Kind.imp m
  | none => Kind.skip

def nsName (cs : List Char) : Kind :=
  match dotted cs with
  | some m => Kind.ns m
  | none => Kind.skip

def classify (b : String) : Kind :=
  match afterWord "import" b with
  | some rest => impName rest
  | none =>
    match afterWord "namespace" b with
    | some rest => nsName rest
    | none =>
      match afterWord "def" b with
      | some rest => classifyDef rest
      | none => Kind.skip

structure Pins where
  imps : List String
  nss : List String
  strs : List (Prod String String)
  bools : List (Prod String Bool)

def emptyPins : Pins :=
  { imps := [], nss := [], strs := [], bools := [] }

def addPin (p : Kind) (st : Pins) : Pins :=
  match p with
  | Kind.imp m => { st with imps := m :: st.imps }
  | Kind.ns m => { st with nss := m :: st.nss }
  | Kind.str nm lit =>
    { st with strs := (nm, lit) :: st.strs }
  | Kind.bool nm v =>
    { st with bools := (nm, v) :: st.bools }
  | Kind.skip => st

def foldBlocks : List String -> Pins -> Pins
  | [], st => st
  | b :: rest, st => foldBlocks rest (addPin (classify b) st)

def hasKernel : List String -> Bool
  | [] => false
  | m :: rest => m == hostKernel || hasKernel rest

def oneNs : List String -> Option String
  | [m] => some m
  | _ => none

def nsOk (ns : String) : Bool :=
  startsWith ns toolPfx || startsWith ns elfPfx

def strCmd (nm lit : String) : Cmd :=
  Cmd.def_ (n nm) (some HostType.string) (Term.litString lit)

def boolCmd (nm : String) (v : Bool) : Cmd :=
  Cmd.def_ (n nm) (some HostType.bool) (Term.litBool v)

def impCmd (m : String) : Cmd :=
  Cmd.importModule (n m)

def mapStr : List (Prod String String) -> List Cmd
  | [] => []
  | (nm, lit) :: rest => strCmd nm lit :: mapStr rest

def mapBool : List (Prod String Bool) -> List Cmd
  | [] => []
  | (nm, v) :: rest => boolCmd nm v :: mapBool rest

def mapImp : List String -> List Cmd
  | [] => []
  | m :: rest => impCmd m :: mapImp rest

def finish (st : Pins) : Option Module :=
  if hasKernel st.imps then
    none
  else
    match oneNs st.nss with
    | none => none
    | some ns =>
      if !nsOk ns then
        none
      else
        let strs := st.strs.reverse
        if strs.isEmpty then
          none
        else
          let cmds :=
            mapImp st.imps.reverse
              ++ [Cmd.namespace (n ns)]
              ++ mapStr strs
              ++ mapBool st.bools.reverse
              ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m then some m else none

def parseNsAtoms (src : String) : Option Module :=
  if hasRawOpen src.toList then
    none
  else
    match strip src.toList SMode.code [] with
    | none => none
    | some kept =>
      finish (foldBlocks (group (linesOf kept)) emptyPins)

end SystemsLean.DiaphenesNsAtoms
