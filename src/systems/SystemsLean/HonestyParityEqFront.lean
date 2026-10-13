/-
  Module: SystemsLean.HonestyParityEqFront
  Front for theorems and examples over SystemsLean.DualEqWriteParity.
  The import string selects the seed. The file name is not stored.
  A file that is not this parity shape may still match a Callisto shape.
  DualEqWriteParity.lean and DualEqWriteParityMain.lean are none.
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
import SystemsLean.CallistoLiveTriple
import SystemsLean.CallistoLivePair
import SystemsLean.CallistoKernelTwo
import SystemsLean.CallistoRawEmbed
import SystemsLean.CallistoLiveTrue
import SystemsLean.CallistoLiveMut
import SystemsLean.CallistoLiveFour
import SystemsLean.CallistoLiveRear
import SystemsLean.CallistoLiveSurface
import SystemsLean.CallistoLoadPair
import SystemsLean.CallistoFiveTrue
import SystemsLean.CallistoCheckDriver
import SystemsLean.CallistoCheckBarrel
import SystemsLean.CallistoCheckCite
import SystemsLean.CallistoLinearStruct
import SystemsLean.CallistoLinearThm
import SystemsLean.CallistoMultFront
import SystemsLean.CallistoPathPlan
import SystemsLean.CallistoProofCases
import SystemsLean.CallistoBenchMain
import SystemsLean.CallistoSelfHost
import SystemsLean.CallistoElfThm
import SystemsLean.CallistoImportOnly
import SystemsLean.CallistoThmOne

namespace SystemsLean.HonestyParityEqFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyDecide (decideHolds)
open SystemsLean.HonestyFront
  (strip SMode parseDotted parseFuel isIdent unquote)
open SystemsLean.HonestyThmFront (thmTok ThmMode)

def parityImport : String := "SystemsLean.DualEqWriteParity"

def itemFuel : Nat := 64

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0"

def hostLit : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"

def selfLit : String :=
  "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"

def parityIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY"

def gapOpenIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN"

def structuralIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL"

def officialEmitIdLit : String :=
  "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT"

def blocksIdLit : String :=
  "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT"

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
  "freestanding-perform-dual-equality-write-parity"

def measureLit : String :=
  "freestanding-perform-dual-equality-write-parity-measure"

def lakeExeLit : String :=
  "slake-freestanding-perform-dual-equality-write-parity"

def b33Lit : String := "freestanding-perform-official-path-alternate"

def okNm : String :=
  "productPathFreestandingPerformDualEqualityWriteParityOk"

def partialNm : String :=
  "productPathFreestandingPerformDualEqualityWriteParityPartialReady"

def measuredNm : String :=
  "productPathFreestandingPerformDualEqualityWriteParityMeasured"

def gapOpenNm : String := "productPathDualEqualityWriteParityGapOpen"

def structuralNm : String :=
  "productPathCapableWriteStructuralNotDualEquality"

def claimedNm : String := "productPathFreestandingPerformClaimed"

def dependsNm : String := "productPathPerformDependsOnLake"

def alternateNm : String :=
  "productPathFreestandingPerformOfficialPathAlternateMeasured"

def stillEmitNm : String :=
  "productPathOfficialPathStillUsesFreestandingEmit"

def stillLakeNm : String := "productPathOfficialPathStillUsesLake"

def retireNm : String :=
  "productPathOfficialPathRetireFreestandingEmitRequired"

def blocksNm : String :=
  "productPathOfficialPathDualEqualityBlocksRetirement"

def fullNm : String :=
  "productPathFreestandingCapableStepContractFullSatisfied"

def parityIdNm : String := "dualEqualityWriteParityId"

def gapOpenIdNm : String := "dualEqualityWriteParityGapOpenId"

def structuralIdNm : String := "dualEqualityWriteParityCapableStructuralId"

def officialEmitIdNm : String := "dualEqualityWriteParityOfficialEmitId"

def blocksIdNm : String := "dualEqualityBlocksRetirementId"

def fullBarNm : String := "fullBarReqPerformClaimedWithEvidence"

def recipeNm : String := "officialPathRecipe"

def writerNm : String := "officialPathLakeWriter"

def exeNm : String := "officialPathLakeExe"

def gateNm : String := "officialPathDualEqualityGate"

def apiNm : String := "officialPathDualEqualityApi"

def writeApiNm : String := "capableWriteApi"

