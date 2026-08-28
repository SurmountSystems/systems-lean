# Modular just: just/host-without-lake.just -- role recipes (import into root justfile).
host-graph:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/host-graph"
    echo "== host-graph (Mult-first host fragment module graph) =="
    echo "  input: goldens/host-graph Mult + MultSubsetEmit + Linear + Types + Program + Graph + Compose + bad-missing + bad-cycle"
    echo "  output: hostGraphReady / finished; host residual remains; Lake OK"
    mod="$lean_dir/HostGraph.lean"
    main_mod="$lean_dir/HostGraphMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'SYSTEMS_LEAN_HOST' "$mod"; then
      echo "error: missing SYSTEMS_LEAN_HOST in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_HOST_GRAPH_V0' "$mod"; then
      echo "error: missing SLAKE_HOST_GRAPH_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-GRAPH' "$mod"; then
      echo "error: missing HOST-GRAPH in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'resolveGraph' "$mod"; then
      echo "error: missing resolveGraph in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphReady' "$mod"; then
      echo "error: missing hostGraphReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'MISSING-IMPORT' "$mod"; then
      echo "error: missing MISSING-IMPORT in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'IMPORT-CYCLE' "$mod"; then
      echo "error: missing IMPORT-CYCLE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodLinearExpand' "$mod"; then
      echo "error: missing hostGraphGoodLinearExpand in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodTypesExpand' "$mod"; then
      echo "error: missing hostGraphGoodTypesExpand in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodProgramExpand' "$mod"; then
      echo "error: missing hostGraphGoodProgramExpand in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodGraphExpand' "$mod"; then
      echo "error: missing hostGraphGoodGraphExpand in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodComposeExpand' "$mod"; then
      echo "error: missing hostGraphGoodComposeExpand in $mod" >&2
      exit 1
    fi
    for f in mult.slake-host mult-subset-emit.slake-host linear.slake-host \
             types.slake-host program.slake-host graph.slake-host \
             compose.slake-host \
             bad-missing-import.slake-host bad-cycle-a.slake-host \
             bad-cycle-b.slake-host; do
      if [[ ! -f "$goldens_dir/$f" ]]; then
        echo "error: missing golden $goldens_dir/$f" >&2
        exit 1
      fi
    done
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; host-graph requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-host-graph
      lake exe slake-host-graph -- "$root"
    )
    if ! grep -qF 'import Mult' "$goldens_dir/mult-subset-emit.slake-host"; then
      echo "error: MultSubsetEmit golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'LINEAR-EXACT-ONCE' "$goldens_dir/linear.slake-host"; then
      echo "error: Linear golden missing LINEAR-EXACT-ONCE" >&2
      exit 1
    fi
    if ! grep -qF 'import Mult' "$goldens_dir/linear.slake-host"; then
      echo "error: Linear golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'TYPED_IR_V0' "$goldens_dir/types.slake-host"; then
      echo "error: Types golden missing TYPED_IR_V0" >&2
      exit 1
    fi
    if ! grep -qF 'import Mult' "$goldens_dir/types.slake-host"; then
      echo "error: Types golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'IR_PROGRAM_V0' "$goldens_dir/program.slake-host"; then
      echo "error: Program golden missing IR_PROGRAM_V0" >&2
      exit 1
    fi
    if ! grep -qF 'import Mult' "$goldens_dir/program.slake-host"; then
      echo "error: Program golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'IR_GRAPH_EDGES_V0' "$goldens_dir/graph.slake-host"; then
      echo "error: Graph golden missing IR_GRAPH_EDGES_V0" >&2
      exit 1
    fi
    if ! grep -qF 'EMPTY-GRAPH-OK' "$goldens_dir/graph.slake-host"; then
      echo "error: Graph golden missing EMPTY-GRAPH-OK" >&2
      exit 1
    fi
    if ! grep -qF 'import Mult' "$goldens_dir/graph.slake-host"; then
      echo "error: Graph golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'HOST_COMPOSE_V0' "$goldens_dir/compose.slake-host"; then
      echo "error: Compose golden missing HOST_COMPOSE_V0" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-COMPOSE' "$goldens_dir/compose.slake-host"; then
      echo "error: Compose golden missing HOST-COMPOSE" >&2
      exit 1
    fi
    if ! grep -qF 'COMPOSE-FIXTURE' "$goldens_dir/compose.slake-host"; then
      echo "error: Compose golden missing COMPOSE-FIXTURE" >&2
      exit 1
    fi
    if ! grep -qF 'import Mult' "$goldens_dir/compose.slake-host"; then
      echo "error: Compose golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'MISSING-IMPORT' "$goldens_dir/bad-missing-import.slake-host"; then
      echo "error: missing-import golden missing MISSING-IMPORT comment" >&2
      exit 1
    fi
    if ! grep -qF 'IMPORT-CYCLE' "$goldens_dir/bad-cycle-a.slake-host"; then
      echo "error: cycle-a golden missing IMPORT-CYCLE comment" >&2
      exit 1
    fi
    echo "host-graph: GREEN (Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose expand; missing/cycle fail-closed; hostGraphReady; Lake OK; host residual remains; not PROVABLY/llvm)"

# Peer elaborator Mult-first host fragment module graph without Lake on hot path
# (plan-peer-elaborator step 6 prebuilt). Same multi-file goldens as host-graph.
# Bootstrap once: (cd src/systems && lake build slake-host-graph).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Host elaborator residual remains (Lake still for host develop bootstrap).
# Product StillUsesLake/DependsOnLake stay false (product tip; not host free).
# Greppable: host-graph-without-lake, HOST-GRAPH-WITHOUT-LAKE,
# hostGraphWithoutLakeFinished, hostGraphWithoutLakeReady,
# justRecipeWithoutLake, prebuiltHostGraphRel,
# hostGraphWithoutLakeKeepsHostLake.
host-graph-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/host-graph"
    prebuilt="$systems_dir/.lake/build/bin/slake-host-graph"
    mod="$lean_dir/HostGraph.lean"
    echo "== host-graph-without-lake (step 6; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  input: goldens/host-graph Mult + MultSubsetEmit + Linear + Types + Program + Graph + Compose + bad-missing + bad-cycle"
    echo "  output: hostGraphWithoutLakeFinished / Ready; host residual remains"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphWithoutLakeFinished' "$mod"; then
      echo "error: missing hostGraphWithoutLakeFinished pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'def hostGraphWithoutLakeFinished : Bool := true' "$mod"; then
      echo "error: hostGraphWithoutLakeFinished must be true in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphWithoutLakeReady' "$mod"; then
      echo "error: missing hostGraphWithoutLakeReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeWithoutLake' "$mod"; then
      echo "error: missing justRecipeWithoutLake pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'host-graph-without-lake' "$mod"; then
      echo "error: missing host-graph-without-lake cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'prebuiltHostGraphRel' "$mod"; then
      echo "error: missing prebuiltHostGraphRel in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing hostGraphWithoutLakeKeepsHostLake in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphHostElaboratorResidualRemains' "$mod"; then
      echo "error: missing host residual honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-GRAPH-WITHOUT-LAKE' "$mod"; then
      echo "error: missing HOST-GRAPH-WITHOUT-LAKE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'resolveGraph' "$mod"; then
      echo "error: missing resolveGraph in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodLinearExpand' "$mod"; then
      echo "error: missing hostGraphGoodLinearExpand in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodTypesExpand' "$mod"; then
      echo "error: missing hostGraphGoodTypesExpand in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodProgramExpand' "$mod"; then
      echo "error: missing hostGraphGoodProgramExpand in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodGraphExpand' "$mod"; then
      echo "error: missing hostGraphGoodGraphExpand in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodComposeExpand' "$mod"; then
      echo "error: missing hostGraphGoodComposeExpand in $mod" >&2
      exit 1
    fi
    for f in mult.slake-host mult-subset-emit.slake-host linear.slake-host \
             types.slake-host program.slake-host graph.slake-host \
             compose.slake-host \
             bad-missing-import.slake-host bad-cycle-a.slake-host \
             bad-cycle-b.slake-host; do
      if [[ ! -f "$goldens_dir/$f" ]]; then
        echo "error: missing golden $goldens_dir/$f" >&2
        exit 1
      fi
    done
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt host graph binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-foundation-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-host-graph)" >&2
      echo "  then re-run: just host-graph-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt host graph check (no lake)"
    "$prebuilt" "$root"
    if ! grep -qF 'import Mult' "$goldens_dir/mult-subset-emit.slake-host"; then
      echo "error: MultSubsetEmit golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'TYPED_IR_V0' "$goldens_dir/types.slake-host"; then
      echo "error: Types golden missing TYPED_IR_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_PROGRAM_V0' "$goldens_dir/program.slake-host"; then
      echo "error: Program golden missing IR_PROGRAM_V0" >&2
      exit 1
    fi
    if ! grep -qF 'ORDERED-IR-PROGRAM' "$goldens_dir/program.slake-host"; then
      echo "error: Program golden missing ORDERED-IR-PROGRAM" >&2
      exit 1
    fi
    if ! grep -qF 'import Mult' "$goldens_dir/program.slake-host"; then
      echo "error: Program golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'IR_GRAPH_EDGES_V0' "$goldens_dir/graph.slake-host"; then
      echo "error: Graph golden missing IR_GRAPH_EDGES_V0" >&2
      exit 1
    fi
    if ! grep -qF 'EMPTY-GRAPH-OK' "$goldens_dir/graph.slake-host"; then
      echo "error: Graph golden missing EMPTY-GRAPH-OK" >&2
      exit 1
    fi
    if ! grep -qF 'import Mult' "$goldens_dir/graph.slake-host"; then
      echo "error: Graph golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'HOST_COMPOSE_V0' "$goldens_dir/compose.slake-host"; then
      echo "error: Compose golden missing HOST_COMPOSE_V0" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-COMPOSE' "$goldens_dir/compose.slake-host"; then
      echo "error: Compose golden missing HOST-COMPOSE" >&2
      exit 1
    fi
    if ! grep -qF 'COMPOSE-FIXTURE' "$goldens_dir/compose.slake-host"; then
      echo "error: Compose golden missing COMPOSE-FIXTURE" >&2
      exit 1
    fi
    if ! grep -qF 'import Mult' "$goldens_dir/compose.slake-host"; then
      echo "error: Compose golden missing import Mult" >&2
      exit 1
    fi
    if ! grep -qF 'MISSING-IMPORT' "$goldens_dir/bad-missing-import.slake-host"; then
      echo "error: missing-import golden missing MISSING-IMPORT comment" >&2
      exit 1
    fi
    if ! grep -qF 'IMPORT-CYCLE' "$goldens_dir/bad-cycle-a.slake-host"; then
      echo "error: cycle-a golden missing IMPORT-CYCLE comment" >&2
      exit 1
    fi
    echo "host-graph-without-lake: GREEN (Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose expand; missing/cycle fail-closed; hostGraphWithoutLakeFinished; prebuilt; no lake hot path; host residual remains; not PROVABLY/llvm)"

