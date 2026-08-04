/-
  SYSTEMS_LEAN_HOST partial -- LLVM IR Linear text (Linear unit IR fragment from
  Lean SSOT under out/llvm-ir). Generator-owned Linear-related LLVM IR text.
  Composes LlvmHold hold honesty: living llvmUnlocked true after unlock residual; local unlock pin false. Composes
  LlvmEmitPath design+stub path and LlvmMultText Mult IR peer. Not production
  LLVM backend. Not llvm-as pipeline. Not Rust-native link success. Not
  freestanding residual free re-open. Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-LINEAR-TEXT, SLAKE_LLVM_LINEAR_TEXT,
  SLAKE_LLVM_LINEAR_TEXT_V0, HOST-HOST-LLVM-LINEAR-TEXT, llvmLinearTextReady,
  llvmLinearTextFinishedClaimed, llvmLinearTextPackageOk, llvmLinearTextWroteExpected,
  llvmLinearTextKeepsLlvmLocked, llvmLinearTextDoesNotUnlockLlvm,
  llvmLinearTextLlvmUnlocked, llvmLinearTextLocalUnlockFalse,
  justRecipeLlvmLinearText, llvm-linear-text, out/llvm-ir, slake_linear.ll,
  linearIrPackage, llvmLinearTextWrite, IO.FS.writeFile, Linear,
  LINEAR-EXACT-ONCE, LINEAR-AXIOMS-REMAIN, shareNat, polyId, MULT-0, MULT-1,
  MULT-OMEGA, LlvmHold, llvmUnlocked, LlvmEmitPath, LlvmMultText,
  HOST-LLVM-EMIT-PATH, HOST-LLVM-MULT-TEXT, HOST-LLVM-LINEAR-TEXT-SMOKE,
  HOST-LLVM-LINEAR-TEXT-THEOREM, UNIT_SURFACE host surface.
  Module: SystemsLean.LlvmLinearText
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-linear-text
  greps of out/llvm-ir/slake_linear.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmLinearText; lake exe slake-llvm-linear-text;
  just llvm-linear-text; just systems-host when presence dual-pin staged.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock.
  Host elaborator residual remains. Linear IR text only (not full backend).
-/

import SystemsLean.Linear
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmMultText

namespace SystemsLean.LlvmLinearText

open SystemsLean.Linear

/-! ### HOST-LLVM-LINEAR-TEXT / SLAKE_LLVM_LINEAR_TEXT

  Linear unit LLVM IR text fragment owned by Lean Linear SSOT (class ids +
  shareNat / polyId / LINEAR-EXACT-ONCE honesty). Written under
  out/llvm-ir/slake_linear.ll. Does not unlock llvm.
-/

/-- Greppable primary stage id (LLVM IR Linear text gate). -/
def stageId : String := "SLAKE_LLVM_LINEAR_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-LINEAR-TEXT"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-LINEAR-TEXT"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-LINEAR-TEXT"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmLinearText, llvm-linear-text. -/
def justRecipeLlvmLinearText : String := "llvm-linear-text"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmLinearText

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-linear-text. -/
def lakeExeName : String := "slake-llvm-linear-text"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Linear IR artifact basename under out/llvm-ir.
    Greppable: linearIrBasename, slake_linear.ll. -/
def linearIrBasename : String := "slake_linear.ll"

/-- Linear host SSOT module path cite.
    Greppable: linearModuleCite, Linear.lean. -/
def linearModuleCite : String := "src/systems/SystemsLean/Linear.lean"

/-- Mult IR peer module cite (prior residual).
    Greppable: llvmMultTextModuleCite, LlvmMultText. -/
def llvmMultTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmMultText.lean"

/-- Emit path module cite (design+stub residual).
    Greppable: llvmEmitPathModuleCite, LlvmEmitPath. -/
def llvmEmitPathModuleCite : String :=
  "src/systems/SystemsLean/LlvmEmitPath.lean"

/-- Hold module path cite (unlock SSoT remains LlvmHold).
    Greppable: llvmHoldModuleCite, LlvmHold. -/
