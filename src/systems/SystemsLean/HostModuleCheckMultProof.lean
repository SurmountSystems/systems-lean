/-
  SYSTEMS_LEAN_HOST partial -- MultTheorems L3 proof-surface (J7) pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: MultTheorems dialect proof checks only. Same namespace
  SystemsLean.HostModuleCheck.

  MultTheorems L3 dialect subset (documented; not full Lean 4 tactic elaborator):
  - J7 ofNat?_zero: statement must be ofNat? 0 = some Mult.mult0 (reject : True);
    proof body after := must be rfl (reject by sorry / trivial).
  - J7 name_mult0: statement name Mult.mult0 = "MULT-0"; proof body rfl.
  Other MultTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Intentional non-claims:
  - MultTheorems pilot only -- not package elaborate L4, not LinearTheorems L3.
  - Mult L2 TERM-SURFACE Mult-only unchanged (HostModuleCheckMultTerm).
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok is MultTheorems-only honesty when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckMultProof,
  PROOF-SURFACE, MultTheorems-only, ILL-TYPED-PROOF, checkMultTheoremsProofDialect,
  hostModuleCheckBadMultThmWrongStmtText,
  hostModuleCheckBadMultThmSorryText,
  hostModuleCheckMultProofSurfaceOk, MultTheorems proof-surface pilot,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckMultProof
  Red/green: lake build SystemsLean.HostModuleCheckMultProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface

namespace SystemsLean.HostModuleCheck

/-! ### MultTheorems L3 proof-surface reasons + dialect pins -/

/-- Reject reason for MultTheorems L3 proof-surface statement / body failure.
    Greppable: reasonIllTypedProof, ILL-TYPED-PROOF, PROOF-SURFACE. -/
def reasonIllTypedProof : String := "ILL-TYPED-PROOF"

/-- Named proof-surface depth bar (MultTheorems L3 pilot only).
    Greppable: checkDepthProofSurfaceBar, PROOF-SURFACE. -/
def checkDepthProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: MultTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthProofSurfaceScope, MultTheorems-only, PROOF-SURFACE. -/
def checkDepthProofSurfaceScope : String := "MultTheorems-only"

/-- Dual-ok when MultTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckProofSurfaceDualOk, PROOF-SURFACE, MultTheorems-only. -/
def hostModuleCheckProofSurfaceDualOk : Bool := true

/-! ### Line helpers for MultTheorems dialect text -/

/-- Collapse runs of spaces/tabs to single space (statement match). -/
def collapseWsProof (s : String) : String :=
  let rec go (seenSp : Bool) (acc : List Char) : List Char -> List Char
    | [] => acc.reverse
    | c :: rest =>
      if isWs c then
        if seenSp then go true acc rest
        else go true (' ' :: acc) rest
      else
        go false (c :: acc) rest
  String.ofList (go false [] s.toList)

/-- True when line is a `theorem Name` header for the given name. -/
def isTheoremNamed (line : String) (name : String) : Bool :=
  match parseKindName line "theorem" with
  | some n => n == name
  | none => false

/-- First non-comment line that is `theorem name`. -/
def findTheoremHeaderLine (content : String) (name : String) : Option String :=
  let rec go (inBlock : Bool) : List String -> Option String
    | [] => none
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then go false rest
        else go true rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then go false rest
          else go true rest
        else if isTheoremNamed line name then some line
        else go false rest
  go false (content.splitOn "\n")

/-- After `:=` on a single-line theorem, body trim (empty if no :=). -/
def proofBodyAfterAssign (line : String) : String :=
  let t := stripLineComment line
  match t.splitOn ":=" with
  | _ :: body :: _ => trim body
  | _ => ""

/-- Statement text between `theorem name` and `:=` (collapsed). -/
def theoremStatementAfterName (line : String) (name : String) : String :=
  let n := collapseWsProof (stripLineComment line)
  let pref := "theorem " ++ name
  if !(hasPrefix n pref) then ""
  else
    let rest := trim (String.Slice.toString (n.drop pref.length))
    -- Drop leading type binder / colon region up to first `:=` if present.
    match rest.splitOn ":=" with
    | stmt :: _ =>
      let s := trim stmt
      -- Drop leading `:` if present after binders.
      if hasPrefix s ":" then trim (String.Slice.toString (s.drop 1))
      else s
    | _ => rest

