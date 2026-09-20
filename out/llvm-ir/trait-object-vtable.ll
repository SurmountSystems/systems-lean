; SLAKE_TRAIT_OBJECT_VTABLE_V0 / HOST-TRAIT-OBJECT-VTABLE
; TRAIT-OBJECT-VTABLE-IR named fixture (not FullBackend)
; HOST-TRAIT-OBJECT-FAT host-originated emit (walk TraitObjectFat + slots)
; rustc_abi ScalarPair two pointers; COMMON_VTABLE_ENTRIES drop/size/align then methods
; SSOT: src/systems/SystemsLean/TraitObjectVtable.lean
; Path: out/llvm-ir/trait-object-vtable.ll
; Target: x86_64-unknown-linux-gnu
; Fat pointer TraitObjectRecord: data offset 0, vtable offset 8, size 16, align 8
; Vtable fixture: 133 slots, 1064 bytes, align 8
; slot 0 drop_in_place offset 0
; slot 1 size offset 8 (usize / i64)
; slot 2 align offset 16 (usize / i64)
; slot 3 method0 offset 24 rustc_abi pointer
; slot 4 method1 offset 32 rustc_abi pointer
; slot 5 method2 offset 40 rustc_abi pointer
; slot 6 method3 offset 48 rustc_abi pointer
; slot 7 method4 offset 56 rustc_abi pointer
; slot 8 method5 offset 64 rustc_abi pointer
; slot 9 method6 offset 72 rustc_abi pointer
; slot 10 method7 offset 80 rustc_abi pointer
; slot 11 method8 offset 88 rustc_abi pointer
; slot 12 method9 offset 96 rustc_abi pointer
; slot 13 method10 offset 104 rustc_abi pointer
; slot 14 method11 offset 112 rustc_abi pointer
; slot 15 method12 offset 120 rustc_abi pointer
; slot 16 method13 offset 128 rustc_abi pointer
; slot 17 method14 offset 136 rustc_abi pointer
; slot 18 method15 offset 144 rustc_abi pointer
; slot 19 method16 offset 152 rustc_abi pointer
; slot 20 method17 offset 160 rustc_abi pointer
; slot 21 method18 offset 168 rustc_abi pointer
; slot 22 method19 offset 176 rustc_abi pointer
; slot 23 method20 offset 184 rustc_abi pointer
; slot 24 method21 offset 192 rustc_abi pointer
; slot 25 method22 offset 200 rustc_abi pointer
; slot 26 method23 offset 208 rustc_abi pointer
; slot 27 method24 offset 216 rustc_abi pointer
; slot 28 method25 offset 224 rustc_abi pointer
; slot 29 method26 offset 232 rustc_abi pointer
; slot 30 method27 offset 240 rustc_abi pointer
; slot 31 method28 offset 248 rustc_abi pointer
; slot 32 method29 offset 256 rustc_abi pointer
; slot 33 method30 offset 264 rustc_abi pointer
; slot 34 method31 offset 272 rustc_abi pointer
; slot 35 method32 offset 280 rustc_abi pointer
; slot 36 method33 offset 288 rustc_abi pointer
; slot 37 method34 offset 296 rustc_abi pointer
; slot 38 method35 offset 304 rustc_abi pointer
; slot 39 method36 offset 312 rustc_abi pointer
; slot 40 method37 offset 320 rustc_abi pointer
; slot 41 method38 offset 328 rustc_abi pointer
; slot 42 method39 offset 336 rustc_abi pointer
; slot 43 method40 offset 344 rustc_abi pointer
; slot 44 method41 offset 352 rustc_abi pointer
; slot 45 method42 offset 360 rustc_abi pointer
; slot 46 method43 offset 368 rustc_abi pointer
; slot 47 method44 offset 376 rustc_abi pointer
; slot 48 method45 offset 384 rustc_abi pointer
; slot 49 method46 offset 392 rustc_abi pointer
; slot 50 method47 offset 400 rustc_abi pointer
; slot 51 method48 offset 408 rustc_abi pointer
; slot 52 method49 offset 416 rustc_abi pointer
; slot 53 method50 offset 424 rustc_abi pointer
; slot 54 method51 offset 432 rustc_abi pointer
; slot 55 method52 offset 440 rustc_abi pointer
; slot 56 method53 offset 448 rustc_abi pointer
; slot 57 method54 offset 456 rustc_abi pointer
; slot 58 method55 offset 464 rustc_abi pointer
; slot 59 method56 offset 472 rustc_abi pointer
; slot 60 method57 offset 480 rustc_abi pointer
; slot 61 method58 offset 488 rustc_abi pointer
; slot 62 method59 offset 496 rustc_abi pointer
; slot 63 method60 offset 504 rustc_abi pointer
; slot 64 method61 offset 512 rustc_abi pointer
; slot 65 method62 offset 520 rustc_abi pointer
; slot 66 method63 offset 528 rustc_abi pointer
; slot 67 method64 offset 536 rustc_abi pointer
; slot 68 method65 offset 544 rustc_abi pointer
; slot 69 method66 offset 552 rustc_abi pointer
; slot 70 method67 offset 560 rustc_abi pointer
; slot 71 method68 offset 568 rustc_abi pointer
; slot 72 method69 offset 576 rustc_abi pointer
; slot 73 method70 offset 584 rustc_abi pointer
; slot 74 method71 offset 592 rustc_abi pointer
; slot 75 method72 offset 600 rustc_abi pointer
; slot 76 method73 offset 608 rustc_abi pointer
; slot 77 method74 offset 616 rustc_abi pointer
; slot 78 method75 offset 624 rustc_abi pointer
; slot 79 method76 offset 632 rustc_abi pointer
; slot 80 method77 offset 640 rustc_abi pointer
; slot 81 method78 offset 648 rustc_abi pointer
; slot 82 method79 offset 656 rustc_abi pointer
; slot 83 method80 offset 664 rustc_abi pointer
; slot 84 method81 offset 672 rustc_abi pointer
; slot 85 method82 offset 680 rustc_abi pointer
; slot 86 method83 offset 688 rustc_abi pointer
; slot 87 method84 offset 696 rustc_abi pointer
; slot 88 method85 offset 704 rustc_abi pointer
; slot 89 method86 offset 712 rustc_abi pointer
; slot 90 method87 offset 720 rustc_abi pointer
; slot 91 method88 offset 728 rustc_abi pointer
; slot 92 method89 offset 736 rustc_abi pointer
; slot 93 method90 offset 744 rustc_abi pointer
; slot 94 method91 offset 752 rustc_abi pointer
; slot 95 method92 offset 760 rustc_abi pointer
; slot 96 method93 offset 768 rustc_abi pointer
; slot 97 method94 offset 776 rustc_abi pointer
; slot 98 method95 offset 784 rustc_abi pointer
; slot 99 method96 offset 792 rustc_abi pointer
; slot 100 method97 offset 800 rustc_abi pointer
; slot 101 method98 offset 808 rustc_abi pointer
; slot 102 method99 offset 816 rustc_abi pointer
; slot 103 method100 offset 824 rustc_abi pointer
; slot 104 method101 offset 832 rustc_abi pointer
; slot 105 method102 offset 840 rustc_abi pointer
; slot 106 method103 offset 848 rustc_abi pointer
; slot 107 method104 offset 856 rustc_abi pointer
; slot 108 method105 offset 864 rustc_abi pointer
; slot 109 method106 offset 872 rustc_abi pointer
; slot 110 method107 offset 880 rustc_abi pointer
; slot 111 method108 offset 888 rustc_abi pointer
; slot 112 method109 offset 896 rustc_abi pointer
; slot 113 method110 offset 904 rustc_abi pointer
; slot 114 method111 offset 912 rustc_abi pointer
; slot 115 method112 offset 920 rustc_abi pointer
; slot 116 method113 offset 928 rustc_abi pointer
; slot 117 method114 offset 936 rustc_abi pointer
; slot 118 method115 offset 944 rustc_abi pointer
; slot 119 method116 offset 952 rustc_abi pointer
; slot 120 method117 offset 960 rustc_abi pointer
; slot 121 method118 offset 968 rustc_abi pointer
; slot 122 method119 offset 976 rustc_abi pointer
; slot 123 method120 offset 984 rustc_abi pointer
; slot 124 method121 offset 992 rustc_abi pointer
; slot 125 method122 offset 1000 rustc_abi pointer
; slot 126 method123 offset 1008 rustc_abi pointer
; slot 127 method124 offset 1016 rustc_abi pointer
; slot 128 method125 offset 1024 rustc_abi pointer
; slot 129 method126 offset 1032 rustc_abi pointer
; slot 130 method127 offset 1040 rustc_abi pointer
; slot 131 Vacant offset 1048 rustc_abi pointer
; slot 132 TraitVPtr offset 1056 rustc_abi pointer
; Occupancy stays 49. Not occupancy member 50. FullHost false. FullBackend false.

