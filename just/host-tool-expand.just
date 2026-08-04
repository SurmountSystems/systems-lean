# Modular just: just/host-tool-expand.just -- A9..A10+++ host tool expand.
# Non-foundation day-to-day develop tools: clean-bootstrap bin link + without-Lake
# hot path. Foundation six stay in just/host.just host-foundation-tools-clean-bootstrap.
# Do not call lake build / lake exe / lake env on measured steps below.
# DualResidual host residual remains; free not claimed. Not PROVABLY/llvm.

# A9..A10+++: relink non-foundation develop host tool ELFs without lake (leanc from IR+rsp).
# Owned: host-front (A9), subset-front (A10), front-mult-package (A10+),
# mult-subset-rebuild (A10++), first-surface (A10+++; hot path first-surface-without-lake).
# Clean-tree policy mirrors A8: bin-only clean -> this recipe; total .lake wipe still
# needs classic Lake once (FullHostElaborateRemains) to restore IR+rsp.
# Greppable: host-develop-tools-clean-bootstrap, HOST-DEVELOP-TOOLS-CLEAN-BOOTSTRAP,
# measuredHostDevelopToolsCleanBootstrap, hostDevelopToolsBinLinkWithoutLakeDualOk,
# Host tool build expand,
# host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface.
host-develop-tools-clean-bootstrap:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    bin_dir="$systems_dir/.lake/build/bin"
    mod="$lean_dir/HostResidualShrink.lean"
    echo "== host-develop-tools-clean-bootstrap (A9..A10+++; no lake on this step) =="
    echo "  policy: relink non-foundation develop host tool ELFs with leanc from existing IR+rsp"
    echo "  inventory: host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    for tok in \
      host-develop-tools-clean-bootstrap \
      measuredHostDevelopToolsCleanBootstrap \
      hostDevelopToolsBinLinkWithoutLakeDualOk \
      measuredHostDevelopToolsInventory \
      host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface \
      subset-front-without-lake \
      subsetFrontWithoutLakeDualOk \
      front-mult-package-without-lake \
      frontMultPackageWithoutLakeDualOk \
      mult-subset-rebuild-without-lake \
      multSubsetRebuildWithoutLakeDualOk \
      first-surface-without-lake \
      firstSurfaceWithoutLakeDualOk \
      measuredHostToolBuildExpand
    do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    if ! grep -qF 'Host tool build expand' "$mod"; then
      echo "error: missing Host tool build expand in $mod" >&2
      exit 1
    fi
    if ! grep -qE 'def hostDevelopToolsBinLinkWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostDevelopToolsBinLinkWithoutLakeDualOk must be true (A9..A10+++)" >&2
      exit 1
    fi
    if ! grep -qE 'def subsetFrontWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: subsetFrontWithoutLakeDualOk must be true (A10)" >&2
      exit 1
    fi
    if ! grep -qE 'def frontMultPackageWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: frontMultPackageWithoutLakeDualOk must be true (A10+)" >&2
      exit 1
    fi
    if ! grep -qE 'def multSubsetRebuildWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: multSubsetRebuildWithoutLakeDualOk must be true (A10++)" >&2
      exit 1
    fi
    if ! grep -qE 'def firstSurfaceWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: firstSurfaceWithoutLakeDualOk must be true (A10+++)" >&2
      exit 1
    fi
    if ! command -v leanc >/dev/null 2>&1; then
      echo "error: leanc not on PATH (need host Lean toolchain; not lake)" >&2
      exit 1
    fi
    tools=(
      slake-host-front
      slake-subset-front
      slake-front-mult-package
      slake-mult-subset-rebuild
      slake-first-surface
    )
    mkdir -p "$bin_dir"
    for tool in "${tools[@]}"; do
      bin="$bin_dir/$tool"
      rsp="$bin.rsp"
      if [[ ! -f "$rsp" ]]; then
        echo "error: missing link response file: $rsp" >&2
        echo "  clean-tree policy: total .lake wipe still needs classic Lake once to restore IR+rsp" >&2
        echo "  (FullHostElaborateRemains): (cd src/systems && lake build $tool)" >&2
        echo "  then re-run: just host-develop-tools-clean-bootstrap" >&2
        exit 1
      fi
      while IFS= read -r line; do
        if [[ "$line" == *".c.o.export"* ]]; then
          obj="${line//\"/}"
          if [[ ! -f "$obj" ]]; then
            echo "error: missing Lake IR object for $tool: $obj" >&2
            echo "  clean-tree policy: restore IR with classic Lake library/exe elaborate once" >&2
            echo "  then re-run: just host-develop-tools-clean-bootstrap" >&2
            exit 1
          fi
        fi
      done < "$rsp"
      echo "  relink (leanc, no lake): $tool"
      rm -f "$bin"
      leanc -o "$bin" @"$rsp"
      if [[ ! -x "$bin" ]]; then
        echo "error: leanc did not produce executable $bin" >&2
        exit 1
      fi
    done
    echo "host-develop-tools-clean-bootstrap: GREEN (host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface relinked with leanc; no lake; A9..A10+++ develop tool expand; FullHostElaborateRemains; host residual remains; not PROVABLY/llvm)"

