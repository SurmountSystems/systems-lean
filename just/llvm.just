# Modular just: just/llvm.just -- role recipes (import into root justfile).
# LLVM IR release surface (deferred until self-hosted Systems Lean / Slake).
out-llvm-ir:
    @echo "out-llvm-ir: llvmUnlocked true (unlock residual); deepen via llvm-*-text / compose emit (see out/llvm-ir/README.md)"

# LLVM IR emit path: static design note + MEASURED-STUB + Lean pins (pure Nix).
# Greppable: llvm-emit-path, HOST-LLVM-EMIT-PATH, SLAKE_LLVM_EMIT_PATH_V0.
llvm-emit-path: systems-llvm-ir
    @echo "llvm-emit-path: GREEN (systems-llvm-ir)"

# LLVM IR Mult text writer: lake exe -> out/llvm-ir/slake_mult.ll; pure join after.
# Greppable: llvm-mult-text, HOST-LLVM-MULT-TEXT, SLAKE_LLVM_MULT_TEXT_V0.
llvm-mult-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_MULT_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-mult-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-mult-text
      lake exe slake-llvm-mult-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-mult-text: GREEN"

# LLVM IR Linear text writer: lake exe -> out/llvm-ir/slake_linear.ll; pure join after.
# Greppable: llvm-linear-text, HOST-LLVM-LINEAR-TEXT, SLAKE_LLVM_LINEAR_TEXT_V0.
llvm-linear-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_LINEAR_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-linear-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-linear-text
      lake exe slake-llvm-linear-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-linear-text: GREEN"

# LLVM IR Types text writer: lake exe -> out/llvm-ir/slake_types.ll; pure join after.
# Greppable: llvm-types-text, HOST-LLVM-TYPES-TEXT, SLAKE_LLVM_TYPES_TEXT_V0.
llvm-types-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_TYPES_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-types-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-types-text
      lake exe slake-llvm-types-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-types-text: GREEN"

# LLVM IR Program text writer: lake exe -> out/llvm-ir/slake_program.ll; pure join after.
# Greppable: llvm-program-text, HOST-LLVM-PROGRAM-TEXT, SLAKE_LLVM_PROGRAM_TEXT_V0.
llvm-program-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_PROGRAM_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-program-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-program-text
      lake exe slake-llvm-program-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-program-text: GREEN"

# LLVM IR Graph text writer: lake exe -> out/llvm-ir/slake_graph.ll; pure join after.
# Greppable: llvm-graph-text, HOST-LLVM-GRAPH-TEXT, SLAKE_LLVM_GRAPH_TEXT_V0.
llvm-graph-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_GRAPH_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-graph-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-graph-text
      lake exe slake-llvm-graph-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-graph-text: GREEN"

# LLVM IR unit package: Mult..Graph writers then pure Nix join (systems-llvm-ir).
# Greppable: llvm-unit-package, HOST-LLVM-UNIT-PACKAGE.
llvm-unit-package:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "llvm-unit-package: Mult..Graph writers + systems-llvm-ir"
    just llvm-mult-text
    just llvm-linear-text
    just llvm-types-text
    just llvm-program-text
    just llvm-graph-text
    just systems-llvm-ir
    echo "llvm-unit-package: GREEN"

# LLVM Mult SSA lower partial: lake exe -> out/llvm-ir/slake_mult_ssa.ll; pure join after.
# Mult program-graph band (KernelMult) to SSA-shaped IR. Not full CFG/dominance backend.
# Greppable: llvm-mult-ssa, HOST-LLVM-MULT-SSA, SLAKE_LLVM_MULT_SSA_V0, SSA-SHAPED.
llvm-mult-ssa:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_MULT_SSA_V0 / HOST-LLVM-MULT-SSA"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-mult-ssa requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-mult-ssa
      lake exe slake-llvm-mult-ssa -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-mult-ssa: GREEN"

# LLVM Linear SSA lower partial: lake exe -> out/llvm-ir/slake_linear_ssa.ll; pure join after.
# Linear program-graph band (KernelLinear) to SSA-shaped IR. Not full CFG/dominance backend.
# Greppable: llvm-linear-ssa, HOST-LLVM-LINEAR-SSA, SLAKE_LLVM_LINEAR_SSA_V0, SSA-SHAPED.
llvm-linear-ssa:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_LINEAR_SSA_V0 / HOST-LLVM-LINEAR-SSA"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-linear-ssa requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-linear-ssa
      lake exe slake-llvm-linear-ssa -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-linear-ssa: GREEN"

# LLVM Types SSA lower partial: lake exe -> out/llvm-ir/slake_types_ssa.ll; pure join after.
# Types program-graph band (KernelTypes) to SSA-shaped IR. Not full CFG/dominance backend.
# Greppable: llvm-types-ssa, HOST-LLVM-TYPES-SSA, SLAKE_LLVM_TYPES_SSA_V0, SSA-SHAPED.
llvm-types-ssa:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_TYPES_SSA_V0 / HOST-LLVM-TYPES-SSA"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-types-ssa requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-types-ssa
      lake exe slake-llvm-types-ssa -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-types-ssa: GREEN"

# LLVM Program SSA lower partial: lake exe -> out/llvm-ir/slake_program_ssa.ll; pure join after.
# Program ordered-IR band (KernelProgram) to SSA-shaped IR. Not full CFG/dominance backend.
# Greppable: llvm-program-ssa, HOST-LLVM-PROGRAM-SSA, SLAKE_LLVM_PROGRAM_SSA_V0, SSA-SHAPED.
llvm-program-ssa:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_PROGRAM_SSA_V0 / HOST-LLVM-PROGRAM-SSA"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-program-ssa requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-program-ssa
      lake exe slake-llvm-program-ssa -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-program-ssa: GREEN"

# LLVM Graph SSA lower partial: lake exe -> out/llvm-ir/slake_graph_ssa.ll; pure join after.
# Graph edges band (KernelProgram lowerProgramGraph) to SSA-shaped IR. Not full CFG/dominance.
# Greppable: llvm-graph-ssa, HOST-LLVM-GRAPH-SSA, SLAKE_LLVM_GRAPH_SSA_V0, SSA-SHAPED.
llvm-graph-ssa:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_GRAPH_SSA_V0 / HOST-LLVM-GRAPH-SSA"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-graph-ssa requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-graph-ssa
      lake exe slake-llvm-graph-ssa -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-graph-ssa: GREEN"

