/-
SPDX-License-Identifier: Unlicense

Module: SystemsLean.SimdTargetFeatures
Pure check for three CPU features: AVX2, FMA, and BMI2.
This tree has no spec 2 SIMD directive. The spellings are the
Operator's CPU-feature names, plus the compiler flags -mavx2,
-mfma, and -mbmi2. A comment is not support. A match inside a
longer identifier is not support (`fma` inside `elfmain` is not FMA).
Comment forms: Lean `--` and `/- -/`, C `//` and `/* */`, Nix `#`.
Text inside a double-quoted string is kept. Elaborating this file
does not run the checker on the tree.
-/

namespace SystemsLean.SimdTargetFeatures

/-- Which comment grammar to strip before looking for features. -/
inductive CommentKind where
  | lean
  | c
  | nix
  deriving DecidableEq, Repr

/-- Scan position while stripping comments. -/
inductive ScanMode where
  | code
  | str
  | line
  | leanBlock
  | cBlock
  deriving DecidableEq, Repr

/-- Whether each feature is real support in one snippet. -/
structure FeatureSupport where
  avx2 : Bool
  fma : Bool
  bmi2 : Bool
  deriving DecidableEq, Repr

/-- One named source text, with the comment grammar of that file. -/
structure SourceFile where
  path : String
  kind : CommentKind
  text : String
  deriving Repr

def isIdentChar (c : Char) : Bool :=
  ('0' <= c && c <= '9')
    || ('A' <= c && c <= 'Z')
    || ('a' <= c && c <= 'z')
    || c == '_'

/-- `pre` is a prefix of `cs`. -/
def charsPrefix (pre cs : List Char) : Bool :=
  match pre, cs with
  | [], _ => true
  | _, [] => false
  | a :: apre, b :: bcs => a == b && charsPrefix apre bcs

/-- Drop Lean, C, or Nix comments. Double-quoted strings stay. -/
def stripComments (kind : CommentKind) (text : String) : String :=
  let rec go (mode : ScanMode) (cs : List Char) (acc : List Char) : List Char :=
    match mode, cs with
    | _, [] => acc.reverse
    | .line, '\n' :: rest => go .code rest ('\n' :: acc)
    | .line, _ :: rest => go .line rest acc
    | .leanBlock, '-' :: '/' :: rest => go .code rest acc
    | .leanBlock, _ :: rest => go .leanBlock rest acc
    | .cBlock, '*' :: '/' :: rest => go .code rest acc
    | .cBlock, _ :: rest => go .cBlock rest acc
    | .str, '\\' :: [] => ('\\' :: acc).reverse
    | .str, '\\' :: d :: rest => go .str rest (d :: '\\' :: acc)
    | .str, '"' :: rest => go .code rest ('"' :: acc)
    | .str, c :: rest => go .str rest (c :: acc)
    | .code, '"' :: rest => go .str rest ('"' :: acc)
    | .code, '-' :: '-' :: rest =>
      match kind with
      | .lean => go .line rest acc
      | .c => go .code rest ('-' :: '-' :: acc)
      | .nix => go .code rest ('-' :: '-' :: acc)
    | .code, '/' :: '/' :: rest =>
      match kind with
      | .c => go .line rest acc
      | .lean => go .code rest ('/' :: '/' :: acc)
      | .nix => go .code rest ('/' :: '/' :: acc)
    | .code, '/' :: '*' :: rest =>
      match kind with
      | .c => go .cBlock rest acc
      | .lean => go .code rest ('/' :: '*' :: acc)
      | .nix => go .code rest ('/' :: '*' :: acc)
    | .code, '/' :: '-' :: rest =>
      match kind with
      | .lean => go .leanBlock rest acc
      | .c => go .code rest ('/' :: '-' :: acc)
      | .nix => go .code rest ('/' :: '-' :: acc)
    | .code, '#' :: rest =>
      match kind with
      | .nix => go .line rest acc
      | .lean => go .code rest ('#' :: acc)
      | .c => go .code rest ('#' :: acc)
    | .code, c :: rest => go .code rest (c :: acc)
  String.ofList (go .code text.toList [])

/-- Bounded token: not the interior of a longer identifier. -/
def hasBounded (text : String) (tok : List Char) : Bool :=
  match tok with
  | [] => false
  | _ =>
    let rec go (prev : Char) (cs : List Char) : Bool :=
      match cs with
      | [] => false
      | c :: rest =>
        let after := cs.drop tok.length
        let afterOk :=
          match after with
          | [] => true
          | a :: _ => !isIdentChar a
        if charsPrefix tok cs && !isIdentChar prev && afterOk then
          true
        else
          go c rest
    go ' ' text.toList

