/-
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

/-- Seventy-fourth Method slot index (after method72).
    Greppable: vtableSeventyFourthMethodSlot, VtblEntry::Method. -/
def vtableSeventyFourthMethodSlot : Nat := vtableSeventyThirdMethodSlot + 1

/-- Seventy-fifth Method slot index (after method73).
    Greppable: vtableSeventyFifthMethodSlot, VtblEntry::Method. -/
def vtableSeventyFifthMethodSlot : Nat := vtableSeventyFourthMethodSlot + 1

/-- Seventy-sixth Method slot index (after method74).
    Greppable: vtableSeventySixthMethodSlot, VtblEntry::Method. -/
def vtableSeventySixthMethodSlot : Nat := vtableSeventyFifthMethodSlot + 1

/-- Seventy-seventh Method slot index (after method75).
    Greppable: vtableSeventySeventhMethodSlot, VtblEntry::Method. -/
def vtableSeventySeventhMethodSlot : Nat := vtableSeventySixthMethodSlot + 1

/-- Seventy-eighth Method slot index (after method76).
    Greppable: vtableSeventyEighthMethodSlot, VtblEntry::Method. -/
def vtableSeventyEighthMethodSlot : Nat := vtableSeventySeventhMethodSlot + 1

/-- Seventy-ninth Method slot index (after method77).
    Greppable: vtableSeventyNinthMethodSlot, VtblEntry::Method. -/
def vtableSeventyNinthMethodSlot : Nat := vtableSeventyEighthMethodSlot + 1

/-- Eightieth Method slot index (after method78).
    Greppable: vtableEightiethMethodSlot, VtblEntry::Method. -/
def vtableEightiethMethodSlot : Nat := vtableSeventyNinthMethodSlot + 1

/-- Eighty-first Method slot index (after method79).
    Greppable: vtableEightyFirstMethodSlot, VtblEntry::Method. -/
def vtableEightyFirstMethodSlot : Nat := vtableEightiethMethodSlot + 1

/-- Eighty-second Method slot index (after method80).
    Greppable: vtableEightySecondMethodSlot, VtblEntry::Method. -/
def vtableEightySecondMethodSlot : Nat := vtableEightyFirstMethodSlot + 1

/-- Eighty-third Method slot index (after method81).
    Greppable: vtableEightyThirdMethodSlot, VtblEntry::Method. -/
def vtableEightyThirdMethodSlot : Nat := vtableEightySecondMethodSlot + 1

/-- Eighty-fourth Method slot index (after method82).
    Greppable: vtableEightyFourthMethodSlot, VtblEntry::Method. -/
def vtableEightyFourthMethodSlot : Nat := vtableEightyThirdMethodSlot + 1

/-- Eighty-fifth Method slot index (after method83).
    Greppable: vtableEightyFifthMethodSlot, VtblEntry::Method. -/
def vtableEightyFifthMethodSlot : Nat := vtableEightyFourthMethodSlot + 1

/-- Eighty-sixth Method slot index (after method84).
    Greppable: vtableEightySixthMethodSlot, VtblEntry::Method. -/
def vtableEightySixthMethodSlot : Nat := vtableEightyFifthMethodSlot + 1

/-- Eighty-seventh Method slot index (after method85).
    Greppable: vtableEightySeventhMethodSlot, VtblEntry::Method. -/
def vtableEightySeventhMethodSlot : Nat := vtableEightySixthMethodSlot + 1

/-- Eighty-eighth Method slot index (after method86).
    Greppable: vtableEightyEighthMethodSlot, VtblEntry::Method. -/
def vtableEightyEighthMethodSlot : Nat := vtableEightySeventhMethodSlot + 1

/-- Eighty-ninth Method slot index (after method87).
    Greppable: vtableEightyNinthMethodSlot, VtblEntry::Method. -/
def vtableEightyNinthMethodSlot : Nat := vtableEightyEighthMethodSlot + 1

/-- Ninetieth Method slot index (after method88).
    Greppable: vtableNinetiethMethodSlot, VtblEntry::Method. -/
def vtableNinetiethMethodSlot : Nat := vtableEightyNinthMethodSlot + 1

/-- Ninety-first Method slot index (after method89).
    Greppable: vtableNinetyFirstMethodSlot, VtblEntry::Method. -/
def vtableNinetyFirstMethodSlot : Nat := vtableNinetiethMethodSlot + 1

/-- Ninety-second Method slot index (after method90).
    Greppable: vtableNinetySecondMethodSlot, VtblEntry::Method. -/
def vtableNinetySecondMethodSlot : Nat := vtableNinetyFirstMethodSlot + 1

/-- Ninety-third Method slot index (after method91).
    Greppable: vtableNinetyThirdMethodSlot, VtblEntry::Method. -/
def vtableNinetyThirdMethodSlot : Nat := vtableNinetySecondMethodSlot + 1

/-- Ninety-fourth Method slot index (after method92).
    Greppable: vtableNinetyFourthMethodSlot, VtblEntry::Method. -/
def vtableNinetyFourthMethodSlot : Nat := vtableNinetyThirdMethodSlot + 1

/-- Ninety-fifth Method slot index (after method93).
    Greppable: vtableNinetyFifthMethodSlot, VtblEntry::Method. -/
def vtableNinetyFifthMethodSlot : Nat := vtableNinetyFourthMethodSlot + 1

/-- Ninety-sixth Method slot index (after method94).
    Greppable: vtableNinetySixthMethodSlot, VtblEntry::Method. -/
def vtableNinetySixthMethodSlot : Nat := vtableNinetyFifthMethodSlot + 1

/-- Ninety-seventh Method slot index (after method95).
    Greppable: vtableNinetySeventhMethodSlot, VtblEntry::Method. -/
def vtableNinetySeventhMethodSlot : Nat := vtableNinetySixthMethodSlot + 1

/-- Ninety-eighth Method slot index (after method96).
    Greppable: vtableNinetyEighthMethodSlot, VtblEntry::Method. -/
def vtableNinetyEighthMethodSlot : Nat := vtableNinetySeventhMethodSlot + 1

/-- Ninety-ninth Method slot index (after method97).
    Greppable: vtableNinetyNinthMethodSlot, VtblEntry::Method. -/
def vtableNinetyNinthMethodSlot : Nat := vtableNinetyEighthMethodSlot + 1

/-- One-hundredth Method slot index (after method98).
    Greppable: vtableOneHundredthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredthMethodSlot : Nat := vtableNinetyNinthMethodSlot + 1

/-- One-hundred-first Method slot index (after method99).
    Greppable: vtableOneHundredFirstMethodSlot, VtblEntry::Method. -/
def vtableOneHundredFirstMethodSlot : Nat := vtableOneHundredthMethodSlot + 1

/-- One-hundred-second Method slot index (after method100).
    Greppable: vtableOneHundredSecondMethodSlot, VtblEntry::Method. -/
def vtableOneHundredSecondMethodSlot : Nat := vtableOneHundredFirstMethodSlot + 1

/-- One-hundred-third Method slot index (after method101).
    Greppable: vtableOneHundredThirdMethodSlot, VtblEntry::Method. -/
def vtableOneHundredThirdMethodSlot : Nat := vtableOneHundredSecondMethodSlot + 1

/-- One-hundred-fourth Method slot index (after method102).
    Greppable: vtableOneHundredFourthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredFourthMethodSlot : Nat := vtableOneHundredThirdMethodSlot + 1

/-- One-hundred-fifth Method slot index (after method103).
    Greppable: vtableOneHundredFifthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredFifthMethodSlot : Nat := vtableOneHundredFourthMethodSlot + 1

/-- One-hundred-sixth Method slot index (after method104).
    Greppable: vtableOneHundredSixthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredSixthMethodSlot : Nat := vtableOneHundredFifthMethodSlot + 1

/-- One-hundred-seventh Method slot index (after method105).
    Greppable: vtableOneHundredSeventhMethodSlot, VtblEntry::Method. -/
def vtableOneHundredSeventhMethodSlot : Nat := vtableOneHundredSixthMethodSlot + 1

/-- One-hundred-eighth Method slot index (after method106).
    Greppable: vtableOneHundredEighthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredEighthMethodSlot : Nat := vtableOneHundredSeventhMethodSlot + 1

/-- One-hundred-ninth Method slot index (after method107).
    Greppable: vtableOneHundredNinthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredNinthMethodSlot : Nat := vtableOneHundredEighthMethodSlot + 1

/-- One-hundred-tenth Method slot index (after method108).
    Greppable: vtableOneHundredTenthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTenthMethodSlot : Nat := vtableOneHundredNinthMethodSlot + 1

/-- One-hundred-eleventh Method slot index (after method109).
    Greppable: vtableOneHundredEleventhMethodSlot, VtblEntry::Method. -/
def vtableOneHundredEleventhMethodSlot : Nat := vtableOneHundredTenthMethodSlot + 1

/-- One-hundred-twelfth Method slot index (after method110).
    Greppable: vtableOneHundredTwelfthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwelfthMethodSlot : Nat := vtableOneHundredEleventhMethodSlot + 1

/-- One-hundred-thirteenth Method slot index (after method111).
    Greppable: vtableOneHundredThirteenthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredThirteenthMethodSlot : Nat := vtableOneHundredTwelfthMethodSlot + 1

/-- One-hundred-fourteenth Method slot index (after method112).
    Greppable: vtableOneHundredFourteenthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredFourteenthMethodSlot : Nat := vtableOneHundredThirteenthMethodSlot + 1

/-- One-hundred-fifteenth Method slot index (after method113).
    Greppable: vtableOneHundredFifteenthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredFifteenthMethodSlot : Nat := vtableOneHundredFourteenthMethodSlot + 1

/-- One-hundred-sixteenth Method slot index (after method114).
    Greppable: vtableOneHundredSixteenthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredSixteenthMethodSlot : Nat := vtableOneHundredFifteenthMethodSlot + 1

/-- One-hundred-seventeenth Method slot index (after method115).
    Greppable: vtableOneHundredSeventeenthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredSeventeenthMethodSlot : Nat := vtableOneHundredSixteenthMethodSlot + 1

/-- One-hundred-eighteenth Method slot index (after method116).
    Greppable: vtableOneHundredEighteenthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredEighteenthMethodSlot : Nat := vtableOneHundredSeventeenthMethodSlot + 1

/-- One-hundred-nineteenth Method slot index (after method117).
    Greppable: vtableOneHundredNineteenthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredNineteenthMethodSlot : Nat := vtableOneHundredEighteenthMethodSlot + 1

/-- One-hundred-twentieth Method slot index (after method118).
    Greppable: vtableOneHundredTwentiethMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentiethMethodSlot : Nat := vtableOneHundredNineteenthMethodSlot + 1

/-- One-hundred-twenty-first Method slot index (after method119).
    Greppable: vtableOneHundredTwentyFirstMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentyFirstMethodSlot : Nat := vtableOneHundredTwentiethMethodSlot + 1

/-- One-hundred-twenty-second Method slot index (after method120).
    Greppable: vtableOneHundredTwentySecondMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentySecondMethodSlot : Nat := vtableOneHundredTwentyFirstMethodSlot + 1

/-- One-hundred-twenty-third Method slot index (after method121).
    Greppable: vtableOneHundredTwentyThirdMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentyThirdMethodSlot : Nat := vtableOneHundredTwentySecondMethodSlot + 1

/-- One-hundred-twenty-fourth Method slot index (after method122).
    Greppable: vtableOneHundredTwentyFourthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentyFourthMethodSlot : Nat := vtableOneHundredTwentyThirdMethodSlot + 1

/-- One-hundred-twenty-fifth Method slot index (after method123).
    Greppable: vtableOneHundredTwentyFifthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentyFifthMethodSlot : Nat := vtableOneHundredTwentyFourthMethodSlot + 1

/-- One-hundred-twenty-sixth Method slot index (after method124).
    Greppable: vtableOneHundredTwentySixthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentySixthMethodSlot : Nat := vtableOneHundredTwentyFifthMethodSlot + 1

/-- One-hundred-twenty-seventh Method slot index (after method125).
    Greppable: vtableOneHundredTwentySeventhMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentySeventhMethodSlot : Nat := vtableOneHundredTwentySixthMethodSlot + 1

/-- One-hundred-twenty-eighth Method slot index (after method126).
    Greppable: vtableOneHundredTwentyEighthMethodSlot, VtblEntry::Method. -/
def vtableOneHundredTwentyEighthMethodSlot : Nat := vtableOneHundredTwentySeventhMethodSlot + 1

/-- Default fixture: one Vacant after the one hundred twenty-eight Methods (vtable-safe associated
    function whose predicates do not hold; rustc_middle VtblEntry::Vacant). -/
def vtableFixtureVacantCount : Nat := 1

/-- First Vacant slot index (after header plus one hundred twenty-eight Methods). /
    Greppable: vtableFirstVacantSlot, VtblEntry::Vacant. -/
def vtableFirstVacantSlot : Nat :=
  vtableFirstMethodSlot + vtableFixtureMethodCount

/-- First TraitVPtr slot index (after header, Method, Vacant).
    Cite: rustc_middle ty/vtable.rs VtblEntry::TraitVPtr after principal
    own entries; rustc_abi pointer to a separate supertrait vtable. -/
def vtableFirstTraitVPtrSlot : Nat :=
  vtableFirstVacantSlot + vtableFixtureVacantCount

/-- Default fixture: one supertrait vptr after own Method/Vacant entries. -/
def vtableFixtureTraitVPtrCount : Nat := 1

/-- Fixture slot count: header plus one hundred twenty-eight Methods plus Vacant plus TraitVPtr. -/
def vtableFixtureSlotCount : Nat :=
  vtableHeaderSlotCount + vtableFixtureMethodCount
    + vtableFixtureVacantCount + vtableFixtureTraitVPtrCount

/-- Fixture vtable slot kind (header, one hundred twenty-eight Methods, Vacant, TraitVPtr). /
    Slot kinds are rustc_middle VtblEntry. rustc_abi pointer_size is the
    Method, Vacant, and TraitVPtr ABI. First method index = 3.
    Second method index = 4. Third method index = 5. Fourth method index = 6.
    Fifth method index = 7. Sixth method index = 8. Seventh method index = 9.
    Eighth method index = 10. Ninth method index = 11. Tenth method index = 12.
    Eleventh method index = 13. Twelfth method index = 14.
    Thirteenth method index = 15. Fourteenth method index = 16.
    Fifteenth method index = 17. Sixteenth method index = 18.
    Seventeenth method index = 19. Eighteenth method index = 20.
    Nineteenth method index = 21. Twentieth method index = 22.
    Twenty-first method index = 23. Twenty-second method index = 24.
    Twenty-third method index = 25. Twenty-fourth method index = 26.
    Twenty-fifth method index = 27. Twenty-sixth method index = 28.
    Twenty-seventh method index = 29. Twenty-eighth method index = 30.
    Twenty-ninth method index = 31. Thirtieth method index = 32.
    Thirty-first method index = 33. Thirty-second method index = 34.
    Thirty-third method index = 35. Thirty-fourth method index = 36.
    Thirty-fifth method index = 37. Thirty-sixth method index = 38.
    Thirty-seventh method index = 39. Thirty-eighth method index = 40.
    Thirty-ninth method index = 41. Fortieth method index = 42.
    Forty-first method index = 43. Forty-second method index = 44.
    Forty-third method index = 45. Forty-fourth method index = 46.
    Forty-fifth method index = 47. Forty-sixth method index = 48.
    Forty-seventh method index = 49. Forty-eighth method index = 50.
    Forty-ninth method index = 51. Fiftieth method index = 52.
    Fifty-first method index = 53. Fifty-second method index = 54.
    Fifty-third method index = 55. Fifty-fourth method index = 56.
    Fifty-fifth method index = 57. Fifty-sixth method index = 58.
    Fifty-seventh method index = 59. Fifty-eighth method index = 60.
    Fifty-ninth method index = 61. Sixtieth method index = 62.
    Sixty-first method index = 63. Sixty-second method index = 64.
    Sixty-third method index = 65. Sixty-fourth method index = 66.
    Sixty-fifth method index = 67. Sixty-sixth method index = 68.
    Sixty-seventh method index = 69. Sixty-eighth method index = 70.
    Sixty-ninth method index = 71. Seventieth method index = 72.
    Seventy-first method index = 73. Seventy-second method index = 74.
    Seventy-third method index = 75. Seventy-fourth method index = 76.
    Seventy-fifth method index = 77. Seventy-sixth method index = 78.
    Seventy-seventh method index = 79. Seventy-eighth method index = 80.
    Seventy-ninth method index = 81. Eightieth method index = 82.
    Eighty-first method index = 83. Eighty-second method index = 84.
    Eighty-third method index = 85. Eighty-fourth method index = 86.
    Eighty-fifth method index = 87. Eighty-sixth method index = 88.
    Eighty-seventh method index = 89. Eighty-eighth method index = 90.
    Eighty-ninth method index = 91. Ninetieth method index = 92.
    Ninety-first method index = 93. Ninety-second method index = 94.
    Ninety-third method index = 95. Ninety-fourth method index = 96.
    Ninety-fifth method index = 97. Ninety-sixth method index = 98.
    Ninety-seventh method index = 99. Ninety-eighth method index = 100.
    Ninety-ninth method index = 101.
    Hundredth method index = 102. Hundred-first method index = 103.
    Hundred-second method index = 104.
    Hundred-third method index = 105.
    Hundred-fourth method index = 106.
    Hundred-fifth method index = 107.
    Hundred-sixth method index = 108.
    Hundred-seventh method index = 109.
    Hundred-eighth method index = 110.
    Hundred-ninth method index = 111.
    Hundred-tenth method index = 112.
    Hundred-eleventh method index = 113.
    Hundred-twelfth method index = 114.
    Hundred-thirteenth method index = 115.
    Hundred-fourteenth method index = 116.
    Hundred-fifteenth method index = 117.
    Hundred-sixteenth method index = 118.
    Hundred-seventeenth method index = 119.
    Hundred-eighteenth method index = 120.
    Hundred-nineteenth method index = 121.
    Hundred-twentieth method index = 122.
    Hundred-twenty-first method index = 123.
    Hundred-twenty-second method index = 124.
    Hundred-twenty-third method index = 125.
    Hundred-twenty-fourth method index = 126.
    Hundred-twenty-fifth method index = 127.
    Hundred-twenty-sixth method index = 128.
    Hundred-twenty-seventh method index = 129.
    Hundred-twenty-eighth method index = 130.
    First Vacant index = 131. First TraitVPtr index = 132. -/
def vtableSlotKind (i : Nat) : Option VtableSlotKind :=
  match vtableHeaderSlotKind i with
  | some k => some k
  | none =>
    if i >= vtableFirstMethodSlot && i < vtableFirstVacantSlot then
      some VtableSlotKind.method
    else if i == vtableFirstVacantSlot then
      some VtableSlotKind.vacant
    else if i == vtableFirstTraitVPtrSlot then
      some VtableSlotKind.traitVPtr
    else
      none

/-- Byte offset of vtable slot i (each slot is pointer-sized).
    Cite: rustc_codegen_cranelift/src/vtable.rs loads at
    COMMON_VTABLE_ENTRIES_* * usize_size. -/
def vtableSlotOffset (i : Nat) : Nat := i * pointerSizeBytes

def vtableDropInPlaceOffset : Nat := vtableSlotOffset vtableSlotDropInPlace

def vtableSizeOffset : Nat := vtableSlotOffset vtableSlotSize

def vtableAlignOffset : Nat := vtableSlotOffset vtableSlotAlign

def vtableFirstMethodOffset : Nat := vtableSlotOffset vtableFirstMethodSlot

def vtableSecondMethodOffset : Nat :=
  vtableSlotOffset vtableSecondMethodSlot

def vtableThirdMethodOffset : Nat :=
  vtableSlotOffset vtableThirdMethodSlot

def vtableFourthMethodOffset : Nat :=
  vtableSlotOffset vtableFourthMethodSlot

def vtableFifthMethodOffset : Nat :=
  vtableSlotOffset vtableFifthMethodSlot

def vtableSixthMethodOffset : Nat :=
  vtableSlotOffset vtableSixthMethodSlot

def vtableSeventhMethodOffset : Nat :=
  vtableSlotOffset vtableSeventhMethodSlot

def vtableEighthMethodOffset : Nat :=
  vtableSlotOffset vtableEighthMethodSlot

def vtableNinthMethodOffset : Nat :=
  vtableSlotOffset vtableNinthMethodSlot

def vtableTenthMethodOffset : Nat :=
  vtableSlotOffset vtableTenthMethodSlot

def vtableEleventhMethodOffset : Nat :=
  vtableSlotOffset vtableEleventhMethodSlot

def vtableTwelfthMethodOffset : Nat :=
  vtableSlotOffset vtableTwelfthMethodSlot

def vtableThirteenthMethodOffset : Nat :=
  vtableSlotOffset vtableThirteenthMethodSlot

def vtableFourteenthMethodOffset : Nat :=
  vtableSlotOffset vtableFourteenthMethodSlot

def vtableFifteenthMethodOffset : Nat :=
  vtableSlotOffset vtableFifteenthMethodSlot

def vtableSixteenthMethodOffset : Nat :=
  vtableSlotOffset vtableSixteenthMethodSlot

def vtableSeventeenthMethodOffset : Nat :=
  vtableSlotOffset vtableSeventeenthMethodSlot

def vtableEighteenthMethodOffset : Nat :=
  vtableSlotOffset vtableEighteenthMethodSlot

def vtableNineteenthMethodOffset : Nat :=
  vtableSlotOffset vtableNineteenthMethodSlot

def vtableTwentiethMethodOffset : Nat :=
  vtableSlotOffset vtableTwentiethMethodSlot

def vtableTwentyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableTwentyFirstMethodSlot

def vtableTwentySecondMethodOffset : Nat :=
  vtableSlotOffset vtableTwentySecondMethodSlot

def vtableTwentyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableTwentyThirdMethodSlot

def vtableTwentyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableTwentyFourthMethodSlot

def vtableTwentyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableTwentyFifthMethodSlot

def vtableTwentySixthMethodOffset : Nat :=
  vtableSlotOffset vtableTwentySixthMethodSlot

def vtableTwentySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableTwentySeventhMethodSlot

def vtableTwentyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableTwentyEighthMethodSlot

def vtableTwentyNinthMethodOffset : Nat :=
  vtableSlotOffset vtableTwentyNinthMethodSlot

def vtableThirtiethMethodOffset : Nat :=
  vtableSlotOffset vtableThirtiethMethodSlot

def vtableThirtyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableThirtyFirstMethodSlot

def vtableThirtySecondMethodOffset : Nat :=
  vtableSlotOffset vtableThirtySecondMethodSlot

def vtableThirtyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableThirtyThirdMethodSlot

def vtableThirtyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableThirtyFourthMethodSlot

def vtableThirtyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableThirtyFifthMethodSlot

def vtableThirtySixthMethodOffset : Nat :=
  vtableSlotOffset vtableThirtySixthMethodSlot

def vtableThirtySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableThirtySeventhMethodSlot

def vtableThirtyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableThirtyEighthMethodSlot

def vtableThirtyNinthMethodOffset : Nat :=
  vtableSlotOffset vtableThirtyNinthMethodSlot

def vtableFortiethMethodOffset : Nat :=
  vtableSlotOffset vtableFortiethMethodSlot

def vtableFortyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableFortyFirstMethodSlot

def vtableFortySecondMethodOffset : Nat :=
  vtableSlotOffset vtableFortySecondMethodSlot

def vtableFortyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableFortyThirdMethodSlot

def vtableFortyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableFortyFourthMethodSlot

def vtableFortyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableFortyFifthMethodSlot

def vtableFortySixthMethodOffset : Nat :=
  vtableSlotOffset vtableFortySixthMethodSlot

def vtableFortySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableFortySeventhMethodSlot

def vtableFortyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableFortyEighthMethodSlot

def vtableFortyNinthMethodOffset : Nat :=
  vtableSlotOffset vtableFortyNinthMethodSlot

def vtableFiftiethMethodOffset : Nat :=
  vtableSlotOffset vtableFiftiethMethodSlot

def vtableFiftyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableFiftyFirstMethodSlot

def vtableFiftySecondMethodOffset : Nat :=
  vtableSlotOffset vtableFiftySecondMethodSlot

def vtableFiftyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableFiftyThirdMethodSlot

def vtableFiftyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableFiftyFourthMethodSlot

def vtableFiftyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableFiftyFifthMethodSlot

def vtableFiftySixthMethodOffset : Nat :=
  vtableSlotOffset vtableFiftySixthMethodSlot

def vtableFiftySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableFiftySeventhMethodSlot

def vtableFiftyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableFiftyEighthMethodSlot

def vtableFiftyNinthMethodOffset : Nat :=
  vtableSlotOffset vtableFiftyNinthMethodSlot

def vtableSixtiethMethodOffset : Nat :=
  vtableSlotOffset vtableSixtiethMethodSlot

def vtableSixtyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableSixtyFirstMethodSlot

def vtableSixtySecondMethodOffset : Nat :=
  vtableSlotOffset vtableSixtySecondMethodSlot

def vtableSixtyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableSixtyThirdMethodSlot

def vtableSixtyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableSixtyFourthMethodSlot

def vtableSixtyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableSixtyFifthMethodSlot

def vtableSixtySixthMethodOffset : Nat :=
  vtableSlotOffset vtableSixtySixthMethodSlot

def vtableSixtySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableSixtySeventhMethodSlot

def vtableSixtyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableSixtyEighthMethodSlot

def vtableSixtyNinthMethodOffset : Nat :=
  vtableSlotOffset vtableSixtyNinthMethodSlot

def vtableSeventiethMethodOffset : Nat :=
  vtableSlotOffset vtableSeventiethMethodSlot

def vtableSeventyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableSeventyFirstMethodSlot

def vtableSeventySecondMethodOffset : Nat :=
  vtableSlotOffset vtableSeventySecondMethodSlot

def vtableSeventyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableSeventyThirdMethodSlot

def vtableSeventyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableSeventyFourthMethodSlot

def vtableSeventyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableSeventyFifthMethodSlot

def vtableSeventySixthMethodOffset : Nat :=
  vtableSlotOffset vtableSeventySixthMethodSlot

def vtableSeventySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableSeventySeventhMethodSlot

def vtableSeventyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableSeventyEighthMethodSlot

def vtableSeventyNinthMethodOffset : Nat :=
  vtableSlotOffset vtableSeventyNinthMethodSlot

def vtableEightiethMethodOffset : Nat :=
  vtableSlotOffset vtableEightiethMethodSlot

def vtableEightyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableEightyFirstMethodSlot

def vtableEightySecondMethodOffset : Nat :=
  vtableSlotOffset vtableEightySecondMethodSlot

def vtableEightyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableEightyThirdMethodSlot

def vtableEightyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableEightyFourthMethodSlot

def vtableEightyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableEightyFifthMethodSlot

def vtableEightySixthMethodOffset : Nat :=
  vtableSlotOffset vtableEightySixthMethodSlot

def vtableEightySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableEightySeventhMethodSlot

def vtableEightyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableEightyEighthMethodSlot

def vtableEightyNinthMethodOffset : Nat :=
  vtableSlotOffset vtableEightyNinthMethodSlot

def vtableNinetiethMethodOffset : Nat :=
  vtableSlotOffset vtableNinetiethMethodSlot

def vtableNinetyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableNinetyFirstMethodSlot

def vtableNinetySecondMethodOffset : Nat :=
  vtableSlotOffset vtableNinetySecondMethodSlot

def vtableNinetyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableNinetyThirdMethodSlot

def vtableNinetyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableNinetyFourthMethodSlot

def vtableNinetyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableNinetyFifthMethodSlot

def vtableNinetySixthMethodOffset : Nat :=
  vtableSlotOffset vtableNinetySixthMethodSlot

def vtableNinetySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableNinetySeventhMethodSlot

def vtableNinetyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableNinetyEighthMethodSlot

def vtableNinetyNinthMethodOffset : Nat :=
  vtableSlotOffset vtableNinetyNinthMethodSlot

def vtableOneHundredthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredthMethodSlot

def vtableOneHundredFirstMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredFirstMethodSlot

def vtableOneHundredSecondMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredSecondMethodSlot

def vtableOneHundredThirdMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredThirdMethodSlot

def vtableOneHundredFourthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredFourthMethodSlot

def vtableOneHundredFifthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredFifthMethodSlot

def vtableOneHundredSixthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredSixthMethodSlot

def vtableOneHundredSeventhMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredSeventhMethodSlot

def vtableOneHundredEighthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredEighthMethodSlot

def vtableOneHundredNinthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredNinthMethodSlot

def vtableOneHundredTenthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTenthMethodSlot

def vtableOneHundredEleventhMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredEleventhMethodSlot

def vtableOneHundredTwelfthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwelfthMethodSlot

def vtableOneHundredThirteenthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredThirteenthMethodSlot

def vtableOneHundredFourteenthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredFourteenthMethodSlot

def vtableOneHundredFifteenthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredFifteenthMethodSlot

def vtableOneHundredSixteenthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredSixteenthMethodSlot

def vtableOneHundredSeventeenthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredSeventeenthMethodSlot

def vtableOneHundredEighteenthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredEighteenthMethodSlot

def vtableOneHundredNineteenthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredNineteenthMethodSlot

def vtableOneHundredTwentiethMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentiethMethodSlot

def vtableOneHundredTwentyFirstMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentyFirstMethodSlot

def vtableOneHundredTwentySecondMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentySecondMethodSlot

def vtableOneHundredTwentyThirdMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentyThirdMethodSlot

def vtableOneHundredTwentyFourthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentyFourthMethodSlot

def vtableOneHundredTwentyFifthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentyFifthMethodSlot

def vtableOneHundredTwentySixthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentySixthMethodSlot

def vtableOneHundredTwentySeventhMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentySeventhMethodSlot

def vtableOneHundredTwentyEighthMethodOffset : Nat :=
  vtableSlotOffset vtableOneHundredTwentyEighthMethodSlot

def vtableVacantOffset : Nat := vtableSlotOffset vtableFirstVacantSlot

def vtableTraitVPtrOffset : Nat :=
  vtableSlotOffset vtableFirstTraitVPtrSlot

/-- Supertrait vtable is header-only (drop/size/align; no methods).
    Greppable: vtableSupertraitSlotCount. -/
def vtableSupertraitSlotCount : Nat := vtableHeaderSlotCount

/-- Supertrait vtable size in bytes. -/
def vtableSupertraitSizeBytes : Nat :=
  vtableSupertraitSlotCount * pointerSizeBytes

/-- Fixture vtable size in bytes. -/
def vtableFixtureSizeBytes : Nat :=
  vtableFixtureSlotCount * pointerSizeBytes

/-- Fixture vtable align (pointer align). -/
def vtableFixtureAlignBytes : Nat := pointerAlignBytes

/-- Method slot ABI size: rustc_abi pointer (fn pointer, not usize i64).
    Cite: rustc_middle VtblEntry::Method written as a pointer;
    rustc_abi TargetDataLayout pointer_size. -/
def vtableMethodSlotSizeBytes : Nat := pointerSizeBytes

/-- Method slot ABI align: rustc_abi pointer_align. -/
def vtableMethodSlotAlignBytes : Nat := pointerAlignBytes

/-- Vacant slot ABI size: rustc_abi pointer (reserved; rustc Uninit).
    Cite: rustc_middle VtblEntry::Vacant still counted in vtable_entries.len. -/
def vtableVacantSlotSizeBytes : Nat := pointerSizeBytes

/-- Vacant slot ABI align: rustc_abi pointer_align. -/
def vtableVacantSlotAlignBytes : Nat := pointerAlignBytes

/-- TraitVPtr slot ABI size: rustc_abi pointer (vtable pointer, not usize i64).
    Cite: rustc_middle VtblEntry::TraitVPtr written as a pointer;
    rustc_abi TargetDataLayout pointer_size. -/
def vtableTraitVPtrSlotSizeBytes : Nat := pointerSizeBytes

/-- TraitVPtr slot ABI align: rustc_abi pointer_align. -/
def vtableTraitVPtrSlotAlignBytes : Nat := pointerAlignBytes

/-- Named fixture payload size (data object, not the fat pointer).
    Vtable size slot is this usize. Greppable: vtableFixturePayloadSizeBytes. -/
def vtableFixturePayloadSizeBytes : Nat := 8

/-- Named fixture payload align (data object).
    Vtable align slot is this usize. -/
def vtableFixturePayloadAlignBytes : Nat := 8

/-- Fat pointer host value (data pointer plus vtable pointer).
    Not HostCompose.Host. Not IrGraph.Edge. Not Types.IrNode.
    Greppable: TraitObjectFat, HOST-TRAIT-OBJECT-FAT. -/
structure TraitObjectFat where
  dataIsNull : Bool
  dataSymbol : String
  vtableSymbol : String
  deriving Repr, DecidableEq

/-- One ordered vtable slot (kind plus optional method/supertrait symbol).
    Greppable: VtableSlot. -/
structure VtableSlot where
  kind : VtableSlotKind
  symbol : String
  deriving Repr, DecidableEq

/-- Ordered vtable host value.
    Greppable: TraitObjectVtableValue. -/
structure TraitObjectVtableValue where
  slots : List VtableSlot
  deriving Repr, DecidableEq

/-- Drop stub symbol in the named fixture. -/
def dropInPlaceFnSymbol : String := "@slake_trait_object_drop_in_place"

/-- First Method stub symbol in the named fixture. -/
def method0FnSymbol : String := "@slake_trait_object_method0"

/-- Second Method stub symbol in the named fixture. -/
def method1FnSymbol : String := "@slake_trait_object_method1"

/-- Third Method stub symbol in the named fixture. -/
def method2FnSymbol : String := "@slake_trait_object_method2"

/-- Fourth Method stub symbol in the named fixture. -/
def method3FnSymbol : String := "@slake_trait_object_method3"

/-- Fifth Method stub symbol in the named fixture. -/
def method4FnSymbol : String := "@slake_trait_object_method4"

/-- Sixth Method stub symbol in the named fixture. -/
def method5FnSymbol : String := "@slake_trait_object_method5"

/-- Seventh Method stub symbol in the named fixture. -/
def method6FnSymbol : String := "@slake_trait_object_method6"

/-- Eighth Method stub symbol in the named fixture. -/
def method7FnSymbol : String := "@slake_trait_object_method7"

/-- Ninth Method stub symbol in the named fixture. -/
def method8FnSymbol : String := "@slake_trait_object_method8"

/-- Tenth Method stub symbol in the named fixture. -/
def method9FnSymbol : String := "@slake_trait_object_method9"

/-- Eleventh Method stub symbol in the named fixture. -/
def method10FnSymbol : String := "@slake_trait_object_method10"

/-- Twelfth Method stub symbol in the named fixture. -/
def method11FnSymbol : String := "@slake_trait_object_method11"

/-- Thirteenth Method stub symbol in the named fixture. -/
def method12FnSymbol : String := "@slake_trait_object_method12"

/-- Fourteenth Method stub symbol in the named fixture. -/
def method13FnSymbol : String := "@slake_trait_object_method13"

/-- Fifteenth Method stub symbol in the named fixture. -/
def method14FnSymbol : String := "@slake_trait_object_method14"

/-- Sixteenth Method stub symbol in the named fixture. -/
def method15FnSymbol : String := "@slake_trait_object_method15"

/-- Seventeenth Method stub symbol in the named fixture. -/
def method16FnSymbol : String := "@slake_trait_object_method16"

/-- Eighteenth Method stub symbol in the named fixture. -/
def method17FnSymbol : String := "@slake_trait_object_method17"

/-- Nineteenth Method stub symbol in the named fixture. -/
def method18FnSymbol : String := "@slake_trait_object_method18"

/-- Twentieth Method stub symbol in the named fixture. -/
def method19FnSymbol : String := "@slake_trait_object_method19"

/-- Twenty-first Method stub symbol in the named fixture. -/
def method20FnSymbol : String := "@slake_trait_object_method20"

/-- Twenty-second Method stub symbol in the named fixture. -/
def method21FnSymbol : String := "@slake_trait_object_method21"

/-- Twenty-third Method stub symbol in the named fixture. -/
def method22FnSymbol : String := "@slake_trait_object_method22"

/-- Twenty-fourth Method stub symbol in the named fixture. -/
def method23FnSymbol : String := "@slake_trait_object_method23"

/-- Twenty-fifth Method stub symbol in the named fixture. -/
def method24FnSymbol : String := "@slake_trait_object_method24"

/-- Twenty-sixth Method stub symbol in the named fixture. -/
def method25FnSymbol : String := "@slake_trait_object_method25"

/-- Twenty-seventh Method stub symbol in the named fixture. -/
def method26FnSymbol : String := "@slake_trait_object_method26"

/-- Twenty-eighth Method stub symbol in the named fixture. -/
def method27FnSymbol : String := "@slake_trait_object_method27"

/-- Twenty-ninth Method stub symbol in the named fixture. -/
def method28FnSymbol : String := "@slake_trait_object_method28"

/-- Thirtieth Method stub symbol in the named fixture. -/
def method29FnSymbol : String := "@slake_trait_object_method29"

/-- Thirty-first Method stub symbol in the named fixture. -/
def method30FnSymbol : String := "@slake_trait_object_method30"

/-- Thirty-second Method stub symbol in the named fixture. -/
def method31FnSymbol : String := "@slake_trait_object_method31"

/-- Thirty-third Method stub symbol in the named fixture. -/
def method32FnSymbol : String := "@slake_trait_object_method32"

/-- Thirty-fourth Method stub symbol in the named fixture. -/
def method33FnSymbol : String := "@slake_trait_object_method33"

/-- Thirty-fifth Method stub symbol in the named fixture. -/
def method34FnSymbol : String := "@slake_trait_object_method34"

/-- Thirty-sixth Method stub symbol in the named fixture. -/
def method35FnSymbol : String := "@slake_trait_object_method35"

/-- Thirty-seventh Method stub symbol in the named fixture. -/
def method36FnSymbol : String := "@slake_trait_object_method36"

/-- Thirty-eighth Method stub symbol in the named fixture. -/
def method37FnSymbol : String := "@slake_trait_object_method37"

/-- Thirty-ninth Method stub symbol in the named fixture. -/
def method38FnSymbol : String := "@slake_trait_object_method38"

/-- Fortieth Method stub symbol in the named fixture. -/
def method39FnSymbol : String := "@slake_trait_object_method39"

/-- Forty-first Method stub symbol in the named fixture. -/
def method40FnSymbol : String := "@slake_trait_object_method40"

/-- Forty-second Method stub symbol in the named fixture. -/
def method41FnSymbol : String := "@slake_trait_object_method41"

/-- Forty-third Method stub symbol in the named fixture. -/
def method42FnSymbol : String := "@slake_trait_object_method42"

/-- Forty-fourth Method stub symbol in the named fixture. -/
def method43FnSymbol : String := "@slake_trait_object_method43"

/-- Forty-fifth Method stub symbol in the named fixture. -/
def method44FnSymbol : String := "@slake_trait_object_method44"

/-- Forty-sixth Method stub symbol in the named fixture. -/
def method45FnSymbol : String := "@slake_trait_object_method45"

/-- Forty-seventh Method stub symbol in the named fixture. -/
def method46FnSymbol : String := "@slake_trait_object_method46"

/-- Forty-eighth Method stub symbol in the named fixture. -/
def method47FnSymbol : String := "@slake_trait_object_method47"

/-- Forty-ninth Method stub symbol in the named fixture. -/
def method48FnSymbol : String := "@slake_trait_object_method48"

/-- Fiftieth Method stub symbol in the named fixture. -/
def method49FnSymbol : String := "@slake_trait_object_method49"

/-- Fifty-first Method stub symbol in the named fixture. -/
def method50FnSymbol : String := "@slake_trait_object_method50"

/-- Fifty-second Method stub symbol in the named fixture. -/
def method51FnSymbol : String := "@slake_trait_object_method51"

/-- Fifty-third Method stub symbol in the named fixture. -/
def method52FnSymbol : String := "@slake_trait_object_method52"

/-- Fifty-fourth Method stub symbol in the named fixture. -/
def method53FnSymbol : String := "@slake_trait_object_method53"

/-- Fifty-fifth Method stub symbol in the named fixture. -/
def method54FnSymbol : String := "@slake_trait_object_method54"

/-- Fifty-sixth Method stub symbol in the named fixture. -/
def method55FnSymbol : String := "@slake_trait_object_method55"

/-- Fifty-seventh Method stub symbol in the named fixture. -/
def method56FnSymbol : String := "@slake_trait_object_method56"

/-- Fifty-eighth Method stub symbol in the named fixture. -/
def method57FnSymbol : String := "@slake_trait_object_method57"

/-- Fifty-ninth Method stub symbol in the named fixture. -/
def method58FnSymbol : String := "@slake_trait_object_method58"

/-- Sixtieth Method stub symbol in the named fixture. -/
def method59FnSymbol : String := "@slake_trait_object_method59"

/-- Sixty-first Method stub symbol in the named fixture. -/
def method60FnSymbol : String := "@slake_trait_object_method60"

/-- Sixty-second Method stub symbol in the named fixture. -/
def method61FnSymbol : String := "@slake_trait_object_method61"

/-- Sixty-third Method stub symbol in the named fixture. -/
def method62FnSymbol : String := "@slake_trait_object_method62"

/-- Sixty-fourth Method stub symbol in the named fixture. -/
def method63FnSymbol : String := "@slake_trait_object_method63"

/-- Sixty-fifth Method stub symbol in the named fixture. -/
def method64FnSymbol : String := "@slake_trait_object_method64"

/-- Sixty-sixth Method stub symbol in the named fixture. -/
def method65FnSymbol : String := "@slake_trait_object_method65"

/-- Sixty-seventh Method stub symbol in the named fixture. -/
def method66FnSymbol : String := "@slake_trait_object_method66"

/-- Sixty-eighth Method stub symbol in the named fixture. -/
def method67FnSymbol : String := "@slake_trait_object_method67"

/-- Sixty-ninth Method stub symbol in the named fixture. -/
def method68FnSymbol : String := "@slake_trait_object_method68"

/-- Seventieth Method stub symbol in the named fixture. -/
def method69FnSymbol : String := "@slake_trait_object_method69"

/-- Seventy-first Method stub symbol in the named fixture. -/
def method70FnSymbol : String := "@slake_trait_object_method70"

/-- Seventy-second Method stub symbol in the named fixture. -/
def method71FnSymbol : String := "@slake_trait_object_method71"

/-- Seventy-third Method stub symbol in the named fixture. -/
def method72FnSymbol : String := "@slake_trait_object_method72"

/-- Seventy-fourth Method stub symbol in the named fixture. -/
def method73FnSymbol : String := "@slake_trait_object_method73"

/-- Seventy-fifth Method stub symbol in the named fixture. -/
def method74FnSymbol : String := "@slake_trait_object_method74"

/-- Seventy-sixth Method stub symbol in the named fixture. -/
def method75FnSymbol : String := "@slake_trait_object_method75"

/-- Seventy-seventh Method stub symbol in the named fixture. -/
def method76FnSymbol : String := "@slake_trait_object_method76"

/-- Seventy-eighth Method stub symbol in the named fixture. -/
def method77FnSymbol : String := "@slake_trait_object_method77"

/-- Seventy-ninth Method stub symbol in the named fixture. -/
def method78FnSymbol : String := "@slake_trait_object_method78"

/-- Eightieth Method stub symbol in the named fixture. -/
def method79FnSymbol : String := "@slake_trait_object_method79"

/-- Eighty-first Method stub symbol in the named fixture. -/
def method80FnSymbol : String := "@slake_trait_object_method80"

/-- Eighty-second Method stub symbol in the named fixture. -/
def method81FnSymbol : String := "@slake_trait_object_method81"

/-- Eighty-third Method stub symbol in the named fixture. -/
def method82FnSymbol : String := "@slake_trait_object_method82"

/-- Eighty-fourth Method stub symbol in the named fixture. -/
def method83FnSymbol : String := "@slake_trait_object_method83"

/-- Eighty-fifth Method stub symbol in the named fixture. -/
def method84FnSymbol : String := "@slake_trait_object_method84"

/-- Eighty-sixth Method stub symbol in the named fixture. -/
def method85FnSymbol : String := "@slake_trait_object_method85"

/-- Eighty-seventh Method stub symbol in the named fixture. -/
def method86FnSymbol : String := "@slake_trait_object_method86"

/-- Eighty-eighth Method stub symbol in the named fixture. -/
def method87FnSymbol : String := "@slake_trait_object_method87"

/-- Eighty-ninth Method stub symbol in the named fixture. -/
def method88FnSymbol : String := "@slake_trait_object_method88"

/-- Ninetieth Method stub symbol in the named fixture. -/
def method89FnSymbol : String := "@slake_trait_object_method89"

/-- Ninety-first Method stub symbol in the named fixture. -/
def method90FnSymbol : String := "@slake_trait_object_method90"

/-- Ninety-second Method stub symbol in the named fixture. -/
def method91FnSymbol : String := "@slake_trait_object_method91"

/-- Ninety-third Method stub symbol in the named fixture. -/
def method92FnSymbol : String := "@slake_trait_object_method92"

/-- Ninety-fourth Method stub symbol in the named fixture. -/
def method93FnSymbol : String := "@slake_trait_object_method93"

/-- Ninety-fifth Method stub symbol in the named fixture. -/
def method94FnSymbol : String := "@slake_trait_object_method94"

/-- Ninety-sixth Method stub symbol in the named fixture. -/
def method95FnSymbol : String := "@slake_trait_object_method95"

/-- Ninety-seventh Method stub symbol in the named fixture. -/
def method96FnSymbol : String := "@slake_trait_object_method96"

/-- Ninety-eighth Method stub symbol in the named fixture. -/
def method97FnSymbol : String := "@slake_trait_object_method97"

/-- Ninety-ninth Method stub symbol in the named fixture. -/
def method98FnSymbol : String := "@slake_trait_object_method98"

/-- One-hundredth Method stub symbol in the named fixture. -/
def method99FnSymbol : String := "@slake_trait_object_method99"

/-- One-hundred-first Method stub symbol in the named fixture. -/
def method100FnSymbol : String := "@slake_trait_object_method100"

/-- One-hundred-second Method stub symbol in the named fixture. -/
def method101FnSymbol : String := "@slake_trait_object_method101"

/-- One-hundred-third Method stub symbol in the named fixture. -/
def method102FnSymbol : String := "@slake_trait_object_method102"

/-- One-hundred-fourth Method stub symbol in the named fixture. -/
def method103FnSymbol : String := "@slake_trait_object_method103"

/-- One-hundred-fifth Method stub symbol in the named fixture. -/
def method104FnSymbol : String := "@slake_trait_object_method104"

/-- One-hundred-sixth Method stub symbol in the named fixture. -/
def method105FnSymbol : String := "@slake_trait_object_method105"

/-- One-hundred-seventh Method stub symbol in the named fixture. -/
def method106FnSymbol : String := "@slake_trait_object_method106"

/-- One-hundred-eighth Method LLVM symbol (method107). -/
def method107FnSymbol : String := "@slake_trait_object_method107"

/-- One-hundred-ninth Method LLVM symbol (method108). -/
def method108FnSymbol : String := "@slake_trait_object_method108"

/-- One-hundred-tenth Method LLVM symbol (method109). -/
def method109FnSymbol : String := "@slake_trait_object_method109"

/-- One-hundred-eleventh Method LLVM symbol (method110). -/
def method110FnSymbol : String := "@slake_trait_object_method110"

/-- One-hundred-twelfth Method LLVM symbol (method111). -/
def method111FnSymbol : String := "@slake_trait_object_method111"

/-- One-hundred-thirteenth Method LLVM symbol (method112). -/
def method112FnSymbol : String := "@slake_trait_object_method112"

/-- One-hundred-fourteenth Method LLVM symbol (method113). -/
def method113FnSymbol : String := "@slake_trait_object_method113"

/-- One-hundred-fifteenth Method LLVM symbol (method114). -/
def method114FnSymbol : String := "@slake_trait_object_method114"

/-- One-hundred-sixteenth Method LLVM symbol (method115). -/
def method115FnSymbol : String := "@slake_trait_object_method115"

/-- One-hundred-seventeenth Method LLVM symbol (method116). -/
def method116FnSymbol : String := "@slake_trait_object_method116"

/-- One-hundred-eighteenth Method LLVM symbol (method117). -/
def method117FnSymbol : String := "@slake_trait_object_method117"

/-- One-hundred-nineteenth Method LLVM symbol (method118). -/
def method118FnSymbol : String := "@slake_trait_object_method118"

/-- One-hundred-twentieth Method LLVM symbol (method119). -/
def method119FnSymbol : String := "@slake_trait_object_method119"

/-- One-hundred-twenty-first Method LLVM symbol (method120). -/
def method120FnSymbol : String := "@slake_trait_object_method120"

/-- One-hundred-twenty-second Method LLVM symbol (method121). -/
def method121FnSymbol : String := "@slake_trait_object_method121"

/-- One-hundred-twenty-third Method LLVM symbol (method122). -/
def method122FnSymbol : String := "@slake_trait_object_method122"

/-- One-hundred-twenty-fourth Method LLVM symbol (method123). -/
def method123FnSymbol : String := "@slake_trait_object_method123"

/-- One-hundred-twenty-fifth Method LLVM symbol (method124). -/
def method124FnSymbol : String := "@slake_trait_object_method124"

/-- One-hundred-twenty-sixth Method LLVM symbol (method125). -/
def method125FnSymbol : String := "@slake_trait_object_method125"

/-- One-hundred-twenty-seventh Method LLVM symbol (method126). -/
def method126FnSymbol : String := "@slake_trait_object_method126"

/-- One-hundred-twenty-eighth Method LLVM symbol (method127). -/
def method127FnSymbol : String := "@slake_trait_object_method127"

/-- Vacant reserved pointer operand (rustc Uninit; fixture ptr null). -/
def vacantSlotSymbol : String := "null"

