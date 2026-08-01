# Systems Lean -- thin task runner only (https://github.com/casey/just)
# Three languages only for novel work: Idris 2, Lean 4 (Slake/Systems Lean), pure Nix.
# just orchestrates (redirects, loops). Does not host product or tooling algorithms.
# Residual script/*.sh and fat check.sh are scheduled deletion / process glue -- pay down, do not grow.
# Plan: .agents/plans/plan-paydown-shell-c-surfaces.md

set shell := ["bash", "-euo", "pipefail", "-c"]

# Pure Nix expression: progress report text from live tree (impure root only).
_progress_report := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  p = import ./nix/progress { inherit lib; };
in (p.mk ./. ).report
'''

_progress_console := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  p = import ./nix/progress { inherit lib; };
in (p.mk ./. ).console
'''

_hygiene := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/source-hygiene.nix { inherit lib; root = novel; };
  t = import ./nix/professional-tone.nix { inherit lib; root = novel; };
  ok = h.ok && t.ok;
  summary =
    if ok then
      h.summary + "; " + t.summary
    else
      lib.concatStringsSep "\n" (
        (if h.ok then [ ] else [ h.summary ])
        ++ (if t.ok then [ ] else [ t.summary ])
      );
in if ok then summary + "\n" else throw summary
'''

_professional_tone := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  t = import ./nix/professional-tone.nix { inherit lib; root = novel; };
in if t.ok then t.summary + "\n" else throw t.summary
'''

_systems_host := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/systems-host-presence { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

_systems_emit_wire := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/systems-emit-wire { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

_idris_side := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/idris-side-presence { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

_lean_side := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/lean-side-presence { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

# List recipes (default when you run bare `just`).
default:
    @just --list

# Full suite: product wire first (just build), then pure gates + flake + residual glue.
# Live pure gates (systems-host, systems-emit-wire, idris-side, lean-side, hygiene)
# use impure eval of the worktree and do not require new nix/ files to be
# git-tracked. nix flake check only sees tracked files -- after adding under
# nix/ (or related flake copy paths), the human must stage those paths before
# flake/continuous integration (CI) match. Agents never git add / stage / commit
# to silence flake WARN (human-in-the-loop (HITL) stage; see AGENTS.md Nix tooling).
# On flake failure, residual workspace scripts still run; suite exits non-zero.
# SYSTEMS_PRODUCT_WIRE_FRESH=1 tells src/systems/check.sh to skip a second just build.
check: build hygiene systems-host systems-emit-wire idris-side lean-side
    #!/usr/bin/env bash
    set -euo pipefail
    export SYSTEMS_PRODUCT_WIRE_FRESH=1
    set +e
    nix flake check
    flake_rc=$?
    set -e
    if [[ "$flake_rc" -ne 0 ]]; then
      echo "WARN: nix flake check failed (rc=$flake_rc)." >&2
      echo "Live pure gates already ran (just systems-host, just systems-emit-wire," >&2
      echo "just idris-side, just lean-side, just hygiene)." >&2
      echo "If the flake error is missing/untracked paths: that is human-in-the-loop (HITL)" >&2
      echo "stage -- not agent work. Agents never git add, stage, or commit to silence this WARN." >&2
      echo "Human: stage the untracked paths named in the flake error (or git status under" >&2
      echo "nix/ and related flake copy paths), then re-run. No fixed path list here (rots)." >&2
      echo "Policy: AGENTS.md (Nix tooling / HITL stage + Git hands-off)." >&2
    fi
    if [[ -f ./src/idris2/check.sh ]]; then bash ./src/idris2/check.sh; fi
    if [[ -f ./src/lean4/check.sh ]]; then bash ./src/lean4/check.sh; fi
    if [[ -f ./src/systems/check.sh ]]; then bash ./src/systems/check.sh; fi
    if [[ "$flake_rc" -ne 0 ]]; then
      echo "check incomplete: flake rc=$flake_rc (live pure gates + workspace scripts ran)" >&2
      exit "$flake_rc"
    fi
    echo "check OK"

# Product freestanding wire: regenerate emit + out/freestanding-c.
# Official path (B38 RETIRE-OFFICIAL): freestanding dual-equality WRITE via
# freestanding-capable-regenerate (READ+COMPOSE+Capable dual-eq WRITE-HC+INSTALL)
# -- NOT FreestandingEmit / slake-emit-freestanding-c (diagnostic path remains).
# SLAKE_COMPILE_PATH_V0: retired shell stamp (deleted). Static compile-path /
# unit walk: just systems-emit-wire + just systems-host (HOST-COMPILE-PATH /
# SLAKE_COMPILE_PATH_V1 in SystemsLean/CompilePath.lean). Not product C.
# Requires host Lean pin (elan + lake); fail closed if missing.
# No separate out-freestanding-c recipe (retired; former stamp-only build deleted).
# Release dir stays out/freestanding-c/. Not residual free; not PROVABLY.
build:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    dest=out/freestanding-c
    emit_dir="src/systems/emit"
    systems_dir="src/systems"
    mkdir -p "$dest"
    echo "== just build (product freestanding wire) -> $dest =="
    echo "Release: runtimeless product C (no Lean managed runtime / product GC on the wire)."
    echo "  not residual free; not PROVABLY"
    echo "  SLAKE_COMPILE_PATH_V0: retired shell stamp; static: systems-emit-wire + systems-host"
    echo "  SLAKE_COMPILE_PATH_V1 / HOST-COMPILE-PATH: SystemsLean/CompilePath.lean (not product C)"
    echo "  emit: freestanding dual-eq WRITE (freestanding-capable-regenerate; B38 RETIRE-OFFICIAL)"
    echo "  authority: freestandingCapableOrderedRegenerate / freestandingCapableWriteFreestandingHc"
    echo "  not FreestandingEmit (retired as official product writer; diagnostic Lake path remains)"
    if [[ ! -f "$dest/README.md" ]]; then
      echo "error: missing $dest/README.md" >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/CapableRegenerate.lean" ]]; then
      echo "error: freestanding-capable regenerate missing under $systems_dir" >&2
      echo "  residual requires freestanding dual-eq WRITE official path (B38 RETIRE-OFFICIAL)." >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/SystemsLean/CapableWriteHc.lean" ]]; then
      echo "error: Capable dual-eq WRITE module missing under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-capable official path requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    # Official product writer: freestanding dual-eq ordered regenerate (includes install Out).
    just freestanding-capable-regenerate
    echo "build: freestanding-capable-regenerate (B38 RETIRE-OFFICIAL dual-eq WRITE) done"
    echo "  not residual free; not PROVABLY; no product GC; not Lean managed runtime"
    echo "  stage: freestanding dual-eq WRITE official path + UNIT_DEEPEN_V1 (still not residual free)"
    echo "  product path: just build -> emit + out/freestanding-c"

# Partial B11 / SELF-HOST-PRODUCT-PATH-PERFORM-READ: decomposed dual SSOT READ only.
# Lake host exe SystemsLean.ProductPathReadSsot (IO.FS.readFile Mult..Out SSOT).
# Does NOT run FreestandingEmit / renderHeader / renderSource / emitAtRoot / write .h/.c.
# Still classic Lean Lake for this host step (productPathPerformReadDependsOnLake true).
# Not freestanding perform claimed; FREESTANDING-PERFORM-GAP-READ-SSOT not closed.
# Greppable: read-product-ssot, slake-read-product-ssot, productPathPerformReadPartialReady,
# SELF-HOST-PRODUCT-PATH-PERFORM-READ, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0
read-product-ssot:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    systems_dir="src/systems"
    echo "== read-product-ssot (decomposed READ dual SSOT; no FreestandingEmit write) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/ProductPathReadSsot.lean" ]]; then
      echo "error: ProductPathReadSsot missing under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; read-product-ssot requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-read-product-ssot
      lake exe slake-read-product-ssot -- "$root"
    )
    echo "read-product-ssot: GREEN (dual SSOT read only; compose/write still Lake FreestandingEmit)"

# Partial B12 / SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: decomposed plan/apply/body COMPOSE.
# Lake host exe SystemsLean.ProductPathComposePlan (ordered in-memory compose marker).
# Does NOT run FreestandingEmit / renderHeader / renderSource / emitAtRoot / write .h/.c.
# Still classic Lean Lake for this host step (productPathPerformComposeDependsOnLake true).
# Not freestanding perform claimed; FREESTANDING-PERFORM-GAP-COMPOSE not closed.
# Greppable: compose-product-plan, slake-compose-product-plan, productPathPerformComposePartialReady,
# SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0
compose-product-plan:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    systems_dir="src/systems"
    echo "== compose-product-plan (decomposed COMPOSE plan/apply/body; no FreestandingEmit write) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/ProductPathComposePlan.lean" ]]; then
      echo "error: ProductPathComposePlan missing under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; compose-product-plan requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-compose-product-plan
      lake exe slake-compose-product-plan -- "$root"
    )
    echo "compose-product-plan: GREEN (plan/apply/body compose only; write still Lake FreestandingEmit)"

# Partial B13 / SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: decomposed WRITE freestanding .h/.c.
# Lake host exe SystemsLean.ProductPathWriteHc -> FreestandingEmit.emitAtRoot under emit/.
# Writes emit slake_freestanding.{h,c} only; does NOT install Out (B10 / just build).
# Still classic Lean Lake for this host step (productPathPerformWriteHcDependsOnLake true).
# Not freestanding perform claimed; FREESTANDING-PERFORM-GAP-WRITE-HC not closed.
# Greppable: write-freestanding-hc, slake-write-freestanding-hc, productPathPerformWriteHcPartialReady,
# SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0
write-freestanding-hc:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    systems_dir="src/systems"
    echo "== write-freestanding-hc (decomposed WRITE-HC freestanding .h/.c; Lake FreestandingEmit) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/ProductPathWriteHc.lean" ]]; then
      echo "error: missing SystemsLean ProductPathWriteHc / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; write-freestanding-hc requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-write-freestanding-hc
      lake exe slake-write-freestanding-hc -- "$root"
    )
    echo "write-freestanding-hc: GREEN (emit .h/.c write only; install Out still B10; perform claimed false)"

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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/Capable.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/CapableStepContract.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/CapableRead.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/CapableCompose.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/CapableWriteHc.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/CapableRegenerate.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/InstallOut.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/CapableFullBar.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/ProductPathOwnershipRegenerate.lean" ]]; then
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

