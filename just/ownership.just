# Modular just: just/ownership.just -- role recipes (import into root justfile).
# Partial B22..B30 / SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: ownership regenerate
# substrate measure (install+READ+COMPOSE+WRITE-HC Lake-free true; B29 join; B30
# product path authority; WithoutLake true). Lake host exe
# SystemsLean.ProductPathOwnershipRegenerate.
# Not ownership claimed; not Full; not perform claimed; not complete.
# Greppable: ownership-regenerate, slake-ownership-regenerate,
# productPathOwnershipRegeneratePartialReady,
# SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE,
# SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0,
# ProductPathOwnershipRegenerate, BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
# OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE, OWNERSHIP-REGENERATE-READ-LAKE-FREE,
# OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE, OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE,
# OWNERSHIP-REGENERATE-LAKE-FREE-JOIN, OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY,
# FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE
ownership-regenerate:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== ownership-regenerate (B22..B30 ownership regenerate substrate measure; not ownership claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    echo "  install+READ+COMPOSE+WRITE-HC Lake-free true; B29 join; B30 authority; WithoutLake true"
    echo "  not ownership claimed; not Full; not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/ProductPathOwnershipRegenerate.lean" ]]; then
      echo "error: missing SystemsLean ProductPathOwnershipRegenerate / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; ownership-regenerate measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-ownership-regenerate
      lake exe slake-ownership-regenerate
    )
    echo "ownership-regenerate: GREEN (install+READ+COMPOSE+WRITE-HC Lake-free true; B30 authority; WithoutLake true; ownership claimed false)"

# Partial B22 Lake-free ownership regenerate install path piece.
# Calls shared install-freestanding-c-out (B10) under ownership regenerate framing.
# Does NOT run lake build/exe. Fail closed if emit missing (via install body).
# Greppable: ownership-regenerate-install-only, productPathOwnershipRegenerateInstallLakeFree,
# OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE
ownership-regenerate-install-only:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== ownership-regenerate-install-only (B22 Lake-free ownership regenerate install path) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    echo "  token: OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
    echo "  Lake-free: no lake build/exe; shared install body only"
    echo "  not full ownership regenerate without Lake; not ownership claimed; not Full"
    just install-freestanding-c-out
    echo "ownership-regenerate-install-only: GREEN (Lake-free install path piece; B22)"

# Partial B23 Lake-free ownership regenerate READ path piece.
# Dual SSOT presence+token check under emit/ (Mult..Out host_emit_*.ssot.txt).
# Does NOT run lake build/exe. Fail closed if any dual SSOT missing or token absent.
# Depth matches B11 presence+token (not HEADER/BODY parse; not DUAL-SSOT-EQUALITY).
# Not B14 CapableRead; not freestanding-capable READ Lake-hosted B16.
# List SSoT (authority for basename:token pairs): SystemsLean.ProductPathReadSsot
# dualSsotSpecs in src/systems/SystemsLean/ProductPathReadSsot.lean (and freestanding-
# capable READ surface). Keep this pairs= array in lockstep when Mult..Out SSOT grows;
# pure Nix systems-emit-wire also walks the same 12 dual SSOT files independently.
# Greppable: ownership-regenerate-read-only, productPathOwnershipRegenerateReadLakeFree,
# OWNERSHIP-REGENERATE-READ-LAKE-FREE, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE
ownership-regenerate-read-only:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_dir="src/systems/emit"
    echo "== ownership-regenerate-read-only (B23 Lake-free ownership regenerate READ path) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    echo "  token: OWNERSHIP-REGENERATE-READ-LAKE-FREE"
    echo "  Lake-free: no lake build/exe; dual SSOT presence+token only"
    echo "  not full ownership regenerate without Lake; not ownership claimed; not Full"
    echo "  distinct from B14 CapableRead freestanding-capable-read-lake-free; not freestanding perform claimed"
    if [[ ! -d "$emit_dir" ]]; then
      echo "error: missing emit dir $emit_dir" >&2
      exit 1
    fi
    # Mult..Out dual SSOT basenames + HOST-EMIT tokens (B8/B11 ownership surface).
    # Authority: ProductPathReadSsot.dualSsotSpecs (see recipe header).
    pairs=(
      "host_emit_mult.ssot.txt:HOST-EMIT-MULT"
      "host_emit_linear.ssot.txt:HOST-EMIT-LINEAR"
      "host_emit_erasure.ssot.txt:HOST-EMIT-ERASURE"
      "host_emit_extract.ssot.txt:HOST-EMIT-EXTRACT"
      "host_emit_types.ssot.txt:HOST-EMIT-TYPES"
      "host_emit_program.ssot.txt:HOST-EMIT-PROGRAM"
      "host_emit_graph.ssot.txt:HOST-EMIT-GRAPH"
      "host_emit_compose.ssot.txt:HOST-EMIT-COMPOSE"
      "host_emit_plan.ssot.txt:HOST-EMIT-PLAN"
      "host_emit_apply.ssot.txt:HOST-EMIT-APPLY"
      "host_emit_body_fragment.ssot.txt:HOST-EMIT-SSOT"
      "host_emit_banner.ssot.txt:HOST-EMIT-BANNER"
    )
    checked=0
    for pair in "${pairs[@]}"; do
      base="${pair%%:*}"
      token="${pair##*:}"
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
      checked=$((checked + 1))
    done
    echo "ownership-regenerate-read-only: GREEN (Lake-free READ path piece; checked ${checked} dual SSOT; B23)"

