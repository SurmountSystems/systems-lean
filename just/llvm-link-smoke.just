# Modular just: just/llvm-link-smoke.just -- richer-than-i32 layout + IR link smoke.
# Split from just/llvm.just so that module stays under 1000 lines.
# Consumer lives under TMPDIR and is deleted. No product Rust under src/.
# Greppable: richer-record-layout, HOST-IR-NODE-LAYOUT, SLAKE_IR_NODE_LAYOUT_V0,
# RICHER-THAN-I32-LAYOUT, IrNodeRecord, llvm-link-smoke, HOST-LLVM-LINK-SMOKE,
# SLAKE_LLVM_LINK_SMOKE_V0, LLVM-LINK-SMOKE.

# Richer-than-i32 named record dual-pin: IrNodeRecord / slake_ir_node versus
# rustc_abi repr(C) size 16 align 4 pad 3 on x86_64-unknown-linux-gnu.
# Host Lean IrNodeLayout + optional out-of-tree rustc size/align/offset dogfood.
# C product wire unchanged. Not full backend. Not product Rust under src/.
richer-record-layout:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_IR_NODE_LAYOUT_V0 / HOST-IR-NODE-LAYOUT"
    echo "RICHER-THAN-I32-LAYOUT / IrNodeRecord"
    echo "non-claims: not full backend; not product Rust under src/; not formalized all of rustc; C wire unchanged"
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.IrNodeLayout)
    else
      echo "richer-record-layout: lake missing; host Lean dual-pin not elaborated this run" >&2
    fi
    if command -v rustc >/dev/null 2>&1; then
      TMP=$(mktemp -d /tmp/slake-ir-node-layout.XXXXXX)
      {
        echo '// Out-of-tree IrNodeRecord rustc_abi dogfood. Not product crate.'
        echo '#[repr(C)]'
        echo 'struct IrNodeRecord {'
        echo '    ty: u32,'
        echo '    mult: i32,'
        echo '    kind: i32,'
        echo '    valid: u8,'
        echo '}'
        echo 'fn main() {'
        echo '    assert_eq!(std::mem::size_of::<IrNodeRecord>(), 16);'
        echo '    assert_eq!(std::mem::align_of::<IrNodeRecord>(), 4);'
        echo '    assert_eq!(std::mem::offset_of!(IrNodeRecord, ty), 0);'
        echo '    assert_eq!(std::mem::offset_of!(IrNodeRecord, mult), 4);'
        echo '    assert_eq!(std::mem::offset_of!(IrNodeRecord, kind), 8);'
        echo '    assert_eq!(std::mem::offset_of!(IrNodeRecord, valid), 12);'
        echo '    println!("RICHER-THAN-I32-LAYOUT IrNodeRecord size=16 align=4 pad=3");'
        echo '    println!("target=x86_64-unknown-linux-gnu rustc_abi repr(C)");'
        echo '}'
      } > "$TMP/consumer.rs"
      rustc --edition 2021 --target x86_64-unknown-linux-gnu -O -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      rm -rf "$TMP"
      echo "richer-record-layout: out-of-tree rustc size/align/offset GREEN"
    else
      echo "richer-record-layout: rustc missing; out-of-tree dogfood SKIP (host Lean dual-pin still required when lake is present)"
    fi
    if ! command -v lake >/dev/null 2>&1 && ! command -v rustc >/dev/null 2>&1; then
      echo "richer-record-layout: SKIP (lake and rustc missing)"
      exit 0
    fi
    echo "richer-record-layout: GREEN (IrNodeRecord size 16 align 4; not full backend)"

# IR consumer link smoke: out-of-tree clang (preferred) or rustc+llc links a
# generator SSA .ll (Compose SSA, else Mult SSA) to a tiny TMPDIR consumer.
# IR-to-IR wrap is the happy path (not classic FFI as the story). Soft-skip
# if clang and rustc+llc are missing. Not FullBackend. Not a src/ Rust crate.
llvm-link-smoke:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_LLVM_LINK_SMOKE_V0 / HOST-LLVM-LINK-SMOKE"
    echo "LLVM-LINK-SMOKE"
    echo "non-claims: not classic FFI happy path; not full backend; not product Rust under src/; not llc production"
    root="$(pwd)"
    compose="$root/out/llvm-ir/slake_compose_ssa.ll"
    mult="$root/out/llvm-ir/slake_mult_ssa.ll"
    if [[ -f "$compose" ]]; then
      ir="$compose"
      band="compose"
    elif [[ -f "$mult" ]]; then
      ir="$mult"
      band="mult"
    else
      echo "llvm-link-smoke RED: no generator SSA .ll (expected slake_compose_ssa.ll or slake_mult_ssa.ll)" >&2
      exit 1
    fi
    have_clang=0
    have_rustc=0
    have_llc=0
    if command -v clang >/dev/null 2>&1; then have_clang=1; fi
    if command -v rustc >/dev/null 2>&1; then have_rustc=1; fi
    if command -v llc >/dev/null 2>&1; then have_llc=1; fi
    if [[ "$have_clang" -eq 0 && ( "$have_rustc" -eq 0 || "$have_llc" -eq 0 ) ]]; then
      echo "llvm-link-smoke: SKIP (need clang, or rustc+llc; band=$band ir=$ir)"
      exit 0
    fi
    TMP=$(mktemp -d /tmp/slake-llvm-link-smoke.XXXXXX)
    cleanup() { rm -rf "$TMP"; }
    trap cleanup EXIT
    pct=$'\x25'
    ob=$'\x7b'
    cb=$'\x7d'
    if [[ "$band" == "compose" ]]; then
      {
        echo "declare i32 @slake_compose_ssa_mint_status(i32)"
        echo "define i32 @main() ${ob}"
        echo "entry:"
        echo "  ${pct}code = call i32 @slake_compose_ssa_mint_status(i32 0)"
        echo "  ${pct}ok = icmp eq i32 ${pct}code, 0"
        echo "  br i1 ${pct}ok, label ${pct}okret, label ${pct}fail"
        echo "okret:"
        echo "  ret i32 0"
        echo "fail:"
        echo "  ret i32 1"
        echo "${cb}"
      } >"$TMP/wrap.ll"
      rust_fn="slake_compose_ssa_mint_status"
    else
      {
        echo "declare i32 @slake_mult_ssa_grade_tag(i32)"
        echo "define i32 @main() ${ob}"
        echo "entry:"
        echo "  ${pct}code = call i32 @slake_mult_ssa_grade_tag(i32 1)"
        echo "  ${pct}ok = icmp eq i32 ${pct}code, 1"
        echo "  br i1 ${pct}ok, label ${pct}okret, label ${pct}fail"
        echo "okret:"
        echo "  ret i32 0"
        echo "fail:"
        echo "  ret i32 1"
        echo "${cb}"
      } >"$TMP/wrap.ll"
      rust_fn="slake_mult_ssa_grade_tag"
    fi
    if [[ "$have_clang" -eq 1 ]]; then
      clang -O0 -Wno-override-module -o "$TMP/consumer" "$TMP/wrap.ll" "$ir"
      "$TMP/consumer"
      echo "llvm-link-smoke: clang IR wrap + $band SSA GREEN"
    else
      llc -filetype=obj -relocation-model=pic -o "$TMP/unit.o" "$ir"
      {
        echo '// Out-of-tree IR link smoke. Not product crate. Not classic FFI story.'
        echo "unsafe extern \"C\" { fn ${rust_fn}(x: i32) -> i32; }"
        echo 'fn main() {'
        if [[ "$band" == "compose" ]]; then
          echo "    let code = unsafe { ${rust_fn}(0) };"
          echo '    assert_eq!(code, 0);'
        else
          echo "    let code = unsafe { ${rust_fn}(1) };"
          echo '    assert_eq!(code, 1);'
        fi
        echo '    println!("LLVM-LINK-SMOKE rustc+llc GREEN");'
        echo '}'
      } >"$TMP/consumer.rs"
      rustc --edition 2021 -C link-arg="$TMP/unit.o" -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      echo "llvm-link-smoke: rustc+llc + $band SSA GREEN"
    fi
    echo "llvm-link-smoke: GREEN (linked generator $band SSA; not full backend / not classic FFI happy path)"