# A9: Mult-first host fragment front-end without Lake on hot path.
# Same golden corpus as just host-front. Bootstrap: just host-develop-tools-clean-bootstrap
# (or lake build slake-host-front once if IR/rsp missing after total wipe).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Greppable: host-front-without-lake, HOST-FRONT-WITHOUT-LAKE,
# measuredHostLakeFreeHostFront, hostFrontWithoutLakeDualOk.
host-front-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/host-front"
    prebuilt="$systems_dir/.lake/build/bin/slake-host-front"
    mod="$lean_dir/HostFront.lean"
    shrink="$lean_dir/HostResidualShrink.lean"
    echo "== host-front-without-lake (A9; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  input: goldens/host-front G1..G7 + B1..B4"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$shrink" ]]; then
      echo "error: missing $shrink" >&2
      exit 1
    fi
    for tok in hostFrontReady hostFrontGoodG1 hostFrontGoodG7 hostFrontBadB1 \
               hostFrontHostElaboratorResidualRemains SLAKE_HOST_FRONT_V0 HOST-FRONT; do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    for tok in \
      host-front-without-lake \
      measuredHostLakeFreeHostFront \
      hostFrontWithoutLakeDualOk \
      measuredHostDevelopToolsInventory \
      host-front \
      measuredHostToolBuildExpand
    do
      if ! grep -qF "$tok" "$shrink"; then
        echo "error: missing $tok in $shrink" >&2
        exit 1
      fi
    done
    if ! grep -qF 'Host tool build expand' "$shrink"; then
      echo "error: missing Host tool build expand in $shrink" >&2
      exit 1
    fi
    if ! grep -qE 'def hostFrontWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$shrink"; then
      echo "error: hostFrontWithoutLakeDualOk must be true" >&2
      exit 1
    fi
    for f in good-mult-fixture.slake-host good-mult-mini.slake-host \
             good-linear-mini.slake-host good-types-mini.slake-host \
             good-program-mini.slake-host good-graph-mini.slake-host \
             good-compose-mini.slake-host \
             bad-empty.slake-host bad-line-shape.slake-host \
             bad-unknown-cmd.slake-host bad-zero-ctor.slake-host; do
      if [[ ! -f "$goldens_dir/$f" ]]; then
        echo "error: missing golden $goldens_dir/$f" >&2
        exit 1
      fi
    done
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt host front binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-develop-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-host-front)" >&2
      echo "  then re-run: just host-front-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt host front (no lake)"
    "$prebuilt" "$root"
    if ! grep -qF 'mult0' "$goldens_dir/good-mult-fixture.slake-host"; then
      echo "error: G1 golden missing mult0" >&2
      exit 1
    fi
    if ! grep -qF 'LINEAR-EXACT-ONCE' "$goldens_dir/good-linear-mini.slake-host"; then
      echo "error: G3 golden missing LINEAR-EXACT-ONCE" >&2
      exit 1
    fi
    if ! grep -qF 'TYPED_IR_V0' "$goldens_dir/good-types-mini.slake-host"; then
      echo "error: G4 golden missing TYPED_IR_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_PROGRAM_V0' "$goldens_dir/good-program-mini.slake-host"; then
      echo "error: G5 golden missing IR_PROGRAM_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_GRAPH_EDGES_V0' "$goldens_dir/good-graph-mini.slake-host"; then
      echo "error: G6 golden missing IR_GRAPH_EDGES_V0" >&2
      exit 1
    fi
    if ! grep -qF 'HOST_COMPOSE_V0' "$goldens_dir/good-compose-mini.slake-host"; then
      echo "error: G7 golden missing HOST_COMPOSE_V0" >&2
      exit 1
    fi
    if ! grep -qF 'EMPTY-MODULE-FAIL-CLOSED' "$goldens_dir/bad-empty.slake-host"; then
      echo "error: B1 golden missing EMPTY-MODULE-FAIL-CLOSED comment" >&2
      exit 1
    fi
    echo "host-front-without-lake: GREEN (A9 host-front develop tool; no lake on hot path; host residual remains; not PROVABLY/llvm)"