# Peer elaborator Mult + Linear + Types package write (step 7 + Track 3b-5/3b-6).
# HostFront G1 + HostGraph Mult set -> MultSubsetEmit write; HostGraph
# Mult+MultSubsetEmit+Linear expand -> LinearSubsetEmit write; HostGraph
# Mult+MultSubsetEmit+Linear+Types expand -> TypesSubsetEmit write; HostGraph
# Mult..Program expand -> ProgramSubsetEmit; HostGraph Mult..Graph expand ->
# GraphSubsetEmit; HostGraph Mult..Compose expand -> ComposeSubsetEmit.
# Dual greps Mult/Linear/Types/Program/Graph/Compose emit packages.
# Lake-built OK. Mult+Linear+Types+Program+Graph stay green; Compose is named
# unit beyond Graph (Track 3b-9).
# Greppable: host-package-write, slake-host-package-write, HOST-PACKAGE-WRITE,
# SLAKE_HOST_PACKAGE_WRITE, hostPackageWriteReady, hostPackageWriteFinishedClaimed,
# hostPackageWriteLinearReady, hostPackageWriteLinearGraphReady,
# hostPackageWriteTypesReady, hostPackageWriteTypesGraphReady,
# hostPackageWriteProgramReady, hostPackageWriteProgramGraphReady,
# hostPackageWriteGraphExpandReady, hostPackageWriteGraphPackageReady,
# hostPackageWriteComposeExpandReady, hostPackageWriteComposePackageReady,
# multSubsetEmitWrite, linearSubsetEmitWrite, typesSubsetEmitWrite,
# programSubsetEmitWrite, graphSubsetEmitWrite, composeSubsetEmitWrite,
# SLAKE_MULT_SUBSET_EMIT_V0, SLAKE_LINEAR_SUBSET_EMIT_V0, SLAKE_TYPES_SUBSET_EMIT_V0,
# SLAKE_PROGRAM_SUBSET_EMIT_V0, SLAKE_GRAPH_SUBSET_EMIT_V0,
# SLAKE_COMPOSE_SUBSET_EMIT_V0.
host-package-write:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    goldens_front="$systems_dir/goldens/host-front"
    goldens_graph="$systems_dir/goldens/host-graph"
    mod="$lean_dir/HostPackageWrite.lean"
    main_mod="$lean_dir/HostPackageWriteMain.lean"
    echo "== host-package-write (elaborator Mult + Linear + Types + Program + Graph + Compose package write) =="
    echo "  path: Mult set -> Mult write; Linear/Types/Program/Graph/Compose expand -> unit writes"
    echo "  dual: Lean hostPackageWriteReady + Mult/Linear/Types/Program/Graph/Compose emit stage tokens"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'SYSTEMS_LEAN_HOST' "$mod"; then
      echo "error: missing SYSTEMS_LEAN_HOST in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_HOST_PACKAGE_WRITE_V0' "$mod"; then
      echo "error: missing SLAKE_HOST_PACKAGE_WRITE_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-PACKAGE-WRITE' "$mod"; then
      echo "error: missing HOST-PACKAGE-WRITE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteReady' "$mod"; then
      echo "error: missing hostPackageWriteReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteFinishedClaimed' "$mod"; then
      echo "error: missing hostPackageWriteFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteG1Ready' "$mod"; then
      echo "error: missing hostPackageWriteG1Ready in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteGraphReady' "$mod"; then
      echo "error: missing hostPackageWriteGraphReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteLinearReady' "$mod"; then
      echo "error: missing hostPackageWriteLinearReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteLinearGraphReady' "$mod"; then
      echo "error: missing hostPackageWriteLinearGraphReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteTypesReady' "$mod"; then
      echo "error: missing hostPackageWriteTypesReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteTypesGraphReady' "$mod"; then
      echo "error: missing hostPackageWriteTypesGraphReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteProgramReady' "$mod"; then
      echo "error: missing hostPackageWriteProgramReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteProgramGraphReady' "$mod"; then
      echo "error: missing hostPackageWriteProgramGraphReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteGraphExpandReady' "$mod"; then
      echo "error: missing hostPackageWriteGraphExpandReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteGraphPackageReady' "$mod"; then
      echo "error: missing hostPackageWriteGraphPackageReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteComposeExpandReady' "$mod"; then
      echo "error: missing hostPackageWriteComposeExpandReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteComposePackageReady' "$mod"; then
      echo "error: missing hostPackageWriteComposePackageReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetEmitWrite' "$mod"; then
      echo "error: missing multSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetEmitWrite' "$mod"; then
      echo "error: missing linearSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetEmitWrite' "$mod"; then
      echo "error: missing typesSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetEmitWrite' "$mod"; then
      echo "error: missing programSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetEmitWrite' "$mod"; then
      echo "error: missing graphSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetEmitWrite' "$mod"; then
      echo "error: missing composeSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontGoodG1' "$mod"; then
      echo "error: missing hostFrontGoodG1 cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodClosure' "$mod"; then
      echo "error: missing hostGraphGoodClosure cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodLinearExpand' "$mod"; then
      echo "error: missing hostGraphGoodLinearExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodTypesExpand' "$mod"; then
      echo "error: missing hostGraphGoodTypesExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodProgramExpand' "$mod"; then
      echo "error: missing hostGraphGoodProgramExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodGraphExpand' "$mod"; then
      echo "error: missing hostGraphGoodGraphExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodComposeExpand' "$mod"; then
      echo "error: missing hostGraphGoodComposeExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteHostElaboratorResidualRemains' "$mod"; then
      echo "error: missing host residual honesty in $mod" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_front/good-mult-fixture.slake-host" ]]; then
      echo "error: missing HostFront G1 $goldens_front/good-mult-fixture.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/mult.slake-host" ]]; then
      echo "error: missing HostGraph mult golden $goldens_graph/mult.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/mult-subset-emit.slake-host" ]]; then
      echo "error: missing HostGraph MultSubsetEmit golden" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/linear.slake-host" ]]; then
      echo "error: missing HostGraph Linear golden $goldens_graph/linear.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/types.slake-host" ]]; then
      echo "error: missing HostGraph Types golden $goldens_graph/types.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/program.slake-host" ]]; then
      echo "error: missing HostGraph Program golden $goldens_graph/program.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/graph.slake-host" ]]; then
      echo "error: missing HostGraph Graph golden $goldens_graph/graph.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/compose.slake-host" ]]; then
      echo "error: missing HostGraph Compose golden $goldens_graph/compose.slake-host" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; host-package-write requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-host-package-write
      lake exe slake-host-package-write -- "$root"
    )
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult package header after package write: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult package source after package write: $out_c" >&2
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
      echo "error: $out_h missing MULT-0 after package write" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-OMEGA' "$out_c"; then
      echo "error: $out_c missing MULT-OMEGA after package write" >&2
      exit 1
    fi
    lin_h="$emit_dir/slake_linear_subset.h"
    lin_c="$emit_dir/slake_linear_subset.c"
    if [[ ! -f "$lin_h" ]]; then
      echo "error: missing Linear package header after package write: $lin_h" >&2
      exit 1
    fi
    if [[ ! -f "$lin_c" ]]; then
      echo "error: missing Linear package source after package write: $lin_c" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_EMIT_V0' "$lin_h"; then
      echo "error: $lin_h missing greppable token SLAKE_LINEAR_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_EMIT_V0' "$lin_c"; then
      echo "error: $lin_c missing greppable token SLAKE_LINEAR_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'LINEAR-EXACT-ONCE' "$lin_h" && ! grep -qF 'LINEAR-EXACT-ONCE' "$lin_c"; then
      echo "error: Linear package missing LINEAR-EXACT-ONCE after package write" >&2
      exit 1
    fi
    typ_h="$emit_dir/slake_types_subset.h"
    typ_c="$emit_dir/slake_types_subset.c"
    if [[ ! -f "$typ_h" ]]; then
      echo "error: missing Types package header after package write: $typ_h" >&2
      exit 1
    fi
    if [[ ! -f "$typ_c" ]]; then
      echo "error: missing Types package source after package write: $typ_c" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_EMIT_V0' "$typ_h"; then
      echo "error: $typ_h missing greppable token SLAKE_TYPES_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_EMIT_V0' "$typ_c"; then
      echo "error: $typ_c missing greppable token SLAKE_TYPES_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'TYPED_IR_V0' "$typ_h" && ! grep -qF 'TYPED_IR_V0' "$typ_c"; then
      echo "error: Types package missing TYPED_IR_V0 after package write" >&2
      exit 1
    fi
    prog_h="$emit_dir/slake_program_subset.h"
    prog_c="$emit_dir/slake_program_subset.c"
    if [[ ! -f "$prog_h" ]]; then
      echo "error: missing Program package header after package write: $prog_h" >&2
      exit 1
    fi
    if [[ ! -f "$prog_c" ]]; then
      echo "error: missing Program package source after package write: $prog_c" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_EMIT_V0' "$prog_h"; then
      echo "error: $prog_h missing greppable token SLAKE_PROGRAM_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_EMIT_V0' "$prog_c"; then
      echo "error: $prog_c missing greppable token SLAKE_PROGRAM_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_PROGRAM_V0' "$prog_h" && ! grep -qF 'IR_PROGRAM_V0' "$prog_c"; then
      echo "error: Program package missing IR_PROGRAM_V0 after package write" >&2
      exit 1
    fi
    graph_h="$emit_dir/slake_graph_subset.h"
    graph_c="$emit_dir/slake_graph_subset.c"
    if [[ ! -f "$graph_h" ]]; then
      echo "error: missing Graph package header after package write: $graph_h" >&2
      exit 1
    fi
    if [[ ! -f "$graph_c" ]]; then
      echo "error: missing Graph package source after package write: $graph_c" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_EMIT_V0' "$graph_h"; then
      echo "error: $graph_h missing greppable token SLAKE_GRAPH_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_EMIT_V0' "$graph_c"; then
      echo "error: $graph_c missing greppable token SLAKE_GRAPH_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_GRAPH_EDGES_V0' "$graph_h" && ! grep -qF 'IR_GRAPH_EDGES_V0' "$graph_c"; then
      echo "error: Graph package missing IR_GRAPH_EDGES_V0 after package write" >&2
      exit 1
    fi
    compose_h="$emit_dir/slake_compose_subset.h"
    compose_c="$emit_dir/slake_compose_subset.c"
    if [[ ! -f "$compose_h" ]]; then
      echo "error: missing Compose package header after package write: $compose_h" >&2
      exit 1
    fi
    if [[ ! -f "$compose_c" ]]; then
      echo "error: missing Compose package source after package write: $compose_c" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_EMIT_V0' "$compose_h"; then
      echo "error: $compose_h missing greppable token SLAKE_COMPOSE_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_EMIT_V0' "$compose_c"; then
      echo "error: $compose_c missing greppable token SLAKE_COMPOSE_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'HOST_COMPOSE_V0' "$compose_h" && ! grep -qF 'HOST_COMPOSE_V0' "$compose_c"; then
      echo "error: Compose package missing HOST_COMPOSE_V0 after package write" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageWriteFinishedClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: stillUsesLake must stay true (host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: dependsOnLake must stay true (host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteHostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageWriteHostElaboratorResidualRemains must be true" >&2
      exit 1
    fi
    echo "host-package-write: GREEN (HostFront G1 + Mult + Linear + Types + Program + Graph + Compose package dual-ok; hostPackageWriteFinishedClaimed; host residual remains; not PROVABLY/llvm)"

# Peer elaborator Mult + Linear + Types + Program + Graph + Compose package write
# without Lake on hot path (step 7 prebuilt + Track 3b-5 Linear + Track 3b-6
# Types + Track 3b-7 Program + Track 3b-8 Graph + Track 3b-9 Compose unit
# expand). Mult + Linear + Types + Program + Graph package dual-ok remains;
# Compose package dual-ok is named unit beyond Graph.
# Bootstrap once: (cd src/systems && lake build slake-host-package-write).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Host elaborator residual remains. Product StillUsesLake/DependsOnLake stay false.
# Greppable: host-package-write-without-lake, HOST-PACKAGE-WRITE-WITHOUT-LAKE,
# hostPackageWriteWithoutLakeFinished, hostPackageWriteWithoutLakeReady,
# hostPackageWriteLinearReady, hostPackageWriteLinearGraphReady,
# hostPackageWriteTypesReady, hostPackageWriteTypesGraphReady,
# hostPackageWriteProgramReady, hostPackageWriteProgramGraphReady,
# hostPackageWriteGraphExpandReady, hostPackageWriteGraphPackageReady,
# hostPackageWriteComposeExpandReady, hostPackageWriteComposePackageReady,
# justRecipeWithoutLake, prebuiltHostPackageWriteRel,
# hostPackageWriteWithoutLakeKeepsHostLake, composeSubsetEmitWrite.
host-package-write-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    goldens_front="$systems_dir/goldens/host-front"
    goldens_graph="$systems_dir/goldens/host-graph"
    prebuilt="$systems_dir/.lake/build/bin/slake-host-package-write"
    mod="$lean_dir/HostPackageWrite.lean"
    echo "== host-package-write-without-lake (Mult + Linear + Types + Program + Graph + Compose; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  path: Mult + Linear + Types + Program + Graph + Compose package dual-ok (Track 3b-9)"
    echo "  output: hostPackageWriteWithoutLakeFinished / Ready; host residual remains"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteWithoutLakeFinished' "$mod"; then
      echo "error: missing hostPackageWriteWithoutLakeFinished pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'def hostPackageWriteWithoutLakeFinished : Bool := true' "$mod"; then
      echo "error: hostPackageWriteWithoutLakeFinished must be true in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteWithoutLakeReady' "$mod"; then
      echo "error: missing hostPackageWriteWithoutLakeReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteLinearReady' "$mod"; then
      echo "error: missing hostPackageWriteLinearReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteLinearGraphReady' "$mod"; then
      echo "error: missing hostPackageWriteLinearGraphReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteTypesReady' "$mod"; then
      echo "error: missing hostPackageWriteTypesReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteTypesGraphReady' "$mod"; then
      echo "error: missing hostPackageWriteTypesGraphReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteProgramReady' "$mod"; then
      echo "error: missing hostPackageWriteProgramReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteProgramGraphReady' "$mod"; then
      echo "error: missing hostPackageWriteProgramGraphReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteGraphExpandReady' "$mod"; then
      echo "error: missing hostPackageWriteGraphExpandReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteGraphPackageReady' "$mod"; then
      echo "error: missing hostPackageWriteGraphPackageReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteComposeExpandReady' "$mod"; then
      echo "error: missing hostPackageWriteComposeExpandReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteComposePackageReady' "$mod"; then
      echo "error: missing hostPackageWriteComposePackageReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeWithoutLake' "$mod"; then
      echo "error: missing justRecipeWithoutLake pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'host-package-write-without-lake' "$mod"; then
      echo "error: missing host-package-write-without-lake cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'prebuiltHostPackageWriteRel' "$mod"; then
      echo "error: missing prebuiltHostPackageWriteRel in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing hostPackageWriteWithoutLakeKeepsHostLake in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostPackageWriteHostElaboratorResidualRemains' "$mod"; then
      echo "error: missing host residual honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-PACKAGE-WRITE-WITHOUT-LAKE' "$mod"; then
      echo "error: missing HOST-PACKAGE-WRITE-WITHOUT-LAKE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetEmitWrite' "$mod"; then
      echo "error: missing multSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetEmitWrite' "$mod"; then
      echo "error: missing linearSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetEmitWrite' "$mod"; then
      echo "error: missing typesSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetEmitWrite' "$mod"; then
      echo "error: missing programSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetEmitWrite' "$mod"; then
      echo "error: missing graphSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetEmitWrite' "$mod"; then
      echo "error: missing composeSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodLinearExpand' "$mod"; then
      echo "error: missing hostGraphGoodLinearExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodTypesExpand' "$mod"; then
      echo "error: missing hostGraphGoodTypesExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodProgramExpand' "$mod"; then
      echo "error: missing hostGraphGoodProgramExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodGraphExpand' "$mod"; then
      echo "error: missing hostGraphGoodGraphExpand cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostGraphGoodComposeExpand' "$mod"; then
      echo "error: missing hostGraphGoodComposeExpand cite in $mod" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_front/good-mult-fixture.slake-host" ]]; then
      echo "error: missing HostFront G1 $goldens_front/good-mult-fixture.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/mult.slake-host" ]] || [[ ! -f "$goldens_graph/mult-subset-emit.slake-host" ]]; then
      echo "error: missing HostGraph Mult-first goldens under $goldens_graph" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/linear.slake-host" ]]; then
      echo "error: missing HostGraph Linear golden $goldens_graph/linear.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/types.slake-host" ]]; then
      echo "error: missing HostGraph Types golden $goldens_graph/types.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/program.slake-host" ]]; then
      echo "error: missing HostGraph Program golden $goldens_graph/program.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/graph.slake-host" ]]; then
      echo "error: missing HostGraph Graph golden $goldens_graph/graph.slake-host" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_graph/compose.slake-host" ]]; then
      echo "error: missing HostGraph Compose golden $goldens_graph/compose.slake-host" >&2
      exit 1
    fi
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt host package write binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-foundation-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-host-package-write)" >&2
      echo "  then re-run: just host-package-write-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt host package write (no lake)"
    "$prebuilt" "$root"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    if [[ ! -f "$out_h" ]] || [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult package emit after without-Lake package write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_EMIT_V0' "$out_h"; then
      echo "error: $out_h missing SLAKE_MULT_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_EMIT_V0' "$out_c"; then
      echo "error: $out_c missing SLAKE_MULT_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-0' "$out_h"; then
      echo "error: $out_h missing MULT-0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-OMEGA' "$out_c"; then
      echo "error: $out_c missing MULT-OMEGA after without-Lake write" >&2
      exit 1
    fi
    lin_h="$emit_dir/slake_linear_subset.h"
    lin_c="$emit_dir/slake_linear_subset.c"
    if [[ ! -f "$lin_h" ]] || [[ ! -f "$lin_c" ]]; then
      echo "error: missing Linear package emit after without-Lake package write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_EMIT_V0' "$lin_h"; then
      echo "error: $lin_h missing SLAKE_LINEAR_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_EMIT_V0' "$lin_c"; then
      echo "error: $lin_c missing SLAKE_LINEAR_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'LINEAR-EXACT-ONCE' "$lin_h" && ! grep -qF 'LINEAR-EXACT-ONCE' "$lin_c"; then
      echo "error: Linear package missing LINEAR-EXACT-ONCE after without-Lake write" >&2
      exit 1
    fi
    typ_h="$emit_dir/slake_types_subset.h"
    typ_c="$emit_dir/slake_types_subset.c"
    if [[ ! -f "$typ_h" ]] || [[ ! -f "$typ_c" ]]; then
      echo "error: missing Types package emit after without-Lake package write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_EMIT_V0' "$typ_h"; then
      echo "error: $typ_h missing SLAKE_TYPES_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_EMIT_V0' "$typ_c"; then
      echo "error: $typ_c missing SLAKE_TYPES_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'TYPED_IR_V0' "$typ_h" && ! grep -qF 'TYPED_IR_V0' "$typ_c"; then
      echo "error: Types package missing TYPED_IR_V0 after without-Lake write" >&2
      exit 1
    fi
    prog_h="$emit_dir/slake_program_subset.h"
    prog_c="$emit_dir/slake_program_subset.c"
    if [[ ! -f "$prog_h" ]] || [[ ! -f "$prog_c" ]]; then
      echo "error: missing Program package emit after without-Lake package write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_EMIT_V0' "$prog_h"; then
      echo "error: $prog_h missing SLAKE_PROGRAM_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_EMIT_V0' "$prog_c"; then
      echo "error: $prog_c missing SLAKE_PROGRAM_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'IR_PROGRAM_V0' "$prog_h" && ! grep -qF 'IR_PROGRAM_V0' "$prog_c"; then
      echo "error: Program package missing IR_PROGRAM_V0 after without-Lake write" >&2
      exit 1
    fi
    graph_h="$emit_dir/slake_graph_subset.h"
    graph_c="$emit_dir/slake_graph_subset.c"
    if [[ ! -f "$graph_h" ]] || [[ ! -f "$graph_c" ]]; then
      echo "error: missing Graph package emit after without-Lake package write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_EMIT_V0' "$graph_h"; then
      echo "error: $graph_h missing SLAKE_GRAPH_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_EMIT_V0' "$graph_c"; then
      echo "error: $graph_c missing SLAKE_GRAPH_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'IR_GRAPH_EDGES_V0' "$graph_h" && ! grep -qF 'IR_GRAPH_EDGES_V0' "$graph_c"; then
      echo "error: Graph package missing IR_GRAPH_EDGES_V0 after without-Lake write" >&2
      exit 1
    fi
    compose_h="$emit_dir/slake_compose_subset.h"
    compose_c="$emit_dir/slake_compose_subset.c"
    if [[ ! -f "$compose_h" ]] || [[ ! -f "$compose_c" ]]; then
      echo "error: missing Compose package emit after without-Lake package write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_EMIT_V0' "$compose_h"; then
      echo "error: $compose_h missing SLAKE_COMPOSE_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_EMIT_V0' "$compose_c"; then
      echo "error: $compose_c missing SLAKE_COMPOSE_SUBSET_EMIT_V0 after without-Lake write" >&2
      exit 1
    fi
    if ! grep -qF 'HOST_COMPOSE_V0' "$compose_h" && ! grep -qF 'HOST_COMPOSE_V0' "$compose_c"; then
      echo "error: Compose package missing HOST_COMPOSE_V0 after without-Lake write" >&2
      exit 1
    fi
    echo "host-package-write-without-lake: GREEN (Mult + Linear + Types + Program + Graph + Compose package dual-ok; hostPackageWriteWithoutLakeFinished; prebuilt; no lake hot path; host residual remains; not PROVABLY/llvm)"

# A3 Package roots without Lake: load package library roots / SystemsLean module
# list without calling Lake on the measured hot path (design S1 Package load).
# Lake bootstrap path: just host-package-roots (build + exe).
# Greppable: host-package-roots, slake-host-package-roots, HOST-PACKAGE-ROOTS,
# SLAKE_HOST_PACKAGE_ROOTS_V0, hostPackageRootsReady, loadPackageRoots.
host-package-roots:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    mod="$lean_dir/HostPackageRoots.lean"
    main_mod="$lean_dir/HostPackageRootsMain.lean"
    echo "== host-package-roots (A3 package load; Lake bootstrap path) =="
    echo "  input: lakefile dual-pin + SystemsLean/*.lean walk"
    echo "  output: hostPackageRootsReady / finished; host residual remains; Lake OK"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    for tok in \
      SYSTEMS_LEAN_HOST \
      HOST-PACKAGE-ROOTS \
      SLAKE_HOST_PACKAGE_ROOTS_V0 \
      hostPackageRootsReady \
      hostPackageRootsFinishedClaimed \
      hostPackageRootsLoadOk \
      hostPackageRootsWithoutLakeFinished \
      loadPackageRoots \
      runPackageRoots \
      hostPackageRootsPackageName \
      hostPackageRootsLibraryRoot \
      hostPackageRootsConfigRel \
      hostPackageRootsLibraryDirRel \
      hostPackageRootsModuleCountFloor \
      slake-host-package-roots \
      host-package-roots-without-lake
    do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    if ! grep -qF 'Package roots without Lake' "$mod"; then
      echo "error: missing residual Name Package roots without Lake in $mod" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageRootsFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageRootsFinishedClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageRootsHostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageRootsHostElaboratorResidualRemains must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageRootsHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod"; then
      echo "error: hostPackageRootsHostFreeClaimed must stay false" >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/lakefile.lean" ]]; then
      echo "error: missing package config $systems_dir/lakefile.lean" >&2
      exit 1
    fi
    if [[ ! -d "$lean_dir" ]]; then
      echo "error: missing library dir $lean_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; host-package-roots requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-host-package-roots
      lake exe slake-host-package-roots -- "$root"
    )
    echo "host-package-roots: GREEN (package roots + module list load; hostPackageRootsReady; Lake OK; host residual remains; not PROVABLY/llvm)"

