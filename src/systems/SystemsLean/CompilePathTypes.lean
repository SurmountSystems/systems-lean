/-
  SYSTEMS_LEAN_HOST partial -- Types unit compile-path fixture (COMPILE-PATH-TYPES).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Types end-to-end compile-path fixture only: TYPED_IR kind/mult nodes,
  then ordered IR, then host mark+mint (unitCompileReady on that live host).
  HOST-EMIT-TYPES is product-text honesty beside that path, not a result of
  mark and mint.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-TYPES, TYPES-FIXTURE, HOST-EMIT-TYPES,
  typesFixtureCompilePathReady, COMPILE-PATH-TYPES-SMOKE, COMPILE-PATH-TYPES-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathTypes
  Red/green: just systems-host; lake build SystemsLean.CompilePathTypes.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitTypes

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-TYPES / TYPES-FIXTURE (Track 2 Types unit end-to-end)

  Named Types fixture: TYPED_IR kind/mult typed nodes (Types.mkNode? fail-closed)
  -> ordered IR program (3-node ERASED/LINEAR/VALUE) -> host compose
  (mark MULT-0 + mint MULT-1). That live host meets unitCompileReady.
  HOST-EMIT-TYPES product text honesty is beside that path, not a result of
  mark and mint. Same kind/mult pairing as KernelTypes IR fixture; e2e bar lives
  here (KernelTypes imports CompilePath -- no import cycle).
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full elaborator type checker / full Slake compiler.
-/


set_option maxRecDepth 8192

/-- Fixed Types fixture mint id (nonzero; distinct from Mult 4 and Linear 7). -/
def typesFixtureMintId : Nat := 5

/-- Types fixture type tags (deterministic; match KernelTypes tagErased/Linear/Value). -/
def typesFixtureTagErased : Nat := 0
def typesFixtureTagLinear : Nat := 1
def typesFixtureTagValue : Nat := 2

/-- mkTypesFixtureNode -- fail-closed typed node (TYPED_IR kind/mult via Types.mkNode?). -/
def mkTypesFixtureNode (tag : Nat) (m : Mult) (k : NodeKind) : Option IrNode :=
  Types.mkNode? tag m k

/-- pushTypesFixtureProg p n? -- push when some well-typed node; none propagates. -/
def pushTypesFixtureProg (p : Program) (n? : Option IrNode) : Option Program :=
  match n? with
  | none => none
  | some n => pushFixtureProg p n

/-- lowerTypesFixtureProgram -- TYPED_IR kind/mult nodes as ordered IR
    (COMPILE-PATH-TYPES). Three nodes: MULT-0 erased, MULT-1 linear,
    MULT-OMEGA value via Types.mkNode? (fail-closed pairing).
    FAIL-CLOSED: none if any node or push fails.
    Greppable: lowerTypesFixtureProgram, TYPES-FIXTURE, ORDERED-IR-PROGRAM,
    TYPED_IR_V0. -/
def lowerTypesFixtureProgram : Option Program :=
  let n0 := mkTypesFixtureNode typesFixtureTagErased Mult.mult0 NodeKind.erased
  let n1 := mkTypesFixtureNode typesFixtureTagLinear Mult.mult1 NodeKind.linear
  let n2 := mkTypesFixtureNode typesFixtureTagValue Mult.multOmega NodeKind.value
  match pushTypesFixtureProg IrProgram.empty n0 with
  | none => none
  | some p0 =>
    match pushTypesFixtureProg p0 n1 with
    | none => none
    | some p1 => pushTypesFixtureProg p1 n2

/-- typesFixtureProgram -- Types ordered IR when lower succeeds; empty on fail. -/
def typesFixtureProgram : Program :=
  match lowerTypesFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- pushTypesFixtureHost hc n? -- push typed node onto compose graph; none on fail. -/
def pushTypesFixtureHost (hc : Host) (n? : Option IrNode) : Option Host :=
  match n? with
  | none => none
  | some n => pushFixtureHost hc n

/-- lowerTypesFixtureComposeRaw -- HostCompose with three TYPED_IR nodes, no mint/mark.
    FAIL-CLOSED: none on mkNode?/push fail. Unready for multPreScan (MULT-0/1 need handles).
    Greppable: lowerTypesFixtureComposeRaw, TYPES-FIXTURE, HOST-COMPOSE, TYPED_IR_V0. -/
def lowerTypesFixtureComposeRaw : Option Host :=
  let n0 := mkTypesFixtureNode typesFixtureTagErased Mult.mult0 NodeKind.erased
  let n1 := mkTypesFixtureNode typesFixtureTagLinear Mult.mult1 NodeKind.linear
  let n2 := mkTypesFixtureNode typesFixtureTagValue Mult.multOmega NodeKind.value
  match pushTypesFixtureHost HostCompose.empty n0 with
  | none => none
  | some hc0 =>
    match pushTypesFixtureHost hc0 n1 with
    | none => none
    | some hc1 => pushTypesFixtureHost hc1 n2