target triple = "x86_64-unknown-linux-gnu"

; Fat pointer: { data, vtable }
%TraitObjectRecord = type { ptr, ptr }

; Vtable fixture: drop_in_place, size, align, method0, method1, method2, method3, method4, method5, method6, method7, method8, method9, method10, method11, method12, method13, method14, method15, method16, method17, method18, method19, method20, method21, method22, method23, method24, method25, method26, method27, method28, method29, method30, method31, method32, method33, method34, method35, method36, method37, method38, method39, method40, method41, method42, method43, method44, method45, method46, method47, method48, method49, method50, method51, method52, method53, method54, method55, method56, method57, method58, method59, method60, method61, method62, method63, method64, method65, method66, method67, method68, method69, method70, method71, method72, method73, method74, method75, method76, method77, method78, method79, method80, method81, method82, method83, method84, method85, method86, method87, method88, method89, method90, method91, method92, method93, method94, method95, method96, method97, method98, method99, method100, method101, method102, method103, method104, method105, method106, method107, method108, method109, method110, method111, method112, method113, method114, method115, method116, method117, method118, method119, method120, method121, method122, method123, method124, method125, method126, method127, Vacant, TraitVPtr
%TraitObjectVtableFixture = type { ptr, i64, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }

; Supertrait vtable (header-only; TraitVPtr target)
%TraitObjectSupertraitVtable = type { ptr, i64, i64 }

