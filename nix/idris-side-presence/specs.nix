# SPDX-License-Identifier: Unlicense
# Data only: Idris-side dual required paths, honesty tokens, and banned jargon
# under examples/*.idr. Imported by ./default.nix.
# Former static mill lived in src/idris2/check.sh (Wave A pure Nix port).
{
  # Required dual artifacts (presence only; elaborator stays process glue).
  requiredFiles = [
    "src/idris2/multiplicity-map.md"
    "src/idris2/examples/ConsumeToken.idr"
    "src/idris2/examples/ErasedIndex.idr"
    "src/idris2/examples/UnrestrictedShare.idr"
    "src/idris2/examples/FailClosedGrade.idr"
    "src/idris2/examples/LinearPairSwap.idr"
    "src/idris2/examples/RuntimeExtract.idr"
    "src/idris2/examples/AffineDrop.idr"
    "src/idris2/examples/AffineOwn.idr"
    "src/idris2/examples/TRUST.md"
    "src/idris2/JOIN.md"
  ];

  # File content honesty tokens (all must appear; anyGroups optional).
  contentSpecs = [
    {
      rel = "src/idris2/examples/ConsumeToken.idr";
      all = [ "ConsumeToken" ];
    }
    {
      rel = "src/idris2/examples/ErasedIndex.idr";
      all = [ "ErasedIndex" ];
    }
    {
      rel = "src/idris2/examples/UnrestrictedShare.idr";
      all = [ "UnrestrictedShare" ];
    }
    {
      rel = "src/idris2/examples/FailClosedGrade.idr";
      all = [
        "FailClosedGrade"
        "FAIL-CLOSED-UNKNOWN-GRADE"
      ];
    }
    {
      rel = "src/idris2/examples/LinearPairSwap.idr";
      all = [
        "LinearPairSwap"
        "swapLin"
        "MULT-1"
      ];
    }
    {
      rel = "src/idris2/examples/RuntimeExtract.idr";
      all = [
        "RuntimeExtract"
        "RUNTIME-FS"
        "RUNTIME-CLASSIC"
        "EDGE-RUNTIME"
      ];
    }
    {
      rel = "src/idris2/examples/AffineDrop.idr";
      all = [
        "AffineDrop"
        "EDGE-AFFINE"
        "AFFINE-NOT-FIRST-CLASS"
        "dropAffine"
      ];
    }
    {
      rel = "src/idris2/examples/AffineOwn.idr";
      all = [
        "AffineOwn"
        "EDGE-AFFINE"
        "AFFINE-NOT-FIRST-CLASS"
        "PRODUCT-OWN"
        "useLeftDropRight"
      ];
    }
    {
      rel = "src/idris2/multiplicity-map.md";
      all = [
        "MULT-1"
        "MULT-0"
        "MULT-OMEGA"
        "ERASE-PROP"
        "EDGE-PROP"
        "FailClosedGrade"
        "LinearPairSwap"
        "RuntimeExtract"
        "AffineDrop"
        "AffineOwn"
      ];
    }
    {
      rel = "src/idris2/JOIN.md";
      all = [
        "ErasedIndex"
        "UnrestrictedShare"
        "FailClosedGrade"
        "LinearPairSwap"
        "RuntimeExtract"
        "AffineDrop"
        "AffineOwn"
      ];
    }
  ];

  # Banned jargon under novel Idris examples only.
  jargonWalkRoot = "src/idris2/examples";
  jargonWalkSkipDirs = [
    ".git"
    ".cache"
  ];
  jargonWalkExtensions = [ ".idr" ];
  # Case-folded substring ban (fail-closed; match systems-host-presence style).
  jargonForbidden = [
    "pole"
    "spine"
  ];
}
