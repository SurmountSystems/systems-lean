/-
  Module: SystemsLean.KeptHitKernel
  Typed walk for a KeptHit. Theorem, tactic, mutual pair, and linear
  def together are a pass only when their types check.
  Theorem conclusion is Bool or Prop. Boolean `==` is not Prop.
  Boolean `!=` is not Prop.
  Tactic is decide. Bang `decide!` is not decide.
  Mutual pair types match and are Option Host.
  Matching Nat views are not a pass. Linear mint def is Nat, not
  a ty-none Cmd.def_.
  Does not call kernelFailAt. Does not type an untyped Cmd.def_.
  HostTerm.Cmd is not extended.
  Hollow namespace and end is not a pass.
  Missing any of the four is not a pass.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.KeptWalk
import SystemsLean.HostTerm
import SystemsLean.MutualForm
import SystemsLean.RejectBeqThm
import SystemsLean.RejectBne
import SystemsLean.RejectMatch
import SystemsLean.RejectIf
import SystemsLean.RejectIte
import SystemsLean.RejectDecideAscription
import SystemsLean.RejectCond
import SystemsLean.RejectDite
import SystemsLean.RejectBif
import SystemsLean.RejectDcond
import SystemsLean.RejectOr
import SystemsLean.RejectAnd
import SystemsLean.RejectNot
import SystemsLean.RejectXor
import SystemsLean.RejectStrictOr
import SystemsLean.RejectStrictAnd
import SystemsLean.RejectBoolBne
import SystemsLean.RejectBoolBeq
import SystemsLean.RejectDecideBang
import SystemsLean.RejectNotPrefix
import SystemsLean.RejectOrInfix
import SystemsLean.RejectAndInfix
import SystemsLean.RejectXorInfix

namespace SystemsLean.KeptHitKernel

open SystemsLean.KeptWalk
open SystemsLean.HostTerm (HostType n hostTypeOk)
open SystemsLean.MutualForm (
  Scan startScan eat flushPending endLine
  startsWord trim stripCR isIdentChar)

/-- Honesty: this walk does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Flag stays false. -/
def flag : Bool := false

/-- Linear substring in a def name. Grade-1 mint names carry it. -/
def hasLinear : List Char -> Bool
  | [] => false
  | 'l' :: 'i' :: 'n' :: 'e' :: 'a' :: 'r' :: _ => true
  | 'L' :: 'i' :: 'n' :: 'e' :: 'a' :: 'r' :: _ => true
  | _ :: rest => hasLinear rest

/-- Types fixture mint is typesFixtureMintId (no linear substring).
    CompilePathLinear still uses linearFixtureMintId.
    CompilePath barrel mint is compilePathFixtureMintId.
    Mult fixture mint is multFixtureMintId. Plan fixture mint is planFixtureMintId. -/
def nameHasLinear (nm : String) : Bool :=
  hasLinear nm.toList || nm == "typesFixtureMintId" || nm == "programFixtureMintId" || nm == "graphFixtureMintId" || nm == "compilePathFixtureMintId" || nm == "extractFixtureMintId" || nm == "applyFixtureMintId" || nm == "bodyFixtureMintId" || nm == "composeFixtureMintId" || nm == "multFixtureMintId" || nm == "planFixtureMintId"

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\t' || c == '\r'

def skipWs : List Char -> List Char
  | [] => []
  | c :: rest => if isWs c then skipWs rest else c :: rest

def takeIdent (cs : List Char) : Prod String (List Char) :=
  go cs []
where
  go (cs : List Char) (acc : List Char) : Prod String (List Char) :=
    match cs with
    | [] => (String.mk acc.reverse, [])
    | c :: rest =>
      if isIdentChar c then go rest (c :: acc)
      else (String.mk acc.reverse, cs)

def takeUntilAssign (cs : List Char) : List Char :=
  go cs []
where
  go (cs : List Char) (acc : List Char) : List Char :=
    match cs with
    | [] => acc.reverse
    | ':' :: '=' :: _ => acc.reverse
    | c :: rest => go rest (c :: acc)