# A4 Real Mult import graph: resolve Mult + MultTheorems real .lean import edges
# without Lake on the measured hot path (design S2 Import graph).
# Lake bootstrap path: just host-import-graph (build + exe).
# Greppable: host-import-graph, slake-host-import-graph, HOST-IMPORT-GRAPH,
# SLAKE_HOST_IMPORT_GRAPH_V0, hostImportGraphReady, loadMultImportGraph.
host-import-graph:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    mod="$lean_dir/HostImportGraph.lean"
    mod_seeds="$lean_dir/HostImportGraphSeeds.lean"
    mod_model="$lean_dir/HostImportGraphModel.lean"
    mod_mods="$lean_dir/HostImportGraphMods.lean"
    mod_mods_later="$lean_dir/HostImportGraphModsLater.lean"
    mod_load="$lean_dir/HostImportGraphLoadOk.lean"
    mod_thm="$lean_dir/HostImportGraphTheorems.lean"
    mod_walk="$lean_dir/HostImportGraphWalk.lean"
    mod_driver="$lean_dir/HostImportGraphDriver.lean"
    family_mods=(
      "$mod" "$mod_seeds" "$mod_model" "$mod_mods" "$mod_mods_later"
      "$mod_load" "$mod_thm" "$mod_walk" "$mod_driver"
    )
    grep_hig_family() {
      local tok="$1"
      local f
      for f in "${family_mods[@]}"; do
        if [[ -f "$f" ]] && grep -qF "$tok" "$f"; then
          return 0
        fi
      done
      return 1
    }
    main_mod="$lean_dir/HostImportGraphMain.lean"
    mult_mod="$lean_dir/Mult.lean"
    mult_thm="$lean_dir/MultTheorems.lean"
    linear_mod="$lean_dir/Linear.lean"
    linear_thm="$lean_dir/LinearTheorems.lean"
    types_mod="$lean_dir/Types.lean"
    types_thm="$lean_dir/TypesTheorems.lean"
    ir_prog="$lean_dir/IrProgram.lean"
    ir_prog_thm="$lean_dir/IrProgramTheorems.lean"
    ir_graph="$lean_dir/IrGraph.lean"
    ir_graph_thm="$lean_dir/IrGraphTheorems.lean"
    host_compose="$lean_dir/HostCompose.lean"
    host_compose_thm="$lean_dir/HostComposeTheorems.lean"
    echo "== host-import-graph (A4/A6 Mult+Linear+Types+Program+Graph+Compose import graph; Lake bootstrap path) =="
    echo "  input: real Mult+Linear+Types+Program+Graph+Compose (+Theorems) import edges"
    echo "  output: hostImportGraphReady / finished; host residual remains; Lake OK"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    for seed in "$mult_mod" "$mult_thm" "$linear_mod" "$linear_thm" "$types_mod" "$types_thm" "$ir_prog" "$ir_prog_thm" "$ir_graph" "$ir_graph_thm" "$host_compose" "$host_compose_thm"; do
      if [[ ! -f "$seed" ]]; then
        echo "error: missing seed $seed" >&2
        exit 1
      fi
    done
    for tok in \
      SYSTEMS_LEAN_HOST \
      HOST-IMPORT-GRAPH \
      SLAKE_HOST_IMPORT_GRAPH_V0 \
      hostImportGraphReady \
      hostImportGraphFinishedClaimed \
      hostImportGraphLoadOk \
      hostImportGraphWithoutLakeFinished \
      loadMultImportGraph \
      runImportGraph \
      resolveImportGraph \
      extractImports \
      hostImportGraphSeedModules \
      hostImportGraphGoodMultSeed \
      hostImportGraphGoodExpandSeed \
      hostImportGraphExpandSliceName \
      Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems \
      hostImportGraphBadMissing \
      hostImportGraphBadCycle \
      MISSING-IMPORT \
      IMPORT-CYCLE \
      slake-host-import-graph \
      host-import-graph-without-lake
    do
      if ! grep_hig_family "$tok"; then
        echo "error: missing $tok in HostImportGraph family" >&2
        exit 1
      fi
    done
    if ! grep_hig_family 'Real Mult import graph'; then
      echo "error: missing residual Name Real Mult import graph in HostImportGraph family" >&2
      exit 1
    fi
    if ! grep_hig_family 'Host library seed expand continue'; then
      echo "error: missing expand Name Host library seed expand continue in HostImportGraph family" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod_seeds"; then
      echo "error: hostImportGraphFinishedClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphHostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod_seeds"; then
      echo "error: hostImportGraphHostElaboratorResidualRemains must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod_seeds"; then
      echo "error: hostImportGraphHostFreeClaimed must stay false" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Mult' "$mult_thm"; then
      echo "error: MultTheorems.lean must import SystemsLean.Mult (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Linear' "$linear_thm"; then
      echo "error: LinearTheorems.lean must import SystemsLean.Linear (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Mult' "$types_mod"; then
      echo "error: Types.lean must import SystemsLean.Mult (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Types' "$types_thm"; then
      echo "error: TypesTheorems.lean must import SystemsLean.Types (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Types' "$ir_prog"; then
      echo "error: IrProgram.lean must import SystemsLean.Types (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrProgram' "$ir_prog_thm"; then
      echo "error: IrProgramTheorems.lean must import SystemsLean.IrProgram (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrProgram' "$ir_graph"; then
      echo "error: IrGraph.lean must import SystemsLean.IrProgram (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrGraph' "$ir_graph_thm"; then
      echo "error: IrGraphTheorems.lean must import SystemsLean.IrGraph (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrGraph' "$host_compose"; then
      echo "error: HostCompose.lean must import SystemsLean.IrGraph (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.HostCompose' "$host_compose_thm"; then
      echo "error: HostComposeTheorems.lean must import SystemsLean.HostCompose (real edge)" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; host-import-graph requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-host-import-graph
      lake exe slake-host-import-graph -- "$root"
    )
    echo "host-import-graph: GREEN (real Mult+Linear+Types+Program+Graph+Compose import graph; hostImportGraphReady; Lake OK; host residual remains; not PROVABLY/llvm)"