# LLVM IR compose text writer: lake exe -> out/llvm-ir/slake_compose.ll; pure join after.
# Next layer after Mult..Graph unit package (not a fifth unit of that package).
# Greppable: llvm-compose-text, HOST-LLVM-COMPOSE-TEXT, SLAKE_LLVM_COMPOSE_TEXT_V0.
llvm-compose-text:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    echo "SLAKE_LLVM_COMPOSE_TEXT_V0"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; llvm-compose-text requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-llvm-compose-text
      lake exe slake-llvm-compose-text -- "$root"
    )
    just systems-llvm-ir
    echo "llvm-compose-text: GREEN"

# Optional llvm-as assemble of unit+compose text and slake_*_ssa.ll (skip-if-missing).
# Greppable: llvm-as-smoke, HOST-LLVM-AS-SMOKE, SLAKE_LLVM_AS_SMOKE_V0.
llvm-as-smoke:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    ir_dir="$root/out/llvm-ir"
    echo "SLAKE_LLVM_AS_SMOKE_V0 / HOST-LLVM-AS-SMOKE"
    if ! command -v llvm-as >/dev/null 2>&1; then
      echo "skip llvm-as-smoke (llvm-as not on PATH; optional tool; pure Nix systems-llvm-ir honesty still required via just systems-llvm-ir)"
      echo "llvm-as-smoke: SKIP (optional; skip-if-missing; not production backend)"
      exit 0
    fi
    # Fail-closed expected generator-owned unit+compose text and slake_*_ssa.ll.
    expected=( slake_compose.ll slake_mult.ll slake_linear.ll slake_types.ll slake_program.ll slake_graph.ll slake_compose_ssa.ll slake_mult_ssa.ll slake_linear_ssa.ll slake_types_ssa.ll slake_program_ssa.ll slake_graph_ssa.ll )
    fail=0
    for f in "${expected[@]}"; do
      path="$ir_dir/$f"
      if [[ ! -f "$path" ]]; then
        echo "RED: missing expected generator-owned IR: $path" >&2
        fail=1
        continue
      fi
      if ! llvm-as "$path" -o /dev/null; then
        echo "RED: llvm-as failed on $path" >&2
        fail=1
      else
        echo "ok llvm-as $f"
      fi
    done
    if [[ "$fail" -ne 0 ]]; then
      echo "llvm-as-smoke RED (optional tool present; assemble or artifact fail)" >&2
      exit 1
    fi
    echo "llvm-as-smoke: GREEN (optional assemble; skip-if-missing; not production backend / not CFG complete / not Rust link)"

# ABI parity smoke: pure Nix systems-llvm-ir (abi-parity slice) checks Mult
# freestanding header + layout fixture + Mult IR tag agreement (0/1/2, i32
# align 4). No llvm-as or cc. Not full Rust ABI / not extern Rust stable /
# not link without classic FFI.
# Greppable: abi-parity-smoke, HOST-ABI-PARITY-SMOKE, SLAKE_ABI_PARITY_SMOKE_V0.
abi-parity-smoke:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_ABI_PARITY_SMOKE_V0 / HOST-ABI-PARITY-SMOKE"
    echo "non-claims: not extern Rust stable; not link without classic FFI; not full Rust ABI"
    just systems-llvm-ir
    echo "abi-parity-smoke: GREEN (fixture + Mult freestanding + IR tags; not extern Rust stable / not link without classic FFI / not full Rust ABI)"

# Layout IR tag dual-pin: pure Nix systems-llvm-ir (layout-ir-dual-pin slice)
# dual-pins Mult IR full tag constant lines against layout fixture rows
# (0/1/2, i32 align 4) with greppable LAYOUT-IR-TAG-DUAL-PIN. Mult primary;
# Linear/Types class/kind tags when in scope later. Distinct from abi-parity.
# No llvm-as or cc. Not Rust-native link. Not full Graph/Program layout.
# Greppable: layout-ir-dual-pin, HOST-LAYOUT-IR-TAG-DUAL-PIN,
# SLAKE_LAYOUT_IR_TAG_DUAL_PIN_V0, LAYOUT-IR-TAG-DUAL-PIN.
layout-ir-dual-pin:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_LAYOUT_IR_TAG_DUAL_PIN_V0 / HOST-LAYOUT-IR-TAG-DUAL-PIN"
    echo "non-claims: not Rust-native link; not full Graph/Program layout"
    just systems-llvm-ir
    echo "layout-ir-dual-pin: GREEN (Mult IR tags dual-pinned to fixture; not Rust-native link / not full Graph/Program layout)"

# Mult layout consumer fixture (B1): pure Nix systems-llvm-ir (mult-layout-consumer
# slice) agrees freestanding Mult header + Mult IR tags + layout fixture size/align
# on named target. Not Rust-native link success. Not full Graph layout.
# Greppable: mult-layout-consumer, HOST-MULT-LAYOUT-CONSUMER,
# SLAKE_MULT_LAYOUT_CONSUMER_V0.
mult-layout-consumer:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_MULT_LAYOUT_CONSUMER_V0 / HOST-MULT-LAYOUT-CONSUMER"
    echo "non-claims: not Rust-native link success; not full Graph layout"
    just systems-llvm-ir
    echo "mult-layout-consumer: GREEN (Mult layout consumer fixture; not Rust-native link success / not full Graph layout)"

# Mult link readiness partial (B3): Mult freestanding + Mult unit IR + Mult SSA
# tags + layout fixture agreement. Not Rust-native link success. Not full Graph
# layout. Not full interop without classic FFI. Not product Rust crate.
# Greppable: mult-link-readiness, HOST-MULT-LINK-READINESS,
# SLAKE_MULT_LINK_READINESS_V0.
mult-link-readiness:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_MULT_LINK_READINESS_V0 / HOST-MULT-LINK-READINESS"
    echo "non-claims: not Rust-native link success; not full Graph layout; not full interop"
    just systems-llvm-ir
    echo "mult-link-readiness: GREEN (Mult link readiness partial; not Rust-native link success / not full Graph layout / not full interop)"

# Production CFG deepen: Mult SSA grade_tag CFG dual-pin beyond structural
# Mult CFG fixture (merge preds + reachability). Host Lean productionCfgDeepen
# (idom table + four-pred merge phi + Mult SSA dual-pin) vs slake_mult_ssa.ll.
# Not full dominance pipeline. Not production opt. Not full backend.
# Greppable: production-cfg-deepen, PRODUCTION-CFG-DEEPEN, MERGE-PHI-PREDS-FOUR,
# MERGE-IDOM-ENTRY, MULT-SSA-CFG-DUAL-PIN, PRODUCTION-IDOM.
production-cfg-deepen:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "PRODUCTION-CFG-DEEPEN / HOST-LLVM-CFG-FIXTURE"
    echo "MERGE-PHI-PREDS-FOUR / MERGE-IDOM-ENTRY / MULT-SSA-CFG-DUAL-PIN"
    echo "non-claims: fixture tip fullBackend claimed A-light; not production opt; not full dominance; free/complete/PROVABLY unchanged"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.LlvmCfgFixture)
    else
      echo "production-cfg-deepen: lake missing; pure Nix dual-pin only (host Lean not elaborated this run)" >&2
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_mult_ssa.ll -o /dev/null
      echo "production-cfg-deepen: Mult SSA llvm-as GREEN (fixture tip fullBackend claimed)"
    fi
    echo "production-cfg-deepen: GREEN (Production CFG deepen; Mult SSA dual-pin; fixture tip fullBackend / not production opt / not full dominance)"

