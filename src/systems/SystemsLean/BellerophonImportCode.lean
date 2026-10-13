/-
  Module: SystemsLean.BellerophonImportCode
  One or more imports, one namespace, one matching end, no theorem,
  no one-line String or Bool literal, and at least one other code line.
  A pure one-line module is none.
  A bare literal belongs to the other reader.
  A Bool chain is not emitted as true.
  The module is the namespace and its end. Imports and defs are dropped.
  Kernel fuel stays 64. This file does not change HostKernel.
  Does not call Lean.Elab.processCommands.
  Does not store the module file name.
  slakeOwnsPackageTypecheck stays false. ASCII only.
-/

import SystemsLean.HostTerm

namespace SystemsLean.BellerophonImportCode

open SystemsLean.HostTerm

def lineFuel : Nat := 400000

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\n' || c == '\t' || c == '\r'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

structure St where
  ns : String
  nsCount : Nat
  endCount : Nat
  ended : Bool
  imports : Nat
  theorems : Nat
  complex : Nat
  falses : List Cmd
  trues : List Cmd
  strs : List Cmd
  litCount : Nat
  bad : Bool

def emptySt : St :=
  { ns := ""
    nsCount := 0
    endCount := 0
    ended := false
    imports := 0
    theorems := 0
    complex := 0
    falses := []
    trues := []
    strs := []
    litCount := 0
    bad := false }

def markBad (st : St) : St :=
  { st with bad := true }

def boolCmd (name : String) (b : Bool) : Cmd :=
  Cmd.def_ (n name) (some HostType.bool) (Term.litBool b)

def strCmd (name s : String) : Cmd :=
  Cmd.def_ (n name) (some HostType.string) (Term.litString s)

def addFalse (st : St) (c : Cmd) : St :=
  { st with falses := c :: st.falses, litCount := st.litCount + 1 }

def addTrue (st : St) (c : Cmd) : St :=
  { st with trues := c :: st.trues, litCount := st.litCount + 1 }

def addStr (st : St) (c : Cmd) : St :=
  { st with strs := c :: st.strs, litCount := st.litCount + 1 }

def skipWs : List Char -> List Char
  | [] => []
  | c :: rest => if isWs c then skipWs rest else c :: rest

def onlyWs : List Char -> Bool
  | [] => true
  | c :: rest => isWs c && onlyWs rest

def identRest (fuel : Nat) (acc : List Char) : List Char ->
    Prod (List Char) (List Char)
  | cs =>
    match fuel with
    | 0 => (acc, cs)
    | Nat.succ k =>
      match cs with
      | d :: rest =>
        if isIdentChar d then identRest k (d :: acc) rest
        else (acc, cs)
      | [] => (acc, [])
termination_by fuel

def takeIdent (cs : List Char) : Option (Prod String (List Char)) :=
  match cs with
  | [] => none
  | c :: rest =>
    if isLetter c || c == '_' then
      let got := identRest 512 [c] rest
      some (String.mk got.fst.reverse, got.snd)
    else
      none

def takeDots (fuel : Nat) (acc : String) : List Char ->
    Option (Prod String (List Char))
  | cs =>
    match fuel with
    | 0 => none
    | Nat.succ k =>
      match cs with
      | '.' :: rest =>
        match takeIdent rest with
        | some (id, rest2) => takeDots k (acc ++ "." ++ id) rest2
        | none => none
      | _ => some (acc, cs)
termination_by fuel

def takeDotName (cs : List Char) : Option (Prod String (List Char)) :=
  match takeIdent cs with
  | some (id, rest) => takeDots 64 id rest
  | none => none

/-- A backslash keeps the literal out. none means not a bare string. -/
def readPlain : List Char -> List Char -> Option (Prod String (List Char))
  | [], _ => none
  | '"' :: rest, acc => some (String.mk acc.reverse, rest)
  | '\\' :: _, _ => none
  | c :: rest, acc => readPlain rest (c :: acc)

def addStrLit (name : String) (cs : List Char) (st : St) : St :=
  match cs with
  | '"' :: rest =>
    match readPlain rest [] with
    | some (body, rest2) =>
      if onlyWs rest2 then addStr st (strCmd name body) else st
    | none => st
  | _ => st

def addBoolLit (name : String) (cs : List Char) (st : St) : St :=
  match takeIdent cs with
  | some ("false", rest) =>
    if onlyWs rest then addFalse st (boolCmd name false) else st
  | some ("true", rest) =>
    if onlyWs rest then addTrue st (boolCmd name true) else st
  | _ => st

def addDef (cs : List Char) (st : St) : St :=
  match takeIdent (skipWs cs) with
  | none => st
  | some (name, rest) =>
    match skipWs rest with
    | ':' :: rest2 =>
      match takeIdent (skipWs rest2) with
      | none => st
      | some (ty, rest3) =>
        match skipWs rest3 with
        | ':' :: '=' :: rest4 =>
          if ty == "String" then addStrLit name (skipWs rest4) st
          else if ty == "Bool" then addBoolLit name (skipWs rest4) st
          else st
        | _ => st
    | _ => st