# A4 measured without-Lake real Mult import graph (prebuilt).
# Bootstrap once: (cd src/systems && lake build slake-host-import-graph).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Greppable: host-import-graph-without-lake, HOST-IMPORT-GRAPH-WITHOUT-LAKE,
# hostImportGraphWithoutLakeFinished, hostImportGraphWithoutLakeReady,
# justRecipeWithoutLake, prebuiltHostImportGraphRel,
# hostImportGraphWithoutLakeKeepsHostLake.
host-import-graph-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    prebuilt="$systems_dir/.lake/build/bin/slake-host-import-graph"
    mod="$lean_dir/HostImportGraph.lean"
    mod_seeds="$lean_dir/HostImportGraphSeeds.lean"
    mod_model="$lean_dir/HostImportGraphModel.lean"
    mod_mods="$lean_dir/HostImportGraphMods.lean"
    mod_mods_later="$lean_dir/HostImportGraphModsLater.lean"
    mod_load="$lean_dir/HostImportGraphLoadOk.lean"
    mod_thm="$lean_dir/HostImportGraphTheorems.lean"
    mod_walk="$lean_dir/HostImportGraphWalk.lean"
    mod_driver="$lean_dir/HostImportGraphDriver.lean"
    family_mods=(
      "$mod" "$mod_seeds" "$mod_model" "$mod_mods" "$mod_mods_later"
      "$mod_load" "$mod_thm" "$mod_walk" "$mod_driver"
    )
    grep_hig_family() {
      local tok="$1"
      local f
      for f in "${family_mods[@]}"; do
        if [[ -f "$f" ]] && grep -qF "$tok" "$f"; then
          return 0
        fi
      done
      return 1
    }
    mult_mod="$lean_dir/Mult.lean"
    mult_thm="$lean_dir/MultTheorems.lean"
    linear_mod="$lean_dir/Linear.lean"
    linear_thm="$lean_dir/LinearTheorems.lean"
    types_mod="$lean_dir/Types.lean"
    types_thm="$lean_dir/TypesTheorems.lean"
    ir_prog="$lean_dir/IrProgram.lean"
    ir_prog_thm="$lean_dir/IrProgramTheorems.lean"
    ir_graph="$lean_dir/IrGraph.lean"
    ir_graph_thm="$lean_dir/IrGraphTheorems.lean"
    host_compose="$lean_dir/HostCompose.lean"
    host_compose_thm="$lean_dir/HostComposeTheorems.lean"
    echo "== host-import-graph-without-lake (A4/A6 Compose expand; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  input: real Mult+Linear+Types+Program+Graph+Compose (+Theorems) import edges"
    echo "  output: hostImportGraphWithoutLakeFinished / Ready; host residual remains"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    for tok in \
      hostImportGraphWithoutLakeFinished \
      hostImportGraphWithoutLakeReady \
      justRecipeWithoutLake \
      host-import-graph-without-lake \
      prebuiltHostImportGraphRel \
      hostImportGraphWithoutLakeKeepsHostLake \
      hostImportGraphHostElaboratorResidualRemains \
      HOST-IMPORT-GRAPH-WITHOUT-LAKE \
      loadMultImportGraph \
      hostImportGraphLoadOk \
      hostImportGraphSeedModules \
      hostImportGraphGoodExpandSeed \
      hostImportGraphExpandSliceName \
      Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems \
      resolveImportGraph \
      MISSING-IMPORT \
      IMPORT-CYCLE
    do
      if ! grep_hig_family "$tok"; then
        echo "error: missing $tok in HostImportGraph family" >&2
        exit 1
      fi
    done
    if ! grep_hig_family 'Host library seed expand continue'; then
      echo "error: missing expand Name Host library seed expand continue in HostImportGraph family" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphWithoutLakeFinished[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod_seeds"; then
      echo "error: hostImportGraphWithoutLakeFinished must be true in $mod_seeds" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphHostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod_seeds"; then
      echo "error: host residual honesty must remain true in $mod_seeds" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod_seeds"; then
      echo "error: hostImportGraphHostFreeClaimed must stay false" >&2
      exit 1
    fi
    for seed in "$mult_mod" "$mult_thm" "$linear_mod" "$linear_thm" "$types_mod" "$types_thm" "$ir_prog" "$ir_prog_thm" "$ir_graph" "$ir_graph_thm" "$host_compose" "$host_compose_thm"; do
      if [[ ! -f "$seed" ]]; then
        echo "error: missing seed $seed" >&2
        exit 1
      fi
    done
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt host import graph binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-foundation-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-host-import-graph)" >&2
      echo "  then re-run: just host-import-graph-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt real Mult+Linear+Types+Program+Graph+Compose import graph (no lake)"
    "$prebuilt" "$root"
    # Dual evidence after walk: seed files still on disk.
    for seed in "$mult_mod" "$mult_thm" "$linear_mod" "$linear_thm" "$types_mod" "$types_thm" "$ir_prog" "$ir_prog_thm" "$ir_graph" "$ir_graph_thm" "$host_compose" "$host_compose_thm"; do
      if [[ ! -f "$seed" ]]; then
        echo "error: missing seed after import graph: $seed" >&2
        exit 1
      fi
    done
    if ! grep -qF 'import SystemsLean.Mult' "$mult_thm"; then
      echo "error: MultTheorems.lean must still import SystemsLean.Mult" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Linear' "$linear_thm"; then
      echo "error: LinearTheorems.lean must still import SystemsLean.Linear" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Types' "$types_thm"; then
      echo "error: TypesTheorems.lean must still import SystemsLean.Types" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Types' "$ir_prog"; then
      echo "error: IrProgram.lean must still import SystemsLean.Types" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrProgram' "$ir_prog_thm"; then
      echo "error: IrProgramTheorems.lean must still import SystemsLean.IrProgram" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrProgram' "$ir_graph"; then
      echo "error: IrGraph.lean must still import SystemsLean.IrProgram" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrGraph' "$ir_graph_thm"; then
      echo "error: IrGraphTheorems.lean must still import SystemsLean.IrGraph" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrGraph' "$host_compose"; then
      echo "error: HostCompose.lean must import SystemsLean.IrGraph (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.HostCompose' "$host_compose_thm"; then
      echo "error: HostComposeTheorems.lean must import SystemsLean.HostCompose (real edge)" >&2
      exit 1
    fi
    echo "host-import-graph-without-lake: GREEN (real Mult+Linear+Types+Program+Graph+Compose import graph; hostImportGraphWithoutLakeFinished; prebuilt; no lake hot path; host residual remains; not PROVABLY/llvm)"

