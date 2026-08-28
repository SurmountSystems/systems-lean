/-
  SYSTEMS_LEAN_HOST partial -- host-side dual / JOIN map into compile-path readiness.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Dual cite inventory (read-only; do not reimplement duals here):
    src/idris2/examples/{ConsumeToken,ErasedIndex,UnrestrictedShare,FailClosedGrade,LinearPairSwap,RuntimeExtract}.idr
    src/lean4/examples/{ConsumeToken,ErasedIndex,UnrestrictedShare,FailClosedGrade,LinearPairSwap,RuntimeExtract}.lean
  Companion map: src/systems/join-map.md (stated dual -> Slake use table).

  Stated map (dual algorithm -> Systems / Slake use; dual-cite alone is not enough):
  | Dual algorithm     | Host use (executable pin)                     | Product wire (honesty)              |
  |--------------------|-----------------------------------------------|-------------------------------------|
  | ConsumeToken       | HostCompose mint/consume + LinearHost empty   | slake_consume_token_* / linear_token|
  | ErasedIndex        | Erasure mark / isRuntimeAbsent + MULT-0       | slake_erasure_is_runtime_absent     |
  | UnrestrictedShare  | Mult multOmega / name MULT-OMEGA + shareNat   | MULT-OMEGA grade surface            |
  | FailClosedGrade    | Mult.ofNat? / isValidTag unknown reject       | closed Mult enum tags 0/1/2 only    |
  | LinearPairSwap     | PARTIAL: single live-token + remint reject    | multi-token product C not claimed   |
  | RuntimeExtract     | Extract RuntimeClaim FS-only accept/reject    | RUNTIME-FS product extract path     |
  Note: Linear.Token / mkToken / consume / roundTrip remain dual-cite axioms on
  Linear.lean (classic elaborator cannot enforce MULT-1); joinAlgUseOk does NOT
  pin those axioms (noncomputable). ConsumeToken use evidence is HostCompose
  live-flag mint/consume only. shareNat is UnrestrictedShare only (not
  ConsumeToken). FailClosedGrade use is Mult fail-closed raw-tag decode only.
  LinearPairSwap host use is PARTIAL (HostCompose one live at a time).

  Spec (readable, separate from any future proof):
  - SLAKE_JOIN_MAP_V0 / HOST-JOIN-MAP / JOIN-MAP: host map from dual-pair
    JOIN-ALG honesty into Slake compile-path readiness composition.
  - joinDualCiteOk: surface dual-path inventory for all six JOIN-ALG examples.
    Not a filesystem walk of dual trees.
  - joinAlgUseOk: host module *use* pins (HostCompose, Erasure, Mult +
    Linear.shareNat for UnrestrictedShare; Mult fail-closed for FailClosedGrade;
    PARTIAL single-live remint reject for LinearPairSwap; Extract RuntimeClaim
    FS-only for RuntimeExtract),
    not dual-example path strings alone. Greppable: joinAlgUseOk, JOIN-ALG-USE.
  - joinAlgContractOk: joinDualCiteOk && joinAlgUseOk && stage/map ids.
    Surface canary, not formal dual-bridge theorems.
  - joinUnitCompileReady hc: CompilePath.unitCompileReady && joinAlgContractOk
    (FAIL-CLOSED composition; reuses unit bar APIs; no parallel type zoo).
  - joinProgramCompileReady p: CompilePath.programCompileReady && joinAlgContractOk
    (sibling API; EMPTY-PROGRAM-FAIL-CLOSED preserved; empty host OK != empty program OK).
  - joinCompileReady hc: alias of joinUnitCompileReady (HOST-JOIN-MAP unit bar).
  - Verdict records joinOk / unitReady / ok for inventory (ok == both).

  Theorems (JOIN-MAP-THEOREM / HOST-JOIN-MAP-THEOREM -- partial JoinMap only):
  - Live in SystemsLean.JoinMapTheorems (same namespace; long-file peel).
  - joinAlgContractOk_true / joinAlgUseOk_true / stageId_eq / hostJoinMapId_eq
  - joinUnitCompileReady_empty_true / joinProgramCompileReady_empty_false
  - joinCompileReady_eq_joinUnitCompileReady
  - empty_host_ok_ne_empty_program_ok (join sibling bars)
  - joinUnitCompileReady_eq / joinProgramCompileReady_eq (definitional composition)
  - joinUnitCompileReady_mult1_unminted_false / joinUnitCompileReady_mult1_minted_true
  - joinProgramCompileReady_single_value (non-empty well-typed program path)
  - JOIN-MAP-SMOKE behavioral examples live with theorems
  These JoinMap theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial path contracts != formal dual-bridge theorems != residual free.

  Intentional non-claims / partial parity:
  - PARTIAL: host Bool map inventory vs formal dual-bridge theorems inventing
    duals; this module cites duals read-only and composes existing host APIs.
  - PARTIAL: joinAlgContractOk is surface-level (cite inventory + host use pins),
    not a structure walk of dual sources or full bridge proof.
  - Classic Lean cannot enforce MULT-1 / LINEAR-EXACT-ONCE; Linear axioms +
    HostCompose live flag remain the contract (see Linear.lean / HostCompose).
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Not a full Slake compiler body. Not residual free.
  - Does not fold program bar into unit bar (sibling APIs; P3 residual lesson).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_JOIN_MAP_V0, HOST-JOIN-MAP, JOIN-MAP,
  JOIN-ALG, JOIN-ALG-USE, ConsumeToken, ErasedIndex, UnrestrictedShare,
  FailClosedGrade, FAIL-CLOSED-UNKNOWN-GRADE, LinearPairSwap, RuntimeExtract,
  RUNTIME-FS, RUNTIME-CLASSIC, EDGE-RUNTIME,
  LINEAR-EXACT-ONCE, MULT-1, MULT-0, MULT-OMEGA, HOST-COMPILE-PATH,
  SLAKE_COMPILE_PATH_V1, joinUnitCompileReady, joinProgramCompileReady,
  joinCompileReady, joinAlgContractOk, joinAlgUseOk, joinDualCiteOk,
  JOIN-MAP-SMOKE, EMPTY-PROGRAM-FAIL-CLOSED, FAIL-CLOSED,
  JOIN-MAP-THEOREM, HOST-JOIN-MAP-THEOREM, JoinMapTheorems,
  consumeTokenHostUseOk, erasedIndexHostUseOk, unrestrictedShareHostUseOk,
  failClosedGradeHostUseOk, linearPairSwapHostUseOk, runtimeExtractHostUseOk
  UNIT_SURFACE host surface. Module: SystemsLean.JoinMap
  Long-file peel: JOIN-MAP-THEOREM + JOIN-MAP-SMOKE in SystemsLean.JoinMapTheorems
  (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Mult
import SystemsLean.Linear
import SystemsLean.IrProgram
import SystemsLean.Erasure
import SystemsLean.Extract
import SystemsLean.HostCompose
import SystemsLean.CompilePath

namespace SystemsLean.JoinMap

open SystemsLean.Mult (Mult)
open SystemsLean.IrProgram (Program)
open SystemsLean.HostCompose (Host)

/-- Greppable primary stage id for host join map (P4). -/
def stageId : String := "SLAKE_JOIN_MAP_V0"

/-- Greppable host alias for join-map honesty (HOST-JOIN-MAP). -/
def hostJoinMapId : String := "HOST-JOIN-MAP"

/-- Greppable short map id (JOIN-MAP). -/
def joinMapId : String := "JOIN-MAP"

/-- JOIN-ALG algorithm family id (six dual-pair examples). -/
def joinAlgId : String := "JOIN-ALG"

/-- JOIN-ALG-USE: host *use* surface id (distinct from dual-path inventory). -/
def joinAlgUseId : String := "JOIN-ALG-USE"

/-- ConsumeToken dual algorithm name. -/
def consumeTokenAlgId : String := "ConsumeToken"

/-- ErasedIndex dual algorithm name. -/
def erasedIndexAlgId : String := "ErasedIndex"

/-- UnrestrictedShare dual algorithm name. -/
def unrestrictedShareAlgId : String := "UnrestrictedShare"

/-- FailClosedGrade dual algorithm name. -/
def failClosedGradeAlgId : String := "FailClosedGrade"

/-- LinearPairSwap dual algorithm name. -/
def linearPairSwapAlgId : String := "LinearPairSwap"

/-- RuntimeExtract dual algorithm name. -/
def runtimeExtractAlgId : String := "RuntimeExtract"

/-! ### Dual path inventory (read-only cites; not host use evidence alone) -/

/-- Read-only dual path cite (Idris ConsumeToken). Not a filesystem read. -/
def dualConsumeTokenIdris : String := "src/idris2/examples/ConsumeToken.idr"

/-- Read-only dual path cite (Lean ConsumeToken). -/
def dualConsumeTokenLean : String := "src/lean4/examples/ConsumeToken.lean"

/-- Read-only dual path cite (Idris ErasedIndex). -/
def dualErasedIndexIdris : String := "src/idris2/examples/ErasedIndex.idr"

/-- Read-only dual path cite (Lean ErasedIndex). -/
def dualErasedIndexLean : String := "src/lean4/examples/ErasedIndex.lean"

/-- Read-only dual path cite (Idris UnrestrictedShare). -/
def dualUnrestrictedShareIdris : String := "src/idris2/examples/UnrestrictedShare.idr"

/-- Read-only dual path cite (Lean UnrestrictedShare). -/
def dualUnrestrictedShareLean : String := "src/lean4/examples/UnrestrictedShare.lean"

/-- Read-only dual path cite (Idris FailClosedGrade). -/
def dualFailClosedGradeIdris : String := "src/idris2/examples/FailClosedGrade.idr"

/-- Read-only dual path cite (Lean FailClosedGrade). -/
def dualFailClosedGradeLean : String := "src/lean4/examples/FailClosedGrade.lean"

/-- Read-only dual path cite (Idris LinearPairSwap). -/
def dualLinearPairSwapIdris : String := "src/idris2/examples/LinearPairSwap.idr"

/-- Read-only dual path cite (Lean LinearPairSwap). -/
def dualLinearPairSwapLean : String := "src/lean4/examples/LinearPairSwap.lean"

/-- Read-only dual path cite (Idris RuntimeExtract). -/
def dualRuntimeExtractIdris : String := "src/idris2/examples/RuntimeExtract.idr"

/-- Read-only dual path cite (Lean RuntimeExtract). -/
def dualRuntimeExtractLean : String := "src/lean4/examples/RuntimeExtract.lean"

/-- Legacy alias: ConsumeToken Idris path (kept for prior greppable surface). -/
def dualIdrisPath : String := dualConsumeTokenIdris

/-- Legacy alias: ConsumeToken Lean path. -/
def dualLeanPath : String := dualConsumeTokenLean

/-- joinLinearCiteOk -- ConsumeToken dual path inventory only (legacy name).
    Prefer joinDualCiteOk for the six-algorithm inventory. -/
def joinLinearCiteOk : Bool :=
  (dualConsumeTokenIdris == "src/idris2/examples/ConsumeToken.idr")
    && (dualConsumeTokenLean == "src/lean4/examples/ConsumeToken.lean")

/-- joinDualCiteOk -- six JOIN-ALG dual-pair path cites match layout.
    Surface inventory only (not FS walk; not host use).
    Greppable: joinDualCiteOk, ConsumeToken, ErasedIndex, UnrestrictedShare,
    FailClosedGrade, LinearPairSwap, RuntimeExtract. -/
def joinDualCiteOk : Bool :=
  joinLinearCiteOk
    && (dualErasedIndexIdris == "src/idris2/examples/ErasedIndex.idr")
    && (dualErasedIndexLean == "src/lean4/examples/ErasedIndex.lean")
    && (dualUnrestrictedShareIdris == "src/idris2/examples/UnrestrictedShare.idr")
    && (dualUnrestrictedShareLean == "src/lean4/examples/UnrestrictedShare.lean")
    && (dualFailClosedGradeIdris == "src/idris2/examples/FailClosedGrade.idr")
    && (dualFailClosedGradeLean == "src/lean4/examples/FailClosedGrade.lean")
    && (dualLinearPairSwapIdris == "src/idris2/examples/LinearPairSwap.idr")
    && (dualLinearPairSwapLean == "src/lean4/examples/LinearPairSwap.lean")
    && (dualRuntimeExtractIdris == "src/idris2/examples/RuntimeExtract.idr")
    && (dualRuntimeExtractLean == "src/lean4/examples/RuntimeExtract.lean")
    && (consumeTokenAlgId == "ConsumeToken")
    && (erasedIndexAlgId == "ErasedIndex")
    && (unrestrictedShareAlgId == "UnrestrictedShare")
    && (failClosedGradeAlgId == "FailClosedGrade")
    && (linearPairSwapAlgId == "LinearPairSwap")
    && (runtimeExtractAlgId == "RuntimeExtract")

/-! ### Host use pins (stated map into Slake -- not dual path strings alone)

  Each pin composes existing host defs used by Systems / Slake. Dual-example
  paths stay inventory; use evidence is host HostCompose / Erasure / Mult
  (plus Linear.shareNat only under UnrestrictedShare) that product wire already
  mirrors. Linear.Token / mkToken / consume axioms stay dual-cite on Linear.lean
  -- not folded into joinAlgUseOk (noncomputable; not the HostCompose use path).
-/

/-- Product API name honesty (HOST-EMIT-LINEAR ConsumeToken surface). -/
def productConsumeTokenMintApi : String := "slake_consume_token_mint"

/-- Product API name honesty (erasure runtime-absent). -/
def productErasureRuntimeAbsentApi : String := "slake_erasure_is_runtime_absent"

/-- Product grade name honesty (MULT-OMEGA unrestricted). -/
def productMultOmegaGrade : String := "MULT-OMEGA"

/-- HostCompose mint then consume once succeeds with payload (ConsumeToken use).
    Live-flag model only; not MULT-1 elaborator enforcement. -/
def hostMintConsumeOnceOk : Bool :=
  match HostCompose.mint HostCompose.empty 7 with
  | HostCompose.MintResult.ok hc =>
    match HostCompose.consume hc with
    | HostCompose.ConsumeResult.ok hc' p =>
        (p == 7) && (!hc'.linear.live)
    | HostCompose.ConsumeResult.notLive => false
  | HostCompose.MintResult.badId => false
  | HostCompose.MintResult.alreadyLive => false

/-- consumeTokenHostUseOk -- ConsumeToken used via HostCompose live-flag path.
    Empty LinearHost is not live; mint then consume once returns payload and
    clears live. Product mint API string pin. Does NOT pin Linear.Token /
    mkToken / consume / roundTrip axioms (dual-cite on Linear.lean only;
    noncomputable). Does NOT use Linear.shareNat (that is UnrestrictedShare).
    Greppable: consumeTokenHostUseOk, hostMintConsumeOnceOk, ConsumeToken,
    JOIN-ALG-USE. -/
def consumeTokenHostUseOk : Bool :=
  (!HostCompose.LinearHost.empty.live)
    && hostMintConsumeOnceOk
    && (productConsumeTokenMintApi == "slake_consume_token_mint")

/-- erasedIndexHostUseOk -- ErasedIndex side used via Erasure host module.
    isRuntimeAbsent fail-closed unmarked; mark -> runtime-absent; MULT-0 grade.
    Product erasure API string pin. Greppable: erasedIndexHostUseOk, ErasedIndex. -/
def erasedIndexHostUseOk : Bool :=
  (Erasure.isRuntimeAbsent Erasure.unmarked == false)
    && (Erasure.isRuntimeAbsent (Erasure.mark Erasure.unmarked) == true)
    && (Erasure.isErasureGrade Mult.mult0 == true)
    && (Erasure.checkFailClosed Mult.mult0 (Erasure.mark Erasure.unmarked) == true)
    && (productErasureRuntimeAbsentApi == "slake_erasure_is_runtime_absent")

/-- unrestrictedShareHostUseOk -- UnrestrictedShare via Mult omega + shareNat.
    Mult.name multOmega and Mult.isValid; Linear.shareNat unrestricted sketch
    (shareNat lives only here -- not under consumeTokenHostUseOk).
    Product MULT-OMEGA grade pin. Greppable: unrestrictedShareHostUseOk,
    UnrestrictedShare, MULT-OMEGA. -/
def unrestrictedShareHostUseOk : Bool :=
  (Mult.name Mult.multOmega == "MULT-OMEGA")
    && Mult.isValid Mult.multOmega
    && (Linear.shareNat 3 == 6)
    && (productMultOmegaGrade == "MULT-OMEGA")

/-- Product honesty pin for FAIL-CLOSED-UNKNOWN-GRADE (Mult raw-tag reject). -/
def productFailClosedUnknownGradeId : String := "FAIL-CLOSED-UNKNOWN-GRADE"

/-- failClosedGradeHostUseOk -- FailClosedGrade via Mult.ofNat? / isValidTag.
    Known tags 0/1/2 decode; unknown tags reject (none / false). Typed Mult
    constructors stay valid. Greppable: failClosedGradeHostUseOk, FailClosedGrade,
    FAIL-CLOSED-UNKNOWN-GRADE. -/
def failClosedGradeHostUseOk : Bool :=
  (Mult.ofNat? 0 == some Mult.mult0)
    && (Mult.ofNat? 1 == some Mult.mult1)
    && (Mult.ofNat? 2 == some Mult.multOmega)
    && (Mult.ofNat? 3 == none)
    && (Mult.isValidTag 0 == true)
    && (Mult.isValidTag 3 == false)
    && Mult.isValid Mult.mult0
    && (productFailClosedUnknownGradeId == "FAIL-CLOSED-UNKNOWN-GRADE")

/-- Host honesty: second concurrent mint while already live is rejected.
    Models that HostCompose holds one live MULT-1 token only (pair not yet
    multi-token product wire). Greppable: hostSingleLiveRemintRejectOk. -/
def hostSingleLiveRemintRejectOk : Bool :=
  match HostCompose.mint HostCompose.empty 1 with
  | HostCompose.MintResult.ok hc =>
    match HostCompose.mint hc 2 with
    | HostCompose.MintResult.alreadyLive => true
    | HostCompose.MintResult.ok _ => false
    | HostCompose.MintResult.badId => false
  | HostCompose.MintResult.badId => false
  | HostCompose.MintResult.alreadyLive => false

/-- linearPairSwapHostUseOk -- LinearPairSwap host use is PARTIAL.
    Dual cites two MULT-1 resources; HostCompose is single live-token today.
    Evidence: mint/consume once still works AND remint while live is rejected
    (cannot hold a concurrent pair). Not multi-token product C stages.
    Greppable: linearPairSwapHostUseOk, LinearPairSwap, hostSingleLiveRemintRejectOk. -/
def linearPairSwapHostUseOk : Bool :=
  hostMintConsumeOnceOk
    && hostSingleLiveRemintRejectOk
    && (linearPairSwapAlgId == "LinearPairSwap")

/-- Product honesty pin for freestanding extract claim name. -/
def productRuntimeFsId : String := "RUNTIME-FS"

/-- runtimeExtractHostUseOk -- RuntimeExtract via Extract.RuntimeClaim honesty.
    RUNTIME-FS is freestanding goal; RUNTIME-CLASSIC / EDGE-RUNTIME reject.
    Tag 0/1/2 decode; unknown tag rejects. Does not claim stock hosts freestanding.
    Greppable: runtimeExtractHostUseOk, RuntimeExtract, RUNTIME-FS, RUNTIME-CLASSIC,
    EDGE-RUNTIME. -/
def runtimeExtractHostUseOk : Bool :=
  (Extract.isFreestandingGoal Extract.RuntimeClaim.runtimeFs == true)
    && (Extract.isFreestandingGoal Extract.RuntimeClaim.runtimeClassic == false)
    && (Extract.isFreestandingGoal Extract.RuntimeClaim.edgeRuntime == false)
    && (Extract.RuntimeClaim.name Extract.RuntimeClaim.runtimeFs == "RUNTIME-FS")
    && (Extract.RuntimeClaim.name Extract.RuntimeClaim.runtimeClassic
        == "RUNTIME-CLASSIC")
    && (Extract.RuntimeClaim.name Extract.RuntimeClaim.edgeRuntime == "EDGE-RUNTIME")
    && (Extract.ofRuntimeTag? 0 == some Extract.RuntimeClaim.runtimeFs)
    && (Extract.ofRuntimeTag? 1 == some Extract.RuntimeClaim.runtimeClassic)
    && (Extract.ofRuntimeTag? 3 == none)
    && (Extract.isValidRuntimeTag 0 == true)
    && (Extract.isValidRuntimeTag 3 == false)
    && (productRuntimeFsId == "RUNTIME-FS")
    && (runtimeExtractAlgId == "RuntimeExtract")

/-- joinAlgUseOk -- six dual algorithms have host *use* pins (not path cite only).
    Greppable: joinAlgUseOk, JOIN-ALG-USE, ConsumeToken, ErasedIndex,
    UnrestrictedShare, FailClosedGrade, LinearPairSwap, RuntimeExtract. -/
def joinAlgUseOk : Bool :=
  (joinAlgUseId == "JOIN-ALG-USE")
    && consumeTokenHostUseOk
    && erasedIndexHostUseOk
    && unrestrictedShareHostUseOk
    && failClosedGradeHostUseOk
    && linearPairSwapHostUseOk
    && runtimeExtractHostUseOk

/-- joinAlgContractOk -- JOIN-ALG dual-cite inventory + host use into Slake.
    Surface-level: algorithm ids + dual path cites + host module use pins.
    Does not elaborate dual .idr/.lean sources. Does not enforce MULT-1
    (Linear axioms + HostCompose live flag; classic elaborator gap).
    Greppable: joinAlgContractOk, JOIN-ALG, joinAlgUseOk, joinDualCiteOk. -/
def joinAlgContractOk : Bool :=
  (joinAlgId == "JOIN-ALG")
    && (stageId == "SLAKE_JOIN_MAP_V0")
    && (hostJoinMapId == "HOST-JOIN-MAP")
    && (joinMapId == "JOIN-MAP")
    && joinDualCiteOk
    && joinAlgUseOk

/-- JOIN-MAP readiness verdict (inventory; not product C).
    ok is the overall fail-closed bar used by joinUnitCompileReady. -/
structure Verdict where
  joinOk : Bool
  unitReady : Bool
  ok : Bool
  deriving DecidableEq, Repr

/-- Fail-closed zeroed verdict. -/
def Verdict.failClosed : Verdict := {
  joinOk := false
  unitReady := false
  ok := false
}

/-- joinUnitCompileReady hc -- join-informed unit compile-path bar.
    FAIL-CLOSED: CompilePath.unitCompileReady && joinAlgContractOk.
    Reuses unit bar (extractOkFs + gradeSurfaceOk); no parallel type zoo.
    Does not fold programCompileReady (sibling API).
    Greppable: joinUnitCompileReady, HOST-JOIN-MAP, HOST-COMPILE-PATH. -/
def joinUnitCompileReady (hc : Host) : Bool :=
  CompilePath.unitCompileReady hc && joinAlgContractOk

/-- joinCompileReady hc -- HOST-JOIN-MAP unit bar alias of joinUnitCompileReady.
    Empty HostCompose is OK when unit bar holds (vacuous mult pre-scan).
    Does not emit C. Does not claim freestanding residual free. -/
def joinCompileReady (hc : Host) : Bool :=
  joinUnitCompileReady hc

/-- joinProgramCompileReady p -- join-informed program compile-path bar (sibling).
    FAIL-CLOSED: CompilePath.programCompileReady && joinAlgContractOk.
    EMPTY-PROGRAM-FAIL-CLOSED: empty ordered program is not program-ready
    (distinct from empty HostCompose, which is unit-ready under join map).
    Greppable: joinProgramCompileReady, EMPTY-PROGRAM-FAIL-CLOSED. -/
def joinProgramCompileReady (p : Program) : Bool :=
  CompilePath.programCompileReady p && joinAlgContractOk

/-- verdictOf hc -- inventory Verdict from join map + unit compile readiness.
    ok == joinUnitCompileReady hc. Does not fold program bar. -/
def verdictOf (hc : Host) : Verdict :=
  let joinOk := joinAlgContractOk
  let unitReady := CompilePath.unitCompileReady hc
  {
    joinOk := joinOk
    unitReady := unitReady
    ok := joinOk && unitReady
  }

end SystemsLean.JoinMap
