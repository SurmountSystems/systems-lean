/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TraitObjectVtable.lean bytes.
  Part 03 of the pinned source. Not occupancy name 50. Not mill 70.
  Greppable: liveTraitObjectVtableSourcePart03, PARSE-LIVE-TRAIT-OBJECT-VTABLE.
  Module: SystemsLean.HostFrontLiveTraitObjectVtableSource03
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTraitObjectVtable

/-- Dual-pinned live TraitObjectVtable.lean bytes, part 03.
    Greppable: liveTraitObjectVtableSourcePart03. -/
def liveTraitObjectVtableSourcePart03 : String := r#"
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
"#

end SystemsLean.HostFrontLiveTraitObjectVtable