# A5 First real host module check: structural check of Mult + MultTheorems
# real .lean from disk without Lake on the measured hot path (design S3).
# PARTIAL-STRUCTURAL (imports + key decls); not full elaborator typecheck.
# Lake bootstrap path: just host-module-check (build + exe).
# Greppable: host-module-check, slake-host-module-check, HOST-MODULE-CHECK,
# SLAKE_HOST_MODULE_CHECK_V0, hostModuleCheckReady, loadMultModuleCheck.
host-module-check:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    mod="$lean_dir/HostModuleCheck.lean"
    mod_seeds="$lean_dir/HostModuleCheckSeeds.lean"
    mod_load="$lean_dir/HostModuleCheckLoadOk.lean"
    mod_driver_io="$lean_dir/HostModuleCheckDriverIO.lean"
    mod_driver="$lean_dir/HostModuleCheckDriver.lean"
    mod_surface="$lean_dir/HostModuleCheckSurface.lean"
    mod_mult_term="$lean_dir/HostModuleCheckMultTerm.lean"
    mod_linear_term="$lean_dir/HostModuleCheckLinearTerm.lean"
    mod_types_term="$lean_dir/HostModuleCheckTypesTerm.lean"
    mod_irprogram_term="$lean_dir/HostModuleCheckIrProgramTerm.lean"
    mod_irgraph_term="$lean_dir/HostModuleCheckIrGraphTerm.lean"
    mod_hostcompose_term="$lean_dir/HostModuleCheckHostComposeTerm.lean"
    mod_erasure_term="$lean_dir/HostModuleCheckErasureTerm.lean"
    mod_extract_term="$lean_dir/HostModuleCheckExtractTerm.lean"
    mod_emitplan_term="$lean_dir/HostModuleCheckEmitPlanTerm.lean"
    mod_emitapply_term="$lean_dir/HostModuleCheckEmitApplyTerm.lean"
    mod_emitbody_term="$lean_dir/HostModuleCheckEmitBodyTerm.lean"
    mod_kernelmult_term="$lean_dir/HostModuleCheckKernelMultTerm.lean"
    mod_kernellinear_term="$lean_dir/HostModuleCheckKernelLinearTerm.lean"
    mod_kerneltypes_term="$lean_dir/HostModuleCheckKernelTypesTerm.lean"
    mod_kernelprogram_term="$lean_dir/HostModuleCheckKernelProgramTerm.lean"
    mod_kernelemit_term="$lean_dir/HostModuleCheckKernelEmitTerm.lean"
    mod_paritymult_term="$lean_dir/HostModuleCheckParityMultTerm.lean"
    mod_paritylinear_term="$lean_dir/HostModuleCheckParityLinearTerm.lean"
    mod_paritytypes_term="$lean_dir/HostModuleCheckParityTypesTerm.lean"
    mod_emit_mult_scaf_term="$lean_dir/HostModuleCheckEmitMultScaffoldTerm.lean"
    mod_emit_linear_scaf_term="$lean_dir/HostModuleCheckEmitLinearScaffoldTerm.lean"
    mod_emit_types_scaf_term="$lean_dir/HostModuleCheckEmitTypesScaffoldTerm.lean"
    mod_emit_program_scaf_term="$lean_dir/HostModuleCheckEmitProgramScaffoldTerm.lean"
    mod_emit_graph_scaf_term="$lean_dir/HostModuleCheckEmitGraphScaffoldTerm.lean"
    mod_emit_compose_scaf_term="$lean_dir/HostModuleCheckEmitComposeScaffoldTerm.lean"
    mod_emit_erasure_scaf_term="$lean_dir/HostModuleCheckEmitErasureScaffoldTerm.lean"
    mod_emit_extract_scaf_term="$lean_dir/HostModuleCheckEmitExtractScaffoldTerm.lean"
    mod_emit_banner_scaf_term="$lean_dir/HostModuleCheckEmitBannerScaffoldTerm.lean"
    mod_kernel_self_apply_term="$lean_dir/HostModuleCheckKernelSelfApplyTerm.lean"
    mod_product_out_kernel_term="$lean_dir/HostModuleCheckProductOutKernelTerm.lean"
    mod_compile_path_term="$lean_dir/HostModuleCheckCompilePathTerm.lean"
    mod_join_map_term="$lean_dir/HostModuleCheckJoinMapTerm.lean"
    mod_self_host_term="$lean_dir/HostModuleCheckSelfHostTerm.lean"
    mod_surface_matrix_term="$lean_dir/HostModuleCheckSurfaceMatrixTerm.lean"
    mod_spec_proof_term="$lean_dir/HostModuleCheckSpecProofTerm.lean"
    mod_dual_residual_term="$lean_dir/HostModuleCheckDualResidualTerm.lean"
    mod_compile_path_mult_term="$lean_dir/HostModuleCheckCompilePathMultTerm.lean"
    mod_compile_path_linear_term="$lean_dir/HostModuleCheckCompilePathLinearTerm.lean"
    mod_compile_path_types_term="$lean_dir/HostModuleCheckCompilePathTypesTerm.lean"
    mod_compile_path_program_term="$lean_dir/HostModuleCheckCompilePathProgramTerm.lean"
    mod_compile_path_graph_term="$lean_dir/HostModuleCheckCompilePathGraphTerm.lean"
    mod_compile_path_compose_term="$lean_dir/HostModuleCheckCompilePathComposeTerm.lean"
    mod_compile_path_erasure_term="$lean_dir/HostModuleCheckCompilePathErasureTerm.lean"
    mod_compile_path_extract_term="$lean_dir/HostModuleCheckCompilePathExtractTerm.lean"
    mod_compile_path_plan_term="$lean_dir/HostModuleCheckCompilePathPlanTerm.lean"
    mod_compile_path_apply_term="$lean_dir/HostModuleCheckCompilePathApplyTerm.lean"
    mod_compile_path_body_term="$lean_dir/HostModuleCheckCompilePathBodyTerm.lean"
    mod_first_surface_term="$lean_dir/HostModuleCheckFirstSurfaceTerm.lean"
    mod_linear_subset_emit_term="$lean_dir/HostModuleCheckLinearSubsetEmitTerm.lean"
    mod_types_subset_emit_term="$lean_dir/HostModuleCheckTypesSubsetEmitTerm.lean"
    mod_program_subset_emit_term="$lean_dir/HostModuleCheckProgramSubsetEmitTerm.lean"
    mod_graph_subset_emit_term="$lean_dir/HostModuleCheckGraphSubsetEmitTerm.lean"
    mod_compose_subset_emit_term="$lean_dir/HostModuleCheckComposeSubsetEmitTerm.lean"
    mod_erasure_subset_emit_term="$lean_dir/HostModuleCheckErasureSubsetEmitTerm.lean"
    mod_extract_subset_emit_term="$lean_dir/HostModuleCheckExtractSubsetEmitTerm.lean"
    mod_mult_subset_emit_term="$lean_dir/HostModuleCheckMultSubsetEmitTerm.lean"
    mod_mult_subset_rebuild_term="$lean_dir/HostModuleCheckMultSubsetRebuildTerm.lean"
    mod_linear_subset_rebuild_term="$lean_dir/HostModuleCheckLinearSubsetRebuildTerm.lean"
    mod_types_subset_rebuild_term="$lean_dir/HostModuleCheckTypesSubsetRebuildTerm.lean"
    mod_program_subset_rebuild_term="$lean_dir/HostModuleCheckProgramSubsetRebuildTerm.lean"
    mod_graph_subset_rebuild_term="$lean_dir/HostModuleCheckGraphSubsetRebuildTerm.lean"
    mod_compose_subset_rebuild_term="$lean_dir/HostModuleCheckComposeSubsetRebuildTerm.lean"
    mod_erasure_subset_rebuild_term="$lean_dir/HostModuleCheckErasureSubsetRebuildTerm.lean"
    mod_extract_subset_rebuild_term="$lean_dir/HostModuleCheckExtractSubsetRebuildTerm.lean"
    mod_host_front_term="$lean_dir/HostModuleCheckHostFrontTerm.lean"
    mod_llvm_mult_text_term="$lean_dir/HostModuleCheckLlvmMultTextTerm.lean"
    mod_host_check_term="$lean_dir/HostModuleCheckHostCheckTerm.lean"
    mod_host_graph_term="$lean_dir/HostModuleCheckHostGraphTerm.lean"
    mod_llvm_linear_text_term="$lean_dir/HostModuleCheckLlvmLinearTextTerm.lean"
    mod_mult_fs_write_tool_term="$lean_dir/HostModuleCheckMultFsWriteToolTerm.lean"
    mod_front_mult_package_term="$lean_dir/HostModuleCheckFrontMultPackageTerm.lean"
    mod_subset_package_join_term="$lean_dir/HostModuleCheckSubsetPackageJoinTerm.lean"
    mod_llvm_types_text_term="$lean_dir/HostModuleCheckLlvmTypesTextTerm.lean"
    mod_mult_fs_deepen_term="$lean_dir/HostModuleCheckMultFsDeepenTerm.lean"
    mod_host_package_write_term="$lean_dir/HostModuleCheckHostPackageWriteTerm.lean"
    mod_llvm_program_text_term="$lean_dir/HostModuleCheckLlvmProgramTextTerm.lean"
    mod_llvm_graph_text_term="$lean_dir/HostModuleCheckLlvmGraphTextTerm.lean"
    mod_llvm_compose_text_term="$lean_dir/HostModuleCheckLlvmComposeTextTerm.lean"
    mod_load_ok_compile_path_units="$lean_dir/HostModuleCheckLoadOkCompilePathUnits.lean"
    mod_load_ok_later_term="$lean_dir/HostModuleCheckLoadOkLaterTerm.lean"
    mod_real_module="$lean_dir/HostModuleCheckRealModule.lean"
    mod_mult_proof="$lean_dir/HostModuleCheckMultProof.lean"
    mod_linear_proof="$lean_dir/HostModuleCheckLinearProof.lean"
    mod_types_proof="$lean_dir/HostModuleCheckTypesProof.lean"
    mod_kernelmult_proof="$lean_dir/HostModuleCheckKernelMultProof.lean"
    mod_kernellinear_proof="$lean_dir/HostModuleCheckKernelLinearProof.lean"
    mod_kerneltypes_proof="$lean_dir/HostModuleCheckKernelTypesProof.lean"
    mod_kernelprogram_proof="$lean_dir/HostModuleCheckKernelProgramProof.lean"
    mod_kernelemit_proof="$lean_dir/HostModuleCheckKernelEmitProof.lean"
    mod_package_elab="$lean_dir/HostModuleCheckPackageElab.lean"
    mod_package_env="$lean_dir/HostModuleCheckPackageEnv.lean"
    mod_package_env_fixtures="$lean_dir/HostModuleCheckPackageEnvFixtures.lean"
    mod_package_env_fixtures_u2="$lean_dir/HostModuleCheckPackageEnvFixturesU2.lean"
    mod_package_env_fixtures_s5="$lean_dir/HostModuleCheckPackageEnvFixturesS5.lean"
    mod_package_env_evidence="$lean_dir/HostModuleCheckPackageEnvEvidence.lean"
    mod_checkers="$lean_dir/HostModuleCheckCheckers.lean"
    mod_checkers_later="$lean_dir/HostModuleCheckCheckersLater.lean"
    mod_accepts="$lean_dir/HostModuleCheckAccepts.lean"
    mod_accepts_goods="$lean_dir/HostModuleCheckAcceptsGoods.lean"
    mod_accepts_proof="$lean_dir/HostModuleCheckAcceptsProof.lean"
    mod_accepts_later="$lean_dir/HostModuleCheckAcceptsLater.lean"
    mod_fixtures="$lean_dir/HostModuleCheckFixtures.lean"
    mod_required_decls="$lean_dir/HostModuleCheckRequiredDecls.lean"
    mod_required_decls_product="$lean_dir/HostModuleCheckRequiredDeclsProduct.lean"
    mod_required_decls_later="$lean_dir/HostModuleCheckRequiredDeclsLater.lean"
    mod_fixture_texts="$lean_dir/HostModuleCheckFixtureTexts.lean"
    mod_fixture_texts_product="$lean_dir/HostModuleCheckFixtureTextsProduct.lean"
    mod_fixture_texts_later="$lean_dir/HostModuleCheckFixtureTextsLater.lean"
    mod_fixture_texts_self_host="$lean_dir/HostModuleCheckFixtureTextsSelfHost.lean"
    family_mods=(
      "$mod" "$mod_seeds" "$mod_load" "$mod_driver_io" "$mod_driver" "$mod_surface" "$mod_mult_term"
      "$mod_linear_term"
      "$mod_types_term"
      "$mod_irprogram_term"
      "$mod_irgraph_term"
      "$mod_hostcompose_term"
      "$mod_erasure_term"
      "$mod_extract_term"
      "$mod_emitplan_term"
      "$mod_emitapply_term"
      "$mod_emitbody_term"
      "$mod_kernelmult_term"
      "$mod_kernellinear_term"
      "$mod_kerneltypes_term"
      "$mod_kernelprogram_term"
      "$mod_kernelemit_term"
      "$mod_paritymult_term"
      "$mod_paritylinear_term"
      "$mod_paritytypes_term"
      "$mod_emit_mult_scaf_term"
      "$mod_emit_linear_scaf_term"
      "$mod_emit_types_scaf_term"
      "$mod_emit_program_scaf_term"
      "$mod_emit_graph_scaf_term"
      "$mod_emit_compose_scaf_term"
      "$mod_emit_erasure_scaf_term"
      "$mod_emit_extract_scaf_term"
      "$mod_emit_banner_scaf_term"
      "$mod_kernel_self_apply_term"
      "$mod_product_out_kernel_term"
      "$mod_compile_path_term"
      "$mod_join_map_term"
      "$mod_self_host_term"
      "$mod_surface_matrix_term"
      "$mod_spec_proof_term"
      "$mod_dual_residual_term"
      "$mod_compile_path_mult_term"
      "$mod_compile_path_linear_term"
      "$mod_compile_path_types_term"
      "$mod_compile_path_program_term"
      "$mod_compile_path_graph_term"
      "$mod_compile_path_compose_term"
      "$mod_compile_path_erasure_term"
      "$mod_compile_path_extract_term"
      "$mod_compile_path_plan_term"
      "$mod_compile_path_apply_term"
      "$mod_compile_path_body_term"
      "$mod_first_surface_term"
      "$mod_linear_subset_emit_term"
      "$mod_types_subset_emit_term"
      "$mod_program_subset_emit_term"
      "$mod_graph_subset_emit_term"
      "$mod_compose_subset_emit_term"
      "$mod_erasure_subset_emit_term"
      "$mod_extract_subset_emit_term"
      "$mod_mult_subset_emit_term"
      "$mod_mult_subset_rebuild_term"
      "$mod_linear_subset_rebuild_term"
      "$mod_types_subset_rebuild_term"
      "$mod_program_subset_rebuild_term"
      "$mod_graph_subset_rebuild_term"
      "$mod_compose_subset_rebuild_term"
      "$mod_erasure_subset_rebuild_term"
      "$mod_extract_subset_rebuild_term"
      "$mod_host_front_term"
      "$mod_llvm_mult_text_term"
      "$mod_host_check_term"
      "$mod_host_graph_term"
      "$mod_llvm_linear_text_term"
      "$mod_mult_fs_write_tool_term"
      "$mod_front_mult_package_term"
      "$mod_subset_package_join_term"
      "$mod_llvm_types_text_term"
      "$mod_mult_fs_deepen_term"
      "$mod_host_package_write_term"
      "$mod_llvm_program_text_term"
      "$mod_llvm_graph_text_term"
      "$mod_llvm_compose_text_term"
      "$mod_load_ok_compile_path_units"
      "$mod_load_ok_later_term"
      "$mod_real_module"
      "$mod_mult_proof"
      "$mod_linear_proof"
      "$mod_types_proof"
      "$mod_kernelmult_proof"
      "$mod_kernellinear_proof" "$mod_kerneltypes_proof"
      "$mod_kernelprogram_proof"
      "$mod_kernelemit_proof"
      "$mod_package_elab"
      "$mod_package_env"
      "$mod_package_env_fixtures"
      "$mod_package_env_fixtures_u2"
      "$mod_package_env_fixtures_s5"
      "$mod_package_env_evidence"
      "$mod_checkers" "$mod_checkers_later" "$mod_accepts" "$mod_accepts_goods" "$mod_accepts_proof" "$mod_accepts_later"
      "$mod_fixtures"
      "$mod_required_decls" "$mod_required_decls_product" "$mod_required_decls_later"
      "$mod_fixture_texts" "$mod_fixture_texts_product" "$mod_fixture_texts_later" "$mod_fixture_texts_self_host"
    )
    grep_hmc_family() {
      local tok="$1"
      local f
      for f in "${family_mods[@]}"; do
        if [[ -f "$f" ]] && grep -qF "$tok" "$f"; then
          return 0
        fi
      done
      return 1
    }
    main_mod="$lean_dir/HostModuleCheckMain.lean"
    mult_mod="$lean_dir/Mult.lean"
    mult_thm="$lean_dir/MultTheorems.lean"
    linear_mod="$lean_dir/Linear.lean"
    linear_thm="$lean_dir/LinearTheorems.lean"
    types_mod="$lean_dir/Types.lean"
    types_thm="$lean_dir/TypesTheorems.lean"
    ir_prog="$lean_dir/IrProgram.lean"
    ir_prog_thm="$lean_dir/IrProgramTheorems.lean"
    ir_graph="$lean_dir/IrGraph.lean"
    ir_graph_thm="$lean_dir/IrGraphTheorems.lean"
    host_compose="$lean_dir/HostCompose.lean"
    host_compose_thm="$lean_dir/HostComposeTheorems.lean"
    echo "== host-module-check (A5/A6 Mult+Linear+Types+Program+Graph module check; Lake bootstrap path) =="
    echo "  input: real Mult+Linear+Types+Program+Graph (+Theorems) structural surface"
    echo "  depth: PARTIAL-STRUCTURAL (imports + key decls; not full elaborate)"
    echo "  output: hostModuleCheckReady / finished; host residual remains; Lake OK"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    for seed in "$mult_mod" "$mult_thm" "$linear_mod" "$linear_thm" "$types_mod" "$types_thm" "$ir_prog" "$ir_prog_thm" "$ir_graph" "$ir_graph_thm" "$host_compose" "$host_compose_thm"; do
      if [[ ! -f "$seed" ]]; then
        echo "error: missing seed $seed" >&2
        exit 1
      fi
    done
    for tok in \
      SYSTEMS_LEAN_HOST \
      HOST-MODULE-CHECK \
      SLAKE_HOST_MODULE_CHECK_V0 \
      hostModuleCheckReady \
      hostModuleCheckFinishedClaimed \
      hostModuleCheckLoadOk \
      hostModuleCheckWithoutLakeFinished \
      loadMultModuleCheck \
      runModuleCheck \
      checkRealModule \
      extractKeyDecls \
      extractImports \
      hostModuleCheckSeedModules \
      hostModuleCheckExpandSliceName \
      Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems \
      hostModuleCheckGoodMult \
      hostModuleCheckGoodMultTheorems \
      hostModuleCheckGoodLinear \
      hostModuleCheckGoodTypes \
      hostModuleCheckGoodIrProgram \
      hostModuleCheckGoodIrGraph \
      hostModuleCheckGoodHostCompose \
      hostModuleCheckBadMissingInductive \
      hostModuleCheckBadMissingNamespace \
      hostModuleCheckBadEmpty \
      hostModuleCheckBadMissingTheorem \
      PARTIAL-STRUCTURAL \
      MISSING-DECL \
      MISSING-NAMESPACE \
      EMPTY-MODULE \
      slake-host-module-check \
      host-module-check-without-lake
    do
      if ! grep_hmc_family "$tok"; then
        echo "error: missing $tok in HostModuleCheck family" >&2
        exit 1
      fi
    done
    if ! grep_hmc_family 'First real host module check'; then
      echo "error: missing residual Name First real host module check in HostModuleCheck family" >&2
      exit 1
    fi
    if ! grep_hmc_family 'Host library seed expand continue'; then
      echo "error: missing expand Name Host library seed expand continue in HostModuleCheck family" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod_seeds"; then
      echo "error: hostModuleCheckFinishedClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckHostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod_seeds"; then
      echo "error: hostModuleCheckHostElaboratorResidualRemains must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod_seeds"; then
      echo "error: hostModuleCheckHostFreeClaimed must stay false" >&2
      exit 1
    fi
    if ! grep -qF 'namespace SystemsLean.Mult' "$mult_mod"; then
      echo "error: Mult.lean must declare namespace SystemsLean.Mult" >&2
      exit 1
    fi
    if ! grep -qE '^inductive Mult' "$mult_mod"; then
      echo "error: Mult.lean must declare inductive Mult" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Mult' "$mult_thm"; then
      echo "error: MultTheorems.lean must import SystemsLean.Mult" >&2
      exit 1
    fi
    if ! grep -qF 'namespace SystemsLean.Linear' "$linear_mod"; then
      echo "error: Linear.lean must declare namespace SystemsLean.Linear" >&2
      exit 1
    fi
    if ! grep -qF 'def shareNat' "$linear_mod"; then
      echo "error: Linear.lean must declare def shareNat" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Linear' "$linear_thm"; then
      echo "error: LinearTheorems.lean must import SystemsLean.Linear" >&2
      exit 1
    fi
    if ! grep -qF 'namespace SystemsLean.Types' "$types_mod"; then
      echo "error: Types.lean must declare namespace SystemsLean.Types" >&2
      exit 1
    fi
    if ! grep -qE '^inductive NodeKind' "$types_mod"; then
      echo "error: Types.lean must declare inductive NodeKind" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Types' "$types_thm"; then
      echo "error: TypesTheorems.lean must import SystemsLean.Types" >&2
      exit 1
    fi
    if ! grep -qF 'namespace SystemsLean.IrProgram' "$ir_prog"; then
      echo "error: IrProgram.lean must declare namespace SystemsLean.IrProgram" >&2
      exit 1
    fi
    if ! grep -qF 'def programCap' "$ir_prog"; then
      echo "error: IrProgram.lean must declare def programCap" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrProgram' "$ir_prog_thm"; then
      echo "error: IrProgramTheorems.lean must import SystemsLean.IrProgram" >&2
      exit 1
    fi
    if ! grep -qF 'namespace SystemsLean.IrGraph' "$ir_graph"; then
      echo "error: IrGraph.lean must declare namespace SystemsLean.IrGraph" >&2
      exit 1
    fi
    if ! grep -qF 'def edgeMax' "$ir_graph"; then
      echo "error: IrGraph.lean must declare def edgeMax" >&2
      exit 1
    fi
    if ! grep -qF 'def mint' "$host_compose"; then
      echo "error: HostCompose.lean must declare def mint" >&2
      exit 1
    fi
    if ! grep -qF 'namespace SystemsLean.HostCompose' "$host_compose"; then
      echo "error: HostCompose.lean must declare namespace SystemsLean.HostCompose" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrGraph' "$ir_graph_thm"; then
      echo "error: IrGraphTheorems.lean must import SystemsLean.IrGraph" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrGraph' "$host_compose"; then
      echo "error: HostCompose.lean must import SystemsLean.IrGraph (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.HostCompose' "$host_compose_thm"; then
      echo "error: HostComposeTheorems.lean must import SystemsLean.HostCompose (real edge)" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; host-module-check requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-host-module-check
      lake exe slake-host-module-check -- "$root"
    )
    echo "host-module-check: GREEN (real Mult+Linear+Types+Program+Graph PARTIAL-STRUCTURAL; hostModuleCheckReady; Lake OK; host residual remains; not PROVABLY/llvm)"

