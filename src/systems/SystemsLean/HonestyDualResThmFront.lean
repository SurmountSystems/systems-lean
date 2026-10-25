/-
  Module: SystemsLean.HonestyDualResThmFront
  Front for theorems and examples over SystemsLean.DualResidual.
  The fifth import selects the seed. The file name is not stored.
  Five imports, then namespace SystemsLean.DualResidual.
  DualResidual.lean has four imports, so it is none.
  A sibling namespace is none.
  Every theorem and every example is checked with decideHolds.
  A mismatch is none. There is no typeless Bool stand-in.
  An rfl theorem is not emitted. An example is not emitted.
  `by decide` emits Bool true only when both sides reduce
  to the same value. A false pin in the seed stays false.
  A lone Bool true is not a stand-in for an unreduced theorem.
  External dotted names are seed facts. They are not emitted.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HonestyDecide
import SystemsLean.HonestyFront

namespace SystemsLean.HonestyDualResThmFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyDecide (decideHolds)
open SystemsLean.HonestyFront
  (strip SMode parseDotted parseFuel isIdent unquote
    isDigit isWs isLetter isIdentChar)

def nsSeed : String := "SystemsLean.DualResidual"

def importSeed : List String :=
  [ "SystemsLean.ProductPath"
  , "SystemsLean.InventoryClose"
  , "SystemsLean.SelfApplyFs"
  , "SystemsLean.LlvmHold"
  , "SystemsLean.DualResidual"
  ]

def itemFuel : Nat := 256

def strBody (s : String) : DefBody :=
  { binder := "", body := Term.litString s }

def boolBody (b : Bool) : DefBody :=
  { binder := "", body := Term.litBool b }

def lit (nm s : String) : Prod String DefBody :=
  (nm, strBody s)

def pin (nm : String) (b : Bool) : Prod String DefBody :=
  (nm, boolBody b)

def bind (nm : String) (t : Term) : Prod String DefBody :=
  (nm, { binder := "", body := t })

def eqS (nm s : String) : Term :=
  Term.decideEq (Term.var (n nm)) (Term.litString s)

def notB (t : Term) : Term :=
  Term.ite t (Term.litBool false) (Term.litBool true)

/-- Each step is `if c then t else false`. -/
def andAll : List Term -> Term
  | [] => Term.litBool true
  | [t] => t
  | t :: rest => Term.ite t (andAll rest) (Term.litBool false)

def surfaceTerms : List Term :=
  [ eqS "stageId" "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0"
  , eqS "hostDualResidualId" "HOST-DUAL-RESIDUAL"
  , eqS "selfHostDualResidualId" "SELF-HOST-DUAL-RESIDUAL"
  , eqS "acceptancePath" "src/systems/self-host.md"
  , eqS "hostModulePath" "src/systems/SystemsLean/DualResidual.lean"
  , eqS "inventoryPath" "src/systems/host-partial-inventory.md"
  , eqS "productPathCloseStageCite"
      "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0"
  , eqS "inventoryCloseStageCite"
      "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0"
  , eqS "llvmHoldStageCite" "SLAKE_SELF_HOST_LLVM_HOLD_V0"
  , eqS "hostProductPathCloseCite" "HOST-PRODUCT-PATH-CLOSE"
  , eqS "hostInventoryCloseCite" "HOST-INVENTORY-CLOSE"
  , eqS "hostLlvmHoldCite" "HOST-LLVM-HOLD"
  , eqS "hostResidualCite" "HOST-RESIDUAL"
  , eqS "productWireResidualCite" "PRODUCT-WIRE-RESIDUAL"
  , eqS "emitBoundaryCite" "EMIT-BOUNDARY"
  , eqS "runtimeFsCite" "RUNTIME-FS"
  , eqS "runtimeClassicCite" "RUNTIME-CLASSIC"
  , eqS "residualFreeMeasureStageCite"
      "SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0"
  , eqS "residualFreeMeasureHostCite"
      "PRODUCT-RESIDUAL-FREE-MEASURE"
  , eqS "residualFreeMeasureSelfHostCite"
      "SELF-HOST-RESIDUAL-FREE-MEASURE"
  , eqS "residualFreeMeasureNixPath"
      "nix/systems-emit-wire/residual-free-measure.nix"
  , eqS "hostElaboratorResidualToken"
      "host elaborator residual free"
  , eqS "productResidualToken" "product residual free"
  , eqS "intentionalPartialToken" "intentional PARTIAL"
  ]