/-- Header-only supertrait vtable global. -/
def supertraitVtableGlobal : String := "@slake_trait_object_supertrait_vtable"

/-- Principal fixture vtable global. -/
def fixtureVtableGlobal : String := "@slake_trait_object_vtable_fixture"

/-- Named null fat-pointer global. -/
def recordNullGlobal : String := "@slake_trait_object_record_null"

/-- Header-only supertrait vtable (slots 0/1/2).
    Greppable: traitObjectSupertraitVtable. -/
def traitObjectSupertraitVtable : TraitObjectVtableValue where
  slots :=
    [ { kind := VtableSlotKind.dropInPlace, symbol := dropInPlaceFnSymbol }
    , { kind := VtableSlotKind.size, symbol := "" }
    , { kind := VtableSlotKind.align, symbol := "" }
    ]

/-- Principal fixture vtable: header, one hundred twenty-eight Methods, Vacant, TraitVPtr. /
    Greppable: traitObjectFixtureVtable. -/
def traitObjectFixtureVtable : TraitObjectVtableValue where
  slots :=
    [ { kind := VtableSlotKind.dropInPlace, symbol := dropInPlaceFnSymbol }
    , { kind := VtableSlotKind.size, symbol := "" }
    , { kind := VtableSlotKind.align, symbol := "" }
    , { kind := VtableSlotKind.method, symbol := method0FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method1FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method2FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method3FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method4FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method5FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method6FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method7FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method8FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method9FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method10FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method11FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method12FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method13FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method14FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method15FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method16FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method17FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method18FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method19FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method20FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method21FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method22FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method23FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method24FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method25FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method26FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method27FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method28FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method29FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method30FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method31FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method32FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method33FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method34FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method35FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method36FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method37FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method38FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method39FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method40FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method41FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method42FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method43FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method44FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method45FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method46FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method47FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method48FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method49FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method50FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method51FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method52FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method53FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method54FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method55FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method56FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method57FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method58FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method59FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method60FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method61FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method62FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method63FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method64FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method65FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method66FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method67FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method68FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method69FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method70FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method71FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method72FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method73FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method74FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method75FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method76FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method77FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method78FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method79FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method80FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method81FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method82FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method83FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method84FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method85FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method86FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method87FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method88FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method89FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method90FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method91FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method92FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method93FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method94FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method95FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method96FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method97FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method98FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method99FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method100FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method101FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method102FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method103FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method104FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method105FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method106FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method107FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method108FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method109FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method110FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method111FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method112FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method113FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method114FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method115FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method116FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method117FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method118FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method119FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method120FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method121FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method122FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method123FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method124FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method125FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method126FnSymbol }
    , { kind := VtableSlotKind.method, symbol := method127FnSymbol }
    , { kind := VtableSlotKind.vacant, symbol := vacantSlotSymbol }
    , { kind := VtableSlotKind.traitVPtr, symbol := supertraitVtableGlobal }
    ]

/-- Named fixture fat pointer: data null, vtable the fixture global.
    Greppable: traitObjectRecordNull, TraitObjectFat. -/
def traitObjectRecordNull : TraitObjectFat where
  dataIsNull := true
  dataSymbol := ""
  vtableSymbol := fixtureVtableGlobal

/-- Host fixture layout matches DualPinOk Nats (not IR text yet).
    Greppable: traitObjectVtableHostValueOk. -/
def traitObjectVtableHostValueOk : Bool :=
  traitObjectRecordNull.dataIsNull
    && (traitObjectRecordNull.dataSymbol == "")
    && (traitObjectRecordNull.vtableSymbol == fixtureVtableGlobal)
    && (traitObjectFixtureVtable.slots.length == vtableFixtureSlotCount)
    && (traitObjectSupertraitVtable.slots.length == vtableSupertraitSlotCount)
    && (match traitObjectFixtureVtable.slots[0]? with
        | some s => s.kind == VtableSlotKind.dropInPlace
          && s.symbol == dropInPlaceFnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[1]? with
        | some s => s.kind == VtableSlotKind.size
        | none => false)
    && (match traitObjectFixtureVtable.slots[2]? with
        | some s => s.kind == VtableSlotKind.align
        | none => false)
    && (match traitObjectFixtureVtable.slots[3]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method0FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[4]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method1FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[5]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method2FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[6]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method3FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[7]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method4FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[8]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method5FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[9]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method6FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[10]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method7FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[11]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method8FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[12]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method9FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[13]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method10FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[14]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method11FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[15]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method12FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[16]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method13FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[17]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method14FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[18]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method15FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[19]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method16FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[20]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method17FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[21]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method18FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[22]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method19FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[23]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method20FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[24]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method21FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[25]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method22FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[26]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method23FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[27]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method24FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[28]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method25FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[29]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method26FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[30]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method27FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[31]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method28FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[32]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method29FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[33]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method30FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[34]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method31FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[35]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method32FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[36]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method33FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[37]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method34FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[38]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method35FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[39]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method36FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[40]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method37FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[41]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method38FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[42]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method39FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[43]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method40FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[44]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method41FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[45]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method42FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[46]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method43FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[47]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method44FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[48]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method45FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[49]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method46FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[50]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method47FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[51]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method48FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[52]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method49FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[53]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method50FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[54]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method51FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[55]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method52FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[56]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method53FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[57]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method54FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[58]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method55FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[59]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method56FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[60]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method57FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[61]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method58FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[62]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method59FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[63]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method60FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[64]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method61FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[65]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method62FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[66]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method63FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[67]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method64FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[68]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method65FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[69]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method66FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[70]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method67FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[71]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method68FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[72]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method69FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[73]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method70FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[74]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method71FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[75]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method72FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[76]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method73FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[77]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method74FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[78]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method75FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[79]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method76FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[80]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method77FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[81]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method78FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[82]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method79FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[83]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method80FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[84]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method81FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[85]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method82FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[86]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method83FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[87]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method84FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[88]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method85FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[89]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method86FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[90]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method87FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[91]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method88FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[92]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method89FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[93]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method90FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[94]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method91FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[95]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method92FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[96]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method93FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[97]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method94FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[98]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method95FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[99]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method96FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[100]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method97FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[101]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method98FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[102]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method99FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[103]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method100FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[104]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method101FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[105]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method102FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[106]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method103FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[107]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method104FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[108]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method105FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[109]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method106FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[110]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method107FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[111]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method108FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[112]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method109FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[113]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method110FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[114]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method111FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[115]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method112FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[116]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method113FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[117]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method114FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[118]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method115FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[119]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method116FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[120]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method117FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[121]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method118FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[122]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method119FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[123]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method120FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[124]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method121FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[125]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method122FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[126]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method123FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[127]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method124FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[128]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method125FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[129]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method126FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[130]? with
        | some s => s.kind == VtableSlotKind.method
          && s.symbol == method127FnSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[131]? with
        | some s => s.kind == VtableSlotKind.vacant
          && s.symbol == vacantSlotSymbol
        | none => false)
    && (match traitObjectFixtureVtable.slots[132]? with
        | some s => s.kind == VtableSlotKind.traitVPtr
          && s.symbol == supertraitVtableGlobal
        | none => false)
    && (hostOriginId == "HOST-TRAIT-OBJECT-FAT")

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Fixture IR artifact basename under out/llvm-ir.
    Greppable: traitObjectVtableIrBasename, trait-object-vtable.ll. -/
def traitObjectVtableIrBasename : String := "trait-object-vtable.ll"

/-- Named just recipe (lean --run writer; not a mill inventory row).
    Greppable: justRecipeLlvmTraitObjectVtable, llvm-trait-object-vtable. -/
def justRecipeLlvmTraitObjectVtable : String := "llvm-trait-object-vtable"

/-- Paired check recipe (dest bytes must equal the Lean printer).
    Greppable: justRecipeLlvmTraitObjectVtableCheck. -/
def justRecipeLlvmTraitObjectVtableCheck : String :=
  "llvm-trait-object-vtable-check"

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- LLVM type of one vtable slot (walk VtableSlotKind). -/
def vtableSlotLlvmType (k : VtableSlotKind) : String :=
  match k with
  | VtableSlotKind.dropInPlace => "ptr"
  | VtableSlotKind.size => "i64"
  | VtableSlotKind.align => "i64"
  | VtableSlotKind.method => "ptr"
  | VtableSlotKind.vacant => "ptr"
  | VtableSlotKind.traitVPtr => "ptr"

/-- Comment label matching today's fixture IR (methodN from slot index). -/
def vtableSlotKindLabel (k : VtableSlotKind) (i : Nat) : String :=
  match k with
  | VtableSlotKind.dropInPlace => "drop_in_place"
  | VtableSlotKind.size => "size"
  | VtableSlotKind.align => "align"
  | VtableSlotKind.method =>
    "method" ++ toString (i - vtableFirstMethodSlot)
  | VtableSlotKind.vacant => "Vacant"
  | VtableSlotKind.traitVPtr => "TraitVPtr"

/-- rustc_abi suffix on size/align/method/TraitVPtr comments. -/
def vtableSlotAbiComment (k : VtableSlotKind) : String :=
  match k with
  | VtableSlotKind.size => " rustc_abi usize"
  | VtableSlotKind.align => " rustc_abi usize"
  | VtableSlotKind.method => " rustc_abi pointer"
  | VtableSlotKind.vacant => " rustc_abi pointer VtblEntry::Vacant"
  | VtableSlotKind.traitVPtr => " rustc_abi pointer"
  | _ => ""

/-- LLVM operand for one slot (usize Nats for size/align; symbol for ptrs). -/
def vtableSlotOperand (s : VtableSlot) : String :=
  match s.kind with
  | VtableSlotKind.size =>
    "i64 " ++ toString vtableFixturePayloadSizeBytes
  | VtableSlotKind.align =>
    "i64 " ++ toString vtableFixturePayloadAlignBytes
  | _ => "ptr " ++ s.symbol

/-- Comma-separated LLVM types from ordered host slots. -/
def emitLlvmTypeList : List VtableSlot -> String
  | [] => ""
  | s :: rest =>
    match rest with
    | [] => vtableSlotLlvmType s.kind
    | _ => vtableSlotLlvmType s.kind ++ ", " ++ emitLlvmTypeList rest

/-- Constant body lines from ordered host slots (offsets DualPinOk Nats). -/
def emitVtableSlotLines : List VtableSlot -> Nat -> String
  | [], _ => ""
  | s :: rest, i =>
    let comma :=
      match rest with
      | [] => ""
      | _ => ","
    let line :=
      "  " ++ vtableSlotOperand s ++ comma ++ " ; slot " ++ toString i ++ " "
        ++ vtableSlotKindLabel s.kind i ++ " offset "
        ++ toString (vtableSlotOffset i) ++ vtableSlotAbiComment s.kind ++ "\n"
    line ++ emitVtableSlotLines rest (i + 1)

/-- One vtable global walked from a host value. -/
def emitVtableConstant (globalName typeName : String)
    (vt : TraitObjectVtableValue) : String :=
  globalName ++ " = constant %" ++ typeName ++ " {\n"
    ++ emitVtableSlotLines vt.slots 0
    ++ "}, align " ++ toString vtableFixtureAlignBytes ++ "\n"

/-- Fat-pointer global walked from TraitObjectFat (null vs named data). -/
def emitFatConstant (fat : TraitObjectFat) : String :=
  let dataOp :=
    if fat.dataIsNull then "ptr null" else "ptr " ++ fat.dataSymbol
  recordNullGlobal ++ " = constant %TraitObjectRecord {\n"
    ++ "  " ++ dataOp ++ ",\n"
    ++ "  ptr " ++ fat.vtableSymbol ++ "\n"
    ++ "}, align " ++ toString traitObjectAlignBytes ++ "\n"

/-- Empty stub function for a drop or method symbol. -/
def emitStubFn (sym : String) : String :=
  "define void " ++ sym ++ "(ptr %data) {\n"
    ++ "entry:\n"
    ++ "  ret void\n"
    ++ "}\n"

/-- Method stubs walked from host slot list. -/
def emitMethodStubsFrom : List VtableSlot -> String
  | [] => ""
  | s :: rest =>
    match s.kind with
    | VtableSlotKind.method =>
      emitStubFn s.symbol ++ "\n" ++ emitMethodStubsFrom rest
    | _ => emitMethodStubsFrom rest

/-- IR banner comments (stage + host-origin token + rustc_abi slots).
    Greppable: traitObjectVtableIrBanner, HOST-TRAIT-OBJECT-FAT. -/
def traitObjectVtableIrBanner : String :=
  "; SLAKE_TRAIT_OBJECT_VTABLE_V0 / HOST-TRAIT-OBJECT-VTABLE\n"
    ++ "; TRAIT-OBJECT-VTABLE-IR named fixture (not FullBackend)\n"
    ++ "; " ++ hostOriginId
    ++ " host-originated emit (walk TraitObjectFat + slots)\n"
    ++ "; rustc_abi ScalarPair two pointers; COMMON_VTABLE_ENTRIES "
    ++ "drop/size/align then methods\n"
    ++ "; SSOT: src/systems/SystemsLean/TraitObjectVtable.lean\n"
    ++ "; Path: " ++ llvmIrOutPathCite ++ "/" ++ traitObjectVtableIrBasename
    ++ "\n"
    ++ "; Target: " ++ foreignLinkTargetTriple ++ "\n"
    ++ "; Fat pointer TraitObjectRecord: data offset "
    ++ toString dataPtrOffset ++ ", vtable offset "
    ++ toString vtablePtrOffset ++ ", size "
    ++ toString traitObjectSizeBytes ++ ", align "
    ++ toString traitObjectAlignBytes ++ "\n"
    ++ "; Vtable fixture: " ++ toString vtableFixtureSlotCount ++ " slots, "
    ++ toString vtableFixtureSizeBytes ++ " bytes, align "
    ++ toString vtableFixtureAlignBytes ++ "\n"
    ++ "; slot " ++ toString vtableSlotDropInPlace ++ " drop_in_place offset "
    ++ toString vtableDropInPlaceOffset ++ "\n"
    ++ "; slot " ++ toString vtableSlotSize ++ " size offset "
    ++ toString vtableSizeOffset ++ " (usize / i64)\n"
    ++ "; slot " ++ toString vtableSlotAlign ++ " align offset "
    ++ toString vtableAlignOffset ++ " (usize / i64)\n"
    ++ "; slot " ++ toString vtableFirstMethodSlot ++ " method0 offset "
    ++ toString vtableFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSecondMethodSlot ++ " method1 offset "
    ++ toString vtableSecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirdMethodSlot ++ " method2 offset "
    ++ toString vtableThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFourthMethodSlot ++ " method3 offset "
    ++ toString vtableFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFifthMethodSlot ++ " method4 offset "
    ++ toString vtableFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixthMethodSlot ++ " method5 offset "
    ++ toString vtableSixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventhMethodSlot ++ " method6 offset "
    ++ toString vtableSeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEighthMethodSlot ++ " method7 offset "
    ++ toString vtableEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinthMethodSlot ++ " method8 offset "
    ++ toString vtableNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTenthMethodSlot ++ " method9 offset "
    ++ toString vtableTenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEleventhMethodSlot ++ " method10 offset "
    ++ toString vtableEleventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwelfthMethodSlot ++ " method11 offset "
    ++ toString vtableTwelfthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirteenthMethodSlot ++ " method12 offset "
    ++ toString vtableThirteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFourteenthMethodSlot ++ " method13 offset "
    ++ toString vtableFourteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFifteenthMethodSlot ++ " method14 offset "
    ++ toString vtableFifteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixteenthMethodSlot ++ " method15 offset "
    ++ toString vtableSixteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventeenthMethodSlot ++ " method16 offset "
    ++ toString vtableSeventeenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEighteenthMethodSlot ++ " method17 offset "
    ++ toString vtableEighteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNineteenthMethodSlot ++ " method18 offset "
    ++ toString vtableNineteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentiethMethodSlot ++ " method19 offset "
    ++ toString vtableTwentiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentyFirstMethodSlot ++ " method20 offset "
    ++ toString vtableTwentyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentySecondMethodSlot ++ " method21 offset "
    ++ toString vtableTwentySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentyThirdMethodSlot ++ " method22 offset "
    ++ toString vtableTwentyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentyFourthMethodSlot ++ " method23 offset "
    ++ toString vtableTwentyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentyFifthMethodSlot ++ " method24 offset "
    ++ toString vtableTwentyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentySixthMethodSlot ++ " method25 offset "
    ++ toString vtableTwentySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentySeventhMethodSlot ++ " method26 offset "
    ++ toString vtableTwentySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentyEighthMethodSlot ++ " method27 offset "
    ++ toString vtableTwentyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableTwentyNinthMethodSlot ++ " method28 offset "
    ++ toString vtableTwentyNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtiethMethodSlot ++ " method29 offset "
    ++ toString vtableThirtiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtyFirstMethodSlot ++ " method30 offset "
    ++ toString vtableThirtyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtySecondMethodSlot ++ " method31 offset "
    ++ toString vtableThirtySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtyThirdMethodSlot ++ " method32 offset "
    ++ toString vtableThirtyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtyFourthMethodSlot ++ " method33 offset "
    ++ toString vtableThirtyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtyFifthMethodSlot ++ " method34 offset "
    ++ toString vtableThirtyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtySixthMethodSlot ++ " method35 offset "
    ++ toString vtableThirtySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtySeventhMethodSlot ++ " method36 offset "
    ++ toString vtableThirtySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtyEighthMethodSlot ++ " method37 offset "
    ++ toString vtableThirtyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableThirtyNinthMethodSlot ++ " method38 offset "
    ++ toString vtableThirtyNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortiethMethodSlot ++ " method39 offset "
    ++ toString vtableFortiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortyFirstMethodSlot ++ " method40 offset "
    ++ toString vtableFortyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortySecondMethodSlot ++ " method41 offset "
    ++ toString vtableFortySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortyThirdMethodSlot ++ " method42 offset "
    ++ toString vtableFortyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortyFourthMethodSlot ++ " method43 offset "
    ++ toString vtableFortyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortyFifthMethodSlot ++ " method44 offset "
    ++ toString vtableFortyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortySixthMethodSlot ++ " method45 offset "
    ++ toString vtableFortySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortySeventhMethodSlot ++ " method46 offset "
    ++ toString vtableFortySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortyEighthMethodSlot ++ " method47 offset "
    ++ toString vtableFortyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFortyNinthMethodSlot ++ " method48 offset "
    ++ toString vtableFortyNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftiethMethodSlot ++ " method49 offset "
    ++ toString vtableFiftiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftyFirstMethodSlot ++ " method50 offset "
    ++ toString vtableFiftyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftySecondMethodSlot ++ " method51 offset "
    ++ toString vtableFiftySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftyThirdMethodSlot ++ " method52 offset "
    ++ toString vtableFiftyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftyFourthMethodSlot ++ " method53 offset "
    ++ toString vtableFiftyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftyFifthMethodSlot ++ " method54 offset "
    ++ toString vtableFiftyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftySixthMethodSlot ++ " method55 offset "
    ++ toString vtableFiftySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftySeventhMethodSlot ++ " method56 offset "
    ++ toString vtableFiftySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftyEighthMethodSlot ++ " method57 offset "
    ++ toString vtableFiftyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFiftyNinthMethodSlot ++ " method58 offset "
    ++ toString vtableFiftyNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtiethMethodSlot ++ " method59 offset "
    ++ toString vtableSixtiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtyFirstMethodSlot ++ " method60 offset "
    ++ toString vtableSixtyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtySecondMethodSlot ++ " method61 offset "
    ++ toString vtableSixtySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtyThirdMethodSlot ++ " method62 offset "
    ++ toString vtableSixtyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtyFourthMethodSlot ++ " method63 offset "
    ++ toString vtableSixtyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtyFifthMethodSlot ++ " method64 offset "
    ++ toString vtableSixtyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtySixthMethodSlot ++ " method65 offset "
    ++ toString vtableSixtySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtySeventhMethodSlot ++ " method66 offset "
    ++ toString vtableSixtySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtyEighthMethodSlot ++ " method67 offset "
    ++ toString vtableSixtyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSixtyNinthMethodSlot ++ " method68 offset "
    ++ toString vtableSixtyNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventiethMethodSlot ++ " method69 offset "
    ++ toString vtableSeventiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventyFirstMethodSlot ++ " method70 offset "
    ++ toString vtableSeventyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventySecondMethodSlot ++ " method71 offset "
    ++ toString vtableSeventySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventyThirdMethodSlot ++ " method72 offset "
    ++ toString vtableSeventyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventyFourthMethodSlot ++ " method73 offset "
    ++ toString vtableSeventyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventyFifthMethodSlot ++ " method74 offset "
    ++ toString vtableSeventyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventySixthMethodSlot ++ " method75 offset "
    ++ toString vtableSeventySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventySeventhMethodSlot ++ " method76 offset "
    ++ toString vtableSeventySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventyEighthMethodSlot ++ " method77 offset "
    ++ toString vtableSeventyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableSeventyNinthMethodSlot ++ " method78 offset "
    ++ toString vtableSeventyNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightiethMethodSlot ++ " method79 offset "
    ++ toString vtableEightiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightyFirstMethodSlot ++ " method80 offset "
    ++ toString vtableEightyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightySecondMethodSlot ++ " method81 offset "
    ++ toString vtableEightySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightyThirdMethodSlot ++ " method82 offset "
    ++ toString vtableEightyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightyFourthMethodSlot ++ " method83 offset "
    ++ toString vtableEightyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightyFifthMethodSlot ++ " method84 offset "
    ++ toString vtableEightyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightySixthMethodSlot ++ " method85 offset "
    ++ toString vtableEightySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightySeventhMethodSlot ++ " method86 offset "
    ++ toString vtableEightySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightyEighthMethodSlot ++ " method87 offset "
    ++ toString vtableEightyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableEightyNinthMethodSlot ++ " method88 offset "
    ++ toString vtableEightyNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetiethMethodSlot ++ " method89 offset "
    ++ toString vtableNinetiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetyFirstMethodSlot ++ " method90 offset "
    ++ toString vtableNinetyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetySecondMethodSlot ++ " method91 offset "
    ++ toString vtableNinetySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetyThirdMethodSlot ++ " method92 offset "
    ++ toString vtableNinetyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetyFourthMethodSlot ++ " method93 offset "
    ++ toString vtableNinetyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetyFifthMethodSlot ++ " method94 offset "
    ++ toString vtableNinetyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetySixthMethodSlot ++ " method95 offset "
    ++ toString vtableNinetySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetySeventhMethodSlot ++ " method96 offset "
    ++ toString vtableNinetySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetyEighthMethodSlot ++ " method97 offset "
    ++ toString vtableNinetyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableNinetyNinthMethodSlot ++ " method98 offset "
    ++ toString vtableNinetyNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredthMethodSlot ++ " method99 offset "
    ++ toString vtableOneHundredthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredFirstMethodSlot ++ " method100 offset "
    ++ toString vtableOneHundredFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredSecondMethodSlot ++ " method101 offset "
    ++ toString vtableOneHundredSecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredThirdMethodSlot ++ " method102 offset "
    ++ toString vtableOneHundredThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredFourthMethodSlot ++ " method103 offset "
    ++ toString vtableOneHundredFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredFifthMethodSlot ++ " method104 offset "
    ++ toString vtableOneHundredFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredSixthMethodSlot ++ " method105 offset "
    ++ toString vtableOneHundredSixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredSeventhMethodSlot ++ " method106 offset "
    ++ toString vtableOneHundredSeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredEighthMethodSlot ++ " method107 offset "
    ++ toString vtableOneHundredEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredNinthMethodSlot ++ " method108 offset "
    ++ toString vtableOneHundredNinthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTenthMethodSlot ++ " method109 offset "
    ++ toString vtableOneHundredTenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredEleventhMethodSlot ++ " method110 offset "
    ++ toString vtableOneHundredEleventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwelfthMethodSlot ++ " method111 offset "
    ++ toString vtableOneHundredTwelfthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredThirteenthMethodSlot ++ " method112 offset "
    ++ toString vtableOneHundredThirteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredFourteenthMethodSlot ++ " method113 offset "
    ++ toString vtableOneHundredFourteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredFifteenthMethodSlot ++ " method114 offset "
    ++ toString vtableOneHundredFifteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredSixteenthMethodSlot ++ " method115 offset "
    ++ toString vtableOneHundredSixteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredSeventeenthMethodSlot ++ " method116 offset "
    ++ toString vtableOneHundredSeventeenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredEighteenthMethodSlot ++ " method117 offset "
    ++ toString vtableOneHundredEighteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredNineteenthMethodSlot ++ " method118 offset "
    ++ toString vtableOneHundredNineteenthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentiethMethodSlot ++ " method119 offset "
    ++ toString vtableOneHundredTwentiethMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentyFirstMethodSlot ++ " method120 offset "
    ++ toString vtableOneHundredTwentyFirstMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentySecondMethodSlot ++ " method121 offset "
    ++ toString vtableOneHundredTwentySecondMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentyThirdMethodSlot ++ " method122 offset "
    ++ toString vtableOneHundredTwentyThirdMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentyFourthMethodSlot ++ " method123 offset "
    ++ toString vtableOneHundredTwentyFourthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentyFifthMethodSlot ++ " method124 offset "
    ++ toString vtableOneHundredTwentyFifthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentySixthMethodSlot ++ " method125 offset "
    ++ toString vtableOneHundredTwentySixthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentySeventhMethodSlot ++ " method126 offset "
    ++ toString vtableOneHundredTwentySeventhMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableOneHundredTwentyEighthMethodSlot ++ " method127 offset "
    ++ toString vtableOneHundredTwentyEighthMethodOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFirstVacantSlot ++ " Vacant offset "
    ++ toString vtableVacantOffset ++ " rustc_abi pointer\n"
    ++ "; slot " ++ toString vtableFirstTraitVPtrSlot ++ " TraitVPtr offset "
    ++ toString vtableTraitVPtrOffset ++ " rustc_abi pointer\n"
    ++ "; Occupancy stays 49. Not occupancy member 50. FullHost false. "
    ++ "FullBackend false.\n"
    ++ "\n"