def bump (st : St) : St :=
  { st with complex := st.complex + 1 }

def classify (line : String) (st : St) : St :=
  if st.bad then
    st
  else
    let cs := skipWs line.toList
    match takeIdent cs with
    | none =>
      if onlyWs cs then st
      else if st.ended then markBad st
      else bump st
    | some (_, _) =>
      if st.ended then
        markBad st
      else
        match takeIdent cs with
        | none => st
        | some ("import", _) =>
          { st with imports := st.imports + 1 }
        | some ("open", _) => st
        | some ("inductive", _) => st
        | some ("check", _) => st
        | some ("deriving", _) => st
        | some ("module", _) => st
        | some ("namespace", rest) =>
          match takeDotName (skipWs rest) with
          | some (nm, rest2) =>
            if onlyWs rest2 && st.nsCount == 0 then
              { st with ns := nm, nsCount := 1 }
            else
              markBad st
          | none => markBad st
        | some ("end", rest) =>
          match takeDotName (skipWs rest) with
          | some (nm, rest2) =>
            if onlyWs rest2 && st.nsCount == 1 && nm == st.ns
                && st.endCount == 0 then
              { st with endCount := 1, ended := true }
            else
              markBad st
          | none => markBad st
        | some ("theorem", _) =>
          bump { st with theorems := st.theorems + 1 }
        | some ("def", rest) =>
          let st2 := addDef rest st
          if st2.litCount == st.litCount then bump st2 else st2
        | some (_, _) => bump st

inductive Mode where
  | code
  | str
  | esc
  | raw (need : Nat)
  | blk (depth : Nat)

inductive StrEnd where
  | closed (body : List Char) (clean : Bool) (rest : List Char)
  | unclosed (esc : Bool)

inductive BlkEnd where
  | closed (rest : List Char)
  | open (depth : Nat)

def closeStr (cs : List Char) (body : List Char) (clean : Bool) : StrEnd :=
  match cs with
  | [] => StrEnd.unclosed false
  | '\\' :: [] => StrEnd.unclosed true
  | '\\' :: _ :: rest => closeStr rest body false
  | '"' :: rest => StrEnd.closed body clean rest
  | c :: rest => closeStr rest (c :: body) clean

def closeBlk (depth : Nat) : List Char -> BlkEnd
  | [] => BlkEnd.open depth
  | '-' :: '/' :: rest =>
    if depth <= 1 then BlkEnd.closed rest
    else closeBlk (depth - 1) rest
  | '/' :: '-' :: rest => closeBlk (depth + 1) rest
  | _ :: rest => closeBlk depth rest

def countHashes : List Char -> Prod Nat (List Char)
  | '#' :: rest =>
    let got := countHashes rest
    (got.fst + 1, got.snd)
  | cs => (0, cs)

def skipN (n : Nat) (cs : List Char) : List Char :=
  match n with
  | 0 => cs
  | Nat.succ k =>
    match cs with
    | _ :: rest => skipN k rest
    | [] => []
termination_by n

/-- Leading hashes leave a suffix no longer than the input. -/
theorem countHashes_snd_len_le (cs : List Char) :
    (countHashes cs).snd.length <= cs.length := by
  match cs with
  | [] => simp [countHashes]
  | '#' :: rest =>
    simp only [countHashes]
    exact Nat.le_succ_of_le (countHashes_snd_len_le rest)
  | c :: rest =>
    if h : c = '#' then
      subst h
      simp only [countHashes]
      exact Nat.le_succ_of_le (countHashes_snd_len_le rest)
    else
      unfold countHashes
      split
      . next heq =>
        injection heq with hhead
        exact absurd hhead h
      . exact Nat.le_refl _

def closeRaw (need : Nat) (cs : List Char) : Option (List Char) :=
  match cs with
  | [] => none
  | '"' :: rest =>
    let nh := countHashes rest
    if nh.fst >= need && need > 0 then some (skipN need rest)
    else closeRaw need nh.snd
  | _ :: rest => closeRaw need rest
termination_by cs.length
decreasing_by
  all_goals simp_wf
  . exact Nat.lt_succ_of_le (countHashes_snd_len_le rest)

def pushRev (acc : List Char) : List Char -> List Char
  | [] => acc
  | c :: rest => pushRev (c :: acc) rest

def continuesIdent (acc : List Char) : Bool :=
  match acc with
  | c :: _ => isIdentChar c
  | [] => false

