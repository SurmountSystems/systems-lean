/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TraitObjectVtable.lean bytes.
  Part 01 of the pinned source. Not occupancy name 50. Not mill 70.
  Greppable: liveTraitObjectVtableSourcePart01, PARSE-LIVE-TRAIT-OBJECT-VTABLE.
  Module: SystemsLean.HostFrontLiveTraitObjectVtableSource01
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTraitObjectVtable

/-- Dual-pinned live TraitObjectVtable.lean bytes, part 01.
    Greppable: liveTraitObjectVtableSourcePart01. -/
def liveTraitObjectVtableSourcePart01 : String := r#"/-
  SYSTEMS_LEAN_HOST -- trait-object vtable layout dual-pin
  (first pin: fat ScalarPair + header drop/size/align;
  second pin: slot 3 Method + rustc_abi pointer;
  third pin: TraitVPtr + rustc_abi pointer;
  fourth pin: Vacant + rustc_abi pointer;
  fifth pin: slot 4 second Method + rustc_abi pointer;
  sixth pin: slot 5 third Method + rustc_abi pointer;
  seventh pin: slot 6 fourth Method + rustc_abi pointer;
  eighth pin: slot 7 fifth Method + rustc_abi pointer;
  ninth pin: slot 8 sixth Method + rustc_abi pointer;
  tenth pin: slot 9 seventh Method + rustc_abi pointer;
  eleventh pin: slot 10 eighth Method + rustc_abi pointer;
  twelfth pin: slot 11 ninth Method + rustc_abi pointer;
  thirteenth pin: slot 12 tenth Method + rustc_abi pointer;
  fourteenth pin: slot 13 eleventh Method + rustc_abi pointer;
  fifteenth pin: slot 14 twelfth Method + rustc_abi pointer;
  sixteenth pin: slot 15 thirteenth Method + rustc_abi pointer;
  seventeenth pin: slot 16 fourteenth Method + rustc_abi pointer;
  eighteenth pin: slot 17 fifteenth Method + rustc_abi pointer;
  nineteenth pin: slot 18 sixteenth Method + rustc_abi pointer;
  twentieth pin: slot 19 seventeenth Method + rustc_abi pointer;
  twenty-first pin: slot 20 eighteenth Method + rustc_abi pointer;
  twenty-second pin: slot 21 nineteenth Method + rustc_abi pointer;
  twenty-third pin: slot 22 twentieth Method + rustc_abi pointer;
  twenty-fourth pin: slot 23 twenty-first Method + rustc_abi pointer;
  twenty-fifth pin: slot 24 twenty-second Method + rustc_abi pointer;
  twenty-sixth pin: slot 25 twenty-third Method + rustc_abi pointer;
  twenty-seventh pin: slot 26 twenty-fourth Method + rustc_abi pointer;
  twenty-eighth pin: slot 27 twenty-fifth Method + rustc_abi pointer;
  twenty-ninth pin: slot 28 twenty-sixth Method + rustc_abi pointer;
  thirtieth pin: slot 29 twenty-seventh Method + rustc_abi pointer;
  thirty-first pin: slot 30 twenty-eighth Method + rustc_abi pointer;
  thirty-second pin: slot 31 twenty-ninth Method + rustc_abi pointer;
  thirty-third pin: slot 32 thirtieth Method + rustc_abi pointer;
  thirty-fourth pin: slot 33 thirty-first Method + rustc_abi pointer;
  thirty-fifth pin: slot 34 thirty-second Method + rustc_abi pointer;
  thirty-sixth pin: slot 35 thirty-third Method + rustc_abi pointer;
  thirty-seventh pin: slot 36 thirty-fourth Method + rustc_abi pointer;
  thirty-eighth pin: slot 37 thirty-fifth Method + rustc_abi pointer;
  thirty-ninth pin: slot 38 thirty-sixth Method + rustc_abi pointer;
  fortieth pin: slot 39 thirty-seventh Method + rustc_abi pointer;
  forty-first pin: slot 40 thirty-eighth Method + rustc_abi pointer;
  forty-second pin: slot 41 thirty-ninth Method + rustc_abi pointer;
  forty-third pin: slot 42 fortieth Method + rustc_abi pointer;
  forty-fourth pin: slot 43 forty-first Method + rustc_abi pointer;
  forty-fifth pin: slot 44 forty-second Method + rustc_abi pointer;
  forty-sixth pin: slot 45 forty-third Method + rustc_abi pointer;
  forty-seventh pin: slot 46 forty-fourth Method + rustc_abi pointer;
  forty-eighth pin: slot 47 forty-fifth Method + rustc_abi pointer;
  forty-ninth pin: slot 48 forty-sixth Method + rustc_abi pointer;
  fiftieth pin: slot 49 forty-seventh Method + rustc_abi pointer;
  fifty-first pin: slot 50 forty-eighth Method + rustc_abi pointer;
  fifty-second pin: slot 51 forty-ninth Method + rustc_abi pointer;
  fifty-third pin: slot 52 fiftieth Method + rustc_abi pointer;
  fifty-fourth pin: slot 53 fifty-first Method + rustc_abi pointer;
  fifty-fifth pin: slot 54 fifty-second Method + rustc_abi pointer;
  fifty-sixth pin: slot 55 fifty-third Method + rustc_abi pointer;
  fifty-seventh pin: slot 56 fifty-fourth Method + rustc_abi pointer;
  fifty-eighth pin: slot 57 fifty-fifth Method + rustc_abi pointer;
  fifty-ninth pin: slot 58 fifty-sixth Method + rustc_abi pointer;
  sixtieth pin: slot 59 fifty-seventh Method + rustc_abi pointer;
  sixty-first pin: slot 60 fifty-eighth Method + rustc_abi pointer;
  sixty-second pin: slot 61 fifty-ninth Method + rustc_abi pointer;
  sixty-third pin: slot 62 sixtieth Method + rustc_abi pointer;
  sixty-fourth pin: slot 63 sixty-first Method + rustc_abi pointer;
  sixty-fifth pin: slot 64 sixty-second Method + rustc_abi pointer;
  sixty-sixth pin: slot 65 sixty-third Method + rustc_abi pointer;
  sixty-seventh pin: slot 66 sixty-fourth Method + rustc_abi pointer;
  sixty-eighth pin: slot 67 sixty-fifth Method + rustc_abi pointer;
  sixty-ninth pin: slot 68 sixty-sixth Method + rustc_abi pointer;
  seventieth pin: slot 69 sixty-seventh Method + rustc_abi pointer;
  seventy-first pin: slot 70 sixty-eighth Method + rustc_abi pointer;
  seventy-second pin: slot 71 sixty-ninth Method + rustc_abi pointer;
  seventy-third pin: slot 72 seventieth Method + rustc_abi pointer;
  seventy-fourth pin: slot 73 seventy-first Method + rustc_abi pointer;
  seventy-fifth pin: slot 74 seventy-second Method + rustc_abi pointer;
  seventy-sixth pin: slot 75 seventy-third Method + rustc_abi pointer;
  seventy-seventh pin: slot 76 seventy-fourth Method + rustc_abi pointer;
  seventy-eighth pin: slot 77 seventy-fifth Method + rustc_abi pointer;
  seventy-ninth pin: slot 78 seventy-sixth Method + rustc_abi pointer;
  eightieth pin: slot 79 seventy-seventh Method + rustc_abi pointer;
  eighty-first pin: slot 80 seventy-eighth Method + rustc_abi pointer;
  eighty-second pin: slot 81 seventy-ninth Method + rustc_abi pointer;
  eighty-third pin: slot 82 eightieth Method + rustc_abi pointer;
  eighty-fourth pin: slot 83 eighty-first Method + rustc_abi pointer;
  eighty-fifth pin: slot 84 eighty-second Method + rustc_abi pointer;
  eighty-sixth pin: slot 85 eighty-third Method + rustc_abi pointer;
  eighty-seventh pin: slot 86 eighty-fourth Method + rustc_abi pointer;
  eighty-eighth pin: slot 87 eighty-fifth Method + rustc_abi pointer;
  eighty-ninth pin: slot 88 eighty-sixth Method + rustc_abi pointer;
  ninetieth pin: slot 89 eighty-seventh Method + rustc_abi pointer;
  ninety-first pin: slot 90 eighty-eighth Method + rustc_abi pointer;
  ninety-second pin: slot 91 eighty-ninth Method + rustc_abi pointer;
  ninety-third pin: slot 92 ninetieth Method + rustc_abi pointer;
  ninety-fourth pin: slot 93 ninety-first Method + rustc_abi pointer;
  ninety-fifth pin: slot 94 ninety-second Method + rustc_abi pointer;
  ninety-sixth pin: slot 95 ninety-third Method + rustc_abi pointer;
  ninety-seventh pin: slot 96 ninety-fourth Method + rustc_abi pointer;
  ninety-eighth pin: slot 97 ninety-fifth Method + rustc_abi pointer;
  ninety-ninth pin: slot 98 ninety-sixth Method + rustc_abi pointer;
  hundredth pin: slot 99 ninety-seventh Method + rustc_abi pointer;
  hundred-first pin: slot 100 ninety-eighth Method + rustc_abi pointer;
  hundred-second pin: slot 101 ninety-ninth Method + rustc_abi pointer;
  hundred-third pin: slot 102 one-hundredth Method + rustc_abi pointer;
  hundred-fourth pin: slot 103 one-hundred-first Method + rustc_abi pointer;
  hundred-fifth pin: slot 104 one-hundred-second Method + rustc_abi pointer;
  hundred-sixth pin: slot 105 one-hundred-third Method + rustc_abi pointer;
  hundred-seventh pin: slot 106 one-hundred-fourth Method + rustc_abi pointer;
  hundred-eighth pin: slot 107 one-hundred-fifth Method + rustc_abi pointer;
  hundred-ninth pin: slot 108 one-hundred-sixth Method + rustc_abi pointer;
  hundred-tenth pin: slot 109 one-hundred-seventh Method + rustc_abi pointer;
  hundred-eleventh pin: slot 110 one-hundred-eighth Method + rustc_abi pointer;
  hundred-twelfth pin: slot 111 one-hundred-ninth Method + rustc_abi pointer;
  hundred-thirteenth pin: slot 112 one-hundred-tenth Method + rustc_abi pointer;
  hundred-fourteenth pin: slot 113 one-hundred-eleventh Method + rustc_abi pointer;
  hundred-fifteenth pin: slot 114 one-hundred-twelfth Method + rustc_abi pointer;
  hundred-sixteenth pin: slot 115 one-hundred-thirteenth Method + rustc_abi pointer;
  hundred-seventeenth pin: slot 116 one-hundred-fourteenth Method + rustc_abi pointer;
  hundred-eighteenth pin: slot 117 one-hundred-fifteenth Method + rustc_abi pointer;
  hundred-nineteenth pin: slot 118 one-hundred-sixteenth Method + rustc_abi pointer;
  hundred-twentieth pin: slot 119 one-hundred-seventeenth Method + rustc_abi pointer;
  hundred-twenty-first pin: slot 120 one-hundred-eighteenth Method + rustc_abi pointer;
  hundred-twenty-second pin: slot 121 one-hundred-nineteenth Method + rustc_abi pointer;
  hundred-twenty-third pin: slot 122 one-hundred-twentieth Method + rustc_abi pointer;
  hundred-twenty-fourth pin: slot 123 one-hundred-twenty-first Method + rustc_abi pointer;
  hundred-twenty-fifth pin: slot 124 one-hundred-twenty-second Method + rustc_abi pointer;
  hundred-twenty-sixth pin: slot 125 one-hundred-twenty-third Method + rustc_abi pointer;
  hundred-twenty-seventh pin: slot 126 one-hundred-twenty-fourth Method + rustc_abi pointer;
  hundred-twenty-eighth pin: slot 127 one-hundred-twenty-fifth Method + rustc_abi pointer;
  hundred-twenty-ninth pin: slot 128 one-hundred-twenty-sixth Method + rustc_abi pointer;
  hundred-thirtieth pin: slot 129 one-hundred-twenty-seventh Method + rustc_abi pointer;
  hundred-thirty-first pin: slot 130 one-hundred-twenty-eighth Method + rustc_abi pointer).
  Host model of rustc dyn Trait on x86_64-unknown-linux-gnu:
  two-pointer fat record (data + vtable); COMMON_VTABLE_ENTRIES then
  Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Vacant / TraitVPtr. Vacant is rustc_middle VtblEntry for a
  vtable-safe method whose predicates do not hold (impossible bounds);
  rustc_middle leaves the pointer-sized slot Uninit (continue).
  LLVM IR is the Rust-compatible surface. rustc_abi is the check.
  Not product Rust under src/. Not FullBackend. Not FullHost. Not occupancy 50.
  Greppable: SYSTEMS_LEAN_HOST, HOST-TRAIT-OBJECT-VTABLE,
  SLAKE_TRAIT_OBJECT_VTABLE_V0, TRAIT-OBJECT-VTABLE-IR, rustc_abi,
  ScalarPair, COMMON_VTABLE_ENTRIES, x86_64-unknown-linux-gnu,
  drop_in_place, TraitObjectRecord, TraitVPtr, Vacant, VtblEntry::Vacant,
  trait-object-vtable.ll, traitObjectVtableIrPackage, HOST-TRAIT-OBJECT-FAT,
  TraitObjectFat, SKELETON. Module: SystemsLean.TraitObjectVtable
  Checkable writer: just llvm-trait-object-vtable (lean --run; no mill; no lake).
