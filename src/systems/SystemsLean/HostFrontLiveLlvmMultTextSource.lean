/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmMultText.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmMultTextSource. Not occupancy name 50. Not mill 70.
  This wrap is LlvmMultText.lean. It is not LlvmHold.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmMultTextSource,
  HOST-FRONT-LIVE-LLVM-MULT-TEXT, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmMultTextSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmMultText

/-- Dual-pinned live LlvmMultText.lean bytes (must match on-disk file).
    Greppable: liveLlvmMultTextSource, HOST-FRONT-LIVE-LLVM-MULT-TEXT. -/
def liveLlvmMultTextSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LLVM IR Mult text (Mult unit IR fragment from
  Lean SSOT under out/llvm-ir). Generator-owned Mult-related LLVM IR text.
  Composes LlvmHold hold honesty: living llvmUnlocked true after unlock residual; local unlock pin false. Composes
  LlvmEmitPath design+stub path. Not production LLVM backend. Not llvm-as
  pipeline. Not Rust-native link success. Not freestanding residual free
  re-open. Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-MULT-TEXT, SLAKE_LLVM_MULT_TEXT,
  SLAKE_LLVM_MULT_TEXT_V0, HOST-HOST-LLVM-MULT-TEXT, llvmMultTextReady,
  llvmMultTextFinishedClaimed, llvmMultTextPackageOk, llvmMultTextWroteExpected,
  llvmMultTextKeepsLlvmLocked, llvmMultTextDoesNotUnlockLlvm,
  llvmMultTextLlvmUnlocked, llvmMultTextLocalUnlockFalse,
  justRecipeLlvmMultText, llvm-mult-text, out/llvm-ir, slake_mult.ll,
  multIrPackage, llvmMultTextWrite, IO.FS.writeFile, Mult, MULT-0, MULT-1,
  MULT-OMEGA, LlvmHold, llvmUnlocked, LlvmEmitPath, HOST-LLVM-EMIT-PATH,
  HOST-LLVM-MULT-TEXT-SMOKE, HOST-LLVM-MULT-TEXT-THEOREM, UNIT_SURFACE host surface.
  Module: SystemsLean.LlvmMultText
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-mult-text
  greps of out/llvm-ir/slake_mult.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmMultText; lake exe slake-llvm-mult-text;
  just llvm-mult-text; just systems-host when presence dual-pin staged.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock.
  Host elaborator residual remains. Mult IR text only (not full backend).
-/

import SystemsLean.Mult
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath

namespace SystemsLean.LlvmMultText

open SystemsLean.Mult

/-! ### HOST-LLVM-MULT-TEXT / SLAKE_LLVM_MULT_TEXT

  Mult unit LLVM IR text fragment owned by Lean Mult SSOT (grade names +
  fail-closed tag check shape). Written under out/llvm-ir/slake_mult.ll.
  Does not unlock llvm.
-/

/-- Greppable primary stage id (LLVM IR Mult text gate). -/
def stageId : String := "SLAKE_LLVM_MULT_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-MULT-TEXT"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-MULT-TEXT"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-MULT-TEXT"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmMultText, llvm-mult-text. -/
def justRecipeLlvmMultText : String := "llvm-mult-text"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmMultText

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-mult-text. -/
def lakeExeName : String := "slake-llvm-mult-text"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Mult IR artifact basename under out/llvm-ir.
    Greppable: multIrBasename, slake_mult.ll. -/
def multIrBasename : String := "slake_mult.ll"

/-- Mult host SSOT module path cite.
    Greppable: multModuleCite, Mult.lean. -/
def multModuleCite : String := "src/systems/SystemsLean/Mult.lean"

/-- Emit path module cite (prior residual).
    Greppable: llvmEmitPathModuleCite, LlvmEmitPath. -/
def llvmEmitPathModuleCite : String :=
  "src/systems/SystemsLean/LlvmEmitPath.lean"

/-- Hold module path cite (unlock SSoT remains LlvmHold).
    Greppable: llvmHoldModuleCite, LlvmHold. -/
def llvmHoldModuleCite : String :=
  "src/systems/SystemsLean/LlvmHold.lean"

