/-
  Module: SystemsLean.OriginalDeclaration
  Calls Lean.Kernel.Environment.addDecl on declsForAdd. A closed
  def is Lean.Declaration.defnDecl. ComposeSsotSpec is
  Lean.Declaration.inductDecl on that list when the parser hit
  the structure, not a defnDecl of a literal. deriving Repr is
  not encoded. containsStr is a defnDecl. ssotBlock is a
  defnDecl. requireFile is a defnDecl. planApplyBodySpecs is a
  defnDecl. freestandingCapableComposeReadOneSsot is a defnDecl.
  The next command, buildComposeMarker, is not translated, so
  that file is not accepted.
  importModules loads the
  file's import lines. A def outside the fragment is unclaimed.
  `:= do` stays unclaimed unless every statement in that do-block
  has an Expr and the trimmed main lines are one of four lists:
  IrGraph, Linear, LinearUseFail, or CapableCompose. A `:= do`
  file outside those lists stays unclaimed. CapableCompose is not
  accepted: parseLines of its prefix is unclaimed at
  buildComposeMarker.
  set_option does not accept a file by itself.
  Does not call Lean.Elab.processCommands, processHeader, elabTerm,
  elabMutualDef, or elabFunValues.
  Does not invent Term.litNat or Term.litString "pin".
  `matrixSurfaceOk_true` is `Declaration.thmDecl`. The type is
  `matrixSurfaceOk = true`. The value is `Eq.refl` applied to
  `matrixSurfaceOk`. `by decide` is not copied. A file that also
  has another declaration is not accepted. The bool stays false.
  slakeOwnsPackageTypecheck stays false. FullHost stays false.
  ASCII only.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import Lean.Declaration
import Lean.Expr
import Lean.Environment
import Lean.AddDecl
import Lean.Data.Options

namespace SystemsLean.OriginalDeclaration

/-- Honesty: this module does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Honesty: FullHost stays false. -/
def fullHost : Bool := false

/-- Three-way result. accept is the only success.
    unclaimed falls through the existing checker.
    notAccepted is a fragment the kernel did not take.
    It is not an accept. -/
inductive Claim where
  | accept
  | unclaimed
  | notAccepted
  deriving Inhabited, BEq

inductive Kind where
  | string
  | nat
  | bool
  deriving Inhabited, BEq

/-- One in-fragment def, already qualified by the namespaces the
    file wrote. -/
structure ParsedDef where
  declName : Lean.Name
  typeConst : Lean.Name
  value : Lean.Expr
  /-- Kernel type when it is not `Expr.const typeConst []`. -/
  typeExpr : Option Lean.Expr := none
  deriving Inhabited

/-- Do-scanner phase. 0 idle, 1 saw colon, 2 saw :=, 3 reading the
    next identifier. -/
structure DoSt where
  phase : Nat
  ident : List Char
  hit : Bool
  deriving Inhabited

structure Scan where
  depth : Nat
  str : Bool
  esc : Bool
  doSt : DoSt
  deriving Inhabited

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\t' || c == '\r' || c == '\n'

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isIdentStart (c : Char) : Bool :=
  ('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z') || c == '_'

def isIdentCont (c : Char) : Bool :=
  isIdentStart c || isDigit c || c == '\''

def finishDo (st : DoSt) : DoSt :=
  if st.phase == 3 then
    let word := String.ofList st.ident.reverse
    { phase := 0, ident := [], hit := st.hit || word == "do" }
  else
    st

/-- Real control flow for `:= do`. A hit sticks. Comments and
    string contents are not fed here. -/
def onCode (st : DoSt) (c : Char) : DoSt :=
  if st.hit then
    st
  else if st.phase == 0 then
    if c == ':' then { st with phase := 1 } else st
  else if st.phase == 1 then
    if c == '=' then { st with phase := 2 }
    else if c == ':' then st
    else { st with phase := 0 }
  else if st.phase == 2 then
    if isWs c then
      st
    else if isIdentStart c then
      { st with phase := 3, ident := [c] }
    else if c == ':' then
      { st with phase := 1, ident := [] }
    else
      { st with phase := 0, ident := [] }
  else if isIdentCont c then
    { st with ident := c :: st.ident }
  else
    let word := String.ofList st.ident.reverse
    let hit := st.hit || word == "do"
    if c == ':' then
      { phase := 1, ident := [], hit := hit }
    else
      { phase := 0, ident := [], hit := hit }

def closeIdent (st : DoSt) : DoSt :=
  if st.phase == 3 then finishDo st else st

def scanLine (st : Scan) (acc : List Char) (cs : List Char) : Prod Scan (List Char) :=
  match hcs : cs with
  | [] =>
    let st :=
      if st.str || st.depth != 0 then st
      else { st with doSt := onCode st.doSt ' ' }
    (st, acc.reverse)
  | c :: rest =>
    if st.depth != 0 then
      if c == '-' then
        match hrest : rest with
        | '/' :: rest2 =>
          let depth := st.depth - 1
          have : rest2.length < cs.length := by
            simp [hcs, hrest, List.length_cons]
            omega
          scanLine { st with depth := depth } acc rest2
        | _ =>
          have _seen := hrest
          have : rest.length < cs.length := by
            cases hcs
            simp_all [List.length_cons, List.cons.injEq] <;> omega
          scanLine st acc rest
      else if c == '/' then
        match hrest : rest with
        | '-' :: rest2 =>
          have : rest2.length < cs.length := by
            simp [hcs, hrest, List.length_cons]
            omega
          scanLine { st with depth := st.depth + 1 } acc rest2
        | _ =>
          have _seen := hrest
          have : rest.length < cs.length := by
            cases hcs
            simp_all [List.length_cons, List.cons.injEq] <;> omega
          scanLine st acc rest
      else
        have : rest.length < cs.length := by
          rw [hcs, List.length_cons]
          exact Nat.lt_succ_self rest.length
        scanLine st acc rest
    else if st.esc then
      have : rest.length < cs.length := by
        rw [hcs, List.length_cons]
        exact Nat.lt_succ_self rest.length
      scanLine { st with esc := false } (c :: acc) rest
    else if st.str && c == '\\' then
      have : rest.length < cs.length := by
        rw [hcs, List.length_cons]
        exact Nat.lt_succ_self rest.length
      scanLine { st with esc := true } (c :: acc) rest
    else if st.str && c == '"' then
      have : rest.length < cs.length := by
        rw [hcs, List.length_cons]
        exact Nat.lt_succ_self rest.length
      scanLine { st with str := false } (c :: acc) rest
    else if st.str then
      have : rest.length < cs.length := by
        rw [hcs, List.length_cons]
        exact Nat.lt_succ_self rest.length
      scanLine st (c :: acc) rest
    else if c == '-' then
      let tail := rest
      let lineComment : Bool :=
        match rest with
        | '-' :: _ => true
        | _ => false
      if lineComment then
        ({ st with doSt := closeIdent st.doSt }, acc.reverse)
      else
        have : tail.length < cs.length := by
          rw [hcs, List.length_cons]
          exact Nat.lt_succ_self tail.length
        scanLine { st with doSt := onCode st.doSt c } (c :: acc) tail
    else if c == '/' then
      match hrest : rest with
      | '-' :: rest2 =>
        have : rest2.length < cs.length := by
          simp [hcs, hrest, List.length_cons]
          omega
        scanLine { st with depth := st.depth + 1, doSt := closeIdent st.doSt } acc rest2
      | _ =>
        have _seen := hrest
        have : rest.length < cs.length := by
          cases hcs
          simp_all [List.length_cons, List.cons.injEq] <;> omega
        scanLine { st with doSt := onCode st.doSt c } (c :: acc) rest
    else if c == '"' then
      let doSt := closeIdent st.doSt
      let doSt := { doSt with phase := 0, ident := [] }
      have : rest.length < cs.length := by
        rw [hcs, List.length_cons]
        exact Nat.lt_succ_self rest.length
      scanLine { st with str := true, doSt := doSt } (c :: acc) rest
    else
      have : rest.length < cs.length := by
        rw [hcs, List.length_cons]
        exact Nat.lt_succ_self rest.length
      scanLine { st with doSt := onCode st.doSt c } (c :: acc) rest
termination_by cs.length
decreasing_by
  all_goals (first | (rw [hcs] at this; exact this) | exact this)

structure Stripped where
  lines : List String
  sawAssignDo : Bool
  deriving Inhabited

def stripGo (st : Scan) (acc : List String) : List String -> Stripped
  | [] =>
    { lines := acc.reverse, sawAssignDo := st.doSt.hit }
  | line :: rest =>
    match scanLine st [] line.toList with
    | (st2, code) =>
      stripGo st2 (String.ofList code :: acc) rest

def stripSource (src : String) : Stripped :=
  stripGo default [] (src.splitOn "\n")

/-- True when code outside comments and strings contains `:=` then
    the identifier `do`. Such a file stays unclaimed unless every
    statement of that do-block is translated. -/
def refusesAssignDo (src : String) : Bool :=
  (stripSource src).sawAssignDo

def skipWs : List Char -> List Char
  | [] => []
  | c :: rest =>
    if isWs c then skipWs rest else c :: rest

def readIdent : List Char -> Option (Prod String (List Char))
  | [] => none
  | c :: rest =>
    if !isIdentStart c then none
    else
      let rec go (acc : List Char) : List Char -> Prod String (List Char)
        | [] => (String.ofList acc.reverse, [])
        | d :: rest2 =>
          if isIdentCont d then go (d :: acc) rest2
          else (String.ofList acc.reverse, d :: rest2)
      some (go [c] rest)

def readQual (cs : List Char) : Option (Prod Lean.Name (List Char)) :=
  match readIdent cs with
  | none => none
  | some (id, rest) =>
    let rec dots (fuel : Nat) (acc : Lean.Name) (cs : List Char) :
        Option (Prod Lean.Name (List Char)) :=
      match fuel with
      | 0 => none
      | fuel + 1 =>
        match cs with
        | '.' :: rest2 =>
          match readIdent rest2 with
          | none => none
          | some (id2, rest3) =>
            dots fuel (Lean.Name.str acc id2) rest3
        | rest2 => some (acc, rest2)
    dots (cs.length + 1) (Lean.Name.str Lean.Name.anonymous id) rest

def afterWord (word : String) (cs : List Char) : Option (List Char) :=
  let cs := skipWs cs
  match readIdent cs with
  | some (w, rest) =>
    if w == word then some rest else none
  | none => none

def firstWord (cs : List Char) : Option String :=
  match readIdent (skipWs cs) with
  | some (w, _) => some w
  | none => none

def currentNs (ns : List Lean.Name) : Lean.Name :=
  ns.foldr (fun n acc => acc ++ n) Lean.Name.anonymous

def qualify (ns : List Lean.Name) (ident : String) : Lean.Name :=
  Lean.Name.str (currentNs ns) ident

def typeConstOf : Kind -> Lean.Name
  | .string => Lean.Name.str Lean.Name.anonymous "String"
  | .nat => Lean.Name.str Lean.Name.anonymous "Nat"
  | .bool => Lean.Name.str Lean.Name.anonymous "Bool"

def popNs (ns : List Lean.Name) (endName : Option Lean.Name) : Option (List Lean.Name) :=
  match ns with
  | [] => none
  | top :: rest =>
    match endName with
    | none => some rest
    | some n =>
      if n == top then some rest else none

def natOfDigits (cs : List Char) : Option Nat :=
  match cs with
  | [] => none
  | _ =>
    if cs.all isDigit then
      some (cs.foldl (fun acc c => acc * 10 + (c.toNat - '0'.toNat)) 0)
    else
      none

def parseNatRest (cs : List Char) : Option Nat :=
  let cs := skipWs cs
  let rec take (acc : List Char) : List Char -> Option Nat
    | [] => natOfDigits acc.reverse
    | c :: rest =>
      if isDigit c then take (c :: acc) rest
      else if (skipWs (c :: rest)).isEmpty then natOfDigits acc.reverse
      else none
  take [] cs

/-- Quoted string. Unknown escapes and an unclosed quote are none. -/
def parseString (cs : List Char) : Option (Prod String (List Char)) :=
  match cs with
  | '"' :: rest =>
    let rec go (acc : List Char) : List Char -> Option (Prod String (List Char))
      | [] => none
      | '"' :: rest2 => some (String.ofList acc.reverse, rest2)
      | '\\' :: [] => none
      | '\\' :: c :: rest2 =>
        let ch : Option Char :=
          if c == 'n' then some '\n'
          else if c == 't' then some '\t'
          else if c == '\\' then some '\\'
          else if c == '"' then some '"'
          else if c == '\'' then some '\''
          else none
        match ch with
        | none => none
        | some c2 => go (c2 :: acc) rest2
      | c :: rest2 => go (c :: acc) rest2
    go [] rest
  | _ => none

def onlyWs (cs : List Char) : Bool :=
  (skipWs cs).isEmpty

def nameValue (declName typeConst : Lean.Name) (cs : List Char) : Option ParsedDef :=
  match readQual (skipWs cs) with
  | some (n, rest) =>
    if onlyWs rest then
      some {
        declName := declName
        typeConst := typeConst
        value := Lean.Expr.const n []
      }
    else
      none
  | none => none

/-- `export Bool (false true)` is an alias, not a kernel constant.
    The constructors are `Bool.true` and `Bool.false`. -/
def boolValue (declName typeConst : Lean.Name) (cs : List Char) : Option ParsedDef :=
  match readQual (skipWs cs) with
  | some (n, rest) =>
    if onlyWs rest && (n == `true) then
      some {
        declName := declName
        typeConst := typeConst
        value := Lean.mkConst `Bool.true
      }
    else if onlyWs rest && (n == `false) then
      some {
        declName := declName
        typeConst := typeConst
        value := Lean.mkConst `Bool.false
      }
    else
      nameValue declName typeConst cs
  | none => none

def valueOf (kind : Kind) (declName typeConst : Lean.Name) (cs : List Char) : Option ParsedDef :=
  let cs := skipWs cs
  match kind with
  | .nat =>
    match parseNatRest cs with
    | none => none
    | some n =>
      some {
        declName := declName
        typeConst := typeConst
        value := Lean.mkNatLit n
      }
  | .string =>
    match cs with
    | '"' :: _ =>
      match parseString cs with
      | some (s, rest) =>
        if onlyWs rest then
          some {
            declName := declName
            typeConst := typeConst
            value := Lean.mkStrLit s
          }
        else
          none
      | none => none
    | _ => nameValue declName typeConst cs
  | .bool => boolValue declName typeConst cs

/-- ConstantVal fields name, levelParams, type, plus DefinitionVal
    fields value, hints, safety, and all. -/
def declarationOf (d : ParsedDef) : Lean.Declaration :=
  let type :=
    match d.typeExpr with
    | some t => t
    | none => Lean.Expr.const d.typeConst []
  Lean.Declaration.defnDecl {
    name := d.declName
    levelParams := []
    type := type
    value := d.value
    hints := Lean.ReducibilityHints.abbrev
    safety := Lean.DefinitionSafety.safe
    all := [d.declName]
  }