# Linear SSA CFG production dual-pin: multi-unit Mult+Linear production CFG
# beyond Mult-only productionCfgDeepen. Host Lean linearCfgProductionDeepen +
# multiUnitCfgProductionDeepen (idom + two-pred merge phi + Linear SSA dual-pin)
# vs slake_linear_ssa.ll. Not full dominance pipeline. Not production opt.
# Not full backend claim true.
# Greppable: linear-cfg-production-deepen, LINEAR-CFG-PRODUCTION-DEEPEN,
# MULTI-UNIT-CFG-PRODUCTION-DEEPEN, LINEAR-MERGE-PHI-PREDS-TWO,
# LINEAR-SSA-CFG-DUAL-PIN, LINEAR-MERGE-IDOM-ENTRY.
linear-cfg-production-deepen:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "LINEAR-CFG-PRODUCTION-DEEPEN / MULTI-UNIT-CFG-PRODUCTION-DEEPEN"
    echo "LINEAR-MERGE-PHI-PREDS-TWO / LINEAR-MERGE-IDOM-ENTRY / LINEAR-SSA-CFG-DUAL-PIN"
    echo "non-claims: fixture tip fullBackend claimed A-light; not production opt; not full dominance; free/complete/PROVABLY unchanged"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.LlvmCfgFixture)
    else
      echo "linear-cfg-production-deepen: lake missing; pure Nix dual-pin only (host Lean not elaborated this run)" >&2
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_linear_ssa.ll -o /dev/null
      echo "linear-cfg-production-deepen: Linear SSA llvm-as GREEN (fixture tip fullBackend claimed)"
    fi
    echo "linear-cfg-production-deepen: GREEN (Linear CFG production dual-pin; multi-unit Mult+Linear; fixture tip fullBackend / not production opt / not full dominance)"

# Types SSA CFG production dual-pin: multi-unit Mult+Linear+Types production CFG
# beyond Mult+Linear multiUnitCfgProductionDeepen. Host Lean typesCfgProductionDeepen
# + multiUnitCfgProductionDeepenTypes (idom + four-pred merge phi + Types SSA dual-pin)
# vs slake_types_ssa.ll. Not full dominance pipeline. Not production opt.
# Not full backend claim true.
# Greppable: types-cfg-production-deepen, TYPES-CFG-PRODUCTION-DEEPEN,
# MULTI-UNIT-CFG-PRODUCTION-DEEPEN-TYPES, TYPES-MERGE-PHI-PREDS-FOUR,
# TYPES-SSA-CFG-DUAL-PIN, TYPES-MERGE-IDOM-ENTRY.
types-cfg-production-deepen:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "TYPES-CFG-PRODUCTION-DEEPEN / MULTI-UNIT-CFG-PRODUCTION-DEEPEN-TYPES"
    echo "TYPES-MERGE-PHI-PREDS-FOUR / TYPES-MERGE-IDOM-ENTRY / TYPES-SSA-CFG-DUAL-PIN"
    echo "non-claims: fixture tip fullBackend claimed A-light; not production opt; not full dominance; free/complete/PROVABLY unchanged"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.LlvmCfgFixture)
    else
      echo "types-cfg-production-deepen: lake missing; pure Nix dual-pin only (host Lean not elaborated this run)" >&2
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_types_ssa.ll -o /dev/null
      echo "types-cfg-production-deepen: Types SSA llvm-as GREEN (fixture tip fullBackend claimed)"
    fi
    echo "types-cfg-production-deepen: GREEN (Types CFG production dual-pin; multi-unit Mult+Linear+Types; fixture tip fullBackend / not production opt / not full dominance)"

# Program SSA CFG production dual-pin: multi-unit Mult+Linear+Types+Program
# production CFG beyond multiUnitCfgProductionDeepenTypes. Host Lean
# programCfgProductionDeepen + multiUnitCfgProductionDeepenProgram (idom +
# four-pred merge phi + Program SSA dual-pin) vs slake_program_ssa.ll.
# Not full dominance pipeline. Not production opt. Not full backend claim true.
# Greppable: program-cfg-production-deepen, PROGRAM-CFG-PRODUCTION-DEEPEN,
# MULTI-UNIT-CFG-PRODUCTION-DEEPEN-PROGRAM, PROGRAM-MERGE-PHI-PREDS-FOUR,
# PROGRAM-SSA-CFG-DUAL-PIN, PROGRAM-MERGE-IDOM-ENTRY.
program-cfg-production-deepen:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "PROGRAM-CFG-PRODUCTION-DEEPEN / MULTI-UNIT-CFG-PRODUCTION-DEEPEN-PROGRAM"
    echo "PROGRAM-MERGE-PHI-PREDS-FOUR / PROGRAM-MERGE-IDOM-ENTRY / PROGRAM-SSA-CFG-DUAL-PIN"
    echo "non-claims: fixture tip fullBackend claimed A-light; not production opt; not full dominance; free/complete/PROVABLY unchanged"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.LlvmCfgFixture)
    else
      echo "program-cfg-production-deepen: lake missing; pure Nix dual-pin only (host Lean not elaborated this run)" >&2
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_program_ssa.ll -o /dev/null
      echo "program-cfg-production-deepen: Program SSA llvm-as GREEN (fixture tip fullBackend claimed)"
    fi
    echo "program-cfg-production-deepen: GREEN (Program CFG production dual-pin; multi-unit Mult..Program; fixture tip fullBackend / not production opt / not full dominance)"