/-- Target triple line. Greppable: traitObjectVtableIrTarget. -/
def traitObjectVtableIrTarget : String :=
  "target triple = \"" ++ foreignLinkTargetTriple ++ "\"\n"
    ++ "\n"

/-- Named LLVM types walked from host slot kinds.
    Greppable: traitObjectVtableIrTypes, TraitObjectRecord. -/
def traitObjectVtableIrTypes : String :=
  "; Fat pointer: { data, vtable }\n"
    ++ "%TraitObjectRecord = type { ptr, ptr }\n"
    ++ "\n"
    ++ "; Vtable fixture: drop_in_place, size, align, method0, method1, method2, method3, method4, method5, method6, method7, method8, method9, method10, method11, method12, method13, method14, method15, method16, method17, method18, method19, method20, method21, method22, method23, method24, method25, method26, method27, method28, method29, method30, method31, method32, method33, method34, method35, method36, method37, method38, method39, method40, method41, method42, method43, method44, method45, method46, method47, method48, method49, method50, method51, method52, method53, method54, method55, method56, method57, method58, method59, method60, method61, method62, method63, method64, method65, method66, method67, method68, method69, method70, method71, method72, method73, method74, method75, method76, method77, method78, method79, method80, method81, method82, method83, method84, method85, method86, method87, method88, method89, method90, method91, method92, method93, method94, method95, method96, method97, method98, method99, method100, method101, method102, method103, method104, method105, method106, method107, method108, method109, method110, method111, method112, method113, method114, method115, method116, method117, method118, method119, method120, method121, method122, method123, method124, method125, method126, method127, Vacant, TraitVPtr\n"
    ++ "%TraitObjectVtableFixture = type { "
    ++ emitLlvmTypeList traitObjectFixtureVtable.slots ++ " }\n"
    ++ "\n"
    ++ "; Supertrait vtable (header-only; TraitVPtr target)\n"
    ++ "%TraitObjectSupertraitVtable = type { "
    ++ emitLlvmTypeList traitObjectSupertraitVtable.slots ++ " }\n"
    ++ "\n"
    ++ "; Payload for size/align slots (data object, not the fat pointer)\n"
    ++ "%TraitObjectFixturePayload = type { i64 }\n"
    ++ "\n"

/-- Fixture function decls walked from drop + Method host symbols.
    Greppable: traitObjectVtableIrDecls, slake_trait_object_drop_in_place. -/
def traitObjectVtableIrDecls : String :=
  emitStubFn dropInPlaceFnSymbol ++ "\n"
    ++ emitMethodStubsFrom traitObjectFixtureVtable.slots

/-- Fixture globals walked from supertrait / principal vtable host values
    plus TraitObjectFat. Greppable: traitObjectVtableIrGlobals,
    slake_trait_object_vtable_fixture, slake_trait_object_supertrait_vtable. -/
def traitObjectVtableIrGlobals : String :=
  emitVtableConstant supertraitVtableGlobal "TraitObjectSupertraitVtable"
      traitObjectSupertraitVtable
    ++ "\n"
    ++ emitVtableConstant fixtureVtableGlobal "TraitObjectVtableFixture"
      traitObjectFixtureVtable
    ++ "\n"
    ++ emitFatConstant traitObjectRecordNull

/-- Full fixture IR package text (Lean SSOT).
    Greppable: traitObjectVtableIrPackage, trait-object-vtable.ll. -/
def traitObjectVtableIrPackage : String :=
  traitObjectVtableIrBanner ++ traitObjectVtableIrTarget
    ++ traitObjectVtableIrTypes ++ traitObjectVtableIrDecls
    ++ traitObjectVtableIrGlobals

/-- Structural IR identity (assembled text equals parts; path cites).
    Greppable: traitObjectVtableIrPackageOk. -/
def traitObjectVtableIrPackageOk : Bool :=
  (traitObjectVtableIrPackage
    == traitObjectVtableIrBanner ++ traitObjectVtableIrTarget
      ++ traitObjectVtableIrTypes ++ traitObjectVtableIrDecls
      ++ traitObjectVtableIrGlobals)
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (traitObjectVtableIrBasename == "trait-object-vtable.ll")
    && (vtableFixturePayloadSizeBytes == 8)
    && (vtableFixturePayloadAlignBytes == 8)
    && containsSub traitObjectVtableIrPackage hostOriginId
    && traitObjectVtableHostValueOk

/-- rustc_abi cite (read-only under ref/rust).
    Greppable: rustcAbiCite, rustc_abi, ScalarPair. -/
def rustcAbiCite : String :=
  "rustc_abi TargetDataLayout default pointer_size 8 pointer_align 8; " ++
    "BackendRepr::ScalarPair two scalars in memory order; " ++
    "scalar_pair b_offset = align_to(size(a), align(b)) " ++
    "(ref/rust/compiler/rustc_abi/src/lib.rs; " ++
    "ref/rust/compiler/rustc_abi/src/layout/simple.rs)"

/-- Related vtable slot cite (not rustc_abi; layout of the vtable itself).
    Greppable: rustcVtableCite, COMMON_VTABLE_ENTRIES. -/
def rustcVtableCite : String :=
  "rustc_middle ty/vtable.rs COMMON_VTABLE_ENTRIES " ++
    "[MetadataDropInPlace, MetadataSize, MetadataAlign] indices 0,1,2; " ++
    "then Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Vacant / TraitVPtr " ++
    "(ref/rust/compiler/rustc_middle/src/ty/vtable.rs); " ++
    "codegen cranelift vtable.rs loads drop/size/align at those indices " ++
    "times usize_size; llvm debuginfo names drop_in_place, size, align"

/-- Surface honesty: LLVM IR is the Rust-compatible surface.
    Greppable: llvmIrSurfaceHonesty. -/
def llvmIrSurfaceHonesty : String :=
  "LLVM IR is the Rust-compatible surface; rustc_abi is the check; " ++
    "this module dual-pins layout and walks TraitObjectFat into fixture IR; " ++
    "just llvm-trait-object-vtable regenerates dest from Lean and " ++
    "fails if bytes differ; not FullBackend; not production emit claimed"

/-- Out-of-tree honesty: no product Rust under src/. -/
def outOfTreeConsumerHonesty : String :=
  "no product Rust under src/; rustc_abi and rustc_middle are read-only ref/"

/-- First dual-pin finished for the host model. -/
def traitObjectVtableDualPinClaimed : Bool := true

/-- Full LLVM production backend -- MUST stay false. -/
def traitObjectVtableFullBackendClaimed : Bool := false

/-- FullHostElaborateRemains -- MUST stay false. -/
def traitObjectVtableFullHostClaimed : Bool := false

/-- Occupancy named membership -- MUST stay false (not a 50th name). -/
def traitObjectVtableOccupancyMemberClaimed : Bool := false

/-- Named fixture LLVM IR emit (one two-pointer record, not FullBackend). -/
def traitObjectVtableLlvmEmitClaimed : Bool := true

/-- Checkable Lean writer path (just llvm-trait-object-vtable).
    Regenerates dest from the printer and fails if bytes differ.
    Not FullBackend. Not a lake-proved production-emit claim. -/
def traitObjectVtableCheckableWriterClaimed : Bool := true

/-- Production LLVM emit of vtables -- MUST stay false.
    The checkable writer is the named fixture path, not FullBackend
    production emit. Lake verify is not this slice. -/
def traitObjectVtableProductionEmitClaimed : Bool := false

set_option maxRecDepth 2048
set_option maxHeartbeats 500000

/-- rustc_abi / rustc_middle numeric dual-pin on the named target.
    Nested Bool.and on the living Method map exceeds default rec depth.
    method127 slot 130 one-hundred-twenty-eighth; Vacant 131; TraitVPtr 132.
    Greppable: traitObjectVtableDualPinOk, TRAIT-OBJECT-VTABLE-IR. -/
