/-
  SYSTEMS_LEAN_HOST partial -- Mult subset language front-end (ideal ladder M3).
  Real parse + check over defined Mult unit ordered IR surface (not only fixed
  Mult fixtures). Grammar (subset language v0):
    # comments and empty lines ignored
    node <multName> <kindName>
    multName: MULT-0 | MULT-1 | MULT-OMEGA
    kindName: ERASED | LINEAR | VALUE
    legal pairings only (kindMultOk): ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA
    program: at least one node, length <= programCap (8), each node well-typed
  Fail-closed rejects: FAIL-CLOSED-UNKNOWN-GRADE, FAIL-CLOSED-UNKNOWN-KIND,
  KIND-MULT-MISMATCH, EMPTY-PROGRAM-FAIL-CLOSED, LINE-SHAPE, OVER-CAP.
  Lake host remains (stillUsesLake / dependsOnLake true until S4 / M6).
  Not freestanding emit residual free. Not freestanding product residual free.
  Not freestanding product self-host complete rebrand. Not PROVABLY. Not llvm
  unlock. Not S4 Lake retire. Not full Systems Lean / Lean 4 parse. Not
  shell/Python parser.
  Greppable: SYSTEMS_LEAN_HOST, SUBSET-FRONT, SLAKE_SUBSET_FRONT,
  SLAKE_SUBSET_FRONT_V0, HOST-SUBSET-FRONT, subsetFrontReady,
  subsetFrontGoodG1, subsetFrontGoodG2, subsetFrontBadB1, subsetFrontBadB2,
  subsetFrontBadB3, subsetFrontStillUsesLake, subsetFrontDependsOnLake,
  SUBSET-FRONT-SMOKE, SUBSET-FRONT-THEOREM, subsetFrontReady_true,
  slake-subset-front, just subset-front, goldens/mult-front,
  FAIL-CLOSED-UNKNOWN-GRADE, EMPTY-PROGRAM-FAIL-CLOSED, KIND-MULT-MISMATCH,
  programCompileReady, kindMultOk, MULT-0, MULT-1, MULT-OMEGA,
  StillUsesLake, DependsOnLake, UNIT_SURFACE host surface.
  Module: SystemsLean.SubsetFront
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins on dual-pinned golden String constants
  (match on-disk goldens) + lake exe / just subset-front over files.
  Without-Lake (A10): subset-front-without-lake + develop clean-bootstrap
  (ownership pins in HostResidualShrink). Host residual remains; not free.
  Red/green: lake build SystemsLean.SubsetFront; lake exe slake-subset-front;
  just subset-front; just subset-front-without-lake. Module must stay ASCII.
-/

import SystemsLean.CompilePath
import SystemsLean.IrProgram
import SystemsLean.Types
import SystemsLean.Mult

namespace SystemsLean.SubsetFront

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit mkNode?)
open SystemsLean.IrProgram (Program programCap)
open SystemsLean.CompilePath (programCompileReady)

/-! ### SUBSET-FRONT / SLAKE_SUBSET_FRONT (ideal ladder M3)

  Parse Mult unit ordered IR subset language text -> Program; check with
  programCompileReady (IrProgram.isWellTyped). Driven by golden inputs
  (embedded dual-pinned strings + on-disk files), not solely
  multFixtureCompilePathReady re-export.
-/

/-- Greppable primary stage id (M3 Mult subset language front-end). -/
def stageId : String := "SLAKE_SUBSET_FRONT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SUBSET-FRONT"

/-- Short surface name (product role). -/
def surfaceId : String := "SUBSET-FRONT"

/-- Lake exe name. -/
def lakeExeName : String := "slake-subset-front"

/-- just recipe name. -/
def justRecipe : String := "subset-front"

/-- Goldens directory relative to repo root. -/
def goldensRel : String := "src/systems/goldens/mult-front"

/-- Host elaborator still Lake (M3; S4 / M6 only retires).
    Greppable: StillUsesLake, DependsOnLake, subsetFrontStillUsesLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def subsetFrontStillUsesLake : Bool := stillUsesLake
def subsetFrontDependsOnLake : Bool := dependsOnLake

/-- Local honesty: M3 does not claim product residual free flip. -/
def subsetFrontResidualFreeClaimed : Bool := false

/-- Local honesty: M3 is not freestanding product self-host complete rebrand. -/
def subsetFrontProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M3 does not claim proof complete. -/
def subsetFrontProofCompleteClaimed : Bool := false