def writeModNm : String := "capableWriteModule"

def lakeFreeNm : String := "lakeFreeParityRecipe"

def measureNm : String := "justMeasureRecipe"

def lakeExeNm : String := "lakeExeName"

def b33Nm : String := "b33AlternateRecipe"

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

/-- Each step is `if c then t else false`. -/
def andAll : List Term -> Term
  | [] => Term.litBool true
  | [t] => t
  | t :: rest => Term.ite t (andAll rest) (Term.litBool false)

/-- Same conjuncts as Parity Ok. False pins stay false. -/
def okBody : Term :=
  andAll
    [ eqS stageIdNm stageLit
    , eqS hostIdNm hostLit
    , eqS selfHostIdNm selfLit
    , eqB measuredNm true
    , eqB gapOpenNm true
    , eqB structuralNm true
    , eqB claimedNm false
    , eqB dependsNm true
    , eqB alternateNm true
    , eqB stillEmitNm true
    , eqB stillLakeNm true
    , eqB retireNm true
    , eqB blocksNm true
    , eqB fullNm false
    , eqS parityIdNm parityIdLit
    , eqS gapOpenIdNm gapOpenIdLit
    , eqS structuralIdNm structuralIdLit
    , eqS officialEmitIdNm officialEmitIdLit
    , eqS blocksIdNm blocksIdLit
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
    , eqS b33Nm b33Lit
    ]

/-- Derived fold. Not a stored Bool true. -/
def partialBody : Term :=
  andAll
    [ Term.var (n okNm)
    , Term.var (n measuredNm)
    , Term.var (n gapOpenNm)
    , Term.var (n structuralNm)
    , Term.var (n blocksNm)
    , notB (Term.var (n claimedNm))
    , Term.var (n dependsNm)
    , Term.var (n stillEmitNm)
    , Term.var (n stillLakeNm)
    , Term.var (n retireNm)
    , notB (Term.var (n fullNm))
    ]

def parityLeaves : DefEnv :=
  [ lit "stageId" stageLit
  , lit "hostId" hostLit
  , lit "selfHostId" selfLit
  , lit parityIdNm parityIdLit
  , lit gapOpenIdNm gapOpenIdLit
  , lit structuralIdNm structuralIdLit
  , lit officialEmitIdNm officialEmitIdLit
  , lit blocksIdNm blocksIdLit
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
  , lit b33Nm b33Lit
  , pin measuredNm true
  , pin gapOpenNm true
  , pin structuralNm true
  , pin dependsNm true
  , pin alternateNm true
  , pin stillEmitNm true
  , pin stillLakeNm true
  , pin retireNm true
  , pin blocksNm true
  , pin claimedNm false
  , pin fullNm false
  ]

/-- PartialReady and Ok sit first. Lookup keeps the first match.
    PartialReady is the derived body, not a stored Bool true. -/
def paritySeed : DefEnv :=
  (partialNm, { binder := "", body := partialBody })
  :: (okNm, { binder := "", body := okBody })
  :: parityLeaves

/-- The derived body, not a stored true. -/
def partialReduces : Bool :=
  decideHolds paritySeed (Term.var (n partialNm)) (Term.litBool true)
    && decideHolds paritySeed (Term.var (n okNm)) (Term.litBool true)
    && !decideHolds paritySeed (Term.var (n claimedNm)) (Term.litBool true)
    && !decideHolds paritySeed (Term.var (n fullNm)) (Term.litBool true)

inductive Proof where
  | rfl
  | decide

structure ParityWalk where
  cmds : List Cmd
  sawDecide : Bool
  sawExample : Bool
  sawFalse : Bool
  sawRfl : Bool

def emptyWalk : ParityWalk :=
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

def noteFalse (w : ParityWalk) (rhs : Term) : ParityWalk :=
  { w with sawFalse := w.sawFalse || holdsFalse rhs }

def parseItems (fuel : Nat) (w : ParityWalk) (ts : List String) :
    Option (Prod ParityWalk (List String)) :=
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
            if decideHolds paritySeed lhs rhs then
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
          if decideHolds paritySeed lhs rhs then
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

def finish (ns : String) (w : ParityWalk) (ts : List String) :
    Option Module :=
  if w.sawDecide && w.sawExample && w.sawFalse && w.sawRfl
      && !w.cmds.isEmpty then
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && ns == parityImport && rest2.isEmpty then
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