# Trait-object vtable checkable writer: lean --run regenerates
# out/llvm-ir/trait-object-vtable.ll from SystemsLean.TraitObjectVtable and
# fails if dest bytes differ from the printer. No lake. No mill inventory
# row. No lakefile lean_exe. Occupancy stays 49. FullBackend false.
# Production emit claimed stays false (checkable fixture writer, not FullBackend).
# Second pin: slot 3 Method plus rustc_abi pointer (fail-closed DualPinOk
# and validateTraitObjectVtableIrPackage token). Third pin: TraitVPtr plus
# rustc_abi pointer to a header-only supertrait vtable. Fourth pin: Vacant
# plus rustc_abi pointer (VtblEntry::Vacant). Fifth pin: slot 4 second Method
# plus rustc_abi pointer (method1 offset 32). Sixth pin: slot 5 third Method
# plus rustc_abi pointer (method2 offset 40). Seventh pin: slot 6 fourth
# Method plus rustc_abi pointer (method3 offset 48). Eighth pin: slot 7 fifth
# Method plus rustc_abi pointer (method4 offset 56). Ninth pin: slot 8 sixth
# Method plus rustc_abi pointer (method5 offset 64). Tenth pin: slot 9 seventh
# Method plus rustc_abi pointer (method6 offset 72). Eleventh pin: slot 10
# eighth Method plus rustc_abi pointer (method7 offset 80). Twelfth pin: slot 11
# ninth Method plus rustc_abi pointer (method8 offset 88). Thirteenth pin: slot 12
# tenth Method plus rustc_abi pointer (method9 offset 96). Fourteenth pin: slot 13
# eleventh Method plus rustc_abi pointer (method10 offset 104). Fifteenth pin: slot 14
# twelfth Method plus rustc_abi pointer (method11 offset 112). Sixteenth pin: slot 15
# thirteenth Method plus rustc_abi pointer (method12 offset 120). Seventeenth pin:
# slot 16 fourteenth Method plus rustc_abi pointer (method13 offset 128).
# Eighteenth pin: slot 17 fifteenth Method plus rustc_abi pointer (method14
# offset 136). Nineteenth pin: slot 18 sixteenth Method plus rustc_abi
# pointer (method15 offset 144). Twentieth pin: slot 19 seventeenth Method
# plus rustc_abi pointer (method16 offset 152). Twenty-first pin: slot 20
# eighteenth Method plus rustc_abi pointer (method17 offset 160).
# Twenty-second pin: slot 21 nineteenth Method plus rustc_abi pointer
# (method18 offset 168). Twenty-third pin: slot 22 twentieth Method plus
# rustc_abi pointer (method19 offset 176). Twenty-fourth pin: slot 23
# twenty-first Method plus rustc_abi pointer (method20 offset 184).
# Twenty-fifth pin: slot 24 twenty-second Method plus rustc_abi pointer
# (method21 offset 192). Twenty-sixth pin: slot 25 twenty-third Method plus
# rustc_abi pointer (method22 offset 200). Twenty-seventh pin: slot 26
# twenty-fourth Method plus rustc_abi pointer (method23 offset 208).
# Twenty-eighth pin: slot 27 twenty-fifth Method plus rustc_abi pointer
# (method24 offset 216). Twenty-ninth pin: slot 28 twenty-sixth Method plus
# rustc_abi pointer (method25 offset 224). Thirtieth pin: slot 29
# twenty-seventh Method plus rustc_abi pointer (method26 offset 232).
# Thirty-first pin: slot 30 twenty-eighth Method plus rustc_abi pointer
# (method27 offset 240; Vacant moves to slot 31 offset 248; TraitVPtr
# moves to slot 32 offset 256; 33 slots / 264 bytes).
# Thirty-second pin: slot 31 twenty-ninth Method plus rustc_abi pointer
# (method28 offset 248; Vacant moves to slot 32 offset 256; TraitVPtr
# moves to slot 33 offset 264; 34 slots / 272 bytes).
# Thirty-third pin: slot 32 thirtieth Method plus rustc_abi pointer
# (method29 offset 256; Vacant moves to slot 33 offset 264; TraitVPtr
# moves to slot 34 offset 272; 35 slots / 280 bytes).
# Thirty-fourth pin: slot 33 thirty-first Method plus rustc_abi pointer
# (method30 offset 264; Vacant moves to slot 34 offset 272; TraitVPtr
# moves to slot 35 offset 280; 36 slots / 288 bytes).
# Thirty-fifth pin: slot 34 thirty-second Method plus rustc_abi pointer
# (method31 offset 272; Vacant moves to slot 35 offset 280; TraitVPtr
# moves to slot 36 offset 288; 37 slots / 296 bytes).
# Thirty-sixth pin: slot 35 thirty-third Method plus rustc_abi pointer
# (method32 offset 280; Vacant moves to slot 36 offset 288; TraitVPtr
# moves to slot 37 offset 296; 38 slots / 304 bytes).
# Thirty-seventh pin: slot 36 thirty-fourth Method plus rustc_abi pointer
# (method33 offset 288; Vacant moves to slot 37 offset 296; TraitVPtr
# moves to slot 38 offset 304; 39 slots / 312 bytes).
# Thirty-eighth pin: slot 37 thirty-fifth Method plus rustc_abi pointer
# (method34 offset 296; Vacant moves to slot 38 offset 304; TraitVPtr
# moves to slot 39 offset 312; 40 slots / 320 bytes).
# Thirty-ninth pin: slot 38 thirty-sixth Method plus rustc_abi pointer
# (method35 offset 304; Vacant moves to slot 39 offset 312; TraitVPtr
# moves to slot 40 offset 320; 41 slots / 328 bytes).
# Fortieth pin: slot 39 thirty-seventh Method plus rustc_abi pointer
# (method36 offset 312; Vacant moves to slot 40 offset 320; TraitVPtr
# moves to slot 41 offset 328; 42 slots / 336 bytes).
# Forty-first pin: slot 40 thirty-eighth Method plus rustc_abi pointer
# (method37 offset 320; Vacant moves to slot 41 offset 328; TraitVPtr
# moves to slot 42 offset 336; 43 slots / 344 bytes).
# Forty-second pin: slot 41 thirty-ninth Method plus rustc_abi pointer
# (method38 offset 328; Vacant moves to slot 42 offset 336; TraitVPtr
# moves to slot 43 offset 344; 44 slots / 352 bytes).
# Forty-third pin: slot 42 fortieth Method plus rustc_abi pointer
# (method39 offset 336; Vacant moves to slot 43 offset 344; TraitVPtr
# moves to slot 44 offset 352; 45 slots / 360 bytes).
# Forty-fourth pin: slot 43 forty-first Method plus rustc_abi pointer
# (method40 offset 344; Vacant moves to slot 44 offset 352; TraitVPtr
# moves to slot 45 offset 360; 46 slots / 368 bytes).
# Forty-fifth pin: slot 44 forty-second Method plus rustc_abi pointer
# (method41 offset 352; Vacant moves to slot 45 offset 360; TraitVPtr
# moves to slot 46 offset 368; 47 slots / 376 bytes).
# Forty-sixth pin: slot 45 forty-third Method plus rustc_abi pointer
# (method42 offset 360; Vacant moves to slot 46 offset 368; TraitVPtr
# moves to slot 47 offset 376; 48 slots / 384 bytes).
# Forty-seventh pin: slot 46 forty-fourth Method plus rustc_abi pointer
# (method43 offset 368; Vacant moves to slot 47 offset 376; TraitVPtr
# moves to slot 48 offset 384; 49 slots / 392 bytes).
# Forty-eighth pin: slot 47 forty-fifth Method plus rustc_abi pointer
# (method44 offset 376; Vacant moves to slot 48 offset 384; TraitVPtr
# moves to slot 49 offset 392; 50 slots / 400 bytes).
# Forty-ninth pin: slot 48 forty-sixth Method plus rustc_abi pointer
# (method45 offset 384; Vacant moves to slot 49 offset 392; TraitVPtr
# moves to slot 50 offset 400; 51 slots / 408 bytes).
# Fiftieth pin: slot 49 forty-seventh Method plus rustc_abi pointer
# (method46 offset 392; Vacant moves to slot 50 offset 400; TraitVPtr
# moves to slot 51 offset 408; 52 slots / 416 bytes).
# Fifty-first pin: slot 50 forty-eighth Method plus rustc_abi pointer
# (method47 offset 400; Vacant moves to slot 51 offset 408; TraitVPtr
# moves to slot 52 offset 416; 53 slots / 424 bytes).
# Fifty-second pin: slot 51 forty-ninth Method plus rustc_abi pointer
# (method48 offset 408; Vacant moves to slot 52 offset 416; TraitVPtr
# moves to slot 53 offset 424; 54 slots / 432 bytes).
# Fifty-third pin: slot 52 fiftieth Method plus rustc_abi pointer
# (method49 offset 416; Vacant moves to slot 53 offset 424; TraitVPtr
# moves to slot 54 offset 432; 55 slots / 440 bytes).
# Fifty-fourth pin: slot 53 fifty-first Method plus rustc_abi pointer
# (method50 offset 424; Vacant moves to slot 54 offset 432; TraitVPtr
# moves to slot 55 offset 440; 56 slots / 448 bytes).
# Fifty-fifth pin: slot 54 fifty-second Method plus rustc_abi pointer
# (method51 offset 432; Vacant moves to slot 55 offset 440; TraitVPtr
# moves to slot 56 offset 448; 57 slots / 456 bytes).
# Fifty-sixth pin: slot 55 fifty-third Method plus rustc_abi pointer
# (method52 offset 440; Vacant moves to slot 56 offset 448; TraitVPtr
# moves to slot 57 offset 456; 58 slots / 464 bytes).
# Fifty-seventh pin: slot 56 fifty-fourth Method plus rustc_abi pointer
# (method53 offset 448; Vacant moves to slot 57 offset 456; TraitVPtr
# moves to slot 58 offset 464; 59 slots / 472 bytes).
# Fifty-eighth pin: slot 57 fifty-fifth Method plus rustc_abi pointer
# (method54 offset 456; Vacant moves to slot 58 offset 464; TraitVPtr
# moves to slot 59 offset 472; 60 slots / 480 bytes).
# Fifty-ninth pin: slot 58 fifty-sixth Method plus rustc_abi pointer
# (method55 offset 464; Vacant moves to slot 59 offset 472; TraitVPtr
# moves to slot 60 offset 480; 61 slots / 488 bytes).
# Sixtieth pin: slot 59 fifty-seventh Method plus rustc_abi pointer
# (method56 offset 472; Vacant moves to slot 60 offset 480; TraitVPtr
# moves to slot 61 offset 488; 62 slots / 496 bytes).
# Sixty-first pin: slot 60 fifty-eighth Method plus rustc_abi pointer
# (method57 offset 480; Vacant moves to slot 61 offset 488; TraitVPtr
# moves to slot 62 offset 496; 63 slots / 504 bytes).
# Sixty-second pin: slot 61 fifty-ninth Method plus rustc_abi pointer
# (method58 offset 488; Vacant moves to slot 62 offset 496; TraitVPtr
# moves to slot 63 offset 504; 64 slots / 512 bytes).
# Sixty-third pin: slot 62 sixtieth Method plus rustc_abi pointer
# (method59 offset 496; Vacant moves to slot 63 offset 504; TraitVPtr
# moves to slot 64 offset 512; 65 slots / 520 bytes).
# Sixty-fourth pin: slot 63 sixty-first Method plus rustc_abi pointer
# (method60 offset 504; Vacant moves to slot 64 offset 512; TraitVPtr
# moves to slot 65 offset 520; 66 slots / 528 bytes).
# Sixty-fifth pin: slot 64 sixty-second Method plus rustc_abi pointer
# (method61 offset 512; Vacant moves to slot 65 offset 520; TraitVPtr
# moves to slot 66 offset 528; 67 slots / 536 bytes).
# Sixty-sixth pin: slot 65 sixty-third Method plus rustc_abi pointer
# (method62 offset 520; Vacant moves to slot 66 offset 528; TraitVPtr
# moves to slot 67 offset 536; 68 slots / 544 bytes).
# Sixty-seventh pin: slot 66 sixty-fourth Method plus rustc_abi pointer
# (method63 offset 528; Vacant moves to slot 67 offset 536; TraitVPtr
# moves to slot 68 offset 544; 69 slots / 552 bytes).
# Sixty-eighth pin: slot 67 sixty-fifth Method plus rustc_abi pointer
# (method64 offset 536; Vacant moves to slot 68 offset 544; TraitVPtr
# moves to slot 69 offset 552; 70 slots / 560 bytes).
# Sixty-ninth pin: slot 68 sixty-sixth Method plus rustc_abi pointer
# (method65 offset 544; Vacant moves to slot 69 offset 552; TraitVPtr
# moves to slot 70 offset 560; 71 slots / 568 bytes).
# Seventieth pin: slot 69 sixty-seventh Method plus rustc_abi pointer
# (method66 offset 552; Vacant moves to slot 70 offset 560; TraitVPtr
# moves to slot 71 offset 568; 72 slots / 576 bytes).
# Seventy-first pin: slot 70 sixty-eighth Method plus rustc_abi pointer
# (method67 offset 560; Vacant moves to slot 71 offset 568; TraitVPtr
# moves to slot 72 offset 576; 73 slots / 584 bytes).
# Seventy-second pin: slot 71 sixty-ninth Method plus rustc_abi pointer
# (method68 offset 568; Vacant moves to slot 72 offset 576; TraitVPtr
# moves to slot 73 offset 584; 74 slots / 592 bytes).
# Seventy-third pin: slot 72 seventieth Method plus rustc_abi pointer
# (method69 offset 576; Vacant moves to slot 73 offset 584; TraitVPtr
# moves to slot 74 offset 592; 75 slots / 600 bytes).
# Seventy-fourth pin: slot 73 seventy-first Method plus rustc_abi pointer
# (method70 offset 584; Vacant moves to slot 74 offset 592; TraitVPtr
# moves to slot 75 offset 600; 76 slots / 608 bytes).
# Seventy-fifth pin: slot 74 seventy-second Method plus rustc_abi pointer
# (method71 offset 592; Vacant moves to slot 75 offset 600; TraitVPtr
# moves to slot 76 offset 608; 77 slots / 616 bytes).
# Seventy-sixth pin: slot 75 seventy-third Method plus rustc_abi pointer
# (method72 offset 600; Vacant moves to slot 76 offset 608; TraitVPtr
# moves to slot 77 offset 616; 78 slots / 624 bytes).
# Seventy-seventh pin: slot 76 seventy-fourth Method plus rustc_abi pointer
# (method73 offset 608; Vacant moves to slot 77 offset 616; TraitVPtr
# moves to slot 78 offset 624; 79 slots / 632 bytes).
# Seventy-eighth pin: slot 77 seventy-fifth Method plus rustc_abi pointer
# (method74 offset 616; Vacant moves to slot 78 offset 624; TraitVPtr
# moves to slot 79 offset 632; 80 slots / 640 bytes).
# Seventy-ninth pin: slot 78 seventy-sixth Method plus rustc_abi pointer
# (method75 offset 624; Vacant moves to slot 79 offset 632; TraitVPtr
# moves to slot 80 offset 640; 81 slots / 648 bytes).
# Eightieth pin: slot 79 seventy-seventh Method plus rustc_abi pointer
# (method76 offset 632; Vacant moves to slot 80 offset 640; TraitVPtr
# moves to slot 81 offset 648; 82 slots / 656 bytes).
# Eighty-first pin: slot 80 seventy-eighth Method plus rustc_abi pointer
# (method77 offset 640; Vacant moves to slot 81 offset 648; TraitVPtr
# moves to slot 82 offset 656; 83 slots / 664 bytes).
# Eighty-second pin: slot 81 seventy-ninth Method plus rustc_abi pointer
# (method78 offset 648; Vacant moves to slot 82 offset 656; TraitVPtr
# moves to slot 83 offset 664; 84 slots / 672 bytes).
# Eighty-third pin: slot 82 eightieth Method plus rustc_abi pointer
# (method79 offset 656; Vacant moves to slot 83 offset 664; TraitVPtr
# moves to slot 84 offset 672; 85 slots / 680 bytes).
# Eighty-fourth pin: slot 83 eighty-first Method plus rustc_abi pointer
# (method80 offset 664; Vacant moves to slot 84 offset 672; TraitVPtr
# moves to slot 85 offset 680; 86 slots / 688 bytes).
# Eighty-fifth pin: slot 84 eighty-second Method plus rustc_abi pointer
# (method81 offset 672; Vacant moves to slot 85 offset 680; TraitVPtr
# moves to slot 86 offset 688; 87 slots / 696 bytes).
# Eighty-sixth pin: slot 85 eighty-third Method plus rustc_abi pointer
# (method82 offset 680; Vacant moves to slot 86 offset 688; TraitVPtr
# moves to slot 87 offset 696; 88 slots / 704 bytes).
# Eighty-seventh pin: slot 86 eighty-fourth Method plus rustc_abi pointer
# (method83 offset 688; Vacant moves to slot 87 offset 696; TraitVPtr
# moves to slot 88 offset 704; 89 slots / 712 bytes).
# Eighty-eighth pin: slot 87 eighty-fifth Method plus rustc_abi pointer
# (method84 offset 696; Vacant moves to slot 88 offset 704; TraitVPtr
# moves to slot 89 offset 712; 90 slots / 720 bytes).
# Eighty-ninth pin: slot 88 eighty-sixth Method plus rustc_abi pointer
# (method85 offset 704; Vacant moves to slot 89 offset 712; TraitVPtr
# moves to slot 90 offset 720; 91 slots / 728 bytes).
# Ninetieth pin: slot 89 eighty-seventh Method plus rustc_abi pointer
# (method86 offset 712; Vacant moves to slot 90 offset 720; TraitVPtr
# moves to slot 91 offset 728; 92 slots / 736 bytes).
# Ninety-first pin: slot 90 eighty-eighth Method plus rustc_abi pointer
# (method87 offset 720; Vacant moves to slot 91 offset 728; TraitVPtr
# moves to slot 92 offset 736; 93 slots / 744 bytes).
# Ninety-second pin: slot 91 eighty-ninth Method plus rustc_abi pointer
# (method88 offset 728; Vacant moves to slot 92 offset 736; TraitVPtr
# moves to slot 93 offset 744; 94 slots / 752 bytes).
# Ninety-third pin: slot 92 ninetieth Method plus rustc_abi pointer
# (method89 offset 736; Vacant moves to slot 93 offset 744; TraitVPtr
# moves to slot 94 offset 752; 95 slots / 760 bytes).
# Ninety-fourth pin: slot 93 ninety-first Method plus rustc_abi pointer
# (method90 offset 744; Vacant moves to slot 94 offset 752; TraitVPtr
# moves to slot 95 offset 760; 96 slots / 768 bytes).
# Ninety-fifth pin: slot 94 ninety-second Method plus rustc_abi pointer
# (method91 offset 752; Vacant moves to slot 95 offset 760; TraitVPtr
# moves to slot 96 offset 768; 97 slots / 776 bytes).
# Ninety-sixth pin: slot 95 ninety-third Method plus rustc_abi pointer
# (method92 offset 760; Vacant moves to slot 96 offset 768; TraitVPtr
# moves to slot 97 offset 776; 98 slots / 784 bytes).
# Ninety-seventh pin: slot 96 ninety-fourth Method plus rustc_abi pointer
# (method93 offset 768; Vacant moves to slot 97 offset 776; TraitVPtr
# moves to slot 98 offset 784; 99 slots / 792 bytes).
# Ninety-eighth pin: slot 97 ninety-fifth Method plus rustc_abi pointer
# (method94 offset 776; Vacant moves to slot 98 offset 784; TraitVPtr
# moves to slot 99 offset 792; 100 slots / 800 bytes).
# Ninety-ninth pin: slot 98 ninety-sixth Method plus rustc_abi pointer
# (method95 offset 784; Vacant moves to slot 99 offset 792; TraitVPtr
# moves to slot 100 offset 800; 101 slots / 808 bytes).
# Hundredth pin: slot 99 ninety-seventh Method plus rustc_abi pointer
# (method96 offset 792; Vacant moves to slot 100 offset 800; TraitVPtr
# moves to slot 101 offset 808; 102 slots / 816 bytes).
# Hundred-first pin: slot 100 ninety-eighth Method plus rustc_abi pointer
# (method97 offset 800; Vacant moves to slot 101 offset 808; TraitVPtr
# moves to slot 102 offset 816; 103 slots / 824 bytes).
# Hundred-second pin: slot 101 ninety-ninth Method plus rustc_abi pointer
# (method98 offset 808; Vacant moves to slot 102 offset 816; TraitVPtr
# moves to slot 103 offset 824; 104 slots / 832 bytes).
# Hundred-third pin: slot 102 one-hundredth Method plus rustc_abi pointer
# (method99 offset 816; Vacant moves to slot 103 offset 824; TraitVPtr
# moves to slot 104 offset 832; 105 slots / 840 bytes).
# Hundred-fourth pin: slot 103 one-hundred-first Method plus rustc_abi pointer
# (method100 offset 824; Vacant moves to slot 104 offset 832; TraitVPtr
# moves to slot 105 offset 840; 106 slots / 848 bytes).
# Hundred-fifth pin: slot 104 one-hundred-second Method plus rustc_abi pointer
# (method101 offset 832; Vacant moves to slot 105 offset 840; TraitVPtr
# moves to slot 106 offset 848; 107 slots / 856 bytes).
# Hundred-sixth pin: slot 105 one-hundred-third Method plus rustc_abi pointer
# (method102 offset 840; Vacant moves to slot 106 offset 848; TraitVPtr
# moves to slot 107 offset 856; 108 slots / 864 bytes).
# Hundred-seventh pin: slot 106 one-hundred-fourth Method plus rustc_abi pointer
# (method103 offset 848; Vacant moves to slot 107 offset 856; TraitVPtr
# moves to slot 108 offset 864; 109 slots / 872 bytes).
# Hundred-eighth pin: slot 107 one-hundred-fifth Method plus rustc_abi pointer
# (method104 offset 856; Vacant moves to slot 108 offset 864; TraitVPtr
# moves to slot 109 offset 872; 110 slots / 880 bytes).
# Hundred-ninth pin: slot 108 one-hundred-sixth Method plus rustc_abi pointer
# (method105 offset 864; Vacant moves to slot 109 offset 872; TraitVPtr
# moves to slot 110 offset 880; 111 slots / 888 bytes).
# Hundred-tenth pin: slot 109 one-hundred-seventh Method plus rustc_abi pointer
# (method106 offset 872; Vacant moves to slot 110 offset 880; TraitVPtr
# moves to slot 111 offset 888; 112 slots / 896 bytes).
# Hundred-eleventh pin: slot 110 one-hundred-eighth Method plus rustc_abi pointer
# (method107 offset 880; Vacant moves to slot 111 offset 888; TraitVPtr
# moves to slot 112 offset 896; 113 slots / 904 bytes).
# Hundred-twelfth pin: slot 111 one-hundred-ninth Method plus rustc_abi pointer
# (method108 offset 888; Vacant moves to slot 112 offset 896; TraitVPtr
# moves to slot 113 offset 904; 114 slots / 912 bytes).
# Hundred-thirteenth pin: slot 112 one-hundred-tenth Method plus rustc_abi pointer
# (method109 offset 896; Vacant moves to slot 113 offset 904; TraitVPtr
# moves to slot 114 offset 912; 115 slots / 920 bytes).
# Hundred-fourteenth pin: slot 113 one-hundred-eleventh Method plus rustc_abi pointer
# (method110 offset 904; Vacant moves to slot 114 offset 912; TraitVPtr
# moves to slot 115 offset 920; 116 slots / 928 bytes).
# Hundred-fifteenth pin: slot 114 one-hundred-twelfth Method plus rustc_abi pointer
# (method111 offset 912; Vacant moves to slot 115 offset 920; TraitVPtr
# moves to slot 116 offset 928; 117 slots / 936 bytes).
# Hundred-sixteenth pin: slot 115 one-hundred-thirteenth Method plus rustc_abi pointer
# (method112 offset 920; Vacant moves to slot 116 offset 928; TraitVPtr
# moves to slot 117 offset 936; 118 slots / 944 bytes).
# Hundred-seventeenth pin: slot 116 one-hundred-fourteenth Method plus rustc_abi pointer
# (method113 offset 928; Vacant moves to slot 117 offset 936; TraitVPtr
# moves to slot 118 offset 944; 119 slots / 952 bytes).
# Hundred-eighteenth pin: slot 117 one-hundred-fifteenth Method plus rustc_abi pointer
# (method114 offset 936; Vacant moves to slot 118 offset 944; TraitVPtr
# moves to slot 119 offset 952; 120 slots / 960 bytes).
# Hundred-nineteenth pin: slot 118 one-hundred-sixteenth Method plus rustc_abi pointer
# (method115 offset 944; Vacant moves to slot 119 offset 952; TraitVPtr
# moves to slot 120 offset 960; 121 slots / 968 bytes).
# Hundred-twentieth pin: slot 119 one-hundred-seventeenth Method plus rustc_abi pointer
# (method116 offset 952; Vacant moves to slot 120 offset 960; TraitVPtr
# moves to slot 121 offset 968; 122 slots / 976 bytes).
# Hundred-twenty-first pin: slot 120 one-hundred-eighteenth Method plus rustc_abi pointer
# (method117 offset 960; Vacant moves to slot 121 offset 968; TraitVPtr
# moves to slot 122 offset 976; 123 slots / 984 bytes).
# Hundred-twenty-second pin: slot 121 one-hundred-nineteenth Method plus rustc_abi pointer
# (method118 offset 968; Vacant moves to slot 122 offset 976; TraitVPtr
# moves to slot 123 offset 984; 124 slots / 992 bytes).
# Hundred-twenty-third pin: slot 122 one-hundred-twentieth Method plus rustc_abi pointer
# (method119 offset 976; Vacant moves to slot 123 offset 984; TraitVPtr
# moves to slot 124 offset 992; 125 slots / 1000 bytes).
# Hundred-twenty-fourth pin: slot 123 one-hundred-twenty-first Method plus rustc_abi pointer
# (method120 offset 984; Vacant moves to slot 124 offset 992; TraitVPtr
# moves to slot 125 offset 1000; 126 slots / 1008 bytes).
# Hundred-twenty-fifth pin: slot 124 one-hundred-twenty-second Method plus rustc_abi pointer
# (method121 offset 992; Vacant moves to slot 125 offset 1000; TraitVPtr
# moves to slot 126 offset 1008; 127 slots / 1016 bytes).
# Hundred-twenty-sixth pin: slot 125 one-hundred-twenty-third Method plus rustc_abi pointer
# (method122 offset 1000; Vacant moves to slot 126 offset 1008; TraitVPtr
# moves to slot 127 offset 1016; 128 slots / 1024 bytes).
# Hundred-twenty-seventh pin: slot 126 one-hundred-twenty-fourth Method plus rustc_abi pointer
# (method123 offset 1008; Vacant moves to slot 127 offset 1016; TraitVPtr
# moves to slot 128 offset 1024; 129 slots / 1032 bytes).
# Hundred-twenty-eighth pin: slot 127 one-hundred-twenty-fifth Method plus rustc_abi pointer
# (method124 offset 1016; Vacant moves to slot 128 offset 1024; TraitVPtr
# moves to slot 129 offset 1032; 130 slots / 1040 bytes).
# Hundred-twenty-ninth pin: slot 128 one-hundred-twenty-sixth Method plus rustc_abi pointer
# (method125 offset 1024; Vacant moves to slot 129 offset 1032; TraitVPtr
# moves to slot 130 offset 1040; 131 slots / 1048 bytes).
# Hundred-thirtieth pin: slot 129 one-hundred-twenty-seventh Method plus rustc_abi pointer
# (method126 offset 1032; Vacant moves to slot 130 offset 1040; TraitVPtr
# moves to slot 131 offset 1048; 132 slots / 1056 bytes).
# Hundred-thirty-first pin: slot 130 one-hundred-twenty-eighth Method plus rustc_abi pointer
# (method127 offset 1040; Vacant moves to slot 131 offset 1048; TraitVPtr
# moves to slot 132 offset 1056; 133 slots / 1064 bytes).
# Header 0/1/2 and Method slots 3/4/5/6/7/8/9/10/11/12/13/14/15/16/17/18/19/20/21/22/23/24/25/26/27/28/29/30/31/32/33/34/35/36/37/38/39/40/41/42/43/44/45/46/47/48/49/50/51/52/53/54/55/56/57/58/59/60/61/62/63/64/65/66/67/68/69/70/71/72/73/74/75/76/77/78/79/80/81/82/83/84/85/86/87/88/89/90/91/92/93/94/95/96/97/98/99/100/101/102/103/104/105/106/107/108/109/110/111/112/113/114/115/116/117/118/119/120/121/122/123/124/125/126/127/128/129/130
# unchanged.
# Host-originated emit walks TraitObjectFat (HOST-TRAIT-OBJECT-FAT).
# Greppable: llvm-trait-object-vtable, SLAKE_TRAIT_OBJECT_VTABLE_V0,
# HOST-TRAIT-OBJECT-VTABLE, HOST-TRAIT-OBJECT-FAT, TRAIT-OBJECT-VTABLE-IR,
# rustc_abi pointer, TraitVPtr, Vacant, method1, method2, method3, method4,
# method5, method6, method7, method8, method9, method10, method11, method12,
# method13, method14, method15, method16, method17, method18, method19,
# method20, method21, method22, method23, method24, method25, method26,
# method27, method28, method29, method30, method31, method32, method33,
# method34, method35, method36, method37, method38, method39, method40,
# method41, method42, method43, method44, method45, method46, method47,
# method48, method49, method50, method51, method52, method53, method54,
# method55, method56, method57, method58, method59, method60, method61,
# method62, method63, method64, method65, method66, method67, method68,
# method69, method70, method71, method72, method73, method74, method75,
# method76, method77, method78, method79, method80, method81, method82,
# method83, method84, method85, method86, method87, method88, method89,
# method90, method91, method92, method93, method94, method95, method96,
# method97, method98, method99, method100, method101, method102, method103, method104, method105, method106, method107, method108, method109, method110, method111, method112, method113, method114, method115, method116, method117, method118, method119, method120, method121, method122, method123, method124, method125, method126, method127.
llvm-trait-object-vtable:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/TraitObjectVtable.lean"
    dest="$root/out/llvm-ir/trait-object-vtable.ll"
    echo "SLAKE_TRAIT_OBJECT_VTABLE_V0 / HOST-TRAIT-OBJECT-VTABLE"
    echo "HOST-TRAIT-OBJECT-FAT host-originated emit (walk TraitObjectFat)"
    echo "TRAIT-OBJECT-VTABLE-IR checkable writer (lean --run; no mill row)"
    echo "non-claims: not FullBackend; production emit claimed false; occupancy 49; mill 69 of 69; do not remill"
    if ! command -v lean >/dev/null 2>&1; then
      echo "error: lean not on PATH; llvm-trait-object-vtable needs host Lean" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "error: missing Lean printer $src" >&2
      exit 1
    fi
    tmp="$(mktemp)"
    trap 'rm -f "$tmp"' EXIT
    lean -R "$src_root" --run "$src" "$root" print >"$tmp"
    lean -R "$src_root" --run "$src" "$root" write
    if ! cmp -s "$tmp" "$dest"; then
      echo "error: dest bytes differ from Lean printer: $dest" >&2
      cmp "$tmp" "$dest" >&2 || true
      exit 1
    fi
    if ! grep -q "slake_trait_object_method2" "$dest"; then
      echo "error: dest missing third Method (method2): $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method3" "$dest"; then
      echo "error: dest missing fourth Method (method3): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 6 method3 offset 48" "$dest"; then
      echo "error: dest missing method3 slot 6 offset 48: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method4" "$dest"; then
      echo "error: dest missing fifth Method (method4): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 7 method4 offset 56" "$dest"; then
      echo "error: dest missing method4 slot 7 offset 56: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method5" "$dest"; then
      echo "error: dest missing sixth Method (method5): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 8 method5 offset 64" "$dest"; then
      echo "error: dest missing method5 slot 8 offset 64: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method6" "$dest"; then
      echo "error: dest missing seventh Method (method6): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 9 method6 offset 72" "$dest"; then
      echo "error: dest missing method6 slot 9 offset 72: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method7" "$dest"; then
      echo "error: dest missing eighth Method (method7): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 10 method7 offset 80" "$dest"; then
      echo "error: dest missing method7 slot 10 offset 80: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method8" "$dest"; then
      echo "error: dest missing ninth Method (method8): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 11 method8 offset 88" "$dest"; then
      echo "error: dest missing method8 slot 11 offset 88: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method9" "$dest"; then
      echo "error: dest missing tenth Method (method9): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 12 method9 offset 96" "$dest"; then
      echo "error: dest missing method9 slot 12 offset 96: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method10" "$dest"; then
      echo "error: dest missing eleventh Method (method10): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 13 method10 offset 104" "$dest"; then
      echo "error: dest missing method10 slot 13 offset 104: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method11" "$dest"; then
      echo "error: dest missing twelfth Method (method11): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 14 method11 offset 112" "$dest"; then
      echo "error: dest missing method11 slot 14 offset 112: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method12" "$dest"; then
      echo "error: dest missing thirteenth Method (method12): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 15 method12 offset 120" "$dest"; then
      echo "error: dest missing method12 slot 15 offset 120: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method13" "$dest"; then
      echo "error: dest missing fourteenth Method (method13): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 16 method13 offset 128" "$dest"; then
      echo "error: dest missing method13 slot 16 offset 128: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method14" "$dest"; then
      echo "error: dest missing fifteenth Method (method14): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 17 method14 offset 136" "$dest"; then
      echo "error: dest missing method14 slot 17 offset 136: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method15" "$dest"; then
      echo "error: dest missing sixteenth Method (method15): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 18 method15 offset 144" "$dest"; then
      echo "error: dest missing method15 slot 18 offset 144: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method16" "$dest"; then
      echo "error: dest missing seventeenth Method (method16): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 19 method16 offset 152" "$dest"; then
      echo "error: dest missing method16 slot 19 offset 152: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method17" "$dest"; then
      echo "error: dest missing eighteenth Method (method17): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 20 method17 offset 160" "$dest"; then
      echo "error: dest missing method17 slot 20 offset 160: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method18" "$dest"; then
      echo "error: dest missing nineteenth Method (method18): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 21 method18 offset 168" "$dest"; then
      echo "error: dest missing method18 slot 21 offset 168: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method19" "$dest"; then
      echo "error: dest missing twentieth Method (method19): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 22 method19 offset 176" "$dest"; then
      echo "error: dest missing method19 slot 22 offset 176: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method20" "$dest"; then
      echo "error: dest missing twenty-first Method (method20): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 23 method20 offset 184" "$dest"; then
      echo "error: dest missing method20 slot 23 offset 184: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method21" "$dest"; then
      echo "error: dest missing twenty-second Method (method21): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 24 method21 offset 192" "$dest"; then
      echo "error: dest missing method21 slot 24 offset 192: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method22" "$dest"; then
      echo "error: dest missing twenty-third Method (method22): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 25 method22 offset 200" "$dest"; then
      echo "error: dest missing method22 slot 25 offset 200: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method23" "$dest"; then
      echo "error: dest missing twenty-fourth Method (method23): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 26 method23 offset 208" "$dest"; then
      echo "error: dest missing method23 slot 26 offset 208: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method24" "$dest"; then
      echo "error: dest missing twenty-fifth Method (method24): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 27 method24 offset 216" "$dest"; then
      echo "error: dest missing method24 slot 27 offset 216: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method25" "$dest"; then
      echo "error: dest missing twenty-sixth Method (method25): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 28 method25 offset 224" "$dest"; then
      echo "error: dest missing method25 slot 28 offset 224: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method26" "$dest"; then
      echo "error: dest missing twenty-seventh Method (method26): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 29 method26 offset 232" "$dest"; then
      echo "error: dest missing method26 slot 29 offset 232: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method27" "$dest"; then
      echo "error: dest missing twenty-eighth Method (method27): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 30 method27 offset 240" "$dest"; then
      echo "error: dest missing method27 slot 30 offset 240: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method28" "$dest"; then
      echo "error: dest missing twenty-ninth Method (method28): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 31 method28 offset 248" "$dest"; then
      echo "error: dest missing method28 slot 31 offset 248: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method29" "$dest"; then
      echo "error: dest missing thirtieth Method (method29): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 32 method29 offset 256" "$dest"; then
      echo "error: dest missing method29 slot 32 offset 256: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method30" "$dest"; then
      echo "error: dest missing thirty-first Method (method30): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 33 method30 offset 264" "$dest"; then
      echo "error: dest missing method30 slot 33 offset 264: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method31" "$dest"; then
      echo "error: dest missing thirty-second Method (method31): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 34 method31 offset 272" "$dest"; then
      echo "error: dest missing method31 slot 34 offset 272: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method32" "$dest"; then
      echo "error: dest missing thirty-third Method (method32): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 35 method32 offset 280" "$dest"; then
      echo "error: dest missing method32 slot 35 offset 280: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method33" "$dest"; then
      echo "error: dest missing thirty-fourth Method (method33): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 36 method33 offset 288" "$dest"; then
      echo "error: dest missing method33 slot 36 offset 288: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method34" "$dest"; then
      echo "error: dest missing thirty-fifth Method (method34): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 37 method34 offset 296" "$dest"; then
      echo "error: dest missing method34 slot 37 offset 296: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method35" "$dest"; then
      echo "error: dest missing thirty-sixth Method (method35): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 38 method35 offset 304" "$dest"; then
      echo "error: dest missing method35 slot 38 offset 304: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method36" "$dest"; then
      echo "error: dest missing thirty-seventh Method (method36): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 39 method36 offset 312" "$dest"; then
      echo "error: dest missing method36 slot 39 offset 312: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method37" "$dest"; then
      echo "error: dest missing thirty-eighth Method (method37): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 40 method37 offset 320" "$dest"; then
      echo "error: dest missing method37 slot 40 offset 320: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method38" "$dest"; then
      echo "error: dest missing thirty-ninth Method (method38): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 41 method38 offset 328" "$dest"; then
      echo "error: dest missing method38 slot 41 offset 328: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method39" "$dest"; then
      echo "error: dest missing fortieth Method (method39): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 42 method39 offset 336" "$dest"; then
      echo "error: dest missing method39 slot 42 offset 336: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method40" "$dest"; then
      echo "error: dest missing forty-first Method (method40): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 43 method40 offset 344" "$dest"; then
      echo "error: dest missing method40 slot 43 offset 344: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method41" "$dest"; then
      echo "error: dest missing forty-second Method (method41): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 44 method41 offset 352" "$dest"; then
      echo "error: dest missing method41 slot 44 offset 352: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method42" "$dest"; then
      echo "error: dest missing forty-third Method (method42): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 45 method42 offset 360" "$dest"; then
      echo "error: dest missing method42 slot 45 offset 360: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method43" "$dest"; then
      echo "error: dest missing forty-fourth Method (method43): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 46 method43 offset 368" "$dest"; then
      echo "error: dest missing method43 slot 46 offset 368: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method44" "$dest"; then
      echo "error: dest missing forty-fifth Method (method44): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 47 method44 offset 376" "$dest"; then
      echo "error: dest missing method44 slot 47 offset 376: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method45" "$dest"; then
      echo "error: dest missing forty-sixth Method (method45): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 48 method45 offset 384" "$dest"; then
      echo "error: dest missing method45 slot 48 offset 384: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method46" "$dest"; then
      echo "error: dest missing forty-seventh Method (method46): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 49 method46 offset 392" "$dest"; then
      echo "error: dest missing method46 slot 49 offset 392: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method47" "$dest"; then
      echo "error: dest missing forty-eighth Method (method47): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 50 method47 offset 400" "$dest"; then
      echo "error: dest missing method47 slot 50 offset 400: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method48" "$dest"; then
      echo "error: dest missing forty-ninth Method (method48): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 51 method48 offset 408" "$dest"; then
      echo "error: dest missing method48 slot 51 offset 408: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method49" "$dest"; then
      echo "error: dest missing fiftieth Method (method49): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 52 method49 offset 416" "$dest"; then
      echo "error: dest missing method49 slot 52 offset 416: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method50" "$dest"; then
      echo "error: dest missing fifty-first Method (method50): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 53 method50 offset 424" "$dest"; then
      echo "error: dest missing method50 slot 53 offset 424: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method51" "$dest"; then
      echo "error: dest missing fifty-second Method (method51): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 54 method51 offset 432" "$dest"; then
      echo "error: dest missing method51 slot 54 offset 432: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method52" "$dest"; then
      echo "error: dest missing fifty-third Method (method52): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 55 method52 offset 440" "$dest"; then
      echo "error: dest missing method52 slot 55 offset 440: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method53" "$dest"; then
      echo "error: dest missing fifty-fourth Method (method53): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 56 method53 offset 448" "$dest"; then
      echo "error: dest missing method53 slot 56 offset 448: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method54" "$dest"; then
      echo "error: dest missing fifty-fifth Method (method54): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 57 method54 offset 456" "$dest"; then
      echo "error: dest missing method54 slot 57 offset 456: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method55" "$dest"; then
      echo "error: dest missing fifty-sixth Method (method55): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 58 method55 offset 464" "$dest"; then
      echo "error: dest missing method55 slot 58 offset 464: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method56" "$dest"; then
      echo "error: dest missing fifty-seventh Method (method56): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 59 method56 offset 472" "$dest"; then
      echo "error: dest missing method56 slot 59 offset 472: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method57" "$dest"; then
      echo "error: dest missing fifty-eighth Method (method57): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 60 method57 offset 480" "$dest"; then
      echo "error: dest missing method57 slot 60 offset 480: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method58" "$dest"; then
      echo "error: dest missing fifty-ninth Method (method58): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 61 method58 offset 488" "$dest"; then
      echo "error: dest missing method58 slot 61 offset 488: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method59" "$dest"; then
      echo "error: dest missing sixtieth Method (method59): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 62 method59 offset 496" "$dest"; then
      echo "error: dest missing method59 slot 62 offset 496: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method60" "$dest"; then
      echo "error: dest missing sixty-first Method (method60): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 63 method60 offset 504" "$dest"; then
      echo "error: dest missing method60 slot 63 offset 504: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method61" "$dest"; then
      echo "error: dest missing sixty-second Method (method61): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 64 method61 offset 512" "$dest"; then
      echo "error: dest missing method61 slot 64 offset 512: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method62" "$dest"; then
      echo "error: dest missing sixty-third Method (method62): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 65 method62 offset 520" "$dest"; then
      echo "error: dest missing method62 slot 65 offset 520: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method63" "$dest"; then
      echo "error: dest missing sixty-fourth Method (method63): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 66 method63 offset 528" "$dest"; then
      echo "error: dest missing method63 slot 66 offset 528: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method64" "$dest"; then
      echo "error: dest missing sixty-fifth Method (method64): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 67 method64 offset 536" "$dest"; then
      echo "error: dest missing method64 slot 67 offset 536: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method65" "$dest"; then
      echo "error: dest missing sixty-sixth Method (method65): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 68 method65 offset 544" "$dest"; then
      echo "error: dest missing method65 slot 68 offset 544: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method66" "$dest"; then
      echo "error: dest missing sixty-seventh Method (method66): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 69 method66 offset 552" "$dest"; then
      echo "error: dest missing method66 slot 69 offset 552: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method67" "$dest"; then
      echo "error: dest missing sixty-eighth Method (method67): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 70 method67 offset 560" "$dest"; then
      echo "error: dest missing method67 slot 70 offset 560: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method68" "$dest"; then
      echo "error: dest missing sixty-ninth Method (method68): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 71 method68 offset 568" "$dest"; then
      echo "error: dest missing method68 slot 71 offset 568: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method69" "$dest"; then
      echo "error: dest missing seventieth Method (method69): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 72 method69 offset 576" "$dest"; then
      echo "error: dest missing method69 slot 72 offset 576: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method70" "$dest"; then
      echo "error: dest missing seventy-first Method (method70): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 73 method70 offset 584" "$dest"; then
      echo "error: dest missing method70 slot 73 offset 584: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method71" "$dest"; then
      echo "error: dest missing seventy-second Method (method71): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 74 method71 offset 592" "$dest"; then
      echo "error: dest missing method71 slot 74 offset 592: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method72" "$dest"; then
      echo "error: dest missing seventy-third Method (method72): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 75 method72 offset 600" "$dest"; then
      echo "error: dest missing method72 slot 75 offset 600: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method73" "$dest"; then
      echo "error: dest missing seventy-fourth Method (method73): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 76 method73 offset 608" "$dest"; then
      echo "error: dest missing method73 slot 76 offset 608: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method74" "$dest"; then
      echo "error: dest missing seventy-fifth Method (method74): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 77 method74 offset 616" "$dest"; then
      echo "error: dest missing method74 slot 77 offset 616: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method75" "$dest"; then
      echo "error: dest missing seventy-sixth Method (method75): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 78 method75 offset 624" "$dest"; then
      echo "error: dest missing method75 slot 78 offset 624: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method76" "$dest"; then
      echo "error: dest missing seventy-seventh Method (method76): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 79 method76 offset 632" "$dest"; then
      echo "error: dest missing method76 slot 79 offset 632: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method77" "$dest"; then
      echo "error: dest missing seventy-eighth Method (method77): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 80 method77 offset 640" "$dest"; then
      echo "error: dest missing method77 slot 80 offset 640: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method78" "$dest"; then
      echo "error: dest missing seventy-ninth Method (method78): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 81 method78 offset 648" "$dest"; then
      echo "error: dest missing method78 slot 81 offset 648: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method79" "$dest"; then
      echo "error: dest missing eightieth Method (method79): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 82 method79 offset 656" "$dest"; then
      echo "error: dest missing method79 slot 82 offset 656: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method80" "$dest"; then
      echo "error: dest missing eighty-first Method (method80): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 83 method80 offset 664" "$dest"; then
      echo "error: dest missing method80 slot 83 offset 664: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method81" "$dest"; then
      echo "error: dest missing eighty-second Method (method81): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 84 method81 offset 672" "$dest"; then
      echo "error: dest missing method81 slot 84 offset 672: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method82" "$dest"; then
      echo "error: dest missing eighty-third Method (method82): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 85 method82 offset 680" "$dest"; then
      echo "error: dest missing method82 slot 85 offset 680: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method83" "$dest"; then
      echo "error: dest missing eighty-fourth Method (method83): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 86 method83 offset 688" "$dest"; then
      echo "error: dest missing method83 slot 86 offset 688: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method84" "$dest"; then
      echo "error: dest missing eighty-fifth Method (method84): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 87 method84 offset 696" "$dest"; then
      echo "error: dest missing method84 slot 87 offset 696: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method85" "$dest"; then
      echo "error: dest missing eighty-sixth Method (method85): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 88 method85 offset 704" "$dest"; then
      echo "error: dest missing method85 slot 88 offset 704: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method86" "$dest"; then
      echo "error: dest missing eighty-seventh Method (method86): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 89 method86 offset 712" "$dest"; then
      echo "error: dest missing method86 slot 89 offset 712: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method87" "$dest"; then
      echo "error: dest missing eighty-eighth Method (method87): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 90 method87 offset 720" "$dest"; then
      echo "error: dest missing method87 slot 90 offset 720: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method88" "$dest"; then
      echo "error: dest missing eighty-ninth Method (method88): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 91 method88 offset 728" "$dest"; then
      echo "error: dest missing method88 slot 91 offset 728: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method89" "$dest"; then
      echo "error: dest missing ninetieth Method (method89): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 92 method89 offset 736" "$dest"; then
      echo "error: dest missing method89 slot 92 offset 736: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method90" "$dest"; then
      echo "error: dest missing ninety-first Method (method90): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 93 method90 offset 744" "$dest"; then
      echo "error: dest missing method90 slot 93 offset 744: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method91" "$dest"; then
      echo "error: dest missing ninety-second Method (method91): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 94 method91 offset 752" "$dest"; then
      echo "error: dest missing method91 slot 94 offset 752: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method92" "$dest"; then
      echo "error: dest missing ninety-third Method (method92): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 95 method92 offset 760" "$dest"; then
      echo "error: dest missing method92 slot 95 offset 760: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method93" "$dest"; then
      echo "error: dest missing ninety-fourth Method (method93): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 96 method93 offset 768" "$dest"; then
      echo "error: dest missing method93 slot 96 offset 768: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method94" "$dest"; then
      echo "error: dest missing ninety-fifth Method (method94): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 97 method94 offset 776" "$dest"; then
      echo "error: dest missing method94 slot 97 offset 776: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method95" "$dest"; then
      echo "error: dest missing ninety-sixth Method (method95): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 98 method95 offset 784" "$dest"; then
      echo "error: dest missing method95 slot 98 offset 784: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method96" "$dest"; then
      echo "error: dest missing ninety-seventh Method (method96): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 99 method96 offset 792" "$dest"; then
      echo "error: dest missing method96 slot 99 offset 792: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method97" "$dest"; then
      echo "error: dest missing ninety-eighth Method (method97): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 100 method97 offset 800" "$dest"; then
      echo "error: dest missing method97 slot 100 offset 800: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method98" "$dest"; then
      echo "error: dest missing ninety-ninth Method (method98): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 101 method98 offset 808" "$dest"; then
      echo "error: dest missing method98 slot 101 offset 808: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method99" "$dest"; then
      echo "error: dest missing one-hundredth Method (method99): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 102 method99 offset 816" "$dest"; then
      echo "error: dest missing method99 slot 102 offset 816: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method100" "$dest"; then
      echo "error: dest missing one-hundred-first Method (method100): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 103 method100 offset 824" "$dest"; then
      echo "error: dest missing method100 slot 103 offset 824: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method101" "$dest"; then
      echo "error: dest missing one-hundred-second Method (method101): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 104 method101 offset 832" "$dest"; then
      echo "error: dest missing method101 slot 104 offset 832: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method102" "$dest"; then
      echo "error: dest missing one-hundred-third Method (method102): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 105 method102 offset 840" "$dest"; then
      echo "error: dest missing method102 slot 105 offset 840: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method103" "$dest"; then
      echo "error: dest missing one-hundred-fourth Method (method103): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 106 method103 offset 848" "$dest"; then
      echo "error: dest missing method103 slot 106 offset 848: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method104" "$dest"; then
      echo "error: dest missing one-hundred-fifth Method (method104): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 107 method104 offset 856" "$dest"; then
      echo "error: dest missing method104 slot 107 offset 856: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method105" "$dest"; then
      echo "error: dest missing one-hundred-sixth Method (method105): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 108 method105 offset 864" "$dest"; then
      echo "error: dest missing method105 slot 108 offset 864: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method106" "$dest"; then
      echo "error: dest missing one-hundred-seventh Method (method106): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 109 method106 offset 872" "$dest"; then
      echo "error: dest missing method106 slot 109 offset 872: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method107" "$dest"; then
      echo "error: dest missing one-hundred-eighth Method (method107): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 110 method107 offset 880" "$dest"; then
      echo "error: dest missing method107 slot 110 offset 880: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method108" "$dest"; then
      echo "error: dest missing one-hundred-ninth Method (method108): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 111 method108 offset 888" "$dest"; then
      echo "error: dest missing method108 slot 111 offset 888: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method109" "$dest"; then
      echo "error: dest missing one-hundred-tenth Method (method109): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 112 method109 offset 896" "$dest"; then
      echo "error: dest missing method109 slot 112 offset 896: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method110" "$dest"; then
      echo "error: dest missing one-hundred-eleventh Method (method110): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 113 method110 offset 904" "$dest"; then
      echo "error: dest missing method110 slot 113 offset 904: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method111" "$dest"; then
      echo "error: dest missing one-hundred-twelfth Method (method111): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 114 method111 offset 912" "$dest"; then
      echo "error: dest missing method111 slot 114 offset 912: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method112" "$dest"; then
      echo "error: dest missing one-hundred-thirteenth Method (method112): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 115 method112 offset 920" "$dest"; then
      echo "error: dest missing method112 slot 115 offset 920: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method113" "$dest"; then
      echo "error: dest missing one-hundred-fourteenth Method (method113): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 116 method113 offset 928" "$dest"; then
      echo "error: dest missing method113 slot 116 offset 928: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method114" "$dest"; then
      echo "error: dest missing one-hundred-fifteenth Method (method114): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 117 method114 offset 936" "$dest"; then
      echo "error: dest missing method114 slot 117 offset 936: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method115" "$dest"; then
      echo "error: dest missing one-hundred-sixteenth Method (method115): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 118 method115 offset 944" "$dest"; then
      echo "error: dest missing method115 slot 118 offset 944: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method116" "$dest"; then
      echo "error: dest missing one-hundred-seventeenth Method (method116): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 119 method116 offset 952" "$dest"; then
      echo "error: dest missing method116 slot 119 offset 952: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method117" "$dest"; then
      echo "error: dest missing one-hundred-eighteenth Method (method117): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 120 method117 offset 960" "$dest"; then
      echo "error: dest missing method117 slot 120 offset 960: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method118" "$dest"; then
      echo "error: dest missing one-hundred-nineteenth Method (method118): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 121 method118 offset 968" "$dest"; then
      echo "error: dest missing method118 slot 121 offset 968: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method119" "$dest"; then
      echo "error: dest missing one-hundred-twentieth Method (method119): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 122 method119 offset 976" "$dest"; then
      echo "error: dest missing method119 slot 122 offset 976: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method120" "$dest"; then
      echo "error: dest missing one-hundred-twenty-first Method (method120): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 123 method120 offset 984" "$dest"; then
      echo "error: dest missing method120 slot 123 offset 984: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method121" "$dest"; then
      echo "error: dest missing one-hundred-twenty-second Method (method121): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 124 method121 offset 992" "$dest"; then
      echo "error: dest missing method121 slot 124 offset 992: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method122" "$dest"; then
      echo "error: dest missing one-hundred-twenty-third Method (method122): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 125 method122 offset 1000" "$dest"; then
      echo "error: dest missing method122 slot 125 offset 1000: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method123" "$dest"; then
      echo "error: dest missing one-hundred-twenty-fourth Method (method123): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 126 method123 offset 1008" "$dest"; then
      echo "error: dest missing method123 slot 126 offset 1008: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method124" "$dest"; then
      echo "error: dest missing one-hundred-twenty-fifth Method (method124): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 127 method124 offset 1016" "$dest"; then
      echo "error: dest missing method124 slot 127 offset 1016: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method125" "$dest"; then
      echo "error: dest missing one-hundred-twenty-sixth Method (method125): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 128 method125 offset 1024" "$dest"; then
      echo "error: dest missing method125 slot 128 offset 1024: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method126" "$dest"; then
      echo "error: dest missing one-hundred-twenty-seventh Method (method126): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 129 method126 offset 1032" "$dest"; then
      echo "error: dest missing method126 slot 129 offset 1032: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method127" "$dest"; then
      echo "error: dest missing one-hundred-twenty-eighth Method (method127): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 130 method127 offset 1040" "$dest"; then
      echo "error: dest missing method127 slot 130 offset 1040: $dest" >&2
      exit 1
    fi
    if grep -q "slot 8 Vacant offset 64" "$dest"; then
      echo "error: dest Vacant still at slot 8 offset 64: $dest" >&2
      exit 1
    fi
    if grep -q "slot 9 Vacant offset 72" "$dest"; then
      echo "error: dest Vacant still at slot 9 offset 72: $dest" >&2
      exit 1
    fi
    if grep -q "slot 10 Vacant offset 80" "$dest"; then
      echo "error: dest Vacant still at slot 10 offset 80: $dest" >&2
      exit 1
    fi
    if grep -q "slot 11 Vacant offset 88" "$dest"; then
      echo "error: dest Vacant still at slot 11 offset 88: $dest" >&2
      exit 1
    fi
    if grep -q "slot 12 Vacant offset 96" "$dest"; then
      echo "error: dest Vacant still at slot 12 offset 96: $dest" >&2
      exit 1
    fi
    if grep -q "slot 13 Vacant offset 104" "$dest"; then
      echo "error: dest Vacant still at slot 13 offset 104: $dest" >&2
      exit 1
    fi
    if grep -q "slot 14 Vacant offset 112" "$dest"; then
      echo "error: dest Vacant still at slot 14 offset 112: $dest" >&2
      exit 1
    fi
    if grep -q "slot 15 Vacant offset 120" "$dest"; then
      echo "error: dest Vacant still at slot 15 offset 120: $dest" >&2
      exit 1
    fi
    if grep -q "slot 16 Vacant offset 128" "$dest"; then
      echo "error: dest Vacant still at slot 16 offset 128: $dest" >&2
      exit 1
    fi
    if grep -q "slot 17 Vacant offset 136" "$dest"; then
      echo "error: dest Vacant still at slot 17 offset 136: $dest" >&2
      exit 1
    fi
    if grep -q "slot 11 TraitVPtr offset 88" "$dest"; then
      echo "error: dest TraitVPtr still at slot 11 offset 88: $dest" >&2
      exit 1
    fi
    if grep -q "slot 12 TraitVPtr offset 96" "$dest"; then
      echo "error: dest TraitVPtr still at slot 12 offset 96: $dest" >&2
      exit 1
    fi
    if grep -q "slot 13 TraitVPtr offset 104" "$dest"; then
      echo "error: dest TraitVPtr still at slot 13 offset 104: $dest" >&2
      exit 1
    fi
    if grep -q "slot 14 TraitVPtr offset 112" "$dest"; then
      echo "error: dest TraitVPtr still at slot 14 offset 112: $dest" >&2
      exit 1
    fi
    if grep -q "slot 15 TraitVPtr offset 120" "$dest"; then
      echo "error: dest TraitVPtr still at slot 15 offset 120: $dest" >&2
      exit 1
    fi
    if grep -q "slot 16 TraitVPtr offset 128" "$dest"; then
      echo "error: dest TraitVPtr still at slot 16 offset 128: $dest" >&2
      exit 1
    fi
    if grep -q "slot 17 TraitVPtr offset 136" "$dest"; then
      echo "error: dest TraitVPtr still at slot 17 offset 136: $dest" >&2
      exit 1
    fi
    if grep -q "slot 18 TraitVPtr offset 144" "$dest"; then
      echo "error: dest TraitVPtr still at slot 18 offset 144: $dest" >&2
      exit 1
    fi
    if grep -q "slot 19 TraitVPtr offset 152" "$dest"; then
      echo "error: dest TraitVPtr still at slot 19 offset 152: $dest" >&2
      exit 1
    fi
    if grep -q "slot 20 TraitVPtr offset 160" "$dest"; then
      echo "error: dest TraitVPtr still at slot 20 offset 160: $dest" >&2
      exit 1
    fi
    if grep -q "slot 21 TraitVPtr offset 168" "$dest"; then
      echo "error: dest TraitVPtr still at slot 21 offset 168: $dest" >&2
      exit 1
    fi
    if grep -q "slot 18 Vacant offset 144" "$dest"; then
      echo "error: dest Vacant still at slot 18 offset 144: $dest" >&2
      exit 1
    fi
    if grep -q "slot 19 Vacant offset 152" "$dest"; then
      echo "error: dest Vacant still at slot 19 offset 152: $dest" >&2
      exit 1
    fi
    if grep -q "slot 20 Vacant offset 160" "$dest"; then
      echo "error: dest Vacant still at slot 20 offset 160: $dest" >&2
      exit 1
    fi
    if grep -q "slot 21 Vacant offset 168" "$dest"; then
      echo "error: dest Vacant still at slot 21 offset 168: $dest" >&2
      exit 1
    fi
    if grep -q "slot 22 TraitVPtr offset 176" "$dest"; then
      echo "error: dest TraitVPtr still at slot 22 offset 176: $dest" >&2
      exit 1
    fi
    if grep -q "slot 22 Vacant offset 176" "$dest"; then
      echo "error: dest Vacant still at slot 22 offset 176: $dest" >&2
      exit 1
    fi
    if grep -q "slot 23 TraitVPtr offset 184" "$dest"; then
      echo "error: dest TraitVPtr still at slot 23 offset 184: $dest" >&2
      exit 1
    fi
    if grep -q "slot 23 Vacant offset 184" "$dest"; then
      echo "error: dest Vacant still at slot 23 offset 184: $dest" >&2
      exit 1
    fi
    if grep -q "slot 24 TraitVPtr offset 192" "$dest"; then
      echo "error: dest TraitVPtr still at slot 24 offset 192: $dest" >&2
      exit 1
    fi
    if grep -q "slot 24 Vacant offset 192" "$dest"; then
      echo "error: dest Vacant still at slot 24 offset 192: $dest" >&2
      exit 1
    fi
    if grep -q "slot 25 TraitVPtr offset 200" "$dest"; then
      echo "error: dest TraitVPtr still at slot 25 offset 200: $dest" >&2
      exit 1
    fi
    if grep -q "slot 25 Vacant offset 200" "$dest"; then
      echo "error: dest Vacant still at slot 25 offset 200: $dest" >&2
      exit 1
    fi
    if grep -q "slot 26 TraitVPtr offset 208" "$dest"; then
      echo "error: dest TraitVPtr still at slot 26 offset 208: $dest" >&2
      exit 1
    fi
    if grep -q "slot 26 Vacant offset 208" "$dest"; then
      echo "error: dest Vacant still at slot 26 offset 208: $dest" >&2
      exit 1
    fi
    if grep -q "slot 27 TraitVPtr offset 216" "$dest"; then
      echo "error: dest TraitVPtr still at slot 27 offset 216: $dest" >&2
      exit 1
    fi
    if grep -q "slot 27 Vacant offset 216" "$dest"; then
      echo "error: dest Vacant still at slot 27 offset 216: $dest" >&2
      exit 1
    fi
    if grep -q "slot 28 TraitVPtr offset 224" "$dest"; then
      echo "error: dest TraitVPtr still at slot 28 offset 224: $dest" >&2
      exit 1
    fi
    if grep -q "slot 28 Vacant offset 224" "$dest"; then
      echo "error: dest Vacant still at slot 28 offset 224: $dest" >&2
      exit 1
    fi
    if grep -q "slot 29 TraitVPtr offset 232" "$dest"; then
      echo "error: dest TraitVPtr still at slot 29 offset 232: $dest" >&2
      exit 1
    fi
    if grep -q "slot 29 Vacant offset 232" "$dest"; then
      echo "error: dest Vacant still at slot 29 offset 232: $dest" >&2
      exit 1
    fi
    if grep -q "slot 30 TraitVPtr offset 240" "$dest"; then
      echo "error: dest TraitVPtr still at slot 30 offset 240: $dest" >&2
      exit 1
    fi
    if grep -q "slot 30 Vacant offset 240" "$dest"; then
      echo "error: dest Vacant still at slot 30 offset 240: $dest" >&2
      exit 1
    fi
    if grep -q "slot 31 TraitVPtr offset 248" "$dest"; then
      echo "error: dest TraitVPtr still at slot 31 offset 248: $dest" >&2
      exit 1
    fi
    if grep -q "slot 31 Vacant offset 248" "$dest"; then
      echo "error: dest Vacant still at slot 31 offset 248: $dest" >&2
      exit 1
    fi
    if grep -q "slot 32 TraitVPtr offset 256" "$dest"; then
      echo "error: dest TraitVPtr still at slot 32 offset 256: $dest" >&2
      exit 1
    fi
    if grep -q "slot 32 Vacant offset 256" "$dest"; then
      echo "error: dest Vacant still at slot 32 offset 256: $dest" >&2
      exit 1
    fi
    if grep -q "slot 33 TraitVPtr offset 264" "$dest"; then
      echo "error: dest TraitVPtr still at slot 33 offset 264: $dest" >&2
      exit 1
    fi
    if grep -q "slot 33 Vacant offset 264" "$dest"; then
      echo "error: dest Vacant still at slot 33 offset 264: $dest" >&2
      exit 1
    fi
    if grep -q "slot 34 TraitVPtr offset 272" "$dest"; then
      echo "error: dest TraitVPtr still at slot 34 offset 272: $dest" >&2
      exit 1
    fi
    if grep -q "slot 34 Vacant offset 272" "$dest"; then
      echo "error: dest Vacant still at slot 34 offset 272: $dest" >&2
      exit 1
    fi
    if grep -q "slot 35 TraitVPtr offset 280" "$dest"; then
      echo "error: dest TraitVPtr still at slot 35 offset 280: $dest" >&2
      exit 1
    fi
    if grep -q "slot 35 Vacant offset 280" "$dest"; then
      echo "error: dest Vacant still at slot 35 offset 280: $dest" >&2
      exit 1
    fi
    if grep -q "slot 36 TraitVPtr offset 288" "$dest"; then
      echo "error: dest TraitVPtr still at slot 36 offset 288: $dest" >&2
      exit 1
    fi
    if grep -q "slot 36 Vacant offset 288" "$dest"; then
      echo "error: dest Vacant still at slot 36 offset 288: $dest" >&2
      exit 1
    fi
    if grep -q "slot 37 Vacant offset 296" "$dest"; then
      echo "error: dest Vacant still at slot 37 offset 296: $dest" >&2
      exit 1
    fi
    if grep -q "slot 37 TraitVPtr offset 296" "$dest"; then
      echo "error: dest TraitVPtr still at slot 37 offset 296: $dest" >&2
      exit 1
    fi
    if grep -q "slot 38 TraitVPtr offset 304" "$dest"; then
      echo "error: dest TraitVPtr still at slot 38 offset 304: $dest" >&2
      exit 1
    fi
    if grep -q "slot 38 Vacant offset 304" "$dest"; then
      echo "error: dest Vacant still at slot 38 offset 304: $dest" >&2
      exit 1
    fi
    if grep -q "slot 39 TraitVPtr offset 312" "$dest"; then
      echo "error: dest TraitVPtr still at slot 39 offset 312: $dest" >&2
      exit 1
    fi
    if grep -q "slot 39 Vacant offset 312" "$dest"; then
      echo "error: dest Vacant still at slot 39 offset 312: $dest" >&2
      exit 1
    fi
    if grep -q "slot 40 TraitVPtr offset 320" "$dest"; then
      echo "error: dest TraitVPtr still at slot 40 offset 320: $dest" >&2
      exit 1
    fi
    if grep -q "slot 40 Vacant offset 320" "$dest"; then
      echo "error: dest Vacant still at slot 40 offset 320: $dest" >&2
      exit 1
    fi
    if grep -q "slot 41 TraitVPtr offset 328" "$dest"; then
      echo "error: dest TraitVPtr still at slot 41 offset 328: $dest" >&2
      exit 1
    fi
    if grep -q "slot 41 Vacant offset 328" "$dest"; then
      echo "error: dest Vacant still at slot 41 offset 328: $dest" >&2
      exit 1
    fi
    if grep -q "slot 42 TraitVPtr offset 336" "$dest"; then
      echo "error: dest TraitVPtr still at slot 42 offset 336: $dest" >&2
      exit 1
    fi
    if grep -q "slot 42 Vacant offset 336" "$dest"; then
      echo "error: dest Vacant still at slot 42 offset 336: $dest" >&2
      exit 1
    fi
    if grep -q "slot 43 TraitVPtr offset 344" "$dest"; then
      echo "error: dest TraitVPtr still at slot 43 offset 344: $dest" >&2
      exit 1
    fi
    if grep -q "slot 43 Vacant offset 344" "$dest"; then
      echo "error: dest Vacant still at slot 43 offset 344: $dest" >&2
      exit 1
    fi
    if grep -q "slot 44 TraitVPtr offset 352" "$dest"; then
      echo "error: dest TraitVPtr still at slot 44 offset 352: $dest" >&2
      exit 1
    fi
    if grep -q "slot 44 Vacant offset 352" "$dest"; then
      echo "error: dest Vacant still at slot 44 offset 352: $dest" >&2
      exit 1
    fi
    if grep -q "slot 45 TraitVPtr offset 360" "$dest"; then
      echo "error: dest TraitVPtr still at slot 45 offset 360: $dest" >&2
      exit 1
    fi
    if grep -q "slot 45 Vacant offset 360" "$dest"; then
      echo "error: dest Vacant still at slot 45 offset 360: $dest" >&2
      exit 1
    fi
    if grep -q "slot 46 TraitVPtr offset 368" "$dest"; then
      echo "error: dest TraitVPtr still at slot 46 offset 368: $dest" >&2
      exit 1
    fi
    if grep -q "slot 46 Vacant offset 368" "$dest"; then
      echo "error: dest Vacant still at slot 46 offset 368: $dest" >&2
      exit 1
    fi
    if grep -q "slot 47 TraitVPtr offset 376" "$dest"; then
      echo "error: dest TraitVPtr still at slot 47 offset 376: $dest" >&2
      exit 1
    fi
    if grep -q "slot 47 Vacant offset 376" "$dest"; then
      echo "error: dest Vacant still at slot 47 offset 376: $dest" >&2
      exit 1
    fi
    if grep -q "slot 48 TraitVPtr offset 384" "$dest"; then
      echo "error: dest TraitVPtr still at slot 48 offset 384: $dest" >&2
      exit 1
    fi
    if grep -q "slot 48 Vacant offset 384" "$dest"; then
      echo "error: dest Vacant still at slot 48 offset 384: $dest" >&2
      exit 1
    fi
    if grep -q "slot 49 TraitVPtr offset 392" "$dest"; then
      echo "error: dest TraitVPtr still at slot 49 offset 392: $dest" >&2
      exit 1
    fi
    if grep -q "slot 49 Vacant offset 392" "$dest"; then
      echo "error: dest Vacant still at slot 49 offset 392: $dest" >&2
      exit 1
    fi
    if grep -q "slot 50 TraitVPtr offset 400" "$dest"; then
      echo "error: dest TraitVPtr still at slot 50 offset 400: $dest" >&2
      exit 1
    fi
    if grep -q "slot 50 Vacant offset 400" "$dest"; then
      echo "error: dest Vacant still at slot 50 offset 400: $dest" >&2
      exit 1
    fi
    if grep -q "slot 51 TraitVPtr offset 408" "$dest"; then
      echo "error: dest TraitVPtr still at slot 51 offset 408: $dest" >&2
      exit 1
    fi
    if grep -q "slot 51 Vacant offset 408" "$dest"; then
      echo "error: dest Vacant still at slot 51 offset 408: $dest" >&2
      exit 1
    fi
    if grep -q "slot 52 TraitVPtr offset 416" "$dest"; then
      echo "error: dest TraitVPtr still at slot 52 offset 416: $dest" >&2
      exit 1
    fi
    if grep -q "slot 52 Vacant offset 416" "$dest"; then
      echo "error: dest Vacant still at slot 52 offset 416: $dest" >&2
      exit 1
    fi
    if grep -q "slot 53 TraitVPtr offset 424" "$dest"; then
      echo "error: dest TraitVPtr still at slot 53 offset 424: $dest" >&2
      exit 1
    fi
    if grep -q "slot 53 Vacant offset 424" "$dest"; then
      echo "error: dest Vacant still at slot 53 offset 424: $dest" >&2
      exit 1
    fi
    if grep -q "slot 54 TraitVPtr offset 432" "$dest"; then
      echo "error: dest TraitVPtr still at slot 54 offset 432: $dest" >&2
      exit 1
    fi
    if grep -q "slot 54 Vacant offset 432" "$dest"; then
      echo "error: dest Vacant still at slot 54 offset 432: $dest" >&2
      exit 1
    fi
    if grep -q "slot 55 TraitVPtr offset 440" "$dest"; then
      echo "error: dest TraitVPtr still at slot 55 offset 440: $dest" >&2
      exit 1
    fi
    if grep -q "slot 55 Vacant offset 440" "$dest"; then
      echo "error: dest Vacant still at slot 55 offset 440: $dest" >&2
      exit 1
    fi
    if grep -q "slot 56 TraitVPtr offset 448" "$dest"; then
      echo "error: dest TraitVPtr still at slot 56 offset 448: $dest" >&2
      exit 1
    fi
    if grep -q "slot 56 Vacant offset 448" "$dest"; then
      echo "error: dest Vacant still at slot 56 offset 448: $dest" >&2
      exit 1
    fi
    if grep -q "slot 57 TraitVPtr offset 456" "$dest"; then
      echo "error: dest TraitVPtr still at slot 57 offset 456: $dest" >&2
      exit 1
    fi
    if grep -q "slot 57 Vacant offset 456" "$dest"; then
      echo "error: dest Vacant still at slot 57 offset 456: $dest" >&2
      exit 1
    fi
    if grep -q "slot 58 TraitVPtr offset 464" "$dest"; then
      echo "error: dest TraitVPtr still at slot 58 offset 464: $dest" >&2
      exit 1
    fi
    if grep -q "slot 58 Vacant offset 464" "$dest"; then
      echo "error: dest Vacant still at slot 58 offset 464: $dest" >&2
      exit 1
    fi
    if grep -q "slot 59 TraitVPtr offset 472" "$dest"; then
      echo "error: dest TraitVPtr still at slot 59 offset 472: $dest" >&2
      exit 1
    fi
    if grep -q "slot 59 Vacant offset 472" "$dest"; then
      echo "error: dest Vacant still at slot 59 offset 472: $dest" >&2
      exit 1
    fi
    if grep -q "slot 60 TraitVPtr offset 480" "$dest"; then
      echo "error: dest TraitVPtr still at slot 60 offset 480: $dest" >&2
      exit 1
    fi
    if grep -q "slot 60 Vacant offset 480" "$dest"; then
      echo "error: dest Vacant still at slot 60 offset 480: $dest" >&2
      exit 1
    fi
    if grep -q "slot 61 TraitVPtr offset 488" "$dest"; then
      echo "error: dest TraitVPtr still at slot 61 offset 488: $dest" >&2
      exit 1
    fi
    if grep -q "slot 61 Vacant offset 488" "$dest"; then
      echo "error: dest Vacant still at slot 61 offset 488: $dest" >&2
      exit 1
    fi
    if grep -q "slot 62 TraitVPtr offset 496" "$dest"; then
      echo "error: dest TraitVPtr still at slot 62 offset 496: $dest" >&2
      exit 1
    fi
    if grep -q "slot 62 Vacant offset 496" "$dest"; then
      echo "error: dest Vacant still at slot 62 offset 496: $dest" >&2
      exit 1
    fi
    if grep -q "slot 63 TraitVPtr offset 504" "$dest"; then
      echo "error: dest TraitVPtr still at slot 63 offset 504: $dest" >&2
      exit 1
    fi
    if grep -q "slot 63 Vacant offset 504" "$dest"; then
      echo "error: dest Vacant still at slot 63 offset 504: $dest" >&2
      exit 1
    fi
    if grep -q "slot 64 TraitVPtr offset 512" "$dest"; then
      echo "error: dest TraitVPtr still at slot 64 offset 512: $dest" >&2
      exit 1
    fi
    if grep -q "slot 64 Vacant offset 512" "$dest"; then
      echo "error: dest Vacant still at slot 64 offset 512: $dest" >&2
      exit 1
    fi
    if grep -q "slot 65 TraitVPtr offset 520" "$dest"; then
      echo "error: dest TraitVPtr still at slot 65 offset 520: $dest" >&2
      exit 1
    fi
    if grep -q "slot 65 Vacant offset 520" "$dest"; then
      echo "error: dest Vacant still at slot 65 offset 520: $dest" >&2
      exit 1
    fi
    if grep -q "slot 66 TraitVPtr offset 528" "$dest"; then
      echo "error: dest TraitVPtr still at slot 66 offset 528: $dest" >&2
      exit 1
    fi
    if grep -q "slot 66 Vacant offset 528" "$dest"; then
      echo "error: dest Vacant still at slot 66 offset 528: $dest" >&2
      exit 1
    fi
    if grep -q "slot 67 TraitVPtr offset 536" "$dest"; then
      echo "error: dest TraitVPtr still at slot 67 offset 536: $dest" >&2
      exit 1
    fi
    if grep -q "slot 67 Vacant offset 536" "$dest"; then
      echo "error: dest Vacant still at slot 67 offset 536: $dest" >&2
      exit 1
    fi
    if grep -q "slot 68 TraitVPtr offset 544" "$dest"; then
      echo "error: dest TraitVPtr still at slot 68 offset 544: $dest" >&2
      exit 1
    fi
    if grep -q "slot 68 Vacant offset 544" "$dest"; then
      echo "error: dest Vacant still at slot 68 offset 544: $dest" >&2
      exit 1
    fi
    if grep -q "slot 69 TraitVPtr offset 552" "$dest"; then
      echo "error: dest TraitVPtr still at slot 69 offset 552: $dest" >&2
      exit 1
    fi
    if grep -q "slot 69 Vacant offset 552" "$dest"; then
      echo "error: dest Vacant still at slot 69 offset 552: $dest" >&2
      exit 1
    fi
    if grep -q "slot 70 TraitVPtr offset 560" "$dest"; then
      echo "error: dest TraitVPtr still at slot 70 offset 560: $dest" >&2
      exit 1
    fi
    if grep -q "slot 70 Vacant offset 560" "$dest"; then
      echo "error: dest Vacant still at slot 70 offset 560: $dest" >&2
      exit 1
    fi
    if grep -q "slot 71 TraitVPtr offset 568" "$dest"; then
      echo "error: dest TraitVPtr still at slot 71 offset 568: $dest" >&2
      exit 1
    fi
    if grep -q "slot 71 Vacant offset 568" "$dest"; then
      echo "error: dest Vacant still at slot 71 offset 568: $dest" >&2
      exit 1
    fi
    if grep -q "slot 72 TraitVPtr offset 576" "$dest"; then
      echo "error: dest TraitVPtr still at slot 72 offset 576: $dest" >&2
      exit 1
    fi
    if grep -q "slot 73 Vacant offset 584" "$dest"; then
      echo "error: dest Vacant still at slot 73 offset 584: $dest" >&2
      exit 1
    fi
    if grep -q "slot 74 TraitVPtr offset 592" "$dest"; then
      echo "error: dest TraitVPtr still at slot 74 offset 592: $dest" >&2
      exit 1
    fi
    if grep -q "slot 74 Vacant offset 592" "$dest"; then
      echo "error: dest Vacant still at slot 74 offset 592: $dest" >&2
      exit 1
    fi
    if grep -q "slot 75 TraitVPtr offset 600" "$dest"; then
      echo "error: dest TraitVPtr still at slot 75 offset 600: $dest" >&2
      exit 1
    fi
    if grep -q "slot 75 Vacant offset 600" "$dest"; then
      echo "error: dest Vacant still at slot 75 offset 600: $dest" >&2
      exit 1
    fi
    if grep -q "slot 76 TraitVPtr offset 608" "$dest"; then
      echo "error: dest TraitVPtr still at slot 76 offset 608: $dest" >&2
      exit 1
    fi
    if grep -q "slot 76 Vacant offset 608" "$dest"; then
      echo "error: dest Vacant still at slot 76 offset 608: $dest" >&2
      exit 1
    fi
    if grep -q "slot 77 TraitVPtr offset 616" "$dest"; then
      echo "error: dest TraitVPtr still at slot 77 offset 616: $dest" >&2
      exit 1
    fi
    if grep -q "slot 77 Vacant offset 616" "$dest"; then
      echo "error: dest Vacant still at slot 77 offset 616: $dest" >&2
      exit 1
    fi
    if grep -q "slot 78 TraitVPtr offset 624" "$dest"; then
      echo "error: dest TraitVPtr still at slot 78 offset 624: $dest" >&2
      exit 1
    fi
    if grep -q "slot 78 Vacant offset 624" "$dest"; then
      echo "error: dest Vacant still at slot 78 offset 624: $dest" >&2
      exit 1
    fi
    if grep -q "slot 79 TraitVPtr offset 632" "$dest"; then
      echo "error: dest TraitVPtr still at slot 79 offset 632: $dest" >&2
      exit 1
    fi
    if grep -q "slot 79 Vacant offset 632" "$dest"; then
      echo "error: dest Vacant still at slot 79 offset 632: $dest" >&2
      exit 1
    fi
    if grep -q "slot 80 TraitVPtr offset 640" "$dest"; then
      echo "error: dest TraitVPtr still at slot 80 offset 640: $dest" >&2
      exit 1
    fi
    if grep -q "slot 80 Vacant offset 640" "$dest"; then
      echo "error: dest Vacant still at slot 80 offset 640: $dest" >&2
      exit 1
    fi
    if grep -q "slot 81 TraitVPtr offset 648" "$dest"; then
      echo "error: dest TraitVPtr still at slot 81 offset 648: $dest" >&2
      exit 1
    fi
    if grep -q "slot 81 Vacant offset 648" "$dest"; then
      echo "error: dest Vacant still at slot 81 offset 648: $dest" >&2
      exit 1
    fi
    if grep -q "slot 82 TraitVPtr offset 656" "$dest"; then
      echo "error: dest TraitVPtr still at slot 82 offset 656: $dest" >&2
      exit 1
    fi
    if grep -q "slot 82 Vacant offset 656" "$dest"; then
      echo "error: dest Vacant still at slot 82 offset 656: $dest" >&2
      exit 1
    fi
    if grep -q "slot 83 TraitVPtr offset 664" "$dest"; then
      echo "error: dest TraitVPtr still at slot 83 offset 664: $dest" >&2
      exit 1
    fi
    if grep -q "slot 83 Vacant offset 664" "$dest"; then
      echo "error: dest Vacant still at slot 83 offset 664: $dest" >&2
      exit 1
    fi
    if grep -q "slot 84 TraitVPtr offset 672" "$dest"; then
      echo "error: dest TraitVPtr still at slot 84 offset 672: $dest" >&2
      exit 1
    fi
    if grep -q "slot 84 Vacant offset 672" "$dest"; then
      echo "error: dest Vacant still at slot 84 offset 672: $dest" >&2
      exit 1
    fi
    if grep -q "slot 85 TraitVPtr offset 680" "$dest"; then
      echo "error: dest TraitVPtr still at slot 85 offset 680: $dest" >&2
      exit 1
    fi
    if grep -q "slot 85 Vacant offset 680" "$dest"; then
      echo "error: dest Vacant still at slot 85 offset 680: $dest" >&2
      exit 1
    fi
    if grep -q "slot 86 TraitVPtr offset 688" "$dest"; then
      echo "error: dest TraitVPtr still at slot 86 offset 688: $dest" >&2
      exit 1
    fi
    if grep -q "slot 86 Vacant offset 688" "$dest"; then
      echo "error: dest Vacant still at slot 86 offset 688: $dest" >&2
      exit 1
    fi
    if grep -q "slot 87 TraitVPtr offset 696" "$dest"; then
      echo "error: dest TraitVPtr still at slot 87 offset 696: $dest" >&2
      exit 1
    fi
    if grep -q "slot 87 Vacant offset 696" "$dest"; then
      echo "error: dest Vacant still at slot 87 offset 696: $dest" >&2
      exit 1
    fi
    if grep -q "slot 88 TraitVPtr offset 704" "$dest"; then
      echo "error: dest TraitVPtr still at slot 88 offset 704: $dest" >&2
      exit 1
    fi
    if grep -q "slot 88 Vacant offset 704" "$dest"; then
      echo "error: dest Vacant still at slot 88 offset 704: $dest" >&2
      exit 1
    fi
    if grep -q "slot 89 TraitVPtr offset 712" "$dest"; then
      echo "error: dest TraitVPtr still at slot 89 offset 712: $dest" >&2
      exit 1
    fi
    if grep -q "slot 89 Vacant offset 712" "$dest"; then
      echo "error: dest Vacant still at slot 89 offset 712: $dest" >&2
      exit 1
    fi
    if grep -q "slot 90 TraitVPtr offset 720" "$dest"; then
      echo "error: dest TraitVPtr still at slot 90 offset 720: $dest" >&2
      exit 1
    fi
    if grep -q "slot 90 Vacant offset 720" "$dest"; then
      echo "error: dest Vacant still at slot 90 offset 720: $dest" >&2
      exit 1
    fi
    if grep -q "slot 91 TraitVPtr offset 728" "$dest"; then
      echo "error: dest TraitVPtr still at slot 91 offset 728: $dest" >&2
      exit 1
    fi
    if grep -q "slot 91 Vacant offset 728" "$dest"; then
      echo "error: dest Vacant still at slot 91 offset 728: $dest" >&2
      exit 1
    fi
    if grep -q "slot 92 TraitVPtr offset 736" "$dest"; then
      echo "error: dest TraitVPtr still at slot 92 offset 736: $dest" >&2
      exit 1
    fi
    if grep -q "slot 92 Vacant offset 736" "$dest"; then
      echo "error: dest Vacant still at slot 92 offset 736: $dest" >&2
      exit 1
    fi
    if grep -q "slot 93 TraitVPtr offset 744" "$dest"; then
      echo "error: dest TraitVPtr still at slot 93 offset 744: $dest" >&2
      exit 1
    fi
    if grep -q "slot 93 Vacant offset 744" "$dest"; then
      echo "error: dest Vacant still at slot 93 offset 744: $dest" >&2
      exit 1
    fi
    if grep -q "slot 94 TraitVPtr offset 752" "$dest"; then
      echo "error: dest TraitVPtr still at slot 94 offset 752: $dest" >&2
      exit 1
    fi
    if grep -q "slot 94 Vacant offset 752" "$dest"; then
      echo "error: dest Vacant still at slot 94 offset 752: $dest" >&2
      exit 1
    fi
    if grep -q "slot 95 TraitVPtr offset 760" "$dest"; then
      echo "error: dest TraitVPtr still at slot 95 offset 760: $dest" >&2
      exit 1
    fi
    if grep -q "slot 95 Vacant offset 760" "$dest"; then
      echo "error: dest Vacant still at slot 95 offset 760: $dest" >&2
      exit 1
    fi
    if grep -q "slot 96 TraitVPtr offset 768" "$dest"; then
      echo "error: dest TraitVPtr still at slot 96 offset 768: $dest" >&2
      exit 1
    fi
    if grep -q "slot 96 Vacant offset 768" "$dest"; then
      echo "error: dest Vacant still at slot 96 offset 768: $dest" >&2
      exit 1
    fi
    if grep -q "slot 97 TraitVPtr offset 776" "$dest"; then
      echo "error: dest TraitVPtr still at slot 97 offset 776: $dest" >&2
      exit 1
    fi
    if grep -q "slot 97 Vacant offset 776" "$dest"; then
      echo "error: dest Vacant still at slot 97 offset 776: $dest" >&2
      exit 1
    fi
    if grep -q "slot 98 TraitVPtr offset 784" "$dest"; then
      echo "error: dest TraitVPtr still at slot 98 offset 784: $dest" >&2
      exit 1
    fi
    if grep -q "slot 98 Vacant offset 784" "$dest"; then
      echo "error: dest Vacant still at slot 98 offset 784: $dest" >&2
      exit 1
    fi
    if grep -q "slot 99 TraitVPtr offset 792" "$dest"; then
      echo "error: dest TraitVPtr still at slot 99 offset 792: $dest" >&2
      exit 1
    fi
    if grep -q "slot 99 Vacant offset 792" "$dest"; then
      echo "error: dest Vacant still at slot 99 offset 792: $dest" >&2
      exit 1
    fi
    if grep -q "slot 100 TraitVPtr offset 800" "$dest"; then
      echo "error: dest TraitVPtr still at slot 100 offset 800: $dest" >&2
      exit 1
    fi
    if grep -q "slot 100 Vacant offset 800" "$dest"; then
      echo "error: dest Vacant still at slot 100 offset 800: $dest" >&2
      exit 1
    fi
    if grep -q "slot 101 TraitVPtr offset 808" "$dest"; then
      echo "error: dest TraitVPtr still at slot 101 offset 808: $dest" >&2
      exit 1
    fi
    if grep -q "slot 101 Vacant offset 808" "$dest"; then
      echo "error: dest Vacant still at slot 101 offset 808: $dest" >&2
      exit 1
    fi
    if grep -q "slot 102 TraitVPtr offset 816" "$dest"; then
      echo "error: dest TraitVPtr still at slot 102 offset 816: $dest" >&2
      exit 1
    fi
    if grep -q "slot 102 Vacant offset 816" "$dest"; then
      echo "error: dest Vacant still at slot 102 offset 816: $dest" >&2
      exit 1
    fi
    if grep -q "slot 103 TraitVPtr offset 824" "$dest"; then
      echo "error: dest TraitVPtr still at slot 103 offset 824: $dest" >&2
      exit 1
    fi
    if grep -q "slot 103 Vacant offset 824" "$dest"; then
      echo "error: dest Vacant still at slot 103 offset 824: $dest" >&2
      exit 1
    fi
    if grep -q "slot 104 TraitVPtr offset 832" "$dest"; then
      echo "error: dest TraitVPtr still at slot 104 offset 832: $dest" >&2
      exit 1
    fi
    if grep -q "slot 104 Vacant offset 832" "$dest"; then
      echo "error: dest Vacant still at slot 104 offset 832: $dest" >&2
      exit 1
    fi
    if grep -q "slot 105 TraitVPtr offset 840" "$dest"; then
      echo "error: dest TraitVPtr still at slot 105 offset 840: $dest" >&2
      exit 1
    fi
    if grep -q "slot 105 Vacant offset 840" "$dest"; then
      echo "error: dest Vacant still at slot 105 offset 840: $dest" >&2
      exit 1
    fi
    if grep -q "slot 106 TraitVPtr offset 848" "$dest"; then
      echo "error: dest TraitVPtr still at slot 106 offset 848: $dest" >&2
      exit 1
    fi
    if grep -q "slot 106 Vacant offset 848" "$dest"; then
      echo "error: dest Vacant still at slot 106 offset 848: $dest" >&2
      exit 1
    fi
    if grep -q "slot 107 TraitVPtr offset 856" "$dest"; then
      echo "error: dest TraitVPtr still at slot 107 offset 856: $dest" >&2
      exit 1
    fi
    if grep -q "slot 107 Vacant offset 856" "$dest"; then
      echo "error: dest Vacant still at slot 107 offset 856: $dest" >&2
      exit 1
    fi
    if grep -q "slot 108 TraitVPtr offset 864" "$dest"; then
      echo "error: dest TraitVPtr still at slot 108 offset 864: $dest" >&2
      exit 1
    fi
    if grep -q "slot 108 Vacant offset 864" "$dest"; then
      echo "error: dest Vacant still at slot 108 offset 864: $dest" >&2
      exit 1
    fi
    if grep -q "slot 109 TraitVPtr offset 872" "$dest"; then
      echo "error: dest TraitVPtr still at slot 109 offset 872: $dest" >&2
      exit 1
    fi
    if grep -q "slot 109 Vacant offset 872" "$dest"; then
      echo "error: dest Vacant still at slot 109 offset 872: $dest" >&2
      exit 1
    fi
    if grep -q "slot 110 TraitVPtr offset 880" "$dest"; then
      echo "error: dest TraitVPtr still at slot 110 offset 880: $dest" >&2
      exit 1
    fi
    if grep -q "slot 110 Vacant offset 880" "$dest"; then
      echo "error: dest Vacant still at slot 110 offset 880: $dest" >&2
      exit 1
    fi
    if grep -q "slot 111 TraitVPtr offset 888" "$dest"; then
      echo "error: dest TraitVPtr still at slot 111 offset 888: $dest" >&2
      exit 1
    fi
    if grep -q "slot 111 Vacant offset 888" "$dest"; then
      echo "error: dest Vacant still at slot 111 offset 888: $dest" >&2
      exit 1
    fi
    if grep -q "slot 112 TraitVPtr offset 896" "$dest"; then
      echo "error: dest TraitVPtr still at slot 112 offset 896: $dest" >&2
      exit 1
    fi
    if grep -q "slot 112 Vacant offset 896" "$dest"; then
      echo "error: dest Vacant still at slot 112 offset 896: $dest" >&2
      exit 1
    fi
    if grep -q "slot 113 TraitVPtr offset 904" "$dest"; then
      echo "error: dest TraitVPtr still at slot 113 offset 904: $dest" >&2
      exit 1
    fi
    if grep -q "slot 113 Vacant offset 904" "$dest"; then
      echo "error: dest Vacant still at slot 113 offset 904: $dest" >&2
      exit 1
    fi
    if grep -q "slot 114 TraitVPtr offset 912" "$dest"; then
      echo "error: dest TraitVPtr still at slot 114 offset 912: $dest" >&2
      exit 1
    fi
    if grep -q "slot 114 Vacant offset 912" "$dest"; then
      echo "error: dest Vacant still at slot 114 offset 912: $dest" >&2
      exit 1
    fi
    if grep -q "slot 115 TraitVPtr offset 920" "$dest"; then
      echo "error: dest TraitVPtr still at slot 115 offset 920: $dest" >&2
      exit 1
    fi
    if grep -q "slot 115 Vacant offset 920" "$dest"; then
      echo "error: dest Vacant still at slot 115 offset 920: $dest" >&2
      exit 1
    fi
    if grep -q "slot 116 TraitVPtr offset 928" "$dest"; then
      echo "error: dest TraitVPtr still at slot 116 offset 928: $dest" >&2
      exit 1
    fi
    if grep -q "slot 116 Vacant offset 928" "$dest"; then
      echo "error: dest Vacant still at slot 116 offset 928: $dest" >&2
      exit 1
    fi
    if grep -q "slot 117 TraitVPtr offset 936" "$dest"; then
      echo "error: dest TraitVPtr still at slot 117 offset 936: $dest" >&2
      exit 1
    fi
    if grep -q "slot 117 Vacant offset 936" "$dest"; then
      echo "error: dest Vacant still at slot 117 offset 936: $dest" >&2
      exit 1
    fi
    if grep -q "slot 118 TraitVPtr offset 944" "$dest"; then
      echo "error: dest TraitVPtr still at slot 118 offset 944: $dest" >&2
      exit 1
    fi
    if grep -q "slot 118 Vacant offset 944" "$dest"; then
      echo "error: dest Vacant still at slot 118 offset 944: $dest" >&2
      exit 1
    fi
    if grep -q "slot 119 TraitVPtr offset 952" "$dest"; then
      echo "error: dest TraitVPtr still at slot 119 offset 952: $dest" >&2
      exit 1
    fi
    if grep -q "slot 119 Vacant offset 952" "$dest"; then
      echo "error: dest Vacant still at slot 119 offset 952: $dest" >&2
      exit 1
    fi
    if grep -q "slot 120 TraitVPtr offset 960" "$dest"; then
      echo "error: dest TraitVPtr still at slot 120 offset 960: $dest" >&2
      exit 1
    fi
    if grep -q "slot 120 Vacant offset 960" "$dest"; then
      echo "error: dest Vacant still at slot 120 offset 960: $dest" >&2
      exit 1
    fi
    if grep -q "slot 121 TraitVPtr offset 968" "$dest"; then
      echo "error: dest TraitVPtr still at slot 121 offset 968: $dest" >&2
      exit 1
    fi
    if grep -q "slot 121 Vacant offset 968" "$dest"; then
      echo "error: dest Vacant still at slot 121 offset 968: $dest" >&2
      exit 1
    fi
    if grep -q "slot 122 TraitVPtr offset 976" "$dest"; then
      echo "error: dest TraitVPtr still at slot 122 offset 976: $dest" >&2
      exit 1
    fi
    if grep -q "slot 123 Vacant offset 984" "$dest"; then
      echo "error: dest Vacant still at slot 123 offset 984: $dest" >&2
      exit 1
    fi
    if grep -q "slot 123 TraitVPtr offset 984" "$dest"; then
      echo "error: dest TraitVPtr still at slot 123 offset 984: $dest" >&2
      exit 1
    fi
    if grep -q "slot 124 TraitVPtr offset 992" "$dest"; then
      echo "error: dest TraitVPtr still at slot 124 offset 992: $dest" >&2
      exit 1
    fi
    if grep -q "slot 124 Vacant offset 992" "$dest"; then
      echo "error: dest Vacant still at slot 124 offset 992: $dest" >&2
      exit 1
    fi
    if grep -q "slot 125 TraitVPtr offset 1000" "$dest"; then
      echo "error: dest TraitVPtr still at slot 125 offset 1000: $dest" >&2
      exit 1
    fi
    if grep -q "slot 125 Vacant offset 1000" "$dest"; then
      echo "error: dest Vacant still at slot 125 offset 1000: $dest" >&2
      exit 1
    fi
    if grep -q "slot 126 TraitVPtr offset 1008" "$dest"; then
      echo "error: dest TraitVPtr still at slot 126 offset 1008: $dest" >&2
      exit 1
    fi
    if grep -q "slot 126 Vacant offset 1008" "$dest"; then
      echo "error: dest Vacant still at slot 126 offset 1008: $dest" >&2
      exit 1
    fi
    if grep -q "slot 127 TraitVPtr offset 1016" "$dest"; then
      echo "error: dest TraitVPtr still at slot 127 offset 1016: $dest" >&2
      exit 1
    fi
    if grep -q "slot 127 Vacant offset 1016" "$dest"; then
      echo "error: dest Vacant still at slot 127 offset 1016: $dest" >&2
      exit 1
    fi
    if grep -q "slot 128 TraitVPtr offset 1024" "$dest"; then
      echo "error: dest TraitVPtr still at slot 128 offset 1024: $dest" >&2
      exit 1
    fi
    if grep -q "slot 128 Vacant offset 1024" "$dest"; then
      echo "error: dest Vacant still at slot 128 offset 1024: $dest" >&2
      exit 1
    fi
    if grep -q "slot 129 TraitVPtr offset 1032" "$dest"; then
      echo "error: dest TraitVPtr still at slot 129 offset 1032: $dest" >&2
      exit 1
    fi
    if grep -q "slot 129 Vacant offset 1032" "$dest"; then
      echo "error: dest Vacant still at slot 129 offset 1032: $dest" >&2
      exit 1
    fi
    if grep -q "slot 130 TraitVPtr offset 1040" "$dest"; then
      echo "error: dest TraitVPtr still at slot 130 offset 1040: $dest" >&2
      exit 1
    fi
    if grep -q "slot 130 Vacant offset 1040" "$dest"; then
      echo "error: dest Vacant still at slot 130 offset 1040: $dest" >&2
      exit 1
    fi
    if grep -q "slot 131 TraitVPtr offset 1048" "$dest"; then
      echo "error: dest TraitVPtr still at slot 131 offset 1048: $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 131 Vacant offset 1048" "$dest"; then
      echo "error: dest missing Vacant slot 131 offset 1048: $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 132 TraitVPtr offset 1056" "$dest"; then
      echo "error: dest missing TraitVPtr slot 132 offset 1056: $dest" >&2
      exit 1
    fi
    if grep -q "101 slots, 808 bytes" "$dest"; then
      echo "error: dest still 101 slots / 808 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "102 slots, 816 bytes" "$dest"; then
      echo "error: dest still 102 slots / 816 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "103 slots, 824 bytes" "$dest"; then
      echo "error: dest still 103 slots / 824 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "104 slots, 832 bytes" "$dest"; then
      echo "error: dest still 104 slots / 832 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "105 slots, 840 bytes" "$dest"; then
      echo "error: dest still 105 slots / 840 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "106 slots, 848 bytes" "$dest"; then
      echo "error: dest still 106 slots / 848 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "107 slots, 856 bytes" "$dest"; then
      echo "error: dest still 107 slots / 856 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "108 slots, 864 bytes" "$dest"; then
      echo "error: dest still 108 slots / 864 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "109 slots, 872 bytes" "$dest"; then
      echo "error: dest still 109 slots / 872 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "110 slots, 880 bytes" "$dest"; then
      echo "error: dest still 110 slots / 880 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "111 slots, 888 bytes" "$dest"; then
      echo "error: dest still 111 slots / 888 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "112 slots, 896 bytes" "$dest"; then
      echo "error: dest still 112 slots / 896 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "113 slots, 904 bytes" "$dest"; then
      echo "error: dest still 113 slots / 904 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "114 slots, 912 bytes" "$dest"; then
      echo "error: dest still 114 slots / 912 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "115 slots, 920 bytes" "$dest"; then
      echo "error: dest still 115 slots / 920 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "116 slots, 928 bytes" "$dest"; then
      echo "error: dest still 116 slots / 928 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "117 slots, 936 bytes" "$dest"; then
      echo "error: dest still 117 slots / 936 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "118 slots, 944 bytes" "$dest"; then
      echo "error: dest still 118 slots / 944 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "119 slots, 952 bytes" "$dest"; then
      echo "error: dest still 119 slots / 952 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "120 slots, 960 bytes" "$dest"; then
      echo "error: dest still 120 slots / 960 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "121 slots, 968 bytes" "$dest"; then
      echo "error: dest still 121 slots / 968 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "122 slots, 976 bytes" "$dest"; then
      echo "error: dest still 122 slots / 976 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "123 slots, 984 bytes" "$dest"; then
      echo "error: dest still 123 slots / 984 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "124 slots, 992 bytes" "$dest"; then
      echo "error: dest still 124 slots / 992 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "125 slots, 1000 bytes" "$dest"; then
      echo "error: dest still 125 slots / 1000 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "126 slots, 1008 bytes" "$dest"; then
      echo "error: dest still 126 slots / 1008 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "127 slots, 1016 bytes" "$dest"; then
      echo "error: dest still 127 slots / 1016 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "128 slots, 1024 bytes" "$dest"; then
      echo "error: dest still 128 slots / 1024 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "129 slots, 1032 bytes" "$dest"; then
      echo "error: dest still 129 slots / 1032 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "130 slots, 1040 bytes" "$dest"; then
      echo "error: dest still 130 slots / 1040 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "131 slots, 1048 bytes" "$dest"; then
      echo "error: dest still 131 slots / 1048 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "132 slots, 1056 bytes" "$dest"; then
      echo "error: dest still 132 slots / 1056 bytes: $dest" >&2
      exit 1
    fi
    if ! grep -q "133 slots, 1064 bytes" "$dest"; then
      echo "error: dest still not 133 slots / 1064 bytes: $dest" >&2
      exit 1
    fi
    echo "llvm-trait-object-vtable: GREEN (regenerated from Lean; dest matches printer)"