def citedBody : Term :=
  andAll
    [ eqS "residualFreeMeasureStageCite"
        "SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0"
    , eqS "residualFreeMeasureHostCite"
        "PRODUCT-RESIDUAL-FREE-MEASURE"
    , eqS "residualFreeMeasureSelfHostCite"
        "SELF-HOST-RESIDUAL-FREE-MEASURE"
    , eqS "residualFreeMeasureNixPath"
        "nix/systems-emit-wire/residual-free-measure.nix"
    ]

def agreesBody : Term :=
  andAll
    [ Term.var (n "productResidualFreeMeasureCited")
    , Term.var (n "residualFreeClaimed")
    , notB (Term.var (n "productResidualRemains"))
    ]

def distinctBody : Term :=
  andAll
    [ notB (Term.var (n "hostElaboratorResidualRemains"))
    , notB (Term.var (n "productResidualRemains"))
    , Term.var (n "hostElaboratorResidualFreeClaimed")
    , Term.var (n "residualFreeClaimed")
    , eqS "hostElaboratorResidualToken"
        "host elaborator residual free"
    , eqS "productResidualToken" "product residual free"
    , eqS "hostResidualCite" "HOST-RESIDUAL"
    , eqS "productWireResidualCite" "PRODUCT-WIRE-RESIDUAL"
    , eqS "emitBoundaryCite" "EMIT-BOUNDARY"
    , eqS "runtimeClassicCite" "RUNTIME-CLASSIC"
    , eqS "runtimeFsCite" "RUNTIME-FS"
    ]

def readyBody : Term :=
  andAll
    [ Term.var (n "ProductPath.productPathCloseReady")
    , Term.var (n "dualResidualSurfaceOk")
    , Term.var (n "dualResidualSurfacesDistinct")
    , notB (Term.var (n "hostElaboratorResidualRemains"))
    , notB (Term.var (n "productResidualRemains"))
    , Term.var (n "productResidualFreeMeasureCited")
    , Term.var (n "residualFreeMeasureAgreesFree")
    , Term.var (n "hostElaboratorResidualFreeClaimed")
    , Term.var (n "residualFreeClaimed")
    , Term.var (n "productSelfHostCompleteClaimed")
    , Term.var (n "SelfApplyFs.freestandingProductSelfHostComplete")
    ]

def forgeBody : Term :=
  andAll
    [ Term.var (n "dualResidualReady")
    , Term.var (n "hostElaboratorResidualFreeClaimed")
    , Term.var (n "residualFreeClaimed")
    , notB (Term.var (n "hostElaboratorResidualRemains"))
    , notB (Term.var (n "productResidualRemains"))
    ]

def strLeaves : DefEnv :=
  [ lit "stageId" "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0"
  , lit "hostDualResidualId" "HOST-DUAL-RESIDUAL"
  , lit "selfHostDualResidualId" "SELF-HOST-DUAL-RESIDUAL"
  , lit "acceptancePath" "src/systems/self-host.md"
  , lit "hostModulePath" "src/systems/SystemsLean/DualResidual.lean"
  , lit "inventoryPath" "src/systems/host-partial-inventory.md"
  , lit "productPathCloseStageCite"
      "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0"
  , lit "inventoryCloseStageCite"
      "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0"
  , lit "llvmHoldStageCite" "SLAKE_SELF_HOST_LLVM_HOLD_V0"
  , lit "hostProductPathCloseCite" "HOST-PRODUCT-PATH-CLOSE"
  , lit "hostInventoryCloseCite" "HOST-INVENTORY-CLOSE"
  , lit "hostLlvmHoldCite" "HOST-LLVM-HOLD"
  , lit "hostResidualCite" "HOST-RESIDUAL"
  , lit "productWireResidualCite" "PRODUCT-WIRE-RESIDUAL"
  , lit "emitBoundaryCite" "EMIT-BOUNDARY"
  , lit "runtimeFsCite" "RUNTIME-FS"
  , lit "runtimeClassicCite" "RUNTIME-CLASSIC"
  , lit "residualFreeMeasureStageCite"
      "SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0"
  , lit "residualFreeMeasureHostCite"
      "PRODUCT-RESIDUAL-FREE-MEASURE"
  , lit "residualFreeMeasureSelfHostCite"
      "SELF-HOST-RESIDUAL-FREE-MEASURE"
  , lit "residualFreeMeasureNixPath"
      "nix/systems-emit-wire/residual-free-measure.nix"
  , lit "hostElaboratorResidualToken"
      "host elaborator residual free"
  , lit "productResidualToken" "product residual free"
  , lit "intentionalPartialToken" "intentional PARTIAL"
  ]