-/

namespace SystemsLean.TraitObjectVtable

/-! ### HOST-TRAIT-OBJECT-VTABLE / SLAKE_TRAIT_OBJECT_VTABLE_V0

  Dual-pin plus named LLVM IR fixture (not FullBackend). Fat pointer is
  BackendRepr::ScalarPair of two pointers (data, then vtable). Header is
  COMMON_VTABLE_ENTRIES: drop, size, align. Slot 3 is VtblEntry::Method
  (method0). Slot 4 is the second VtblEntry::Method (method1). Slot 5 is
  the third VtblEntry::Method (method2). Slot 6 is the fourth
  VtblEntry::Method (method3). Slot 7 is the fifth
  VtblEntry::Method (method4). Slot 8 is the sixth
  VtblEntry::Method (method5). Slot 9 is the seventh
  VtblEntry::Method (method6). Slot 10 is the eighth
  VtblEntry::Method (method7). Slot 11 is the ninth
  VtblEntry::Method (method8). Slot 12 is the tenth
  VtblEntry::Method (method9). Slot 13 is the eleventh
  VtblEntry::Method (method10). Slot 14 is the twelfth
  VtblEntry::Method (method11). Slot 15 is the thirteenth
  VtblEntry::Method (method12). Slot 16 is the fourteenth
  VtblEntry::Method (method13). Slot 17 is the fifteenth
  VtblEntry::Method (method14). Slot 18 is the sixteenth
  VtblEntry::Method (method15). Slot 19 is the seventeenth
  VtblEntry::Method (method16). Slot 20 is the eighteenth
  VtblEntry::Method (method17). Slot 21 is the nineteenth
  VtblEntry::Method (method18). Slot 22 is the twentieth
  VtblEntry::Method (method19). Slot 23 is the twenty-first
  VtblEntry::Method (method20). Slot 24 is the twenty-second
  VtblEntry::Method (method21). Slot 25 is the twenty-third
  VtblEntry::Method (method22). Slot 26 is the twenty-fourth
  VtblEntry::Method (method23). Slot 27 is the twenty-fifth
  VtblEntry::Method (method24). Slot 28 is the twenty-sixth
  VtblEntry::Method (method25). Slot 29 is the twenty-seventh
  VtblEntry::Method (method26). Slot 30 is the twenty-eighth
  VtblEntry::Method (method27). Slot 31 is the twenty-ninth
  VtblEntry::Method (method28). Slot 32 is the thirtieth
  VtblEntry::Method (method29). Slot 33 is the thirty-first
  VtblEntry::Method (method30). Slot 34 is the thirty-second
  VtblEntry::Method (method31). Slot 35 is the thirty-third
  VtblEntry::Method (method32). Slot 36 is the thirty-fourth
  VtblEntry::Method (method33). Slot 37 is the thirty-fifth
  VtblEntry::Method (method34). Slot 38 is the thirty-sixth
  VtblEntry::Method (method35). Slot 39 is the thirty-seventh
  VtblEntry::Method (method36). Slot 40 is the thirty-eighth
  VtblEntry::Method (method37). Slot 41 is the thirty-ninth
  VtblEntry::Method (method38). Slot 42 is the fortieth
  VtblEntry::Method (method39). Slot 43 is the forty-first
  VtblEntry::Method (method40). Slot 44 is the forty-second
  VtblEntry::Method (method41). Slot 45 is the forty-third
  VtblEntry::Method (method42). Slot 46 is the forty-fourth
  VtblEntry::Method (method43). Slot 47 is the forty-fifth
  VtblEntry::Method (method44). Slot 48 is the forty-sixth
  VtblEntry::Method (method45). Slot 49 is the forty-seventh
  VtblEntry::Method (method46). Slot 50 is the forty-eighth
  VtblEntry::Method (method47). Slot 51 is the forty-ninth
  VtblEntry::Method (method48). Slot 52 is the fiftieth
  VtblEntry::Method (method49). Slot 53 is the fifty-first
  VtblEntry::Method (method50). Slot 54 is the fifty-second
  VtblEntry::Method (method51). Slot 55 is the fifty-third
  VtblEntry::Method (method52). Slot 56 is the fifty-fourth
  VtblEntry::Method (method53). Slot 57 is the fifty-fifth
  VtblEntry::Method (method54). Slot 58 is the fifty-sixth
  VtblEntry::Method (method55). Slot 59 is the fifty-seventh
  VtblEntry::Method (method56). Slot 60 is the fifty-eighth
  VtblEntry::Method (method57). Slot 61 is the fifty-ninth
  VtblEntry::Method (method58). Slot 62 is the sixtieth
  VtblEntry::Method (method59). Slot 63 is the sixty-first
  VtblEntry::Method (method60). Slot 64 is the sixty-second
  VtblEntry::Method (method61). Slot 65 is the sixty-third
  VtblEntry::Method (method62). Slot 66 is the sixty-fourth
  VtblEntry::Method (method63). Slot 67 is the sixty-fifth
  VtblEntry::Method (method64). Slot 68 is the sixty-sixth
  VtblEntry::Method (method65). Slot 69 is the sixty-seventh
  VtblEntry::Method (method66). Slot 70 is the sixty-eighth
  VtblEntry::Method (method67). Slot 71 is the sixty-ninth
  VtblEntry::Method (method68). Slot 72 is the seventieth
  VtblEntry::Method (method69). Slot 73 is the seventy-first
  VtblEntry::Method (method70). Slot 74 is the seventy-second
  VtblEntry::Method (method71). Slot 75 is the seventy-third
  VtblEntry::Method (method72). Slot 76 is the seventy-fourth
  VtblEntry::Method (method73). Slot 77 is the seventy-fifth
  VtblEntry::Method (method74). Slot 78 is the seventy-sixth
  VtblEntry::Method (method75). Slot 79 is the seventy-seventh
  VtblEntry::Method (method76). Slot 80 is the seventy-eighth
  VtblEntry::Method (method77). Slot 81 is the seventy-ninth
  VtblEntry::Method (method78). Slot 82 is the eightieth
  VtblEntry::Method (method79). Slot 83 is the eighty-first
  VtblEntry::Method (method80). Slot 84 is the eighty-second
  VtblEntry::Method (method81). Slot 85 is the eighty-third
  VtblEntry::Method (method82). Slot 86 is the eighty-fourth
  VtblEntry::Method (method83). Slot 87 is the eighty-fifth
  VtblEntry::Method (method84). Slot 88 is the eighty-sixth
  VtblEntry::Method (method85). Slot 89 is the eighty-seventh
  VtblEntry::Method (method86). Slot 90 is the eighty-eighth
  VtblEntry::Method (method87). Slot 91 is the eighty-ninth
  VtblEntry::Method (method88). Slot 92 is the ninetieth
  VtblEntry::Method (method89). Slot 93 is the ninety-first
  VtblEntry::Method (method90). Slot 94 is the ninety-second
  VtblEntry::Method (method91). Slot 95 is the ninety-third
  VtblEntry::Method (method92). Slot 96 is the ninety-fourth
  VtblEntry::Method (method93). Slot 97 is the ninety-fifth
  VtblEntry::Method (method94). Slot 98 is the ninety-sixth
  VtblEntry::Method (method95). Slot 99 is the ninety-seventh
  VtblEntry::Method (method96). Slot 100 is the ninety-eighth
  VtblEntry::Method (method97). Slot 101 is the ninety-ninth
  VtblEntry::Method (method98). Slot 102 is the one-hundredth
  VtblEntry::Method (method99). Slot 103 is the one-hundred-first
  VtblEntry::Method (method100). Slot 104 is the one-hundred-second
  VtblEntry::Method (method101). Slot 105 is the one-hundred-third
  VtblEntry::Method (method102). Slot 106 is the one-hundred-fourth
  VtblEntry::Method (method103). Slot 106 is the one-hundred-fourth
  VtblEntry::Method (method104). Slot 107 is the one-hundred-fifth
  VtblEntry::Method (method105). Slot 108 is the one-hundred-sixth
  VtblEntry::Method (method106). Slot 109 is the one-hundred-seventh
  VtblEntry::Method (method107). Slot 110 is the one-hundred-eighth
  VtblEntry::Method (method108). Slot 111 is the one-hundred-ninth
  VtblEntry::Method (method109). Slot 112 is the one-hundred-tenth
  VtblEntry::Method (method110). Slot 113 is the one-hundred-eleventh
  VtblEntry::Method (method111). Slot 114 is the one-hundred-twelfth
  VtblEntry::Method (method112). Slot 115 is the one-hundred-thirteenth
  VtblEntry::Method (method113). Slot 116 is the one-hundred-fourteenth
  VtblEntry::Method (method114). Slot 117 is the one-hundred-fifteenth
  VtblEntry::Method (method115). Slot 118 is the one-hundred-sixteenth
  VtblEntry::Method (method116). Slot 119 is the one-hundred-seventeenth
  VtblEntry::Method (method117). Slot 120 is the one-hundred-eighteenth
  VtblEntry::Method (method118). Slot 121 is the one-hundred-nineteenth
  VtblEntry::Method (method119). Slot 122 is the one-hundred-twentieth
  VtblEntry::Method (method120). Slot 123 is the one-hundred-twenty-first
  VtblEntry::Method (method121). Slot 124 is the one-hundred-twenty-second
  VtblEntry::Method (method122). Slot 125 is the one-hundred-twenty-third
  VtblEntry::Method (method123). Slot 126 is the one-hundred-twenty-fourth
  VtblEntry::Method (method124). Slot 127 is the one-hundred-twenty-fifth
  VtblEntry::Method (method125). Slot 128 is the one-hundred-twenty-sixth
  VtblEntry::Method (method126). Slot 129 is the one-hundred-twenty-seventh
  VtblEntry::Method (method127). Slot 130 is the one-hundred-twenty-eighth
  Slot 131 is VtblEntry::Vacant
  (vtable-safe method, impossible predicates; rustc_middle continue /
  Uninit; fixture reserved ptr null). Slot 132 is VtblEntry::TraitVPtr to a
  header-only supertrait vtable. Printer SSOT is
  traitObjectVtableIrPackage. Writer: just llvm-trait-object-vtable.
  Production emit claimed stays false.
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_TRAIT_OBJECT_VTABLE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-TRAIT-OBJECT-VTABLE"