def traitObjectVtableDualPinOk : Bool :=
  (foreignLinkTargetTriple == "x86_64-unknown-linux-gnu")
    && (pointerSizeBytes == 8)
    && (pointerAlignBytes == 8)
    && (usizeSizeBytes == 8)
    && (dataPtrOffset == 0)
    && (vtablePtrOffset == 8)
    && (traitObjectEndBytes == 16)
    && (traitObjectPadBytes == 0)
    && (traitObjectSizeBytes == 16)
    && (traitObjectAlignBytes == 8)
    && (traitObjectPointerCount == 2)
    && (vtableSlotDropInPlace == 0)
    && (vtableSlotSize == 1)
    && (vtableSlotAlign == 2)
    && (vtableHeaderSlotKind 0 == some VtableSlotKind.dropInPlace)
    && (vtableHeaderSlotKind 1 == some VtableSlotKind.size)
    && (vtableHeaderSlotKind 2 == some VtableSlotKind.align)
    && (vtableHeaderSlotKind 3 == none)
    && (vtableSlotKind 0 == some VtableSlotKind.dropInPlace)
    && (vtableSlotKind 1 == some VtableSlotKind.size)
    && (vtableSlotKind 2 == some VtableSlotKind.align)
    && (vtableSlotKind 3 == some VtableSlotKind.method)
    && (vtableSlotKind 4 == some VtableSlotKind.method)
    && (vtableSlotKind 5 == some VtableSlotKind.method)
    && (vtableSlotKind 6 == some VtableSlotKind.method)
    && (vtableSlotKind 7 == some VtableSlotKind.method)
    && (vtableSlotKind 8 == some VtableSlotKind.method)
    && (vtableSlotKind 9 == some VtableSlotKind.method)
    && (vtableSlotKind 10 == some VtableSlotKind.method)
    && (vtableSlotKind 11 == some VtableSlotKind.method)
    && (vtableSlotKind 12 == some VtableSlotKind.method)
    && (vtableSlotKind 13 == some VtableSlotKind.method)
    && (vtableSlotKind 14 == some VtableSlotKind.method)
    && (vtableSlotKind 15 == some VtableSlotKind.method)
    && (vtableSlotKind 16 == some VtableSlotKind.method)
    && (vtableSlotKind 17 == some VtableSlotKind.method)
    && (vtableSlotKind 18 == some VtableSlotKind.method)
    && (vtableSlotKind 19 == some VtableSlotKind.method)
    && (vtableSlotKind 20 == some VtableSlotKind.method)
    && (vtableSlotKind 21 == some VtableSlotKind.method)
    && (vtableSlotKind 22 == some VtableSlotKind.method)
    && (vtableSlotKind 23 == some VtableSlotKind.method)
    && (vtableSlotKind 24 == some VtableSlotKind.method)
    && (vtableSlotKind 25 == some VtableSlotKind.method)
    && (vtableSlotKind 26 == some VtableSlotKind.method)
    && (vtableSlotKind 27 == some VtableSlotKind.method)
    && (vtableSlotKind 28 == some VtableSlotKind.method)
    && (vtableSlotKind 29 == some VtableSlotKind.method)
    && (vtableSlotKind 30 == some VtableSlotKind.method)
    && (vtableSlotKind 31 == some VtableSlotKind.method)
    && (vtableSlotKind 32 == some VtableSlotKind.method)
    && (vtableSlotKind 33 == some VtableSlotKind.method)
    && (vtableSlotKind 34 == some VtableSlotKind.method)
    && (vtableSlotKind 35 == some VtableSlotKind.method)
    && (vtableSlotKind 36 == some VtableSlotKind.method)
    && (vtableSlotKind 37 == some VtableSlotKind.method)
    && (vtableSlotKind 38 == some VtableSlotKind.method)
    && (vtableSlotKind 39 == some VtableSlotKind.method)
    && (vtableSlotKind 40 == some VtableSlotKind.method)
    && (vtableSlotKind 41 == some VtableSlotKind.method)
    && (vtableSlotKind 42 == some VtableSlotKind.method)
    && (vtableSlotKind 43 == some VtableSlotKind.method)
    && (vtableSlotKind 44 == some VtableSlotKind.method)
    && (vtableSlotKind 45 == some VtableSlotKind.method)
    && (vtableSlotKind 46 == some VtableSlotKind.method)
    && (vtableSlotKind 47 == some VtableSlotKind.method)
    && (vtableSlotKind 48 == some VtableSlotKind.method)
    && (vtableSlotKind 49 == some VtableSlotKind.method)
    && (vtableSlotKind 50 == some VtableSlotKind.method)
    && (vtableSlotKind 51 == some VtableSlotKind.method)
    && (vtableSlotKind 52 == some VtableSlotKind.method)
    && (vtableSlotKind 53 == some VtableSlotKind.method)
    && (vtableSlotKind 54 == some VtableSlotKind.method)
    && (vtableSlotKind 55 == some VtableSlotKind.method)
    && (vtableSlotKind 56 == some VtableSlotKind.method)
    && (vtableSlotKind 57 == some VtableSlotKind.method)
    && (vtableSlotKind 58 == some VtableSlotKind.method)
    && (vtableSlotKind 59 == some VtableSlotKind.method)
    && (vtableSlotKind 60 == some VtableSlotKind.method)
    && (vtableSlotKind 61 == some VtableSlotKind.method)
    && (vtableSlotKind 62 == some VtableSlotKind.method)
    && (vtableSlotKind 63 == some VtableSlotKind.method)
    && (vtableSlotKind 64 == some VtableSlotKind.method)
    && (vtableSlotKind 65 == some VtableSlotKind.method)
    && (vtableSlotKind 66 == some VtableSlotKind.method)
    && (vtableSlotKind 67 == some VtableSlotKind.method)
    && (vtableSlotKind 68 == some VtableSlotKind.method)
    && (vtableSlotKind 69 == some VtableSlotKind.method)
    && (vtableSlotKind 70 == some VtableSlotKind.method)
    && (vtableSlotKind 71 == some VtableSlotKind.method)
    && (vtableSlotKind 72 == some VtableSlotKind.method)
    && (vtableSlotKind 73 == some VtableSlotKind.method)
    && (vtableSlotKind 74 == some VtableSlotKind.method)
    && (vtableSlotKind 75 == some VtableSlotKind.method)
    && (vtableSlotKind 76 == some VtableSlotKind.method)
    && (vtableSlotKind 77 == some VtableSlotKind.method)
    && (vtableSlotKind 78 == some VtableSlotKind.method)
    && (vtableSlotKind 79 == some VtableSlotKind.method)
    && (vtableSlotKind 80 == some VtableSlotKind.method)
    && (vtableSlotKind 81 == some VtableSlotKind.method)
    && (vtableSlotKind 82 == some VtableSlotKind.method)
    && (vtableSlotKind 83 == some VtableSlotKind.method)
    && (vtableSlotKind 84 == some VtableSlotKind.method)
    && (vtableSlotKind 85 == some VtableSlotKind.method)
    && (vtableSlotKind 86 == some VtableSlotKind.method)
    && (vtableSlotKind 87 == some VtableSlotKind.method)
    && (vtableSlotKind 88 == some VtableSlotKind.method)
    && (vtableSlotKind 89 == some VtableSlotKind.method)
    && (vtableSlotKind 90 == some VtableSlotKind.method)
    && (vtableSlotKind 91 == some VtableSlotKind.method)
    && (vtableSlotKind 92 == some VtableSlotKind.method)
    && (vtableSlotKind 93 == some VtableSlotKind.method)
    && (vtableSlotKind 94 == some VtableSlotKind.method)
    && (vtableSlotKind 95 == some VtableSlotKind.method)
    && (vtableSlotKind 96 == some VtableSlotKind.method)
    && (vtableSlotKind 97 == some VtableSlotKind.method)
    && (vtableSlotKind 98 == some VtableSlotKind.method)
    && (vtableSlotKind 99 == some VtableSlotKind.method)
    && (vtableSlotKind 100 == some VtableSlotKind.method)
    && (vtableSlotKind 101 == some VtableSlotKind.method)
    && (vtableSlotKind 102 == some VtableSlotKind.method)
    && (vtableSlotKind 103 == some VtableSlotKind.method)
    && (vtableSlotKind 104 == some VtableSlotKind.method)
    && (vtableSlotKind 105 == some VtableSlotKind.method)
    && (vtableSlotKind 106 == some VtableSlotKind.method)
    && (vtableSlotKind 107 == some VtableSlotKind.method)
    && (vtableSlotKind 108 == some VtableSlotKind.method)
    && (vtableSlotKind 109 == some VtableSlotKind.method)
    && (vtableSlotKind 110 == some VtableSlotKind.method)
    && (vtableSlotKind 111 == some VtableSlotKind.method)
    && (vtableSlotKind 112 == some VtableSlotKind.method)
    && (vtableSlotKind 113 == some VtableSlotKind.method)
    && (vtableSlotKind 114 == some VtableSlotKind.method)
    && (vtableSlotKind 115 == some VtableSlotKind.method)
    && (vtableSlotKind 116 == some VtableSlotKind.method)
    && (vtableSlotKind 117 == some VtableSlotKind.method)
    && (vtableSlotKind 118 == some VtableSlotKind.method)
    && (vtableSlotKind 119 == some VtableSlotKind.method)
    && (vtableSlotKind 120 == some VtableSlotKind.method)
    && (vtableSlotKind 121 == some VtableSlotKind.method)
    && (vtableSlotKind 122 == some VtableSlotKind.method)
    && (vtableSlotKind 123 == some VtableSlotKind.method)
    && (vtableSlotKind 124 == some VtableSlotKind.method)
    && (vtableSlotKind 125 == some VtableSlotKind.method)
    && (vtableSlotKind 126 == some VtableSlotKind.method)
    && (vtableSlotKind 127 == some VtableSlotKind.method)
    && (vtableSlotKind 128 == some VtableSlotKind.method)
    && (vtableSlotKind 129 == some VtableSlotKind.method)
    && (vtableSlotKind 130 == some VtableSlotKind.method)
    && (vtableSlotKind 131 == some VtableSlotKind.vacant)
    && (vtableSlotKind 132 == some VtableSlotKind.traitVPtr)
    && (vtableSlotKind 133 == none)
    && (vtableSlotOffset 3 == pointerSizeBytes * 3)
    && (vtableSlotOffset 4 == pointerSizeBytes * 4)
    && (vtableSlotOffset 5 == pointerSizeBytes * 5)
    && (vtableSlotOffset 6 == pointerSizeBytes * 6)
    && (vtableSlotOffset 7 == pointerSizeBytes * 7)
    && (vtableSlotOffset 8 == pointerSizeBytes * 8)
    && (vtableSlotOffset 9 == pointerSizeBytes * 9)
    && (vtableSlotOffset 10 == pointerSizeBytes * 10)
    && (vtableSlotOffset 11 == pointerSizeBytes * 11)
    && (vtableSlotOffset 12 == pointerSizeBytes * 12)
    && (vtableSlotOffset 13 == pointerSizeBytes * 13)
    && (vtableSlotOffset 14 == pointerSizeBytes * 14)
    && (vtableSlotOffset 15 == pointerSizeBytes * 15)
    && (vtableSlotOffset 16 == pointerSizeBytes * 16)
    && (vtableSlotOffset 17 == pointerSizeBytes * 17)
    && (vtableSlotOffset 18 == pointerSizeBytes * 18)
    && (vtableSlotOffset 19 == pointerSizeBytes * 19)
    && (vtableSlotOffset 20 == pointerSizeBytes * 20)
    && (vtableSlotOffset 21 == pointerSizeBytes * 21)
    && (vtableSlotOffset 22 == pointerSizeBytes * 22)
    && (vtableSlotOffset 23 == pointerSizeBytes * 23)
    && (vtableSlotOffset 24 == pointerSizeBytes * 24)
    && (vtableSlotOffset 25 == pointerSizeBytes * 25)
    && (vtableSlotOffset 26 == pointerSizeBytes * 26)
    && (vtableSlotOffset 27 == pointerSizeBytes * 27)
    && (vtableSlotOffset 28 == pointerSizeBytes * 28)
    && (vtableSlotOffset 29 == pointerSizeBytes * 29)
    && (vtableSlotOffset 30 == pointerSizeBytes * 30)
    && (vtableSlotOffset 31 == pointerSizeBytes * 31)
    && (vtableSlotOffset 32 == pointerSizeBytes * 32)
    && (vtableSlotOffset 33 == pointerSizeBytes * 33)
    && (vtableSlotOffset 34 == pointerSizeBytes * 34)
    && (vtableSlotOffset 35 == pointerSizeBytes * 35)
    && (vtableSlotOffset 36 == pointerSizeBytes * 36)
    && (vtableSlotOffset 37 == pointerSizeBytes * 37)
    && (vtableSlotOffset 38 == pointerSizeBytes * 38)
    && (vtableSlotOffset 39 == pointerSizeBytes * 39)
    && (vtableSlotOffset 40 == pointerSizeBytes * 40)
    && (vtableSlotOffset 41 == pointerSizeBytes * 41)
    && (vtableSlotOffset 42 == pointerSizeBytes * 42)
    && (vtableSlotOffset 43 == pointerSizeBytes * 43)
    && (vtableSlotOffset 44 == pointerSizeBytes * 44)
    && (vtableSlotOffset 45 == pointerSizeBytes * 45)
    && (vtableSlotOffset 46 == pointerSizeBytes * 46)
    && (vtableSlotOffset 47 == pointerSizeBytes * 47)
    && (vtableSlotOffset 48 == pointerSizeBytes * 48)
    && (vtableSlotOffset 49 == pointerSizeBytes * 49)
    && (vtableSlotOffset 50 == pointerSizeBytes * 50)
    && (vtableSlotOffset 51 == pointerSizeBytes * 51)
    && (vtableSlotOffset 52 == pointerSizeBytes * 52)
    && (vtableSlotOffset 53 == pointerSizeBytes * 53)
    && (vtableSlotOffset 54 == pointerSizeBytes * 54)
    && (vtableSlotOffset 55 == pointerSizeBytes * 55)
    && (vtableSlotOffset 56 == pointerSizeBytes * 56)
    && (vtableSlotOffset 57 == pointerSizeBytes * 57)
    && (vtableSlotOffset 58 == pointerSizeBytes * 58)
    && (vtableSlotOffset 59 == pointerSizeBytes * 59)
    && (vtableSlotOffset 60 == pointerSizeBytes * 60)
    && (vtableSlotOffset 61 == pointerSizeBytes * 61)
    && (vtableSlotOffset 62 == pointerSizeBytes * 62)
    && (vtableSlotOffset 63 == pointerSizeBytes * 63)
    && (vtableSlotOffset 64 == pointerSizeBytes * 64)
    && (vtableSlotOffset 65 == pointerSizeBytes * 65)
    && (vtableSlotOffset 66 == pointerSizeBytes * 66)
    && (vtableSlotOffset 67 == pointerSizeBytes * 67)
    && (vtableSlotOffset 68 == pointerSizeBytes * 68)
    && (vtableSlotOffset 69 == pointerSizeBytes * 69)
    && (vtableSlotOffset 70 == pointerSizeBytes * 70)
    && (vtableSlotOffset 71 == pointerSizeBytes * 71)
    && (vtableSlotOffset 72 == pointerSizeBytes * 72)
    && (vtableSlotOffset 73 == pointerSizeBytes * 73)
    && (vtableSlotOffset 74 == pointerSizeBytes * 74)
    && (vtableSlotOffset 75 == pointerSizeBytes * 75)
    && (vtableSlotOffset 76 == pointerSizeBytes * 76)
    && (vtableSlotOffset 77 == pointerSizeBytes * 77)
    && (vtableSlotOffset 78 == pointerSizeBytes * 78)
    && (vtableSlotOffset 79 == pointerSizeBytes * 79)
    && (vtableSlotOffset 80 == pointerSizeBytes * 80)
    && (vtableSlotOffset 81 == pointerSizeBytes * 81)
    && (vtableSlotOffset 82 == pointerSizeBytes * 82)
    && (vtableSlotOffset 83 == pointerSizeBytes * 83)
    && (vtableSlotOffset 84 == pointerSizeBytes * 84)
    && (vtableSlotOffset 85 == pointerSizeBytes * 85)
    && (vtableSlotOffset 86 == pointerSizeBytes * 86)
    && (vtableSlotOffset 87 == pointerSizeBytes * 87)
    && (vtableSlotOffset 88 == pointerSizeBytes * 88)
    && (vtableSlotOffset 89 == pointerSizeBytes * 89)
    && (vtableSlotOffset 90 == pointerSizeBytes * 90)
    && (vtableSlotOffset 91 == pointerSizeBytes * 91)
    && (vtableSlotOffset 92 == pointerSizeBytes * 92)
    && (vtableSlotOffset 93 == pointerSizeBytes * 93)
    && (vtableSlotOffset 94 == pointerSizeBytes * 94)
    && (vtableSlotOffset 95 == pointerSizeBytes * 95)
    && (vtableSlotOffset 96 == pointerSizeBytes * 96)
    && (vtableSlotOffset 97 == pointerSizeBytes * 97)
    && (vtableSlotOffset 98 == pointerSizeBytes * 98)
    && (vtableSlotOffset 99 == pointerSizeBytes * 99)
    && (vtableSlotOffset 100 == pointerSizeBytes * 100)
    && (vtableSlotOffset 101 == pointerSizeBytes * 101)
    && (vtableSlotOffset 102 == pointerSizeBytes * 102)
    && (vtableSlotOffset 103 == pointerSizeBytes * 103)
    && (vtableSlotOffset 104 == pointerSizeBytes * 104)
    && (vtableSlotOffset 105 == pointerSizeBytes * 105)
    && (vtableSlotOffset 106 == pointerSizeBytes * 106)
    && (vtableSlotOffset 107 == pointerSizeBytes * 107)
    && (vtableSlotOffset 108 == pointerSizeBytes * 108)
    && (vtableSlotOffset 109 == pointerSizeBytes * 109)
    && (vtableSlotOffset 110 == pointerSizeBytes * 110)
    && (vtableSlotOffset 111 == pointerSizeBytes * 111)
    && (vtableSlotOffset 112 == pointerSizeBytes * 112)
    && (vtableSlotOffset 113 == pointerSizeBytes * 113)
    && (vtableSlotOffset 114 == pointerSizeBytes * 114)
    && (vtableSlotOffset 115 == pointerSizeBytes * 115)
    && (vtableSlotOffset 116 == pointerSizeBytes * 116)
    && (vtableSlotOffset 117 == pointerSizeBytes * 117)
    && (vtableSlotOffset 118 == pointerSizeBytes * 118)
    && (vtableSlotOffset 119 == pointerSizeBytes * 119)
    && (vtableSlotOffset 120 == pointerSizeBytes * 120)
    && (vtableSlotOffset 121 == pointerSizeBytes * 121)
    && (vtableSlotOffset 122 == pointerSizeBytes * 122)
    && (vtableSlotOffset 123 == pointerSizeBytes * 123)
    && (vtableSlotOffset 124 == pointerSizeBytes * 124)
    && (vtableSlotOffset 125 == pointerSizeBytes * 125)
    && (vtableSlotOffset 126 == pointerSizeBytes * 126)
    && (vtableSlotOffset 127 == pointerSizeBytes * 127)
    && (vtableSlotOffset 128 == pointerSizeBytes * 128)
    && (vtableSlotOffset 129 == pointerSizeBytes * 129)
    && (vtableSlotOffset 130 == pointerSizeBytes * 130)
    && (vtableMethodSlotSizeBytes == pointerSizeBytes)
    && (vtableMethodSlotAlignBytes == pointerAlignBytes)
    && (vtableVacantSlotSizeBytes == pointerSizeBytes)
    && (vtableVacantSlotAlignBytes == pointerAlignBytes)
    && (vtableTraitVPtrSlotSizeBytes == pointerSizeBytes)
    && (vtableTraitVPtrSlotAlignBytes == pointerAlignBytes)
    && (vtableHeaderSlotCount == 3)
    && (vtableFirstMethodSlot == 3)
    && (vtableSecondMethodSlot == 4)
    && (vtableThirdMethodSlot == 5)
    && (vtableFourthMethodSlot == 6)
    && (vtableFifthMethodSlot == 7)
    && (vtableSixthMethodSlot == 8)
    && (vtableSeventhMethodSlot == 9)
    && (vtableEighthMethodSlot == 10)
    && (vtableNinthMethodSlot == 11)
    && (vtableTenthMethodSlot == 12)
    && (vtableEleventhMethodSlot == 13)
    && (vtableTwelfthMethodSlot == 14)
    && (vtableThirteenthMethodSlot == 15)
    && (vtableFourteenthMethodSlot == 16)
    && (vtableFifteenthMethodSlot == 17)
    && (vtableSixteenthMethodSlot == 18)
    && (vtableSeventeenthMethodSlot == 19)
    && (vtableEighteenthMethodSlot == 20)
    && (vtableNineteenthMethodSlot == 21)
    && (vtableTwentiethMethodSlot == 22)
    && (vtableTwentyFirstMethodSlot == 23)
    && (vtableTwentySecondMethodSlot == 24)
    && (vtableTwentyThirdMethodSlot == 25)
    && (vtableTwentyFourthMethodSlot == 26)
    && (vtableTwentyFifthMethodSlot == 27)
    && (vtableTwentySixthMethodSlot == 28)
    && (vtableTwentySeventhMethodSlot == 29)
    && (vtableTwentyEighthMethodSlot == 30)
    && (vtableTwentyNinthMethodSlot == 31)
    && (vtableThirtiethMethodSlot == 32)
    && (vtableThirtyFirstMethodSlot == 33)
    && (vtableThirtySecondMethodSlot == 34)
    && (vtableThirtyThirdMethodSlot == 35)
    && (vtableThirtyFourthMethodSlot == 36)
    && (vtableThirtyFifthMethodSlot == 37)
    && (vtableThirtySixthMethodSlot == 38)
    && (vtableThirtySeventhMethodSlot == 39)
    && (vtableThirtyEighthMethodSlot == 40)
    && (vtableThirtyNinthMethodSlot == 41)
    && (vtableFortiethMethodSlot == 42)
    && (vtableFortyFirstMethodSlot == 43)
    && (vtableFortySecondMethodSlot == 44)
    && (vtableFortyThirdMethodSlot == 45)
    && (vtableFortyFourthMethodSlot == 46)
    && (vtableFortyFifthMethodSlot == 47)
    && (vtableFortySixthMethodSlot == 48)
    && (vtableFortySeventhMethodSlot == 49)
    && (vtableFortyEighthMethodSlot == 50)
    && (vtableFortyNinthMethodSlot == 51)
    && (vtableFiftiethMethodSlot == 52)
    && (vtableFiftyFirstMethodSlot == 53)
    && (vtableFiftySecondMethodSlot == 54)
    && (vtableFiftyThirdMethodSlot == 55)
    && (vtableFiftyFourthMethodSlot == 56)
    && (vtableFiftyFifthMethodSlot == 57)
    && (vtableFiftySixthMethodSlot == 58)
    && (vtableFiftySeventhMethodSlot == 59)
    && (vtableFiftyEighthMethodSlot == 60)
    && (vtableFiftyNinthMethodSlot == 61)
    && (vtableSixtiethMethodSlot == 62)
    && (vtableSixtyFirstMethodSlot == 63)
    && (vtableSixtySecondMethodSlot == 64)
    && (vtableSixtyThirdMethodSlot == 65)
    && (vtableSixtyFourthMethodSlot == 66)
    && (vtableSixtyFifthMethodSlot == 67)
    && (vtableSixtySixthMethodSlot == 68)
    && (vtableSixtySeventhMethodSlot == 69)
    && (vtableSixtyEighthMethodSlot == 70)
    && (vtableSixtyNinthMethodSlot == 71)
    && (vtableSeventiethMethodSlot == 72)
    && (vtableSeventyFirstMethodSlot == 73)
    && (vtableSeventySecondMethodSlot == 74)
    && (vtableSeventyThirdMethodSlot == 75)
    && (vtableSeventyFourthMethodSlot == 76)
    && (vtableSeventyFifthMethodSlot == 77)
    && (vtableSeventySixthMethodSlot == 78)
    && (vtableSeventySeventhMethodSlot == 79)
    && (vtableSeventyEighthMethodSlot == 80)
    && (vtableSeventyNinthMethodSlot == 81)
    && (vtableEightiethMethodSlot == 82)
    && (vtableEightyFirstMethodSlot == 83)
    && (vtableEightySecondMethodSlot == 84)
    && (vtableEightyThirdMethodSlot == 85)
    && (vtableEightyFourthMethodSlot == 86)
    && (vtableEightyFifthMethodSlot == 87)
    && (vtableEightySixthMethodSlot == 88)
    && (vtableEightySeventhMethodSlot == 89)
    && (vtableEightyEighthMethodSlot == 90)
    && (vtableEightyNinthMethodSlot == 91)
    && (vtableNinetiethMethodSlot == 92)
    && (vtableNinetyFirstMethodSlot == 93)
    && (vtableNinetySecondMethodSlot == 94)
    && (vtableNinetyThirdMethodSlot == 95)
    && (vtableNinetyFourthMethodSlot == 96)
    && (vtableNinetyFifthMethodSlot == 97)
    && (vtableNinetySixthMethodSlot == 98)
    && (vtableNinetySeventhMethodSlot == 99)
    && (vtableNinetyEighthMethodSlot == 100)
    && (vtableNinetyNinthMethodSlot == 101)
    && (vtableOneHundredthMethodSlot == 102)
    && (vtableOneHundredFirstMethodSlot == 103)
    && (vtableOneHundredSecondMethodSlot == 104)
    && (vtableOneHundredThirdMethodSlot == 105)
    && (vtableOneHundredFourthMethodSlot == 106)
    && (vtableOneHundredFifthMethodSlot == 107)
    && (vtableOneHundredSixthMethodSlot == 108)
    && (vtableOneHundredSeventhMethodSlot == 109)
    && (vtableOneHundredEighthMethodSlot == 110)
    && (vtableOneHundredNinthMethodSlot == 111)
    && (vtableOneHundredTenthMethodSlot == 112)
    && (vtableOneHundredEleventhMethodSlot == 113)
    && (vtableOneHundredTwelfthMethodSlot == 114)
    && (vtableOneHundredThirteenthMethodSlot == 115)
    && (vtableOneHundredFourteenthMethodSlot == 116)
    && (vtableOneHundredFifteenthMethodSlot == 117)
    && (vtableOneHundredSixteenthMethodSlot == 118)
    && (vtableOneHundredSeventeenthMethodSlot == 119)
    && (vtableOneHundredEighteenthMethodSlot == 120)
    && (vtableOneHundredNineteenthMethodSlot == 121)
    && (vtableOneHundredTwentiethMethodSlot == 122)
    && (vtableOneHundredTwentyFirstMethodSlot == 123)
    && (vtableOneHundredTwentySecondMethodSlot == 124)
    && (vtableOneHundredTwentyThirdMethodSlot == 125)
    && (vtableOneHundredTwentyFourthMethodSlot == 126)
    && (vtableOneHundredTwentyFifthMethodSlot == 127)
    && (vtableOneHundredTwentySixthMethodSlot == 128)
    && (vtableOneHundredTwentySeventhMethodSlot == 129)
    && (vtableOneHundredTwentyEighthMethodSlot == 130)
    && (vtableFixtureMethodCount == 128)
    && (vtableFirstVacantSlot == 131)
    && (vtableFirstTraitVPtrSlot == 132)
    && (vtableFixtureVacantCount == 1)
    && (vtableFixtureTraitVPtrCount == 1)
    && (vtableDropInPlaceOffset == 0)
    && (vtableSizeOffset == 8)
    && (vtableAlignOffset == 16)
    && (vtableFirstMethodOffset == 24)
    && (vtableSecondMethodOffset == 32)
    && (vtableThirdMethodOffset == 40)
    && (vtableFourthMethodOffset == 48)
    && (vtableFifthMethodOffset == 56)
    && (vtableSixthMethodOffset == 64)
    && (vtableSeventhMethodOffset == 72)
    && (vtableEighthMethodOffset == 80)
    && (vtableNinthMethodOffset == 88)
    && (vtableTenthMethodOffset == 96)
    && (vtableEleventhMethodOffset == 104)
    && (vtableTwelfthMethodOffset == 112)
    && (vtableThirteenthMethodOffset == 120)
    && (vtableFourteenthMethodOffset == 128)
    && (vtableFifteenthMethodOffset == 136)
    && (vtableSixteenthMethodOffset == 144)
    && (vtableSeventeenthMethodOffset == 152)
    && (vtableEighteenthMethodOffset == 160)
    && (vtableNineteenthMethodOffset == 168)
    && (vtableTwentiethMethodOffset == 176)
    && (vtableTwentyFirstMethodOffset == 184)
    && (vtableTwentySecondMethodOffset == 192)
    && (vtableTwentyThirdMethodOffset == 200)
    && (vtableTwentyFourthMethodOffset == 208)
    && (vtableTwentyFifthMethodOffset == 216)
    && (vtableTwentySixthMethodOffset == 224)
    && (vtableTwentySeventhMethodOffset == 232)
    && (vtableTwentyEighthMethodOffset == 240)
    && (vtableTwentyNinthMethodOffset == 248)
    && (vtableThirtiethMethodOffset == 256)
    && (vtableThirtyFirstMethodOffset == 264)
    && (vtableThirtySecondMethodOffset == 272)
    && (vtableThirtyThirdMethodOffset == 280)
    && (vtableThirtyFourthMethodOffset == 288)
    && (vtableThirtyFifthMethodOffset == 296)
    && (vtableThirtySixthMethodOffset == 304)
    && (vtableThirtySeventhMethodOffset == 312)
    && (vtableThirtyEighthMethodOffset == 320)
    && (vtableThirtyNinthMethodOffset == 328)
    && (vtableFortiethMethodOffset == 336)
    && (vtableFortyFirstMethodOffset == 344)
    && (vtableFortySecondMethodOffset == 352)
    && (vtableFortyThirdMethodOffset == 360)
    && (vtableFortyFourthMethodOffset == 368)
    && (vtableFortyFifthMethodOffset == 376)
    && (vtableFortySixthMethodOffset == 384)
    && (vtableFortySeventhMethodOffset == 392)
    && (vtableFortyEighthMethodOffset == 400)
    && (vtableFortyNinthMethodOffset == 408)
    && (vtableFiftiethMethodOffset == 416)
    && (vtableFiftyFirstMethodOffset == 424)
    && (vtableFiftySecondMethodOffset == 432)
    && (vtableFiftyThirdMethodOffset == 440)
    && (vtableFiftyFourthMethodOffset == 448)
    && (vtableFiftyFifthMethodOffset == 456)
    && (vtableFiftySixthMethodOffset == 464)
    && (vtableFiftySeventhMethodOffset == 472)
    && (vtableFiftyEighthMethodOffset == 480)
    && (vtableFiftyNinthMethodOffset == 488)
    && (vtableSixtiethMethodOffset == 496)
    && (vtableSixtyFirstMethodOffset == 504)
    && (vtableSixtySecondMethodOffset == 512)
    && (vtableSixtyThirdMethodOffset == 520)
    && (vtableSixtyFourthMethodOffset == 528)
    && (vtableSixtyFifthMethodOffset == 536)
    && (vtableSixtySixthMethodOffset == 544)
    && (vtableSixtySeventhMethodOffset == 552)
    && (vtableSixtyEighthMethodOffset == 560)
    && (vtableSixtyNinthMethodOffset == 568)
    && (vtableSeventiethMethodOffset == 576)
    && (vtableSeventyFirstMethodOffset == 584)
    && (vtableSeventySecondMethodOffset == 592)
    && (vtableSeventyThirdMethodOffset == 600)
    && (vtableSeventyFourthMethodOffset == 608)
    && (vtableSeventyFifthMethodOffset == 616)
    && (vtableSeventySixthMethodOffset == 624)
    && (vtableSeventySeventhMethodOffset == 632)
    && (vtableSeventyEighthMethodOffset == 640)
    && (vtableSeventyNinthMethodOffset == 648)
    && (vtableEightiethMethodOffset == 656)
    && (vtableEightyFirstMethodOffset == 664)
    && (vtableEightySecondMethodOffset == 672)
    && (vtableEightyThirdMethodOffset == 680)
    && (vtableEightyFourthMethodOffset == 688)
    && (vtableEightyFifthMethodOffset == 696)
    && (vtableEightySixthMethodOffset == 704)
    && (vtableEightySeventhMethodOffset == 712)
    && (vtableEightyEighthMethodOffset == 720)
    && (vtableEightyNinthMethodOffset == 728)
    && (vtableNinetiethMethodOffset == 736)
    && (vtableNinetyFirstMethodOffset == 744)
    && (vtableNinetySecondMethodOffset == 752)
    && (vtableNinetyThirdMethodOffset == 760)
    && (vtableNinetyFourthMethodOffset == 768)
    && (vtableNinetyFifthMethodOffset == 776)
    && (vtableNinetySixthMethodOffset == 784)
    && (vtableNinetySeventhMethodOffset == 792)
    && (vtableNinetyEighthMethodOffset == 800)
    && (vtableNinetyNinthMethodOffset == 808)
    && (vtableOneHundredthMethodOffset == 816)
    && (vtableOneHundredFirstMethodOffset == 824)
    && (vtableOneHundredSecondMethodOffset == 832)
    && (vtableOneHundredThirdMethodOffset == 840)
    && (vtableOneHundredFourthMethodOffset == 848)
    && (vtableOneHundredFifthMethodOffset == 856)
    && (vtableOneHundredSixthMethodOffset == 864)
    && (vtableOneHundredSeventhMethodOffset == 872)
    && (vtableOneHundredEighthMethodOffset == 880)
    && (vtableOneHundredNinthMethodOffset == 888)
    && (vtableOneHundredTenthMethodOffset == 896)
    && (vtableOneHundredEleventhMethodOffset == 904)
    && (vtableOneHundredTwelfthMethodOffset == 912)
    && (vtableOneHundredThirteenthMethodOffset == 920)
    && (vtableOneHundredFourteenthMethodOffset == 928)
    && (vtableOneHundredFifteenthMethodOffset == 936)
    && (vtableOneHundredSixteenthMethodOffset == 944)
    && (vtableOneHundredSeventeenthMethodOffset == 952)
    && (vtableOneHundredEighteenthMethodOffset == 960)
    && (vtableOneHundredNineteenthMethodOffset == 968)
    && (vtableOneHundredTwentiethMethodOffset == 976)
    && (vtableOneHundredTwentyFirstMethodOffset == 984)
    && (vtableOneHundredTwentySecondMethodOffset == 992)
    && (vtableOneHundredTwentyThirdMethodOffset == 1000)
    && (vtableOneHundredTwentyFourthMethodOffset == 1008)
    && (vtableOneHundredTwentyFifthMethodOffset == 1016)
    && (vtableOneHundredTwentySixthMethodOffset == 1024)
    && (vtableOneHundredTwentySeventhMethodOffset == 1032)
    && (vtableOneHundredTwentyEighthMethodOffset == 1040)
    && (vtableVacantOffset == 1048)
    && (vtableTraitVPtrOffset == 1056)
    && (vtableFixtureSlotCount == 133)
    && (vtableFixtureSizeBytes == 1064)
    && (vtableSupertraitSlotCount == 3)
    && (vtableSupertraitSizeBytes == 24)
    && (vtableFixtureAlignBytes == 8)
    && (vtableFixturePayloadSizeBytes == 8)
    && (vtableFixturePayloadAlignBytes == 8)
    && (traitObjectRecordName == "TraitObjectRecord")
    && (traitObjectVtableIrName == "TRAIT-OBJECT-VTABLE-IR")
    && (traitObjectVtableIrBasename == "trait-object-vtable.ll")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && traitObjectVtableHostValueOk
    && traitObjectVtableIrPackageOk
    && (rustcAbiCite.length > 0)
    && (rustcVtableCite.length > 0)
    && containsSub rustcVtableCite
      "Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Method / Vacant"
    && (llvmIrSurfaceHonesty.length > 0)
    && (outOfTreeConsumerHonesty.length > 0)
    && traitObjectVtableDualPinClaimed
    && !traitObjectVtableFullBackendClaimed
    && !traitObjectVtableFullHostClaimed
    && !traitObjectVtableOccupancyMemberClaimed
    && traitObjectVtableLlvmEmitClaimed
    && !traitObjectVtableProductionEmitClaimed

/-- Surface canary.
    Greppable: traitObjectVtableSurfaceOk. -/
def traitObjectVtableSurfaceOk : Bool :=
  (stageId == "SLAKE_TRAIT_OBJECT_VTABLE_V0")
    && (hostId == "HOST-TRAIT-OBJECT-VTABLE")
    && (surfaceId == "HOST-TRAIT-OBJECT-VTABLE")
    && traitObjectVtableDualPinOk

/-- Package ok (dual-pin; fullBackend false; not occupancy member).
    Greppable: traitObjectVtablePackageOk. -/
def traitObjectVtablePackageOk : Bool :=
  traitObjectVtableSurfaceOk
    && traitObjectVtableDualPinClaimed
    && !traitObjectVtableFullBackendClaimed
    && !traitObjectVtableFullHostClaimed
    && !traitObjectVtableOccupancyMemberClaimed
    && traitObjectVtableLlvmEmitClaimed
    && !traitObjectVtableProductionEmitClaimed
    && traitObjectVtableHostValueOk
    && traitObjectVtableIrPackageOk

/-- Structural ready.
    Greppable: traitObjectVtableReady. -/
def traitObjectVtableReady : Bool :=
  traitObjectVtablePackageOk

/-! ### HOST-TRAIT-OBJECT-VTABLE-THEOREM -/