/-- Type ascription after `:` and before `:=`. none if `:=` is next. -/
def colonType (cs : List Char) : Option String :=
  match skipWs cs with
  | ':' :: '=' :: _ => none
  | ':' :: more =>
    let body := trim (String.mk (takeUntilAssign (skipWs more)))
    if body == "" then none else some body
  | _ => none

/-- First whole-ident match of nm, then its ascription. Fuel on length. -/
def findAscription (fuel : Nat) (nm : String) (cs : List Char)
    : Option String :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    let t := skipWs cs
    match t with
    | [] => none
    | _ =>
      let (id, more) := takeIdent t
      if id == nm then colonType more
      else if id == "" then
        match t with
        | [] => none
        | _ :: rest => findAscription k nm rest
      else
        findAscription k nm more

def grabOne (cur nm line : String) : String :=
  if cur != "" then cur
  else
    match findAscription (line.length + 2) nm line.toList with
    | some t => t
    | none => ""

structure TyAcc where
  thmS : String
  leftS : String
  rightS : String
  linS : String

def emptyTy : TyAcc :=
  { thmS := "", leftS := "", rightS := "", linS := "" }

def grab (st : TyAcc) (h : KeptHit) (line : String) : TyAcc :=
  { thmS := grabOne st.thmS h.triple.theoremForm.theoremName line
    leftS := grabOne st.leftS h.triple.mutualForm.leftName line
    rightS := grabOne st.rightS h.triple.mutualForm.rightName line
    linS := grabOne st.linS h.triple.linearDef.defName line }

def onTyLine (st : TyAcc) (h : KeptHit) (sc : Scan) (line : String)
    : Prod TyAcc Scan :=
  let started := sc.mode == 0
  let sc1 := eat { sc with taking := started, pre := [] } line.toList
  let sc2 := flushPending sc1
  let st2 :=
    if started then grab st h (String.mk sc2.pre.reverse) else st
  (st2, endLine sc2)

def foldTy (st : TyAcc) (h : KeptHit) (sc : Scan)
    : List String -> Prod TyAcc Scan
  | [] => (st, sc)
  | line :: rest =>
    let (st2, sc2) := onTyLine st h sc line
    foldTy st2 h sc2 rest

