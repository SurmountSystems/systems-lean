/-
  Module: SystemsLean.HonestyGapEqFront
  Front for theorems and examples over SystemsLean.DualEqWriteCapableGap.
  The import string selects the seed. The file name is not stored.
  Every theorem and every example is checked with decideHolds.
  A mismatch is none. There is no typeless Bool stand-in.
  An rfl theorem is not emitted. An example is not emitted.
  `by decide` emits Bool true only when both sides reduce
  to the same value. A false pin in the seed stays false.
  A lone Bool true is not a stand-in for an unreduced theorem.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HonestyDecide
import SystemsLean.HonestyFront
import SystemsLean.HonestyThmFront

namespace SystemsLean.HonestyGapEqFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyDecide (decideHolds)
open SystemsLean.HonestyFront
  (strip SMode parseDotted parseFuel isIdent unquote)
open SystemsLean.HonestyThmFront (thmTok ThmMode)

def gapImport : String := "SystemsLean.DualEqWriteCapableGap"

def itemFuel : Nat := 64

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0"

def hostLit : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"

def selfLit : String :=
  "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"

def gapIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"

def closedIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-CLOSED"

def liveIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-DUAL-EQ-LIVE"

def stepIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-STEP-ADVANCED"

def closeGapLit : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"

def closeRetireLit : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"

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
  "freestanding-perform-dual-equality-write-capable-gap"

def measureLit : String :=
  "freestanding-perform-dual-equality-write-capable-gap-measure"

def lakeExeLit : String :=
  "slake-freestanding-perform-dual-equality-write-capable-gap"

def b36Lit : String := "freestanding-perform-dual-equality-write-api"

def okNm : String :=
  "productPathFreestandingPerformDualEqualityWriteCapableGapOk"

def partialNm : String :=
  "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady"

def measuredNm : String :=
  "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured"

def closedNm : String := "productPathDualEqualityWriteCapableGapClosed"

def liveNm : String := "productPathCapableWriteDualEqualityLive"

def stepNm : String :=
  "productPathDualEqualityWriteCapableGapStepAdvanced"

def parityNm : String := "productPathDualEqualityWriteParityGapOpen"

def structuralNm : String :=
  "productPathCapableWriteStructuralNotDualEquality"

def claimedNm : String := "productPathFreestandingPerformClaimed"

def dependsNm : String := "productPathPerformDependsOnLake"

def apiMeasuredNm : String :=
  "productPathFreestandingPerformDualEqualityWriteApiMeasured"

def stillEmitNm : String :=
  "productPathOfficialPathStillUsesFreestandingEmit"

def stillLakeNm : String := "productPathOfficialPathStillUsesLake"

def retireNm : String :=
  "productPathOfficialPathRetireFreestandingEmitRequired"

def blocksNm : String :=
  "productPathOfficialPathDualEqualityBlocksRetirement"

def fullNm : String :=
  "productPathFreestandingCapableStepContractFullSatisfied"

def gapIdNm : String := "dualEqualityWriteCapableGapId"

def closedIdNm : String := "dualEqualityWriteCapableGapClosedId"

def liveIdNm : String := "dualEqualityWriteCapableGapDualEqLiveId"

def stepIdNm : String := "dualEqualityWriteCapableGapStepAdvancedId"

def closeGapNm : String := "closeStepCapableGap"

def closeRetireNm : String := "closeStepRetireOfficial"

def fullBarNm : String := "fullBarReqPerformClaimedWithEvidence"

def recipeNm : String := "officialPathRecipe"

def writerNm : String := "officialPathLakeWriter"

def exeNm : String := "officialPathLakeExe"

def gateNm : String := "dualEqualityGateId"

def apiNm : String := "dualEqualityApiName"

def writeApiNm : String := "capableWriteApi"

def writeModNm : String := "capableWriteModule"

def lakeFreeNm : String := "lakeFreeCapableGapRecipe"

def measureNm : String := "justMeasureRecipe"

def lakeExeNm : String := "lakeExeName"

def b36Nm : String := "b36ApiRecipe"

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

/-- Left-nested and. Each step is `if c then t else false`. -/
def andAll : List Term -> Term
  | [] => Term.litBool true
  | [t] => t
  | t :: rest => Term.ite t (andAll rest) (Term.litBool false)

def okBody : Term :=
  andAll
    [ eqS stageIdNm stageLit
    , eqS hostIdNm hostLit
    , eqS selfHostIdNm selfLit
    , eqB measuredNm true
    , eqB closedNm true
    , eqB liveNm true
    , eqB stepNm true
    , eqB parityNm false
    , eqB structuralNm false
    , eqB claimedNm false
    , eqB dependsNm true
    , eqB apiMeasuredNm true
    , eqB stillEmitNm true
    , eqB stillLakeNm true
    , eqB retireNm true
    , eqB blocksNm true
    , eqB fullNm false
    , eqS gapIdNm gapIdLit
    , eqS closedIdNm closedIdLit
    , eqS liveIdNm liveIdLit
    , eqS stepIdNm stepIdLit
    , eqS closeGapNm closeGapLit
    , eqS closeRetireNm closeRetireLit
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
    , eqS b36Nm b36Lit
    ]