/-- Greppable host-originated emit token (fat pointer plus ordered slots).
    Dest and printer must prove emit walks TraitObjectFat, not soup.
    Greppable: HOST-TRAIT-OBJECT-FAT. -/
def hostOriginId : String := "HOST-TRAIT-OBJECT-FAT"

/-- Surface id (same durable token). -/
def surfaceId : String := "HOST-TRAIT-OBJECT-VTABLE"

/-- Residual Name.
    Greppable: traitObjectVtableIrName, TRAIT-OBJECT-VTABLE-IR. -/
def traitObjectVtableIrName : String := "TRAIT-OBJECT-VTABLE-IR"

/-- Named fat-pointer record id.
    Greppable: traitObjectRecordName, TraitObjectRecord. -/
def traitObjectRecordName : String := "TraitObjectRecord"

/-- Named target (matches layout fixture and foreign bands).
    Greppable: foreignLinkTargetTriple, x86_64-unknown-linux-gnu. -/
def foreignLinkTargetTriple : String := "x86_64-unknown-linux-gnu"

/-- rustc_abi Size::align_to on power-of-two aligns. -/
def alignUp (n alignBytes : Nat) : Nat :=
  if alignBytes == 0 then
    n
  else
    let mask := alignBytes - 1
    ((n + mask) / alignBytes) * alignBytes