# Partial B31: freestanding product path PERFORM EVIDENCE beyond B30 authority.
# Perform framing (not ownership authority rebrand): freestanding-capable
# performers for FREESTANDING-PERFORM-GAP-* with AuthorityNotEmit + Capable*
# Lake-free depth + install + ordered pipeline cite. Lake-free: no lake build/exe.
# productPathFreestandingPerformEvidenceClaimed true; productPathFreestandingPerformClaimed
# stays false (DependsOnLake true; land-time B31 FreestandingEmit official pin;
# living tip B38 FreestandingEmit retired).
# Greppable: freestanding-perform-evidence,
# productPathFreestandingPerformEvidenceClaimed,
# FREESTANDING-PERFORM-EVIDENCE,
# FREESTANDING-PERFORM-EVIDENCE-READ-SSOT,
# FREESTANDING-PERFORM-EVIDENCE-COMPOSE,
# FREESTANDING-PERFORM-EVIDENCE-WRITE-HC,
# FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT,
# FREESTANDING-PERFORM-EVIDENCE-ORDERED,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE
freestanding-perform-evidence:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    echo "== freestanding-perform-evidence (B31 freestanding perform evidence; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0"
    echo "  token: FREESTANDING-PERFORM-EVIDENCE"
    echo "  framing: perform evidence (freestanding-capable performers); not ownership authority"
    echo "  pipeline cite: FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    echo "  Lake-free: no lake build/exe; freestanding-capable Capable* depth + install (perform framing)"
    echo "  distinct from B30 ownership-regenerate-product-path-authority (ownership framing)"
    echo "  distinct from B29 ownership-regenerate-lake-free join"
    echo "  evidence claimed true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Perform-evidence authority modules must not import FreestandingEmit.
    ev_modules=(
      "CapableRead.lean"
      "CapableCompose.lean"
      "CapableWriteHc.lean"
      "CapableRegenerate.lean"
      "InstallOut.lean"
      "PerformEvidence.lean"
    )
    for m in "${ev_modules[@]}"; do
      path="$lean_dir/$m"
      if [[ ! -f "$path" ]]; then
        echo "error: missing perform-evidence module $path" >&2
        exit 1
      fi
      if grep -q 'import SystemsLean.FreestandingEmit' "$path"; then
        echo "error: perform-evidence module imports FreestandingEmit: $path" >&2
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
    # Freestanding-capable perform API cites present (B16..B20 real performers).
    api_checks=(
      "CapableRead.lean:freestandingCapableReadDualSsot"
      "CapableCompose.lean:freestandingCapableComposePlanApplyBody"
      "CapableWriteHc.lean:freestandingCapableWriteFreestandingHc"
      "InstallOut.lean:freestandingCapableInstallFreestandingOut"
      "CapableRegenerate.lean:freestandingCapableOrderedRegenerate"
      "CapableRegenerate.lean:FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    )
    for pair in "${api_checks[@]}"; do
      file="${pair%%:*}"
      token="${pair#*:}"
      path="$lean_dir/$file"
      if ! grep -qF "$token" "$path"; then
        echo "error: missing perform API/token $token in $path" >&2
        exit 1
      fi
    done
    # Evidence module honesty pins: evidence claimed true; perform claimed false.
    ev_mod="$lean_dir/PerformEvidence.lean"
    if ! grep -qF 'def productPathFreestandingPerformEvidenceClaimed : Bool := true' "$ev_mod"; then
      echo "error: missing productPathFreestandingPerformEvidenceClaimed true in $ev_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$ev_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $ev_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$ev_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $ev_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-EVIDENCE" \
      "FREESTANDING-PERFORM-EVIDENCE-READ-SSOT" \
      "FREESTANDING-PERFORM-EVIDENCE-COMPOSE" \
      "FREESTANDING-PERFORM-EVIDENCE-WRITE-HC" \
      "FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT" \
      "FREESTANDING-PERFORM-EVIDENCE-ORDERED" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "FREESTANDING-PERFORM-GAP-READ-SSOT" \
      "FREESTANDING-PERFORM-GAP-COMPOSE" \
      "FREESTANDING-PERFORM-GAP-WRITE-HC"; do
      if ! grep -qF "$tok" "$ev_mod"; then
        echo "error: missing perform-evidence token $tok in $ev_mod" >&2
        exit 1
      fi
    done
    # Perform evidence path: freestanding-capable Lake-free depth + install (no lake).
    # Does NOT invoke ownership-regenerate-*-only path pieces (those are ownership framing).
    just freestanding-capable-read-lake-free
    just freestanding-capable-compose-lake-free
    just freestanding-capable-write-hc-lake-free
    just install-freestanding-c-out
    echo "freestanding-perform-evidence: GREEN (B31 freestanding perform evidence claimed; perform claimed false; DependsOnLake true)"

# Partial B31 measure print (Lake diagnostic; optional). Evidence is Lake-free recipe above.
# Greppable: freestanding-perform-evidence-measure, slake-freestanding-perform-evidence,
# PerformEvidence
freestanding-perform-evidence-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-evidence-measure (B31 perform evidence measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0"
    echo "  evidence claimed true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/PerformEvidence.lean" ]]; then
      echo "error: missing SystemsLean PerformEvidence / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-evidence-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-evidence
      lake exe slake-freestanding-perform-evidence
    )
    echo "freestanding-perform-evidence-measure: GREEN (evidence claimed true; perform claimed false; Full false)"

# Partial B32: freestanding product path PERFORM OFFICIAL-PATH GAP beyond B31 evidence.
# Measures that official regenerate (just build) still uses Lake
# elaborating FreestandingEmit while B31 perform evidence claimed true.
# Gap measured true is NOT perform claimed (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE
# stays open until official path retires FreestandingEmit). Lake-free dual-pin
# checks + B31 evidence re-green; no lake build/exe on gap recipe itself.
# productPathFreestandingPerformOfficialPathGapMeasured true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-official-path,
# productPathFreestandingPerformOfficialPathGapMeasured,
# FREESTANDING-PERFORM-OFFICIAL-PATH-GAP,
# FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT,
# FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE,
# FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT,
# FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE,
# FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER,
# FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH
freestanding-perform-official-path:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-perform-official-path (B32 official-path gap; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0"
    echo "  token: FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
    echo "  framing: land-time B32 Lake FreestandingEmit official pin; living tip B38 FreestandingEmit retired; B31 evidence remains"
    echo "  distinct from B31 freestanding-perform-evidence (evidence substrate, not gap measure)"
    echo "  gap measured true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Official-path gap module must not import FreestandingEmit (gap measure only).
    gap_mod="$lean_dir/OfficialPath.lean"
    if [[ ! -f "$gap_mod" ]]; then
      echo "error: missing official-path gap module $gap_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$gap_mod"; then
      echo "error: official-path gap module imports FreestandingEmit: $gap_mod" >&2
      exit 1
    fi
    # Gap module honesty pins: gap measured true; perform claimed false; still emit+lake.
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformOfficialPathGapMeasured true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$gap_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformEvidenceClaimed : Bool := true' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformEvidenceClaimed true in $gap_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "build" \
      "FreestandingEmit" \
      "slake-emit-freestanding-c"; do
      if ! grep -qF "$tok" "$gap_mod"; then
        echo "error: missing official-path gap token $tok in $gap_mod" >&2
        exit 1
      fi
    done
    # Official path justfile still cites Lake FreestandingEmit (proved residual).
    if [[ ! -f "$root_just" ]]; then
      echo "error: missing $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'build:' "$root_just"; then
      echo "error: missing build recipe in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'lake build slake-emit-freestanding-c' "$root_just"; then
      echo "error: official path missing lake build slake-emit-freestanding-c in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "$root_just"; then
      echo "error: official path missing lake exe slake-emit-freestanding-c in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'SystemsLean.FreestandingEmit' "$root_just"; then
      echo "error: official path missing SystemsLean.FreestandingEmit cite in $root_just" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: gap measured true next to perform claimed false.
    host_pin="$lean_dir/SelfApplyFs.lean"
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs gap measured true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs perform claimed false pin" >&2
      exit 1
    fi
    # Prerequisite: B31 freestanding perform evidence still green (Lake-free).
    just freestanding-perform-evidence
    echo "freestanding-perform-official-path: GREEN (B32 official-path gap measured; perform claimed false; DependsOnLake true; land-time FreestandingEmit official pin; living tip B38 FreestandingEmit retired)"

# Partial B32 measure print (Lake diagnostic; optional). Gap is Lake-free recipe above.
# Greppable: freestanding-perform-official-path-measure,
# slake-freestanding-perform-official-path,
# OfficialPath
freestanding-perform-official-path-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-official-path-measure (B32 official-path gap measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0"
    echo "  gap measured true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/OfficialPath.lean" ]]; then
      echo "error: missing SystemsLean OfficialPath / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-official-path-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-official-path
      lake exe slake-freestanding-perform-official-path
    )
    echo "freestanding-perform-official-path-measure: GREEN (gap measured true; perform claimed false; Full false)"