# Partial B24 Lake-free ownership regenerate COMPOSE path piece.
# Plan/apply/body dual SSOT presence+token under emit/ (compose substrate).
# Does NOT run lake build/exe. Fail closed if any compose SSOT missing or token absent.
# Depth matches B12 presence+token (not HEADER/BODY parse; not Mult..Apply template embed).
# Not B14 CapableCompose; not freestanding-capable COMPOSE Lake-hosted B17.
# List SSoT (authority for basename:token pairs): SystemsLean.ProductPathComposePlan
# planApplyBodySpecs in src/systems/SystemsLean/ProductPathComposePlan.lean (and
# freestanding-capable COMPOSE surface). Keep this pairs= array in lockstep when
# plan/apply/body SSOT grows; pure Nix systems-emit-wire also walks the same 3 files.
# Greppable: ownership-regenerate-compose-only,
# productPathOwnershipRegenerateComposeLakeFree,
# OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE
ownership-regenerate-compose-only:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_dir="src/systems/emit"
    echo "== ownership-regenerate-compose-only (B24 Lake-free ownership regenerate COMPOSE path) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    echo "  token: OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
    echo "  Lake-free: no lake build/exe; plan/apply/body dual SSOT presence+token only"
    echo "  not full ownership regenerate without Lake; not ownership claimed; not Full"
    echo "  not B14 CapableCompose; not freestanding perform claimed"
    if [[ ! -d "$emit_dir" ]]; then
      echo "error: missing emit dir $emit_dir" >&2
      exit 1
    fi
    # Plan/apply/body dual SSOT basenames + HOST-EMIT tokens (B12 compose surface).
    # Authority: ProductPathComposePlan.planApplyBodySpecs (see recipe header).
    pairs=(
      "host_emit_plan.ssot.txt:HOST-EMIT-PLAN"
      "host_emit_apply.ssot.txt:HOST-EMIT-APPLY"
      "host_emit_body_fragment.ssot.txt:HOST-EMIT-BODY"
    )
    checked=0
    for pair in "${pairs[@]}"; do
      base="${pair%%:*}"
      token="${pair##*:}"
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
      checked=$((checked + 1))
    done
    echo "ownership-regenerate-compose-only: GREEN (Lake-free COMPOSE path piece; checked ${checked} plan/apply/body SSOT; B24)"

