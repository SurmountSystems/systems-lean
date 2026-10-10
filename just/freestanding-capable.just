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

_freestanding_capable_read_lake_free := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/freestanding-capable-read-lake-free.nix { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

freestanding-capable-read-lake-free:
    @nix eval --impure --raw --expr {{quote(_freestanding_capable_read_lake_free)}}

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
_freestanding_capable_compose_lake_free := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/freestanding-capable-compose-lake-free.nix { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

freestanding-capable-compose-lake-free:
    @nix eval --impure --raw --expr {{quote(_freestanding_capable_compose_lake_free)}}

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
_freestanding_capable_write_hc_lake_free := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/freestanding-capable-write-hc-lake-free.nix { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

freestanding-capable-write-hc-lake-free:
    @nix eval --impure --raw --expr {{quote(_freestanding_capable_write_hc_lake_free)}}

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
_freestanding_capable_regenerate_without_lake := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/freestanding-capable-regenerate-without-lake.nix { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

freestanding-capable-regenerate-without-lake:
    @nix eval --impure --raw --expr {{quote(_freestanding_capable_regenerate_without_lake)}}

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