theorem pointerSizeBytes_eq : pointerSizeBytes = 8 := rfl
theorem pointerAlignBytes_eq : pointerAlignBytes = 8 := rfl
theorem dataPtrOffset_eq : dataPtrOffset = 0 := rfl
theorem vtablePtrOffset_eq : vtablePtrOffset = 8 := rfl
theorem traitObjectSizeBytes_eq : traitObjectSizeBytes = 16 := rfl
theorem traitObjectAlignBytes_eq : traitObjectAlignBytes = 8 := rfl
theorem traitObjectPadBytes_eq : traitObjectPadBytes = 0 := rfl
theorem traitObjectPointerCount_eq : traitObjectPointerCount = 2 := rfl
theorem vtableSlotDropInPlace_eq : vtableSlotDropInPlace = 0 := rfl
theorem vtableSlotSize_eq : vtableSlotSize = 1 := rfl
theorem vtableSlotAlign_eq : vtableSlotAlign = 2 := rfl
theorem vtableHeaderSlotCount_eq : vtableHeaderSlotCount = 3 := rfl
theorem vtableFirstMethodSlot_eq : vtableFirstMethodSlot = 3 := rfl
theorem vtableSecondMethodSlot_eq : vtableSecondMethodSlot = 4 := rfl
theorem vtableThirdMethodSlot_eq : vtableThirdMethodSlot = 5 := rfl
theorem vtableFourthMethodSlot_eq : vtableFourthMethodSlot = 6 := rfl
theorem vtableFifthMethodSlot_eq : vtableFifthMethodSlot = 7 := rfl
theorem vtableSixthMethodSlot_eq : vtableSixthMethodSlot = 8 := rfl
theorem vtableSeventhMethodSlot_eq : vtableSeventhMethodSlot = 9 := rfl
theorem vtableEighthMethodSlot_eq : vtableEighthMethodSlot = 10 := rfl
theorem vtableNinthMethodSlot_eq : vtableNinthMethodSlot = 11 := rfl
theorem vtableTenthMethodSlot_eq : vtableTenthMethodSlot = 12 := rfl
theorem vtableEleventhMethodSlot_eq : vtableEleventhMethodSlot = 13 := rfl
theorem vtableTwelfthMethodSlot_eq : vtableTwelfthMethodSlot = 14 := rfl
theorem vtableThirteenthMethodSlot_eq : vtableThirteenthMethodSlot = 15 := rfl
theorem vtableFourteenthMethodSlot_eq : vtableFourteenthMethodSlot = 16 := rfl
theorem vtableFifteenthMethodSlot_eq : vtableFifteenthMethodSlot = 17 := rfl
theorem vtableSixteenthMethodSlot_eq : vtableSixteenthMethodSlot = 18 := rfl
theorem vtableSeventeenthMethodSlot_eq : vtableSeventeenthMethodSlot = 19 := rfl
theorem vtableEighteenthMethodSlot_eq : vtableEighteenthMethodSlot = 20 := rfl
theorem vtableNineteenthMethodSlot_eq : vtableNineteenthMethodSlot = 21 := rfl
theorem vtableTwentiethMethodSlot_eq : vtableTwentiethMethodSlot = 22 := rfl
theorem vtableTwentyFirstMethodSlot_eq : vtableTwentyFirstMethodSlot = 23 := rfl
theorem vtableTwentySecondMethodSlot_eq : vtableTwentySecondMethodSlot = 24 := rfl
theorem vtableTwentyThirdMethodSlot_eq : vtableTwentyThirdMethodSlot = 25 := rfl
theorem vtableTwentyFourthMethodSlot_eq : vtableTwentyFourthMethodSlot = 26 := rfl
theorem vtableTwentyFifthMethodSlot_eq : vtableTwentyFifthMethodSlot = 27 := rfl
theorem vtableTwentySixthMethodSlot_eq : vtableTwentySixthMethodSlot = 28 := rfl
theorem vtableTwentySeventhMethodSlot_eq : vtableTwentySeventhMethodSlot = 29 := rfl
theorem vtableTwentyEighthMethodSlot_eq : vtableTwentyEighthMethodSlot = 30 := rfl
theorem vtableTwentyNinthMethodSlot_eq : vtableTwentyNinthMethodSlot = 31 := rfl
theorem vtableThirtiethMethodSlot_eq : vtableThirtiethMethodSlot = 32 := rfl
theorem vtableThirtyFirstMethodSlot_eq : vtableThirtyFirstMethodSlot = 33 := rfl
theorem vtableThirtySecondMethodSlot_eq : vtableThirtySecondMethodSlot = 34 := rfl
theorem vtableThirtyThirdMethodSlot_eq : vtableThirtyThirdMethodSlot = 35 := rfl
theorem vtableThirtyFourthMethodSlot_eq : vtableThirtyFourthMethodSlot = 36 := rfl
theorem vtableThirtyFifthMethodSlot_eq : vtableThirtyFifthMethodSlot = 37 := rfl
theorem vtableThirtySixthMethodSlot_eq : vtableThirtySixthMethodSlot = 38 := rfl
theorem vtableThirtySeventhMethodSlot_eq : vtableThirtySeventhMethodSlot = 39 := rfl
theorem vtableThirtyEighthMethodSlot_eq : vtableThirtyEighthMethodSlot = 40 := rfl
theorem vtableThirtyNinthMethodSlot_eq : vtableThirtyNinthMethodSlot = 41 := rfl
theorem vtableFortiethMethodSlot_eq : vtableFortiethMethodSlot = 42 := rfl
theorem vtableFortyFirstMethodSlot_eq : vtableFortyFirstMethodSlot = 43 := rfl
theorem vtableFortySecondMethodSlot_eq : vtableFortySecondMethodSlot = 44 := rfl
theorem vtableFortyThirdMethodSlot_eq : vtableFortyThirdMethodSlot = 45 := rfl
theorem vtableFortyFourthMethodSlot_eq : vtableFortyFourthMethodSlot = 46 := rfl
theorem vtableFortyFifthMethodSlot_eq : vtableFortyFifthMethodSlot = 47 := rfl
theorem vtableFortySixthMethodSlot_eq : vtableFortySixthMethodSlot = 48 := rfl
theorem vtableFortySeventhMethodSlot_eq : vtableFortySeventhMethodSlot = 49 := rfl
theorem vtableFortyEighthMethodSlot_eq : vtableFortyEighthMethodSlot = 50 := rfl
theorem vtableFortyNinthMethodSlot_eq : vtableFortyNinthMethodSlot = 51 := rfl
theorem vtableFiftiethMethodSlot_eq : vtableFiftiethMethodSlot = 52 := rfl
theorem vtableFiftyFirstMethodSlot_eq : vtableFiftyFirstMethodSlot = 53 := rfl
theorem vtableFiftySecondMethodSlot_eq : vtableFiftySecondMethodSlot = 54 := rfl
theorem vtableFiftyThirdMethodSlot_eq : vtableFiftyThirdMethodSlot = 55 := rfl
theorem vtableFiftyFourthMethodSlot_eq : vtableFiftyFourthMethodSlot = 56 := rfl
theorem vtableFiftyFifthMethodSlot_eq : vtableFiftyFifthMethodSlot = 57 := rfl
theorem vtableFiftySixthMethodSlot_eq : vtableFiftySixthMethodSlot = 58 := rfl
theorem vtableFiftySeventhMethodSlot_eq : vtableFiftySeventhMethodSlot = 59 := rfl
theorem vtableFiftyEighthMethodSlot_eq : vtableFiftyEighthMethodSlot = 60 := rfl
theorem vtableFiftyNinthMethodSlot_eq : vtableFiftyNinthMethodSlot = 61 := rfl
theorem vtableSixtiethMethodSlot_eq : vtableSixtiethMethodSlot = 62 := rfl
theorem vtableSixtyFirstMethodSlot_eq : vtableSixtyFirstMethodSlot = 63 := rfl
theorem vtableSixtySecondMethodSlot_eq : vtableSixtySecondMethodSlot = 64 := rfl
theorem vtableSixtyThirdMethodSlot_eq : vtableSixtyThirdMethodSlot = 65 := rfl
theorem vtableSixtyFourthMethodSlot_eq : vtableSixtyFourthMethodSlot = 66 := rfl
theorem vtableSixtyFifthMethodSlot_eq : vtableSixtyFifthMethodSlot = 67 := rfl
theorem vtableSixtySixthMethodSlot_eq : vtableSixtySixthMethodSlot = 68 := rfl
theorem vtableSixtySeventhMethodSlot_eq : vtableSixtySeventhMethodSlot = 69 := rfl
theorem vtableSixtyEighthMethodSlot_eq : vtableSixtyEighthMethodSlot = 70 := rfl
theorem vtableSixtyNinthMethodSlot_eq : vtableSixtyNinthMethodSlot = 71 := rfl
theorem vtableSeventiethMethodSlot_eq : vtableSeventiethMethodSlot = 72 := rfl
theorem vtableSeventyFirstMethodSlot_eq : vtableSeventyFirstMethodSlot = 73 := rfl
theorem vtableSeventySecondMethodSlot_eq : vtableSeventySecondMethodSlot = 74 := rfl
theorem vtableSeventyThirdMethodSlot_eq : vtableSeventyThirdMethodSlot = 75 := rfl
theorem vtableSeventyFourthMethodSlot_eq : vtableSeventyFourthMethodSlot = 76 := rfl
theorem vtableSeventyFifthMethodSlot_eq : vtableSeventyFifthMethodSlot = 77 := rfl
theorem vtableSeventySixthMethodSlot_eq : vtableSeventySixthMethodSlot = 78 := rfl
theorem vtableSeventySeventhMethodSlot_eq : vtableSeventySeventhMethodSlot = 79 := rfl
theorem vtableSeventyEighthMethodSlot_eq : vtableSeventyEighthMethodSlot = 80 := rfl
theorem vtableSeventyNinthMethodSlot_eq : vtableSeventyNinthMethodSlot = 81 := rfl
theorem vtableEightiethMethodSlot_eq : vtableEightiethMethodSlot = 82 := rfl
theorem vtableEightyFirstMethodSlot_eq : vtableEightyFirstMethodSlot = 83 := rfl
theorem vtableEightySecondMethodSlot_eq : vtableEightySecondMethodSlot = 84 := rfl
theorem vtableEightyThirdMethodSlot_eq : vtableEightyThirdMethodSlot = 85 := rfl
theorem vtableEightyFourthMethodSlot_eq : vtableEightyFourthMethodSlot = 86 := rfl
theorem vtableEightyFifthMethodSlot_eq : vtableEightyFifthMethodSlot = 87 := rfl
theorem vtableEightySixthMethodSlot_eq : vtableEightySixthMethodSlot = 88 := rfl
theorem vtableEightySeventhMethodSlot_eq : vtableEightySeventhMethodSlot = 89 := rfl
theorem vtableEightyEighthMethodSlot_eq : vtableEightyEighthMethodSlot = 90 := rfl
theorem vtableEightyNinthMethodSlot_eq : vtableEightyNinthMethodSlot = 91 := rfl
theorem vtableNinetiethMethodSlot_eq : vtableNinetiethMethodSlot = 92 := rfl
theorem vtableNinetyFirstMethodSlot_eq : vtableNinetyFirstMethodSlot = 93 := rfl
theorem vtableNinetySecondMethodSlot_eq : vtableNinetySecondMethodSlot = 94 := rfl
theorem vtableNinetyThirdMethodSlot_eq : vtableNinetyThirdMethodSlot = 95 := rfl
theorem vtableNinetyFourthMethodSlot_eq : vtableNinetyFourthMethodSlot = 96 := rfl
theorem vtableNinetyFifthMethodSlot_eq : vtableNinetyFifthMethodSlot = 97 := rfl
theorem vtableNinetySixthMethodSlot_eq : vtableNinetySixthMethodSlot = 98 := rfl
theorem vtableNinetySeventhMethodSlot_eq : vtableNinetySeventhMethodSlot = 99 := rfl
theorem vtableNinetyEighthMethodSlot_eq : vtableNinetyEighthMethodSlot = 100 := rfl
theorem vtableNinetyNinthMethodSlot_eq : vtableNinetyNinthMethodSlot = 101 := rfl
theorem vtableOneHundredthMethodSlot_eq : vtableOneHundredthMethodSlot = 102 := rfl
theorem vtableOneHundredFirstMethodSlot_eq : vtableOneHundredFirstMethodSlot = 103 := rfl
theorem vtableOneHundredSecondMethodSlot_eq : vtableOneHundredSecondMethodSlot = 104 := rfl
theorem vtableOneHundredThirdMethodSlot_eq : vtableOneHundredThirdMethodSlot = 105 := rfl
theorem vtableOneHundredFourthMethodSlot_eq : vtableOneHundredFourthMethodSlot = 106 := rfl
theorem vtableOneHundredFifthMethodSlot_eq : vtableOneHundredFifthMethodSlot = 107 := rfl
theorem vtableOneHundredSixthMethodSlot_eq : vtableOneHundredSixthMethodSlot = 108 := rfl
theorem vtableOneHundredSeventhMethodSlot_eq : vtableOneHundredSeventhMethodSlot = 109 := rfl
theorem vtableOneHundredEighthMethodSlot_eq : vtableOneHundredEighthMethodSlot = 110 := rfl
theorem vtableOneHundredNinthMethodSlot_eq : vtableOneHundredNinthMethodSlot = 111 := rfl
theorem vtableOneHundredTenthMethodSlot_eq : vtableOneHundredTenthMethodSlot = 112 := rfl
theorem vtableOneHundredEleventhMethodSlot_eq : vtableOneHundredEleventhMethodSlot = 113 := rfl
theorem vtableOneHundredTwelfthMethodSlot_eq : vtableOneHundredTwelfthMethodSlot = 114 := rfl
theorem vtableOneHundredThirteenthMethodSlot_eq : vtableOneHundredThirteenthMethodSlot = 115 := rfl
theorem vtableOneHundredFourteenthMethodSlot_eq : vtableOneHundredFourteenthMethodSlot = 116 := rfl
theorem vtableOneHundredFifteenthMethodSlot_eq : vtableOneHundredFifteenthMethodSlot = 117 := rfl
theorem vtableOneHundredSixteenthMethodSlot_eq : vtableOneHundredSixteenthMethodSlot = 118 := rfl
theorem vtableOneHundredSeventeenthMethodSlot_eq : vtableOneHundredSeventeenthMethodSlot = 119 := rfl
theorem vtableOneHundredEighteenthMethodSlot_eq : vtableOneHundredEighteenthMethodSlot = 120 := rfl
theorem vtableOneHundredNineteenthMethodSlot_eq : vtableOneHundredNineteenthMethodSlot = 121 := rfl
theorem vtableOneHundredTwentiethMethodSlot_eq : vtableOneHundredTwentiethMethodSlot = 122 := rfl
theorem vtableOneHundredTwentyFirstMethodSlot_eq : vtableOneHundredTwentyFirstMethodSlot = 123 := rfl
theorem vtableOneHundredTwentySecondMethodSlot_eq : vtableOneHundredTwentySecondMethodSlot = 124 := rfl
theorem vtableOneHundredTwentyThirdMethodSlot_eq : vtableOneHundredTwentyThirdMethodSlot = 125 := rfl
theorem vtableOneHundredTwentyFourthMethodSlot_eq : vtableOneHundredTwentyFourthMethodSlot = 126 := rfl
theorem vtableOneHundredTwentyFifthMethodSlot_eq : vtableOneHundredTwentyFifthMethodSlot = 127 := rfl
theorem vtableOneHundredTwentySixthMethodSlot_eq : vtableOneHundredTwentySixthMethodSlot = 128 := rfl
theorem vtableOneHundredTwentySeventhMethodSlot_eq : vtableOneHundredTwentySeventhMethodSlot = 129 := rfl
theorem vtableOneHundredTwentyEighthMethodSlot_eq : vtableOneHundredTwentyEighthMethodSlot = 130 := rfl
theorem vtableFixtureMethodCount_eq : vtableFixtureMethodCount = 128 := rfl
theorem vtableFirstVacantSlot_eq : vtableFirstVacantSlot = 131 := rfl
theorem vtableFirstTraitVPtrSlot_eq : vtableFirstTraitVPtrSlot = 132 := rfl
theorem vtableSlotKind_first_method :
    vtableSlotKind vtableFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_second_method :
    vtableSlotKind vtableSecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_third_method :
    vtableSlotKind vtableThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fourth_method :
    vtableSlotKind vtableFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifth_method :
    vtableSlotKind vtableFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixth_method :
    vtableSlotKind vtableSixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventh_method :
    vtableSlotKind vtableSeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighth_method :
    vtableSlotKind vtableEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninth_method :
    vtableSlotKind vtableNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_tenth_method :
    vtableSlotKind vtableTenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eleventh_method :
    vtableSlotKind vtableEleventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twelfth_method :
    vtableSlotKind vtableTwelfthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirteenth_method :
    vtableSlotKind vtableThirteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fourteenth_method :
    vtableSlotKind vtableFourteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifteenth_method :
    vtableSlotKind vtableFifteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixteenth_method :
    vtableSlotKind vtableSixteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventeenth_method :
    vtableSlotKind vtableSeventeenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighteenth_method :
    vtableSlotKind vtableEighteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_nineteenth_method :
    vtableSlotKind vtableNineteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twentieth_method :
    vtableSlotKind vtableTwentiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_first_method :
    vtableSlotKind vtableTwentyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_second_method :
    vtableSlotKind vtableTwentySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_third_method :
    vtableSlotKind vtableTwentyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_fourth_method :
    vtableSlotKind vtableTwentyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_fifth_method :
    vtableSlotKind vtableTwentyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_sixth_method :
    vtableSlotKind vtableTwentySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_seventh_method :
    vtableSlotKind vtableTwentySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_eighth_method :
    vtableSlotKind vtableTwentyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_twenty_ninth_method :
    vtableSlotKind vtableTwentyNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirtieth_method :
    vtableSlotKind vtableThirtiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_first_method :
    vtableSlotKind vtableThirtyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_second_method :
    vtableSlotKind vtableThirtySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_third_method :
    vtableSlotKind vtableThirtyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_fourth_method :
    vtableSlotKind vtableThirtyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_fifth_method :
    vtableSlotKind vtableThirtyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_sixth_method :
    vtableSlotKind vtableThirtySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_seventh_method :
    vtableSlotKind vtableThirtySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_eighth_method :
    vtableSlotKind vtableThirtyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_thirty_ninth_method :
    vtableSlotKind vtableThirtyNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fortieth_method :
    vtableSlotKind vtableFortiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_first_method :
    vtableSlotKind vtableFortyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_second_method :
    vtableSlotKind vtableFortySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_third_method :
    vtableSlotKind vtableFortyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_fourth_method :
    vtableSlotKind vtableFortyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_fifth_method :
    vtableSlotKind vtableFortyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_sixth_method :
    vtableSlotKind vtableFortySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_seventh_method :
    vtableSlotKind vtableFortySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_eighth_method :
    vtableSlotKind vtableFortyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_forty_ninth_method :
    vtableSlotKind vtableFortyNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fiftieth_method :
    vtableSlotKind vtableFiftiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_first_method :
    vtableSlotKind vtableFiftyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_second_method :
    vtableSlotKind vtableFiftySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_third_method :
    vtableSlotKind vtableFiftyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_fourth_method :
    vtableSlotKind vtableFiftyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_fifth_method :
    vtableSlotKind vtableFiftyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_sixth_method :
    vtableSlotKind vtableFiftySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_seventh_method :
    vtableSlotKind vtableFiftySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_eighth_method :
    vtableSlotKind vtableFiftyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_fifty_ninth_method :
    vtableSlotKind vtableFiftyNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixtieth_method :
    vtableSlotKind vtableSixtiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_first_method :
    vtableSlotKind vtableSixtyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_second_method :
    vtableSlotKind vtableSixtySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_third_method :
    vtableSlotKind vtableSixtyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_fourth_method :
    vtableSlotKind vtableSixtyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_fifth_method :
    vtableSlotKind vtableSixtyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_sixth_method :
    vtableSlotKind vtableSixtySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_seventh_method :
    vtableSlotKind vtableSixtySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_eighth_method :
    vtableSlotKind vtableSixtyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_sixty_ninth_method :
    vtableSlotKind vtableSixtyNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventieth_method :
    vtableSlotKind vtableSeventiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_first_method :
    vtableSlotKind vtableSeventyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_second_method :
    vtableSlotKind vtableSeventySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_third_method :
    vtableSlotKind vtableSeventyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_fourth_method :
    vtableSlotKind vtableSeventyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_fifth_method :
    vtableSlotKind vtableSeventyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_sixth_method :
    vtableSlotKind vtableSeventySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_seventh_method :
    vtableSlotKind vtableSeventySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_eighth_method :
    vtableSlotKind vtableSeventyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_seventy_ninth_method :
    vtableSlotKind vtableSeventyNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eightieth_method :
    vtableSlotKind vtableEightiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_first_method :
    vtableSlotKind vtableEightyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_second_method :
    vtableSlotKind vtableEightySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_third_method :
    vtableSlotKind vtableEightyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_fourth_method :
    vtableSlotKind vtableEightyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_fifth_method :
    vtableSlotKind vtableEightyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_sixth_method :
    vtableSlotKind vtableEightySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_seventh_method :
    vtableSlotKind vtableEightySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_eighth_method :
    vtableSlotKind vtableEightyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_eighty_ninth_method :
    vtableSlotKind vtableEightyNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninetieth_method :
    vtableSlotKind vtableNinetiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_first_method :
    vtableSlotKind vtableNinetyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_second_method :
    vtableSlotKind vtableNinetySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_third_method :
    vtableSlotKind vtableNinetyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_fourth_method :
    vtableSlotKind vtableNinetyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_fifth_method :
    vtableSlotKind vtableNinetyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_sixth_method :
    vtableSlotKind vtableNinetySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_seventh_method :
    vtableSlotKind vtableNinetySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_eighth_method :
    vtableSlotKind vtableNinetyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_ninety_ninth_method :
    vtableSlotKind vtableNinetyNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundredth_method :
    vtableSlotKind vtableOneHundredthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_first_method :
    vtableSlotKind vtableOneHundredFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_second_method :
    vtableSlotKind vtableOneHundredSecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_third_method :
    vtableSlotKind vtableOneHundredThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_fourth_method :
    vtableSlotKind vtableOneHundredFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_fifth_method :
    vtableSlotKind vtableOneHundredFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_sixth_method :
    vtableSlotKind vtableOneHundredSixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_seventh_method :
    vtableSlotKind vtableOneHundredSeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_eighth_method :
    vtableSlotKind vtableOneHundredEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_ninth_method :
    vtableSlotKind vtableOneHundredNinthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_tenth_method :
    vtableSlotKind vtableOneHundredTenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_eleventh_method :
    vtableSlotKind vtableOneHundredEleventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twelfth_method :
    vtableSlotKind vtableOneHundredTwelfthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_thirteenth_method :
    vtableSlotKind vtableOneHundredThirteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_fourteenth_method :
    vtableSlotKind vtableOneHundredFourteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_fifteenth_method :
    vtableSlotKind vtableOneHundredFifteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_sixteenth_method :
    vtableSlotKind vtableOneHundredSixteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_seventeenth_method :
    vtableSlotKind vtableOneHundredSeventeenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_eighteenth_method :
    vtableSlotKind vtableOneHundredEighteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_nineteenth_method :
    vtableSlotKind vtableOneHundredNineteenthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twentieth_method :
    vtableSlotKind vtableOneHundredTwentiethMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twenty_first_method :
    vtableSlotKind vtableOneHundredTwentyFirstMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twenty_second_method :
    vtableSlotKind vtableOneHundredTwentySecondMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twenty_third_method :
    vtableSlotKind vtableOneHundredTwentyThirdMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twenty_fourth_method :
    vtableSlotKind vtableOneHundredTwentyFourthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twenty_fifth_method :
    vtableSlotKind vtableOneHundredTwentyFifthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twenty_sixth_method :
    vtableSlotKind vtableOneHundredTwentySixthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twenty_seventh_method :
    vtableSlotKind vtableOneHundredTwentySeventhMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_one_hundred_twenty_eighth_method :
    vtableSlotKind vtableOneHundredTwentyEighthMethodSlot = some VtableSlotKind.method := rfl
theorem vtableSlotKind_first_vacant :
    vtableSlotKind vtableFirstVacantSlot = some VtableSlotKind.vacant := rfl
theorem vtableSlotKind_first_trait_vptr :
    vtableSlotKind vtableFirstTraitVPtrSlot = some VtableSlotKind.traitVPtr := rfl
theorem vtableHeaderSlotKind_first_method_none :
    vtableHeaderSlotKind vtableFirstMethodSlot = none := rfl
theorem vtableMethodSlotSizeBytes_eq :
    vtableMethodSlotSizeBytes = pointerSizeBytes := rfl
