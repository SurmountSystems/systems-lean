# Self-host product-path archive (closed)

**Role:** Closed Track 3 / claim B partial B2..B40 + Full step-contract ladder essays.
**Living tip / acceptance SSoT:** `self-host.md` (thin living index).
**Kind:** product acceptance archive (not residual ledger; not analysis-only research).

Living claim bools (complete / free / PROVABLY / Lake / host residual / llvm)
are **not** re-decided here. Archive may still show land-time partial language;
living tip on `self-host.md` wins.

Greppable honesty tokens for gates stay on `self-host.md`. This file holds
closed narrative only.

---

## Freestanding kernel rebuild evidence (Track 3 / claim B) -- partial

**Greppable:** SELF-HOST-KERNEL-REBUILD, HOST-SELF-HOST-KERNEL-REBUILD,
SLAKE_SELF_HOST_KERNEL_REBUILD_V0, freestanding kernel rebuild evidence,
freestandingProductSelfHostComplete, HOST-EMIT-MULT, HOST-EMIT-LINEAR,
HOST-EMIT-ERASURE, HOST-EMIT-TYPES, HOST-EMIT-PROGRAM, HOST-EMIT-EXTRACT,
HOST-EMIT-GRAPH, HOST-EMIT-COMPOSE, HOST-EMIT-PLAN, HOST-EMIT-APPLY,
HOST-EMIT-BODY, HOST-EMIT-SSOT, SLAKE_EMIT_FREESTANDING_C_V0, RUNTIME-FS

**Status (2026-07-29):** **partial B**. Measured host-driven freestanding emit
path regenerates the stated kernel (and the full Mult..Out host-owned surface)
on the product wire greppably. Claim **B freestanding product self-host complete**
stays **false**. SelfHostBody is **compile-step readiness only** -- not this bar.

### Stated self-host kernel set

| Role | Units | Why |
|------|-------|-----|
| **B bar minimum (default)** | Mult + Linear + Erasure + Types + IR program | Plan default for claim B kernel coverage |
| **Measured regenerate set (this evidence)** | Mult..Out (Mult, Linear, Erasure, Extract, Types, IR program, IR graph, host compose, emit plan, emit apply, emit **Out** / wire `EMIT_BODY_V0`) | All host-owned HOST-EMIT-* stages present on product wire after rebuild; expands the default minimum with greppable evidence |

Default minimum is a **subset** of the measured Mult..Out set. Expanding the
measured set does **not** flip `freestandingProductSelfHostComplete`.

### Rebuild path (measured, not Bool canary)

1. `just build`
   - compile-path shell stamp deleted (`SLAKE_COMPILE_PATH_V0` honesty only);
     static unit walk pure Nix; host `SLAKE_COMPILE_PATH_V1` / `HOST-COMPILE-PATH`
   - official product writer: freestanding-capable-regenerate (dual-eq WRITE);
     diagnostic Lake path `slake-emit-freestanding-c` remains
   - writes/installs `src/systems/emit/slake_freestanding.{h,c}` and
     `out/freestanding-c/` (release surface)
2. Optional product-path freestanding object compile (no managed runtime link):
   `cc -c -std=c11 -ffreestanding -nostdlib -I out/freestanding-c \
      -o /tmp/slake_freestanding.o out/freestanding-c/slake_freestanding.c`
3. Grep product wire + release copy for kernel contracts (emit and out must
   match byte-identical after a clean `just build`).

### Greppable kernel contracts (evidence tokens)

After a green rebuild, both `src/systems/emit/slake_freestanding.{h,c}` and
`out/freestanding-c/slake_freestanding.{h,c}` must contain:

| Kernel / stage | Ownership / stage tokens | API / grade samples |
|----------------|--------------------------|---------------------|
| Mult | HOST-EMIT-MULT; MULT-0 / MULT-1 / MULT-OMEGA | `slake_mult_is_valid` |
| Linear | HOST-EMIT-LINEAR; LINEAR-EXACT-ONCE | `slake_linear_consume` |
| Erasure | HOST-EMIT-ERASURE | `slake_erasure_is_runtime_absent` |
| Types | HOST-EMIT-TYPES; TYPED_IR_V0 | `slake_type_tag` |
| IR program | HOST-EMIT-PROGRAM; IR_PROGRAM_V0 | `slake_ir_program` |
| Extract (measured expand) | HOST-EMIT-EXTRACT; FAIL_CLOSED_CHECKER_V1; RUNTIME-FS | extract / check APIs |
| IR graph (measured expand) | HOST-EMIT-GRAPH; IR_GRAPH_EDGES_V0 | graph APIs |
| Host compose (measured expand) | HOST-EMIT-COMPOSE; HOST_COMPOSE_V0 | compose APIs |
| Emit plan (measured expand) | HOST-EMIT-PLAN; EMIT_PLAN_V0 | plan APIs |
| Emit apply (measured expand) | HOST-EMIT-APPLY; EMIT_APPLY_V0 | apply APIs |
| Emit Out (measured expand) | HOST-EMIT-BODY; HOST-EMIT-SSOT; EMIT_BODY_V0 | body scaffolding |
| Emit stage | SLAKE_EMIT_FREESTANDING_C_V0 | writer stage id |

**Commands used for this partial close (2026-07-29):**

```bash
just build
# greps: HOST-EMIT-MULT|LINEAR|ERASURE|TYPES|PROGRAM (+ Mult..Out expand) on
#   src/systems/emit/slake_freestanding.{h,c} and out/freestanding-c/*
sha256sum src/systems/emit/slake_freestanding.{h,c} out/freestanding-c/slake_freestanding.{h,c}
cc -c -std=c11 -ffreestanding -nostdlib -I out/freestanding-c \
  -o /tmp/slake_freestanding.o out/freestanding-c/slake_freestanding.c
```

Result that day: emit and out **sha256-identical**; freestanding `cc -c` **green**;
all Mult..Out HOST-EMIT-* tokens present with positive counts on both surfaces.

### What this proves vs what it does not

| Proved (partial B) | Still false / not claimed |
|--------------------|---------------------------|
| Host FreestandingEmit rebuild regenerates stated kernel + Mult..Out contracts on product wire | `freestandingProductSelfHostComplete` (**false** in SelfApplyFs / SelfHostBody / LlvmHold) |
| Release copy matches product wire after rebuild | residual free (either side) |
| Freestanding TU compile of regenerated C succeeds (`-ffreestanding -nostdlib`) | Full Slake source self-application by freestanding product path |
| Greppable contracts, not host Bool canaries alone | proof complete / PROVABLY / llvm unlock |
| SelfHostBody compile-step readiness remains a **separate** pin | Product binary rebuilds kernel without classic Lake bootstrap |

### Flip policy for `freestandingProductSelfHostComplete`

Flip **only** when a later residual lands greppable evidence that a **freestanding
product path** (not host readiness canaries alone) rebuilds the stated kernel
with honesty non-claims for residual free / PROVABLY / llvm as appropriate.
Until then the flag stays **false** (proved false). Host Lake bootstrap remains
allowed for development indefinitely; product wire freestanding is the claim bar.

### Relation to SelfHostBody

| Pin | Meaning |
|-----|---------|
| SelfHostBody / `selfHostBodyReady` | Defined freestanding **compile step** readiness (Mult..Out emit owned + stage cite) |
| This section | Measured **kernel rebuild evidence** on product wire / freestanding path |
| Claim B complete | Full freestanding product self-host complete -- **open** |

---

## Product kernel self-application (Track 3 / claim B) -- partial B2

**Greppable:** SELF-HOST-KERNEL-SELF-APPLY, HOST-SELF-HOST-KERNEL-SELF-APPLY,
SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0, product kernel self-application,
productKernelSelfApplyPartialReady, freestandingProductSelfHostComplete,
SELF-HOST-KERNEL-REBUILD, HOST-EMIT-MULT, HOST-EMIT-LINEAR, HOST-EMIT-ERASURE,
HOST-EMIT-TYPES, HOST-EMIT-PROGRAM, SLAKE_EMIT_FREESTANDING_C_V0

**Status (2026-07-29):** **partial B2**. Acceptance names the exact kernel inputs
a freestanding **product** path must accept for claim B complete. Automated pure
Nix + host pin evidence advances beyond manual greps and "host Lake writes wire
only" narrative alone. Claim **B freestanding product self-host complete** stays
**false**. Full product freestanding rebuild of Systems Lean sources **without**
classic Lean on the product wire as the product path is **not** claimed.

### Kernel inputs the product path accepts (complete bar)

| Role | Units | Notes |
|------|-------|-------|
| **Default complete bar (B)** | Mult + Linear + Erasure + Types + IR program | Plan default; must be present as freestanding product contracts (HOST-EMIT-* + APIs) |
| **Measured product surface (this slice)** | Same default minimum, greppably on emit + out | Mult..Out ownership remains on wire; complete does not require inventing Mult..Out as "compiler sources" |
| **Out of scope for complete flip** | residual free, proof complete, PROVABLY, llvm | Separate claims; must stay false unless their own bars pass |

Expanding measured regenerate to Mult..Out does **not** flip complete. Complete
requires a freestanding **product** path that rebuilds the default kernel
contracts without selling host Lake FreestandingEmit bootstrap alone as the
product path.

### What complete would require (honest flip policy)

Flip `freestandingProductSelfHostComplete` to **true** only when **all** hold:

1. Stated kernel inputs above are accepted by a documented freestanding product
   path (not host readiness Bool canaries alone).
2. That path rebuilds those kernel freestanding C contracts on `emit/` and
   `out/freestanding-c` with greppable evidence.
3. Product wire freestanding story does not depend on classic Lean **as the
   product path** (Lake may still bootstrap **host** tools).
4. residual free / proof complete / llvm / PROVABLY remain false unless their
   separate bars pass (do not piggyback).

Until then the flag stays **false** (proved false in SelfApplyFs / SelfHostBody /
LlvmHold).