/-- Pointer size on this target.
    Cite: ref/rust/compiler/rustc_abi/src/lib.rs TargetDataLayout
    default pointer_size Size::from_bits(64). -/
def pointerSizeBytes : Nat := 8

/-- Pointer align on this target.
    Cite: rustc_abi TargetDataLayout default pointer_align 64 bits. -/
def pointerAlignBytes : Nat := 8

/-- usize size equals pointer size on this target (vtable size/align slots). -/
def usizeSizeBytes : Nat := pointerSizeBytes

/-- usize align equals pointer align on this target. -/
def usizeAlignBytes : Nat := pointerAlignBytes

/-- Field data: first ScalarPair scalar (payload pointer). Offset 0. -/
def dataPtrOffset : Nat := 0

def dataPtrSizeBytes : Nat := pointerSizeBytes

def dataPtrAlignBytes : Nat := pointerAlignBytes

/-- Field vtable: second ScalarPair scalar.
    Cite: rustc_abi BackendRepr::ScalarPair; b_offset is size of a
    rounded up to align of b (layout/simple.rs scalar_pair). -/
def vtablePtrOffset : Nat :=
  alignUp (dataPtrOffset + dataPtrSizeBytes) pointerAlignBytes

def vtablePtrSizeBytes : Nat := pointerSizeBytes