def hasAnyToken (text : String) (tokens : List String) : Bool :=
  tokens.any (fun token => hasBounded text token.toList)

/-- Operator names and the cc/LLVM flag spellings. Not a spec 2 quote. -/
def avx2Tokens : List String := ["AVX2", "avx2", "-mavx2"]

def fmaTokens : List String := ["FMA", "fma", "-mfma"]

def bmi2Tokens : List String := ["BMI2", "bmi2", "-mbmi2"]

/-- Real support for the three features, after comments are removed. -/
def featureSupport (kind : CommentKind) (text : String) : FeatureSupport :=
  let kept := stripComments kind text
  { avx2 := hasAnyToken kept avx2Tokens
  , fma := hasAnyToken kept fmaTokens
  , bmi2 := hasAnyToken kept bmi2Tokens }

def missesAny (support : FeatureSupport) : Bool :=
  !(support.avx2 && support.fma && support.bmi2)

/-- Paths whose text is missing at least one of AVX2, FMA, or BMI2. -/
def filesMissingAny (files : List SourceFile) : List String :=
  (files.filter fun file => missesAny (featureSupport file.kind file.text)).map
    fun file => file.path

/-! Fixtures. Spellings are the Operator names and the flag tokens. -/

/-- All three present as flags and as feature tokens, outside comments. -/
def fixtureAllThree : String :=
  "cc -mavx2 -mfma -mbmi2\ntarget_feature AVX2 FMA BMI2\n"

/-- FMA absent. AVX2 and BMI2 present as flags and as feature tokens. -/
def fixtureMissingFma : String :=
  "cc -mavx2 -mbmi2\ntarget_feature AVX2 BMI2\n"

/-- The three words appear only in Lean comments. -/
def fixtureCommentOnly : String :=
  "-- AVX2 FMA BMI2\n/- AVX2 FMA BMI2 -/\n"

/-- The three words appear only in C comments. -/
def fixtureCommentOnlyC : String :=
  "// AVX2 FMA BMI2\n/* AVX2 FMA BMI2 */\n"

/-- The three words appear only in a Nix comment. -/
def fixtureCommentOnlyNix : String :=
  "# AVX2 FMA BMI2\n"

/-- C comment mentions the words. The flag list after it is support. -/
def fixtureFlagsAfterComment : String :=
  "/* AVX2 FMA BMI2 */\ncc -mavx2 -mfma -mbmi2\n"

def exampleScan : List SourceFile :=
  [ { path := "ok.c", kind := .c, text := fixtureAllThree }
  , { path := "no-fma.c", kind := .c, text := fixtureMissingFma }
  , { path := "comment.lean", kind := .lean, text := fixtureCommentOnly }
  ]

#guard featureSupport .c fixtureAllThree =
  { avx2 := true, fma := true, bmi2 := true }

#guard featureSupport .c fixtureMissingFma =
  { avx2 := true, fma := false, bmi2 := true }

#guard featureSupport .lean fixtureCommentOnly =
  { avx2 := false, fma := false, bmi2 := false }

#guard featureSupport .c fixtureCommentOnlyC =
  { avx2 := false, fma := false, bmi2 := false }

#guard featureSupport .nix fixtureCommentOnlyNix =
  { avx2 := false, fma := false, bmi2 := false }

#guard featureSupport .c fixtureFlagsAfterComment =
  { avx2 := true, fma := true, bmi2 := true }

#guard featureSupport .lean "slakehosttoolelfmaincatch" =
  { avx2 := false, fma := false, bmi2 := false }

#guard filesMissingAny exampleScan = ["no-fma.c", "comment.lean"]

/-! Explicit packed-vector target.
`featureSupport` stays a text scan. A text scan is finder evidence.
It is not `packedVectorTargetAdmits`.
Declared features are fields on one target value.
They are not a global compiler flag, not a triple change, and not an architecture default.
-/

/-- One explicit packed-vector target.
Aligned ymm loads and stores use `alignedYmmBytes`.
Unaligned ymm operations are outside that contract when
`unalignedClaimsAlignedContract` is false.
FMA is one rounding step on the admitted target, and it is not multiply-then-add.
BMI2 is a declared feature and is outside the SIMD topic.
Runtime detection and a scalar fallback are required.
The admitted target does not rely on automatic vectorization.
This value does not claim a detector ran, and it does not claim the opcode catalog is done. -/
structure PackedVectorTarget where
  avx2 : Bool
  fma : Bool
  bmi2 : Bool
  alignedYmmBytes : Nat
  unalignedClaimsAlignedContract : Bool
  fmaOneRoundingStep : Bool
  fmaIsMultiplyThenAdd : Bool
  bmi2InSimdTopic : Bool
  requiresRuntimeFeatureDetection : Bool
  requiresScalarFallback : Bool
  opcodeCatalogDone : Bool
  reliesOnAutomaticVectorization : Bool
  deriving DecidableEq, Repr

