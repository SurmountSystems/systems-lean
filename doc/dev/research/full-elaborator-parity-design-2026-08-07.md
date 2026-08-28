# Full elaborator parity design (2026-08-07 reseed)

Kind: analysis only. Not residual invent beyond the named queue.
Not free flip. Not DualResidual re-open. Not FullHostElaborateRemains re-true.
Not product free / complete / PROVABLY re-open. Not full elaborator parity claim.
Not full LLVM backend. Not Rust-native link. Not proof complete re-open.

ASCII only. Plain American English. Date: 2026-08-07.

**Program slice:** plan R1 / Phase P2a (session preferred next after Track 4c +
F1 free claimed; Open was empty done-for-now).

**Prior design (still valid history; this note reseeds after free claimed):**
`doc/dev/research/full-host-elaborator-design-2026-08-03.md` (A2: Lake job map
L1-L10, six-unit foundation vs full package gap, staged queue A3..A-last,
dialect hybrid posture). Do not re-run A2 from zero.

**Related living evidence:**

| Artifact | Role |
|----------|------|
| `plan-slake-replaces-lake.md` | Free bar choice (a); layers 1-4; FullHost false; F1 free claimed |
| `host-residual-free-bar-inventory-2026-08-07.md` | Free checklist met status after A66 / F1 |
| `host-free-dual-ok-design-2026-08-07.md` | Free dual-ok fold redesign |
| `cold-elaborate-day-to-day-use-map-2026-08-07.md` | Day-to-day without-Lake vs wipe-bootstrap / claim-proof / diagnostic |
| `HostModuleCheck.lean` + fixtures | PARTIAL-STRUCTURAL + FOUNDATION-KIND-SURFACE honesty |
| `HostResidualShrink.lean` | Seed modules=206; FullHostElaborateRemains false |
| `DualResidual.lean` | remains false; free claimed true (F1) |
| `SpecProof.lean` | proofCompleteClaimed true (Track 4c; orthogonal) |
| `src/systems/surface-matrix.md` | Full classic elaborator parity **open**; host free **measured** |
| `RESIDUAL-systems.md` | Living Open / Done |

---

## 1. Goal of this reseed

Separate two claims that agents still collapse:

| Claim | Living status (2026-08-07) | Meaning |
|-------|----------------------------|---------|
| **Host residual free (choice (a))** | **claimed** (F1 dual-ok) | Day-to-day host develop under free bar no longer needs Lake on the normal step; `hostElaboratorResidualRemains` **false**; free claimed **true** |
| **Full Lean 4 / mathlib package typecheck of SystemsLean** | **not claimed** | Same job as classic Lake full elaborate + real typecheck depth (and beyond, mathlib-scale ecosystem) |

Also keep orthogonal:

| Surface | Living status | Relation to elaborator parity |
|---------|---------------|-------------------------------|
| FullHostElaborateRemains | **false** (A66) | Cold full Lake is bootstrap / emergency / claim-proof only for day-to-day -- **not** "Slake fully typechecks every module like Lake" |
| proofCompleteClaimed | **true** (Track 4c) | Named SpecProof bar on Mult/Linear/HostCompose/emit families; **not** full elaborator parity |
| Mult..Compose dual-ok | foundation **met** | Peer package / fragment path only; **not** full library typecheck |
| Product free / complete / PROVABLY | **true** | Product wire claims; preserve |
| llvmUnlocked | **true** | Unlock residual; **not** full LLVM backend |

**This note does not flip any pin.** It publishes a measured gap list and names
what may come next without forging parity.

---

## 2. Explicit non-equivalences (read first)

1. **Free claimed F1 is not full elaborator parity.**
   Free bar choice (a) retires day-to-day Lake for named host develop surfaces at
   living honesty bars (package roots, seed import graph, structural module
   check, foundation + develop tools, Mult..Compose package dual-ok, FullHost
   false). It does **not** require real Lean 4 kernel elaborate of every
   `SystemsLean/*.lean` body the way `lake build` does.

2. **FullHostElaborateRemains false is not parity.**
   A66 only reclassified cold full package elaborate as non day-to-day. The cold
   diagnostic (`just systems-lake` / `lake build` under `src/systems/`) remains
   the honest full-package typecheck surface when IR is wiped or when policy
   needs elaborator proof.

3. **proofCompleteClaimed true is orthogonal.**
   Track 4c met a named host theorem bar and rewrote SpecProof ready folds. It
   does not deepen HostModuleCheck into a real typechecker and does not claim
   mathlib or full classic elaborator parity.

4. **Mult..Compose dual-ok is foundation only.**
   Six-unit checkers, writers, and peer without-Lake package dual-ok stay the
   Mult-first foundation harness from the peer elaborator program. They are not
   a synonym for full package typecheck.

5. **PARTIAL-STRUCTURAL and FOUNDATION-KIND-SURFACE are not full typecheck.**
   HostModuleCheck accepts/rejects by package-local imports + greppable key
   decls (and, on Mult..Extract bands, kind-surface structure/axiom/theorem
   tokens). That is residual honesty for free bar item 3 (E5a), not elaborator
   judgments for defs, inductives, and proof terms.

