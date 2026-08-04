/-
  SYSTEMS_LEAN_HOST partial -- LLVM IR Types text (Types unit IR fragment from
  Lean SSOT under out/llvm-ir). Generator-owned Types-related LLVM IR text.
  Composes LlvmHold hold honesty: living llvmUnlocked true after unlock residual; local unlock pin false. Composes
  LlvmEmitPath design+stub path, LlvmMultText Mult IR peer, and LlvmLinearText
  Linear IR peer. Not production LLVM backend. Not llvm-as pipeline. Not
  Rust-native link success. Not freestanding residual free re-open. Not product
  C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-TYPES-TEXT, SLAKE_LLVM_TYPES_TEXT,
  SLAKE_LLVM_TYPES_TEXT_V0, HOST-HOST-LLVM-TYPES-TEXT, llvmTypesTextReady,
  llvmTypesTextFinishedClaimed, llvmTypesTextPackageOk, llvmTypesTextWroteExpected,
  llvmTypesTextKeepsLlvmLocked, llvmTypesTextDoesNotUnlockLlvm,
  llvmTypesTextLlvmUnlocked, llvmTypesTextLocalUnlockFalse,
  justRecipeLlvmTypesText, llvm-types-text, out/llvm-ir, slake_types.ll,
  typesIrPackage, llvmTypesTextWrite, IO.FS.writeFile, Types, TYPED_IR_V0,
  FAIL-CLOSED-UNKNOWN-KIND, VALUE, LINEAR, ERASED, MULT-0, MULT-1, MULT-OMEGA,
  kindMultOk, isValidKindTag, NodeKind, LlvmHold, llvmUnlocked, LlvmEmitPath,
  LlvmMultText, LlvmLinearText, HOST-LLVM-EMIT-PATH, HOST-LLVM-MULT-TEXT,
  HOST-LLVM-LINEAR-TEXT, HOST-LLVM-TYPES-TEXT-SMOKE, HOST-LLVM-TYPES-TEXT-THEOREM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LlvmTypesText
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-types-text
  greps of out/llvm-ir/slake_types.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmTypesText; lake exe slake-llvm-types-text;
  just llvm-types-text; just systems-host when presence dual-pin staged.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock.
  Host elaborator residual remains. Types IR text only (not full backend).
-/

import SystemsLean.Types
import SystemsLean.Mult
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmMultText
import SystemsLean.LlvmLinearText

namespace SystemsLean.LlvmTypesText

open SystemsLean.Types
open SystemsLean.Mult (Mult)

/-! ### HOST-LLVM-TYPES-TEXT / SLAKE_LLVM_TYPES_TEXT

  Types unit LLVM IR text fragment owned by Lean Types SSOT (NodeKind names +
  kind/mult pairing + TYPED_IR_V0 / FAIL-CLOSED-UNKNOWN-KIND honesty). Written
  under out/llvm-ir/slake_types.ll. Does not unlock llvm.
-/

/-- Greppable primary stage id (LLVM IR Types text gate). -/
def stageId : String := "SLAKE_LLVM_TYPES_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-TYPES-TEXT"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-TYPES-TEXT"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-TYPES-TEXT"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmTypesText, llvm-types-text. -/
def justRecipeLlvmTypesText : String := "llvm-types-text"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmTypesText

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-types-text. -/
def lakeExeName : String := "slake-llvm-types-text"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Types IR artifact basename under out/llvm-ir.
    Greppable: typesIrBasename, slake_types.ll. -/
def typesIrBasename : String := "slake_types.ll"

/-- Types host SSOT module path cite.
    Greppable: typesModuleCite, Types.lean. -/
def typesModuleCite : String := "src/systems/SystemsLean/Types.lean"

/-- Linear IR peer module cite (prior residual).
    Greppable: llvmLinearTextModuleCite, LlvmLinearText. -/
def llvmLinearTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmLinearText.lean"

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

/-- Local inventory finished (structural gate closed for Types IR text).
    Greppable: llvmTypesTextFinishedClaimed. -/
def llvmTypesTextFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmTypesTextLlvmUnlocked, llvmTypesTextLocalUnlockFalse. -/
def llvmTypesTextLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmTypesTextLocalUnlockFalse. -/
def llvmTypesTextLocalUnlockFalse : Bool := !llvmTypesTextLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmTypesTextKeepsLlvmLocked. -/
def llvmTypesTextKeepsLlvmLocked : Bool :=
  !llvmTypesTextLlvmUnlocked

/-- Types IR text does not unlock llvm (fail-closed).
    Greppable: llvmTypesTextDoesNotUnlockLlvm. -/