### Partial B2 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + SELF-HOST-KERNEL-REBUILD kernel set | Complete flip |
| **Host pin** | `SelfApplyFs.productKernelSelfApplyPartialReady` (B-bar surface + freestanding deepen + complete false) | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire`: when release `out/freestanding-c` is present, emit and out must be **byte-identical**; HOST-EMIT-* B-bar tokens already required on product wire | Running emit without Lake; llvm unlock |
| **Product object exercise** | `just build` + freestanding-first `cc -c` + hosted behavioral probe against product wire (`check.sh`) | Product path that parses Systems Lean sources |

**Commands (partial B2 evidence loop):**

```bash
just build
just systems-emit-wire   # emit/out match when out present; HOST-EMIT product tokens
just systems-host        # SELF-HOST-KERNEL-SELF-APPLY acceptance + SelfApplyFs pin
./src/systems/check.sh   # regenerate + freestanding compile + behavioral probe
```

### Proved vs not (partial B2)

| Proved (partial B2) | Still false / not claimed |
|---------------------|---------------------------|
| Exact kernel inputs for complete bar named in acceptance | `freestandingProductSelfHostComplete` |
| Host Lean pin `productKernelSelfApplyPartialReady` with complete false | residual free / proof complete / PROVABLY / llvm |
| Automated emit/out identity when release present | Freestanding product path compiles Systems Lean / Slake sources |
| Product wire still exercises Mult+Linear+Erasure+Types+IR program contracts (probe + freestanding `cc`) | Host Lake emit writer retired as bootstrap |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-KERNEL-REBUILD | Measured host-driven Mult..Out regenerate evidence (partial B) |
| SELF-HOST-KERNEL-SELF-APPLY (this section) | Product-path acceptance + automated product-surface evidence (partial B2) |
| SELF-HOST-PRODUCT-OUT | Out-first B-bar kernel evidence on product Out (partial B3) |
| SelfHostBody | Compile-step readiness only |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product Out kernel evidence (Track 3 / claim B) -- partial B3

**Greppable:** SELF-HOST-PRODUCT-OUT, HOST-SELF-HOST-PRODUCT-OUT,
SLAKE_SELF_HOST_PRODUCT_OUT_V0, product Out kernel evidence,
productOutKernelEvidencePartialReady, freestandingProductSelfHostComplete,
out/freestanding-c/, HOST-EMIT-MULT, HOST-EMIT-LINEAR, HOST-EMIT-ERASURE,
HOST-EMIT-TYPES, HOST-EMIT-PROGRAM, slake_mult_is_valid, slake_linear_consume,
slake_erasure_is_runtime_absent, slake_type_tag, slake_ir_program

**Status (2026-07-29):** **partial B3**. Product **Out** (`out/freestanding-c/`)
is the claim-B evidence home for greppable default B-bar kernel contracts beyond
B2 emit/out match + host pin narrative alone. Automated pure Nix requires B-bar
HOST-EMIT ownership and freestanding APIs on Out when release is present. Host
pin `productOutKernelEvidencePartialReady` folds B2 partial + Out surface cites.
Claim **B freestanding product self-host complete** stays **false**. Full
freestanding product rebuild of Systems Lean / Slake sources **without** classic
Lean as the product path is **not** claimed.

### Product Out as evidence home

| Surface | Role for claim B |
|---------|------------------|
| **Product Out** (`out/freestanding-c/`) | Primary greppable evidence home for freestanding product path contracts |
| **Host workspace emit/** (`src/systems/emit/`) | Generator dogfood / FreestandingEmit write target; not a peer product peer |
| **Host Lake** | May bootstrap emit writer indefinitely; not sold as the product path bar |

### B-bar contracts required on product Out (when release present)

| Kernel | Ownership token | API sample |
|--------|-----------------|------------|
| Mult | HOST-EMIT-MULT | `slake_mult_is_valid` |
| Linear | HOST-EMIT-LINEAR | `slake_linear_consume` |
| Erasure | HOST-EMIT-ERASURE | `slake_erasure_is_runtime_absent` |
| Types | HOST-EMIT-TYPES | `slake_type_tag` |
| IR program | HOST-EMIT-PROGRAM | `slake_ir_program` |

Both `out/freestanding-c/slake_freestanding.h` and `.c` must carry these when
release is present. Missing Out is still OK (optional release); present-but-thin
fails closed.

### Partial B3 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + prior B / B2 kernel set | Complete flip |
| **Host pin** | `SelfApplyFs.productOutKernelEvidencePartialReady` (B2 + Out path/API cites + complete false) | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-OUT: B-bar ownership + APIs on Out when release present (`productOutKernelEvidenceGreen`) | Running emit without Lake; llvm unlock |
| **Product object exercise** | Prior B/B2 freestanding `cc -c` + probe against product wire still apply | Product path that parses Systems Lean sources |

**Commands (partial B3 evidence loop):**

```bash
just build
just systems-emit-wire   # SELF-HOST-PRODUCT-OUT B-bar on Out when present; emit/out match
just systems-host        # SELF-HOST-PRODUCT-OUT acceptance + SelfApplyFs pin
./src/systems/check.sh   # regenerate + freestanding compile + behavioral probe
```

### Proved vs not (partial B3)

| Proved (partial B3) | Still false / not claimed |
|---------------------|---------------------------|
| Out-first B-bar ownership + APIs greppable on product Out when release present | `freestandingProductSelfHostComplete` |
| Host Lean pin `productOutKernelEvidencePartialReady` with complete false | residual free / proof complete / PROVABLY / llvm |
| pure Nix `productOutKernelEvidenceGreen` when Out present and B-bar holds | Freestanding product path compiles Systems Lean / Slake sources |
| Beyond B2: explicit Out-first claim-B gate (not only emit/out identity) | Host Lake emit writer retired as bootstrap |

### Remaining Done when for claim B complete

Flip `freestandingProductSelfHostComplete` only when **all** prior flip-policy
items hold **and** a freestanding **product** path rebuilds the stated kernel
without classic Lean as the product path (Lake may still bootstrap host tools).
Until that residual lands, this Open Name stays open with complete **false**.
See also **Product path Lake bootstrap** (partial B4) for the explicit writer
vs consumer honesty gap.

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-KERNEL-REBUILD | Measured Mult..Out regenerate (partial B) |
| SELF-HOST-KERNEL-SELF-APPLY | Product-path acceptance + emit/out match (partial B2) |
| SELF-HOST-PRODUCT-OUT (this section) | Out-first B-bar kernel evidence (partial B3) |
| SELF-HOST-PRODUCT-PATH-BOOTSTRAP | Host Lake writer bootstrap honesty (partial B4) |
| SELF-HOST-PRODUCT-WRITER-SURFACE | Product Out writer plan/apply/body substrate (partial B5) |
| SelfHostBody | Compile-step readiness only |
| Claim B complete | Full freestanding product self-host -- **open** |

---

## Product path Lake bootstrap (Track 3 / claim B) -- partial B4

**Greppable:** SELF-HOST-PRODUCT-PATH-BOOTSTRAP, HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP,
SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0, product path Lake bootstrap,
productPathHostLakeBootstrapRemains, productPathHostLakeBootstrapPartialReady,
productPathBootstrapSurfaceOk, hostLakeEmitWriterPath, FreestandingEmit,
slake-emit-freestanding-c, SLAKE_EMIT_FREESTANDING_C_V0, freestandingProductSelfHostComplete,
SELF-HOST-PRODUCT-OUT, out/freestanding-c/

**Status (2026-07-29):** **partial B4**. Documents the honest residual that
product wire is still **written** by host Lake emit (`SystemsLean.FreestandingEmit`
/ lake exe `slake-emit-freestanding-c`) even though claim-B **consumers** are
Out-first (`out/freestanding-c/`, partial B3). Host pin
`productPathHostLakeBootstrapRemains` is **true** (bootstrap remains).
`productPathHostLakeBootstrapPartialReady` folds B3 Out evidence + bootstrap
remains + surface cites + complete **false**. Claim **B freestanding product
self-host complete** stays **false**. Selling host Lake FreestandingEmit as the
product path bar for complete is **forbidden**.

### Writer vs consumer roles (product path honesty)

| Role | Path / owner | Claim-B meaning |
|------|----------------|-----------------|
| **Product writer (bootstrap)** | Host Lake `FreestandingEmit` / `slake-emit-freestanding-c` writes `src/systems/emit/slake_freestanding.{h,c}` then `just build` copies release | **Bootstrap residual remains** (`productPathHostLakeBootstrapRemains` true). Not the freestanding product path bar for complete. |
| **Product consumer evidence (Out)** | `out/freestanding-c/` B-bar ownership + APIs (partial B3) | Out-first greppable contracts for Mult+Linear+Erasure+Types+IR program |
| **Host tools** | Classic Lake elaborator, Lake build, presence gates | May bootstrap host tools indefinitely; never sold as freestanding product self-host complete |

### Partial B4 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + prior B / B2 / B3 | Complete flip |
| **Host pin** | `SelfApplyFs.productPathHostLakeBootstrapPartialReady` (B3 + bootstrap remains true + complete false) | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-BOOTSTRAP: FreestandingEmit still owns writer stage + acceptance honesty; when release present, B3 Out B-bar still green (`productPathHostLakeBootstrapGreen`) | Retiring Lake as product writer; llvm unlock |
| **Remaining gap (checkable)** | Freestanding **product writer** path that rebuilds stated kernel freestanding C contracts without classic Lean **as the product path** | Host canary theater; re-landing B3 under a new name |

**Commands (partial B4 evidence loop):**

```bash
just build
just systems-emit-wire   # SELF-HOST-PRODUCT-PATH-BOOTSTRAP + SELF-HOST-PRODUCT-OUT
just systems-host        # SELF-HOST-PRODUCT-PATH-BOOTSTRAP acceptance + SelfApplyFs pin
./src/systems/check.sh   # regenerate + freestanding compile + behavioral probe
```

### Next mechanical steps toward complete (not this slice)

1. Keep Out-first B-bar consumer evidence green (B3; do not drop).
2. Keep product writer surface substrate green (B5; plan/apply/body on Out).
3. Grow freestanding product **writer path** so product wire regeneration does
   not depend on classic Lake FreestandingEmit **as the product path** (Lake may
   still bootstrap host tools; surface contracts alone are not the full path).
4. Only then consider flip policy for `freestandingProductSelfHostComplete`
   (still requires residual free / proof / llvm / PROVABLY honesty non-claims).

### Proved vs not (partial B4)

| Proved (partial B4) | Still false / not claimed |
|---------------------|---------------------------|
| Host Lake FreestandingEmit still writes product wire (bootstrap remains true) | `freestandingProductSelfHostComplete` |
| Host Lean pin `productPathHostLakeBootstrapPartialReady` with complete false | residual free / proof complete / PROVABLY / llvm |
| pure Nix writer + honesty gate; Out B-bar remains consumer evidence | Freestanding product writer path of Systems Lean / Slake sources |
| Explicit remaining gap: freestanding product writer path (checkable) | Host Lake emit writer retired as product path |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-KERNEL-REBUILD | Measured Mult..Out regenerate (partial B) |
| SELF-HOST-KERNEL-SELF-APPLY | Product-path acceptance + emit/out match (partial B2) |
| SELF-HOST-PRODUCT-OUT | Out-first B-bar kernel evidence (partial B3) |
| SELF-HOST-PRODUCT-PATH-BOOTSTRAP (this section) | Host Lake writer bootstrap honesty (partial B4) |
| SELF-HOST-PRODUCT-WRITER-SURFACE | Product Out writer plan/apply/body substrate (partial B5) |
| SELF-HOST-PRODUCT-WRITER-PATH-PLAN | Ordered freestanding-capable regenerate plan (partial B6) |
| SELF-HOST-PRODUCT-WRITER-PATH-EXEC | Host path execution of plan steps (partial B7) |
| SelfHostBody | Compile-step readiness only |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product writer surface (Track 3 / claim B) -- partial B5

**Greppable:** SELF-HOST-PRODUCT-WRITER-SURFACE, HOST-SELF-HOST-PRODUCT-WRITER-SURFACE,
SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0, product writer surface,
productWriterSurfacePartialReady, productWriterSurfaceOk,
slake_emit_plan_from_compose, slake_emit_apply_from_compose,
slake_emit_body_from_compose, HOST-EMIT-PLAN, HOST-EMIT-APPLY, HOST-EMIT-BODY,
productPathHostLakeBootstrapRemains, freestandingProductSelfHostComplete,
out/freestanding-c/, SELF-HOST-PRODUCT-PATH-BOOTSTRAP, SELF-HOST-PRODUCT-OUT

**Status (2026-07-29):** **partial B5**. Lands the first real **product writer
surface substrate**: product Out (`out/freestanding-c/`) greppably exposes
emit plan / apply / body writer contracts (regenerate fragments from host
compose) plus B-bar kernel APIs, as the product-side step toward a freestanding
writer path. Host Lake `FreestandingEmit` still performs **full** product text
regeneration (`productPathHostLakeBootstrapRemains` true via B4). Claim **B
freestanding product self-host complete** stays **false**. Selling plan/apply/body
APIs alone as freestanding product self-host complete is **forbidden**.

### Writer surface vs full writer path

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Writer surface (this partial)** | Greppable plan/apply/body APIs + HOST-EMIT-PLAN/APPLY/BODY + B-bar on product Out | Full freestanding regenerate of Mult..IR program freestanding C without Lake as product path |
| **Bootstrap writer (B4)** | Host Lake FreestandingEmit still writes `emit/` then Out copy | Product path bar for complete |
| **Complete bar (open)** | Freestanding product writer path rebuilds stated kernel freestanding C without classic Lean as product path | This slice |

### Writer contracts required on product Out (when release present)

| Kind | Tokens / APIs |
|------|----------------|
| **Writer ownership** | HOST-EMIT-PLAN, HOST-EMIT-APPLY, HOST-EMIT-BODY |
| **Writer APIs** | `slake_emit_plan_from_compose`, `slake_emit_apply_from_compose`, `slake_emit_body_from_compose` |
| **B-bar (still required)** | HOST-EMIT-MULT..PROGRAM + `slake_mult_is_valid` .. `slake_ir_program` (B3; folded) |

### Partial B5 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B4 bootstrap honesty | Complete flip |
| **Host pin** | `SelfApplyFs.productWriterSurfacePartialReady` (B4 + writer surface + complete false) | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-WRITER-SURFACE: acceptance + host pin; when release present, plan/apply/body ownership+APIs on Out and B3 B-bar green (`productWriterSurfaceGreen`) | Retiring Lake as product writer; llvm unlock |
| **Remaining gap (checkable)** | Freestanding **product writer path** that rebuilds Mult+Linear+Erasure+Types+IR program freestanding C without classic Lean **as the product path** | Re-landing B3/B4 under a new name; surface-only theater as complete |

**Commands (partial B5 evidence loop):**

```bash
just build
just systems-emit-wire   # SELF-HOST-PRODUCT-WRITER-SURFACE + B4 + B3
just systems-host        # SELF-HOST-PRODUCT-WRITER-SURFACE acceptance + SelfApplyFs pin
./src/systems/check.sh   # regenerate + freestanding compile + behavioral probe
```

### Next mechanical steps toward complete (not this slice)

1. Keep B3 Out B-bar and B5 writer surface green (do not drop).
2. Keep partial B6 **writer path plan** and partial B7 **writer path execution**
   green -- see **Product writer path plan (partial B6)** and **Product writer
   path execution (partial B7)**.
3. Grow freestanding product path **ownership** of regenerate without Lake
   FreestandingEmit as the product path (Lake may still bootstrap host tools).
4. Do **not** open a residual that only re-greps already-gated Out/emit writer
   tokens or re-lists plan step ids under a new stage id -- theater, not progress.
5. Only then consider flip policy for `freestandingProductSelfHostComplete`
   (still requires residual free / proof / llvm / PROVABLY honesty non-claims).

### Proved vs not (partial B5)

| Proved (partial B5) | Still false / not claimed |
|---------------------|---------------------------|
| Product Out ships plan/apply/body writer APIs + ownership + B-bar | `freestandingProductSelfHostComplete` |
| Host Lean pin `productWriterSurfacePartialReady` with complete false | residual free / proof complete / PROVABLY / llvm |
| pure Nix named writer-surface gate (acceptance + host fold B4 + Out scan); B4 bootstrap remains true | Freestanding product **writer path** of Systems Lean / Slake sources |
| Named claim-B substrate toward freestanding writer (checkable; not B3/B4 rename) | Host Lake emit writer retired as product path |
| When release present, Out tokens partly overlap emit SSOT + B2 emit/out match | New freestanding regenerate **behavior** (B5 is surface evidence, not path) |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-KERNEL-REBUILD | Measured Mult..Out regenerate (partial B) |
| SELF-HOST-KERNEL-SELF-APPLY | Product-path acceptance + emit/out match (partial B2) |
| SELF-HOST-PRODUCT-OUT | Out-first B-bar kernel evidence (partial B3) |
| SELF-HOST-PRODUCT-PATH-BOOTSTRAP | Host Lake writer bootstrap honesty (partial B4) |
| SELF-HOST-PRODUCT-WRITER-SURFACE (this section) | Product Out writer plan/apply/body substrate (partial B5) |
| SELF-HOST-PRODUCT-WRITER-PATH-PLAN | Ordered freestanding-capable regenerate plan (partial B6) |
| SELF-HOST-PRODUCT-WRITER-PATH-EXEC | Host path execution of plan steps (partial B7) |
| SelfHostBody | Compile-step readiness only |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product writer path plan (Track 3 / claim B) -- partial B6

**Greppable:** SELF-HOST-PRODUCT-WRITER-PATH-PLAN, HOST-SELF-HOST-PRODUCT-WRITER-PATH-PLAN,
SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_PLAN_V0, product writer path plan,
productWriterPathPlanPartialReady, productWriterPathPlanOk,
productWriterPathStepReadSsot, productWriterPathStepCompose,
productWriterPathStepWriteWire, productWriterPathStepInstallOut,
WRITER-PATH-STEP-READ-SSOT, WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY,
WRITER-PATH-STEP-WRITE-FREESTANDING-HC, WRITER-PATH-STEP-INSTALL-OUT,
productPathHostLakeBootstrapRemains, freestandingProductSelfHostComplete,
SELF-HOST-PRODUCT-WRITER-SURFACE, SELF-HOST-PRODUCT-PATH-BOOTSTRAP,
out/freestanding-c/, FreestandingEmit, SLAKE_EMIT_FREESTANDING_C_V0

**Status (2026-07-29):** **partial B6**. Lands a checkable **host Lean freestanding
regenerate plan** (writer path plan substrate): ordered freestanding-capable
regenerate steps the product path must eventually own, without classic Lake
elaborating FreestandingEmit as the product path. Host Lake FreestandingEmit
still writes full product text today (`productPathHostLakeBootstrapRemains` true
via B4). Claim **B freestanding product self-host complete** stays **false**.
This is **not** a B6 that only re-greps already-gated plan/apply/body / B-bar
tokens (surface re-grep theater is **banned**; B5 already gates that surface).

### Ordered freestanding-capable regenerate plan (product path must eventually own)

| Order | Step id | What the product path must eventually do |
|-------|---------|------------------------------------------|
| 1 | WRITER-PATH-STEP-READ-SSOT | Read Mult..Out host SSOT fragments and dual SSOT equality inputs (host_emit_*.ssot.txt + Lean fragment SSOT) |
| 2 | WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY | Compose emit plan / apply / body (and Mult..IR program text) from host compose without Lake as product path |
| 3 | WRITER-PATH-STEP-WRITE-FREESTANDING-HC | Write freestanding `slake_freestanding.{h,c}` product wire text |
| 4 | WRITER-PATH-STEP-INSTALL-OUT | Install / publish product Out under `out/freestanding-c/` |

**Today:** Lake exe `slake-emit-freestanding-c` (`SystemsLean.FreestandingEmit`,
stage `SLAKE_EMIT_FREESTANDING_C_V0`) still performs steps 1-3 as **bootstrap
writer**; `just build` performs step 4. The plan names what the
**freestanding product path** must own for complete; it does not claim ownership
yet.

### Plan vs surface vs complete

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Writer surface (B5)** | Greppable plan/apply/body APIs + ownership + B-bar on product Out | Ordered regenerate plan; freestanding ownership |
| **Writer path plan (this partial)** | Named ordered steps + host pin fold true only for plan substrate | Full freestanding product-path regenerate without Lake |
| **Bootstrap writer (B4)** | Host Lake FreestandingEmit still writes emit then Out copy | Product path bar for complete |
| **Complete bar (open)** | Product path owns the plan steps end-to-end without classic Lean as product path | This slice |

### Partial B6 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B5 surface + B4 bootstrap honesty | Complete flip |
| **Host pin** | `SelfApplyFs.productWriterPathPlanPartialReady` (B5 + plan step ids + bootstrap remains + complete false) | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-WRITER-PATH-PLAN: acceptance + host pin step ids; B4 FreestandingEmit bootstrap still documented; when release present, B5 writer surface green (`productWriterPathPlanGreen`) | Retiring Lake as product writer; llvm unlock |
| **Remaining gap (checkable)** | Partial B7 host-exec **landed** (see **Product writer path execution**); remaining complete bar = freestanding product path **owns** regenerate without classic Lean as product path | Re-landing B3/B4/B5/B6 plan-id or B7 host-exec re-grep theater as complete |

**Commands (partial B6 evidence loop):**

```bash
just build
just systems-emit-wire   # SELF-HOST-PRODUCT-WRITER-PATH-PLAN + B5 + B4 + B3
just systems-host        # SELF-HOST-PRODUCT-WRITER-PATH-PLAN acceptance + SelfApplyFs pin
./src/systems/check.sh   # regenerate + freestanding compile + behavioral probe
```

### Next mechanical steps toward complete (not B6 alone)

1. Keep B3 Out B-bar, B5 writer surface, and B6 writer path **plan** green (do not drop).
2. Keep partial B7 **writer path execution** green (SELF-HOST-PRODUCT-WRITER-PATH-EXEC);
   do not re-land plan-id or host-exec re-grep theater.
3. Grow freestanding-capable regenerate substrate that owns those steps without
   Lake FreestandingEmit as the **product path** (Lake may still bootstrap host tools).
4. Do **not** re-land B6 plan under a new stage id with only step-id presence,
   or re-grep already-gated Out/emit writer surface tokens, without new evidence.
5. Only then consider flip policy for `freestandingProductSelfHostComplete`
   (still requires residual free / proof / llvm / PROVABLY honesty non-claims).

### Proved vs not (partial B6)

| Proved (partial B6) | Still false / not claimed |
|---------------------|---------------------------|
| Host Lean names ordered freestanding-capable regenerate plan steps | `freestandingProductSelfHostComplete` |
| Host Lean pin `productWriterPathPlanPartialReady` with complete false | residual free / proof complete / PROVABLY / llvm |
| pure Nix named writer-path-plan gate (acceptance + host fold B5 + B4 bootstrap remains); B5 surface still green when release present | Freestanding product path owns plan without Lake as product path |
| Plan substrate is beyond B5 surface re-grep (step ids + ownership of plan, not APIs alone) | Host Lake emit writer retired as product path |
| productPathHostLakeBootstrapRemains stays true | (Execution evidence is partial B7, not B6) |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-KERNEL-REBUILD | Measured Mult..Out regenerate (partial B) |
| SELF-HOST-KERNEL-SELF-APPLY | Product-path acceptance + emit/out match (partial B2) |
| SELF-HOST-PRODUCT-OUT | Out-first B-bar kernel evidence (partial B3) |
| SELF-HOST-PRODUCT-PATH-BOOTSTRAP | Host Lake writer bootstrap honesty (partial B4) |
| SELF-HOST-PRODUCT-WRITER-SURFACE | Product Out writer plan/apply/body substrate (partial B5) |
| SELF-HOST-PRODUCT-WRITER-PATH-PLAN (this section) | Ordered freestanding-capable regenerate plan (partial B6) |
| SELF-HOST-PRODUCT-WRITER-PATH-EXEC | Host path execution of plan steps (partial B7) |
| SelfHostBody | Compile-step readiness only |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product writer path execution (Track 3 / claim B) -- partial B7

**Greppable:** SELF-HOST-PRODUCT-WRITER-PATH-EXEC, HOST-SELF-HOST-PRODUCT-WRITER-PATH-EXEC,
SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_EXEC_V0, product writer path execution,
productWriterPathExecutionPartialReady, productWriterPathExecutionOk,
productWriterPathExecReadSsotFn, productWriterPathExecComposeFn,
productWriterPathExecWriteFn, productWriterPathExecInstallRecipe,
productWriterPathExecEmitEntry, productWriterPathExecDualSsot,
loadMultSsot, loadBodySsot, loadPlanSsot, requireDualSsotEqual,
renderHeader, renderSource, emitAtRoot, IO.FS.writeFile, just build,
productPathHostLakeBootstrapRemains, freestandingProductSelfHostComplete,
SELF-HOST-PRODUCT-WRITER-PATH-PLAN, SELF-HOST-PRODUCT-WRITER-SURFACE,
SELF-HOST-PRODUCT-PATH-BOOTSTRAP, out/freestanding-c/, FreestandingEmit,
SLAKE_EMIT_FREESTANDING_C_V0

**Status (2026-07-29):** **partial B7**. Lands checkable **host-driven execution
evidence** that the B6 ordered regenerate plan steps are **performed today** by
the host emit path (FreestandingEmit + `just build`), not only named
as plan ids. This is **not** freestanding product self-host complete: Lake still
bootstraps the product writer (`productPathHostLakeBootstrapRemains` true via B4).
Claim **B freestanding product self-host complete** stays **false**.

**Ban (re-plan theater):** Do **not** re-land B6 plan under a new name with only
WRITER-PATH-STEP-* presence. B7 requires **distinct** perform cites (function
names, write/install path strings) on FreestandingEmit / justfile.

### Plan step -> host execution map (measured today)

| B6 plan step | Host path that performs it today | Greppable exec cite (not plan id) |
|--------------|----------------------------------|-----------------------------------|
| WRITER-PATH-STEP-READ-SSOT | FreestandingEmit `load*Ssot` + dual SSOT equality | `loadMultSsot`, `loadBodySsot`, `loadPlanSsot`, `requireDualSsotEqual`, `host_emit_*.ssot.txt` |
| WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY | FreestandingEmit template embed | `renderHeader`, `renderSource`, `embedPlaceholderLine` |
| WRITER-PATH-STEP-WRITE-FREESTANDING-HC | FreestandingEmit write under emit/ | `emitAtRoot`, `IO.FS.writeFile`, `slake_freestanding.h`, `slake_freestanding.c` |
| WRITER-PATH-STEP-INSTALL-OUT | just `just build` copy emit -> Out | `just build`, `cp -f`, `out/freestanding-c` |

**Honesty:** steps 1-3 run under classic Lake elaborating FreestandingEmit (B4
bootstrap remains). Step 4 is thin just process glue (copy). Proved: host path
**executes** the plan on product emit / Out. **Not** proved: freestanding product
path owns those steps without classic Lean as the product path.

### Execution vs plan vs complete

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Writer path plan (B6)** | Named ordered freestanding-capable regenerate steps | Host performs those steps (B7) |
| **Writer path execution (this partial)** | Greppable map that FreestandingEmit + just install **do** each step today | Freestanding product path without Lake as product path |
| **Bootstrap writer (B4)** | Host Lake FreestandingEmit still owns full text regen | Product path bar for complete |
| **Complete bar (open)** | Product path owns plan steps end-to-end without classic Lean as product path | This slice |

### Partial B7 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B6 plan + B5 surface + B4 bootstrap honesty | Complete flip |
| **Host pin** | `SelfApplyFs.productWriterPathExecutionPartialReady` (B6 + exec cites + bootstrap remains + complete false) | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-WRITER-PATH-EXEC: acceptance + host pin exec cites; FreestandingEmit perform tokens; justfile install tokens; when release present, B6 plan green (`productWriterPathExecutionGreen`) | Retiring Lake as product writer; llvm unlock |
| **Remaining gap (checkable)** | Freestanding product path **owns** regenerate without classic Lean as product path (complete bar) | Re-landing B6 plan-only under a new stage id; surface re-grep theater |

**Commands (partial B7 evidence loop):**

```bash
just build
just systems-emit-wire   # SELF-HOST-PRODUCT-WRITER-PATH-EXEC + B6 + B5 + B4 + B3
just systems-host        # SELF-HOST-PRODUCT-WRITER-PATH-EXEC acceptance + SelfApplyFs pin
./src/systems/check.sh   # regenerate + freestanding compile + behavioral probe
```

### Next mechanical steps toward complete (not this slice)

1. Keep B3..B8 green (do not drop ownership inputs, execution, or plan gates).
2. Grow freestanding-capable regenerate ownership that does not require Lake
   elaborating FreestandingEmit as the **product path** (Lake may still bootstrap
   host tools). Partial B8 documents the **input surface** for that ownership;
   ownership claimed stays false until a freestanding-capable path performs it.
3. Do **not** re-land B6/B7/B8 under new names with only plan-id, host-exec, or
   path-string re-grep theater.
4. Only then consider flip policy for `productPathFreestandingOwnershipClaimed`
   and later `freestandingProductSelfHostComplete` (still requires residual free
   / proof / llvm / PROVABLY honesty non-claims).

### Proved vs not (partial B7)

| Proved (partial B7) | Still false / not claimed |
|---------------------|---------------------------|
| Host Lean pin maps B6 plan steps to FreestandingEmit / just perform cites | `freestandingProductSelfHostComplete` |
| Host Lean pin `productWriterPathExecutionPartialReady` with complete false | residual free / proof complete / PROVABLY / llvm |
| pure Nix fail-closed: FreestandingEmit greppably implements load/render/write; justfile greppably installs Out | Freestanding product path without Lake as product path |
| Execution evidence is beyond B6 plan-id presence (function names + write/install paths) | Host Lake emit writer retired as product path |
| productPathHostLakeBootstrapRemains stays true | Complete flip |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-KERNEL-REBUILD | Measured Mult..Out regenerate (partial B) |
| SELF-HOST-KERNEL-SELF-APPLY | Product-path acceptance + emit/out match (partial B2) |
| SELF-HOST-PRODUCT-OUT | Out-first B-bar kernel evidence (partial B3) |
| SELF-HOST-PRODUCT-PATH-BOOTSTRAP | Host Lake writer bootstrap honesty (partial B4) |
| SELF-HOST-PRODUCT-WRITER-SURFACE | Product Out writer plan/apply/body substrate (partial B5) |
| SELF-HOST-PRODUCT-WRITER-PATH-PLAN | Ordered freestanding-capable regenerate plan (partial B6) |
| SELF-HOST-PRODUCT-WRITER-PATH-EXEC (this section) | Host path execution of plan steps (partial B7) |
| SELF-HOST-PRODUCT-PATH-OWNERSHIP | Ownership inputs bar (partial B8) |
| SelfHostBody | Compile-step readiness only |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path ownership inputs (Track 3 / claim B) -- partial B8

**Greppable:** SELF-HOST-PRODUCT-PATH-OWNERSHIP, HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP,
SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_V0, product path ownership inputs,
productPathOwnershipInputsPartialReady, productPathOwnershipInputsOk,
productPathFreestandingOwnershipClaimed, productPathOwnershipSsotMult,
productPathOwnershipSsotBody, productPathOwnershipEmitH, productPathOwnershipEmitC,
productPathOwnershipDualSsotCite, host_emit_mult.ssot.txt,
host_emit_linear.ssot.txt, host_emit_erasure.ssot.txt, host_emit_extract.ssot.txt,
host_emit_types.ssot.txt, host_emit_program.ssot.txt, host_emit_graph.ssot.txt,
host_emit_compose.ssot.txt, host_emit_plan.ssot.txt, host_emit_apply.ssot.txt,
host_emit_body_fragment.ssot.txt, slake_freestanding.h, slake_freestanding.c,
out/freestanding-c/, requireDualSsotEqual, productPathHostLakeBootstrapRemains,
freestandingProductSelfHostComplete, SELF-HOST-PRODUCT-WRITER-PATH-EXEC,
SELF-HOST-PRODUCT-WRITER-PATH-PLAN, SELF-HOST-PRODUCT-WRITER-SURFACE,
SELF-HOST-PRODUCT-PATH-BOOTSTRAP, FreestandingEmit, SLAKE_EMIT_FREESTANDING_C_V0

**Status (2026-07-29):** **partial B8**. Lands checkable **ownership inputs +
non-claim bar**: the exact Mult..Out dual SSOT, emit, and Out surfaces a
freestanding product path must own to regenerate freestanding .h/.c and install
Out **without** classic Lean elaborating FreestandingEmit as the product path.
`productPathFreestandingOwnershipClaimed` stays **false** (proved). Claim **B
freestanding product self-host complete** stays **false**. Lake still bootstraps
the product writer today (`productPathHostLakeBootstrapRemains` true via B4).

**Ban (B7 / path-string theater):** Do **not** re-land B7 host-exec under a new
name. Do **not** treat Mult..Out path-string cites alone as freestanding ownership
claimed. B8 is the **input surface contract** for ownership; ownership claimed
flips only when a freestanding-capable path performs regenerate without Lake as
product path.

### Ownership bar (what freestanding product path must own)

| Role | Required surface (paths / cites) | Today (host bootstrap) |
|------|----------------------------------|------------------------|
| **Read dual SSOT Mult..Out** | `src/systems/emit/host_emit_{mult,linear,erasure,extract,types,program,graph,compose,plan,apply}.ssot.txt` + `host_emit_body_fragment.ssot.txt`; dual SSOT equality with Lean HEADER/BODY fragments | FreestandingEmit `load*Ssot` + `requireDualSsotEqual` |
| **Compose plan/apply/body** | Ordered B6 plan step COMPOSE (plan/apply/body into freestanding templates) | FreestandingEmit `renderHeader` / `renderSource` |
| **Write freestanding .h/.c** | `src/systems/emit/slake_freestanding.h`, `src/systems/emit/slake_freestanding.c` | FreestandingEmit `emitAtRoot` / `IO.FS.writeFile` |
| **Install Out** | `out/freestanding-c/` (`slake_freestanding.{h,c}`) | just `just build` (`cp -f`) |

**Honesty:** this table is the **ownership acceptance bar** for complete-path
progress. Documenting required inputs is **not** freestanding ownership claimed.
Host Lake FreestandingEmit still performs read/compose/write (B4/B7). B8 pins
that surface so pure Nix and host Lean fail closed if SSOT files, emit wire, or
non-claim tokens disappear.

### Ownership vs execution vs complete

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Writer path execution (B7)** | Host path greppably performs B6 plan steps today | Freestanding product path ownership |
| **Ownership inputs (this partial)** | Exact Mult..Out SSOT + emit + Out surfaces + ownership non-claim | Freestanding ownership claimed; complete flip |
| **Bootstrap writer (B4)** | Host Lake FreestandingEmit still owns full text regen | Product path bar for complete |
| **Complete bar (open)** | Freestanding product path owns plan end-to-end without classic Lean as product path | This slice |

### Partial B8 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B7 exec + B6 plan + B5 surface + B4 bootstrap honesty | Complete flip; ownership claimed |
| **Host pin** | `SelfApplyFs.productPathOwnershipInputsPartialReady` (B7 + Mult..Out SSOT/emit/Out cites + bootstrap remains + complete false + ownership claimed false); `productPathFreestandingOwnershipClaimed` proved false | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-OWNERSHIP: acceptance + host pin non-claim; Mult..Out SSOT files present; emit .h/.c paths; when release present, B7 exec green (`productPathOwnershipInputsGreen`) | Retiring Lake as product writer; llvm unlock |
| **Remaining gap (checkable)** | Freestanding-capable path **performs** ownership bar without Lake as product path (then ownership claimed / later complete) | Re-landing B6/B7 under new stage ids; path-string-only theater sold as ownership claimed |

**Commands (partial B8 evidence loop):**

```bash
just build
just systems-emit-wire   # SELF-HOST-PRODUCT-PATH-OWNERSHIP + B7 + B6 + B5 + B4 + B3
just systems-host        # SELF-HOST-PRODUCT-PATH-OWNERSHIP acceptance + SelfApplyFs pin
./src/systems/check.sh   # regenerate + freestanding compile + behavioral probe
```

### Next mechanical steps toward complete (not this slice)

1. Keep B3..B13 green (do not drop WRITE-HC substrate, COMPOSE substrate, READ substrate, perform step, perform gap, ownership inputs, or prior gates).
2. Partial B9 documents the perform gap + install step mechanism (B10 adds Lake-free
   product entrypoint yet); implement freestanding-capable perform of remaining
   gap steps (read/compose/write) without Lake elaborating FreestandingEmit as
   product path; keep ownership claimed and perform claimed false until that
   evidence is real.
3. Do **not** re-land B6/B7/B8/B9 under new names with only cites theater.
4. Only then consider flip policy for `productPathFreestandingOwnershipClaimed`,
   `productPathFreestandingPerformClaimed`, and later
   `freestandingProductSelfHostComplete`.

### Proved vs not (partial B8)

| Proved (partial B8) | Still false / not claimed |
|---------------------|---------------------------|
| Host Lean pin Mult..Out SSOT + emit + Out path cites + dual SSOT surface | `productPathFreestandingOwnershipClaimed` |
| Host Lean pin `productPathOwnershipInputsPartialReady` with complete false + ownership claimed false | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed: Mult..Out SSOT files present; acceptance + host pin; B7 when release present | Freestanding product path performs regenerate without Lake |
| Ownership inputs bar is beyond B7 host-exec alone (explicit surface list) | residual free / proof complete / PROVABLY / llvm |
| productPathHostLakeBootstrapRemains stays true | Host Lake emit writer retired as product path |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-KERNEL-REBUILD | Measured Mult..Out regenerate (partial B) |
| SELF-HOST-KERNEL-SELF-APPLY | Product-path acceptance + emit/out match (partial B2) |
| SELF-HOST-PRODUCT-OUT | Out-first B-bar kernel evidence (partial B3) |
| SELF-HOST-PRODUCT-PATH-BOOTSTRAP | Host Lake writer bootstrap honesty (partial B4) |
| SELF-HOST-PRODUCT-WRITER-SURFACE | Product Out writer plan/apply/body substrate (partial B5) |
| SELF-HOST-PRODUCT-WRITER-PATH-PLAN | Ordered freestanding-capable regenerate plan (partial B6) |
| SELF-HOST-PRODUCT-WRITER-PATH-EXEC | Host path execution of plan steps (partial B7) |
| SELF-HOST-PRODUCT-PATH-OWNERSHIP (this section) | Ownership inputs + non-claim bar (partial B8) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap + install step mechanism (partial B9) |
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP | Lake-free install entrypoint isolation (partial B10) |
| SELF-HOST-PRODUCT-PATH-PERFORM-READ | Decomposed dual SSOT READ substrate (partial B11) |
| SelfHostBody | Compile-step readiness only |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path perform gap (Track 3 / claim B) -- partial B9

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM, HOST-SELF-HOST-PRODUCT-PATH-PERFORM,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0, product path perform,
productPathPerformPartialReady, productPathPerformOk,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathPerformInstallStepLakeFreeCapable,
productPathPerformInstallLakeFreeEntrypointClaimed,
productPathPerformLakeWriterCite, productPathPerformLakeExeCite,
productPathPerformInstallRecipeCite, productPathPerformGapReadSsot,
productPathPerformGapCompose, productPathPerformGapWriteWire,
FREESTANDING-PERFORM-GAP-READ-SSOT, FREESTANDING-PERFORM-GAP-COMPOSE,
FREESTANDING-PERFORM-GAP-WRITE-HC, FreestandingEmit, slake-emit-freestanding-c,
just build, productPathHostLakeBootstrapRemains,
freestandingProductSelfHostComplete, productPathFreestandingOwnershipClaimed,
SELF-HOST-PRODUCT-PATH-OWNERSHIP, SELF-HOST-PRODUCT-WRITER-PATH-EXEC,
SELF-HOST-PRODUCT-WRITER-PATH-PLAN, SELF-HOST-PRODUCT-PATH-BOOTSTRAP,
SLAKE_EMIT_FREESTANDING_C_V0, install step mechanism

**Status (2026-07-29):** **partial B9**. Lands checkable **perform gap bar +
install step mechanism evidence**:
- Full freestanding product path regenerate perform still **depends on Lake**
  elaborating FreestandingEmit for read SSOT / compose plan-apply-body / write
  freestanding .h/.c (`productPathPerformDependsOnLake` true).
- `productPathFreestandingPerformClaimed` stays **false** (proved): freestanding
  product binary path does **not** yet own regenerate.
- Install Out (WRITER-PATH-STEP-INSTALL-OUT) **install step mechanism**: when
  emit `slake_freestanding.{h,c}` already exist, the copy half is process glue
  `cp` (`productPathPerformInstallStepLakeFreeCapable` true). This is a
  **step-property only**.
- Named remaining gaps: FREESTANDING-PERFORM-GAP-READ-SSOT / COMPOSE / WRITE-HC.
- Lake-free install-only entrypoint isolation is **partial B10** (see next
  section; `productPathPerformInstallLakeFreeEntrypointClaimed` true there).
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B
  freestanding product self-host complete** stays **false**. Lake bootstrap
  remains (`productPathHostLakeBootstrapRemains` true via B4).

**Ban (B6/B7/B8 theater):** Do **not** re-land plan-id, host-exec, or path-string
inputs under a new name as "perform." B9 is the **perform gap + install step
mechanism** contract; freestanding perform claimed flips only when a freestanding-
capable path performs read/compose/write without Lake as product path. Install
entrypoint isolation alone does **not** flip perform claimed.

### Perform layers (what performs today vs gap)

| Layer | Who performs today | Freestanding-capable? |
|-------|--------------------|------------------------|
| **Read dual SSOT Mult..Out** | Lake FreestandingEmit `load*Ssot` + `requireDualSsotEqual` | **Gap** (FREESTANDING-PERFORM-GAP-READ-SSOT) |
| **Compose plan/apply/body** | Lake FreestandingEmit `renderHeader` / `renderSource` | **Gap** (FREESTANDING-PERFORM-GAP-COMPOSE) |
| **Write freestanding .h/.c** | Lake FreestandingEmit `emitAtRoot` / `IO.FS.writeFile` | **Gap** (FREESTANDING-PERFORM-GAP-WRITE-HC) |
| **Install Out** | full path: just `just build` (Lake emit then `cp`); install-only: just `install-freestanding-c-out` (B10 Lake-free entrypoint) | **Install** isolated Lake-free when emit present; read/compose/write still Lake |

**Honesty:** documenting the perform gap and install step mechanism is **not**
freestanding perform claimed and **not** ownership claimed. Host Lake still owns
product text regeneration; full `just build` still runs Lake first.
B10 isolates install-only. pure Nix fails closed if host pin claims
perform-without-Lake (`productPathFreestandingPerformClaimed` must stay false)
or if Lake writer / full install recipe (Lake + cp) evidence disappears.

### Perform vs ownership vs complete

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Ownership inputs (B8)** | Exact Mult..Out SSOT + emit + Out surfaces + ownership non-claim | Freestanding ownership claimed |
| **Perform gap (this partial)** | Lake dependency for read/compose/write + install step mechanism + perform non-claim | Freestanding perform claimed; complete flip |
| **Perform step (B10)** | Lake-free install-only entrypoint isolation | Freestanding perform of read/compose/write |
| **Writer path execution (B7)** | Host path greppably performs B6 plan steps today | Freestanding product path ownership |
| **Bootstrap writer (B4)** | Host Lake FreestandingEmit still owns full text regen | Product path bar for complete |
| **Complete bar (open)** | Freestanding product path owns plan end-to-end without classic Lean as product path | This slice |

### Partial B9 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B8 ownership inputs + B7 exec + B6 plan + B5 + B4 honesty | Complete flip; perform claimed; ownership claimed |
| **Host pin** | `SelfApplyFs.productPathPerformPartialReady` (B8 + perform Ok + bootstrap remains + complete false + ownership claimed false + perform claimed false + Lake dependency true); install step mechanism capable true; gap tokens named | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM: acceptance + host pin non-claim; FreestandingEmit still writer tokens; justfile Lake emit + install cp; when release present, B8 ownership inputs green (`productPathPerformGreen`) | Retiring Lake as product writer; llvm unlock |
| **Remaining gap (checkable)** | Freestanding-capable performer for read/compose/write without Lake as product path (then perform claimed / ownership claimed / later complete); B10 lands install-only entrypoint | Re-landing B6/B7/B8 under new stage ids; gap docs sold as perform claimed |

**Commands (partial B9 evidence loop):**

```bash
just build
just systems-emit-wire   # SELF-HOST-PRODUCT-PATH-PERFORM + B10 step + B8 + B7 + B6 + B5 + B4 + B3
just systems-host        # SELF-HOST-PRODUCT-PATH-PERFORM acceptance + SelfApplyFs pin
./src/systems/check.sh   # regenerate + freestanding compile + behavioral probe
```

### Next mechanical steps toward complete (not this slice)

1. Keep B3..B13 green (do not drop WRITE-HC/COMPOSE/READ substrate, perform step, perform gap,
   ownership inputs, or prior gates).
2. Implement freestanding-capable performer for remaining gap steps (READ without
   classic Lean, compose, write .h/.c) without Lake elaborating FreestandingEmit
   as product path; keep perform claimed and ownership claimed false until
   evidence is real.
3. Do **not** re-land B6/B7/B8/B9/B10/B11/B12/B13 under new names with only cites theater.
4. Only then consider flip policy for `productPathFreestandingPerformClaimed`,
   `productPathFreestandingOwnershipClaimed`, and later
   `freestandingProductSelfHostComplete`.

### Proved vs not (partial B9)

| Proved (partial B9) | Still false / not claimed |
|---------------------|---------------------------|
| Host Lean pin perform depends on Lake for read/compose/write | `productPathFreestandingPerformClaimed` |
| Host Lean pin install Out **step mechanism** (cp half) when emit present | Freestanding product path performs full regenerate without Lake |
| Host Lean pin `productPathPerformPartialReady` with complete false + ownership claimed false + perform claimed false | residual free / proof complete / PROVABLY / llvm |
| pure Nix fail-closed: FreestandingEmit still writer; justfile Lake emit + install cp; acceptance + host pin; B8 when release present | `freestandingProductSelfHostComplete` |
| Named FREESTANDING-PERFORM-GAP-* remaining steps | Host Lake emit writer retired as product path; complete flip |
| productPathHostLakeBootstrapRemains stays true | |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-KERNEL-REBUILD | Measured Mult..Out regenerate (partial B) |
| SELF-HOST-KERNEL-SELF-APPLY | Product-path acceptance + emit/out match (partial B2) |
| SELF-HOST-PRODUCT-OUT | Out-first B-bar kernel evidence (partial B3) |
| SELF-HOST-PRODUCT-PATH-BOOTSTRAP | Host Lake writer bootstrap honesty (partial B4) |
| SELF-HOST-PRODUCT-WRITER-SURFACE | Product Out writer plan/apply/body substrate (partial B5) |
| SELF-HOST-PRODUCT-WRITER-PATH-PLAN | Ordered freestanding-capable regenerate plan (partial B6) |
| SELF-HOST-PRODUCT-WRITER-PATH-EXEC | Host path execution of plan steps (partial B7) |
| SELF-HOST-PRODUCT-PATH-OWNERSHIP | Ownership inputs + non-claim bar (partial B8) |
| SELF-HOST-PRODUCT-PATH-PERFORM (this section) | Perform gap + install step mechanism (partial B9) |
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP | Lake-free install entrypoint isolation (partial B10) |
| SelfHostBody | Compile-step readiness only |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path perform step (Track 3 / claim B) -- partial B10

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-STEP,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-STEP,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0, product path perform step,
productPathPerformStepPartialReady, productPathPerformStepOk,
productPathPerformInstallLakeFreeEntrypointClaimed,
productPathPerformInstallLakeFreeEntrypointRecipe, install-freestanding-c-out,
Lake-free install entrypoint, productPathFreestandingPerformClaimed,
productPathPerformDependsOnLake, FREESTANDING-PERFORM-GAP-READ-SSOT,
FREESTANDING-PERFORM-GAP-COMPOSE, FREESTANDING-PERFORM-GAP-WRITE-HC,
productPathPerformPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM,
just build, productPathHostLakeBootstrapRemains,
freestandingProductSelfHostComplete, productPathFreestandingOwnershipClaimed

**Status (2026-07-29):** **partial B10**. First **perform step** beyond B9 gap
naming: Lake-free **install-only** product entrypoint isolation.
- `just install-freestanding-c-out` copies emit `slake_freestanding.{h,c}` into
  `out/freestanding-c` when emit already present. **No** `lake build` / `lake exe`
  / FreestandingEmit. Fail closed if emit missing (run full
  `just build` first). Full path `just build` reuses this
  shared install half after Lake emit (no duplicated cp loop).
- `productPathPerformInstallLakeFreeEntrypointClaimed` is **true** (proved) with
  recipe cite `install-freestanding-c-out`.
- `productPathFreestandingPerformClaimed` stays **false** (proved): install-only
  is **not** freestanding perform of read/compose/write.
- `productPathPerformDependsOnLake` stays **true**: FREESTANDING-PERFORM-GAP-*
  steps still need Lake FreestandingEmit as product path performer.
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. Lake bootstrap remains (B4).

**Ban (B6/B7/B8/B9 theater):** Do **not** re-land gap naming or ownership inputs
as "perform step." B10 is real install-only process-glue isolation + greppable
stage. Do **not** flip perform claimed or complete on install alone.

### Partial B10 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B9 perform gap + B8..B4 honesty | Complete flip; perform claimed; ownership claimed |
| **Host pin** | `SelfApplyFs.productPathPerformStepPartialReady` (B9 + step Ok + entrypoint claimed true + perform claimed false + DependsOnLake true + complete false) | Freestanding product compiler of Slake sources |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-STEP: acceptance + host pin entrypoint true + justfile install-only recipe tokens; when release present, B9 green (`productPathPerformStepGreen`) | Closing FREESTANDING-PERFORM-GAP-*; llvm unlock |
| **Remaining gap (checkable)** | Freestanding-capable performer for READ-SSOT / COMPOSE / WRITE-HC without Lake as product path | Selling install-only as freestanding perform claimed |

**Commands (partial B10 evidence loop):**

```bash
just build          # Lake emit + install (full path)
just install-freestanding-c-out  # Lake-free install-only when emit present
just systems-emit-wire           # PERFORM-STEP + PERFORM + B8..B3
just systems-host
```

### Proved vs not (partial B10)

| Proved (partial B10) | Still false / not claimed |
|----------------------|---------------------------|
| Lake-free install-only recipe `install-freestanding-c-out` | `productPathFreestandingPerformClaimed` |
| `productPathPerformInstallLakeFreeEntrypointClaimed` true | Freestanding perform of read/compose/write |
| `productPathPerformStepPartialReady` with complete false + perform claimed false + DependsOnLake true | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed on entrypoint true + recipe tokens + B9 when release present | residual free / proof complete / PROVABLY / llvm |
| FREESTANDING-PERFORM-GAP-* still named open | Host Lake emit writer retired as product path |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap + install step mechanism (partial B9) |
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP (this section) | Lake-free install entrypoint isolation (partial B10) |
| SELF-HOST-PRODUCT-PATH-PERFORM-READ | Decomposed dual SSOT READ substrate (partial B11) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path perform READ (Track 3 / claim B) -- partial B11

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-READ,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0, product path perform read,
productPathPerformReadPartialReady, productPathPerformReadOk,
productPathPerformReadDependsOnLake, productPathPerformReadEntrypointClaimed,
productPathPerformReadEntrypointRecipe, productPathPerformReadLakeExe,
productPathPerformReadModuleCite, read-product-ssot, slake-read-product-ssot,
ProductPathReadSsot, readDualSsotAtRoot, FREESTANDING-PERFORM-GAP-READ-SSOT,
FREESTANDING-PERFORM-GAP-COMPOSE, FREESTANDING-PERFORM-GAP-WRITE-HC,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathPerformStepPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-STEP,
productPathHostLakeBootstrapRemains, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-29):** **partial B11** (review APPROVE, 0 open issues). First
**READ-SSOT perform substrate** beyond B10 install isolation:
- Host module `SystemsLean.ProductPathReadSsot` reads Mult..Out dual SSOT files
  under `src/systems/emit/` via `IO.FS.readFile` only (`readDualSsotAtRoot`).
- **Read depth:** presence + non-empty + greppable HOST-EMIT token only. This is
  **not** FreestandingEmit `load*Ssot` HEADER/BODY parse and **not**
  DUAL-SSOT-EQUALITY / `requireDualSsotEqual` (full dual equality stays on the
  FreestandingEmit product path).
- **Does not** import FreestandingEmit. **Does not** call compose/render
  entrypoints or product-wire write APIs.
- Entrypoint: `just read-product-ssot` -> `lake build/exe slake-read-product-ssot`.
- `productPathPerformReadEntrypointClaimed` is **true** (proved).
- `productPathPerformReadDependsOnLake` stays **true** (classic Lean Lake host
  step; not freestanding C; not Lake-free READ).
- `productPathFreestandingPerformClaimed` stays **false** (proved): decomposed
  host READ is **not** freestanding-capable close of FREESTANDING-PERFORM-GAP-READ-SSOT.
- `productPathPerformDependsOnLake` stays **true**: compose/write still Lake
  FreestandingEmit; gap COMPOSE / WRITE-HC open.
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. Lake bootstrap remains (B4).

**Ban (B6..B10 theater):** Do **not** re-land install-only or gap naming as READ.
B11 is real IO.FS dual SSOT presence/token read decomposed from FreestandingEmit
write path. Do **not** flip perform claimed or complete on READ host substrate
alone. Do **not** sell presence/token READ as dual-equality close.

### Partial B11 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B10 install + B9 gap + B8..B4 honesty | Complete flip; perform claimed; ownership claimed; freestanding READ close; DUAL-SSOT-EQUALITY close |
| **Host pin** | `SelfApplyFs.productPathPerformReadPartialReady` (B10 + read Ok + entrypoint true + ReadDependsOnLake true + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Read depth** | Presence + non-empty + HOST-EMIT token via `IO.FS.readFile` | HEADER/BODY parse; `requireDualSsotEqual`; full FreestandingEmit load*Ssot parity |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-READ: acceptance + host pin + ProductPathReadSsot read tokens + forbid write symbols (incl. product-wire write APIs) + lakefile/just; when release present, B10 green (`productPathPerformReadGreen`) | Closing FREESTANDING-PERFORM-GAP-*; llvm unlock |
| **Remaining gap (checkable)** | Freestanding-capable READ without classic Lean as product path; freestanding COMPOSE / WRITE-HC; then perform claimed / ownership claimed / later complete | Selling host Lake READ as freestanding perform claimed or dual-equality |

**Commands (partial B11 evidence loop):**

```bash
just read-product-ssot           # decomposed dual SSOT READ (Lake host; no FreestandingEmit write)
just install-freestanding-c-out  # Lake-free install-only when emit present (B10)
just build          # full Lake emit + install
just systems-emit-wire           # PERFORM-READ + PERFORM-STEP + PERFORM + B8..B3
just systems-host
```

### Proved vs not (partial B11)

| Proved (partial B11) | Still false / not claimed |
|----------------------|---------------------------|
| Decomposed READ module ProductPathReadSsot + `readDualSsotAtRoot` | `productPathFreestandingPerformClaimed` |
| `productPathPerformReadEntrypointClaimed` true; recipe `read-product-ssot` | Freestanding close of FREESTANDING-PERFORM-GAP-READ-SSOT |
| `productPathPerformReadDependsOnLake` true (honest host Lake) | Freestanding COMPOSE / WRITE-HC |
| `productPathPerformReadPartialReady` with complete false + perform claimed false | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed on read module without write symbols + B10 when release | residual free / proof complete / PROVABLY / llvm |
| FREESTANDING-PERFORM-GAP-COMPOSE / WRITE-HC still open | Host Lake emit writer retired as product path |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap + install step mechanism (partial B9) |
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP | Lake-free install entrypoint isolation (partial B10) |
| SELF-HOST-PRODUCT-PATH-PERFORM-READ (this section) | Decomposed dual SSOT READ substrate (partial B11) |
| SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE | Decomposed plan/apply/body COMPOSE substrate (partial B12) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path perform COMPOSE (Track 3 / claim B) -- partial B12

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0, product path perform compose,
productPathPerformComposePartialReady, productPathPerformComposeOk,
productPathPerformComposeDependsOnLake, productPathPerformComposeEntrypointClaimed,
productPathPerformComposeEntrypointRecipe, productPathPerformComposeLakeExe,
productPathPerformComposeModuleCite, compose-product-plan, slake-compose-product-plan,
ProductPathComposePlan, composePlanApplyBodyAtRoot, buildComposeMarker,
WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY, FREESTANDING-PERFORM-GAP-COMPOSE,
FREESTANDING-PERFORM-GAP-READ-SSOT, FREESTANDING-PERFORM-GAP-WRITE-HC,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathPerformReadPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-READ,
productPathHostLakeBootstrapRemains, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-29):** **partial B12**. First **COMPOSE plan/apply/body perform
substrate** beyond B11 READ:
- Host module `SystemsLean.ProductPathComposePlan` composes plan / apply / body
  dual SSOT under `src/systems/emit/` into an ordered in-memory marker
  (`composePlanApplyBodyAtRoot` / `buildComposeMarker`).
- **Compose depth:** ordered plan+apply+body presence+token join + composed-string
  checks for HOST-EMIT-PLAN / HOST-EMIT-APPLY / HOST-EMIT-BODY +
  WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY. This is **not** FreestandingEmit
  `renderHeader` / `renderSource` full Mult..Apply template embed.
- **Does not** import FreestandingEmit. **Does not** call product-wire write APIs.
- Entrypoint: `just compose-product-plan` -> `lake build/exe slake-compose-product-plan`.
- `productPathPerformComposeEntrypointClaimed` is **true** (proved).
- `productPathPerformComposeDependsOnLake` stays **true** (classic Lean Lake host
  step; not freestanding C; not Lake-free COMPOSE).
- `productPathFreestandingPerformClaimed` stays **false** (proved): decomposed
  host COMPOSE is **not** freestanding-capable close of FREESTANDING-PERFORM-GAP-COMPOSE.
- `productPathPerformDependsOnLake` stays **true**: WRITE-HC still Lake
  FreestandingEmit; gap WRITE-HC open; freestanding READ still open.
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. Lake bootstrap remains (B4).

**Ban (B6..B12 theater):** Do **not** re-land READ or install-only as COMPOSE.
B12 is real ordered plan/apply/body compose decomposed from FreestandingEmit
write path. Do **not** flip perform claimed or complete on COMPOSE host substrate
alone. Do **not** sell in-memory compose marker as full template embed or WRITE-HC.

### Partial B12 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B11 READ + B10 install + B9 gap + B8..B4 honesty | Complete flip; perform claimed; ownership claimed; freestanding COMPOSE close; full Mult..Apply template embed |
| **Host pin** | `SelfApplyFs.productPathPerformComposePartialReady` (B11 + compose Ok + entrypoint true + ComposeDependsOnLake true + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Compose depth** | Ordered plan+apply+body in-memory marker + HOST-EMIT token checks | FreestandingEmit `renderHeader` / `renderSource`; `emitAtRoot`; product .h/.c write |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: acceptance + host pin + ProductPathComposePlan compose tokens + forbid write symbols + lakefile/just; when release present, B11 green (`productPathPerformComposeGreen`) | Closing FREESTANDING-PERFORM-GAP-*; llvm unlock |
| **Remaining gap (checkable)** | Freestanding-capable READ/COMPOSE without classic Lean as product path; freestanding WRITE-HC; then perform claimed / ownership claimed / later complete | Selling host Lake COMPOSE as freestanding perform claimed or full template path |

**Commands (partial B12 evidence loop):**

```bash
just compose-product-plan        # decomposed plan/apply/body COMPOSE (Lake host; no FreestandingEmit write)
just read-product-ssot           # decomposed dual SSOT READ (B11)
just install-freestanding-c-out  # Lake-free install-only when emit present (B10)
just build          # full Lake emit + install
just systems-emit-wire           # PERFORM-COMPOSE + PERFORM-READ + PERFORM-STEP + PERFORM + B8..B3
just systems-host
```

### Proved vs not (partial B12)

| Proved (partial B12) | Still false / not claimed |
|----------------------|---------------------------|
| Decomposed COMPOSE module ProductPathComposePlan + `composePlanApplyBodyAtRoot` | `productPathFreestandingPerformClaimed` |
| `productPathPerformComposeEntrypointClaimed` true; recipe `compose-product-plan` | Freestanding close of FREESTANDING-PERFORM-GAP-COMPOSE |
| `productPathPerformComposeDependsOnLake` true (honest host Lake) | Freestanding WRITE-HC / freestanding READ close |
| `productPathPerformComposePartialReady` with complete false + perform claimed false | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed on compose module without write symbols + B11 when release | residual free / proof complete / PROVABLY / llvm |
| FREESTANDING-PERFORM-GAP-WRITE-HC still open | Host Lake emit writer retired as product path |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap + install step mechanism (partial B9) |
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP | Lake-free install entrypoint isolation (partial B10) |
| SELF-HOST-PRODUCT-PATH-PERFORM-READ | Decomposed dual SSOT READ substrate (partial B11) |
| SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE (this section) | Decomposed plan/apply/body COMPOSE substrate (partial B12) |
| SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC | Decomposed freestanding .h/.c WRITE-HC substrate (partial B13) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | Freestanding-capable gap measure + ordered pipeline join (partial B14) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path perform WRITE-HC (Track 3 / claim B) -- partial B13

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0, product path perform write,
productPathPerformWriteHcPartialReady, productPathPerformWriteHcOk,
productPathPerformWriteHcDependsOnLake, productPathPerformWriteHcEntrypointClaimed,
productPathPerformWriteHcEntrypointRecipe, productPathPerformWriteHcLakeExe,
productPathPerformWriteHcModuleCite, write-freestanding-hc, slake-write-freestanding-hc,
ProductPathWriteHc, writeFreestandingHcAtRoot, emitAtRoot, FreestandingEmit,
WRITER-PATH-STEP-WRITE-FREESTANDING-HC, FREESTANDING-PERFORM-GAP-WRITE-HC,
slake_freestanding.h, slake_freestanding.c, FREESTANDING-PERFORM-GAP-READ-SSOT,
FREESTANDING-PERFORM-GAP-COMPOSE, productPathFreestandingPerformClaimed,
productPathPerformDependsOnLake, productPathPerformComposePartialReady,
SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, productPathHostLakeBootstrapRemains,
freestandingProductSelfHostComplete, productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B13**. First **WRITE-HC freestanding .h/.c
perform substrate** beyond B12 COMPOSE:
- Host module `SystemsLean.ProductPathWriteHc` writes emit
  `slake_freestanding.{h,c}` via `writeFreestandingHcAtRoot` ->
  `FreestandingEmit.emitAtRoot` (full Mult..Apply dual SSOT + template embed +
  `IO.FS.writeFile`).
- **Write depth:** real product-wire write under `src/systems/emit/` only.
  Does **not** install Out (`out/freestanding-c` remains B10
  `install-freestanding-c-out` / full `just build`).
- **Honest Lake dependency:** still classic Lean Lake + FreestandingEmit as
  product writer (`productPathPerformWriteHcDependsOnLake` true). This is a
  **decomposed WRITE-HC entrypoint**, not freestanding-capable close of
  FREESTANDING-PERFORM-GAP-WRITE-HC.
- Entrypoint: `just write-freestanding-hc` ->
  `lake build/exe slake-write-freestanding-hc`.
- `productPathPerformWriteHcEntrypointClaimed` is **true** (proved).
- `productPathPerformWriteHcDependsOnLake` stays **true**.
- `productPathFreestandingPerformClaimed` stays **false** (proved): decomposed
  host WRITE-HC is **not** freestanding perform claimed.
- `productPathPerformDependsOnLake` stays **true**.
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. Lake bootstrap remains (B4).

**Ban (B6..B13 theater):** Do **not** re-land COMPOSE/READ/install-only as WRITE-HC.
B13 is a real focused write entrypoint over FreestandingEmit. Do **not** flip
perform claimed or complete on host WRITE substrate alone. Do **not** sell Lake
FreestandingEmit write as freestanding-capable without classic Lean.

### Partial B13 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B12 COMPOSE + B11 READ + B10 install + B9 gap + B8..B4 honesty | Complete flip; perform claimed; ownership claimed; freestanding WRITE-HC close |
| **Host pin** | `SelfApplyFs.productPathPerformWriteHcPartialReady` (B12 + write Ok + entrypoint true + WriteHcDependsOnLake true + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Write depth** | FreestandingEmit.emitAtRoot via ProductPathWriteHc; emit .h/.c only | Out install; freestanding-capable product path without Lake |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: acceptance + host pin + ProductPathWriteHc write tokens + FreestandingEmit import + lakefile/just; forbid install-out theater + dishonest complete/perform/ownership true; when release present, B12 green (`productPathPerformWriteHcGreen`) | Closing FREESTANDING-PERFORM-GAP-*; llvm unlock |
| **Remaining gap (checkable)** | Freestanding-capable READ/COMPOSE/WRITE-HC without classic Lean as product path; then perform claimed / ownership claimed / later complete | Selling host Lake WRITE-HC as freestanding perform claimed |

**Commands (partial B13 evidence loop):**

```bash
just write-freestanding-hc       # decomposed WRITE-HC emit .h/.c (Lake FreestandingEmit)
just compose-product-plan        # decomposed plan/apply/body COMPOSE (B12)
just read-product-ssot           # decomposed dual SSOT READ (B11)
just install-freestanding-c-out  # Lake-free install-only when emit present (B10)
just build          # full Lake emit + install
just systems-emit-wire           # PERFORM-WRITE-HC + COMPOSE + READ + STEP + PERFORM + B8..B3
just systems-host
```

### Proved vs not (partial B13)

| Proved (partial B13) | Still false / not claimed |
|----------------------|---------------------------|
| Decomposed WRITE-HC module ProductPathWriteHc + `writeFreestandingHcAtRoot` | `productPathFreestandingPerformClaimed` |
| `productPathPerformWriteHcEntrypointClaimed` true; recipe `write-freestanding-hc` | Freestanding close of FREESTANDING-PERFORM-GAP-WRITE-HC |
| `productPathPerformWriteHcDependsOnLake` true (honest host Lake FreestandingEmit) | Freestanding READ/COMPOSE without Lake host |
| `productPathPerformWriteHcPartialReady` with complete false + perform claimed false | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed on write module + B12 when release | residual free / proof complete / PROVABLY / llvm |
| FREESTANDING-PERFORM-GAP-* freestanding close still open | Host Lake emit writer retired as product path |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap + install step mechanism (partial B9) |
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP | Lake-free install entrypoint isolation (partial B10) |
| SELF-HOST-PRODUCT-PATH-PERFORM-READ | Decomposed dual SSOT READ substrate (partial B11) |
| SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE | Decomposed plan/apply/body COMPOSE substrate (partial B12) |
| SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC (this section) | Decomposed freestanding .h/.c WRITE-HC substrate (partial B13) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | Freestanding-capable gap measure + ordered pipeline join (partial B14) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding-capable gap (Track 3 / claim B) -- partial B14

**Greppable:** SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP,
HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP,
SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0,
product path freestanding capable gap,
productPathFreestandingCapablePartialReady, productPathFreestandingCapableOk,
productPathFreestandingCapableInstallOnly, productPathFreestandingCapableRead,
productPathFreestandingCapableCompose, productPathFreestandingCapableWriteHc,
productPathFreestandingCapableFullPerform,
productPathFreestandingCapableOrderedPipelineRecipe, regenerate-product-path,
productPathFreestandingCapableReadLakeFreeRecipe, freestanding-capable-read-lake-free,
productPathFreestandingCapableMeasureRecipe, freestanding-capable-gap,
productPathFreestandingCapableLakeExe, slake-freestanding-capable-gap,
productPathFreestandingCapableModuleCite, Capable,
FREESTANDING-PERFORM-GAP-READ-SSOT, FREESTANDING-PERFORM-GAP-COMPOSE,
FREESTANDING-PERFORM-GAP-WRITE-HC, WRITER-PATH-STEP-INSTALL-OUT,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathPerformWriteHcPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC,
productPathHostLakeBootstrapRemains, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B14 + B26 CapableRead + B27 CapableCompose + B28 CapableWriteHc**.
Freestanding-capable gap measure + host ordered pipeline join beyond B13 WRITE-HC;
Lake-free CapableRead after B26; Lake-free CapableCompose after B27; Lake-free
CapableWriteHc after B28 (FullBar CapableLakeFree true):
- Host module `SystemsLean.Capable` pins which B6 ordered
  regenerate steps are freestanding-capable / Lake-free **today**:
  - INSTALL-OUT (B10): `productPathFreestandingCapableInstallOnly` **true**
  - READ-SSOT: `productPathFreestandingCapableRead` **true** (partial B26 Lake-
    free freestanding-capable READ via `just freestanding-capable-read-lake-free`:
    Mult..Out dual SSOT token + HEADER/BODY structural blocks; no lake build/exe;
    freestanding-capable contract depth matching B16 freestandingCapableReadDualSsot;
    **not** ownership-regenerate-read-only presence+token path piece). B16 Lake
    exe freestandingCapableReadDualSsot remains diagnostic host path; B11
    ProductPathReadSsot is perform substrate only.
  - COMPOSE: `productPathFreestandingCapableCompose` **true** (partial B27 Lake-
    free freestanding-capable COMPOSE via `just freestanding-capable-compose-lake-free`:
    plan/apply/body dual SSOT token + HEADER/BODY structural; no lake build/exe;
    freestanding-capable contract depth matching B17 freestandingCapableComposePlanApplyBody;
    **not** ownership-regenerate-compose-only presence+token path piece). B17 Lake
    exe freestandingCapableComposePlanApplyBody remains diagnostic host path; B12
    ProductPathComposePlan is perform substrate only.
  - WRITE-HC: `productPathFreestandingCapableWriteHc` **true** (partial B28 Lake-
    free freestanding-capable WRITE-HC via `just freestanding-capable-write-hc-lake-free`:
    Mult..Out dual SSOT token + HEADER/BODY + write substrate markers; no lake;
    freestanding-capable contract depth matching B18 freestandingCapableWriteFreestandingHc;
    **not** ownership-regenerate-write-hc-only presence+token path piece). B18 Lake
    exe freestandingCapableWriteFreestandingHc remains diagnostic host path; B13
    ProductPathWriteHc is perform substrate only.
- `productPathFreestandingCapableFullPerform` stays **false** (full freestanding-
  capable close of FREESTANDING-PERFORM-GAP-* not claimed).
- Ordered host pipeline join: `just regenerate-product-path` runs existing
  entrypoints in B6 order (read-product-ssot -> compose-product-plan ->
  write-freestanding-hc -> install-freestanding-c-out). **Honest:** Capable* true
  does not make WithoutLake / perform claimed / complete true.
- Lake-free freestanding-capable READ: `just freestanding-capable-read-lake-free`.
- Lake-free freestanding-capable COMPOSE: `just freestanding-capable-compose-lake-free`.
- Lake-free freestanding-capable WRITE-HC: `just freestanding-capable-write-hc-lake-free`.
- Diagnostic: `just freestanding-capable-gap` -> lake exe
  `slake-freestanding-capable-gap` prints the measure table.
- `productPathFreestandingPerformClaimed` stays **false** (proved).
- `productPathPerformDependsOnLake` stays **true**.
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. Lake bootstrap remains (B4). WithoutLake was still open at
  B14/B26..B28 land; closed only with B30 product path authority evidence
  (still not Full / perform claimed / ownership claimed).

**Ban (B6..B28 theater):** Do **not** re-land WRITE-HC/COMPOSE/READ/install-only
or ownership path pieces as freestanding-capable full close. B14/B26/B27/B28 is a real
**gap measure + Capable* Lake-free freestanding-capable measures**, not
Full or perform/ownership claimed. WithoutLake closed only with B30 product path
authority (not Capable* alone). Do **not** flip perform claimed or complete on
measure alone. Do **not** sell ownership-regenerate-write-hc-only as CapableWriteHc.

### Partial B14 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B13 WRITE-HC + B12 COMPOSE + B11 READ + B10 install + B9 gap + B8..B4 honesty | Complete flip; perform claimed; ownership claimed; freestanding gap close |
| **Host pin** | `SelfApplyFs.productPathFreestandingCapablePartialReady` (B13 + capable Ok + install-only true + full false + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Gap measure** | Install Lake-free true; CapableRead true (B26); CapableCompose true (B27); CapableWriteHc true (B28); full perform false | Full perform; perform claimed; ownership claimed |
| **Pipeline join** | `just regenerate-product-path` orchestrates existing host entrypoints in order | Full / perform claimed (WithoutLake closed B30 as product path authority) |
| **Lake-free CapableRead** | `just freestanding-capable-read-lake-free` token+HEADER/BODY (B26) | ownership-regenerate-read-only presence+token (B23); perform claimed |
| **Lake-free CapableCompose** | `just freestanding-capable-compose-lake-free` plan/apply/body token+HEADER/BODY (B27) | ownership-regenerate-compose-only presence+token (B24); perform claimed |
| **Lake-free CapableWriteHc** | `just freestanding-capable-write-hc-lake-free` dual SSOT token+HEADER/BODY + write substrate (B28) | ownership-regenerate-write-hc-only presence+token (B25); perform claimed |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP: acceptance + host pin + Capable tokens + lakefile/just; require CapableRead+Compose+WriteHc true + Lake-free recipes; forbid dishonest full/WriteHc false; when release present, B13 green (`productPathFreestandingCapableGreen`) | Full / perform claimed; llvm unlock |
| **Remaining gap (checkable)** | perform claimed / ownership claimed with real freestanding evidence; then Full / complete (WithoutLake closed B30 as product path authority; not Capable* alone) | Selling Capable* alone as freestanding perform claimed or Full |

**Commands (partial B14 + B26 + B27 + B28 evidence loop):**

```bash
just freestanding-capable-read-lake-free       # B26 Lake-free freestanding-capable READ (CapableRead)
just freestanding-capable-compose-lake-free    # B27 Lake-free freestanding-capable COMPOSE (CapableCompose)
just freestanding-capable-write-hc-lake-free   # B28 Lake-free freestanding-capable WRITE-HC (CapableWriteHc)
just freestanding-capable-gap                  # B14 freestanding-capable step measure print
just regenerate-product-path                   # ordered host join: read -> compose -> write-hc -> install
just freestanding-capable-read                 # B16 Lake exe diagnostic dual SSOT READ
just freestanding-capable-compose              # B17 Lake exe diagnostic plan/apply/body COMPOSE
just freestanding-capable-write-hc             # B18 Lake exe diagnostic freestanding .h/.c WRITE
just write-freestanding-hc                     # decomposed WRITE-HC emit .h/.c (B13)
just compose-product-plan                      # decomposed plan/apply/body COMPOSE (B12)
just read-product-ssot                         # decomposed dual SSOT READ (B11)
just install-freestanding-c-out                # Lake-free install-only when emit present (B10)
just build                        # full Lake emit + install
just systems-emit-wire                         # FREESTANDING-CAPABLE-GAP + WRITE-HC + COMPOSE + READ + STEP + PERFORM + B8..B3
just systems-host
```

### Proved vs not (partial B14 + B26 + B27)

| Proved (partial B14 + B26 + B27) | Still false / not claimed |
|----------------------------------|---------------------------|
| Gap measure module Capable + SelfApplyFs pins | `productPathFreestandingPerformClaimed` |
| `productPathFreestandingCapableInstallOnly` true (B10 Lake-free install) | `productPathFreestandingCapableWriteHc` |
| `productPathFreestandingCapableRead` true (B26 Lake-free freestanding-capable READ) | Full perform; WithoutLake; ownership claimed |
| `productPathFreestandingCapableCompose` true (B27 Lake-free freestanding-capable COMPOSE) | Freestanding close of FREESTANDING-PERFORM-GAP-WRITE-HC |
| `productPathFreestandingCapableFullPerform` false (proved) | Freestanding product path without Lake host for full bar |
| Ordered pipeline recipe `regenerate-product-path` (host join only) | `freestandingProductSelfHostComplete` |
| `productPathFreestandingCapablePartialReady` with complete false + perform claimed false | residual free / proof complete / PROVABLY / llvm |
| pure Nix fail-closed on gap module + B13 when release | |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap + install step mechanism (partial B9) |
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP | Lake-free install entrypoint isolation (partial B10) |
| SELF-HOST-PRODUCT-PATH-PERFORM-READ | Decomposed dual SSOT READ substrate (partial B11) |
| SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE | Decomposed plan/apply/body COMPOSE substrate (partial B12) |
| SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC | Decomposed freestanding .h/.c WRITE-HC substrate (partial B13) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP (this section) | Freestanding-capable gap measure + ordered pipeline join (partial B14) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT | Freestanding-capable step contract / interface (partial B15) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding-capable step contract (Track 3 / claim B) -- partial B15

**Greppable:** SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0,
product path freestanding capable step contract,
productPathFreestandingCapableStepContractPartialReady,
productPathFreestandingCapableStepContractOk,
productPathFreestandingCapableStepContractAuthorityNotEmit,
productPathFreestandingCapableStepContractReadSatisfied,
productPathFreestandingCapableStepContractComposeSatisfied,
productPathFreestandingCapableStepContractWriteHcSatisfied,
productPathFreestandingCapableStepContractFullSatisfied,
FREESTANDING-CAPABLE-STEP-CONTRACT-READ,
FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE,
FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC,
freestandingCapableReadDualSsot, freestandingCapableComposePlanApplyBody,
freestandingCapableWriteFreestandingHc,
BLOCKER-READ-STILL-LAKE-HOST-PRODUCT-PATH,
BLOCKER-COMPOSE-STILL-LAKE-HOST-PRODUCT-PATH,
BLOCKER-WRITE-HC-STILL-LAKE-HOST-PRODUCT-PATH,
BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
freestanding-capable-step-contract, slake-freestanding-capable-step-contract,
CapableStepContract,
FREESTANDING-PERFORM-GAP-READ-SSOT, FREESTANDING-PERFORM-GAP-COMPOSE,
FREESTANDING-PERFORM-GAP-WRITE-HC,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingCapablePartialReady,
SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP,
productPathHostLakeBootstrapRemains, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B15** (evolved by **B16** READ, **B17**
COMPOSE, **B18** WRITE-HC). First **freestanding-capable step contract /
interface** beyond B14 gap measure:
- Host module `SystemsLean.CapableStepContract` names
  freestanding-capable perform step contracts for remaining gaps:
  - READ: `FREESTANDING-CAPABLE-STEP-CONTRACT-READ` -> API
    `freestandingCapableReadDualSsot` (satisfied **true** after B16)
  - COMPOSE: `FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE` -> API
    `freestandingCapableComposePlanApplyBody` (satisfied **true** after B17)
  - WRITE-HC: `FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC` -> API
    `freestandingCapableWriteFreestandingHc` (satisfied **true** after B18)
- Authority separation: `productPathFreestandingCapableStepContractAuthorityNotEmit`
  **true** -- freestanding-capable product path must not route product authority
  through classic Lean FreestandingEmit as product path; host Lake remains
  bootstrap (`hostLakeBootstrapRemainsForWriter` true).
- Named blockers: BLOCKER-READ/COMPOSE/WRITE-HC-STILL-LAKE-HOST-PRODUCT-PATH +
  BLOCKER-FREESTANDING-MUST-OWN-REGENERATE (cliff for full freestanding perform /
  WithoutLake). Lake-host blockers name diagnostic Lake paths; B14 Capable*
  Lake-free measures closed true after B26..B28 (distinct from step-contract
  satisfaction and from Full/WithoutLake).
- `productPathFreestandingCapableStepContractFullSatisfied` stays **false**
  (WithoutLake closed B30 as product path authority; Full is more than step
  contracts + WithoutLake alone). CapableRead/Compose/WriteHc true after
  B26..B28 Lake-free measures; FullBar CapableLakeFree true.
- Diagnostic: `just freestanding-capable-step-contract` -> lake exe
  `slake-freestanding-capable-step-contract` prints the contract table.
- `productPathFreestandingPerformClaimed` stays **false** (proved).
- `productPathPerformDependsOnLake` stays **true**.
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. Lake bootstrap remains (B4). WithoutLake was open at B15 land;
  closed only with B30 product path authority (still not Full/perform/ownership).

**Ban (B6..B18 theater):** Do **not** re-land B14 gap measure or B11-B13 Lake
host substrates as freestanding-capable close. B15 is a real **step contract +
authority separation + named API surface** (READ with B16; COMPOSE with B17;
WRITE-HC with B18), not freestanding perform claimed or Full. Do **not** flip Full
satisfied, perform claimed, or complete on contract alone (Capable* true after
B26..B28 via Lake-free freestanding-capable recipes; WithoutLake closed only B30).

### Partial B15 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B14 gap measure + B13 WRITE-HC + B12 COMPOSE + B11 READ + B10 install + B9 gap + B8..B4 honesty | Complete flip; perform claimed; ownership claimed; freestanding gap close |
| **Host pin** | `SelfApplyFs.productPathFreestandingCapableStepContractPartialReady` (B14 + step contract Ok + authority-not-emit true + READ/Compose/WriteHc satisfied true after B16..B18 + Full false + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Step contract** | Named READ/COMPOSE/WRITE-HC freestanding-capable contracts + API surface + blockers; READ via B16; COMPOSE via B17; WRITE via B18; Capable* true after B26..B28 Lake-free | Full satisfied; perform claimed; ownership claimed |
| **Authority** | Product path authority must not be FreestandingEmit; Lake bootstrap honest remains | Flipping perform claimed or Full true |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT: acceptance + host pin + CapableStepContract tokens + lakefile/just; forbid dishonest Full true and Read/Compose/WriteHcSatisfied false; when release present, B14 green (`productPathFreestandingCapableStepContractGreen`) | Full freestanding ownership of regenerate; llvm unlock |
| **Remaining gap (checkable)** | perform claimed / ownership claimed with freestanding evidence; then Full / complete (WithoutLake closed B30 as product path authority; Capable* Lake-free already true B26..B28) | Selling step contract as freestanding perform claimed |

**Commands (partial B15 evidence loop):**

```bash
just freestanding-capable-step-contract  # B15 freestanding-capable step contract print
just freestanding-capable-compose        # B17 freestanding-capable plan/apply/body COMPOSE
just freestanding-capable-read           # B16 freestanding-capable dual SSOT READ
just freestanding-capable-gap            # B14 freestanding-capable step measure print
just regenerate-product-path             # ordered host join: read -> compose -> write-hc -> install
just write-freestanding-hc               # decomposed WRITE-HC emit .h/.c (B13)
just compose-product-plan                # decomposed plan/apply/body COMPOSE (B12)
just read-product-ssot                   # decomposed dual SSOT READ (B11)
just install-freestanding-c-out          # Lake-free install-only when emit present (B10)
just build                  # full Lake emit + install
just systems-emit-wire                   # FREESTANDING-CAPABLE-COMPOSE + READ + STEP-CONTRACT + ...
just systems-host
```

### Proved vs not (partial B15)

| Proved (partial B15) | Still false / not claimed |
|----------------------|---------------------------|
| Step contract module CapableStepContract + SelfApplyFs pins | `productPathFreestandingPerformClaimed` |
| `productPathFreestandingCapableStepContractAuthorityNotEmit` true | `productPathFreestandingCapableStepContractWriteHcSatisfied` |
| `productPathFreestandingCapableStepContractReadSatisfied` true (B16) | B14 `productPathFreestandingCapableRead` |
| `productPathFreestandingCapableStepContractComposeSatisfied` true (B17) | B14 `productPathFreestandingCapableCompose` |
| Named FREESTANDING-CAPABLE-STEP-CONTRACT-* + freestandingCapable* APIs + blockers | Freestanding close of FREESTANDING-PERFORM-GAP-WRITE-HC |
| `productPathFreestandingCapableStepContractFullSatisfied` false (proved) | Freestanding product path without Lake host |
| `productPathFreestandingCapableStepContractPartialReady` with complete false + perform claimed false | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed on step contract module + B14 when release | residual free / proof complete / PROVABLY / llvm |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap + install step mechanism (partial B9) |
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP | Lake-free install entrypoint isolation (partial B10) |
| SELF-HOST-PRODUCT-PATH-PERFORM-READ | Decomposed dual SSOT READ substrate (partial B11) |
| SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE | Decomposed plan/apply/body COMPOSE substrate (partial B12) |
| SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC | Decomposed freestanding .h/.c WRITE-HC substrate (partial B13) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | Freestanding-capable gap measure + ordered pipeline join (partial B14) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT (this section) | Freestanding-capable step contract / interface (partial B15; READ satisfied after B16) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ | Freestanding-capable dual SSOT READ without FreestandingEmit (partial B16) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding-capable READ (Track 3 / claim B) -- partial B16

**Greppable:** SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ,
HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ,
SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0,
product path freestanding capable read,
productPathFreestandingCapableReadPartialReady,
productPathFreestandingCapableReadOk,
productPathFreestandingCapableReadEntrypointClaimed,
productPathFreestandingCapableReadAuthorityNotEmit,
productPathFreestandingCapableReadDependsOnLake,
productPathFreestandingCapableReadLakeFreeRecipe,
freestandingCapableReadDualSsot,
FREESTANDING-CAPABLE-STEP-CONTRACT-READ,
productPathFreestandingCapableStepContractReadSatisfied,
freestanding-capable-read, freestanding-capable-read-lake-free,
slake-freestanding-capable-read,
CapableRead,
FREESTANDING-PERFORM-GAP-READ-SSOT,
productPathFreestandingCapableRead,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingCapableStepContractPartialReady,
SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
productPathHostLakeBootstrapRemains, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B16 + B26 CapableRead**. First **freestanding-
capable product-path READ** that advances FREESTANDING-CAPABLE-STEP-CONTRACT-READ
without classic Lean FreestandingEmit as product authority; B26 adds Lake-free
CapableRead measure:
- Host module `SystemsLean.CapableRead` implements real IO
  `freestandingCapableReadDualSsot`: Mult..Out dual SSOT via `IO.FS.readFile`
  only; presence + HOST-EMIT token + HEADER/BODY structural blocks.
- **Does not import** `SystemsLean.FreestandingEmit`. No emitAtRoot / render /
  product-wire write.
- Distinct from B11 `ProductPathReadSsot` (perform substrate presence+token only;
  not freestanding-capable step contract satisfaction).
- Not full DUAL-SSOT-EQUALITY vs Lean Emit* fragments (that remains FreestandingEmit
  full product path).
- `productPathFreestandingCapableStepContractReadSatisfied` **true** (acceptance:
  "satisfied" = no-FreestandingEmit dual SSOT READ as product authority for the
  freestanding-capable step contract READ).
- B14 `productPathFreestandingCapableRead` **true** after partial B26 via
  `just freestanding-capable-read-lake-free` (token + HEADER/BODY structural;
  no lake build/exe; freestanding-capable contract depth). B16 Lake exe path
  remains (`productPathFreestandingCapableReadDependsOnLake` true as diagnostic).
- Compose/WriteHc/Full step-contract satisfied: Compose/WriteHc true after
  B17/B18; Full stays **false**.
- Diagnostic Lake: `just freestanding-capable-read` -> lake exe
  `slake-freestanding-capable-read`.
- Lake-free CapableRead: `just freestanding-capable-read-lake-free`.
- `productPathFreestandingPerformClaimed` stays **false** (proved).
- `productPathPerformDependsOnLake` stays **true**.
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. Lake bootstrap remains (B4).

**Ban (B6..B26 theater):** Do **not** re-land B11 perform READ or B15 contract
print or ownership-regenerate-read-only as freestanding-capable full close. B16
is real **no-FreestandingEmit dual SSOT READ**; B26 is real **Lake-free freestanding-
capable READ measure** for CapableRead. Do **not** flip perform claimed, ownership
claimed, CapableCompose/WriteHc, FullPerform, WithoutLake, or complete on READ alone.

### Partial B16 + B26 measured path (landed; not complete)

| Layer | What it is | What it is not |
|-------|------------|----------------|
| **Acceptance** | This section + B15 step contract (ReadSatisfied true) + B14 gap + B26 CapableRead + B13..B4 honesty | Complete flip; perform claimed; ownership claimed; Full; freestanding gap close |
| **Host pin** | `SelfApplyFs.productPathFreestandingCapableReadPartialReady` (B15 + ReadOk + ReadSatisfied + entrypoint + authority-not-emit + DependsOnLake true + B14 CapableRead true + Lake-free recipe + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **READ implementation** | `freestandingCapableReadDualSsot` (token + HEADER/BODY structural dual SSOT; no FreestandingEmit) | Lean-fragment DUAL-SSOT-EQUALITY; compose/write; freestanding C runtime |
| **Lake-free CapableRead** | `just freestanding-capable-read-lake-free` (B26; same structural depth; no lake) | ownership-regenerate-read-only presence+token only |
| **Step contract** | FREESTANDING-CAPABLE-STEP-CONTRACT-READ satisfied true | Full satisfied; freestanding perform claimed |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ: acceptance + host pin + CapableRead tokens + lakefile/just + Lake-free recipe; forbid FreestandingEmit import / emitAtRoot; when release present, B15 green (`productPathFreestandingCapableReadGreen`) | Closing FREESTANDING-PERFORM-GAP-COMPOSE/WRITE-HC; llvm unlock |
| **Remaining gap (checkable)** | Lake-free freestanding-capable COMPOSE then WRITE-HC (CapableCompose/WriteHc); FullBar CapableLakeFree; freestanding product owns regenerate WithoutLake; then perform claimed / ownership claimed / later complete | Selling CapableRead alone as full freestanding perform |

**Commands (partial B16 + B26 evidence loop):**

```bash
just freestanding-capable-read-lake-free  # B26 Lake-free freestanding-capable READ (CapableRead)
just freestanding-capable-read            # B16 freestanding-capable dual SSOT READ (Lake diagnostic)
just freestanding-capable-step-contract   # B15 step contract (READ satisfied true)
just freestanding-capable-gap             # B14 freestanding-capable step measure
just read-product-ssot                    # B11 perform substrate (distinct)
just systems-emit-wire                    # FREESTANDING-CAPABLE-READ + STEP-CONTRACT + ...
just systems-host
```

### Proved vs not (partial B16)

| Proved (partial B16) | Still false / not claimed |
|----------------------|---------------------------|
| freestandingCapableReadDualSsot real IO + SelfApplyFs ReadPartialReady | `productPathFreestandingPerformClaimed` |
| `productPathFreestandingCapableStepContractReadSatisfied` true | `productPathFreestandingCapableStepContractComposeSatisfied` / WriteHc / Full |
| No FreestandingEmit import / emitAtRoot on READ module | `productPathFreestandingCapableRead` (B14 measure) |
| `productPathFreestandingCapableReadAuthorityNotEmit` true | Freestanding close of FREESTANDING-PERFORM-GAP-COMPOSE/WRITE-HC |
| `productPathFreestandingCapableReadDependsOnLake` true (honest Lake exe host) | Freestanding product path without Lake host |
| `productPathFreestandingCapableReadPartialReady` with complete false + perform claimed false | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed on READ module + B15 when release | residual free / proof complete / PROVABLY / llvm |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-READ | Decomposed dual SSOT READ substrate (partial B11) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | Freestanding-capable gap measure (partial B14 + B26; CapableRead true) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT | Freestanding-capable step contract (partial B15; ReadSatisfied true after B16; ComposeSatisfied true after B17) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ (this section) | Freestanding-capable dual SSOT READ without FreestandingEmit (partial B16 + B26 CapableRead) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE | Freestanding-capable plan/apply/body COMPOSE without FreestandingEmit (partial B17) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding-capable COMPOSE (Track 3 / claim B) -- partial B17

**Greppable:** SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE,
HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE,
SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0,
product path freestanding capable compose,
productPathFreestandingCapableComposePartialReady,
productPathFreestandingCapableComposeOk,
productPathFreestandingCapableComposeEntrypointClaimed,
productPathFreestandingCapableComposeAuthorityNotEmit,
productPathFreestandingCapableComposeDependsOnLake,
freestandingCapableComposePlanApplyBody,
productPathFreestandingCapableStepContractComposeSatisfied,
FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE,
CapableCompose,
freestanding-capable-compose, freestanding-capable-compose-lake-free,
slake-freestanding-capable-compose,
productPathFreestandingCapableCompose,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingCapableStepContractPartialReady,
productPathFreestandingCapableReadPartialReady,
freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B17 + B27 CapableCompose**. First
**freestanding-capable product-path COMPOSE** without FreestandingEmit as product
authority; B27 adds Lake-free freestanding-capable COMPOSE measure:
- Host module `SystemsLean.CapableCompose` implements real IO
  `freestandingCapableComposePlanApplyBody`: plan/apply/body dual SSOT via
  `IO.FS.readFile` + HOST-EMIT token + HEADER/BODY structural blocks + ordered
  in-memory compose marker (WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY). No
  FreestandingEmit import; no emit-at-root / renderHeader / renderSource / write.
- Deeper than B12 ProductPathComposePlan (perform substrate presence+token join):
  HEADER/BODY structural depth on plan/apply/body inputs.
- `productPathFreestandingCapableStepContractComposeSatisfied` **true** (acceptance:
  "satisfied" = no-emit plan/apply/body structural compose as product authority
  for freestanding-capable step contract COMPOSE).
- B14 `productPathFreestandingCapableCompose` **true** after partial B27 via
  `just freestanding-capable-compose-lake-free` (plan/apply/body token + HEADER/BODY;
  no lake; freestanding-capable depth). B17 Lake exe remains diagnostic
  (`productPathFreestandingCapableComposeDependsOnLake` true).
- Distinct from B24 `ownership-regenerate-compose-only` (ownership framing
  presence+token only).
- WriteHc/Full step-contract: WriteHc satisfied true after B18; Full stays **false**.
- `productPathFreestandingPerformClaimed` stays **false** (proved).
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**.

**Ban (B6..B27 theater):** Do **not** re-land B12 perform COMPOSE, B15 contract
print, or B24 ownership compose-only as freestanding-capable close. B17 is real
**no-FreestandingEmit plan/apply/body structural compose**; B27 is real **Lake-free
freestanding-capable COMPOSE measure**. Do not flip CapableWriteHc, FullPerform,
WithoutLake, or complete on COMPOSE alone.

### Partial B17 + B27 measured path (landed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin** | `SelfApplyFs.productPathFreestandingCapableComposePartialReady` (B16 + ComposeOk + ComposeSatisfied + entrypoint + authority-not-emit + DependsOnLake true + B14 CapableCompose true after B27 + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Step contract** | ComposeSatisfied true via freestandingCapableComposePlanApplyBody | Full satisfied; B14 CapableWriteHc true |
| **Lake-free CapableCompose** | `just freestanding-capable-compose-lake-free` (B27; same structural depth; no lake) | ownership-regenerate-compose-only presence+token only |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE: acceptance + host pin + CapableCompose tokens + lakefile/just + Lake-free recipe; require CapableCompose true; forbid FreestandingEmit import / emitAtRoot; when release present, B16 green (`productPathFreestandingCapableComposeGreen`) | Closing FREESTANDING-PERFORM-GAP-WRITE-HC; llvm unlock |

**Commands (partial B17 + B27 evidence loop):**

```bash
just freestanding-capable-compose-lake-free  # B27 Lake-free freestanding-capable COMPOSE (CapableCompose)
just freestanding-capable-compose            # B17 Lake exe diagnostic plan/apply/body COMPOSE
just freestanding-capable-step-contract      # B15 contract print (ComposeSatisfied true after B17)
just freestanding-capable-read               # B16 freestanding-capable dual SSOT READ
just freestanding-capable-read-lake-free     # B26 Lake-free freestanding-capable READ
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B17 + B27)