theorem vtableDropInPlaceOffset_eq : vtableDropInPlaceOffset = 0 := rfl
theorem vtableSizeOffset_eq : vtableSizeOffset = 8 := rfl
theorem vtableAlignOffset_eq : vtableAlignOffset = 16 := rfl
theorem vtableFirstMethodOffset_eq : vtableFirstMethodOffset = 24 := rfl
theorem vtableSecondMethodOffset_eq : vtableSecondMethodOffset = 32 := rfl
theorem vtableThirdMethodOffset_eq : vtableThirdMethodOffset = 40 := rfl
theorem vtableFourthMethodOffset_eq : vtableFourthMethodOffset = 48 := rfl
theorem vtableFifthMethodOffset_eq : vtableFifthMethodOffset = 56 := rfl
theorem vtableSixthMethodOffset_eq : vtableSixthMethodOffset = 64 := rfl
theorem vtableSeventhMethodOffset_eq : vtableSeventhMethodOffset = 72 := rfl
theorem vtableEighthMethodOffset_eq : vtableEighthMethodOffset = 80 := rfl
theorem vtableNinthMethodOffset_eq : vtableNinthMethodOffset = 88 := rfl
theorem vtableTenthMethodOffset_eq : vtableTenthMethodOffset = 96 := rfl
theorem vtableEleventhMethodOffset_eq : vtableEleventhMethodOffset = 104 := rfl
theorem vtableTwelfthMethodOffset_eq : vtableTwelfthMethodOffset = 112 := rfl
theorem vtableThirteenthMethodOffset_eq : vtableThirteenthMethodOffset = 120 := rfl
theorem vtableFourteenthMethodOffset_eq : vtableFourteenthMethodOffset = 128 := rfl
theorem vtableFifteenthMethodOffset_eq : vtableFifteenthMethodOffset = 136 := rfl
theorem vtableSixteenthMethodOffset_eq : vtableSixteenthMethodOffset = 144 := rfl
theorem vtableSeventeenthMethodOffset_eq : vtableSeventeenthMethodOffset = 152 := rfl
theorem vtableEighteenthMethodOffset_eq : vtableEighteenthMethodOffset = 160 := rfl
theorem vtableNineteenthMethodOffset_eq : vtableNineteenthMethodOffset = 168 := rfl
theorem vtableTwentiethMethodOffset_eq : vtableTwentiethMethodOffset = 176 := rfl
theorem vtableTwentyFirstMethodOffset_eq : vtableTwentyFirstMethodOffset = 184 := rfl
theorem vtableTwentySecondMethodOffset_eq : vtableTwentySecondMethodOffset = 192 := rfl
theorem vtableTwentyThirdMethodOffset_eq : vtableTwentyThirdMethodOffset = 200 := rfl
theorem vtableTwentyFourthMethodOffset_eq : vtableTwentyFourthMethodOffset = 208 := rfl
theorem vtableTwentyFifthMethodOffset_eq : vtableTwentyFifthMethodOffset = 216 := rfl
theorem vtableTwentySixthMethodOffset_eq : vtableTwentySixthMethodOffset = 224 := rfl
theorem vtableTwentySeventhMethodOffset_eq : vtableTwentySeventhMethodOffset = 232 := rfl
theorem vtableTwentyEighthMethodOffset_eq : vtableTwentyEighthMethodOffset = 240 := rfl
theorem vtableTwentyNinthMethodOffset_eq : vtableTwentyNinthMethodOffset = 248 := rfl
theorem vtableThirtiethMethodOffset_eq : vtableThirtiethMethodOffset = 256 := rfl
theorem vtableThirtyFirstMethodOffset_eq : vtableThirtyFirstMethodOffset = 264 := rfl
theorem vtableThirtySecondMethodOffset_eq : vtableThirtySecondMethodOffset = 272 := rfl
theorem vtableThirtyThirdMethodOffset_eq : vtableThirtyThirdMethodOffset = 280 := rfl
theorem vtableThirtyFourthMethodOffset_eq : vtableThirtyFourthMethodOffset = 288 := rfl
theorem vtableThirtyFifthMethodOffset_eq : vtableThirtyFifthMethodOffset = 296 := rfl
theorem vtableThirtySixthMethodOffset_eq : vtableThirtySixthMethodOffset = 304 := rfl
theorem vtableThirtySeventhMethodOffset_eq : vtableThirtySeventhMethodOffset = 312 := rfl
theorem vtableThirtyEighthMethodOffset_eq : vtableThirtyEighthMethodOffset = 320 := rfl
theorem vtableThirtyNinthMethodOffset_eq : vtableThirtyNinthMethodOffset = 328 := rfl
theorem vtableFortiethMethodOffset_eq : vtableFortiethMethodOffset = 336 := rfl
theorem vtableFortyFirstMethodOffset_eq : vtableFortyFirstMethodOffset = 344 := rfl
theorem vtableFortySecondMethodOffset_eq : vtableFortySecondMethodOffset = 352 := rfl
theorem vtableFortyThirdMethodOffset_eq : vtableFortyThirdMethodOffset = 360 := rfl
theorem vtableFortyFourthMethodOffset_eq : vtableFortyFourthMethodOffset = 368 := rfl
theorem vtableFortyFifthMethodOffset_eq : vtableFortyFifthMethodOffset = 376 := rfl
theorem vtableFortySixthMethodOffset_eq : vtableFortySixthMethodOffset = 384 := rfl
theorem vtableFortySeventhMethodOffset_eq : vtableFortySeventhMethodOffset = 392 := rfl
theorem vtableFortyEighthMethodOffset_eq : vtableFortyEighthMethodOffset = 400 := rfl
theorem vtableFortyNinthMethodOffset_eq : vtableFortyNinthMethodOffset = 408 := rfl
theorem vtableFiftiethMethodOffset_eq : vtableFiftiethMethodOffset = 416 := rfl
theorem vtableFiftyFirstMethodOffset_eq : vtableFiftyFirstMethodOffset = 424 := rfl
theorem vtableFiftySecondMethodOffset_eq : vtableFiftySecondMethodOffset = 432 := rfl
theorem vtableFiftyThirdMethodOffset_eq : vtableFiftyThirdMethodOffset = 440 := rfl
theorem vtableFiftyFourthMethodOffset_eq : vtableFiftyFourthMethodOffset = 448 := rfl
theorem vtableFiftyFifthMethodOffset_eq : vtableFiftyFifthMethodOffset = 456 := rfl
theorem vtableFiftySixthMethodOffset_eq : vtableFiftySixthMethodOffset = 464 := rfl
theorem vtableFiftySeventhMethodOffset_eq : vtableFiftySeventhMethodOffset = 472 := rfl
theorem vtableFiftyEighthMethodOffset_eq : vtableFiftyEighthMethodOffset = 480 := rfl
theorem vtableFiftyNinthMethodOffset_eq : vtableFiftyNinthMethodOffset = 488 := rfl
theorem vtableSixtiethMethodOffset_eq : vtableSixtiethMethodOffset = 496 := rfl
theorem vtableSixtyFirstMethodOffset_eq : vtableSixtyFirstMethodOffset = 504 := rfl
theorem vtableSixtySecondMethodOffset_eq : vtableSixtySecondMethodOffset = 512 := rfl
theorem vtableSixtyThirdMethodOffset_eq : vtableSixtyThirdMethodOffset = 520 := rfl
theorem vtableSixtyFourthMethodOffset_eq : vtableSixtyFourthMethodOffset = 528 := rfl
theorem vtableSixtyFifthMethodOffset_eq : vtableSixtyFifthMethodOffset = 536 := rfl
theorem vtableSixtySixthMethodOffset_eq : vtableSixtySixthMethodOffset = 544 := rfl
theorem vtableSixtySeventhMethodOffset_eq : vtableSixtySeventhMethodOffset = 552 := rfl
theorem vtableSixtyEighthMethodOffset_eq : vtableSixtyEighthMethodOffset = 560 := rfl
theorem vtableSixtyNinthMethodOffset_eq : vtableSixtyNinthMethodOffset = 568 := rfl
theorem vtableSeventiethMethodOffset_eq : vtableSeventiethMethodOffset = 576 := rfl
theorem vtableSeventyFirstMethodOffset_eq : vtableSeventyFirstMethodOffset = 584 := rfl
theorem vtableSeventySecondMethodOffset_eq : vtableSeventySecondMethodOffset = 592 := rfl
theorem vtableSeventyThirdMethodOffset_eq : vtableSeventyThirdMethodOffset = 600 := rfl
theorem vtableSeventyFourthMethodOffset_eq : vtableSeventyFourthMethodOffset = 608 := rfl
theorem vtableSeventyFifthMethodOffset_eq : vtableSeventyFifthMethodOffset = 616 := rfl
theorem vtableSeventySixthMethodOffset_eq : vtableSeventySixthMethodOffset = 624 := rfl
theorem vtableSeventySeventhMethodOffset_eq : vtableSeventySeventhMethodOffset = 632 := rfl
theorem vtableSeventyEighthMethodOffset_eq : vtableSeventyEighthMethodOffset = 640 := rfl
theorem vtableSeventyNinthMethodOffset_eq : vtableSeventyNinthMethodOffset = 648 := rfl
theorem vtableEightiethMethodOffset_eq : vtableEightiethMethodOffset = 656 := rfl
theorem vtableEightyFirstMethodOffset_eq : vtableEightyFirstMethodOffset = 664 := rfl
theorem vtableEightySecondMethodOffset_eq : vtableEightySecondMethodOffset = 672 := rfl
theorem vtableEightyThirdMethodOffset_eq : vtableEightyThirdMethodOffset = 680 := rfl
theorem vtableEightyFourthMethodOffset_eq : vtableEightyFourthMethodOffset = 688 := rfl
theorem vtableEightyFifthMethodOffset_eq : vtableEightyFifthMethodOffset = 696 := rfl
theorem vtableEightySixthMethodOffset_eq : vtableEightySixthMethodOffset = 704 := rfl
theorem vtableEightySeventhMethodOffset_eq : vtableEightySeventhMethodOffset = 712 := rfl
theorem vtableEightyEighthMethodOffset_eq : vtableEightyEighthMethodOffset = 720 := rfl
theorem vtableEightyNinthMethodOffset_eq : vtableEightyNinthMethodOffset = 728 := rfl
theorem vtableNinetiethMethodOffset_eq : vtableNinetiethMethodOffset = 736 := rfl
theorem vtableNinetyFirstMethodOffset_eq : vtableNinetyFirstMethodOffset = 744 := rfl
theorem vtableNinetySecondMethodOffset_eq : vtableNinetySecondMethodOffset = 752 := rfl
theorem vtableNinetyThirdMethodOffset_eq : vtableNinetyThirdMethodOffset = 760 := rfl
theorem vtableNinetyFourthMethodOffset_eq : vtableNinetyFourthMethodOffset = 768 := rfl
theorem vtableNinetyFifthMethodOffset_eq : vtableNinetyFifthMethodOffset = 776 := rfl
theorem vtableNinetySixthMethodOffset_eq : vtableNinetySixthMethodOffset = 784 := rfl
theorem vtableNinetySeventhMethodOffset_eq : vtableNinetySeventhMethodOffset = 792 := rfl
theorem vtableNinetyEighthMethodOffset_eq : vtableNinetyEighthMethodOffset = 800 := rfl
theorem vtableNinetyNinthMethodOffset_eq : vtableNinetyNinthMethodOffset = 808 := rfl
theorem vtableOneHundredthMethodOffset_eq : vtableOneHundredthMethodOffset = 816 := rfl
theorem vtableOneHundredFirstMethodOffset_eq : vtableOneHundredFirstMethodOffset = 824 := rfl
theorem vtableOneHundredSecondMethodOffset_eq : vtableOneHundredSecondMethodOffset = 832 := rfl
theorem vtableOneHundredThirdMethodOffset_eq : vtableOneHundredThirdMethodOffset = 840 := rfl
theorem vtableOneHundredFourthMethodOffset_eq : vtableOneHundredFourthMethodOffset = 848 := rfl
theorem vtableOneHundredFifthMethodOffset_eq : vtableOneHundredFifthMethodOffset = 856 := rfl
theorem vtableOneHundredSixthMethodOffset_eq : vtableOneHundredSixthMethodOffset = 864 := rfl
theorem vtableOneHundredSeventhMethodOffset_eq : vtableOneHundredSeventhMethodOffset = 872 := rfl
theorem vtableOneHundredEighthMethodOffset_eq : vtableOneHundredEighthMethodOffset = 880 := rfl
theorem vtableOneHundredNinthMethodOffset_eq : vtableOneHundredNinthMethodOffset = 888 := rfl
theorem vtableOneHundredTenthMethodOffset_eq : vtableOneHundredTenthMethodOffset = 896 := rfl
theorem vtableOneHundredEleventhMethodOffset_eq : vtableOneHundredEleventhMethodOffset = 904 := rfl
theorem vtableOneHundredTwelfthMethodOffset_eq : vtableOneHundredTwelfthMethodOffset = 912 := rfl
theorem vtableOneHundredThirteenthMethodOffset_eq : vtableOneHundredThirteenthMethodOffset = 920 := rfl
theorem vtableOneHundredFourteenthMethodOffset_eq : vtableOneHundredFourteenthMethodOffset = 928 := rfl
theorem vtableOneHundredFifteenthMethodOffset_eq : vtableOneHundredFifteenthMethodOffset = 936 := rfl
theorem vtableOneHundredSixteenthMethodOffset_eq : vtableOneHundredSixteenthMethodOffset = 944 := rfl
theorem vtableOneHundredSeventeenthMethodOffset_eq : vtableOneHundredSeventeenthMethodOffset = 952 := rfl
theorem vtableOneHundredEighteenthMethodOffset_eq : vtableOneHundredEighteenthMethodOffset = 960 := rfl
theorem vtableOneHundredNineteenthMethodOffset_eq : vtableOneHundredNineteenthMethodOffset = 968 := rfl
theorem vtableOneHundredTwentiethMethodOffset_eq : vtableOneHundredTwentiethMethodOffset = 976 := rfl
theorem vtableOneHundredTwentyFirstMethodOffset_eq : vtableOneHundredTwentyFirstMethodOffset = 984 := rfl
theorem vtableOneHundredTwentySecondMethodOffset_eq : vtableOneHundredTwentySecondMethodOffset = 992 := rfl
theorem vtableOneHundredTwentyThirdMethodOffset_eq : vtableOneHundredTwentyThirdMethodOffset = 1000 := rfl
theorem vtableOneHundredTwentyFourthMethodOffset_eq : vtableOneHundredTwentyFourthMethodOffset = 1008 := rfl
theorem vtableOneHundredTwentyFifthMethodOffset_eq : vtableOneHundredTwentyFifthMethodOffset = 1016 := rfl
theorem vtableOneHundredTwentySixthMethodOffset_eq : vtableOneHundredTwentySixthMethodOffset = 1024 := rfl
theorem vtableOneHundredTwentySeventhMethodOffset_eq : vtableOneHundredTwentySeventhMethodOffset = 1032 := rfl
theorem vtableOneHundredTwentyEighthMethodOffset_eq : vtableOneHundredTwentyEighthMethodOffset = 1040 := rfl
theorem vtableVacantOffset_eq : vtableVacantOffset = 1048 := rfl
theorem vtableTraitVPtrOffset_eq : vtableTraitVPtrOffset = 1056 := rfl
theorem vtableFixtureSizeBytes_eq : vtableFixtureSizeBytes = 1064 := rfl
theorem vtableSupertraitSizeBytes_eq : vtableSupertraitSizeBytes = 24 := rfl
theorem vtableTraitVPtrSlotSizeBytes_eq :
    vtableTraitVPtrSlotSizeBytes = pointerSizeBytes := rfl
theorem traitObjectVtableFullBackendClaimed_false :
    traitObjectVtableFullBackendClaimed = false := rfl
theorem traitObjectVtableFullHostClaimed_false :
    traitObjectVtableFullHostClaimed = false := rfl
theorem traitObjectVtableOccupancyMemberClaimed_false :
    traitObjectVtableOccupancyMemberClaimed = false := rfl
theorem traitObjectVtableLlvmEmitClaimed_true :
    traitObjectVtableLlvmEmitClaimed = true := rfl
theorem traitObjectVtableCheckableWriterClaimed_true :
    traitObjectVtableCheckableWriterClaimed = true := rfl
theorem traitObjectVtableProductionEmitClaimed_false :
    traitObjectVtableProductionEmitClaimed = false := rfl
theorem justRecipeLlvmTraitObjectVtable_eq :
    justRecipeLlvmTraitObjectVtable = "llvm-trait-object-vtable" := rfl
theorem hostOriginId_eq : hostOriginId = "HOST-TRAIT-OBJECT-FAT" := rfl
theorem traitObjectRecordNull_dataIsNull :
    traitObjectRecordNull.dataIsNull = true := rfl

/-! ### HOST-TRAIT-OBJECT-VTABLE-SMOKE -/

