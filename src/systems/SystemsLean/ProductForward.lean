/-
  Module: SystemsLean.ProductForward
  One shape: a product forwarder that is not a HostFrontLive checker.
  One namespace and the same end. The namespace is not HostFrontLive.
  Imports are SystemsLean.... def main and a string def are required.
  No theorem. def main is not emitted.
  Literal string and Bool defs are emitted.
  The module name is that namespace. The file name is not stored.
  A false Bool stays false. Does not call Lean.Elab.processCommands.
  Returns none on every other shape.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.ProductForward

open SystemsLean.HostTerm

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

def dropWs (cs : List Char) : List Char :=
  match cs with
  | [] => []
  | c :: rest =>
    if c == ' ' || c == '\t' || c == '\r' then dropWs rest else cs

def readIdent (cs : List Char) (acc : List Char) : Prod String (List Char) :=
  match cs with
  | [] => (String.mk acc.reverse, [])
  | c :: rest =>
    if isIdentChar c then readIdent rest (c :: acc)
    else (String.mk acc.reverse, cs)

def trimLeft (cs : List Char) : List Char :=
  match cs with
  | [] => []
  | c :: rest =>
    if c == ' ' || c == '\t' || c == '\r' then trimLeft rest else cs

def trim (s : String) : String :=
  String.mk (trimLeft (trimLeft s.toList).reverse).reverse

def stripCR (s : String) : String :=
  match s.toList.reverse with
  | '\r' :: rest => String.mk rest.reverse
  | _ => s

def startsWord (s word : String) : Bool :=
  if s.startsWith word then
    if s.length == word.length then true
    else
      let c := (s.drop word.length).front
      c == ' ' || c == '\t'
  else
    false

/-- mode: 0 code, 1 line comment, 2 block, 3 string, 4 raw,
    5 raw close, 6 after r, 7 open hashes, 8 after dash, 9 after slash,
    10 character literal. -/
structure Scan where
  mode : Nat
  rawN : Nat
  seen : Nat
  blkN : Nat
  dash : Bool
  slash : Bool
  taking : Bool
  pre : List Char

def startScan : Scan :=
  { mode := 0, rawN := 0, seen := 0, blkN := 0
    , dash := false, slash := false, taking := false, pre := [] }

def push (sc : Scan) (c : Char) : Scan :=
  if sc.taking then { sc with pre := c :: sc.pre } else sc

def pushHashes (sc : Scan) : Nat -> Scan
  | 0 => sc
  | Nat.succ k => pushHashes (push sc '#') k

def identTail (pre : List Char) : Bool :=
  match pre with
  | [] => false
  | c :: _ => isIdentChar c

/-- One code character. The rest of the line stays with eat. -/
def afterCode (sc : Scan) (c : Char) : Scan :=
  match c with
  | '-' => { sc with mode := 8 }
  | '/' => { sc with mode := 9 }
  | 'r' => { sc with mode := 6 }
  | '"' => { sc with mode := 3, dash := false, taking := false }
  | '\'' =>
    if sc.taking && identTail sc.pre then push sc '\''
    else { sc with mode := 10, seen := 0 }
  | _ => push { sc with mode := 0 } c

def flushPending (sc : Scan) : Scan :=
  if sc.mode == 8 then push { sc with mode := 0 } '-'
  else if sc.mode == 9 then push { sc with mode := 0 } '/'
  else if sc.mode == 6 then push { sc with mode := 0 } 'r'
  else if sc.mode == 7 then
    let k := sc.rawN
    pushHashes (push { sc with mode := 0, rawN := 0, seen := 0 } 'r') k
  else sc

