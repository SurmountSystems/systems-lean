/-
  Module: SystemsLean.BellerophonRawString
  One namespace, one `def name : String := r#"..."#` (one or more hashes),
  then the same `end`. Nothing else outside comments.
  The raw body is that one string. Any other form is none.
  Does not call Lean.Elab.processCommands.
  Does not store the module file name.
  slakeOwnsPackageTypecheck stays false. ASCII only.
-/

import SystemsLean.HostTerm

namespace SystemsLean.BellerophonRawString

open SystemsLean.HostTerm

def scanFuel : Nat := 400000

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\n' || c == '\t' || c == '\r'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

def isIdent (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: cs =>
    (isLetter c || c == '_') && cs.all isIdentChar

/-- Rest of an ident. `cur` is already non-empty and reversed. -/
def takeRest (cs : List Char) (cur : List Char) :
    Prod String (List Char) :=
  match cs with
  | c :: rest =>
    if isIdentChar c then takeRest rest (c :: cur)
    else (String.mk cur.reverse, cs)
  | [] => (String.mk cur.reverse, [])

def skipWs : List Char -> List Char
  | c :: rest => if isWs c then skipWs rest else c :: rest
  | [] => []

def expectColon (cs : List Char) : Option (List Char) :=
  match skipWs cs with
  | ':' :: rest => some rest
  | _ => none

def expectAssign (cs : List Char) : Option (List Char) :=
  match skipWs cs with
  | ':' :: '=' :: rest => some rest
  | _ => none

def countHashes (cs : List Char) (k : Nat) : Prod Nat (List Char) :=
  match cs with
  | '#' :: rest => countHashes rest (k + 1)
  | _ => (k, cs)

def nHash (k : Nat) (acc : List Char) : List Char :=
  match k with
  | 0 => acc
  | Nat.succ n => nHash n ('#' :: acc)
termination_by k

inductive Ph where
  | code
  | line
  | blk (depth : Nat) (dash : Bool)
  | raw (need : Nat) (acc : List Char)
  | hash (need : Nat) (acc : List Char) (got : Nat)

structure St where
  ns : String
  hasNs : Bool
  defName : String
  body : String
  hasDef : Bool
  ended : Bool

def emptySt : St :=
  { ns := "", hasNs := false, defName := "", body := ""
  , hasDef := false, ended := false }

def build (st : St) : Option Module :=
  if st.hasNs && st.hasDef && st.ended && isIdent st.defName then
    let cmds :=
      [ Cmd.namespace (n st.ns)
      , Cmd.def_ (n st.defName) (some HostType.string)
          (Term.litString st.body)
      , Cmd.endNamespace (n st.ns)
      ]
    let m : Module := { name := n st.ns, commands := cmds }
    if isWellFormed m then some m else none
  else
    none

/-- More dotted segments. `acc` is the name so far. -/
def readDots (fuel : Nat) (cs : List Char) (acc : String) :
    Option (Prod String (List Char)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match cs with
    | c :: rest =>
      if isWs c then
        readDots k rest acc
      else if c == '.' then
        match rest with
        | d :: rest2 =>
          if isLetter d || d == '_' then
            let got := takeRest rest2 [d]
            if got.fst == "" then none
            else readDots k got.snd (acc ++ "." ++ got.fst)
          else
            none
        | [] => none
      else
        some (acc, cs)
    | [] =>
      if acc == "" then none else some (acc, [])
termination_by fuel

mutual

/-- Code, comments, and one raw body. Fuel drops on every call. -/
def scan (fuel : Nat) (cs : List Char) (ph : Ph) (st : St) :
    Option Module :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match cs, ph with
    | [], Ph.code =>
      if st.hasNs && st.hasDef && st.ended then build st else none
    | [], Ph.line =>
      if st.hasNs && st.hasDef && st.ended then build st else none
    | [], _ => none
    | '\n' :: rest, Ph.line => scan k rest Ph.code st
    | _ :: rest, Ph.line => scan k rest Ph.line st
    | c :: rest, (Ph.blk depth dash) =>
      if dash && c == '/' then
        match depth with
        | 0 => none
        | 1 => scan k rest Ph.code st
        | Nat.succ (Nat.succ d) =>
          scan k rest (Ph.blk (Nat.succ d) false) st
      else if c == '/' then
        match rest with
        | '-' :: rest2 =>
          scan k rest2 (Ph.blk (depth + 1) false) st
        | _ => scan k rest (Ph.blk depth false) st
      else if c == '-' then
        scan k rest (Ph.blk depth true) st
      else
        scan k rest (Ph.blk depth false) st
    | '"' :: rest, (Ph.raw need acc) =>
      scan k rest (Ph.hash need acc 0) st
    | c :: rest, (Ph.raw need acc) =>
      scan k rest (Ph.raw need (c :: acc)) st
    | '#' :: rest, (Ph.hash need acc got) =>
      let got1 := got + 1
      if got1 == need then
        let body := String.mk acc.reverse
        scan k rest Ph.code { st with body := body, hasDef := true }
      else
        scan k rest (Ph.hash need acc got1) st
    | c :: rest, (Ph.hash need acc got) =>
      let acc2 := c :: nHash got ('"' :: acc)
      scan k rest (Ph.raw need acc2) st
    | c :: rest, Ph.code =>
      if isWs c then
        scan k rest Ph.code st
      else if c == '-' then
        match rest with
        | '-' :: rest2 => scan k rest2 Ph.line st
        | _ => none
      else if c == '/' then
        match rest with
        | '-' :: rest2 => scan k rest2 (Ph.blk 1 false) st
        | _ => none
      else if st.ended then
        none
      else if isLetter c || c == '_' then
        let got := takeRest rest [c]
        afterWord k got.fst got.snd st
      else
        none
termination_by fuel

/-- `namespace`, `def`, or `end` at the code layer. -/
def afterWord (fuel : Nat) (word : String) (cs : List Char)
    (st : St) : Option Module :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    if word == "namespace" then
      if st.hasNs || st.hasDef then none
      else
        match cs with
        | c :: rest =>
          if isWs c then afterWord k word rest st
          else if isLetter c || c == '_' then
            let got := takeRest rest [c]
            match readDots k got.snd got.fst with
            | some (nm, rest2) =>
              scan k rest2 Ph.code
                { st with ns := nm, hasNs := true }
            | none => none
          else
            none
        | [] => none
    else if word == "end" then
      if !st.hasNs || !st.hasDef || st.ended then none
      else
        match cs with
        | c :: rest =>
          if isWs c then afterWord k word rest st
          else if isLetter c || c == '_' then
            let got := takeRest rest [c]
            match readDots k got.snd got.fst with
            | some (nm, rest2) =>
              if nm == st.ns then
                scan k rest2 Ph.code { st with ended := true }
              else
                none
            | none => none
          else
            none
        | [] => none
    else if word == "def" then
      if !st.hasNs || st.hasDef || st.ended then none
      else
        openRaw k cs st
    else
      none
termination_by fuel

/-- `def name : String := r` then one or more hashes and a quote. -/
def openRaw (fuel : Nat) (cs : List Char) (st : St) :
    Option Module :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match cs with
    | c :: rest =>
      if isWs c then
        openRaw k rest st
      else if isLetter c || c == '_' then
        let got := takeRest rest [c]
        if !isIdent got.fst then none
        else
          match expectColon got.snd with
          | none => none
          | some restC =>
            match skipWs restC with
            | d :: restT =>
              if isLetter d || d == '_' then
                let ty := takeRest restT [d]
                if ty.fst != "String" then none
                else
                  match expectAssign ty.snd with
                  | none => none
                  | some restA =>
                    match skipWs restA with
                    | 'r' :: restR =>
                      let hashes := countHashes restR 0
                      if hashes.fst == 0 then none
                      else
                        match hashes.snd with
                        | '"' :: restB =>
                          scan k restB (Ph.raw hashes.fst [])
                            { st with defName := got.fst }
                        | _ => none
                    | _ => none
              else
                none
            | [] => none
      else
        none
    | [] => none
termination_by fuel

end

/-- Parse this shape. none means not one raw-string def. -/
def parseRawString (src : String) : Option Module :=
  scan scanFuel src.toList Ph.code emptySt

def rawToy : String :=
  "namespace SystemsLean.BellRaw\n" ++
  "def live : String := r#\"ab\"#\n" ++
  "end SystemsLean.BellRaw\n"

def bodyIs (s : String) : Module -> Bool
  | { commands :=
      [ Cmd.namespace _
      , Cmd.def_ nm (some HostType.string) (Term.litString body)
      , Cmd.endNamespace _
      ]
    , .. } =>
    nm.raw == "live" && body == s
  | _ => false

def rawAccepts : Bool :=
  match parseRawString rawToy with
  | some m => bodyIs "ab" m
  | none => false

def twoToy : String :=
  "namespace SystemsLean.BellRaw\n" ++
  "def live : String := r##\"a\"#b\"##\n" ++
  "end SystemsLean.BellRaw\n"

/-- A longer hash run keeps a shorter `"#` inside the body. -/
def twoAccepts : Bool :=
  match parseRawString twoToy with
  | some m => bodyIs "a\"#b" m
  | none => false

def plainToy : String :=
  "namespace SystemsLean.BellRaw\n" ++
  "def live : String := \"ab\"\n" ++
  "end SystemsLean.BellRaw\n"

def plainRejects : Bool :=
  match parseRawString plainToy with
  | none => true
  | some _ => false

def importToy : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.BellRaw\n" ++
  "def live : String := r#\"ab\"#\n" ++
  "end SystemsLean.BellRaw\n"

def importRejects : Bool :=
  match parseRawString importToy with
  | none => true
  | some _ => false

def funToy : String :=
  "namespace SystemsLean.BellRaw\n" ++
  "def f (x : Nat) : Nat := x\n" ++
  "end SystemsLean.BellRaw\n"

def funRejects : Bool :=
  match parseRawString funToy with
  | none => true
  | some _ => false

def commentToy : String :=
  "/- outer /- inner -/ still -/\n" ++
  "namespace SystemsLean.BellRaw\n" ++
  "/-- doc -/\n" ++
  "def live : String := r#\"/- x -/\"#\n" ++
  "end SystemsLean.BellRaw\n"

/-- A header comment is not code. A `/ -` inside the raw body stays. -/
def commentAccepts : Bool :=
  match parseRawString commentToy with
  | some m => bodyIs "/- x -/" m
  | none => false

end SystemsLean.BellerophonRawString