/-- Fat-pointer ABI align is max of the two pointer aligns. -/
def traitObjectAlignBytes : Nat :=
  max dataPtrAlignBytes pointerAlignBytes

/-- End of last field before trailing pad. -/
def traitObjectEndBytes : Nat := vtablePtrOffset + vtablePtrSizeBytes

/-- Size rounded up to struct align (rustc_abi Size::align_to). -/
def traitObjectSizeBytes : Nat :=
  alignUp traitObjectEndBytes traitObjectAlignBytes

/-- Trailing pad (two pointers already 16/8; pad 0 on this target). -/
def traitObjectPadBytes : Nat :=
  traitObjectSizeBytes - traitObjectEndBytes

/-- Pointer count in the fat record (data + vtable). -/
def traitObjectPointerCount : Nat := 2

/-- Vtable header slot kinds (COMMON_VTABLE_ENTRIES order). -/
inductive VtableSlotKind where
  | dropInPlace
  | size
  | align
  | method
  | vacant
  | traitVPtr
  deriving DecidableEq, Repr

/-- Header slot kind at COMMON_VTABLE_ENTRIES index i. -/
def vtableHeaderSlotKind (i : Nat) : Option VtableSlotKind :=
  match i with
  | 0 => some VtableSlotKind.dropInPlace
  | 1 => some VtableSlotKind.size
  | 2 => some VtableSlotKind.align
  | _ => none

/-- COMMON_VTABLE_ENTRIES_DROPINPLACE = 0.
    Cite: ref/rust/compiler/rustc_middle/src/ty/vtable.rs
    VtblEntry::MetadataDropInPlace. -/
def vtableSlotDropInPlace : Nat := 0

/-- COMMON_VTABLE_ENTRIES_SIZE = 1.
    Cite: rustc_middle ty/vtable.rs MetadataSize (usize). -/
def vtableSlotSize : Nat := 1

/-- COMMON_VTABLE_ENTRIES_ALIGN = 2.
    Cite: rustc_middle ty/vtable.rs MetadataAlign (usize). -/
def vtableSlotAlign : Nat := 2

/-- Header length: drop, size, align (COMMON_VTABLE_ENTRIES.len() = 3). -/
def vtableHeaderSlotCount : Nat := 3

