# Modular just: just/freestanding-mult.just -- role recipes (import into root justfile).
mult-subset-freestanding-deepen:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    fs_h="$emit_dir/slake_freestanding.h"
    fs_c="$emit_dir/slake_freestanding.c"
    mult_ssot="$emit_dir/host_emit_mult.ssot.txt"
    mod="$lean_dir/MultFsDeepen.lean"
    echo "== mult-subset-freestanding-deepen (M2 Name B greps; freestanding Mult surface; no lake / no Mult rebuild prebuilt) =="
    echo "  dual: freestanding Mult product wire + Mult subset package + Lean MultFsDeepen pins"
    echo "  freestandingDeepenPartial: true"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingDeepenPartial' "$mod"; then
      echo "error: missing freestandingDeepenPartial in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingDriverComplete' "$mod"; then
      echo "error: missing freestandingDriverComplete pin in $mod" >&2
      exit 1
    fi
    if ! grep -qE 'def freestandingDeepenPartial[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: freestandingDeepenPartial must be true for Name B greps partial" >&2
      exit 1
    fi
    # Partial greps measure does not assert freestandingDriverComplete true/false.
    if ! grep -qF 'multFsDeepenReady' "$mod"; then
      echo "error: missing multFsDeepenReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'mult-subset-freestanding-deepen' "$mod"; then
      echo "error: missing mult-subset-freestanding-deepen cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multFsDeepenKeepsHostLake' "$mod"; then
      echo "error: missing multFsDeepenKeepsHostLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multFsDeepenNotPrebuiltOnly' "$mod"; then
      echo "error: missing multFsDeepenNotPrebuiltOnly honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: stillUsesLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: dependsOnLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_FS_DEEPEN_V0' "$mod"; then
      echo "error: missing SLAKE_MULT_FS_DEEPEN_V0 stage id in $mod" >&2
      exit 1
    fi
    # Hot path: freestanding Mult surface + Mult subset package greps only.
    # Do not call lake build / lake exe / lake env. Do not require Mult rebuild prebuilt.
    echo "  hot path: freestanding Mult dual greps (no lake; no Mult rebuild prebuilt)"
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult subset header: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult subset source: $out_c" >&2
      exit 1
    fi
    if [[ ! -f "$fs_h" ]]; then
      echo "error: missing freestanding product header: $fs_h" >&2
      exit 1
    fi
    if [[ ! -f "$fs_c" ]]; then
      echo "error: missing freestanding product source: $fs_c" >&2
      exit 1
    fi
    if [[ ! -f "$mult_ssot" ]]; then
      echo "error: missing Mult host emit SSOT: $mult_ssot" >&2
      exit 1
    fi
    for tok in MULT-0 HOST-EMIT-MULT enum\ slake_mult; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: Mult subset header missing $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$fs_h"; then
        echo "error: freestanding product header missing $tok" >&2
        exit 1
      fi
    done
    for tok in MULT-0 HOST-EMIT-MULT slake_mult_is_valid; do
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: Mult subset source missing $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$fs_c"; then
        echo "error: freestanding product source missing $tok" >&2
        exit 1
      fi
    done
    for tok in MULT-SUBSET-EMIT SLAKE_MULT_SUBSET_EMIT_V0 SLAKE_FIRST_SURFACE_MULT; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: Mult subset header missing package token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: Mult subset source missing package token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'MULT-0' "$mult_ssot"; then
      echo "error: host_emit_mult.ssot.txt missing MULT-0" >&2
      exit 1
    fi
    if ! grep -qF 'slake_mult_is_valid' "$mult_ssot"; then
      echo "error: host_emit_mult.ssot.txt missing slake_mult_is_valid" >&2
      exit 1
    fi
    # Name A without-Lake finished remains (additive; prebuilt path still valid).
    rebuild_mod="$lean_dir/MultSubsetRebuild.lean"
    if [[ ! -f "$rebuild_mod" ]]; then
      echo "error: missing $rebuild_mod (Name A input)" >&2
      exit 1
    fi
    if ! grep -qE 'def multSubsetRebuildWithoutLakeFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$rebuild_mod"; then
      echo "error: Name A multSubsetRebuildWithoutLakeFinishedClaimed must stay true" >&2
      exit 1
    fi
    echo "mult-subset-freestanding-deepen: GREEN"