# Partial B33: freestanding product path PERFORM OFFICIAL-PATH ALTERNATE beyond B32 gap.
# Measures freestanding-capable ordered regenerate as non-FreestandingEmit alternate
# writer that is NOT official just build, and dual-equality / structural WRITE
# embed honesty still blocks retiring FreestandingEmit as official writer.
# Alternate measured true is NOT perform claimed (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE
# stays open until official path retires FreestandingEmit with dual-equality evidence).
# Lake-free dual-pin checks + B32 gap re-green; no lake build/exe on alternate recipe itself.
# productPathFreestandingPerformOfficialPathAlternateMeasured true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true;
# productPathOfficialPathDualEqualityBlocksRetirement true.
# Greppable: freestanding-perform-official-path-alternate,
# productPathFreestandingPerformOfficialPathAlternateMeasured,
# FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE,
# FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER,
# FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL,
# FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE
freestanding-perform-official-path-alternate:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-perform-official-path-alternate (B33 official-path alternate; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0"
    echo "  token: FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE"
    echo "  framing: freestanding-capable-regenerate alternate present; land-time not official; dual-equality blocks at B33 land; living tip B38 same writer official"
    echo "  distinct from B32 freestanding-perform-official-path (gap measure, not alternate dual-pin)"
    echo "  alternate measured true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Alternate module must not import FreestandingEmit (measure only).
    alt_mod="$lean_dir/OfficialPathAlternate.lean"
    if [[ ! -f "$alt_mod" ]]; then
      echo "error: missing official-path alternate module $alt_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$alt_mod"; then
      echo "error: official-path alternate module imports FreestandingEmit: $alt_mod" >&2
      exit 1
    fi
    # Alternate module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true' "$alt_mod"; then
      echo "error: missing productPathFreestandingPerformOfficialPathAlternateMeasured true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$alt_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$alt_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathAlternateWriterPresent : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathAlternateWriterPresent true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathAlternateNotOfficial : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathAlternateNotOfficial true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true' "$alt_mod"; then
      echo "error: missing productPathFreestandingPerformOfficialPathGapMeasured true in $alt_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "build" \
      "FreestandingEmit" \
      "slake-emit-freestanding-c" \
      "freestanding-capable-regenerate" \
      "freestandingCapableOrderedRegenerate" \
      "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE" \
      "CapableRegenerate"; do
      if ! grep -qF "$tok" "$alt_mod"; then
        echo "error: missing official-path alternate token $tok in $alt_mod" >&2
        exit 1
      fi
    done
    # Alternate freestanding-capable regenerate module + just recipe present.
    regen_mod="$lean_dir/CapableRegenerate.lean"
    if [[ ! -f "$regen_mod" ]]; then
      echo "error: missing freestanding-capable regenerate alternate $regen_mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingCapableOrderedRegenerate' "$regen_mod"; then
      echo "error: missing freestandingCapableOrderedRegenerate in $regen_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$regen_mod"; then
      echo "error: freestanding-capable regenerate imports FreestandingEmit (must stay AuthorityNotEmit): $regen_mod" >&2
      exit 1
    fi
    if [[ ! -f "$root_just" ]]; then
      echo "error: missing $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-capable-regenerate:' "$root_just"; then
      echo "error: missing freestanding-capable-regenerate recipe in $root_just" >&2
      exit 1
    fi
    # Land-time B33: FreestandingEmit still in justfile (historical dual-pin).
    # Living tip B38: official just build uses freestanding-capable-regenerate.
    if ! grep -qF 'build:' "$root_just"; then
      echo "error: missing build recipe in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'lake build slake-emit-freestanding-c' "$root_just"; then
      echo "error: missing lake build slake-emit-freestanding-c cite in $root_just (land-time B33 dual-pin)" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "$root_just"; then
      echo "error: missing lake exe slake-emit-freestanding-c cite in $root_just (land-time B33 dual-pin)" >&2
      exit 1
    fi
    if ! grep -qF 'SystemsLean.FreestandingEmit' "$root_just"; then
      echo "error: missing SystemsLean.FreestandingEmit cite in $root_just (land-time B33 dual-pin)" >&2
      exit 1
    fi
    # Living tip after B38: official path uses freestanding-capable-regenerate
    # (historical B33 land-time: alternate not official yet; dual-equality blocked).
    # Extract build recipe body until next top-level recipe.
    if ! awk '
      /^build:/ { in_rec=1; next }
      in_rec && /^[a-zA-Z0-9_-]+:/ { exit }
      in_rec { print }
    ' "$root_just" | grep -qF 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: alternate measured true next to perform claimed false.
    # Living tip after B38: dual-equality blocks retirement false (retired).
    host_pin="$lean_dir/SelfApplyFs.lean"
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs alternate measured true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality blocks false pin (B38 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs StillUsesFreestandingEmit false pin (B38 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathAlternateNotOfficial : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs AlternateNotOfficial false pin (B38 living tip; same writer official)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs perform claimed false pin" >&2
      exit 1
    fi
    # Prerequisite: B32 official-path gap still green (Lake-free).
    just freestanding-perform-official-path
    echo "freestanding-perform-official-path-alternate: GREEN (B33 alternate measured; living tip B38 same writer official; AlternateNotOfficial false; perform claimed false; DependsOnLake true)"

# Partial B33 measure print (Lake diagnostic; optional). Alternate is Lake-free recipe above.
# Greppable: freestanding-perform-official-path-alternate-measure,
# slake-freestanding-perform-official-path-alternate,
# OfficialPathAlternate
freestanding-perform-official-path-alternate-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-official-path-alternate-measure (B33 official-path alternate measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0"
    echo "  alternate measured true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/OfficialPathAlternate.lean" ]]; then
      echo "error: missing SystemsLean OfficialPathAlternate / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-official-path-alternate-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-official-path-alternate
      lake exe slake-freestanding-perform-official-path-alternate
    )
    echo "freestanding-perform-official-path-alternate-measure: GREEN (alternate measured true; perform claimed false; Full false)"

# Partial B34: freestanding product path PERFORM DUAL-EQUALITY WRITE PARITY beyond B33 alternate.
# Measures parity gap: freestandingCapableWriteFreestandingHc is structural HEADER/BODY
# embed only (not DUAL-SSOT-EQUALITY vs Lean Mult..Body fragments / requireDualSsotEqual);
# gap stays open; dual-equality still blocks retiring FreestandingEmit as official writer.
# Parity measured true is NOT perform claimed (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE
# stays open until official path retires FreestandingEmit with dual-equality evidence).
# Lake-free dual-pin checks + B33 alternate re-green; no lake build/exe on parity recipe itself.
# productPathFreestandingPerformDualEqualityWriteParityMeasured true;
# productPathDualEqualityWriteParityGapOpen true;
# productPathCapableWriteStructuralNotDualEquality true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-dual-equality-write-parity,
# productPathFreestandingPerformDualEqualityWriteParityMeasured,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY
freestanding-perform-dual-equality-write-parity:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-perform-dual-equality-write-parity (B34 dual-equality WRITE parity; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0"
    echo "  token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    echo "  framing: Capable WRITE structural embed != FreestandingEmit DUAL-SSOT-EQUALITY; gap open"
    echo "  distinct from B33 freestanding-perform-official-path-alternate (alternate dual-pin, not WRITE parity)"
    echo "  parity measured true; gap open true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Parity module must not import FreestandingEmit (measure only).
    parity_mod="$lean_dir/DualEqWriteParity.lean"
    if [[ ! -f "$parity_mod" ]]; then
      echo "error: missing dual-equality WRITE parity module $parity_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$parity_mod"; then
      echo "error: dual-equality WRITE parity module imports FreestandingEmit: $parity_mod" >&2
      exit 1
    fi
    # Parity module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true' "$parity_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteParityMeasured true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := true' "$parity_mod"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := true' "$parity_mod"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$parity_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$parity_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$parity_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$parity_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$parity_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$parity_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true' "$parity_mod"; then
      echo "error: missing productPathFreestandingPerformOfficialPathAlternateMeasured true in $parity_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "build" \
      "FreestandingEmit" \
      "slake-emit-freestanding-c" \
      "DUAL-SSOT-EQUALITY" \
      "requireDualSsotEqual" \
      "freestandingCapableWriteFreestandingHc" \
      "CapableWriteHc"; do
      if ! grep -qF "$tok" "$parity_mod"; then
        echo "error: missing dual-equality WRITE parity token $tok in $parity_mod" >&2
        exit 1
      fi
    done
    # Capable WRITE module present (structural side of parity).
    write_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$write_mod" ]]; then
      echo "error: missing freestanding-capable WRITE-HC module $write_mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingCapableWriteFreestandingHc' "$write_mod"; then
      echo "error: missing freestandingCapableWriteFreestandingHc in $write_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$write_mod"; then
      echo "error: freestanding-capable WRITE-HC imports FreestandingEmit (must stay AuthorityNotEmit): $write_mod" >&2
      exit 1
    fi
    # Land-time dual-pin: FreestandingEmit still cited; living tip B38 dual-eq official.
    if [[ ! -f "$root_just" ]]; then
      echo "error: missing $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'build:' "$root_just"; then
      echo "error: missing build recipe in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'lake build slake-emit-freestanding-c' "$root_just"; then
      echo "error: official path missing lake build slake-emit-freestanding-c in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "$root_just"; then
      echo "error: official path missing lake exe slake-emit-freestanding-c in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'SystemsLean.FreestandingEmit' "$root_just"; then
      echo "error: official path missing SystemsLean.FreestandingEmit cite in $root_just" >&2
      exit 1
    fi
    # Official path must not call freestanding-capable WRITE as dual-equality retirement.
    # Living tip after B38: official path uses freestanding-capable-regenerate.
    if ! awk '
      /^build:/ { in_rec=1; next }
      in_rec && /^[a-zA-Z0-9_-]+:/ { exit }
      in_rec { print }
    ' "$root_just" | grep -qF 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: parity measured true + gap closed after B37 next to perform claimed false.
    host_pin="$lean_dir/SelfApplyFs.lean"
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE parity measured true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE parity gap open false pin (B37 closed)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs Capable WRITE structural not dual-equality false pin (B37 dual-eq)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs perform claimed false pin" >&2
      exit 1
    fi
    # Prerequisite: B33 official-path alternate still green (Lake-free).
    just freestanding-perform-official-path-alternate
    echo "freestanding-perform-dual-equality-write-parity: GREEN (B34 dual-equality WRITE parity measured; gap closed after B37; perform claimed false; DependsOnLake true; living tip B38 FreestandingEmit retired)"

# Partial B34 measure print (Lake diagnostic; optional). Parity is Lake-free recipe above.
# Greppable: freestanding-perform-dual-equality-write-parity-measure,
# slake-freestanding-perform-dual-equality-write-parity,
# DualEqWriteParity
freestanding-perform-dual-equality-write-parity-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-dual-equality-write-parity-measure (B34 dual-equality WRITE parity measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0"
    echo "  parity measured true; gap open true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/DualEqWriteParity.lean" ]]; then
      echo "error: missing SystemsLean DualEqWriteParity / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-dual-equality-write-parity-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-dual-equality-write-parity
      lake exe slake-freestanding-perform-dual-equality-write-parity
    )
    echo "freestanding-perform-dual-equality-write-parity-measure: GREEN (parity measured true; gap open true; perform claimed false; Full false)"

# Partial B35 dual-equality WRITE close path (beyond B34 parity). Lake-free dual-pin:
# ordered close-path steps named; land-time not gap closed / gap open / Capable
# structural; living tip B37 gap closed + B38 FreestandingEmit retired; B34 parity
# re-green. Does NOT flip perform claimed. Does NOT close dual-equality gap from
# B35 land alone. Living tip just build is freestanding-capable-regenerate.
# productPathFreestandingPerformDualEqualityWriteClosePathMeasured true;
# productPathDualEqualityWriteClosePathNamed true;
# productPathDualEqualityWriteClosePathNotGapClosed true;
# productPathDualEqualityWriteParityGapOpen true;
# productPathCapableWriteStructuralNotDualEquality true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-dual-equality-write-close-path,
# productPathFreestandingPerformDualEqualityWriteClosePathMeasured,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH
freestanding-perform-dual-equality-write-close-path:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-perform-dual-equality-write-close-path (B35 dual-equality WRITE close path; not gap closed; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0"
    echo "  token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    echo "  framing: ordered close-path steps named; gap stays open; close path named != gap closed"
    echo "  distinct from B34 freestanding-perform-dual-equality-write-parity (parity dual-pin, not close path)"
    echo "  close path measured true; named true; not gap closed true; gap open true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Close-path module must not import FreestandingEmit (measure only).
    close_mod="$lean_dir/DualEqWriteClosePath.lean"
    if [[ ! -f "$close_mod" ]]; then
      echo "error: missing dual-equality WRITE close-path module $close_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$close_mod"; then
      echo "error: dual-equality WRITE close-path module imports FreestandingEmit: $close_mod" >&2
      exit 1
    fi
    # Close-path module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true' "$close_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteClosePathMeasured true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteClosePathNamed : Bool := true' "$close_mod"; then
      echo "error: missing productPathDualEqualityWriteClosePathNamed true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteClosePathNotGapClosed : Bool := true' "$close_mod"; then
      echo "error: missing productPathDualEqualityWriteClosePathNotGapClosed true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := true' "$close_mod"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := true' "$close_mod"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$close_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$close_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$close_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$close_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$close_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$close_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true' "$close_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteParityMeasured true in $close_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED" \
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API" \
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP" \
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL" \
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "build" \
      "FreestandingEmit" \
      "slake-emit-freestanding-c" \
      "DUAL-SSOT-EQUALITY" \
      "requireDualSsotEqual" \
      "freestandingCapableWriteFreestandingHc" \
      "CapableWriteHc"; do
      if ! grep -qF "$tok" "$close_mod"; then
        echo "error: missing dual-equality WRITE close-path token $tok in $close_mod" >&2
        exit 1
      fi
    done
    # Capable WRITE module present (structural side still residual).
    write_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$write_mod" ]]; then
      echo "error: missing freestanding-capable WRITE-HC module $write_mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingCapableWriteFreestandingHc' "$write_mod"; then
      echo "error: missing freestandingCapableWriteFreestandingHc in $write_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$write_mod"; then
      echo "error: freestanding-capable WRITE-HC imports FreestandingEmit (must stay AuthorityNotEmit): $write_mod" >&2
      exit 1
    fi
    # Land-time dual-pin: FreestandingEmit still cited; living tip B38 dual-eq official.
    if [[ ! -f "$root_just" ]]; then
      echo "error: missing $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'build:' "$root_just"; then
      echo "error: missing build recipe in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'lake build slake-emit-freestanding-c' "$root_just"; then
      echo "error: official path missing lake build slake-emit-freestanding-c in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "$root_just"; then
      echo "error: official path missing lake exe slake-emit-freestanding-c in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'SystemsLean.FreestandingEmit' "$root_just"; then
      echo "error: official path missing SystemsLean.FreestandingEmit cite in $root_just" >&2
      exit 1
    fi
    # Official path must not call freestanding-capable WRITE as dual-equality retirement.
    # Living tip after B38: official path uses freestanding-capable-regenerate.
    if ! awk '
      /^build:/ { in_rec=1; next }
      in_rec && /^[a-zA-Z0-9_-]+:/ { exit }
      in_rec { print }
    ' "$root_just" | grep -qF 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: close path measured true + named true + gap closed after B37 next to perform claimed false.
    host_pin="$lean_dir/SelfApplyFs.lean"
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE close path measured true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteClosePathNamed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE close path named true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteClosePathNotGapClosed : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE close path not gap closed false pin (B37 closed)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE parity gap open false pin (B37 closed)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs Capable WRITE structural not dual-equality false pin (B37 dual-eq)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs perform claimed false pin" >&2
      exit 1
    fi
    # Prerequisite: B34 dual-equality WRITE parity still green (Lake-free).
    just freestanding-perform-dual-equality-write-parity
    echo "freestanding-perform-dual-equality-write-close-path: GREEN (B35 dual-equality WRITE close path measured; named; gap closed after B37; perform claimed false; DependsOnLake true; living tip B38 FreestandingEmit retired)"

# Partial B35 measure print (Lake diagnostic; optional). Close path is Lake-free recipe above.
# Greppable: freestanding-perform-dual-equality-write-close-path-measure,
# slake-freestanding-perform-dual-equality-write-close-path,
# DualEqWriteClosePath
freestanding-perform-dual-equality-write-close-path-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-dual-equality-write-close-path-measure (B35 dual-equality WRITE close path measure; not gap closed; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0"
    echo "  close path measured true; named true; not gap closed true; gap open true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/DualEqWriteClosePath.lean" ]]; then
      echo "error: missing SystemsLean DualEqWriteClosePath / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-dual-equality-write-close-path-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-dual-equality-write-close-path
      lake exe slake-freestanding-perform-dual-equality-write-close-path
    )
    echo "freestanding-perform-dual-equality-write-close-path-measure: GREEN (close path measured true; named true; not gap closed true; gap open true; perform claimed false; Full false)"