| Proved (partial B17 + B27) | Still false / not claimed |
|----------------------------|---------------------------|
| freestandingCapableComposePlanApplyBody real IO + SelfApplyFs ComposePartialReady | `productPathFreestandingPerformClaimed` |
| `productPathFreestandingCapableStepContractComposeSatisfied` true | `productPathFreestandingCapableStepContractFullSatisfied` |
| No FreestandingEmit import / emitAtRoot on COMPOSE module | `productPathFreestandingCapableWriteHc` (B14 measure) |
| B14 `productPathFreestandingCapableCompose` true after B27 Lake-free measure | Freestanding close of FREESTANDING-PERFORM-GAP-WRITE-HC |
| `productPathFreestandingCapableComposeAuthorityNotEmit` true | Full perform; WithoutLake; ownership claimed |
| `productPathFreestandingCapableComposeDependsOnLake` true (honest Lake exe diagnostic) | Freestanding product path without Lake host for full bar |
| `productPathFreestandingCapableComposePartialReady` with complete false + perform claimed false | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed on COMPOSE module + B16 when release | residual free / proof complete / PROVABLY / llvm |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE | Decomposed plan/apply/body COMPOSE substrate (partial B12) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | Freestanding-capable gap measure (partial B14 + B26 + B27; CapableRead+Compose true) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT | Freestanding-capable step contract (partial B15; ComposeSatisfied true after B17) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ | Freestanding-capable dual SSOT READ without FreestandingEmit (partial B16 + B26) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE (this section) | Freestanding-capable plan/apply/body COMPOSE without FreestandingEmit (partial B17 + B27 CapableCompose) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC | Freestanding-capable freestanding .h/.c WRITE without FreestandingEmit (partial B18) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding-capable WRITE-HC (Track 3 / claim B) -- partial B18

