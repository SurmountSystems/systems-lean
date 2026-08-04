# Modular just: just/freestanding-capable.just -- role recipes (import into root justfile).
# Modular dual-pin honesty (tokens required by pure Nix JustPath scan):
# just read-product-ssot
# just compose-product-plan
# just write-freestanding-hc
# just install-freestanding-c-out
# Partial B14 / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP: freestanding-capable
# gap measure diagnostic (print which steps are Lake-free vs Lake-bound).
# Lake host exe SystemsLean.CapableMain. Not freestanding perform claimed.
# Greppable: freestanding-capable-gap, slake-freestanding-capable-gap,
# productPathFreestandingCapablePartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP,
# SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0
freestanding-capable-gap:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-capable-gap (B14 freestanding-capable step measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/Capable.lean" ]]; then
      echo "error: missing SystemsLean Capable / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable-gap requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-capable-gap
      lake exe slake-freestanding-capable-gap
    )
    echo "freestanding-capable-gap: GREEN (install-only Lake-free partial; READ/COMPOSE/WRITE still Lake; full false)"

# Partial B15 / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT:
# freestanding-capable step contract diagnostic (named API surface + authority
# not FreestandingEmit as product path + blockers; all satisfied false).
# Lake host exe SystemsLean.CapableStepContract.
# Not freestanding perform claimed; not freestanding-capable close.
# Greppable: freestanding-capable-step-contract,
# slake-freestanding-capable-step-contract,
# productPathFreestandingCapableStepContractPartialReady,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
# SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0
freestanding-capable-step-contract:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-capable-step-contract (B15 step contract; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/CapableStepContract.lean" ]]; then
      echo "error: missing SystemsLean CapableStepContract / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable-step-contract requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-capable-step-contract
      lake exe slake-freestanding-capable-step-contract
    )
    echo "freestanding-capable-step-contract: GREEN (authority-not-emit; READ+COMPOSE+WRITE-HC satisfied B16/B17/B18; Full false; not freestanding close)"

# Partial B16: freestanding-capable dual SSOT READ without FreestandingEmit as
# product authority (freestandingCapableReadDualSsot; HEADER/BODY structural).
# Advances FREESTANDING-CAPABLE-STEP-CONTRACT-READ. Distinct from B11
# read-product-ssot (perform substrate). B14 CapableRead true after B26 Lake-free
# freestanding-capable-read-lake-free; this recipe is Lake-hosted diagnostic.
# Not freestanding perform claimed; not free.
# Greppable: freestanding-capable-read, slake-freestanding-capable-read,
# productPathFreestandingCapableReadPartialReady,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ,
# SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0,
# freestandingCapableReadDualSsot, CapableRead
freestanding-capable-read:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    root="$(pwd)"
    echo "== freestanding-capable-read (B16 freestanding-capable dual SSOT READ; no FreestandingEmit) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0"
    echo "  contract: FREESTANDING-CAPABLE-STEP-CONTRACT-READ (ReadSatisfied true)"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    echo "  B14 productPathFreestandingCapableRead true after B26 (see freestanding-capable-read-lake-free)"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/CapableRead.lean" ]]; then
      echo "error: missing SystemsLean CapableRead / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable-read requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-capable-read
      lake exe slake-freestanding-capable-read -- "$root"
    )
    echo "freestanding-capable-read: GREEN (no-FreestandingEmit dual SSOT READ; WriteHc open; perform claimed false)"

