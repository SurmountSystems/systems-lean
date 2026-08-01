# Systems Lean -- thin task runner only (https://github.com/casey/just)
# Three languages only for novel work: Idris 2, Lean 4 (Slake/Systems Lean), pure Nix.
# just orchestrates (redirects, loops). Does not host product or tooling algorithms.
# Process glue: thin just recipes (elaborators / cc) + optional script/git-hooks/pre-commit.
# Novel workspace check.sh deleted; static mills are pure Nix under nix/.
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

# Full suite: product wire first (just build), then pure gates + flake + process glue.
# Live pure gates (systems-host, systems-emit-wire, idris-side, lean-side, hygiene)
# use impure eval of the worktree and do not require new nix/ files to be
# git-tracked. nix flake check only sees tracked files -- after adding under
# nix/ (or related flake copy paths), the human must stage those paths before
# flake/continuous integration (CI) match. Agents never git add / stage / commit
# to silence flake WARN (human-in-the-loop (HITL) stage; see AGENTS.md Nix tooling).
# On flake failure, elaborator/cc recipes still run; suite exits non-zero.
# SYSTEMS_PRODUCT_WIRE_FRESH=1 tells systems-cc-probe to skip a second just build.
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
    just idris-elaborate
    just lean-elaborate
    just systems-lake
    just systems-cc-probe
    if [[ "$flake_rc" -ne 0 ]]; then
      echo "check incomplete: flake rc=$flake_rc (live pure gates + elaborator recipes ran)" >&2
      exit "$flake_rc"
    fi
    echo "check OK"

# Product freestanding wire: regenerate emit + out/freestanding-c.
# M4 Name C (official without-Lake hot path): prefer Name B host-cc freestanding
# writer (product-wire-freestanding-write), else Name A prebuilt regenerate
# (freestanding-capable-regenerate-without-lake). No lake build/exe/env on hot path.
# B38 dual-eq WRITE authority remains (Capable* / freestandingCapableWriteFreestandingHc
# substrate; freestanding-capable-regenerate Lake path stays diagnostic).
# NOT FreestandingEmit / slake-emit-freestanding-c as official writer.
# Fail closed if neither Name B tool C + cc nor Name A prebuilt is available.
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# SLAKE_COMPILE_PATH_V0: retired shell stamp (deleted). Static compile-path /
# unit walk: just systems-emit-wire + just systems-host (HOST-COMPILE-PATH /
# SLAKE_COMPILE_PATH_V1 in SystemsLean/CompilePath.lean). Not product C.
# No separate out-freestanding-c recipe (retired; former stamp-only build deleted).
# Release dir stays out/freestanding-c/. Not residual free; not PROVABLY.
# Greppable: product-wire-freestanding-write, freestanding-capable-regenerate-without-lake,
# freestanding-capable-regenerate, PRODUCT-WIRE-WITHOUT-LAKE, M4 Name C.
build:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    dest=out/freestanding-c
    emit_dir="src/systems/emit"
    systems_dir="src/systems"
    tool_c="$emit_dir/slake_product_wire_fs_write_tool.c"
    prebuilt="$systems_dir/.lake/build/bin/slake-freestanding-capable-regenerate"
    mkdir -p "$dest"
    echo "== just build (product freestanding wire; M4 Name C without-Lake hot path) -> $dest =="
    echo "Release: runtimeless product C (no Lean managed runtime / product GC on the wire)."
    echo "  not residual free; not PROVABLY"
    echo "  SLAKE_COMPILE_PATH_V0: retired shell stamp; static: systems-emit-wire + systems-host"
    echo "  SLAKE_COMPILE_PATH_V1 / HOST-COMPILE-PATH: SystemsLean/CompilePath.lean (not product C)"
    echo "  emit: freestanding dual-eq WRITE without lake on hot path (B38 RETIRE-OFFICIAL substrate)"
    echo "  prefer: product-wire-freestanding-write (Name B host-cc); else freestanding-capable-regenerate-without-lake (Name A)"
    echo "  authority: freestandingCapableOrderedRegenerate / freestandingCapableWriteFreestandingHc"
    echo "  not FreestandingEmit (retired as official product writer; diagnostic Lake path remains)"
    echo "  product StillUsesLake true until M6 (host elaborator residual remains)"
    if [[ ! -f "$dest/README.md" ]]; then
      echo "error: missing $dest/README.md" >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/CapableRegenerate.lean" ]]; then
      echo "error: freestanding-capable regenerate missing under $systems_dir" >&2
      echo "  residual requires freestanding dual-eq WRITE official path (B38 RETIRE-OFFICIAL)." >&2
      exit 1
    fi
    if [[ ! -f "$systems_dir/SystemsLean/CapableWriteHc.lean" ]]; then
      echo "error: Capable dual-eq WRITE module missing under $systems_dir" >&2
      exit 1
    fi
    # M4 Name C: no lake on hot path. Prefer Name B freestanding host-cc writer;
    # fall back to Name A prebuilt freestanding-capable-regenerate (substring keeps
    # B38 living-tip greps honest about dual-eq regenerate substrate).
    if [[ -f "$tool_c" ]] && command -v cc >/dev/null 2>&1; then
      echo "  hot path: product-wire-freestanding-write (Name B host-cc; no lake)"
      just product-wire-freestanding-write
      echo "build: product-wire-freestanding-write (M4 Name B/C dual-eq WRITE+INSTALL) done"
    elif [[ -x "$prebuilt" ]]; then
      echo "  hot path: freestanding-capable-regenerate-without-lake (Name A prebuilt; no lake)"
      just freestanding-capable-regenerate-without-lake
      echo "build: freestanding-capable-regenerate-without-lake (M4 Name A/C dual-eq WRITE) done"
    else
      echo "error: official without-Lake product wire missing both measured writers" >&2
      echo "  Name B: need $tool_c and host cc on PATH" >&2
      echo "    bootstrap once: (cd $systems_dir && lake build slake-product-wire-fs-write-tool && lake exe slake-product-wire-fs-write-tool -- $root)" >&2
      echo "  Name A: need executable prebuilt $prebuilt" >&2
      echo "    bootstrap once: (cd $systems_dir && lake build slake-freestanding-capable-regenerate)" >&2
      echo "  then re-run: just build" >&2
      exit 1
    fi
    # Dual evidence after without-Lake write (emit + Out stage tokens).
    out_h="$emit_dir/slake_freestanding.h"
    out_c="$emit_dir/slake_freestanding.c"
    install_h="$dest/slake_freestanding.h"
    install_c="$dest/slake_freestanding.c"
    for path in "$out_h" "$out_c" "$install_h" "$install_c"; do
      if [[ ! -f "$path" ]]; then
        echo "error: missing freestanding product path after build: $path" >&2
        exit 1
      fi
    done
    for tok in SLAKE_EMIT_FREESTANDING_C_V0 HOST-EMIT-MULT HOST-EMIT-LINEAR HOST-EMIT-SSOT; do
      for path in "$out_h" "$out_c" "$install_h" "$install_c"; do
        if ! grep -qF "$tok" "$path"; then
          echo "error: $path missing greppable token $tok after without-Lake build" >&2
          exit 1
        fi
      done
    done
    echo "  not residual free; not PROVABLY; no product GC; not Lean managed runtime"
    echo "  stage: freestanding dual-eq WRITE official without-Lake path + UNIT_DEEPEN_V1"
    echo "  product path: just build -> emit + out/freestanding-c (no lake on hot path)"

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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/ProductPathReadSsot.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/ProductPathComposePlan.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/ProductPathWriteHc.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/PerformEvidence.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/OfficialPath.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/OfficialPathAlternate.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/DualEqWriteParity.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/DualEqWriteClosePath.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/DualEqWriteApi.lean" ]]; then
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/DualEqWriteCapableGap.lean" ]]; then
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
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$retire_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake false (M6) in $retire_mod" >&2
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
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$retire_mod"; then
      echo "error: missing productPathPerformDependsOnLake false (M6) in $retire_mod" >&2
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/OfficialRetire.lean" ]]; then
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
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake false (M6) in $claimed_mod" >&2
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
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathPerformDependsOnLake false (M6) in $claimed_mod" >&2
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/PerformClaimed.lean" ]]; then
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
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake false (M6) in $claimed_mod" >&2
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
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathPerformDependsOnLake false (M6) in $claimed_mod" >&2
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/OwnershipClaimed.lean" ]]; then
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
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$full_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake false (M6) in $full_mod" >&2
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
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$full_mod"; then
      echo "error: missing productPathPerformDependsOnLake false (M6) in $full_mod" >&2
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
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/StepContractFull.lean" ]]; then
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
# Honesty: product path StillUsesLake / DependsOnLake false after M6 (living tip).
# Host elaborator residual may remain (DualResidual). Short role module
# SelfHostComplete. Measure recipe remains a lake-only claim-proof path.
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
    echo "  complete measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake false; StillUsesLake false (M6); residual free true; llvm/PROVABLY false"
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
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$complete_mod"; then
      echo "error: missing StillUsesLake false (M6) in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$complete_mod"; then
      echo "error: missing DependsOnLake false (M6) in $complete_mod" >&2
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
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$self_fs"; then
      echo "error: missing StillUsesLake false (M6) in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$self_fs"; then
      echo "error: missing DependsOnLake false (M6) in $self_fs" >&2
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
    echo "freestanding-self-host-complete: GREEN (claim B complete; Full + ownership-claimed + perform-claimed + official dual-eq WRITE evidence; freestandingProductSelfHostComplete true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake false; StillUsesLake false (M6); residual free true; llvm/PROVABLY false; CAPABLE-GAP closed; lake claim proof ran)"

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