**Greppable:** SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC,
HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC,
SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0,
product path freestanding capable write,
productPathFreestandingCapableWriteHcPartialReady,
productPathFreestandingCapableWriteHcOk,
productPathFreestandingCapableWriteHcEntrypointClaimed,
productPathFreestandingCapableWriteHcAuthorityNotEmit,
productPathFreestandingCapableWriteHcDependsOnLake,
freestandingCapableWriteFreestandingHc,
productPathFreestandingCapableStepContractWriteHcSatisfied,
FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC,
CapableWriteHc,
freestanding-capable-write-hc, slake-freestanding-capable-write-hc,
productPathFreestandingCapableWriteHc,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingCapableStepContractPartialReady,
productPathFreestandingCapableComposePartialReady,
freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B18**. First **freestanding-capable product-path
WRITE-HC** without FreestandingEmit as product authority:
- Host module `SystemsLean.CapableWriteHc` implements real IO
  `freestandingCapableWriteFreestandingHc`: Mult..Out dual SSOT via `IO.FS.readFile`
  + HOST-EMIT token + HEADER/BODY structural blocks + template placeholder embed
  (local assemble, not FreestandingEmit.renderHeader/renderSource) +
  `IO.FS.writeFile` of `slake_freestanding.h` / `slake_freestanding.c` under emit/.
  No FreestandingEmit import; no emitAtRoot as product authority.