# Partial B36 dual-equality freestanding WRITE API (beyond B35 close path;
# close-path step DUAL-EQUALITY-API). Lake-free dual-pin: real freestanding
# dual-equality WRITE API present (Emit* + requireDualSsotEqual + write; not
# FreestandingEmit authority); land-time API not official just build;
# land-time API module may pin gap open; SelfApplyFs gap closed after B37
# CAPABLE-GAP (Capable dual-eq live); living tip B38 FreestandingEmit retired;
# B35 close path re-green. Does NOT flip perform claimed from API alone.
# productPathFreestandingPerformDualEqualityWriteApiMeasured true;
# productPathDualEqualityWriteApiPresent true;
# productPathDualEqualityWriteApiAuthorityNotEmit true;
# productPathDualEqualityWriteApiNotOfficial true;
# productPathDualEqualityWriteApiStepAdvanced true;
# productPathDualEqualityWriteParityGapOpen true;
# productPathCapableWriteStructuralNotDualEquality true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-dual-equality-write-api,
# productPathFreestandingPerformDualEqualityWriteApiMeasured,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-PRESENT,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-AUTHORITY-NOT-EMIT,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-NOT-OFFICIAL,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-STEP-ADVANCED,
# freestandingDualEqualityWriteFreestandingHc,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API
freestanding-perform-dual-equality-write-api:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-perform-dual-equality-write-api (B36 dual-equality WRITE API; land-time API module may pin gap open; SelfApplyFs gap closed after B37; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
    echo "  token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API"
    echo "  framing: real freestanding dual-equality WRITE (Emit* + requireDualSsotEqual + write); SelfApplyFs gap closed after B37 (historical API module may pin gap open)"
    echo "  distinct from B35 freestanding-perform-dual-equality-write-close-path (close-path naming, not dual-equality WRITE API)"
    echo "  API measured true; present true; authority not emit; not official; step advanced; SelfApplyFs gap closed after B37; perform claimed false; DependsOnLake true; not Full; not complete"
    # Dual-equality WRITE API module must not import FreestandingEmit (Emit* only).
    api_mod="$lean_dir/DualEqWriteApi.lean"
    if [[ ! -f "$api_mod" ]]; then
      echo "error: missing dual-equality WRITE API module $api_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$api_mod"; then
      echo "error: dual-equality WRITE API module imports FreestandingEmit: $api_mod" >&2
      exit 1
    fi
    # Must import Emit* fragments for real dual-equality (not structural-only theater).
    for emit_mod in EmitBanner EmitMult EmitLinear EmitErasure EmitExtract EmitTypes EmitProgram EmitGraph EmitCompose EmitPlan EmitApply EmitBody; do
      if ! grep -q "import SystemsLean.${emit_mod}" "$api_mod"; then
        echo "error: dual-equality WRITE API module missing import SystemsLean.${emit_mod}: $api_mod" >&2
        exit 1
      fi
    done
    # API module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true' "$api_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteApiMeasured true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiPresent : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteApiPresent true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiAuthorityNotEmit : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteApiAuthorityNotEmit true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiNotOfficial : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteApiNotOfficial true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiStepAdvanced : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteApiStepAdvanced true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := true' "$api_mod"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$api_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$api_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$api_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$api_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$api_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$api_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingDualEqualityWriteFreestandingHc' "$api_mod"; then
      echo "error: missing freestandingDualEqualityWriteFreestandingHc API def in $api_mod" >&2
      exit 1
    fi
    # requireDualSsotEqual / dualSsotBlockEqual defs live on DualEqWriteLoad (long-file peel).
    _api_load="${api_mod%DualEqWriteApi.lean}DualEqWriteLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$api_mod" \
        && ! { [[ -f "$_api_load" ]] && grep -qF 'def requireDualSsotEqual' "$_api_load"; }; then
      echo "error: missing requireDualSsotEqual in $api_mod or $_api_load" >&2
      exit 1
    fi
    if ! grep -qF 'def dualSsotBlockEqual' "$api_mod" \
        && ! { [[ -f "$_api_load" ]] && grep -qF 'def dualSsotBlockEqual' "$_api_load"; }; then
      echo "error: missing dualSsotBlockEqual in $api_mod or $_api_load" >&2
      exit 1
    fi
    if ! grep -qF 'DUAL-SSOT-EQUALITY' "$api_mod"; then
      echo "error: missing DUAL-SSOT-EQUALITY in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API' "$api_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'IO.FS.writeFile' "$api_mod"; then
      echo "error: missing IO.FS.writeFile (real write) in $api_mod" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: B36 measured true + perform claimed false + gap open.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteApiMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiPresent : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteApiPresent true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiAuthorityNotEmit : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteApiAuthorityNotEmit true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiNotOfficial : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteApiNotOfficial true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiStepAdvanced : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteApiStepAdvanced true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs (B39 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen false in $self_fs (B37 closed)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$self_fs"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality false in $self_fs (B37 dual-eq)" >&2
      exit 1
    fi
    if ! grep -qF 'productPathFreestandingPerformDualEqualityWriteApiPartialReady' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteApiPartialReady in $self_fs" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe pins; living tip B38 dual-eq official.
    if ! grep -qF 'freestanding-perform-dual-equality-write-api' "$root_just"; then
      echo "error: missing freestanding-perform-dual-equality-write-api in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-perform-dual-equality-write-api-measure' "$root_just"; then
      echo "error: missing freestanding-perform-dual-equality-write-api-measure in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-perform-dual-equality-write-api' "$root_just"; then
      echo "error: missing slake-freestanding-perform-dual-equality-write-api in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'DualEqWriteApi' "$root_just"; then
      echo "error: missing DualEqWriteApi in $root_just" >&2
      exit 1
    fi
    # Diagnostic FreestandingEmit Lake path remains (B13 write-freestanding-hc).
    if ! grep -qF 'lake build slake-emit-freestanding-c' "$root_just"; then
      echo "error: missing lake build slake-emit-freestanding-c (diagnostic FreestandingEmit path)" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "$root_just"; then
      echo "error: missing lake exe slake-emit-freestanding-c (diagnostic FreestandingEmit path)" >&2
      exit 1
    fi
    # Living tip after B38: official just build uses freestanding dual-eq WRITE.
    if ! grep -q 'build:' "$root_just"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$root_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (B38 expects FreestandingEmit retired as official)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-perform-dual-equality-write-api'; then
      echo "error: build cites freestanding-perform-dual-equality-write-api (measure path, not official writer)" >&2
      exit 1
    fi
    # Prerequisite: B35 dual-equality WRITE close path still green (Lake-free).
    just freestanding-perform-dual-equality-write-close-path
    echo "freestanding-perform-dual-equality-write-api: GREEN (B36 dual-equality WRITE API measured; living tip B38 official dual-eq path; land-time module perform claimed false; SelfApplyFs living tip true after B39; DependsOnLake true)"

# Partial B36 measure print + real dual-equality write (Lake diagnostic; optional).
# API dual-pin is Lake-free recipe above.
# Greppable: freestanding-perform-dual-equality-write-api-measure,
# slake-freestanding-perform-dual-equality-write-api,
# DualEqWriteApi
freestanding-perform-dual-equality-write-api-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    root="$(pwd)"
    echo "== freestanding-perform-dual-equality-write-api-measure (B36 dual-equality WRITE API measure + write; gap closed after B37; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
    echo "  API measured true; present true; authority not emit; not official; gap closed after B37; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/DualEqWriteApi.lean" ]]; then
      echo "error: missing SystemsLean DualEqWriteApi / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-dual-equality-write-api-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-dual-equality-write-api
      # Pass repo root (justfile cwd) so emit/ SSOT resolves under root/src/systems/emit.
      lake exe slake-freestanding-perform-dual-equality-write-api -- "$root"
    )
    echo "freestanding-perform-dual-equality-write-api-measure: GREEN (API measured true; present true; dual-equality write exercised; gap closed after B37; perform claimed false; Full false)"

# Partial B37: freestanding product path PERFORM DUAL-EQUALITY WRITE CAPABLE-GAP beyond B36 API.
# Closes productPathDualEqualityWriteParityGapOpen with real Capable dual-equality WRITE
# evidence (freestandingCapableWriteFreestandingHc is dual-eq via Emit* + requireDualSsotEqual;
# productPathCapableWriteDualEqualityLive). Does NOT flip perform claimed. Does NOT switch
# just build / retire FreestandingEmit (RETIRE-OFFICIAL next).
# productPathFreestandingPerformDualEqualityWriteCapableGapMeasured true;
# productPathDualEqualityWriteCapableGapClosed true;
# productPathCapableWriteDualEqualityLive true;
# productPathDualEqualityWriteCapableGapStepAdvanced true;
# productPathDualEqualityWriteParityGapOpen false;
# productPathCapableWriteStructuralNotDualEquality false;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-dual-equality-write-capable-gap,
# productPathFreestandingPerformDualEqualityWriteCapableGapMeasured,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-CLOSED,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-DUAL-EQ-LIVE,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP,
# productPathCapableWriteDualEqualityLive,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP
freestanding-perform-dual-equality-write-capable-gap:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-perform-dual-equality-write-capable-gap (B37 CAPABLE-GAP close; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0"
    echo "  token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    echo "  framing: Capable WRITE dual-eq (Emit* + requireDualSsotEqual); parity gap closed; land-time FreestandingEmit official pin; living tip B38 retired"
    echo "  distinct from B36 freestanding-perform-dual-equality-write-api (API present, not CAPABLE-GAP close)"
    echo "  CAPABLE-GAP measured true; gap closed true; dual-eq live true; step advanced; perform claimed false; DependsOnLake true; not Full; not complete"
    # CAPABLE-GAP module must not import FreestandingEmit.
    gap_mod="$lean_dir/DualEqWriteCapableGap.lean"
    if [[ ! -f "$gap_mod" ]]; then
      echo "error: missing dual-equality WRITE CAPABLE-GAP module $gap_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$gap_mod"; then
      echo "error: dual-equality WRITE CAPABLE-GAP module imports FreestandingEmit: $gap_mod" >&2
      exit 1
    fi
    # CAPABLE-GAP module honesty pins (gap closed / dual-eq live).
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteCapableGapMeasured true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteCapableGapClosed : Bool := true' "$gap_mod"; then
      echo "error: missing productPathDualEqualityWriteCapableGapClosed true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$gap_mod"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteCapableGapStepAdvanced : Bool := true' "$gap_mod"; then
      echo "error: missing productPathDualEqualityWriteCapableGapStepAdvanced true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$gap_mod"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen false in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$gap_mod"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality false in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$gap_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP' "$gap_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP in $gap_mod" >&2
      exit 1
    fi
    # Capable WRITE module must have dual-eq live + Emit* imports + requireDualSsotEqual.
    capable_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$capable_mod" ]]; then
      echo "error: missing Capable WRITE module $capable_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$capable_mod"; then
      echo "error: Capable WRITE module imports FreestandingEmit: $capable_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$capable_mod"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $capable_mod" >&2
      exit 1
    fi
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel).
    _capable_load="${capable_mod%CapableWriteHc.lean}CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$_capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$_capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $_capable_load" >&2
      exit 1
    fi
    if ! grep -qF 'DUAL-SSOT-EQUALITY' "$capable_mod"; then
      echo "error: missing DUAL-SSOT-EQUALITY in $capable_mod" >&2
      exit 1
    fi
    for emit_mod in EmitBanner EmitMult EmitLinear EmitErasure EmitExtract EmitTypes EmitProgram EmitGraph EmitCompose EmitPlan EmitApply EmitBody; do
      if ! grep -q "import SystemsLean.${emit_mod}" "$capable_mod"; then
        echo "error: Capable WRITE module missing import SystemsLean.${emit_mod}: $capable_mod" >&2
        exit 1
      fi
    done
    # SelfApplyFs dual-pin: CAPABLE-GAP measured + gap closed + dual-eq live + perform claimed false.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteCapableGapMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteCapableGapClosed : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteCapableGapClosed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$self_fs"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteCapableGapStepAdvanced : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteCapableGapStepAdvanced true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$self_fs"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs (B39 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady in $self_fs" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe pins; living tip B38 FreestandingEmit retired.
    if ! grep -qF 'freestanding-perform-dual-equality-write-capable-gap' "$root_just"; then
      echo "error: missing freestanding-perform-dual-equality-write-capable-gap in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-perform-dual-equality-write-capable-gap-measure' "$root_just"; then
      echo "error: missing freestanding-perform-dual-equality-write-capable-gap-measure in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-perform-dual-equality-write-capable-gap' "$root_just"; then
      echo "error: missing slake-freestanding-perform-dual-equality-write-capable-gap in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'DualEqWriteCapableGap' "$root_just"; then
      echo "error: missing DualEqWriteCapableGap in $root_just" >&2
      exit 1
    fi
    # Diagnostic FreestandingEmit Lake path remains (B13 write-freestanding-hc).
    if ! grep -qF 'lake build slake-emit-freestanding-c' "$root_just"; then
      echo "error: missing lake build slake-emit-freestanding-c (diagnostic FreestandingEmit path)" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "$root_just"; then
      echo "error: missing lake exe slake-emit-freestanding-c (diagnostic FreestandingEmit path)" >&2
      exit 1
    fi
    if ! grep -q 'build:' "$root_just"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    # Living tip after B38: official just build uses freestanding dual-eq WRITE.
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$root_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (B38 expects FreestandingEmit retired as official)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-perform-dual-equality-write-capable-gap'; then
      echo "error: build cites freestanding-perform-dual-equality-write-capable-gap (measure path, not official writer)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-perform-dual-equality-write-api'; then
      echo "error: build cites freestanding-perform-dual-equality-write-api (measure path, not official writer)" >&2
      exit 1
    fi
    # SelfApplyFs living tip after B38: StillUsesFreestandingEmit false.
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing SelfApplyFs StillUsesFreestandingEmit false pin (B38 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$self_fs"; then
      echo "error: missing SelfApplyFs DualEqualityBlocksRetirement false pin (B38 living tip)" >&2
      exit 1
    fi
    # Prerequisite: B36 dual-equality WRITE API still green (Lake-free).
    just freestanding-perform-dual-equality-write-api
    echo "freestanding-perform-dual-equality-write-capable-gap: GREEN (B37 CAPABLE-GAP closed; living tip B38 FreestandingEmit retired; land-time module perform claimed false; SelfApplyFs living tip true after B39; DependsOnLake true)"

# Partial B37 measure print (Lake diagnostic; optional). CAPABLE-GAP dual-pin is Lake-free above.
# Greppable: freestanding-perform-dual-equality-write-capable-gap-measure,
# slake-freestanding-perform-dual-equality-write-capable-gap,
# DualEqWriteCapableGap
freestanding-perform-dual-equality-write-capable-gap-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-dual-equality-write-capable-gap-measure (B37 CAPABLE-GAP measure; gap closed; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0"
    echo "  CAPABLE-GAP measured true; gap closed true; dual-eq live true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/DualEqWriteCapableGap.lean" ]]; then
      echo "error: missing SystemsLean DualEqWriteCapableGap / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-dual-equality-write-capable-gap-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-dual-equality-write-capable-gap
      lake exe slake-freestanding-perform-dual-equality-write-capable-gap
    )
    echo "freestanding-perform-dual-equality-write-capable-gap-measure: GREEN (CAPABLE-GAP measured true; gap closed; dual-eq live; perform claimed false; Full false)"