def llvmHoldModuleCite : String :=
  "src/systems/SystemsLean/LlvmHold.lean"

/-- Local inventory finished (structural gate closed for Linear IR text).
    Greppable: llvmLinearTextFinishedClaimed. -/
def llvmLinearTextFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmLinearTextLlvmUnlocked, llvmLinearTextLocalUnlockFalse. -/
def llvmLinearTextLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmLinearTextLocalUnlockFalse. -/
def llvmLinearTextLocalUnlockFalse : Bool := !llvmLinearTextLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmLinearTextKeepsLlvmLocked. -/
def llvmLinearTextKeepsLlvmLocked : Bool :=
  !llvmLinearTextLlvmUnlocked

/-- Linear IR text does not unlock llvm (fail-closed).
    Greppable: llvmLinearTextDoesNotUnlockLlvm. -/
def llvmLinearTextDoesNotUnlockLlvm : Bool :=
  llvmLinearTextKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmMultText.llvmMultTextKeepsLlvmLocked

/-- Local honesty: not freestanding residual free re-open. -/
def llvmLinearTextResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmLinearTextProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmLinearTextProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY as false (living tip true).
    Local pin stays false meaning "this module does not claim PROVABLY unlock
    work"; living LlvmHold.provablyUnlocked may be true. -/
def llvmLinearTextProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmLinearTextProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmLinearTextRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmLinearTextLlvmAsClaimed : Bool := false

/-- Linear Mult-class ids from Linear SSOT (not a second dialect).
    Greppable: linearMult0ClassId, MULT-0, polyId. -/
def linearMult0ClassId : String := Linear.mult0ClassId

/-- Greppable: linearMult1ClassId, MULT-1, LINEAR-EXACT-ONCE. -/
def linearMult1ClassId : String := Linear.mult1ClassId

/-- Greppable: linearMultOmegaClassId, MULT-OMEGA, shareNat. -/
def linearMultOmegaClassId : String := Linear.multOmegaClassId

/-- Exact-once contract id from Linear SSOT.
    Greppable: linearExactOnceId, LINEAR-EXACT-ONCE. -/
def linearExactOnceId : String := Linear.linearExactOnceId

/-- Axioms-remain honesty id from Linear SSOT.
    Greppable: linearAxiomsRemainId, LINEAR-AXIOMS-REMAIN. -/
def linearAxiomsRemainId : String := Linear.linearAxiomsRemainId

/-- Linear IR header comments (stage + Linear SSOT + non-claims).
    Greppable: linearIrBanner. -/
def linearIrBanner : String :=
  "; SLAKE_LLVM_LINEAR_TEXT_V0 / HOST-LLVM-LINEAR-TEXT\n"
    ++ "; Generator-owned Linear unit LLVM IR fragment from Systems Lean Linear SSOT\n"
    ++ "; Linear class ids: " ++ linearMult0ClassId ++ " (polyId) "
    ++ linearMult1ClassId ++ " (" ++ linearExactOnceId ++ ") "
    ++ linearMultOmegaClassId ++ " (shareNat)\n"
    ++ "; Linear honesty: " ++ linearExactOnceId ++ " "
    ++ linearAxiomsRemainId ++ "\n"
    ++ "; Linear SSOT: src/systems/SystemsLean/Linear.lean\n"
    ++ "; Path: out/llvm-ir/slake_linear.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmMultText Mult IR (HOST-LLVM-MULT-TEXT); LlvmEmitPath stub\n"
    ++ "; Recipe: just llvm-linear-text / lake exe slake-llvm-linear-text\n"
    ++ "; Not production LLVM backend. Not llvm-as success. Not unlock residual.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- Linear Mult-class tag constants (0/1/2 map MULT-0/1/OMEGA; peer Mult tags).
    Greppable: linearIrConstants, MULT-0, MULT-1, MULT-OMEGA. -/