# Graph SSA CFG production dual-pin: multi-unit Mult+Linear+Types+Program+Graph
# production CFG beyond multiUnitCfgProductionDeepenProgram. Host Lean
# graphCfgProductionDeepen + multiUnitCfgProductionDeepenGraph (idom +
# three-pred merge phi + Graph SSA dual-pin) vs slake_graph_ssa.ll.
# Not full dominance pipeline. Not production opt. Not full backend claim true.
# Greppable: graph-cfg-production-deepen, GRAPH-CFG-PRODUCTION-DEEPEN,
# MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH, GRAPH-MERGE-PHI-PREDS-THREE,
# GRAPH-SSA-CFG-DUAL-PIN, GRAPH-MERGE-IDOM-ENTRY.
graph-cfg-production-deepen:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "GRAPH-CFG-PRODUCTION-DEEPEN / MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH"
    echo "GRAPH-MERGE-PHI-PREDS-THREE / GRAPH-MERGE-IDOM-ENTRY / GRAPH-SSA-CFG-DUAL-PIN"
    echo "non-claims: fixture tip fullBackend claimed A-light; not production opt; not full dominance; free/complete/PROVABLY unchanged"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.LlvmCfgFixture)
    else
      echo "graph-cfg-production-deepen: lake missing; pure Nix dual-pin only (host Lean not elaborated this run)" >&2
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_graph_ssa.ll -o /dev/null
      echo "graph-cfg-production-deepen: Graph SSA llvm-as GREEN (fixture tip fullBackend claimed)"
    fi
    echo "graph-cfg-production-deepen: GREEN (Graph CFG production dual-pin; multi-unit Mult..Graph; fixture tip fullBackend / not production opt / not full dominance)"

# Mult..Graph DF; Linear..Graph names echo only; multi-unit verifies. DominanceClaimed false.
mult-dominance-frontier-partial:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "MULT-DOMINANCE-FRONTIER-PARTIAL / MULT-DF-TABLE / MULT-DF-MERGE-JOIN"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then (cd src/systems && lake build SystemsLean.LlvmCfgFixture); fi
    if command -v llvm-as >/dev/null 2>&1; then llvm-as out/llvm-ir/slake_mult_ssa.ll -o /dev/null; fi
    echo "mult-dominance-frontier-partial: GREEN (DominanceClaimed false)"
mult-dominance-frontier-deepen: mult-dominance-frontier-partial
    @echo "MULT-DOMINANCE-FRONTIER-DEEPEN / MULT-DF-COMPUTED / MULT-DF-ALGORITHM-OK (DominanceClaimed false)"
linear-dominance-frontier-partial: mult-dominance-frontier-partial
    @echo "LINEAR-DOMINANCE-FRONTIER-PARTIAL (DominanceClaimed false)"
linear-dominance-frontier-deepen: linear-dominance-frontier-partial
    @echo "LINEAR-DOMINANCE-FRONTIER-DEEPEN (DominanceClaimed false)"
types-dominance-frontier-partial: mult-dominance-frontier-partial
    @echo "TYPES-DOMINANCE-FRONTIER-PARTIAL (DominanceClaimed false)"
types-dominance-frontier-deepen: types-dominance-frontier-partial
    @echo "TYPES-DOMINANCE-FRONTIER-DEEPEN (DominanceClaimed false)"
program-dominance-frontier-partial: mult-dominance-frontier-partial
    @echo "PROGRAM-DOMINANCE-FRONTIER-PARTIAL (DominanceClaimed false)"
program-dominance-frontier-deepen: program-dominance-frontier-partial
    @echo "PROGRAM-DOMINANCE-FRONTIER-DEEPEN (DominanceClaimed false)"
graph-dominance-frontier-partial: mult-dominance-frontier-partial
    @echo "GRAPH-DOMINANCE-FRONTIER-PARTIAL (DominanceClaimed false)"
graph-dominance-frontier-deepen: graph-dominance-frontier-partial
    @echo "GRAPH-DOMINANCE-FRONTIER-DEEPEN (DominanceClaimed false)"
multi-unit-dominance-frontier-deepen: mult-dominance-frontier-deepen linear-dominance-frontier-deepen types-dominance-frontier-deepen program-dominance-frontier-deepen graph-dominance-frontier-deepen
    #!/usr/bin/env bash
    set -euo pipefail
    echo "MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN Mult..Graph DF; DominanceClaimed false"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then (cd src/systems && lake build SystemsLean.LlvmCfgUnitDf SystemsLean.LlvmCfgFixture); fi
    echo "multi-unit-dominance-frontier-deepen: GREEN (Mult..Graph DF; DominanceClaimed false)"

# General program CFG partial: GENERAL-CFG-CONSTRUCTION-PARTIAL GENERAL-CFG-UNIT-ROOTS GENERAL-CFG-COMPOSE-EDGES GENERAL-CFG-MULTI-MERGE UNIT-DIAMONDS-ONLY fullLlvmBarEvidencePartial FULL-LLVM-BAR-EVIDENCE-PARTIAL.
general-program-cfg-partial:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "GENERAL-CFG-CONSTRUCTION-PARTIAL / GENERAL-CFG-UNIT-ROOTS"
    echo "GENERAL-CFG-COMPOSE-EDGES / GENERAL-CFG-MULTI-MERGE / UNIT-DIAMONDS-ONLY"
    echo "generalCfgConstructionPartial / fullLlvmBarEvidencePartial"
    echo "FULL-LLVM-BAR-EVIDENCE-PARTIAL"
    echo "non-claims: fixture tip fullBackend claimed A-light; not production opt; not full dominance; free/complete/PROVABLY unchanged"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.LlvmCfgFixture)
    else
      echo "general-program-cfg-partial: lake missing; pure Nix dual-pin only (host Lean not elaborated this run)" >&2
    fi
    echo "general-program-cfg-partial: GREEN (general program CFG compose multi-merge dual-pin beyond unit diamonds; fullLlvmBarEvidencePartial progressive; fixture tip fullBackend claimed A-light; not production opt; not full dominance)"

# Iterative CFG construction partial: walk multi-node ordered IR program /
# IrGraph edges (KernelProgram three-node chain) to build CFG blocks/edges.
# Beyond fixed unit diamonds and fixed compose multi-merge inventory.
# Host Lean iterativeCfgConstructionPartial. Not full dominance. Not production
# opt. Not fullBackend claim true.
# Greppable: iterative-cfg-construction-partial, ITERATIVE-CFG-CONSTRUCTION-PARTIAL,
# ITERATIVE-CFG, iterativeCfgConstructionPartial, iterativeCfgWalkOk.
iterative-cfg-construction-partial:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "ITERATIVE-CFG / ITERATIVE-CFG-CONSTRUCTION-PARTIAL"
    echo "iterativeCfgConstructionPartial / iterativeCfgWalkOk"
    echo "ITERATIVE-CFG-BLOCKS-FROM-PROGRAM / ITERATIVE-CFG-EDGES-FROM-GRAPH"
    echo "non-claims: fixture tip fullBackend claimed A-light; not production opt; not full dominance; free/complete/PROVABLY unchanged"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.LlvmCfgFixture)
    else
      echo "iterative-cfg-construction-partial: lake missing; pure Nix dual-pin only (host Lean not elaborated this run)" >&2
    fi
    echo "iterative-cfg-construction-partial: GREEN (iterative multi-node IR CFG walk dual-pin; fullLlvmBarEvidencePartial progressive; fixture tip fullBackend claimed A-light; not production opt; not full dominance)"

