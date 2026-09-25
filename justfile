# Systems Lean -- thin task runner only (https://github.com/casey/just)
# Three languages only for novel work: Idris 2, Lean 4 (Slake/Systems Lean), pure Nix.
# just orchestrates (redirects, loops, thin lake/exe). Does not host product or tooling algorithms.
# Process glue: thin just recipes (elaborators / cc / llvm writers) + optional script/git-hooks/pre-commit.
# Novel workspace check.sh deleted; static mills are pure Nix under nix/.
# HARD: never grow long bash token/grep mills here or in just/*.just.
# Presence/pin gates -> nix/<module>/. just may only: short nix eval; thin lake/exe; sleep/print.
# Modular layout: root imports just/*.just (same namespace via import). Every just module < 1000 lines.
# Plan: .agents/plans/plan-paydown-shell-c-surfaces.md
# Map: just/README.md

set shell := ["bash", "-euo", "pipefail", "-c"]

# Private vars first (gates + progress pure Nix expressions), then role recipes.
import 'just/gates.just'
import 'just/progress.just'
import 'just/product-wire.just'
import 'just/freestanding-capable.just'
import 'just/ownership.just'
import 'just/freestanding-perform-1.just'
import 'just/freestanding-perform-2.just'
import 'just/freestanding-perform-3.just'
import 'just/freestanding-complete.just'
import 'just/llvm.just'
import 'just/llvm-ssa.just'
import 'just/llvm-link-smoke.just'
import 'just/slake-produced-elf.just'
import 'just/slake-typecheck-closed.just'
import 'just/slake-typecheck-closed-more.just'
import 'just/slake-typecheck-closed-later.just'
import 'just/slake-typecheck-closed-parity.just'
import 'just/slake-typecheck-closed-kernel.just'
import 'just/slake-typecheck-closed-compilepath.just'
import 'just/slake-typecheck-closed-hostkernel.just'
import 'just/slake-typecheck-closed-joinmaptheorems.just'
import 'just/slake-typecheck-closed-linearusefaildecide.just'
import 'just/slake-typecheck-closed-linearusefailkeep.just'
import 'just/slake-host-tool-elf.just'
import 'just/subset-emit.just'
import 'just/subset-join.just'
import 'just/host.just'
import 'just/host-without-lake.just'
import 'just/host-tool-expand.just'
import 'just/compcert.just'
import 'just/subset-rebuild.just'
import 'just/freestanding-mult.just'
import 'just/dual-side.just'
import 'just/bench.just'
import 'just/bench-runtime.just'
import 'just/bench-runtime-twins.just'
import 'just/bench-runtime-report.just'
import 'just/bench-llvm.just'
import 'just/first-host-tool.just'
import 'just/later-host-tools.just'
import 'just/slake-typecheck-closed-llvmprogramtext.just'

# List recipes (default when you run bare `just`).
default:
    @just --list

# Optional git hook entry (script/git-hooks/pre-commit execs this).
# Same full suite as just check -- not a second policy mill.
pre-commit: check

# Full suite: product wire first (just build), then pure gates + flake + process glue
# (elaborators, systems-cc-probe, product CompCert matrix via ccomp).
# Live pure gates (systems-host, systems-emit-wire, systems-llvm-ir, idris-side,
# lean-side, systems-mill-extras-fit, systems-mill-inventory, systems-mill-packed-extras, systems-mill-file-path, systems-mill-recipe-count, hygiene) use impure eval of the worktree and do not require new
# nix/ files to be git-tracked. nix flake check only sees tracked files -- after
# adding under nix/ (or related flake copy paths), the human must stage those
# paths before flake/continuous integration (CI) match. Agents never git add /
# stage / commit to silence flake WARN (human-in-the-loop (HITL) stage; see
# AGENTS.md Nix tooling). On flake failure, elaborator/cc/ccomp recipes still run;
# suite exits non-zero.
# SYSTEMS_PRODUCT_WIRE_FRESH=1: systems-cc-probe and freestanding-under-ccomp skip
# a second just build (wire already from check dependency).
check: build hygiene systems-host systems-emit-wire systems-llvm-ir idris-side lean-side systems-mill-extras-fit systems-mill-inventory systems-mill-packed-extras systems-mill-file-path systems-mill-recipe-count
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
      echo "just systems-llvm-ir, just idris-side, just lean-side, just systems-mill-extras-fit, just systems-mill-inventory, just systems-mill-packed-extras, just systems-mill-file-path, just systems-mill-recipe-count, just hygiene)." >&2
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
    just product-compcert-matrix
    if [[ "$flake_rc" -ne 0 ]]; then
      echo "check incomplete: flake rc=$flake_rc (live pure gates + elaborator recipes ran)" >&2
      exit "$flake_rc"
    fi
    echo "check OK"