def linearIrConstants : String :=
  "; Linear Mult-class tag constants (0=" ++ linearMult0ClassId
    ++ " polyId, 1=" ++ linearMult1ClassId ++ " " ++ linearExactOnceId
    ++ ", 2=" ++ linearMultOmegaClassId ++ " shareNat)\n"
    ++ "@slake_linear_class_0 = private unnamed_addr constant i32 0, align 4 ; "
    ++ linearMult0ClassId ++ " polyId\n"
    ++ "@slake_linear_class_1 = private unnamed_addr constant i32 1, align 4 ; "
    ++ linearMult1ClassId ++ " " ++ linearExactOnceId ++ "\n"
    ++ "@slake_linear_class_omega = private unnamed_addr constant i32 2, align 4 ; "
    ++ linearMultOmegaClassId ++ " shareNat\n"
    ++ "\n"

/-- Fail-closed Linear class tag validity (known 0/1/2 only; Mult class map).
    Greppable: linearIrIsValid, slake_linear_is_valid_class_tag. -/
def linearIrIsValid : String :=
  "; Fail-closed Linear Mult-class tag check (known 0/1/2 only)\n"
    ++ "define i1 @slake_linear_is_valid_class_tag(i32 %tag) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %tag, 0\n"
    ++ "  %is1 = icmp eq i32 %tag, 1\n"
    ++ "  %is2 = icmp eq i32 %tag, 2\n"
    ++ "  %t01 = or i1 %is0, %is1\n"
    ++ "  %ok = or i1 %t01, %is2\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"

/-- shareNat sketch (MULT-OMEGA unrestricted double) + polyId sketch (MULT-0 id).
    Greppable: linearIrSketches, shareNat, polyId, slake_linear_share_nat. -/
def linearIrSketches : String :=
  "; shareNat sketch (MULT-OMEGA unrestricted double; Linear.shareNat)\n"
    ++ "define i32 @slake_linear_share_nat(i32 %n) {\n"
    ++ "entry:\n"
    ++ "  %r = add i32 %n, %n\n"
    ++ "  ret i32 %r\n"
    ++ "}\n"
    ++ "\n"
    ++ "; polyId sketch (MULT-0 erased-parameter identity; Linear.polyId)\n"
    ++ "define i32 @slake_linear_poly_id(i32 %x) {\n"
    ++ "entry:\n"
    ++ "  ret i32 %x\n"
    ++ "}\n"
    ++ "\n"
    ++ "; LINEAR-EXACT-ONCE contract tag predicate (MULT-1 class only; model not elaborator)\n"
    ++ "define i1 @slake_linear_is_exact_once_tag(i32 %tag) {\n"
    ++ "entry:\n"
    ++ "  %ok = icmp eq i32 %tag, 1\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Linear IR package text (banner + constants + is_valid + sketches).
    Greppable: linearIrPackage, slake_linear.ll. -/
def linearIrPackage : String :=
  linearIrBanner ++ linearIrConstants ++ linearIrIsValid ++ linearIrSketches

