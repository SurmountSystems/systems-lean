/-
  Module: SystemsLean.AdastriaScan
  Top-level scan: imports, one namespace, and forms.
  Comments, strings, and raw strings are skipped.
  The module file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm

namespace SystemsLean.AdastriaScan

open SystemsLean.HostTerm

structure Fact where
  imports : List String
  ns : String
  sawDef : Bool
  sawThm : Bool
  sawStruct : Bool
  sawInd : Bool
  sawFalse : Bool
  falseName : String
  sawGoodG1 : Bool
  sawLoadGate : Bool
  ended : Bool
  dirty : Bool

def emptyFact : Fact :=
  { imports := []
    ns := ""
    sawDef := false
    sawThm := false
    sawStruct := false
    sawInd := false
    sawFalse := false
    falseName := ""
    sawGoodG1 := false
    sawLoadGate := false
    ended := false
    dirty := false }

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

def readIdent : List Char -> List Char -> Prod String (List Char)
  | [], acc => (String.mk acc.reverse, [])
  | c :: cs, acc =>
    if isIdentChar c then readIdent cs (c :: acc)
    else (String.mk acc.reverse, c :: cs)

/-- Unread ident suffix is no longer than the scanned list. -/
theorem readIdent_snd_len_le (xs acc : List Char) :
    (readIdent xs acc).snd.length <= xs.length := by
  match xs with
  | [] => simp [readIdent]
  | c :: rest =>
    unfold readIdent
    split
    . exact Nat.le_succ_of_le (readIdent_snd_len_le rest (c :: acc))
    . exact Nat.le_refl _

def readDotted (cs : List Char) : Prod String (List Char) :=
  let (id, rest) := readIdent cs []
  more id rest
where
  more (acc : String) : List Char -> Prod String (List Char)
    | '.' :: cs =>
      match h : readIdent cs [] with
      | (id, rest) =>
        if id == "" then (acc, '.' :: cs)
        else more (acc ++ "." ++ id) rest
    | cs => (acc, cs)
    termination_by xs => xs.length
    decreasing_by
      simp_wf
      . have hlen : rest.length <= cs.length := by
          simpa [h] using readIdent_snd_len_le cs []
        exact Nat.lt_succ_of_le hlen

def countHash : List Char -> Nat -> Prod Nat (List Char)
  | '#' :: cs, n => countHash cs (n + 1)
  | cs, n => (n, cs)

def startsRaw (cs : List Char) : Option (Prod Nat (List Char)) :=
  match cs with
  | 'r' :: rest => hashes rest
  | rest => hashes rest
where
  hashes
    | '#' :: rest =>
      let (n, rest2) := countHash rest 1
      match rest2 with
      | '"' :: rest3 => some (n, rest3)
      | _ => none
    | _ => none

def takeHash : Nat -> List Char -> Option (List Char)
  | 0, cs => some cs
  | Nat.succ k, '#' :: cs => takeHash k cs
  | _, _ => none

def skipHSpace : List Char -> List Char
  | ' ' :: cs => skipHSpace cs
  | '\t' :: cs => skipHSpace cs
  | cs => cs

def skipPlain : List Char -> Option (List Char)
  | [] => none
  | '\\' :: _ :: cs => skipPlain cs
  | '\\' :: [] => none
  | '"' :: cs => some cs
  | _ :: cs => skipPlain cs

inductive LineStop where
  | nl (rest : List Char) (sawF : Bool)
  | rawAt (rest : List Char) (sawF : Bool)
  | eof (sawF : Bool)

def scanDefLine (fuel : Nat) (cs : List Char) (want sawF : Bool) :
    LineStop :=
  match fuel, cs with
  | 0, _ => LineStop.eof sawF
  | _, [] => LineStop.eof sawF
  | _, '\n' :: rest => LineStop.nl rest sawF
  | Nat.succ k, _ =>
    match startsRaw cs with
    | some _ => LineStop.rawAt cs sawF
    | none =>
      match cs with
      | '"' :: rest =>
        match skipPlain rest with
        | none => LineStop.eof sawF
        | some rest2 => scanDefLine k rest2 want sawF
      | ':' :: '=' :: rest =>
        scanDefLine k rest true sawF
      | ' ' :: rest => scanDefLine k rest want sawF
      | '\t' :: rest => scanDefLine k rest want sawF
      | c :: rest =>
        if isLetter c || c == '_' then
          let (id, rest2) := readIdent cs []
          let sawF2 := sawF || (want && id == "false")
          scanDefLine k rest2 false sawF2
        else
          scanDefLine k rest false sawF
      | [] => LineStop.eof sawF
termination_by fuel