# Ideal ladder M1 Types subset freestanding emit: COMPILE-PATH-TYPES Types unit
# input identity -> written Types unit package (slake_types_subset.{h,c}) reusing
# HOST-EMIT-TYPES dialect. Not full freestanding API dialect rewrite as sole
# success. Lake host remains.
# Greppable: types-subset-emit, slake-types-subset-emit, TYPES-SUBSET-EMIT,
# SLAKE_TYPES_SUBSET_EMIT, typesSubsetEmitReady, slake_types_subset.h.
types-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_types_subset.h"
    out_c="$emit_dir/slake_types_subset.c"
    echo "== types-subset-emit (ideal ladder M1 Types subset freestanding emit) =="
    echo "  input: SLAKE_TYPES_SUBSET_TYPES (COMPILE-PATH-TYPES / TYPES-FIXTURE)"
    echo "  output: Types unit package slake_types_subset.h/.c (HOST-EMIT-TYPES); Lake host remains"
    mod="$lean_dir/TypesSubsetEmit.lean"
    main_mod="$lean_dir/TypesSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetEmitReady' "$mod"; then
      echo "error: missing typesSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_TYPES' "$mod"; then
      echo "error: missing SLAKE_TYPES_SUBSET_TYPES in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetEmitWrite' "$mod"; then
      echo "error: missing typesSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; types-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-types-subset-emit
      lake exe slake-types-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Types subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Types subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in TYPES-SUBSET-EMIT SLAKE_TYPES_SUBSET_EMIT_V0 SLAKE_TYPES_SUBSET_TYPES HOST-EMIT-TYPES TYPED_IR_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_type_tag' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_type_tag" >&2
      exit 1
    fi
    if ! grep -qF 'slake_type_tag_init' "$out_c"; then
      echo "error: $out_c missing slake_type_tag_init" >&2
      exit 1
    fi
    echo "types-subset-emit: GREEN (M1 Types unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# M1 Types subset rebuild / self-application: M1 Types package identity