def eat (fuel : Nat) (cs : List Char) (acc : List Char) (st : St)
    (mode : Mode) : Prod Mode St :=
  match fuel with
  | 0 => (Mode.code, markBad st)
  | Nat.succ k =>
    match mode, cs with
    | Mode.code, [] =>
      (Mode.code, classify (String.mk acc.reverse) st)
    | Mode.code, '-' :: '-' :: _ =>
      (Mode.code, classify (String.mk acc.reverse) st)
    | Mode.code, '/' :: '-' :: rest =>
      match closeBlk 1 rest with
      | BlkEnd.closed rest2 => eat k rest2 acc st Mode.code
      | BlkEnd.open d => (Mode.blk d, st)
    | Mode.code, '"' :: rest =>
      match closeStr rest [] true with
      | StrEnd.closed body clean rest2 =>
        let quoted := '"' :: (body.reverse ++ ['"'])
        let acc2 := if clean then pushRev acc quoted else acc
        eat k rest2 acc2 st Mode.code
      | StrEnd.unclosed esc =>
        if esc then (Mode.esc, st) else (Mode.str, st)
    | Mode.code, 'r' :: rest =>
      if continuesIdent acc then
        eat k rest ('r' :: acc) st Mode.code
      else
        match rest with
        | '#' :: _ =>
          let nh := countHashes rest
          match nh.snd with
          | '"' :: restB =>
            match closeRaw nh.fst restB with
            | some restC => eat k restC acc st Mode.code
            | none => (Mode.raw nh.fst, st)
          | _ => eat k rest ('r' :: acc) st Mode.code
        | _ => eat k rest ('r' :: acc) st Mode.code
    | Mode.code, c :: rest =>
      eat k rest (c :: acc) st Mode.code
    | Mode.str, [] => (Mode.str, st)
    | Mode.str, '\\' :: [] => (Mode.esc, st)
    | Mode.str, '\\' :: _ :: rest => eat k rest [] st Mode.str
    | Mode.str, '"' :: rest => eat k rest [] st Mode.code
    | Mode.str, _ :: rest => eat k rest [] st Mode.str
    | Mode.esc, [] => (Mode.str, st)
    | Mode.esc, _ :: rest => eat k rest [] st Mode.str
    | (Mode.raw need), line =>
      match closeRaw need line with
      | some rest => eat k rest [] st Mode.code
      | none => (Mode.raw need, st)
    | (Mode.blk depth), line =>
      match closeBlk depth line with
      | BlkEnd.closed rest => eat k rest [] st Mode.code
      | BlkEnd.open d => (Mode.blk d, st)
termination_by fuel

def finish (mode : Mode) (st : St) : Option St :=
  match mode with
  | Mode.code =>
    if st.bad then none
    else if st.imports >= 1 && st.nsCount == 1 && st.endCount == 1
        && st.theorems == 0 && st.complex >= 1 && st.litCount == 0 then
      some st
    else none
  | _ => none

def walk (lines : List String) (mode : Mode) (st : St) : Option St :=
  match lines with
  | [] => finish mode st
  | line :: rest =>
    let stepped := eat lineFuel line.toList [] st mode
    walk rest stepped.fst stepped.snd
termination_by lines.length

def parseImportCode (src : String) : Option Module :=
  match walk (src.splitOn "\n") Mode.code emptySt with
  | none => none
  | some st =>
    let cmds :=
      [Cmd.namespace (n st.ns), Cmd.endNamespace (n st.ns)]
    let m : Module := { name := n st.ns, commands := cmds }
    if isWellFormed m then some m else none

def toy : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.BellImp\n" ++
  "def f (x : Nat) : Nat := x\n" ++
  "end SystemsLean.BellImp\n"

/-- The function def is absent. The namespace remains. -/
def toyAccepts : Bool :=
  match parseImportCode toy with
  | some m =>
    match m.commands with
    | Cmd.namespace a :: Cmd.endNamespace b :: [] =>
      a.raw == "SystemsLean.BellImp" && b.raw == a.raw
        && isWellFormed m
    | _ => false
  | none => false

def litSrc : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.BellImp\n" ++
  "def keep : Bool := false\n" ++
  "def f (x : Nat) : Nat := x\n" ++
  "end SystemsLean.BellImp\n"

/-- A bare literal belongs to the other reader. -/
def litRejects : Bool :=
  match parseImportCode litSrc with
  | none => true
  | some _ => false

def plain : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.BellImp\n" ++
  "end SystemsLean.BellImp\n"

/-- A namespace with no other code line is none. -/
def plainRejects : Bool :=
  match parseImportCode plain with
  | none => true
  | some _ => false

def thmSrc : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.BellImp\n" ++
  "def f (x : Nat) : Nat := x\n" ++
  "theorem t : True := by trivial\n" ++
  "end SystemsLean.BellImp\n"

/-- A theorem is none. -/
def thmRejects : Bool :=
  match parseImportCode thmSrc with
  | none => true
  | some _ => false

def noImport : String :=
  "namespace SystemsLean.BellImp\n" ++
  "def f (x : Nat) : Nat := x\n" ++
  "end SystemsLean.BellImp\n"

def noImportRejects : Bool :=
  match parseImportCode noImport with
  | none => true
  | some _ => false

end SystemsLean.BellerophonImportCode