# A10: Mult subset language front-end without Lake on hot path.
# Same golden corpus as just subset-front (goldens/mult-front G1/G2 + B1-B3).
# Bootstrap: just host-develop-tools-clean-bootstrap
# (or lake build slake-subset-front once if IR/rsp missing after total wipe).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Greppable: subset-front-without-lake, SUBSET-FRONT-WITHOUT-LAKE,
# measuredHostLakeFreeSubsetFront, subsetFrontWithoutLakeDualOk.
subset-front-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/mult-front"
    prebuilt="$systems_dir/.lake/build/bin/slake-subset-front"
    mod="$lean_dir/SubsetFront.lean"
    shrink="$lean_dir/HostResidualShrink.lean"
    echo "== subset-front-without-lake (A10; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  input: goldens/mult-front G1/G2 + B1/B2/B3"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$shrink" ]]; then
      echo "error: missing $shrink" >&2
      exit 1
    fi
    for tok in subsetFrontReady SLAKE_SUBSET_FRONT_V0 SUBSET-FRONT \
               subsetFrontGoodG1 subsetFrontBadB1 parseSource; do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    for tok in \
      subset-front-without-lake \
      measuredHostLakeFreeSubsetFront \
      subsetFrontWithoutLakeDualOk \
      measuredHostDevelopToolsInventory \
      host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface \
      measuredHostToolBuildExpand
    do
      if ! grep -qF "$tok" "$shrink"; then
        echo "error: missing $tok in $shrink" >&2
        exit 1
      fi
    done
    if ! grep -qF 'Host tool build expand' "$shrink"; then
      echo "error: missing Host tool build expand in $shrink" >&2
      exit 1
    fi
    if ! grep -qE 'def subsetFrontWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$shrink"; then
      echo "error: subsetFrontWithoutLakeDualOk must be true" >&2
      exit 1
    fi
    for f in good-mult-classic.slake-mult good-single-value.slake-mult \
             bad-unknown-grade.slake-mult bad-kind-mult-mismatch.slake-mult \
             bad-empty.slake-mult; do
      if [[ ! -f "$goldens_dir/$f" ]]; then
        echo "error: missing golden $goldens_dir/$f" >&2
        exit 1
      fi
    done
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt subset front binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-develop-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-subset-front)" >&2
      echo "  then re-run: just subset-front-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt subset front (no lake)"
    "$prebuilt" "$root"
    if ! grep -qF 'MULT-0' "$goldens_dir/good-mult-classic.slake-mult"; then
      echo "error: G1 golden missing MULT-0" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-OMEGA' "$goldens_dir/good-single-value.slake-mult"; then
      echo "error: G2 golden missing MULT-OMEGA" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-9' "$goldens_dir/bad-unknown-grade.slake-mult"; then
      echo "error: B1 golden missing MULT-9" >&2
      exit 1
    fi
    echo "subset-front-without-lake: GREEN (A10 subset-front develop tool; no lake on hot path; host residual remains; not PROVABLY/llvm)"