# Partial B26: Lake-free freestanding-capable READ measure (first B14 CapableRead).
# Mult..Out dual SSOT token + HEADER/BODY structural blocks under emit/ -- same
# freestanding-capable contract depth as B16 freestandingCapableReadDualSsot.
# Does NOT run lake build/exe. Distinct from ownership-regenerate-read-only
# (B23 presence+token only; ownership framing; not CapableRead).
# List SSoT: CapableRead.dualSsotSpecs (basename:token:
# headerBlock:bodyBlock). Keep in lockstep when Mult..Out SSOT grows.
# Greppable: freestanding-capable-read-lake-free,
# productPathFreestandingCapableRead, productPathFreestandingCapableReadLakeFreeRecipe,
# FREESTANDING-CAPABLE-STEP-CONTRACT-READ, FREESTANDING-PERFORM-GAP-READ-SSOT,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP
freestanding-capable-read-lake-free:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_dir="src/systems/emit"
    echo "== freestanding-capable-read-lake-free (B26 Lake-free freestanding-capable READ; CapableRead) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
    echo "  measure: productPathFreestandingCapableRead true"
    echo "  contract: FREESTANDING-CAPABLE-STEP-CONTRACT-READ depth (token + HEADER/BODY)"
    echo "  Lake-free: no lake build/exe; freestanding-capable dual SSOT structural read"
    echo "  not ownership-regenerate-read-only; not compose/write; not Full; not perform claimed"
    echo "  not residual free; not PROVABLY; complete stays false"
    if [[ ! -d "$emit_dir" ]]; then
      echo "error: missing emit dir $emit_dir" >&2
      exit 1
    fi
    # Mult..Out dual SSOT: base:token:headerBlock:bodyBlock (B16 freestandingCapableReadDualSsot).
    # Authority: CapableRead.dualSsotSpecs.
    specs=(
      "host_emit_mult.ssot.txt:HOST-EMIT-MULT:MULT_C_HEADER:MULT_C_BODY"
      "host_emit_linear.ssot.txt:HOST-EMIT-LINEAR:LINEAR_C_HEADER:LINEAR_C_BODY"
      "host_emit_erasure.ssot.txt:HOST-EMIT-ERASURE:ERASURE_C_HEADER:ERASURE_C_BODY"
      "host_emit_extract.ssot.txt:HOST-EMIT-EXTRACT:EXTRACT_C_HEADER:EXTRACT_C_BODY"
      "host_emit_types.ssot.txt:HOST-EMIT-TYPES:TYPES_C_HEADER:TYPES_C_BODY"
      "host_emit_program.ssot.txt:HOST-EMIT-PROGRAM:PROGRAM_C_HEADER:PROGRAM_C_BODY"
      "host_emit_graph.ssot.txt:HOST-EMIT-GRAPH:GRAPH_C_HEADER:GRAPH_C_BODY"
      "host_emit_compose.ssot.txt:HOST-EMIT-COMPOSE:COMPOSE_C_HEADER:COMPOSE_C_BODY"
      "host_emit_plan.ssot.txt:HOST-EMIT-PLAN:PLAN_C_HEADER:PLAN_C_BODY"
      "host_emit_apply.ssot.txt:HOST-EMIT-APPLY:APPLY_C_HEADER:APPLY_C_BODY"
      "host_emit_body_fragment.ssot.txt:HOST-EMIT-SSOT:BODY_C_HEADER:BODY_C_BODY"
      "host_emit_banner.ssot.txt:HOST-EMIT-BANNER:BANNER_C_HEADER:BANNER_C_BODY"
    )
    checked=0
    for spec in "${specs[@]}"; do
      base="${spec%%:*}"
      rest="${spec#*:}"
      token="${rest%%:*}"
      rest2="${rest#*:}"
      header="${rest2%%:*}"
      body="${rest2#*:}"
      path="$emit_dir/$base"
      if [[ ! -f "$path" ]]; then
        echo "error: missing dual SSOT: $path" >&2
        exit 1
      fi
      if [[ ! -s "$path" ]]; then
        echo "error: empty dual SSOT: $path" >&2
        exit 1
      fi
      if ! grep -Fq "$token" "$path"; then
        echo "error: dual SSOT missing token $token: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${header}_BEGIN" "$path"; then
        echo "error: dual SSOT missing HEADER begin ${header}_BEGIN: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${header}_END" "$path"; then
        echo "error: dual SSOT missing HEADER end ${header}_END: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${body}_BEGIN" "$path"; then
        echo "error: dual SSOT missing BODY begin ${body}_BEGIN: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${body}_END" "$path"; then
        echo "error: dual SSOT missing BODY end ${body}_END: $path" >&2
        exit 1
      fi
      checked=$((checked + 1))
    done
    echo "freestanding-capable-read-lake-free: GREEN (Lake-free freestanding-capable READ; checked ${checked} dual SSOT token+HEADER/BODY; B26 CapableRead)"