---

## 3. Living pin snapshot (after F1 + Track 4c)

| Pin / surface | Value | Notes |
|---------------|-------|-------|
| `hostElaboratorResidualRemains` | **false** | F1 |
| `hostElaboratorResidualFreeClaimed` | **true** | F1 |
| `hostResidualShrinkFullHostElaborateRemains` | **false** | A66 |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** | A8 |
| `hostResidualShrinkDiagnosticLakeRecipesRemain` | **true** | intentional carve |
| Host seed on import-graph / module-check | **modules=206** | Mult..SpecProofTheorems living bar; A59 leftover empty for product library band |
| *Main + harness out-of-scope | Main **59** + harness **5** | Not day-to-day seed body |
| On-disk `SystemsLean/*.lean` count | **~270** | Includes mains and tools; handoff living tip |
| HostModuleCheck depth | **PARTIAL-STRUCTURAL** + Mult..Extract **FOUNDATION-KIND-SURFACE** | A56..A58; not full elaborate |
| `proofCompleteClaimed` | **true** | Track 4c |
| Product free / complete / PROVABLY | **true** | preserve |
| Product StillUsesLake / DependsOnLake | **false** | preserve |
| Surface matrix: Host residual free | **measured** | F1 |
| Surface matrix: Full classic elaborator parity | **open** | this gap |
| Surface matrix: Full Lean 4 core parity | **open** | this gap |
| Surface matrix: SpecProof / proof complete | **measured** | Track 4c |

---

## 4. What "full package typecheck" would require

Interpret **full package typecheck** as: Slake (or a measured Slake path) does the
same job classic Lake does for the SystemsLean library develop set -- load the
package, resolve the real import closure, elaborate and typecheck module bodies
including theorems, and leave cold full Lake as bootstrap-only for that job too.

That is a **superset** of free bar choice (a). Free claimed does not meet it.

### 4a. Gap table (cited / measured)

| Dimension | Living free bar (claimed F1) | Full package typecheck (parity target) | Gap class |
|-----------|------------------------------|----------------------------------------|-----------|
| Package load (L1) | `host-package-roots-without-lake` green | Same or successor without Lake on hot path | **Met for free** |
| Import graph (L2) | Seed Mult..SpecProofTheorems **modules=206** without-Lake | Full develop set including any future modules; *Main/harness policy explicit | **Scale / policy** (206 of ~270 on-disk; mains carved) |
| Module body check (L3) | PARTIAL-STRUCTURAL imports + key decls | Real elaborator judgments (defs, inductives, namespaces, instances) | **Kernel depth** |
| Kind-surface deepen | Mult..Extract FOUNDATION-KIND-SURFACE only | Every library band at least kind-surface, then real elaborate | **Coverage band** |
| Theorems (L4) | Required *Theorems corpus under PARTIAL-STRUCTURAL / kind-surface | Proof terms elaborate as Lake does | **Proof check depth** |
| Host tools (L6-L7) | Day-to-day candidates empty (A60); claim/diagnostic Lake-only honest | Optional: claim tools move only if residual names them into day-to-day | **Policy carve OK** |
| Cold full Lake (L5/L8/L10 story) | FullHostElaborateRemains **false**; wipe-bootstrap / claim-proof / diagnostic remain | Cold full still allowed as bootstrap; parity does not delete Lake | **Met for free; not parity** |
| Syntax surface | Hybrid dialect + real-module seed extract (A2 posture) | Faithful coverage of real SystemsLean source as Lake parses it | **Syntax / dialect** |
| Ecosystem | Out of free scope | mathlib-scale Lean 4 elaborator parity | **Explicit non-goal day one** |
| Diagnostic full typecheck today | `just systems-lake` / `(cd src/systems && lake build)` | Same recipe remains honest full-package surface until parity | **Cold lake diagnostic** |

**Bottom line:** free owns **day-to-day shape and ownership** at structural bars.
Full package typecheck needs **kernel depth and real coverage**, staged with
evidence, without selling HostModuleCheck green as Lake elaborate.

### 4b. HostModuleCheck honesty (living)

From `HostModuleCheck.lean` header and A56..A58 joins:

| Bar | What it checks | What it does not check |
|-----|----------------|------------------------|
| **PARTIAL-STRUCTURAL** | Package-local imports present; role key decls greppable; empty/missing reject | Types of terms; proof validity; full Lean AST |
| **FOUNDATION-KIND-SURFACE** (Mult..Extract) | Structures / axioms / expanded theorem tokens on named bands | Full inductive elaborate; binder-level QTT; arbitrary proof scripts |
| **without-Lake** | Prebuilt `host-module-check` ELF on hot path | Building the library oleans like Lake |

Recipes: `just host-module-check-without-lake` (day-to-day structural);
`just systems-lake` (cold full elaborate diagnostic).

### 4c. Without-Lake develop tools (not typecheck substitutes)