# -> re-emit/re-validate Types unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: types-subset-rebuild, slake-types-subset-rebuild, TYPES-SUBSET-REBUILD,
# SLAKE_TYPES_SUBSET_REBUILD, typesSubsetRebuildReady, typesSubsetRebuildSelfApplyOk.
types-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_types_subset.h"
    out_c="$emit_dir/slake_types_subset.c"
    echo "== types-subset-rebuild (M1 Types subset self-application) =="
    echo "  input: SLAKE_TYPES_SUBSET_EMIT_V0 / typesSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Types unit package; typesSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/TypesSubsetRebuild.lean"
    main_mod="$lean_dir/TypesSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildReady' "$mod"; then
      echo "error: missing typesSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing typesSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildWrite' "$mod"; then
      echo "error: missing typesSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_TYPES_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; types-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-types-subset-rebuild
      lake exe slake-types-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Types subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Types subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in TYPES-SUBSET-EMIT SLAKE_TYPES_SUBSET_EMIT_V0 SLAKE_TYPES_SUBSET_TYPES HOST-EMIT-TYPES TYPED_IR_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_type_tag' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_type_tag" >&2
      exit 1
    fi
    if ! grep -qF 'slake_type_tag_init' "$out_c"; then
      echo "error: $out_c missing slake_type_tag_init" >&2
      exit 1
    fi
    if ! grep -qF 'typesSubsetRebuildReady' "$mod"; then
      echo "error: typesSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_TYPES_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_TYPES_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "types-subset-rebuild: GREEN (M1 Types subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# Ideal ladder M1 Program subset freestanding emit: COMPILE-PATH-PROGRAM Program unit
# input identity -> written Program unit package (slake_program_subset.{h,c}) reusing
# HOST-EMIT-PROGRAM dialect. Not full freestanding API dialect rewrite as sole
# success. Lake host remains.
# Greppable: program-subset-emit, slake-program-subset-emit, PROGRAM-SUBSET-EMIT,
# SLAKE_PROGRAM_SUBSET_EMIT, programSubsetEmitReady, slake_program_subset.h.
program-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_program_subset.h"
    out_c="$emit_dir/slake_program_subset.c"
    echo "== program-subset-emit (ideal ladder M1 Program subset freestanding emit) =="
    echo "  input: SLAKE_PROGRAM_SUBSET_PROGRAM (COMPILE-PATH-PROGRAM / PROGRAM-FIXTURE)"
    echo "  output: Program unit package slake_program_subset.h/.c (HOST-EMIT-PROGRAM); Lake host remains"
    mod="$lean_dir/ProgramSubsetEmit.lean"
    main_mod="$lean_dir/ProgramSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetEmitReady' "$mod"; then
      echo "error: missing programSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_PROGRAM' "$mod"; then
      echo "error: missing SLAKE_PROGRAM_SUBSET_PROGRAM in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetEmitWrite' "$mod"; then
      echo "error: missing programSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; program-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-program-subset-emit
      lake exe slake-program-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Program subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Program subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in PROGRAM-SUBSET-EMIT SLAKE_PROGRAM_SUBSET_EMIT_V0 SLAKE_PROGRAM_SUBSET_PROGRAM HOST-EMIT-PROGRAM IR_PROGRAM_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_ir_program' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_ir_program" >&2
      exit 1
    fi
    if ! grep -qF 'slake_ir_program_init' "$out_c"; then
      echo "error: $out_c missing slake_ir_program_init" >&2
      exit 1
    fi
    echo "program-subset-emit: GREEN (M1 Program unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Extract subset freestanding emit: fixed Extract gate input
# (COMPILE-PATH-EXTRACT / extractRuntimeFsGateReady) -> Extract unit package write
# under emit/ (HOST-EMIT-EXTRACT dialect). Not full freestanding dialect rewrite.
# Greppable: extract-subset-emit, slake-extract-subset-emit, EXTRACT-SUBSET-EMIT,
# SLAKE_EXTRACT_SUBSET_EMIT, extractSubsetEmitReady, slake_extract_subset.h.
extract-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_extract_subset.h"
    out_c="$emit_dir/slake_extract_subset.c"
    echo "== extract-subset-emit (ideal ladder M1 Extract subset freestanding emit) =="
    echo "  input: SLAKE_EXTRACT_SUBSET_EXTRACT (COMPILE-PATH-EXTRACT / EXTRACT-RUNTIME-FS)"
    echo "  output: Extract unit package slake_extract_subset.h/.c (HOST-EMIT-EXTRACT); Lake host remains"
    mod="$lean_dir/ExtractSubsetEmit.lean"
    main_mod="$lean_dir/ExtractSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetEmitReady' "$mod"; then
      echo "error: missing extractSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_EXTRACT_SUBSET_EXTRACT' "$mod"; then
      echo "error: missing SLAKE_EXTRACT_SUBSET_EXTRACT in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetEmitWrite' "$mod"; then
      echo "error: missing extractSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; extract-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-extract-subset-emit
      lake exe slake-extract-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Extract subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Extract subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in EXTRACT-SUBSET-EMIT SLAKE_EXTRACT_SUBSET_EMIT_V0 SLAKE_EXTRACT_SUBSET_EXTRACT HOST-EMIT-EXTRACT FAIL_CLOSED_CHECKER_V1; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'enum slake_extract_status' "$out_h"; then
      echo "error: $out_h missing enum slake_extract_status" >&2
      exit 1
    fi
    if ! grep -qF 'slake_extract_with_checks' "$out_c"; then
      echo "error: $out_c missing slake_extract_with_checks" >&2
      exit 1
    fi
    echo "extract-subset-emit: GREEN (M1 Extract unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Erasure subset freestanding emit: COMPILE-PATH-ERASURE Erasure
# unit input identity -> written Erasure unit package (slake_erasure_subset.{h,c})
# reusing HOST-EMIT-ERASURE dialect. Not full freestanding API dialect rewrite as
# sole success. Lake host remains.
# Greppable: erasure-subset-emit, slake-erasure-subset-emit, ERASURE-SUBSET-EMIT,
# SLAKE_ERASURE_SUBSET_EMIT, erasureSubsetEmitReady, slake_erasure_subset.h.
erasure-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_erasure_subset.h"
    out_c="$emit_dir/slake_erasure_subset.c"
    echo "== erasure-subset-emit (ideal ladder M1 Erasure subset freestanding emit) =="
    echo "  input: SLAKE_ERASURE_SUBSET_ERASURE (COMPILE-PATH-ERASURE / ERASURE-FIXTURE)"
    echo "  output: Erasure unit package slake_erasure_subset.h/.c (HOST-EMIT-ERASURE); Lake host remains"
    mod="$lean_dir/ErasureSubsetEmit.lean"
    main_mod="$lean_dir/ErasureSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetEmitReady' "$mod"; then
      echo "error: missing erasureSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_ERASURE_SUBSET_ERASURE' "$mod"; then
      echo "error: missing SLAKE_ERASURE_SUBSET_ERASURE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetEmitWrite' "$mod"; then
      echo "error: missing erasureSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; erasure-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-erasure-subset-emit
      lake exe slake-erasure-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Erasure subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Erasure subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in ERASURE-SUBSET-EMIT SLAKE_ERASURE_SUBSET_EMIT_V0 SLAKE_ERASURE_SUBSET_ERASURE HOST-EMIT-ERASURE ERASE-RULE-MULT-0 ERASE-NO-RUNTIME; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_erased' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_erased" >&2
      exit 1
    fi
    if ! grep -qF 'slake_erasure_is_runtime_absent' "$out_c"; then
      echo "error: $out_c missing slake_erasure_is_runtime_absent" >&2
      exit 1
    fi
    echo "erasure-subset-emit: GREEN (M1 Erasure unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Graph subset freestanding emit: COMPILE-PATH-GRAPH Graph
# unit input identity -> written Graph unit package (slake_graph_subset.{h,c})
# reusing HOST-EMIT-GRAPH dialect. Not full freestanding API dialect rewrite as
# sole success. Lake host remains.
# Greppable: graph-subset-emit, slake-graph-subset-emit, GRAPH-SUBSET-EMIT,
# SLAKE_GRAPH_SUBSET_EMIT, graphSubsetEmitReady, slake_graph_subset.h.
graph-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_graph_subset.h"
    out_c="$emit_dir/slake_graph_subset.c"
    echo "== graph-subset-emit (ideal ladder M1 Graph subset freestanding emit) =="
    echo "  input: SLAKE_GRAPH_SUBSET_GRAPH (COMPILE-PATH-GRAPH / GRAPH-FIXTURE)"
    echo "  output: Graph unit package slake_graph_subset.h/.c (HOST-EMIT-GRAPH); Lake host remains"
    mod="$lean_dir/GraphSubsetEmit.lean"
    main_mod="$lean_dir/GraphSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetEmitReady' "$mod"; then
      echo "error: missing graphSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_GRAPH' "$mod"; then
      echo "error: missing SLAKE_GRAPH_SUBSET_GRAPH in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetEmitWrite' "$mod"; then
      echo "error: missing graphSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; graph-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-graph-subset-emit
      lake exe slake-graph-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Graph subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Graph subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in GRAPH-SUBSET-EMIT SLAKE_GRAPH_SUBSET_EMIT_V0 SLAKE_GRAPH_SUBSET_GRAPH HOST-EMIT-GRAPH IR_GRAPH_EDGES_V0 SLAKE_IR_EDGE_MAX; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_ir_graph' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_ir_graph" >&2
      exit 1
    fi
    if ! grep -qF 'slake_ir_graph_add_edge' "$out_c"; then
      echo "error: $out_c missing slake_ir_graph_add_edge" >&2
      exit 1
    fi
    echo "graph-subset-emit: GREEN (M1 Graph unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# Ideal ladder M1 Compose subset freestanding emit: COMPILE-PATH-COMPOSE Compose
# unit input identity -> written Compose unit package (slake_compose_subset.{h,c})
# reusing HOST-EMIT-COMPOSE dialect. Not full freestanding API dialect rewrite as
# sole success. Lake host remains.
# Greppable: compose-subset-emit, slake-compose-subset-emit, COMPOSE-SUBSET-EMIT,
# SLAKE_COMPOSE_SUBSET_EMIT, composeSubsetEmitReady, slake_compose_subset.h.
compose-subset-emit:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_compose_subset.h"
    out_c="$emit_dir/slake_compose_subset.c"
    echo "== compose-subset-emit (ideal ladder M1 Compose subset freestanding emit) =="
    echo "  input: SLAKE_COMPOSE_SUBSET_COMPOSE (COMPILE-PATH-COMPOSE / COMPOSE-FIXTURE)"
    echo "  output: Compose unit package slake_compose_subset.h/.c (HOST-EMIT-COMPOSE); Lake host remains"
    mod="$lean_dir/ComposeSubsetEmit.lean"
    main_mod="$lean_dir/ComposeSubsetEmitMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetEmitReady' "$mod"; then
      echo "error: missing composeSubsetEmitReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_COMPOSE' "$mod"; then
      echo "error: missing SLAKE_COMPOSE_SUBSET_COMPOSE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetEmitWrite' "$mod"; then
      echo "error: missing composeSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; compose-subset-emit requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-compose-subset-emit
      lake exe slake-compose-subset-emit -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Compose subset header after emit: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Compose subset source after emit: $out_c" >&2
      exit 1
    fi
    for tok in COMPOSE-SUBSET-EMIT SLAKE_COMPOSE_SUBSET_EMIT_V0 SLAKE_COMPOSE_SUBSET_COMPOSE HOST-EMIT-COMPOSE HOST_COMPOSE_V0 IR_GRAPH_EDGES_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_host_compose' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_host_compose" >&2
      exit 1
    fi
    if ! grep -qF 'slake_host_compose_add_edge' "$out_c"; then
      echo "error: $out_c missing slake_host_compose_add_edge" >&2
      exit 1
    fi
    if ! grep -qF 'slake_host_compose_mint' "$out_c"; then
      echo "error: $out_c missing slake_host_compose_mint" >&2
      exit 1
    fi
    echo "compose-subset-emit: GREEN (M1 Compose unit package wrote; subset emit evidence; Lake host remains; not rebuild/S4; not PROVABLY/llvm)"

# M1 Compose subset rebuild / self-application: M1 Compose package identity
# -> re-emit/re-validate Compose unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: compose-subset-rebuild, slake-compose-subset-rebuild, COMPOSE-SUBSET-REBUILD,
# SLAKE_COMPOSE_SUBSET_REBUILD, composeSubsetRebuildReady, composeSubsetRebuildSelfApplyOk.
compose-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_compose_subset.h"
    out_c="$emit_dir/slake_compose_subset.c"
    echo "== compose-subset-rebuild (M1 Compose subset self-application) =="
    echo "  input: SLAKE_COMPOSE_SUBSET_EMIT_V0 / composeSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Compose unit package; composeSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/ComposeSubsetRebuild.lean"
    main_mod="$lean_dir/ComposeSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildReady' "$mod"; then
      echo "error: missing composeSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing composeSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildWrite' "$mod"; then
      echo "error: missing composeSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_COMPOSE_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; compose-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-compose-subset-rebuild
      lake exe slake-compose-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Compose subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Compose subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in COMPOSE-SUBSET-EMIT SLAKE_COMPOSE_SUBSET_EMIT_V0 SLAKE_COMPOSE_SUBSET_COMPOSE HOST-EMIT-COMPOSE HOST_COMPOSE_V0 IR_GRAPH_EDGES_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_host_compose' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_host_compose" >&2
      exit 1
    fi
    if ! grep -qF 'slake_host_compose_add_edge' "$out_c"; then
      echo "error: $out_c missing slake_host_compose_add_edge" >&2
      exit 1
    fi
    if ! grep -qF 'slake_host_compose_mint' "$out_c"; then
      echo "error: $out_c missing slake_host_compose_mint" >&2
      exit 1
    fi
    if ! grep -qF 'composeSubsetRebuildReady' "$mod"; then
      echo "error: composeSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_COMPOSE_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_COMPOSE_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "compose-subset-rebuild: GREEN (M1 Compose subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

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
    justfile_path="$root/justfile"
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
      if ! grep -qE "^${recipe}:" "$justfile_path"; then
        echo "error: missing just recipe '${recipe}:' in justfile (Lake-free inventory dual)" >&2
        exit 1
      fi
    done
    # Official build exists as product hot path (M4 Name C).
    if ! grep -qE '^build:' "$justfile_path"; then
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

# M5 Name B: front-end Mult package path (SubsetFront G1 accept then Mult package write).
# Measured: SubsetFront accepts golden G1, Mult unit package write, dual package greps.
# Product StillUsesLake / DependsOnLake stay true. Name A join pin unchanged.
# Greppable: front-mult-package, FRONT-MULT-PACKAGE, frontMultPackageFinishedClaimed,
# frontMultPackageReady, justRecipeFrontMultPackage, SLAKE_FRONT_MULT_PACKAGE_V0.
front-mult-package:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    goldens_dir="$systems_dir/goldens/mult-front"
    mod="$lean_dir/FrontMultPackage.lean"
    main_mod="$lean_dir/FrontMultPackageMain.lean"
    join_mod="$lean_dir/SubsetPackageJoin.lean"
    echo "== front-mult-package (M5 front-end Mult package path) =="
    echo "  path: SubsetFront G1 accept -> Mult package write -> dual greps"
    echo "  dual: Lean frontMultPackageReady + emit/slake_mult_subset stage token"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'frontMultPackageFinishedClaimed' "$mod"; then
      echo "error: missing frontMultPackageFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'frontMultPackageReady' "$mod"; then
      echo "error: missing frontMultPackageReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeFrontMultPackage' "$mod"; then
      echo "error: missing justRecipeFrontMultPackage in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'front-mult-package' "$mod"; then
      echo "error: missing front-mult-package cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'frontMultPackageG1Ready' "$mod"; then
      echo "error: missing frontMultPackageG1Ready in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetFrontGoodG1' "$mod"; then
      echo "error: missing subsetFrontGoodG1 cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_FRONT_MULT_PACKAGE_V0' "$mod"; then
      echo "error: missing SLAKE_FRONT_MULT_PACKAGE_V0 stage id in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'acceptG1Golden' "$mod"; then
      echo "error: missing acceptG1Golden in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetEmitWrite' "$mod"; then
      echo "error: missing multSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_dir/good-mult-classic.slake-mult" ]]; then
      echo "error: missing G1 golden $goldens_dir/good-mult-classic.slake-mult" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; front-mult-package requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-front-mult-package
      lake exe slake-front-mult-package -- "$root"
    )
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
    # Structural Name B finished pin must stay true.
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
    # Name A join pin and Mult freestanding driver complete stay true (unchanged).
    if [[ -f "$join_mod" ]]; then
      if ! grep -qE 'def subsetPackageJoinFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$join_mod"; then
        echo "error: subsetPackageJoinFinishedClaimed must stay true (Name A unchanged)" >&2
        exit 1
      fi
    fi
    echo "front-mult-package: GREEN"