/-- First method slot index (after header). -/
def vtableFirstMethodSlot : Nat := vtableHeaderSlotCount

/-- Default fixture: one hundred twenty-eight dispatchable methods after the header. -/
def vtableFixtureMethodCount : Nat := 128

/-- Second Method slot index (after method0).
    Greppable: vtableSecondMethodSlot, VtblEntry::Method. -/
def vtableSecondMethodSlot : Nat := vtableFirstMethodSlot + 1

/-- Third Method slot index (after method1).
    Greppable: vtableThirdMethodSlot, VtblEntry::Method. -/
def vtableThirdMethodSlot : Nat := vtableSecondMethodSlot + 1

/-- Fourth Method slot index (after method2).
    Greppable: vtableFourthMethodSlot, VtblEntry::Method. -/
def vtableFourthMethodSlot : Nat := vtableThirdMethodSlot + 1

/-- Fifth Method slot index (after method3).
    Greppable: vtableFifthMethodSlot, VtblEntry::Method. -/
def vtableFifthMethodSlot : Nat := vtableFourthMethodSlot + 1

/-- Sixth Method slot index (after method4).
    Greppable: vtableSixthMethodSlot, VtblEntry::Method. -/
def vtableSixthMethodSlot : Nat := vtableFifthMethodSlot + 1

/-- Seventh Method slot index (after method5).
    Greppable: vtableSeventhMethodSlot, VtblEntry::Method. -/
def vtableSeventhMethodSlot : Nat := vtableSixthMethodSlot + 1

/-- Eighth Method slot index (after method6).
    Greppable: vtableEighthMethodSlot, VtblEntry::Method. -/
def vtableEighthMethodSlot : Nat := vtableSeventhMethodSlot + 1

/-- Ninth Method slot index (after method7).
    Greppable: vtableNinthMethodSlot, VtblEntry::Method. -/
def vtableNinthMethodSlot : Nat := vtableEighthMethodSlot + 1

/-- Tenth Method slot index (after method8).
    Greppable: vtableTenthMethodSlot, VtblEntry::Method. -/
def vtableTenthMethodSlot : Nat := vtableNinthMethodSlot + 1

/-- Eleventh Method slot index (after method9).
    Greppable: vtableEleventhMethodSlot, VtblEntry::Method. -/
def vtableEleventhMethodSlot : Nat := vtableTenthMethodSlot + 1

/-- Twelfth Method slot index (after method10).
    Greppable: vtableTwelfthMethodSlot, VtblEntry::Method. -/
def vtableTwelfthMethodSlot : Nat := vtableEleventhMethodSlot + 1

/-- Thirteenth Method slot index (after method11).
    Greppable: vtableThirteenthMethodSlot, VtblEntry::Method. -/
def vtableThirteenthMethodSlot : Nat := vtableTwelfthMethodSlot + 1

/-- Fourteenth Method slot index (after method12).
    Greppable: vtableFourteenthMethodSlot, VtblEntry::Method. -/
def vtableFourteenthMethodSlot : Nat := vtableThirteenthMethodSlot + 1

/-- Fifteenth Method slot index (after method13).
    Greppable: vtableFifteenthMethodSlot, VtblEntry::Method. -/
def vtableFifteenthMethodSlot : Nat := vtableFourteenthMethodSlot + 1

/-- Sixteenth Method slot index (after method14).
    Greppable: vtableSixteenthMethodSlot, VtblEntry::Method. -/
def vtableSixteenthMethodSlot : Nat := vtableFifteenthMethodSlot + 1

/-- Seventeenth Method slot index (after method15).
    Greppable: vtableSeventeenthMethodSlot, VtblEntry::Method. -/
def vtableSeventeenthMethodSlot : Nat := vtableSixteenthMethodSlot + 1

/-- Eighteenth Method slot index (after method16).
    Greppable: vtableEighteenthMethodSlot, VtblEntry::Method. -/
def vtableEighteenthMethodSlot : Nat := vtableSeventeenthMethodSlot + 1

/-- Nineteenth Method slot index (after method17).
    Greppable: vtableNineteenthMethodSlot, VtblEntry::Method. -/
def vtableNineteenthMethodSlot : Nat := vtableEighteenthMethodSlot + 1

/-- Twentieth Method slot index (after method18).
    Greppable: vtableTwentiethMethodSlot, VtblEntry::Method. -/
def vtableTwentiethMethodSlot : Nat := vtableNineteenthMethodSlot + 1

/-- Twenty-first Method slot index (after method19).
    Greppable: vtableTwentyFirstMethodSlot, VtblEntry::Method. -/
def vtableTwentyFirstMethodSlot : Nat := vtableTwentiethMethodSlot + 1

/-- Twenty-second Method slot index (after method20).
    Greppable: vtableTwentySecondMethodSlot, VtblEntry::Method. -/
def vtableTwentySecondMethodSlot : Nat := vtableTwentyFirstMethodSlot + 1

/-- Twenty-third Method slot index (after method21).
    Greppable: vtableTwentyThirdMethodSlot, VtblEntry::Method. -/
def vtableTwentyThirdMethodSlot : Nat := vtableTwentySecondMethodSlot + 1

/-- Twenty-fourth Method slot index (after method22).
    Greppable: vtableTwentyFourthMethodSlot, VtblEntry::Method. -/
def vtableTwentyFourthMethodSlot : Nat := vtableTwentyThirdMethodSlot + 1

/-- Twenty-fifth Method slot index (after method23).
    Greppable: vtableTwentyFifthMethodSlot, VtblEntry::Method. -/
def vtableTwentyFifthMethodSlot : Nat := vtableTwentyFourthMethodSlot + 1

/-- Twenty-sixth Method slot index (after method24).
    Greppable: vtableTwentySixthMethodSlot, VtblEntry::Method. -/