# Partial B38: freestanding product path PERFORM RETIRE-OFFICIAL beyond B37 CAPABLE-GAP.
# Official just build uses freestanding dual-eq WRITE
# (freestanding-capable-regenerate / freestandingCapableWriteFreestandingHc Emit* +
# requireDualSsotEqual) as product authority -- NOT FreestandingEmit.
# productPathOfficialPathRetireOfficialMeasured true;
# productPathOfficialPathUsesDualEqualityWrite true;
# productPathOfficialPathStillUsesFreestandingEmit false (SelfApplyFs living tip);
# productPathOfficialPathDualEqualityBlocksRetirement false;
# productPathOfficialPathRetireFreestandingEmitRequired false;
# productPathOfficialPathStillUsesLake true; productPathFreestandingPerformClaimed false;
# DependsOnLake true; CAPABLE-GAP stays closed; complete stays false.
# Greppable: freestanding-retire-official,
# productPathOfficialPathRetireOfficialMeasured,
# FREESTANDING-PERFORM-RETIRE-OFFICIAL,
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-MEASURED,
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-USES-DUAL-EQ-WRITE,
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
# productPathOfficialPathUsesDualEqualityWrite,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL
freestanding-retire-official:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-retire-official (B38 RETIRE-OFFICIAL; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0"
    echo "  token: FREESTANDING-PERFORM-RETIRE-OFFICIAL"
    echo "  framing: official just build uses freestanding dual-eq WRITE; FreestandingEmit retired"
    echo "  distinct from B37 freestanding-perform-dual-equality-write-capable-gap (CAPABLE-GAP close, not official retire)"
    echo "  RETIRE-OFFICIAL measured true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; perform claimed false; DependsOnLake true; not Full; not complete"
    # RETIRE-OFFICIAL module (short name OfficialRetire) must not import FreestandingEmit.
    retire_mod="$lean_dir/OfficialRetire.lean"
    if [[ ! -f "$retire_mod" ]]; then
      echo "error: missing RETIRE-OFFICIAL module $retire_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$retire_mod"; then
      echo "error: RETIRE-OFFICIAL module imports FreestandingEmit: $retire_mod" >&2
      exit 1
    fi
    # RETIRE-OFFICIAL module honesty pins.
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$retire_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialStepAdvanced : Bool := true' "$retire_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialStepAdvanced true in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$retire_mod"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$retire_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$retire_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$retire_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$retire_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$retire_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$retire_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL' "$retire_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED' "$retire_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED in $retire_mod" >&2
      exit 1
    fi
    # Capable WRITE dual-eq remains live (B37 evidence substrate).
    capable_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$capable_mod" ]]; then
      echo "error: missing Capable WRITE module $capable_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$capable_mod"; then
      echo "error: Capable WRITE module imports FreestandingEmit: $capable_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$capable_mod"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $capable_mod" >&2
      exit 1
    fi
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel).
    _capable_load="${capable_mod%CapableWriteHc.lean}CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$_capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$_capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $_capable_load" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: RETIRE-OFFICIAL measured + StillUses false + perform claimed false.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs (B39 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'productPathOfficialPathRetireOfficialPartialReady' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireOfficialPartialReady in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: CAPABLE-GAP re-opened: productPathDualEqualityWriteParityGapOpen not false in $self_fs" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe; official path dual-eq regenerate.
    if ! grep -qF 'freestanding-retire-official' "$root_just"; then
      echo "error: missing freestanding-retire-official in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-retire-official-measure' "$root_just"; then
      echo "error: missing freestanding-retire-official-measure in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-retire-official' "$root_just"; then
      echo "error: missing slake-freestanding-retire-official in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'OfficialRetire' "$root_just"; then
      echo "error: missing OfficialRetire in $root_just" >&2
      exit 1
    fi
    if ! grep -q 'build:' "$root_just"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$root_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (official dual-eq WRITE)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (FreestandingEmit not retired)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-retire-official'; then
      echo "error: build cites freestanding-retire-official (measure path, not writer)" >&2
      exit 1
    fi
    # Prerequisite: B37 CAPABLE-GAP still green (Lake-free).
    just freestanding-perform-dual-equality-write-capable-gap
    echo "freestanding-retire-official: GREEN (B38 RETIRE-OFFICIAL; official dual-eq WRITE; StillUsesFreestandingEmit false; Blocks false; land-time OfficialRetire perform claimed false; SelfApplyFs living tip perform claimed true after B39; DependsOnLake true; CAPABLE-GAP closed)"

# Partial B38 measure print (Lake diagnostic; optional). RETIRE-OFFICIAL dual-pin is Lake-free above.
# Greppable: freestanding-retire-official-measure,
# slake-freestanding-retire-official,
# OfficialRetire
freestanding-retire-official-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-retire-official-measure (B38 RETIRE-OFFICIAL measure; land-time not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0"
    echo "  RETIRE-OFFICIAL measured true; dual-eq WRITE true; StillUsesFreestandingEmit false; OfficialRetire perform claimed false; SelfApplyFs living tip true after B39"
    echo "  not ownership claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/OfficialRetire.lean" ]]; then
      echo "error: missing SystemsLean OfficialRetire / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-retire-official-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-retire-official
      lake exe slake-freestanding-retire-official
    )
    echo "freestanding-retire-official-measure: GREEN (RETIRE-OFFICIAL measured true; dual-eq WRITE; StillUsesFreestandingEmit false; Full false)"

# Partial B39: freestanding product path PERFORM-CLAIMED beyond B38 RETIRE-OFFICIAL.
# productPathFreestandingPerformClaimed true with official dual-eq WRITE evidence
# (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed). Official path uses
# freestanding-capable-regenerate dual-eq WRITE; FreestandingEmit retired (B38).
# productPathFreestandingPerformClaimedMeasured true; DependsOnLake true;
# StillUsesLake true; ownership claimed false; complete false; CAPABLE-GAP closed.
# Greppable: freestanding-perform-claimed,
# productPathFreestandingPerformClaimedMeasured,
# FREESTANDING-PERFORM-CLAIMED,
# FREESTANDING-PERFORM-CLAIMED-MEASURED,
# FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE,
# FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED
freestanding-perform-claimed:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-perform-claimed (B39 PERFORM-CLAIMED; not ownership claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0"
    echo "  token: FREESTANDING-PERFORM-CLAIMED"
    echo "  framing: official dual-eq WRITE evidence; SelfApplyFs perform claimed true; ownership false"
    echo "  distinct from B38 freestanding-retire-official (RETIRE-OFFICIAL, land-time not claimed)"
    echo "  PERFORM-CLAIMED measured true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; not Full; not ownership; not complete"
    # PERFORM-CLAIMED module (short name PerformClaimed) must not import FreestandingEmit.
    claimed_mod="$lean_dir/PerformClaimed.lean"
    if [[ ! -f "$claimed_mod" ]]; then
      echo "error: missing PERFORM-CLAIMED module $claimed_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$claimed_mod"; then
      echo "error: PERFORM-CLAIMED module imports FreestandingEmit: $claimed_mod" >&2
      exit 1
    fi
    # PERFORM-CLAIMED module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformClaimedMeasured : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingPerformClaimedMeasured true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimedStepAdvanced : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingPerformClaimedStepAdvanced true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimed false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := false' "$claimed_mod"; then
      echo "error: missing freestandingProductSelfHostComplete false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED' "$claimed_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE' "$claimed_mod"; then
      echo "error: missing FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE in $claimed_mod" >&2
      exit 1
    fi
    # Capable WRITE dual-eq remains live (B37 evidence substrate).
    capable_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$capable_mod" ]]; then
      echo "error: missing Capable WRITE module $capable_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$capable_mod"; then
      echo "error: Capable WRITE module imports FreestandingEmit: $capable_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$capable_mod"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $capable_mod" >&2
      exit 1
    fi
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel).
    _capable_load="${capable_mod%CapableWriteHc.lean}CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$_capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$_capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $_capable_load" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: PERFORM-CLAIMED measured + perform claimed true + B38 retire.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'productPathFreestandingPerformClaimedPartialReady' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimedPartialReady in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: CAPABLE-GAP re-opened: productPathDualEqualityWriteParityGapOpen not false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostComplete true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $self_fs (B40 living tip)" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe; official path dual-eq regenerate.
    if ! grep -qF 'freestanding-perform-claimed' "$root_just"; then
      echo "error: missing freestanding-perform-claimed in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-perform-claimed-measure' "$root_just"; then
      echo "error: missing freestanding-perform-claimed-measure in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-perform-claimed' "$root_just"; then
      echo "error: missing slake-freestanding-perform-claimed in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'PerformClaimed' "$root_just"; then
      echo "error: missing PerformClaimed in $root_just" >&2
      exit 1
    fi
    if ! grep -q 'build:' "$root_just"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$root_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (official dual-eq WRITE)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (FreestandingEmit not retired)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-perform-claimed'; then
      echo "error: build cites freestanding-perform-claimed (measure path, not writer)" >&2
      exit 1
    fi
    # Prerequisite: B38 RETIRE-OFFICIAL still green (Lake-free).
    just freestanding-retire-official
    echo "freestanding-perform-claimed: GREEN (B39 PERFORM-CLAIMED; official dual-eq WRITE evidence; perform claimed true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; land-time PerformClaimed ownership false; SelfApplyFs living tip ownership claimed true after B40; complete false; CAPABLE-GAP closed)"

# Partial B39 measure print (Lake diagnostic; optional). PERFORM-CLAIMED dual-pin is Lake-free above.
# Greppable: freestanding-perform-claimed-measure,
# slake-freestanding-perform-claimed,
# PerformClaimed
freestanding-perform-claimed-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-claimed-measure (B39 PERFORM-CLAIMED measure; not ownership claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0"
    echo "  PERFORM-CLAIMED measured true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed with evidence"
    echo "  not ownership claimed; not residual free; not PROVABLY; not complete"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/PerformClaimed.lean" ]]; then
      echo "error: missing SystemsLean PerformClaimed / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-claimed-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-claimed
      lake exe slake-freestanding-perform-claimed
    )
    echo "freestanding-perform-claimed-measure: GREEN (PERFORM-CLAIMED measured true; perform claimed true; dual-eq WRITE; land-time ownership false; Full false; complete false)"

