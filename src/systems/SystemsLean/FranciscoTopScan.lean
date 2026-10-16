/-
  Module: SystemsLean.FranciscoTopScan
  Shared top-level scan for Francisco shape readers.
  Comments, ordinary strings, char literals, and raw strings are handled.
  A raw string body is not parsed as commands.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm

namespace SystemsLean.FranciscoTopScan

open SystemsLean.HostTerm

inductive Mode where
  | code
  | line
  | blk (d : Nat)
  | str
  | esc
  | rhash (k : Nat)
  | raw (need : Nat)
  | rawClose (need : Nat) (seen : Nat)

inductive RetKind where
  | str
  | bool

def markRaw (out : List Char) : List Char :=
  ' ' :: 'W' :: 'A' :: 'R' :: ' ' :: out

def pushHash : Nat -> List Char -> List Char
  | 0, out => out
  | Nat.succ n, out => pushHash n ('#' :: out)

/-- Top-level characters. Block comments nest. Raw bodies drop out. -/
def walk : List Char -> Mode -> List Char -> Option (List Char)
  | [], Mode.code, out => some out.reverse
  | [], Mode.line, out => some out.reverse
  | [], _, _ => none
  | '\n' :: rest, Mode.line, out =>
    walk rest Mode.code ('\n' :: out)
  | _ :: rest, Mode.line, out =>
    walk rest Mode.line out
  | '/' :: '-' :: rest, Mode.blk d, out =>
    walk rest (Mode.blk (d + 1)) out
  | '-' :: '/' :: rest, Mode.blk d, out =>
    if d <= 1 then walk rest Mode.code out
    else walk rest (Mode.blk (d - 1)) out
  | '\n' :: rest, Mode.blk d, out =>
    walk rest (Mode.blk d) ('\n' :: out)
  | _ :: rest, Mode.blk d, out =>
    walk rest (Mode.blk d) out
  | c :: rest, Mode.esc, out =>
    walk rest Mode.str (c :: '\\' :: out)
  | '\\' :: rest, Mode.str, out =>
    walk rest Mode.esc out
  | '"' :: rest, Mode.str, out =>
    walk rest Mode.code ('"' :: out)
  | c :: rest, Mode.str, out =>
    walk rest Mode.str (c :: out)
  | '#' :: rest, Mode.rawClose need seen, out =>
    if seen + 1 == need then walk rest Mode.code (markRaw out)
    else walk rest (Mode.rawClose need (seen + 1)) out
  | '"' :: rest, Mode.rawClose need _, out =>
    walk rest (Mode.rawClose need 0) out
  | '\n' :: rest, Mode.rawClose need _, out =>
    walk rest (Mode.raw need) ('\n' :: out)
  | _ :: rest, Mode.rawClose need _, out =>
    walk rest (Mode.raw need) out
  | '"' :: rest, Mode.raw need, out =>
    if need == 0 then walk rest Mode.code (markRaw out)
    else walk rest (Mode.rawClose need 0) out
  | '\n' :: rest, Mode.raw need, out =>
    walk rest (Mode.raw need) ('\n' :: out)
  | _ :: rest, Mode.raw need, out =>
    walk rest (Mode.raw need) out
  | '#' :: rest, Mode.rhash k, out =>
    walk rest (Mode.rhash (k + 1)) out
  | '"' :: rest, Mode.rhash k, out =>
    walk rest (Mode.raw k) out
  | c :: rest, Mode.rhash k, out =>
    walk rest Mode.code (c :: pushHash k ('r' :: out))
  | '-' :: '-' :: rest, Mode.code, out =>
    walk rest Mode.line out
  | '/' :: '-' :: rest, Mode.code, out =>
    walk rest (Mode.blk 1) out
  | '\'' :: '\\' :: '\'' :: '\'' :: rest, Mode.code, out =>
    walk rest Mode.code out
  | '\'' :: '\\' :: _ :: '\'' :: rest, Mode.code, out =>
    walk rest Mode.code out
  | '\'' :: _ :: '\'' :: rest, Mode.code, out =>
    walk rest Mode.code out
  | '"' :: rest, Mode.code, out =>
    walk rest Mode.str ('"' :: out)
  | 'r' :: '"' :: rest, Mode.code, out =>
    walk rest (Mode.raw 0) out
  | 'r' :: '#' :: rest, Mode.code, out =>
    walk rest (Mode.rhash 1) out
  | c :: rest, Mode.code, out =>
    walk rest Mode.code (c :: out)

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\t' || c == '\r'