inductive Mode where
  | code
  | line
  | blk
  | str
  | raw
  | attr

structure Scan where
  hot : Bool
  keep : Bool
  mode : Mode
  depth : Nat
  rawNeed : Nat
  fact : Fact

def initScan : Scan :=
  { hot := true
    keep := false
    mode := Mode.code
    depth := 0
    rawNeed := 0
    fact := emptyFact }

def isPrefix (name : String) : Bool :=
  name == "private" || name == "protected"
    || name == "noncomputable" || name == "partial"
    || name == "unsafe"

def noteDef (fact : Fact) (dname : String) (sawF : Bool) : Fact :=
  let fact1 := { fact with sawDef := true }
  let fact2 :=
    if dname == "goodG1Text" then { fact1 with sawGoodG1 := true }
    else fact1
  let fact3 :=
    if dname == "dualSsotEqualityGateId" then
      { fact2 with sawLoadGate := true }
    else fact2
  if sawF && fact3.falseName == "" && dname != "" then
    { fact3 with sawFalse := true, falseName := dname }
  else
    fact3

def onIdent (cs : List Char) (s : Scan) : Prod (List Char) Scan :=
  let (name, rest) := readIdent cs []
  if name == "" then (cs, { s with hot := false, keep := false })
  else if s.fact.ended then
    (rest, { s with
      hot := false
      keep := false
      fact := { s.fact with dirty := true } })
  else if name == "import" then
    let rest1 := skipHSpace rest
    let (mod, rest2) := readDotted rest1
    let fact :=
      if mod == "" then s.fact
      else { s.fact with imports := s.fact.imports ++ [mod] }
    (rest2, { s with hot := false, keep := false, fact := fact })
  else if name == "namespace" then
    let rest1 := skipHSpace rest
    let (ns, rest2) := readDotted rest1
    let fact :=
      if ns == "" then { s.fact with dirty := true }
      else if s.fact.ns == "" then { s.fact with ns := ns }
      else { s.fact with dirty := true }
    (rest2, { s with hot := false, keep := false, fact := fact })
  else if name == "end" then
    let rest1 := skipHSpace rest
    let (ns, rest2) := readDotted rest1
    let fact :=
      if ns != "" && ns == s.fact.ns && s.fact.ns != "" then
        { s.fact with ended := true }
      else
        { s.fact with dirty := true }
    (rest2, { s with hot := false, keep := false, fact := fact })
  else if name == "def" || name == "abbrev" then
    let rest1 := skipHSpace rest
    let (dname, rest2) := readDotted rest1
    match scanDefLine 4000 rest2 false false with
    | LineStop.nl rest3 sawF =>
      (rest3, { s with
        hot := true
        keep := false
        fact := noteDef s.fact dname sawF })
    | LineStop.rawAt rest3 sawF =>
      (rest3, { s with
        hot := false
        keep := false
        fact := noteDef s.fact dname sawF })
    | LineStop.eof sawF =>
      ([], { s with
        hot := false
        keep := false
        fact := noteDef s.fact dname sawF })
  else if name == "theorem" then
    (rest, { s with
      hot := false
      keep := false
      fact := { s.fact with sawThm := true } })
  else if name == "structure" || name == "class" then
    (rest, { s with
      hot := false
      keep := false
      fact := { s.fact with sawStruct := true } })
  else if name == "inductive" then
    (rest, { s with
      hot := false
      keep := false
      fact := { s.fact with sawInd := true } })
  else if name == "example" then
    (rest, { s with
      hot := false
      keep := false
      fact := { s.fact with sawDef := true } })
  else if isPrefix name then
    (rest, { s with hot := true, keep := true })
  else
    (rest, { s with hot := false, keep := false })

