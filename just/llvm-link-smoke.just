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