/-- The one admitted explicit packed-vector target.
Automatic vectorization is off. The string check `rejectsBlanketSimdClaim`
is not this target. -/
def explicitPackedVectorTarget : PackedVectorTarget where
  avx2 := true
  fma := true
  bmi2 := true
  alignedYmmBytes := 32
  unalignedClaimsAlignedContract := false
  fmaOneRoundingStep := true
  fmaIsMultiplyThenAdd := false
  bmi2InSimdTopic := false
  requiresRuntimeFeatureDetection := true
  requiresScalarFallback := true
  opcodeCatalogDone := false
  reliesOnAutomaticVectorization := false

/-- Accepts only the explicit packed-vector target contract.
A target that relies on automatic vectorization is rejected.
Each false result is one rejected target, not a second checker.
This predicate does not read compiler-flag strings. -/
def packedVectorTargetAdmits (t : PackedVectorTarget) : Bool :=
  (t.avx2 == true)
    && (t.fma == true)
    && (t.bmi2 == true)
    && (t.alignedYmmBytes == 32)
    && (t.unalignedClaimsAlignedContract == false)
    && (t.fmaOneRoundingStep == true)
    && (t.fmaIsMultiplyThenAdd == false)
    && (t.bmi2InSimdTopic == false)
    && (t.requiresRuntimeFeatureDetection == true)
    && (t.requiresScalarFallback == true)
    && (t.opcodeCatalogDone == false)
    && (t.reliesOnAutomaticVectorization == false)

def explicitPackedVectorTargetMissingAvx2 : PackedVectorTarget :=
  { explicitPackedVectorTarget with avx2 := false }

def explicitPackedVectorTargetMissingFma : PackedVectorTarget :=
  { explicitPackedVectorTarget with fma := false }

def explicitPackedVectorTargetMissingBmi2 : PackedVectorTarget :=
  { explicitPackedVectorTarget with bmi2 := false }

def explicitPackedVectorTargetWrongAlignment : PackedVectorTarget :=
  { explicitPackedVectorTarget with alignedYmmBytes := 16 }

def explicitPackedVectorTargetUnalignedClaimsContract : PackedVectorTarget :=
  { explicitPackedVectorTarget with unalignedClaimsAlignedContract := true }

/-- One rounding step stays set. Multiply-then-add is the only change. -/
def explicitPackedVectorTargetFmaMultiplyThenAdd : PackedVectorTarget :=
  { explicitPackedVectorTarget with fmaIsMultiplyThenAdd := true }

/-- Multiply-then-add stays unset. One rounding step is the only change. -/
def explicitPackedVectorTargetFmaNotOneRounding : PackedVectorTarget :=
  { explicitPackedVectorTarget with fmaOneRoundingStep := false }

def explicitPackedVectorTargetBmi2InSimdTopic : PackedVectorTarget :=
  { explicitPackedVectorTarget with bmi2InSimdTopic := true }

def explicitPackedVectorTargetNoRuntimeDetection : PackedVectorTarget :=
  { explicitPackedVectorTarget with requiresRuntimeFeatureDetection := false }

def explicitPackedVectorTargetNoScalarFallback : PackedVectorTarget :=
  { explicitPackedVectorTarget with requiresScalarFallback := false }

def explicitPackedVectorTargetOpcodeCatalogDone : PackedVectorTarget :=
  { explicitPackedVectorTarget with opcodeCatalogDone := true }

/-- The explicit target with only automatic vectorization turned on. -/
def explicitPackedVectorTargetReliesOnAutomaticVectorization : PackedVectorTarget :=
  { explicitPackedVectorTarget with reliesOnAutomaticVectorization := true }

#guard packedVectorTargetAdmits explicitPackedVectorTarget = true

#guard packedVectorTargetAdmits explicitPackedVectorTargetMissingAvx2 = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetMissingFma = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetMissingBmi2 = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetWrongAlignment = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetUnalignedClaimsContract = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetFmaMultiplyThenAdd = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetFmaNotOneRounding = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetBmi2InSimdTopic = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetNoRuntimeDetection = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetNoScalarFallback = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetOpcodeCatalogDone = false

#guard packedVectorTargetAdmits explicitPackedVectorTargetReliesOnAutomaticVectorization = false

/-- True only when `s` is exactly one blanket compiler-flag claim.
A blanket claim is not a SIMD proof.
This function reads `s`. It does not shell out and does not build a compiler command.
It is a string check. It is not `packedVectorTargetAdmits`.
The empty string is not a blanket claim.
The character sequence explicitPackedVectorTarget is not a blanket claim. -/
def rejectsBlanketSimdClaim (s : String) : Bool :=
  match s with
  | "-mavx2" => true
  | "-mfma" => true
  | "-mbmi2" => true
  | "-march=native" => true
  | _ => false

#guard rejectsBlanketSimdClaim "-mavx2" = true

#guard rejectsBlanketSimdClaim "-mfma" = true

#guard rejectsBlanketSimdClaim "-mbmi2" = true

#guard rejectsBlanketSimdClaim "-march=native" = true

#guard rejectsBlanketSimdClaim "" = false

#guard rejectsBlanketSimdClaim "explicitPackedVectorTarget" = false

/-- Integer value plus a rounding-step count.
Two results with the same integer and different counts are not the same model.
This is not an IEEE float and it is not an AVX2 hardware value. -/
structure IntegerRoundingModel where
  value : Nat
  roundings : Nat
  deriving DecidableEq, Repr

/-- Multiply rounds, then the add rounds.
The integer value is `x * x + 1` and the rounding count is 2.
This is not the one-rounding FMA kernel. -/
def multiplyThenAdd (x : Nat) : IntegerRoundingModel where
  value := x * x + 1
  roundings := 2

/-- Scalar reference. It is the multiply-then-add model, not the FMA kernel. -/
def scalarReference (x : Nat) : IntegerRoundingModel :=
  multiplyThenAdd x

/-- One fused rounding step for the explicit AVX2 and FMA integer model.
The integer value is `x * x + 1` and the rounding count is 1.
This is not a copy of `multiplyThenAdd`.
Not a compiler invocation. Not an IEEE float result. Not an AVX2 hardware result. -/
def explicitAvx2FmaKernelModel (x : Nat) : IntegerRoundingModel where
  value := x * x + 1
  roundings := 1

/-- Compares the integer `.value` fields on one input.
Calls `scalarReference` and `explicitAvx2FmaKernelModel`.
Does not return a constant.
Integer agreement is not an AVX2 hardware proof and it is not an IEEE float proof. -/
def deltaReconcile (x : Nat) : Bool :=
  (scalarReference x).value == (explicitAvx2FmaKernelModel x).value

#guard deltaReconcile 3 = true

#guard (explicitAvx2FmaKernelModel 3).roundings = 1

#guard (multiplyThenAdd 3).roundings = 2

#guard decide (explicitAvx2FmaKernelModel 3 ≠ scalarReference 3)

/-- Integer-model theorem. The integer values agree at input 3.
This is not an AVX2 hardware proof and it is not an IEEE float proof. -/
theorem deltaReconcile_model_at_3 : deltaReconcile 3 = true := by
  unfold deltaReconcile scalarReference multiplyThenAdd explicitAvx2FmaKernelModel
  decide

/-- Integer-model theorem. The rounding counts at input 3 differ.
The FMA model counts one rounding step. Multiply-then-add counts two.
This is not an AVX2 hardware proof and it is not an IEEE float proof. -/
theorem roundings_differ_at_3 :
    (explicitAvx2FmaKernelModel 3).roundings ≠ (multiplyThenAdd 3).roundings := by
  unfold explicitAvx2FmaKernelModel multiplyThenAdd
  decide

/-- What this file does not prove.
The unaligned line is a requirement `packedVectorTargetAdmits` already enforces.
That requirement is not a hardware proof.
None of these sentences is marked proved. -/
def openSimdClaims : List String :=
  [ "integer value agreement is not an AVX2 hardware proof"
  , "the IEEE float numeric difference between one-rounding FMA and multiply-then-add is not proved"
  , "runtime feature detection was not executed on hardware"
  , "the opcode catalog is not done"
  , "unaligned ymm forms are outside the 32-byte aligned contract, which packedVectorTargetAdmits already requires by rejecting a true unalignedClaimsAlignedContract, and that requirement is not a hardware proof"
  , "rejecting a target that relies on automatic vectorization is not an AVX2 hardware proof"
  ]

end SystemsLean.SimdTargetFeatures