/-- `declarationOf` for each def, in order. Each result is
    `Declaration.defnDecl`. Not applied to `composeSsotSpecDecl`. -/
def defnDecls : List ParsedDef -> List Lean.Declaration
  | [] => []
  | d :: rest => declarationOf d :: defnDecls rest

inductive Head where
  | skip
  | unclaimed
  | pushNs (n : Lean.Name)
  | popTo (ns : List Lean.Name)
  | imp (i : Lean.Import)
  | need (declName typeConst : Lean.Name) (kind : Kind)
  | got (d : ParsedDef)

def parseImport (cs : List Char) : Option Lean.Import :=
  let rec mods (fuel : Nat) (cs : List Char) : Option (List Char) :=
    match fuel with
    | 0 => none
    | fuel + 1 =>
      let cs := skipWs cs
      match readIdent cs with
      | some (w, rest) =>
        if w == "public" || w == "meta" || w == "private" then
          mods fuel rest
        else if w == "import" then
          some rest
        else
          none
      | none => none
  match mods (cs.length + 1) cs with
  | none => none
  | some rest =>
    match readQual (skipWs rest) with
    | none => none
    | some (n, rest2) =>
      if onlyWs rest2 then some { module := n } else none

def parseNamespace (nsLine : List Char) : Option Lean.Name :=
  match afterWord "namespace" nsLine with
  | none => none
  | some rest =>
    match readQual (skipWs rest) with
    | none => none
    | some (n, rest2) =>
      if onlyWs rest2 then some n else none

def parseEnd (ns : List Lean.Name) (cs : List Char) : Option (List Lean.Name) :=
  match afterWord "end" cs with
  | none => none
  | some rest =>
    let rest := skipWs rest
    if rest.isEmpty then
      popNs ns none
    else
      match readQual rest with
      | none => none
      | some (n, rest2) =>
        if onlyWs rest2 then popNs ns (some n) else none

def parseDefLine (ns : List Lean.Name) (cs : List Char) : Head :=
  match afterWord "def" cs with
  | none => .unclaimed
  | some rest =>
    match readIdent (skipWs rest) with
    | none => .unclaimed
    | some (id, rest) =>
      match skipWs rest with
      | ':' :: rest =>
        match readIdent (skipWs rest) with
        | none => .unclaimed
        | some (ty, rest) =>
          let kind? :=
            if ty == "String" then some Kind.string
            else if ty == "Nat" then some Kind.nat
            else if ty == "Bool" then some Kind.bool
            else none
          match kind? with
          | none => .unclaimed
          | some kind =>
            match skipWs rest with
            | ':' :: '=' :: rest =>
              let declName := qualify ns id
              let typeConst := typeConstOf kind
              let rest := skipWs rest
              if rest.isEmpty then
                .need declName typeConst kind
              else
                match valueOf kind declName typeConst rest with
                | none => .unclaimed
                | some d => .got d
            | _ => .unclaimed
      | _ => .unclaimed

def classify (ns : List Lean.Name) (line : String) : Head :=
  let cs := line.toList
  if (skipWs cs).isEmpty then
    .skip
  else
    match firstWord cs with
    | none => .unclaimed
    | some w =>
      if w == "set_option" || w == "open" then
        .skip
      else if w == "import" || w == "public" || w == "meta" || w == "private" then
        match parseImport cs with
        | some i => .imp i
        | none => .unclaimed
      else if w == "namespace" then
        match parseNamespace cs with
        | some n => .pushNs n
        | none => .unclaimed
      else if w == "end" then
        match parseEnd ns cs with
        | some ns2 => .popTo ns2
        | none => .unclaimed
      else if w == "def" then
        parseDefLine ns cs
      else
        .unclaimed

inductive Parsed where
  | unclaimed
  | ready (imports : Array Lean.Import) (defs : List ParsedDef)
      (sawComposeSsotSpec : Bool)

inductive Pending where
  | idle
  | need (declName typeConst : Lean.Name) (kind : Kind)

def trimLeftCs : List Char -> List Char
  | [] => []
  | c :: rest =>
    if isWs c then trimLeftCs rest else c :: rest

def trimLine (s : String) : String :=
  let core := trimLeftCs s.toList
  String.ofList (trimLeftCs core.reverse).reverse

/-- `SystemsLean.CapableCompose.ComposeSsotSpec`. -/
def composeSsotSpecName : Lean.Name :=
  `SystemsLean.CapableCompose.ComposeSsotSpec

/-- One explicit `String` field. Outer forall is the first field. -/
def forallString (binder : Lean.Name) (body : Lean.Expr) : Lean.Expr :=
  Lean.Expr.forallE binder (Lean.mkConst `String) body Lean.BinderInfo.default

/-- `ComposeSsotSpec.mk` : the five written fields, then the type.
    Field order is the source order. Not a literal. -/
def composeSsotSpecCtorType : Lean.Expr :=
  forallString `base
    (forallString `token
      (forallString `headerBlock
        (forallString `bodyBlock
          (forallString `role
            (Lean.mkConst composeSsotSpecName)))))

/-- Kernel declaration for the structure type and its one constructor.
    `nparams` is 0. The type is `Type`. `deriving Repr` is not here.
    `declarationOf` is not used: that builds a `defnDecl`. -/
def composeSsotSpecDecl : Lean.Declaration :=
  Lean.Declaration.inductDecl [] 0
    [{
      name := composeSsotSpecName
      type := Lean.mkSort (Lean.Level.succ Lean.Level.zero)
      ctors := [{
        name := Lean.Name.str composeSsotSpecName "mk"
        type := composeSsotSpecCtorType
      }]
    }]
    false

/-- True when `d` is the ComposeSsotSpec inductive, not a `defnDecl`. -/
def composeSsotSpecIsInduct (d : Lean.Declaration) : Bool :=
  match d with
  | .inductDecl lparams nparams types isUnsafe =>
    lparams == [] && nparams == 0 && !isUnsafe &&
      (match types with
        | t :: [] =>
          t.name == composeSsotSpecName &&
            (match t.ctors with
              | c :: [] => c.name == Lean.Name.str composeSsotSpecName "mk"
              | _ => false)
        | _ => false)
  | _ => false

/-- List `addCount` passes to `Kernel.Environment.addDecl`.
    When the parser hit the structure, the head is
    `composeSsotSpecDecl` (`Declaration.inductDecl`).
    `declarationOf` is not applied to that inductive.
    Defs on the tail are `defnDecl`. Not `Term.litNat`.
    Not `Expr.lit`. -/
def declsForAdd (sawComposeSsotSpec : Bool) (ds : List ParsedDef) :
    List Lean.Declaration :=
  let defs := defnDecls ds
  if sawComposeSsotSpec then
    composeSsotSpecDecl :: defs
  else
    defs

/-- One addDecl per declaration on `declsForAdd`. none if any
    call returns an exception. The Nat is how many returned ok. -/
def addCount (env : Lean.Kernel.Environment) (opts : Lean.Options)
    (sawComposeSsotSpec : Bool) (ds : List ParsedDef) : Option Nat :=
  let rec go (env : Lean.Kernel.Environment) (n : Nat) :
      List Lean.Declaration -> Option Nat
    | [] => some n
    | d :: rest =>
      match Lean.Kernel.Environment.addDecl env opts d with
      | .ok env2 => go env2 (n + 1) rest
      | .error _ => none
  go env 0 (declsForAdd sawComposeSsotSpec ds)

/-- importModules on the file's imports, then addDecl once per
    declaration. False when the import throws, addDecl throws,
    the ok count is not the declaration count, or the list is
    empty. -/
def checkFragmentIO (imports : Array Lean.Import) (sawComposeSsotSpec : Bool)
    (ds : List ParsedDef) : IO Bool := do
  if ds.isEmpty && !sawComposeSsotSpec then
    return false
  try
    let env <- Lean.importModules imports Lean.Options.empty
    let kenv := Lean.Environment.toKernelEnv env
    match addCount kenv Lean.Options.empty sawComposeSsotSpec ds with
    | some n =>
      let extra : Nat := if sawComposeSsotSpec then 1 else 0
      return n == ds.length + extra && n > 0
    | none => return false
  catch _ =>
    return false

def composeSsotSpecHeader : String := "structure ComposeSsotSpec where"

/-- Field lines plus `deriving Repr`. The deriving line is recognized
    so parsing can continue. The Repr instance is not a declaration. -/
def composeSsotSpecTail : List String := [
  "base : String",
  "token : String",
  "headerBlock : String",
  "bodyBlock : String",
  "role : String",
  "deriving Repr"
]

def takeNamedLines (want : List String) : List String -> Option (List String)
  | [] =>
    match want with
    | [] => some []
    | _ => none
  | line :: rest =>
    match want with
    | [] => some (line :: rest)
    | w :: ws =>
      let t := trimLine line
      if t == "" then
        takeNamedLines want rest
      else if t == w then
        takeNamedLines ws rest
      else
        none

inductive SpecTake where
  | miss
  | bad
  | hit (decl : Lean.Declaration) (rest : List String)

/-- `miss` when this line is not the structure header.
    `bad` when the header is present but the fields, the namespace,
    or the inductive declaration do not match.
    `hit` carries `composeSsotSpecDecl` and the lines after the block. -/
def takeComposeSsotSpec (ns : List Lean.Name) (line : String)
    (rest : List String) : SpecTake :=
  if trimLine line != composeSsotSpecHeader then
    .miss
  else if qualify ns "ComposeSsotSpec" != composeSsotSpecName then
    .bad
  else if !composeSsotSpecIsInduct composeSsotSpecDecl then
    .bad
  else
    match takeNamedLines composeSsotSpecTail rest with
    | none => .bad
    | some rest2 => .hit composeSsotSpecDecl rest2

/-- `SystemsLean.CapableCompose.containsStr`. -/
def containsStrName : Lean.Name :=
  `SystemsLean.CapableCompose.containsStr

/-- `(s needle : String) : Bool`. Both binders are explicit. -/
def containsStrType : Lean.Expr :=
  Lean.Expr.forallE `s (Lean.mkConst `String)
    (Lean.Expr.forallE `needle (Lean.mkConst `String)
      (Lean.mkConst `Bool) Lean.BinderInfo.default)
    Lean.BinderInfo.default

/-- `1` at type `Nat` is `OfNat.ofNat` of a raw nat
    (`Lean/Elab/BuiltinTerm.lean`, `Lean/Expr.lean`). Not `Bool`. -/
def containsStrOne : Lean.Expr :=
  Lean.mkApp3 (Lean.mkConst `OfNat.ofNat [Lean.Level.zero])
    (Lean.mkConst `Nat) (Lean.mkRawNatLit 1)
    (Lean.mkApp (Lean.mkConst `instOfNatNat) (Lean.mkRawNatLit 1))

/-- `needle.isEmpty` is `String.isEmpty` (`Init/Data/String/Defs.lean`).
    `needle` is `bvar 0` under the two lambdas. -/
def containsStrIsEmpty : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `String.isEmpty) (Lean.mkBVar 0)

/-- `s.splitOn needle` is `String.splitOn` (`Init/Data/String/Legacy.lean`).
    Both arguments are written, so the default separator is not inserted.
    `s` is `bvar 1`. `needle` is `bvar 0`. -/
def containsStrSplit : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst `String.splitOn) (Lean.mkBVar 1) (Lean.mkBVar 0)

/-- `.length` on `List String` is `List.length.{0}` (`Init/Prelude.lean`). -/
def containsStrLen : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst `List.length [Lean.Level.zero])
    (Lean.mkConst `String) containsStrSplit

/-- `length > 1` elaborates as `GT.gt` (`Init/Notation.lean`).
    `GT.gt a b` unfolds to `LT.lt b a` (`Init/Prelude.lean`).
    The `LT Nat` instance is `instLTNat`. Expected type `Bool`
    inserts `Decidable.decide` (`Init/Coe.lean`, `decPropToBool`).
    The `Decidable` instance is `Nat.decLt` of the swapped
    arguments. Not `Nat.blt`. Not `Expr.lit`. -/
def containsStrGt : Lean.Expr :=
  let prop :=
    Lean.mkApp4 (Lean.mkConst `GT.gt [Lean.Level.zero])
      (Lean.mkConst `Nat) (Lean.mkConst `instLTNat)
      containsStrLen containsStrOne
  let dec :=
    Lean.mkApp2 (Lean.mkConst `Nat.decLt) containsStrOne containsStrLen
  Lean.mkApp2 (Lean.mkConst `Decidable.decide) prop dec

/-- `if c then t else e` is `ite` (`Init/Notation.lean`), not `cond`.
    `c` is `Bool`, so `boolToProp` unfolds to `Eq c true`
    (`Init/Coe.lean`). The instance is `instDecidableEqBool`
    (`Init/Prelude.lean`). `false` is `Bool.false`. `ite` is level 1
    because `Bool` lives in `Type`. Used under the two lambdas. -/
def containsStrValue : Lean.Expr :=
  let condProp :=
    Lean.mkApp3 (Lean.mkConst `Eq [Lean.Level.succ Lean.Level.zero])
      (Lean.mkConst `Bool) containsStrIsEmpty (Lean.mkConst `Bool.true)
  let dec :=
    Lean.mkApp2 (Lean.mkConst `instDecidableEqBool)
      containsStrIsEmpty (Lean.mkConst `Bool.true)
  let body :=
    Lean.mkApp5 (Lean.mkConst `ite [Lean.Level.succ Lean.Level.zero])
      (Lean.mkConst `Bool) condProp dec
      (Lean.mkConst `Bool.false) containsStrGt
  Lean.mkLambda `s Lean.BinderInfo.default (Lean.mkConst `String)
    (Lean.mkLambda `needle Lean.BinderInfo.default (Lean.mkConst `String)
      body)

def containsStrParsedDef : ParsedDef := {
  declName := containsStrName
  typeConst := Lean.Name.anonymous
  typeExpr := some containsStrType
  value := containsStrValue
}

/-- `declarationOf` builds `Declaration.defnDecl` for `containsStr`.
    Not `inductDecl`. Not `Term.litNat`. -/
def containsStrDecl : Lean.Declaration :=
  declarationOf containsStrParsedDef

def containsStrHeader : String :=
  "def containsStr (s needle : String) : Bool :="

def containsStrThenLine : String :=
  "if needle.isEmpty then false"

def containsStrElseLine : String :=
  "else (s.splitOn needle).length > 1"

inductive ContainsTake where
  | miss
  | bad
  | hit (d : ParsedDef) (rest : List String)

def skipBlank : List String -> List String
  | [] => []
  | line :: rest =>
    if trimLine line == "" then skipBlank rest else line :: rest

/-- The two written body lines. Any other body is none. -/
def takeContainsStrBody (rest : List String) : Option (List String) :=
  match skipBlank rest with
  | [] => none
  | line :: rest =>
    if trimLine line != containsStrThenLine then none
    else
      match skipBlank rest with
      | [] => none
      | line2 :: rest2 =>
        if trimLine line2 == containsStrElseLine then some rest2 else none

/-- `miss` when this line is not the containsStr header.
    `bad` when the header is present but the namespace or the
    if-then-else body does not match. A different parameter
    shape never reaches `hit`. -/
def takeContainsStr (ns : List Lean.Name) (line : String)
    (rest : List String) : ContainsTake :=
  if trimLine line != containsStrHeader then
    .miss
  else if qualify ns "containsStr" != containsStrName then
    .bad
  else
    match takeContainsStrBody rest with
    | none => .bad
    | some rest2 => .hit containsStrParsedDef rest2

/-- `SystemsLean.CapableCompose.ssotBlock`. -/
def ssotBlockName : Lean.Name :=
  `SystemsLean.CapableCompose.ssotBlock

/-- `Option String`. Level 0 because `String` is `Type 0`. -/
def ssotOptionString : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `Option [Lean.Level.zero]) (Lean.mkConst `String)

/-- `List String`. Same constant and level as `listStringType`. -/
def ssotListString : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `List [Lean.Level.zero]) (Lean.mkConst `String)

/-- `(content name : String) : Option String`. Both binders are
    explicit. -/
def ssotBlockType : Lean.Expr :=
  Lean.Expr.forallE `content (Lean.mkConst `String)
    (Lean.Expr.forallE `name (Lean.mkConst `String)
      ssotOptionString Lean.BinderInfo.default)
    Lean.BinderInfo.default