/-- Local honesty: M3 does not unlock llvm. -/
def subsetFrontLlvmUnlocked : Bool := false

/-- Local honesty: M3 does not unlock PROVABLY. -/
def subsetFrontProvablyUnlocked : Bool := false

/-! ### Dual-pinned golden texts (must match on-disk files under goldensRel)

  Greppable: goodG1Text, goodG2Text, badB1Text, badB2Text, badB3Text.
-/

/-- G1 classic Mult three-node (oracle shape of lowerMultFixtureProgram). -/
def goodG1Text : String :=
  "# Mult unit program (subset language v0) -- G1 classic Mult three-node\n" ++
  "# form: node <multName> <kindName>\n" ++
  "# multName: MULT-0 | MULT-1 | MULT-OMEGA\n" ++
  "# kindName: ERASED | LINEAR | VALUE\n" ++
  "# legal pairings: ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA\n" ++
  "\n" ++
  "node MULT-0 ERASED\n" ++
  "node MULT-1 LINEAR\n" ++
  "node MULT-OMEGA VALUE\n"

/-- G2 single MULT-OMEGA VALUE. -/
def goodG2Text : String :=
  "# G2 single MULT-OMEGA VALUE (programCompileReady_single_value spirit)\n" ++
  "\n" ++
  "node MULT-OMEGA VALUE\n"

/-- B1 unknown grade. -/
def badB1Text : String :=
  "# B1 unknown grade -- FAIL-CLOSED-UNKNOWN-GRADE\n" ++
  "\n" ++
  "node MULT-9 VALUE\n"

/-- B2 kind/mult mismatch. -/
def badB2Text : String :=
  "# B2 kind/mult mismatch -- VALUE expects MULT-OMEGA, not MULT-0\n" ++
  "\n" ++
  "node MULT-0 VALUE\n"

/-- B3 empty (comments only). -/
def badB3Text : String :=
  "# B3 empty program -- only comments (EMPTY-PROGRAM-FAIL-CLOSED)\n" ++
  "\n" ++
  "# no node lines\n"

/-- Golden file basenames (greppable dual evidence path). -/
def goodG1File : String := "good-mult-classic.slake-mult"
def goodG2File : String := "good-single-value.slake-mult"
def badB1File : String := "bad-unknown-grade.slake-mult"
def badB2File : String := "bad-kind-mult-mismatch.slake-mult"
def badB3File : String := "bad-empty.slake-mult"

/-! ### Name tables (fail-closed; reuse Mult / Types closed sets) -/

/-- Decode Mult grade name. FAIL-CLOSED-UNKNOWN-GRADE on unknown. -/
def ofMultName? : String -> Option Mult
  | "MULT-0" => some Mult.mult0
  | "MULT-1" => some Mult.mult1
  | "MULT-OMEGA" => some Mult.multOmega
  | _ => none

/-- Decode NodeKind name. FAIL-CLOSED-UNKNOWN-KIND on unknown. -/
def ofKindName? : String -> Option NodeKind
  | "VALUE" => some NodeKind.value
  | "LINEAR" => some NodeKind.linear
  | "ERASED" => some NodeKind.erased
  | _ => none

/-! ### Reject reasons (greppable fail-closed tokens) -/

/-- Greppable reject reason strings. -/
def reasonUnknownGrade : String := "FAIL-CLOSED-UNKNOWN-GRADE"
def reasonUnknownKind : String := "FAIL-CLOSED-UNKNOWN-KIND"
def reasonKindMultMismatch : String := "KIND-MULT-MISMATCH"
def reasonEmptyProgram : String := "EMPTY-PROGRAM-FAIL-CLOSED"
def reasonLineShape : String := "LINE-SHAPE"
def reasonOverCap : String := "OVER-CAP"
def reasonBadNode : String := "BAD-NODE"

/-- Front-end check result: accept with program, or reject with reason. -/
inductive FrontResult where
  | accept (p : Program)
  | reject (reason : String)
  deriving DecidableEq, Repr

/-- True when accept. -/
def FrontResult.isAccept : FrontResult -> Bool
  | FrontResult.accept _ => true
  | FrontResult.reject _ => false

/-- True when reject with exact reason. -/
def FrontResult.isRejectWith (r : FrontResult) (reason : String) : Bool :=
  match r with
  | FrontResult.reject r' => r' == reason
  | FrontResult.accept _ => false

/-- Accepted program length when accept; 0 on reject. -/
def FrontResult.acceptLength : FrontResult -> Nat
  | FrontResult.accept p => IrProgram.length p
  | FrontResult.reject _ => 0