def llvmTypesTextDoesNotUnlockLlvm : Bool :=
  llvmTypesTextKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmMultText.llvmMultTextKeepsLlvmLocked
    && LlvmLinearText.llvmLinearTextKeepsLlvmLocked

/-- Local honesty: not freestanding residual free re-open. -/
def llvmTypesTextResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmTypesTextProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmTypesTextProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY as false (living tip true).
    Local pin stays false meaning "this module does not claim PROVABLY unlock
    work"; living LlvmHold.provablyUnlocked may be true. -/
def llvmTypesTextProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmTypesTextProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmTypesTextRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmTypesTextLlvmAsClaimed : Bool := false

/-- Typed IR honesty id (Types SSOT greppable contract surface).
    Greppable: typedIrHonestyId, TYPED_IR_V0. -/
def typedIrHonestyId : String := "TYPED_IR_V0"

/-- Fail-closed unknown kind honesty id from Types SSOT.
    Greppable: failClosedUnknownKindId, FAIL-CLOSED-UNKNOWN-KIND. -/
def failClosedUnknownKindId : String := "FAIL-CLOSED-UNKNOWN-KIND"

/-- NodeKind names from Types SSOT (not a second dialect).
    Greppable: typesKindValueName, VALUE. -/
def typesKindValueName : String := NodeKind.name NodeKind.value

/-- Greppable: typesKindLinearName, LINEAR. -/
def typesKindLinearName : String := NodeKind.name NodeKind.linear

/-- Greppable: typesKindErasedName, ERASED. -/
def typesKindErasedName : String := NodeKind.name NodeKind.erased

/-- Expected Mult names for kind pairing (Types.expectedMult table).
    Greppable: typesExpectedMultValue, MULT-OMEGA. -/
def typesExpectedMultValue : String := Mult.name (NodeKind.expectedMult NodeKind.value)

/-- Greppable: typesExpectedMultLinear, MULT-1. -/
def typesExpectedMultLinear : String := Mult.name (NodeKind.expectedMult NodeKind.linear)

/-- Greppable: typesExpectedMultErased, MULT-0. -/
def typesExpectedMultErased : String := Mult.name (NodeKind.expectedMult NodeKind.erased)

/-- Types IR header comments (stage + Types SSOT + non-claims).
    Greppable: typesIrBanner. -/
def typesIrBanner : String :=
  "; SLAKE_LLVM_TYPES_TEXT_V0 / HOST-LLVM-TYPES-TEXT\n"
    ++ "; Generator-owned Types unit LLVM IR fragment from Systems Lean Types SSOT\n"
    ++ "; NodeKind: " ++ typesKindValueName ++ " " ++ typesKindLinearName
    ++ " " ++ typesKindErasedName ++ "\n"
    ++ "; Kind/mult pairing: " ++ typesKindValueName ++ "<->"
    ++ typesExpectedMultValue ++ " " ++ typesKindLinearName ++ "<->"
    ++ typesExpectedMultLinear ++ " " ++ typesKindErasedName ++ "<->"
    ++ typesExpectedMultErased ++ "\n"
    ++ "; Types honesty: " ++ typedIrHonestyId ++ " "
    ++ failClosedUnknownKindId ++ " kindMultOk isValidKindTag\n"
    ++ "; Types SSOT: src/systems/SystemsLean/Types.lean\n"
    ++ "; Path: out/llvm-ir/slake_types.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub\n"
    ++ "; Recipe: just llvm-types-text / lake exe slake-llvm-types-text\n"
    ++ "; Not production LLVM backend. Not llvm-as success. Not unlock residual.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- NodeKind tag constants (0=VALUE, 1=LINEAR, 2=ERASED; Types.ofKindTag? map).
    Greppable: typesIrConstants, VALUE, LINEAR, ERASED. -/
def typesIrConstants : String :=
  "; NodeKind tag constants (0=" ++ typesKindValueName
    ++ ", 1=" ++ typesKindLinearName ++ ", 2=" ++ typesKindErasedName ++ ")\n"
    ++ "@slake_types_kind_0 = private unnamed_addr constant i32 0, align 4 ; "
    ++ typesKindValueName ++ "\n"
    ++ "@slake_types_kind_1 = private unnamed_addr constant i32 1, align 4 ; "
    ++ typesKindLinearName ++ "\n"
    ++ "@slake_types_kind_2 = private unnamed_addr constant i32 2, align 4 ; "
    ++ typesKindErasedName ++ "\n"
    ++ "\n"