- Deeper than B13 ProductPathWriteHc (decomposed entrypoint that still calls
  FreestandingEmit.emitAtRoot): structural dual SSOT embed + write without that
  import path.
- `productPathFreestandingCapableStepContractWriteHcSatisfied` **true** (acceptance:
  "satisfied" = no-emit freestanding .h/.c structural write as product authority
  for freestanding-capable step contract WRITE-HC).
- B14 `productPathFreestandingCapableWriteHc` **true** after partial B28
  (`just freestanding-capable-write-hc-lake-free`); this Lake exe remains
  diagnostic (`productPathFreestandingCapableWriteHcDependsOnLake` true).
- Full step-contract satisfied stays **false** (ownership regenerate cliff
  BLOCKER-FREESTANDING-MUST-OWN-REGENERATE / WithoutLake).
- `productPathFreestandingPerformClaimed` stays **false** (proved).
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. Not out/ install ownership (B10 remains separate).
- **Dual-ssot non-claim:** B18 does **not** gate Lean-fragment DUAL-SSOT-EQUALITY
  (that remains FreestandingEmit full product path). Structural dual SSOT
  HEADER/BODY embed only.
- **Operational restore:** a WRITE-HC-only smoke (`just freestanding-capable-write-hc`)
  can leave `src/systems/emit/` bytes out of sync with FreestandingEmit dual-equality
  product path / `out/freestanding-c/` (B2 emit/out match when release present).
  After WRITE-HC-only smoke, run `just build` (FreestandingEmit path +
  Lake-free install) before release or B2 emit-out match claims.

**Ban (B6..B28 theater):** Do **not** re-land B13 perform WRITE-HC or B15 contract
print as freestanding-capable full close. B18 is real **no-FreestandingEmit freestanding
.h/.c structural write**; B28 is Lake-free freestanding-capable WRITE-HC measure.
Do not flip FullPerform, perform claimed, ownership claimed, WithoutLake, or
complete on WRITE-HC alone.

### Partial B18 measured path (landed; evolved B28 CapableWriteHc)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin** | `SelfApplyFs.productPathFreestandingCapableWriteHcPartialReady` (B17 + WriteHcOk + WriteHcSatisfied + entrypoint + authority-not-emit + DependsOnLake true + B14 CapableWriteHc true after B28 + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Step contract** | WriteHcSatisfied true via freestandingCapableWriteFreestandingHc | Full satisfied |
| **B14 CapableWriteHc** | true after `just freestanding-capable-write-hc-lake-free` (B28) | WithoutLake; perform claimed |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC: acceptance + host pin + CapableWriteHc tokens + lakefile/just; require CapableWriteHc true + Lake-free recipe; forbid FreestandingEmit import / emitAtRoot; when release present, B17 green (`productPathFreestandingCapableWriteHcGreen`) | Full freestanding ownership of regenerate; llvm unlock |

**Commands (partial B18 + B28 evidence loop):**

```bash
just freestanding-capable-write-hc-lake-free  # B28 Lake-free freestanding-capable WRITE-HC (CapableWriteHc)
just freestanding-capable-write-hc            # B18 freestanding-capable freestanding .h/.c WRITE (Lake diagnostic)
# B18 does not claim DUAL-SSOT-EQUALITY vs Lean fragments. After WRITE-HC-only
# smoke, restore FreestandingEmit dual-equality emit + release before B2 match:
just build                  # FreestandingEmit write + install Out
just freestanding-capable-step-contract  # B15 contract print (WriteHcSatisfied true after B18)
just freestanding-capable-compose        # B17 freestanding-capable plan/apply/body COMPOSE
just freestanding-capable-read           # B16 freestanding-capable dual SSOT READ
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B18 + B28)

| Proved (partial B18 + B28) | Still false / not claimed |
|----------------------------|---------------------------|
| freestandingCapableWriteFreestandingHc real IO + SelfApplyFs WriteHcPartialReady | `productPathFreestandingPerformClaimed` |
| `productPathFreestandingCapableStepContractWriteHcSatisfied` true | `productPathFreestandingCapableStepContractFullSatisfied` |
| No FreestandingEmit import / emitAtRoot as product authority on WRITE module | Freestanding product owns regenerate (BLOCKER / WithoutLake) |
| `productPathFreestandingCapableWriteHcAuthorityNotEmit` true | WithoutLake true |
| `productPathFreestandingCapableWriteHc` true after B28 Lake-free measure | Full perform / complete |
| `productPathFreestandingCapableWriteHcDependsOnLake` true (honest Lake exe diagnostic) | residual free / proof complete / PROVABLY / llvm |
| `productPathFreestandingCapableWriteHcPartialReady` with complete false + perform claimed false | `freestandingProductSelfHostComplete` |
| pure Nix fail-closed on WRITE module + B17 when release | residual free / proof complete / PROVABLY / llvm |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC | Decomposed freestanding .h/.c WRITE substrate via FreestandingEmit (partial B13) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | Freestanding-capable gap measure (partial B14; CapableWriteHc true after B28) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT | Freestanding-capable step contract (partial B15; WriteHcSatisfied true after B18) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ | Freestanding-capable dual SSOT READ without FreestandingEmit (partial B16) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE | Freestanding-capable plan/apply/body COMPOSE without FreestandingEmit (partial B17) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC (this section) | Freestanding-capable freestanding .h/.c WRITE without FreestandingEmit (partial B18) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE | Freestanding-capable ordered regenerate pipeline join without FreestandingEmit (partial B19) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding-capable ordered regenerate (Track 3 / claim B) -- partial B19

**Greppable:** SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE,
HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE,
SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0,
product path freestanding capable regenerate,
productPathFreestandingCapableRegeneratePartialReady,
productPathFreestandingCapableRegenerateOk,
productPathFreestandingCapableRegenerateEntrypointClaimed,
productPathFreestandingCapableRegenerateAuthorityNotEmit,
productPathFreestandingCapableRegenerateDependsOnLake,
productPathFreestandingCapableRegenerateInstallOutOpen,
freestandingCapableOrderedRegenerate,
FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE,
CapableRegenerate,
freestanding-capable-regenerate, slake-freestanding-capable-regenerate,
productPathFreestandingCapableStepContractFullSatisfied,
BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingCapableWriteHcPartialReady,
freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B19** (evolved with B20 Install Out). First
**freestanding-capable ordered regenerate pipeline join** without FreestandingEmit
as product authority:
- Host module `SystemsLean.CapableRegenerate` implements real
  IO `freestandingCapableOrderedRegenerate`: ordered call of
  `freestandingCapableReadDualSsot` (B16) then
  `freestandingCapableComposePlanApplyBody` (B17) then
  `freestandingCapableWriteFreestandingHc` (B18) then
  `freestandingCapableInstallFreestandingOut` (B20). No FreestandingEmit import; no
  emitAtRoot as product authority.
- Deeper than B14 `just regenerate-product-path` (host Lake perform entrypoints
  read-product-ssot / compose-product-plan / write-freestanding-hc / install): this
  joins freestanding-capable no-emit steps as one pipeline.
- `productPathFreestandingCapableRegenerateInstallOutOpen` **false** after B20
  (freestanding-capable path owns Install Out via freestandingCapableInstallFreestandingOut).
- `productPathFreestandingCapableStepContractFullSatisfied` stays **false**
  (WithoutLake closed B30 as product path authority; Full is more than ordered
  pipeline alone). CapableRead/Compose/WriteHc true after B26..B28 Lake-free
  measures; FullBar CapableLakeFree true.
- Pipeline Lake exe remains diagnostic (`productPathFreestandingCapableRegenerateDependsOnLake`
  true) -- DependsOnLake is **not** the same as Capable* false.
- `productPathFreestandingPerformClaimed` stays **false** (proved).
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. WithoutLake was open at B19 land; closed only with B30 product
  path authority (still not Full/perform/ownership claimed).
- **Operational note:** pipeline includes WRITE-HC structural embed + install; can
  leave emit bytes out of sync with FreestandingEmit dual-equality product path.
  For FreestandingEmit dual-equality release match, run `just build`.

**Ban (B6..B20 theater):** Do **not** re-land B14 host pipeline or B18 WRITE-HC alone
as freestanding-capable Full close. B19 is real **no-FreestandingEmit ordered
READ+COMPOSE+WRITE-HC(+INSTALL-OUT) join**. Do not flip Full, perform claimed,
ownership claimed, or complete on pipeline join alone (Capable* already true via
B26..B28 Lake-free measures, not via B19 alone; WithoutLake closed only B30).

### Partial B19 measured path (landed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin** | `SelfApplyFs.productPathFreestandingCapableRegeneratePartialReady` (B18 + RegenerateOk + entrypoint + authority-not-emit + DependsOnLake true + InstallOut closed + Full false + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Pipeline** | freestandingCapableOrderedRegenerate (READ then COMPOSE then WRITE-HC then Install Out) | Full satisfied; ownership of regenerate without Lake |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE: acceptance + host pin + CapableRegenerate tokens + lakefile/just; forbid FreestandingEmit import / Full true / InstallOutOpen true; when release present, B18 green (`productPathFreestandingCapableRegenerateGreen`) | Full freestanding ownership of regenerate; llvm unlock |

**Commands (partial B19 evidence loop):**

```bash
just freestanding-capable-regenerate     # B19 freestanding-capable ordered READ+COMPOSE+WRITE-HC+INSTALL-OUT
just freestanding-capable-install-out    # B20 freestanding-capable Install Out alone
# Optional FreestandingEmit dual-equality emit + release before B2 match:
just build                  # FreestandingEmit write + install Out
just freestanding-capable-write-hc       # B18 freestanding-capable freestanding .h/.c WRITE alone
just freestanding-capable-step-contract  # B15 contract print (Full still false after B19/B20)
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B19)

| Proved (partial B19) | Still false / not claimed |
|----------------------|---------------------------|
| freestandingCapableOrderedRegenerate real ordered IO + SelfApplyFs RegeneratePartialReady | `productPathFreestandingPerformClaimed` |
| No FreestandingEmit import as product authority on regenerate module | `productPathFreestandingCapableStepContractFullSatisfied` |
| `productPathFreestandingCapableRegenerateAuthorityNotEmit` true | Full / perform claimed / ownership claimed / complete |
| `productPathFreestandingCapableRegenerateInstallOutOpen` false (B20 owns install) | `freestandingProductSelfHostComplete` |
| `productPathFreestandingCapableRegenerateDependsOnLake` true (honest Lake exe host; Capable* true via B26..B28 Lake-free) | residual free / proof complete / PROVABLY / llvm |
| `productPathFreestandingCapableRegeneratePartialReady` with complete false + perform claimed false | (WithoutLake closed B30 as product path authority only) |
| pure Nix fail-closed on regenerate module + B18 when release | |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | Freestanding-capable gap measure + B14 host regenerate-product-path (partial B14) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT | Freestanding-capable step contract (partial B15; Full false) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ | Freestanding-capable dual SSOT READ (partial B16) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE | Freestanding-capable plan/apply/body COMPOSE (partial B17) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC | Freestanding-capable freestanding .h/.c WRITE (partial B18) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE (this section) | Freestanding-capable ordered regenerate pipeline join (partial B19) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT | Freestanding-capable Install Out (partial B20) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding-capable Install Out (Track 3 / claim B) -- partial B20

**Greppable:** SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT,
HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT,
SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0,
product path freestanding capable install out,
productPathFreestandingCapableInstallOutPartialReady,
productPathFreestandingCapableInstallOutOk,
productPathFreestandingCapableInstallOutEntrypointClaimed,
productPathFreestandingCapableInstallOutAuthorityNotEmit,
productPathFreestandingCapableInstallOutDependsOnLake,
freestandingCapableInstallFreestandingOut,
FREESTANDING-CAPABLE-INSTALL-OUT,
WRITER-PATH-STEP-INSTALL-OUT,
InstallOut,
freestanding-capable-install-out, slake-freestanding-capable-install-out,
productPathFreestandingCapableRegenerateInstallOutOpen,
productPathFreestandingCapableStepContractFullSatisfied,
BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingCapableRegeneratePartialReady,
freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B20**. First **freestanding-capable Install Out**
without FreestandingEmit as product authority:
- Host module `SystemsLean.InstallOut` implements real
  IO `freestandingCapableInstallFreestandingOut`: read emit `slake_freestanding.{h,c}`
  (fail-closed if missing), `IO.FS.createDirAll` for `out/freestanding-c/`, write
  installed copies via `IO.FS.writeFile`, post-install greppable token honesty
  (stage / HOST-EMIT / product-wire subset). No FreestandingEmit import; no
  emitAtRoot as product authority.
- Deeper than B10 `just install-freestanding-c-out` (Lake-free shell cp process glue):
  this is a Lean IO freestanding-capable install path.
- `productPathFreestandingCapableRegenerateInstallOutOpen` **false** (install owned
  by freestanding-capable path; ordered regenerate step 4/4 also calls this API).
- `productPathFreestandingCapableStepContractFullSatisfied` stays **false**
  (install alone is not Full close; WithoutLake closed B30 as product path
  authority; Full still needs perform/ownership claimed). CapableRead/Compose/WriteHc
  true after B26..B28; FullBar CapableLakeFree true.
- Install Lake exe remains diagnostic (`productPathFreestandingCapableInstallOutDependsOnLake`
  true) -- DependsOnLake is **not** the same as Capable* false.
- `productPathFreestandingPerformClaimed` stays **false** (proved).
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. WithoutLake was open at B20 land; closed only with B30 product
  path authority (still not Full/perform/ownership claimed).

**Ban (B6..B20 theater):** Do **not** sell B10 shell install or B20 install alone
as Full / perform claimed / ownership claimed / complete. B20 is real
**no-FreestandingEmit Lean IO install**. Do not flip Full, perform claimed,
ownership claimed, or complete on install alone (Capable* already true via
B26..B28 Lake-free measures; WithoutLake closed only B30).

### Partial B20 measured path (landed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin** | `SelfApplyFs.productPathFreestandingCapableInstallOutPartialReady` (B19 + InstallOutOk + entrypoint + authority-not-emit + DependsOnLake true + InstallOut closed + Full false + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Install** | freestandingCapableInstallFreestandingOut (emit -> out/freestanding-c/) | Full satisfied; perform claimed; ownership claimed |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT: acceptance + host pin + InstallOut tokens + lakefile/just; forbid FreestandingEmit import / Full true / InstallOutOpen true; when release present, B19 green (`productPathFreestandingCapableInstallOutGreen`) | Full freestanding ownership regenerate; llvm unlock |

**Commands (partial B20 evidence loop):**

```bash
just freestanding-capable-install-out    # B20 freestanding-capable Install Out (needs emit present)
just freestanding-capable-regenerate     # B19 pipeline includes Install Out as step 4/4
just freestanding-capable-write-hc       # B18 WRITE first if emit missing
just freestanding-capable-step-contract  # Full still false after B20
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B20)

| Proved (partial B20) | Still false / not claimed |
|----------------------|---------------------------|
| freestandingCapableInstallFreestandingOut real install IO + SelfApplyFs InstallOutPartialReady | `productPathFreestandingPerformClaimed` |
| No FreestandingEmit import as product authority on install module | `productPathFreestandingCapableStepContractFullSatisfied` |
| `productPathFreestandingCapableInstallOutAuthorityNotEmit` true | Full / perform claimed / ownership claimed / complete |
| `productPathFreestandingCapableRegenerateInstallOutOpen` false | `freestandingProductSelfHostComplete` |
| `productPathFreestandingCapableInstallOutDependsOnLake` true (honest Lake exe host; Capable* true via B26..B28) | residual free / proof complete / PROVABLY / llvm |
| `productPathFreestandingCapableInstallOutPartialReady` with complete false + perform claimed false | (WithoutLake closed B30 as product path authority only) |
| pure Nix fail-closed on install module + B19 when release | |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-STEP | B10 Lake-free shell install entrypoint (partial) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE | Freestanding-capable ordered regenerate (partial B19; includes Install Out after B20) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT (this section) | Freestanding-capable Install Out (partial B20) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR | Full bar / ownership-gap measure (partial B21) |
| SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE | Ownership regenerate substrate (partial B22..B30: install+READ+COMPOSE+WRITE-HC Lake-free via ownership-regenerate-*-only; B29 join; B30 product path authority + WithoutLake true; Full still open) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding-capable Full bar / ownership gap (Track 3 / claim B) -- partial B21

**Greppable:** SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR,
HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR,
SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0,
product path freestanding capable full bar,
productPathFreestandingCapableFullBarPartialReady,
productPathFreestandingCapableFullBarOk,
productPathFreestandingCapableFullBarStepContractsClosed,
productPathFreestandingCapableFullBarInstallOutClosed,
productPathFreestandingCapableFullBarOrderedPipelineJoined,
productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake,
productPathFreestandingCapableFullBarCapableLakeFree,
productPathFreestandingCapableFullBarDependsOnLake,
productPathFreestandingCapableStepContractFullSatisfied,
FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE,
FULL-BAR-REQ-B14-CAPABLE-READ-LAKE-FREE,
FULL-BAR-REQ-B14-CAPABLE-COMPOSE-LAKE-FREE,
FULL-BAR-REQ-B14-CAPABLE-WRITE-HC-LAKE-FREE,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
CapableFullBar,
freestanding-capable-full-bar, slake-freestanding-capable-full-bar,
BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingCapableInstallOutPartialReady,
freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B21**. First **Full bar / ownership-gap measure**
beyond B20 Install Out:
- Host module `SystemsLean.CapableFullBar` measures what
  Full freestanding-capable step-contract needs after B16..B20 closed the step
  contracts, ordered regenerate, and Install Out.
- **Closed (proved true):** step contracts READ+COMPOSE+WRITE-HC
  (`productPathFreestandingCapableFullBarStepContractsClosed`); Install Out closed
  (`productPathFreestandingCapableFullBarInstallOutClosed`); ordered regenerate
  joined (`productPathFreestandingCapableFullBarOrderedPipelineJoined`).
- **Closed (also proved true after B26..B28):** FullBar CapableLakeFree
  (`productPathFreestandingCapableFullBarCapableLakeFree` true;
  `FULL-BAR-REQ-B14-CAPABLE-*-LAKE-FREE` satisfied by CapableRead+Compose+WriteHc
  Lake-free measures).
- **Closed (also proved true after B30):** ownership regenerate WithoutLake as
  product path authority
  (`productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake` true /
  `FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE` /
  `BLOCKER-FREESTANDING-MUST-OWN-REGENERATE` dual-pin with
  `productPathOwnershipRegenerateWithoutLake` true).
- **Open (proved false):** perform claimed with freestanding evidence; ownership
  claimed with freestanding evidence; Full step-contract; complete.
- `productPathFreestandingCapableStepContractFullSatisfied` stays **false**
  (Full requires perform claimed + ownership claimed with real freestanding
  evidence -- dual-pin: Capable* true != Full true; WithoutLake true != Full true;
  Full != pipeline join alone).
- Lake diagnostic host remains (`productPathFreestandingCapableFullBarDependsOnLake`
  true for FullBar measure print / Lake paths) -- not a re-open of Capable*.
- `productPathFreestandingPerformClaimed` stays **false** (proved).
- `productPathFreestandingOwnershipClaimed` stays **false**. Claim **B complete**
  stays **false**. WithoutLake true after B30 (product path authority only;
  still not Full/perform/ownership claimed).

**Ban (B6..B21 theater):** Do **not** re-land B14 gap print, B15 step contract, or
B16..B20 pipeline steps as Full close. B21 is a **new greppable Full-bar measure**
of closed vs open. Do not flip Full, perform claimed, ownership claimed, or
complete on measure alone (Capable* + CapableLakeFree already true after B26..B28;
WithoutLake closed only with B30 product path authority).

### Partial B21 measured path (landed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin** | `SelfApplyFs.productPathFreestandingCapableFullBarPartialReady` (B20 + FullBarOk + closed pins true + CapableLakeFree true after B26..B28 + ownership WithoutLake true after B30 + DependsOnLake true + Full false + perform claimed false + complete false) | Freestanding product compiler of Slake sources |
| **Measure** | CapableFullBar closed vs open table + just freestanding-capable-full-bar | Full satisfied; perform claimed; ownership claimed; complete |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR: acceptance + host pin + FullBar module tokens + lakefile/just; forbid Full/ownership true dishonest flips; when release present, B20 green (`productPathFreestandingCapableFullBarGreen`) | Full freestanding ownership regenerate; llvm unlock |

**Commands (partial B21 evidence loop):**

```bash
just freestanding-capable-full-bar       # B21 Full bar / ownership-gap measure print
just freestanding-capable-install-out    # B20 Install Out (closed pin evidence)
just freestanding-capable-regenerate     # B19 ordered pipeline (closed pin evidence)
just freestanding-capable-step-contract  # Full still false after B21
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B21)

| Proved (partial B21; evolved B30) | Still false / not claimed |
|----------------------|---------------------------|
| FullBar measure surface + SelfApplyFs FullBarPartialReady | `productPathFreestandingPerformClaimed` |
| Step contracts closed true (B16..B18 substrate) | `productPathFreestandingCapableStepContractFullSatisfied` |
| Install Out closed true (B20) | Full step-contract satisfied |
| Ordered regenerate joined true (B19) | ownership claimed / perform claimed |
| CapableLakeFree true (Read+Compose+WriteHc after B26..B28) | `freestandingProductSelfHostComplete` |
| Ownership regenerate WithoutLake true after B30 (product path authority dual-pin) | residual free / proof complete / PROVABLY / llvm |
| `productPathFreestandingCapableFullBarDependsOnLake` true (Lake diagnostic) | |
| pure Nix fail-closed on FullBar module + B20 when release | |

---

## Product path ownership regenerate substrate (Track 3 / claim B) -- partial B22..B30

**Greppable:** SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE,
HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE,
SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0,
product path ownership regenerate,
productPathOwnershipRegeneratePartialReady,
productPathOwnershipRegenerateOk,
productPathOwnershipRegenerateInstallLakeFree,
productPathOwnershipRegenerateReadLakeFree,
productPathOwnershipRegenerateComposeLakeFree,
productPathOwnershipRegenerateWriteHcLakeFree,
productPathOwnershipRegenerateWithoutLake,
productPathOwnershipRegenerateDependsOnLake,
productPathOwnershipRegenerateInstallPathClaimed,
productPathOwnershipRegenerateReadPathClaimed,
productPathOwnershipRegenerateComposePathClaimed,
productPathOwnershipRegenerateWriteHcPathClaimed,
productPathOwnershipRegenerateLakeFreeJoinClaimed,
productPathOwnershipRegenerateProductPathAuthorityClaimed,
OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE,
OWNERSHIP-REGENERATE-READ-LAKE-FREE,
OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE,
OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE,
OWNERSHIP-REGENERATE-LAKE-FREE-JOIN,
OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY,
ProductPathOwnershipRegenerate,
ownership-regenerate, ownership-regenerate-install-only,
ownership-regenerate-read-only, ownership-regenerate-compose-only,
ownership-regenerate-write-hc-only, ownership-regenerate-lake-free,
ownership-regenerate-product-path-authority,
slake-ownership-regenerate, install-freestanding-c-out,
BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE,
productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingCapableFullBarPartialReady,
freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B22..B30**. Ownership regenerate path
substrate beyond B21 Full-bar measure:
- Host module `SystemsLean.ProductPathOwnershipRegenerate` names ordered
  ownership regenerate step Lake-free status and claims real Lake-free path
  pieces under ownership framing, plus B30 product path authority.