/-- Parity seed only. none here still tries the Callisto shapes. -/
def parseParityOnly (src : String) : Option Module :=
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
          if imp == parityImport then
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

def tryParse (src : String) :
    List (String -> Option Module) -> Option Module
  | [] => none
  | p :: ps =>
    match p src with
    | some m => some m
    | none => tryParse src ps

/-- Existing shapes first. parseThmOne stays last. -/
def callistoParsers : List (String -> Option Module) :=
  [ SystemsLean.CallistoLiveTriple.parseLiveTriple
  , SystemsLean.CallistoLivePair.parseLivePair
  , SystemsLean.CallistoKernelTwo.parseKernelTwo
  , SystemsLean.CallistoRawEmbed.parseRawEmbed
  , SystemsLean.CallistoLiveTrue.parseLiveTrue
  , SystemsLean.CallistoLiveMut.parseLiveMut
  , SystemsLean.CallistoLiveFour.parseLiveFour
  , SystemsLean.CallistoLiveRear.parseLiveRear
  , SystemsLean.CallistoLiveSurface.parseLiveSurface
  , SystemsLean.CallistoLoadPair.parseLoadPair
  , SystemsLean.CallistoFiveTrue.parseFiveTrue
  , SystemsLean.CallistoCheckDriver.parseCheckDriver
  , SystemsLean.CallistoCheckBarrel.parseCheckBarrel
  , SystemsLean.CallistoCheckCite.parseCheckCite
  , SystemsLean.CallistoLinearStruct.parseLinearStruct
  , SystemsLean.CallistoLinearThm.parseLinearThm
  , SystemsLean.CallistoMultFront.parseMultFront
  , SystemsLean.CallistoPathPlan.parsePathPlan
  , SystemsLean.CallistoProofCases.parseProofCases
  , SystemsLean.CallistoBenchMain.parseBenchMain
  , SystemsLean.CallistoSelfHost.parseSelfHost
  , SystemsLean.CallistoElfThm.parseElfThm
  , SystemsLean.CallistoImportOnly.parseImportOnly
  , SystemsLean.CallistoThmOne.parseThmOne
  ]

/-- Parity shape, else one Callisto shape, else none. -/
def parseHonestyParityEqText (src : String) : Option Module :=
  match parseParityOnly src with
  | some m => some m
  | none => tryParse src callistoParsers

def parityToyHead : String :=
  "import SystemsLean.DualEqWriteParity\n" ++
  "namespace SystemsLean.DualEqWriteParity\n"

def parityToyFalseThm : String :=
  "theorem productPathFreestandingPerformClaimed_false : " ++
  "productPathFreestandingPerformClaimed = false := rfl\n"

def parityToyBadThm : String :=
  "theorem productPathFreestandingPerformClaimed_false : " ++
  "productPathFreestandingPerformClaimed = true := rfl\n"

def parityToyOkThm : String :=
  "theorem productPathFreestandingPerformDualEqualityWriteParityOk_true : "
  ++ "productPathFreestandingPerformDualEqualityWriteParityOk = true "
  ++ ":= by decide\n"

def parityToyEx : String :=
  "example : productPathFreestandingPerformClaimed = false := by decide\n"

def parityToyEnd : String :=
  "end SystemsLean.DualEqWriteParity\n"

def parityToySrc : String :=
  parityToyHead ++ parityToyFalseThm ++ parityToyOkThm ++ parityToyEx
  ++ parityToyEnd

def parityBadSrc : String :=
  parityToyHead ++ parityToyBadThm ++ parityToyOkThm ++ parityToyEx
  ++ parityToyEnd

def cmdIsHeld (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.bool) (Term.litBool true) => true
  | _ => false

/-- One false rfl, one held decide, one false example. rfl and the
    example stay out of the command list. -/
def parityToyShape : Bool :=
  match parseHonestyParityEqText parityToySrc with
  | some m =>
    match m.commands with
    | Cmd.importModule _ :: Cmd.namespace _ :: c ::
        Cmd.endNamespace _ :: [] =>
      cmdIsHeld c && isWellFormed m
    | _ => false
  | none => false

/-- Flipping the false pin to true is none. -/
def parityToyRejects : Bool :=
  match parseHonestyParityEqText parityBadSrc with
  | none => true
  | some _ => false

end SystemsLean.HonestyParityEqFront