/-- Fail-closed kind tag validity (known 0/1/2 only; Types.isValidKindTag shape).
    Greppable: typesIrIsValid, slake_types_is_valid_kind_tag, FAIL-CLOSED-UNKNOWN-KIND. -/
def typesIrIsValid : String :=
  "; Fail-closed kind tag check (Types.isValidKindTag / ofKindTag? known 0/1/2 only)\n"
    ++ "; " ++ failClosedUnknownKindId ++ "\n"
    ++ "define i1 @slake_types_is_valid_kind_tag(i32 %tag) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %tag, 0\n"
    ++ "  %is1 = icmp eq i32 %tag, 1\n"
    ++ "  %is2 = icmp eq i32 %tag, 2\n"
    ++ "  %t01 = or i1 %is0, %is1\n"
    ++ "  %ok = or i1 %t01, %is2\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"

/-- kindMultOk sketches: expected Mult tag for each kind (0->2, 1->1, 2->0).
    Mult tags: 0=MULT-0, 1=MULT-1, 2=MULT-OMEGA (peer Mult.ofNat?).
    Greppable: typesIrSketches, kindMultOk, slake_types_expected_mult_tag. -/
def typesIrSketches : String :=
  "; kindMultOk table sketch (kind tag -> expected Mult tag)\n"
    ++ "; VALUE(0)->MULT-OMEGA(2); LINEAR(1)->MULT-1(1); ERASED(2)->MULT-0(0)\n"
    ++ "define i32 @slake_types_expected_mult_tag(i32 %kind) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %kind, 0\n"
    ++ "  %is1 = icmp eq i32 %kind, 1\n"
    ++ "  %r0 = select i1 %is0, i32 2, i32 0\n"
    ++ "  %r1 = select i1 %is1, i32 1, i32 %r0\n"
    ++ "  ret i32 %r1\n"
    ++ "}\n"
    ++ "\n"
    ++ "; kindMultOk predicate sketch (kind tag pairs with Mult tag)\n"
    ++ "define i1 @slake_types_kind_mult_ok(i32 %kind, i32 %mult) {\n"
    ++ "entry:\n"
    ++ "  %exp = call i32 @slake_types_expected_mult_tag(i32 %kind)\n"
    ++ "  %ok = icmp eq i32 %exp, %mult\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"
    ++ "; TYPED_IR_V0 well-typed sketch (kind valid and kind/mult pairing holds)\n"
    ++ "define i1 @slake_types_is_well_typed(i32 %kind, i32 %mult) {\n"
    ++ "entry:\n"
    ++ "  %vk = call i1 @slake_types_is_valid_kind_tag(i32 %kind)\n"
    ++ "  %km = call i1 @slake_types_kind_mult_ok(i32 %kind, i32 %mult)\n"
    ++ "  %ok = and i1 %vk, %km\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Types IR package text (banner + constants + is_valid + sketches).
    Greppable: typesIrPackage, slake_types.ll. -/
def typesIrPackage : String :=
  typesIrBanner ++ typesIrConstants ++ typesIrIsValid ++ typesIrSketches