/-- `(grab : Bool) -> (acc : List String) -> Option String`.
    `List.rec` motive result. Not a lifted declaration. -/
def ssotGoType : Lean.Expr :=
  Lean.Expr.forallE `grab (Lean.mkConst `Bool)
    (Lean.Expr.forallE `acc ssotListString
      ssotOptionString Lean.BinderInfo.default)
    Lean.BinderInfo.default

/-- Motive for `List.rec`. The cons premise is
    `(head : α) -> (tail : List α) -> (tail_hs : motive tail) ->
    motive (head :: tail)` (`Lean/Meta/Constructions/BRecOn.lean`).
    `motive tail` is `ssotGoType`, so `tail_hs` is applied to the
    new `grab` and `acc`. `List.casesOn` does not take `tail_hs`.
    Levels on `List.rec` are the motive level, then `List`'s
    parameter (`Lean/Meta/Constructions/NoConfusion.lean`). -/
def ssotMotive : Lean.Expr :=
  Lean.mkLambda `xs Lean.BinderInfo.default ssotListString ssotGoType

/-- `++` on `String` unfolds to `String.append`
    (`Init/Notation.lean`, `Init/Prelude.lean`, `Init/Data/String/Defs.lean`).
    Same constant as `strApp`. -/
def ssotAppend (a b : Lean.Expr) : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst `String.append) a b

/-- `==` on `String` is `BEq.beq`. Same instance as
    `linearUseFailLiveRelEq` (`Init/Notation.lean`, `Init/Prelude.lean`). -/
def ssotStringEq (a b : Lean.Expr) : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `BEq.beq [Lean.Level.zero])
    (Lean.mkConst `String)
    (Lean.mkApp2 (Lean.mkConst `instBEqOfDecidableEq [Lean.Level.zero])
      (Lean.mkConst `String)
      (Lean.mkConst `instDecidableEqString))
    a b

/-- `if c then t else e` at `Option String` is `ite`. `c` is `Bool`,
    so `boolToProp` is `Eq c true` (`Init/Coe.lean`). Level 1 because
    `Option String` lives in `Type`. Same shape as `containsStrValue`. -/
def ssotIte (c thn els : Lean.Expr) : Lean.Expr :=
  let condProp :=
    Lean.mkApp3 (Lean.mkConst `Eq [Lean.Level.succ Lean.Level.zero])
      (Lean.mkConst `Bool) c (Lean.mkConst `Bool.true)
  let dec :=
    Lean.mkApp2 (Lean.mkConst `instDecidableEqBool)
      c (Lean.mkConst `Bool.true)
  Lean.mkApp5 (Lean.mkConst `ite [Lean.Level.succ Lean.Level.zero])
    ssotOptionString condProp dec thn els

/-- `none` at `Option String` is `Option.none`. -/
def ssotNone : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `Option.none [Lean.Level.zero]) (Lean.mkConst `String)

/-- `some s` at `Option String` is `Option.some`. -/
def ssotSome (s : Lean.Expr) : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst `Option.some [Lean.Level.zero])
    (Lean.mkConst `String) s

/-- `String.intercalate "\n" acc.reverse` (`Init/Data/String/Defs.lean`,
    `Init/Data/List/Basic.lean`). -/
def ssotIntercalate (acc : Lean.Expr) : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst `String.intercalate)
    (Lean.mkStrLit "\n")
    (Lean.mkApp2 (Lean.mkConst `List.reverse [Lean.Level.zero])
      (Lean.mkConst `String) acc)

/-- `[]` at `List String` is `List.nil`. -/
def ssotNilList : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `List.nil [Lean.Level.zero]) (Lean.mkConst `String)

/-- Nil arm. `grab` is `bvar 1`. `acc` is `bvar 0`.
    `||` is `Bool.or` (`Init/Prelude.lean`). `acc.isEmpty` is
    `List.isEmpty`. Closed: it does not use the marks. -/
def ssotNilArm : Lean.Expr :=
  let acc := Lean.mkBVar 0
  let grab := Lean.mkBVar 1
  let cond :=
    Lean.mkApp2 (Lean.mkConst `Bool.or) grab
      (Lean.mkApp2 (Lean.mkConst `List.isEmpty [Lean.Level.zero])
        (Lean.mkConst `String) acc)
  let joined := ssotAppend (ssotIntercalate acc) (Lean.mkStrLit "\n")
  Lean.mkLambda `grab Lean.BinderInfo.default (Lean.mkConst `Bool)
    (Lean.mkLambda `acc Lean.BinderInfo.default ssotListString
      (ssotIte cond ssotNone (ssotSome joined)))

/-- Cons arm, used under the two `let`s. Five lambdas, then the
    marks: `acc` `bvar 0`, `grab` `bvar 1`, `tail_hs` `bvar 2`,
    `rest` `bvar 3`, `line` `bvar 4`, `endMark` `bvar 5`,
    `beginMark` `bvar 6`. `go true acc rest` is `tail_hs true acc`.
    `&&` is `Bool.and`. `!` is `Bool.not`. `::` is `List.cons`.
    Not `WellFounded.fix`. Not a lifted name. -/
def ssotConsArm : Lean.Expr :=
  let acc := Lean.mkBVar 0
  let grab := Lean.mkBVar 1
  let tail := Lean.mkBVar 2
  let line := Lean.mkBVar 4
  let endMark := Lean.mkBVar 5
  let beginMark := Lean.mkBVar 6
  let call (g a : Lean.Expr) : Lean.Expr := Lean.mkApp2 tail g a
  let condBegin :=
    Lean.mkApp2 (Lean.mkConst `Bool.and)
      (Lean.mkApp (Lean.mkConst `Bool.not) grab)
      (ssotStringEq line beginMark)
  let condEnd :=
    Lean.mkApp2 (Lean.mkConst `Bool.and) grab
      (ssotStringEq line endMark)
  let joined := ssotAppend (ssotIntercalate acc) (Lean.mkStrLit "\n")
  let pushed :=
    Lean.mkApp3 (Lean.mkConst `List.cons [Lean.Level.zero])
      (Lean.mkConst `String) line acc
  let body :=
    ssotIte condBegin
      (call (Lean.mkConst `Bool.true) acc)
      (ssotIte condEnd
        (ssotSome joined)
        (ssotIte grab
          (call (Lean.mkConst `Bool.true) pushed)
          (call (Lean.mkConst `Bool.false) acc)))
  Lean.mkLambda `line Lean.BinderInfo.default (Lean.mkConst `String)
    (Lean.mkLambda `rest Lean.BinderInfo.default ssotListString
      (Lean.mkLambda `tail Lean.BinderInfo.default ssotGoType
        (Lean.mkLambda `grab Lean.BinderInfo.default (Lean.mkConst `Bool)
          (Lean.mkLambda `acc Lean.BinderInfo.default ssotListString
            body))))

/-- `let beginMark` and `let endMark` are `Expr.letE`. The `let rec`
    is `List.rec` of the two written arms, then `false` and `[]`.
    In `beginMark`'s value, `name` is `bvar 0`. In `endMark`'s value,
    `name` is `bvar 1`. In the body, `content` is `bvar 3`.
    `content.splitOn "\n"` is `String.splitOn`. -/
def ssotBlockValue : Lean.Expr :=
  let beginVal :=
    ssotAppend (ssotAppend (Lean.mkStrLit "# ") (Lean.mkBVar 0))
      (Lean.mkStrLit "_BEGIN")
  let endVal :=
    ssotAppend (ssotAppend (Lean.mkStrLit "# ") (Lean.mkBVar 1))
      (Lean.mkStrLit "_END")
  let major :=
    Lean.mkApp2 (Lean.mkConst `String.splitOn)
      (Lean.mkBVar 3) (Lean.mkStrLit "\n")
  let recApp :=
    Lean.mkApp2
      (Lean.mkApp5
        (Lean.mkConst `List.rec
          [Lean.Level.succ Lean.Level.zero, Lean.Level.zero])
        (Lean.mkConst `String) ssotMotive ssotNilArm ssotConsArm major)
      (Lean.mkConst `Bool.false) ssotNilList
  Lean.mkLambda `content Lean.BinderInfo.default (Lean.mkConst `String)
    (Lean.mkLambda `name Lean.BinderInfo.default (Lean.mkConst `String)
      (Lean.Expr.letE `beginMark (Lean.mkConst `String) beginVal
        (Lean.Expr.letE `endMark (Lean.mkConst `String) endVal
          recApp false)
        false))

def ssotBlockParsedDef : ParsedDef := {
  declName := ssotBlockName
  typeConst := Lean.Name.anonymous
  typeExpr := some ssotBlockType
  value := ssotBlockValue
}

/-- `declarationOf` builds `Declaration.defnDecl` for `ssotBlock`.
    Not `inductDecl`. Not `Term.litNat`. Not `Expr.lit`. -/
def ssotBlockDecl : Lean.Declaration :=
  declarationOf ssotBlockParsedDef

def ssotBlockHeader : String :=
  "def ssotBlock (content name : String) : Option String :="

/-- Trimmed body lines through the call. `requireFile` is not here. -/
def ssotBlockBodyLines : List String := [
  "let beginMark := \"# \" ++ name ++ \"_BEGIN\"",
  "let endMark := \"# \" ++ name ++ \"_END\"",
  "let rec go (grab : Bool) (acc : List String) : List String -> Option String",
  "| [] =>",
  "if grab || acc.isEmpty then none",
  "else some (String.intercalate \"\\n\" acc.reverse ++ \"\\n\")",
  "| line :: rest =>",
  "if !grab && line == beginMark then go true acc rest",
  "else if grab && line == endMark then",
  "some (String.intercalate \"\\n\" acc.reverse ++ \"\\n\")",
  "else if grab then go true (line :: acc) rest",
  "else go false acc rest",
  "go false [] (content.splitOn \"\\n\")"
]

/-- `miss` when this line is not the ssotBlock header.
    `bad` when the header is present but the namespace or the
    written arms do not match. The lines after the call stay
    for the caller. `takeSsotBlock` does not consume
    `requireFile`. -/
def takeSsotBlock (ns : List Lean.Name) (line : String)
    (rest : List String) : ContainsTake :=
  if trimLine line != ssotBlockHeader then
    .miss
  else if qualify ns "ssotBlock" != ssotBlockName then
    .bad
  else
    match takeNamedLines ssotBlockBodyLines rest with
    | none => .bad
    | some rest2 => .hit ssotBlockParsedDef rest2

/-- `SystemsLean.CapableCompose.requireFile`. -/
def requireFileName : Lean.Name :=
  `SystemsLean.CapableCompose.requireFile

/-- `(path : System.FilePath) -> (label : String) -> IO Unit`.
    Both binders are explicit. Same `IO` constant as `ioType`. -/
def requireFileType : Lean.Expr :=
  Lean.Expr.forallE `path (Lean.mkConst `System.FilePath)
    (Lean.Expr.forallE `label (Lean.mkConst `String)
      (Lean.mkApp (Lean.mkConst `IO) (Lean.mkConst `Unit))
      Lean.BinderInfo.default)
    Lean.BinderInfo.default

/-- `String.append`. Same constant as `ssotAppend`. -/
def requireFileAppend (a b : Lean.Expr) : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst `String.append) a b

/-- `EST.bind IO.Error IO.RealWorld a b x f`. Same arguments
    as `estBind`. -/
def requireFileBind (a b x f : Lean.Expr) : Lean.Expr :=
  Lean.mkApp6 (Lean.mkConst `EST.bind)
    (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld) a b x f

/-- `if c then t else e` at `IO Unit` is `ite`, not `cond`
    (`Init/Notation.lean`). `c` is `Bool`, so `boolToProp` is
    `Eq c true` (`Init/Coe.lean`). Level 1 because `IO Unit`
    lives in `Type`. Same shape as `ssotIte`. -/
def requireFileIte (c thn els : Lean.Expr) : Lean.Expr :=
  let ioUnit := Lean.mkApp (Lean.mkConst `IO) (Lean.mkConst `Unit)
  let condProp :=
    Lean.mkApp3 (Lean.mkConst `Eq [Lean.Level.succ Lean.Level.zero])
      (Lean.mkConst `Bool) c (Lean.mkConst `Bool.true)
  let dec :=
    Lean.mkApp2 (Lean.mkConst `instDecidableEqBool)
      c (Lean.mkConst `Bool.true)
  Lean.mkApp5 (Lean.mkConst `ite [Lean.Level.succ Lean.Level.zero])
    ioUnit condProp dec thn els

/-- `skip` at the end of this `do` is `EST.pure` of `Unit.unit`.
    The outer continuation is duplicable, so this `unless` does
    not build `__do_jp` (`Lean/Elab/Do/Basic.lean`). -/
def requireFilePureUnit : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `EST.pure)
    (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld)
    (Lean.mkConst `Unit) (Lean.mkConst `Unit.unit)

/-- `path.pathExists` lifted into `IO`.
    `System.FilePath.pathExists` returns `BaseIO Bool`
    (`Init/System/IO.lean`). `BaseIO.toEIO` is the public lift.
    `path` is the caller's expression. -/
def requireFileExists (path : Lean.Expr) : Lean.Expr :=
  Lean.mkApp3 (Lean.mkConst `BaseIO.toEIO)
    (Lean.mkConst `Bool) (Lean.mkConst `IO.Error)
    (Lean.mkApp (Lean.mkConst `System.FilePath.pathExists) path)

/-- `@IO.eprintln.{0} String instToStringString msg`.
    Same arguments as `ioAction`. -/
