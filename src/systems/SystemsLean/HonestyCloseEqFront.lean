/-
  Module: SystemsLean.HonestyCloseEqFront
  Front for theorems and examples over SystemsLean.DualEqWriteClosePath.
  The import string selects the seed. The file name is not stored.
  Every theorem and every example is checked with decideHolds.
  A mismatch is none. There is no typeless Bool stand-in.
  An rfl theorem is not emitted. An example is not emitted.
  `by decide` emits Bool true only when both sides reduce
  to the same value. A false pin in the seed stays false.
  A lone Bool true is not a stand-in for an unreduced theorem.
  PartialReady is the derived body, not a stored Bool true.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HonestyDecide
import SystemsLean.HonestyFront
import SystemsLean.HonestyThmFront

namespace SystemsLean.HonestyCloseEqFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyDecide (decideHolds)
open SystemsLean.HonestyFront
  (strip SMode parseDotted parseFuel isIdent unquote)
open SystemsLean.HonestyThmFront (thmTok ThmMode)

def closeImport : String := "SystemsLean.DualEqWriteClosePath"

def itemFuel : Nat := 64

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0"

def hostLit : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"

def selfLit : String :=
  "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"

def closeIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"

def namedIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED"

def notClosedIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED"

def stepApiLit : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"

def stepGapLit : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"

def stepRetireLit : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"

def stepClaimedLit : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"

def fullBarLit : String :=
  "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"

def recipeLit : String := "build"

def writerLit : String := "FreestandingEmit"

def exeLit : String := "slake-emit-freestanding-c"

def gateLit : String := "DUAL-SSOT-EQUALITY"

def apiLit : String := "requireDualSsotEqual"

def writeApiLit : String := "freestandingCapableWriteFreestandingHc"

def writeModLit : String := "CapableWriteHc"

def lakeFreeLit : String :=
  "freestanding-perform-dual-equality-write-close-path"

def measureLit : String :=
  "freestanding-perform-dual-equality-write-close-path-measure"

def lakeExeLit : String :=
  "slake-freestanding-perform-dual-equality-write-close-path"

def b34Lit : String :=
  "freestanding-perform-dual-equality-write-parity"

def okNm : String :=
  "productPathFreestandingPerformDualEqualityWriteClosePathOk"

def partialNm : String :=
  "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady"

def measuredNm : String :=
  "productPathFreestandingPerformDualEqualityWriteClosePathMeasured"

def namedNm : String := "productPathDualEqualityWriteClosePathNamed"

def notClosedNm : String :=
  "productPathDualEqualityWriteClosePathNotGapClosed"

def parityNm : String := "productPathDualEqualityWriteParityGapOpen"

def structuralNm : String :=
  "productPathCapableWriteStructuralNotDualEquality"

def claimedNm : String := "productPathFreestandingPerformClaimed"

def dependsNm : String := "productPathPerformDependsOnLake"

def parityMeasuredNm : String :=
  "productPathFreestandingPerformDualEqualityWriteParityMeasured"

def stillEmitNm : String :=
  "productPathOfficialPathStillUsesFreestandingEmit"

def stillLakeNm : String := "productPathOfficialPathStillUsesLake"

def retireNm : String :=
  "productPathOfficialPathRetireFreestandingEmitRequired"

def blocksNm : String :=
  "productPathOfficialPathDualEqualityBlocksRetirement"

def fullNm : String :=
  "productPathFreestandingCapableStepContractFullSatisfied"

def closeIdNm : String := "dualEqualityWriteClosePathId"

def namedIdNm : String := "dualEqualityWriteClosePathNamedId"

def notClosedIdNm : String := "dualEqualityWriteClosePathNotGapClosedId"

def stepApiNm : String := "closeStepDualEqualityApi"

def stepGapNm : String := "closeStepCapableGap"

def stepRetireNm : String := "closeStepRetireOfficial"

def stepClaimedNm : String := "closeStepPerformClaimed"

def fullBarNm : String := "fullBarReqPerformClaimedWithEvidence"

def recipeNm : String := "officialPathRecipe"

def writerNm : String := "officialPathLakeWriter"

def exeNm : String := "officialPathLakeExe"

def gateNm : String := "officialPathDualEqualityGate"

def apiNm : String := "officialPathDualEqualityApi"

def writeApiNm : String := "capableWriteApi"

def writeModNm : String := "capableWriteModule"

def lakeFreeNm : String := "lakeFreeClosePathRecipe"

def measureNm : String := "justMeasureRecipe"

def lakeExeNm : String := "lakeExeName"

def b34Nm : String := "b34ParityRecipe"

def stageIdNm : String := "stageId"

def hostIdNm : String := "hostId"