def vtableTwentySixthMethodSlot : Nat := vtableTwentyFifthMethodSlot + 1

/-- Twenty-seventh Method slot index (after method25).
    Greppable: vtableTwentySeventhMethodSlot, VtblEntry::Method. -/
def vtableTwentySeventhMethodSlot : Nat := vtableTwentySixthMethodSlot + 1

/-- Twenty-eighth Method slot index (after method26).
    Greppable: vtableTwentyEighthMethodSlot, VtblEntry::Method. -/
def vtableTwentyEighthMethodSlot : Nat := vtableTwentySeventhMethodSlot + 1

/-- Twenty-ninth Method slot index (after method27).
    Greppable: vtableTwentyNinthMethodSlot, VtblEntry::Method. -/
def vtableTwentyNinthMethodSlot : Nat := vtableTwentyEighthMethodSlot + 1

/-- Thirtieth Method slot index (after method28).
    Greppable: vtableThirtiethMethodSlot, VtblEntry::Method. -/
def vtableThirtiethMethodSlot : Nat := vtableTwentyNinthMethodSlot + 1

/-- Thirty-first Method slot index (after method29).
    Greppable: vtableThirtyFirstMethodSlot, VtblEntry::Method. -/
def vtableThirtyFirstMethodSlot : Nat := vtableThirtiethMethodSlot + 1

/-- Thirty-second Method slot index (after method30).
    Greppable: vtableThirtySecondMethodSlot, VtblEntry::Method. -/
def vtableThirtySecondMethodSlot : Nat := vtableThirtyFirstMethodSlot + 1

/-- Thirty-third Method slot index (after method31).
    Greppable: vtableThirtyThirdMethodSlot, VtblEntry::Method. -/
def vtableThirtyThirdMethodSlot : Nat := vtableThirtySecondMethodSlot + 1

/-- Thirty-fourth Method slot index (after method32).
    Greppable: vtableThirtyFourthMethodSlot, VtblEntry::Method. -/
def vtableThirtyFourthMethodSlot : Nat := vtableThirtyThirdMethodSlot + 1

/-- Thirty-fifth Method slot index (after method33).
    Greppable: vtableThirtyFifthMethodSlot, VtblEntry::Method. -/
def vtableThirtyFifthMethodSlot : Nat := vtableThirtyFourthMethodSlot + 1

/-- Thirty-sixth Method slot index (after method34).
    Greppable: vtableThirtySixthMethodSlot, VtblEntry::Method. -/
def vtableThirtySixthMethodSlot : Nat := vtableThirtyFifthMethodSlot + 1

/-- Thirty-seventh Method slot index (after method35).
    Greppable: vtableThirtySeventhMethodSlot, VtblEntry::Method. -/
def vtableThirtySeventhMethodSlot : Nat := vtableThirtySixthMethodSlot + 1

/-- Thirty-eighth Method slot index (after method36).
    Greppable: vtableThirtyEighthMethodSlot, VtblEntry::Method. -/
def vtableThirtyEighthMethodSlot : Nat := vtableThirtySeventhMethodSlot + 1

/-- Thirty-ninth Method slot index (after method37).
    Greppable: vtableThirtyNinthMethodSlot, VtblEntry::Method. -/
def vtableThirtyNinthMethodSlot : Nat := vtableThirtyEighthMethodSlot + 1

/-- Fortieth Method slot index (after method38).
    Greppable: vtableFortiethMethodSlot, VtblEntry::Method. -/
def vtableFortiethMethodSlot : Nat := vtableThirtyNinthMethodSlot + 1

/-- Forty-first Method slot index (after method39).
    Greppable: vtableFortyFirstMethodSlot, VtblEntry::Method. -/
def vtableFortyFirstMethodSlot : Nat := vtableFortiethMethodSlot + 1

/-- Forty-second Method slot index (after method40).
    Greppable: vtableFortySecondMethodSlot, VtblEntry::Method. -/
def vtableFortySecondMethodSlot : Nat := vtableFortyFirstMethodSlot + 1

/-- Forty-third Method slot index (after method41).
    Greppable: vtableFortyThirdMethodSlot, VtblEntry::Method. -/
def vtableFortyThirdMethodSlot : Nat := vtableFortySecondMethodSlot + 1

/-- Forty-fourth Method slot index (after method42).
    Greppable: vtableFortyFourthMethodSlot, VtblEntry::Method. -/
def vtableFortyFourthMethodSlot : Nat := vtableFortyThirdMethodSlot + 1

/-- Forty-fifth Method slot index (after method43).
    Greppable: vtableFortyFifthMethodSlot, VtblEntry::Method. -/
def vtableFortyFifthMethodSlot : Nat := vtableFortyFourthMethodSlot + 1

/-- Forty-sixth Method slot index (after method44).
    Greppable: vtableFortySixthMethodSlot, VtblEntry::Method. -/
def vtableFortySixthMethodSlot : Nat := vtableFortyFifthMethodSlot + 1

/-- Forty-seventh Method slot index (after method45).
    Greppable: vtableFortySeventhMethodSlot, VtblEntry::Method. -/
def vtableFortySeventhMethodSlot : Nat := vtableFortySixthMethodSlot + 1

/-- Forty-eighth Method slot index (after method46).
    Greppable: vtableFortyEighthMethodSlot, VtblEntry::Method. -/
def vtableFortyEighthMethodSlot : Nat := vtableFortySeventhMethodSlot + 1

/-- Forty-ninth Method slot index (after method47).
    Greppable: vtableFortyNinthMethodSlot, VtblEntry::Method. -/
def vtableFortyNinthMethodSlot : Nat := vtableFortyEighthMethodSlot + 1

/-- Fiftieth Method slot index (after method48).
    Greppable: vtableFiftiethMethodSlot, VtblEntry::Method. -/