/-- J7: ofNat?_zero statement is ofNat? 0 = some Mult.mult0.
    Greppable: multThmOfNatZeroStmtOk, PROOF-SURFACE. -/
def multThmOfNatZeroStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "ofNat?_zero" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "ofNat?_zero"
    let n := collapseWsProof stmt
    (n.splitOn "ofNat? 0 = some Mult.mult0").length > 1
      && !((n.splitOn "True").length > 1)

/-- J7: ofNat?_zero proof body is exactly rfl (not by sorry / trivial).
    Greppable: multThmOfNatZeroProofOk, PROOF-SURFACE. -/
def multThmOfNatZeroProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "ofNat?_zero" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- J7: name_mult0 statement is name Mult.mult0 = "MULT-0".
    Greppable: multThmNameMult0StmtOk, PROOF-SURFACE. -/
def multThmNameMult0StmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "name_mult0" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "name_mult0"
    let n := collapseWsProof stmt
    -- Real MultTheorems and fixtures use name Mult.mult0 = "MULT-0".
    (n.splitOn "name Mult.mult0").length > 1
      && (n.splitOn "MULT-0").length > 1
      && !((n.splitOn "True").length > 1)

/-- J7: name_mult0 proof body is exactly rfl.
    Greppable: multThmNameMult0ProofOk, PROOF-SURFACE. -/
def multThmNameMult0ProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "name_mult0" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- MultTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkMultTheoremsProofDialect, PROOF-SURFACE,
    MultTheorems proof-surface pilot. -/
def checkMultTheoremsProofDialect (content : String) : Option String :=
  if !multThmOfNatZeroStmtOk content then some reasonIllTypedProof
  else if !multThmOfNatZeroProofOk content then some reasonIllTypedProof
  else if !multThmNameMult0StmtOk content then some reasonIllTypedProof
  else if !multThmNameMult0ProofOk content then some reasonIllTypedProof
  else none

/-- Apply MultTheorems L3 after a structural MultTheorems accept.
    Greppable: refineMultTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineMultTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkMultTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### MultTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed MultTheorems L3 good text (ofNat?_zero + name_mult0 rfl pins;
    remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodMultTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodMultTheoremsProofText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Mult\n" ++
  "theorem ofNat?_zero : ofNat? 0 = some Mult.mult0 := rfl\n" ++
  "theorem ofNat?_one : ofNat? 1 = some Mult.mult1 := rfl\n" ++
  "theorem ofNat?_two : ofNat? 2 = some Mult.multOmega := rfl\n" ++
  "theorem ofNat?_fail_closed (n : Nat) (h : 2 < n) : ofNat? n = none := by sorry\n" ++
  "theorem isValidTag_zero : isValidTag 0 = true := rfl\n" ++
  "theorem isValidTag_one : isValidTag 1 = true := rfl\n" ++
  "theorem isValidTag_two : isValidTag 2 = true := rfl\n" ++
  "theorem isValidTag_fail_closed (n : Nat) (h : 2 < n) : isValidTag n = false := by sorry\n" ++
  "theorem isValid_true (m : Mult) : isValid m = true := by sorry\n" ++
  "theorem multIsValid_eq_isValid (m : Mult) : multIsValid m = isValid m := rfl\n" ++
  "theorem name_mult0 : name Mult.mult0 = \"MULT-0\" := rfl\n" ++
  "theorem name_mult1 : name Mult.mult1 = \"MULT-1\" := rfl\n" ++
  "theorem name_multOmega : name Mult.multOmega = \"MULT-OMEGA\" := rfl\n" ++
  "theorem isValidTag_eq_ofNat?_isSome (n : Nat) : isValidTag n = (ofNat? n).isSome := rfl\n" ++
  "end SystemsLean.Mult\n"

/-! ### Ill-typed MultTheorems twins (P1/P2). L0 tokens present; L3 must reject. -/

/-- Shared MultTheorems body with ofNat?_zero / name_mult0 slots filled by caller.
    Keeps 14 required theorem names for L0 accept dual-pin. -/