def requireFileEprintln (msg : Lean.Expr) : Lean.Expr :=
  Lean.mkApp3 (Lean.mkConst `IO.eprintln [Lean.Level.zero])
    (Lean.mkConst `String) (Lean.mkConst `instToStringString) msg

/-- `throw (IO.userError msg)` at `IO Unit` is `EST.throw`.
    Same shape as `capableComposeThrow`. `msg` is an `Expr`,
    not a string literal. -/
def requireFileThrow (msg : Lean.Expr) : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `EST.throw)
    (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld)
    (Lean.mkConst `Unit)
    (Lean.mkApp (Lean.mkConst `IO.userError) msg)

/-- Under `__do_lift`. `label` is `bvar 1`. `path` is `bvar 2`.
    `s!` joins `toString` chunks with `String.append`.
    `ToString String` is the identity, so the literal and
    `label` stay bare. `ToString FilePath` is the projection. -/
def requireFileErrMsg : Lean.Expr :=
  requireFileAppend
    (requireFileAppend
      (requireFileAppend (Lean.mkStrLit "error: missing ")
        (Lean.mkBVar 1))
      (Lean.mkStrLit ": "))
    (Lean.mkApp (Lean.mkConst `System.FilePath.toString)
      (Lean.mkBVar 2))

/-- Under the `Unit` lambda. `label` is `bvar 2`.
    `s!"missing {label}"`. -/
def requireFileThrowMsg : Lean.Expr :=
  requireFileAppend (Lean.mkStrLit "missing ") (Lean.mkBVar 2)

/-- Else arm. `IO.eprintln` then `throw`. The pure continuation
    after `throw` is contracted, so there is no trailing
    `EST.pure`. `u` is unused. Not `Term.litNat`. Not `Expr.lit`. -/
def requireFileElse : Lean.Expr :=
  requireFileBind (Lean.mkConst `Unit) (Lean.mkConst `Unit)
    (requireFileEprintln requireFileErrMsg)
    (Lean.mkLambda `u Lean.BinderInfo.default (Lean.mkConst `Unit)
      (requireFileThrow requireFileThrowMsg))

/-- Written body. `unless (<- path.pathExists)` is
    `if c then skip else body` (`BuiltinDo/Misc.lean`).
    The nested `<-` is `EST.bind` of the lifted
    `pathExists`. `path` in that call is `bvar 1`. -/
def requireFileValue : Lean.Expr :=
  Lean.mkLambda `path Lean.BinderInfo.default
    (Lean.mkConst `System.FilePath)
    (Lean.mkLambda `label Lean.BinderInfo.default
      (Lean.mkConst `String)
      (requireFileBind (Lean.mkConst `Bool) (Lean.mkConst `Unit)
        (requireFileExists (Lean.mkBVar 1))
        (Lean.mkLambda `__do_lift Lean.BinderInfo.default
          (Lean.mkConst `Bool)
          (requireFileIte (Lean.mkBVar 0)
            requireFilePureUnit requireFileElse))))

def requireFileParsedDef : ParsedDef := {
  declName := requireFileName
  typeConst := Lean.Name.anonymous
  typeExpr := some requireFileType
  value := requireFileValue
}

/-- `declarationOf` builds `Declaration.defnDecl` for `requireFile`.
    Not `inductDecl`. Not `Term.litNat`. Not `Expr.lit`. -/
def requireFileDecl : Lean.Declaration :=
  declarationOf requireFileParsedDef

def requireFileHeader : String :=
  "def requireFile (path : System.FilePath) (label : String) : IO Unit := do"

/-- The three written statements. `planApplyBodySpecs` is not here. -/
def requireFileBodyLines : List String := [
  "unless (<- path.pathExists) do",
  "IO.eprintln s!\"error: missing {label}: {path}\"",
  "throw (IO.userError s!\"missing {label}\")"
]

/-- `miss` when this line is not the requireFile header.
    `bad` when the header is present but the namespace or the
    body does not match. `planApplyBodySpecs` is not consumed.
    `parseDefLine` is unchanged: a later `(` after a name
    stays unclaimed. This is not a fifth `:= do` list. -/
def takeRequireFile (ns : List Lean.Name) (line : String)
    (rest : List String) : ContainsTake :=
  if trimLine line != requireFileHeader then
    .miss
  else if qualify ns "requireFile" != requireFileName then
    .bad
  else
    match takeNamedLines requireFileBodyLines rest with
    | none => .bad
    | some rest2 => .hit requireFileParsedDef rest2

/-- `SystemsLean.CapableCompose.planApplyBodySpecs`. -/
def planApplyBodySpecsName : Lean.Name :=
  `SystemsLean.CapableCompose.planApplyBodySpecs

/-- `List ComposeSsotSpec`. Level 0. No explicit binders.
    Not `Term.litNat`. Not `Expr.lit`. -/
def planApplyBodySpecsType : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `List [Lean.Level.zero])
    (Lean.mkConst composeSsotSpecName)

/-- `ComposeSsotSpec.mk` on the five written strings, in field
    order: base, token, headerBlock, bodyBlock, role.
    Same constructor as `composeSsotSpecDecl`. Not a projection.
    Not a second `inductDecl`. `deriving Repr` is not here. -/
def planApplyBodySpecsMk (base token headerBlock bodyBlock role : String) :
    Lean.Expr :=
  Lean.mkApp5
    (Lean.mkConst `SystemsLean.CapableCompose.ComposeSsotSpec.mk)
    (Lean.mkStrLit base) (Lean.mkStrLit token)
    (Lean.mkStrLit headerBlock) (Lean.mkStrLit bodyBlock)
    (Lean.mkStrLit role)

/-- `[]` at `List ComposeSsotSpec` is `List.nil`. -/
def planApplyBodySpecsNil : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `List.nil [Lean.Level.zero])
    (Lean.mkConst composeSsotSpecName)

/-- `head :: tail` at `List ComposeSsotSpec` is `List.cons`. -/
def planApplyBodySpecsCons (head tail : Lean.Expr) : Lean.Expr :=
  Lean.mkApp3 (Lean.mkConst `List.cons [Lean.Level.zero])
    (Lean.mkConst composeSsotSpecName) head tail

/-- Three `ComposeSsotSpec.mk` applications on `List.cons`,
    ending at `List.nil`. The fifteen strings are the written
    literals. No explicit binders on this def. -/
def planApplyBodySpecsValue : Lean.Expr :=
  planApplyBodySpecsCons
    (planApplyBodySpecsMk "host_emit_plan.ssot.txt" "HOST-EMIT-PLAN"
      "PLAN_C_HEADER" "PLAN_C_BODY" "plan")
    (planApplyBodySpecsCons
      (planApplyBodySpecsMk "host_emit_apply.ssot.txt" "HOST-EMIT-APPLY"
        "APPLY_C_HEADER" "APPLY_C_BODY" "apply")
      (planApplyBodySpecsCons
        (planApplyBodySpecsMk "host_emit_body_fragment.ssot.txt"
          "HOST-EMIT-BODY" "BODY_C_HEADER" "BODY_C_BODY" "body")
        planApplyBodySpecsNil))

def planApplyBodySpecsParsedDef : ParsedDef := {
  declName := planApplyBodySpecsName
  typeConst := Lean.Name.anonymous
  typeExpr := some planApplyBodySpecsType
  value := planApplyBodySpecsValue
}

/-- `declarationOf` builds `Declaration.defnDecl` for
    `planApplyBodySpecs`. Not `inductDecl`. Not `Term.litNat`.
    Not `Expr.lit`. -/
def planApplyBodySpecsDecl : Lean.Declaration :=
  declarationOf planApplyBodySpecsParsedDef

def planApplyBodySpecsHeader : String :=
  "def planApplyBodySpecs : List ComposeSsotSpec := ["

/-- The seven written body lines, trimmed.
    `freestandingCapableComposeReadOneSsot` is not here. -/
def planApplyBodySpecsBodyLines : List String := [
  "{ base := \"host_emit_plan.ssot.txt\", token := \"HOST-EMIT-PLAN\",",
  "headerBlock := \"PLAN_C_HEADER\", bodyBlock := \"PLAN_C_BODY\", role := \"plan\" },",
  "{ base := \"host_emit_apply.ssot.txt\", token := \"HOST-EMIT-APPLY\",",
  "headerBlock := \"APPLY_C_HEADER\", bodyBlock := \"APPLY_C_BODY\", role := \"apply\" },",
  "{ base := \"host_emit_body_fragment.ssot.txt\", token := \"HOST-EMIT-BODY\",",
  "headerBlock := \"BODY_C_HEADER\", bodyBlock := \"BODY_C_BODY\", role := \"body\" }",
  "]"
]

/-- `miss` when this line is not the planApplyBodySpecs header.
    `bad` when the header is present but the namespace or the
    body does not match. A miss falls through.
    `freestandingCapableComposeReadOneSsot` is not consumed.
    `parseDefLine` is unchanged: a result type of `List` stays
    unclaimed for any command this take does not match.
    This is not a fifth `:= do` list. -/
def takePlanApplyBodySpecs (ns : List Lean.Name) (line : String)
    (rest : List String) : ContainsTake :=
  if trimLine line != planApplyBodySpecsHeader then
    .miss
  else if qualify ns "planApplyBodySpecs" != planApplyBodySpecsName then
    .bad
  else
    match takeNamedLines planApplyBodySpecsBodyLines rest with
    | none => .bad
    | some rest2 => .hit planApplyBodySpecsParsedDef rest2

/-- `SystemsLean.CapableCompose.freestandingCapableComposeReadOneSsot`. -/
def freestandingCapableComposeReadOneSsotName : Lean.Name :=
  `SystemsLean.CapableCompose.freestandingCapableComposeReadOneSsot

/-- `(path : System.FilePath) -> (spec : ComposeSsotSpec) -> IO String`.
    Both binders are explicit. -/
def freestandingCapableComposeReadOneSsotType : Lean.Expr :=
  Lean.Expr.forallE `path (Lean.mkConst `System.FilePath)
    (Lean.Expr.forallE `spec (Lean.mkConst composeSsotSpecName)
      (Lean.mkApp (Lean.mkConst `IO) (Lean.mkConst `String))
      Lean.BinderInfo.default)
    Lean.BinderInfo.default

/-- `String.append`. Same constant as `requireFileAppend`. -/
def composeReadAppend (a b : Lean.Expr) : Lean.Expr :=
  requireFileAppend a b

/-- `System.FilePath.toString`. `s!` uses this for a path.
    A `String` field stays bare. -/
def composeReadPathStr (path : Lean.Expr) : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `System.FilePath.toString) path

/-- Kernel recursor `ComposeSsotSpec.rec`. `inductDecl` adds it.
    `Name.str` of the inductive, suffix `rec`. Not a projection
    constant. Not `Repr`. -/
def composeReadRecName : Lean.Name :=
  Lean.Name.str composeSsotSpecName "rec"

/-- Motive `ComposeSsotSpec -> String`. Level 1 because `String`
    lives in `Type`. -/
def composeReadSpecMotive : Lean.Expr :=
  Lean.mkLambda `s Lean.BinderInfo.default
    (Lean.mkConst composeSsotSpecName) (Lean.mkConst `String)

/-- Minor premise of `ComposeSsotSpec.rec`. Field order is the
    constructor order. Under the lambdas, `role` is bvar 0,
    `bodyBlock` is 1, `headerBlock` is 2, `token` is 3, `base` is 4. -/
def composeReadFieldArm (field : Nat) : Lean.Expr :=
  Lean.mkLambda `base Lean.BinderInfo.default (Lean.mkConst `String)
    (Lean.mkLambda `token Lean.BinderInfo.default (Lean.mkConst `String)
      (Lean.mkLambda `headerBlock Lean.BinderInfo.default (Lean.mkConst `String)
        (Lean.mkLambda `bodyBlock Lean.BinderInfo.default (Lean.mkConst `String)
          (Lean.mkLambda `role Lean.BinderInfo.default (Lean.mkConst `String)
            (Lean.mkBVar field)))))

/-- One `String` field. `ComposeSsotSpec.rec` motive, minor, major.
    Not `token`, `headerBlock`, or `bodyBlock` as its own constant. -/
def composeReadField (spec : Lean.Expr) (field : Nat) : Lean.Expr :=
  Lean.mkApp3
    (Lean.mkConst composeReadRecName [Lean.Level.succ Lean.Level.zero])
    composeReadSpecMotive
    (composeReadFieldArm field)
    spec

/-- `spec.token`. Bvar 3 in the minor. -/
def composeReadToken (spec : Lean.Expr) : Lean.Expr :=
  composeReadField spec 3

/-- `spec.headerBlock`. Bvar 2 in the minor. -/
def composeReadHeader (spec : Lean.Expr) : Lean.Expr :=
  composeReadField spec 2

/-- `spec.bodyBlock`. Bvar 1 in the minor. -/
def composeReadBody (spec : Lean.Expr) : Lean.Expr :=
  composeReadField spec 1

/-- `s!"dual SSOT ({token})"`. Parentheses are literal chunks. -/
def composeReadLabel (token : Lean.Expr) : Lean.Expr :=
  composeReadAppend
    (composeReadAppend (Lean.mkStrLit "dual SSOT (") token)
    (Lean.mkStrLit ")")

/-- `lead ++ path.toString`. `lead` already has its trailing space. -/
def composeReadMissPath (lead : String) (path : Lean.Expr) : Lean.Expr :=
  composeReadAppend (Lean.mkStrLit lead) (composeReadPathStr path)

/-- `lead ++ field ++ ": " ++ path.toString`. -/
def composeReadMissField (lead : String) (field path : Lean.Expr) :
    Lean.Expr :=
  composeReadAppend
    (composeReadAppend
      (composeReadAppend (Lean.mkStrLit lead) field)
      (Lean.mkStrLit ": "))
    (composeReadPathStr path)

/-- `lead ++ field`. Throw text. No path. -/
def composeReadThrowField (lead : String) (field : Lean.Expr) : Lean.Expr :=
  composeReadAppend (Lean.mkStrLit lead) field

/-- `IO.eprintln` then `throw` at `IO Unit`. `throwMsg` bvars are
    already shifted for the `Unit` lambda. The continuation after
    `throw` is contracted. Not `Term.litNat`. Not `Expr.lit`. -/
def composeReadEprintThrow (eprintMsg throwMsg : Lean.Expr) : Lean.Expr :=
  requireFileBind (Lean.mkConst `Unit) (Lean.mkConst `Unit)
    (requireFileEprintln eprintMsg)
    (Lean.mkLambda `u Lean.BinderInfo.default (Lean.mkConst `Unit)
      (requireFileThrow throwMsg))

/-- `pure content` at `IO String` is `EST.pure`. -/
def composeReadPure (content : Lean.Expr) : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `EST.pure)
    (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld)
    (Lean.mkConst `String) content

/-- Motive for `Option.casesOn`. Result is `IO Unit`, so the
    level is 1. Same level order as `List.casesOn`: motive, then
    the parameter. -/
def composeReadOptionMotive : Lean.Expr :=
  Lean.mkLambda `o Lean.BinderInfo.default ssotOptionString
    (Lean.mkApp (Lean.mkConst `IO) (Lean.mkConst `Unit))

/-- `match` on `Option String` is `Option.casesOn`. `none` is the
    first alt. `some` is the second. Major sits before the alts,
    same as `List.casesOn`. Not surface `match`. -/
def composeReadCases (major noneAlt someAlt : Lean.Expr) : Lean.Expr :=
  Lean.mkApp5
    (Lean.mkConst `Option.casesOn
      [Lean.Level.succ Lean.Level.zero, Lean.Level.zero])
    (Lean.mkConst `String)
    composeReadOptionMotive
    major
    noneAlt
    someAlt

/-- `ssotBlock content name`. -/
def composeReadBlock (content name : Lean.Expr) : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst ssotBlockName) content name

/-- `containsStr content needle`. -/
def composeReadContains (content needle : Lean.Expr) : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst containsStrName) content needle

/-- `requireFile path label`. -/
def composeReadRequire (path label : Lean.Expr) : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst requireFileName) path label

/-- `IO.FS.readFile path`. -/
def composeReadRead (path : Lean.Expr) : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `IO.FS.readFile) path

/-- Next `IO String` statement after an `IO Unit` check.
    `k` bvars are the scope under the `Unit` lambda. -/
def composeReadThen (check k : Lean.Expr) : Lean.Expr :=
  requireFileBind (Lean.mkConst `Unit) (Lean.mkConst `String) check
    (Lean.mkLambda `u Lean.BinderInfo.default (Lean.mkConst `Unit) k)

/-- Written body. `:= do` is `EST.bind`, same as `requireFileBind`.
    `if` and `unless` are `ite` at `IO Unit` (`requireFileIte`).
    A missing `else` is `EST.pure` of `Unit.unit`, then the next
    statement is bound. `unless c` is `if c then skip else body`.
    Each `match` is `Option.casesOn`. Fields are `ComposeSsotSpec.rec`.
    Not a fifth `:= do` list.
    After `path` and `spec`: spec is bvar 0, path is bvar 1.
    After the `requireFile` lambda: path is bvar 2.
    After `content`: content is 0, spec is 2, path is 3.
    After the empty check: content is 1, spec is 3, path is 4.
    After the token check: content is 2, spec is 4, path is 5.
    After the header match: content is 3, spec is 5, path is 6.
    `pure content` uses content bvar 4. -/
def freestandingCapableComposeReadOneSsotValue : Lean.Expr :=
  let pureContent := composeReadPure (Lean.mkBVar 4)
  let bodyField5 := composeReadBody (Lean.mkBVar 5)
  let bodyNone :=
    composeReadEprintThrow
      (composeReadMissField "error: dual SSOT missing BODY block "
        bodyField5 (Lean.mkBVar 6))
      (composeReadThrowField "missing BODY " (composeReadBody (Lean.mkBVar 6)))
  let bodyFieldB := composeReadBody (Lean.mkBVar 6)
  let bodySome :=
    Lean.mkLambda `b Lean.BinderInfo.default (Lean.mkConst `String)
      (requireFileIte
        (Lean.mkApp (Lean.mkConst `String.isEmpty) (Lean.mkBVar 0))
        (composeReadEprintThrow
          (composeReadMissField "error: empty BODY block "
            bodyFieldB (Lean.mkBVar 7))
          (composeReadThrowField "empty BODY "
            (composeReadBody (Lean.mkBVar 7))))
        requireFilePureUnit)
  let bodyCases :=
    composeReadCases
      (composeReadBlock (Lean.mkBVar 3) bodyField5)
      bodyNone
      bodySome
  let afterHeader := composeReadThen bodyCases pureContent
  let headerField4 := composeReadHeader (Lean.mkBVar 4)
  let headerNone :=
    composeReadEprintThrow
      (composeReadMissField "error: dual SSOT missing HEADER block "
        headerField4 (Lean.mkBVar 5))
      (composeReadThrowField "missing HEADER "
        (composeReadHeader (Lean.mkBVar 5)))
  let headerFieldH := composeReadHeader (Lean.mkBVar 5)
  let headerSome :=
    Lean.mkLambda `h Lean.BinderInfo.default (Lean.mkConst `String)
      (requireFileIte
        (Lean.mkApp (Lean.mkConst `String.isEmpty) (Lean.mkBVar 0))
        (composeReadEprintThrow
          (composeReadMissField "error: empty HEADER block "
            headerFieldH (Lean.mkBVar 6))
          (composeReadThrowField "empty HEADER "
            (composeReadHeader (Lean.mkBVar 6))))
        requireFilePureUnit)
  let headerCases :=
    composeReadCases
      (composeReadBlock (Lean.mkBVar 2) headerField4)
      headerNone
      headerSome
  let afterToken := composeReadThen headerCases afterHeader
  let token3 := composeReadToken (Lean.mkBVar 3)
  let tokenCheck :=
    requireFileIte
      (composeReadContains (Lean.mkBVar 1) token3)
      requireFilePureUnit
      (composeReadEprintThrow
        (composeReadMissField "error: dual SSOT missing token "
          token3 (Lean.mkBVar 4))
        (composeReadThrowField "missing token "
          (composeReadToken (Lean.mkBVar 4))))
  let afterEmpty := composeReadThen tokenCheck afterToken
  let emptyCheck :=
    requireFileIte
      (Lean.mkApp (Lean.mkConst `String.isEmpty) (Lean.mkBVar 0))
      (composeReadEprintThrow
        (composeReadMissPath "error: empty dual SSOT: " (Lean.mkBVar 3))
        (composeReadMissPath "empty " (Lean.mkBVar 4)))
      requireFilePureUnit
  let checks := composeReadThen emptyCheck afterEmpty
  Lean.mkLambda `path Lean.BinderInfo.default (Lean.mkConst `System.FilePath)
    (Lean.mkLambda `spec Lean.BinderInfo.default
      (Lean.mkConst composeSsotSpecName)
      (requireFileBind (Lean.mkConst `Unit) (Lean.mkConst `String)
        (composeReadRequire (Lean.mkBVar 1)
          (composeReadLabel (composeReadToken (Lean.mkBVar 0))))
        (Lean.mkLambda `u Lean.BinderInfo.default (Lean.mkConst `Unit)
          (requireFileBind (Lean.mkConst `String) (Lean.mkConst `String)
            (composeReadRead (Lean.mkBVar 2))
            (Lean.mkLambda `content Lean.BinderInfo.default
              (Lean.mkConst `String) checks)))))

def freestandingCapableComposeReadOneSsotParsedDef : ParsedDef := {
  declName := freestandingCapableComposeReadOneSsotName
  typeConst := Lean.Name.anonymous
  typeExpr := some freestandingCapableComposeReadOneSsotType
  value := freestandingCapableComposeReadOneSsotValue
}

/-- `declarationOf` builds `Declaration.defnDecl` for
    `freestandingCapableComposeReadOneSsot`. Not `inductDecl`.
    Not `Term.litNat`. Not `Expr.lit`. `buildComposeMarker` is
    not translated. -/
def freestandingCapableComposeReadOneSsotDecl : Lean.Declaration :=
  declarationOf freestandingCapableComposeReadOneSsotParsedDef

def freestandingCapableComposeReadOneSsotHeader : String :=
  "def freestandingCapableComposeReadOneSsot (path : System.FilePath)"

/-- Trimmed lines after the header, through `pure content`.
    `buildComposeMarker` is not here. Not a fifth `:= do` list. -/
def freestandingCapableComposeReadOneSsotBodyLines : List String := [
  "(spec : ComposeSsotSpec) : IO String := do",
  "requireFile path s!\"dual SSOT ({spec.token})\"",
  "let content <- IO.FS.readFile path",
  "if content.isEmpty then",
  "IO.eprintln s!\"error: empty dual SSOT: {path}\"",
  "throw (IO.userError s!\"empty {path}\")",
  "unless containsStr content spec.token do",
  "IO.eprintln s!\"error: dual SSOT missing token {spec.token}: {path}\"",
  "throw (IO.userError s!\"missing token {spec.token}\")",
  "match ssotBlock content spec.headerBlock with",
  "| none =>",
  "IO.eprintln s!\"error: dual SSOT missing HEADER block {spec.headerBlock}: {path}\"",
  "throw (IO.userError s!\"missing HEADER {spec.headerBlock}\")",
  "| some h =>",
  "if h.isEmpty then",
  "IO.eprintln s!\"error: empty HEADER block {spec.headerBlock}: {path}\"",
  "throw (IO.userError s!\"empty HEADER {spec.headerBlock}\")",
  "match ssotBlock content spec.bodyBlock with",
  "| none =>",
  "IO.eprintln s!\"error: dual SSOT missing BODY block {spec.bodyBlock}: {path}\"",
  "throw (IO.userError s!\"missing BODY {spec.bodyBlock}\")",
  "| some b =>",
  "if b.isEmpty then",
  "IO.eprintln s!\"error: empty BODY block {spec.bodyBlock}: {path}\"",
  "throw (IO.userError s!\"empty BODY {spec.bodyBlock}\")",
  "pure content"
]

/-- `miss` when this line is not the read-one header.
    `bad` when the header is present but the namespace or the
    body does not match. `buildComposeMarker` is not consumed.
    `parseDefLine` is unchanged. This is not a fifth `:= do` list. -/
def takeFreestandingCapableComposeReadOneSsot (ns : List Lean.Name)
    (line : String) (rest : List String) : ContainsTake :=
  if trimLine line != freestandingCapableComposeReadOneSsotHeader then
    .miss
  else if qualify ns "freestandingCapableComposeReadOneSsot" !=
      freestandingCapableComposeReadOneSsotName then
    .bad
  else
    match takeNamedLines freestandingCapableComposeReadOneSsotBodyLines rest with
    | none => .bad
    | some rest2 => .hit freestandingCapableComposeReadOneSsotParsedDef rest2

/-- `skipBlank` drops a blank prefix or returns the same list. -/
private theorem skipBlank_length_lt :
    (src : List String) -> (skipBlank src).length < src.length + 1
  | [] => by
      simp only [skipBlank]
      exact Nat.lt_succ_self _
  | line :: src => by
      simp only [skipBlank]
      split
      · rw [List.length_cons]
        exact Nat.lt_trans (skipBlank_length_lt src)
          (Nat.lt_succ_self (src.length + 1))
      · exact Nat.lt_succ_self _

/-- A `some` result of `takeNamedLines` is the input or a suffix of it. -/
private theorem takeNamedLines_length_lt :
    (want src : List String) -> (out : List String) ->
    takeNamedLines want src = some out -> out.length < src.length + 1
  | want, [], out, h => by
      simp only [takeNamedLines] at h
      cases want with
      | nil =>
        cases h
        exact Nat.lt_succ_self _
      | cons _ _ =>
        cases h
  | [], _line :: _src, out, h => by
      simp only [takeNamedLines] at h
      cases h
      exact Nat.lt_succ_self _
  | w :: ws, line :: src, out, h =>
      if ht : trimLine line == "" then by
        rw [List.length_cons]
        exact Nat.lt_trans
          (takeNamedLines_length_lt (w :: ws) src out (by
            simp only [takeNamedLines] at h
            rw [ite_eq_left ht] at h
            exact h))
          (Nat.lt_succ_self (src.length + 1))
      else if he : trimLine line == w then by
        rw [List.length_cons]
        exact Nat.lt_trans
          (takeNamedLines_length_lt ws src out (by
            simp only [takeNamedLines] at h
            rw [ite_eq_right ht] at h
            rw [ite_eq_left he] at h
            exact h))
          (Nat.lt_succ_self (src.length + 1))
      else by
        simp only [takeNamedLines] at h
        rw [ite_eq_right ht] at h
        rw [ite_eq_right he] at h
        cases h

/-- The body tail is the list after the two written lines. -/
private theorem takeContainsStrBody_length_lt (src out : List String)
    (h : takeContainsStrBody src = some out) : out.length < src.length + 1 := by
  unfold takeContainsStrBody at h
  cases hs1 : skipBlank src with
  | nil =>
    rw [hs1] at h
    dsimp only at h
    cases h
  | cons line mid =>
    rw [hs1] at h
    dsimp only at h
    cases hIf : trimLine line != containsStrThenLine with
    | true =>
      rw [ite_eq_left hIf] at h
      cases h
    | false =>
      rw [ite_eq_right (by intro heq; rw [hIf] at heq; cases heq)] at h
      cases hs2 : skipBlank mid with
      | nil =>
        rw [hs2] at h
        dsimp only at h
        cases h
      | cons line2 rest2 =>
        rw [hs2] at h
        dsimp only at h
        cases hElse : trimLine line2 == containsStrElseLine with
        | false =>
          rw [ite_eq_right (by intro heq; rw [hElse] at heq; cases heq)] at h
          cases h
        | true =>
          rw [ite_eq_left hElse] at h
          injection h with hr
          have hOut : rest2.length < (skipBlank mid).length := by
            rw [hs2, List.length_cons]
            exact Nat.lt_succ_self _
          have hMid : mid.length < (skipBlank src).length := by
            rw [hs1, List.length_cons]
            exact Nat.lt_succ_self _
          have hLt : rest2.length < src.length :=
            Nat.lt_of_lt_of_le
              (Nat.lt_trans
                (Nat.lt_of_lt_of_le hOut (Nat.le_of_lt_succ (skipBlank_length_lt mid)))
                hMid)
              (Nat.le_of_lt_succ (skipBlank_length_lt src))
          rw [hr] at hLt
          exact Nat.lt_trans hLt (Nat.lt_succ_self src.length)

private theorem takeContainsStr_rest_lt
    (ns : List Lean.Name) (line : String) (rest : List String)
    (d : ParsedDef) (rest2 : List String)
    (h : takeContainsStr ns line rest = ContainsTake.hit d rest2) :
    rest2.length < rest.length + 1 := by
  unfold takeContainsStr at h
  cases h1 : trimLine line != containsStrHeader with
  | true =>
    rw [ite_eq_left h1] at h
    cases h
  | false =>
    rw [ite_eq_right (by intro heq; rw [h1] at heq; cases heq)] at h
    cases h2 : qualify ns "containsStr" != containsStrName with
    | true =>
      rw [ite_eq_left h2] at h
      cases h
    | false =>
      rw [ite_eq_right (by intro heq; rw [h2] at heq; cases heq)] at h
      cases hb : takeContainsStrBody rest with
      | none =>
        rw [hb] at h
        dsimp only at h
        cases h
      | some out =>
        rw [hb] at h
        dsimp only at h
        injection h with _ hr
        have hle := takeContainsStrBody_length_lt rest out hb
        rw [hr] at hle
        exact hle

private theorem takeSsotBlock_rest_lt
    (ns : List Lean.Name) (line : String) (rest : List String)
    (d : ParsedDef) (rest2 : List String)
    (h : takeSsotBlock ns line rest = ContainsTake.hit d rest2) :
    rest2.length < rest.length + 1 := by
  unfold takeSsotBlock at h
  cases h1 : trimLine line != ssotBlockHeader with
  | true =>
    rw [ite_eq_left h1] at h
    cases h
  | false =>
    rw [ite_eq_right (by intro heq; rw [h1] at heq; cases heq)] at h
    cases h2 : qualify ns "ssotBlock" != ssotBlockName with
    | true =>
      rw [ite_eq_left h2] at h
      cases h
    | false =>
      rw [ite_eq_right (by intro heq; rw [h2] at heq; cases heq)] at h
      cases hb : takeNamedLines ssotBlockBodyLines rest with
      | none =>
        rw [hb] at h
        dsimp only at h
        cases h
      | some out =>
        rw [hb] at h
        dsimp only at h
        injection h with _ hr
        have hle := takeNamedLines_length_lt ssotBlockBodyLines rest out hb
        rw [hr] at hle
        exact hle

private theorem takeRequireFile_rest_lt
    (ns : List Lean.Name) (line : String) (rest : List String)
    (d : ParsedDef) (rest2 : List String)
    (h : takeRequireFile ns line rest = ContainsTake.hit d rest2) :
    rest2.length < rest.length + 1 := by
  unfold takeRequireFile at h
  cases h1 : trimLine line != requireFileHeader with
  | true =>
    rw [ite_eq_left h1] at h
    cases h
  | false =>
    rw [ite_eq_right (by intro heq; rw [h1] at heq; cases heq)] at h
    cases h2 : qualify ns "requireFile" != requireFileName with
    | true =>
      rw [ite_eq_left h2] at h
      cases h
    | false =>
      rw [ite_eq_right (by intro heq; rw [h2] at heq; cases heq)] at h
      cases hb : takeNamedLines requireFileBodyLines rest with
      | none =>
        rw [hb] at h
        dsimp only at h
        cases h
      | some out =>
        rw [hb] at h
        dsimp only at h
        injection h with _ hr
        have hle := takeNamedLines_length_lt requireFileBodyLines rest out hb
        rw [hr] at hle
        exact hle

private theorem takePlanApplyBodySpecs_rest_lt
    (ns : List Lean.Name) (line : String) (rest : List String)
    (d : ParsedDef) (rest2 : List String)
    (h : takePlanApplyBodySpecs ns line rest = ContainsTake.hit d rest2) :
    rest2.length < rest.length + 1 := by
  unfold takePlanApplyBodySpecs at h
  cases h1 : trimLine line != planApplyBodySpecsHeader with
  | true =>
    rw [ite_eq_left h1] at h
    cases h
  | false =>
    rw [ite_eq_right (by intro heq; rw [h1] at heq; cases heq)] at h
    cases h2 : qualify ns "planApplyBodySpecs" != planApplyBodySpecsName with
    | true =>
      rw [ite_eq_left h2] at h
      cases h
    | false =>
      rw [ite_eq_right (by intro heq; rw [h2] at heq; cases heq)] at h
      cases hb : takeNamedLines planApplyBodySpecsBodyLines rest with
      | none =>
        rw [hb] at h
        dsimp only at h
        cases h
      | some out =>
        rw [hb] at h
        dsimp only at h
        injection h with _ hr
        have hle :=
          takeNamedLines_length_lt planApplyBodySpecsBodyLines rest out hb
        rw [hr] at hle
        exact hle

private theorem takeFreestandingCapableComposeReadOneSsot_rest_lt
    (ns : List Lean.Name) (line : String) (rest : List String)
    (d : ParsedDef) (rest2 : List String)
    (h : takeFreestandingCapableComposeReadOneSsot ns line rest =
      ContainsTake.hit d rest2) :
    rest2.length < rest.length + 1 := by
  unfold takeFreestandingCapableComposeReadOneSsot at h
  cases h1 : trimLine line != freestandingCapableComposeReadOneSsotHeader with
  | true =>
    rw [ite_eq_left h1] at h
    cases h
  | false =>
    rw [ite_eq_right (by intro heq; rw [h1] at heq; cases heq)] at h
    cases h2 : qualify ns "freestandingCapableComposeReadOneSsot" !=
        freestandingCapableComposeReadOneSsotName with
    | true =>
      rw [ite_eq_left h2] at h
      cases h
    | false =>
      rw [ite_eq_right (by intro heq; rw [h2] at heq; cases heq)] at h
      cases hb : takeNamedLines freestandingCapableComposeReadOneSsotBodyLines rest with
      | none =>
        rw [hb] at h
        dsimp only at h
        cases h
      | some out =>
        rw [hb] at h
        dsimp only at h
        injection h with _ hr
        have hle := takeNamedLines_length_lt
          freestandingCapableComposeReadOneSsotBodyLines rest out hb
        rw [hr] at hle
        exact hle

private theorem takeComposeSsotSpec_rest_lt
    (ns : List Lean.Name) (line : String) (rest : List String)
    (decl : Lean.Declaration) (rest2 : List String)
    (h : takeComposeSsotSpec ns line rest = SpecTake.hit decl rest2) :
    rest2.length < rest.length + 1 := by
  unfold takeComposeSsotSpec at h
  cases h1 : trimLine line != composeSsotSpecHeader with
  | true =>
    rw [ite_eq_left h1] at h
    cases h
  | false =>
    rw [ite_eq_right (by intro heq; rw [h1] at heq; cases heq)] at h
    cases h2 : qualify ns "ComposeSsotSpec" != composeSsotSpecName with
    | true =>
      rw [ite_eq_left h2] at h
      cases h
    | false =>
      rw [ite_eq_right (by intro heq; rw [h2] at heq; cases heq)] at h
      cases h3 : (!composeSsotSpecIsInduct composeSsotSpecDecl) with
      | true =>
        rw [ite_eq_left h3] at h
        cases h
      | false =>
        rw [ite_eq_right (by intro heq; rw [h3] at heq; cases heq)] at h
        cases hb : takeNamedLines composeSsotSpecTail rest with
        | none =>
          rw [hb] at h
          dsimp only at h
          cases h
        | some out =>
          rw [hb] at h
          dsimp only at h
          injection h with _ hr
          have hle := takeNamedLines_length_lt composeSsotSpecTail rest out hb
          rw [hr] at hle
          exact hle

/-- `rest2` is at most the tail, so it is shorter than `line :: rest`. -/
private theorem rest2_length_lt
    (rest2 rest : List String) (line : String) (lines : List String)
    (hle : rest2.length < rest.length + 1)
    (hlines : lines = line :: rest) : rest2.length < lines.length :=
  Nat.lt_of_le_of_lt (Nat.le_of_lt_succ hle) (by
    rw [hlines, List.length_cons]
    exact Nat.lt_succ_self rest.length)

/-- `sawComposeSsotSpec` puts `composeSsotSpecDecl` on `declsForAdd`.
    That value is `Declaration.inductDecl`, not a `ParsedDef`, so
    `declarationOf` is not applied. `derivBlocked` is true after
    the block. End of input stays ready with that flag, so the
    inductive remains on the addDecl list. `claimSource` does not
    accept: `deriving Repr` is not encoded. -/
def parseGo (ns : List Lean.Name) (imports : Array Lean.Import)
    (defs : List ParsedDef) (pending : Pending)
    (sawComposeSsotSpec : Bool) (derivBlocked : Bool)
    (lines : List String) : Parsed :=
  match hlines : lines with
  | [] =>
    match pending with
    | .idle =>
      -- derivBlocked still yields ready so composeSsotSpecDecl stays
      -- on declsForAdd. claimSource does not accept that file:
      -- deriving Repr is not encoded.
      .ready imports defs.reverse (sawComposeSsotSpec || derivBlocked)
    | .need _ _ _ => .unclaimed
  | line :: rest =>
    if (skipWs line.toList).isEmpty then
      have : rest.length < lines.length := by
        rw [hlines, List.length_cons]
        exact Nat.lt_succ_self rest.length
      parseGo ns imports defs pending sawComposeSsotSpec derivBlocked rest
    else
      match pending with
      | .need declName typeConst kind =>
        match valueOf kind declName typeConst line.toList with
        | none => .unclaimed
        | some d =>
          have : rest.length < lines.length := by
            rw [hlines, List.length_cons]
            exact Nat.lt_succ_self rest.length
          parseGo ns imports (d :: defs) .idle sawComposeSsotSpec derivBlocked rest
      | .idle =>
        match htake : takeContainsStr ns line rest with
        | .hit d rest2 =>
          have : rest2.length < lines.length :=
            rest2_length_lt rest2 rest line lines
              (takeContainsStr_rest_lt ns line rest d rest2 htake) hlines
          parseGo ns imports (d :: defs) .idle sawComposeSsotSpec
            derivBlocked rest2
        | .bad => .unclaimed
        | .miss =>
          match htake : takeSsotBlock ns line rest with
          | .hit d rest2 =>
            have : rest2.length < lines.length :=
              rest2_length_lt rest2 rest line lines
                (takeSsotBlock_rest_lt ns line rest d rest2 htake) hlines
            parseGo ns imports (d :: defs) .idle sawComposeSsotSpec
              derivBlocked rest2
          | .bad => .unclaimed
          | .miss =>
            match htake : takeRequireFile ns line rest with
            | .hit d rest2 =>
              have : rest2.length < lines.length :=
                rest2_length_lt rest2 rest line lines
                  (takeRequireFile_rest_lt ns line rest d rest2 htake) hlines
              parseGo ns imports (d :: defs) .idle sawComposeSsotSpec
                derivBlocked rest2
            | .bad => .unclaimed
            | .miss =>
              match htake : takePlanApplyBodySpecs ns line rest with
              | .hit d rest2 =>
                have : rest2.length < lines.length :=
                  rest2_length_lt rest2 rest line lines
                    (takePlanApplyBodySpecs_rest_lt ns line rest d rest2 htake)
                    hlines
                parseGo ns imports (d :: defs) .idle sawComposeSsotSpec
                  derivBlocked rest2
              | .bad => .unclaimed
              | .miss =>
                match htake : takeFreestandingCapableComposeReadOneSsot ns line rest with
                | .hit d rest2 =>
                  have : rest2.length < lines.length :=
                    rest2_length_lt rest2 rest line lines
                      (takeFreestandingCapableComposeReadOneSsot_rest_lt
                        ns line rest d rest2 htake) hlines
                  parseGo ns imports (d :: defs) .idle sawComposeSsotSpec
                    derivBlocked rest2
                | .bad => .unclaimed
                | .miss =>
                  match htake : takeComposeSsotSpec ns line rest with
                  | .hit decl rest2 =>
                    have : rest2.length < lines.length :=
                      rest2_length_lt rest2 rest line lines
                        (takeComposeSsotSpec_rest_lt ns line rest decl rest2 htake)
                        hlines
                    parseGo ns imports defs .idle true true rest2
                  | .bad => .unclaimed
                  | .miss =>
                    match classify ns line with
                    | .skip =>
                      have : rest.length < lines.length := by
                        rw [hlines, List.length_cons]
                        exact Nat.lt_succ_self rest.length
                      parseGo ns imports defs .idle sawComposeSsotSpec derivBlocked rest
                    | .unclaimed => .unclaimed
                    | .pushNs n =>
                      have : rest.length < lines.length := by
                        rw [hlines, List.length_cons]
                        exact Nat.lt_succ_self rest.length
                      parseGo (n :: ns) imports defs .idle sawComposeSsotSpec derivBlocked rest
                    | .popTo ns2 =>
                      have : rest.length < lines.length := by
                        rw [hlines, List.length_cons]
                        exact Nat.lt_succ_self rest.length
                      parseGo ns2 imports defs .idle sawComposeSsotSpec derivBlocked rest
                    | .imp i =>
                      have : rest.length < lines.length := by
                        rw [hlines, List.length_cons]
                        exact Nat.lt_succ_self rest.length
                      parseGo ns (imports.push i) defs .idle sawComposeSsotSpec derivBlocked rest
                    | .got d =>
                      have : rest.length < lines.length := by
                        rw [hlines, List.length_cons]
                        exact Nat.lt_succ_self rest.length
                      parseGo ns imports (d :: defs) .idle sawComposeSsotSpec derivBlocked rest
                    | .need declName typeConst kind =>
                      have : rest.length < lines.length := by
                        rw [hlines, List.length_cons]
                        exact Nat.lt_succ_self rest.length
                      parseGo ns imports defs (.need declName typeConst kind)
                        sawComposeSsotSpec derivBlocked rest
termination_by lines.length

def parseLines (lines : List String) : Parsed :=
  parseGo [] #[] [] .idle false false lines

def trimmedCode : List String -> List String
  | [] => []
  | s :: rest =>
    let t := trimLine s
    if t == "" then trimmedCode rest else t :: trimmedCode rest

def linesEq : List String -> List String -> Bool
  | [], [] => true
  | a :: as, b :: bs => a == b && linesEq as bs
  | _, _ => false

/-- `(args : List String) -> IO UInt32`. `List` is level 0.
    `Expr.forallE` is the kernel forall. -/
def listStringType : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `List [Lean.Level.zero]) (Lean.mkConst `String)

def ioType (a : Lean.Expr) : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `IO) a

def mainFnType : Lean.Expr :=
  Lean.Expr.forallE `args listStringType
    (ioType (Lean.mkConst `UInt32)) Lean.BinderInfo.default

def strApp (a b : Lean.Expr) : Lean.Expr :=
  Lean.mkApp2 (Lean.mkConst `String.append) a b

/-- `@IO.println.{0} String instToStringString msg`. -/
def ioAction (fn : Lean.Name) (msg : Lean.Expr) : Lean.Expr :=
  Lean.mkApp3 (Lean.mkConst fn [Lean.Level.zero])
    (Lean.mkConst `String) (Lean.mkConst `instToStringString) msg

/-- `EST.bind IO.Error IO.RealWorld a b x f`. -/
def estBind (a b x f : Lean.Expr) : Lean.Expr :=
  Lean.mkApp6 (Lean.mkConst `EST.bind)
    (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld) a b x f

def unitLam (body : Lean.Expr) : Lean.Expr :=
  Lean.mkLambda `u Lean.BinderInfo.default (Lean.mkConst `Unit) body

/-- `return 1` at `IO UInt32` is `EST.pure` of `UInt32.ofNat 1`. -/
def pureOne : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `EST.pure)
    (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld)
    (Lean.mkConst `UInt32)
    (Lean.mkApp (Lean.mkConst `UInt32.ofNat) (Lean.mkRawNatLit 1))

def errorIO (msg : String) : Lean.Expr :=
  estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    (ioAction `IO.eprintln (Lean.mkStrLit msg))
    (unitLam pureOne)

/-- `!flag` is `Bool.not`. `unless c` keeps the continuation when
    `c` is true and takes the error branch when `c` is false. -/
def notFlag (n : Lean.Name) : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `Bool.not) (Lean.mkConst n)

/-- `cond.{1}` because `IO UInt32` lives in `Type`. -/
def ioCond (c thn els : Lean.Expr) : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `cond [Lean.Level.succ Lean.Level.zero])
    (ioType (Lean.mkConst `UInt32)) c thn els

/-- First `IO.println`. The argument string appends `stageId`. -/
def stagePrint : Lean.Expr :=
  Lean.mkApp3 (Lean.mkConst `IO.println [Lean.Level.zero])
    (Lean.mkConst `String)
    (Lean.mkConst `instToStringString)
    (strApp
      (strApp
        (strApp
          (strApp (Lean.mkStrLit "== ") (Lean.mkConst `stageId))
          (Lean.mkStrLit ": "))
        (Lean.mkConst `justRecipeSlakeTypecheckIrGraph))
      (Lean.mkStrLit " =="))

def liveRelPrint : Lean.Expr :=
  ioAction `IO.println
    (strApp (Lean.mkStrLit "liveRel=")
      (Lean.mkConst `SystemsLean.HostFrontLiveIrGraph.liveRel))

def hostFilePrint : Lean.Expr :=
  ioAction `IO.println
    (strApp
      (strApp
        (strApp (Lean.mkStrLit "  host=") (Lean.mkConst `hostId))
        (Lean.mkStrLit " file="))
      (Lean.mkConst `liveIrGraphRel))

/-- Used only under three `Unit` lambdas and the `args` lambda.
    `args` is `bvar 3`. -/
def hostFrontMain : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `SystemsLean.HostFrontLiveIrGraph.main)
    (Lean.mkBVar 3)

def irGraphMainValue : Lean.Expr :=
  let cont :=
    ioCond (notFlag `slakeTypecheckIrGraphFullHost)
      (ioCond (notFlag `slakeTypecheckIrGraphFullBackend)
        (ioCond (notFlag `slakeTypecheckIrGraphOwnsPackageTypecheck)
          hostFrontMain
          (errorIO "error: slakeOwnsPackageTypecheck must stay false"))
        (errorIO "error: FullBackend must stay false"))
      (errorIO "error: FullHost must stay false")
  let b3 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    hostFilePrint (unitLam cont)
  let b2 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    liveRelPrint (unitLam b3)
  let b1 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    stagePrint (unitLam b2)
  Lean.mkLambda `args Lean.BinderInfo.default listStringType b1

def irGraphMainDef : ParsedDef := {
  declName := `main
  typeConst := Lean.Name.anonymous
  typeExpr := some mainFnType
  value := irGraphMainValue
}

def irGraphMainLines : List String := [
  "def main (args : List String) : IO UInt32 := do",
  "IO.println s!\"== {stageId}: {justRecipeSlakeTypecheckIrGraph} ==\"",
  "IO.println s!\"liveRel={SystemsLean.HostFrontLiveIrGraph.liveRel}\"",
  "IO.println s!\"  host={hostId} file={liveIrGraphRel}\"",
  "unless (!slakeTypecheckIrGraphFullHost) do",
  "IO.eprintln \"error: FullHost must stay false\"",
  "return 1",
  "unless (!slakeTypecheckIrGraphFullBackend) do",
  "IO.eprintln \"error: FullBackend must stay false\"",
  "return 1",
  "unless (!slakeTypecheckIrGraphOwnsPackageTypecheck) do",
  "IO.eprintln \"error: slakeOwnsPackageTypecheck must stay false\"",
  "return 1",
  "SystemsLean.HostFrontLiveIrGraph.main args"
]

def splitAtMain (acc : List String) : List String -> Option (Prod (List String) (List String))
  | [] => none
  | line :: rest =>
    if trimLine line == "def main (args : List String) : IO UInt32 := do" then
      some (acc.reverse, line :: rest)
    else
      splitAtMain (line :: acc) rest

/-- none when the do-block is not the IrGraph main, or any statement
    differs. Other `:= do` files stay unclaimed. -/
def irGraphParsed (lines : List String) :
    Option (Prod (Array Lean.Import) (Prod (List ParsedDef) Bool)) :=
  match splitAtMain [] lines with
  | none => none
  | some (pre, mainLines) =>
    if linesEq (trimmedCode mainLines) irGraphMainLines then
      match parseLines pre with
      | .unclaimed => none
      | .ready imports ds saw => some (imports, ds ++ [irGraphMainDef], saw)
    else
      none

/-- First Linear `IO.println`. Appends `stageId` and
    `justRecipeSlakeTypecheckLinear`. Mirrors `stagePrint`. -/
def linearStagePrint : Lean.Expr :=
  Lean.mkApp3 (Lean.mkConst `IO.println [Lean.Level.zero])
    (Lean.mkConst `String)
    (Lean.mkConst `instToStringString)
    (strApp
      (strApp
        (strApp
          (strApp (Lean.mkStrLit "== ") (Lean.mkConst `stageId))
          (Lean.mkStrLit ": "))
        (Lean.mkConst `justRecipeSlakeTypecheckLinear))
      (Lean.mkStrLit " =="))

def linearLiveRelPrint : Lean.Expr :=
  ioAction `IO.println
    (strApp (Lean.mkStrLit "liveRel=")
      (Lean.mkConst `SystemsLean.HostFrontLiveLinear.liveRel))

def linearHostFilePrint : Lean.Expr :=
  ioAction `IO.println
    (strApp
      (strApp
        (strApp (Lean.mkStrLit "  host=") (Lean.mkConst `hostId))
        (Lean.mkStrLit " file="))
      (Lean.mkConst `liveLinearRel))

/-- Used only under three `Unit` lambdas and the `args` lambda.
    `args` is `bvar 3`. Mirrors `hostFrontMain`. -/
def linearHostFrontMain : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `SystemsLean.HostFrontLiveLinear.main)
    (Lean.mkBVar 3)

def linearMainValue : Lean.Expr :=
  let cont :=
    ioCond (notFlag `slakeTypecheckLinearFullHost)
      (ioCond (notFlag `slakeTypecheckLinearFullBackend)
        (ioCond (notFlag `slakeTypecheckLinearOwnsPackageTypecheck)
          linearHostFrontMain
          (errorIO "error: slakeOwnsPackageTypecheck must stay false"))
        (errorIO "error: FullBackend must stay false"))
      (errorIO "error: FullHost must stay false")
  let b3 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    linearHostFilePrint (unitLam cont)
  let b2 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    linearLiveRelPrint (unitLam b3)
  let b1 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    linearStagePrint (unitLam b2)
  Lean.mkLambda `args Lean.BinderInfo.default listStringType b1

def linearMainDef : ParsedDef := {
  declName := `main
  typeConst := Lean.Name.anonymous
  typeExpr := some mainFnType
  value := linearMainValue
}

def linearMainLines : List String := [
  "def main (args : List String) : IO UInt32 := do",
  "IO.println s!\"== {stageId}: {justRecipeSlakeTypecheckLinear} ==\"",
  "IO.println s!\"liveRel={SystemsLean.HostFrontLiveLinear.liveRel}\"",
  "IO.println s!\"  host={hostId} file={liveLinearRel}\"",
  "unless (!slakeTypecheckLinearFullHost) do",
  "IO.eprintln \"error: FullHost must stay false\"",
  "return 1",
  "unless (!slakeTypecheckLinearFullBackend) do",
  "IO.eprintln \"error: FullBackend must stay false\"",
  "return 1",
  "unless (!slakeTypecheckLinearOwnsPackageTypecheck) do",
  "IO.eprintln \"error: slakeOwnsPackageTypecheck must stay false\"",
  "return 1",
  "SystemsLean.HostFrontLiveLinear.main args"
]

/-- none when the do-block is not the Linear main, or any statement
    differs. Mirrors `irGraphParsed`. Other `:= do` files stay
    unclaimed. -/
def linearParsed (lines : List String) :
    Option (Prod (Array Lean.Import) (Prod (List ParsedDef) Bool)) :=
  match splitAtMain [] lines with
  | none => none
  | some (pre, mainLines) =>
    if linesEq (trimmedCode mainLines) linearMainLines then
      match parseLines pre with
      | .unclaimed => none
      | .ready imports ds saw => some (imports, ds ++ [linearMainDef], saw)
    else
      none

/-- `liveRel == "LinearUseFail.lean"` is `BEq.beq`.
    `==` elaborates as `BEq.beq` (`Init/Notation.lean`). The `String`
    instance is `instBEqOfDecidableEq` of `instDecidableEqString`.
    Not `Bool.not` of a flag. -/
def linearUseFailLiveRelEq : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `BEq.beq [Lean.Level.zero])
    (Lean.mkConst `String)
    (Lean.mkApp2 (Lean.mkConst `instBEqOfDecidableEq [Lean.Level.zero])
      (Lean.mkConst `String)
      (Lean.mkConst `instDecidableEqString))
    (Lean.mkConst `liveRel)
    (Lean.mkStrLit "LinearUseFail.lean")

/-- First LinearUseFail `IO.println`. Appends `stageId` and
    `justRecipeSlakeTypecheckLinearUseFail`. Mirrors `linearStagePrint`. -/
def linearUseFailStagePrint : Lean.Expr :=
  Lean.mkApp3 (Lean.mkConst `IO.println [Lean.Level.zero])
    (Lean.mkConst `String)
    (Lean.mkConst `instToStringString)
    (strApp
      (strApp
        (strApp
          (strApp (Lean.mkStrLit "== ") (Lean.mkConst `stageId))
          (Lean.mkStrLit ": "))
        (Lean.mkConst `justRecipeSlakeTypecheckLinearUseFail))
      (Lean.mkStrLit " =="))

/-- Second print. The local name is `liveRel`, not a qualified
    `HostFrontLiveLinear.liveRel`. -/
def linearUseFailLiveRelPrint : Lean.Expr :=
  ioAction `IO.println
    (strApp (Lean.mkStrLit "liveRel=")
      (Lean.mkConst `liveRel))

def linearUseFailHostFilePrint : Lean.Expr :=
  ioAction `IO.println
    (strApp
      (strApp
        (strApp (Lean.mkStrLit "  host=") (Lean.mkConst `hostId))
        (Lean.mkStrLit " file="))
      (Lean.mkConst `liveLinearUseFailRel))

/-- Used only under three `Unit` lambdas and the `args` lambda.
    `args` is `bvar 3`. Mirrors `linearHostFrontMain`. -/
def linearUseFailHostFrontMain : Lean.Expr :=
  Lean.mkApp (Lean.mkConst `SystemsLean.HostFrontLiveLinearUseFail.main)
    (Lean.mkBVar 3)