# Paired check: dest must equal Lean printer; does not overwrite.
# Greppable: llvm-trait-object-vtable-check.
llvm-trait-object-vtable-check:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/TraitObjectVtable.lean"
    dest="$root/out/llvm-ir/trait-object-vtable.ll"
    echo "SLAKE_TRAIT_OBJECT_VTABLE_V0 / HOST-TRAIT-OBJECT-VTABLE"
    echo "HOST-TRAIT-OBJECT-FAT host-originated emit (walk TraitObjectFat)"
    echo "TRAIT-OBJECT-VTABLE-IR paired check (fail if dest differs)"
    if ! command -v lean >/dev/null 2>&1; then
      echo "error: lean not on PATH; llvm-trait-object-vtable-check needs host Lean" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "error: missing Lean printer $src" >&2
      exit 1
    fi
    tmp="$(mktemp)"
    trap 'rm -f "$tmp"' EXIT
    lean -R "$src_root" --run "$src" "$root" print >"$tmp"
    if ! cmp -s "$tmp" "$dest"; then
      echo "error: dest bytes differ from Lean printer: $dest" >&2
      cmp "$tmp" "$dest" >&2 || true
      exit 1
    fi
    if ! grep -q "slake_trait_object_method2" "$dest"; then
      echo "error: dest missing third Method (method2): $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method3" "$dest"; then
      echo "error: dest missing fourth Method (method3): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 6 method3 offset 48" "$dest"; then
      echo "error: dest missing method3 slot 6 offset 48: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method4" "$dest"; then
      echo "error: dest missing fifth Method (method4): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 7 method4 offset 56" "$dest"; then
      echo "error: dest missing method4 slot 7 offset 56: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method5" "$dest"; then
      echo "error: dest missing sixth Method (method5): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 8 method5 offset 64" "$dest"; then
      echo "error: dest missing method5 slot 8 offset 64: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method6" "$dest"; then
      echo "error: dest missing seventh Method (method6): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 9 method6 offset 72" "$dest"; then
      echo "error: dest missing method6 slot 9 offset 72: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method7" "$dest"; then
      echo "error: dest missing eighth Method (method7): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 10 method7 offset 80" "$dest"; then
      echo "error: dest missing method7 slot 10 offset 80: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method8" "$dest"; then
      echo "error: dest missing ninth Method (method8): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 11 method8 offset 88" "$dest"; then
      echo "error: dest missing method8 slot 11 offset 88: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method9" "$dest"; then
      echo "error: dest missing tenth Method (method9): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 12 method9 offset 96" "$dest"; then
      echo "error: dest missing method9 slot 12 offset 96: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method10" "$dest"; then
      echo "error: dest missing eleventh Method (method10): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 13 method10 offset 104" "$dest"; then
      echo "error: dest missing method10 slot 13 offset 104: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method11" "$dest"; then
      echo "error: dest missing twelfth Method (method11): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 14 method11 offset 112" "$dest"; then
      echo "error: dest missing method11 slot 14 offset 112: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method12" "$dest"; then
      echo "error: dest missing thirteenth Method (method12): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 15 method12 offset 120" "$dest"; then
      echo "error: dest missing method12 slot 15 offset 120: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method13" "$dest"; then
      echo "error: dest missing fourteenth Method (method13): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 16 method13 offset 128" "$dest"; then
      echo "error: dest missing method13 slot 16 offset 128: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method14" "$dest"; then
      echo "error: dest missing fifteenth Method (method14): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 17 method14 offset 136" "$dest"; then
      echo "error: dest missing method14 slot 17 offset 136: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method15" "$dest"; then
      echo "error: dest missing sixteenth Method (method15): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 18 method15 offset 144" "$dest"; then
      echo "error: dest missing method15 slot 18 offset 144: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method16" "$dest"; then
      echo "error: dest missing seventeenth Method (method16): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 19 method16 offset 152" "$dest"; then
      echo "error: dest missing method16 slot 19 offset 152: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method17" "$dest"; then
      echo "error: dest missing eighteenth Method (method17): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 20 method17 offset 160" "$dest"; then
      echo "error: dest missing method17 slot 20 offset 160: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method18" "$dest"; then
      echo "error: dest missing nineteenth Method (method18): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 21 method18 offset 168" "$dest"; then
      echo "error: dest missing method18 slot 21 offset 168: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method19" "$dest"; then
      echo "error: dest missing twentieth Method (method19): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 22 method19 offset 176" "$dest"; then
      echo "error: dest missing method19 slot 22 offset 176: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method20" "$dest"; then
      echo "error: dest missing twenty-first Method (method20): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 23 method20 offset 184" "$dest"; then
      echo "error: dest missing method20 slot 23 offset 184: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method21" "$dest"; then
      echo "error: dest missing twenty-second Method (method21): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 24 method21 offset 192" "$dest"; then
      echo "error: dest missing method21 slot 24 offset 192: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method22" "$dest"; then
      echo "error: dest missing twenty-third Method (method22): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 25 method22 offset 200" "$dest"; then
      echo "error: dest missing method22 slot 25 offset 200: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method23" "$dest"; then
      echo "error: dest missing twenty-fourth Method (method23): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 26 method23 offset 208" "$dest"; then
      echo "error: dest missing method23 slot 26 offset 208: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method24" "$dest"; then
      echo "error: dest missing twenty-fifth Method (method24): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 27 method24 offset 216" "$dest"; then
      echo "error: dest missing method24 slot 27 offset 216: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method25" "$dest"; then
      echo "error: dest missing twenty-sixth Method (method25): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 28 method25 offset 224" "$dest"; then
      echo "error: dest missing method25 slot 28 offset 224: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method26" "$dest"; then
      echo "error: dest missing twenty-seventh Method (method26): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 29 method26 offset 232" "$dest"; then
      echo "error: dest missing method26 slot 29 offset 232: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method27" "$dest"; then
      echo "error: dest missing twenty-eighth Method (method27): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 30 method27 offset 240" "$dest"; then
      echo "error: dest missing method27 slot 30 offset 240: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method28" "$dest"; then
      echo "error: dest missing twenty-ninth Method (method28): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 31 method28 offset 248" "$dest"; then
      echo "error: dest missing method28 slot 31 offset 248: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method29" "$dest"; then
      echo "error: dest missing thirtieth Method (method29): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 32 method29 offset 256" "$dest"; then
      echo "error: dest missing method29 slot 32 offset 256: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method30" "$dest"; then
      echo "error: dest missing thirty-first Method (method30): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 33 method30 offset 264" "$dest"; then
      echo "error: dest missing method30 slot 33 offset 264: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method31" "$dest"; then
      echo "error: dest missing thirty-second Method (method31): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 34 method31 offset 272" "$dest"; then
      echo "error: dest missing method31 slot 34 offset 272: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method32" "$dest"; then
      echo "error: dest missing thirty-third Method (method32): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 35 method32 offset 280" "$dest"; then
      echo "error: dest missing method32 slot 35 offset 280: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method33" "$dest"; then
      echo "error: dest missing thirty-fourth Method (method33): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 36 method33 offset 288" "$dest"; then
      echo "error: dest missing method33 slot 36 offset 288: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method34" "$dest"; then
      echo "error: dest missing thirty-fifth Method (method34): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 37 method34 offset 296" "$dest"; then
      echo "error: dest missing method34 slot 37 offset 296: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method35" "$dest"; then
      echo "error: dest missing thirty-sixth Method (method35): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 38 method35 offset 304" "$dest"; then
      echo "error: dest missing method35 slot 38 offset 304: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method36" "$dest"; then
      echo "error: dest missing thirty-seventh Method (method36): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 39 method36 offset 312" "$dest"; then
      echo "error: dest missing method36 slot 39 offset 312: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method37" "$dest"; then
      echo "error: dest missing thirty-eighth Method (method37): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 40 method37 offset 320" "$dest"; then
      echo "error: dest missing method37 slot 40 offset 320: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method38" "$dest"; then
      echo "error: dest missing thirty-ninth Method (method38): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 41 method38 offset 328" "$dest"; then
      echo "error: dest missing method38 slot 41 offset 328: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method39" "$dest"; then
      echo "error: dest missing fortieth Method (method39): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 42 method39 offset 336" "$dest"; then
      echo "error: dest missing method39 slot 42 offset 336: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method40" "$dest"; then
      echo "error: dest missing forty-first Method (method40): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 43 method40 offset 344" "$dest"; then
      echo "error: dest missing method40 slot 43 offset 344: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method41" "$dest"; then
      echo "error: dest missing forty-second Method (method41): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 44 method41 offset 352" "$dest"; then
      echo "error: dest missing method41 slot 44 offset 352: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method42" "$dest"; then
      echo "error: dest missing forty-third Method (method42): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 45 method42 offset 360" "$dest"; then
      echo "error: dest missing method42 slot 45 offset 360: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method43" "$dest"; then
      echo "error: dest missing forty-fourth Method (method43): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 46 method43 offset 368" "$dest"; then
      echo "error: dest missing method43 slot 46 offset 368: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method44" "$dest"; then
      echo "error: dest missing forty-fifth Method (method44): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 47 method44 offset 376" "$dest"; then
      echo "error: dest missing method44 slot 47 offset 376: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method45" "$dest"; then
      echo "error: dest missing forty-sixth Method (method45): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 48 method45 offset 384" "$dest"; then
      echo "error: dest missing method45 slot 48 offset 384: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method46" "$dest"; then
      echo "error: dest missing forty-seventh Method (method46): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 49 method46 offset 392" "$dest"; then
      echo "error: dest missing method46 slot 49 offset 392: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method47" "$dest"; then
      echo "error: dest missing forty-eighth Method (method47): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 50 method47 offset 400" "$dest"; then
      echo "error: dest missing method47 slot 50 offset 400: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method48" "$dest"; then
      echo "error: dest missing forty-ninth Method (method48): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 51 method48 offset 408" "$dest"; then
      echo "error: dest missing method48 slot 51 offset 408: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method49" "$dest"; then
      echo "error: dest missing fiftieth Method (method49): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 52 method49 offset 416" "$dest"; then
      echo "error: dest missing method49 slot 52 offset 416: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method50" "$dest"; then
      echo "error: dest missing fifty-first Method (method50): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 53 method50 offset 424" "$dest"; then
      echo "error: dest missing method50 slot 53 offset 424: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method51" "$dest"; then
      echo "error: dest missing fifty-second Method (method51): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 54 method51 offset 432" "$dest"; then
      echo "error: dest missing method51 slot 54 offset 432: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method52" "$dest"; then
      echo "error: dest missing fifty-third Method (method52): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 55 method52 offset 440" "$dest"; then
      echo "error: dest missing method52 slot 55 offset 440: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method53" "$dest"; then
      echo "error: dest missing fifty-fourth Method (method53): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 56 method53 offset 448" "$dest"; then
      echo "error: dest missing method53 slot 56 offset 448: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method54" "$dest"; then
      echo "error: dest missing fifty-fifth Method (method54): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 57 method54 offset 456" "$dest"; then
      echo "error: dest missing method54 slot 57 offset 456: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method55" "$dest"; then
      echo "error: dest missing fifty-sixth Method (method55): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 58 method55 offset 464" "$dest"; then
      echo "error: dest missing method55 slot 58 offset 464: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method56" "$dest"; then
      echo "error: dest missing fifty-seventh Method (method56): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 59 method56 offset 472" "$dest"; then
      echo "error: dest missing method56 slot 59 offset 472: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method57" "$dest"; then
      echo "error: dest missing fifty-eighth Method (method57): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 60 method57 offset 480" "$dest"; then
      echo "error: dest missing method57 slot 60 offset 480: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method58" "$dest"; then
      echo "error: dest missing fifty-ninth Method (method58): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 61 method58 offset 488" "$dest"; then
      echo "error: dest missing method58 slot 61 offset 488: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method59" "$dest"; then
      echo "error: dest missing sixtieth Method (method59): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 62 method59 offset 496" "$dest"; then
      echo "error: dest missing method59 slot 62 offset 496: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method60" "$dest"; then
      echo "error: dest missing sixty-first Method (method60): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 63 method60 offset 504" "$dest"; then
      echo "error: dest missing method60 slot 63 offset 504: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method61" "$dest"; then
      echo "error: dest missing sixty-second Method (method61): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 64 method61 offset 512" "$dest"; then
      echo "error: dest missing method61 slot 64 offset 512: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method62" "$dest"; then
      echo "error: dest missing sixty-third Method (method62): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 65 method62 offset 520" "$dest"; then
      echo "error: dest missing method62 slot 65 offset 520: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method63" "$dest"; then
      echo "error: dest missing sixty-fourth Method (method63): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 66 method63 offset 528" "$dest"; then
      echo "error: dest missing method63 slot 66 offset 528: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method64" "$dest"; then
      echo "error: dest missing sixty-fifth Method (method64): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 67 method64 offset 536" "$dest"; then
      echo "error: dest missing method64 slot 67 offset 536: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method65" "$dest"; then
      echo "error: dest missing sixty-sixth Method (method65): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 68 method65 offset 544" "$dest"; then
      echo "error: dest missing method65 slot 68 offset 544: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method66" "$dest"; then
      echo "error: dest missing sixty-seventh Method (method66): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 69 method66 offset 552" "$dest"; then
      echo "error: dest missing method66 slot 69 offset 552: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method67" "$dest"; then
      echo "error: dest missing sixty-eighth Method (method67): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 70 method67 offset 560" "$dest"; then
      echo "error: dest missing method67 slot 70 offset 560: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method68" "$dest"; then
      echo "error: dest missing sixty-ninth Method (method68): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 71 method68 offset 568" "$dest"; then
      echo "error: dest missing method68 slot 71 offset 568: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method69" "$dest"; then
      echo "error: dest missing seventieth Method (method69): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 72 method69 offset 576" "$dest"; then
      echo "error: dest missing method69 slot 72 offset 576: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method70" "$dest"; then
      echo "error: dest missing seventy-first Method (method70): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 73 method70 offset 584" "$dest"; then
      echo "error: dest missing method70 slot 73 offset 584: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method71" "$dest"; then
      echo "error: dest missing seventy-second Method (method71): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 74 method71 offset 592" "$dest"; then
      echo "error: dest missing method71 slot 74 offset 592: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method72" "$dest"; then
      echo "error: dest missing seventy-third Method (method72): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 75 method72 offset 600" "$dest"; then
      echo "error: dest missing method72 slot 75 offset 600: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method73" "$dest"; then
      echo "error: dest missing seventy-fourth Method (method73): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 76 method73 offset 608" "$dest"; then
      echo "error: dest missing method73 slot 76 offset 608: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method74" "$dest"; then
      echo "error: dest missing seventy-fifth Method (method74): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 77 method74 offset 616" "$dest"; then
      echo "error: dest missing method74 slot 77 offset 616: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method75" "$dest"; then
      echo "error: dest missing seventy-sixth Method (method75): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 78 method75 offset 624" "$dest"; then
      echo "error: dest missing method75 slot 78 offset 624: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method76" "$dest"; then
      echo "error: dest missing seventy-seventh Method (method76): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 79 method76 offset 632" "$dest"; then
      echo "error: dest missing method76 slot 79 offset 632: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method77" "$dest"; then
      echo "error: dest missing seventy-eighth Method (method77): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 80 method77 offset 640" "$dest"; then
      echo "error: dest missing method77 slot 80 offset 640: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method78" "$dest"; then
      echo "error: dest missing seventy-ninth Method (method78): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 81 method78 offset 648" "$dest"; then
      echo "error: dest missing method78 slot 81 offset 648: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method79" "$dest"; then
      echo "error: dest missing eightieth Method (method79): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 82 method79 offset 656" "$dest"; then
      echo "error: dest missing method79 slot 82 offset 656: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method80" "$dest"; then
      echo "error: dest missing eighty-first Method (method80): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 83 method80 offset 664" "$dest"; then
      echo "error: dest missing method80 slot 83 offset 664: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method81" "$dest"; then
      echo "error: dest missing eighty-second Method (method81): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 84 method81 offset 672" "$dest"; then
      echo "error: dest missing method81 slot 84 offset 672: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method82" "$dest"; then
      echo "error: dest missing eighty-third Method (method82): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 85 method82 offset 680" "$dest"; then
      echo "error: dest missing method82 slot 85 offset 680: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method83" "$dest"; then
      echo "error: dest missing eighty-fourth Method (method83): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 86 method83 offset 688" "$dest"; then
      echo "error: dest missing method83 slot 86 offset 688: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method84" "$dest"; then
      echo "error: dest missing eighty-fifth Method (method84): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 87 method84 offset 696" "$dest"; then
      echo "error: dest missing method84 slot 87 offset 696: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method85" "$dest"; then
      echo "error: dest missing eighty-sixth Method (method85): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 88 method85 offset 704" "$dest"; then
      echo "error: dest missing method85 slot 88 offset 704: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method86" "$dest"; then
      echo "error: dest missing eighty-seventh Method (method86): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 89 method86 offset 712" "$dest"; then
      echo "error: dest missing method86 slot 89 offset 712: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method87" "$dest"; then
      echo "error: dest missing eighty-eighth Method (method87): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 90 method87 offset 720" "$dest"; then
      echo "error: dest missing method87 slot 90 offset 720: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method88" "$dest"; then
      echo "error: dest missing eighty-ninth Method (method88): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 91 method88 offset 728" "$dest"; then
      echo "error: dest missing method88 slot 91 offset 728: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method89" "$dest"; then
      echo "error: dest missing ninetieth Method (method89): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 92 method89 offset 736" "$dest"; then
      echo "error: dest missing method89 slot 92 offset 736: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method90" "$dest"; then
      echo "error: dest missing ninety-first Method (method90): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 93 method90 offset 744" "$dest"; then
      echo "error: dest missing method90 slot 93 offset 744: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method91" "$dest"; then
      echo "error: dest missing ninety-second Method (method91): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 94 method91 offset 752" "$dest"; then
      echo "error: dest missing method91 slot 94 offset 752: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method92" "$dest"; then
      echo "error: dest missing ninety-third Method (method92): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 95 method92 offset 760" "$dest"; then
      echo "error: dest missing method92 slot 95 offset 760: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method93" "$dest"; then
      echo "error: dest missing ninety-fourth Method (method93): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 96 method93 offset 768" "$dest"; then
      echo "error: dest missing method93 slot 96 offset 768: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method94" "$dest"; then
      echo "error: dest missing ninety-fifth Method (method94): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 97 method94 offset 776" "$dest"; then
      echo "error: dest missing method94 slot 97 offset 776: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method95" "$dest"; then
      echo "error: dest missing ninety-sixth Method (method95): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 98 method95 offset 784" "$dest"; then
      echo "error: dest missing method95 slot 98 offset 784: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method96" "$dest"; then
      echo "error: dest missing ninety-seventh Method (method96): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 99 method96 offset 792" "$dest"; then
      echo "error: dest missing method96 slot 99 offset 792: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method97" "$dest"; then
      echo "error: dest missing ninety-eighth Method (method97): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 100 method97 offset 800" "$dest"; then
      echo "error: dest missing method97 slot 100 offset 800: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method98" "$dest"; then
      echo "error: dest missing ninety-ninth Method (method98): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 101 method98 offset 808" "$dest"; then
      echo "error: dest missing method98 slot 101 offset 808: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method99" "$dest"; then
      echo "error: dest missing one-hundredth Method (method99): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 102 method99 offset 816" "$dest"; then
      echo "error: dest missing method99 slot 102 offset 816: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method100" "$dest"; then
      echo "error: dest missing one-hundred-first Method (method100): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 103 method100 offset 824" "$dest"; then
      echo "error: dest missing method100 slot 103 offset 824: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method101" "$dest"; then
      echo "error: dest missing one-hundred-second Method (method101): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 104 method101 offset 832" "$dest"; then
      echo "error: dest missing method101 slot 104 offset 832: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method102" "$dest"; then
      echo "error: dest missing one-hundred-third Method (method102): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 105 method102 offset 840" "$dest"; then
      echo "error: dest missing method102 slot 105 offset 840: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method103" "$dest"; then
      echo "error: dest missing one-hundred-fourth Method (method103): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 106 method103 offset 848" "$dest"; then
      echo "error: dest missing method103 slot 106 offset 848: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method104" "$dest"; then
      echo "error: dest missing one-hundred-fifth Method (method104): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 107 method104 offset 856" "$dest"; then
      echo "error: dest missing method104 slot 107 offset 856: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method105" "$dest"; then
      echo "error: dest missing one-hundred-sixth Method (method105): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 108 method105 offset 864" "$dest"; then
      echo "error: dest missing method105 slot 108 offset 864: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method106" "$dest"; then
      echo "error: dest missing one-hundred-seventh Method (method106): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 109 method106 offset 872" "$dest"; then
      echo "error: dest missing method106 slot 109 offset 872: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method107" "$dest"; then
      echo "error: dest missing one-hundred-eighth Method (method107): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 110 method107 offset 880" "$dest"; then
      echo "error: dest missing method107 slot 110 offset 880: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method108" "$dest"; then
      echo "error: dest missing one-hundred-ninth Method (method108): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 111 method108 offset 888" "$dest"; then
      echo "error: dest missing method108 slot 111 offset 888: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method109" "$dest"; then
      echo "error: dest missing one-hundred-tenth Method (method109): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 112 method109 offset 896" "$dest"; then
      echo "error: dest missing method109 slot 112 offset 896: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method110" "$dest"; then
      echo "error: dest missing one-hundred-eleventh Method (method110): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 113 method110 offset 904" "$dest"; then
      echo "error: dest missing method110 slot 113 offset 904: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method111" "$dest"; then
      echo "error: dest missing one-hundred-twelfth Method (method111): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 114 method111 offset 912" "$dest"; then
      echo "error: dest missing method111 slot 114 offset 912: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method112" "$dest"; then
      echo "error: dest missing one-hundred-thirteenth Method (method112): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 115 method112 offset 920" "$dest"; then
      echo "error: dest missing method112 slot 115 offset 920: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method113" "$dest"; then
      echo "error: dest missing one-hundred-fourteenth Method (method113): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 116 method113 offset 928" "$dest"; then
      echo "error: dest missing method113 slot 116 offset 928: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method114" "$dest"; then
      echo "error: dest missing one-hundred-fifteenth Method (method114): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 117 method114 offset 936" "$dest"; then
      echo "error: dest missing method114 slot 117 offset 936: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method115" "$dest"; then
      echo "error: dest missing one-hundred-sixteenth Method (method115): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 118 method115 offset 944" "$dest"; then
      echo "error: dest missing method115 slot 118 offset 944: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method116" "$dest"; then
      echo "error: dest missing one-hundred-seventeenth Method (method116): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 119 method116 offset 952" "$dest"; then
      echo "error: dest missing method116 slot 119 offset 952: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method117" "$dest"; then
      echo "error: dest missing one-hundred-eighteenth Method (method117): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 120 method117 offset 960" "$dest"; then
      echo "error: dest missing method117 slot 120 offset 960: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method118" "$dest"; then
      echo "error: dest missing one-hundred-nineteenth Method (method118): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 121 method118 offset 968" "$dest"; then
      echo "error: dest missing method118 slot 121 offset 968: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method119" "$dest"; then
      echo "error: dest missing one-hundred-twentieth Method (method119): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 122 method119 offset 976" "$dest"; then
      echo "error: dest missing method119 slot 122 offset 976: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method120" "$dest"; then
      echo "error: dest missing one-hundred-twenty-first Method (method120): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 123 method120 offset 984" "$dest"; then
      echo "error: dest missing method120 slot 123 offset 984: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method121" "$dest"; then
      echo "error: dest missing one-hundred-twenty-second Method (method121): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 124 method121 offset 992" "$dest"; then
      echo "error: dest missing method121 slot 124 offset 992: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method122" "$dest"; then
      echo "error: dest missing one-hundred-twenty-third Method (method122): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 125 method122 offset 1000" "$dest"; then
      echo "error: dest missing method122 slot 125 offset 1000: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method123" "$dest"; then
      echo "error: dest missing one-hundred-twenty-fourth Method (method123): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 126 method123 offset 1008" "$dest"; then
      echo "error: dest missing method123 slot 126 offset 1008: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method124" "$dest"; then
      echo "error: dest missing one-hundred-twenty-fifth Method (method124): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 127 method124 offset 1016" "$dest"; then
      echo "error: dest missing method124 slot 127 offset 1016: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method125" "$dest"; then
      echo "error: dest missing one-hundred-twenty-sixth Method (method125): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 128 method125 offset 1024" "$dest"; then
      echo "error: dest missing method125 slot 128 offset 1024: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method126" "$dest"; then
      echo "error: dest missing one-hundred-twenty-seventh Method (method126): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 129 method126 offset 1032" "$dest"; then
      echo "error: dest missing method126 slot 129 offset 1032: $dest" >&2
      exit 1
    fi
    if ! grep -q "slake_trait_object_method127" "$dest"; then
      echo "error: dest missing one-hundred-twenty-eighth Method (method127): $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 130 method127 offset 1040" "$dest"; then
      echo "error: dest missing method127 slot 130 offset 1040: $dest" >&2
      exit 1
    fi
    if grep -q "slot 8 Vacant offset 64" "$dest"; then
      echo "error: dest Vacant still at slot 8 offset 64: $dest" >&2
      exit 1
    fi
    if grep -q "slot 9 Vacant offset 72" "$dest"; then
      echo "error: dest Vacant still at slot 9 offset 72: $dest" >&2
      exit 1
    fi
    if grep -q "slot 10 Vacant offset 80" "$dest"; then
      echo "error: dest Vacant still at slot 10 offset 80: $dest" >&2
      exit 1
    fi
    if grep -q "slot 11 Vacant offset 88" "$dest"; then
      echo "error: dest Vacant still at slot 11 offset 88: $dest" >&2
      exit 1
    fi
    if grep -q "slot 12 Vacant offset 96" "$dest"; then
      echo "error: dest Vacant still at slot 12 offset 96: $dest" >&2
      exit 1
    fi
    if grep -q "slot 13 Vacant offset 104" "$dest"; then
      echo "error: dest Vacant still at slot 13 offset 104: $dest" >&2
      exit 1
    fi
    if grep -q "slot 14 Vacant offset 112" "$dest"; then
      echo "error: dest Vacant still at slot 14 offset 112: $dest" >&2
      exit 1
    fi
    if grep -q "slot 15 Vacant offset 120" "$dest"; then
      echo "error: dest Vacant still at slot 15 offset 120: $dest" >&2
      exit 1
    fi
    if grep -q "slot 16 Vacant offset 128" "$dest"; then
      echo "error: dest Vacant still at slot 16 offset 128: $dest" >&2
      exit 1
    fi
    if grep -q "slot 17 Vacant offset 136" "$dest"; then
      echo "error: dest Vacant still at slot 17 offset 136: $dest" >&2
      exit 1
    fi
    if grep -q "slot 11 TraitVPtr offset 88" "$dest"; then
      echo "error: dest TraitVPtr still at slot 11 offset 88: $dest" >&2
      exit 1
    fi
    if grep -q "slot 12 TraitVPtr offset 96" "$dest"; then
      echo "error: dest TraitVPtr still at slot 12 offset 96: $dest" >&2
      exit 1
    fi
    if grep -q "slot 13 TraitVPtr offset 104" "$dest"; then
      echo "error: dest TraitVPtr still at slot 13 offset 104: $dest" >&2
      exit 1
    fi
    if grep -q "slot 14 TraitVPtr offset 112" "$dest"; then
      echo "error: dest TraitVPtr still at slot 14 offset 112: $dest" >&2
      exit 1
    fi
    if grep -q "slot 15 TraitVPtr offset 120" "$dest"; then
      echo "error: dest TraitVPtr still at slot 15 offset 120: $dest" >&2
      exit 1
    fi
    if grep -q "slot 16 TraitVPtr offset 128" "$dest"; then
      echo "error: dest TraitVPtr still at slot 16 offset 128: $dest" >&2
      exit 1
    fi
    if grep -q "slot 17 TraitVPtr offset 136" "$dest"; then
      echo "error: dest TraitVPtr still at slot 17 offset 136: $dest" >&2
      exit 1
    fi
    if grep -q "slot 18 TraitVPtr offset 144" "$dest"; then
      echo "error: dest TraitVPtr still at slot 18 offset 144: $dest" >&2
      exit 1
    fi
    if grep -q "slot 19 TraitVPtr offset 152" "$dest"; then
      echo "error: dest TraitVPtr still at slot 19 offset 152: $dest" >&2
      exit 1
    fi
    if grep -q "slot 20 TraitVPtr offset 160" "$dest"; then
      echo "error: dest TraitVPtr still at slot 20 offset 160: $dest" >&2
      exit 1
    fi
    if grep -q "slot 21 TraitVPtr offset 168" "$dest"; then
      echo "error: dest TraitVPtr still at slot 21 offset 168: $dest" >&2
      exit 1
    fi
    if grep -q "slot 18 Vacant offset 144" "$dest"; then
      echo "error: dest Vacant still at slot 18 offset 144: $dest" >&2
      exit 1
    fi
    if grep -q "slot 19 Vacant offset 152" "$dest"; then
      echo "error: dest Vacant still at slot 19 offset 152: $dest" >&2
      exit 1
    fi
    if grep -q "slot 20 Vacant offset 160" "$dest"; then
      echo "error: dest Vacant still at slot 20 offset 160: $dest" >&2
      exit 1
    fi
    if grep -q "slot 21 Vacant offset 168" "$dest"; then
      echo "error: dest Vacant still at slot 21 offset 168: $dest" >&2
      exit 1
    fi
    if grep -q "slot 22 TraitVPtr offset 176" "$dest"; then
      echo "error: dest TraitVPtr still at slot 22 offset 176: $dest" >&2
      exit 1
    fi
    if grep -q "slot 22 Vacant offset 176" "$dest"; then
      echo "error: dest Vacant still at slot 22 offset 176: $dest" >&2
      exit 1
    fi
    if grep -q "slot 23 TraitVPtr offset 184" "$dest"; then
      echo "error: dest TraitVPtr still at slot 23 offset 184: $dest" >&2
      exit 1
    fi
    if grep -q "slot 23 Vacant offset 184" "$dest"; then
      echo "error: dest Vacant still at slot 23 offset 184: $dest" >&2
      exit 1
    fi
    if grep -q "slot 24 TraitVPtr offset 192" "$dest"; then
      echo "error: dest TraitVPtr still at slot 24 offset 192: $dest" >&2
      exit 1
    fi
    if grep -q "slot 24 Vacant offset 192" "$dest"; then
      echo "error: dest Vacant still at slot 24 offset 192: $dest" >&2
      exit 1
    fi
    if grep -q "slot 25 TraitVPtr offset 200" "$dest"; then
      echo "error: dest TraitVPtr still at slot 25 offset 200: $dest" >&2
      exit 1
    fi
    if grep -q "slot 25 Vacant offset 200" "$dest"; then
      echo "error: dest Vacant still at slot 25 offset 200: $dest" >&2
      exit 1
    fi
    if grep -q "slot 26 TraitVPtr offset 208" "$dest"; then
      echo "error: dest TraitVPtr still at slot 26 offset 208: $dest" >&2
      exit 1
    fi
    if grep -q "slot 26 Vacant offset 208" "$dest"; then
      echo "error: dest Vacant still at slot 26 offset 208: $dest" >&2
      exit 1
    fi
    if grep -q "slot 27 TraitVPtr offset 216" "$dest"; then
      echo "error: dest TraitVPtr still at slot 27 offset 216: $dest" >&2
      exit 1
    fi
    if grep -q "slot 27 Vacant offset 216" "$dest"; then
      echo "error: dest Vacant still at slot 27 offset 216: $dest" >&2
      exit 1
    fi
    if grep -q "slot 28 TraitVPtr offset 224" "$dest"; then
      echo "error: dest TraitVPtr still at slot 28 offset 224: $dest" >&2
      exit 1
    fi
    if grep -q "slot 28 Vacant offset 224" "$dest"; then
      echo "error: dest Vacant still at slot 28 offset 224: $dest" >&2
      exit 1
    fi
    if grep -q "slot 29 TraitVPtr offset 232" "$dest"; then
      echo "error: dest TraitVPtr still at slot 29 offset 232: $dest" >&2
      exit 1
    fi
    if grep -q "slot 29 Vacant offset 232" "$dest"; then
      echo "error: dest Vacant still at slot 29 offset 232: $dest" >&2
      exit 1
    fi
    if grep -q "slot 30 TraitVPtr offset 240" "$dest"; then
      echo "error: dest TraitVPtr still at slot 30 offset 240: $dest" >&2
      exit 1
    fi
    if grep -q "slot 30 Vacant offset 240" "$dest"; then
      echo "error: dest Vacant still at slot 30 offset 240: $dest" >&2
      exit 1
    fi
    if grep -q "slot 31 TraitVPtr offset 248" "$dest"; then
      echo "error: dest TraitVPtr still at slot 31 offset 248: $dest" >&2
      exit 1
    fi
    if grep -q "slot 31 Vacant offset 248" "$dest"; then
      echo "error: dest Vacant still at slot 31 offset 248: $dest" >&2
      exit 1
    fi
    if grep -q "slot 32 TraitVPtr offset 256" "$dest"; then
      echo "error: dest TraitVPtr still at slot 32 offset 256: $dest" >&2
      exit 1
    fi
    if grep -q "slot 32 Vacant offset 256" "$dest"; then
      echo "error: dest Vacant still at slot 32 offset 256: $dest" >&2
      exit 1
    fi
    if grep -q "slot 33 TraitVPtr offset 264" "$dest"; then
      echo "error: dest TraitVPtr still at slot 33 offset 264: $dest" >&2
      exit 1
    fi
    if grep -q "slot 33 Vacant offset 264" "$dest"; then
      echo "error: dest Vacant still at slot 33 offset 264: $dest" >&2
      exit 1
    fi
    if grep -q "slot 34 TraitVPtr offset 272" "$dest"; then
      echo "error: dest TraitVPtr still at slot 34 offset 272: $dest" >&2
      exit 1
    fi
    if grep -q "slot 34 Vacant offset 272" "$dest"; then
      echo "error: dest Vacant still at slot 34 offset 272: $dest" >&2
      exit 1
    fi
    if grep -q "slot 35 TraitVPtr offset 280" "$dest"; then
      echo "error: dest TraitVPtr still at slot 35 offset 280: $dest" >&2
      exit 1
    fi
    if grep -q "slot 35 Vacant offset 280" "$dest"; then
      echo "error: dest Vacant still at slot 35 offset 280: $dest" >&2
      exit 1
    fi
    if grep -q "slot 36 TraitVPtr offset 288" "$dest"; then
      echo "error: dest TraitVPtr still at slot 36 offset 288: $dest" >&2
      exit 1
    fi
    if grep -q "slot 36 Vacant offset 288" "$dest"; then
      echo "error: dest Vacant still at slot 36 offset 288: $dest" >&2
      exit 1
    fi
    if grep -q "slot 37 Vacant offset 296" "$dest"; then
      echo "error: dest Vacant still at slot 37 offset 296: $dest" >&2
      exit 1
    fi
    if grep -q "slot 37 TraitVPtr offset 296" "$dest"; then
      echo "error: dest TraitVPtr still at slot 37 offset 296: $dest" >&2
      exit 1
    fi
    if grep -q "slot 38 TraitVPtr offset 304" "$dest"; then
      echo "error: dest TraitVPtr still at slot 38 offset 304: $dest" >&2
      exit 1
    fi
    if grep -q "slot 38 Vacant offset 304" "$dest"; then
      echo "error: dest Vacant still at slot 38 offset 304: $dest" >&2
      exit 1
    fi
    if grep -q "slot 39 TraitVPtr offset 312" "$dest"; then
      echo "error: dest TraitVPtr still at slot 39 offset 312: $dest" >&2
      exit 1
    fi
    if grep -q "slot 39 Vacant offset 312" "$dest"; then
      echo "error: dest Vacant still at slot 39 offset 312: $dest" >&2
      exit 1
    fi
    if grep -q "slot 40 TraitVPtr offset 320" "$dest"; then
      echo "error: dest TraitVPtr still at slot 40 offset 320: $dest" >&2
      exit 1
    fi
    if grep -q "slot 40 Vacant offset 320" "$dest"; then
      echo "error: dest Vacant still at slot 40 offset 320: $dest" >&2
      exit 1
    fi
    if grep -q "slot 41 TraitVPtr offset 328" "$dest"; then
      echo "error: dest TraitVPtr still at slot 41 offset 328: $dest" >&2
      exit 1
    fi
    if grep -q "slot 41 Vacant offset 328" "$dest"; then
      echo "error: dest Vacant still at slot 41 offset 328: $dest" >&2
      exit 1
    fi
    if grep -q "slot 42 TraitVPtr offset 336" "$dest"; then
      echo "error: dest TraitVPtr still at slot 42 offset 336: $dest" >&2
      exit 1
    fi
    if grep -q "slot 42 Vacant offset 336" "$dest"; then
      echo "error: dest Vacant still at slot 42 offset 336: $dest" >&2
      exit 1
    fi
    if grep -q "slot 43 TraitVPtr offset 344" "$dest"; then
      echo "error: dest TraitVPtr still at slot 43 offset 344: $dest" >&2
      exit 1
    fi
    if grep -q "slot 43 Vacant offset 344" "$dest"; then
      echo "error: dest Vacant still at slot 43 offset 344: $dest" >&2
      exit 1
    fi
    if grep -q "slot 44 TraitVPtr offset 352" "$dest"; then
      echo "error: dest TraitVPtr still at slot 44 offset 352: $dest" >&2
      exit 1
    fi
    if grep -q "slot 44 Vacant offset 352" "$dest"; then
      echo "error: dest Vacant still at slot 44 offset 352: $dest" >&2
      exit 1
    fi
    if grep -q "slot 45 TraitVPtr offset 360" "$dest"; then
      echo "error: dest TraitVPtr still at slot 45 offset 360: $dest" >&2
      exit 1
    fi
    if grep -q "slot 45 Vacant offset 360" "$dest"; then
      echo "error: dest Vacant still at slot 45 offset 360: $dest" >&2
      exit 1
    fi
    if grep -q "slot 46 TraitVPtr offset 368" "$dest"; then
      echo "error: dest TraitVPtr still at slot 46 offset 368: $dest" >&2
      exit 1
    fi
    if grep -q "slot 46 Vacant offset 368" "$dest"; then
      echo "error: dest Vacant still at slot 46 offset 368: $dest" >&2
      exit 1
    fi
    if grep -q "slot 47 TraitVPtr offset 376" "$dest"; then
      echo "error: dest TraitVPtr still at slot 47 offset 376: $dest" >&2
      exit 1
    fi
    if grep -q "slot 47 Vacant offset 376" "$dest"; then
      echo "error: dest Vacant still at slot 47 offset 376: $dest" >&2
      exit 1
    fi
    if grep -q "slot 48 TraitVPtr offset 384" "$dest"; then
      echo "error: dest TraitVPtr still at slot 48 offset 384: $dest" >&2
      exit 1
    fi
    if grep -q "slot 48 Vacant offset 384" "$dest"; then
      echo "error: dest Vacant still at slot 48 offset 384: $dest" >&2
      exit 1
    fi
    if grep -q "slot 49 TraitVPtr offset 392" "$dest"; then
      echo "error: dest TraitVPtr still at slot 49 offset 392: $dest" >&2
      exit 1
    fi
    if grep -q "slot 49 Vacant offset 392" "$dest"; then
      echo "error: dest Vacant still at slot 49 offset 392: $dest" >&2
      exit 1
    fi
    if grep -q "slot 50 TraitVPtr offset 400" "$dest"; then
      echo "error: dest TraitVPtr still at slot 50 offset 400: $dest" >&2
      exit 1
    fi
    if grep -q "slot 50 Vacant offset 400" "$dest"; then
      echo "error: dest Vacant still at slot 50 offset 400: $dest" >&2
      exit 1
    fi
    if grep -q "slot 51 TraitVPtr offset 408" "$dest"; then
      echo "error: dest TraitVPtr still at slot 51 offset 408: $dest" >&2
      exit 1
    fi
    if grep -q "slot 51 Vacant offset 408" "$dest"; then
      echo "error: dest Vacant still at slot 51 offset 408: $dest" >&2
      exit 1
    fi
    if grep -q "slot 52 TraitVPtr offset 416" "$dest"; then
      echo "error: dest TraitVPtr still at slot 52 offset 416: $dest" >&2
      exit 1
    fi
    if grep -q "slot 52 Vacant offset 416" "$dest"; then
      echo "error: dest Vacant still at slot 52 offset 416: $dest" >&2
      exit 1
    fi
    if grep -q "slot 53 TraitVPtr offset 424" "$dest"; then
      echo "error: dest TraitVPtr still at slot 53 offset 424: $dest" >&2
      exit 1
    fi
    if grep -q "slot 53 Vacant offset 424" "$dest"; then
      echo "error: dest Vacant still at slot 53 offset 424: $dest" >&2
      exit 1
    fi
    if grep -q "slot 54 TraitVPtr offset 432" "$dest"; then
      echo "error: dest TraitVPtr still at slot 54 offset 432: $dest" >&2
      exit 1
    fi
    if grep -q "slot 54 Vacant offset 432" "$dest"; then
      echo "error: dest Vacant still at slot 54 offset 432: $dest" >&2
      exit 1
    fi
    if grep -q "slot 55 TraitVPtr offset 440" "$dest"; then
      echo "error: dest TraitVPtr still at slot 55 offset 440: $dest" >&2
      exit 1
    fi
    if grep -q "slot 55 Vacant offset 440" "$dest"; then
      echo "error: dest Vacant still at slot 55 offset 440: $dest" >&2
      exit 1
    fi
    if grep -q "slot 56 TraitVPtr offset 448" "$dest"; then
      echo "error: dest TraitVPtr still at slot 56 offset 448: $dest" >&2
      exit 1
    fi
    if grep -q "slot 56 Vacant offset 448" "$dest"; then
      echo "error: dest Vacant still at slot 56 offset 448: $dest" >&2
      exit 1
    fi
    if grep -q "slot 57 TraitVPtr offset 456" "$dest"; then
      echo "error: dest TraitVPtr still at slot 57 offset 456: $dest" >&2
      exit 1
    fi
    if grep -q "slot 57 Vacant offset 456" "$dest"; then
      echo "error: dest Vacant still at slot 57 offset 456: $dest" >&2
      exit 1
    fi
    if grep -q "slot 58 TraitVPtr offset 464" "$dest"; then
      echo "error: dest TraitVPtr still at slot 58 offset 464: $dest" >&2
      exit 1
    fi
    if grep -q "slot 58 Vacant offset 464" "$dest"; then
      echo "error: dest Vacant still at slot 58 offset 464: $dest" >&2
      exit 1
    fi
    if grep -q "slot 59 TraitVPtr offset 472" "$dest"; then
      echo "error: dest TraitVPtr still at slot 59 offset 472: $dest" >&2
      exit 1
    fi
    if grep -q "slot 59 Vacant offset 472" "$dest"; then
      echo "error: dest Vacant still at slot 59 offset 472: $dest" >&2
      exit 1
    fi
    if grep -q "slot 60 TraitVPtr offset 480" "$dest"; then
      echo "error: dest TraitVPtr still at slot 60 offset 480: $dest" >&2
      exit 1
    fi
    if grep -q "slot 60 Vacant offset 480" "$dest"; then
      echo "error: dest Vacant still at slot 60 offset 480: $dest" >&2
      exit 1
    fi
    if grep -q "slot 61 TraitVPtr offset 488" "$dest"; then
      echo "error: dest TraitVPtr still at slot 61 offset 488: $dest" >&2
      exit 1
    fi
    if grep -q "slot 61 Vacant offset 488" "$dest"; then
      echo "error: dest Vacant still at slot 61 offset 488: $dest" >&2
      exit 1
    fi
    if grep -q "slot 62 TraitVPtr offset 496" "$dest"; then
      echo "error: dest TraitVPtr still at slot 62 offset 496: $dest" >&2
      exit 1
    fi
    if grep -q "slot 62 Vacant offset 496" "$dest"; then
      echo "error: dest Vacant still at slot 62 offset 496: $dest" >&2
      exit 1
    fi
    if grep -q "slot 63 TraitVPtr offset 504" "$dest"; then
      echo "error: dest TraitVPtr still at slot 63 offset 504: $dest" >&2
      exit 1
    fi
    if grep -q "slot 63 Vacant offset 504" "$dest"; then
      echo "error: dest Vacant still at slot 63 offset 504: $dest" >&2
      exit 1
    fi
    if grep -q "slot 64 TraitVPtr offset 512" "$dest"; then
      echo "error: dest TraitVPtr still at slot 64 offset 512: $dest" >&2
      exit 1
    fi
    if grep -q "slot 64 Vacant offset 512" "$dest"; then
      echo "error: dest Vacant still at slot 64 offset 512: $dest" >&2
      exit 1
    fi
    if grep -q "slot 65 TraitVPtr offset 520" "$dest"; then
      echo "error: dest TraitVPtr still at slot 65 offset 520: $dest" >&2
      exit 1
    fi
    if grep -q "slot 65 Vacant offset 520" "$dest"; then
      echo "error: dest Vacant still at slot 65 offset 520: $dest" >&2
      exit 1
    fi
    if grep -q "slot 66 TraitVPtr offset 528" "$dest"; then
      echo "error: dest TraitVPtr still at slot 66 offset 528: $dest" >&2
      exit 1
    fi
    if grep -q "slot 66 Vacant offset 528" "$dest"; then
      echo "error: dest Vacant still at slot 66 offset 528: $dest" >&2
      exit 1
    fi
    if grep -q "slot 67 TraitVPtr offset 536" "$dest"; then
      echo "error: dest TraitVPtr still at slot 67 offset 536: $dest" >&2
      exit 1
    fi
    if grep -q "slot 67 Vacant offset 536" "$dest"; then
      echo "error: dest Vacant still at slot 67 offset 536: $dest" >&2
      exit 1
    fi
    if grep -q "slot 68 TraitVPtr offset 544" "$dest"; then
      echo "error: dest TraitVPtr still at slot 68 offset 544: $dest" >&2
      exit 1
    fi
    if grep -q "slot 68 Vacant offset 544" "$dest"; then
      echo "error: dest Vacant still at slot 68 offset 544: $dest" >&2
      exit 1
    fi
    if grep -q "slot 69 TraitVPtr offset 552" "$dest"; then
      echo "error: dest TraitVPtr still at slot 69 offset 552: $dest" >&2
      exit 1
    fi
    if grep -q "slot 69 Vacant offset 552" "$dest"; then
      echo "error: dest Vacant still at slot 69 offset 552: $dest" >&2
      exit 1
    fi
    if grep -q "slot 70 TraitVPtr offset 560" "$dest"; then
      echo "error: dest TraitVPtr still at slot 70 offset 560: $dest" >&2
      exit 1
    fi
    if grep -q "slot 70 Vacant offset 560" "$dest"; then
      echo "error: dest Vacant still at slot 70 offset 560: $dest" >&2
      exit 1
    fi
    if grep -q "slot 71 TraitVPtr offset 568" "$dest"; then
      echo "error: dest TraitVPtr still at slot 71 offset 568: $dest" >&2
      exit 1
    fi
    if grep -q "slot 71 Vacant offset 568" "$dest"; then
      echo "error: dest Vacant still at slot 71 offset 568: $dest" >&2
      exit 1
    fi
    if grep -q "slot 72 TraitVPtr offset 576" "$dest"; then
      echo "error: dest TraitVPtr still at slot 72 offset 576: $dest" >&2
      exit 1
    fi
    if grep -q "slot 73 Vacant offset 584" "$dest"; then
      echo "error: dest Vacant still at slot 73 offset 584: $dest" >&2
      exit 1
    fi
    if grep -q "slot 74 TraitVPtr offset 592" "$dest"; then
      echo "error: dest TraitVPtr still at slot 74 offset 592: $dest" >&2
      exit 1
    fi
    if grep -q "slot 74 Vacant offset 592" "$dest"; then
      echo "error: dest Vacant still at slot 74 offset 592: $dest" >&2
      exit 1
    fi
    if grep -q "slot 75 TraitVPtr offset 600" "$dest"; then
      echo "error: dest TraitVPtr still at slot 75 offset 600: $dest" >&2
      exit 1
    fi
    if grep -q "slot 75 Vacant offset 600" "$dest"; then
      echo "error: dest Vacant still at slot 75 offset 600: $dest" >&2
      exit 1
    fi
    if grep -q "slot 76 TraitVPtr offset 608" "$dest"; then
      echo "error: dest TraitVPtr still at slot 76 offset 608: $dest" >&2
      exit 1
    fi
    if grep -q "slot 76 Vacant offset 608" "$dest"; then
      echo "error: dest Vacant still at slot 76 offset 608: $dest" >&2
      exit 1
    fi
    if grep -q "slot 77 TraitVPtr offset 616" "$dest"; then
      echo "error: dest TraitVPtr still at slot 77 offset 616: $dest" >&2
      exit 1
    fi
    if grep -q "slot 77 Vacant offset 616" "$dest"; then
      echo "error: dest Vacant still at slot 77 offset 616: $dest" >&2
      exit 1
    fi
    if grep -q "slot 78 TraitVPtr offset 624" "$dest"; then
      echo "error: dest TraitVPtr still at slot 78 offset 624: $dest" >&2
      exit 1
    fi
    if grep -q "slot 78 Vacant offset 624" "$dest"; then
      echo "error: dest Vacant still at slot 78 offset 624: $dest" >&2
      exit 1
    fi
    if grep -q "slot 79 TraitVPtr offset 632" "$dest"; then
      echo "error: dest TraitVPtr still at slot 79 offset 632: $dest" >&2
      exit 1
    fi
    if grep -q "slot 79 Vacant offset 632" "$dest"; then
      echo "error: dest Vacant still at slot 79 offset 632: $dest" >&2
      exit 1
    fi
    if grep -q "slot 80 TraitVPtr offset 640" "$dest"; then
      echo "error: dest TraitVPtr still at slot 80 offset 640: $dest" >&2
      exit 1
    fi
    if grep -q "slot 80 Vacant offset 640" "$dest"; then
      echo "error: dest Vacant still at slot 80 offset 640: $dest" >&2
      exit 1
    fi
    if grep -q "slot 81 TraitVPtr offset 648" "$dest"; then
      echo "error: dest TraitVPtr still at slot 81 offset 648: $dest" >&2
      exit 1
    fi
    if grep -q "slot 81 Vacant offset 648" "$dest"; then
      echo "error: dest Vacant still at slot 81 offset 648: $dest" >&2
      exit 1
    fi
    if grep -q "slot 82 TraitVPtr offset 656" "$dest"; then
      echo "error: dest TraitVPtr still at slot 82 offset 656: $dest" >&2
      exit 1
    fi
    if grep -q "slot 82 Vacant offset 656" "$dest"; then
      echo "error: dest Vacant still at slot 82 offset 656: $dest" >&2
      exit 1
    fi
    if grep -q "slot 83 TraitVPtr offset 664" "$dest"; then
      echo "error: dest TraitVPtr still at slot 83 offset 664: $dest" >&2
      exit 1
    fi
    if grep -q "slot 83 Vacant offset 664" "$dest"; then
      echo "error: dest Vacant still at slot 83 offset 664: $dest" >&2
      exit 1
    fi
    if grep -q "slot 84 TraitVPtr offset 672" "$dest"; then
      echo "error: dest TraitVPtr still at slot 84 offset 672: $dest" >&2
      exit 1
    fi
    if grep -q "slot 84 Vacant offset 672" "$dest"; then
      echo "error: dest Vacant still at slot 84 offset 672: $dest" >&2
      exit 1
    fi
    if grep -q "slot 85 TraitVPtr offset 680" "$dest"; then
      echo "error: dest TraitVPtr still at slot 85 offset 680: $dest" >&2
      exit 1
    fi
    if grep -q "slot 85 Vacant offset 680" "$dest"; then
      echo "error: dest Vacant still at slot 85 offset 680: $dest" >&2
      exit 1
    fi
    if grep -q "slot 86 TraitVPtr offset 688" "$dest"; then
      echo "error: dest TraitVPtr still at slot 86 offset 688: $dest" >&2
      exit 1
    fi
    if grep -q "slot 86 Vacant offset 688" "$dest"; then
      echo "error: dest Vacant still at slot 86 offset 688: $dest" >&2
      exit 1
    fi
    if grep -q "slot 87 TraitVPtr offset 696" "$dest"; then
      echo "error: dest TraitVPtr still at slot 87 offset 696: $dest" >&2
      exit 1
    fi
    if grep -q "slot 87 Vacant offset 696" "$dest"; then
      echo "error: dest Vacant still at slot 87 offset 696: $dest" >&2
      exit 1
    fi
    if grep -q "slot 88 TraitVPtr offset 704" "$dest"; then
      echo "error: dest TraitVPtr still at slot 88 offset 704: $dest" >&2
      exit 1
    fi
    if grep -q "slot 88 Vacant offset 704" "$dest"; then
      echo "error: dest Vacant still at slot 88 offset 704: $dest" >&2
      exit 1
    fi
    if grep -q "slot 89 TraitVPtr offset 712" "$dest"; then
      echo "error: dest TraitVPtr still at slot 89 offset 712: $dest" >&2
      exit 1
    fi
    if grep -q "slot 89 Vacant offset 712" "$dest"; then
      echo "error: dest Vacant still at slot 89 offset 712: $dest" >&2
      exit 1
    fi
    if grep -q "slot 90 TraitVPtr offset 720" "$dest"; then
      echo "error: dest TraitVPtr still at slot 90 offset 720: $dest" >&2
      exit 1
    fi
    if grep -q "slot 90 Vacant offset 720" "$dest"; then
      echo "error: dest Vacant still at slot 90 offset 720: $dest" >&2
      exit 1
    fi
    if grep -q "slot 91 TraitVPtr offset 728" "$dest"; then
      echo "error: dest TraitVPtr still at slot 91 offset 728: $dest" >&2
      exit 1
    fi
    if grep -q "slot 91 Vacant offset 728" "$dest"; then
      echo "error: dest Vacant still at slot 91 offset 728: $dest" >&2
      exit 1
    fi
    if grep -q "slot 92 TraitVPtr offset 736" "$dest"; then
      echo "error: dest TraitVPtr still at slot 92 offset 736: $dest" >&2
      exit 1
    fi
    if grep -q "slot 92 Vacant offset 736" "$dest"; then
      echo "error: dest Vacant still at slot 92 offset 736: $dest" >&2
      exit 1
    fi
    if grep -q "slot 93 TraitVPtr offset 744" "$dest"; then
      echo "error: dest TraitVPtr still at slot 93 offset 744: $dest" >&2
      exit 1
    fi
    if grep -q "slot 93 Vacant offset 744" "$dest"; then
      echo "error: dest Vacant still at slot 93 offset 744: $dest" >&2
      exit 1
    fi
    if grep -q "slot 94 TraitVPtr offset 752" "$dest"; then
      echo "error: dest TraitVPtr still at slot 94 offset 752: $dest" >&2
      exit 1
    fi
    if grep -q "slot 94 Vacant offset 752" "$dest"; then
      echo "error: dest Vacant still at slot 94 offset 752: $dest" >&2
      exit 1
    fi
    if grep -q "slot 95 TraitVPtr offset 760" "$dest"; then
      echo "error: dest TraitVPtr still at slot 95 offset 760: $dest" >&2
      exit 1
    fi
    if grep -q "slot 95 Vacant offset 760" "$dest"; then
      echo "error: dest Vacant still at slot 95 offset 760: $dest" >&2
      exit 1
    fi
    if grep -q "slot 96 TraitVPtr offset 768" "$dest"; then
      echo "error: dest TraitVPtr still at slot 96 offset 768: $dest" >&2
      exit 1
    fi
    if grep -q "slot 96 Vacant offset 768" "$dest"; then
      echo "error: dest Vacant still at slot 96 offset 768: $dest" >&2
      exit 1
    fi
    if grep -q "slot 97 TraitVPtr offset 776" "$dest"; then
      echo "error: dest TraitVPtr still at slot 97 offset 776: $dest" >&2
      exit 1
    fi
    if grep -q "slot 97 Vacant offset 776" "$dest"; then
      echo "error: dest Vacant still at slot 97 offset 776: $dest" >&2
      exit 1
    fi
    if grep -q "slot 98 TraitVPtr offset 784" "$dest"; then
      echo "error: dest TraitVPtr still at slot 98 offset 784: $dest" >&2
      exit 1
    fi
    if grep -q "slot 98 Vacant offset 784" "$dest"; then
      echo "error: dest Vacant still at slot 98 offset 784: $dest" >&2
      exit 1
    fi
    if grep -q "slot 99 TraitVPtr offset 792" "$dest"; then
      echo "error: dest TraitVPtr still at slot 99 offset 792: $dest" >&2
      exit 1
    fi
    if grep -q "slot 99 Vacant offset 792" "$dest"; then
      echo "error: dest Vacant still at slot 99 offset 792: $dest" >&2
      exit 1
    fi
    if grep -q "slot 100 TraitVPtr offset 800" "$dest"; then
      echo "error: dest TraitVPtr still at slot 100 offset 800: $dest" >&2
      exit 1
    fi
    if grep -q "slot 100 Vacant offset 800" "$dest"; then
      echo "error: dest Vacant still at slot 100 offset 800: $dest" >&2
      exit 1
    fi
    if grep -q "slot 101 TraitVPtr offset 808" "$dest"; then
      echo "error: dest TraitVPtr still at slot 101 offset 808: $dest" >&2
      exit 1
    fi
    if grep -q "slot 101 Vacant offset 808" "$dest"; then
      echo "error: dest Vacant still at slot 101 offset 808: $dest" >&2
      exit 1
    fi
    if grep -q "slot 102 TraitVPtr offset 816" "$dest"; then
      echo "error: dest TraitVPtr still at slot 102 offset 816: $dest" >&2
      exit 1
    fi
    if grep -q "slot 102 Vacant offset 816" "$dest"; then
      echo "error: dest Vacant still at slot 102 offset 816: $dest" >&2
      exit 1
    fi
    if grep -q "slot 103 TraitVPtr offset 824" "$dest"; then
      echo "error: dest TraitVPtr still at slot 103 offset 824: $dest" >&2
      exit 1
    fi
    if grep -q "slot 103 Vacant offset 824" "$dest"; then
      echo "error: dest Vacant still at slot 103 offset 824: $dest" >&2
      exit 1
    fi
    if grep -q "slot 104 TraitVPtr offset 832" "$dest"; then
      echo "error: dest TraitVPtr still at slot 104 offset 832: $dest" >&2
      exit 1
    fi
    if grep -q "slot 104 Vacant offset 832" "$dest"; then
      echo "error: dest Vacant still at slot 104 offset 832: $dest" >&2
      exit 1
    fi
    if grep -q "slot 105 TraitVPtr offset 840" "$dest"; then
      echo "error: dest TraitVPtr still at slot 105 offset 840: $dest" >&2
      exit 1
    fi
    if grep -q "slot 105 Vacant offset 840" "$dest"; then
      echo "error: dest Vacant still at slot 105 offset 840: $dest" >&2
      exit 1
    fi
    if grep -q "slot 106 TraitVPtr offset 848" "$dest"; then
      echo "error: dest TraitVPtr still at slot 106 offset 848: $dest" >&2
      exit 1
    fi
    if grep -q "slot 106 Vacant offset 848" "$dest"; then
      echo "error: dest Vacant still at slot 106 offset 848: $dest" >&2
      exit 1
    fi
    if grep -q "slot 107 TraitVPtr offset 856" "$dest"; then
      echo "error: dest TraitVPtr still at slot 107 offset 856: $dest" >&2
      exit 1
    fi
    if grep -q "slot 107 Vacant offset 856" "$dest"; then
      echo "error: dest Vacant still at slot 107 offset 856: $dest" >&2
      exit 1
    fi
    if grep -q "slot 108 TraitVPtr offset 864" "$dest"; then
      echo "error: dest TraitVPtr still at slot 108 offset 864: $dest" >&2
      exit 1
    fi
    if grep -q "slot 108 Vacant offset 864" "$dest"; then
      echo "error: dest Vacant still at slot 108 offset 864: $dest" >&2
      exit 1
    fi
    if grep -q "slot 109 TraitVPtr offset 872" "$dest"; then
      echo "error: dest TraitVPtr still at slot 109 offset 872: $dest" >&2
      exit 1
    fi
    if grep -q "slot 109 Vacant offset 872" "$dest"; then
      echo "error: dest Vacant still at slot 109 offset 872: $dest" >&2
      exit 1
    fi
    if grep -q "slot 110 TraitVPtr offset 880" "$dest"; then
      echo "error: dest TraitVPtr still at slot 110 offset 880: $dest" >&2
      exit 1
    fi
    if grep -q "slot 110 Vacant offset 880" "$dest"; then
      echo "error: dest Vacant still at slot 110 offset 880: $dest" >&2
      exit 1
    fi
    if grep -q "slot 111 TraitVPtr offset 888" "$dest"; then
      echo "error: dest TraitVPtr still at slot 111 offset 888: $dest" >&2
      exit 1
    fi
    if grep -q "slot 111 Vacant offset 888" "$dest"; then
      echo "error: dest Vacant still at slot 111 offset 888: $dest" >&2
      exit 1
    fi
    if grep -q "slot 112 TraitVPtr offset 896" "$dest"; then
      echo "error: dest TraitVPtr still at slot 112 offset 896: $dest" >&2
      exit 1
    fi
    if grep -q "slot 112 Vacant offset 896" "$dest"; then
      echo "error: dest Vacant still at slot 112 offset 896: $dest" >&2
      exit 1
    fi
    if grep -q "slot 113 TraitVPtr offset 904" "$dest"; then
      echo "error: dest TraitVPtr still at slot 113 offset 904: $dest" >&2
      exit 1
    fi
    if grep -q "slot 113 Vacant offset 904" "$dest"; then
      echo "error: dest Vacant still at slot 113 offset 904: $dest" >&2
      exit 1
    fi
    if grep -q "slot 114 TraitVPtr offset 912" "$dest"; then
      echo "error: dest TraitVPtr still at slot 114 offset 912: $dest" >&2
      exit 1
    fi
    if grep -q "slot 114 Vacant offset 912" "$dest"; then
      echo "error: dest Vacant still at slot 114 offset 912: $dest" >&2
      exit 1
    fi
    if grep -q "slot 115 TraitVPtr offset 920" "$dest"; then
      echo "error: dest TraitVPtr still at slot 115 offset 920: $dest" >&2
      exit 1
    fi
    if grep -q "slot 115 Vacant offset 920" "$dest"; then
      echo "error: dest Vacant still at slot 115 offset 920: $dest" >&2
      exit 1
    fi
    if grep -q "slot 116 TraitVPtr offset 928" "$dest"; then
      echo "error: dest TraitVPtr still at slot 116 offset 928: $dest" >&2
      exit 1
    fi
    if grep -q "slot 116 Vacant offset 928" "$dest"; then
      echo "error: dest Vacant still at slot 116 offset 928: $dest" >&2
      exit 1
    fi
    if grep -q "slot 117 TraitVPtr offset 936" "$dest"; then
      echo "error: dest TraitVPtr still at slot 117 offset 936: $dest" >&2
      exit 1
    fi
    if grep -q "slot 117 Vacant offset 936" "$dest"; then
      echo "error: dest Vacant still at slot 117 offset 936: $dest" >&2
      exit 1
    fi
    if grep -q "slot 118 TraitVPtr offset 944" "$dest"; then
      echo "error: dest TraitVPtr still at slot 118 offset 944: $dest" >&2
      exit 1
    fi
    if grep -q "slot 118 Vacant offset 944" "$dest"; then
      echo "error: dest Vacant still at slot 118 offset 944: $dest" >&2
      exit 1
    fi
    if grep -q "slot 119 TraitVPtr offset 952" "$dest"; then
      echo "error: dest TraitVPtr still at slot 119 offset 952: $dest" >&2
      exit 1
    fi
    if grep -q "slot 119 Vacant offset 952" "$dest"; then
      echo "error: dest Vacant still at slot 119 offset 952: $dest" >&2
      exit 1
    fi
    if grep -q "slot 120 TraitVPtr offset 960" "$dest"; then
      echo "error: dest TraitVPtr still at slot 120 offset 960: $dest" >&2
      exit 1
    fi
    if grep -q "slot 120 Vacant offset 960" "$dest"; then
      echo "error: dest Vacant still at slot 120 offset 960: $dest" >&2
      exit 1
    fi
    if grep -q "slot 121 TraitVPtr offset 968" "$dest"; then
      echo "error: dest TraitVPtr still at slot 121 offset 968: $dest" >&2
      exit 1
    fi
    if grep -q "slot 121 Vacant offset 968" "$dest"; then
      echo "error: dest Vacant still at slot 121 offset 968: $dest" >&2
      exit 1
    fi
    if grep -q "slot 122 TraitVPtr offset 976" "$dest"; then
      echo "error: dest TraitVPtr still at slot 122 offset 976: $dest" >&2
      exit 1
    fi
    if grep -q "slot 123 Vacant offset 984" "$dest"; then
      echo "error: dest Vacant still at slot 123 offset 984: $dest" >&2
      exit 1
    fi
    if grep -q "slot 123 TraitVPtr offset 984" "$dest"; then
      echo "error: dest TraitVPtr still at slot 123 offset 984: $dest" >&2
      exit 1
    fi
    if grep -q "slot 124 TraitVPtr offset 992" "$dest"; then
      echo "error: dest TraitVPtr still at slot 124 offset 992: $dest" >&2
      exit 1
    fi
    if grep -q "slot 124 Vacant offset 992" "$dest"; then
      echo "error: dest Vacant still at slot 124 offset 992: $dest" >&2
      exit 1
    fi
    if grep -q "slot 125 TraitVPtr offset 1000" "$dest"; then
      echo "error: dest TraitVPtr still at slot 125 offset 1000: $dest" >&2
      exit 1
    fi
    if grep -q "slot 125 Vacant offset 1000" "$dest"; then
      echo "error: dest Vacant still at slot 125 offset 1000: $dest" >&2
      exit 1
    fi
    if grep -q "slot 126 TraitVPtr offset 1008" "$dest"; then
      echo "error: dest TraitVPtr still at slot 126 offset 1008: $dest" >&2
      exit 1
    fi
    if grep -q "slot 126 Vacant offset 1008" "$dest"; then
      echo "error: dest Vacant still at slot 126 offset 1008: $dest" >&2
      exit 1
    fi
    if grep -q "slot 127 TraitVPtr offset 1016" "$dest"; then
      echo "error: dest TraitVPtr still at slot 127 offset 1016: $dest" >&2
      exit 1
    fi
    if grep -q "slot 127 Vacant offset 1016" "$dest"; then
      echo "error: dest Vacant still at slot 127 offset 1016: $dest" >&2
      exit 1
    fi
    if grep -q "slot 128 TraitVPtr offset 1024" "$dest"; then
      echo "error: dest TraitVPtr still at slot 128 offset 1024: $dest" >&2
      exit 1
    fi
    if grep -q "slot 128 Vacant offset 1024" "$dest"; then
      echo "error: dest Vacant still at slot 128 offset 1024: $dest" >&2
      exit 1
    fi
    if grep -q "slot 129 TraitVPtr offset 1032" "$dest"; then
      echo "error: dest TraitVPtr still at slot 129 offset 1032: $dest" >&2
      exit 1
    fi
    if grep -q "slot 129 Vacant offset 1032" "$dest"; then
      echo "error: dest Vacant still at slot 129 offset 1032: $dest" >&2
      exit 1
    fi
    if grep -q "slot 130 TraitVPtr offset 1040" "$dest"; then
      echo "error: dest TraitVPtr still at slot 130 offset 1040: $dest" >&2
      exit 1
    fi
    if grep -q "slot 130 Vacant offset 1040" "$dest"; then
      echo "error: dest Vacant still at slot 130 offset 1040: $dest" >&2
      exit 1
    fi
    if grep -q "slot 131 TraitVPtr offset 1048" "$dest"; then
      echo "error: dest TraitVPtr still at slot 131 offset 1048: $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 131 Vacant offset 1048" "$dest"; then
      echo "error: dest missing Vacant slot 131 offset 1048: $dest" >&2
      exit 1
    fi
    if ! grep -q "slot 132 TraitVPtr offset 1056" "$dest"; then
      echo "error: dest missing TraitVPtr slot 132 offset 1056: $dest" >&2
      exit 1
    fi
    if grep -q "101 slots, 808 bytes" "$dest"; then
      echo "error: dest still 101 slots / 808 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "102 slots, 816 bytes" "$dest"; then
      echo "error: dest still 102 slots / 816 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "103 slots, 824 bytes" "$dest"; then
      echo "error: dest still 103 slots / 824 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "104 slots, 832 bytes" "$dest"; then
      echo "error: dest still 104 slots / 832 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "105 slots, 840 bytes" "$dest"; then
      echo "error: dest still 105 slots / 840 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "106 slots, 848 bytes" "$dest"; then
      echo "error: dest still 106 slots / 848 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "107 slots, 856 bytes" "$dest"; then
      echo "error: dest still 107 slots / 856 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "108 slots, 864 bytes" "$dest"; then
      echo "error: dest still 108 slots / 864 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "109 slots, 872 bytes" "$dest"; then
      echo "error: dest still 109 slots / 872 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "110 slots, 880 bytes" "$dest"; then
      echo "error: dest still 110 slots / 880 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "111 slots, 888 bytes" "$dest"; then
      echo "error: dest still 111 slots / 888 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "112 slots, 896 bytes" "$dest"; then
      echo "error: dest still 112 slots / 896 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "113 slots, 904 bytes" "$dest"; then
      echo "error: dest still 113 slots / 904 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "114 slots, 912 bytes" "$dest"; then
      echo "error: dest still 114 slots / 912 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "115 slots, 920 bytes" "$dest"; then
      echo "error: dest still 115 slots / 920 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "116 slots, 928 bytes" "$dest"; then
      echo "error: dest still 116 slots / 928 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "117 slots, 936 bytes" "$dest"; then
      echo "error: dest still 117 slots / 936 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "118 slots, 944 bytes" "$dest"; then
      echo "error: dest still 118 slots / 944 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "119 slots, 952 bytes" "$dest"; then
      echo "error: dest still 119 slots / 952 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "120 slots, 960 bytes" "$dest"; then
      echo "error: dest still 120 slots / 960 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "121 slots, 968 bytes" "$dest"; then
      echo "error: dest still 121 slots / 968 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "122 slots, 976 bytes" "$dest"; then
      echo "error: dest still 122 slots / 976 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "123 slots, 984 bytes" "$dest"; then
      echo "error: dest still 123 slots / 984 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "124 slots, 992 bytes" "$dest"; then
      echo "error: dest still 124 slots / 992 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "125 slots, 1000 bytes" "$dest"; then
      echo "error: dest still 125 slots / 1000 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "126 slots, 1008 bytes" "$dest"; then
      echo "error: dest still 126 slots / 1008 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "127 slots, 1016 bytes" "$dest"; then
      echo "error: dest still 127 slots / 1016 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "128 slots, 1024 bytes" "$dest"; then
      echo "error: dest still 128 slots / 1024 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "129 slots, 1032 bytes" "$dest"; then
      echo "error: dest still 129 slots / 1032 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "130 slots, 1040 bytes" "$dest"; then
      echo "error: dest still 130 slots / 1040 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "131 slots, 1048 bytes" "$dest"; then
      echo "error: dest still 131 slots / 1048 bytes: $dest" >&2
      exit 1
    fi
    if grep -q "132 slots, 1056 bytes" "$dest"; then
      echo "error: dest still 132 slots / 1056 bytes: $dest" >&2
      exit 1
    fi
    if ! grep -q "133 slots, 1064 bytes" "$dest"; then
      echo "error: dest still not 133 slots / 1064 bytes: $dest" >&2
      exit 1
    fi
    lean -R "$src_root" --run "$src" "$root" check
    echo "llvm-trait-object-vtable-check: GREEN (dest matches Lean printer)"
