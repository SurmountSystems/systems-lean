# Modular just: just/subset-join.just -- role recipes (import into root justfile).
# M5 Name A: multi-unit subset package rebuild join (Mult..Compose ordered).
# Prefer Mult without-Lake measured step; other units use existing rebuild recipes.
# Dual evidence: Lean SubsetPackageJoin pins + on-disk unit package stage tokens.
# Product StillUsesLake / DependsOnLake stay true. Not Name B/C; not S4/M6.
# Greppable: subset-packages-rebuild-join, SUBSET-PACKAGE-JOIN,
# subsetPackageJoinFinishedClaimed, subsetPackageJoinReady, justRecipeSubsetPackageJoin.
# Name A join may still use Lake-hosted unit rebuild recipes for non-Mult.
# Name C without-Lake multi-unit join is subset-packages-rebuild-join-without-lake.
subset-packages-rebuild-join:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    mod="$lean_dir/SubsetPackageJoin.lean"
    echo "== subset-packages-rebuild-join (M5 multi-unit package rebuild join) =="
    echo "  order: Mult(without-Lake) Linear Types Program Extract Erasure Graph Compose"
    echo "  dual: Lean join pin + emit/slake_*_subset stage tokens"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinFinishedClaimed' "$mod"; then
      echo "error: missing subsetPackageJoinFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinReady' "$mod"; then
      echo "error: missing subsetPackageJoinReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeSubsetPackageJoin' "$mod"; then
      echo "error: missing justRecipeSubsetPackageJoin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subset-packages-rebuild-join' "$mod"; then
      echo "error: missing subset-packages-rebuild-join cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinKeepsHostLake' "$mod"; then
      echo "error: missing subsetPackageJoinKeepsHostLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_SUBSET_PACKAGE_JOIN_V0' "$mod"; then
      echo "error: missing SLAKE_SUBSET_PACKAGE_JOIN_V0 stage id in $mod" >&2
      exit 1
    fi
    # Ordered unit rebuilds (reuse existing recipes; Mult prefers without-Lake).
    just mult-subset-rebuild-without-lake
    just linear-subset-rebuild
    just types-subset-rebuild
    just program-subset-rebuild
    just extract-subset-rebuild
    just erasure-subset-rebuild
    just graph-subset-rebuild
    just compose-subset-rebuild
    # Dual greps: each unit package emit stage token on header + source.
    for pair in \
      "mult:SLAKE_MULT_SUBSET_EMIT_V0" \
      "linear:SLAKE_LINEAR_SUBSET_EMIT_V0" \
      "types:SLAKE_TYPES_SUBSET_EMIT_V0" \
      "program:SLAKE_PROGRAM_SUBSET_EMIT_V0" \
      "extract:SLAKE_EXTRACT_SUBSET_EMIT_V0" \
      "erasure:SLAKE_ERASURE_SUBSET_EMIT_V0" \
      "graph:SLAKE_GRAPH_SUBSET_EMIT_V0" \
      "compose:SLAKE_COMPOSE_SUBSET_EMIT_V0"
    do
      unit="${pair%%:*}"
      tok="${pair##*:}"
      out_h="$emit_dir/slake_${unit}_subset.h"
      out_c="$emit_dir/slake_${unit}_subset.c"
      if [[ ! -f "$out_h" ]]; then
        echo "error: missing unit package header after join: $out_h" >&2
        exit 1
      fi
      if [[ ! -f "$out_c" ]]; then
        echo "error: missing unit package source after join: $out_c" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    # Structural join pins must stay true (M5 Name A finished; Name C multi-unit true).
    if ! grep -qE 'def subsetPackageJoinFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: subsetPackageJoinFinishedClaimed must be true for M5 Name A" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinReady' "$mod"; then
      echo "error: subsetPackageJoinReady missing after multi-unit join (host bar)" >&2
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
    # Non-Mult per-unit without-Lake finished stay false (join-level Name C only).
    for unit_mod in Linear Types Program Extract Erasure Graph Compose; do
      um="$lean_dir/${unit_mod}SubsetRebuild.lean"
      case "$unit_mod" in
        Linear) pin="linearSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Types) pin="typesSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Program) pin="programSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Extract) pin="extractSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Erasure) pin="erasureSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Graph) pin="graphSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Compose) pin="composeSubsetRebuildWithoutLakeFinishedClaimed" ;;
      esac
      if ! grep -qE "def ${pin}[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false" "$um"; then
        echo "error: $pin must stay false in $um (no dedicated per-unit without-Lake recipe)" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed must be true (M5 Name C)" >&2
      exit 1
    fi
    echo "subset-packages-rebuild-join: GREEN"