# Ideal ladder M3 Mult subset language front-end: parse/check good+bad goldens
# under src/systems/goldens/mult-front/ (not only fixed Mult fixtures). Lake host remains.
# Greppable: subset-front, slake-subset-front, SUBSET-FRONT, SLAKE_SUBSET_FRONT,
# subsetFrontReady, goldens/mult-front, FAIL-CLOSED-UNKNOWN-GRADE.
subset-front:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/mult-front"
    echo "== subset-front (M3 Mult subset language front-end) =="
    echo "  input: goldens/mult-front G1/G2 + B1/B2/B3"
    echo "  output: subsetFrontReady (parse+check); Lake host remains"
    mod="$lean_dir/SubsetFront.lean"
    main_mod="$lean_dir/SubsetFrontMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetFrontReady' "$mod"; then
      echo "error: missing subsetFrontReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_SUBSET_FRONT_V0' "$mod"; then
      echo "error: missing SLAKE_SUBSET_FRONT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'parseSource' "$mod"; then
      echo "error: missing parseSource in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetFrontGoodG1' "$mod"; then
      echo "error: missing subsetFrontGoodG1 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetFrontBadB1' "$mod"; then
      echo "error: missing subsetFrontBadB1 in $mod" >&2
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
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; subset-front requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-subset-front
      lake exe slake-subset-front -- "$root"
    )
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
    echo "subset-front: GREEN (M3 Mult subset language goldens accept/reject; Lake host remains; not S4; not PROVABLY/llvm)"