def linearUseFailMainValue : Lean.Expr :=
  let cont :=
    ioCond linearUseFailLiveRelEq
      (ioCond (notFlag `slakeTypecheckLinearUseFailFullHost)
        (ioCond (notFlag `slakeTypecheckLinearUseFailOwnsPackageTypecheck)
          linearUseFailHostFrontMain
          (errorIO "error: slakeOwnsPackageTypecheck must stay false"))
        (errorIO "error: FullHost must stay false"))
      (errorIO "error: liveRel must be LinearUseFail.lean")
  let b3 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    linearUseFailHostFilePrint (unitLam cont)
  let b2 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    linearUseFailLiveRelPrint (unitLam b3)
  let b1 := estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    linearUseFailStagePrint (unitLam b2)
  Lean.mkLambda `args Lean.BinderInfo.default listStringType b1

def linearUseFailMainDef : ParsedDef := {
  declName := `main
  typeConst := Lean.Name.anonymous
  typeExpr := some mainFnType
  value := linearUseFailMainValue
}

def linearUseFailMainLines : List String := [
  "def main (args : List String) : IO UInt32 := do",
  "IO.println s!\"== {stageId}: {justRecipeSlakeTypecheckLinearUseFail} ==\"",
  "IO.println s!\"liveRel={liveRel}\"",
  "IO.println s!\"  host={hostId} file={liveLinearUseFailRel}\"",
  "unless (liveRel == \"LinearUseFail.lean\") do",
  "IO.eprintln \"error: liveRel must be LinearUseFail.lean\"",
  "return 1",
  "unless (!slakeTypecheckLinearUseFailFullHost) do",
  "IO.eprintln \"error: FullHost must stay false\"",
  "return 1",
  "unless (!slakeTypecheckLinearUseFailOwnsPackageTypecheck) do",
  "IO.eprintln \"error: slakeOwnsPackageTypecheck must stay false\"",
  "return 1",
  "SystemsLean.HostFrontLiveLinearUseFail.main args"
]