def boolLeaves : DefEnv :=
  [ pin "hostElaboratorResidualRemains" false
  , pin "productResidualRemains" false
  , pin "hostElaboratorResidualFreeClaimed" true
  , pin "residualFreeClaimed" true
  , pin "productSelfHostCompleteClaimed" true
  , pin "ProductPath.productPathCloseReady" true
  , pin "SelfApplyFs.freestandingProductSelfHostComplete" true
  , pin "LlvmHold.llvmUnlocked" true
  , pin "LlvmHold.provablyUnlocked" true
  , pin "InventoryClose.inventoryCloseReady" true
  , pin "LlvmHold.llvmHoldReady" true
  ]

def derived : DefEnv :=
  [ bind "dualResidualSurfaceOk" (andAll surfaceTerms)
  , bind "productResidualFreeMeasureCited" citedBody
  , bind "residualFreeMeasureAgreesFree" agreesBody
  , bind "dualResidualSurfacesDistinct" distinctBody
  , bind "dualResidualReady" readyBody
  , bind "dualResidualDoesNotForgeHostFree" forgeBody
  , bind "dualResidualOk" (Term.var (n "dualResidualReady"))
  ]

/-- Derived bodies sit first. Lookup keeps the first match. -/
def thmSeed : DefEnv :=
  derived ++ strLeaves ++ boolLeaves

/-- False pins stay false. Decide holds only on equal values. -/
def seedHolds : Bool :=
  decideHolds thmSeed
    (Term.var (n "productResidualFreeMeasureCited"))
    (Term.litBool true)
  && decideHolds thmSeed
    (Term.var (n "residualFreeMeasureAgreesFree"))
    (Term.litBool true)
  && decideHolds thmSeed
    (Term.var (n "dualResidualReady"))
    (Term.litBool true)
  && decideHolds thmSeed
    (Term.var (n "dualResidualDoesNotForgeHostFree"))
    (Term.litBool true)
  && decideHolds thmSeed
    (Term.var (n "dualResidualOk"))
    (Term.var (n "dualResidualReady"))
  && decideHolds thmSeed
    (Term.var (n "stageId"))
    (Term.litString "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0")
  && decideHolds thmSeed
    (Term.var (n "ProductPath.productPathCloseReady"))
    (Term.litBool true)
  && !decideHolds thmSeed
    (Term.var (n "hostElaboratorResidualRemains"))
    (Term.litBool true)
  && !decideHolds thmSeed
    (Term.var (n "productResidualRemains"))
    (Term.litBool true)

inductive Proof where
  | rfl
  | decide

structure ThmWalk where
  cmds : List Cmd
  sawDecide : Bool
  sawExample : Bool
  sawFalse : Bool
  sawRfl : Bool

def emptyWalk : ThmWalk :=
  { cmds := []
    sawDecide := false
    sawExample := false
    sawFalse := false
    sawRfl := false }

def holdsFalse (rhs : Term) : Bool :=
  match rhs with
  | Term.litBool false => true
  | _ => false

/-- Bool true only after decideHolds. rfl and examples never call this. -/
def emitHeld (nm : String) : Cmd :=
  Cmd.def_ (n nm) (some HostType.bool) (Term.litBool true)

def parseSide (ts : List String) : Option (Prod Term (List String)) :=
  match ts with
  | "true" :: rest => some (Term.litBool true, rest)
  | "false" :: rest => some (Term.litBool false, rest)
  | lit :: rest =>
    match unquote lit with
    | some s => some (Term.litString s, rest)
    | none =>
      match parseDotted parseFuel ts with
      | some (nm, rest2) => some (Term.var (n nm), rest2)
      | none => none
  | [] => none

def takeEq (ts : List String) :
    Option (Prod Term (Prod Term (List String))) :=
  match parseSide ts with
  | some (lhs, "=" :: rest) =>
    match parseSide rest with
    | some (rhs, rest2) => some (lhs, rhs, rest2)
    | none => none
  | _ => none

