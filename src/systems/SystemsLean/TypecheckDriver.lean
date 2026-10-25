/-
  Module: SystemsLean.TypecheckDriver
  One shape: a Slake typecheck driver.
  Imports are SystemsLean.HostFrontLive... and optionally
  SystemsLean.HostKernel. There is no namespace and no theorem.
  A string literal def and a Bool false def are required.
  def main is required and is not emitted.
  A false Bool stays false. true is emitted only when the source says true.
  The module name is the Module: line. The file name is not stored.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.TypecheckDriver

open SystemsLean.HostTerm

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

def isNameChar (c : Char) : Bool :=
  isIdentChar c || c == '.'

def dropWs (cs : List Char) : List Char :=
  match cs with
  | [] => []
  | c :: rest =>
    if c == ' ' || c == '\t' || c == '\r' then dropWs rest else cs

def readIdent (cs : List Char) (acc : List Char) :
    Prod String (List Char) :=
  match cs with
  | [] => (String.mk acc.reverse, [])
  | c :: rest =>
    if isIdentChar c then readIdent rest (c :: acc)
    else (String.mk acc.reverse, cs)

def readName (cs : List Char) (acc : List Char) :
    Prod String (List Char) :=
  match cs with
  | [] => (String.mk acc.reverse, [])
  | c :: rest =>
    if isNameChar c then readName rest (c :: acc)
    else (String.mk acc.reverse, cs)

def findMod : List Char -> Option String
  | [] => none
  | 'M' :: 'o' :: 'd' :: 'u' :: 'l' :: 'e' :: ':' :: rest =>
    let (name, _) := readName (dropWs rest) []
    if name.startsWith "SystemsLean."
        && name.length > "SystemsLean.".length then
      some name
    else
      findMod rest
  | _ :: rest => findMod rest

/-- In a block comment, dash means the previous character was '-'. -/
def walk (inBlk dash : Bool) (cs acc : List Char) :
    Prod Bool (Prod Bool (List Char)) :=
  match cs with
  | [] => (inBlk, dash, acc.reverse)
  | '/' :: '-' :: more =>
    if inBlk then
      if dash then walk false false ('-' :: more) acc
      else walk true false ('-' :: more) acc
    else
      walk true false more acc
  | '/' :: rest =>
    if inBlk then
      if dash then walk false false rest acc
      else walk true false rest acc
    else
      walk false false rest ('/' :: acc)
  | '-' :: '-' :: more =>
    if inBlk then
      walk true true ('-' :: more) acc
    else
      (false, false, acc.reverse)
  | '-' :: rest =>
    if inBlk then
      walk true true rest acc
    else
      walk false false rest ('-' :: acc)
  | c :: rest =>
    if inBlk then
      walk true false rest acc
    else
      walk false false rest (c :: acc)
termination_by cs.length

def scrubLines (inBlk dash : Bool) (lines : List String)
    (acc : List String) : Option (List String) :=
  match lines with
  | [] => if inBlk then none else some acc.reverse
  | line :: rest =>
    let (in2, dash2, chars) := walk inBlk dash line.toList []
    let text := String.mk chars
    let acc2 := if text == "" then acc else text :: acc
    scrubLines in2 dash2 rest acc2

def trimLeft (cs : List Char) : List Char :=
  match cs with
  | [] => []
  | c :: rest =>
    if c == ' ' || c == '\t' || c == '\r' then trimLeft rest else cs

def trimRight (cs : List Char) : List Char :=
  trimLeft cs.reverse |>.reverse

def trim (s : String) : String :=
  String.mk (trimRight (trimLeft s.toList))

def unquote (s : String) : Option String :=
  match trim s |>.toList with
  | '"' :: rest =>
    match rest.reverse with
    | '"' :: body => some (String.mk body.reverse)
    | _ => none
  | _ => none

structure St where
  liveImport : Bool
  bad : Bool
  sawString : Bool
  sawFalse : Bool
  sawMain : Bool
  cmds : List Cmd
  pend : Option (Prod String Bool)