/-- Every recursive call is on the tail, so the scan is structural. -/
def eat (sc : Scan) (cs : List Char) : Scan :=
  match cs with
  | [] => sc
  | c :: rest =>
    if sc.mode == 1 then eat sc rest
    else if sc.mode == 2 then
      if sc.slash && c == '-' then
        eat { sc with blkN := sc.blkN + 1, slash := false, dash := false } rest
      else if sc.slash && c == '/' then
        eat { sc with slash := true } rest
      else if sc.slash then
        eat { sc with slash := false, dash := c == '-' } rest
      else if sc.dash && c == '/' then
        if sc.blkN == 0 then
          eat { sc with mode := 0, dash := false, slash := false } rest
        else
          eat { sc with blkN := sc.blkN - 1, dash := false } rest
      else if sc.dash then
        eat { sc with dash := c == '-', slash := c == '/' } rest
      else if c == '-' then eat { sc with dash := true } rest
      else if c == '/' then eat { sc with slash := true } rest
      else eat sc rest
    else if sc.mode == 3 then
      if sc.dash then eat { sc with dash := false } rest
      else if c == '\\' then eat { sc with dash := true } rest
      else if c == '"' then eat { sc with mode := 0, dash := false } rest
      else eat sc rest
    else if sc.mode == 4 then
      if c == '"' then eat { sc with mode := 5, seen := 0 } rest
      else eat sc rest
    else if sc.mode == 5 then
      if c == '#' then
        if sc.seen + 1 == sc.rawN then
          eat { sc with mode := 0, rawN := 0, seen := 0 } rest
        else eat { sc with seen := sc.seen + 1 } rest
      else if c == '"' then eat { sc with seen := 0 } rest
      else eat { sc with mode := 4, seen := 0 } rest
    else if sc.mode == 6 then
      if c == '#' then eat { sc with mode := 7, rawN := 1 } rest
      else eat (afterCode (push { sc with mode := 0 } 'r') c) rest
    else if sc.mode == 7 then
      if c == '#' then eat { sc with rawN := sc.rawN + 1 } rest
      else if c == '"' then
        eat { sc with mode := 4, taking := false, seen := 0 } rest
      else
        let k := sc.rawN
        let base := { sc with mode := 0, rawN := 0, seen := 0 }
        eat (afterCode (pushHashes (push base 'r') k) c) rest
    else if sc.mode == 8 then
      if c == '-' then eat { sc with mode := 1, taking := false } rest
      else eat (afterCode (push { sc with mode := 0 } '-') c) rest
    else if sc.mode == 9 then
      if c == '-' then
        eat { sc with mode := 2, blkN := 0, dash := false, slash := false, taking := false } rest
      else eat (afterCode (push { sc with mode := 0 } '/') c) rest
    else if sc.mode == 10 then
      if sc.seen == 0 && c == '\\' then eat { sc with seen := 1 } rest
      else if sc.seen == 1 then eat { sc with seen := 2 } rest
      else if sc.seen == 0 then eat { sc with seen := 2 } rest
      else if c == '\'' then eat { sc with mode := 0, seen := 0 } rest
      else eat (afterCode { sc with mode := 0, seen := 0 } c) rest
    else eat (afterCode sc c) rest

def endLine (sc : Scan) : Scan :=
  if sc.mode == 1 then
    { sc with mode := 0, dash := false, slash := false, taking := false, pre := [] }
  else
    { sc with taking := false, pre := [] }

structure Acc where
  ns : String
  en : String
  nNs : Nat
  nEnd : Nat
  imps : Nat
  badSys : Bool
  nStr : Nat
  nBool : Nat
  nOther : Nat
  sawMain : Bool
  sawTh : Bool
  sawEx : Bool
  sawInd : Bool
  sawSt : Bool
  cmds : List Cmd

def empty : Acc :=
  { ns := "", en := "", nNs := 0, nEnd := 0, imps := 0
    , badSys := false, nStr := 0, nBool := 0, nOther := 0
    , sawMain := false, sawTh := false, sawEx := false
    , sawInd := false, sawSt := false, cmds := [] }

def parseTyped (s ty : String) : Option String :=
  let cs0 := dropWs ((s.drop 3).copy).toList
  let (name, rest0) := readIdent cs0 []
  if name == "" then none
  else
    match dropWs rest0 with
    | ':' :: rest1 =>
      let (got, rest2) := readIdent (dropWs rest1) []
      if got != ty then none
      else
        match dropWs rest2 with
        | ':' :: '=' :: _ => some name
        | _ => none
    | _ => none

def isMain (s : String) : Bool :=
  let cs := dropWs ((s.drop 3).copy).toList
  let (name, rest) := readIdent cs []
  if name != "main" then false
  else
    match dropWs rest with
    | [] => true
    | '(' :: _ => true
    | ':' :: _ => true
    | _ => false

def underCap (st : Acc) : Bool :=
  st.cmds.length < 16