# A5 measured without-Lake first real host module check (prebuilt).
# Bootstrap once: (cd src/systems && lake build slake-host-module-check).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Greppable: host-module-check-without-lake, HOST-MODULE-CHECK-WITHOUT-LAKE,
# hostModuleCheckWithoutLakeFinished, hostModuleCheckWithoutLakeReady,
# justRecipeWithoutLake, prebuiltHostModuleCheckRel,
# hostModuleCheckWithoutLakeKeepsHostLake.
host-module-check-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    prebuilt="$systems_dir/.lake/build/bin/slake-host-module-check"
    mod="$lean_dir/HostModuleCheck.lean"
    mod_seeds="$lean_dir/HostModuleCheckSeeds.lean"
    mod_load="$lean_dir/HostModuleCheckLoadOk.lean"
    mod_driver_io="$lean_dir/HostModuleCheckDriverIO.lean"
    mod_driver="$lean_dir/HostModuleCheckDriver.lean"
    mod_surface="$lean_dir/HostModuleCheckSurface.lean"
    mod_mult_term="$lean_dir/HostModuleCheckMultTerm.lean"
    mod_linear_term="$lean_dir/HostModuleCheckLinearTerm.lean"
    mod_types_term="$lean_dir/HostModuleCheckTypesTerm.lean"
    mod_irprogram_term="$lean_dir/HostModuleCheckIrProgramTerm.lean"
    mod_irgraph_term="$lean_dir/HostModuleCheckIrGraphTerm.lean"
    mod_hostcompose_term="$lean_dir/HostModuleCheckHostComposeTerm.lean"
    mod_erasure_term="$lean_dir/HostModuleCheckErasureTerm.lean"
    mod_extract_term="$lean_dir/HostModuleCheckExtractTerm.lean"
    mod_emitplan_term="$lean_dir/HostModuleCheckEmitPlanTerm.lean"
    mod_emitapply_term="$lean_dir/HostModuleCheckEmitApplyTerm.lean"
    mod_emitbody_term="$lean_dir/HostModuleCheckEmitBodyTerm.lean"
    mod_kernelmult_term="$lean_dir/HostModuleCheckKernelMultTerm.lean"
    mod_kernellinear_term="$lean_dir/HostModuleCheckKernelLinearTerm.lean"
    mod_kerneltypes_term="$lean_dir/HostModuleCheckKernelTypesTerm.lean"
    mod_kernelprogram_term="$lean_dir/HostModuleCheckKernelProgramTerm.lean"
    mod_kernelemit_term="$lean_dir/HostModuleCheckKernelEmitTerm.lean"
    mod_paritymult_term="$lean_dir/HostModuleCheckParityMultTerm.lean"
    mod_paritylinear_term="$lean_dir/HostModuleCheckParityLinearTerm.lean"
    mod_paritytypes_term="$lean_dir/HostModuleCheckParityTypesTerm.lean"
    mod_emit_mult_scaf_term="$lean_dir/HostModuleCheckEmitMultScaffoldTerm.lean"
    mod_emit_linear_scaf_term="$lean_dir/HostModuleCheckEmitLinearScaffoldTerm.lean"
    mod_emit_types_scaf_term="$lean_dir/HostModuleCheckEmitTypesScaffoldTerm.lean"
    mod_emit_program_scaf_term="$lean_dir/HostModuleCheckEmitProgramScaffoldTerm.lean"
    mod_emit_graph_scaf_term="$lean_dir/HostModuleCheckEmitGraphScaffoldTerm.lean"
    mod_emit_compose_scaf_term="$lean_dir/HostModuleCheckEmitComposeScaffoldTerm.lean"
    mod_emit_erasure_scaf_term="$lean_dir/HostModuleCheckEmitErasureScaffoldTerm.lean"
    mod_emit_extract_scaf_term="$lean_dir/HostModuleCheckEmitExtractScaffoldTerm.lean"
    mod_emit_banner_scaf_term="$lean_dir/HostModuleCheckEmitBannerScaffoldTerm.lean"
    mod_kernel_self_apply_term="$lean_dir/HostModuleCheckKernelSelfApplyTerm.lean"
    mod_product_out_kernel_term="$lean_dir/HostModuleCheckProductOutKernelTerm.lean"
    mod_compile_path_term="$lean_dir/HostModuleCheckCompilePathTerm.lean"
    mod_join_map_term="$lean_dir/HostModuleCheckJoinMapTerm.lean"
    mod_self_host_term="$lean_dir/HostModuleCheckSelfHostTerm.lean"
    mod_surface_matrix_term="$lean_dir/HostModuleCheckSurfaceMatrixTerm.lean"
    mod_spec_proof_term="$lean_dir/HostModuleCheckSpecProofTerm.lean"
    mod_dual_residual_term="$lean_dir/HostModuleCheckDualResidualTerm.lean"
    mod_compile_path_mult_term="$lean_dir/HostModuleCheckCompilePathMultTerm.lean"
    mod_compile_path_linear_term="$lean_dir/HostModuleCheckCompilePathLinearTerm.lean"
    mod_compile_path_types_term="$lean_dir/HostModuleCheckCompilePathTypesTerm.lean"
    mod_compile_path_program_term="$lean_dir/HostModuleCheckCompilePathProgramTerm.lean"
    mod_compile_path_graph_term="$lean_dir/HostModuleCheckCompilePathGraphTerm.lean"
    mod_compile_path_compose_term="$lean_dir/HostModuleCheckCompilePathComposeTerm.lean"
    mod_compile_path_erasure_term="$lean_dir/HostModuleCheckCompilePathErasureTerm.lean"
    mod_compile_path_extract_term="$lean_dir/HostModuleCheckCompilePathExtractTerm.lean"
    mod_compile_path_plan_term="$lean_dir/HostModuleCheckCompilePathPlanTerm.lean"
    mod_compile_path_apply_term="$lean_dir/HostModuleCheckCompilePathApplyTerm.lean"
    mod_compile_path_body_term="$lean_dir/HostModuleCheckCompilePathBodyTerm.lean"
    mod_first_surface_term="$lean_dir/HostModuleCheckFirstSurfaceTerm.lean"
    mod_linear_subset_emit_term="$lean_dir/HostModuleCheckLinearSubsetEmitTerm.lean"
    mod_types_subset_emit_term="$lean_dir/HostModuleCheckTypesSubsetEmitTerm.lean"
    mod_program_subset_emit_term="$lean_dir/HostModuleCheckProgramSubsetEmitTerm.lean"
    mod_graph_subset_emit_term="$lean_dir/HostModuleCheckGraphSubsetEmitTerm.lean"
    mod_compose_subset_emit_term="$lean_dir/HostModuleCheckComposeSubsetEmitTerm.lean"
    mod_erasure_subset_emit_term="$lean_dir/HostModuleCheckErasureSubsetEmitTerm.lean"
    mod_extract_subset_emit_term="$lean_dir/HostModuleCheckExtractSubsetEmitTerm.lean"
    mod_mult_subset_emit_term="$lean_dir/HostModuleCheckMultSubsetEmitTerm.lean"
    mod_mult_subset_rebuild_term="$lean_dir/HostModuleCheckMultSubsetRebuildTerm.lean"
    mod_linear_subset_rebuild_term="$lean_dir/HostModuleCheckLinearSubsetRebuildTerm.lean"
    mod_types_subset_rebuild_term="$lean_dir/HostModuleCheckTypesSubsetRebuildTerm.lean"
    mod_program_subset_rebuild_term="$lean_dir/HostModuleCheckProgramSubsetRebuildTerm.lean"
    mod_graph_subset_rebuild_term="$lean_dir/HostModuleCheckGraphSubsetRebuildTerm.lean"
    mod_compose_subset_rebuild_term="$lean_dir/HostModuleCheckComposeSubsetRebuildTerm.lean"
    mod_erasure_subset_rebuild_term="$lean_dir/HostModuleCheckErasureSubsetRebuildTerm.lean"
    mod_extract_subset_rebuild_term="$lean_dir/HostModuleCheckExtractSubsetRebuildTerm.lean"
    mod_host_front_term="$lean_dir/HostModuleCheckHostFrontTerm.lean"
    mod_llvm_mult_text_term="$lean_dir/HostModuleCheckLlvmMultTextTerm.lean"
    mod_host_check_term="$lean_dir/HostModuleCheckHostCheckTerm.lean"
    mod_host_graph_term="$lean_dir/HostModuleCheckHostGraphTerm.lean"
    mod_llvm_linear_text_term="$lean_dir/HostModuleCheckLlvmLinearTextTerm.lean"
    mod_mult_fs_write_tool_term="$lean_dir/HostModuleCheckMultFsWriteToolTerm.lean"
    mod_front_mult_package_term="$lean_dir/HostModuleCheckFrontMultPackageTerm.lean"
    mod_subset_package_join_term="$lean_dir/HostModuleCheckSubsetPackageJoinTerm.lean"
    mod_llvm_types_text_term="$lean_dir/HostModuleCheckLlvmTypesTextTerm.lean"
    mod_mult_fs_deepen_term="$lean_dir/HostModuleCheckMultFsDeepenTerm.lean"
    mod_host_package_write_term="$lean_dir/HostModuleCheckHostPackageWriteTerm.lean"
    mod_llvm_program_text_term="$lean_dir/HostModuleCheckLlvmProgramTextTerm.lean"
    mod_llvm_graph_text_term="$lean_dir/HostModuleCheckLlvmGraphTextTerm.lean"
    mod_llvm_compose_text_term="$lean_dir/HostModuleCheckLlvmComposeTextTerm.lean"
    mod_load_ok_compile_path_units="$lean_dir/HostModuleCheckLoadOkCompilePathUnits.lean"
    mod_load_ok_later_term="$lean_dir/HostModuleCheckLoadOkLaterTerm.lean"
    mod_real_module="$lean_dir/HostModuleCheckRealModule.lean"
    mod_mult_proof="$lean_dir/HostModuleCheckMultProof.lean"
    mod_linear_proof="$lean_dir/HostModuleCheckLinearProof.lean"
    mod_types_proof="$lean_dir/HostModuleCheckTypesProof.lean"
    mod_kernelmult_proof="$lean_dir/HostModuleCheckKernelMultProof.lean"
    mod_kernellinear_proof="$lean_dir/HostModuleCheckKernelLinearProof.lean"
    mod_kerneltypes_proof="$lean_dir/HostModuleCheckKernelTypesProof.lean"
    mod_kernelprogram_proof="$lean_dir/HostModuleCheckKernelProgramProof.lean"
    mod_kernelemit_proof="$lean_dir/HostModuleCheckKernelEmitProof.lean"
    mod_package_elab="$lean_dir/HostModuleCheckPackageElab.lean"
    mod_package_env="$lean_dir/HostModuleCheckPackageEnv.lean"
    mod_package_env_fixtures="$lean_dir/HostModuleCheckPackageEnvFixtures.lean"
    mod_package_env_fixtures_u2="$lean_dir/HostModuleCheckPackageEnvFixturesU2.lean"
    mod_package_env_fixtures_s5="$lean_dir/HostModuleCheckPackageEnvFixturesS5.lean"
    mod_package_env_evidence="$lean_dir/HostModuleCheckPackageEnvEvidence.lean"
    mod_checkers="$lean_dir/HostModuleCheckCheckers.lean"
    mod_checkers_later="$lean_dir/HostModuleCheckCheckersLater.lean"
    mod_accepts="$lean_dir/HostModuleCheckAccepts.lean"
    mod_accepts_goods="$lean_dir/HostModuleCheckAcceptsGoods.lean"
    mod_accepts_proof="$lean_dir/HostModuleCheckAcceptsProof.lean"
    mod_accepts_later="$lean_dir/HostModuleCheckAcceptsLater.lean"
    mod_fixtures="$lean_dir/HostModuleCheckFixtures.lean"
    mod_required_decls="$lean_dir/HostModuleCheckRequiredDecls.lean"
    mod_required_decls_product="$lean_dir/HostModuleCheckRequiredDeclsProduct.lean"
    mod_required_decls_later="$lean_dir/HostModuleCheckRequiredDeclsLater.lean"
    mod_fixture_texts="$lean_dir/HostModuleCheckFixtureTexts.lean"
    mod_fixture_texts_product="$lean_dir/HostModuleCheckFixtureTextsProduct.lean"
    mod_fixture_texts_later="$lean_dir/HostModuleCheckFixtureTextsLater.lean"
    mod_fixture_texts_self_host="$lean_dir/HostModuleCheckFixtureTextsSelfHost.lean"
    family_mods=(
      "$mod" "$mod_seeds" "$mod_load" "$mod_driver_io" "$mod_driver" "$mod_surface" "$mod_mult_term"
      "$mod_linear_term"
      "$mod_types_term"
      "$mod_irprogram_term"
      "$mod_irgraph_term"
      "$mod_hostcompose_term"
      "$mod_erasure_term"
      "$mod_extract_term"
      "$mod_emitplan_term"
      "$mod_emitapply_term"
      "$mod_emitbody_term"
      "$mod_kernelmult_term"
      "$mod_kernellinear_term"
      "$mod_kerneltypes_term"
      "$mod_kernelprogram_term"
      "$mod_kernelemit_term"
      "$mod_paritymult_term"
      "$mod_paritylinear_term"
      "$mod_paritytypes_term"
      "$mod_emit_mult_scaf_term"
      "$mod_emit_linear_scaf_term"
      "$mod_emit_types_scaf_term"
      "$mod_emit_program_scaf_term"
      "$mod_emit_graph_scaf_term"
      "$mod_emit_compose_scaf_term"
      "$mod_emit_erasure_scaf_term"
      "$mod_emit_extract_scaf_term"
      "$mod_emit_banner_scaf_term"
      "$mod_kernel_self_apply_term"
      "$mod_product_out_kernel_term"
      "$mod_compile_path_term"
      "$mod_join_map_term"
      "$mod_self_host_term"
      "$mod_surface_matrix_term"
      "$mod_spec_proof_term"
      "$mod_dual_residual_term"
      "$mod_compile_path_mult_term"
      "$mod_compile_path_linear_term"
      "$mod_compile_path_types_term"
      "$mod_compile_path_program_term"
      "$mod_compile_path_graph_term"
      "$mod_compile_path_compose_term"
      "$mod_compile_path_erasure_term"
      "$mod_compile_path_extract_term"
      "$mod_compile_path_plan_term"
      "$mod_compile_path_apply_term"
      "$mod_compile_path_body_term"
      "$mod_first_surface_term"
      "$mod_linear_subset_emit_term"
      "$mod_types_subset_emit_term"
      "$mod_program_subset_emit_term"
      "$mod_graph_subset_emit_term"
      "$mod_compose_subset_emit_term"
      "$mod_erasure_subset_emit_term"
      "$mod_extract_subset_emit_term"
      "$mod_mult_subset_emit_term"
      "$mod_mult_subset_rebuild_term"
      "$mod_linear_subset_rebuild_term"
      "$mod_types_subset_rebuild_term"
      "$mod_program_subset_rebuild_term"
      "$mod_graph_subset_rebuild_term"
      "$mod_compose_subset_rebuild_term"
      "$mod_erasure_subset_rebuild_term"
      "$mod_extract_subset_rebuild_term"
      "$mod_host_front_term"
      "$mod_llvm_mult_text_term"
      "$mod_host_check_term"
      "$mod_host_graph_term"
      "$mod_llvm_linear_text_term"
      "$mod_mult_fs_write_tool_term"
      "$mod_front_mult_package_term"
      "$mod_subset_package_join_term"
      "$mod_llvm_types_text_term"
      "$mod_mult_fs_deepen_term"
      "$mod_host_package_write_term"
      "$mod_llvm_program_text_term"
      "$mod_llvm_graph_text_term"
      "$mod_llvm_compose_text_term"
      "$mod_load_ok_compile_path_units"
      "$mod_load_ok_later_term"
      "$mod_real_module"
      "$mod_mult_proof"
      "$mod_linear_proof"
      "$mod_types_proof"
      "$mod_kernelmult_proof"
      "$mod_kernellinear_proof" "$mod_kerneltypes_proof"
      "$mod_kernelprogram_proof"
      "$mod_kernelemit_proof"
      "$mod_package_elab"
      "$mod_package_env"
      "$mod_package_env_fixtures"
      "$mod_package_env_fixtures_u2"
      "$mod_package_env_fixtures_s5"
      "$mod_package_env_evidence"
      "$mod_checkers" "$mod_checkers_later" "$mod_accepts" "$mod_accepts_goods" "$mod_accepts_proof" "$mod_accepts_later"
      "$mod_fixtures"
      "$mod_required_decls" "$mod_required_decls_product" "$mod_required_decls_later"
      "$mod_fixture_texts" "$mod_fixture_texts_product" "$mod_fixture_texts_later" "$mod_fixture_texts_self_host"
    )
    grep_hmc_family() {
      local tok="$1"
      local f
      for f in "${family_mods[@]}"; do
        if [[ -f "$f" ]] && grep -qF "$tok" "$f"; then
          return 0
        fi
      done
      return 1
    }
    mult_mod="$lean_dir/Mult.lean"
    mult_thm="$lean_dir/MultTheorems.lean"
    linear_mod="$lean_dir/Linear.lean"
    linear_thm="$lean_dir/LinearTheorems.lean"
    types_mod="$lean_dir/Types.lean"
    types_thm="$lean_dir/TypesTheorems.lean"
    ir_prog="$lean_dir/IrProgram.lean"
    ir_prog_thm="$lean_dir/IrProgramTheorems.lean"
    ir_graph="$lean_dir/IrGraph.lean"
    ir_graph_thm="$lean_dir/IrGraphTheorems.lean"
    host_compose="$lean_dir/HostCompose.lean"
    host_compose_thm="$lean_dir/HostComposeTheorems.lean"
    echo "== host-module-check-without-lake (A5/A6 Compose expand; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  input: real Mult+Linear+Types+Program+Graph (+Theorems) structural surface"
    echo "  depth: PARTIAL-STRUCTURAL"
    echo "  output: hostModuleCheckWithoutLakeFinished / Ready; host residual remains"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    for tok in \
      hostModuleCheckWithoutLakeFinished \
      hostModuleCheckWithoutLakeReady \
      justRecipeWithoutLake \
      host-module-check-without-lake \
      prebuiltHostModuleCheckRel \
      hostModuleCheckWithoutLakeKeepsHostLake \
      hostModuleCheckHostElaboratorResidualRemains \
      HOST-MODULE-CHECK-WITHOUT-LAKE \
      loadMultModuleCheck \
      hostModuleCheckLoadOk \
      hostModuleCheckSeedModules \
      hostModuleCheckExpandSliceName \
      Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems \
      hostModuleCheckGoodLinear \
      hostModuleCheckGoodTypes \
      hostModuleCheckGoodIrProgram \
      hostModuleCheckGoodIrGraph \
      hostModuleCheckGoodHostCompose \
      checkRealModule \
      PARTIAL-STRUCTURAL \
      FOUNDATION-KIND-SURFACE \
      Check depth deepen continue \
      checkDepthDeepenBar \
      checkDepthDeepenBand \
      checkDepthDeepenSliceName \
      TERM-SURFACE \
      Mult-only \
      ILL-TYPED-TERM \
      checkMultTermDialect \
      hostModuleCheckTermSurfaceDualOk \
      hostModuleCheckMultTermSurfaceOk \
      hostModuleCheckBadMultNameReturnType \
      hostModuleCheckBadMultIsValidApp \
      hostModuleCheckBadMultIsValidArm \
      hostModuleCheckGoodMultTerm \
      HostModuleCheckMultTerm \
      Linear-only \
      checkLinearTermDialect \
      hostModuleCheckLinearTermSurfaceDualOk \
      hostModuleCheckLinearTermSurfaceOk \
      hostModuleCheckBadLinearShareNatReturnType \
      hostModuleCheckBadLinearPolyIdBody \
      hostModuleCheckBadLinearMult0ClassId \
      hostModuleCheckBadLinearRoundTripBody \
      hostModuleCheckGoodLinearTerm \
      HostModuleCheckLinearTerm \
      Types-only \
      checkTypesTermDialect \
      hostModuleCheckTypesTermSurfaceDualOk \
      hostModuleCheckTypesTermSurfaceOk \
      hostModuleCheckBadTypesNameArm \
      hostModuleCheckBadTypesExpectedMultArm \
      hostModuleCheckBadTypesKindMultOkBody \
      hostModuleCheckBadTypesOfKindTagArm \
      hostModuleCheckGoodTypesTerm \
      HostModuleCheckTypesTerm \
      IrProgram-only \
      checkIrProgramTermDialect \
      hostModuleCheckIrProgramTermSurfaceDualOk \
      hostModuleCheckIrProgramTermSurfaceOk \
      hostModuleCheckBadIrProgramCap \
      hostModuleCheckBadIrProgramCheckFailClosed \
      hostModuleCheckBadIrProgramIsWellTyped \
      hostModuleCheckBadIrProgramPush \
      hostModuleCheckGoodIrProgramTerm \
      HostModuleCheckIrProgramTerm \
      IrGraph-only \
      checkIrGraphTermDialect \
      hostModuleCheckIrGraphTermSurfaceDualOk \
      hostModuleCheckIrGraphTermSurfaceOk \
      hostModuleCheckBadIrGraphEdgeMax \
      hostModuleCheckBadIrGraphCheckFailClosed \
      hostModuleCheckBadIrGraphIsWellTyped \
      hostModuleCheckBadIrGraphPushNode \
      hostModuleCheckGoodIrGraphTerm \
      HostModuleCheckIrGraphTerm \
      HostCompose-only \
      checkHostComposeTermDialect \
      hostModuleCheckHostComposeTermSurfaceDualOk \
      hostModuleCheckHostComposeTermSurfaceOk \
      hostModuleCheckBadHostComposeEmpty \
      hostModuleCheckBadHostComposeCheckFailClosed \
      hostModuleCheckBadHostComposeMint \
      hostModuleCheckBadHostComposePushHostNode \
      hostModuleCheckGoodHostComposeTerm \
      HostModuleCheckHostComposeTerm \
      Erasure-only \
      checkErasureTermDialect \
      hostModuleCheckErasureTermSurfaceDualOk \
      hostModuleCheckErasureTermSurfaceOk \
      hostModuleCheckBadErasureCheckFailClosed \
      hostModuleCheckBadErasureIsErasureGrade \
      hostModuleCheckBadErasureMarkForGrade \
      hostModuleCheckBadErasureIsRuntimeAbsent \
      hostModuleCheckGoodErasureTerm \
      HostModuleCheckErasureTerm \
      Extract-only \
      checkExtractTermDialect \
      hostModuleCheckExtractTermSurfaceDualOk \
      hostModuleCheckExtractTermSurfaceOk \
      hostModuleCheckBadExtractCheckFailClosed \
      hostModuleCheckBadExtractIsFreestandingGoal \
      hostModuleCheckBadExtractExtractOk \
      hostModuleCheckBadExtractIsValidRuntimeTag \
      hostModuleCheckGoodExtractTerm \
      HostModuleCheckExtractTerm \
      EmitPlan-only \
      checkEmitPlanTermDialect \
      hostModuleCheckEmitPlanTermSurfaceDualOk \
      hostModuleCheckEmitPlanTermSurfaceOk \
      hostModuleCheckBadEmitPlanFailClosed \
      hostModuleCheckBadEmitPlanIsRuntimeMult \
      hostModuleCheckBadEmitPlanFromCompose \
      hostModuleCheckBadEmitPlanIsReady \
      hostModuleCheckGoodEmitPlanTerm \
      HostModuleCheckEmitPlanTerm \
      EmitApply-only \
      checkEmitApplyTermDialect \
      hostModuleCheckEmitApplyTermSurfaceDualOk \
      hostModuleCheckEmitApplyTermSurfaceOk \
      hostModuleCheckBadEmitApplyFailClosed \
      hostModuleCheckBadEmitApplyCap \
      hostModuleCheckBadEmitApplyMultCode \
      hostModuleCheckBadEmitApplyFromCompose \
      hostModuleCheckGoodEmitApplyTerm \
      HostModuleCheckEmitApplyTerm \
      EmitBody-only \
      checkEmitBodyTermDialect \
      hostModuleCheckEmitBodyTermSurfaceDualOk \
      hostModuleCheckEmitBodyTermSurfaceOk \
      hostModuleCheckBadEmitBodyFailClosed \
      hostModuleCheckBadEmitBodyCap \
      hostModuleCheckBadEmitBodyFromCompose \
      hostModuleCheckBadEmitBodyIsValid \
      hostModuleCheckGoodEmitBodyTerm \
      HostModuleCheckEmitBodyTerm \
      KernelMult-only \
      checkKernelMultTermDialect \
      hostModuleCheckKernelMultTermSurfaceDualOk \
      hostModuleCheckKernelMultTermSurfaceOk \
      hostModuleCheckBadKernelMultStageId \
      hostModuleCheckBadKernelMultLower \
      hostModuleCheckBadKernelMultReady \
      hostModuleCheckBadKernelMultUnknownTag \
      hostModuleCheckGoodKernelMultTerm \
      HostModuleCheckKernelMultTerm \
      KernelLinear-only \
      checkKernelLinearTermDialect \
      hostModuleCheckKernelLinearTermSurfaceDualOk \
      hostModuleCheckKernelLinearTermSurfaceOk \
      hostModuleCheckBadKernelLinearStageId \
      hostModuleCheckBadKernelLinearLower \
      hostModuleCheckBadKernelLinearReady \
      hostModuleCheckBadKernelLinearMismatch \
      hostModuleCheckGoodKernelLinearTerm \
      HostModuleCheckKernelLinearTerm \
      KernelTypes-only \
      checkKernelTypesTermDialect \
      hostModuleCheckKernelTypesTermSurfaceDualOk \
      hostModuleCheckKernelTypesTermSurfaceOk \
      hostModuleCheckBadKernelTypesStageId \
      hostModuleCheckBadKernelTypesLower \
      hostModuleCheckBadKernelTypesReady \
      hostModuleCheckBadKernelTypesUnknownKind \
      hostModuleCheckGoodKernelTypesTerm \
      HostModuleCheckKernelTypesTerm \
      KernelProgram-only \
      checkKernelProgramTermDialect \
      hostModuleCheckKernelProgramTermSurfaceDualOk \
      hostModuleCheckKernelProgramTermSurfaceOk \
      hostModuleCheckBadKernelProgramStageId \
      hostModuleCheckBadKernelProgramLower \
      hostModuleCheckBadKernelProgramReady \
      hostModuleCheckBadKernelProgramOk \
      hostModuleCheckGoodKernelProgramTerm \
      HostModuleCheckKernelProgramTerm \
      KernelEmit-only \
      checkKernelEmitTermDialect \
      hostModuleCheckKernelEmitTermSurfaceDualOk \
      hostModuleCheckKernelEmitTermSurfaceOk \
      hostModuleCheckBadKernelEmitStageId \
      hostModuleCheckBadKernelEmitLower \
      hostModuleCheckBadKernelEmitReady \
      hostModuleCheckBadKernelEmitOk \
      hostModuleCheckGoodKernelEmitTerm \
      HostModuleCheckKernelEmitTerm \
      ParityMult-only \
      checkParityMultTermDialect \
      hostModuleCheckParityMultTermSurfaceDualOk \
      hostModuleCheckParityMultTermSurfaceOk \
      hostModuleCheckBadParityMultStageId \
      hostModuleCheckBadParityMultReady \
      hostModuleCheckBadParityMultOk \
      hostModuleCheckBadParityMultGrade \
      hostModuleCheckGoodParityMultTerm \
      HostModuleCheckParityMultTerm \
      ParityLinear-only \
      checkParityLinearTermDialect \
      hostModuleCheckParityLinearTermSurfaceDualOk \
      hostModuleCheckParityLinearTermSurfaceOk \
      hostModuleCheckBadParityLinearStageId \
      hostModuleCheckBadParityLinearReady \
      hostModuleCheckBadParityLinearOk \
      hostModuleCheckBadParityLinearContract \
      hostModuleCheckGoodParityLinearTerm \
      HostModuleCheckParityLinearTerm \
      ParityTypes-only \
      checkParityTypesTermDialect \
      hostModuleCheckParityTypesTermSurfaceDualOk \
      hostModuleCheckParityTypesTermSurfaceOk \
      hostModuleCheckBadParityTypesStageId \
      hostModuleCheckBadParityTypesReady \
      hostModuleCheckBadParityTypesOk \
      hostModuleCheckBadParityTypesContract \
      hostModuleCheckGoodParityTypesTerm \
      HostModuleCheckParityTypesTerm \
      HostModuleCheckRealModule \
      PROOF-SURFACE \
      MultTheorems-only \
      ILL-TYPED-PROOF \
      checkMultTheoremsProofDialect \
      hostModuleCheckProofSurfaceDualOk \
      hostModuleCheckMultProofSurfaceOk \
      hostModuleCheckBadMultThmWrongStmt \
      hostModuleCheckBadMultThmSorry \
      hostModuleCheckGoodMultTheoremsProof \
      HostModuleCheckMultProof \
      LinearTheorems-only \
      checkLinearTheoremsProofDialect \
      hostModuleCheckLinearProofSurfaceDualOk \
      hostModuleCheckLinearProofSurfaceOk \
      hostModuleCheckBadLinearThmWrongStmt \
      hostModuleCheckBadLinearThmSorry \
      hostModuleCheckGoodLinearTheoremsProof \
      HostModuleCheckLinearProof \
      TypesTheorems-only \
      checkTypesTheoremsProofDialect \
      hostModuleCheckTypesProofSurfaceDualOk \
      hostModuleCheckTypesProofSurfaceOk \
      hostModuleCheckBadTypesThmWrongStmt \
      hostModuleCheckBadTypesThmSorry \
      hostModuleCheckGoodTypesTheoremsProof \
      HostModuleCheckTypesProof \
      KernelMultTheorems-only \
      checkKernelMultTheoremsProofDialect \
      hostModuleCheckKernelMultProofSurfaceDualOk \
      hostModuleCheckKernelMultProofSurfaceOk \
      hostModuleCheckBadKernelMultThmWrongStmt \
      hostModuleCheckBadKernelMultThmSorry \
      hostModuleCheckGoodKernelMultTheoremsProof \
      HostModuleCheckKernelMultProof \
      KernelLinearTheorems-only \
      checkKernelLinearTheoremsProofDialect \
      hostModuleCheckKernelLinearProofSurfaceDualOk \
      hostModuleCheckKernelLinearProofSurfaceOk \
      hostModuleCheckBadKernelLinearThmWrongStmt \
      hostModuleCheckBadKernelLinearThmSorry \
      hostModuleCheckGoodKernelLinearTheoremsProof \
      HostModuleCheckKernelLinearProof \
      KernelTypesTheorems-only \
      checkKernelTypesTheoremsProofDialect \
      hostModuleCheckKernelTypesProofSurfaceDualOk \
      hostModuleCheckKernelTypesProofSurfaceOk \
      hostModuleCheckBadKernelTypesThmWrongStmt \
      hostModuleCheckBadKernelTypesThmSorry \
      hostModuleCheckGoodKernelTypesTheoremsProof \
      HostModuleCheckKernelTypesProof \
      KernelProgramTheorems-only \
      checkKernelProgramTheoremsProofDialect \
      hostModuleCheckKernelProgramProofSurfaceDualOk \
      hostModuleCheckKernelProgramProofSurfaceOk \
      hostModuleCheckBadKernelProgramThmWrongStmt \
      hostModuleCheckBadKernelProgramThmSorry \
      hostModuleCheckGoodKernelProgramTheoremsProof \
      HostModuleCheckKernelProgramProof \
      KernelEmitTheorems-only \
      checkKernelEmitTheoremsProofDialect \
      hostModuleCheckKernelEmitProofSurfaceDualOk \
      hostModuleCheckKernelEmitProofSurfaceOk \
      hostModuleCheckBadKernelEmitThmWrongStmt \
      hostModuleCheckBadKernelEmitThmSorry \
      hostModuleCheckGoodKernelEmitTheoremsProof \
      HostModuleCheckKernelEmitProof \
      PACKAGE-ELABORATE \
      MultExtractFoundation-only \
      MultLinearTypesProof-only \
      KernelEmitParity-only \
      MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only \
      PACKAGE-BAND-INCOMPLETE \
      PACKAGE-ENV-INCOMPLETE \
      checkPackageFoundationDialect \
      checkPackageProofDialect \
      checkPackageKernelDialect \
      checkPackageEnvDialect \
      hostModuleCheckPackageElaborateFirstBandDualOk \
      hostModuleCheckPackageElaborateFirstBandOk \
      hostModuleCheckPackageElaborateProofBandDualOk \
      hostModuleCheckPackageElaborateProofBandOk \
      hostModuleCheckPackageElaborateKernelBandDualOk \
      hostModuleCheckPackageElaborateKernelBandOk \
      hostModuleCheckPackageElaborateEnvDualOk \
      hostModuleCheckPackageElaborateEnvOk \
      hostModuleCheckGoodPackageFoundationText \
      hostModuleCheckBadPackageMissingExtractText \
      hostModuleCheckBadPackageNotReadyText \
      hostModuleCheckGoodPackageProofText \
      hostModuleCheckBadPackageMissingTypesProofText \
      hostModuleCheckBadPackageProofNotReadyText \
      hostModuleCheckGoodPackageKernelText \
      hostModuleCheckBadPackageMissingParityEmitText \
      hostModuleCheckBadPackageKernelNotReadyText \
      hostModuleCheckGoodPackageEnvText \
      hostModuleCheckGoodPackageEnvU2Text \
      hostModuleCheckBadPackageEnvIllTypedMultText \
      hostModuleCheckBadPackageEnvIllTypedTypesText \
      hostModuleCheckBadPackageEnvIllTypedProgramText \
      hostModuleCheckBadPackageEnvIllTypedGraphText \
      hostModuleCheckBadPackageEnvIllTypedComposeText \
      hostModuleCheckBadPackageEnvIllTypedErasureText \
      hostModuleCheckBadPackageEnvIllTypedExtractText \
      hostModuleCheckBadPackageEnvIllTypedEmitPlanText \
      hostModuleCheckBadPackageEnvIllTypedEmitApplyText \
      hostModuleCheckBadPackageEnvIllTypedEmitBodyText \
      hostModuleCheckBadPackageEnvIllTypedKernelMultText \
      hostModuleCheckBadPackageEnvIllTypedKernelLinearText \
      hostModuleCheckBadPackageEnvIllTypedKernelTypesText \
      hostModuleCheckBadPackageEnvIllTypedKernelProgramText \
      hostModuleCheckBadPackageEnvIllTypedKernelEmitText \
      hostModuleCheckBadPackageEnvIllTypedParityMultText \
      hostModuleCheckBadPackageEnvIllTypedParityMultReadyText \
      hostModuleCheckBadPackageEnvIllTypedParityLinearText \
      hostModuleCheckBadPackageEnvIllTypedParityLinearReadyText \
      hostModuleCheckBadPackageEnvIllTypedParityTypesText \
      hostModuleCheckBadPackageEnvIllTypedParityTypesReadyText \
      hostModuleCheckBadPackageEnvIllTypedParityProgramText \
      hostModuleCheckBadPackageEnvIllTypedParityProgramReadyText \
      hostModuleCheckBadPackageEnvIllTypedParityEmitText \
      hostModuleCheckBadPackageEnvIllTypedParityEmitReadyText \
      hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldText \
      hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyText \
      hostModuleCheckBadPackageEnvIllTypedProductOutKernelText \
      hostModuleCheckBadPackageEnvIllTypedCompilePathText \
      hostModuleCheckBadPackageEnvIllTypedJoinMapText \
      hostModuleCheckBadPackageEnvIllTypedSelfHostText \
      hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixText \
      hostModuleCheckBadPackageEnvUnresolvedImportText \
      hostModuleCheckBadPackageEnvNotReadyText \
      HostModuleCheckPackageElab \
      HostModuleCheckPackageEnv \
      HostModuleCheckPackageEnvFixtures \
      HostModuleCheckPackageEnvFixturesU2 \
      HostModuleCheckPackageEnvFixturesS5 \
      HostModuleCheckPackageEnvEvidence \
      hostModuleCheckBadMissingAxiom \
      hostModuleCheckBadMissingStructure \
      hostModuleCheckBadMissingProgramStructure \
      hostModuleCheckBadMissingErasedStructure \
      hostModuleCheckBadMissingKernelReady \
      hostModuleCheckBadMissingPlanStructure \
      hostModuleCheckBadMissingParityReady \
      MISSING-DECL \
      MISSING-NAMESPACE \
      EMPTY-MODULE
    do
      if ! grep_hmc_family "$tok"; then
        echo "error: missing $tok in HostModuleCheck family (tip/Seeds/LoadOk/Driver/Surface/MultTerm/Checkers/Accepts/Fixtures/RequiredDecls*/FixtureTexts*)" >&2
        exit 1
      fi
    done
    if ! grep_hmc_family 'Host library seed expand continue'; then
      echo "error: missing expand Name Host library seed expand continue in HostModuleCheck family" >&2
      exit 1
    fi
    if ! grep_hmc_family 'FOUNDATION-KIND-SURFACE'; then
      echo "error: missing deepen bar FOUNDATION-KIND-SURFACE in HostModuleCheck family" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckWithoutLakeFinished[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod_seeds"; then
      echo "error: hostModuleCheckWithoutLakeFinished must be true in $mod_seeds" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckHostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod_seeds"; then
      echo "error: host residual honesty must remain true in $mod_seeds" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod_seeds"; then
      echo "error: hostModuleCheckHostFreeClaimed must stay false in $mod_seeds" >&2
      exit 1
    fi
    for seed in "$mult_mod" "$mult_thm" "$linear_mod" "$linear_thm" "$types_mod" "$types_thm" "$ir_prog" "$ir_prog_thm" "$ir_graph" "$ir_graph_thm" "$host_compose" "$host_compose_thm"; do
      if [[ ! -f "$seed" ]]; then
        echo "error: missing seed $seed" >&2
        exit 1
      fi
    done
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt host module check binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-foundation-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-host-module-check)" >&2
      echo "  then re-run: just host-module-check-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt real Mult+Linear+Types+Program+Graph module check (no lake)"
    "$prebuilt" "$root"
    # Dual evidence after walk: seed files still on disk with key surface.
    for seed in "$mult_mod" "$mult_thm" "$linear_mod" "$linear_thm" "$types_mod" "$types_thm" "$ir_prog" "$ir_prog_thm" "$ir_graph" "$ir_graph_thm" "$host_compose" "$host_compose_thm"; do
      if [[ ! -f "$seed" ]]; then
        echo "error: missing seed after module check: $seed" >&2
        exit 1
      fi
    done
    if ! grep -qE '^inductive Mult' "$mult_mod"; then
      echo "error: Mult.lean must still declare inductive Mult" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.Mult' "$mult_thm"; then
      echo "error: MultTheorems.lean must still import SystemsLean.Mult" >&2
      exit 1
    fi
    if ! grep -qF 'def shareNat' "$linear_mod"; then
      echo "error: Linear.lean must still declare def shareNat" >&2
      exit 1
    fi
    if ! grep -qE '^inductive NodeKind' "$types_mod"; then
      echo "error: Types.lean must still declare inductive NodeKind" >&2
      exit 1
    fi
    if ! grep -qF 'def programCap' "$ir_prog"; then
      echo "error: IrProgram.lean must still declare def programCap" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrProgram' "$ir_prog_thm"; then
      echo "error: IrProgramTheorems.lean must still import SystemsLean.IrProgram" >&2
      exit 1
    fi
    if ! grep -qF 'def edgeMax' "$ir_graph"; then
      echo "error: IrGraph.lean must still declare def edgeMax" >&2
      exit 1
    fi
    if ! grep -qF 'def mint' "$host_compose"; then
      echo "error: HostCompose.lean must still declare def mint" >&2
      exit 1
    fi
    if ! grep -qF 'def mint' "$host_compose"; then
      echo "error: HostCompose.lean must declare def mint" >&2
      exit 1
    fi
    if ! grep -qF 'namespace SystemsLean.HostCompose' "$host_compose"; then
      echo "error: HostCompose.lean must declare namespace SystemsLean.HostCompose" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrGraph' "$ir_graph_thm"; then
      echo "error: IrGraphTheorems.lean must still import SystemsLean.IrGraph" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.IrGraph' "$host_compose"; then
      echo "error: HostCompose.lean must import SystemsLean.IrGraph (real edge)" >&2
      exit 1
    fi
    if ! grep -qF 'import SystemsLean.HostCompose' "$host_compose_thm"; then
      echo "error: HostComposeTheorems.lean must import SystemsLean.HostCompose (real edge)" >&2
      exit 1
    fi
    echo "host-module-check-without-lake: GREEN (real Mult+Linear+Types+Program+Graph PARTIAL-STRUCTURAL; hostModuleCheckWithoutLakeFinished; prebuilt; no lake hot path; host residual remains; not PROVABLY/llvm)"

