/-
  Module: SystemsLean.HonestyDualResFront
  Front for the SystemsLean.DualResidual def surface.
  The namespace string selects the seed. The file name is not stored.
  Four imports, then that namespace, then defs, then the same end.
  A fifth import is none. A sibling namespace is none.
  A string def stores its literal. A compare must use that literal.
  A different literal is none. A false pin stays false.
  A local `&&` chain lowers to `if c then t else false`.
  `!` on a local Bool lowers to `if c then false else true`.
  ProductPath.productPathCloseReady and
  SelfApplyFs.freestandingProductSelfHostComplete stay unreduced.
  A chain that mentions either one is not emitted as Bool true.
  An alias of that chain is not emitted as Bool true.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HonestyFront

namespace SystemsLean.HonestyDualResFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront
  (strip SMode tok TMode parseDotted parseFuel isIdent unquote
    lookupStr hasBool)

def nsSeed : String := "SystemsLean.DualResidual"

def importSeed : List String :=
  [ "SystemsLean.ProductPath"
  , "SystemsLean.InventoryClose"
  , "SystemsLean.SelfApplyFs"
  , "SystemsLean.LlvmHold"
  ]

def itemFuel : Nat := 1024

inductive Body where
  | keep (t : Term)
  | skip

def markBang : List Char -> Bool -> List Char -> List Char
  | [], _, acc => acc.reverse
  | '\\' :: c :: rest, true, acc =>
    markBang rest true (c :: '\\' :: acc)
  | '"' :: rest, false, acc => markBang rest true ('"' :: acc)
  | '"' :: rest, true, acc => markBang rest false ('"' :: acc)
  | '!' :: rest, false, acc =>
    markBang rest false
      (' ' :: 'g' :: 'n' :: 'a' :: 'B' :: 't' :: 'o' :: 'n' :: ' ' :: acc)
  | c :: rest, ins, acc => markBang rest ins (c :: acc)

def extOk (a b : String) : Bool :=
  (a == "ProductPath" && b == "productPathCloseReady") ||
    (a == "SelfApplyFs" &&
      b == "freestandingProductSelfHostComplete")

def known (strs : List (Prod String String)) (bools held : List String)
    (name : String) : Bool :=
  match lookupStr strs name with
  | some _ => true
  | none => hasBool bools name || hasBool held name

structure St where
  strs : List (Prod String String)
  bools : List String
  held : List String
  cmds : List Cmd

def emptySt : St :=
  { strs := [], bools := [], held := [], cmds := [] }

def addStr (st : St) (name s : String) : St :=
  { st with
    strs := (name, s) :: st.strs
    cmds :=
      Cmd.def_ (n name) (some HostType.string) (Term.litString s) ::
        st.cmds }

def addKeep (st : St) (name : String) (t : Term) : St :=
  { st with
    bools := name :: st.bools
    cmds :=
      Cmd.def_ (n name) (some HostType.bool) t :: st.cmds }

def addSkip (st : St) (name : String) : St :=
  { st with held := name :: st.held }

def notTerm (name : String) : Term :=
  Term.ite (Term.var (n name)) (Term.litBool false) (Term.litBool true)

def parseAtom (strs : List (Prod String String))
    (bools held : List String) (ts : List String) :
    Option (Prod Body (List String)) :=
  match ts with
  | "(" :: name :: "==" :: lit :: ")" :: rest =>
    if isIdent name then
      match unquote lit, lookupStr strs name with
      | some s, some want =>
        if s == want then
          let t :=
            Term.decideEq (Term.var (n name)) (Term.litString s)
          some (Body.keep t, rest)
        else
          none
      | _, _ => none
    else
      none
  | "notBang" :: name :: rest =>
    if isIdent name && hasBool bools name then
      some (Body.keep (notTerm name), rest)
    else if isIdent name && hasBool held name then
      some (Body.skip, rest)
    else
      none
  | a :: "." :: b :: rest =>
    if isIdent a && isIdent b && extOk a b then
      some (Body.skip, rest)
    else
      none
  | name :: rest =>
    if isIdent name && hasBool bools name then
      some (Body.keep (Term.var (n name)), rest)
    else if isIdent name && hasBool held name then
      some (Body.skip, rest)
    else
      none
  | _ => none

def join (a b : Body) : Body :=
  match a, b with
  | Body.keep t, Body.keep u =>
    Body.keep (Term.ite t u (Term.litBool false))
  | _, _ => Body.skip

