# Modular just: just/gates.just -- role recipes (import into root justfile).
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

_systems_llvm_ir := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/systems-llvm-ir { inherit lib; root = novel; };
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

_systems_mill_extras_fit := '''
let
  lib = (import (builtins.getFlake "nixpkgs") {}).lib;
  novel = import ./nix/novel-source.nix { inherit lib; src = ./.; };
  h = import ./nix/systems-mill-extras-fit { inherit lib; root = novel; };
in if h.ok then h.summary + "\n" else throw h.summary
'''

hygiene:
    @nix eval --impure --raw --expr {{quote(_hygiene)}}

# Pure Nix professional tone / profanity gate on novel markdown only (v1).
# Also folded into just hygiene. Live impure worktree eval.
professional-tone:
    @nix eval --impure --raw --expr {{quote(_professional_tone)}}

# Bootstrap S1 first Slake compiler surface: Mult unit input -> structural
# readiness (COMPILE-PATH-MULT / unitCompileReady + HOST-EMIT-MULT honesty).
# Lake host elaborator remains (StillUsesLake / DependsOnLake). Not full

systems-host:
    @nix eval --impure --raw --expr {{quote(_systems_host)}}

# Pure Nix systems emit-wire presence (drivers, UNIT_DEEPEN, emit product stages,
# unit-surface walk, optional release surface, PRODUCT-RESIDUAL-FREE-MEASURE).
# Live impure worktree eval. Claim A residual free measure runs when
# out/freestanding-c is present; residualFreeClaimed true when DualResidual free.
systems-emit-wire:
    @nix eval --impure --raw --expr {{quote(_systems_emit_wire)}}

# Pure Nix systems LLVM IR presence (LlvmHold unlock, emit-path, Mult..Graph unit
# text, unit-package artifacts, compose text, optional as-smoke honesty, Mult
# ABI parity fixture/header/IR, Mult layout IR tag dual-pin; no llvm-as binary
# require). Live impure worktree eval. Static only (no lake). Writers: just
# llvm-*-text / llvm-compose-text; optional smoke: just llvm-as-smoke; Mult
# agreement: just abi-parity-smoke; dual-pin: just layout-ir-dual-pin.
# Alias: llvm-ir-presence.
systems-llvm-ir:
    @nix eval --impure --raw --expr {{quote(_systems_llvm_ir)}}

# Alias for systems-llvm-ir (pure presence; no lake writers).
llvm-ir-presence: systems-llvm-ir

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

# Pure Nix mill extras-fit (HostModuleCheck extras file + mill-class just-line).
# Live impure worktree eval. Does not mill. Does not claim mill GREEN.
systems-mill-extras-fit:
    @nix eval --impure --raw --expr {{quote(_systems_mill_extras_fit)}}

# Optional idris2 --check on dual examples. Skip GREEN if idris2 missing; RED if check fails.
# Static presence: just idris-side. Module names match basenames (ConsumeToken, ...).
