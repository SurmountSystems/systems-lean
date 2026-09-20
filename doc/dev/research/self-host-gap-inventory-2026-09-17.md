# Self-host gap inventory (2026-09-17)

Kind: analysis only. Not residual.

ASCII only. Plain American English. Date: 2026-09-17.
This note does **not** flip FullHost. It does **not** claim Lake-gone.
Occupancy is a closed isolation subset, not a count goal.
Mill 69 of 69 is produce of host-tool ELFs, not package typecheck.

**Prior pointers (do not re-paste):**
`doc/dev/research/full-host-package-elaborate-meet-2026-08-12.md`,
`doc/dev/research/c2-fullhost-bar-criteria-2026-08-10.md`.

---

## What Lake still typechecks and builds for `src/systems`

Lake still owns the full-package job for the SystemsLean library under
`src/systems/`. The package default target is `lean_lib SystemsLean`.
The invocation that still does that job is `(cd src/systems && lake build)`
with no module target. The named bench that does **not** skip on hostname
horizon is `just bench-lake-host`. Recipe `just systems-lake` also calls
that Lake build on **surmount-1**, but on this laptop it skip-GREENs and
must not be used as the FullHost bar.

That full-package Lake build typechecks imported module bodies (defs,
inductives, instances, and proof terms) and builds the host tools that
the lakefile lists. Occupancy isolation is a **49-name** closed subset
proved by Lake as `lake build SystemsLean.OccupancyProbe`. That prove
is not the package. Do not claim 50 occupancy names. Do not treat
occupancy as the typecheck goal.

---

## What Slake does not own

Slake does **not** own whole-package typecheck of `src/systems`.
The living Lean bool `slakeOwnsPackageTypecheck` in `SystemsLean.ElabMeet`
is **false**. There is no Lean def named FullHost. FullHost stays unclaimed.

Partial structural `just host-module-check-without-lake` is GREEN today.
That recipe is key-decl greps plus a kind-surface band. It is **not**
kernel typecheck of the package. Do not treat it as the bar.

Mill **69 of 69** host tools without Lake on the mill step (`just N-host-tool`
is lean then leanc) is **produce**. Freestanding product self-host complete
is **produce** of the product wire. Neither is "Slake typechecks
`src/systems`." Host elaborator residual free claimed under free bar (a)
is day-to-day tools without Lake on the step. It is not whole-package
typecheck and not Lake-gone.

Slake typechecks a named occupancy subset only (**49 of about 206**).
The rest of the seed still needs Lake for honest kernel judgments.

---

## First command that should succeed when FullHost is honestly true

Named first failing command (the contract):

```
just slake-typecheck-src-systems
```

That recipe is the Slake-owned replacement for the Lake job
`(cd src/systems && lake build)` / `just bench-lake-host`. Today it must
FAIL (red). When FullHost is honestly true it must exit 0 because Slake
actually typechecks `src/systems`, not because a stub prints success.

Observed this slice (hostname horizon, 2026-09-17):

```
just slake-typecheck-src-systems
```

Exit **1**. Banner includes `slakeOwnsPackageTypecheck false`.
It does **not** skip-GREEN on horizon.

Do **not** name occupancy isolation or mill 69 as that command.
Do **not** use `just systems-lake` (skip-GREEN on horizon).
Do **not** use `just host-module-check-without-lake` (already GREEN
PARTIAL-STRUCTURAL).

The recipe lives in `just/dual-side.just`. It is **not** folded into
`just check`. It is not a real elaborator. It is the named failing
command until a later Name implements typecheck.

Residual Open Name: **Slake typechecks src/systems**
(`RESIDUAL-systems.md`). Two-target emit program stays OPEN as a
banner. This inventory does not replace that banner.