# Partial B17: freestanding-capable plan/apply/body COMPOSE without FreestandingEmit
# as product authority (freestandingCapableComposePlanApplyBody; HEADER/BODY +
# ordered marker). Advances FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE. Distinct
# from B12 compose-product-plan (perform substrate). B14 CapableCompose true after
# B27 freestanding-capable-compose-lake-free; this recipe is Lake-hosted diagnostic.
# Not freestanding perform claimed; not free.
# Greppable: freestanding-capable-compose, slake-freestanding-capable-compose,
# productPathFreestandingCapableComposePartialReady,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE,
# SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0,
# freestandingCapableComposePlanApplyBody, CapableCompose
freestanding-capable-compose:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    root="$(pwd)"
    echo "== freestanding-capable-compose (B17 freestanding-capable plan/apply/body COMPOSE; no FreestandingEmit) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0"
    echo "  contract: FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE (ComposeSatisfied true)"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    echo "  B14 productPathFreestandingCapableCompose true after B27 (see freestanding-capable-compose-lake-free)"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/CapableCompose.lean" ]]; then
      echo "error: missing SystemsLean CapableCompose / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable-compose requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-capable-compose
      lake exe slake-freestanding-capable-compose -- "$root"
    )
    echo "freestanding-capable-compose: GREEN (no-FreestandingEmit plan/apply/body COMPOSE; WriteHc open; perform claimed false)"

# Partial B27: Lake-free freestanding-capable COMPOSE measure (B14 CapableCompose).
# Plan/apply/body dual SSOT token + HEADER/BODY structural blocks under emit/ --
# same freestanding-capable contract depth as B17 freestandingCapableComposePlanApplyBody.
# Does NOT run lake build/exe. Distinct from ownership-regenerate-compose-only
# (B24 presence+token only; ownership framing; not CapableCompose).
# List SSoT: CapableCompose.planApplyBodySpecs
# (basename:token:headerBlock:bodyBlock). Keep in lockstep when compose SSOT grows.
# Greppable: freestanding-capable-compose-lake-free,
# productPathFreestandingCapableCompose, productPathFreestandingCapableComposeLakeFreeRecipe,
# FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE, FREESTANDING-PERFORM-GAP-COMPOSE,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP
freestanding-capable-compose-lake-free:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_dir="src/systems/emit"
    echo "== freestanding-capable-compose-lake-free (B27 Lake-free freestanding-capable COMPOSE; CapableCompose) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
    echo "  measure: productPathFreestandingCapableCompose true"
    echo "  contract: FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE depth (token + HEADER/BODY + ordered compose substrate)"
    echo "  Lake-free: no lake build/exe; freestanding-capable plan/apply/body structural compose"
    echo "  not ownership-regenerate-compose-only; not write; not Full; not perform claimed"
    echo "  not residual free; not PROVABLY; complete stays false"
    if [[ ! -d "$emit_dir" ]]; then
      echo "error: missing emit dir $emit_dir" >&2
      exit 1
    fi
    # Plan/apply/body dual SSOT: base:token:headerBlock:bodyBlock
    # (B17 freestandingCapableComposePlanApplyBody).
    # Authority: CapableCompose.planApplyBodySpecs.
    specs=(
      "host_emit_plan.ssot.txt:HOST-EMIT-PLAN:PLAN_C_HEADER:PLAN_C_BODY"
      "host_emit_apply.ssot.txt:HOST-EMIT-APPLY:APPLY_C_HEADER:APPLY_C_BODY"
      "host_emit_body_fragment.ssot.txt:HOST-EMIT-BODY:BODY_C_HEADER:BODY_C_BODY"
    )
    checked=0
    for spec in "${specs[@]}"; do
      base="${spec%%:*}"
      rest="${spec#*:}"
      token="${rest%%:*}"
      rest2="${rest#*:}"
      header="${rest2%%:*}"
      body="${rest2#*:}"
      path="$emit_dir/$base"
      if [[ ! -f "$path" ]]; then
        echo "error: missing compose dual SSOT: $path" >&2
        exit 1
      fi
      if [[ ! -s "$path" ]]; then
        echo "error: empty compose dual SSOT: $path" >&2
        exit 1
      fi
      if ! grep -Fq "$token" "$path"; then
        echo "error: compose dual SSOT missing token $token: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${header}_BEGIN" "$path"; then
        echo "error: compose dual SSOT missing HEADER begin ${header}_BEGIN: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${header}_END" "$path"; then
        echo "error: compose dual SSOT missing HEADER end ${header}_END: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${body}_BEGIN" "$path"; then
        echo "error: compose dual SSOT missing BODY begin ${body}_BEGIN: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${body}_END" "$path"; then
        echo "error: compose dual SSOT missing BODY end ${body}_END: $path" >&2
        exit 1
      fi
      checked=$((checked + 1))
    done
    # Ordered compose substrate markers (B17 freestandingCapableComposePlanApplyBody
    # writer path + contract + gap ids). Distinct from ownership presence+token-only.
    # Writer-path / contract / gap live in host Lean; require module names them.
    host_compose="src/systems/SystemsLean/CapableCompose.lean"
    if [[ ! -f "$host_compose" ]]; then
      echo "error: missing freestanding-capable COMPOSE module $host_compose" >&2
      exit 1
    fi
    for ot in "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY" "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE" "FREESTANDING-PERFORM-GAP-COMPOSE" "freestandingCapableComposePlanApplyBody"; do
      if ! grep -Fq "$ot" "$host_compose"; then
        echo "error: freestanding-capable COMPOSE module missing ordered marker $ot: $host_compose" >&2
        exit 1
      fi
    done
    echo "freestanding-capable-compose-lake-free: GREEN (Lake-free freestanding-capable COMPOSE; checked ${checked} plan/apply/body dual SSOT token+HEADER/BODY; ordered compose markers; B27 CapableCompose)"