# Partial B25 Lake-free ownership regenerate WRITE-HC path piece.
# Freestanding emit .h/.c substrate presence+token under emit/ (write-hc surface).
# Does NOT run lake build/exe. Fail closed if emit wire missing or stage token absent.
# Depth matches B13/B18 presence+token (not FreestandingEmit emitAtRoot; not template embed).
# Not B14 CapableWriteHc; not freestanding-capable WRITE-HC Lake-hosted B18; not B13 Lake
# FreestandingEmit product write path.
# List SSoT (authority for basenames): SystemsLean.ProductPathWriteHc emitHeaderBase /
# emitSourceBase in src/systems/SystemsLean/ProductPathWriteHc.lean (and freestanding-
# capable WRITE-HC surface). Keep this pairs= array in lockstep when emit wire basenames
# change; pure Nix systems-emit-wire also walks the same 2 files independently.
# Greppable: ownership-regenerate-write-hc-only,
# productPathOwnershipRegenerateWriteHcLakeFree,
# OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE
ownership-regenerate-write-hc-only:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_dir="src/systems/emit"
    echo "== ownership-regenerate-write-hc-only (B25 Lake-free ownership regenerate WRITE-HC path) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    echo "  token: OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
    echo "  Lake-free: no lake build/exe; freestanding .h/.c presence+token only"
    echo "  not full ownership regenerate without Lake; not ownership claimed; not Full"
    echo "  not B14 CapableWriteHc; not freestanding perform claimed"
    if [[ ! -d "$emit_dir" ]]; then
      echo "error: missing emit dir $emit_dir" >&2
      exit 1
    fi
    # Freestanding emit wire basenames + stage tokens (B13/B18 write-hc surface).
    # Authority: ProductPathWriteHc.emitHeaderBase / emitSourceBase (see recipe header).
    pairs=(
      "slake_freestanding.h:SLAKE_EMIT_FREESTANDING_C_V0"
      "slake_freestanding.c:SLAKE_EMIT_FREESTANDING_C_V0"
    )
    checked=0
    for pair in "${pairs[@]}"; do
      base="${pair%%:*}"
      token="${pair##*:}"
      path="$emit_dir/$base"
      if [[ ! -f "$path" ]]; then
        echo "error: missing freestanding write-hc substrate: $path" >&2
        exit 1
      fi
      if [[ ! -s "$path" ]]; then
        echo "error: empty freestanding write-hc substrate: $path" >&2
        exit 1
      fi
      if ! grep -Fq "$token" "$path"; then
        echo "error: freestanding write-hc missing token $token: $path" >&2
        exit 1
      fi
      checked=$((checked + 1))
    done
    echo "ownership-regenerate-write-hc-only: GREEN (Lake-free WRITE-HC path piece; checked ${checked} freestanding .h/.c; B25)"

# Partial B29: ordered Lake-free ownership regenerate JOIN beyond B22..B28.
# Ties freestanding Capable* Lake-free measures (B26..B28) with ownership path
# pieces (B22..B25) in one ordered no-lake recipe. Does NOT run lake build/exe.
# Does NOT flip productPathOwnershipRegenerateWithoutLake (joined process-glue
# measure != freestanding product owns regenerate as product path authority).
# Does NOT flip perform claimed / ownership claimed / Full / complete.
# Greppable: ownership-regenerate-lake-free,
# productPathOwnershipRegenerateLakeFreeJoinClaimed,
# OWNERSHIP-REGENERATE-LAKE-FREE-JOIN,
# SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE,
# BLOCKER-FREESTANDING-MUST-OWN-REGENERATE
ownership-regenerate-lake-free:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== ownership-regenerate-lake-free (B29 ordered Lake-free ownership regenerate join) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    echo "  token: OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
    echo "  order: freestanding-capable READ/COMPOSE/WRITE-HC lake-free then ownership path pieces then install"
    echo "  Lake-free: no lake build/exe; joins existing Lake-free Capable* + ownership path recipes"
    echo "  not product path authority alone; not ownership claimed; not Full; not perform claimed"
    echo "  B30 WithoutLake uses ownership-regenerate-product-path-authority (authority != join alone)"
    # Freestanding-capable Lake-free measures first (B26..B28 Capable* depth).
    just freestanding-capable-read-lake-free
    just freestanding-capable-compose-lake-free
    just freestanding-capable-write-hc-lake-free
    # Ownership framing path pieces (B23..B25 presence+token; B22 install last).
    just ownership-regenerate-read-only
    just ownership-regenerate-compose-only
    just ownership-regenerate-write-hc-only
    just ownership-regenerate-install-only
    echo "ownership-regenerate-lake-free: GREEN (B29 ordered Lake-free join; process-glue measure; not authority alone)"