# M5 Name C: multi-unit package rebuild join without Lake on hot path.
# Runs prebuilt unit rebuild ELFs Mult..Compose (bootstrap once via lake build).
# No lake build / lake exe / lake env on measured path. Dual evidence all packages.
# Non-Mult per-unit withoutLakeFinished stay false; multi-unit join pin true.
# Product StillUsesLake / DependsOnLake stay true. Greppable:
# subset-packages-rebuild-join-without-lake, SUBSET-PACKAGE-JOIN-WITHOUT-LAKE,
# subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed,
# justRecipeSubsetPackageJoinWithoutLake, prebuiltUnitRebuildBinDirRel.
subset-packages-rebuild-join-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    bin_dir="$systems_dir/.lake/build/bin"
    mod="$lean_dir/SubsetPackageJoin.lean"
    echo "== subset-packages-rebuild-join-without-lake (M5 Name C multi-unit join) =="
    echo "  order: Mult Linear Types Program Extract Erasure Graph Compose"
    echo "  hot path: prebuilt unit rebuild ELFs only (no lake)"
    echo "  dual: Lean multi-unit without-Lake pin + emit/slake_*_subset stage tokens"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed' "$mod"; then
      echo "error: missing subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeSubsetPackageJoinWithoutLake' "$mod"; then
      echo "error: missing justRecipeSubsetPackageJoinWithoutLake in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subset-packages-rebuild-join-without-lake' "$mod"; then
      echo "error: missing subset-packages-rebuild-join-without-lake cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'prebuiltUnitRebuildBinDirRel' "$mod"; then
      echo "error: missing prebuiltUnitRebuildBinDirRel in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing subsetPackageJoinWithoutLakeKeepsHostLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinWithoutLakeReady' "$mod"; then
      echo "error: missing subsetPackageJoinWithoutLakeReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinFinishedClaimed' "$mod"; then
      echo "error: missing subsetPackageJoinFinishedClaimed (Name A) in $mod" >&2
      exit 1
    fi
    # Hot path: run each prebuilt unit rebuild ELF. No lake build/exe/env.
    for unit in mult linear types program extract erasure graph compose; do
      prebuilt="$bin_dir/slake-${unit}-subset-rebuild"
      if [[ ! -x "$prebuilt" ]]; then
        echo "error: missing prebuilt unit rebuild binary: $prebuilt" >&2
        echo "  bootstrap once (not hot path): (cd src/systems && lake build slake-${unit}-subset-rebuild)" >&2
        echo "  then re-run: just subset-packages-rebuild-join-without-lake" >&2
        exit 1
      fi
      echo "  hot path: exec prebuilt $unit rebuild (no lake)"
      "$prebuilt" "$root"
    done
    # Dual greps: each unit package emit stage token on header + source.
    for pair in \
      "mult:SLAKE_MULT_SUBSET_EMIT_V0" \
      "linear:SLAKE_LINEAR_SUBSET_EMIT_V0" \
      "types:SLAKE_TYPES_SUBSET_EMIT_V0" \
      "program:SLAKE_PROGRAM_SUBSET_EMIT_V0" \
      "extract:SLAKE_EXTRACT_SUBSET_EMIT_V0" \
      "erasure:SLAKE_ERASURE_SUBSET_EMIT_V0" \
      "graph:SLAKE_GRAPH_SUBSET_EMIT_V0" \
      "compose:SLAKE_COMPOSE_SUBSET_EMIT_V0"
    do
      unit="${pair%%:*}"
      tok="${pair##*:}"
      out_h="$emit_dir/slake_${unit}_subset.h"
      out_c="$emit_dir/slake_${unit}_subset.c"
      if [[ ! -f "$out_h" ]]; then
        echo "error: missing unit package header after without-Lake join: $out_h" >&2
        exit 1
      fi
      if [[ ! -f "$out_c" ]]; then
        echo "error: missing unit package source after without-Lake join: $out_c" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    # Structural pins: Name A finished + Name C multi-unit without-Lake true.
    if ! grep -qE 'def subsetPackageJoinFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: subsetPackageJoinFinishedClaimed must stay true (Name A)" >&2
      exit 1
    fi
    if ! grep -qE 'def subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed must be true for M5 Name C" >&2
      exit 1
    fi
    if ! grep -qF 'subsetPackageJoinWithoutLakeReady' "$mod"; then
      echo "error: subsetPackageJoinWithoutLakeReady missing after without-Lake join" >&2
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
    # Non-Mult per-unit without-Lake finished stay false (join-level claim only).
    for unit_mod in Linear Types Program Extract Erasure Graph Compose; do
      um="$lean_dir/${unit_mod}SubsetRebuild.lean"
      case "$unit_mod" in
        Linear) pin="linearSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Types) pin="typesSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Program) pin="programSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Extract) pin="extractSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Erasure) pin="erasureSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Graph) pin="graphSubsetRebuildWithoutLakeFinishedClaimed" ;;
        Compose) pin="composeSubsetRebuildWithoutLakeFinishedClaimed" ;;
      esac
      if ! grep -qE "def ${pin}[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false" "$um"; then
        echo "error: $pin must stay false in $um (no dedicated per-unit without-Lake recipe)" >&2
        exit 1
      fi
    done
    # Mult without-Lake finished stays true (M2 reusable).
    mult_mod="$lean_dir/MultSubsetRebuild.lean"
    if ! grep -qE 'def multSubsetRebuildWithoutLakeFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mult_mod"; then
      echo "error: multSubsetRebuildWithoutLakeFinishedClaimed must stay true" >&2
      exit 1
    fi
    echo "subset-packages-rebuild-join-without-lake: GREEN"