# Partial B18: freestanding-capable freestanding .h/.c WRITE without FreestandingEmit
# as product authority (freestandingCapableWriteFreestandingHc; dual SSOT HEADER/BODY
# + template embed + IO.FS.writeFile). Advances FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC.
# Distinct from B13 write-freestanding-hc (FreestandingEmit.emitAtRoot entrypoint).
# B14 CapableWriteHc true after B28 freestanding-capable-write-hc-lake-free; this recipe
# is Lake-hosted diagnostic. Not perform claimed.
# Greppable: freestanding-capable-write-hc, slake-freestanding-capable-write-hc,
# productPathFreestandingCapableWriteHcPartialReady,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC,
# SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0,
# freestandingCapableWriteFreestandingHc, CapableWriteHc
freestanding-capable-write-hc:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    root="$(pwd)"
    echo "== freestanding-capable-write-hc (B18 freestanding-capable WRITE-HC; no FreestandingEmit) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"
    echo "  contract: FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC (WriteHcSatisfied true)"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    echo "  B14 productPathFreestandingCapableWriteHc true after B28 (see freestanding-capable-write-hc-lake-free)"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/CapableWriteHc.lean" ]]; then
      echo "error: missing SystemsLean CapableWriteHc / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable-write-hc requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-capable-write-hc
      lake exe slake-freestanding-capable-write-hc -- "$root"
    )
    echo "freestanding-capable-write-hc: GREEN (no-FreestandingEmit freestanding .h/.c WRITE; Full open; perform claimed false)"