/-- Local inventory finished (structural gate closed for Mult IR text).
    Greppable: llvmMultTextFinishedClaimed. -/
def llvmMultTextFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmMultTextLlvmUnlocked, llvmMultTextLocalUnlockFalse. -/
def llvmMultTextLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmMultTextLocalUnlockFalse. -/
def llvmMultTextLocalUnlockFalse : Bool := !llvmMultTextLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmMultTextKeepsLlvmLocked. -/
def llvmMultTextKeepsLlvmLocked : Bool :=
  !llvmMultTextLlvmUnlocked

/-- Mult IR text does not unlock llvm (fail-closed).
    Greppable: llvmMultTextDoesNotUnlockLlvm. -/
def llvmMultTextDoesNotUnlockLlvm : Bool :=
  llvmMultTextKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked

/-- Local honesty: not freestanding residual free re-open. -/
def llvmMultTextResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmMultTextProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmMultTextProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY as false (living tip true).
    Local pin stays false meaning "this module does not claim PROVABLY unlock
    work"; living LlvmHold.provablyUnlocked may be true. -/
def llvmMultTextProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmMultTextProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmMultTextRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmMultTextLlvmAsClaimed : Bool := false

/-- Mult grade names from Mult SSOT (not hard-coded second dialect).
    Greppable: multGrade0Name, MULT-0. -/
def multGrade0Name : String := Mult.name Mult.mult0

/-- Greppable: multGrade1Name, MULT-1. -/
def multGrade1Name : String := Mult.name Mult.mult1

/-- Greppable: multGradeOmegaName, MULT-OMEGA. -/
def multGradeOmegaName : String := Mult.name Mult.multOmega

/-- Mult IR header comments (stage + Mult SSOT + non-claims).
    Greppable: multIrBanner. -/
def multIrBanner : String :=
  "; SLAKE_LLVM_MULT_TEXT_V0 / HOST-LLVM-MULT-TEXT\n"
    ++ "; Generator-owned Mult unit LLVM IR fragment from Systems Lean Mult SSOT\n"
    ++ "; Mult grades: " ++ multGrade0Name ++ " " ++ multGrade1Name
    ++ " " ++ multGradeOmegaName ++ "\n"
    ++ "; Mult SSOT: src/systems/SystemsLean/Mult.lean\n"
    ++ "; Path: out/llvm-ir/slake_mult.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmEmitPath design+stub (HOST-LLVM-EMIT-PATH)\n"
    ++ "; Recipe: just llvm-mult-text / lake exe slake-llvm-mult-text\n"
    ++ "; Not production LLVM backend. Not llvm-as success. Not unlock residual.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- Mult grade tag constants (enum-like i32 matching freestanding slake_mult
    tags 0/1/2). Greppable: multIrConstants, MULT-0, MULT-1, MULT-OMEGA. -/
def multIrConstants : String :=
  "; Mult grade tag constants (0=" ++ multGrade0Name
    ++ ", 1=" ++ multGrade1Name ++ ", 2=" ++ multGradeOmegaName ++ ")\n"
    ++ "@slake_mult_tag_0 = private unnamed_addr constant i32 0, align 4 ; "
    ++ multGrade0Name ++ "\n"
    ++ "@slake_mult_tag_1 = private unnamed_addr constant i32 1, align 4 ; "
    ++ multGrade1Name ++ "\n"
    ++ "@slake_mult_tag_omega = private unnamed_addr constant i32 2, align 4 ; "
    ++ multGradeOmegaName ++ "\n"
    ++ "\n"

/-- Fail-closed Mult tag validity (known 0/1/2 only; Mult.isValidTag shape).
    Greppable: multIrIsValid, slake_mult_is_valid_tag. -/
def multIrIsValid : String :=
  "; Fail-closed raw tag check (Mult.isValidTag / ofNat? known 0/1/2 only)\n"
    ++ "define i1 @slake_mult_is_valid_tag(i32 %tag) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %tag, 0\n"
    ++ "  %is1 = icmp eq i32 %tag, 1\n"
    ++ "  %is2 = icmp eq i32 %tag, 2\n"
    ++ "  %t01 = or i1 %is0, %is1\n"
    ++ "  %ok = or i1 %t01, %is2\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Mult IR package text (banner + constants + is_valid).
    Greppable: multIrPackage, slake_mult.ll. -/