def vtableFiftiethMethodSlot : Nat := vtableFortyNinthMethodSlot + 1

/-- Fifty-first Method slot index (after method49).
    Greppable: vtableFiftyFirstMethodSlot, VtblEntry::Method. -/
def vtableFiftyFirstMethodSlot : Nat := vtableFiftiethMethodSlot + 1

/-- Fifty-second Method slot index (after method50).
    Greppable: vtableFiftySecondMethodSlot, VtblEntry::Method. -/
def vtableFiftySecondMethodSlot : Nat := vtableFiftyFirstMethodSlot + 1

/-- Fifty-third Method slot index (after method51).
    Greppable: vtableFiftyThirdMethodSlot, VtblEntry::Method. -/
def vtableFiftyThirdMethodSlot : Nat := vtableFiftySecondMethodSlot + 1

/-- Fifty-fourth Method slot index (after method52).
    Greppable: vtableFiftyFourthMethodSlot, VtblEntry::Method. -/
def vtableFiftyFourthMethodSlot : Nat := vtableFiftyThirdMethodSlot + 1

/-- Fifty-fifth Method slot index (after method53).
    Greppable: vtableFiftyFifthMethodSlot, VtblEntry::Method. -/
def vtableFiftyFifthMethodSlot : Nat := vtableFiftyFourthMethodSlot + 1

/-- Fifty-sixth Method slot index (after method54).
    Greppable: vtableFiftySixthMethodSlot, VtblEntry::Method. -/
def vtableFiftySixthMethodSlot : Nat := vtableFiftyFifthMethodSlot + 1

/-- Fifty-seventh Method slot index (after method55).
    Greppable: vtableFiftySeventhMethodSlot, VtblEntry::Method. -/
def vtableFiftySeventhMethodSlot : Nat := vtableFiftySixthMethodSlot + 1

/-- Fifty-eighth Method slot index (after method56).
    Greppable: vtableFiftyEighthMethodSlot, VtblEntry::Method. -/
def vtableFiftyEighthMethodSlot : Nat := vtableFiftySeventhMethodSlot + 1

/-- Fifty-ninth Method slot index (after method57).
    Greppable: vtableFiftyNinthMethodSlot, VtblEntry::Method. -/
def vtableFiftyNinthMethodSlot : Nat := vtableFiftyEighthMethodSlot + 1

/-- Sixtieth Method slot index (after method58).
    Greppable: vtableSixtiethMethodSlot, VtblEntry::Method. -/
def vtableSixtiethMethodSlot : Nat := vtableFiftyNinthMethodSlot + 1

/-- Sixty-first Method slot index (after method59).
    Greppable: vtableSixtyFirstMethodSlot, VtblEntry::Method. -/
def vtableSixtyFirstMethodSlot : Nat := vtableSixtiethMethodSlot + 1

/-- Sixty-second Method slot index (after method60).
    Greppable: vtableSixtySecondMethodSlot, VtblEntry::Method. -/
def vtableSixtySecondMethodSlot : Nat := vtableSixtyFirstMethodSlot + 1

/-- Sixty-third Method slot index (after method61).
    Greppable: vtableSixtyThirdMethodSlot, VtblEntry::Method. -/
def vtableSixtyThirdMethodSlot : Nat := vtableSixtySecondMethodSlot + 1

/-- Sixty-fourth Method slot index (after method62).
    Greppable: vtableSixtyFourthMethodSlot, VtblEntry::Method. -/
def vtableSixtyFourthMethodSlot : Nat := vtableSixtyThirdMethodSlot + 1

/-- Sixty-fifth Method slot index (after method63).
    Greppable: vtableSixtyFifthMethodSlot, VtblEntry::Method. -/
def vtableSixtyFifthMethodSlot : Nat := vtableSixtyFourthMethodSlot + 1

/-- Sixty-sixth Method slot index (after method64).
    Greppable: vtableSixtySixthMethodSlot, VtblEntry::Method. -/
def vtableSixtySixthMethodSlot : Nat := vtableSixtyFifthMethodSlot + 1

/-- Sixty-seventh Method slot index (after method65).
    Greppable: vtableSixtySeventhMethodSlot, VtblEntry::Method. -/
def vtableSixtySeventhMethodSlot : Nat := vtableSixtySixthMethodSlot + 1

/-- Sixty-eighth Method slot index (after method66).
    Greppable: vtableSixtyEighthMethodSlot, VtblEntry::Method. -/
def vtableSixtyEighthMethodSlot : Nat := vtableSixtySeventhMethodSlot + 1

/-- Sixty-ninth Method slot index (after method67).
    Greppable: vtableSixtyNinthMethodSlot, VtblEntry::Method. -/
def vtableSixtyNinthMethodSlot : Nat := vtableSixtyEighthMethodSlot + 1

/-- Seventieth Method slot index (after method68).
    Greppable: vtableSeventiethMethodSlot, VtblEntry::Method. -/
def vtableSeventiethMethodSlot : Nat := vtableSixtyNinthMethodSlot + 1

/-- Seventy-first Method slot index (after method69).
    Greppable: vtableSeventyFirstMethodSlot, VtblEntry::Method. -/
def vtableSeventyFirstMethodSlot : Nat := vtableSeventiethMethodSlot + 1

/-- Seventy-second Method slot index (after method70).
    Greppable: vtableSeventySecondMethodSlot, VtblEntry::Method. -/
def vtableSeventySecondMethodSlot : Nat := vtableSeventyFirstMethodSlot + 1

/-- Seventy-third Method slot index (after method71).
    Greppable: vtableSeventyThirdMethodSlot, VtblEntry::Method. -/
def vtableSeventyThirdMethodSlot : Nat := vtableSeventySecondMethodSlot + 1
"#

end SystemsLean.HostFrontLiveTraitObjectVtable