/-! ### Line parse helpers (List-based; decide-friendly; no String.split Iter) -/

/-- True when char is horizontal whitespace. -/
def isWs (c : Char) : Bool := c == ' ' || c == '\t' || c == '\r'

/-- Single-pass token collector: (current run reversed, completed tokens reversed). -/
def lineTokensGo (cur : List Char) (acc : List String) :
    List Char -> List String
  | [] =>
    let acc' :=
      if cur.isEmpty then acc else String.ofList cur.reverse :: acc
    acc'.reverse
  | c :: rest =>
    if isWs c then
      if cur.isEmpty then
        lineTokensGo [] acc rest
      else
        lineTokensGo [] (String.ofList cur.reverse :: acc) rest
    else
      lineTokensGo (c :: cur) acc rest

/-- Split line into non-empty whitespace-separated tokens. -/
def lineTokens (line : String) : List String :=
  lineTokensGo [] [] line.toList

/-- True when line is blank or a # comment (after leading spaces). -/
def isIgnorableLine (line : String) : Bool :=
  let toks := lineTokens line
  match toks with
  | [] => true
  | t :: _ =>
    match t.toList with
    | '#' :: _ => true
    | _ => false

/-- Parse one node line: node MULT-* KIND. Fail-closed with reason. -/
def parseNodeLine (line : String) (tag : Nat) : Except String IrNode :=
  let toks := lineTokens line
  match toks with
  | ["node", multName, kindName] =>
    match ofMultName? multName with
    | none => Except.error reasonUnknownGrade
    | some m =>
      match ofKindName? kindName with
      | none => Except.error reasonUnknownKind
      | some k =>
        match mkNode? tag m k with
        | none => Except.error reasonKindMultMismatch
        | some n => Except.ok n
  | _ => Except.error reasonLineShape

/-- Fold node lines into a Program. Fail-closed on first bad line or push. -/
def foldNodes (lines : List String) : FrontResult :=
  let rec go (tag : Nat) (p : Program) : List String -> FrontResult
    | [] =>
      if IrProgram.isEmpty p then
        FrontResult.reject reasonEmptyProgram
      else if programCompileReady p then
        FrontResult.accept p
      else
        FrontResult.reject reasonBadNode
    | line :: rest =>
      if isIgnorableLine line then
        go tag p rest
      else
        match parseNodeLine line tag with
        | Except.error reason => FrontResult.reject reason
        | Except.ok n =>
          match IrProgram.push p n with
          | IrProgram.PushResult.ok p' => go (tag + 1) p' rest
          | IrProgram.PushResult.badNode => FrontResult.reject reasonBadNode
          | IrProgram.PushResult.full => FrontResult.reject reasonOverCap
  go 0 IrProgram.empty lines

/-- Parse full source text (newline-separated). Greppable: parseSource. -/
def parseSource (src : String) : FrontResult :=
  foldNodes (src.splitOn "\n")

/-- Accept path: programCompileReady true on accepted program. -/
def acceptOk (r : FrontResult) : Bool :=
  match r with
  | FrontResult.accept p => programCompileReady p
  | FrontResult.reject _ => false

/-! ### Golden structural pins (embedded dual-pinned strings)

  Path driven by golden inputs -- not multFixtureCompilePathReady alone.
-/

/-- G1 parse accept + length 3 + programCompileReady.
    Greppable: subsetFrontGoodG1. -/
def subsetFrontGoodG1 : Bool :=
  let r := parseSource goodG1Text
  acceptOk r && r.acceptLength == 3

/-- G2 parse accept + length 1 + programCompileReady.
    Greppable: subsetFrontGoodG2. -/
def subsetFrontGoodG2 : Bool :=
  let r := parseSource goodG2Text
  acceptOk r && r.acceptLength == 1

/-- B1 rejects unknown grade.
    Greppable: subsetFrontBadB1, FAIL-CLOSED-UNKNOWN-GRADE. -/
def subsetFrontBadB1 : Bool :=
  (parseSource badB1Text).isRejectWith reasonUnknownGrade

/-- B2 rejects kind/mult mismatch.
    Greppable: subsetFrontBadB2, KIND-MULT-MISMATCH. -/
def subsetFrontBadB2 : Bool :=
  (parseSource badB2Text).isRejectWith reasonKindMultMismatch

/-- B3 rejects empty program.
    Greppable: subsetFrontBadB3, EMPTY-PROGRAM-FAIL-CLOSED. -/
def subsetFrontBadB3 : Bool :=
  (parseSource badB3Text).isRejectWith reasonEmptyProgram