/-- lowerTypesFixtureCompose -- Types fixture host ready for unit compile path.
    markErased (MULT-0) + mint (MULT-1); MULT-OMEGA needs neither.
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerTypesFixtureCompose, TYPES-FIXTURE, HOST-COMPOSE. -/
def lowerTypesFixtureCompose : Option Host :=
  match lowerTypesFixtureComposeRaw with
  | none => none
  | some hcRaw =>
    let hcMarked := HostCompose.markErased hcRaw
    mintFixtureHost hcMarked typesFixtureMintId

/-- typesFixtureKindMultOk -- TYPED_IR kind/mult pairing honesty on fixture path.
    Known pairings succeed via mkNode?; listed mismatches are none; kind tag 3
    is rejected.
    Greppable: typesFixtureKindMultOk, TYPED_IR_V0, COMPILE-PATH-TYPES. -/
def typesFixtureKindMultOk : Bool :=
  (mkTypesFixtureNode typesFixtureTagErased Mult.mult0 NodeKind.erased).isSome
    && (mkTypesFixtureNode typesFixtureTagLinear Mult.mult1 NodeKind.linear).isSome
    && (mkTypesFixtureNode typesFixtureTagValue Mult.multOmega NodeKind.value).isSome
    && (Types.mkNode? 0 Mult.mult1 NodeKind.erased).isNone
    && (Types.mkNode? 0 Mult.mult0 NodeKind.linear).isNone
    && (Types.mkNode? 0 Mult.multOmega NodeKind.linear).isNone
    && !Types.isValidKindTag 3

/-- typesFixtureProgramReady -- ordered IR bar for Types fixture.
    FAIL-CLOSED: lower succeeds, length 3, programCompileReady, isWellTyped,
    gradeSurfaceOk, kind/mult honesty.
    Greppable: typesFixtureProgramReady, COMPILE-PATH-TYPES, TYPES-FIXTURE. -/
def typesFixtureProgramReady : Bool :=
  match lowerTypesFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 3
        && IrProgram.isWellTyped p
        && gradeSurfaceOk
        && typesFixtureKindMultOk

/-- typesFixtureComposeReady -- unit compile-path bar on Types fixture host.
    FAIL-CLOSED: lower compose succeeds, then unitCompileReady, extractOkFs,
    and a live linear slot.
    Greppable: typesFixtureComposeReady, COMPILE-PATH-TYPES, unitCompileReady. -/
def typesFixtureComposeReady : Bool :=
  match lowerTypesFixtureCompose with
  | none => false
  | some hc => unitCompileReady hc && HostCompose.extractOkFs hc && hc.linear.live

/-- typesFixtureComposeRawUnready -- unminted/unmarked Types compose is not
    unitCompileReady, and HostCompose.checkFailClosed is false on that host.
    Greppable: typesFixtureComposeRawUnready, FAIL-CLOSED, TYPES-FIXTURE. -/
def typesFixtureComposeRawUnready : Bool :=
  match lowerTypesFixtureComposeRaw with
  | none => false
  | some hc => !unitCompileReady hc && !HostCompose.checkFailClosed hc

/-- typesFixtureEmitPathOk -- host Types product text path honesty (HOST-EMIT-TYPES).
    Reuses EmitTypes.emitTypesReady; does not re-emit C; not residual free.
    Greppable: typesFixtureEmitPathOk, HOST-EMIT-TYPES, COMPILE-PATH-TYPES. -/
def typesFixtureEmitPathOk : Bool := EmitTypes.emitTypesReady

/-- Local honesty: Types e2e fixture does NOT claim residual free. -/
def typesFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Types e2e fixture does NOT complete product self-host. -/
def typesFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Types e2e fixture does NOT claim proof complete. -/
def typesFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Types e2e fixture does NOT unlock llvm. -/
def typesFixtureLlvmUnlocked : Bool := false

/-- typesFixtureCompilePathReady -- end-to-end Types unit compile path (Track 2).
    TYPED_IR kind/mult + ordered IR + ready compose unit bar +
    raw compose not unit-ready + HOST-EMIT-TYPES emit path +
    free/complete/proof/llvm stay false.
    The top-level gradeSurfaceOk conjunct repeats the gradeSurfaceOk check
    inside typesFixtureProgramReady. The top-level typesFixtureKindMultOk
    conjunct repeats the kind/mult check inside typesFixtureProgramReady.
    typesFixtureComposeRawUnready is a separate conjunct (raw host unready).
    Greppable: typesFixtureCompilePathReady, COMPILE-PATH-TYPES, TYPES-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-TYPES, TYPED_IR_V0. -/
def typesFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && typesFixtureKindMultOk
    && typesFixtureProgramReady
    && typesFixtureComposeReady
    && typesFixtureComposeRawUnready
    && typesFixtureEmitPathOk
    && !typesFixtureResidualFreeClaimed
    && !typesFixtureProductSelfHostCompleteClaimed
    && !typesFixtureProofCompleteClaimed
    && !typesFixtureLlvmUnlocked

/-- typesFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: typesFixtureDoesNotMeanResidualFree, COMPILE-PATH-TYPES. -/
def typesFixtureDoesNotMeanResidualFree : Bool :=
  typesFixtureCompilePathReady && !typesFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-TYPES-THEOREM (readable Types e2e statements, then proofs)

  Real Lean theorems for Types fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