# M1 Graph subset rebuild / self-application: M1 Graph package identity
# -> re-emit/re-validate Graph unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: graph-subset-rebuild, slake-graph-subset-rebuild, GRAPH-SUBSET-REBUILD,
# SLAKE_GRAPH_SUBSET_REBUILD, graphSubsetRebuildReady, graphSubsetRebuildSelfApplyOk.
graph-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_graph_subset.h"
    out_c="$emit_dir/slake_graph_subset.c"
    echo "== graph-subset-rebuild (M1 Graph subset self-application) =="
    echo "  input: SLAKE_GRAPH_SUBSET_EMIT_V0 / graphSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Graph unit package; graphSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/GraphSubsetRebuild.lean"
    main_mod="$lean_dir/GraphSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildReady' "$mod"; then
      echo "error: missing graphSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing graphSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildWrite' "$mod"; then
      echo "error: missing graphSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_GRAPH_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; graph-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-graph-subset-rebuild
      lake exe slake-graph-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Graph subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Graph subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in GRAPH-SUBSET-EMIT SLAKE_GRAPH_SUBSET_EMIT_V0 SLAKE_GRAPH_SUBSET_GRAPH HOST-EMIT-GRAPH IR_GRAPH_EDGES_V0 SLAKE_IR_EDGE_MAX; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_ir_graph' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_ir_graph" >&2
      exit 1
    fi
    if ! grep -qF 'slake_ir_graph_add_edge' "$out_c"; then
      echo "error: $out_c missing slake_ir_graph_add_edge" >&2
      exit 1
    fi
    if ! grep -qF 'graphSubsetRebuildReady' "$mod"; then
      echo "error: graphSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_GRAPH_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_GRAPH_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "graph-subset-rebuild: GREEN (M1 Graph subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# M1 Erasure subset rebuild / self-application: M1 Erasure package identity
# -> re-emit/re-validate Erasure unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: erasure-subset-rebuild, slake-erasure-subset-rebuild, ERASURE-SUBSET-REBUILD,
# SLAKE_ERASURE_SUBSET_REBUILD, erasureSubsetRebuildReady, erasureSubsetRebuildSelfApplyOk.
erasure-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_erasure_subset.h"
    out_c="$emit_dir/slake_erasure_subset.c"
    echo "== erasure-subset-rebuild (M1 Erasure subset self-application) =="
    echo "  input: SLAKE_ERASURE_SUBSET_EMIT_V0 / erasureSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Erasure unit package; erasureSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/ErasureSubsetRebuild.lean"
    main_mod="$lean_dir/ErasureSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildReady' "$mod"; then
      echo "error: missing erasureSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing erasureSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildWrite' "$mod"; then
      echo "error: missing erasureSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_ERASURE_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_ERASURE_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; erasure-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-erasure-subset-rebuild
      lake exe slake-erasure-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Erasure subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Erasure subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in ERASURE-SUBSET-EMIT SLAKE_ERASURE_SUBSET_EMIT_V0 SLAKE_ERASURE_SUBSET_ERASURE HOST-EMIT-ERASURE ERASE-RULE-MULT-0 ERASE-NO-RUNTIME; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_erased' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_erased" >&2
      exit 1
    fi
    if ! grep -qF 'slake_erased_mark' "$out_c"; then
      echo "error: $out_c missing slake_erased_mark" >&2
      exit 1
    fi
    if ! grep -qF 'erasureSubsetRebuildReady' "$mod"; then
      echo "error: erasureSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_ERASURE_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_ERASURE_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "erasure-subset-rebuild: GREEN (M1 Erasure subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# M1 Extract subset rebuild / self-application: M1 Extract package identity
# -> re-emit/re-validate Extract unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: extract-subset-rebuild, slake-extract-subset-rebuild, EXTRACT-SUBSET-REBUILD,
# SLAKE_EXTRACT_SUBSET_REBUILD, extractSubsetRebuildReady, extractSubsetRebuildSelfApplyOk.
extract-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_extract_subset.h"
    out_c="$emit_dir/slake_extract_subset.c"
    echo "== extract-subset-rebuild (M1 Extract subset self-application) =="
    echo "  input: SLAKE_EXTRACT_SUBSET_EMIT_V0 / extractSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Extract unit package; extractSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/ExtractSubsetRebuild.lean"
    main_mod="$lean_dir/ExtractSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildReady' "$mod"; then
      echo "error: missing extractSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing extractSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildWrite' "$mod"; then
      echo "error: missing extractSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_EXTRACT_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_EXTRACT_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; extract-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-extract-subset-rebuild
      lake exe slake-extract-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Extract subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Extract subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in EXTRACT-SUBSET-EMIT SLAKE_EXTRACT_SUBSET_EMIT_V0 SLAKE_EXTRACT_SUBSET_EXTRACT HOST-EMIT-EXTRACT FAIL_CLOSED_CHECKER_V1; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'enum slake_extract_status' "$out_h"; then
      echo "error: $out_h missing enum slake_extract_status" >&2
      exit 1
    fi
    if ! grep -qF 'slake_extract_with_checks' "$out_c"; then
      echo "error: $out_c missing slake_extract_with_checks" >&2
      exit 1
    fi
    if ! grep -qF 'extractSubsetRebuildReady' "$mod"; then
      echo "error: extractSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_EXTRACT_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_EXTRACT_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "extract-subset-rebuild: GREEN (M1 Extract subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

# M1 Program subset rebuild / self-application: M1 Program package identity
# -> re-emit/re-validate Program unit package (measured self-application bar).
# Not full freestanding dialect regenerate as sole success. Lake host remains.
# Greppable: program-subset-rebuild, slake-program-subset-rebuild, PROGRAM-SUBSET-REBUILD,
# SLAKE_PROGRAM_SUBSET_REBUILD, programSubsetRebuildReady, programSubsetRebuildSelfApplyOk.
program-subset-rebuild:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_program_subset.h"
    out_c="$emit_dir/slake_program_subset.c"
    echo "== program-subset-rebuild (M1 Program subset self-application) =="
    echo "  input: SLAKE_PROGRAM_SUBSET_EMIT_V0 / programSubsetEmitReady (M1 package identity)"
    echo "  output: re-emit/re-validate Program unit package; programSubsetRebuildReady; Lake host remains"
    mod="$lean_dir/ProgramSubsetRebuild.lean"
    main_mod="$lean_dir/ProgramSubsetRebuildMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildReady' "$mod"; then
      echo "error: missing programSubsetRebuildReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildSelfApplyOk' "$mod"; then
      echo "error: missing programSubsetRebuildSelfApplyOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildWrite' "$mod"; then
      echo "error: missing programSubsetRebuildWrite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_EMIT_V0' "$mod"; then
      echo "error: missing M1 package input pin SLAKE_PROGRAM_SUBSET_EMIT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing without-Lake finished non-claim in $mod" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; program-subset-rebuild requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-program-subset-rebuild
      lake exe slake-program-subset-rebuild -- "$root"
    )
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Program subset header after rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Program subset source after rebuild: $out_c" >&2
      exit 1
    fi
    for tok in PROGRAM-SUBSET-EMIT SLAKE_PROGRAM_SUBSET_EMIT_V0 SLAKE_PROGRAM_SUBSET_PROGRAM HOST-EMIT-PROGRAM IR_PROGRAM_V0; do
      if ! grep -qF "$tok" "$out_h"; then
        echo "error: $out_h missing greppable token $tok" >&2
        exit 1
      fi
      if ! grep -qF "$tok" "$out_c"; then
        echo "error: $out_c missing greppable token $tok" >&2
        exit 1
      fi
    done
    if ! grep -qF 'typedef struct slake_ir_program' "$out_h"; then
      echo "error: $out_h missing typedef struct slake_ir_program" >&2
      exit 1
    fi
    if ! grep -qF 'slake_ir_program_init' "$out_c"; then
      echo "error: $out_c missing slake_ir_program_init" >&2
      exit 1
    fi
    if ! grep -qF 'programSubsetRebuildReady' "$mod"; then
      echo "error: programSubsetRebuildReady missing after rebuild (host bar)" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PROGRAM_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_PROGRAM_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    echo "program-subset-rebuild: GREEN (M1 Program subset self-application measured; Lake host remains; not without-Lake finished; not S4; not PROVABLY/llvm)"

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
      echo "error: missing multSubsetRebuildWithoutLakeFinishedClaimed pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing multSubsetRebuildWithoutLakeKeepsHostLake (M2 keeps product Lake) in $mod" >&2
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
    echo "mult-subset-rebuild: GREEN (S3 Mult subset self-application measured; Lake path; product Lake remains; M2 without-Lake is just mult-subset-rebuild-without-lake; not S4; not PROVABLY/llvm)"

# Mult without-Lake prebuilt driver (ideal M2 partial / design Name A).
# Measured Mult unit package re-emit/re-validate without invoking lake on the
# hot path. Prebuild once (bootstrap, not measured):
#   (cd src/systems && lake build slake-mult-subset-rebuild)
# then run this recipe (runs .lake/build/bin/slake-mult-subset-rebuild only).
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# Greppable: mult-subset-rebuild-without-lake, MULT-WITHOUT-LAKE,
# multSubsetRebuildWithoutLakeFinishedClaimed, prebuilt Mult rebuild.
mult-subset-rebuild-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    prebuilt="$systems_dir/.lake/build/bin/slake-mult-subset-rebuild"
    mod="$lean_dir/MultSubsetRebuild.lean"
    echo "== mult-subset-rebuild-without-lake (M2 Mult measured step; no lake on hot path) =="
    echo "  input: S2 Mult package identity; prebuilt $prebuilt"
    echo "  output: re-emit/re-validate Mult unit package; dual evidence greps"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWithoutLakeFinishedClaimed' "$mod"; then
      echo "error: missing multSubsetRebuildWithoutLakeFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeWithoutLake' "$mod"; then
      echo "error: missing justRecipeWithoutLake pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'mult-subset-rebuild-without-lake' "$mod"; then
      echo "error: missing mult-subset-rebuild-without-lake cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing multSubsetRebuildWithoutLakeKeepsHostLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt Mult rebuild binary: $prebuilt" >&2
      echo "  bootstrap once (not hot path): (cd src/systems && lake build slake-mult-subset-rebuild)" >&2
      echo "  then re-run: just mult-subset-rebuild-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt Mult rebuild (no lake)"
    "$prebuilt" "$root"
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult subset header after without-Lake rebuild: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult subset source after without-Lake rebuild: $out_c" >&2
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
    if ! grep -qF 'SLAKE_MULT_SUBSET_REBUILD_V0' "$mod"; then
      echo "error: missing SLAKE_MULT_SUBSET_REBUILD_V0 stage id in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetRebuildReady' "$mod"; then
      echo "error: multSubsetRebuildReady missing after without-Lake rebuild (host bar)" >&2
      exit 1
    fi
    # Structural without-Lake finished pin must be true in host Lean (M2 closed).
    if ! grep -qE 'def multSubsetRebuildWithoutLakeFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: multSubsetRebuildWithoutLakeFinishedClaimed must be true for M2 without-Lake finished" >&2
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
    echo "mult-subset-rebuild-without-lake: GREEN"

# Mult freestanding deepen greps (ideal M2 Name B partial bar).
# Measured Mult freestanding package surface dual-check: freestanding product
# Mult dialect (HOST-EMIT-MULT on slake_freestanding + host_emit_mult SSOT) and
# Mult unit package (slake_mult_subset) without lake and without Mult rebuild
# prebuilt ELF as the measured greps driver. freestandingDeepenPartial true.
# Does not require freestandingDriverComplete (partial independent of design full).
# Name A prebuilt path remains valid. Product StillUsesLake/DependsOnLake stay.
# Greppable: mult-subset-freestanding-deepen, MULT-FS-DEEPEN,
# freestandingDeepenPartial, freestandingDriverComplete.
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

# Name B full: Mult package write via Path A host-cc freestanding Mult writer.
# Mult unit package from MultSubsetEmit freestanding Mult SSOT (embedded in
# Lean-generated emit/slake_mult_fs_write_tool.c). Measured hot path:
#   cc -o src/systems/bin/slake-mult-fs-write-cc (outside .lake)
#   exec that bin only -- no lake build/exe/env; not Mult rebuild ELF;
#   not Lake-built .lake/build/bin/slake-mult-fs-write.
# Bootstrap tool C once (not hot path):
#   (cd src/systems && lake build slake-mult-fs-write-tool && lake exe slake-mult-fs-write-tool -- <repo-root>)
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# Greppable: mult-subset-freestanding-write, slake-mult-fs-write-cc, MULT-FS-WRITE,
# MULT-FS-WRITE-TOOL, freestandingDriverComplete, multFsWritePathReady,
# freestandingWriteToolNotLakeBuilt, multFsWriteNotRebuildDriver.
mult-subset-freestanding-write:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    bin_dir="$systems_dir/bin"
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    tool_c="$emit_dir/slake_mult_fs_write_tool.c"
    fs_h="$emit_dir/slake_freestanding.h"
    fs_c="$emit_dir/slake_freestanding.c"
    mult_ssot="$emit_dir/host_emit_mult.ssot.txt"
    mod="$lean_dir/MultFsDeepen.lean"
    tool_mod="$lean_dir/MultFsWriteTool.lean"
    writer_bin="$bin_dir/slake-mult-fs-write-cc"
    lake_write_bin="$systems_dir/.lake/build/bin/slake-mult-fs-write"
    rebuild_bin="$systems_dir/.lake/build/bin/slake-mult-subset-rebuild"
    echo "== mult-subset-freestanding-write (Name B full Path A host-cc Mult package write) =="
    echo "  package builder: MultSubsetEmit freestanding Mult SSOT (embedded in tool C)"
    echo "  measured writer: $writer_bin (host-cc; outside .lake)"
    echo "  freestandingDriverComplete: true; multFsWritePathReady: true"
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
      echo "error: freestandingDriverComplete must be true (Name B full Path A dual evidence)" >&2
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
    if [[ ! -f "$tool_c" ]]; then
      echo "error: missing Lean-generated Mult write tool C: $tool_c" >&2
      echo "  bootstrap once (not hot path): (cd src/systems && lake build slake-mult-fs-write-tool && lake exe slake-mult-fs-write-tool -- $root)" >&2
      echo "  then re-run: just mult-subset-freestanding-write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_FS_WRITE_TOOL_V0' "$tool_c"; then
      echo "error: tool C missing SLAKE_MULT_FS_WRITE_TOOL_V0" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-FS-WRITE-TOOL' "$tool_c"; then
      echo "error: tool C missing MULT-FS-WRITE-TOOL" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "error: host cc not on PATH (required to build Mult package writer)" >&2
      exit 1
    fi
    # Hot path: host-cc Mult package writer only. Do not call lake. Do not exec Lake Mult write ELF or Mult rebuild.
    mkdir -p "$bin_dir"
    echo "  hot path: host-cc Mult package writer (no lake; not Lake Mult write ELF; not Mult rebuild ELF)"
    cc -O2 -o "$writer_bin" "$tool_c"
    if [[ ! -x "$writer_bin" ]]; then
      echo "error: failed to build Mult package writer: $writer_bin" >&2
      exit 1
    fi
    case "$writer_bin" in
      */.lake/*)
        echo "error: measured writer must not live under .lake: $writer_bin" >&2
        exit 1
        ;;
    esac
    if [[ "$writer_bin" == "$lake_write_bin" ]]; then
      echo "error: measured writer must not be Lake Mult write ELF" >&2
      exit 1
    fi
    if [[ "$writer_bin" == "$rebuild_bin" ]]; then
      echo "error: Mult rebuild ELF must not be Mult package writer" >&2
      exit 1
    fi
    "$writer_bin" "$root"
    if [[ -x "$rebuild_bin" ]]; then
      echo "  note: Mult rebuild prebuilt present (Name A path) but not used as Mult package writer"
    fi
    if [[ -x "$lake_write_bin" ]]; then
      echo "  note: Lake Mult write prebuilt present (bootstrap helper) but not used as measured Mult package writer"
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

# M4 Name B: Path A freestanding product-wire dual-eq WRITE + INSTALL via host-cc.
# Measured hot path (no lake):
#   cc -o src/systems/bin/slake-product-wire-fs-write-cc (outside .lake)
#   exec that bin only -- WRITE emit/slake_freestanding.{h,c} + INSTALL Out.
# Bootstrap tool C once (not hot path):
#   (cd src/systems && lake build slake-product-wire-fs-write-tool \
#     && lake exe slake-product-wire-fs-write-tool -- <repo-root>)
# Product StillUsesLake / DependsOnLake stay true until S4 / M6.
# freestandingDriverComplete stays Mult-orthogonal (separate productWireFsWriterFinishedClaimed).
# Greppable: product-wire-freestanding-write, slake-product-wire-fs-write-cc,
# PRODUCT-WIRE-FS-WRITE-TOOL, productWireFsWriterFinishedClaimed,
# productWireFsWriterNotLakeBuilt, productWireFsWriterReady.
product-wire-freestanding-write:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    bin_dir="$systems_dir/bin"
    out_dir="$root/out/freestanding-c"
    out_h="$emit_dir/slake_freestanding.h"
    out_c="$emit_dir/slake_freestanding.c"
    install_h="$out_dir/slake_freestanding.h"
    install_c="$out_dir/slake_freestanding.c"
    tool_c="$emit_dir/slake_product_wire_fs_write_tool.c"
    tool_mod="$lean_dir/ProductWireWriteTool.lean"
    writer_bin="$bin_dir/slake-product-wire-fs-write-cc"
    lake_regen_bin="$systems_dir/.lake/build/bin/slake-freestanding-capable-regenerate"
    mult_writer_bin="$bin_dir/slake-mult-fs-write-cc"
    echo "== product-wire-freestanding-write (M4 Name B Path A host-cc freestanding WRITE+INSTALL) =="
    echo "  measured writer: $writer_bin (host-cc; outside .lake)"
    echo "  productWireFsWriterFinishedClaimed: true; freestandingDriverComplete: Mult-orthogonal"
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
    if [[ ! -f "$tool_c" ]]; then
      echo "error: missing Lean-generated product-wire write tool C: $tool_c" >&2
      echo "  bootstrap once (not hot path): (cd src/systems && lake build slake-product-wire-fs-write-tool && lake exe slake-product-wire-fs-write-tool -- $root)" >&2
      echo "  then re-run: just product-wire-freestanding-write" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0' "$tool_c"; then
      echo "error: tool C missing SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0" >&2
      exit 1
    fi
    if ! grep -qF 'PRODUCT-WIRE-FS-WRITE-TOOL' "$tool_c"; then
      echo "error: tool C missing PRODUCT-WIRE-FS-WRITE-TOOL" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "error: host cc not on PATH (required to build product-wire freestanding writer)" >&2
      exit 1
    fi
    # Hot path: host-cc product-wire writer only. Do not call lake. Do not exec Lake regenerate ELF.
    mkdir -p "$bin_dir"
    echo "  hot path: host-cc freestanding product-wire writer (no lake; not CapableRegenerate ELF)"
    cc -O2 -o "$writer_bin" "$tool_c"
    if [[ ! -x "$writer_bin" ]]; then
      echo "error: failed to build product-wire freestanding writer: $writer_bin" >&2
      exit 1
    fi
    case "$writer_bin" in
      */.lake/*)
        echo "error: measured writer must not live under .lake: $writer_bin" >&2
        exit 1
        ;;
    esac
    if [[ "$writer_bin" == "$lake_regen_bin" ]]; then
      echo "error: measured writer must not be Lake CapableRegenerate ELF" >&2
      exit 1
    fi
    if [[ "$writer_bin" == "$mult_writer_bin" ]]; then
      echo "error: Mult package writer must not be product-wire freestanding writer" >&2
      exit 1
    fi
    "$writer_bin" "$root"
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
# Live impure worktree eval. Optional elaborator: just idris-elaborate.
idris-side:
    @nix eval --impure --raw --expr {{quote(_idris_side)}}

# Pure Nix Lean-side dual presence (required files + tokens + examples jargon).
# Live impure worktree eval. Optional elaborator: just lean-elaborate.
lean-side:
    @nix eval --impure --raw --expr {{quote(_lean_side)}}

# Optional idris2 --check on dual examples. Skip GREEN if idris2 missing; RED if check fails.
# Static presence: just idris-side. Module names match basenames (ConsumeToken, ...).
idris-elaborate:
    #!/usr/bin/env bash
    set -euo pipefail
    fail=0
    if command -v idris2 >/dev/null 2>&1; then
      echo "== idris2 --check (optional when binary present) =="
      for f in ConsumeToken.idr ErasedIndex.idr UnrestrictedShare.idr; do
        if ! (cd src/idris2/examples && idris2 --check "$f"); then
          echo "RED: idris2 --check failed on $f" >&2
          fail=1
        else
          echo "ok idris2 --check $f"
        fi
      done
    else
      echo "skip idris2 --check (not on PATH; pure Nix idris-side presence still required via just idris-side)"
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "idris-elaborate RED" >&2
      exit 1
    fi
    echo "idris-elaborate GREEN (static presence: just idris-side)"

# Shared: return 0 if elan lists the wanted toolchain (strips " (default)" suffixes).
_elan-has-toolchain want:
    #!/usr/bin/env bash
    set -euo pipefail
    want="{{want}}"
    while IFS= read -r line; do
      [[ -z "$line" ]] && continue
      base=${line%% (*}
      base=${base%"${base##*[![:space:]]}"}
      if [[ "$base" == "$want" ]]; then
        exit 0
      fi
    done < <(elan toolchain list 2>/dev/null || true)
    exit 1

# Shared: optional lake build under dir when lean+lake and pin ready (or SYSTEMS_LEAN_LAKE=1).
# Skip is GREEN. Avoids network toolchain download when pin not installed.
_lake-if-pin dir label:
    #!/usr/bin/env bash
    set -euo pipefail
    here="{{dir}}"
    label="{{label}}"
    run_lake=0
    if command -v lean >/dev/null 2>&1 && command -v lake >/dev/null 2>&1; then
      want=$(tr -d '[:space:]' < "$here/lean-toolchain")
      if command -v elan >/dev/null 2>&1; then
        if just _elan-has-toolchain "$want"; then
          run_lake=1
        else
          echo "skip $label elaborator (toolchain $want not installed; avoid network download)"
        fi
      elif [[ "${SYSTEMS_LEAN_LAKE:-}" == "1" ]]; then
        echo "$label elaborator: no elan; SYSTEMS_LEAN_LAKE=1 set -- running PATH lake build"
        run_lake=1
      else
        echo "skip $label elaborator (elan not on PATH; set SYSTEMS_LEAN_LAKE=1 to force PATH lake build)"
      fi
    else
      echo "skip $label elaborator (lean and/or lake not on PATH)"
    fi
    if [[ "$run_lake" -eq 1 ]]; then
      echo "== lake build ($label) =="
      if ! (cd "$here" && lake build); then
        echo "RED: lake build failed for $here" >&2
        exit 1
      fi
      echo "ok lake build ($label)"
    fi

# Optional lake build in src/lean4 (dual examples). Same elan pin / SYSTEMS_LEAN_LAKE rules.
# Static presence: just lean-side.
lean-elaborate:
    #!/usr/bin/env bash
    set -euo pipefail
    just _lake-if-pin src/lean4 lean-side
    echo "lean-elaborate GREEN (static presence: just lean-side)"

# Optional lake build in src/systems (host bootstrap elaborator). Same elan skip rules.
# CompilePath presence is pure Nix (just systems-host); not re-checked here.
systems-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    just _lake-if-pin src/systems systems
    echo "systems-lake GREEN (static: just systems-host / systems-emit-wire)"

# Freestanding-first cc -c on emit + link/run behavioral probe.
# Under just check, SYSTEMS_PRODUCT_WIRE_FRESH=1 skips second just build (build already ran).
# Solo: runs just build unless FRESH=1. Soft GREEN if no cc; RED if emit missing or tests fail.
# Static probe path: just systems-emit-wire. Not residual free; not PROVABLY.
systems-cc-probe:
    #!/usr/bin/env bash
    set -euo pipefail
    fail=0
    emit_c=src/systems/emit/slake_freestanding.c
    emit_h=src/systems/emit/slake_freestanding.h
    probe=src/systems/smoke/slake_behavioral_probe.c
    echo "== systems-cc-probe (product wire exercise) =="
    if [[ "${SYSTEMS_PRODUCT_WIRE_FRESH:-}" == "1" ]]; then
      echo "ok product wire already fresh from just check/build (SYSTEMS_PRODUCT_WIRE_FRESH=1; skip regenerate)"
    elif ! just build; then
      echo "RED: just build non-zero" >&2
      fail=1
    else
      echo "ok just build GREEN"
    fi
    if [[ ! -f "$emit_c" || ! -f "$emit_h" ]]; then
      echo "RED: emit product missing ($emit_c / $emit_h)" >&2
      fail=1
    else
      echo "ok emit product .c/.h"
    fi
    if [[ ! -f out/freestanding-c/slake_freestanding.c || ! -f out/freestanding-c/slake_freestanding.h ]]; then
      echo "RED: out/freestanding-c product missing" >&2
      fail=1
    else
      echo "ok release surface"
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "systems-cc-probe RED (product wire missing)" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "ok compile + behavioral tests skipped (no cc)"
    else
      o="${TMPDIR:-/tmp}/slake_fs_smoke.o"
      inc=$(dirname "$emit_c")
      mode=""
      if cc -c -std=c11 -ffreestanding -nostdlib -I"$inc" -o "$o" "$emit_c" 2>/dev/null; then
        mode=ffreestanding-nostdlib
      elif cc -c -std=c11 -I"$inc" -o "$o" "$emit_c" 2>/dev/null; then
        mode=hosted-fallback
      fi
      rm -f "$o"
      if [[ -n "$mode" ]]; then
        echo "ok freestanding-first compile ($mode)"
      else
        echo "RED: freestanding-first compile failed" >&2
        fail=1
      fi
      if [[ ! -f "$probe" ]]; then
        echo "RED: missing $probe" >&2
        fail=1
      else
        d="${TMPDIR:-/tmp}/slake_beh_$$"
        mkdir -p "$d"
        if ! cc -std=c11 -I"$inc" -o "$d/probe" "$probe" "$emit_c" 2>/dev/null; then
          echo "RED: behavioral tests failed to link" >&2
          fail=1
        else
          rc=0
          "$d/probe" || rc=$?
          if [[ "$rc" -eq 0 ]]; then
            echo "ok behavioral tests ($probe)"
          else
            echo "RED: behavioral tests assert code=$rc" >&2
            fail=1
          fi
        fi
        rm -rf "$d"
      fi
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "systems-cc-probe RED" >&2
      exit 1
    fi
    echo "systems-cc-probe GREEN (process glue; static pure Nix; not residual free)"

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