# Partial B28: Lake-free freestanding-capable WRITE-HC measure (B14 CapableWriteHc).
# Mult..Out dual SSOT token + HEADER/BODY structural blocks under emit/ plus write
# substrate markers (templates, freestanding .h/.c stage token, host module APIs) --
# same freestanding-capable contract depth as B18 freestandingCapableWriteFreestandingHc.
# Does NOT run lake build/exe. Distinct from ownership-regenerate-write-hc-only
# (B25 presence+token only; ownership framing; not CapableWriteHc).
# List SSoT: CapableWriteHc.dualSsotSpecs
# (basename:token:headerBlock:bodyBlock). Keep in lockstep when write SSOT grows.
# Greppable: freestanding-capable-write-hc-lake-free,
# productPathFreestandingCapableWriteHc, productPathFreestandingCapableWriteHcLakeFreeRecipe,
# FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC, FREESTANDING-PERFORM-GAP-WRITE-HC,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP
freestanding-capable-write-hc-lake-free:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_dir="src/systems/emit"
    echo "== freestanding-capable-write-hc-lake-free (B28 Lake-free freestanding-capable WRITE-HC; CapableWriteHc) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
    echo "  measure: productPathFreestandingCapableWriteHc true"
    echo "  contract: FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC depth (token + HEADER/BODY + write substrate)"
    echo "  Lake-free: no lake build/exe; freestanding-capable dual SSOT structural write substrate"
    echo "  not ownership-regenerate-write-hc-only; not Full; not perform claimed"
    echo "  not residual free; not PROVABLY; complete stays false"
    if [[ ! -d "$emit_dir" ]]; then
      echo "error: missing emit dir $emit_dir" >&2
      exit 1
    fi
    # Mult..Out dual SSOT: base:token:headerBlock:bodyBlock
    # (B18 freestandingCapableWriteFreestandingHc write inputs).
    # Authority: CapableWriteHc.dualSsotSpecs.
    specs=(
      "host_emit_banner.ssot.txt:HOST-EMIT-BANNER:BANNER_C_HEADER:BANNER_C_BODY"
      "host_emit_mult.ssot.txt:HOST-EMIT-MULT:MULT_C_HEADER:MULT_C_BODY"
      "host_emit_linear.ssot.txt:HOST-EMIT-LINEAR:LINEAR_C_HEADER:LINEAR_C_BODY"
      "host_emit_erasure.ssot.txt:HOST-EMIT-ERASURE:ERASURE_C_HEADER:ERASURE_C_BODY"
      "host_emit_extract.ssot.txt:HOST-EMIT-EXTRACT:EXTRACT_C_HEADER:EXTRACT_C_BODY"
      "host_emit_types.ssot.txt:HOST-EMIT-TYPES:TYPES_C_HEADER:TYPES_C_BODY"
      "host_emit_program.ssot.txt:HOST-EMIT-PROGRAM:PROGRAM_C_HEADER:PROGRAM_C_BODY"
      "host_emit_graph.ssot.txt:HOST-EMIT-GRAPH:GRAPH_C_HEADER:GRAPH_C_BODY"
      "host_emit_compose.ssot.txt:HOST-EMIT-COMPOSE:COMPOSE_C_HEADER:COMPOSE_C_BODY"
      "host_emit_plan.ssot.txt:HOST-EMIT-PLAN:PLAN_C_HEADER:PLAN_C_BODY"
      "host_emit_apply.ssot.txt:HOST-EMIT-APPLY:APPLY_C_HEADER:APPLY_C_BODY"
      "host_emit_body_fragment.ssot.txt:HOST-EMIT-BODY:BODY_C_HEADER:BODY_C_BODY"
    )
    checked=0
    for spec in "${specs[@]}"; do
      base="${spec%%:*}"
      rest="${spec#*:}"
      token="${rest%%:*}"
      rest2="${rest#*:}"
      header="${rest2%%:*}"
      body="${rest2#*:}"
      path="$emit_dir/$base"
      if [[ ! -f "$path" ]]; then
        echo "error: missing write dual SSOT: $path" >&2
        exit 1
      fi
      if [[ ! -s "$path" ]]; then
        echo "error: empty write dual SSOT: $path" >&2
        exit 1
      fi
      if ! grep -Fq "$token" "$path"; then
        echo "error: write dual SSOT missing token $token: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${header}_BEGIN" "$path"; then
        echo "error: write dual SSOT missing HEADER begin ${header}_BEGIN: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${header}_END" "$path"; then
        echo "error: write dual SSOT missing HEADER end ${header}_END: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${body}_BEGIN" "$path"; then
        echo "error: write dual SSOT missing BODY begin ${body}_BEGIN: $path" >&2
        exit 1
      fi
      if ! grep -Fq "# ${body}_END" "$path"; then
        echo "error: write dual SSOT missing BODY end ${body}_END: $path" >&2
        exit 1
      fi
      checked=$((checked + 1))
    done
    # Write substrate: templates + freestanding .h/.c stage token + host markers.
    # Distinct from ownership-regenerate-write-hc-only (presence+token only).
    for tmpl in "template_slake_freestanding.h.in" "template_slake_freestanding.c.in"; do
      tpath="$emit_dir/$tmpl"
      if [[ ! -f "$tpath" || ! -s "$tpath" ]]; then
        echo "error: missing or empty write template: $tpath" >&2
        exit 1
      fi
    done
    for wire in "slake_freestanding.h" "slake_freestanding.c"; do
      wpath="$emit_dir/$wire"
      if [[ ! -f "$wpath" || ! -s "$wpath" ]]; then
        echo "error: missing or empty freestanding write wire: $wpath" >&2
        exit 1
      fi
      if ! grep -Fq "SLAKE_EMIT_FREESTANDING_C_V0" "$wpath"; then
        echo "error: freestanding write wire missing stage token SLAKE_EMIT_FREESTANDING_C_V0: $wpath" >&2
        exit 1
      fi
    done
    host_write="src/systems/SystemsLean/CapableWriteHc.lean"
    if [[ ! -f "$host_write" ]]; then
      echo "error: missing freestanding-capable WRITE-HC module $host_write" >&2
      exit 1
    fi
    for ot in "WRITER-PATH-STEP-WRITE-FREESTANDING-HC" "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC" "FREESTANDING-PERFORM-GAP-WRITE-HC" "freestandingCapableWriteFreestandingHc" "slake_freestanding.h" "slake_freestanding.c"; do
      if ! grep -Fq "$ot" "$host_write"; then
        echo "error: freestanding-capable WRITE-HC module missing write substrate marker $ot: $host_write" >&2
        exit 1
      fi
    done
    echo "freestanding-capable-write-hc-lake-free: GREEN (Lake-free freestanding-capable WRITE-HC; checked ${checked} dual SSOT token+HEADER/BODY; templates+wire+host markers; B28 CapableWriteHc)"