def empty : St :=
  { liveImport := false
    bad := false
    sawString := false
    sawFalse := false
    sawMain := false
    cmds := []
    pend := none }

def addImport (st : St) (name : String) : St :=
  if name.startsWith "SystemsLean.HostFrontLive" then
    { st with
      liveImport := true
      cmds := Cmd.importModule (n name) :: st.cmds }
  else if name == "SystemsLean.HostKernel"
      || name.startsWith "SystemsLean.HostKernel." then
    { st with cmds := Cmd.importModule (n name) :: st.cmds }
  else
    { st with bad := true }

def emitStr (st : St) (name val : String) : St :=
  { st with
    sawString := true
    cmds :=
      Cmd.def_ (n name) (some HostType.string) (Term.litString val)
        :: st.cmds }

def emitBool (st : St) (name : String) (b : Bool) : St :=
  { st with
    sawFalse := st.sawFalse || !b
    cmds :=
      Cmd.def_ (n name) (some HostType.bool) (Term.litBool b) :: st.cmds }

def dropPrefix (pre cs : List Char) : Option (List Char) :=
  match pre, cs with
  | [], rest => some rest
  | p :: ps, c :: rest =>
    if p == c then dropPrefix ps rest else none
  | _, [] => none

def parseDef (st : St) (line : String) : St :=
  match dropPrefix ['d', 'e', 'f', ' '] line.toList with
  | none => st
  | some cs1 =>
    let (name, cs2) := readIdent (dropWs cs1) []
    if name == "" then st
    else
      match dropWs cs2 with
      | ':' :: cs4 =>
        let (ty, cs6) := readIdent (dropWs cs4) []
        match dropWs cs6 with
        | ':' :: '=' :: cs8 =>
          let rest := trim (String.mk cs8)
          if ty == "String" then
            if rest == "" then { st with pend := some (name, true) }
            else
              match unquote rest with
              | some v => emitStr st name v
              | none => st
          else if ty == "Bool" then
            if rest == "" then { st with pend := some (name, false) }
            else if rest == "false" then emitBool st name false
            else if rest == "true" then emitBool st name true
            else st
          else
            st
        | _ => st
      | _ => st

def forbidden (line : String) : Bool :=
  line.startsWith "namespace " || line.startsWith "theorem "
    || line.startsWith "inductive " || line.startsWith "structure "
    || line.startsWith "example " || line.startsWith "abbrev "
    || line.startsWith "open "

def onLine (st : St) (raw : String) : St :=
  let line := trim raw
  if line == "" then st
  else
    let cleared := { st with pend := none }
    let step : Prod Bool St :=
      match st.pend with
      | none => (false, st)
      | some (name, true) =>
        match unquote line with
        | some v => (true, emitStr cleared name v)
        | none => (false, cleared)
      | some (name, false) =>
        if line == "false" then (true, emitBool cleared name false)
        else if line == "true" then (true, emitBool cleared name true)
        else (false, cleared)
    if step.fst then step.snd
    else
      let st := step.snd
      if st.bad then st
      else if line.startsWith "import " then
        addImport st (trim ((line.drop 7).copy))
      else if forbidden line then { st with bad := true }
      else if line.startsWith "def main " || line.startsWith "def main(" then
        { st with sawMain := true }
      else if line.startsWith "def " then parseDef st line
      else st

def foldLines (st : St) : List String -> St
  | [] => st
  | line :: rest => foldLines (onLine st line) rest

def finish (modName : String) (st : St) : Option Module :=
  if st.bad || !st.liveImport || !st.sawString || !st.sawFalse
      || !st.sawMain || st.cmds.isEmpty then
    none
  else
    some { name := n modName, commands := st.cmds.reverse }

/-- A typecheck driver, or none for every other shape. -/
def parseTypecheckDriver (src : String) : Option Module :=
  match findMod src.toList with
  | none => none
  | some modName =>
    match scrubLines false false (src.splitOn "\n") [] with
    | none => none
    | some lines => finish modName (foldLines empty lines)

end SystemsLean.TypecheckDriver