def selfHostIdNm : String := "selfHostId"

def strBody (s : String) : DefBody :=
  { binder := "", body := Term.litString s }

def boolBody (b : Bool) : DefBody :=
  { binder := "", body := Term.litBool b }

def lit (nm s : String) : Prod String DefBody :=
  (nm, strBody s)

def pin (nm : String) (b : Bool) : Prod String DefBody :=
  (nm, boolBody b)

def eqS (nm s : String) : Term :=
  Term.decideEq (Term.var (n nm)) (Term.litString s)

def eqB (nm : String) (b : Bool) : Term :=
  Term.decideEq (Term.var (n nm)) (Term.litBool b)

def notB (t : Term) : Term :=
  Term.ite t (Term.litBool false) (Term.litBool true)

/-- Left-associated in source. Here each step is `if c then t else false`. -/
def andAll : List Term -> Term
  | [] => Term.litBool true
  | [t] => t
  | t :: rest => Term.ite t (andAll rest) (Term.litBool false)

/-- Same conjuncts as ClosePath Ok. False pins stay false. -/
def okBody : Term :=
  andAll
    [ eqS stageIdNm stageLit
    , eqS hostIdNm hostLit
    , eqS selfHostIdNm selfLit
    , eqB measuredNm true
    , eqB namedNm true
    , eqB notClosedNm true
    , eqB parityNm true
    , eqB structuralNm true
    , eqB claimedNm false
    , eqB dependsNm true
    , eqB parityMeasuredNm true
    , eqB stillEmitNm true
    , eqB stillLakeNm true
    , eqB retireNm true
    , eqB blocksNm true
    , eqB fullNm false
    , eqS closeIdNm closeIdLit
    , eqS namedIdNm namedIdLit
    , eqS notClosedIdNm notClosedIdLit
    , eqS stepApiNm stepApiLit
    , eqS stepGapNm stepGapLit
    , eqS stepRetireNm stepRetireLit
    , eqS stepClaimedNm stepClaimedLit
    , eqS fullBarNm fullBarLit
    , eqS recipeNm recipeLit
    , eqS writerNm writerLit
    , eqS exeNm exeLit
    , eqS gateNm gateLit
    , eqS apiNm apiLit
    , eqS writeApiNm writeApiLit
    , eqS writeModNm writeModLit
    , eqS lakeFreeNm lakeFreeLit
    , eqS measureNm measureLit
    , eqS lakeExeNm lakeExeLit
    , eqS b34Nm b34Lit
    ]

/-- Derived fold. Not a stored Bool true. -/
def partialBody : Term :=
  andAll
    [ Term.var (n okNm)
    , Term.var (n measuredNm)
    , Term.var (n namedNm)
    , Term.var (n notClosedNm)
    , Term.var (n parityNm)
    , Term.var (n structuralNm)
    , Term.var (n blocksNm)
    , notB (Term.var (n claimedNm))
    , Term.var (n dependsNm)
    , Term.var (n stillEmitNm)
    , Term.var (n stillLakeNm)
    , Term.var (n retireNm)
    , notB (Term.var (n fullNm))
    ]

def closeLeaves : DefEnv :=
  [ lit "stageId" stageLit
  , lit "hostId" hostLit
  , lit "selfHostId" selfLit
  , lit closeIdNm closeIdLit
  , lit namedIdNm namedIdLit
  , lit notClosedIdNm notClosedIdLit
  , lit stepApiNm stepApiLit
  , lit stepGapNm stepGapLit
  , lit stepRetireNm stepRetireLit
  , lit stepClaimedNm stepClaimedLit
  , lit fullBarNm fullBarLit
  , lit recipeNm recipeLit
  , lit writerNm writerLit
  , lit exeNm exeLit
  , lit gateNm gateLit
  , lit apiNm apiLit
  , lit writeApiNm writeApiLit
  , lit writeModNm writeModLit
  , lit lakeFreeNm lakeFreeLit
  , lit measureNm measureLit
  , lit lakeExeNm lakeExeLit
  , lit b34Nm b34Lit
  , pin measuredNm true
  , pin namedNm true
  , pin notClosedNm true
  , pin parityNm true
  , pin structuralNm true
  , pin dependsNm true
  , pin parityMeasuredNm true
  , pin stillEmitNm true
  , pin stillLakeNm true
  , pin retireNm true
  , pin blocksNm true
  , pin claimedNm false
  , pin fullNm false
  ]

/-- PartialReady and Ok sit first. Lookup keeps the first match.
    PartialReady is the derived body, not a stored Bool true. -/
def closeSeed : DefEnv :=
  (partialNm, { binder := "", body := partialBody })
  :: (okNm, { binder := "", body := okBody })
  :: closeLeaves