/-- none when the do-block is not the LinearUseFail main, or any
    statement differs. Mirrors `linearParsed`. Other `:= do` files
    stay unclaimed. -/
def linearUseFailParsed (lines : List String) :
    Option (Prod (Array Lean.Import) (Prod (List ParsedDef) Bool)) :=
  match splitAtMain [] lines with
  | none => none
  | some (pre, mainLines) =>
    if linesEq (trimmedCode mainLines) linearUseFailMainLines then
      match parseLines pre with
      | .unclaimed => none
      | .ready imports ds saw => some (imports, ds ++ [linearUseFailMainDef], saw)
    else
      none

/-- `0` at `IO UInt32` is `EST.pure` of `UInt32.ofNat` of a raw nat.
    Not `Term.litNat`, and not the body of `main` by itself. -/
def capableComposePureZero : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `EST.pure)
    (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld)
    (Lean.mkConst `UInt32)
    (Lean.mkApp (Lean.mkConst `UInt32.ofNat) (Lean.mkRawNatLit 0))

/-- `throw (IO.userError msg)` at `IO α` is `EST.throw`.
    `do` with no catch-type ascription elaborates `throw` as
    `MonadExcept.throw` (`Init/Prelude.lean`). The `IO` instance
    is `EST.throw` (`Init/System/ST.lean`). -/
def capableComposeThrow (alpha : Lean.Expr) (msg : String) : Lean.Expr :=
  Lean.mkApp4 (Lean.mkConst `EST.throw)
    (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld)
    alpha
    (Lean.mkApp (Lean.mkConst `IO.userError) (Lean.mkStrLit msg))

/-- `s!"error: {stageId} surface not ok"`. `stageId` is a `String`,
    so the chunks are `String.append`, same as the other mains. -/
def capableComposeSurfaceMsg : Lean.Expr :=
  strApp
    (strApp (Lean.mkStrLit "error: ")
      (Lean.mkConst `SystemsLean.CapableCompose.stageId))
    (Lean.mkStrLit " surface not ok")

/-- `match filterArgs args with | r :: _ => System.FilePath.mk r | [] => "."`.
    `List.casesOn` levels are motive, then `List`'s parameter
    (`Lean/Meta/Constructions/NoConfusion.lean`). `"."` is
    `System.FilePath.mk` because `Coe String FilePath` is
    `FilePath.mk` (`Init/System/FilePath.lean`). Not `Bool.not`. -/
def capableComposeRootMatch (args : Lean.Expr) : Lean.Expr :=
  let motive :=
    Lean.mkLambda `xs Lean.BinderInfo.default listStringType
      (Lean.mkConst `System.FilePath)
  let nilAlt :=
    Lean.mkApp (Lean.mkConst `System.FilePath.mk) (Lean.mkStrLit ".")
  let consAlt :=
    Lean.mkLambda `r Lean.BinderInfo.default (Lean.mkConst `String)
      (Lean.mkLambda `tail Lean.BinderInfo.default listStringType
        (Lean.mkApp (Lean.mkConst `System.FilePath.mk) (Lean.mkBVar 1)))
  Lean.mkApp5
    (Lean.mkConst `List.casesOn
      [Lean.Level.succ Lean.Level.zero, Lean.Level.zero])
    (Lean.mkConst `String)
    motive
    (Lean.mkApp (Lean.mkConst `SystemsLean.CapableCompose.filterArgs) args)
    nilAlt
    consAlt

/-- Statements after `unless`, at a scope whose `root` is `bvar 0`.
    One extra lambda (the join-point value) shifts `root` to `bvar 1`. -/
def capableComposeAfterUnless (root : Lean.Expr) : Lean.Expr :=
  estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
    (Lean.mkApp
      (Lean.mkConst `SystemsLean.CapableCompose.freestandingCapableComposePlanApplyBody)
      root)
    (unitLam capableComposePureZero)

/-- `unless` rewrites to `if c then skip else body`
    (`Lean/Elab/BuiltinDo/Misc.lean`). `throw` is a plain term, so
    both arms fall through (`InferControlInfo.lean`) and the `if`
    keeps a `__do_jp` let (`Do/Basic.lean`, `numRegularExits > 1`).
    This Expr is the try body. `root` is `bvar 0`. -/
def capableComposeTryBody : Lean.Expr :=
  let jpTy :=
    Lean.Expr.forallE `u (Lean.mkConst `Unit)
      (ioType (Lean.mkConst `UInt32)) Lean.BinderInfo.default
  let jpVal :=
    Lean.mkLambda `u Lean.BinderInfo.default (Lean.mkConst `Unit)
      (capableComposeAfterUnless (Lean.mkBVar 1))
  let jumpHere := Lean.mkApp (Lean.mkBVar 0) (Lean.mkConst `Unit.unit)
  let jumpAfterThrow := Lean.mkApp (Lean.mkBVar 2) (Lean.mkConst `Unit.unit)
  let elseArm :=
    estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
      (ioAction `IO.eprintln capableComposeSurfaceMsg)
      (unitLam
        (estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
          (capableComposeThrow (Lean.mkConst `Unit)
            "productPathFreestandingCapableComposeOk false")
          (unitLam jumpAfterThrow)))
  let branch :=
    ioCond
      (Lean.mkConst `SystemsLean.CapableCompose.productPathFreestandingCapableComposeOk)
      jumpHere
      elseArm
  Lean.Expr.letE `__do_jp jpTy jpVal branch true

/-- `catch e =>` has no type ascription, so the elaborator builds
    `MonadExcept.tryCatch` (`BuiltinDo/TryCatch.lean`). The `IO`
    instance body is `EST.tryCatch`. `s!"{e}"` is `toString` on
    `IO.Error` (`Init/Data/ToString/Macro.lean`,
    `Init/System/IOError.lean`). The handler is at `e` = `bvar 0`. -/
def capableComposeCatch : Lean.Expr :=
  Lean.mkLambda `e Lean.BinderInfo.default (Lean.mkConst `IO.Error)
    (estBind (Lean.mkConst `Unit) (Lean.mkConst `UInt32)
      (ioAction `IO.eprintln
        (Lean.mkApp (Lean.mkConst `IO.Error.toString) (Lean.mkBVar 0)))
      (unitLam pureOne))