example : traitObjectVtableDualPinClaimed = true := rfl
example : traitObjectVtableFullBackendClaimed = false := rfl
example : traitObjectVtableFullHostClaimed = false := rfl
example : traitObjectVtableOccupancyMemberClaimed = false := rfl
example : traitObjectVtableLlvmEmitClaimed = true := rfl
example : traitObjectVtableCheckableWriterClaimed = true := rfl
example : traitObjectVtableProductionEmitClaimed = false := rfl
example : justRecipeLlvmTraitObjectVtable = "llvm-trait-object-vtable" := rfl
example : traitObjectSizeBytes = 16 := rfl
example : traitObjectAlignBytes = 8 := rfl
example : dataPtrOffset = 0 := rfl
example : vtablePtrOffset = 8 := rfl
example : vtableSlotDropInPlace = 0 := rfl
example : vtableSlotSize = 1 := rfl
example : vtableSlotAlign = 2 := rfl
example : vtableFirstMethodSlot = 3 := rfl
example : vtableSecondMethodSlot = 4 := rfl
example : vtableThirdMethodSlot = 5 := rfl
example : vtableFourthMethodSlot = 6 := rfl
example : vtableFifthMethodSlot = 7 := rfl
example : vtableSixthMethodSlot = 8 := rfl
example : vtableSeventhMethodSlot = 9 := rfl
example : vtableEighthMethodSlot = 10 := rfl
example : vtableNinthMethodSlot = 11 := rfl
example : vtableTenthMethodSlot = 12 := rfl
example : vtableEleventhMethodSlot = 13 := rfl
example : vtableTwelfthMethodSlot = 14 := rfl
example : vtableThirteenthMethodSlot = 15 := rfl
example : vtableFourteenthMethodSlot = 16 := rfl
example : vtableFifteenthMethodSlot = 17 := rfl
example : vtableSixteenthMethodSlot = 18 := rfl
example : vtableSeventeenthMethodSlot = 19 := rfl
example : vtableEighteenthMethodSlot = 20 := rfl
example : vtableNineteenthMethodSlot = 21 := rfl
example : vtableTwentiethMethodSlot = 22 := rfl
example : vtableTwentyFirstMethodSlot = 23 := rfl
example : vtableTwentySecondMethodSlot = 24 := rfl
example : vtableTwentyThirdMethodSlot = 25 := rfl
example : vtableTwentyFourthMethodSlot = 26 := rfl
example : vtableTwentyFifthMethodSlot = 27 := rfl
example : vtableTwentySixthMethodSlot = 28 := rfl
example : vtableTwentySeventhMethodSlot = 29 := rfl
example : vtableTwentyEighthMethodSlot = 30 := rfl
example : vtableTwentyNinthMethodSlot = 31 := rfl
example : vtableThirtiethMethodSlot = 32 := rfl
example : vtableThirtyFirstMethodSlot = 33 := rfl
example : vtableThirtySecondMethodSlot = 34 := rfl
example : vtableThirtyThirdMethodSlot = 35 := rfl
example : vtableThirtyFourthMethodSlot = 36 := rfl
example : vtableThirtyFifthMethodSlot = 37 := rfl
example : vtableThirtySixthMethodSlot = 38 := rfl
example : vtableThirtySeventhMethodSlot = 39 := rfl
example : vtableThirtyEighthMethodSlot = 40 := rfl
example : vtableThirtyNinthMethodSlot = 41 := rfl
example : vtableFortiethMethodSlot = 42 := rfl
example : vtableFortyFirstMethodSlot = 43 := rfl
example : vtableFortySecondMethodSlot = 44 := rfl
example : vtableFortyThirdMethodSlot = 45 := rfl
example : vtableFortyFourthMethodSlot = 46 := rfl
example : vtableFortyFifthMethodSlot = 47 := rfl
example : vtableFortySixthMethodSlot = 48 := rfl
example : vtableFortySeventhMethodSlot = 49 := rfl
example : vtableFortyEighthMethodSlot = 50 := rfl
example : vtableFortyNinthMethodSlot = 51 := rfl
example : vtableFiftiethMethodSlot = 52 := rfl
example : vtableFiftyFirstMethodSlot = 53 := rfl
example : vtableFiftySecondMethodSlot = 54 := rfl
example : vtableFiftyThirdMethodSlot = 55 := rfl
example : vtableFiftyFourthMethodSlot = 56 := rfl
example : vtableFiftyFifthMethodSlot = 57 := rfl
example : vtableFiftySixthMethodSlot = 58 := rfl
example : vtableFiftySeventhMethodSlot = 59 := rfl
example : vtableFiftyEighthMethodSlot = 60 := rfl
example : vtableFiftyNinthMethodSlot = 61 := rfl
example : vtableSixtiethMethodSlot = 62 := rfl
example : vtableSixtyFirstMethodSlot = 63 := rfl
example : vtableSixtySecondMethodSlot = 64 := rfl
example : vtableSixtyThirdMethodSlot = 65 := rfl
example : vtableSixtyFourthMethodSlot = 66 := rfl
example : vtableSixtyFifthMethodSlot = 67 := rfl
example : vtableSixtySixthMethodSlot = 68 := rfl
example : vtableSixtySeventhMethodSlot = 69 := rfl
example : vtableSixtyEighthMethodSlot = 70 := rfl
example : vtableSixtyNinthMethodSlot = 71 := rfl
example : vtableSeventiethMethodSlot = 72 := rfl
example : vtableSeventyFirstMethodSlot = 73 := rfl
example : vtableSeventySecondMethodSlot = 74 := rfl
example : vtableSeventyThirdMethodSlot = 75 := rfl
example : vtableSeventyFourthMethodSlot = 76 := rfl
example : vtableSeventyFifthMethodSlot = 77 := rfl
example : vtableSeventySixthMethodSlot = 78 := rfl
example : vtableSeventySeventhMethodSlot = 79 := rfl
example : vtableSeventyEighthMethodSlot = 80 := rfl
example : vtableSeventyNinthMethodSlot = 81 := rfl
example : vtableEightiethMethodSlot = 82 := rfl
example : vtableEightyFirstMethodSlot = 83 := rfl
example : vtableEightySecondMethodSlot = 84 := rfl
example : vtableEightyThirdMethodSlot = 85 := rfl
example : vtableEightyFourthMethodSlot = 86 := rfl
example : vtableEightyFifthMethodSlot = 87 := rfl
example : vtableEightySixthMethodSlot = 88 := rfl
example : vtableEightySeventhMethodSlot = 89 := rfl
example : vtableEightyEighthMethodSlot = 90 := rfl
example : vtableEightyNinthMethodSlot = 91 := rfl
example : vtableNinetiethMethodSlot = 92 := rfl
example : vtableNinetyFirstMethodSlot = 93 := rfl
example : vtableNinetySecondMethodSlot = 94 := rfl
example : vtableNinetyThirdMethodSlot = 95 := rfl
example : vtableNinetyFourthMethodSlot = 96 := rfl
example : vtableNinetyFifthMethodSlot = 97 := rfl
example : vtableNinetySixthMethodSlot = 98 := rfl
example : vtableNinetySeventhMethodSlot = 99 := rfl
example : vtableNinetyEighthMethodSlot = 100 := rfl
example : vtableNinetyNinthMethodSlot = 101 := rfl
example : vtableOneHundredthMethodSlot = 102 := rfl
example : vtableOneHundredFirstMethodSlot = 103 := rfl
example : vtableOneHundredSecondMethodSlot = 104 := rfl
example : vtableOneHundredThirdMethodSlot = 105 := rfl
example : vtableOneHundredFourthMethodSlot = 106 := rfl
example : vtableOneHundredFifthMethodSlot = 107 := rfl
example : vtableOneHundredSixthMethodSlot = 108 := rfl
example : vtableOneHundredSeventhMethodSlot = 109 := rfl
example : vtableOneHundredEighthMethodSlot = 110 := rfl
example : vtableOneHundredNinthMethodSlot = 111 := rfl
example : vtableOneHundredTenthMethodSlot = 112 := rfl
example : vtableOneHundredEleventhMethodSlot = 113 := rfl
example : vtableOneHundredTwelfthMethodSlot = 114 := rfl
example : vtableOneHundredThirteenthMethodSlot = 115 := rfl
example : vtableOneHundredFourteenthMethodSlot = 116 := rfl
example : vtableOneHundredFifteenthMethodSlot = 117 := rfl
example : vtableOneHundredSixteenthMethodSlot = 118 := rfl
example : vtableOneHundredSeventeenthMethodSlot = 119 := rfl
example : vtableOneHundredEighteenthMethodSlot = 120 := rfl
example : vtableOneHundredNineteenthMethodSlot = 121 := rfl
example : vtableOneHundredTwentiethMethodSlot = 122 := rfl
example : vtableOneHundredTwentyFirstMethodSlot = 123 := rfl
example : vtableOneHundredTwentySecondMethodSlot = 124 := rfl
example : vtableOneHundredTwentyThirdMethodSlot = 125 := rfl
example : vtableOneHundredTwentyFourthMethodSlot = 126 := rfl
example : vtableOneHundredTwentyFifthMethodSlot = 127 := rfl
example : vtableOneHundredTwentySixthMethodSlot = 128 := rfl
example : vtableOneHundredTwentySeventhMethodSlot = 129 := rfl
example : vtableOneHundredTwentyEighthMethodSlot = 130 := rfl
example : vtableFixtureMethodCount = 128 := rfl
example : vtableFirstVacantSlot = 131 := rfl
example : vtableFirstTraitVPtrSlot = 132 := rfl
example : vtableSlotKind 3 = some VtableSlotKind.method := rfl
example : vtableSlotKind 4 = some VtableSlotKind.method := rfl
example : vtableSlotKind 5 = some VtableSlotKind.method := rfl
example : vtableSlotKind 6 = some VtableSlotKind.method := rfl
example : vtableSlotKind 7 = some VtableSlotKind.method := rfl
example : vtableSlotKind 8 = some VtableSlotKind.method := rfl
example : vtableSlotKind 9 = some VtableSlotKind.method := rfl
example : vtableSlotKind 10 = some VtableSlotKind.method := rfl
example : vtableSlotKind 11 = some VtableSlotKind.method := rfl
example : vtableSlotKind 12 = some VtableSlotKind.method := rfl
example : vtableSlotKind 13 = some VtableSlotKind.method := rfl
example : vtableSlotKind 14 = some VtableSlotKind.method := rfl
example : vtableSlotKind 15 = some VtableSlotKind.method := rfl
example : vtableSlotKind 16 = some VtableSlotKind.method := rfl
example : vtableSlotKind 17 = some VtableSlotKind.method := rfl
example : vtableSlotKind 18 = some VtableSlotKind.method := rfl
example : vtableSlotKind 19 = some VtableSlotKind.method := rfl
example : vtableSlotKind 20 = some VtableSlotKind.method := rfl
example : vtableSlotKind 21 = some VtableSlotKind.method := rfl
example : vtableSlotKind 22 = some VtableSlotKind.method := rfl
example : vtableSlotKind 23 = some VtableSlotKind.method := rfl
example : vtableSlotKind 24 = some VtableSlotKind.method := rfl
example : vtableSlotKind 25 = some VtableSlotKind.method := rfl
example : vtableSlotKind 26 = some VtableSlotKind.method := rfl
example : vtableSlotKind 27 = some VtableSlotKind.method := rfl
example : vtableSlotKind 28 = some VtableSlotKind.method := rfl
example : vtableSlotKind 29 = some VtableSlotKind.method := rfl
example : vtableSlotKind 30 = some VtableSlotKind.method := rfl
example : vtableSlotKind 31 = some VtableSlotKind.method := rfl
example : vtableSlotKind 32 = some VtableSlotKind.method := rfl
example : vtableSlotKind 33 = some VtableSlotKind.method := rfl
example : vtableSlotKind 34 = some VtableSlotKind.method := rfl
example : vtableSlotKind 35 = some VtableSlotKind.method := rfl
example : vtableSlotKind 36 = some VtableSlotKind.method := rfl
example : vtableSlotKind 37 = some VtableSlotKind.method := rfl
example : vtableSlotKind 38 = some VtableSlotKind.method := rfl
example : vtableSlotKind 39 = some VtableSlotKind.method := rfl
example : vtableSlotKind 40 = some VtableSlotKind.method := rfl
example : vtableSlotKind 41 = some VtableSlotKind.method := rfl
example : vtableSlotKind 42 = some VtableSlotKind.method := rfl
example : vtableSlotKind 43 = some VtableSlotKind.method := rfl
example : vtableSlotKind 44 = some VtableSlotKind.method := rfl
example : vtableSlotKind 45 = some VtableSlotKind.method := rfl
example : vtableSlotKind 46 = some VtableSlotKind.method := rfl
example : vtableSlotKind 47 = some VtableSlotKind.method := rfl
example : vtableSlotKind 48 = some VtableSlotKind.method := rfl
example : vtableSlotKind 49 = some VtableSlotKind.method := rfl
example : vtableSlotKind 50 = some VtableSlotKind.method := rfl
example : vtableSlotKind 51 = some VtableSlotKind.method := rfl
example : vtableSlotKind 52 = some VtableSlotKind.method := rfl
example : vtableSlotKind 53 = some VtableSlotKind.method := rfl
example : vtableSlotKind 54 = some VtableSlotKind.method := rfl
example : vtableSlotKind 55 = some VtableSlotKind.method := rfl
example : vtableSlotKind 56 = some VtableSlotKind.method := rfl
example : vtableSlotKind 57 = some VtableSlotKind.method := rfl
example : vtableSlotKind 58 = some VtableSlotKind.method := rfl
example : vtableSlotKind 59 = some VtableSlotKind.method := rfl
example : vtableSlotKind 60 = some VtableSlotKind.method := rfl
example : vtableSlotKind 61 = some VtableSlotKind.method := rfl
example : vtableSlotKind 62 = some VtableSlotKind.method := rfl
example : vtableSlotKind 63 = some VtableSlotKind.method := rfl
example : vtableSlotKind 64 = some VtableSlotKind.method := rfl
example : vtableSlotKind 65 = some VtableSlotKind.method := rfl
example : vtableSlotKind 66 = some VtableSlotKind.method := rfl
example : vtableSlotKind 67 = some VtableSlotKind.method := rfl
example : vtableSlotKind 68 = some VtableSlotKind.method := rfl
example : vtableSlotKind 69 = some VtableSlotKind.method := rfl
example : vtableSlotKind 70 = some VtableSlotKind.method := rfl
example : vtableSlotKind 71 = some VtableSlotKind.method := rfl
example : vtableSlotKind 72 = some VtableSlotKind.method := rfl
example : vtableSlotKind 73 = some VtableSlotKind.method := rfl
example : vtableSlotKind 74 = some VtableSlotKind.method := rfl
example : vtableSlotKind 75 = some VtableSlotKind.method := rfl
example : vtableSlotKind 76 = some VtableSlotKind.method := rfl
example : vtableSlotKind 77 = some VtableSlotKind.method := rfl
example : vtableSlotKind 78 = some VtableSlotKind.method := rfl
example : vtableSlotKind 79 = some VtableSlotKind.method := rfl
example : vtableSlotKind 80 = some VtableSlotKind.method := rfl
example : vtableSlotKind 81 = some VtableSlotKind.method := rfl
example : vtableSlotKind 82 = some VtableSlotKind.method := rfl
example : vtableSlotKind 83 = some VtableSlotKind.method := rfl
example : vtableSlotKind 84 = some VtableSlotKind.method := rfl
example : vtableSlotKind 85 = some VtableSlotKind.method := rfl
example : vtableSlotKind 86 = some VtableSlotKind.method := rfl
example : vtableSlotKind 87 = some VtableSlotKind.method := rfl
example : vtableSlotKind 88 = some VtableSlotKind.method := rfl
example : vtableSlotKind 89 = some VtableSlotKind.method := rfl
example : vtableSlotKind 90 = some VtableSlotKind.method := rfl
example : vtableSlotKind 91 = some VtableSlotKind.method := rfl
example : vtableSlotKind 92 = some VtableSlotKind.method := rfl
example : vtableSlotKind 93 = some VtableSlotKind.method := rfl
example : vtableSlotKind 94 = some VtableSlotKind.method := rfl
example : vtableSlotKind 95 = some VtableSlotKind.method := rfl
example : vtableSlotKind 96 = some VtableSlotKind.method := rfl
example : vtableSlotKind 97 = some VtableSlotKind.method := rfl
example : vtableSlotKind 98 = some VtableSlotKind.method := rfl
example : vtableSlotKind 99 = some VtableSlotKind.method := rfl
example : vtableSlotKind 100 = some VtableSlotKind.method := rfl
example : vtableSlotKind 101 = some VtableSlotKind.method := rfl
example : vtableSlotKind 102 = some VtableSlotKind.method := rfl
example : vtableSlotKind 103 = some VtableSlotKind.method := rfl
example : vtableSlotKind 104 = some VtableSlotKind.method := rfl
example : vtableSlotKind 105 = some VtableSlotKind.method := rfl
example : vtableSlotKind 106 = some VtableSlotKind.method := rfl
example : vtableSlotKind 107 = some VtableSlotKind.method := rfl
example : vtableSlotKind 108 = some VtableSlotKind.method := rfl
example : vtableSlotKind 109 = some VtableSlotKind.method := rfl
example : vtableSlotKind 110 = some VtableSlotKind.method := rfl
example : vtableSlotKind 111 = some VtableSlotKind.method := rfl
example : vtableSlotKind 112 = some VtableSlotKind.method := rfl
example : vtableSlotKind 113 = some VtableSlotKind.method := rfl
example : vtableSlotKind 114 = some VtableSlotKind.method := rfl
example : vtableSlotKind 115 = some VtableSlotKind.method := rfl
example : vtableSlotKind 116 = some VtableSlotKind.method := rfl
example : vtableSlotKind 117 = some VtableSlotKind.method := rfl
example : vtableSlotKind 118 = some VtableSlotKind.method := rfl
example : vtableSlotKind 119 = some VtableSlotKind.method := rfl
example : vtableSlotKind 120 = some VtableSlotKind.method := rfl
example : vtableSlotKind 121 = some VtableSlotKind.method := rfl
example : vtableSlotKind 122 = some VtableSlotKind.method := rfl
example : vtableSlotKind 123 = some VtableSlotKind.method := rfl
example : vtableSlotKind 124 = some VtableSlotKind.method := rfl
example : vtableSlotKind 125 = some VtableSlotKind.method := rfl
example : vtableSlotKind 126 = some VtableSlotKind.method := rfl
example : vtableSlotKind 127 = some VtableSlotKind.method := rfl
example : vtableSlotKind 128 = some VtableSlotKind.method := rfl
example : vtableSlotKind 129 = some VtableSlotKind.method := rfl
example : vtableSlotKind 130 = some VtableSlotKind.method := rfl
example : vtableSlotKind 131 = some VtableSlotKind.vacant := rfl
example : vtableSlotKind 132 = some VtableSlotKind.traitVPtr := rfl
example : vtableHeaderSlotKind 3 = none := rfl
example : vtableSecondMethodOffset = 32 := rfl
example : vtableThirdMethodOffset = 40 := rfl
example : vtableFourthMethodOffset = 48 := rfl
example : vtableFifthMethodOffset = 56 := rfl
example : vtableSixthMethodOffset = 64 := rfl
example : vtableSeventhMethodOffset = 72 := rfl
example : vtableEighthMethodOffset = 80 := rfl
example : vtableNinthMethodOffset = 88 := rfl
example : vtableTenthMethodOffset = 96 := rfl
example : vtableEleventhMethodOffset = 104 := rfl
example : vtableTwelfthMethodOffset = 112 := rfl
example : vtableThirteenthMethodOffset = 120 := rfl
example : vtableFourteenthMethodOffset = 128 := rfl
example : vtableFifteenthMethodOffset = 136 := rfl
example : vtableSixteenthMethodOffset = 144 := rfl
example : vtableSeventeenthMethodOffset = 152 := rfl
example : vtableEighteenthMethodOffset = 160 := rfl
example : vtableNineteenthMethodOffset = 168 := rfl
example : vtableTwentiethMethodOffset = 176 := rfl
example : vtableTwentyFirstMethodOffset = 184 := rfl
example : vtableTwentySecondMethodOffset = 192 := rfl
example : vtableTwentyThirdMethodOffset = 200 := rfl
example : vtableTwentyFourthMethodOffset = 208 := rfl
example : vtableTwentyFifthMethodOffset = 216 := rfl
example : vtableTwentySixthMethodOffset = 224 := rfl
example : vtableTwentySeventhMethodOffset = 232 := rfl
example : vtableTwentyEighthMethodOffset = 240 := rfl
example : vtableTwentyNinthMethodOffset = 248 := rfl
example : vtableThirtiethMethodOffset = 256 := rfl
example : vtableThirtyFirstMethodOffset = 264 := rfl
example : vtableThirtySecondMethodOffset = 272 := rfl
example : vtableThirtyThirdMethodOffset = 280 := rfl
example : vtableThirtyFourthMethodOffset = 288 := rfl
example : vtableThirtyFifthMethodOffset = 296 := rfl
example : vtableThirtySixthMethodOffset = 304 := rfl
example : vtableThirtySeventhMethodOffset = 312 := rfl
example : vtableThirtyEighthMethodOffset = 320 := rfl
example : vtableThirtyNinthMethodOffset = 328 := rfl
example : vtableFortiethMethodOffset = 336 := rfl
example : vtableFortyFirstMethodOffset = 344 := rfl
example : vtableFortySecondMethodOffset = 352 := rfl
example : vtableFortyThirdMethodOffset = 360 := rfl
example : vtableFortyFourthMethodOffset = 368 := rfl
example : vtableFortyFifthMethodOffset = 376 := rfl
example : vtableFortySixthMethodOffset = 384 := rfl
example : vtableFortySeventhMethodOffset = 392 := rfl
example : vtableFortyEighthMethodOffset = 400 := rfl
example : vtableFortyNinthMethodOffset = 408 := rfl
example : vtableFiftiethMethodOffset = 416 := rfl
example : vtableFiftyFirstMethodOffset = 424 := rfl
example : vtableFiftySecondMethodOffset = 432 := rfl
example : vtableFiftyThirdMethodOffset = 440 := rfl
example : vtableFiftyFourthMethodOffset = 448 := rfl
example : vtableFiftyFifthMethodOffset = 456 := rfl
example : vtableFiftySixthMethodOffset = 464 := rfl
example : vtableFiftySeventhMethodOffset = 472 := rfl
example : vtableFiftyEighthMethodOffset = 480 := rfl
example : vtableFiftyNinthMethodOffset = 488 := rfl
example : vtableSixtiethMethodOffset = 496 := rfl
example : vtableSixtyFirstMethodOffset = 504 := rfl
example : vtableSixtySecondMethodOffset = 512 := rfl
example : vtableSixtyThirdMethodOffset = 520 := rfl
example : vtableSixtyFourthMethodOffset = 528 := rfl
example : vtableSixtyFifthMethodOffset = 536 := rfl
example : vtableSixtySixthMethodOffset = 544 := rfl
example : vtableSixtySeventhMethodOffset = 552 := rfl
example : vtableSixtyEighthMethodOffset = 560 := rfl
example : vtableSixtyNinthMethodOffset = 568 := rfl
example : vtableSeventiethMethodOffset = 576 := rfl
example : vtableSeventyFirstMethodOffset = 584 := rfl
example : vtableSeventySecondMethodOffset = 592 := rfl
example : vtableSeventyThirdMethodOffset = 600 := rfl
example : vtableSeventyFourthMethodOffset = 608 := rfl
example : vtableSeventyFifthMethodOffset = 616 := rfl
example : vtableSeventySixthMethodOffset = 624 := rfl
example : vtableSeventySeventhMethodOffset = 632 := rfl
example : vtableSeventyEighthMethodOffset = 640 := rfl
example : vtableSeventyNinthMethodOffset = 648 := rfl
example : vtableEightiethMethodOffset = 656 := rfl
example : vtableEightyFirstMethodOffset = 664 := rfl
example : vtableEightySecondMethodOffset = 672 := rfl
example : vtableEightyThirdMethodOffset = 680 := rfl
example : vtableEightyFourthMethodOffset = 688 := rfl
example : vtableEightyFifthMethodOffset = 696 := rfl
example : vtableEightySixthMethodOffset = 704 := rfl
example : vtableEightySeventhMethodOffset = 712 := rfl
example : vtableEightyEighthMethodOffset = 720 := rfl
example : vtableEightyNinthMethodOffset = 728 := rfl
example : vtableNinetiethMethodOffset = 736 := rfl
example : vtableNinetyFirstMethodOffset = 744 := rfl
example : vtableNinetySecondMethodOffset = 752 := rfl
example : vtableNinetyThirdMethodOffset = 760 := rfl
example : vtableNinetyFourthMethodOffset = 768 := rfl
example : vtableNinetyFifthMethodOffset = 776 := rfl
example : vtableNinetySixthMethodOffset = 784 := rfl
example : vtableNinetySeventhMethodOffset = 792 := rfl
example : vtableNinetyEighthMethodOffset = 800 := rfl
example : vtableNinetyNinthMethodOffset = 808 := rfl
example : vtableOneHundredthMethodOffset = 816 := rfl
example : vtableOneHundredFirstMethodOffset = 824 := rfl
example : vtableOneHundredSecondMethodOffset = 832 := rfl
example : vtableOneHundredThirdMethodOffset = 840 := rfl
example : vtableOneHundredFourthMethodOffset = 848 := rfl
example : vtableOneHundredFifthMethodOffset = 856 := rfl
example : vtableOneHundredSixthMethodOffset = 864 := rfl
example : vtableOneHundredSeventhMethodOffset = 872 := rfl
example : vtableOneHundredEighthMethodOffset = 880 := rfl
example : vtableOneHundredNinthMethodOffset = 888 := rfl
example : vtableOneHundredTenthMethodOffset = 896 := rfl
example : vtableOneHundredEleventhMethodOffset = 904 := rfl
example : vtableOneHundredTwelfthMethodOffset = 912 := rfl
example : vtableOneHundredThirteenthMethodOffset = 920 := rfl
example : vtableOneHundredFourteenthMethodOffset = 928 := rfl
example : vtableOneHundredFifteenthMethodOffset = 936 := rfl
example : vtableOneHundredSixteenthMethodOffset = 944 := rfl
example : vtableOneHundredSeventeenthMethodOffset = 952 := rfl
example : vtableOneHundredEighteenthMethodOffset = 960 := rfl
example : vtableOneHundredNineteenthMethodOffset = 968 := rfl
example : vtableOneHundredTwentiethMethodOffset = 976 := rfl
example : vtableOneHundredTwentyFirstMethodOffset = 984 := rfl
example : vtableOneHundredTwentySecondMethodOffset = 992 := rfl
example : vtableOneHundredTwentyThirdMethodOffset = 1000 := rfl
example : vtableOneHundredTwentyFourthMethodOffset = 1008 := rfl
example : vtableOneHundredTwentyFifthMethodOffset = 1016 := rfl
example : vtableOneHundredTwentySixthMethodOffset = 1024 := rfl
example : vtableOneHundredTwentySeventhMethodOffset = 1032 := rfl
example : vtableOneHundredTwentyEighthMethodOffset = 1040 := rfl
example : vtableVacantOffset = 1048 := rfl
example : vtableTraitVPtrOffset = 1056 := rfl
example : vtableFixtureSizeBytes = 1064 := rfl
example : traitObjectVtableIrBasename = "trait-object-vtable.ll" := rfl
example : hostOriginId = "HOST-TRAIT-OBJECT-FAT" := rfl
example : traitObjectFixtureVtable.slots.length = 133 := rfl
example : traitObjectSupertraitVtable.slots.length = 3 := rfl

/-- Fail closed if written fixture IR lacks greppable honesty tokens. -/
def validateTraitObjectVtableIrPackage (label : String) (text : String) :
    IO Unit := do
  let need : List String :=
    [ "SLAKE_TRAIT_OBJECT_VTABLE_V0"
    , "HOST-TRAIT-OBJECT-VTABLE"
    , "TRAIT-OBJECT-VTABLE-IR"
    , "rustc_abi"
    , "x86_64-unknown-linux-gnu"
    , "TraitObjectRecord"
    , "drop_in_place"
    , "slake_trait_object_drop_in_place"
    , "slake_trait_object_method0"
    , "slake_trait_object_method1"
    , "slake_trait_object_method2"
    , "slake_trait_object_method3"
    , "slake_trait_object_method4"
    , "slake_trait_object_method5"
    , "slake_trait_object_method6"
    , "slake_trait_object_method7"
    , "slake_trait_object_method8"
    , "slake_trait_object_method9"
    , "slake_trait_object_method10"
    , "slake_trait_object_method11"
    , "slake_trait_object_method12"
    , "slake_trait_object_method13"
    , "slake_trait_object_method14"
    , "slake_trait_object_method15"
    , "slake_trait_object_method16"
    , "slake_trait_object_method17"
    , "slake_trait_object_method18"
    , "slake_trait_object_method19"
    , "slake_trait_object_method20"
    , "slake_trait_object_method21"
    , "slake_trait_object_method22"
    , "slake_trait_object_method23"
    , "slake_trait_object_method24"
    , "slake_trait_object_method25"
    , "slake_trait_object_method26"
    , "slake_trait_object_method27"
    , "slake_trait_object_method28"
    , "slake_trait_object_method29"
    , "slake_trait_object_method30"
    , "slake_trait_object_method31"
    , "slake_trait_object_method32"
    , "slake_trait_object_method33"
    , "slake_trait_object_method34"
    , "slake_trait_object_method35"
    , "slake_trait_object_method36"
    , "slake_trait_object_method37"
    , "slake_trait_object_method38"
    , "slake_trait_object_method39"
    , "slake_trait_object_method40"
    , "slake_trait_object_method41"
    , "slake_trait_object_method42"
    , "slake_trait_object_method43"
    , "slake_trait_object_method44"
    , "slake_trait_object_method45"
    , "slake_trait_object_method46"
    , "slake_trait_object_method47"
    , "slake_trait_object_method48"
    , "slake_trait_object_method49"
    , "slake_trait_object_method50"
    , "slake_trait_object_method51"
    , "slake_trait_object_method52"
    , "slake_trait_object_method53"
    , "slake_trait_object_method54"
    , "slake_trait_object_method55"
    , "slake_trait_object_method56"
    , "slake_trait_object_method57"
    , "slake_trait_object_method58"
    , "slake_trait_object_method59"
    , "slake_trait_object_method60"
    , "slake_trait_object_method61"
    , "slake_trait_object_method62"
    , "slake_trait_object_method63"
    , "slake_trait_object_method64"
    , "slake_trait_object_method65"
    , "slake_trait_object_method66"
    , "slake_trait_object_method67"
    , "slake_trait_object_method68"
    , "slake_trait_object_method69"
    , "slake_trait_object_method70"
    , "slake_trait_object_method71"
    , "slake_trait_object_method72"
    , "slake_trait_object_method73"
    , "slake_trait_object_method74"
    , "slake_trait_object_method75"
    , "slake_trait_object_method76"
    , "slake_trait_object_method77"
    , "slake_trait_object_method78"
    , "slake_trait_object_method79"
    , "slake_trait_object_method80"
    , "slake_trait_object_method81"
    , "slake_trait_object_method82"
    , "slake_trait_object_method83"
    , "slake_trait_object_method84"
    , "slake_trait_object_method85"
    , "slake_trait_object_method86"
    , "slake_trait_object_method87"
    , "slake_trait_object_method88"
    , "slake_trait_object_method89"
    , "slake_trait_object_method90"
    , "slake_trait_object_method91"
    , "slake_trait_object_method92"
    , "slake_trait_object_method93"
    , "slake_trait_object_method94"
    , "slake_trait_object_method95"
    , "slake_trait_object_method96"
    , "slake_trait_object_method97"
    , "slake_trait_object_method98"
    , "slake_trait_object_method99"
    , "slake_trait_object_method100"
    , "slake_trait_object_method101"
    , "slake_trait_object_method102"
    , "slake_trait_object_method103"
    , "slake_trait_object_method104"
    , "slake_trait_object_method105"
    , "slake_trait_object_method106"
    , "slake_trait_object_method107"
    , "slake_trait_object_method108"
    , "slake_trait_object_method109"
    , "slake_trait_object_method110"
    , "slake_trait_object_method111"
    , "slake_trait_object_method112"
    , "slake_trait_object_method113"
    , "slake_trait_object_method114"
    , "slake_trait_object_method115"
    , "slake_trait_object_method116"
    , "slake_trait_object_method117"
    , "slake_trait_object_method118"
    , "slake_trait_object_method119"
    , "slake_trait_object_method120"
    , "slake_trait_object_method121"
    , "slake_trait_object_method122"
    , "slake_trait_object_method123"
    , "slake_trait_object_method124"
    , "slake_trait_object_method125"
    , "slake_trait_object_method126"
    , "slake_trait_object_method127"
    , "slake_trait_object_supertrait_vtable"
    , "slake_trait_object_vtable_fixture"
    , "trait-object-vtable.ll"
    , "not FullBackend"
    , "rustc_abi pointer"
    , "TraitVPtr"
    , "Vacant"
    , "VtblEntry::Vacant"
    , "HOST-TRAIT-OBJECT-FAT"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected freestanding C emit stage"
    throw (IO.userError s!"{label}: freestanding stage")

/-- Fail closed if dest bytes differ from the Lean printer (no write).
    Greppable: traitObjectVtableLlvmCheck. -/
def traitObjectVtableLlvmCheck (root : System.FilePath) : IO Unit := do
  unless traitObjectVtableReady do
    IO.eprintln s!"error: {stageId}: traitObjectVtableReady false"
    throw (IO.userError "traitObjectVtableReady false")
  unless traitObjectVtableIrPackageOk do
    IO.eprintln s!"error: {stageId}: traitObjectVtableIrPackageOk false"
    throw (IO.userError "traitObjectVtableIrPackageOk false")
  let outLl := root / "out" / "llvm-ir" / traitObjectVtableIrBasename
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing vtable IR: {outLl}"
    throw (IO.userError "missing vtable IR")
  let written <- IO.FS.readFile outLl
  if written != traitObjectVtableIrPackage then
    IO.eprintln "error: vtable IR dest bytes differ from Lean printer"
    throw (IO.userError "vtable IR mismatch")
  validateTraitObjectVtableIrPackage traitObjectVtableIrBasename written
  IO.println s!"GREEN {stageId}: check {outLl} ({written.length})"
  IO.println "  greppable: HOST-TRAIT-OBJECT-VTABLE, HOST-TRAIT-OBJECT-FAT, TRAIT-OBJECT-VTABLE-IR"
  IO.println "  honesty: fixture path; production emit claimed false; not FullBackend"

/-- Write named fixture LLVM IR under root/out/llvm-ir/trait-object-vtable.ll.
    Greppable: traitObjectVtableLlvmWrite, IO.FS.writeFile.
    lean --run writer; no mill inventory row; no lake exe. -/
def traitObjectVtableLlvmWrite (root : System.FilePath) : IO Unit := do
  unless traitObjectVtableReady do
    IO.eprintln s!"error: {stageId}: traitObjectVtableReady false"
    throw (IO.userError "traitObjectVtableReady false")
  unless traitObjectVtableIrPackageOk do
    IO.eprintln s!"error: {stageId}: traitObjectVtableIrPackageOk false"
    throw (IO.userError "traitObjectVtableIrPackageOk false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / traitObjectVtableIrBasename
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl traitObjectVtableIrPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing vtable IR after write: {outLl}"
    throw (IO.userError "missing vtable IR")
  if written != traitObjectVtableIrPackage then
    IO.eprintln "error: vtable IR written content mismatch"
    throw (IO.userError "vtable IR mismatch")
  validateTraitObjectVtableIrPackage traitObjectVtableIrBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-TRAIT-OBJECT-VTABLE, HOST-TRAIT-OBJECT-FAT, TRAIT-OBJECT-VTABLE-IR"
  IO.println "  honesty: fixture path; production emit claimed false; not FullBackend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write fixture IR under repo root (default .) or check dest matches
    the Lean printer. Mode is write (default), check, or print (stdout IR).
    Greppable: traitObjectVtableMain. -/
def traitObjectVtableMain (args : List String) : IO UInt32 := do
  let rest := filterArgs args
  let root : System.FilePath :=
    match rest with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  let mode : String :=
    match rest with
    | _ :: m :: _ => m
    | _ => "write"
  try
    match mode with
    | "print" => do
      IO.print traitObjectVtableIrPackage
      pure 0
    | "check" => do
      traitObjectVtableLlvmCheck root
      pure 0
    | "write" => do
      traitObjectVtableLlvmWrite root
      traitObjectVtableLlvmCheck root
      pure 0
    | other => do
      IO.eprintln s!"error: {stageId}: unknown mode {other} (want write|check|print)"
      pure 1
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.TraitObjectVtable

/-- lean --run entry (no mill row, no lake exe). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.TraitObjectVtable.traitObjectVtableMain args