# Partial B40: freestanding product path OWNERSHIP-CLAIMED beyond B39 PERFORM-CLAIMED.
# productPathFreestandingOwnershipClaimed true with perform-claimed + official dual-eq
# WRITE evidence (FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed). Official path
# uses freestanding-capable-regenerate dual-eq WRITE; FreestandingEmit retired (B38).
# productPathFreestandingOwnershipClaimedMeasured true; DependsOnLake true;
# StillUsesLake true; Full false; complete false; CAPABLE-GAP closed.
# Greppable: freestanding-ownership-claimed,
# productPathFreestandingOwnershipClaimedMeasured,
# FREESTANDING-OWNERSHIP-CLAIMED,
# FREESTANDING-OWNERSHIP-CLAIMED-MEASURED,
# FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE,
# FREESTANDING-OWNERSHIP-CLAIMED-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
# FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED
freestanding-ownership-claimed:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-ownership-claimed (B40 OWNERSHIP-CLAIMED; not Full / complete) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0"
    echo "  token: FREESTANDING-OWNERSHIP-CLAIMED"
    echo "  framing: perform-claimed + official dual-eq WRITE evidence; SelfApplyFs ownership claimed true; living tip stepContractFull true after Full"
    echo "  distinct from B39 freestanding-perform-claimed (PERFORM-CLAIMED, land-time not ownership)"
    echo "  OWNERSHIP-CLAIMED measured true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; not Full; not complete"
    # OWNERSHIP-CLAIMED module (short name OwnershipClaimed) must not import FreestandingEmit.
    claimed_mod="$lean_dir/OwnershipClaimed.lean"
    if [[ ! -f "$claimed_mod" ]]; then
      echo "error: missing OWNERSHIP-CLAIMED module $claimed_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$claimed_mod"; then
      echo "error: OWNERSHIP-CLAIMED module imports FreestandingEmit: $claimed_mod" >&2
      exit 1
    fi
    # OWNERSHIP-CLAIMED module honesty pins.
    if ! grep -qF 'def productPathFreestandingOwnershipClaimedMeasured : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimedMeasured true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimedStepAdvanced : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimedStepAdvanced true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingCapableStepContractFullSatisfied : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathFreestandingCapableStepContractFullSatisfied false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := false' "$claimed_mod"; then
      echo "error: missing freestandingProductSelfHostComplete false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED' "$claimed_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE' "$claimed_mod"; then
      echo "error: missing FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE' "$claimed_mod"; then
      echo "error: missing FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE in $claimed_mod" >&2
      exit 1
    fi
    # Capable WRITE dual-eq remains live (B37 evidence substrate).
    capable_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$capable_mod" ]]; then
      echo "error: missing Capable WRITE module $capable_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$capable_mod"; then
      echo "error: Capable WRITE module imports FreestandingEmit: $capable_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$capable_mod"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $capable_mod" >&2
      exit 1
    fi
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel).
    _capable_load="${capable_mod%CapableWriteHc.lean}CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$_capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$_capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $_capable_load" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: OWNERSHIP-CLAIMED measured + ownership claimed true + B39 perform.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'productPathFreestandingOwnershipClaimedPartialReady' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimedPartialReady in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: CAPABLE-GAP re-opened: productPathDualEqualityWriteParityGapOpen not false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostComplete true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$self_fs"; then
      echo "error: missing stepContractFull true in $self_fs (Full living tip)" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe; official path dual-eq regenerate.
    if ! grep -qF 'freestanding-ownership-claimed' "$root_just"; then
      echo "error: missing freestanding-ownership-claimed in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-ownership-claimed-measure' "$root_just"; then
      echo "error: missing freestanding-ownership-claimed-measure in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-ownership-claimed' "$root_just"; then
      echo "error: missing slake-freestanding-ownership-claimed in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'OwnershipClaimed' "$root_just"; then
      echo "error: missing OwnershipClaimed in $root_just" >&2
      exit 1
    fi
    if ! grep -q 'build:' "$root_just"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$root_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (official dual-eq WRITE)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (FreestandingEmit not retired)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-ownership-claimed'; then
      echo "error: build cites freestanding-ownership-claimed (measure path, not writer)" >&2
      exit 1
    fi
    # Prerequisite: B39 PERFORM-CLAIMED still green (Lake-free; re-greens B38).
    just freestanding-perform-claimed
    echo "freestanding-ownership-claimed: GREEN (B40 OWNERSHIP-CLAIMED; perform-claimed + official dual-eq WRITE evidence; ownership claimed true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; land-time OwnershipClaimed Full long-name false; SelfApplyFs living tip stepContractFull true after Full; complete true after claim B; CAPABLE-GAP closed)"

# Partial B40 measure print (Lake diagnostic; optional). OWNERSHIP-CLAIMED dual-pin is Lake-free above.
# Greppable: freestanding-ownership-claimed-measure,
# slake-freestanding-ownership-claimed,
# OwnershipClaimed
freestanding-ownership-claimed-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-ownership-claimed-measure (B40 OWNERSHIP-CLAIMED measure; not Full / complete) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0"
    echo "  OWNERSHIP-CLAIMED measured true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed with evidence"
    echo "  not Full; not residual free; not PROVABLY; not complete"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/OwnershipClaimed.lean" ]]; then
      echo "error: missing SystemsLean OwnershipClaimed / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-ownership-claimed-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-ownership-claimed
      lake exe slake-freestanding-ownership-claimed
    )
    echo "freestanding-ownership-claimed-measure: GREEN (OWNERSHIP-CLAIMED measured true; ownership claimed true; perform claimed true; dual-eq WRITE; Full false; complete false)"


# Full freestanding-capable step-contract after B40 OWNERSHIP-CLAIMED.
# stepContractFull true with ownership-claimed + perform-claimed + official dual-eq
# WRITE evidence. Official path uses freestanding-capable-regenerate dual-eq WRITE;
# FreestandingEmit retired (B38). stepContractFullMeasured true; DependsOnLake true;
# StillUsesLake true; complete false; CAPABLE-GAP closed.
# Short living tip name stepContractFull (not productPathFreestandingCapable*).
# Greppable: freestanding-step-contract-full,
# stepContractFullMeasured,
# FREESTANDING-STEP-CONTRACT-FULL,
# FREESTANDING-STEP-CONTRACT-FULL-MEASURED,
# FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE,
# FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED,
# FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL
freestanding-step-contract-full:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    root_just="justfile"
    echo "== freestanding-step-contract-full (Full step-contract; not complete) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0"
    echo "  token: FREESTANDING-STEP-CONTRACT-FULL"
    echo "  framing: ownership-claimed + perform-claimed + official dual-eq WRITE evidence; SelfApplyFs stepContractFull true; complete true after claim B"
    echo "  distinct from B40 freestanding-ownership-claimed (OWNERSHIP-CLAIMED, land-time Full long-name false)"
    echo "  Full measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; complete true after claim B"
    # Full module (short name StepContractFull) must not import FreestandingEmit.
    full_mod="$lean_dir/StepContractFull.lean"
    if [[ ! -f "$full_mod" ]]; then
      echo "error: missing Full module $full_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$full_mod"; then
      echo "error: Full module imports FreestandingEmit: $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFullMeasured : Bool := true' "$full_mod"; then
      echo "error: missing stepContractFullMeasured true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFullStepAdvanced : Bool := true' "$full_mod"; then
      echo "error: missing stepContractFullStepAdvanced true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$full_mod"; then
      echo "error: missing stepContractFull true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$full_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$full_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$full_mod"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$full_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$full_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$full_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$full_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$full_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$full_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$full_mod"; then
      echo "error: missing freestandingProductSelfHostComplete true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL' "$full_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE' "$full_mod"; then
      echo "error: missing FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE' "$full_mod"; then
      echo "error: missing FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE in $full_mod" >&2
      exit 1
    fi
    # Capable WRITE dual-eq remains live (B37 evidence substrate).
    capable_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$capable_mod" ]]; then
      echo "error: missing Capable WRITE module $capable_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$capable_mod"; then
      echo "error: Capable WRITE module imports FreestandingEmit: $capable_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$capable_mod"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $capable_mod" >&2
      exit 1
    fi
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel); parent cites API name.
    capable_load="$lean_dir/CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $capable_load" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: Full measured + stepContractFull true + B40 ownership + B39 perform.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFullMeasured : Bool := true' "$self_fs"; then
      echo "error: missing stepContractFullMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$self_fs"; then
      echo "error: missing stepContractFull true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'stepContractFullPartialReady' "$self_fs"; then
      echo "error: missing stepContractFullPartialReady in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: CAPABLE-GAP re-opened: productPathDualEqualityWriteParityGapOpen not false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostComplete true in $self_fs" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe; official path dual-eq regenerate.
    if ! grep -qF 'freestanding-step-contract-full' "$root_just"; then
      echo "error: missing freestanding-step-contract-full in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-step-contract-full-measure' "$root_just"; then
      echo "error: missing freestanding-step-contract-full-measure in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-step-contract-full' "$root_just"; then
      echo "error: missing slake-freestanding-step-contract-full in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'StepContractFull' "$root_just"; then
      echo "error: missing StepContractFull in $root_just" >&2
      exit 1
    fi
    if ! grep -q 'build:' "$root_just"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$root_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (official dual-eq WRITE)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (FreestandingEmit not retired)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-step-contract-full'; then
      echo "error: build cites freestanding-step-contract-full (measure path, not writer)" >&2
      exit 1
    fi
    # Prerequisite: B40 OWNERSHIP-CLAIMED still green (Lake-free; re-greens B39/B38).
    just freestanding-ownership-claimed
    echo "freestanding-step-contract-full: GREEN (Full step-contract; ownership-claimed + perform-claimed + official dual-eq WRITE evidence; stepContractFull true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; complete true after claim B; CAPABLE-GAP closed)"

# Full measure print (Lake diagnostic; optional). Full dual-pin is Lake-free above.
# Greppable: freestanding-step-contract-full-measure,
# slake-freestanding-step-contract-full,
# StepContractFull
freestanding-step-contract-full-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-step-contract-full-measure (Full measure; not complete) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0"
    echo "  Full measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false"
    echo "  not complete; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.toml" || ! -f "$systems_dir/SystemsLean/StepContractFull.lean" ]]; then
      echo "error: missing SystemsLean StepContractFull / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-step-contract-full-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-step-contract-full
      lake exe slake-freestanding-step-contract-full
    )
    echo "freestanding-step-contract-full-measure: GREEN (Full measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE; complete true after claim B)"

# Partial B14 ordered host pipeline join (B6 plan order). Still Lake for middle steps.
# Orchestrates existing entrypoints: read -> compose -> write-hc -> install.
# Honest: NOT freestanding-capable close; productPathFreestandingPerformClaimed stays false.
# Greppable: regenerate-product-path, productPathFreestandingCapableOrderedPipelineRecipe,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP, WRITER-PATH-STEP-READ-SSOT,
# WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY, WRITER-PATH-STEP-WRITE-FREESTANDING-HC,
# WRITER-PATH-STEP-INSTALL-OUT