/-- `let root` is `Expr.letE` (`Lean/Expr.lean`, `BuiltinDo/Let.lean`).
    The value is the `filterArgs` / `System.FilePath.mk` match.
    `args` is `bvar 0` in that value. `root` is `bvar 0` in the body. -/
def capableComposeMainValue : Lean.Expr :=
  Lean.mkLambda `args Lean.BinderInfo.default listStringType
    (Lean.Expr.letE `root (Lean.mkConst `System.FilePath)
      (capableComposeRootMatch (Lean.mkBVar 0))
      (Lean.mkApp5 (Lean.mkConst `EST.tryCatch)
        (Lean.mkConst `IO.Error) (Lean.mkConst `IO.RealWorld)
        (Lean.mkConst `UInt32)
        capableComposeTryBody
        capableComposeCatch)
      false)

def capableComposeMainDef : ParsedDef := {
  declName := `SystemsLean.CapableCompose.main
  typeConst := Lean.Name.anonymous
  typeExpr := some mainFnType
  value := capableComposeMainValue
}

/-- Trimmed lines from `def main` through `end`, comments dropped.
    Includes `pure 1`, which is in the source. -/
def capableComposeMainLines : List String := [
  "def main (args : List String) : IO UInt32 := do",
  "let root : System.FilePath :=",
  "match filterArgs args with",
  "| r :: _ => System.FilePath.mk r",
  "| [] => \".\"",
  "try",
  "unless productPathFreestandingCapableComposeOk do",
  "IO.eprintln s!\"error: {stageId} surface not ok\"",
  "throw (IO.userError \"productPathFreestandingCapableComposeOk false\")",
  "freestandingCapableComposePlanApplyBody root",
  "pure 0",
  "catch e =>",
  "IO.eprintln s!\"{e}\"",
  "pure 1",
  "end SystemsLean.CapableCompose"
]