def trim (s : String) : String :=
  let rec dropL : List Char -> List Char
    | [] => []
    | c :: rest => if isWs c then dropL rest else c :: rest
  String.mk (dropL (dropL s.toList.reverse).reverse)

def dropN (s : String) (n : Nat) : String :=
  String.mk (s.toList.drop n)

def hasPart (s part : String) : Bool :=
  part != "" && (s.splitOn part).length > 1

def hasSuffix (s suf : String) : Bool :=
  List.isPrefixOf suf.toList.reverse s.toList.reverse

def identChar (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')
    || ('0' <= c && c <= '9') || c == '_' || c == '\''

def takeIdent (s : String) : String :=
  String.mk (s.toList.takeWhile identChar)

def dropLead (s pre : String) : Option String :=
  let p := pre ++ " "
  if s.startsWith p then some (trim (dropN s p.length)) else none

def dropMods (fuel : Nat) (s : String) : String :=
  match fuel with
  | 0 => s
  | Nat.succ n =>
    match dropLead s "private" with
    | some r => dropMods n r
    | none =>
      match dropLead s "noncomputable" with
      | some r => dropMods n r
      | none =>
        match dropLead s "protected" with
        | some r => dropMods n r
        | none =>
          match dropLead s "partial" with
          | some r => dropMods n r
          | none =>
            match dropLead s "unsafe" with
            | some r => dropMods n r
            | none => s

def joinSp : List String -> String
  | [] => ""
  | [s] => s
  | s :: rest => s ++ " " ++ joinSp rest

def beforeAssign : List Char -> Option (List Char)
  | [] => none
  | ':' :: '=' :: _ => some []
  | c :: rest =>
    match beforeAssign rest with
    | none => none
    | some pre => some (c :: pre)

def afterAssign : List Char -> Option (List Char)
  | [] => none
  | ':' :: '=' :: rest => some rest
  | _ :: rest => afterAssign rest

def assignPre (s : String) : Option String :=
  match beforeAssign s.toList with
  | none => none
  | some cs => some (String.mk cs)

def assignRhs (s : String) : Option String :=
  match afterAssign s.toList with
  | none => none
  | some cs => some (String.mk cs)

def retKind (flat : String) : Option RetKind :=
  match assignPre flat with
  | none => none
  | some pre =>
    let t := trim pre
    if hasSuffix t "String" then some RetKind.str
    else if hasSuffix t "Bool" then some RetKind.bool
    else none

def takeStr : List Char -> List Char -> Option (Prod String (List Char))
  | [], _ => none
  | '"' :: rest, acc => some (String.mk acc.reverse, rest)
  | '\\' :: 'n' :: rest, acc => takeStr rest ('\n' :: acc)
  | '\\' :: 't' :: rest, acc => takeStr rest ('\t' :: acc)
  | '\\' :: '\\' :: rest, acc => takeStr rest ('\\' :: acc)
  | '\\' :: '"' :: rest, acc => takeStr rest ('"' :: acc)
  | '\\' :: c :: rest, acc => takeStr rest (c :: acc)
  | c :: rest, acc => takeStr rest (c :: acc)

def asString (rhs : String) : Option String :=
  match (trim rhs).toList with
  | '"' :: rest =>
    match takeStr rest [] with
    | some (lit, left) =>
      if trim (String.mk left) == "" then some lit else none
    | none => none
  | _ => none

def exactBool (t : String) : Option Bool :=
  if t == "true" then some true
  else if t == "false" then some false
  else none

def chunkBool : List String -> Bool -> Option Bool
  | [], _ => none
  | line :: rest, waiting =>
    match assignRhs line with
    | some rhs =>
      let t := trim rhs
      if t == "" then chunkBool rest true else exactBool t
    | none =>
      if waiting then
        let t := trim line
        if t == "" then chunkBool rest true else exactBool t
      else chunkBool rest false

def chunkStr : List String -> Bool -> Option String
  | [], _ => none
  | line :: rest, waiting =>
    match assignRhs line with
    | some rhs =>
      let t := trim rhs
      if t == "" then chunkStr rest true else asString t
    | none =>
      if waiting then
        let t := trim line
        if t == "" then chunkStr rest true else asString t
      else chunkStr rest false

structure Scan where
  imports : List String
  namespaces : List String
  ends : List String
  theoremN : Nat
  exampleN : Nat
  mainN : Nat
  structN : Nat
  rawN : Nat
  bools : List (Prod String Bool)
  strs : List (Prod String String)
  hasAppend : Bool
  hasDrop : Bool

def zero : Scan :=
  { imports := [], namespaces := [], ends := [], theoremN := 0,
    exampleN := 0, mainN := 0, structN := 0, rawN := 0, bools := [],
    strs := [], hasAppend := false, hasDrop := false }

def unAttr (t : String) : String :=
  if t.startsWith "@[" then
    match afterBracket t.toList with
    | some rest => trim (String.mk rest)
    | none => t
  else t
where
  afterBracket : List Char -> Option (List Char)
    | [] => none
    | ']' :: rest => some rest
    | _ :: rest => afterBracket rest

def isStart (t : String) : Bool :=
  t.startsWith "def " || t.startsWith "theorem "
    || t.startsWith "example" || t.startsWith "structure "
    || t.startsWith "import " || t.startsWith "namespace "
    || t.startsWith "end " || t == "end" || t.startsWith "axiom "
    || t.startsWith "inductive " || t.startsWith "set_option "
    || t == "mutual" || t.startsWith "mutual "
    || t.startsWith "abbrev "
    || t.startsWith "instance " || t.startsWith "class "
    || t.startsWith "private " || t.startsWith "noncomputable "
    || t.startsWith "protected " || t.startsWith "partial "
    || t.startsWith "unsafe " || t.startsWith "@"
    || t.startsWith "#" || t.startsWith "section"
    || t.startsWith "variable " || t.startsWith "open "

def addLine (chunks : List (List String)) (raw : String) :
    List (List String) :=
  let t := unAttr (trim raw)
  if t == "" then chunks
  else if isStart t then [t] :: chunks
  else
    match chunks with
    | [] => chunks
    | h :: rest => (h ++ [t]) :: rest

def mutualLine (t : String) : Bool :=
  t == "mutual" || t.startsWith "mutual "

def chunkHasMutual (body : String) (lines : List String) : Bool :=
  mutualLine body || lines.any (fun t => mutualLine (trim t))

def tacticWord (s : String) : Bool :=
  s == "by" || s == "decide" || s == "native_decide"

/-- Whole ident tokens only. Underscore keeps native_decide one word. -/
def hasTacticWord (s : String) : Bool :=
  go s.toList []
where
  go : List Char -> List Char -> Bool
    | [], [] => false
    | [], cur => tacticWord (String.mk cur.reverse)
    | c :: rest, cur =>
      if identChar c then go rest (c :: cur)
      else if tacticWord (String.mk cur.reverse) then true
      else go rest []

def tacticRhs (flat : String) : Bool :=
  match assignRhs flat with
  | none => false
  | some rhs => hasTacticWord rhs

def classify (b : Scan) (lines : List String) : Scan :=
  let flat := joinSp lines
  let b :=
    if hasPart flat "++" then { b with hasAppend := true } else b
  let b :=
    if hasPart flat "RAW" then { b with rawN := b.rawN + 1 } else b
  let body := dropMods 6 flat
  let b :=
    if chunkHasMutual body lines then { b with hasDrop := true } else b
  if body.startsWith "import " then
    let m := trim (dropN body 7)
    if m == "" || m == "RAW" then b
    else { b with imports := b.imports ++ [m] }
  else if body.startsWith "namespace " then
    let m := trim (dropN body 10)
    if m == "" then b
    else { b with namespaces := b.namespaces ++ [m] }
  else if body == "end" then b
  else if body.startsWith "end " then
    let m := trim (dropN body 4)
    if m == "" then b else { b with ends := b.ends ++ [m] }
  else if body.startsWith "theorem " then
    let b := { b with theoremN := b.theoremN + 1 }
    if tacticRhs flat then { b with hasDrop := true } else b
  else if body.startsWith "example" then
    let b := { b with exampleN := b.exampleN + 1 }
    if tacticRhs flat then { b with hasDrop := true } else b
  else if body.startsWith "structure " then
    { b with structN := b.structN + 1 }
  else if body.startsWith "def " then
    let rest := trim (dropN body 4)
    let name := takeIdent rest
    if name == "main" then { b with mainN := b.mainN + 1, hasDrop := true }
    else if name == "" then { b with hasDrop := true }
    else
      match retKind flat with
      | some RetKind.bool =>
        match chunkBool lines false with
        | some v => { b with bools := b.bools ++ [(name, v)] }
        | none => { b with hasDrop := true }
      | some RetKind.str =>
        match chunkStr lines false with
        | some lit => { b with strs := b.strs ++ [(name, lit)] }
        | none => { b with hasDrop := true }
      | none => { b with hasDrop := true }
  else b

def gather : List String -> List (List String) -> List (List String)
  | [], acc => acc
  | line :: rest, acc => gather rest (addLine acc line)

def finish (chunks : List (List String)) : Scan :=
  go chunks.reverse zero
where
  go : List (List String) -> Scan -> Scan
    | [], b => b
    | c :: rest, b => go rest (classify b c)

def scanSource (src : String) : Option Scan :=
  match walk src.toList Mode.code [] with
  | none => none
  | some cs => some (finish (gather ((String.mk cs).splitOn "\n") []))

def hasImp (sc : Scan) (part : String) : Bool :=
  sc.imports.any (fun m => hasPart m part)

def nsHead (sc : Scan) : String :=
  match sc.namespaces with
  | n :: _ => n
  | [] => ""

def nsCount (sc : Scan) : Nat :=
  sc.namespaces.length

def litCount (sc : Scan) : Nat :=
  sc.bools.length + sc.strs.length

def boolSuf (sc : Scan) (suf : String) : Option Bool :=
  let xs := sc.bools.filter (fun p => hasSuffix p.fst suf)
  match xs with
  | [] => none
  | _ =>
    if xs.any (fun p => p.snd == true) then some true else some false

def strExact (sc : Scan) (name : String) : Option String :=
  match sc.strs.filter (fun p => p.fst == name) with
  | (_, lit) :: _ => some lit
  | [] => none

def cmdsOf (sc : Scan) (modName : String) (useNs : Bool) : Option Module :=
  if modName.isEmpty then none
  else
    let imps := (sc.imports.take 12).map (fun m => Cmd.importModule (n m))
    let nsCmd : List Cmd :=
      if useNs && !(nsHead sc).isEmpty then
        [Cmd.namespace (n (nsHead sc))]
      else []
    let endName :=
      match sc.ends with
      | e :: _ => if e.isEmpty then nsHead sc else e
      | [] => nsHead sc
    let endCmd : List Cmd :=
      if useNs && !endName.isEmpty then [Cmd.endNamespace (n endName)]
      else []
    let falses := sc.bools.filter (fun p => p.snd == false)
    let trues := sc.bools.filter (fun p => p.snd == true)
    let bcmds := (falses ++ trues).map (fun p =>
      Cmd.def_ (n p.fst) (some HostType.bool) (Term.litBool p.snd))
    let scmds := sc.strs.map (fun p =>
      Cmd.def_ (n p.fst) (some HostType.string) (Term.litString p.snd))
    let head := imps ++ nsCmd
    let tail := endCmd
    let body := bcmds ++ scmds
    let room : Nat := 58
    let head2 := head.take room
    let left := room - head2.length
    let tail2 := if left == 0 then [] else tail
    let midRoom := left - tail2.length
    let mid := body.take midRoom
    let cmds := head2 ++ mid ++ tail2
    if cmds.isEmpty then none else some { name := n modName, commands := cmds }

/-- Typecheck drivers: no namespace, one HostFrontLive import, a main,
    FullHost false, OwnsPackageTypecheck not true, stageId a string. -/
def parseTypecheckDriver (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc != 0 then none
    else if sc.theoremN != 0 || sc.structN != 0 || sc.rawN != 0 then none
    else if sc.mainN == 0 then none
    else if !hasImp sc "HostFrontLive" then none
    else if boolSuf sc "FullHost" != some false then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else
      match strExact sc "stageId" with
      | none => none
      | some lit =>
        if lit.isEmpty then none
        else cmdsOf sc ("SystemsLean." ++ lit) false

end SystemsLean.FranciscoTopScan