# Partial B19: freestanding-capable ordered regenerate pipeline without FreestandingEmit
# as product authority (freestandingCapableOrderedRegenerate = READ then COMPOSE then
# WRITE-HC then Install Out). Distinct from B14 regenerate-product-path (host Lake
# perform join). Full stays false; InstallOut closed by B20; CapableRead/Compose/WriteHc true (B26..B28 Lake-free); WithoutLake open.
# Greppable: freestanding-capable-regenerate, slake-freestanding-capable-regenerate,
# productPathFreestandingCapableRegeneratePartialReady,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE,
# SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0,
# freestandingCapableOrderedRegenerate, CapableRegenerate,
# FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE
freestanding-capable-regenerate:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    root="$(pwd)"
    echo "== freestanding-capable-regenerate (B19 freestanding-capable ordered regenerate; no FreestandingEmit) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0"
    echo "  pipeline: FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE (READ+COMPOSE+WRITE-HC+INSTALL-OUT)"
    echo "  not Full; InstallOut closed by freestanding-capable path; not freestanding perform claimed; not residual free; not PROVABLY"
    echo "  CapableRead/Compose/WriteHc true (B26..B28 Lake-free); Full unsatisfied; WithoutLake open; DependsOnLake true (Lake exe host)"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/CapableRegenerate.lean" ]]; then
      echo "error: missing SystemsLean CapableRegenerate / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable-regenerate requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-capable-regenerate
      lake exe slake-freestanding-capable-regenerate -- "$root"
    )
    echo "freestanding-capable-regenerate: GREEN (no-FreestandingEmit ordered READ+COMPOSE+WRITE-HC+INSTALL-OUT; Full open; InstallOut closed; perform claimed false)"

# M4 Name A: product-wire without-Lake measured regenerate (prebuilt CapableRegenerate).
# Bootstrap once (not hot path): (cd src/systems && lake build slake-freestanding-capable-regenerate)
# then run this recipe (runs .lake/build/bin/slake-freestanding-capable-regenerate only).
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# Greppable: freestanding-capable-regenerate-without-lake, PRODUCT-WIRE-WITHOUT-LAKE,
# productWireWithoutLakeFinishedClaimed, prebuiltCapableRegenerateRel.
freestanding-capable-regenerate-without-lake:
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
    prebuilt="$systems_dir/.lake/build/bin/slake-freestanding-capable-regenerate"
    mod="$lean_dir/CapableRegenerate.lean"
    echo "== freestanding-capable-regenerate-without-lake (M4 product-wire measured step; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  output: emit + out/freestanding-c dual-eq WRITE; dual evidence greps"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if ! grep -qF 'productWireWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing productWireWithoutLakeFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeProductWireWithoutLake' "$mod"; then
      echo "error: missing justRecipeProductWireWithoutLake pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-capable-regenerate-without-lake' "$mod"; then
      echo "error: missing freestanding-capable-regenerate-without-lake cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'productWireWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing productWireWithoutLakeKeepsHostLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'prebuiltCapableRegenerateRel' "$mod"; then
      echo "error: missing prebuiltCapableRegenerateRel in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt CapableRegenerate binary: $prebuilt" >&2
      echo "  bootstrap once (not hot path): (cd src/systems && lake build slake-freestanding-capable-regenerate)" >&2
      echo "  then re-run: just freestanding-capable-regenerate-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt CapableRegenerate (no lake)"
    "$prebuilt" "$root"
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing freestanding header after without-Lake regenerate: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing freestanding source after without-Lake regenerate: $out_c" >&2
      exit 1
    fi
    if [[ ! -f "$install_h" ]]; then
      echo "error: missing Out install header after without-Lake regenerate: $install_h" >&2
      exit 1
    fi
    if [[ ! -f "$install_c" ]]; then
      echo "error: missing Out install source after without-Lake regenerate: $install_c" >&2
      exit 1
    fi
    for tok in SLAKE_EMIT_FREESTANDING_C_V0 HOST-EMIT-MULT HOST-EMIT-LINEAR HOST-EMIT-SSOT; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$install_h"; then
        echo "error: $install_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$install_c"; then
        echo "error: $install_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'productWireWithoutLakeReady' "$mod"; then
      echo "error: productWireWithoutLakeReady missing after without-Lake regenerate (host bar)" >&2
      exit 1
    fi
    if ! grep -qE 'def productWireWithoutLakeFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: productWireWithoutLakeFinishedClaimed must be true for M4 without-Lake finished" >&2
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
    if ! grep -qE 'def productPathFreestandingCapableRegenerateDependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: productPathFreestandingCapableRegenerateDependsOnLake must stay true" >&2
      exit 1
    fi
    echo "freestanding-capable-regenerate-without-lake: GREEN"