/-- The derived body, not a stored true. -/
def partialReduces : Bool :=
  decideHolds closeSeed (Term.var (n partialNm)) (Term.litBool true)
    && decideHolds closeSeed (Term.var (n okNm)) (Term.litBool true)
    && !decideHolds closeSeed (Term.var (n claimedNm)) (Term.litBool true)
    && !decideHolds closeSeed (Term.var (n fullNm)) (Term.litBool true)

inductive Proof where
  | rfl
  | decide

structure CloseWalk where
  cmds : List Cmd
  sawDecide : Bool
  sawExample : Bool
  sawFalse : Bool
  sawRfl : Bool

def emptyWalk : CloseWalk :=
  { cmds := []
    sawDecide := false
    sawExample := false
    sawFalse := false
    sawRfl := false }

def holdsFalse (rhs : Term) : Bool :=
  match rhs with
  | Term.litBool false => true
  | _ => false

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
      if isIdent lit then some (Term.var (n lit), rest) else none
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

def noteFalse (w : CloseWalk) (rhs : Term) : CloseWalk :=
  { w with sawFalse := w.sawFalse || holdsFalse rhs }

def parseItems (fuel : Nat) (w : CloseWalk) (ts : List String) :
    Option (Prod CloseWalk (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "theorem" :: name :: ":" :: rest =>
      if isIdent name then
        match takeEq rest with
        | some (lhs, rhs, rest2) =>
          match takeProof rest2 with
          | some (p, rest3) =>
            if decideHolds closeSeed lhs rhs then
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
          if decideHolds closeSeed lhs rhs then
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

def finish (ns : String) (w : CloseWalk) (ts : List String) :
    Option Module :=
  if w.sawDecide && w.sawExample && w.sawFalse && w.sawRfl
      && !w.cmds.isEmpty then
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && ns == closeImport && rest2.isEmpty then
          let cmds :=
            [Cmd.importModule (n ns), Cmd.namespace (n ns)]
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

/-- Parse this surface. none means not this import, or a bad claim. -/
def parseHonestyCloseEqText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match thmTok kept ThmMode.norm [] with
    | none => none
    | some ts =>
      match ts with
      | "import" :: rest =>
        match parseDotted parseFuel rest with
        | some (imp, rest2) =>
          if imp == closeImport then
            match rest2 with
            | "namespace" :: rest3 =>
              match parseDotted parseFuel rest3 with
              | some (ns, rest4) =>
                if ns == imp then
                  match parseItems itemFuel emptyWalk rest4 with
                  | some (w, rest5) => finish ns w rest5
                  | none => none
                else
                  none
              | none => none
            | _ => none
          else
            none
        | none => none
      | _ => none

def closeToyHead : String :=
  "import SystemsLean.DualEqWriteClosePath\n" ++
  "namespace SystemsLean.DualEqWriteClosePath\n"

def closeToyFalseThm : String :=
  "theorem productPathFreestandingPerformClaimed_false : " ++
  "productPathFreestandingPerformClaimed = false := rfl\n"

def closeToyBadThm : String :=
  "theorem productPathFreestandingPerformClaimed_false : " ++
  "productPathFreestandingPerformClaimed = true := rfl\n"

def closeToyOkThm : String :=
  "theorem productPathFreestandingPerformDualEqualityWriteClosePathOk_true : "
  ++ "productPathFreestandingPerformDualEqualityWriteClosePathOk = true "
  ++ ":= by decide\n"

def closeToyEx : String :=
  "example : productPathFreestandingPerformClaimed = false := by decide\n"

def closeToyEnd : String :=
  "end SystemsLean.DualEqWriteClosePath\n"

def closeToySrc : String :=
  closeToyHead ++ closeToyFalseThm ++ closeToyOkThm ++ closeToyEx ++ closeToyEnd

def closeBadSrc : String :=
  closeToyHead ++ closeToyBadThm ++ closeToyOkThm ++ closeToyEx ++ closeToyEnd

def cmdIsHeld (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.bool) (Term.litBool true) => true
  | _ => false

/-- One false rfl, one held decide, one false example. rfl and the
    example stay out of the command list. -/
def closeToyShape : Bool :=
  match parseHonestyCloseEqText closeToySrc with
  | some m =>
    match m.commands with
    | Cmd.importModule _ :: Cmd.namespace _ :: c ::
        Cmd.endNamespace _ :: [] =>
      cmdIsHeld c && isWellFormed m
    | _ => false
  | none => false

/-- Flipping the false pin to true is none. -/
def closeToyRejects : Bool :=
  match parseHonestyCloseEqText closeBadSrc with
  | none => true
  | some _ => false

end SystemsLean.HonestyCloseEqFront