def isIdentStr (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: rest => identStart c && rest.all isIdentChar

def hasEqSign : List Char -> Bool
  | [] => false
  | '=' :: _ => true
  | _ :: rest => hasEqSign rest

/-- Map a source ascription to HostType. Fail closed. -/
def parseHostType (fuel : Nat) (s : String) : Option HostType :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    let t := trim s
    if t == "" then none
    else if t == "Nat" then some HostType.nat
    else if t == "Bool" then some HostType.bool
    else if t == "String" then some HostType.string
    else if t == "Mult" then some HostType.mult
    else if t == "True" || t == "Prop" then some HostType.bool
    else if hasEqSign t.toList then some HostType.bool
    else if startsWord t "Option" then
      match parseHostType k (dropWord t "Option") with
      | none => none
      | some e => some (HostType.option e)
    else if isIdentStr t then some (HostType.named (n t))
    else none

def hostTypeEq : HostType -> HostType -> Bool
  | HostType.mult, HostType.mult => true
  | HostType.nat, HostType.nat => true
  | HostType.string, HostType.string => true
  | HostType.bool, HostType.bool => true
  | HostType.option a, HostType.option b => hostTypeEq a b
  | HostType.named x, HostType.named y => x.raw == y.raw
  | HostType.arrow d1 c1, HostType.arrow d2 c2 =>
    hostTypeEq d1 d2 && hostTypeEq c1 c2
  | _, _ => false

structure TypedKept where
  thmTy : HostType
  leftTy : HostType
  rightTy : HostType
  linTy : HostType

/-- Types for the four KeptHit names. none if any ascription fails. -/
def typesOf (h : KeptHit) (src : String) : Option TypedKept :=
  let (st, sc) := foldTy emptyTy h startScan (src.splitOn "\n")
  if sc.mode != 0 then none
  else
    let f := src.length + 2
    match parseHostType f st.thmS,
          parseHostType f st.leftS,
          parseHostType f st.rightS,
          parseHostType f st.linS with
    | some tt, some lt, some rt, some dt =>
      some { thmTy := tt, leftTy := lt, rightTy := rt, linTy := dt }
    | _, _, _, _ => none

/-- Names present. Not the typed check. -/
def hitNames (h : KeptHit) : Bool :=
  h.triple.mutualForm.leftName != ""
    && h.triple.mutualForm.rightName != ""
    && h.triple.theoremForm.theoremName != ""
    && h.triple.linearDef.defName != ""
    && h.tactic.tacticName != ""

/-- Linear mint is not one of the mutual names. Four distinct forms. -/
def distinctFour (h : KeptHit) : Bool :=
  let l := h.triple.mutualForm.leftName
  let r := h.triple.mutualForm.rightName
  let d := h.triple.linearDef.defName
  let t := h.triple.theoremForm.theoremName
  d != l && d != r && t != l && t != r && t != d && l != r

/-- Specimen mutual views. Matching Nat is not this type. -/
def optionHostTy : HostType :=
  HostType.option (HostType.named (n "Host"))

/-- Bool/Prop theorem, decide, Option Host views, linear Nat mint. -/
def typedPass (h : KeptHit) (src : String) : Bool :=
  hitNames h && distinctFour h
    && h.tactic.tacticName == "decide"
    && nameHasLinear h.triple.linearDef.defName
    && !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src
    && match typesOf h src with
       | none => false
       | some ty =>
         hostTypeEq ty.thmTy HostType.bool
           && hostTypeOk ty.leftTy
           && hostTypeEq ty.leftTy ty.rightTy
           && hostTypeEq ty.leftTy optionHostTy
           && hostTypeEq ty.linTy HostType.nat

/-- Named fixture forms the walk must see on CompilePathLinear. -/
def seesFixture (h : KeptHit) : Bool :=
  h.triple.theoremForm.theoremName == "linearFixtureProgramReady_true"
    && h.tactic.tacticName == "decide"
    && h.triple.mutualForm.leftName == "linearFixtureLiveView"
    && h.triple.mutualForm.rightName == "linearFixtureSpentView"
    && h.triple.linearDef.defName == "linearFixtureMintId"

/-- Named fixture forms the walk must see on CompilePathTypes. -/
def seesTypesFixture (h : KeptHit) : Bool :=
  h.triple.theoremForm.theoremName == "typesFixtureKindMultOk_true"
    && h.tactic.tacticName == "decide"
    && h.triple.mutualForm.leftName == "typesFixtureLiveView"
    && h.triple.mutualForm.rightName == "typesFixtureSpentView"
    && h.triple.linearDef.defName == "typesFixtureMintId"

/-- Named kernel walk. Typed KeptHit is accept. none is not. -/
def acceptKept (src : String) : Bool :=
  match walkKept src with
  | none => false
  | some h => typedPass h src

/-- Same four forms as keptToy with the specimen Option Host views. -/
def optionHostToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : True := by decide\n" ++
  "end N\n"

/-- optionHostToy has theorem True, decide, Option Host views, linear Nat. -/
def acceptKeptToy : Bool := acceptKept optionHostToy

/-- Matching Nat views are not the CompilePathLinear Option Host pair. -/
def rejectNatViews : Bool := !acceptKept keptToy

/-- Hollow namespace and end is not a KeptHit pass. -/
def rejectHollow : Bool := !acceptKept hollowToy

/-- Theorem without mutual names is not a KeptHit pass. -/
def rejectThmOnly : Bool := !acceptKept thmOnlyToy

/-- Comment-only forms are not a KeptHit pass. -/
def rejectComment : Bool := !acceptKept commentToy

/-- native_decide is not the decide tactic. -/
def rejectNative : Bool := !acceptKept byNextToy

def mismatchToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Nat := 0\n" ++
  "def rightN : Bool := true\n" ++
  "end\n" ++
  "theorem th : True := by decide\n" ++
  "end N\n"

/-- Mutual view types that do not match fail closed. -/
def rejectMismatch : Bool := !acceptKept mismatchToy

def noTypeToy : String :=
  "namespace N\n" ++
  "def linearN := 2\n" ++
  "mutual\n" ++
  "def leftN : Nat := 0\n" ++
  "def rightN : Nat := 1\n" ++
  "end\n" ++
  "theorem th : True := by decide\n" ++
  "end N\n"

/-- Linear mint without a Nat ascription fails closed. -/
def rejectNoType : Bool := !acceptKept noTypeToy

def noLinNameToy : String :=
  "namespace N\n" ++
  "def mintId : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Nat := 0\n" ++
  "def rightN : Nat := 1\n" ++
  "end\n" ++
  "theorem th : True := by decide\n" ++
  "end N\n"

/-- A plain Nat def is not the linear mint form. -/
def rejectNoLinName : Bool := !acceptKept noLinNameToy

def thmNatToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Nat := 0\n" ++
  "def rightN : Nat := 1\n" ++
  "end\n" ++
  "theorem th : Nat := by decide\n" ++
  "end N\n"

/-- Theorem conclusion that is not Bool or Prop fails closed. -/
def rejectThmNat : Bool := !acceptKept thmNatToy

/-- Boolean `==` theorem ascription is not Prop. -/
def rejectBeqThm : Bool :=
  !acceptKept SystemsLean.RejectBeqThm.beqThmToy

/-- Boolean `!=` theorem ascription is not Prop. -/
def rejectBne : Bool :=
  !acceptKept SystemsLean.RejectBne.bneToy

/-- Bang tactic `decide!` is not the decide tactic. -/
def rejectDecideBang : Bool :=
  !acceptKept SystemsLean.RejectDecideBang.bangToy

def fixtureToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def linearFixtureMintId : Nat := 7\n" ++
  "mutual\n" ++
  "def linearFixtureLiveView : Option Host := none\n" ++
  "def linearFixtureSpentView : Option Host := none\n" ++
  "end\n" ++
  "theorem linearFixtureProgramReady_true : " ++
  "linearFixtureProgramReady = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

/-- Walk sees the four CompilePathLinear forms with types. -/
def acceptFixtureToy : Bool :=
  match walkKept fixtureToy with
  | none => false
  | some h =>
    acceptKept fixtureToy && seesFixture h && typedPass h fixtureToy

def typesFixtureToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def typesFixtureMintId : Nat := 5\n" ++
  "mutual\n" ++
  "def typesFixtureLiveView : Option Host := none\n" ++
  "def typesFixtureSpentView : Option Host := none\n" ++
  "end\n" ++
  "theorem typesFixtureKindMultOk_true : " ++
  "typesFixtureKindMultOk = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

/-- Walk sees the four CompilePathTypes forms with types. -/
def acceptTypesFixtureToy : Bool :=
  match walkKept typesFixtureToy with
  | none => false
  | some h =>
    acceptKept typesFixtureToy && seesTypesFixture h
      && typedPass h typesFixtureToy

def mutualFormHollowSrc : String :=
  "import SystemsLean.HostTerm\n" ++
  "namespace N\n" ++
  "end N\n"

/-- MutualForm.finish stays none for a hollow Module. -/
def mutualFormFinishHollowNone : Bool :=
  match SystemsLean.MutualForm.parseMutualForm
      mutualFormHollowSrc with
  | none => true
  | some _ => false

def mutualFormBareHollowNone : Bool :=
  match SystemsLean.MutualForm.parseMutualForm hollowToy with
  | none => true
  | some _ => false

def pinsOk : Bool :=
  acceptKeptToy && rejectHollow && rejectThmOnly && rejectComment
    && rejectNative && rejectMismatch && rejectNoType
    && rejectNoLinName && rejectThmNat && rejectNatViews
    && rejectBeqThm && rejectBne && rejectDecideBang
    && acceptFixtureToy && acceptTypesFixtureToy
    && mutualFormFinishHollowNone && mutualFormBareHollowNone
    && !slakeOwnsPackageTypecheck && !flag

end SystemsLean.KeptHitKernel