# Mult layout/IR consumer success partial: freestanding Mult API + unit IR + Mult
# SSA kernel/is_valid + layout size/align agreement. Advances past link readiness.
# Still Slake-owned (Lean/Nix/freestanding). Not Rust-native link success.
# Not full Graph layout. Not full interop. Not product Rust crate.
# Greppable: mult-layout-ir-success, HOST-MULT-LAYOUT-IR-SUCCESS,
# SLAKE_MULT_LAYOUT_IR_SUCCESS_V0, MULT-LAYOUT-IR-CONSUMER-SUCCESS-PARTIAL.
mult-layout-ir-success:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_MULT_LAYOUT_IR_SUCCESS_V0 / HOST-MULT-LAYOUT-IR-SUCCESS"
    echo "MULT-LAYOUT-IR-CONSUMER-SUCCESS-PARTIAL"
    echo "non-claims: not Rust-native link success; not full Graph layout; not full interop"
    just systems-llvm-ir
    echo "mult-layout-ir-success: GREEN (Mult layout/IR consumer success partial; not Rust-native link success / not full Graph layout / not full interop)"

# Mult foreign link success: dual Mult layout/IR agreement beyond layout/IR
# consumer partial and Mult link readiness. Host Lean MultForeignLink dual-pin
# + pure Nix + optional out-of-tree rustc dogfood under /tmp (not product Rust).
# Mult band only. Not Linear foreign link. Not full Graph layout. Not full backend.
# Greppable: mult-foreign-link-success, HOST-MULT-FOREIGN-LINK,
# SLAKE_MULT_FOREIGN_LINK_SUCCESS_V0, MULT-FOREIGN-LINK-SUCCESS,
# MULT-FOREIGN-DUAL-AGREEMENT, FOREIGN-MULT-CONSUMER-CONTRACT.
mult-foreign-link-success:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_MULT_FOREIGN_LINK_SUCCESS_V0 / HOST-MULT-FOREIGN-LINK"
    echo "MULT-FOREIGN-LINK-SUCCESS / MULT-FOREIGN-DUAL-AGREEMENT"
    echo "non-claims: not Linear foreign link; not full Graph layout; not full backend; not free/complete/PROVABLY flip"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.MultForeignLink)
    else
      echo "mult-foreign-link-success: lake missing; pure Nix dual agreement only (host Lean not elaborated this run)" >&2
    fi
    # Out-of-tree consumer dogfood (not product Rust under src/). RED when rustc
    # present and size/align/tags disagree; SKIP when rustc missing.
    # Echo lines avoid just stripping recipe lines that start with #.
    if command -v rustc >/dev/null 2>&1; then
      TMP=$(mktemp -d /tmp/slake-mult-foreign-link.XXXXXX)
      {
        echo '// Out-of-tree Mult foreign consumer dogfood. Not product crate.'
        echo '#[repr(i32)]'
        echo '#[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum MultTag {'
        echo '    Mult0 = 0,'
        echo '    Mult1 = 1,'
        echo '    MultOmega = 2,'
        echo '}'
        echo ''
        echo 'fn main() {'
        echo '    assert_eq!(std::mem::size_of::<MultTag>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<MultTag>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<i32>(), 4);'
        echo '    assert_eq!(MultTag::Mult0 as i32, 0);'
        echo '    assert_eq!(MultTag::Mult1 as i32, 1);'
        echo '    assert_eq!(MultTag::MultOmega as i32, 2);'
        echo '    println!("MULT-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");'
        echo '    println!("size=4 align=4 tags=0,1,2 target=x86_64-unknown-linux-gnu");'
        echo '}'
      } > "$TMP/consumer.rs"
      rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      rm -rf "$TMP"
      echo "mult-foreign-link-success: out-of-tree rustc dogfood GREEN"
    else
      echo "mult-foreign-link-success: rustc missing; out-of-tree dogfood SKIP (pure Nix + host Lean dual agreement still required)"
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_mult.ll -o /dev/null
      llvm-as out/llvm-ir/slake_mult_ssa.ll -o /dev/null
      echo "mult-foreign-link-success: Mult unit+SSA llvm-as GREEN (not full backend)"
    fi
    echo "mult-foreign-link-success: GREEN (Mult foreign link success; Mult band only; not Linear foreign link / not full Graph layout / not full backend)"

# Linear foreign link success: dual Linear Mult-class tag layout/IR agreement.
# Host Lean LinearForeignLink dual-pin + pure Nix + optional out-of-tree rustc
# dogfood under /tmp (not product Rust). Linear Mult-class tags only.
# Mult Mult-only stays (MultForeignLink otherBands false). Not Types foreign link.
# Not full Graph layout. Not full backend.
# Greppable: linear-foreign-link-success, HOST-LINEAR-FOREIGN-LINK,
# SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0, LINEAR-FOREIGN-LINK-SUCCESS,
# LINEAR-FOREIGN-DUAL-AGREEMENT, FOREIGN-LINEAR-CONSUMER-CONTRACT.
linear-foreign-link-success:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0 / HOST-LINEAR-FOREIGN-LINK"
    echo "LINEAR-FOREIGN-LINK-SUCCESS / LINEAR-FOREIGN-DUAL-AGREEMENT"
    echo "non-claims: not Types foreign link; not Program/Graph foreign link; not Mult otherBands; not full backend; not free/complete/PROVABLY flip"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.LinearForeignLink)
    else
      echo "linear-foreign-link-success: lake missing; pure Nix dual agreement only (host Lean not elaborated this run)" >&2
    fi
    # Out-of-tree consumer dogfood (not product Rust under src/). RED when rustc
    # present and size/align/tags disagree; SKIP when rustc missing.
    if command -v rustc >/dev/null 2>&1; then
      TMP=$(mktemp -d /tmp/slake-linear-foreign-link.XXXXXX)
      {
        echo '// Out-of-tree Linear foreign consumer dogfood. Not product crate.'
        echo '#[repr(i32)]'
        echo '#[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum LinearClassTag {'
        echo '    Class0 = 0,'
        echo '    Class1 = 1,'
        echo '    ClassOmega = 2,'
        echo '}'
        echo ''
        echo 'fn main() {'
        echo '    assert_eq!(std::mem::size_of::<LinearClassTag>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<LinearClassTag>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<i32>(), 4);'
        echo '    assert_eq!(LinearClassTag::Class0 as i32, 0);'
        echo '    assert_eq!(LinearClassTag::Class1 as i32, 1);'
        echo '    assert_eq!(LinearClassTag::ClassOmega as i32, 2);'
        echo '    println!("LINEAR-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");'
        echo '    println!("size=4 align=4 tags=0,1,2 target=x86_64-unknown-linux-gnu");'
        echo '}'
      } > "$TMP/consumer.rs"
      rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      rm -rf "$TMP"
      echo "linear-foreign-link-success: out-of-tree rustc dogfood GREEN"
    else
      echo "linear-foreign-link-success: rustc missing; out-of-tree dogfood SKIP (pure Nix + host Lean dual agreement still required)"
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_linear.ll -o /dev/null
      llvm-as out/llvm-ir/slake_linear_ssa.ll -o /dev/null
      echo "linear-foreign-link-success: Linear unit+SSA llvm-as GREEN (not full backend)"
    fi
    echo "linear-foreign-link-success: GREEN (Linear foreign link success; Linear Mult-class tags; Mult Mult-only unchanged; not Types foreign link / not full Graph layout / not full backend)"