def partialBody : Term :=
  andAll
    [ Term.var (n okNm)
    , Term.var (n measuredNm)
    , Term.var (n closedNm)
    , Term.var (n liveNm)
    , Term.var (n stepNm)
    , notB (Term.var (n parityNm))
    , notB (Term.var (n structuralNm))
    , Term.var (n blocksNm)
    , notB (Term.var (n claimedNm))
    ]

def gapLeaves : DefEnv :=
  [ lit "stageId" stageLit
  , lit "hostId" hostLit
  , lit "selfHostId" selfLit
  , lit gapIdNm gapIdLit
  , lit closedIdNm closedIdLit
  , lit liveIdNm liveIdLit
  , lit stepIdNm stepIdLit
  , lit closeGapNm closeGapLit
  , lit closeRetireNm closeRetireLit
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
  , lit b36Nm b36Lit
  , pin measuredNm true
  , pin closedNm true
  , pin liveNm true
  , pin stepNm true
  , pin dependsNm true
  , pin apiMeasuredNm true
  , pin stillEmitNm true
  , pin stillLakeNm true
  , pin retireNm true
  , pin blocksNm true
  , pin parityNm false
  , pin structuralNm false
  , pin claimedNm false
  , pin fullNm false
  ]

/-- PartialReady and Ok sit first. Lookup keeps the first match.
    PartialReady is the derived body, not a stored Bool true. -/
def gapSeed : DefEnv :=
  (partialNm, { binder := "", body := partialBody })
  :: (okNm, { binder := "", body := okBody })
  :: gapLeaves

/-- The derived body, not a stored true. Used by the toy reduce. -/
def partialReduces : Bool :=
  decideHolds gapSeed (Term.var (n partialNm)) (Term.litBool true)
    && decideHolds gapSeed (Term.var (n okNm)) (Term.litBool true)
    && !decideHolds gapSeed (Term.var (n claimedNm)) (Term.litBool true)

inductive Proof where
  | rfl
  | decide

structure GapWalk where
  cmds : List Cmd
  sawDecide : Bool
  sawExample : Bool
  sawFalse : Bool
  sawRfl : Bool

def emptyWalk : GapWalk :=
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

def noteFalse (w : GapWalk) (rhs : Term) : GapWalk :=
  { w with sawFalse := w.sawFalse || holdsFalse rhs }

def parseItems (fuel : Nat) (w : GapWalk) (ts : List String) :
    Option (Prod GapWalk (List String)) :=
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
            if decideHolds gapSeed lhs rhs then
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
          if decideHolds gapSeed lhs rhs then
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

def finish (ns : String) (w : GapWalk) (ts : List String) : Option Module :=
  if w.sawDecide && w.sawExample && w.sawFalse && w.sawRfl
      && !w.cmds.isEmpty then
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && ns == gapImport && rest2.isEmpty then
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
def parseHonestyGapEqText (src : String) : Option Module :=
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
          if imp == gapImport then
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

def gapToyHead : String :=
  "import SystemsLean.DualEqWriteCapableGap\n" ++
  "namespace SystemsLean.DualEqWriteCapableGap\n"

def gapToyFalseThm : String :=
  "theorem productPathFreestandingPerformClaimed_false : " ++
  "productPathFreestandingPerformClaimed = false := rfl\n"

def gapToyBadThm : String :=
  "theorem productPathFreestandingPerformClaimed_false : " ++
  "productPathFreestandingPerformClaimed = true := rfl\n"

def gapToyOkThm : String :=
  "theorem productPathFreestandingPerformDualEqualityWriteCapableGapOk_true : "
  ++ "productPathFreestandingPerformDualEqualityWriteCapableGapOk = true "
  ++ ":= by decide\n"

def gapToyEx : String :=
  "example : productPathFreestandingPerformClaimed = false := by decide\n"

def gapToyEnd : String :=
  "end SystemsLean.DualEqWriteCapableGap\n"

def gapToySrc : String :=
  gapToyHead ++ gapToyFalseThm ++ gapToyOkThm ++ gapToyEx ++ gapToyEnd

def gapBadSrc : String :=
  gapToyHead ++ gapToyBadThm ++ gapToyOkThm ++ gapToyEx ++ gapToyEnd

def cmdIsHeld (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.bool) (Term.litBool true) => true
  | _ => false

/-- One false rfl, one held decide, one false example. rfl and the
    example stay out of the command list. -/
def gapToyShape : Bool :=
  match parseHonestyGapEqText gapToySrc with
  | some m =>
    match m.commands with
    | Cmd.importModule _ :: Cmd.namespace _ :: c ::
        Cmd.endNamespace _ :: [] =>
      cmdIsHeld c && isWellFormed m
    | _ => false
  | none => false

/-- Flipping the false pin to true is none. -/
def gapToyRejects : Bool :=
  match parseHonestyGapEqText gapBadSrc with
  | none => true
  | some _ => false

end SystemsLean.HonestyGapEqFront