- **Closed (proved true):** install Lake-free
  (`productPathOwnershipRegenerateInstallLakeFree` /
  `OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE` via
  `just ownership-regenerate-install-only` -> `install-freestanding-c-out`);
  install path claimed (`productPathOwnershipRegenerateInstallPathClaimed`);
  **B23 READ Lake-free** (`productPathOwnershipRegenerateReadLakeFree` /
  `OWNERSHIP-REGENERATE-READ-LAKE-FREE` via
  `just ownership-regenerate-read-only` dual SSOT presence+token; no lake);
  READ path claimed (`productPathOwnershipRegenerateReadPathClaimed`);
  **B24 COMPOSE Lake-free** (`productPathOwnershipRegenerateComposeLakeFree` /
  `OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE` via
  `just ownership-regenerate-compose-only` plan/apply/body presence+token;
  no lake); COMPOSE path claimed
  (`productPathOwnershipRegenerateComposePathClaimed`);
  **B25 WRITE-HC Lake-free** (`productPathOwnershipRegenerateWriteHcLakeFree` /
  `OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE` via
  `just ownership-regenerate-write-hc-only` freestanding .h/.c presence+token;
  no lake); WRITE-HC path claimed
  (`productPathOwnershipRegenerateWriteHcPathClaimed`);
  **B29 ordered Lake-free join** (`productPathOwnershipRegenerateLakeFreeJoinClaimed` /
  `OWNERSHIP-REGENERATE-LAKE-FREE-JOIN` via
  `just ownership-regenerate-lake-free`: freestanding-capable-*-lake-free then
  ownership path pieces then install; no lake);
  **B30 product path authority** (`productPathOwnershipRegenerateProductPathAuthorityClaimed` /
  `OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY` via
  `just ownership-regenerate-product-path-authority`: freestanding-capable
  AuthorityNotEmit modules + Lake-free Capable* depth + install; not
  FreestandingEmit; not B29 join rebrand);
  **WithoutLake true** (`productPathOwnershipRegenerateWithoutLake` dual-pin
  FullBar `productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake`).
- `productPathOwnershipRegenerateDependsOnLake` stays **true** (measure Lake exe
  + perform residual; WithoutLake closed as product path authority only).
  Freestanding CapableRead/Compose/WriteHc are **true** after B26..B28 via
  freestanding-capable-*-lake-free (distinct from ownership path pieces).
  FullBar CapableLakeFree true.
- `productPathFreestandingOwnershipClaimed` stays **false**. Perform claimed
  stays **false**. Full step-contract stays **false**. Claim **B complete**
  stays **false**. Ownership WRITE-HC Lake-free (B25) != freestanding-capable
  CapableWriteHc (B28); B29 join alone is not WithoutLake (B30 authority is).

**Ban (B6..B29 theater):** Do **not** re-land B10 install, B11 Lake READ, B12
Lake COMPOSE, B13 Lake WRITE-HC, B14 InstallOnly, B16/B17/B18 Lake freestanding-
capable READ/COMPOSE/WRITE-HC, B20 Lake-hosted Install Out, B21 Full-bar measure,
B22 install-only, B23 READ-only, B24 COMPOSE-only, B25 WRITE-HC-only, B26..B28
Capable* alone, or B29 ordered Lake-free join as ownership claimed, Full,
perform claimed, or complete. B30 is a **new greppable product path authority**
recipe (not a rename of B29 join). Do not flip ownership claimed, Full, perform
claimed, or complete on path pieces + Capable* + join + authority alone.

### Partial B22..B30 measured path (landed; WithoutLake closed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin** | `SelfApplyFs.productPathOwnershipRegeneratePartialReady` (B21 + Ok + install+READ+COMPOSE+WRITE-HC Lake-free true + B29 join claimed + B30 product path authority claimed + WithoutLake true + DependsOnLake true + Full false + perform/ownership claimed false + complete false) | ownership claimed; perform claimed; Full; complete |
| **Path pieces + join + authority** | `just ownership-regenerate-install-only` + `just ownership-regenerate-read-only` + `just ownership-regenerate-compose-only` + `just ownership-regenerate-write-hc-only` + `just ownership-regenerate-lake-free` + `just ownership-regenerate-product-path-authority` (freestanding-capable AuthorityNotEmit + Capable* lake-free + install; not FreestandingEmit) + measure `just ownership-regenerate` | ownership claimed; Full step-contract |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: acceptance + host pin + module tokens + lakefile/just; require B29 join claimed true + B30 authority claimed true + WithoutLake true; forbid WithoutLake false / authority false dishonest flips; dual-pin freestanding Capable* true after B26..B28; when release present, B21 green | perform claimed; complete; llvm unlock |

**Commands (partial B22..B30 evidence loop):**

```bash
just ownership-regenerate-install-only   # B22 Lake-free ownership install path
just ownership-regenerate-read-only      # B23 Lake-free ownership READ path
just ownership-regenerate-compose-only   # B24 Lake-free ownership COMPOSE path
just ownership-regenerate-write-hc-only  # B25 Lake-free ownership WRITE-HC path
just ownership-regenerate-lake-free      # B29 ordered Lake-free join (Capable* + path pieces)
just ownership-regenerate-product-path-authority  # B30 freestanding product path authority
just ownership-regenerate                # B22..B30 ownership regenerate measure print
just freestanding-capable-full-bar       # B21 Full bar (WithoutLake true after B30; Full false)
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B22..B30)

| Proved (partial B22..B30) | Still false / not claimed |
|---------------------------|---------------------------|
| Ownership regenerate surface + SelfApplyFs OwnershipRegeneratePartialReady | `productPathFreestandingOwnershipClaimed` |
| Install Lake-free true (ownership framing path piece) | Full step-contract |
| Install path claimed true | ownership claimed / perform claimed |
| READ Lake-free true (B23 ownership framing dual SSOT path) | `productPathFreestandingCapableStepContractFullSatisfied` |
| COMPOSE Lake-free true (B24 ownership framing plan/apply/body path) | complete |
| WRITE-HC Lake-free true (B25 ownership framing freestanding .h/.c path) | residual free / proof complete / PROVABLY / llvm |
| B29 ordered Lake-free join claimed (Capable* + path pieces + install) | B29 join alone as WithoutLake (B30 authority is) |
| B30 product path authority claimed (freestanding-capable AuthorityNotEmit) | `productPathFreestandingPerformClaimed` |
| WithoutLake true (dual-pin FullBar; product path authority) | `freestandingProductSelfHostComplete` |
| FullBar OwnershipRegenerateWithoutLake true | Freestanding C binary self-regenerate |
| DependsOnLake true (measure Lake + perform residual) | Lake bootstrap retired as product path |
| pure Nix fail-closed on ownership regenerate module + B21 when release | |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT | Step contract (partial B15; Full false) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | B14 Capable* Lake-free measures true after B26..B28; full perform false |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT | Install Out closed (partial B20) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE | Ordered regenerate joined (partial B19) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR (prior B21 section) | Full bar / ownership-gap measure (partial B21) |
| SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE | Freestanding perform evidence (partial B31; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH | Official-path gap measure (partial B32; perform claimed false) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform evidence (Track 3 / claim B) -- partial B31

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0,
product path freestanding perform evidence,
productPathFreestandingPerformEvidencePartialReady,
productPathFreestandingPerformEvidenceOk,
productPathFreestandingPerformEvidenceClaimed,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
FREESTANDING-PERFORM-EVIDENCE,
FREESTANDING-PERFORM-EVIDENCE-READ-SSOT,
FREESTANDING-PERFORM-EVIDENCE-COMPOSE,
FREESTANDING-PERFORM-EVIDENCE-WRITE-HC,
FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT,
FREESTANDING-PERFORM-EVIDENCE-ORDERED,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
FREESTANDING-PERFORM-GAP-READ-SSOT,
FREESTANDING-PERFORM-GAP-COMPOSE,
FREESTANDING-PERFORM-GAP-WRITE-HC,
freestandingCapableReadDualSsot,
freestandingCapableComposePlanApplyBody,
freestandingCapableWriteFreestandingHc,
freestandingCapableInstallFreestandingOut,
freestandingCapableOrderedRegenerate,
FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE,
freestanding-perform-evidence, freestanding-perform-evidence-measure,
slake-freestanding-perform-evidence, PerformEvidence,
freestanding-capable-read-lake-free, freestanding-capable-compose-lake-free,
freestanding-capable-write-hc-lake-free, install-freestanding-c-out,
productPathOwnershipRegeneratePartialReady,
productPathOwnershipRegenerateProductPathAuthorityClaimed,
productPathOwnershipRegenerateWithoutLake,
freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B31**. First **freestanding perform evidence**
substrate beyond B30 product path authority / WithoutLake:
- Host module `SystemsLean.PerformEvidence` measures
  freestanding-capable performers for FREESTANDING-PERFORM-GAP-* under **perform
  framing** (not ownership authority rebrand).
- **Closed (proved true):** freestanding perform evidence claimed
  (`productPathFreestandingPerformEvidenceClaimed` /
  `FREESTANDING-PERFORM-EVIDENCE` via `just freestanding-perform-evidence`:
  freestanding-capable AuthorityNotEmit modules + freestandingCapable* API cites
  + Lake-free Capable* depth + install + ordered regenerate pipeline cite).
- **Open (proved false):** `productPathFreestandingPerformClaimed` (official
  product path regenerate still depends on Lake elaborating FreestandingEmit via
  `just build`; `productPathPerformDependsOnLake` true;
  `productPathHostLakeBootstrapRemains` true; FREESTANDING-PERFORM-GAP-* still
  named open on official path).
- `FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE` stays **open** (evidence substrate
  is not perform claimed; dual-pin forbids flipping perform claimed from evidence
  alone without DependsOnLake honesty).
- Full step-contract / ownership claimed / complete stay **false**.

**Ban (B6..B30 theater):** Do **not** re-land B30 ownership authority, B29 join,
B26..B28 Capable*, B19 ordered regenerate, or path pieces as perform claimed.
B31 is a **new greppable perform evidence** stage under perform framing. Do not
flip `productPathFreestandingPerformClaimed` solely because WithoutLake /
authority / Capable* / evidence substrate are true while official path still
uses FreestandingEmit.

### Partial B31 measured path (landed; not perform claimed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin** | `SelfApplyFs.productPathFreestandingPerformEvidencePartialReady` (B30 + Ok + evidence claimed true + perform claimed false + DependsOnLake true + Full false + ownership claimed false + complete false) | perform claimed; Full; ownership claimed; complete |
| **Lake-free evidence** | `just freestanding-perform-evidence` reuses Capable* lake-free depth already closed B26..B28/B30 (not new freestanding performer IO); dual-pins perform framing + AuthorityNotEmit + freestandingCapable* API cites + install under FREESTANDING-PERFORM-EVIDENCE-*; not ownership path pieces; not FreestandingEmit; not B30 authority rebrand + measure `just freestanding-perform-evidence-measure` | perform claimed; official path Lake retirement; new performer IO theater |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE: acceptance + host pin + module tokens + lakefile/just; require evidence claimed true; forbid perform claimed true / evidence claimed false dishonest flips; when release present, B30 green | complete; free; llvm unlock |

**Commands (partial B31 evidence loop):**

```bash
just freestanding-perform-evidence          # B31 Lake-free freestanding perform evidence
just freestanding-perform-evidence-measure  # B31 measure print (Lake diagnostic)
just ownership-regenerate-product-path-authority  # B30 still green
just freestanding-capable-full-bar          # Full false; perform claimed open
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B31)

| Proved (partial B31) | Still false / not claimed |
|----------------------|---------------------------|
| Perform evidence surface + SelfApplyFs PerformEvidencePartialReady | `productPathFreestandingPerformClaimed` |
| Evidence claimed true (freestanding-capable performers under perform framing) | Full step-contract |
| FREESTANDING-PERFORM-EVIDENCE-* tokens + freestandingCapable* API cites | ownership claimed |
| Lake-free evidence recipe (no lake build/exe) | `freestandingProductSelfHostComplete` |
| DependsOnLake true (official FreestandingEmit path remains) | residual free / proof complete / PROVABLY / llvm |
| pure Nix fail-closed: evidence true; perform claimed false; B30 when release | FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE | Ownership regenerate + B30 authority / WithoutLake (partial B22..B30) |
| SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP | Capable* Lake-free measures (partial B14; evolved B26..B28) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE (this section) | Freestanding perform evidence (partial B31; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH | Official-path gap measure (partial B32; perform claimed false) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform official-path gap (Track 3 / claim B) -- partial B32

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0,
product path freestanding perform official path,
productPathFreestandingPerformOfficialPathPartialReady,
productPathFreestandingPerformOfficialPathOk,
productPathFreestandingPerformOfficialPathGapMeasured,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingPerformEvidenceClaimed,
FREESTANDING-PERFORM-OFFICIAL-PATH-GAP,
FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT,
FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE,
FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT,
FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE,
FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER,
FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, FreestandingEmit, slake-emit-freestanding-c,
freestanding-perform-official-path, freestanding-perform-official-path-measure,
slake-freestanding-perform-official-path, OfficialPath,
freestanding-perform-evidence, PerformEvidence,
freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B32**. First **official product path gap**
measure beyond B31 freestanding perform evidence:
- Host module `SystemsLean.OfficialPath` dual-pins
  that official regenerate (`just build`) still uses Lake elaborating
  FreestandingEmit as product writer while B31 evidence claimed true.
- **Closed (proved true):** official-path gap measured
  (`productPathFreestandingPerformOfficialPathGapMeasured` /
  `FREESTANDING-PERFORM-OFFICIAL-PATH-GAP` via `just freestanding-perform-official-path`:
  official path Lake writer / exe cites + still FreestandingEmit + still Lake +
  retire-FreestandingEmit-required + B31 evidence re-green).
- **Open (proved false):** `productPathFreestandingPerformClaimed` (official
  product path regenerate still depends on Lake elaborating FreestandingEmit via
  `just build`; `productPathPerformDependsOnLake` true;
  `productPathHostLakeBootstrapRemains` true; FREESTANDING-PERFORM-GAP-* still
  named open on official path).
- `FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE` stays **open** (gap measure is not
  perform claimed; dual-pin forbids flipping perform claimed from evidence or gap
  alone without DependsOnLake honesty and FreestandingEmit retirement).
- Full step-contract / ownership claimed / complete stay **false**.

**Ban (B6..B31 theater):** Do **not** re-land B31 perform evidence, B30 ownership
authority, B29 join, B26..B28 Capable*, or path pieces as perform claimed.
B32 is a **new greppable official-path gap** stage under perform framing. Do not
flip `productPathFreestandingPerformClaimed` solely because WithoutLake /
authority / Capable* / evidence substrate / gap measured are true while official
path still uses FreestandingEmit.

### Partial B32 measured path (landed; not perform claimed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin** | `SelfApplyFs.productPathFreestandingPerformOfficialPathPartialReady` (B31 + Ok + gap measured true + perform claimed false + DependsOnLake true + still FreestandingEmit + still Lake + retire required + Full false + ownership claimed false + complete false) | perform claimed; Full; ownership claimed; complete |
| **Lake-free gap** | `just freestanding-perform-official-path` dual-pins official path still Lake FreestandingEmit (just build + lake emit cites) + B31 evidence re-green; not new freestanding performer IO; not FreestandingEmit retirement; not B31 evidence rebrand + measure `just freestanding-perform-official-path-measure` | perform claimed; official path Lake retirement |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH: acceptance + host pin + module tokens + lakefile/just; require gap measured true; forbid perform claimed true / gap measured false dishonest flips; when release present, B31 green | complete; free; llvm unlock |

**Commands (partial B32 official-path gap loop):**

```bash
just freestanding-perform-official-path          # B32 Lake-free official-path gap
just freestanding-perform-official-path-measure  # B32 measure print (Lake diagnostic)
just freestanding-perform-evidence               # B31 still green
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B32)

| Proved (partial B32) | Still false / not claimed |
|----------------------|---------------------------|
| Official-path gap surface + SelfApplyFs OfficialPathPartialReady | `productPathFreestandingPerformClaimed` |
| Gap measured true (official path still Lake FreestandingEmit) | Full step-contract |
| FREESTANDING-PERFORM-OFFICIAL-PATH-* tokens + just build cites | ownership claimed |
| Lake-free gap recipe (no lake build/exe on gap itself) | `freestandingProductSelfHostComplete` |
| DependsOnLake true (official FreestandingEmit path remains) | residual free / proof complete / PROVABLY / llvm |
| pure Nix fail-closed: gap true; perform claimed false; B31 when release | FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE | Freestanding perform evidence (partial B31; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH (this section) | Official-path gap measure (partial B32; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE | Official-path alternate writer (partial B33; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform official-path alternate (Track 3 / claim B) -- partial B33

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0,
product path freestanding perform official path alternate,
productPathFreestandingPerformOfficialPathAlternatePartialReady,
productPathFreestandingPerformOfficialPathAlternateOk,
productPathFreestandingPerformOfficialPathAlternateMeasured,
productPathOfficialPathAlternateWriterPresent,
productPathOfficialPathAlternateNotOfficial,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingPerformOfficialPathGapMeasured,
FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE,
FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER,
FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL,
FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT,
FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE,
freestandingCapableOrderedRegenerate, freestanding-capable-regenerate,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, FreestandingEmit, slake-emit-freestanding-c,
freestanding-perform-official-path-alternate,
freestanding-perform-official-path-alternate-measure,
slake-freestanding-perform-official-path-alternate,
OfficialPathAlternate,
OfficialPath,
CapableRegenerate,
freestanding-perform-official-path, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B33**. First **official product path alternate
writer** measure beyond B32 official-path gap:
- Host module `SystemsLean.OfficialPathAlternate`
  dual-pins that freestanding-capable ordered regenerate exists as a non-
  FreestandingEmit alternate writer (AuthorityNotEmit), is **not** the official
  `just build` product path, and that dual-equality / structural
  WRITE embed honesty still blocks retiring FreestandingEmit as official writer.
- **Closed (proved true):** official-path alternate measured
  (`productPathFreestandingPerformOfficialPathAlternateMeasured` /
  `FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE` via
  `just freestanding-perform-official-path-alternate`: alternate writer present +
  not official + dual-equality blocks retirement + official path still Lake
  FreestandingEmit + B32 gap re-green).
- **Open (proved false):** `productPathFreestandingPerformClaimed` (official
  product path regenerate still depends on Lake elaborating FreestandingEmit via
  `just build`; `productPathPerformDependsOnLake` true;
  `productPathOfficialPathStillUsesFreestandingEmit` true;
  `productPathOfficialPathRetireFreestandingEmitRequired` true;
  `productPathOfficialPathDualEqualityBlocksRetirement` true).
- `FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE` stays **open** (alternate measure
  is not perform claimed; dual-pin forbids flipping perform claimed from alternate
  presence, gap, or evidence alone without dual-equality retirement of
  FreestandingEmit as official writer).
- Full step-contract / ownership claimed / complete stay **false**.

**Ban (B6..B32 theater):** Do **not** re-land B32 official-path gap, B31 perform
evidence, B30 ownership authority, Capable*, or path pieces as perform claimed.
B33 is a **new greppable official-path alternate** stage under perform framing.
Do not flip `productPathFreestandingPerformClaimed` solely because alternate
writer present / dual-equality blocker / gap measured / evidence substrate are
true while official path still uses FreestandingEmit. Do not forge a justfile
switch of `just build` to structural Capable WRITE as dual-equality
retirement.

### Partial B33 measured path (landed; not perform claimed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin (living SelfApplyFs after B38)** | `SelfApplyFs.productPathFreestandingPerformOfficialPathAlternatePartialReady` (B32 + Ok + alternate measured true + writer present + **AlternateNotOfficial false** after B38 (same writer is official just build) + dual-equality blocks **false** after B38 + perform claimed false + DependsOnLake true + StillUsesFreestandingEmit **false** + still Lake + retire required **false** + Full false + ownership claimed false + complete false). Historical B33 product module may still pin AlternateNotOfficial true / StillUses true at land time; SelfApplyFs is claim-bool SSoT. | perform claimed; Full; ownership claimed; complete |
| **Lake-free alternate** | `just freestanding-perform-official-path-alternate` dual-pins freestanding-capable-regenerate present + AuthorityNotEmit + B32 gap re-green; land-time historical module may pin not-official + dual-equality blocks; living tip after B38: capable-regenerate is official writer; not B32 gap rebrand + measure `just freestanding-perform-official-path-alternate-measure` | perform claimed |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE: acceptance + host pin + module tokens + lakefile/just; require alternate measured true; SelfApplyFs living tip AlternateNotOfficial false after B38; forbid perform claimed true; when release present, B32 green | complete; free; llvm unlock |

**Commands (partial B33 official-path alternate loop):**

```bash
just freestanding-perform-official-path-alternate          # B33 Lake-free alternate
just freestanding-perform-official-path-alternate-measure  # B33 measure print (Lake diagnostic)
just freestanding-perform-official-path                    # B32 still green
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B33)