/-- none when the do-block is not the CapableCompose main, or any
    statement differs, or the prefix is not a closed fragment.
    The structure is `composeSsotSpecDecl` on `declsForAdd`, not a
    `ParsedDef`. Parsing continues past it. `containsStr` is a
    `defnDecl`. `ssotBlock` is a `defnDecl`. `requireFile` is a
    `defnDecl`. `planApplyBodySpecs` is a `defnDecl`.
    `freestandingCapableComposeReadOneSsot` is a `defnDecl`.
    The next command, `buildComposeMarker`, is not translated,
    so this still returns none.
    Other `:= do` files stay unclaimed. -/
def capableComposeParsed (lines : List String) :
    Option (Prod (Array Lean.Import) (Prod (List ParsedDef) Bool)) :=
  match splitAtMain [] lines with
  | none => none
  | some (pre, mainLines) =>
    if linesEq (trimmedCode mainLines) capableComposeMainLines then
      match parseLines pre with
      | .unclaimed => none
      | .ready imports ds saw =>
        some (imports, ds ++ [capableComposeMainDef], saw)
    else
      none

/-- `:= do` is unclaimed unless the trimmed main lines are exactly
    `irGraphMainLines`, `linearMainLines`, `linearUseFailMainLines`,
    or `capableComposeMainLines`. A file outside those four lists
    stays unclaimed. CapableCompose itself stays unclaimed while
    `parseLines` of its prefix is unclaimed, so the main Expr is
    not an accept by itself. -/
def parsedOf (src : String) :
    Option (Prod (Array Lean.Import) (Prod (List ParsedDef) Bool)) :=
  let stripped := stripSource src
  if refusesAssignDo src then
    match irGraphParsed stripped.lines with
    | some r => some r
    | none =>
      match linearParsed stripped.lines with
      | some r => some r
      | none =>
        match linearUseFailParsed stripped.lines with
        | some r => some r
        | none => capableComposeParsed stripped.lines
  else
    match parseLines stripped.lines with
    | .unclaimed => none
    | .ready imports ds saw => some (imports, ds, saw)

/-- `SystemsLean.SurfaceMatrix.matrixSurfaceOk`. Not a literal `true`.
    The body is the transparent `&&` chain in SurfaceMatrix.lean. -/
def matrixSurfaceOkName : Lean.Name :=
  `SystemsLean.SurfaceMatrix.matrixSurfaceOk

/-- `SystemsLean.SurfaceMatrix.matrixSurfaceOk_true`. -/
def matrixSurfaceOkTrueName : Lean.Name :=
  `SystemsLean.SurfaceMatrix.matrixSurfaceOk_true

/-- Kernel type `matrixSurfaceOk = true`. Not `none`. -/
def matrixSurfaceOkTrueType : Lean.Expr :=
  Lean.mkApp3
    (Lean.mkConst `Eq [Lean.Level.succ Lean.Level.zero])
    (Lean.mkConst `Bool)
    (Lean.mkConst matrixSurfaceOkName)
    (Lean.mkConst `Bool.true)

/-- `Eq.refl` at `Bool`, applied to `matrixSurfaceOk`.
    Inferred type is `matrixSurfaceOk = matrixSurfaceOk`.
    That is definitionally `matrixSurfaceOk = true` when the
    transparent chain reduces to `Bool.true`. Not `by decide`.
    Not `Term.litNat`. -/
def matrixSurfaceOkTrueValue : Lean.Expr :=
  Lean.mkApp2
    (Lean.mkConst `Eq.refl [Lean.Level.succ Lean.Level.zero])
    (Lean.mkConst `Bool)
    (Lean.mkConst matrixSurfaceOkName)

/-- Theorem the kernel receives. Not a `defnDecl` of `litNat`. -/
def matrixSurfaceOkTrueDecl : Lean.Declaration :=
  Lean.Declaration.thmDecl {
    name := matrixSurfaceOkTrueName
    levelParams := []
    type := matrixSurfaceOkTrueType
    value := matrixSurfaceOkTrueValue
    all := [matrixSurfaceOkTrueName]
  }

/-- The one written theorem line. `by decide` is recognized and
    not copied into the proof. -/
def parseMatrixSurfaceOkTrueLine (ns : List Lean.Name) (cs : List Char) : Bool :=
  match afterWord "theorem" cs with
  | none => false
  | some rest =>
    match readIdent (skipWs rest) with
    | none => false
    | some (id, rest) =>
      if qualify ns id != matrixSurfaceOkTrueName then
        false
      else
        match skipWs rest with
        | ':' :: rest =>
          match readQual (skipWs rest) with
          | none => false
          | some (lhs, rest) =>
            if lhs != `matrixSurfaceOk && lhs != matrixSurfaceOkName then
              false
            else
              match skipWs rest with
              | '=' :: rest =>
                match readQual (skipWs rest) with
                | none => false
                | some (rhs, rest) =>
                  if rhs != `true then
                    false
                  else
                    match skipWs rest with
                    | ':' :: '=' :: rest =>
                      match readIdent (skipWs rest) with
                      | some ("by", rest) =>
                        match readIdent (skipWs rest) with
                        | some ("decide", rest) => onlyWs rest
                        | _ => false
                      | _ => false
                    | _ => false
              | _ => false
        | _ => false

structure MatrixWalk where
  found : Bool
  other : Bool
  imports : Array Lean.Import
  deriving Inhabited

def matrixStep (ns : List Lean.Name) (w : MatrixWalk) (line : String) :
    Prod (List Lean.Name) MatrixWalk :=
  let cs := line.toList
  if (skipWs cs).isEmpty then
    (ns, w)
  else
    match firstWord cs with
    | none => (ns, { w with other := true })
    | some word =>
      if word == "set_option" || word == "open" || word == "example" then
        (ns, w)
      else if word == "import" || word == "public" || word == "meta" then
        match parseImport cs with
        | some i => (ns, { w with imports := w.imports.push i })
        | none => (ns, { w with other := true })
      else if word == "namespace" then
        match parseNamespace cs with
        | some n => (n :: ns, w)
        | none => (ns, { w with other := true })
      else if word == "end" then
        match parseEnd ns cs with
        | some ns2 => (ns2, w)
        | none => (ns, { w with other := true })
      else if word == "theorem" then
        if parseMatrixSurfaceOkTrueLine ns cs then
          (ns, { w with found := true })
        else
          (ns, { w with other := true })
      else
        (ns, { w with other := true })

def walkMatrix (ns : List Lean.Name) (w : MatrixWalk) : List String -> MatrixWalk
  | [] => w
  | line :: rest =>
    match matrixStep ns w line with
    | (ns2, w2) => walkMatrix ns2 w2 rest

def matrixSurfaceWalk (src : String) : MatrixWalk :=
  walkMatrix [] { found := false, other := false, imports := #[] }
    (stripSource src).lines

/-- True when the stripped source has the original theorem line. -/
def matrixSurfaceOkTrueFound (src : String) : Bool :=
  (matrixSurfaceWalk src).found

/-- Kernel env for the file's imports. If that import throws, use
    an empty import list so addDecl is still called. -/
def kernelEnvFor (imports : Array Lean.Import) : IO Lean.Kernel.Environment := do
  try
    let env <- Lean.importModules imports Lean.Options.empty
    return Lean.Environment.toKernelEnv env
  catch _ =>
    let env <- Lean.importModules #[] Lean.Options.empty
    return Lean.Environment.toKernelEnv env

/-- One addDecl of `matrixSurfaceOkTrueDecl`.
    False when no kernel env loads or addDecl returns an error.
    Does not call elabTerm or processCommands. -/
def submitMatrixSurfaceOkTrue (imports : Array Lean.Import) : IO Bool := do
  try
    let kenv <- kernelEnvFor imports
    match Lean.Kernel.Environment.addDecl kenv Lean.Options.empty
        matrixSurfaceOkTrueDecl with
    | .ok _ => return true
    | .error _ => return false
  catch _ =>
    return false

/-- accept only when importModules and addDecl succeed for every
    declaration on `declsForAdd`, and the ok count equals that
    length. `sawComposeSsotSpec` puts `composeSsotSpecDecl` on
    that list and does not accept: `deriving Repr` is not encoded.
    An untranslated `:= do` is none, then unclaimed. An empty
    declaration list is unclaimed, so set_option alone does not
    accept. CapableCompose stays none because `buildComposeMarker`
    is untranslated, so this does not accept that file.
    A source with `matrixSurfaceOk_true` calls addDecl on
    `matrixSurfaceOkTrueDecl`. Accept when that call returns ok.
    Another declaration in the same source is not a reject by
    itself. An addDecl error stays notAccepted. -/
unsafe def claimSourceUnsafe (src : String) : Claim :=
  let walked := matrixSurfaceWalk src
  if walked.found then
    match unsafeIO (submitMatrixSurfaceOkTrue walked.imports) with
    | .ok true => .accept
    | .ok false => .notAccepted
    | .error _ => .notAccepted
  else
    match parsedOf src with
    | none => .unclaimed
    | some (imports, ds, saw) =>
      if ds.isEmpty && !saw then
        .unclaimed
      else if saw then
        match unsafeIO (checkFragmentIO imports saw ds) with
        | .ok true => .unclaimed
        | .ok false => .notAccepted
        | .error _ => .notAccepted
      else
        match unsafeIO (checkFragmentIO imports false ds) with
        | .ok true => .accept
        | .ok false => .notAccepted
        | .error _ => .notAccepted

/-- Safe body does not accept. The unsafe body is the one that can
    return accept, and only after addDecl. A fragment that hit
    ComposeSsotSpec is not accepted here. A source with
    `matrixSurfaceOk_true` is not unclaimed. -/
@[implemented_by claimSourceUnsafe]
def claimSource (src : String) : Claim :=
  if matrixSurfaceOkTrueFound src then
    .notAccepted
  else
    match parsedOf src with
    | none => .unclaimed
    | some (_, ds, saw) =>
      if saw || ds.isEmpty then .unclaimed else .notAccepted

end SystemsLean.OriginalDeclaration
