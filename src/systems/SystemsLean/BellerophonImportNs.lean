/-
  Module: SystemsLean.BellerophonImportNs
  Exactly one import, one namespace, and a matching end.
  Comments may sit between them. Any other command is none.
  Four imports are none. Five imports are none. A def is none.
  A theorem is none. A mutual block is none.
  The module is the namespace and its end. The import is not emitted.
  A false Bool is not emitted as true.
  Namespace plus end fits kernel fuel 64.
  This file does not change HostKernel fuel.
  Does not call Lean.Elab.processCommands.
  Does not store the module file name.
  slakeOwnsPackageTypecheck stays false. ASCII only.
-/

import SystemsLean.HostTerm

namespace SystemsLean.BellerophonImportNs

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
  bad : Bool

def emptySt : St :=
  { ns := ""
    nsCount := 0
    endCount := 0
    ended := false
    imports := 0
    bad := false }

def markBad (st : St) : St :=
  { st with bad := true }

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

def classify (line : String) (st : St) : St :=
  if st.bad then
    st
  else
    let cs := line.toList
    if st.ended then
      if onlyWs cs then st else markBad st
    else
      match takeIdent (skipWs cs) with
      | none =>
        if onlyWs cs then st else markBad st
      | some ("import", _) =>
        { st with imports := st.imports + 1 }
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
      | some (_, _) => markBad st

inductive Mode where
  | code
  | str
  | esc
  | raw (need : Nat)
  | blk (depth : Nat)

inductive StrEnd where
  | closed (rest : List Char)
  | unclosed (esc : Bool)

inductive BlkEnd where
  | closed (rest : List Char)
  | open (depth : Nat)

def closeStr : List Char -> StrEnd
  | [] => StrEnd.unclosed false
  | '\\' :: [] => StrEnd.unclosed true
  | '\\' :: _ :: rest => closeStr rest
  | '"' :: rest => StrEnd.closed rest
  | _ :: rest => closeStr rest

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
      | BlkEnd.open d =>
        (Mode.blk d, classify (String.mk acc.reverse) st)
    | Mode.code, '\'' :: rest =>
      if continuesIdent acc then
        eat k rest ('\'' :: acc) st Mode.code
      else
        match rest with
        | '\\' :: _ :: '\'' :: rest2 => eat k rest2 acc st Mode.code
        | _ :: '\'' :: rest2 => eat k rest2 acc st Mode.code
        | _ => eat k rest ('\'' :: acc) st Mode.code
    | Mode.code, '"' :: rest =>
      match closeStr rest with
      | StrEnd.closed rest2 => eat k rest2 acc st Mode.code
      | StrEnd.unclosed esc =>
        let st2 := classify (String.mk acc.reverse) st
        if esc then (Mode.esc, st2) else (Mode.str, st2)
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
            | none =>
              (Mode.raw nh.fst, classify (String.mk acc.reverse) st)
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
    else if st.imports == 1 && st.nsCount == 1 && st.endCount == 1 then
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

def parseImportNs (src : String) : Option Module :=
  match walk (src.splitOn "\n") Mode.code emptySt with
  | none => none
  | some st =>
    let cmds :=
      [Cmd.namespace (n st.ns), Cmd.endNamespace (n st.ns)]
    let m : Module := { name := n st.ns, commands := cmds }
    if isWellFormed m then some m else none

def toy : String :=
  "import SystemsLean.EmitMultScaffold\n" ++
  "namespace SystemsLean.BellNs\n" ++
  "/-! note -/\n" ++
  "end SystemsLean.BellNs\n"

/-- One import and a namespace end. The import stays out. -/
def toyAccepts : Bool :=
  match parseImportNs toy with
  | some m =>
    match m.commands with
    | Cmd.namespace a :: Cmd.endNamespace b :: [] =>
      a.raw == "SystemsLean.BellNs" && b.raw == a.raw
        && isWellFormed m
    | _ => false
  | none => false

def four : String :=
  "import SystemsLean.ProductPath\n" ++
  "import SystemsLean.InventoryClose\n" ++
  "import SystemsLean.SelfApplyFs\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "namespace SystemsLean.DualResidual\n" ++
  "end SystemsLean.DualResidual\n"

/-- Four imports are none. -/
def fourRejects : Bool :=
  match parseImportNs four with
  | none => true
  | some _ => false

def five : String :=
  "import SystemsLean.ProductPath\n" ++
  "import SystemsLean.InventoryClose\n" ++
  "import SystemsLean.SelfApplyFs\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "import SystemsLean.DualResidual\n" ++
  "namespace SystemsLean.DualResidualTheorems\n" ++
  "end SystemsLean.DualResidualTheorems\n"

/-- Five imports are none. -/
def fiveRejects : Bool :=
  match parseImportNs five with
  | none => true
  | some _ => false

def hasDef : String :=
  "import SystemsLean.HostTerm\n" ++
  "namespace SystemsLean.BellNs\n" ++
  "def keep : Bool := false\n" ++
  "end SystemsLean.BellNs\n"

/-- A def is none. The false literal is not emitted. -/
def defRejects : Bool :=
  match parseImportNs hasDef with
  | none => true
  | some _ => false

end SystemsLean.BellerophonImportNs