/-- All minimum goldens structural ready (not filesystem alone).
    Greppable: subsetFrontGoldensStructuralOk. -/
def subsetFrontGoldensStructuralOk : Bool :=
  subsetFrontGoodG1
    && subsetFrontGoodG2
    && subsetFrontBadB1
    && subsetFrontBadB2
    && subsetFrontBadB3

/-- Stage / exe / recipe identity pin. -/
def subsetFrontIdsOk : Bool :=
  (stageId == "SLAKE_SUBSET_FRONT_V0")
    && (hostId == "HOST-SUBSET-FRONT")
    && (surfaceId == "SUBSET-FRONT")
    && (lakeExeName == "slake-subset-front")
    && (justRecipe == "subset-front")
    && (goldensRel == "src/systems/goldens/mult-front")

/-- End-to-end M3 front-end ready: goldens structural + Lake honesty + non-claims.
    Greppable: subsetFrontReady, SUBSET-FRONT, SLAKE_SUBSET_FRONT_V0. -/
def subsetFrontReady : Bool :=
  subsetFrontGoldensStructuralOk
    && subsetFrontIdsOk
    && stillUsesLake
    && dependsOnLake
    && subsetFrontStillUsesLake
    && subsetFrontDependsOnLake
    && !subsetFrontResidualFreeClaimed
    && !subsetFrontProductSelfHostCompleteClaimed
    && !subsetFrontProofCompleteClaimed
    && !subsetFrontLlvmUnlocked
    && !subsetFrontProvablyUnlocked
    && (programCap == 8)

/-- Ready does not retire Lake (S4 / M6 only).
    Greppable: subsetFrontDoesNotRetireLake. -/
def subsetFrontDoesNotRetireLake : Bool :=
  subsetFrontReady && stillUsesLake && dependsOnLake

/-- Ready is not product residual free claim.
    Greppable: subsetFrontDoesNotMeanResidualFree. -/
def subsetFrontDoesNotMeanResidualFree : Bool :=
  subsetFrontReady && !subsetFrontResidualFreeClaimed

/-! ### SUBSET-FRONT-THEOREM (readable M3 statements, then proofs) -/

set_option maxRecDepth 8192

/-- G1 classic Mult golden accepts.
    Greppable: subsetFrontGoodG1_true, SUBSET-FRONT-THEOREM. -/
theorem subsetFrontGoodG1_true : subsetFrontGoodG1 = true := by
  native_decide

/-- G2 single VALUE golden accepts.
    Greppable: subsetFrontGoodG2_true, SUBSET-FRONT-THEOREM. -/
theorem subsetFrontGoodG2_true : subsetFrontGoodG2 = true := by
  native_decide

/-- B1 unknown grade rejects.
    Greppable: subsetFrontBadB1_true, SUBSET-FRONT-THEOREM. -/
theorem subsetFrontBadB1_true : subsetFrontBadB1 = true := by
  native_decide

/-- B2 kind/mult mismatch rejects.
    Greppable: subsetFrontBadB2_true, SUBSET-FRONT-THEOREM. -/
theorem subsetFrontBadB2_true : subsetFrontBadB2 = true := by
  native_decide

/-- B3 empty program rejects.
    Greppable: subsetFrontBadB3_true, SUBSET-FRONT-THEOREM. -/
theorem subsetFrontBadB3_true : subsetFrontBadB3 = true := by
  native_decide

/-- All structural goldens ok.
    Greppable: subsetFrontGoldensStructuralOk_true, SUBSET-FRONT-THEOREM. -/
theorem subsetFrontGoldensStructuralOk_true :
    subsetFrontGoldensStructuralOk = true := by
  native_decide

/-- End-to-end subset front ready (M3).
    Greppable: subsetFrontReady_true, SUBSET-FRONT-THEOREM, SUBSET-FRONT. -/
theorem subsetFrontReady_true : subsetFrontReady = true := by
  native_decide

/-- M3 ready does not retire Lake.
    Greppable: subsetFrontDoesNotRetireLake_true, SUBSET-FRONT-THEOREM. -/
theorem subsetFrontDoesNotRetireLake_true :
    subsetFrontDoesNotRetireLake = true := by
  native_decide

/-- M3 ready does not claim residual free.
    Greppable: subsetFrontDoesNotMeanResidualFree_true, SUBSET-FRONT-THEOREM. -/
theorem subsetFrontDoesNotMeanResidualFree_true :
    subsetFrontDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: subsetFront_claims_false, SUBSET-FRONT-THEOREM. -/