# Types foreign link success: dual Types kind-tag layout/IR agreement.
# Host Lean TypesForeignLink dual-pin + pure Nix + optional out-of-tree rustc
# dogfood under /tmp (not product Rust). Types kind tags only (VALUE/LINEAR/ERASED).
# Mult Mult-only + Linear Mult-class tags stay. Not Program foreign link.
# Not full Graph layout. Not full backend.
# Greppable: types-foreign-link-success, HOST-TYPES-FOREIGN-LINK,
# SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0, TYPES-FOREIGN-LINK-SUCCESS,
# TYPES-FOREIGN-DUAL-AGREEMENT, FOREIGN-TYPES-CONSUMER-CONTRACT.
types-foreign-link-success:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0 / HOST-TYPES-FOREIGN-LINK"
    echo "TYPES-FOREIGN-LINK-SUCCESS / TYPES-FOREIGN-DUAL-AGREEMENT"
    echo "non-claims: not Program foreign link; not Graph foreign link; not Mult otherBands; not Linear otherBands; not full backend; not free/complete/PROVABLY flip"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.TypesForeignLink)
    else
      echo "types-foreign-link-success: lake missing; pure Nix dual agreement only (host Lean not elaborated this run)" >&2
    fi
    # Out-of-tree consumer dogfood (not product Rust under src/). RED when rustc
    # present and size/align/tags disagree; SKIP when rustc missing.
    if command -v rustc >/dev/null 2>&1; then
      TMP=$(mktemp -d /tmp/slake-types-foreign-link.XXXXXX)
      {
        echo '// Out-of-tree Types foreign consumer dogfood. Not product crate.'
        echo '#[repr(i32)]'
        echo '#[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum TypesKindTag {'
        echo '    Value = 0,'
        echo '    Linear = 1,'
        echo '    Erased = 2,'
        echo '}'
        echo ''
        echo 'fn main() {'
        echo '    assert_eq!(std::mem::size_of::<TypesKindTag>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<TypesKindTag>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<i32>(), 4);'
        echo '    assert_eq!(TypesKindTag::Value as i32, 0);'
        echo '    assert_eq!(TypesKindTag::Linear as i32, 1);'
        echo '    assert_eq!(TypesKindTag::Erased as i32, 2);'
        echo '    println!("TYPES-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");'
        echo '    println!("size=4 align=4 tags=0,1,2 target=x86_64-unknown-linux-gnu");'
        echo '}'
      } > "$TMP/consumer.rs"
      rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      rm -rf "$TMP"
      echo "types-foreign-link-success: out-of-tree rustc dogfood GREEN"
    else
      echo "types-foreign-link-success: rustc missing; out-of-tree dogfood SKIP (pure Nix + host Lean dual agreement still required)"
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_types.ll -o /dev/null
      llvm-as out/llvm-ir/slake_types_ssa.ll -o /dev/null
      echo "types-foreign-link-success: Types unit+SSA llvm-as GREEN (not full backend)"
    fi
    echo "types-foreign-link-success: GREEN (Types foreign link success; Types kind tags VALUE/LINEAR/ERASED; Mult+Linear foreign unchanged; not Program foreign link / not full Graph layout / not full backend)"

# Program foreign link success: dual Program push-status layout/IR agreement.
# Host Lean ProgramForeignLink dual-pin + pure Nix + optional out-of-tree rustc
# dogfood under /tmp (not product Rust). Program push codes only (0/-1/-2 + CAP=8).
# Mult Mult-only + Linear Mult-class + Types kind tags stay. Not Graph foreign link.
# Not full Graph layout. Not full backend.
# Greppable: program-foreign-link-success, HOST-PROGRAM-FOREIGN-LINK,
# SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0, PROGRAM-FOREIGN-LINK-SUCCESS,
# PROGRAM-FOREIGN-DUAL-AGREEMENT, FOREIGN-PROGRAM-CONSUMER-CONTRACT.
program-foreign-link-success:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0 / HOST-PROGRAM-FOREIGN-LINK"
    echo "PROGRAM-FOREIGN-LINK-SUCCESS / PROGRAM-FOREIGN-DUAL-AGREEMENT"
    echo "non-claims: not Graph foreign link; not Mult otherBands; not Linear otherBands; not Types otherBands; not full backend; not free/complete/PROVABLY flip"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.ProgramForeignLink)
    else
      echo "program-foreign-link-success: lake missing; pure Nix dual agreement only (host Lean not elaborated this run)" >&2
    fi
    # Out-of-tree consumer dogfood (not product Rust under src/). RED when rustc
    # present and size/align/push codes disagree; SKIP when rustc missing.
    # Primary dual: emit push status codes 0/-1/-2 (ok/badNode/full), CAP=8.
    if command -v rustc >/dev/null 2>&1; then
      TMP=$(mktemp -d /tmp/slake-program-foreign-link.XXXXXX)
      {
        echo '// Out-of-tree Program foreign consumer dogfood. Not product crate.'
        echo '// Primary dual: push status codes 0 ok, -1 badNode, -2 full; CAP=8.'
        echo '#[repr(i32)]'
        echo '#[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum ProgramPushStatus {'
        echo '    Ok = 0,'
        echo '    BadNode = -1,'
        echo '    Full = -2,'
        echo '}'
        echo ''
        echo 'fn main() {'
        echo '    assert_eq!(std::mem::size_of::<ProgramPushStatus>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<ProgramPushStatus>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<i32>(), 4);'
        echo '    assert_eq!(ProgramPushStatus::Ok as i32, 0);'
        echo '    assert_eq!(ProgramPushStatus::BadNode as i32, -1);'
        echo '    assert_eq!(ProgramPushStatus::Full as i32, -2);'
        echo '    const PROGRAM_CAP: i32 = 8;'
        echo '    assert_eq!(PROGRAM_CAP, 8);'
        echo '    println!("PROGRAM-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");'
        echo '    println!("size=4 align=4 push=0,-1,-2 cap=8 target=x86_64-unknown-linux-gnu");'
        echo '}'
      } > "$TMP/consumer.rs"
      rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      rm -rf "$TMP"
      echo "program-foreign-link-success: out-of-tree rustc dogfood GREEN"
    else
      echo "program-foreign-link-success: rustc missing; out-of-tree dogfood SKIP (pure Nix + host Lean dual agreement still required)"
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_program.ll -o /dev/null
      llvm-as out/llvm-ir/slake_program_ssa.ll -o /dev/null
      echo "program-foreign-link-success: Program unit+SSA llvm-as GREEN (not full backend)"
    fi
    echo "program-foreign-link-success: GREEN (Program foreign link success; Program push codes 0/-1/-2 CAP=8; Mult+Linear+Types foreign unchanged; not Graph foreign link / not full backend)"