def emitStr (st : Acc) (name : String) : Acc :=
  let st1 := { st with nStr := st.nStr + 1 }
  if underCap st then
    { st1 with
      cmds :=
        Cmd.def_ (n name) (some HostType.string) (Term.litString "pin")
          :: st.cmds }
  else
    st1

def emitBool (st : Acc) (name : String) (b : Bool) : Acc :=
  let st1 := { st with nBool := st.nBool + 1 }
  if underCap st then
    { st1 with
      cmds :=
        Cmd.def_ (n name) (some HostType.bool) (Term.litBool b)
          :: st.cmds }
  else
    st1

def litTail (s : String) : Option String :=
  let cs0 := dropWs ((s.drop 3).copy).toList
  let (name, rest0) := readIdent cs0 []
  if name == "" then none
  else
    match dropWs rest0 with
    | ':' :: rest1 =>
      let (_, rest2) := readIdent (dropWs rest1) []
      match dropWs rest2 with
      | ':' :: '=' :: rest3 => some (trim (String.mk (dropWs rest3)))
      | _ => none
    | _ => none

def sysImp (nm : String) : Bool :=
  nm.startsWith "SystemsLean." && nm.length > "SystemsLean.".length

def classify (st : Acc) (raw : String) : Acc :=
  let s := stripCR raw
  if s == "" then st
  else if s.front == ' ' || s.front == '\t' then st
  else if startsWord s "import" then
    let nm := trim ((s.drop 6).copy)
    if sysImp nm then { st with imps := st.imps + 1 }
    else { st with imps := st.imps + 1, badSys := true }
  else if startsWord s "namespace" then
    let name := trim ((s.drop 9).copy)
    if st.nNs == 0 then { st with nNs := 1, ns := name }
    else { st with nNs := st.nNs + 1 }
  else if s == "end" then { st with nEnd := st.nEnd + 1, en := "" }
  else if startsWord s "end" then
    { st with nEnd := st.nEnd + 1, en := trim ((s.drop 3).copy) }
  else if startsWord s "theorem" then { st with sawTh := true }
  else if startsWord s "example" then { st with sawEx := true }
  else if startsWord s "inductive" then { st with sawInd := true }
  else if startsWord s "structure" then { st with sawSt := true }
  else if isMain s then { st with sawMain := true }
  else if startsWord s "def" then
    match parseTyped s "String" with
    | some name => emitStr st name
    | none =>
      match parseTyped s "Bool" with
      | some name =>
        match litTail s with
        | some "false" => emitBool st name false
        | some "true" => emitBool st name true
        | _ => { st with nBool := st.nBool + 1 }
      | none => { st with nOther := st.nOther + 1 }
  else
    st

def onLine (st : Acc) (sc : Scan) (line : String) : Prod Acc Scan :=
  let started := sc.mode == 0
  let sc1 := eat { sc with taking := started, pre := [] } line.toList
  let sc2 := flushPending sc1
  let st2 :=
    if started then classify st (String.mk sc2.pre.reverse) else st
  (st2, endLine sc2)

def fold (st : Acc) (sc : Scan) : List String -> Prod Acc Scan
  | [] => (st, sc)
  | line :: rest =>
    let (st2, sc2) := onLine st sc line
    fold st2 sc2 rest

def liveNs (ns : String) : Bool :=
  ns.startsWith "SystemsLean.HostFrontLive"
    && ns.length > "SystemsLean.HostFrontLive".length

def finish (sc : Scan) (st : Acc) : Option Module :=
  if sc.mode != 0 || st.nNs != 1 || st.nEnd != 1 || st.ns != st.en then
    none
  else if st.ns == "" || liveNs st.ns || !st.sawMain then
    none
  else if st.nStr == 0 || st.sawTh || st.imps == 0 || st.badSys then
    none
  else if st.cmds.length == 0 then
    none
  else
    some {
      name := n st.ns
      commands :=
        Cmd.namespace (n st.ns)
          :: (st.cmds.reverse ++ [Cmd.endNamespace (n st.en)])
    }

/-- A product forwarder, or none for every other shape. -/
def parseProductForward (src : String) : Option Module :=
  let (st, sc) := fold empty startScan (src.splitOn "\n")
  finish sc st

end SystemsLean.ProductForward