# Partial B20: freestanding-capable Install Out without FreestandingEmit as product
# authority (freestandingCapableInstallFreestandingOut; emit .h/.c -> out/freestanding-c/).
# Distinct from B10 install-freestanding-c-out (Lake-free shell cp). Deeper Lean IO path.
# Full stays false; InstallOutOpen false; CapableRead/Compose/WriteHc true (B26..B28); WithoutLake open. Not perform claimed.
# Greppable: freestanding-capable-install-out, slake-freestanding-capable-install-out,
# productPathFreestandingCapableInstallOutPartialReady,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT,
# SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0,
# freestandingCapableInstallFreestandingOut, InstallOut,
# FREESTANDING-CAPABLE-INSTALL-OUT, WRITER-PATH-STEP-INSTALL-OUT
freestanding-capable-install-out:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    root="$(pwd)"
    echo "== freestanding-capable-install-out (B20 freestanding-capable Install Out; no FreestandingEmit) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0"
    echo "  step: FREESTANDING-CAPABLE-INSTALL-OUT / WRITER-PATH-STEP-INSTALL-OUT"
    echo "  not Full; InstallOutOpen false; not freestanding perform claimed; not residual free; not PROVABLY"
    echo "  CapableRead/Compose/WriteHc true (B26..B28 Lake-free); Full unsatisfied; WithoutLake open; DependsOnLake true (Lake exe host)"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/InstallOut.lean" ]]; then
      echo "error: missing SystemsLean InstallOut / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable-install-out requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-capable-install-out
      lake exe slake-freestanding-capable-install-out -- "$root"
    )
    echo "freestanding-capable-install-out: GREEN (no-FreestandingEmit install emit->Out; Full open; InstallOut closed; perform claimed false)"

# Partial B21 / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR: Full bar /
# ownership-gap measure (what is closed after B20 vs what still blocks Full).
# Lake host exe SystemsLean.CapableFullBar.
# Not Full true; not perform claimed; not ownership claimed; not complete.
# Greppable: freestanding-capable-full-bar, slake-freestanding-capable-full-bar,
# productPathFreestandingCapableFullBarPartialReady,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR,
# SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0,
# CapableFullBar, BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
# FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE
freestanding-capable-full-bar:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-capable-full-bar (B21 Full bar / ownership-gap measure; not Full) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0"
    echo "  closed: step contracts + InstallOut + ordered regenerate (B16..B20) + WithoutLake (B30)"
    echo "  open: Full; perform/ownership claimed (B14 Capable* closed after B26..B28)"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/CapableFullBar.lean" ]]; then
      echo "error: missing SystemsLean CapableFullBar / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable-full-bar requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-capable-full-bar
      lake exe slake-freestanding-capable-full-bar
    )
    echo "freestanding-capable-full-bar: GREEN (closed pins true incl. WithoutLake; CapableLakeFree true; Full false; perform claimed false)"