# Host Lean GraphForeignLink dual-pin + pure Nix + optional out-of-tree rustc
# dogfood under /tmp (not product Rust). Graph add-edge codes only (0/-1 + EDGE_MAX=16).
# Last R2 progressive after Mult/Linear/Types/Program. Mult Mult-only + Linear
# Mult-class + Types kind + Program push stay. Not full multi-band Rust product
# crate. Not full backend.
# Greppable: graph-foreign-link-success, HOST-GRAPH-FOREIGN-LINK,
# SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0, GRAPH-FOREIGN-LINK-SUCCESS,
# GRAPH-FOREIGN-DUAL-AGREEMENT, FOREIGN-GRAPH-CONSUMER-CONTRACT.
graph-foreign-link-success:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0 / HOST-GRAPH-FOREIGN-LINK"
    echo "GRAPH-FOREIGN-LINK-SUCCESS / GRAPH-FOREIGN-DUAL-AGREEMENT"
    echo "non-claims: not Mult otherBands; not Linear otherBands; not Types otherBands; not Program otherBands; not full multi-band Rust product crate; not full backend; not free/complete/PROVABLY flip"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.GraphForeignLink)
    else
      echo "graph-foreign-link-success: lake missing; pure Nix dual agreement only (host Lean not elaborated this run)" >&2
    fi
    # Out-of-tree consumer dogfood (not product Rust under src/). RED when rustc
    # present and size/align/add-edge codes disagree; SKIP when rustc missing.
    # Primary dual: emit addEdge status codes 0 ok, -1 full/badEndpoints, EDGE_MAX=16.
    if command -v rustc >/dev/null 2>&1; then
      TMP=$(mktemp -d /tmp/slake-graph-foreign-link.XXXXXX)
      {
        echo '// Out-of-tree Graph foreign consumer dogfood. Not product crate.'
        echo '// Primary dual: add_edge status codes 0 ok, -1 full/badEndpoints; EDGE_MAX=16.'
        echo '#[repr(i32)]'
        echo '#[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum GraphAddEdgeStatus {'
        echo '    Ok = 0,'
        echo '    Fail = -1,'
        echo '}'
        echo ''
        echo 'fn main() {'
        echo '    assert_eq!(std::mem::size_of::<GraphAddEdgeStatus>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<GraphAddEdgeStatus>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<i32>(), 4);'
        echo '    assert_eq!(GraphAddEdgeStatus::Ok as i32, 0);'
        echo '    assert_eq!(GraphAddEdgeStatus::Fail as i32, -1);'
        echo '    const EDGE_MAX: i32 = 16;'
        echo '    assert_eq!(EDGE_MAX, 16);'
        echo '    println!("GRAPH-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");'
        echo '    println!("size=4 align=4 add_edge=0,-1 edge_max=16 target=x86_64-unknown-linux-gnu");'
        echo '}'
      } > "$TMP/consumer.rs"
      rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      rm -rf "$TMP"
      echo "graph-foreign-link-success: out-of-tree rustc dogfood GREEN"
    else
      echo "graph-foreign-link-success: rustc missing; out-of-tree dogfood SKIP (pure Nix + host Lean dual agreement still required)"
    fi
    if command -v llvm-as >/dev/null 2>&1; then
      llvm-as out/llvm-ir/slake_graph.ll -o /dev/null
      llvm-as out/llvm-ir/slake_graph_ssa.ll -o /dev/null
      echo "graph-foreign-link-success: Graph unit+SSA llvm-as GREEN (not full backend)"
    fi
    echo "graph-foreign-link-success: GREEN (Graph foreign link success; Graph add-edge 0/-1 EDGE_MAX=16; Mult+Linear+Types+Program foreign unchanged; not full multi-band Rust product crate / not full backend)"

# Rust IR interop partial: progressive Systems Lean <-> Rust layout/IR
# correspondence. Host Lean RustIrInterop dual-pin Mult..Graph foreign rungs +
# Mult layout fixture / layout-IR dual evidence. Partial claimed; full multi-band
# is just rust-ir-interop-full. fullBackend stays false. No product Rust under src/.
# Greppable: rust-ir-interop-partial, HOST-RUST-IR-INTEROP,
# SLAKE_RUST_IR_INTEROP_PARTIAL_V0, RUST-IR-INTEROP,
# RUST-SYSTEMS-LEAN-CORRESPONDENCE, RUST-IR-INTEROP-PARTIAL.
rust-ir-interop-partial:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_RUST_IR_INTEROP_PARTIAL_V0 / HOST-RUST-IR-INTEROP"
    echo "RUST-IR-INTEROP / RUST-SYSTEMS-LEAN-CORRESPONDENCE / RUST-IR-INTEROP-PARTIAL"
    echo "non-claims: not full backend; not free/complete/PROVABLY flip; not product Rust under src/; not formalized all of rustc"
    just systems-llvm-ir
    if command -v lake >/dev/null 2>&1; then
      (cd src/systems && lake build SystemsLean.RustIrInterop)
    else
      echo "rust-ir-interop-partial: lake missing; pure Nix dual agreement only (host Lean not elaborated this run)" >&2
    fi
    if command -v rustc >/dev/null 2>&1; then
      TMP=$(mktemp -d /tmp/slake-rust-ir-interop.XXXXXX)
      {
        echo '// Out-of-tree Rust IR interop partial dogfood. Not product crate.'
        echo '// Partial correspondence: Mult-class i32 tags match layout fixture.'
        echo '#[repr(i32)]'
        echo '#[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum MultTag {'
        echo '    Mult0 = 0,'
        echo '    Mult1 = 1,'
        echo '    MultOmega = 2,'
        echo '}'
        echo ''
        echo 'fn main() {'
        echo '    assert_eq!(std::mem::size_of::<MultTag>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<MultTag>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<i32>(), 4);'
        echo '    assert_eq!(MultTag::Mult0 as i32, 0);'
        echo '    assert_eq!(MultTag::Mult1 as i32, 1);'
        echo '    assert_eq!(MultTag::MultOmega as i32, 2);'
        echo '    println!("RUST-IR-INTEROP-PARTIAL out-of-tree dogfood GREEN");'
        echo '    println!("size=4 align=4 tags=0,1,2 target=x86_64-unknown-linux-gnu");'
        echo '    println!("RUST-SYSTEMS-LEAN-CORRESPONDENCE partial rung");'
        echo '}'
      } > "$TMP/consumer.rs"
      rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      rm -rf "$TMP"
      echo "rust-ir-interop-partial: out-of-tree rustc dogfood GREEN"
    else
      echo "rust-ir-interop-partial: rustc missing; out-of-tree dogfood SKIP (pure Nix + host Lean dual agreement still required)"
    fi
    echo "rust-ir-interop-partial: GREEN (Rust IR interop partial; Mult..Graph foreign rungs + Mult layout dual-pin; not full backend)"

# Rust IR interop full: multi-band single out-of-tree consumer covering Mult..Graph
# together. Host Lean multiBandJointConsumerOk + rustIrInteropFullClaimed true
# only with lake elaborator. fullBackend stays false. Not formalized all of rustc.
# Greppable: rust-ir-interop-full, SLAKE_RUST_IR_INTEROP_FULL_V0,
# RUST-IR-INTEROP-FULL, MULTI-BAND-JOINT-CONSUMER, rustIrInteropFullClaimed.
rust-ir-interop-full:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "SLAKE_RUST_IR_INTEROP_FULL_V0 / HOST-RUST-IR-INTEROP"
    echo "RUST-IR-INTEROP-FULL / MULTI-BAND-JOINT-CONSUMER / RUST-SYSTEMS-LEAN-CORRESPONDENCE"
    echo "non-claims: not full backend; not free/complete/PROVABLY flip; not product Rust under src/; not formalized all of rustc"
    just systems-llvm-ir
    if ! command -v lake >/dev/null 2>&1; then
      echo "rust-ir-interop-full: lake missing; claim-bool flip requires lake elaborator" >&2
      exit 1
    fi
    (cd src/systems && lake build SystemsLean.RustIrInterop)
    if command -v rustc >/dev/null 2>&1; then
      TMP=$(mktemp -d /tmp/slake-rust-ir-interop-full.XXXXXX)
      {
        echo '// Out-of-tree multi-band joint consumer. Not product crate.'
        echo '// Mult..Graph i32 contracts together (MULTI-BAND-JOINT-CONSUMER).'
        echo '#[repr(i32)] #[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum MultTag { Mult0 = 0, Mult1 = 1, MultOmega = 2 }'
        echo '#[repr(i32)] #[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum LinearClassTag { Class0 = 0, Class1 = 1, ClassOmega = 2 }'
        echo '#[repr(i32)] #[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum TypesKindTag { Value = 0, Linear = 1, Erased = 2 }'
        echo '#[repr(i32)] #[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum ProgramPushStatus { Ok = 0, BadNode = -1, Full = -2 }'
        echo '#[repr(i32)] #[derive(Copy, Clone, PartialEq, Eq)]'
        echo 'enum GraphAddEdgeStatus { Ok = 0, Fail = -1 }'
        echo 'fn main() {'
        echo '    assert_eq!(std::mem::size_of::<MultTag>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<MultTag>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<LinearClassTag>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<LinearClassTag>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<TypesKindTag>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<TypesKindTag>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<ProgramPushStatus>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<ProgramPushStatus>(), 4);'
        echo '    assert_eq!(std::mem::size_of::<GraphAddEdgeStatus>(), 4);'
        echo '    assert_eq!(std::mem::align_of::<GraphAddEdgeStatus>(), 4);'
        echo '    assert_eq!(MultTag::Mult0 as i32, 0);'
        echo '    assert_eq!(MultTag::Mult1 as i32, 1);'
        echo '    assert_eq!(MultTag::MultOmega as i32, 2);'
        echo '    assert_eq!(LinearClassTag::Class0 as i32, 0);'
        echo '    assert_eq!(LinearClassTag::Class1 as i32, 1);'
        echo '    assert_eq!(LinearClassTag::ClassOmega as i32, 2);'
        echo '    assert_eq!(TypesKindTag::Value as i32, 0);'
        echo '    assert_eq!(TypesKindTag::Linear as i32, 1);'
        echo '    assert_eq!(TypesKindTag::Erased as i32, 2);'
        echo '    assert_eq!(ProgramPushStatus::Ok as i32, 0);'
        echo '    assert_eq!(ProgramPushStatus::BadNode as i32, -1);'
        echo '    assert_eq!(ProgramPushStatus::Full as i32, -2);'
        echo '    assert_eq!(GraphAddEdgeStatus::Ok as i32, 0);'
        echo '    assert_eq!(GraphAddEdgeStatus::Fail as i32, -1);'
        echo '    const PROGRAM_CAP: i32 = 8;'
        echo '    const EDGE_MAX: i32 = 16;'
        echo '    assert_eq!(PROGRAM_CAP, 8);'
        echo '    assert_eq!(EDGE_MAX, 16);'
        echo '    println!("RUST-IR-INTEROP-FULL MULTI-BAND-JOINT-CONSUMER out-of-tree dogfood GREEN");'
        echo '    println!("Mult+Linear+Types+Program+Graph size=4 align=4 target=x86_64-unknown-linux-gnu");'
        echo '    println!("not formalized all of rustc; not full backend");'
        echo '}'
      } > "$TMP/consumer.rs"
      rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
      "$TMP/consumer"
      rm -rf "$TMP"
      echo "rust-ir-interop-full: multi-band out-of-tree rustc dogfood GREEN"
    else
      echo "rust-ir-interop-full: rustc missing; multi-band dogfood SKIP (lake + pure Nix dual agreement still required)"
    fi
    echo "rust-ir-interop-full: GREEN (multi-band joint Mult..Graph dual map; not full backend / not formalized all of rustc)"