# Name B full Mult package write (P1 Lean-native MultSubsetEmit IO).
# Living writer: MultFsWriteTool / MultFsDeepen MultSubsetEmit IO.FS.writeFile.
# Does NOT print full host-cc C tool sources from Lean (Path A C-print retired).
# Measured path prefer order:
#   1) prebuilt Mult package write without lake invoke
#   2) prebuilt slake-mult-fs-write-tool without lake invoke
#   3) lake exe slake-mult-fs-write-tool (bootstrap when prebuilts missing)
# Not Mult rebuild ELF as package writer. Retired greppable Path A names
# (slake_mult_fs_write_tool.c / slake-mult-fs-write-cc) stay in Lean pins only.
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# Greppable: mult-subset-freestanding-write, slake-mult-fs-write-cc, MULT-FS-WRITE,
# MULT-FS-WRITE-TOOL, freestandingDriverComplete, multFsWritePathReady,
# freestandingWriteToolNotLakeBuilt, multFsWriteNotRebuildDriver,
# multFsWriteToolNativeIo, multFsWriteToolPrintsFullHelperC.
mult-subset-freestanding-write:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    fs_h="$emit_dir/slake_freestanding.h"
    fs_c="$emit_dir/slake_freestanding.c"
    mult_ssot="$emit_dir/host_emit_mult.ssot.txt"
    mod="$lean_dir/MultFsDeepen.lean"
    tool_mod="$lean_dir/MultFsWriteTool.lean"
    lake_write_bin="$systems_dir/.lake/build/bin/slake-mult-fs-write"
    tool_write_bin="$systems_dir/.lake/build/bin/slake-mult-fs-write-tool"
    rebuild_bin="$systems_dir/.lake/build/bin/slake-mult-subset-rebuild"
    echo "== mult-subset-freestanding-write (P1 Lean-native Mult package write) =="
    echo "  package builder: MultSubsetEmit freestanding Mult SSOT (IO.FS.writeFile)"
    echo "  freestandingDriverComplete: true; multFsWritePathReady: true"
    echo "  Path A host-cc C print: retired (multFsWriteToolPrintsFullHelperC false)"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$tool_mod" ]]; then
      echo "error: missing $tool_mod" >&2
      exit 1
    fi
    if ! grep -qF 'multFsWrite' "$mod"; then
      echo "error: missing multFsWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multFsWritePathReady' "$mod"; then
      echo "error: missing multFsWritePathReady in $mod" >&2
      exit 1
    fi
    if ! grep -qE 'def multFsWritePathReady[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: multFsWritePathReady must be true (host MultSubsetEmit SSOT write path)" >&2
      exit 1
    fi
    if ! grep -qE 'def freestandingDriverComplete[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: freestandingDriverComplete must be true (Name B Mult write dual evidence)" >&2
      exit 1
    fi
    if ! grep -qE 'def freestandingDeepenPartial[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: freestandingDeepenPartial must stay true" >&2
      exit 1
    fi
    if ! grep -qF 'multFsWriteNotRebuildDriver' "$mod"; then
      echo "error: missing multFsWriteNotRebuildDriver honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingWriteToolNotLakeBuilt' "$mod"; then
      echo "error: missing freestandingWriteToolNotLakeBuilt in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'slake-mult-fs-write-cc' "$mod"; then
      echo "error: missing slake-mult-fs-write-cc cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'mult-subset-freestanding-write' "$mod"; then
      echo "error: missing mult-subset-freestanding-write cite in $mod" >&2
      exit 1
    fi
    if ! grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: stillUsesLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: dependsOnLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def multFsWriteToolNativeIo[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$tool_mod"; then
      echo "error: multFsWriteToolNativeIo must be true (P1 Lean-native Mult write)" >&2
      exit 1
    fi
    if ! grep -qE 'def multFsWriteToolPrintsFullHelperC[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$tool_mod"; then
      echo "error: multFsWriteToolPrintsFullHelperC must be false (no C-in-Lean helper)" >&2
      exit 1
    fi
    # Living Mult package write: Lean MultSubsetEmit path. Prefer prebuilt without
    # lake invoke; fall back to lake exe MultFsWriteTool. Never Mult rebuild ELF.
    # Never host-cc of Lean-printed full tool C (P1 retired).
    if [[ -x "$lake_write_bin" ]]; then
      echo "  hot path: prebuilt Mult package write (no lake invoke; MultSubsetEmit IO)"
      if [[ "$lake_write_bin" == "$rebuild_bin" ]]; then
        echo "error: Mult rebuild ELF must not be Mult package writer" >&2
        exit 1
      fi
      "$lake_write_bin" "$root"
    elif [[ -x "$tool_write_bin" ]]; then
      echo "  hot path: prebuilt MultFsWriteTool (no lake invoke; Lean-native Mult write)"
      "$tool_write_bin" "$root"
    elif command -v lake >/dev/null 2>&1; then
      echo "  bootstrap path: lake exe slake-mult-fs-write-tool (Lean-native Mult write)"
      (cd "$systems_dir" && lake build slake-mult-fs-write-tool && lake exe slake-mult-fs-write-tool -- "$root")
    else
      echo "error: Mult package writer missing (need prebuilt Mult write or lake)" >&2
      echo "  bootstrap: (cd src/systems && lake build slake-mult-fs-write-tool && lake exe slake-mult-fs-write-tool -- $root)" >&2
      echo "  or: (cd src/systems && lake build slake-mult-fs-write)" >&2
      exit 1
    fi
    if [[ -x "$rebuild_bin" ]]; then
      echo "  note: Mult rebuild prebuilt present (Name A path) but not used as Mult package writer"
    fi
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult subset header after Mult SSOT write: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult subset source after Mult SSOT write: $out_c" >&2
      exit 1
    fi
    for tok in MULT-SUBSET-EMIT SLAKE_MULT_SUBSET_EMIT_V0 SLAKE_FIRST_SURFACE_MULT HOST-EMIT-MULT MULT-0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok after write" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok after write" >&2
        exit 1
      fi
    done
    if ! grep -qF 'enum slake_mult' "$out_h"; then
      echo "error: $out_h missing enum slake_mult after write" >&2
      exit 1
    fi
    if ! grep -qF 'slake_mult_is_valid' "$out_c"; then
      echo "error: $out_c missing slake_mult_is_valid after write" >&2
      exit 1
    fi
    # Dual freestanding Mult product wire still present (surface dual-check).
    if [[ ! -f "$fs_h" ]] || [[ ! -f "$fs_c" ]] || [[ ! -f "$mult_ssot" ]]; then
      echo "error: freestanding Mult product wire / Mult SSOT missing after write" >&2
      exit 1
    fi
    for tok in MULT-0 HOST-EMIT-MULT; do
      if ! grep -qF "$tok" "$fs_h"; then
        echo "error: freestanding product header missing $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$fs_c"; then
        echo "error: freestanding product source missing $tok" >&2
        exit 1
      fi
    done
    echo "mult-subset-freestanding-write: GREEN"

# M4 Name B freestanding product-wire WRITE+INSTALL (P1 Lean-native).
# Living: freestandingCapableWriteFreestandingHc + freestandingCapableInstallFreestandingOut
# via ProductWireWriteTool (IO.FS.writeFile). Does NOT print full host-cc C tool
# sources from Lean (Path A C-print retired). Measured path prefer order:
#   1) prebuilt CapableRegenerate without lake (WRITE+INSTALL dual-eq)
#   2) prebuilt slake-product-wire-fs-write-tool without lake
#   3) lake exe slake-product-wire-fs-write-tool (bootstrap)
# Retired greppable Path A names stay in Lean pins only.
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# freestandingDriverComplete stays Mult-orthogonal (separate productWireFsWriterFinishedClaimed).
# Greppable: product-wire-freestanding-write, slake-product-wire-fs-write-cc,
# PRODUCT-WIRE-FS-WRITE-TOOL, productWireFsWriterFinishedClaimed,
# productWireFsWriterNotLakeBuilt, productWireFsWriterReady,
# productWireFsWriterNativeIo, productWireFsWriterPrintsFullHelperC.
product-wire-freestanding-write:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_dir="$root/out/freestanding-c"
    out_h="$emit_dir/slake_freestanding.h"
    out_c="$emit_dir/slake_freestanding.c"
    install_h="$out_dir/slake_freestanding.h"
    install_c="$out_dir/slake_freestanding.c"
    tool_mod="$lean_dir/ProductWireWriteTool.lean"
    lake_regen_bin="$systems_dir/.lake/build/bin/slake-freestanding-capable-regenerate"
    tool_write_bin="$systems_dir/.lake/build/bin/slake-product-wire-fs-write-tool"
    echo "== product-wire-freestanding-write (P1 Lean-native freestanding WRITE+INSTALL) =="
    echo "  productWireFsWriterFinishedClaimed: true; freestandingDriverComplete: Mult-orthogonal"
    echo "  Path A host-cc C print: retired (productWireFsWriterPrintsFullHelperC false)"
    if [[ ! -f "$tool_mod" ]]; then
      echo "error: missing $tool_mod" >&2
      exit 1
    fi
    if ! grep -qF 'productWireFsWriterFinishedClaimed' "$tool_mod"; then
      echo "error: missing productWireFsWriterFinishedClaimed in $tool_mod" >&2
      exit 1
    fi
    if ! grep -qE 'def productWireFsWriterFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$tool_mod"; then
      echo "error: productWireFsWriterFinishedClaimed must be true for M4 Name B finished" >&2
      exit 1
    fi
    if ! grep -qF 'productWireFsWriterNotLakeBuilt' "$tool_mod"; then
      echo "error: missing productWireFsWriterNotLakeBuilt in $tool_mod" >&2
      exit 1
    fi
    if ! grep -qF 'productWireFsWriterReady' "$tool_mod"; then
      echo "error: missing productWireFsWriterReady in $tool_mod" >&2
      exit 1
    fi
    if ! grep -qF 'productWireFsWriterKeepsHostLake' "$tool_mod"; then
      echo "error: missing productWireFsWriterKeepsHostLake honesty in $tool_mod" >&2
      exit 1
    fi
    if ! grep -qF 'slake-product-wire-fs-write-cc' "$tool_mod"; then
      echo "error: missing slake-product-wire-fs-write-cc cite in $tool_mod" >&2
      exit 1
    fi
    if ! grep -qF 'product-wire-freestanding-write' "$tool_mod"; then
      echo "error: missing product-wire-freestanding-write cite in $tool_mod" >&2
      exit 1
    fi
    if ! grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$tool_mod"; then
      echo "error: stillUsesLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$tool_mod"; then
      echo "error: dependsOnLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def productWireFsWriterNativeIo[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$tool_mod"; then
      echo "error: productWireFsWriterNativeIo must be true (P1 Lean-native product-wire write)" >&2
      exit 1
    fi
    if ! grep -qE 'def productWireFsWriterPrintsFullHelperC[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$tool_mod"; then
      echo "error: productWireFsWriterPrintsFullHelperC must be false (no C-in-Lean helper)" >&2
      exit 1
    fi
    # Living product-wire WRITE+INSTALL: Lean dual-eq Capable path. Prefer prebuilt
    # without lake invoke; fall back to lake exe ProductWireWriteTool. Never
    # host-cc of Lean-printed full tool C (P1 retired).
    if [[ -x "$lake_regen_bin" ]]; then
      echo "  hot path: prebuilt CapableRegenerate (no lake invoke; dual-eq WRITE+INSTALL)"
      "$lake_regen_bin" "$root"
    elif [[ -x "$tool_write_bin" ]]; then
      echo "  hot path: prebuilt ProductWireWriteTool (no lake invoke; Lean-native WRITE+INSTALL)"
      "$tool_write_bin" "$root"
    elif command -v lake >/dev/null 2>&1; then
      echo "  bootstrap path: lake exe slake-product-wire-fs-write-tool (Lean-native WRITE+INSTALL)"
      (cd "$systems_dir" && lake build slake-product-wire-fs-write-tool && lake exe slake-product-wire-fs-write-tool -- "$root")
    else
      echo "error: product-wire writer missing (need prebuilt CapableRegenerate or lake)" >&2
      echo "  bootstrap: (cd src/systems && lake build slake-product-wire-fs-write-tool && lake exe slake-product-wire-fs-write-tool -- $root)" >&2
      echo "  or: (cd src/systems && lake build slake-freestanding-capable-regenerate)" >&2
      exit 1
    fi
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing freestanding header after product-wire write: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing freestanding source after product-wire write: $out_c" >&2
      exit 1
    fi
    if [[ ! -f "$install_h" ]]; then
      echo "error: missing Out install header after product-wire write: $install_h" >&2
      exit 1
    fi
    if [[ ! -f "$install_c" ]]; then
      echo "error: missing Out install source after product-wire write: $install_c" >&2
      exit 1
    fi
    for tok in SLAKE_EMIT_FREESTANDING_C_V0 HOST-EMIT-MULT HOST-EMIT-LINEAR HOST-EMIT-SSOT; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok after write" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok after write" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$install_h"; then
        echo "error: $install_h missing greppable token $tok after install" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$install_c"; then
        echo "error: $install_c missing greppable token $tok after install" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def productWireFsWriterReady[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=' "$tool_mod"; then
      echo "error: productWireFsWriterReady missing after product-wire write (host bar)" >&2
      exit 1
    fi
    echo "product-wire-freestanding-write: GREEN"

# Pure Nix systems host presence (skeleton + unit-surface + SYSTEMS_LEAN_HOST +
# tree-wide banned-jargon walk under src/systems). Live impure worktree eval.