/-- `rfl` and `by decide` only. `native_decide` is none. -/
def takeProof (ts : List String) : Option (Prod Proof (List String)) :=
  match ts with
  | ":=" :: "rfl" :: rest => some (Proof.rfl, rest)
  | ":=" :: "by" :: "decide" :: rest => some (Proof.decide, rest)
  | _ => none

def noteFalse (w : ThmWalk) (rhs : Term) : ThmWalk :=
  { w with sawFalse := w.sawFalse || holdsFalse rhs }

def parseItems (fuel : Nat) (w : ThmWalk) (ts : List String) :
    Option (Prod ThmWalk (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "set_option" :: opt :: rest =>
      if isIdent opt then parseItems k w rest else none
    | "theorem" :: name :: ":" :: rest =>
      if isIdent name then
        match takeEq rest with
        | some (lhs, rhs, rest2) =>
          match takeProof rest2 with
          | some (p, rest3) =>
            if decideHolds thmSeed lhs rhs then
              let w1 := noteFalse w rhs
              match p with
              | Proof.rfl =>
                parseItems k { w1 with sawRfl := true } rest3
              | Proof.decide =>
                parseItems k
                  { w1 with
                    sawDecide := true
                    cmds := emitHeld name :: w1.cmds }
                  rest3
            else
              none
          | none => none
        | none => none
      else
        none
    | "example" :: ":" :: rest =>
      match takeEq rest with
      | some (lhs, rhs, rest2) =>
        match takeProof rest2 with
        | some (_, rest3) =>
          if decideHolds thmSeed lhs rhs then
            parseItems k
              { noteFalse w rhs with sawExample := true }
              rest3
          else
            none
        | none => none
      | none => none
    | "end" :: _ => some (w, ts)
    | _ => none
termination_by fuel

def importCmds : List Cmd :=
  [ Cmd.importModule (n "SystemsLean.ProductPath")
  , Cmd.importModule (n "SystemsLean.InventoryClose")
  , Cmd.importModule (n "SystemsLean.SelfApplyFs")
  , Cmd.importModule (n "SystemsLean.LlvmHold")
  , Cmd.importModule (n "SystemsLean.DualResidual")
  ]

def finish (ns : String) (w : ThmWalk) (ts : List String) :
    Option Module :=
  if w.sawDecide && w.sawExample && w.sawFalse && w.sawRfl
      && !w.cmds.isEmpty then
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && ns == nsSeed && rest2.isEmpty then
          let cmds :=
            importCmds ++ [Cmd.namespace (n ns)]
            ++ w.cmds.reverse
            ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m then some m else none
        else
          none
      | none => none
    | _ => none
  else
    none

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

inductive TokMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)

/-- An identifier is the reversed character list. A string keeps quotes. -/
def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Tokens for `=`, `:=`, and a lone `:`. A leading number is dropped.
    That keeps `set_option maxRecDepth 16384` from rejecting the file. -/
def tok : List Char -> TokMode -> List String -> Option (List String)
  | [], TokMode.norm, acc => some acc.reverse
  | [], TokMode.id cur, acc => some (emitId acc cur).reverse
  | [], TokMode.str _, _ => none
  | '"' :: rest, TokMode.str cur, acc =>
    tok rest TokMode.norm (emitStr acc cur)
  | c :: rest, TokMode.str cur, acc =>
    tok rest (TokMode.str (c :: cur)) acc
  | ':' :: '=' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm (":=" :: acc)
  | ':' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm (":" :: acc)
  | '=' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm ("=" :: acc)
  | '.' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm ("." :: acc)
  | '"' :: rest, TokMode.norm, acc =>
    tok rest (TokMode.str []) acc
  | c :: rest, TokMode.norm, acc =>
    if isWs c then
      tok rest TokMode.norm acc
    else if isDigit c then
      tok rest TokMode.norm acc
    else if isLetter c || c == '_' then
      tok rest (TokMode.id [c]) acc
    else
      none
  | ':' :: '=' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm (":=" :: emitId acc cur)
  | ':' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm (":" :: emitId acc cur)
  | '=' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("=" :: emitId acc cur)
  | '.' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("." :: emitId acc cur)
  | c :: rest, TokMode.id cur, acc =>
    if isIdentChar c then
      tok rest (TokMode.id (c :: cur)) acc
    else if isWs c then
      tok rest TokMode.norm (emitId acc cur)
    else
      none

/-- Parse this surface. none means not these imports, or a bad claim. -/
def parseHonestyDualResThmText (src : String) : Option Module :=
  if !seedHolds then
    none
  else
    match strip src.toList SMode.code [] with
    | none => none
    | some kept =>
      match tok kept TokMode.norm [] with
      | none => none
      | some ts =>
        match takeImports 8 importSeed ts with
        | none => none
        | some rest =>
          match rest with
          | "namespace" :: rest2 =>
            match parseDotted parseFuel rest2 with
            | some (ns, rest3) =>
              if ns == nsSeed then
                match parseItems itemFuel emptyWalk rest3 with
                | some (w, rest4) => finish ns w rest4
                | none => none
              else
                none
            | none => none
          | _ => none

def thmToyHead : String :=
  "import SystemsLean.ProductPath\n"
  ++ "import SystemsLean.InventoryClose\n"
  ++ "import SystemsLean.SelfApplyFs\n"
  ++ "import SystemsLean.LlvmHold\n"
  ++ "import SystemsLean.DualResidual\n"
  ++ "namespace SystemsLean.DualResidual\n"

def thmToyFalse : String :=
  "theorem hostElaboratorResidualRemains_false : "
  ++ "hostElaboratorResidualRemains = false := rfl\n"

def thmToyDecide : String :=
  "theorem productResidualFreeMeasureCited_true : "
  ++ "productResidualFreeMeasureCited = true := by decide\n"

def thmToyEx : String :=
  "example : hostElaboratorResidualRemains = false "
  ++ ":= by decide\n"

def thmToyEnd : String :=
  "end SystemsLean.DualResidual\n"

def thmToySrc : String :=
  thmToyHead ++ thmToyFalse ++ thmToyDecide ++ thmToyEx ++ thmToyEnd

def thmBadSrc : String :=
  thmToyHead
  ++ "theorem hostElaboratorResidualRemains_false : "
  ++ "hostElaboratorResidualRemains = true := rfl\n"
  ++ thmToyDecide ++ thmToyEx ++ thmToyEnd

/-- Four imports, the DualResidual.lean seed. The fifth import is absent. -/
def thmSiblingSrc : String :=
  "import SystemsLean.ProductPath\n"
  ++ "import SystemsLean.InventoryClose\n"
  ++ "import SystemsLean.SelfApplyFs\n"
  ++ "import SystemsLean.LlvmHold\n"
  ++ "namespace SystemsLean.DualResidual\n"
  ++ thmToyFalse ++ thmToyDecide ++ thmToyEx ++ thmToyEnd

def thmWrongNsSrc : String :=
  "import SystemsLean.ProductPath\n"
  ++ "import SystemsLean.InventoryClose\n"
  ++ "import SystemsLean.SelfApplyFs\n"
  ++ "import SystemsLean.LlvmHold\n"
  ++ "import SystemsLean.DualResidual\n"
  ++ "namespace SystemsLean.DualResidualTheorems\n"
  ++ thmToyFalse ++ thmToyDecide ++ thmToyEx
  ++ "end SystemsLean.DualResidualTheorems\n"

def cmdIsHeld (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.bool) (Term.litBool true) => true
  | _ => false

/-- One false rfl, one held decide, one false example.
    rfl and the example stay out of the command list. -/
def thmToyShape : Bool :=
  match parseHonestyDualResThmText thmToySrc with
  | some m =>
    match m.commands with
    | Cmd.importModule _ :: Cmd.importModule _ ::
        Cmd.importModule _ :: Cmd.importModule _ ::
        Cmd.importModule _ :: Cmd.namespace _ :: c ::
        Cmd.endNamespace _ :: [] =>
      cmdIsHeld c && isWellFormed m && seedHolds
    | _ => false
  | none => false

/-- Flipping the false pin to true is none. -/
def thmToyRejects : Bool :=
  match parseHonestyDualResThmText thmBadSrc with
  | none => true
  | some _ => false

/-- The four-import sibling is none. The basename is not a namespace. -/
def thmSiblingNone : Bool :=
  match parseHonestyDualResThmText thmSiblingSrc with
  | none =>
    match parseHonestyDualResThmText thmWrongNsSrc with
    | none => true
    | some _ => false
  | some _ => false

end SystemsLean.HonestyDualResThmFront