/-- Surface ids + path cites + Types SSOT kind/mult ids ok. -/
def llvmTypesTextSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_TYPES_TEXT_V0")
    && (hostId == "HOST-LLVM-TYPES-TEXT")
    && (surfaceId == "HOST-LLVM-TYPES-TEXT")
    && (surfaceAlias == "HOST-HOST-LLVM-TYPES-TEXT")
    && (justRecipeLlvmTypesText == "llvm-types-text")
    && (justRecipe == "llvm-types-text")
    && (lakeExeName == "slake-llvm-types-text")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (typesIrBasename == "slake_types.ll")
    && (typesModuleCite == "src/systems/SystemsLean/Types.lean")
    && (llvmLinearTextModuleCite
      == "src/systems/SystemsLean/LlvmLinearText.lean")
    && (llvmMultTextModuleCite
      == "src/systems/SystemsLean/LlvmMultText.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (typedIrHonestyId == "TYPED_IR_V0")
    && (failClosedUnknownKindId == "FAIL-CLOSED-UNKNOWN-KIND")
    && (typesKindValueName == "VALUE")
    && (typesKindLinearName == "LINEAR")
    && (typesKindErasedName == "ERASED")
    && (typesExpectedMultValue == "MULT-OMEGA")
    && (typesExpectedMultLinear == "MULT-1")
    && (typesExpectedMultErased == "MULT-0")
    && kindMultOk NodeKind.value Mult.multOmega
    && kindMultOk NodeKind.linear Mult.mult1
    && kindMultOk NodeKind.erased Mult.mult0
    && isValidKindTag 0
    && isValidKindTag 1
    && isValidKindTag 2
    && !isValidKindTag 3

/-- Package text honesty: Types kinds + stage + define present.
    Greppable: llvmTypesTextPackageOk. -/
def llvmTypesTextPackageOk : Bool :=
  llvmTypesTextSurfaceOk
    && (typesIrPackage
      == typesIrBanner ++ typesIrConstants ++ typesIrIsValid ++ typesIrSketches)
    && (typesIrBanner
      == "; SLAKE_LLVM_TYPES_TEXT_V0 / HOST-LLVM-TYPES-TEXT\n"
        ++ "; Generator-owned Types unit LLVM IR fragment from Systems Lean Types SSOT\n"
        ++ "; NodeKind: VALUE LINEAR ERASED\n"
        ++ "; Kind/mult pairing: VALUE<->MULT-OMEGA LINEAR<->MULT-1 ERASED<->MULT-0\n"
        ++ "; Types honesty: TYPED_IR_V0 FAIL-CLOSED-UNKNOWN-KIND kindMultOk isValidKindTag\n"
        ++ "; Types SSOT: src/systems/SystemsLean/Types.lean\n"
        ++ "; Path: out/llvm-ir/slake_types.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub\n"
        ++ "; Recipe: just llvm-types-text / lake exe slake-llvm-types-text\n"
        ++ "; Not production LLVM backend. Not llvm-as success. Not unlock residual.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Types IR equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmTypesTextWrite
    (IO.FS.writeFile) + post-read equality + just llvm-types-text greps.
    Greppable: llvmTypesTextWroteExpected. -/
def llvmTypesTextWroteExpected : Bool :=
  llvmTypesTextPackageOk
    && (typesIrPackage
      == typesIrBanner ++ typesIrConstants ++ typesIrIsValid ++ typesIrSketches)

/-- Structural ready for LLVM IR Types text residual.
    Greppable: llvmTypesTextReady, HOST-LLVM-TYPES-TEXT, SLAKE_LLVM_TYPES_TEXT. -/
def llvmTypesTextReady : Bool :=
  llvmTypesTextFinishedClaimed
    && llvmTypesTextPackageOk
    && llvmTypesTextWroteExpected
    && llvmTypesTextSurfaceOk
    && llvmTypesTextKeepsLlvmLocked
    && llvmTypesTextDoesNotUnlockLlvm
    && llvmTypesTextLocalUnlockFalse
    && !llvmTypesTextLlvmUnlocked
    && !llvmTypesTextResidualFreeClaimed
    && !llvmTypesTextProductSelfHostCompleteClaimed
    && !llvmTypesTextProofCompleteClaimed
    && !llvmTypesTextProvablyUnlockWorkClaimed
    && !llvmTypesTextProductionReadyClaimed
    && !llvmTypesTextRustNativeLinkClaimed
    && !llvmTypesTextLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmMultText.llvmMultTextReady
    && !LlvmMultText.llvmMultTextLlvmUnlocked
    && LlvmLinearText.llvmLinearTextReady
    && !LlvmLinearText.llvmLinearTextLlvmUnlocked

/-! ### HOST-LLVM-TYPES-TEXT-THEOREM (readable statements) -/

theorem llvmTypesTextFinishedClaimed_true :
    llvmTypesTextFinishedClaimed = true :=
  rfl

theorem llvmTypesTextLlvmUnlocked_false :
    llvmTypesTextLlvmUnlocked = false :=
  rfl

theorem llvmTypesTextKeepsLlvmLocked_true :
    llvmTypesTextKeepsLlvmLocked = true := by
  native_decide

theorem llvmTypesTextDoesNotUnlockLlvm_true :
    llvmTypesTextDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmTypesTextReady_true :
    llvmTypesTextReady = true := by
  native_decide

theorem justRecipeLlvmTypesText_eq :
    justRecipeLlvmTypesText = "llvm-types-text" :=
  rfl

theorem llvmTypesText_stageId_eq :
    stageId = "SLAKE_LLVM_TYPES_TEXT_V0" :=
  rfl

theorem llvmTypesText_hostId_eq :
    hostId = "HOST-LLVM-TYPES-TEXT" :=
  rfl

theorem llvmTypesText_kinds_eq :
    typesKindValueName = "VALUE"
      && typesKindLinearName = "LINEAR"
      && typesKindErasedName = "ERASED"
      && typedIrHonestyId = "TYPED_IR_V0"
      && failClosedUnknownKindId = "FAIL-CLOSED-UNKNOWN-KIND" :=
  rfl

theorem llvmTypesText_expected_mult_eq :
    typesExpectedMultValue = "MULT-OMEGA"
      && typesExpectedMultLinear = "MULT-1"
      && typesExpectedMultErased = "MULT-0" :=
  rfl

theorem llvmTypesText_claims_false :
    llvmTypesTextLlvmUnlocked = false
      && llvmTypesTextResidualFreeClaimed = false
      && llvmTypesTextProductSelfHostCompleteClaimed = false
      && llvmTypesTextProofCompleteClaimed = false
      && llvmTypesTextProvablyUnlockWorkClaimed = false
      && llvmTypesTextProductionReadyClaimed = false
      && llvmTypesTextRustNativeLinkClaimed = false
      && llvmTypesTextLlvmAsClaimed = false :=
  rfl

theorem llvmTypesTextPackageOk_true :
    llvmTypesTextPackageOk = true := by
  native_decide

theorem llvmTypesTextWroteExpected_true :
    llvmTypesTextWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-TYPES-TEXT-SMOKE (quick examples) -/

example : llvmTypesTextFinishedClaimed = true := rfl
example : llvmTypesTextLlvmUnlocked = false := rfl
example : llvmTypesTextKeepsLlvmLocked = true := by native_decide
example : llvmTypesTextDoesNotUnlockLlvm = true := by native_decide
example : llvmTypesTextReady = true := by native_decide
example : justRecipeLlvmTypesText = "llvm-types-text" := rfl
example : typesKindValueName = "VALUE" := rfl
example : typesKindLinearName = "LINEAR" := rfl
example : typesKindErasedName = "ERASED" := rfl
example : typedIrHonestyId = "TYPED_IR_V0" := rfl
example : failClosedUnknownKindId = "FAIL-CLOSED-UNKNOWN-KIND" := rfl
example : typesExpectedMultValue = "MULT-OMEGA" := rfl
example : typesExpectedMultLinear = "MULT-1" := rfl
example : typesExpectedMultErased = "MULT-0" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmTypesTextLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmMultText.llvmMultTextReady = true := by native_decide
example : LlvmLinearText.llvmLinearTextReady = true := by native_decide
example : llvmTypesTextProductionReadyClaimed = false := rfl
example : llvmTypesTextLlvmAsClaimed = false := rfl
example : typesIrBasename = "slake_types.ll" := rfl

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Types IR lacks greppable honesty tokens. -/
def validateTypesIrPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_TYPES_TEXT_V0"
    , "HOST-LLVM-TYPES-TEXT"
    , "TYPED_IR_V0"
    , "FAIL-CLOSED-UNKNOWN-KIND"
    , "VALUE"
    , "LINEAR"
    , "ERASED"
    , "MULT-0"
    , "MULT-1"
    , "MULT-OMEGA"
    , "kindMultOk"
    , "isValidKindTag"
    , "slake_types_is_valid_kind_tag"
    , "slake_types_expected_mult_tag"
    , "slake_types_kind_mult_ok"
    , "slake_types_is_well_typed"
    , "slake_types_kind_0"
    , "slake_types_kind_1"
    , "slake_types_kind_2"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_types.ll"
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

/-- Write Types unit LLVM IR text under root/out/llvm-ir/slake_types.ll.
    Greppable: llvmTypesTextWrite, slake_types.ll, IO.FS.writeFile. -/
def llvmTypesTextWrite (root : System.FilePath) : IO Unit := do
  unless llvmTypesTextReady do
    IO.eprintln s!"error: {stageId}: llvmTypesTextReady false"
    throw (IO.userError "llvmTypesTextReady false")
  unless llvmTypesTextWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmTypesTextWroteExpected false"
    throw (IO.userError "llvmTypesTextWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / typesIrBasename
  IO.println s!"== {stageId}: LLVM IR Types text =="
  IO.println s!"  readyPin={llvmTypesTextReady} llvmUnlocked={LlvmHold.llvmUnlocked}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl typesIrPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Types IR after write: {outLl}"
    throw (IO.userError "missing Types IR")
  if written != typesIrPackage then
    IO.eprintln "error: Types IR written content mismatch"
    throw (IO.userError "Types IR mismatch")
  validateTypesIrPackage typesIrBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-TYPES-TEXT, TYPED_IR_V0, VALUE/LINEAR/ERASED, kindMultOk"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Types IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmTypesTextWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmTypesText
