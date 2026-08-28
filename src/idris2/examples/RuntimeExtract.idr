||| Algorithm id: RuntimeExtract
||| Side: Idris 2 (native Quantitative Type Theory grades)
||| Pair: Lean dual sketch at src/lean4/examples/RuntimeExtract.lean
|||
||| Focus: RUNTIME-FS vs RUNTIME-CLASSIC / EDGE-RUNTIME extract honesty.
||| Stock Idris backends leave a managed runtime in the trusted computing base
||| (EDGE-RUNTIME / RUNTIME-CLASSIC). Freestanding product extract accepts only
||| RUNTIME-FS (no managed runtime on the product wire).
|||
||| Host map: SystemsLean.Extract.checkFailClosed / RuntimeClaim / ofRuntimeTag?.
||| This file is a correspondence seed, not Slake emit. Not freestanding product.
|||
||| Prefer: idris2 --check examples/RuntimeExtract.idr  (when idris2 is on PATH)
module RuntimeExtract

%default total

------------------------------------------------------------------------
-- Runtime claim tags (align freestanding host Extract ofRuntimeTag?)
------------------------------------------------------------------------

||| Closed runtime claim set: freestanding product goal vs stock-host residual.
public export
data RuntimeClaim : Type where
  RuntimeFs : RuntimeClaim
  RuntimeClassic : RuntimeClaim
  EdgeRuntime : RuntimeClaim

||| Equality for demo comparisons (Maybe RuntimeClaim needs Eq under idris2 --check).
public export
Eq RuntimeClaim where
  RuntimeFs == RuntimeFs = True
  RuntimeClassic == RuntimeClassic = True
  EdgeRuntime == EdgeRuntime = True
  _ == _ = False

||| Greppable claim names (contract surface).
public export
name : RuntimeClaim -> String
name RuntimeFs = "RUNTIME-FS"
name RuntimeClassic = "RUNTIME-CLASSIC"
name EdgeRuntime = "EDGE-RUNTIME"

||| True only for freestanding product goal (RUNTIME-FS).
public export
isFreestandingGoal : RuntimeClaim -> Bool
isFreestandingGoal RuntimeFs = True
isFreestandingGoal RuntimeClassic = False
isFreestandingGoal EdgeRuntime = False

||| Decode raw tags: 0 = RUNTIME-FS, 1 = RUNTIME-CLASSIC, 2 = EDGE-RUNTIME.
||| Unknown tags reject (fail closed).
public export
ofRuntimeTag : Nat -> Maybe RuntimeClaim
ofRuntimeTag 0 = Just RuntimeFs
ofRuntimeTag 1 = Just RuntimeClassic
ofRuntimeTag 2 = Just EdgeRuntime
ofRuntimeTag _ = Nothing

||| True only for known raw tags 0 / 1 / 2.
public export
isValidRuntimeTag : Nat -> Bool
isValidRuntimeTag n = case ofRuntimeTag n of
  Just _ => True
  Nothing => False

------------------------------------------------------------------------
-- Extract accept / reject (product path accepts RUNTIME-FS only)
------------------------------------------------------------------------

||| Product extract accepts freestanding goal only.
public export
extractAccepts : RuntimeClaim -> Bool
extractAccepts c = isFreestandingGoal c

||| Stock-host claims reject on product extract path.
public export
demoClassicReject : Bool
demoClassicReject =
  (extractAccepts RuntimeClassic == False)
    && (extractAccepts EdgeRuntime == False)
    && (extractAccepts RuntimeFs == True)

||| Tag decode honesty + unknown reject.
public export
demoTagDecode : Bool
demoTagDecode =
  (map name (ofRuntimeTag 0) == Just "RUNTIME-FS")
    && (map name (ofRuntimeTag 1) == Just "RUNTIME-CLASSIC")
    && (map name (ofRuntimeTag 2) == Just "EDGE-RUNTIME")
    && (ofRuntimeTag 3 == Nothing)
    && (isValidRuntimeTag 0 == True)
    && (isValidRuntimeTag 3 == False)

||| Bundle demo: freestanding accept + stock reject + tag decode.
public export
demoRuntimeExtract : Bool
demoRuntimeExtract = demoClassicReject && demoTagDecode