# M6 Lake retire inventory (phase 1 inventory + phase 2 product pin honesty).
# Greps Lean inventory pins + justfile Lake-free product recipes + product
# StillUsesLake false on SelfHostComplete + DualResidual host residual remains.
# Does not run lake build/exe on hot path. Greppable: lake-retire-inventory,
# LAKE-RETIRE-INVENTORY, lakeRetireInventoryReady,
# productPathMeasuredStepsLakeFreeEvidence, lakeRetireProductPathLakeRetired,
# lakeRetireKeepsProductStillUsesLake, justRecipeLakeRetireInventory.
lake-retire-inventory:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=("$root/justfile" "$root"/just/*.just)
    product_wire_just="$root/just/product-wire.just"
    mod="$lean_dir/LakeRetireInventory.lean"
    self_host_complete="$lean_dir/SelfHostComplete.lean"
    dual_residual="$lean_dir/DualResidual.lean"
    echo "== lake-retire-inventory (M6 inventory + product path Lake retired) =="
    echo "  dual: Lean inventory pins + justfile Lake-free recipes + product StillUsesLake false"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$self_host_complete" ]]; then
      echo "error: missing $self_host_complete" >&2
      exit 1
    fi
    if [[ ! -f "$dual_residual" ]]; then
      echo "error: missing $dual_residual" >&2
      exit 1
    fi
    # Inventory module structural pins present.
    for tok in \
      lakeRetireInventoryReady \
      lakeRetireInventoryFinishedClaimed \
      productPathMeasuredStepsLakeFreeEvidence \
      lakeRetireProductPathLakeRetired \
      lakeRetireKeepsProductStillUsesLake \
      justRecipeLakeRetireInventory \
      lake-retire-inventory \
      lakeRetireHostElaborateRemains \
      lakeRetireBootstrapPrebuildRemains \
      lakeRetireDiagnosticLakeRecipesRemain \
      measuredLakeFreeJustBuild \
      measuredLakeFreeProductWireWrite \
      measuredLakeFreeCapableRegenerate \
      measuredLakeFreeMultRebuild \
      measuredLakeFreeMultWrite \
      measuredLakeFreeMultDeepen \
      measuredLakeFreeSubsetPackageJoin \
      stillUsesLake \
      dependsOnLake \
      LAKE-RETIRE-INVENTORY \
      SLAKE_LAKE_RETIRE_INVENTORY_V0 \
      HOST-LAKE-RETIRE-INVENTORY
    do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    # Finished + product path Lake retired + host residual remains.
    if ! grep -qE 'def lakeRetireInventoryFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: lakeRetireInventoryFinishedClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod"; then
      echo "error: stillUsesLake must be false (M6 product path Lake retired)" >&2
      exit 1
    fi
    if ! grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod"; then
      echo "error: dependsOnLake must be false (M6 product path Lake retired)" >&2
      exit 1
    fi
    if ! grep -qE 'def lakeRetireHostElaborateRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: lakeRetireHostElaborateRemains must stay true" >&2
      exit 1
    fi
    # Product official path StillUsesLake false (SelfHostComplete living tip).
    if ! grep -qE 'def productPathOfficialPathStillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$self_host_complete"; then
      echo "error: productPathOfficialPathStillUsesLake must be false in SelfHostComplete (M6)" >&2
      exit 1
    fi
    if ! grep -qE 'def productPathPerformDependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$self_host_complete"; then
      echo "error: productPathPerformDependsOnLake must be false in SelfHostComplete (M6)" >&2
      exit 1
    fi
    # Dual residual host elaborator residual remains true.
    if ! grep -qE 'def hostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$dual_residual"; then
      echo "error: hostElaboratorResidualRemains must stay true in DualResidual" >&2
      exit 1
    fi
    # Free claimed true is orthogonal (not Lake gone).
    if ! grep -qE 'def residualFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$dual_residual"; then
      echo "error: residualFreeClaimed must stay true in DualResidual (free != Lake gone)" >&2
      exit 1
    fi
    # justfile documents measured Lake-free product recipes (dual evidence).
    for recipe in \
      product-wire-freestanding-write \
      freestanding-capable-regenerate-without-lake \
      mult-subset-rebuild-without-lake \
      mult-subset-freestanding-write \
      mult-subset-freestanding-deepen \
      subset-packages-rebuild-join-without-lake \
      lake-retire-inventory
    do
      if ! grep -qE "^${recipe}:" "${just_sources[@]}"; then
        echo "error: missing just recipe '${recipe}:' in modular just tree (Lake-free inventory dual)" >&2
        exit 1
      fi
    done
    # Official build exists as product hot path (M4 Name C).
    if ! grep -qE '^build:' "${just_sources[@]}"; then
      echo "error: missing just build recipe (measured Lake-free product path)" >&2
      exit 1
    fi
    # Ban forge: product pins true after M6 is wrong; host residual free is wrong.
    if grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: forge ban: stillUsesLake true on inventory after M6 product retire" >&2
      exit 1
    fi
    if grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: forge ban: dependsOnLake true on inventory after M6 product retire" >&2
      exit 1
    fi
    if grep -qE 'def productPathOfficialPathStillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$self_host_complete"; then
      echo "error: forge ban: productPathOfficialPathStillUsesLake true after M6" >&2
      exit 1
    fi
    if grep -qE 'def hostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$dual_residual"; then
      echo "error: forge ban: hostElaboratorResidualRemains false (host residual remains)" >&2
      exit 1
    fi
    echo "  inventory: product measured Lake-free recipes dual-pinned"
    echo "  honesty: product StillUsesLake false; DependsOnLake false; host residual remains"
    echo "  non-claims: free/complete/driver unchanged; not PROVABLY/llvm; not host free"
    echo "lake-retire-inventory: GREEN"

# Peer elaborator step 10: host residual shrink inventory (partial only).
# Named Mult-first host develop paths Lake-free on hot path; full host residual remains.
# Greppable: host-residual-shrink, HOST-RESIDUAL-SHRINK, hostResidualShrinkReady,
# hostResidualPartialShrinkClaimed, hostDevelopMeasuredPathsLakeFreeEvidence,
# justRecipeHostResidualShrink, host-fragment-check-without-lake,
# host-graph-without-lake, host-package-write-without-lake.