; Payload for size/align slots (data object, not the fat pointer)
%TraitObjectFixturePayload = type { i64 }

define void @slake_trait_object_drop_in_place(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method0(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method1(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method2(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method3(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method4(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method5(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method6(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method7(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method8(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method9(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method10(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method11(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method12(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method13(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method14(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method15(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method16(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method17(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method18(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method19(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method20(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method21(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method22(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method23(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method24(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method25(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method26(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method27(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method28(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method29(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method30(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method31(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method32(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method33(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method34(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method35(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method36(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method37(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method38(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method39(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method40(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method41(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method42(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method43(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method44(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method45(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method46(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method47(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method48(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method49(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method50(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method51(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method52(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method53(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method54(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method55(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method56(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method57(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method58(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method59(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method60(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method61(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method62(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method63(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method64(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method65(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method66(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method67(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method68(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method69(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method70(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method71(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method72(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method73(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method74(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method75(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method76(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method77(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method78(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method79(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method80(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method81(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method82(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method83(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method84(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method85(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method86(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method87(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method88(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method89(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method90(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method91(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method92(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method93(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method94(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method95(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method96(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method97(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method98(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method99(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method100(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method101(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method102(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method103(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method104(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method105(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method106(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method107(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method108(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method109(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method110(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method111(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method112(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method113(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method114(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method115(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method116(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method117(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method118(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method119(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method120(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method121(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method122(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method123(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method124(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method125(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method126(ptr %data) {
entry:
  ret void
}

define void @slake_trait_object_method127(ptr %data) {
entry:
  ret void
}

@slake_trait_object_supertrait_vtable = constant %TraitObjectSupertraitVtable {
  ptr @slake_trait_object_drop_in_place, ; slot 0 drop_in_place offset 0
  i64 8, ; slot 1 size offset 8 rustc_abi usize
  i64 8 ; slot 2 align offset 16 rustc_abi usize
}, align 8

@slake_trait_object_vtable_fixture = constant %TraitObjectVtableFixture {
  ptr @slake_trait_object_drop_in_place, ; slot 0 drop_in_place offset 0
  i64 8, ; slot 1 size offset 8 rustc_abi usize
  i64 8, ; slot 2 align offset 16 rustc_abi usize
  ptr @slake_trait_object_method0, ; slot 3 method0 offset 24 rustc_abi pointer
  ptr @slake_trait_object_method1, ; slot 4 method1 offset 32 rustc_abi pointer
  ptr @slake_trait_object_method2, ; slot 5 method2 offset 40 rustc_abi pointer
  ptr @slake_trait_object_method3, ; slot 6 method3 offset 48 rustc_abi pointer
  ptr @slake_trait_object_method4, ; slot 7 method4 offset 56 rustc_abi pointer
  ptr @slake_trait_object_method5, ; slot 8 method5 offset 64 rustc_abi pointer
  ptr @slake_trait_object_method6, ; slot 9 method6 offset 72 rustc_abi pointer
  ptr @slake_trait_object_method7, ; slot 10 method7 offset 80 rustc_abi pointer
  ptr @slake_trait_object_method8, ; slot 11 method8 offset 88 rustc_abi pointer
  ptr @slake_trait_object_method9, ; slot 12 method9 offset 96 rustc_abi pointer
  ptr @slake_trait_object_method10, ; slot 13 method10 offset 104 rustc_abi pointer
  ptr @slake_trait_object_method11, ; slot 14 method11 offset 112 rustc_abi pointer
  ptr @slake_trait_object_method12, ; slot 15 method12 offset 120 rustc_abi pointer
  ptr @slake_trait_object_method13, ; slot 16 method13 offset 128 rustc_abi pointer
  ptr @slake_trait_object_method14, ; slot 17 method14 offset 136 rustc_abi pointer
  ptr @slake_trait_object_method15, ; slot 18 method15 offset 144 rustc_abi pointer
  ptr @slake_trait_object_method16, ; slot 19 method16 offset 152 rustc_abi pointer
  ptr @slake_trait_object_method17, ; slot 20 method17 offset 160 rustc_abi pointer
  ptr @slake_trait_object_method18, ; slot 21 method18 offset 168 rustc_abi pointer
  ptr @slake_trait_object_method19, ; slot 22 method19 offset 176 rustc_abi pointer
  ptr @slake_trait_object_method20, ; slot 23 method20 offset 184 rustc_abi pointer
  ptr @slake_trait_object_method21, ; slot 24 method21 offset 192 rustc_abi pointer
  ptr @slake_trait_object_method22, ; slot 25 method22 offset 200 rustc_abi pointer
  ptr @slake_trait_object_method23, ; slot 26 method23 offset 208 rustc_abi pointer
  ptr @slake_trait_object_method24, ; slot 27 method24 offset 216 rustc_abi pointer
  ptr @slake_trait_object_method25, ; slot 28 method25 offset 224 rustc_abi pointer
  ptr @slake_trait_object_method26, ; slot 29 method26 offset 232 rustc_abi pointer
  ptr @slake_trait_object_method27, ; slot 30 method27 offset 240 rustc_abi pointer
  ptr @slake_trait_object_method28, ; slot 31 method28 offset 248 rustc_abi pointer
  ptr @slake_trait_object_method29, ; slot 32 method29 offset 256 rustc_abi pointer
  ptr @slake_trait_object_method30, ; slot 33 method30 offset 264 rustc_abi pointer
  ptr @slake_trait_object_method31, ; slot 34 method31 offset 272 rustc_abi pointer
  ptr @slake_trait_object_method32, ; slot 35 method32 offset 280 rustc_abi pointer
  ptr @slake_trait_object_method33, ; slot 36 method33 offset 288 rustc_abi pointer
  ptr @slake_trait_object_method34, ; slot 37 method34 offset 296 rustc_abi pointer
  ptr @slake_trait_object_method35, ; slot 38 method35 offset 304 rustc_abi pointer
  ptr @slake_trait_object_method36, ; slot 39 method36 offset 312 rustc_abi pointer
  ptr @slake_trait_object_method37, ; slot 40 method37 offset 320 rustc_abi pointer
  ptr @slake_trait_object_method38, ; slot 41 method38 offset 328 rustc_abi pointer
  ptr @slake_trait_object_method39, ; slot 42 method39 offset 336 rustc_abi pointer
  ptr @slake_trait_object_method40, ; slot 43 method40 offset 344 rustc_abi pointer
  ptr @slake_trait_object_method41, ; slot 44 method41 offset 352 rustc_abi pointer
  ptr @slake_trait_object_method42, ; slot 45 method42 offset 360 rustc_abi pointer
  ptr @slake_trait_object_method43, ; slot 46 method43 offset 368 rustc_abi pointer
  ptr @slake_trait_object_method44, ; slot 47 method44 offset 376 rustc_abi pointer
  ptr @slake_trait_object_method45, ; slot 48 method45 offset 384 rustc_abi pointer
  ptr @slake_trait_object_method46, ; slot 49 method46 offset 392 rustc_abi pointer
  ptr @slake_trait_object_method47, ; slot 50 method47 offset 400 rustc_abi pointer
  ptr @slake_trait_object_method48, ; slot 51 method48 offset 408 rustc_abi pointer
  ptr @slake_trait_object_method49, ; slot 52 method49 offset 416 rustc_abi pointer
  ptr @slake_trait_object_method50, ; slot 53 method50 offset 424 rustc_abi pointer
  ptr @slake_trait_object_method51, ; slot 54 method51 offset 432 rustc_abi pointer
  ptr @slake_trait_object_method52, ; slot 55 method52 offset 440 rustc_abi pointer
  ptr @slake_trait_object_method53, ; slot 56 method53 offset 448 rustc_abi pointer
  ptr @slake_trait_object_method54, ; slot 57 method54 offset 456 rustc_abi pointer
  ptr @slake_trait_object_method55, ; slot 58 method55 offset 464 rustc_abi pointer
  ptr @slake_trait_object_method56, ; slot 59 method56 offset 472 rustc_abi pointer
  ptr @slake_trait_object_method57, ; slot 60 method57 offset 480 rustc_abi pointer
  ptr @slake_trait_object_method58, ; slot 61 method58 offset 488 rustc_abi pointer
  ptr @slake_trait_object_method59, ; slot 62 method59 offset 496 rustc_abi pointer
  ptr @slake_trait_object_method60, ; slot 63 method60 offset 504 rustc_abi pointer
  ptr @slake_trait_object_method61, ; slot 64 method61 offset 512 rustc_abi pointer
  ptr @slake_trait_object_method62, ; slot 65 method62 offset 520 rustc_abi pointer
  ptr @slake_trait_object_method63, ; slot 66 method63 offset 528 rustc_abi pointer
  ptr @slake_trait_object_method64, ; slot 67 method64 offset 536 rustc_abi pointer
  ptr @slake_trait_object_method65, ; slot 68 method65 offset 544 rustc_abi pointer
  ptr @slake_trait_object_method66, ; slot 69 method66 offset 552 rustc_abi pointer
  ptr @slake_trait_object_method67, ; slot 70 method67 offset 560 rustc_abi pointer
  ptr @slake_trait_object_method68, ; slot 71 method68 offset 568 rustc_abi pointer
  ptr @slake_trait_object_method69, ; slot 72 method69 offset 576 rustc_abi pointer
  ptr @slake_trait_object_method70, ; slot 73 method70 offset 584 rustc_abi pointer
  ptr @slake_trait_object_method71, ; slot 74 method71 offset 592 rustc_abi pointer
  ptr @slake_trait_object_method72, ; slot 75 method72 offset 600 rustc_abi pointer
  ptr @slake_trait_object_method73, ; slot 76 method73 offset 608 rustc_abi pointer
  ptr @slake_trait_object_method74, ; slot 77 method74 offset 616 rustc_abi pointer
  ptr @slake_trait_object_method75, ; slot 78 method75 offset 624 rustc_abi pointer
  ptr @slake_trait_object_method76, ; slot 79 method76 offset 632 rustc_abi pointer
  ptr @slake_trait_object_method77, ; slot 80 method77 offset 640 rustc_abi pointer
  ptr @slake_trait_object_method78, ; slot 81 method78 offset 648 rustc_abi pointer
  ptr @slake_trait_object_method79, ; slot 82 method79 offset 656 rustc_abi pointer
  ptr @slake_trait_object_method80, ; slot 83 method80 offset 664 rustc_abi pointer
  ptr @slake_trait_object_method81, ; slot 84 method81 offset 672 rustc_abi pointer
  ptr @slake_trait_object_method82, ; slot 85 method82 offset 680 rustc_abi pointer
  ptr @slake_trait_object_method83, ; slot 86 method83 offset 688 rustc_abi pointer
  ptr @slake_trait_object_method84, ; slot 87 method84 offset 696 rustc_abi pointer
  ptr @slake_trait_object_method85, ; slot 88 method85 offset 704 rustc_abi pointer
  ptr @slake_trait_object_method86, ; slot 89 method86 offset 712 rustc_abi pointer
  ptr @slake_trait_object_method87, ; slot 90 method87 offset 720 rustc_abi pointer
  ptr @slake_trait_object_method88, ; slot 91 method88 offset 728 rustc_abi pointer
  ptr @slake_trait_object_method89, ; slot 92 method89 offset 736 rustc_abi pointer
  ptr @slake_trait_object_method90, ; slot 93 method90 offset 744 rustc_abi pointer
  ptr @slake_trait_object_method91, ; slot 94 method91 offset 752 rustc_abi pointer
  ptr @slake_trait_object_method92, ; slot 95 method92 offset 760 rustc_abi pointer
  ptr @slake_trait_object_method93, ; slot 96 method93 offset 768 rustc_abi pointer
  ptr @slake_trait_object_method94, ; slot 97 method94 offset 776 rustc_abi pointer
  ptr @slake_trait_object_method95, ; slot 98 method95 offset 784 rustc_abi pointer
  ptr @slake_trait_object_method96, ; slot 99 method96 offset 792 rustc_abi pointer
  ptr @slake_trait_object_method97, ; slot 100 method97 offset 800 rustc_abi pointer
  ptr @slake_trait_object_method98, ; slot 101 method98 offset 808 rustc_abi pointer
  ptr @slake_trait_object_method99, ; slot 102 method99 offset 816 rustc_abi pointer
  ptr @slake_trait_object_method100, ; slot 103 method100 offset 824 rustc_abi pointer
  ptr @slake_trait_object_method101, ; slot 104 method101 offset 832 rustc_abi pointer
  ptr @slake_trait_object_method102, ; slot 105 method102 offset 840 rustc_abi pointer
  ptr @slake_trait_object_method103, ; slot 106 method103 offset 848 rustc_abi pointer
  ptr @slake_trait_object_method104, ; slot 107 method104 offset 856 rustc_abi pointer
  ptr @slake_trait_object_method105, ; slot 108 method105 offset 864 rustc_abi pointer
  ptr @slake_trait_object_method106, ; slot 109 method106 offset 872 rustc_abi pointer
  ptr @slake_trait_object_method107, ; slot 110 method107 offset 880 rustc_abi pointer
  ptr @slake_trait_object_method108, ; slot 111 method108 offset 888 rustc_abi pointer
  ptr @slake_trait_object_method109, ; slot 112 method109 offset 896 rustc_abi pointer
  ptr @slake_trait_object_method110, ; slot 113 method110 offset 904 rustc_abi pointer
  ptr @slake_trait_object_method111, ; slot 114 method111 offset 912 rustc_abi pointer
  ptr @slake_trait_object_method112, ; slot 115 method112 offset 920 rustc_abi pointer
  ptr @slake_trait_object_method113, ; slot 116 method113 offset 928 rustc_abi pointer
  ptr @slake_trait_object_method114, ; slot 117 method114 offset 936 rustc_abi pointer
  ptr @slake_trait_object_method115, ; slot 118 method115 offset 944 rustc_abi pointer
  ptr @slake_trait_object_method116, ; slot 119 method116 offset 952 rustc_abi pointer
  ptr @slake_trait_object_method117, ; slot 120 method117 offset 960 rustc_abi pointer
  ptr @slake_trait_object_method118, ; slot 121 method118 offset 968 rustc_abi pointer
  ptr @slake_trait_object_method119, ; slot 122 method119 offset 976 rustc_abi pointer
  ptr @slake_trait_object_method120, ; slot 123 method120 offset 984 rustc_abi pointer
  ptr @slake_trait_object_method121, ; slot 124 method121 offset 992 rustc_abi pointer
  ptr @slake_trait_object_method122, ; slot 125 method122 offset 1000 rustc_abi pointer
  ptr @slake_trait_object_method123, ; slot 126 method123 offset 1008 rustc_abi pointer
  ptr @slake_trait_object_method124, ; slot 127 method124 offset 1016 rustc_abi pointer
  ptr @slake_trait_object_method125, ; slot 128 method125 offset 1024 rustc_abi pointer
  ptr @slake_trait_object_method126, ; slot 129 method126 offset 1032 rustc_abi pointer
  ptr @slake_trait_object_method127, ; slot 130 method127 offset 1040 rustc_abi pointer
  ptr null, ; slot 131 Vacant offset 1048 rustc_abi pointer VtblEntry::Vacant
  ptr @slake_trait_object_supertrait_vtable ; slot 132 TraitVPtr offset 1056 rustc_abi pointer
}, align 8

@slake_trait_object_record_null = constant %TraitObjectRecord {
  ptr null,
  ptr @slake_trait_object_vtable_fixture
}, align 8