| Proved (partial B33; living tip after B38) | Still false / not claimed |
|-------------------------------------------|---------------------------|
| Official-path alternate surface + SelfApplyFs AlternatePartialReady | `productPathFreestandingPerformClaimed` |
| Alternate measured true (Capable ordered regenerate present; land-time not official; living tip after B38 same writer is official) | Full step-contract |
| Dual-equality blocks retirement false after B38 (closed CAPABLE-GAP + retired FreestandingEmit); land-time B33 module may pin true | ownership claimed |
| FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-* tokens + freestanding-capable-regenerate cites | `freestandingProductSelfHostComplete` |
| Lake-free alternate recipe (no lake build/exe on alternate measure itself) | residual free / proof complete / PROVABLY / llvm |
| DependsOnLake true (Lake host for capable regenerate remains) | FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed |
| pure Nix fail-closed: alternate measured true; perform claimed false; B32 when release | forged perform claimed from alternate alone |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH | Official-path gap measure (partial B32; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE (this section) | Official-path alternate writer (partial B33; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY | Dual-equality WRITE parity measure (partial B34; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH | Dual-equality WRITE close path (partial B35; gap open; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE | Freestanding perform evidence (partial B31; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform dual-equality WRITE parity (Track 3 / claim B) -- partial B34

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0,
product path freestanding perform dual equality write parity,
productPathFreestandingPerformDualEqualityWriteParityPartialReady,
productPathFreestandingPerformDualEqualityWriteParityOk,
productPathFreestandingPerformDualEqualityWriteParityMeasured,
productPathDualEqualityWriteParityGapOpen,
productPathCapableWriteStructuralNotDualEquality,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingPerformOfficialPathAlternateMeasured,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT,
FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT,
DUAL-SSOT-EQUALITY, requireDualSsotEqual,
freestandingCapableWriteFreestandingHc, CapableWriteHc,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, FreestandingEmit, slake-emit-freestanding-c,
freestanding-perform-dual-equality-write-parity,
freestanding-perform-dual-equality-write-parity-measure,
slake-freestanding-perform-dual-equality-write-parity,
DualEqWriteParity,
OfficialPathAlternate,
freestanding-perform-official-path-alternate, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B34**. First **dual-equality WRITE parity
measure** beyond B33 official-path alternate:
- Host module `SystemsLean.DualEqWriteParity`
  dual-pins that freestanding-capable WRITE (`freestandingCapableWriteFreestandingHc`)
  was **structural HEADER/BODY embed only** at land time (not `DUAL-SSOT-EQUALITY` /
  `requireDualSsotEqual` vs Lean Mult..Body fragments), that the parity **gap
  stayed open on the historical product module**, and that dual-equality still
  blocks retiring FreestandingEmit as official writer.
- **Closed (proved true):** dual-equality WRITE parity measured
  (`productPathFreestandingPerformDualEqualityWriteParityMeasured` /
  `FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY` via
  `just freestanding-perform-dual-equality-write-parity`: parity measured + B33
  alternate re-green + official path still Lake FreestandingEmit). Land-time
  historical product module pins may still state gap open + Capable structural;
  living tip after B37 is SelfApplyFs SSoT (next bullets).
- **Land-time product module pins (historical B34 module; not living SelfApplyFs
  SSoT):** at land, `productPathDualEqualityWriteParityGapOpen` true and
  `productPathCapableWriteStructuralNotDualEquality` true on the B34 product
  module. Those land-time pins may remain on the historical module.
- **Living SelfApplyFs SSoT after B37** (claim-bool authority; see partial B37
  section): `productPathDualEqualityWriteParityGapOpen` **false**;
  `productPathCapableWriteStructuralNotDualEquality` **false** (Capable dual-eq
  live); PartialReady evolved to require gap closed. Do **not** read land-time
  B34 module gap-open true as living SelfApplyFs tip.
- **Still open (false as claim on SelfApplyFs and product path):**
  `productPathFreestandingPerformClaimed` false (official product path
  regenerate still depends on Lake elaborating FreestandingEmit via
  `just build`; `productPathPerformDependsOnLake` true;
  `productPathOfficialPathStillUsesFreestandingEmit` true;
  `productPathOfficialPathRetireFreestandingEmitRequired` true;
  `productPathOfficialPathDualEqualityBlocksRetirement` true).
- `FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE` stays **open** (parity measure
  is not perform claimed; dual-pin forbids flipping perform claimed from parity
  measure, alternate presence, gap, or evidence alone without dual-equality
  retirement of FreestandingEmit as official writer).
- Full step-contract / ownership claimed / complete stay **false**.

**Ban (B6..B33 theater):** Do **not** re-land B33 official-path alternate, B32
official-path gap, B31 perform evidence, B30 ownership authority, Capable*, or
path pieces as perform claimed. B34 is a **new greppable dual-equality WRITE
parity** stage under perform framing. Do not flip
`productPathFreestandingPerformClaimed` solely because parity measured / alternate
present / dual-equality blocker are true while official path still uses
FreestandingEmit. Do not forge a justfile switch of `just build` to
structural Capable WRITE as dual-equality retirement. Gap open on SelfApplyFs
was closed later at B37 with real Capable dual-eq WRITE (not by re-editing this
B34 land alone).

### Partial B34 measured path (landed; not perform claimed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin (living SelfApplyFs after B37)** | `SelfApplyFs.productPathFreestandingPerformDualEqualityWriteParityPartialReady` (B33 + Ok + parity measured true + **gap open false** + **Capable structural false** after B37 + dual-equality blocks + perform claimed false + DependsOnLake true + still FreestandingEmit + still Lake + retire required + Full false + ownership claimed false + complete false). Historical B34 product module may still pin gap open true at land time; SelfApplyFs is claim-bool SSoT. | perform claimed; Full; ownership claimed; complete; FreestandingEmit retired |
| **Lake-free parity** | `just freestanding-perform-dual-equality-write-parity` dual-pins parity measured + B33 alternate re-green; land-time historical module may pin gap open / FreestandingEmit official; living SelfApplyFs gap closed after B37 and FreestandingEmit retired after B38; not FreestandingEmit retirement from parity alone; not B33 alternate rebrand + measure `just freestanding-perform-dual-equality-write-parity-measure` | perform claimed; Lake-free complete |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY: acceptance + host pin + module tokens + lakefile/just; require parity measured true; land-time product module may pin gap open true; SelfApplyFs dual-pin expects gap closed after B37; forbid perform claimed true; when release present, B33 green | complete; free; llvm unlock |

**Commands (partial B34 dual-equality WRITE parity loop):**

```bash
just freestanding-perform-dual-equality-write-parity          # B34 Lake-free parity
just freestanding-perform-dual-equality-write-parity-measure  # B34 measure print (Lake diagnostic)
just freestanding-perform-official-path-alternate             # B33 still green
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B34)

| Proved (partial B34) | Still false / not claimed |
|----------------------|---------------------------|
| Dual-equality WRITE parity surface + SelfApplyFs ParityPartialReady (evolved B37) | `productPathFreestandingPerformClaimed` |
| Parity measured true (gap named; Capable vs official dual-equality surface) | Full step-contract |
| Land-time B34 product module: gap open true + Capable structural true (historical pin) | ownership claimed |
| Living SelfApplyFs after B37: gap open false + Capable structural false (Capable dual-eq live; see B37) | FreestandingEmit retired as official |
| FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-* tokens + DUAL-SSOT-EQUALITY / requireDualSsotEqual cites | `freestandingProductSelfHostComplete` |
| Lake-free parity recipe (no lake build/exe on parity itself) | residual free / proof complete / PROVABLY / llvm |
| DependsOnLake true (official FreestandingEmit path remains) | FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed |
| pure Nix fail-closed: parity true; perform claimed false; B33 when release; land-time gap pin vs SelfApplyFs gap closed after B37 | forged justfile switch as dual-equality retirement |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE | Official-path alternate writer (partial B33; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY (this section) | Dual-equality WRITE parity measure (partial B34; land-time gap open on product module; SelfApplyFs gap closed after B37; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH | Dual-equality WRITE close path (partial B35; land-time gap open on product module; SelfApplyFs gap closed after B37; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP | Dual-equality WRITE CAPABLE-GAP close (partial B37; SelfApplyFs gap closed; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH | Official-path gap measure (partial B32; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE | Freestanding perform evidence (partial B31; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform dual-equality WRITE close path (Track 3 / claim B) -- partial B35

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0,
product path freestanding perform dual equality write close path,
productPathFreestandingPerformDualEqualityWriteClosePathPartialReady,
productPathFreestandingPerformDualEqualityWriteClosePathOk,
productPathFreestandingPerformDualEqualityWriteClosePathMeasured,
productPathDualEqualityWriteClosePathNamed,
productPathDualEqualityWriteClosePathNotGapClosed,
productPathDualEqualityWriteParityGapOpen,
productPathCapableWriteStructuralNotDualEquality,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
productPathFreestandingPerformDualEqualityWriteParityMeasured,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
DUAL-SSOT-EQUALITY, requireDualSsotEqual,
freestandingCapableWriteFreestandingHc, CapableWriteHc,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, FreestandingEmit, slake-emit-freestanding-c,
freestanding-perform-dual-equality-write-close-path,
freestanding-perform-dual-equality-write-close-path-measure,
slake-freestanding-perform-dual-equality-write-close-path,
DualEqWriteClosePath,
DualEqWriteParity,
freestanding-perform-dual-equality-write-parity, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B35**. First **dual-equality WRITE close path**
beyond B34 dual-equality WRITE parity measure (honest Path B substrate):
- Host module `SystemsLean.DualEqWriteClosePath`
  names ordered close-path steps required to close the dual-equality WRITE parity
  gap with real freestanding dual-equality WRITE, retire FreestandingEmit on
  official `just build`, then flip perform claimed only with freestanding
  evidence. At land time, close path **named** was **not** gap closed (proved on
  historical product module). CAPABLE-GAP step closed later at B37 (see B37 section).
- **Closed (proved true):** dual-equality WRITE close path measured
  (`productPathFreestandingPerformDualEqualityWriteClosePathMeasured` /
  `FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH` via
  `just freestanding-perform-dual-equality-write-close-path`: close path measured +
  named + official path still Lake FreestandingEmit + B34 parity re-green). Land-time
  historical product module pins may still state not-gap-closed / gap open / Capable
  structural; living tip after B37 is SelfApplyFs SSoT (next bullets).
- **Land-time product module pins (historical B35 module; not living SelfApplyFs
  SSoT):** at land, `productPathDualEqualityWriteClosePathNotGapClosed` true;
  `productPathDualEqualityWriteParityGapOpen` true;
  `productPathCapableWriteStructuralNotDualEquality` true on the B35 product module.
  Those land-time pins may remain on the historical module.
- **Living SelfApplyFs SSoT after B37** (claim-bool authority; see partial B37
  section): `productPathDualEqualityWriteClosePathNotGapClosed` **false** (gap
  closed); `productPathDualEqualityWriteParityGapOpen` **false**;
  `productPathCapableWriteStructuralNotDualEquality` **false**; PartialReady
  requires gap closed (opposite of land-time "not gap closed true + gap open true
  + Capable structural"). Do **not** claim living PartialReady still requires gap
  open true.
- **Still open (false as claim on SelfApplyFs and product path):**
  `productPathFreestandingPerformClaimed` false. Living tip after B38: official
  just build uses freestanding dual-eq WRITE (`freestanding-capable-regenerate`);
  `productPathOfficialPathStillUsesFreestandingEmit` false;
  `productPathOfficialPathRetireFreestandingEmitRequired` false;
  `productPathOfficialPathDualEqualityBlocksRetirement` false;
  `productPathPerformDependsOnLake` true (Lake host for capable regenerate remains).
  Land-time B35 prose may still describe pre-retirement FreestandingEmit pins;
  SelfApplyFs is claim-bool SSoT.
- `FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE` stays **open** (close path named
  is not perform claimed; dual-pin forbids flipping perform claimed from close-path
  name / parity measure alone). CAPABLE-GAP closed at B37 and RETIRE-OFFICIAL at B38
  are not perform claimed (PERFORM-CLAIMED is next cliff).
- Full step-contract / ownership claimed / complete stay **false**.

**Ordered close-path steps (named evidence; not all executed complete):**

| Step id | Meaning |
|---------|---------|
| FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API | Freestanding dual-equality WRITE API (Emit* fragments + requireDualSsotEqual + write; not FreestandingEmit authority) -- closed at B36 |
| FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP | Close Capable structural vs dual-equality parity gap -- closed at B37 |
| FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL | Retire FreestandingEmit on official just build -- **closed at B38** (official path uses freestanding dual-eq WRITE via freestanding-capable-regenerate; StillUsesFreestandingEmit false) |
| FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED | Flip perform claimed only with freestanding dual-equality evidence -- **still open** (next cliff after B38) |

**Ban (B6..B34 theater):** Do **not** re-land B34 dual-equality WRITE parity, B33
official-path alternate, B32 official-path gap, B31 perform evidence, B30 ownership
authority, Capable*, or path pieces as perform claimed. B35 is a **new greppable
dual-equality WRITE close path** stage under perform framing. Do not flip
`productPathFreestandingPerformClaimed` solely because close path named / parity
measured / alternate present are true while official path still uses FreestandingEmit.
Do not forge a justfile switch of `just build` to structural Capable WRITE
as dual-equality retirement. SelfApplyFs gap open was closed later at B37 with real
Capable dual-eq WRITE (not by re-editing this B35 land alone). Do not re-open
SelfApplyFs gap flags as living tip after B37 closed them.

### Partial B35 measured path (landed; close path named; not perform claimed; not complete)

| Layer | Evidence | Not claimed |
|-------|----------|-------------|
| **Host pin (living SelfApplyFs after B38)** | `SelfApplyFs.productPathFreestandingPerformDualEqualityWriteClosePathPartialReady` (B34 + Ok + close path measured true + named true + **not-gap-closed false** + **gap open false** + **Capable structural false** after B37 + dual-equality blocks **false** after B38 + perform claimed false + DependsOnLake true + StillUsesFreestandingEmit **false** after B38 + still Lake + retire required **false** after B38 + Full false + ownership claimed false + complete false). Historical B35 product module may still pin not-gap-closed / gap open / StillUses true at land time; SelfApplyFs is claim-bool SSoT. | perform claimed; Full; ownership claimed; complete |
| **Lake-free close path** | `just freestanding-perform-dual-equality-write-close-path` dual-pins ordered close-path steps named + B34 parity re-green; land-time historical module may pin not gap closed / gap open / FreestandingEmit official; living SelfApplyFs gap closed after B37 and FreestandingEmit retired after B38; not B34 parity rebrand + measure `just freestanding-perform-dual-equality-write-close-path-measure` | perform claimed |
| **Automated gate** | pure Nix `systems-emit-wire` SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH: acceptance + host pin + module tokens + lakefile/just; require close path measured true + named true; land-time product module may pin not-gap-closed / gap open true; SelfApplyFs dual-pin expects gap closed after B37; forbid perform claimed true; when release present, B34 green | complete; free; llvm unlock |

**Commands (partial B35 dual-equality WRITE close-path loop):**

```bash
just freestanding-perform-dual-equality-write-close-path          # B35 Lake-free close path
just freestanding-perform-dual-equality-write-close-path-measure  # B35 measure print (Lake diagnostic)
just freestanding-perform-dual-equality-write-parity              # B34 still green
just systems-emit-wire
just systems-host
```

### Proved vs not (partial B35)

| Proved (partial B35) | Still false / not claimed |
|----------------------|---------------------------|
| Dual-equality WRITE close-path surface + SelfApplyFs ClosePathPartialReady (evolved B37) | `productPathFreestandingPerformClaimed` |
| Close path measured true (ordered steps named) | Full step-contract |
| Close path named true (ordered CLOSE-STEP-* ids) | ownership claimed |
| Land-time B35 product module: not-gap-closed true + gap open true + Capable structural true (historical pin) | FreestandingEmit retired as official |
| Living SelfApplyFs after B37: not-gap-closed false + gap open false + Capable structural false (CAPABLE-GAP closed; see B37) | residual free / proof complete / PROVABLY / llvm |
| FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-* + CLOSE-STEP-* tokens | `freestandingProductSelfHostComplete` |
| Lake-free close-path recipe (no lake build/exe on close path itself) | FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed |
| DependsOnLake true (official FreestandingEmit path remains) | forged justfile switch as dual-equality retirement |
| pure Nix fail-closed: close path true; named true; perform claimed false; B34 when release; land-time gap pin vs SelfApplyFs gap closed after B37 | RETIRE-OFFICIAL / perform claimed from close-path name alone |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY | Dual-equality WRITE parity measure (partial B34; land-time gap open on product module; SelfApplyFs gap closed after B37; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH (this section) | Dual-equality WRITE close path (partial B35; land-time gap open on product module; SelfApplyFs gap closed after B37; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API | Dual-equality freestanding WRITE API (partial B36; close-path step DUAL-EQUALITY-API; land-time gap open on product module; SelfApplyFs gap closed after B37; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP | Dual-equality WRITE CAPABLE-GAP close (partial B37; SelfApplyFs gap closed; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE | Official-path alternate writer (partial B33; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH | Official-path gap measure (partial B32; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE | Freestanding perform evidence (partial B31; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform dual-equality WRITE API (Track 3 / claim B) -- partial B36

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0,
product path freestanding perform dual equality write api,
productPathFreestandingPerformDualEqualityWriteApiPartialReady,
productPathFreestandingPerformDualEqualityWriteApiOk,
productPathFreestandingPerformDualEqualityWriteApiMeasured,
productPathDualEqualityWriteApiPresent,
productPathDualEqualityWriteApiAuthorityNotEmit,
productPathDualEqualityWriteApiNotOfficial,
productPathDualEqualityWriteApiStepAdvanced,
productPathDualEqualityWriteParityGapOpen,
productPathCapableWriteStructuralNotDualEquality,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathFreestandingPerformClaimed,
productPathPerformDependsOnLake,
productPathFreestandingPerformDualEqualityWriteClosePathMeasured,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-PRESENT,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-AUTHORITY-NOT-EMIT,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-NOT-OFFICIAL,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-STEP-ADVANCED,
freestandingDualEqualityWriteFreestandingHc,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP,
DUAL-SSOT-EQUALITY, requireDualSsotEqual,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, FreestandingEmit, slake-emit-freestanding-c,
freestanding-perform-dual-equality-write-api,
freestanding-perform-dual-equality-write-api-measure,
slake-freestanding-perform-dual-equality-write-api,
DualEqWriteApi,
DualEqWriteClosePath,
freestanding-perform-dual-equality-write-close-path, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B36**. First **dual-equality freestanding WRITE API**
beyond B35 dual-equality WRITE close path naming (honest Path A partial):
- Host module `SystemsLean.DualEqWriteApi`
  implements real freestanding dual-equality WRITE: load Mult..Body dual SSOT
  HEADER/BODY, `requireDualSsotEqual` against Lean Emit* fragments, embed templates,
  `IO.FS.writeFile` of `slake_freestanding.{h,c}` without FreestandingEmit authority.
- **Closed (proved true):** dual-equality WRITE API measured
  (`productPathFreestandingPerformDualEqualityWriteApiMeasured` /
  `productPathDualEqualityWriteApiPresent` / authority not emit / not official /
  step advanced). Lake-free
  `just freestanding-perform-dual-equality-write-api`: API measured + present +
  authority not emit + not official + step advanced + official path still Lake
  FreestandingEmit + B35 close path re-green. Land-time historical API product
  module may still pin gap open; living tip after B37 is SelfApplyFs SSoT (next
  bullets).
- **Land-time product module pins (historical B36 API module; not living
  SelfApplyFs SSoT):** at land, API module may pin
  `productPathDualEqualityWriteParityGapOpen` true and
  `productPathCapableWriteStructuralNotDualEquality` true (CAPABLE-GAP not yet
  closed on that land). Those land-time pins may remain on the historical module.
- **Living SelfApplyFs SSoT after B37** (claim-bool authority; see partial B37
  section): `productPathDualEqualityWriteParityGapOpen` **false** (CAPABLE-GAP
  closed with Capable dual-eq); `productPathCapableWriteStructuralNotDualEquality`
  **false**; PartialReady evolved to require gap closed. Do **not** claim living
  tip still has CAPABLE-GAP open or SelfApplyFs PartialReady requiring gap open true.
- **Proved non-claims (still true on living tip):** `productPathFreestandingPerformClaimed`
  false; DependsOnLake true; `productPathOfficialPathStillUsesFreestandingEmit` true;
  `productPathOfficialPathRetireFreestandingEmitRequired` true;
  `productPathOfficialPathDualEqualityBlocksRetirement` true (official path still
  FreestandingEmit; B36 API and B37 CAPABLE-GAP are not official retirement).
- **Not sold as:** perform claimed, Full, ownership claimed, complete, residual free,
  or FreestandingEmit retirement from API / CAPABLE-GAP alone without RETIRE-OFFICIAL.

**Ban (B6..B35 theater):** Do **not** re-land B35 dual-equality WRITE close path, B34
parity, B33 alternate, B32 gap, B31 evidence, FreestandingEmit as freestanding
authority, Capable*, or path pieces as perform claimed. B36 is a **new greppable
dual-equality freestanding WRITE API** stage under perform framing. Do not forge a
justfile switch of `just build` to this API as dual-equality retirement.
Official path still uses FreestandingEmit. SelfApplyFs gap open was closed later at
B37 with real Capable dual-eq WRITE (not by re-editing this B36 land alone). Do not
re-open SelfApplyFs gap flags as living tip after B37 closed them. Do not re-land
CAPABLE-GAP product logic here.

### Partial B36 measured path (landed; API present; not perform claimed; not complete)

| Surface | Status | Not |
|---------|--------|-----|
| **Host pin (living SelfApplyFs after B37)** | `SelfApplyFs.productPathFreestandingPerformDualEqualityWriteApiPartialReady` (B35 + Ok + API measured true + present true + authority not emit + not official + step advanced + **gap open false** + **Capable structural false** after B37 + dual-equality blocks + perform claimed false + DependsOnLake true + still FreestandingEmit + still Lake + retire required + Full false + ownership claimed false + complete false). Historical B36 API product module may still pin gap open true at land time; SelfApplyFs is claim-bool SSoT. | perform claimed; Full; ownership claimed; complete; FreestandingEmit retired |
| **Lake-free API** | `just freestanding-perform-dual-equality-write-api` dual-pins real freestanding dual-equality WRITE API present + authority not emit + land-time not official + step advanced + B35 close path re-green; land-time historical module may pin gap open / FreestandingEmit official; living SelfApplyFs gap closed after B37 and FreestandingEmit retired after B38; not FreestandingEmit retirement from API alone; not B35 close-path rebrand + measure `just freestanding-perform-dual-equality-write-api-measure` | perform claimed; Lake-free complete |

**Commands (partial B36 dual-equality WRITE API loop):**

```bash
just freestanding-perform-dual-equality-write-api          # B36 Lake-free API
just freestanding-perform-dual-equality-write-api-measure  # B36 measure + real write (Lake diagnostic)
just freestanding-perform-dual-equality-write-close-path   # B35 still green
```

### Proved vs not (partial B36)

| Proved (partial B36) | Still false / not claimed |
|----------------------|---------------------------|
| API measured true (Emit* + requireDualSsotEqual + write live) | perform claimed |
| API present / authority not emit / not official / step advanced | Full step-contract |
| Land-time B36 API product module: gap open true + Capable structural true (historical pin; CAPABLE-GAP not closed on that land) | FreestandingEmit retired as official |
| Living SelfApplyFs after B37: gap open false + Capable structural false (CAPABLE-GAP closed with Capable dual-eq; see B37) | residual free / proof complete / PROVABLY / llvm |
| SelfApplyFs ApiPartialReady (evolved B37: requires gap closed, not gap open) | FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed |
| DependsOnLake true (official FreestandingEmit path remains) | forged justfile switch as dual-equality retirement |
| pure Nix fail-closed: API true; present true; authority not emit; not official; perform claimed false; B35 when release; land-time gap pin vs SelfApplyFs gap closed after B37 | perform claimed from API alone without RETIRE-OFFICIAL |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH | Dual-equality WRITE close path (partial B35; land-time gap open on product module; SelfApplyFs gap closed after B37; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API (this section) | Dual-equality freestanding WRITE API (partial B36; land-time gap open on product module; SelfApplyFs SSoT gap closed after B37; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP | Dual-equality WRITE CAPABLE-GAP close (partial B37; gap closed; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY | Dual-equality WRITE parity measure (partial B34; land-time gap open on product module; SelfApplyFs gap closed after B37; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE | Official-path alternate writer (partial B33; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH | Official-path gap measure (partial B32; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE | Freestanding perform evidence (partial B31; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform dual-equality WRITE CAPABLE-GAP (Track 3 / claim B) -- partial B37

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0,
product path freestanding perform dual equality write capable gap,
productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady,
productPathFreestandingPerformDualEqualityWriteCapableGapOk,
productPathFreestandingPerformDualEqualityWriteCapableGapMeasured,
productPathDualEqualityWriteCapableGapClosed,
productPathCapableWriteDualEqualityLive,
productPathDualEqualityWriteCapableGapStepAdvanced,
productPathDualEqualityWriteParityGapOpen,
productPathCapableWriteStructuralNotDualEquality,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathFreestandingPerformClaimed,
productPathPerformDependsOnLake,
productPathFreestandingPerformDualEqualityWriteApiMeasured,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-CLOSED,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-DUAL-EQ-LIVE,
FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-STEP-ADVANCED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
freestandingCapableWriteFreestandingHc, CapableWriteHc,
DUAL-SSOT-EQUALITY, requireDualSsotEqual,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, FreestandingEmit, slake-emit-freestanding-c,
freestanding-perform-dual-equality-write-capable-gap,
freestanding-perform-dual-equality-write-capable-gap-measure,
slake-freestanding-perform-dual-equality-write-capable-gap,
DualEqWriteCapableGap,
DualEqWriteApi,
freestanding-perform-dual-equality-write-api, freestandingProductSelfHostComplete,
productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B37**. First **honest CAPABLE-GAP close** beyond
B36 dual-equality freestanding WRITE API (close-path step CAPABLE-GAP):
- Host module `SystemsLean.CapableWriteHc` now performs
  dual-equality WRITE: load Mult..Body dual single source of truth (SSOT)
  HEADER/BODY, `requireDualSsotEqual` against Lean Emit* fragments, embed templates,
  `IO.FS.writeFile` of `slake_freestanding.{h,c}` without FreestandingEmit authority
  (`productPathCapableWriteDualEqualityLive` true).
- Host module `SystemsLean.DualEqWriteCapableGap`
  dual-pins CAPABLE-GAP measured + gap closed + dual-eq live + step advanced.
- **Closed (proved true):** CAPABLE-GAP measured
  (`productPathFreestandingPerformDualEqualityWriteCapableGapMeasured` /
  `productPathDualEqualityWriteCapableGapClosed` /
  `productPathCapableWriteDualEqualityLive` /
  `productPathDualEqualityWriteCapableGapStepAdvanced`). Lake-free
  `just freestanding-perform-dual-equality-write-capable-gap`: CAPABLE-GAP closed
  + Capable dual-eq live + gap open false + official path still Lake FreestandingEmit
  + B36 API re-green.
- **Proved non-claims (land-time B37 product module; historical):**
  `productPathDualEqualityWriteParityGapOpen` false (closed with Capable dual-eq);
  `productPathCapableWriteStructuralNotDualEquality` false;
  `productPathFreestandingPerformClaimed` false; DependsOnLake true;
  land-time B37 module pins StillUsesFreestandingEmit true / Blocks true / Retire
  required true (CAPABLE-GAP close alone is not official retirement).
- **Living SelfApplyFs SSoT after B38** (claim-bool authority; see partial B38):
  `productPathOfficialPathStillUsesFreestandingEmit` **false**;
  `productPathOfficialPathRetireFreestandingEmitRequired` **false**;
  `productPathOfficialPathDualEqualityBlocksRetirement` **false** (official path
  uses freestanding dual-eq WRITE); perform claimed stays false.
- **Not sold as:** perform claimed, Full, ownership claimed, complete, residual free.
  RETIRE-OFFICIAL is partial B38 (not re-sold from CAPABLE-GAP alone).

**Ban (B6..B36 theater):** Do **not** re-land B36 dual-equality WRITE API, B35
close path, B34 parity, B33 alternate, B32 gap, B31 evidence, FreestandingEmit as
freestanding authority, Capable* as perform claimed. B37 is a **new greppable
CAPABLE-GAP close** stage under perform framing. Do not forge
`productPathFreestandingPerformClaimed` true without PERFORM-CLAIMED evidence.
Living tip after B38: official path retired FreestandingEmit (see RETIRE-OFFICIAL).

### Partial B37 measured path (landed; CAPABLE-GAP closed; not perform claimed; not complete)

| Surface | Status | Not |
|---------|--------|-----|
| **Host pin (living SelfApplyFs after B38)** | `SelfApplyFs.productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady` (B36 + Ok + CAPABLE-GAP measured true + gap closed true + dual-eq live true + step advanced + gap open false + structural false + dual-equality blocks **false** after B38 + perform claimed false + DependsOnLake true + StillUsesFreestandingEmit **false** after B38 + still Lake + retire required **false** after B38 + Full false + ownership claimed false + complete false). Historical B37 product module may still pin StillUses true at land time; SelfApplyFs is claim-bool SSoT. | perform claimed; Full; ownership claimed; complete |
| **Lake-free CAPABLE-GAP** | `just freestanding-perform-dual-equality-write-capable-gap` dual-pins Capable dual-eq live + gap closed + B36 API re-green; living tip B38 official dual-eq path; not B36 API rebrand + measure `just freestanding-perform-dual-equality-write-capable-gap-measure` | perform claimed |

**Commands (partial B37 CAPABLE-GAP loop):**

```bash
just freestanding-perform-dual-equality-write-capable-gap          # B37 Lake-free CAPABLE-GAP
just freestanding-perform-dual-equality-write-capable-gap-measure  # B37 measure (Lake diagnostic)
just freestanding-perform-dual-equality-write-api                  # B36 still green
```

### Proved vs not (partial B37)

| Proved (partial B37) | Still false / not claimed |
|----------------------|---------------------------|
| CAPABLE-GAP measured true (Capable dual-eq WRITE live) | perform claimed |
| Gap closed true / dual-eq live true / step advanced | Full step-contract |
| Gap open false (Capable WRITE is dual-equality) | FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed |
| DependsOnLake true (Lake host remains) | residual free / proof complete / PROVABLY / llvm |
| pure Nix fail-closed: CAPABLE-GAP true; gap closed true; dual-eq live; gap open false; perform claimed false; B36 when release | B37 alone as official FreestandingEmit retirement (see B38) |
| Living tip after B38: StillUsesFreestandingEmit false (official dual-eq path) | perform claimed from CAPABLE-GAP alone |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API | Dual-equality freestanding WRITE API (partial B36; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP (this section) | Dual-equality WRITE CAPABLE-GAP close (partial B37; gap closed; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL | Official FreestandingEmit retirement (partial B38; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH | Dual-equality WRITE close path (partial B35; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY | Dual-equality WRITE parity measure (partial B34; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE | Official-path alternate writer (partial B33; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH | Official-path gap measure (partial B32; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE | Freestanding perform evidence (partial B31; perform claimed false) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform RETIRE-OFFICIAL (Track 3 / claim B) -- partial B38

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0,
product path freestanding perform retire official,
productPathOfficialPathRetireOfficialPartialReady,
productPathOfficialPathRetireOfficialOk,
productPathOfficialPathRetireOfficialMeasured,
productPathOfficialPathRetireOfficialStepAdvanced,
productPathOfficialPathUsesDualEqualityWrite,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathFreestandingPerformClaimed,
productPathPerformDependsOnLake,
productPathFreestandingPerformDualEqualityWriteCapableGapMeasured,
FREESTANDING-PERFORM-RETIRE-OFFICIAL,
FREESTANDING-PERFORM-RETIRE-OFFICIAL-MEASURED,
FREESTANDING-PERFORM-RETIRE-OFFICIAL-USES-DUAL-EQ-WRITE,
FREESTANDING-PERFORM-RETIRE-OFFICIAL-STEP-ADVANCED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP,
freestandingCapableOrderedRegenerate, freestandingCapableWriteFreestandingHc,
CapableWriteHc, CapableRegenerate,
DUAL-SSOT-EQUALITY, requireDualSsotEqual,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, freestanding-capable-regenerate,
freestanding-retire-official, freestanding-retire-official-measure,
slake-freestanding-retire-official, OfficialRetire,
freestanding-perform-dual-equality-write-capable-gap,
freestandingProductSelfHostComplete, productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B38**. First **honest RETIRE-OFFICIAL** beyond
B37 CAPABLE-GAP (close-path step RETIRE-OFFICIAL):
- Official product path `just build` uses freestanding dual-equality
  WRITE via `just freestanding-capable-regenerate` (READ+COMPOSE+Capable dual-eq
  WRITE-HC via freestandingCapableWriteFreestandingHc Emit* + requireDualSsotEqual
  + INSTALL) as product authority -- **not** FreestandingEmit / slake-emit-freestanding-c.
- Host module `SystemsLean.OfficialRetire` (short role name; not
  ProductPathFreestandingPerform* kitchen-sink) dual-pins RETIRE-OFFICIAL measured
  + UsesDualEqualityWrite + StillUsesFreestandingEmit false + Blocks false.
- **Closed (proved true):** RETIRE-OFFICIAL measured
  (`productPathOfficialPathRetireOfficialMeasured` /
  `productPathOfficialPathUsesDualEqualityWrite` /
  `productPathOfficialPathRetireOfficialStepAdvanced`). Lake-free
  `just freestanding-retire-official`: official dual-eq WRITE + StillUses false +
  Blocks false + B37 CAPABLE-GAP re-green.
- **Proved non-claims (land-time B38):** OfficialRetire local perform claimed false.
  Living tip after B39: SelfApplyFs `productPathFreestandingPerformClaimed` true.
  DependsOnLake true (Lake host for freestanding-capable-regenerate remains);
  `productPathOfficialPathStillUsesLake` true; CAPABLE-GAP stays closed
  (`productPathDualEqualityWriteParityGapOpen` false;
  `productPathCapableWriteDualEqualityLive` true);
  `productPathOfficialPathStillUsesFreestandingEmit` false;
  `productPathOfficialPathDualEqualityBlocksRetirement` false;
  `productPathOfficialPathRetireFreestandingEmitRequired` false.
- **Not sold as:** ownership claimed, Full, complete, residual free,
  free, llvm, PROVABLY. FreestandingEmit may remain as diagnostic B13 write path
  (not official just build writer).

**Ban (B6..B37 theater):** Do **not** re-land B37 CAPABLE-GAP, B36 API, B35 close
path, B34 parity, B33 alternate, B32 gap as ownership claimed. B38 is a **new
greppable RETIRE-OFFICIAL** stage under perform framing. Living tip after B39:
perform claimed true with PERFORM-CLAIMED evidence. Do not re-open CAPABLE-GAP.
Do not mint another ProductPathFreestandingPerform* kitchen-sink filename.

### Partial B38 measured path (landed; FreestandingEmit retired on official path; living tip perform claimed true after B39; not complete)

| Surface | Status | Not |
|---------|--------|-----|
| **Host pin** | `SelfApplyFs.productPathOfficialPathRetireOfficialPartialReady` (B37 + Ok + RETIRE-OFFICIAL measured true + step advanced + UsesDualEqualityWrite true + StillUsesFreestandingEmit false + DualEqualityBlocks false + RetireRequired false + still Lake + DependsOnLake true + Full false + ownership claimed false + complete false; living tip after B39 perform claimed true) | Full; ownership claimed; complete |
| **Lake-free RETIRE-OFFICIAL** | `just freestanding-retire-official` dual-pins official dual-eq WRITE + StillUses false + Blocks false + B37 CAPABLE-GAP re-green; not perform claimed; not B37 CAPABLE-GAP rebrand + measure `just freestanding-retire-official-measure` | perform claimed; Lake-free complete |
| **Official path** | `just build` -> `just freestanding-capable-regenerate` (freestandingCapableOrderedRegenerate dual-eq WRITE authority) | FreestandingEmit as official writer |

**Commands (partial B38 RETIRE-OFFICIAL loop):**

```bash
just freestanding-retire-official                          # B38 Lake-free RETIRE-OFFICIAL
just freestanding-retire-official-measure                  # B38 measure (Lake diagnostic)
just freestanding-perform-dual-equality-write-capable-gap  # B37 still green
just build                                    # official dual-eq WRITE path
```

### Proved vs not (partial B38)

| Proved (partial B38; living tip after B39) | Still false / not claimed |
|----------------------|---------------------------|
| RETIRE-OFFICIAL measured true (official dual-eq WRITE) | Full step-contract |
| StillUsesFreestandingEmit false / Blocks false / RetireRequired false | ownership claimed |
| UsesDualEqualityWrite true; StillUsesLake true | complete / residual free / free / llvm / PROVABLY |
| CAPABLE-GAP stays closed (gap open false; dual-eq live) | |
| DependsOnLake true (Lake host for capable regenerate) | |
| Land-time OfficialRetire perform claimed false; living tip B39 SelfApplyFs true | |
| pure Nix fail-closed: RETIRE-OFFICIAL true; StillUses false; B37 when release | forged complete from retire alone |

### Relation to prior pins

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP | Dual-equality WRITE CAPABLE-GAP close (partial B37; gap closed) |
| SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL (this section) | Official FreestandingEmit retirement with dual-eq WRITE (partial B38) |
| SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED | PERFORM-CLAIMED with official dual-eq WRITE evidence (partial B39) |
| SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API | Dual-equality freestanding WRITE API (partial B36) |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding perform claimed (Track 3 / claim B) -- partial B39

**Greppable:** SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED,
HOST-SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED,
SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0,
product path freestanding perform claimed,
productPathFreestandingPerformClaimedPartialReady,
productPathFreestandingPerformClaimedOk,
productPathFreestandingPerformClaimedMeasured,
productPathFreestandingPerformClaimedStepAdvanced,
productPathFreestandingPerformClaimed,
productPathPerformDependsOnLake,
productPathOfficialPathRetireOfficialMeasured,
productPathOfficialPathUsesDualEqualityWrite,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathFreestandingPerformDualEqualityWriteCapableGapMeasured,
FREESTANDING-PERFORM-CLAIMED,
FREESTANDING-PERFORM-CLAIMED-MEASURED,
FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE,
FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
freestandingCapableOrderedRegenerate, freestandingCapableWriteFreestandingHc,
CapableWriteHc, CapableRegenerate,
DUAL-SSOT-EQUALITY, requireDualSsotEqual,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, freestanding-capable-regenerate,
freestanding-perform-claimed, freestanding-perform-claimed-measure,
slake-freestanding-perform-claimed, PerformClaimed,
freestanding-retire-official, OfficialRetire,
freestanding-perform-dual-equality-write-capable-gap,
freestandingProductSelfHostComplete, productPathFreestandingOwnershipClaimed

**Status (2026-07-30):** **partial B39**. First **honest PERFORM-CLAIMED** beyond
B38 RETIRE-OFFICIAL (close-path step PERFORM-CLAIMED):
- Official product path `just build` uses freestanding dual-equality
  WRITE via `just freestanding-capable-regenerate` (B38 RETIRE-OFFICIAL remains).
- Host module `SystemsLean.PerformClaimed` (short role name; not
  ProductPathFreestandingPerform* kitchen-sink) dual-pins PERFORM-CLAIMED measured
  + perform claimed true + official dual-eq WRITE + StillUsesFreestandingEmit false.
- SelfApplyFs claim-bool SSoT `productPathFreestandingPerformClaimed` **true** with
  greppable official-path freestanding dual-equality WRITE evidence
  (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed).
- **Closed (proved true):** PERFORM-CLAIMED measured
  (`productPathFreestandingPerformClaimedMeasured` /
  `productPathFreestandingPerformClaimed` /
  `productPathFreestandingPerformClaimedStepAdvanced`). Lake-free
  `just freestanding-perform-claimed`: perform claimed true + official dual-eq
  WRITE + B38 RETIRE-OFFICIAL re-green.
- **Proved non-claims (land-time B39):** DependsOnLake true
  (Lake host for freestanding-capable-regenerate remains);
  `productPathOfficialPathStillUsesLake` true; CAPABLE-GAP stays closed;
  `productPathOfficialPathStillUsesFreestandingEmit` false;
  `productPathOfficialPathDualEqualityBlocksRetirement` false;
  `productPathOfficialPathRetireFreestandingEmitRequired` false;
  complete false; Full false; free / llvm / PROVABLY false.
  Living tip after B40: ownership claimed true (see B40 section).
- **Not sold as:** Full, complete, residual free, free, llvm, PROVABLY.
  Land-time B31..B38 modules may still pin local perform claimed false
  (historical substrate); SelfApplyFs living tip perform is true. Land-time
  PerformClaimed may keep ownership false; SelfApplyFs living tip ownership true
  after B40.

**Ban (B6..B39 theater):** Do **not** re-land B39 PERFORM-CLAIMED, B38 RETIRE-OFFICIAL,
B37 CAPABLE-GAP as Full or complete. B40 is a **new greppable OWNERSHIP-CLAIMED**
stage under ownership framing. Do not forge Full or complete without full bar.
Do not re-open CAPABLE-GAP. Do not mint another ProductPathFreestandingPerform*
or Capable* kitchen-sink filename.

### Partial B39 measured path (landed; perform claimed true with official dual-eq WRITE; living tip after B40 ownership claimed true; not complete)

| Surface | Status | Not |
|---------|--------|-----|
| **Host pin** | `SelfApplyFs.productPathFreestandingPerformClaimedPartialReady` (B38 + Ok + PERFORM-CLAIMED measured true + step advanced + perform claimed true + UsesDualEqualityWrite true + StillUsesFreestandingEmit false + DualEqualityBlocks false + RetireRequired false + still Lake + DependsOnLake true + Full false + ownership claimed true after B40 + complete false) | Full; complete |
| **Lake-free PERFORM-CLAIMED** | `just freestanding-perform-claimed` dual-pins perform claimed true + official dual-eq WRITE + B38 RETIRE-OFFICIAL re-green; land-time PerformClaimed ownership false; living tip SelfApplyFs ownership true after B40 + measure `just freestanding-perform-claimed-measure` | Full; Lake-free complete |
| **Official path** | `just build` -> `just freestanding-capable-regenerate` (freestandingCapableOrderedRegenerate dual-eq WRITE authority) | FreestandingEmit as official writer |

**Commands (partial B39 PERFORM-CLAIMED loop):**

```bash
just freestanding-perform-claimed                          # B39 Lake-free PERFORM-CLAIMED
just freestanding-perform-claimed-measure                  # B39 measure (Lake diagnostic)
just freestanding-retire-official                          # B38 still green
just freestanding-perform-dual-equality-write-capable-gap  # B37 still green
just build                                    # official dual-eq WRITE path
```

### Proved vs not (partial B39)

| Proved (partial B39) | Still false / not claimed |
|----------------------|---------------------------|
| PERFORM-CLAIMED measured true (official dual-eq WRITE evidence) | Full step-contract (until Full cliff) |
| productPathFreestandingPerformClaimed true (SelfApplyFs SSoT) | complete / residual free / free / llvm / PROVABLY |
| StillUsesFreestandingEmit false / Blocks false / RetireRequired false | |
| UsesDualEqualityWrite true; StillUsesLake true; B38 retire remains | |
| CAPABLE-GAP stays closed (gap open false; dual-eq live) | |
| DependsOnLake true (Lake host for capable regenerate) | |
| FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed with evidence | forged complete from perform alone |
| pure Nix fail-closed: perform claimed true; complete false; B38 when release | |

### Relation to prior pins (B39)

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL | Official FreestandingEmit retirement with dual-eq WRITE (partial B38) |
| SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED (this section) | PERFORM-CLAIMED with official dual-eq WRITE evidence (partial B39) |
| SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED | OWNERSHIP-CLAIMED with perform-claimed evidence (partial B40) |
| Full / complete | Next cliffs toward claim B complete |
| SELF-HOST-PRODUCT-PATH-PERFORM | Perform gap bar (partial B9; DependsOnLake true) |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

## Product path freestanding ownership claimed (Track 3 / claim B) -- partial B40

**Greppable:** SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED,
HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED,
SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0,
product path freestanding ownership claimed,
productPathFreestandingOwnershipClaimedPartialReady,
productPathFreestandingOwnershipClaimedOk,
productPathFreestandingOwnershipClaimedMeasured,
productPathFreestandingOwnershipClaimedStepAdvanced,
productPathFreestandingOwnershipClaimed,
productPathFreestandingPerformClaimed,
productPathFreestandingPerformClaimedMeasured,
productPathPerformDependsOnLake,
productPathOfficialPathRetireOfficialMeasured,
productPathOfficialPathUsesDualEqualityWrite,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathFreestandingPerformDualEqualityWriteCapableGapMeasured,
FREESTANDING-OWNERSHIP-CLAIMED,
FREESTANDING-OWNERSHIP-CLAIMED-MEASURED,
FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE,
FREESTANDING-OWNERSHIP-CLAIMED-STEP-ADVANCED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
freestandingCapableOrderedRegenerate, freestandingCapableWriteFreestandingHc,
CapableWriteHc, CapableRegenerate,
DUAL-SSOT-EQUALITY, requireDualSsotEqual,
FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, freestanding-capable-regenerate,
freestanding-ownership-claimed, freestanding-ownership-claimed-measure,
slake-freestanding-ownership-claimed, OwnershipClaimed,
freestanding-perform-claimed, freestanding-perform-claimed-measure,
slake-freestanding-perform-claimed, PerformClaimed,
freestanding-retire-official, OfficialRetire,
freestanding-perform-dual-equality-write-capable-gap,
freestandingProductSelfHostComplete

**Status (2026-07-30):** **partial B40**. First **honest OWNERSHIP-CLAIMED** beyond
B39 PERFORM-CLAIMED (close-path step OWNERSHIP-CLAIMED):
- Official product path `just build` uses freestanding dual-equality
  WRITE via `just freestanding-capable-regenerate` (B38 RETIRE-OFFICIAL remains).
- Host module `SystemsLean.OwnershipClaimed` (short role name; not
  ProductPathFreestandingPerform* kitchen-sink) dual-pins OWNERSHIP-CLAIMED measured
  + ownership claimed true + perform-claimed + official dual-eq WRITE +
  StillUsesFreestandingEmit false.
- SelfApplyFs claim-bool SSoT `productPathFreestandingOwnershipClaimed` **true** with
  greppable perform-claimed + official dual-eq WRITE evidence
  (FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed).
- **Closed (proved true):** OWNERSHIP-CLAIMED measured
  (`productPathFreestandingOwnershipClaimedMeasured` /
  `productPathFreestandingOwnershipClaimed` /
  `productPathFreestandingOwnershipClaimedStepAdvanced`). Lake-free
  `just freestanding-ownership-claimed`: ownership claimed true + perform-claimed +
  official dual-eq WRITE + B39 PERFORM-CLAIMED re-green.
- **Proved non-claims:** DependsOnLake true
  (Lake host for freestanding-capable-regenerate remains);
  `productPathOfficialPathStillUsesLake` true; CAPABLE-GAP stays closed;
  `productPathOfficialPathStillUsesFreestandingEmit` false;
  `productPathOfficialPathDualEqualityBlocksRetirement` false;
  `productPathOfficialPathRetireFreestandingEmitRequired` false;
  complete false; free / llvm / PROVABLY false.
  Living tip after Full: SelfApplyFs `stepContractFull` true (short name).
- **Not sold as:** complete, residual free, free, llvm, PROVABLY (Full landed separately).
  Land-time PerformClaimed may keep ownership false; SelfApplyFs living tip
  ownership is true.

**Ban (B6..B40 theater):** Do **not** re-land B40 OWNERSHIP-CLAIMED, B39 PERFORM-CLAIMED,
B38 RETIRE-OFFICIAL, B37 CAPABLE-GAP as Full or complete. Full is a **new greppable**
step-contract bar. Do not forge Full or complete without full bar.
Do not re-open CAPABLE-GAP. Do not mint another ProductPathFreestandingPerform*
or Capable* kitchen-sink filename.

### Partial B40 measured path (landed; ownership claimed true with perform-claimed + dual-eq WRITE; not Full; not complete)

| Surface | Status | Not |
|---------|--------|-----|
| **Host pin** | `SelfApplyFs.productPathFreestandingOwnershipClaimedPartialReady` (B39 + Ok + OWNERSHIP-CLAIMED measured true + step advanced + ownership claimed true + perform claimed true + UsesDualEqualityWrite true + StillUsesFreestandingEmit false + DualEqualityBlocks false + RetireRequired false + still Lake + DependsOnLake true + stepContractFull true (living tip after Full) + complete true after claim B) | residual free |
| **Lake-free OWNERSHIP-CLAIMED** | `just freestanding-ownership-claimed` dual-pins ownership claimed true + perform-claimed + official dual-eq WRITE + B39 PERFORM-CLAIMED re-green; not Full; not B39 PERFORM rebrand + measure `just freestanding-ownership-claimed-measure` | Full; Lake-free complete |
| **Official path** | `just build` -> `just freestanding-capable-regenerate` (freestandingCapableOrderedRegenerate dual-eq WRITE authority) | FreestandingEmit as official writer |

**Commands (partial B40 OWNERSHIP-CLAIMED loop):**

```bash
just freestanding-ownership-claimed                        # B40 Lake-free OWNERSHIP-CLAIMED
just freestanding-ownership-claimed-measure                # B40 measure (Lake diagnostic)
just freestanding-perform-claimed                          # B39 still green
just freestanding-retire-official                          # B38 still green
just freestanding-perform-dual-equality-write-capable-gap  # B37 still green
just build                                    # official dual-eq WRITE path
```

### Proved vs not (partial B40)

| Proved (partial B40) | Still false / not claimed |
|----------------------|---------------------------|
| OWNERSHIP-CLAIMED measured true (perform-claimed + dual-eq WRITE evidence) | Full step-contract |
| productPathFreestandingOwnershipClaimed true (SelfApplyFs SSoT) | complete / residual free / free / llvm / PROVABLY |
| productPathFreestandingPerformClaimed true remains (B39) | forged complete from ownership alone |
| StillUsesFreestandingEmit false / Blocks false / RetireRequired false | |
| UsesDualEqualityWrite true; StillUsesLake true; B39 perform remains | |
| CAPABLE-GAP stays closed (gap open false; dual-eq live) | |
| DependsOnLake true (Lake host for capable regenerate) | |
| FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed with evidence | |
| pure Nix fail-closed: ownership claimed true; perform claimed true; complete false; B39 when release | |

### Relation to prior pins (B40)

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED | PERFORM-CLAIMED with official dual-eq WRITE evidence (partial B39) |
| SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED (this section) | OWNERSHIP-CLAIMED with perform-claimed + dual-eq WRITE (partial B40; Full false) |
| Full / complete | Next cliffs toward claim B complete |
| Claim B complete | Full freestanding product self-host -- **open** until flip policy met |

---

## Product path freestanding step-contract Full (Track 3 / claim B) -- Full after B40

**Greppable:** SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL,
HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL,
SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0,
product path freestanding step contract full,
stepContractFullPartialReady,
stepContractFullOk,
stepContractFullMeasured,
stepContractFullStepAdvanced,
stepContractFull,
productPathFreestandingOwnershipClaimed,
productPathFreestandingPerformClaimed,
productPathPerformDependsOnLake,
productPathOfficialPathUsesDualEqualityWrite,
productPathOfficialPathStillUsesFreestandingEmit,
productPathOfficialPathDualEqualityBlocksRetirement,
productPathOfficialPathStillUsesLake,
productPathOfficialPathRetireFreestandingEmitRequired,
productPathOfficialPathRetireOfficialMeasured,
FREESTANDING-STEP-CONTRACT-FULL,
FREESTANDING-STEP-CONTRACT-FULL-MEASURED,
FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE,
FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED,
FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL,
FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
just build, freestanding-capable-regenerate,
freestanding-step-contract-full, freestanding-step-contract-full-measure,
slake-freestanding-step-contract-full, StepContractFull,
freestanding-ownership-claimed, OwnershipClaimed,
freestanding-perform-claimed, PerformClaimed,
freestanding-retire-official, OfficialRetire,
freestanding-perform-dual-equality-write-capable-gap,
freestandingProductSelfHostComplete

**Status (2026-07-30):** **Full step-contract**. First **honest Full** beyond
B40 OWNERSHIP-CLAIMED (close-path step Full / freestanding-capable step-contract):
- Official product path `just build` uses freestanding dual-equality
  WRITE via `just freestanding-capable-regenerate` (B38 RETIRE-OFFICIAL remains).
- Host module `SystemsLean.StepContractFull` (short role name; not
  ProductPathFreestanding* kitchen-sink) dual-pins Full measured + stepContractFull
  true + ownership-claimed + perform-claimed + official dual-eq WRITE +
  StillUsesFreestandingEmit false.
- SelfApplyFs claim-bool SSoT `stepContractFull` **true** (short living tip name;
  not `productPathFreestandingCapableStepContractFullSatisfied`) with greppable
  ownership-claimed + perform-claimed + official dual-eq WRITE evidence.
- **Closed (proved true):** Full measured (`stepContractFullMeasured` /
  `stepContractFull` / `stepContractFullStepAdvanced`). Lake-free
  `just freestanding-step-contract-full`: stepContractFull true + ownership-claimed +
  perform-claimed + official dual-eq WRITE + B40 OWNERSHIP-CLAIMED re-green.
- **Proved non-claims:** DependsOnLake true
  (Lake host for freestanding-capable-regenerate remains);
  `productPathOfficialPathStillUsesLake` true; CAPABLE-GAP stays closed;
  `productPathOfficialPathStillUsesFreestandingEmit` false;
  `productPathOfficialPathDualEqualityBlocksRetirement` false;
  `productPathOfficialPathRetireFreestandingEmitRequired` false;
  complete false; free / llvm / PROVABLY false.
- **Not sold as:** complete, residual free, free, llvm, PROVABLY.
  Full true is **not** complete. Historical land-time modules may keep long-name
  Full false pins; SelfApplyFs living tip is `stepContractFull` true.

**Ban (B6..B40 theater):** Do **not** re-land B40 OWNERSHIP-CLAIMED, B39 PERFORM-CLAIMED,
B38 RETIRE-OFFICIAL, B37 CAPABLE-GAP as complete. complete is a **new greppable**
bar after Full. Do not forge complete without full bar.
Do not re-open CAPABLE-GAP. Do not mint another ProductPathFreestandingPerform*
or Capable* kitchen-sink filename. Do not mint another
`productPathFreestandingCapable*` kitchen-sink living-tip bool.

### Full measured path (landed; stepContractFull true with ownership+perform+dual-eq WRITE; not complete)

| Surface | Status | Not |
|---------|--------|-----|
| **Host pin** | `SelfApplyFs.stepContractFullPartialReady` (B40 + Ok + Full measured true + step advanced + stepContractFull true + ownership claimed true + perform claimed true + UsesDualEqualityWrite true + StillUsesFreestandingEmit false + DualEqualityBlocks false + RetireRequired false + still Lake + DependsOnLake true + complete true after claim B) | residual free |
| **Lake-free Full** | `just freestanding-step-contract-full` dual-pins stepContractFull true + ownership-claimed + perform-claimed + official dual-eq WRITE + B40 OWNERSHIP-CLAIMED re-green; not complete; not B40 OWNERSHIP rebrand + measure `just freestanding-step-contract-full-measure` | Lake-free complete |
| **Official path** | `just build` -> `just freestanding-capable-regenerate` (freestandingCapableOrderedRegenerate dual-eq WRITE authority) | FreestandingEmit as official writer |

**Commands (Full step-contract loop):**

```bash
just freestanding-step-contract-full                       # Full Lake-free step-contract
just freestanding-step-contract-full-measure               # Full measure (Lake diagnostic)
just freestanding-ownership-claimed                        # B40 still green
just freestanding-perform-claimed                          # B39 still green
just freestanding-retire-official                          # B38 still green
just freestanding-perform-dual-equality-write-capable-gap  # B37 still green
just build                                    # official dual-eq WRITE path
```

### Proved vs not (Full)

| Proved (Full) | Still false / not claimed |
|---------------|---------------------------|
| stepContractFull true (SelfApplyFs short SSoT) | residual free / free / llvm / PROVABLY |
| ownership claimed true remains (B40) | forged complete from Full alone |
| perform claimed true remains (B39) | |
| StillUsesFreestandingEmit false / Blocks false / RetireRequired false | |
| UsesDualEqualityWrite true; StillUsesLake true | |
| CAPABLE-GAP stays closed (gap open false; dual-eq live) | |
| DependsOnLake true (Lake host for capable regenerate) | |
| FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed with evidence | |
| pure Nix fail-closed: stepContractFull true; ownership true; perform true; complete true after claim B; B40 when release | |

### Relation to prior pins (Full)

| Pin | Meaning |
|-----|---------|
| SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED | OWNERSHIP-CLAIMED with perform-claimed + dual-eq WRITE (partial B40) |
| SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL (this section) | Full step-contract with ownership+perform+dual-eq WRITE (`stepContractFull` true) |
| SELF-HOST-FREESTANDING-PRODUCT-COMPLETE | Claim B complete after Full (see COMPLETE section) |
| Claim B complete | **closed** with Full bar evidence (see COMPLETE) |

---