def parseChain (fuel : Nat) (strs : List (Prod String String))
    (bools held : List String) (acc : Body) (ts : List String) :
    Option (Prod Body (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "&&" :: rest =>
      match parseAtom strs bools held rest with
      | none => none
      | some (right, rest2) =>
        parseChain k strs bools held (join acc right) rest2
    | _ => some (acc, ts)
termination_by fuel

def parseBoolBody (fuel : Nat) (strs : List (Prod String String))
    (bools held : List String) (ts : List String) :
    Option (Prod Body (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "true" :: "&&" :: _ => none
    | "true" :: rest => some (Body.keep (Term.litBool true), rest)
    | "false" :: rest => some (Body.keep (Term.litBool false), rest)
    | _ =>
      match parseAtom strs bools held ts with
      | none => none
      | some (atom, rest) =>
        parseChain k strs bools held atom rest

def parseDef (fuel : Nat) (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "def" :: name :: ":" :: "String" :: ":=" :: lit :: rest =>
      if isIdent name && !known st.strs st.bools st.held name then
        match unquote lit with
        | some s => some (addStr st name s, rest)
        | none => none
      else
        none
    | "def" :: name :: ":" :: "Bool" :: ":=" :: rest =>
      if isIdent name && !known st.strs st.bools st.held name then
        match parseBoolBody k st.strs st.bools st.held rest with
        | some (Body.keep t, rest2) =>
          some (addKeep st name t, rest2)
        | some (Body.skip, rest2) => some (addSkip st name, rest2)
        | none => none
      else
        none
    | _ => none

def parseDefs (fuel : Nat) (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "def" :: _ =>
      match parseDef k st ts with
      | some (st2, rest) => parseDefs k st2 rest
      | none => none
    | "end" :: _ => some (st, ts)
    | _ => none
termination_by fuel

def takeImports (fuel : Nat) (need : List String) (ts : List String) :
    Option (List String) :=
  match fuel, need with
  | _, [] => some ts
  | 0, _ => none
  | Nat.succ k, s :: more =>
    match ts with
    | "import" :: rest =>
      match parseDotted parseFuel rest with
      | some (got, rest2) =>
        if got == s then takeImports k more rest2 else none
      | none => none
    | _ => none
termination_by fuel

def importCmds : List Cmd :=
  [ Cmd.importModule (n "SystemsLean.ProductPath")
  , Cmd.importModule (n "SystemsLean.InventoryClose")
  , Cmd.importModule (n "SystemsLean.SelfApplyFs")
  , Cmd.importModule (n "SystemsLean.LlvmHold")
  ]

def finish (ns : String) (cmds : List Cmd) (ts : List String) :
    Option Module :=
  match ts with
  | "end" :: rest =>
    match parseDotted parseFuel rest with
    | some (nm, rest2) =>
      if nm == ns && ns == nsSeed && rest2.isEmpty &&
          !cmds.isEmpty then
        let all :=
          importCmds ++ [Cmd.namespace (n ns)] ++ cmds ++
            [Cmd.endNamespace (n ns)]
        let m : Module := { name := n ns, commands := all }
        if isWellFormed m then some m else none
      else
        none
    | none => none
  | _ => none

/-- Parse this surface. none means not these imports, or a bad claim. -/
def parseHonestyDualResText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok (markBang kept false []) TMode.norm [] with
    | none => none
    | some ts =>
      match takeImports 8 importSeed ts with
      | none => none
      | some rest =>
        match rest with
        | "namespace" :: rest2 =>
          match parseDotted parseFuel rest2 with
          | some (ns, rest3) =>
            match parseDefs itemFuel emptySt rest3 with
            | some (st, rest4) => finish ns st.cmds.reverse rest4
            | none => none
          | none => none
        | _ => none

def dualHead : String :=
  "import SystemsLean.ProductPath\n" ++
  "import SystemsLean.InventoryClose\n" ++
  "import SystemsLean.SelfApplyFs\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "namespace SystemsLean.DualResidual\n"

def dualEnd : String :=
  "end SystemsLean.DualResidual\n"

def dualToySrc : String :=
  dualHead ++
  "def stageId : String := \"SLAKE_SELF_HOST_DUAL_RESIDUAL_V0\"\n" ++
  "def hostElaboratorResidualRemains : Bool := false\n" ++
  "def surface : Bool := " ++
  "(stageId == \"SLAKE_SELF_HOST_DUAL_RESIDUAL_V0\")\n" ++
  "def gone : Bool := !hostElaboratorResidualRemains\n" ++
  "def ready : Bool := ProductPath.productPathCloseReady && surface\n" ++
  dualEnd

def dualBadSrc : String :=
  dualHead ++
  "def stageId : String := \"SLAKE_SELF_HOST_DUAL_RESIDUAL_V0\"\n" ++
  "def surface : Bool := (stageId == \"OTHER\")\n" ++
  dualEnd

def dualSiblingSrc : String :=
  "namespace SystemsLean.DualEqWriteParity\n" ++
  "def hostElaboratorResidualRemains : Bool := false\n" ++
  "end SystemsLean.DualEqWriteParity\n"

def cmdIsFalse (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ nm (some HostType.bool) (Term.litBool false) =>
    nm.raw == "hostElaboratorResidualRemains"
  | _ => false

def cmdIsIte (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ nm (some HostType.bool) (Term.ite _ _ _) =>
    nm.raw == "gone"
  | _ => false

def cmdIsReadyTrue (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ nm (some HostType.bool) (Term.litBool true) =>
    nm.raw == "ready"
  | _ => false

def anyCmd (cs : List Cmd) (p : Cmd -> Bool) : Bool :=
  match cs with
  | [] => false
  | c :: rest => p c || anyCmd rest p

/-- False pin stays false. Bang is an ite. Ready is not Bool true. -/
def dualToyShape : Bool :=
  match parseHonestyDualResText dualToySrc with
  | some m =>
    anyCmd m.commands cmdIsFalse && anyCmd m.commands cmdIsIte &&
      !anyCmd m.commands cmdIsReadyTrue && isWellFormed m
  | none => false

/-- A compare that disagrees with the stored literal is none. -/
def dualToyRejects : Bool :=
  match parseHonestyDualResText dualBadSrc with
  | none => true
  | some _ => false

/-- A sibling namespace is none. -/
def dualSiblingNone : Bool :=
  match parseHonestyDualResText dualSiblingSrc with
  | none => true
  | some _ => false

end SystemsLean.HonestyDualResFront