# ---------------------------------------------------------------------------
# freestanding-self-host-complete -- claim B freestanding product self-host complete
# after Full. Grep dual-pin + host elaborator proof while bootstrapping:
# SelfApplyFs complete true + SelfHostComplete + stepContractFull true +
# ownership/perform true + StillUsesFreestandingEmit false + residual free true
# (claim A) + llvm/PROVABLY false, then lake build/exe
# slake-freestanding-self-host-complete (fail closed if lake missing -- claim flip
# cannot GREEN on greps alone).
# Honesty: Lake is host bootstrap only (elaborate Systems Lean / Slake host
# sources). Not freestanding end-state product dependency. DependsOnLake /
# StillUsesLake stay true until freestanding path retires them. Short role module
# SelfHostComplete. Measure recipe remains a lake-only subset path.
# Greppable: freestanding-self-host-complete,
# freestandingProductSelfHostCompleteMeasured,
# SELF-HOST-FREESTANDING-PRODUCT-COMPLETE,
# FREESTANDING-PRODUCT-SELF-HOST-COMPLETE,
# SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0
# ---------------------------------------------------------------------------
freestanding-self-host-complete:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    lean_dir="$root/src/systems/SystemsLean"
    echo "== freestanding-self-host-complete (claim B complete after Full) =="
    echo "  framing: Full + ownership-claimed + perform-claimed + official dual-eq WRITE evidence; SelfApplyFs freestandingProductSelfHostComplete true; product residual free claimed (claim A)"
    echo "  complete measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; residual free true; llvm/PROVABLY false"
    complete_mod="$lean_dir/SelfHostComplete.lean"
    if [[ ! -f "$complete_mod" ]]; then
      echo "error: missing $complete_mod" >&2
      exit 1
    fi
    if grep -qF 'import SystemsLean.FreestandingEmit' "$complete_mod"; then
      echo "error: SelfHostComplete must not import FreestandingEmit" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostCompleteMeasured : Bool := true' "$complete_mod"; then
      echo "error: missing freestandingProductSelfHostCompleteMeasured true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostCompleteStepAdvanced : Bool := true' "$complete_mod"; then
      echo "error: missing freestandingProductSelfHostCompleteStepAdvanced true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$complete_mod"; then
      echo "error: missing freestandingProductSelfHostComplete true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$complete_mod"; then
      echo "error: missing stepContractFull true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$complete_mod"; then
      echo "error: missing ownership claimed true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$complete_mod"; then
      echo "error: missing perform claimed true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$complete_mod"; then
      echo "error: missing dual-eq WRITE true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$complete_mod"; then
      echo "error: missing StillUsesFreestandingEmit false in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$complete_mod"; then
      echo "error: missing StillUsesLake true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$complete_mod"; then
      echo "error: missing DependsOnLake true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def residualFreeClaimed : Bool := true' "$complete_mod"; then
      echo "error: missing residualFreeClaimed true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def llvmUnlocked : Bool := false' "$complete_mod"; then
      echo "error: missing llvmUnlocked false in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def provablyUnlocked : Bool := false' "$complete_mod"; then
      echo "error: missing provablyUnlocked false in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0' "$complete_mod"; then
      echo "error: missing stage id in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-PRODUCT-SELF-HOST-COMPLETE' "$complete_mod"; then
      echo "error: missing FREESTANDING-PRODUCT-SELF-HOST-COMPLETE in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'SELF-HOST-FREESTANDING-PRODUCT-COMPLETE' "$complete_mod"; then
      echo "error: missing SELF-HOST-FREESTANDING-PRODUCT-COMPLETE in $complete_mod" >&2
      exit 1
    fi
    if grep -qF 'def freestandingProductSelfHostComplete : Bool := false' "$complete_mod"; then
      echo "error: SelfHostComplete must not pin complete false" >&2
      exit 1
    fi
    # Capable WRITE dual-eq live remains (requireDualSsotEqual def on Load peel).
    capable_mod="$lean_dir/CapableWriteHc.lean"
    capable_load="$lean_dir/CapableWriteHcLoad.lean"
    if [[ -f "$capable_mod" ]]; then
      if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$capable_mod"; then
        echo "error: missing productPathCapableWriteDualEqualityLive true in $capable_mod" >&2
        exit 1
      fi
      if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
          && ! { [[ -f "$capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$capable_load"; }; then
        echo "error: missing requireDualSsotEqual in $capable_mod or $capable_load" >&2
        exit 1
      fi
    fi
    # SelfApplyFs dual-pin living tip
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostCompleteMeasured : Bool := true' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostCompleteMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostComplete true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$self_fs"; then
      echo "error: missing stepContractFull true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$self_fs"; then
      echo "error: missing ownership claimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing perform claimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$self_fs"; then
      echo "error: missing dual-eq WRITE true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing StillUsesFreestandingEmit false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$self_fs"; then
      echo "error: missing StillUsesLake true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$self_fs"; then
      echo "error: missing DependsOnLake true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingProductSelfHostCompletePartialReady' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostCompletePartialReady in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'stepContractFullPartialReady' "$self_fs"; then
      echo "error: missing stepContractFullPartialReady in $self_fs" >&2
      exit 1
    fi
    if grep -qF 'def freestandingProductSelfHostComplete : Bool := false' "$self_fs"; then
      echo "error: SelfApplyFs must not pin complete false after claim B complete" >&2
      exit 1
    fi
    # justfile self-cites
    root_just="$root/justfile"
    if ! grep -qF 'freestanding-self-host-complete' "$root_just"; then
      echo "error: missing freestanding-self-host-complete in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-self-host-complete-measure' "$root_just"; then
      echo "error: missing freestanding-self-host-complete-measure in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-self-host-complete' "$root_just"; then
      echo "error: missing slake-freestanding-self-host-complete in $root_just" >&2
      exit 1
    fi
    if ! grep -qF 'SelfHostComplete' "$root_just"; then
      echo "error: missing SelfHostComplete cite in $root_just" >&2
      exit 1
    fi
    # official path still dual-eq regenerate; not complete recipe as writer
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$root_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build must use freestanding-capable-regenerate" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-self-host-complete'; then
      echo "error: build cites freestanding-self-host-complete (measure path, not writer)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build must not use slake-emit-freestanding-c as writer" >&2
      exit 1
    fi
    # Re-green Full (prerequisite)
    just freestanding-step-contract-full
    # Claim flip requires lake elaboration when lake is on PATH (not grep-only GREEN).
    # Fail closed if lake missing so agents cannot treat incomplete proof as done.
    if command -v lake >/dev/null 2>&1; then
      echo "  lake on PATH: building slake-freestanding-self-host-complete (claim elaborator proof)"
      (
        cd "$root/src/systems"
        lake build slake-freestanding-self-host-complete
        lake exe slake-freestanding-self-host-complete
      )
      echo "  lake claim proof: GREEN"
    else
      echo "warning: lake not on PATH; grep pins only -- claim elaborator proof BLOCKED (not full GREEN for claim flip)" >&2
      echo "error: freestanding-self-host-complete requires lake on PATH for claim-B complete proof" >&2
      exit 1
    fi
    echo "freestanding-self-host-complete: GREEN (claim B complete; Full + ownership-claimed + perform-claimed + official dual-eq WRITE evidence; freestandingProductSelfHostComplete true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; residual free true; llvm/PROVABLY false; CAPABLE-GAP closed; lake claim proof ran)"

# Greppable: freestanding-self-host-complete-measure,
# slake-freestanding-self-host-complete,
freestanding-self-host-complete-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    echo "== freestanding-self-host-complete-measure (claim B complete measure) =="
    echo "  complete measured true; freestandingProductSelfHostComplete true; stepContractFull true"
    echo "  ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false"
    echo "  residual free true (claim A); llvm/PROVABLY false"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-self-host-complete-measure requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$root/src/systems"
      lake build slake-freestanding-self-host-complete
      lake exe slake-freestanding-self-host-complete
    )
    echo "freestanding-self-host-complete-measure: GREEN (complete measured true; freestandingProductSelfHostComplete true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE; residual free true; llvm false)"

regenerate-product-path:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== regenerate-product-path (B14 ordered host pipeline join; not freestanding-capable close) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
    echo "  order: read-product-ssot -> compose-product-plan -> write-freestanding-hc -> install-freestanding-c-out"
    echo "  honest: middle steps still classic Lean Lake; install-only is Lake-free when emit present"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    just read-product-ssot
    just compose-product-plan
    just write-freestanding-hc
    just install-freestanding-c-out
    echo "regenerate-product-path: GREEN (host ordered join only; freestanding-capable full perform stays false)"

# Lake-free install-only entrypoint (partial B10 / SELF-HOST-PRODUCT-PATH-PERFORM-STEP).
# Shared install half for full path (just build may call install-only after emit).
# Copies emit slake_freestanding.{h,c} into out/freestanding-c when already present.
# Does NOT run lake build / lake exe / FreestandingEmit. Fail closed if emit missing.
# Full regenerate still requires just build (Lake). Install-only is not
# freestanding perform claimed (read/compose/write still Lake). Thin process glue only.
# Greppable: install-freestanding-c-out, productPathPerformInstallLakeFreeEntrypointClaimed,
# SELF-HOST-PRODUCT-PATH-PERFORM-STEP, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0
install-freestanding-c-out:
    #!/usr/bin/env bash
    set -euo pipefail
    dest=out/freestanding-c
    emit_dir="src/systems/emit"
    mkdir -p "$dest"
    echo "== install freestanding-c out (Lake-free) -> $dest =="
    echo "  Lake-free install-only: cp emit wire when present; no lake build/exe"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$dest/README.md" ]]; then
      echo "error: missing $dest/README.md" >&2
      exit 1
    fi
    if [[ ! -f "$emit_dir/slake_freestanding.h" || ! -f "$emit_dir/slake_freestanding.c" ]]; then
      echo "error: emit wire missing under $emit_dir (need slake_freestanding.h and .c)" >&2
      echo "  run just build first (Lake emit), then retry install-only." >&2
      exit 1
    fi
    mapfile -t artifacts < <(find "$emit_dir" -type f \( -name 'slake_freestanding.c' -o -name 'slake_freestanding.h' \) 2>/dev/null | sort || true)
    if [[ ${#artifacts[@]} -eq 0 ]]; then
      echo "error: no slake_freestanding.c/.h under $emit_dir to copy into $dest" >&2
      exit 1
    fi
    for stale in "$dest"/*.c "$dest"/*.h; do
      if [[ -f "$stale" ]]; then
        rm -f "$stale"
        echo "  remove stale: $stale"
      fi
    done
    copied=0
    for src in "${artifacts[@]}"; do
      base=$(basename "$src")
      cp -f "$src" "$dest/$base"
      echo "  copy: $src -> $dest/$base"
      copied=$((copied + 1))
    done
    echo "install-freestanding-c-out: copied ${copied} product file(s) into $dest"
    echo "  Lake-free install entrypoint only; read/compose/write still Lake (B9 gap)"
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0 (not freestanding perform claimed)"

# Package out/freestanding-c for consumers (tarball). Does not publish git.
# Prefer git subtree for long-lived consumer trees (see out/freestanding-c/README.md).
# Regenerates product wire first. Not residual free; not PROVABLY.
export-freestanding-c: build
    #!/usr/bin/env bash
    set -euo pipefail
    dest=out/freestanding-c
    mkdir -p .cache
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    archive=".cache/systems-lean-freestanding-c-${stamp}.tar.gz"
    if [[ ! -f "$dest/README.md" || ! -f "$dest/slake_freestanding.c" || ! -f "$dest/slake_freestanding.h" ]]; then
      echo "error: incomplete release surface under $dest" >&2
      exit 1
    fi
    tar -czf "$archive" -C out freestanding-c
    echo "export-freestanding-c: wrote $archive"
    echo "  consumer tree is product wire only (no ref/*, no host elaborator required)"
    echo "  not residual free; not PROVABLY"
    echo "  subtree publish: see out/freestanding-c/README.md"

# LLVM IR release surface (deferred until self-hosted Systems Lean / Slake).
out-llvm-ir:
    @echo "out-llvm-ir: deferred until self-hosted Systems Lean in Slake (see out/llvm-ir/README.md)"

# Pre-commit path.
pre-commit: check

# Pure Nix progress meters -> doc/PROGRESS.md + console summary.
progress:
    mkdir -p doc
    nix eval --impure --raw --expr {{quote(_progress_report)}} > doc/PROGRESS.md
    nix eval --impure --raw --expr {{quote(_progress_console)}}
    @echo "wrote doc/PROGRESS.md"

# Progress meters plus scc novel snapshot (size appendix; scc is an external binary).
# Honest novel excludes: ref (upstream), skills (agent skill submodules), .lake, .cache, .git.
# Product wire C and behavioral tests remain in the count; they are permanent roles.
progress-scc: progress
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p doc .cache
    set +e
    scc . --exclude-dir .git --exclude-dir ref --exclude-dir skills --exclude-dir .lake --exclude-dir .cache \
      > .cache/last-scc.txt 2>&1
    scc_rc=$?
    set -e
    tr -cd '\11\12\15\40-\176\n' < .cache/last-scc.txt > .cache/last-scc.ascii
    {
      echo "# scc novel snapshot (generated)"
      echo ""
      echo "Exit: $scc_rc"
      echo "Generator: just progress-scc (scc from PATH / nixpkgs)"
      echo "Excludes: .git ref skills .lake .cache (honest novel; not freestanding vs classic AOT confusion)"
      echo ""
      echo '```'
      head -n 80 .cache/last-scc.ascii
      echo '```'
      echo ""
      echo "SPDX-License-Identifier: Unlicense"
    } > doc/PROGRESS-scc.txt
    {
      echo ""
      echo "## Code size (\`scc\` novel)"
      echo ""
      echo "Exit: $scc_rc -- full snapshot: \`doc/PROGRESS-scc.txt\`"
      echo "Excludes: .git ref skills .lake .cache"
      echo ""
      echo '```'
      head -n 22 .cache/last-scc.ascii
      echo '```'
    } >> doc/PROGRESS.md
    echo "scc novel snapshot -> doc/PROGRESS-scc.txt (rc=$scc_rc)"

# Pure Nix source hygiene (ASCII + no trailing WS) plus professional-tone
# (novel *.md banned tokens). Live impure worktree eval; no git stage needed.
hygiene:
    @nix eval --impure --raw --expr {{quote(_hygiene)}}

# Pure Nix professional tone / profanity gate on novel markdown only (v1).
# Also folded into just hygiene. Live impure worktree eval.
professional-tone:
    @nix eval --impure --raw --expr {{quote(_professional_tone)}}

# Bootstrap S1 first Slake compiler surface: Mult unit input -> structural
# readiness (COMPILE-PATH-MULT / unitCompileReady + HOST-EMIT-MULT honesty).
# Lake host elaborator remains (StillUsesLake / DependsOnLake). Not full
# product-wire regenerate; not S3 self-application; not S4 Lake retire.
# Greppable: first-surface, slake-first-surface, FIRST-SURFACE,
# SLAKE_FIRST_SURFACE, SLAKE_FIRST_SURFACE_MULT, firstSurfaceReady.
first-surface:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    echo "== first-surface (bootstrap S1 Mult unit compiler surface) =="
    echo "  input: SLAKE_FIRST_SURFACE_MULT (COMPILE-PATH-MULT / MULT-FIXTURE)"
    echo "  output: firstSurfaceReady (unitCompileReady + HOST-EMIT-MULT); Lake host remains"
    mod="$lean_dir/FirstSurface.lean"
    main_mod="$lean_dir/FirstSurfaceMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'firstSurfaceReady' "$mod"; then
      echo "error: missing firstSurfaceReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_FIRST_SURFACE_MULT' "$mod"; then
      echo "error: missing SLAKE_FIRST_SURFACE_MULT in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; first-surface requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-first-surface
      lake exe slake-first-surface
    )
    echo "first-surface: GREEN (S1 Mult unit input -> structural readiness; Lake host remains; not S3/S4; not PROVABLY/llvm)"

# Bootstrap S2 Mult subset freestanding emit: S1 Mult input identity -> written
# Mult unit package (slake_mult_subset.{h,c}) reusing HOST-EMIT-MULT dialect.
# Not full freestanding API dialect rewrite as sole success. Lake host remains.
# Greppable: mult-subset-emit, slake-mult-subset-emit, MULT-SUBSET-EMIT,
# SLAKE_MULT_SUBSET_EMIT, multSubsetEmitReady, slake_mult_subset.h.
mult-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    echo "== mult-subset-emit (bootstrap S2 Mult subset freestanding emit) =="
    echo "  input: SLAKE_FIRST_SURFACE_MULT (S1 FirstSurface)"
    echo "  output: Mult unit package slake_mult_subset.h/.c (HOST-EMIT-MULT); Lake host remains"
    mod="$lean_dir/MultSubsetEmit.lean"
    main_mod="$lean_dir/MultSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetEmitReady' "$mod"; then
      echo "error: missing multSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_FIRST_SURFACE_MULT' "$mod"; then
      echo "error: missing SLAKE_FIRST_SURFACE_MULT in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetEmitWrite' "$mod"; then
      echo "error: missing multSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; mult-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-mult-subset-emit
      lake exe slake-mult-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in MULT-SUBSET-EMIT SLAKE_MULT_SUBSET_EMIT_V0 SLAKE_FIRST_SURFACE_MULT HOST-EMIT-MULT MULT-0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'enum slake_mult' "$out_h"; then
      echo "error: $out_h missing enum slake_mult" >&2
      exit 1
    fi
    if ! grep -qF 'slake_mult_is_valid' "$out_c"; then
      echo "error: $out_c missing slake_mult_is_valid" >&2
      exit 1
    fi
    echo "mult-subset-emit: GREEN (S2 Mult unit package wrote; subset emit evidence; Lake host remains; not S3/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Linear subset freestanding emit: COMPILE-PATH-LINEAR Linear unit
# input identity -> written Linear unit package (slake_linear_subset.{h,c}) reusing
# HOST-EMIT-LINEAR dialect. Not full freestanding API dialect rewrite as sole
# success. Lake host remains.
# Greppable: linear-subset-emit, slake-linear-subset-emit, LINEAR-SUBSET-EMIT,
# SLAKE_LINEAR_SUBSET_EMIT, linearSubsetEmitReady, slake_linear_subset.h.
linear-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_linear_subset.h"
    out_c="$emit_dir/slake_linear_subset.c"
    echo "== linear-subset-emit (ideal ladder M1 Linear subset freestanding emit) =="
    echo "  input: SLAKE_LINEAR_SUBSET_LINEAR (COMPILE-PATH-LINEAR / LINEAR-FIXTURE)"
    echo "  output: Linear unit package slake_linear_subset.h/.c (HOST-EMIT-LINEAR); Lake host remains"
    mod="$lean_dir/LinearSubsetEmit.lean"
    main_mod="$lean_dir/LinearSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetEmitReady' "$mod"; then
      echo "error: missing linearSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_LINEAR' "$mod"; then
      echo "error: missing SLAKE_LINEAR_SUBSET_LINEAR in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetEmitWrite' "$mod"; then
      echo "error: missing linearSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; linear-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-linear-subset-emit
      lake exe slake-linear-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Linear subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Linear subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in LINEAR-SUBSET-EMIT SLAKE_LINEAR_SUBSET_EMIT_V0 SLAKE_LINEAR_SUBSET_LINEAR HOST-EMIT-LINEAR LINEAR-EXACT-ONCE; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_linear_token' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_linear_token" >&2
      exit 1
    fi
    if ! grep -qF 'slake_consume_token_consume' "$out_c"; then
      echo "error: $out_c missing slake_consume_token_consume" >&2
      exit 1
    fi
    echo "linear-subset-emit: GREEN (M1 Linear unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# M1 Linear subset rebuild / self-application: M1 Linear package identity
# -> re-emit/re-validate Linear unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: linear-subset-rebuild, slake-linear-subset-rebuild, LINEAR-SUBSET-REBUILD,
# SLAKE_LINEAR_SUBSET_REBUILD, linearSubsetRebuildReady, linearSubsetRebuildSelfApplyOk.
linear-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_linear_subset.h"
    out_c="$emit_dir/slake_linear_subset.c"
    echo "== linear-subset-rebuild (M1 Linear subset self-application) =="
    echo "  input: SLAKE_LINEAR_SUBSET_EMIT_V0 / linearSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Linear unit package; linearSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/LinearSubsetRebuild.lean"
    main_mod="$lean_dir/LinearSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildReady' "$mod"; then
      echo "error: missing linearSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing linearSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildWrite' "$mod"; then
      echo "error: missing linearSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_LINEAR_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; linear-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-linear-subset-rebuild
      lake exe slake-linear-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Linear subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Linear subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in LINEAR-SUBSET-EMIT SLAKE_LINEAR_SUBSET_EMIT_V0 SLAKE_LINEAR_SUBSET_LINEAR HOST-EMIT-LINEAR LINEAR-EXACT-ONCE; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_linear_token' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_linear_token" >&2
      exit 1
    fi
    if ! grep -qF 'slake_consume_token_consume' "$out_c"; then
      echo "error: $out_c missing slake_consume_token_consume" >&2
      exit 1
    fi
    if ! grep -qF 'linearSubsetRebuildReady' "$mod"; then
      echo "error: linearSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_LINEAR_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_LINEAR_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "linear-subset-rebuild: GREEN (M1 Linear subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# Bootstrap S3 Mult subset rebuild / self-application: S2 Mult package identity
# -> re-emit/re-validate Mult unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: mult-subset-rebuild, slake-mult-subset-rebuild, MULT-SUBSET-REBUILD,
# SLAKE_MULT_SUBSET_REBUILD, multSubsetRebuildReady, multSubsetRebuildSelfApplyOk.
mult-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    echo "== mult-subset-rebuild (bootstrap S3 Mult subset self-application) =="
    echo "  input: SLAKE_MULT_SUBSET_EMIT_V0 / multSubsetEmitReady (S2 package identity)"
    echo "  output: re-emit/re-validate Mult unit package; multSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/MultSubsetRebuild.lean"
    main_mod="$lean_dir/MultSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildReady' "$mod"; then
      echo "error: missing multSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing multSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWrite' "$mod"; then
      echo "error: missing multSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing S2 package input pin SLAKE_MULT_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; mult-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-mult-subset-rebuild
      lake exe slake-mult-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in MULT-SUBSET-EMIT SLAKE_MULT_SUBSET_EMIT_V0 SLAKE_FIRST_SURFACE_MULT HOST-EMIT-MULT MULT-0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'enum slake_mult' "$out_h"; then
      echo "error: $out_h missing enum slake_mult" >&2
      exit 1
    fi
    if ! grep -qF 'slake_mult_is_valid' "$out_c"; then
      echo "error: $out_c missing slake_mult_is_valid" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildReady' "$mod"; then
      echo "error: multSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_MULT_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "mult-subset-rebuild: GREEN (S3 Mult subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# Pure Nix systems host presence (skeleton + unit-surface + SYSTEMS_LEAN_HOST +
# tree-wide banned-jargon walk under src/systems). Live impure worktree eval.
systems-host:
    @nix eval --impure --raw --expr {{quote(_systems_host)}}

# Pure Nix systems emit-wire presence (drivers, UNIT_DEEPEN, emit product stages,
# unit-surface walk, optional release surface, PRODUCT-RESIDUAL-FREE-MEASURE).
# Live impure worktree eval. Claim A residual free measure runs when
# out/freestanding-c is present; residualFreeClaimed true when DualResidual free.
systems-emit-wire:
    @nix eval --impure --raw --expr {{quote(_systems_emit_wire)}}

# Alias: claim A product residual free measurement (same pure eval as emit-wire).
# Greppable: PRODUCT-RESIDUAL-FREE-MEASURE, SELF-HOST-RESIDUAL-FREE-MEASURE.
# Does not flip residual free; forges nothing. Prefer systems-emit-wire in check.
product-residual-free-measure: systems-emit-wire

# Pure Nix Idris-side dual presence (required files + tokens + examples jargon).
# Live impure worktree eval. Thin src/idris2/check.sh is optional elaborator only.
idris-side:
    @nix eval --impure --raw --expr {{quote(_idris_side)}}

# Pure Nix Lean-side dual presence (required files + tokens + examples jargon).
# Live impure worktree eval. Thin src/lean4/check.sh is optional Lake only.
lean-side:
    @nix eval --impure --raw --expr {{quote(_lean_side)}}

# Poll: meters + scc + hygiene. Interval is loop sleep, not cycle cost.
# Override: WATCH_INTERVAL=60 just watch
watch:
    #!/usr/bin/env bash
    set -euo pipefail
    INTERVAL="${WATCH_INTERVAL:-300}"
    LOG="${WATCH_LOG:-doc/progress-log.md}"
    mkdir -p doc .cache
    if [[ ! -s "$LOG" ]]; then
      printf '%s\n' \
        '# Fork progress log' \
        '' \
        'Append-only cycle notes from just watch.' \
        'Each cycle: pure Nix progress meters + scc . + just hygiene (source-hygiene + professional-tone).' \
        'ASCII only. Tooling is pure Nix modules under nix/; just orchestrates.' \
        '' >"$LOG"
    fi
    echo "systems-lean watch: interval=${INTERVAL}s log=$LOG"
    echo "note: process elapsed time is loop uptime, not cycle cost"
    cycle=0
    while true; do
      cycle=$((cycle + 1))
      ts=$(date -Is 2>/dev/null || date)
      echo ""
      echo "======== watch cycle $cycle @ $ts ========"
      just progress-scc || true
      set +e
      just hygiene
      hyg_rc=$?
      set -e
      {
        echo "## cycle $cycle -- $ts"
        echo ""
        echo "- progress: just progress-scc"
        echo "- hygiene rc=$hyg_rc"
        echo "- see doc/PROGRESS.md and doc/PROGRESS-scc.txt"
        echo ""
      } >>"$LOG"
      echo "sleeping ${INTERVAL}s..."
      sleep "$INTERVAL"
    done