# Partial B30: freestanding product path AUTHORITY for ownership regenerate WithoutLake.
# Distinct from B29 ownership-regenerate-lake-free (process-glue join of Capable*
# + ownership path pieces). Authority path is freestanding-capable modules with
# AuthorityNotEmit + Lake-free Capable* depth + install; FreestandingEmit is not
# product path authority. Does NOT rebrand ownership-regenerate-*-only path pieces
# as authority (those stay path pieces under B29 join).
# Greppable: ownership-regenerate-product-path-authority,
# productPathOwnershipRegenerateProductPathAuthorityClaimed,
# productPathOwnershipRegenerateWithoutLake,
# OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY,
# FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE,
# SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE
ownership-regenerate-product-path-authority:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    echo "== ownership-regenerate-product-path-authority (B30 freestanding product path authority; WithoutLake) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    echo "  token: OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    echo "  authority: freestanding-capable path (AuthorityNotEmit); not FreestandingEmit"
    echo "  pipeline cite: FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    echo "  Lake-free: no lake build/exe; freestanding-capable Capable* depth + install (not ownership path pieces alone)"
    echo "  distinct from B29 ownership-regenerate-lake-free join (join is process-glue; this is authority)"
    echo "  not ownership claimed; not Full; not perform claimed; not complete; not residual free"
    # Authority modules must not import FreestandingEmit as product path.
    auth_modules=(
      "CapableRead.lean"
      "CapableCompose.lean"
      "CapableWriteHc.lean"
      "CapableRegenerate.lean"
      "InstallOut.lean"
      "ProductPathOwnershipRegenerate.lean"
    )
    for m in "${auth_modules[@]}"; do
      path="$lean_dir/$m"
      if [[ ! -f "$path" ]]; then
        echo "error: missing authority module $path" >&2
        exit 1
      fi
      if grep -q 'import SystemsLean.FreestandingEmit' "$path"; then
        echo "error: authority module imports FreestandingEmit: $path" >&2
        exit 1
      fi
    done
    # AuthorityNotEmit pins true on freestanding-capable path modules.
    auth_pins=(
      "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true"
    )
    pin_files=(
      "CapableRead.lean"
      "CapableCompose.lean"
      "CapableWriteHc.lean"
      "CapableRegenerate.lean"
      "InstallOut.lean"
    )
    i=0
    for pin in "${auth_pins[@]}"; do
      path="$lean_dir/${pin_files[$i]}"
      if ! grep -qF "$pin" "$path"; then
        echo "error: missing AuthorityNotEmit pin in $path: $pin" >&2
        exit 1
      fi
      i=$((i + 1))
    done
    # Ordered freestanding-capable regenerate pipeline name present (B19 authority cite).
    if ! grep -q 'FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE' \
        "$lean_dir/CapableRegenerate.lean"; then
      echo "error: missing FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE in regenerate module" >&2
      exit 1
    fi
    # Product path authority path: freestanding-capable Lake-free depth + install.
    # Does NOT invoke ownership-regenerate-*-only path pieces (those are B29 join pieces).
    just freestanding-capable-read-lake-free
    just freestanding-capable-compose-lake-free
    just freestanding-capable-write-hc-lake-free
    just install-freestanding-c-out
    echo "ownership-regenerate-product-path-authority: GREEN (B30 freestanding product path authority; WithoutLake dual-pin; Full/perform/ownership claimed false)"
