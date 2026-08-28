import Lake
open Lake DSL

/-
Monorepo root Lake workspace (thin umbrella).

Product host package is SystemsLean under src/systems (path require).
Lean dual side is SystemsLeanLean4 under src/lean4 (path require).
Root package name is Iso so it does not collide with SystemsLean.

Offline only: no mathlib, no remote git deps.
Not freestanding residual free. Not product C. Not a product lib/exe home.
-/

package Iso where
  version := v!"0.1.0"

require SystemsLean from "src" / "systems"
require SystemsLeanLean4 from "src" / "lean4"