def go (fuel : Nat) (cs : List Char) (s : Scan) : Option Fact :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match s.mode, cs with
    | _, [] =>
      match s.mode with
      | Mode.code => some s.fact
      | Mode.line => some s.fact
      | _ => none
    | Mode.line, '\n' :: rest =>
      go k rest { s with mode := Mode.code, hot := true, keep := false }
    | Mode.line, _ :: rest =>
      go k rest s
    | Mode.blk, '/' :: '-' :: rest =>
      go k rest { s with depth := s.depth + 1 }
    | Mode.blk, '-' :: '/' :: rest =>
      if s.depth <= 1 then
        go k rest { s with mode := Mode.code, hot := false, depth := 0 }
      else
        go k rest { s with depth := s.depth - 1 }
    | Mode.blk, _ :: rest =>
      go k rest s
    | Mode.str, '\\' :: _ :: rest =>
      go k rest s
    | Mode.str, '"' :: rest =>
      go k rest { s with mode := Mode.code }
    | Mode.str, _ :: rest =>
      go k rest s
    | Mode.raw, '"' :: rest =>
      match takeHash s.rawNeed rest with
      | some rest2 =>
        go k rest2 { s with mode := Mode.code, hot := false }
      | none =>
        go k rest s
    | Mode.raw, _ :: rest =>
      go k rest s
    | Mode.attr, ']' :: rest =>
      go k rest { s with
        mode := Mode.code
        hot := true
        keep := true }
    | Mode.attr, '\n' :: rest =>
      go k rest { s with
        mode := Mode.code
        hot := true
        keep := false }
    | Mode.attr, _ :: rest =>
      go k rest s
    | Mode.code, '\n' :: rest =>
      go k rest { s with hot := true, keep := false }
    | Mode.code, cs =>
      if s.hot && (cs.head? == some ' ' || cs.head? == some '\t') then
        match cs with
        | c :: rest =>
          if s.keep || !(c == ' ' || c == '\t') then
            go k rest s
          else
            go k rest { s with hot := false, keep := false }
        | [] => some s.fact
      else
        match cs with
        | '-' :: '-' :: rest =>
          go k rest { s with mode := Mode.line, hot := false }
        | '/' :: '-' :: rest =>
          go k rest { s with
            mode := Mode.blk
            depth := 1
            hot := false }
        | _ =>
          match startsRaw cs with
          | some (n, rest) =>
            go k rest { s with
              mode := Mode.raw
              rawNeed := n
              hot := false
              keep := false }
          | none =>
            match cs with
            | '"' :: rest =>
              go k rest { s with mode := Mode.str, hot := false }
            | '@' :: rest =>
              if s.hot then
                go k rest { s with mode := Mode.attr, hot := false }
              else
                go k rest { s with hot := false }
            | '#' :: rest =>
              go k rest { s with hot := false, keep := false }
            | c :: rest =>
              if s.hot && (isLetter c || c == '_') then
                let (rest2, s2) := onIdent cs s
                go k rest2 s2
              else if c == ' ' || c == '\t' || c == '\r' then
                go k rest s
              else
                go k rest { s with hot := false, keep := false }
            | [] => some s.fact
termination_by fuel

def scan (src : String) : Option Fact :=
  go 400000 src.toList initScan

def hasForm (f : Fact) : Bool :=
  f.sawDef || f.sawThm || f.sawStruct || f.sawInd

def hasBody (f : Fact) : Bool :=
  hasForm f || !f.imports.isEmpty

def baseOk (f : Fact) : Bool :=
  f.ended && !f.dirty && f.ns != ""

def startsWith (s pre : String) : Bool :=
  go s.toList pre.toList
where
  go : List Char -> List Char -> Bool
    | _, [] => true
    | [], _ :: _ => false
    | a :: as, b :: bs => a == b && go as bs

def capImports : Nat -> List String -> List String
  | 0, _ => []
  | _, [] => []
  | Nat.succ k, s :: rest => s :: capImports k rest

def witness (f : Fact) : Option Module :=
  let pin :=
    if f.sawFalse && f.falseName != "" then
      Cmd.def_ (n f.falseName) (some HostType.bool) (Term.litBool false)
    else
      Cmd.def_ (n "keptShape") (some HostType.string)
        (Term.litString f.ns)
  let imps :=
    (capImports 61 f.imports).map (fun s => Cmd.importModule (n s))
  let cmds :=
    imps ++ [Cmd.namespace (n f.ns), pin, Cmd.endNamespace (n f.ns)]
  let m : Module := { name := n f.ns, commands := cmds }
  if isWellFormed m then some m else none

def compilerSpec (f : Fact) : Bool :=
  baseOk f && startsWith f.ns "SystemsLean.CompilerSpec."
    && (f.sawStruct || f.sawInd) && f.sawThm

/-- CompilerSpec shape only. Every other shape is none. -/
def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if compilerSpec f then witness f else none

def toySrc : String :=
  "namespace SystemsLean.CompilerSpec.Mutual\n" ++
  "structure MutualDecl where\n" ++
  "theorem holds : True := by\n" ++
  "  trivial\n" ++
  "end SystemsLean.CompilerSpec.Mutual\n"

def toySome : Bool :=
  match parse toySrc with
  | some _ => true
  | none => false

def otherSrc : String :=
  "namespace SystemsLean.ElabMeet\n" ++
  "def kept : Bool := false\n" ++
  "end SystemsLean.ElabMeet\n"

def otherNone : Bool :=
  match parse otherSrc with
  | none => true
  | some _ => false

end SystemsLean.AdastriaScan