# A10+: front-end Mult package path without Lake on hot path.
# Same measured path as just front-mult-package: SubsetFront G1 accept then Mult
# package write + dual greps on emit/slake_mult_subset.{h,c}.
# Bootstrap: just host-develop-tools-clean-bootstrap
# (or lake build slake-front-mult-package once if IR/rsp missing after total wipe).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Greppable: front-mult-package-without-lake, FRONT-MULT-PACKAGE-WITHOUT-LAKE,
# measuredHostLakeFreeFrontMultPackage, frontMultPackageWithoutLakeDualOk.
front-mult-package-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    goldens_dir="$systems_dir/goldens/mult-front"
    prebuilt="$systems_dir/.lake/build/bin/slake-front-mult-package"
    mod="$lean_dir/FrontMultPackage.lean"
    shrink="$lean_dir/HostResidualShrink.lean"
    join_mod="$lean_dir/SubsetPackageJoin.lean"
    echo "== front-mult-package-without-lake (A10+; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  path: SubsetFront G1 accept -> Mult package write -> dual greps"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$shrink" ]]; then
      echo "error: missing $shrink" >&2
      exit 1
    fi
    for tok in frontMultPackageFinishedClaimed frontMultPackageReady \
               justRecipeFrontMultPackage front-mult-package \
               frontMultPackageG1Ready subsetFrontGoodG1 \
               SLAKE_FRONT_MULT_PACKAGE_V0 acceptG1Golden multSubsetEmitWrite; do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    for tok in \
      front-mult-package-without-lake \
      measuredHostLakeFreeFrontMultPackage \
      frontMultPackageWithoutLakeDualOk \
      measuredHostDevelopToolsInventory \
      host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface \
      measuredHostToolBuildExpand
    do
      if ! grep -qF "$tok" "$shrink"; then
        echo "error: missing $tok in $shrink" >&2
        exit 1
      fi
    done
    if ! grep -qF 'Host tool build expand' "$shrink"; then
      echo "error: missing Host tool build expand in $shrink" >&2
      exit 1
    fi
    if ! grep -qE 'def frontMultPackageWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$shrink"; then
      echo "error: frontMultPackageWithoutLakeDualOk must be true" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_dir/good-mult-classic.slake-mult" ]]; then
      echo "error: missing G1 golden $goldens_dir/good-mult-classic.slake-mult" >&2
      exit 1
    fi
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt front-mult-package binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-develop-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-front-mult-package)" >&2
      echo "  then re-run: just front-mult-package-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt front-mult-package (no lake)"
    "$prebuilt" "$root"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult package header after front path: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult package source after front path: $out_c" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_EMIT_V0' "$out_h"; then
      echo "error: $out_h missing greppable token SLAKE_MULT_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_EMIT_V0' "$out_c"; then
      echo "error: $out_c missing greppable token SLAKE_MULT_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-0' "$out_h"; then
      echo "error: $out_h missing MULT-0 after front path" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-OMEGA' "$out_c"; then
      echo "error: $out_c missing MULT-OMEGA after front path" >&2
      exit 1
    fi
    if ! grep -qE 'def frontMultPackageFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: frontMultPackageFinishedClaimed must be true for M5 Name B" >&2
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
    if [[ -f "$join_mod" ]]; then
      if ! grep -qE 'def subsetPackageJoinFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$join_mod"; then
        echo "error: subsetPackageJoinFinishedClaimed must stay true (Name A unchanged)" >&2
        exit 1
      fi
    fi
    echo "front-mult-package-without-lake: GREEN (A10+ front-mult-package develop tool; no lake on hot path; host residual remains; not PROVABLY/llvm)"

# A10+++: first compiler surface without Lake on hot path.
# Same Mult readiness print as just first-surface. Bootstrap:
# just host-develop-tools-clean-bootstrap (or lake build slake-first-surface once
# if IR/rsp missing after total wipe). Hot path: exec prebuilt ELF only.
# Greppable: first-surface-without-lake, FIRST-SURFACE-WITHOUT-LAKE,
# measuredHostLakeFreeFirstSurface, firstSurfaceWithoutLakeDualOk.
first-surface-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    prebuilt="$systems_dir/.lake/build/bin/slake-first-surface"
    mod="$lean_dir/FirstSurface.lean"
    shrink="$lean_dir/HostResidualShrink.lean"
    echo "== first-surface-without-lake (A10+++; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  input: SLAKE_FIRST_SURFACE_MULT (COMPILE-PATH-MULT / MULT-FIXTURE)"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$shrink" ]]; then
      echo "error: missing $shrink" >&2
      exit 1
    fi
    for tok in firstSurfaceReady SLAKE_FIRST_SURFACE_MULT stillUsesLake dependsOnLake \
               SLAKE_FIRST_SURFACE_V0 HOST-FIRST-SURFACE; do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    for tok in \
      first-surface-without-lake \
      measuredHostLakeFreeFirstSurface \
      firstSurfaceWithoutLakeDualOk \
      measuredHostDevelopToolsInventory \
      host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface \
      measuredHostToolInventoryDayToDayCandidatesRemain \
      empty
    do
      if ! grep -qF "$tok" "$shrink"; then
        echo "error: missing $tok in $shrink" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def firstSurfaceWithoutLakeDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$shrink"; then
      echo "error: firstSurfaceWithoutLakeDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'measuredHostToolInventoryDayToDayCandidatesRemain[[:space:]]*[=:]' "$shrink"; then
      echo "error: missing measuredHostToolInventoryDayToDayCandidatesRemain in $shrink" >&2
      exit 1
    fi
    if ! grep -A2 'def measuredHostToolInventoryDayToDayCandidatesRemain' "$shrink" | grep -qF '"empty"'; then
      echo "error: day-to-day candidates remain must be empty after first-surface ownership" >&2
      exit 1
    fi
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt first-surface binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-develop-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-first-surface)" >&2
      echo "  then re-run: just first-surface-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt first-surface (no lake)"
    "$prebuilt"
    if ! grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: stillUsesLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: dependsOnLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    echo "first-surface-without-lake: GREEN (A10+++ first-surface develop tool; no lake on hot path; host residual remains; not PROVABLY/llvm)"