# A3 measured without-Lake package roots load (prebuilt).
# Bootstrap once: (cd src/systems && lake build slake-host-package-roots).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Greppable: host-package-roots-without-lake, HOST-PACKAGE-ROOTS-WITHOUT-LAKE,
# hostPackageRootsWithoutLakeFinished, hostPackageRootsWithoutLakeReady,
# justRecipeWithoutLake, prebuiltHostPackageRootsRel,
# hostPackageRootsWithoutLakeKeepsHostLake.
host-package-roots-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    prebuilt="$systems_dir/.lake/build/bin/slake-host-package-roots"
    mod="$lean_dir/HostPackageRoots.lean"
    echo "== host-package-roots-without-lake (A3; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  input: lakefile dual-pin + SystemsLean/*.lean walk"
    echo "  output: hostPackageRootsWithoutLakeFinished / Ready; host residual remains"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    for tok in \
      hostPackageRootsWithoutLakeFinished \
      hostPackageRootsWithoutLakeReady \
      justRecipeWithoutLake \
      host-package-roots-without-lake \
      prebuiltHostPackageRootsRel \
      hostPackageRootsWithoutLakeKeepsHostLake \
      hostPackageRootsHostElaboratorResidualRemains \
      HOST-PACKAGE-ROOTS-WITHOUT-LAKE \
      loadPackageRoots \
      hostPackageRootsLoadOk \
      hostPackageRootsPackageName \
      hostPackageRootsLibraryRoot \
      hostPackageRootsModuleCountFloor
    do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def hostPackageRootsWithoutLakeFinished[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageRootsWithoutLakeFinished must be true in $mod" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageRootsHostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: host residual honesty must remain true in $mod" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageRootsHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod"; then
      echo "error: hostPackageRootsHostFreeClaimed must stay false" >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/lakefile.lean" ]]; then
      echo "error: missing package config $systems_dir/lakefile.lean" >&2
      exit 1
    fi
    if [[ ! -d "$lean_dir" ]]; then
      echo "error: missing library dir $lean_dir" >&2
      exit 1
    fi
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt host package roots binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-foundation-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-host-package-roots)" >&2
      echo "  then re-run: just host-package-roots-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt package roots load (no lake)"
    "$prebuilt" "$root"
    # Dual evidence after walk: Mult.lean seed still on disk.
    if [[ ! -f "$lean_dir/Mult.lean" ]]; then
      echo "error: missing seed Mult.lean after package roots load" >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/SystemsLean.lean" ]]; then
      echo "error: missing package root SystemsLean.lean after package roots load" >&2
      exit 1
    fi
    echo "host-package-roots-without-lake: GREEN (package roots + module list; hostPackageRootsWithoutLakeFinished; prebuilt; no lake hot path; host residual remains; not PROVABLY/llvm)"

# CompCert seal: shared fail-closed resolve for ccomp (plan-compcert-product-seal).
# Prints executable path on stdout only; diagnostics on stderr.
# Resolve order:
#   1. COMPCERT_CCOMP=/path/to/ccomp (operator override)
#   2. ccomp on PATH
#   3. flake-locked nixpkgs.compcert (unfree; needs nix + NIXPKGS_ALLOW_UNFREE=1)
# Greppable: ccomp-resolve, COMPCERT-NIX-RESOLVE, COMPCERT_CCOMP.
# Not PROVABLY. Used by ccomp-smoke, freestanding-under-ccomp, mult-package-under-ccomp,
# product-compcert-matrix.