def multIrPackage : String :=
  multIrBanner ++ multIrConstants ++ multIrIsValid

/-- Surface ids + path cites + Mult grade SSOT ok. -/
def llvmMultTextSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_MULT_TEXT_V0")
    && (hostId == "HOST-LLVM-MULT-TEXT")
    && (surfaceId == "HOST-LLVM-MULT-TEXT")
    && (surfaceAlias == "HOST-HOST-LLVM-MULT-TEXT")
    && (justRecipeLlvmMultText == "llvm-mult-text")
    && (justRecipe == "llvm-mult-text")
    && (lakeExeName == "slake-llvm-mult-text")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (multIrBasename == "slake_mult.ll")
    && (multModuleCite == "src/systems/SystemsLean/Mult.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (multGrade0Name == "MULT-0")
    && (multGrade1Name == "MULT-1")
    && (multGradeOmegaName == "MULT-OMEGA")

/-- Package text honesty: Mult grades + stage + define present.
    Greppable: llvmMultTextPackageOk. -/
def llvmMultTextPackageOk : Bool :=
  llvmMultTextSurfaceOk
    && (multIrPackage == multIrBanner ++ multIrConstants ++ multIrIsValid)
    && (multIrBanner
      == "; SLAKE_LLVM_MULT_TEXT_V0 / HOST-LLVM-MULT-TEXT\n"
        ++ "; Generator-owned Mult unit LLVM IR fragment from Systems Lean Mult SSOT\n"
        ++ "; Mult grades: MULT-0 MULT-1 MULT-OMEGA\n"
        ++ "; Mult SSOT: src/systems/SystemsLean/Mult.lean\n"
        ++ "; Path: out/llvm-ir/slake_mult.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmEmitPath design+stub (HOST-LLVM-EMIT-PATH)\n"
        ++ "; Recipe: just llvm-mult-text / lake exe slake-llvm-mult-text\n"
        ++ "; Not production LLVM backend. Not llvm-as success. Not unlock residual.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Mult IR equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmMultTextWrite
    (IO.FS.writeFile) + post-read equality + just llvm-mult-text greps.
    Greppable: llvmMultTextWroteExpected. -/
def llvmMultTextWroteExpected : Bool :=
  llvmMultTextPackageOk
    && (multIrPackage == multIrBanner ++ multIrConstants ++ multIrIsValid)

/-- Structural ready for LLVM IR Mult text residual.
    Greppable: llvmMultTextReady, HOST-LLVM-MULT-TEXT, SLAKE_LLVM_MULT_TEXT. -/
def llvmMultTextReady : Bool :=
  llvmMultTextFinishedClaimed
    && llvmMultTextPackageOk
    && llvmMultTextWroteExpected
    && llvmMultTextSurfaceOk
    && llvmMultTextKeepsLlvmLocked
    && llvmMultTextDoesNotUnlockLlvm
    && llvmMultTextLocalUnlockFalse
    && !llvmMultTextLlvmUnlocked
    && !llvmMultTextResidualFreeClaimed
    && !llvmMultTextProductSelfHostCompleteClaimed
    && !llvmMultTextProofCompleteClaimed
    && !llvmMultTextProvablyUnlockWorkClaimed
    && !llvmMultTextProductionReadyClaimed
    && !llvmMultTextRustNativeLinkClaimed
    && !llvmMultTextLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked

/-! ### HOST-LLVM-MULT-TEXT-THEOREM (readable statements) -/

theorem llvmMultTextFinishedClaimed_true :
    llvmMultTextFinishedClaimed = true :=
  rfl

theorem llvmMultTextLlvmUnlocked_false :
    llvmMultTextLlvmUnlocked = false :=
  rfl

theorem llvmMultTextKeepsLlvmLocked_true :
    llvmMultTextKeepsLlvmLocked = true := by
  native_decide

theorem llvmMultTextDoesNotUnlockLlvm_true :
    llvmMultTextDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmMultTextReady_true :
    llvmMultTextReady = true := by
  native_decide

theorem justRecipeLlvmMultText_eq :
    justRecipeLlvmMultText = "llvm-mult-text" :=
  rfl

theorem llvmMultText_stageId_eq :
    stageId = "SLAKE_LLVM_MULT_TEXT_V0" :=
  rfl

theorem llvmMultText_hostId_eq :
    hostId = "HOST-LLVM-MULT-TEXT" :=
  rfl

theorem llvmMultText_grades_eq :
    multGrade0Name = "MULT-0"
      && multGrade1Name = "MULT-1"
      && multGradeOmegaName = "MULT-OMEGA" :=
  rfl

theorem llvmMultText_claims_false :
    llvmMultTextLlvmUnlocked = false
      && llvmMultTextResidualFreeClaimed = false
      && llvmMultTextProductSelfHostCompleteClaimed = false
      && llvmMultTextProofCompleteClaimed = false
      && llvmMultTextProvablyUnlockWorkClaimed = false
      && llvmMultTextProductionReadyClaimed = false
      && llvmMultTextRustNativeLinkClaimed = false
      && llvmMultTextLlvmAsClaimed = false :=
  rfl

theorem llvmMultTextPackageOk_true :
    llvmMultTextPackageOk = true := by
  native_decide

theorem llvmMultTextWroteExpected_true :
    llvmMultTextWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-MULT-TEXT-SMOKE (quick examples) -/

example : llvmMultTextFinishedClaimed = true := rfl
example : llvmMultTextLlvmUnlocked = false := rfl
example : llvmMultTextKeepsLlvmLocked = true := by native_decide
example : llvmMultTextDoesNotUnlockLlvm = true := by native_decide
example : llvmMultTextReady = true := by native_decide
example : justRecipeLlvmMultText = "llvm-mult-text" := rfl
example : multGrade0Name = "MULT-0" := rfl
example : multGrade1Name = "MULT-1" := rfl
example : multGradeOmegaName = "MULT-OMEGA" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmMultTextLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : llvmMultTextProductionReadyClaimed = false := rfl
example : llvmMultTextLlvmAsClaimed = false := rfl
example : multIrBasename = "slake_mult.ll" := rfl

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Mult IR lacks greppable honesty tokens. -/
def validateMultIrPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_MULT_TEXT_V0"
    , "HOST-LLVM-MULT-TEXT"
    , "MULT-0"
    , "MULT-1"
    , "MULT-OMEGA"
    , "slake_mult_is_valid_tag"
    , "slake_mult_tag_0"
    , "slake_mult_tag_1"
    , "slake_mult_tag_omega"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_mult.ll"
    , "Not production LLVM backend"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  -- Must not claim unlock or full freestanding dialect stage.
  if containsSub text "llvmUnlocked = true" then
    IO.eprintln s!"error: {label}: unexpected llvmUnlocked true claim"
    throw (IO.userError s!"{label}: unlock forge")
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected freestanding C emit stage"
    throw (IO.userError s!"{label}: freestanding stage")

/-- Write Mult unit LLVM IR text under root/out/llvm-ir/slake_mult.ll.
    Greppable: llvmMultTextWrite, slake_mult.ll, IO.FS.writeFile. -/
def llvmMultTextWrite (root : System.FilePath) : IO Unit := do
  unless llvmMultTextReady do
    IO.eprintln s!"error: {stageId}: llvmMultTextReady false"
    throw (IO.userError "llvmMultTextReady false")
  unless llvmMultTextWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmMultTextWroteExpected false"
    throw (IO.userError "llvmMultTextWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / multIrBasename
  IO.println s!"== {stageId}: LLVM IR Mult text =="
  IO.println s!"  readyPin={llvmMultTextReady} llvmUnlocked={LlvmHold.llvmUnlocked}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl multIrPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Mult IR after write: {outLl}"
    throw (IO.userError "missing Mult IR")
  if written != multIrPackage then
    IO.eprintln "error: Mult IR written content mismatch"
    throw (IO.userError "Mult IR mismatch")
  validateMultIrPackage multIrBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-MULT-TEXT, MULT-0/1/OMEGA, slake_mult_is_valid_tag"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Mult IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmMultTextWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmMultText
"#

end SystemsLean.HostFrontLiveLlvmMultText