def multTheoremsTwinSkeleton (ofNatZeroLine : String) (nameMult0Line : String) :
    String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Mult\n" ++
  ofNatZeroLine ++ "\n" ++
  "theorem ofNat?_one : ofNat? 1 = some Mult.mult1 := rfl\n" ++
  "theorem ofNat?_two : ofNat? 2 = some Mult.multOmega := rfl\n" ++
  "theorem ofNat?_fail_closed (n : Nat) (h : 2 < n) : ofNat? n = none := by sorry\n" ++
  "theorem isValidTag_zero : isValidTag 0 = true := rfl\n" ++
  "theorem isValidTag_one : isValidTag 1 = true := rfl\n" ++
  "theorem isValidTag_two : isValidTag 2 = true := rfl\n" ++
  "theorem isValidTag_fail_closed (n : Nat) (h : 2 < n) : isValidTag n = false := by sorry\n" ++
  "theorem isValid_true (m : Mult) : isValid m = true := by sorry\n" ++
  "theorem multIsValid_eq_isValid (m : Mult) : multIsValid m = isValid m := rfl\n" ++
  nameMult0Line ++ "\n" ++
  "theorem name_mult1 : name Mult.mult1 = \"MULT-1\" := rfl\n" ++
  "theorem name_multOmega : name Mult.multOmega = \"MULT-OMEGA\" := rfl\n" ++
  "theorem isValidTag_eq_ofNat?_isSome (n : Nat) : True := trivial\n" ++
  "end SystemsLean.Mult\n"

/-- P1: wrong statement on ofNat?_zero (True / trivial). L0 still has theorem:ofNat?_zero.
    Greppable: hostModuleCheckBadMultThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadMultThmWrongStmtText : String :=
  multTheoremsTwinSkeleton
    "theorem ofNat?_zero : True := trivial"
    "theorem name_mult0 : name Mult.mult0 = \"MULT-0\" := rfl"

/-- P2: by sorry on ofNat?_zero where real proof is rfl. L0 still has theorem:ofNat?_zero.
    Greppable: hostModuleCheckBadMultThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadMultThmSorryText : String :=
  multTheoremsTwinSkeleton
    "theorem ofNat?_zero : ofNat? 0 = some Mult.mult0 := by sorry"
    "theorem name_mult0 : name Mult.mult0 = \"MULT-0\" := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from MultTheorems twin text for L0 dual-pin. -/
def multTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.MultTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadMultThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadMultThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface (multTheoremsProofSurfaceFrom hostModuleCheckBadMultThmWrongStmtText)
    multExpectedNamespace multTheoremsRequiredDecls (some "SystemsLean.Mult")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadMultThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadMultThmSorryL0Accept : Bool :=
  (checkNamedSurface (multTheoremsProofSurfaceFrom hostModuleCheckBadMultThmSorryText)
    multExpectedNamespace multTheoremsRequiredDecls (some "SystemsLean.Mult")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckMultProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckMultProofDialectOk : Bool :=
  (checkMultTheoremsProofDialect hostModuleCheckGoodMultTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadMultThmWrongStmtDialectReject, PROOF-SURFACE. -/
def hostModuleCheckBadMultThmWrongStmtDialectReject : Bool :=
  match checkMultTheoremsProofDialect hostModuleCheckBadMultThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadMultThmSorryDialectReject, PROOF-SURFACE. -/
def hostModuleCheckBadMultThmSorryDialectReject : Bool :=
  match checkMultTheoremsProofDialect hostModuleCheckBadMultThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined MultTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Greppable: hostModuleCheckMultProofSurfaceOk, PROOF-SURFACE, MultTheorems-only. -/
def hostModuleCheckMultProofSurfaceOk : Bool :=
  hostModuleCheckProofSurfaceDualOk
    && (checkDepthProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthProofSurfaceScope == "MultTheorems-only")
    && hostModuleCheckMultProofDialectOk
    && hostModuleCheckBadMultThmWrongStmtDialectReject
    && hostModuleCheckBadMultThmSorryDialectReject
    && hostModuleCheckBadMultThmWrongStmtL0Accept
    && hostModuleCheckBadMultThmSorryL0Accept

end SystemsLean.HostModuleCheck