Day-to-day without-Lake matrix (cold-elaborate use map): package roots, import
graph, module-check, package-write Mult..Compose, fragment check/graph, foundation
and develop tool clean-bootstrap, product wire `just build`. Those jobs prove
**ownership of develop steps**, not full elaborator parity.

### 4d. Cold Lake diagnostic (still real)

After A66 / F1, cold full elaborate is **not** the normal edit-check loop. It
remains the honest **full package typecheck** when:

- `.lake` is wiped and IR/rsp must be rebuilt (wipe-bootstrap);
- policy requires lake elaborator proof on a claim flip while Lake is still the
  bootstrap elaborator for that surface;
- an operator or CI wants a full library sanity pass.

Do not claim parity because FullHostElaborateRemains is false.

---

## 5. Ordered recommended next residual Names

None of the following is opened by this design alone. Open only when Done when is
checkable without forge, or when the operator promotes a held track.

### 5a. Checkable without forge (optional, agent-doable if operator wants)

| Order | Name | Goal | Done when (sketch) | Out of scope |
|------:|------|------|--------------------|--------------|
| R1a | **Check depth gap inventory** | Measure named sample modules: HostModuleCheck bar vs cold `lake build` elaborate surface | Research note under `doc/dev/research/` with sample table (accept/reject tokens vs lake exit); residual cite; **no** pin flip; DualResidual / FullHost / proof complete unchanged | Implementing elaborator; free re-open; parity claim |
| R1b | **Kind-surface band expand** | One named library band beyond Mult..Extract at FOUNDATION-KIND-SURFACE only | HostModuleCheck fixtures + without-Lake green; HostResidualShrink reseed; join; still PARTIAL honesty; **not** full typecheck slogan | Full elaborator; free flip; mathlib |

R1a is pure measurement. R1b is optional deepen of the **same honesty ceiling**
already used for free (E5a), not a jump to kernel elaborate.

### 5b. Held / operator-gated (no agent-checkable Done when yet without inventing elaborator)

| Name | Why held |
|------|----------|
| **Real elaborator judgments for seed modules** | Needs a named typecheck dialect or real Lean subset elaborator; Done when must not be greps alone; not designed here |
| **Full classic elaborator parity claim** | Surface-matrix row stays **open** until real evidence + dual-ok redesign; day-one non-goal in A2 |
| **Full Lean 4 / mathlib elaborator** | Explicit non-goal day one (A2 section 5; plan layers) |
| **Full LLVM backend** | Separate track; llvmUnlocked true is not backend |
| **Rust-native link** | Separate track; Mult-first layout ladder done; link not claimed |

**Honest residual posture after this design:** leave **Open empty (done-for-now)**
unless the operator opens R1a / R1b or a held track with a written Done when.

---

## 6. Residual lockstep intent (this slice)

| Action | Intent |
|--------|--------|
| Open **Full elaborator parity design** | This design Name |
| Move to **Done** when note + residual + WATCHER + handoff + hygiene green | This pass |
| Next Open | **Empty done-for-now** (held tracks only) unless operator promotes R1a/R1b |
| Pins | **No flip** DualResidual free, FullHost, proof complete, product free/complete/PROVABLY, llvm full backend |

---

## 7. Dialect posture carry-forward (from A2; still default)

Grow a documented host dialect that converges on real SystemsLean modules. Prefer
smallest dialect or kind-surface extension over day-one full Lean 4 elaborator.
Hybrid: foundation dialect harness + staged real-module structural coverage.
Same-job wall-clock remains same modules / same job -- never cold full package
vs Mult package write as a "parity win."

---

## 8. Non-claims (this slice)

- Does **not** claim full elaborator parity or full package typecheck
- Does **not** flip DualResidual, FullHostElaborateRemains, proofCompleteClaimed
- Does **not** re-open product free / complete / PROVABLY
- Does **not** forge full LLVM backend or Rust-native link
- Does **not** implement HostModuleCheck deepen or a real elaborator
- Does **not** invent Open Names for canary-only theorems
- Does **not** re-narrow free bar choice (a) or re-true FullHost

---

## 9. Pointers

| Artifact | Role |
|----------|------|
| This note | Post-F1 / post-Track-4c elaborator **parity** gap SSoT |
| A2 full-host-elaborator-design 2026-08-03 | Prior L1-L10 + A3..A-last history |
| plan-slake-replaces-lake | Free bar + layers; F1 done |
| cold-elaborate use map | Day-to-day vs cold lake classes |
| free bar inventory 2026-08-07 | Free checklist met/open at free land time |
| HostModuleCheck | Living structural bar |
| surface-matrix | Full classic elaborator parity **open** |

---

## 10. Green for this design only

| Check | Status |
|-------|--------|
| Research note at this path | required |
| Free claimed F1 != full elaborator parity explicit | required |
| FullHostElaborateRemains false explicit | required |
| proofCompleteClaimed true orthogonal explicit | required |
| Mult..Compose dual-ok foundation only explicit | required |
| Measured / cited gap list | required |
| Ordered next Names or honest held | required |
| No pin forge | required |
| Residual / WATCHER / handoff lockstep | residual implementer |
| `just hygiene` | residual implementer |