/-- Types fixture TYPED_IR kind/mult pairing honesty holds.
    Greppable: typesFixtureKindMultOk_true, COMPILE-PATH-TYPES-THEOREM. -/
theorem typesFixtureKindMultOk_true : typesFixtureKindMultOk = true := by decide

/-- Types fixture ordered IR program is compile-path ready.
    Greppable: typesFixtureProgramReady_true, COMPILE-PATH-TYPES-THEOREM. -/
theorem typesFixtureProgramReady_true : typesFixtureProgramReady = true := by decide

/-- Types fixture host compose is unit-compile-ready after mark+mint.
    Greppable: typesFixtureComposeReady_true, COMPILE-PATH-TYPES-THEOREM. -/
theorem typesFixtureComposeReady_true : typesFixtureComposeReady = true := by decide

/-- Unready Types compose fails unit bar (FAIL-CLOSED multPreScan).
    Greppable: typesFixtureComposeRaw_unready_true, COMPILE-PATH-TYPES-THEOREM. -/
theorem typesFixtureComposeRaw_unready_true :
    typesFixtureComposeRawUnready = true := by decide

/-- HOST-EMIT-TYPES product text path honesty holds on Types fixture path.
    Greppable: typesFixtureEmitPathOk_true, HOST-EMIT-TYPES, COMPILE-PATH-TYPES-THEOREM. -/
theorem typesFixtureEmitPathOk_true : typesFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Types unit compile path ready (Track 2 Types fixture).
    Greppable: typesFixtureCompilePathReady_true, COMPILE-PATH-TYPES-THEOREM,
    COMPILE-PATH-TYPES, TYPES-FIXTURE, HOST-COMPILE-PATH. -/
theorem typesFixtureCompilePathReady_true :
    typesFixtureCompilePathReady = true := by
  native_decide

/-- Types e2e ready does not claim residual free.
    Greppable: typesFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-TYPES-THEOREM. -/
theorem typesFixtureDoesNotMeanResidualFree_true :
    typesFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Types e2e free/complete/proof/llvm honesty stays false.
    Greppable: typesFixture_claims_false, COMPILE-PATH-TYPES-THEOREM. -/
theorem typesFixture_claims_false :
    (typesFixtureResidualFreeClaimed = false)
      /\ (typesFixtureProductSelfHostCompleteClaimed = false)
      /\ (typesFixtureProofCompleteClaimed = false)
      /\ (typesFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerTypesFixtureProgram succeeds with length 3.
    Greppable: lowerTypesFixtureProgram_length_three, COMPILE-PATH-TYPES-THEOREM. -/
theorem lowerTypesFixtureProgram_length_three :
    (match lowerTypesFixtureProgram with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerTypesFixtureCompose is some (mark+mint path).
    Greppable: lowerTypesFixtureCompose_isSome, COMPILE-PATH-TYPES-THEOREM. -/
theorem lowerTypesFixtureCompose_isSome :
    lowerTypesFixtureCompose.isSome = true := by decide


/-! ### COMPILE-PATH-TYPES-SMOKE (Types fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-TYPES-SMOKE, TYPES-FIXTURE, COMPILE-PATH-TYPES. -/

/-! COMPILE-PATH-TYPES-SMOKE: ordered IR lower is some.
    Later examples in this block check length 3, programCompileReady,
    kind/mult honesty, and typesFixtureProgramReady. -/
example : (lowerTypesFixtureProgram.isSome) = true := by decide
example : typesFixtureProgram.nodes.length = 3 := by decide
example : programCompileReady typesFixtureProgram = true := by decide
example : typesFixtureKindMultOk = true := by decide
example : typesFixtureProgramReady = true := by decide

/-! COMPILE-PATH-TYPES-SMOKE: raw Types compose fails the unit bar.
    Later examples in this block check the marked and minted host. -/
example : typesFixtureComposeRawUnready = true := by decide
example : typesFixtureComposeReady = true := by decide
example :
    (match lowerTypesFixtureCompose with
     | some hc => unitCompileReady hc
     | none => false) = true := by decide

/-- COMPILE-PATH-TYPES-SMOKE: HOST-EMIT-TYPES product text path honesty. -/
example : typesFixtureEmitPathOk = true := by native_decide
example : EmitTypes.hostEmitTypesId = "HOST-EMIT-TYPES" := rfl
example : EmitTypes.stageId = "SLAKE_SELF_HOST_EMIT_TYPES_V0" := rfl

/-- COMPILE-PATH-TYPES-SMOKE: full Types e2e compile path; free/complete stay false. -/
example : typesFixtureCompilePathReady = true := by native_decide
example : typesFixtureDoesNotMeanResidualFree = true := by native_decide
example : typesFixtureResidualFreeClaimed = false := rfl
example : typesFixtureProductSelfHostCompleteClaimed = false := rfl
example : typesFixtureProofCompleteClaimed = false := rfl
example : typesFixtureLlvmUnlocked = false := rfl



end SystemsLean.CompilePath