theorem subsetFront_claims_false :
    (subsetFrontResidualFreeClaimed = false)
      /\ (subsetFrontProductSelfHostCompleteClaimed = false)
      /\ (subsetFrontProofCompleteClaimed = false)
      /\ (subsetFrontLlvmUnlocked = false)
      /\ (subsetFrontProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / surface / exe name pins.
    Greppable: subsetFront_ids_eq, SUBSET-FRONT-THEOREM. -/
theorem subsetFront_ids_eq :
    (stageId = "SLAKE_SUBSET_FRONT_V0")
      /\ (hostId = "HOST-SUBSET-FRONT")
      /\ (surfaceId = "SUBSET-FRONT")
      /\ (lakeExeName = "slake-subset-front")
      /\ (justRecipe = "subset-front")
      /\ (goldensRel = "src/systems/goldens/mult-front") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl (And.intro rfl rfl))))

/-! ### SUBSET-FRONT-SMOKE (lake fails if examples fail)
    Greppable: SUBSET-FRONT-SMOKE, SUBSET-FRONT, SLAKE_SUBSET_FRONT_V0. -/

example : subsetFrontGoodG1 = true := by native_decide
example : subsetFrontGoodG2 = true := by native_decide
example : subsetFrontBadB1 = true := by native_decide
example : subsetFrontBadB2 = true := by native_decide
example : subsetFrontBadB3 = true := by native_decide
example : subsetFrontReady = true := by native_decide
example : subsetFrontDoesNotRetireLake = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : subsetFrontResidualFreeClaimed = false := rfl
example : subsetFrontLlvmUnlocked = false := rfl
example : subsetFrontProvablyUnlocked = false := rfl
example : lakeExeName = "slake-subset-front" := rfl
example : justRecipe = "subset-front" := rfl

/-! ### Driver (short banners only; AGENTS driver stdout policy) -/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Require file exists. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Check one golden file: dual-pin content equality + expected accept/reject. -/
def checkGoldenFile (path : System.FilePath) (expectedText : String)
    (expectAccept : Bool) (rejectReason : Option String) (label : String) :
    IO Unit := do
  requireFile path label
  let disk <- IO.FS.readFile path
  if disk != expectedText then
    IO.eprintln s!"error: dual-pin mismatch {label}: on-disk != Lean constant"
    throw (IO.userError s!"dual-pin mismatch {label}")
  let r := parseSource disk
  if expectAccept then
    unless acceptOk r do
      IO.eprintln s!"error: {label} expected ACCEPT, got reject"
      throw (IO.userError s!"{label} accept fail")
    IO.println s!"PASS {label} ACCEPT len={r.acceptLength}"
  else
    match rejectReason with
    | none =>
      unless !r.isAccept do
        IO.eprintln s!"error: {label} expected REJECT, got accept"
        throw (IO.userError s!"{label} reject fail")
      IO.println s!"PASS {label} REJECT"
    | some reason =>
      unless r.isRejectWith reason do
        IO.eprintln s!"error: {label} expected REJECT {reason}"
        throw (IO.userError s!"{label} reject reason fail")
      IO.println s!"PASS {label} REJECT {reason}"

/-- Run golden suite under repo root. Dual evidence: files + Lean pins.
    Greppable: runGoldenSuite, SUBSET-FRONT. -/
def runGoldenSuite (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: Mult subset language front-end =="
  IO.println s!"  surface={surfaceId} host={hostId} goldens={goldensRel}"
  IO.println s!"  structuralReady={subsetFrontReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  let gdir := root / goldensRel
  requireFile gdir "goldens directory"
  checkGoldenFile (gdir / goodG1File) goodG1Text true none "G1"
  checkGoldenFile (gdir / goodG2File) goodG2Text true none "G2"
  checkGoldenFile (gdir / badB1File) badB1Text false (some reasonUnknownGrade) "B1"
  checkGoldenFile (gdir / badB2File) badB2Text false (some reasonKindMultMismatch) "B2"
  checkGoldenFile (gdir / badB3File) badB3Text false (some reasonEmptyProgram) "B3"
  unless subsetFrontReady do
    IO.eprintln s!"error: {stageId} subsetFrontReady false"
    throw (IO.userError "subsetFrontReady false")
  IO.println s!"GREEN {stageId}: goldens G1/G2 accept B1/B2/B3 reject; dual-pin ok; Lake host remains"

/-- CLI: run golden suite. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runGoldenSuite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.SubsetFront