/-- Surface ids + path cites + Linear SSOT class ids ok. -/
def llvmLinearTextSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_LINEAR_TEXT_V0")
    && (hostId == "HOST-LLVM-LINEAR-TEXT")
    && (surfaceId == "HOST-LLVM-LINEAR-TEXT")
    && (surfaceAlias == "HOST-HOST-LLVM-LINEAR-TEXT")
    && (justRecipeLlvmLinearText == "llvm-linear-text")
    && (justRecipe == "llvm-linear-text")
    && (lakeExeName == "slake-llvm-linear-text")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (linearIrBasename == "slake_linear.ll")
    && (linearModuleCite == "src/systems/SystemsLean/Linear.lean")
    && (llvmMultTextModuleCite
      == "src/systems/SystemsLean/LlvmMultText.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (linearMult0ClassId == "MULT-0")
    && (linearMult1ClassId == "MULT-1")
    && (linearMultOmegaClassId == "MULT-OMEGA")
    && (linearExactOnceId == "LINEAR-EXACT-ONCE")
    && (linearAxiomsRemainId == "LINEAR-AXIOMS-REMAIN")
    && Linear.linearAxiomInventoryOk

/-- Package text honesty: Linear class ids + stage + define present.
    Greppable: llvmLinearTextPackageOk. -/
def llvmLinearTextPackageOk : Bool :=
  llvmLinearTextSurfaceOk
    && (linearIrPackage
      == linearIrBanner ++ linearIrConstants ++ linearIrIsValid ++ linearIrSketches)
    && (linearIrBanner
      == "; SLAKE_LLVM_LINEAR_TEXT_V0 / HOST-LLVM-LINEAR-TEXT\n"
        ++ "; Generator-owned Linear unit LLVM IR fragment from Systems Lean Linear SSOT\n"
        ++ "; Linear class ids: MULT-0 (polyId) MULT-1 (LINEAR-EXACT-ONCE) MULT-OMEGA (shareNat)\n"
        ++ "; Linear honesty: LINEAR-EXACT-ONCE LINEAR-AXIOMS-REMAIN\n"
        ++ "; Linear SSOT: src/systems/SystemsLean/Linear.lean\n"
        ++ "; Path: out/llvm-ir/slake_linear.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmMultText Mult IR (HOST-LLVM-MULT-TEXT); LlvmEmitPath stub\n"
        ++ "; Recipe: just llvm-linear-text / lake exe slake-llvm-linear-text\n"
        ++ "; Not production LLVM backend. Not llvm-as success. Not unlock residual.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Linear IR equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmLinearTextWrite
    (IO.FS.writeFile) + post-read equality + just llvm-linear-text greps.
    Greppable: llvmLinearTextWroteExpected. -/
def llvmLinearTextWroteExpected : Bool :=
  llvmLinearTextPackageOk
    && (linearIrPackage
      == linearIrBanner ++ linearIrConstants ++ linearIrIsValid ++ linearIrSketches)

/-- Structural ready for LLVM IR Linear text residual.
    Greppable: llvmLinearTextReady, HOST-LLVM-LINEAR-TEXT, SLAKE_LLVM_LINEAR_TEXT. -/
def llvmLinearTextReady : Bool :=
  llvmLinearTextFinishedClaimed
    && llvmLinearTextPackageOk
    && llvmLinearTextWroteExpected
    && llvmLinearTextSurfaceOk
    && llvmLinearTextKeepsLlvmLocked
    && llvmLinearTextDoesNotUnlockLlvm
    && llvmLinearTextLocalUnlockFalse
    && !llvmLinearTextLlvmUnlocked
    && !llvmLinearTextResidualFreeClaimed
    && !llvmLinearTextProductSelfHostCompleteClaimed
    && !llvmLinearTextProofCompleteClaimed
    && !llvmLinearTextProvablyUnlockWorkClaimed
    && !llvmLinearTextProductionReadyClaimed
    && !llvmLinearTextRustNativeLinkClaimed
    && !llvmLinearTextLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmMultText.llvmMultTextReady
    && !LlvmMultText.llvmMultTextLlvmUnlocked

/-! ### HOST-LLVM-LINEAR-TEXT-THEOREM (readable statements) -/

theorem llvmLinearTextFinishedClaimed_true :
    llvmLinearTextFinishedClaimed = true :=
  rfl

theorem llvmLinearTextLlvmUnlocked_false :
    llvmLinearTextLlvmUnlocked = false :=
  rfl

theorem llvmLinearTextKeepsLlvmLocked_true :
    llvmLinearTextKeepsLlvmLocked = true := by
  native_decide

theorem llvmLinearTextDoesNotUnlockLlvm_true :
    llvmLinearTextDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmLinearTextReady_true :
    llvmLinearTextReady = true := by
  native_decide

theorem justRecipeLlvmLinearText_eq :
    justRecipeLlvmLinearText = "llvm-linear-text" :=
  rfl

theorem llvmLinearText_stageId_eq :
    stageId = "SLAKE_LLVM_LINEAR_TEXT_V0" :=
  rfl

theorem llvmLinearText_hostId_eq :
    hostId = "HOST-LLVM-LINEAR-TEXT" :=
  rfl

theorem llvmLinearText_class_ids_eq :
    linearMult0ClassId = "MULT-0"
      && linearMult1ClassId = "MULT-1"
      && linearMultOmegaClassId = "MULT-OMEGA"
      && linearExactOnceId = "LINEAR-EXACT-ONCE"
      && linearAxiomsRemainId = "LINEAR-AXIOMS-REMAIN" :=
  rfl

theorem llvmLinearText_claims_false :
    llvmLinearTextLlvmUnlocked = false
      && llvmLinearTextResidualFreeClaimed = false
      && llvmLinearTextProductSelfHostCompleteClaimed = false
      && llvmLinearTextProofCompleteClaimed = false
      && llvmLinearTextProvablyUnlockWorkClaimed = false
      && llvmLinearTextProductionReadyClaimed = false
      && llvmLinearTextRustNativeLinkClaimed = false
      && llvmLinearTextLlvmAsClaimed = false :=
  rfl

theorem llvmLinearTextPackageOk_true :
    llvmLinearTextPackageOk = true := by
  native_decide

theorem llvmLinearTextWroteExpected_true :
    llvmLinearTextWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-LINEAR-TEXT-SMOKE (quick examples) -/

example : llvmLinearTextFinishedClaimed = true := rfl
example : llvmLinearTextLlvmUnlocked = false := rfl
example : llvmLinearTextKeepsLlvmLocked = true := by native_decide
example : llvmLinearTextDoesNotUnlockLlvm = true := by native_decide
example : llvmLinearTextReady = true := by native_decide
example : justRecipeLlvmLinearText = "llvm-linear-text" := rfl
example : linearMult0ClassId = "MULT-0" := rfl
example : linearMult1ClassId = "MULT-1" := rfl
example : linearMultOmegaClassId = "MULT-OMEGA" := rfl
example : linearExactOnceId = "LINEAR-EXACT-ONCE" := rfl
example : linearAxiomsRemainId = "LINEAR-AXIOMS-REMAIN" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmLinearTextLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmMultText.llvmMultTextReady = true := by native_decide
example : llvmLinearTextProductionReadyClaimed = false := rfl
example : llvmLinearTextLlvmAsClaimed = false := rfl
example : linearIrBasename = "slake_linear.ll" := rfl

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Linear IR lacks greppable honesty tokens. -/
def validateLinearIrPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_LINEAR_TEXT_V0"
    , "HOST-LLVM-LINEAR-TEXT"
    , "MULT-0"
    , "MULT-1"
    , "MULT-OMEGA"
    , "LINEAR-EXACT-ONCE"
    , "LINEAR-AXIOMS-REMAIN"
    , "shareNat"
    , "polyId"
    , "slake_linear_is_valid_class_tag"
    , "slake_linear_share_nat"
    , "slake_linear_poly_id"
    , "slake_linear_is_exact_once_tag"
    , "slake_linear_class_0"
    , "slake_linear_class_1"
    , "slake_linear_class_omega"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_linear.ll"
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

/-- Write Linear unit LLVM IR text under root/out/llvm-ir/slake_linear.ll.
    Greppable: llvmLinearTextWrite, slake_linear.ll, IO.FS.writeFile. -/
def llvmLinearTextWrite (root : System.FilePath) : IO Unit := do
  unless llvmLinearTextReady do
    IO.eprintln s!"error: {stageId}: llvmLinearTextReady false"
    throw (IO.userError "llvmLinearTextReady false")
  unless llvmLinearTextWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmLinearTextWroteExpected false"
    throw (IO.userError "llvmLinearTextWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / linearIrBasename
  IO.println s!"== {stageId}: LLVM IR Linear text =="
  IO.println s!"  readyPin={llvmLinearTextReady} llvmUnlocked={LlvmHold.llvmUnlocked}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl linearIrPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Linear IR after write: {outLl}"
    throw (IO.userError "missing Linear IR")
  if written != linearIrPackage then
    IO.eprintln "error: Linear IR written content mismatch"
    throw (IO.userError "Linear IR mismatch")
  validateLinearIrPackage linearIrBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-LINEAR-TEXT, LINEAR-EXACT-ONCE, shareNat, polyId"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Linear IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmLinearTextWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmLinearText
