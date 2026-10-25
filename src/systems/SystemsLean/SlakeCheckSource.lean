/-
  Slake checker on source text. Not package ownership.
  MultFront.parseMultText reads the SystemsLean/Mult.lean surface.
  HonestyFront.parseHonestyText reads a namespace of string and Bool defs.
  HonestyThmFront.parseHonestyThmText reads `by decide` on that import.
  HonestyCapable.parseCapableText reads the Capable string, Bool, and
  String-field structure dialect, including the two IO defs in Capable.
  A sibling that stops names its first unparsed token on the layer line.
  HostFront.parseSource still reads the one-line dialect.
  None of these fronts is full Lean 4.
  A real SystemsLean/*.lean file may still reject. That reject is a front
  or kernel result. It is not package ownership.
  Does not call Lean.Elab.processCommands.
  A missing object file is not a rejection.
  Does not claim on-disk Slake sources were accepted.
  slakeOwnsPackageTypecheck stays false. FullHost stays false.
  CompilePathTypes takes acceptKeptTypes.
  CompilePathProgram takes acceptKeptProgram.
  CompilePath takes acceptKeptCompilePath.
  CompilePathGraph takes acceptKeptGraph.
  CompilePathExtract takes acceptKeptExtract.
  CompilePathApply takes acceptKeptApply.
  CompilePathBody takes acceptKeptBody.
  CompilePathCompose takes acceptKeptCompose. keptCount is 4.
  CompilePathErasure takes acceptKeptErasure. keptCount stays 4.
  CompilePathMult takes acceptKeptMult. keptCount stays 4.
  CompilePathPlan takes acceptKeptPlan. keptCount stays 4.
  TheoremSurface takes acceptKeptTheoremSurface. keptCount stays 4.
  matrixSurfaceOk_true is not that arm. Accept is addDecl or reject.
  The HostFront String literal def arm takes acceptKeptStringLitDef.
  That arm is not a majority and not package accept. keptCount stays 4.
  OriginalDeclaration.claimSource returns accept only when every def
  is in the literal or name-valued fragment and addDecl took each one.
  Otherwise rejectLayer keeps the arms below. keptCount stays 4.
  Module: SystemsLean.SlakeCheckSource
  Module must stay ASCII.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFront
import SystemsLean.HostKernel
import SystemsLean.HonestyFront
import SystemsLean.HonestyThmFront
import SystemsLean.HonestyCapable
import SystemsLean.ThinMainFront
import SystemsLean.HonestyEqFront
import SystemsLean.HonestyMeasureFront
import SystemsLean.HonestyMeasureMainFront
import SystemsLean.HonestyFullBarFront
import SystemsLean.HonestyReadFront
import SystemsLean.HonestyReadThmFront
import SystemsLean.HonestyPipelineThmFront
import SystemsLean.HonestyStepThmFront
import SystemsLean.HonestyGapThmFront
import SystemsLean.HonestyWriteFront
import SystemsLean.HonestyPipelineFront
import SystemsLean.HonestyLoadFront
import SystemsLean.HonestyCatchFront
import SystemsLean.HonestyVerdictFront
import SystemsLean.HonestyNatClaimFront
import SystemsLean.HonestyStrCatFront
import SystemsLean.HonestyExampleFront
import SystemsLean.HonestyBoolExFront
import SystemsLean.HonestyTrueCatFront
import SystemsLean.HonestyQualFront
import SystemsLean.HonestyDecideFront
import SystemsLean.HonestyGapEqFront
import SystemsLean.HonestyCloseEqFront
import SystemsLean.HonestyParityEqFront
import SystemsLean.HonestyDualResFront
import SystemsLean.HonestyDualResThmFront
import SystemsLean.HonestyEmitApplyFront
import SystemsLean.HonestyEmitScafFront
import SystemsLean.MultFront
import SystemsLean.HostTerm
import SystemsLean.KeptWalk
import SystemsLean.MutualForm
import SystemsLean.KeptHitKernel
import SystemsLean.KeptReject
import SystemsLean.TheoremSurface
import SystemsLean.RejectBeqThm
import SystemsLean.RejectBne
import SystemsLean.RejectMatch
import SystemsLean.RejectIf
import SystemsLean.RejectIte
import SystemsLean.RejectDecideAscription
import SystemsLean.RejectCond
import SystemsLean.RejectDite
import SystemsLean.RejectBif
import SystemsLean.RejectDcond
import SystemsLean.RejectOr
import SystemsLean.RejectAnd
import SystemsLean.RejectNot
import SystemsLean.RejectXor
import SystemsLean.RejectStrictOr
import SystemsLean.RejectStrictAnd
import SystemsLean.RejectBoolBne
import SystemsLean.RejectBoolBeq
import SystemsLean.RejectDecideBang
import SystemsLean.RejectNotPrefix
import SystemsLean.RejectOrInfix
import SystemsLean.RejectAndInfix
import SystemsLean.RejectXorInfix
import SystemsLean.OriginalDeclaration

namespace SystemsLean.SlakeCheckSource

/-- Shared reader for acceptsSource and checkSource.
    Try the Mult front first. It reads the SystemsLean/Mult.lean surface.
    If that returns none, HonestyFront reads string and Bool defs.
    If that returns none, HonestyThmFront reads `by decide`.
    If that returns none, HonestyCapable reads the Capable surface.
    If that returns none, HonestyMeasureFront reads one IO Unit
    measure. The def name is the command. The file name is not read.
    If that returns none, HonestyMeasureMainFront reads that measure
    when main is the next def. No Bool sits between them.
    The file name is not read. A false Bool stays false.
    If that returns none, ThinMainFront reads one import and a
    forwarding main. The imported name is the callee.
    If that returns none, HonestyEqFront reads rfl or by decide
    on a seeded import. The file name is not hardcoded.
    If that returns none, HonestyFullBarFront reads rfl or by
    decide on import SystemsLean.CapableFullBar.
    The file name is not hardcoded.
    If that returns none, HonestyReadFront reads
    namespace SystemsLean.CapableRead. The file name is not
    hardcoded. Full stays false.
    If that returns none, HonestyReadThmFront reads rfl or by
    decide on import SystemsLean.CapableRead.
    The file name is not hardcoded. Full stays false.
    If that returns none, HonestyPipelineThmFront reads rfl or by
    decide on import SystemsLean.CapableRegenerate.
    The file name is not hardcoded. A false Bool stays false.
    If that returns none, HonestyStepThmFront reads rfl or by
    decide on import SystemsLean.CapableStepContract.
    The file name is not hardcoded. A false Bool stays false.
    If that returns none, HonestyGapThmFront reads rfl or by
    decide on import SystemsLean.Capable.
    The file name is not hardcoded. A false Bool stays false.
    If that returns none, HonestyWriteFront reads an import of
    SystemsLean.CapableWriteHcLoad, then the written namespace.
    The import name selects the seed. The file name is not
    hardcoded. A false Bool stays false.
    If that returns none, HonestyPipelineFront reads imports,
    then the written namespace, string and Bool pins, one
    FilePath IO Unit pipeline, filterArgs, and main.
    A false Bool stays false. The file name is not hardcoded.
    If that returns none, HonestyLoadFront reads imports, then
    a namespace, String literal defs, and at least one
    String-field structure. Other defs are skipped.
    A false Bool stays false. The file name is not hardcoded.
    def main is none.
    If that returns none, HonestyCatchFront reads a namespace
    with no import. String defs, one false Bool, and rfl.
    UInt32 is kept for that rfl and is not emitted.
    An IO def is skipped. Bool true is none.
    A false Bool stays false. The file name is not hardcoded.
    If that returns none, HonestyNatClaimFront reads Nat pins,
    one false Bool, and a non-literal Bool. Bool true is none.
    A false Bool stays false. The file name is not hardcoded.
    If that returns none, HonestyStrCatFront reads that same
    Nat-claim shape when the source also has a `++` token.
    String pieces joined by `++` are skipped. Bool true is none.
    A false Bool stays false. The file name is not hardcoded.
    If that returns none, HonestyExampleFront reads that same
    Nat-claim shape when a reduced rfl theorem is absent and
    at least one example is present. Examples are not emitted.
    A theorem `= true` is not emitted as Bool true.
    Bool true is none. A false Bool stays false.
    The file name is not hardcoded.
    If that returns none, HonestyBoolExFront reads that same
    example surface when no Nat literal def is present.
    A Nat literal def is none. Examples are not emitted.
    A false Bool stays false. The file name is not hardcoded.
    If that returns none, HonestyTrueCatFront reads imports,
    string literals joined by `++`, lone Bool true and false,
    and `!` of a stored false. An unreduced chain is not emitted.
    Examples and theorems are not emitted. A Nat literal def
    is none. A false Bool stays false. Bool true is not a
    stand-in. The file name is not hardcoded.
    If that returns none, HonestyQualFront reads imports, a
    String literal or a dotted String name, and lone Bool true
    and false. A dotted name is not emitted. Any other Bool is
    not emitted. `!` of a stored false is noted. A dot is
    required. Examples and theorems are not emitted. A Nat
    literal def is none. A false Bool stays false. Bool true
    is not a stand-in. The file name is not hardcoded.
    If that returns none, HonestyDecideFront reads imports,
    a String literal, and lone Bool true and false. A dotted
    name is not emitted. Any other Bool is not emitted.
    `!` of a stored false is noted. `by decide` is required.
    `native_decide` is none. Examples and theorems are not
    emitted. A Nat literal def is none. A false Bool stays
    false. Bool true is not a stand-in. The file name is
    not hardcoded.
    If that returns none, HonestyGapEqFront reads theorems
    and examples whose import is
    SystemsLean.DualEqWriteCapableGap. An rfl theorem is
    not emitted. An example is not emitted. `by decide`
    emits Bool true only when both sides reduce to the
    same value. A false pin stays false. A lone Bool
    true is not a stand-in. The file name is not hardcoded.
    If that returns none, HonestyCloseEqFront reads theorems
    and examples whose import is
    SystemsLean.DualEqWriteClosePath. An rfl theorem is
    not emitted. An example is not emitted. `by decide`
    emits Bool true only when both sides reduce to the
    same value. A false pin stays false. PartialReady is
    the derived fold, not a stored Bool true. A lone Bool
    true is not a stand-in. The file name is not hardcoded.
    If that returns none, HonestyParityEqFront reads theorems
    and examples whose import is
    SystemsLean.DualEqWriteParity. An rfl theorem is
    not emitted. An example is not emitted. `by decide`
    emits Bool true only when both sides reduce to the
    same value. A false pin stays false. PartialReady is
    the derived fold, not a stored Bool true. A lone Bool
    true is not a stand-in. The file name is not hardcoded.
    If that returns none, HonestyDualResFront reads four
    imports and namespace SystemsLean.DualResidual.
    A fifth import is none. A sibling file is none.
    A false pin stays false. A compare must match the
    stored literal. A chain that names
    ProductPath.productPathCloseReady or
    SelfApplyFs.freestandingProductSelfHostComplete
    is not emitted as Bool true. An alias of that
    chain is not emitted as Bool true. The file name
    is not hardcoded.
    If that returns none, HonestyDualResThmFront reads
    five imports ending in SystemsLean.DualResidual,
    then that namespace. Four imports are none.
    An rfl theorem is not emitted. An example is not
    emitted. `by decide` emits Bool true only when both
    sides reduce to the same value. A false pin stays
    false. The file name is not hardcoded.
    If that returns none, HonestyEmitApplyFront reads four
    imports ending in SystemsLean.EmitApplyScaffold,
    then namespace SystemsLean.EmitApply.
    DualResidual and DualResidualTheorems are none.
    An rfl theorem is not emitted. An example is not
    emitted. `by decide` emits Bool true only when both
    sides reduce to the same true value. A false pin stays
    false. A lone Bool true is not a stand-in.
    The file name is not hardcoded.
    If that returns none, HonestyEmitScafFront reads zero
    imports, then namespace SystemsLean.EmitApply.
    A `++` join selects that scaffold. EmitApply is none.
    emitApplyReady is the && chain, not a lone true.
    The theorem emits Bool true only for that chain.
    An example is not emitted. A false claim stays false.
    The file name is not hardcoded.
    If that returns none, the old front still reads the one-line dialect.
    If every front fails, there is no module.
    No on-disk file is claimed accepted.
    Does not call Lean.Elab.processCommands.
    A missing object file is not a rejection. -/
def readModule (src : String) : Option SystemsLean.HostTerm.Module :=
  match SystemsLean.MultFront.parseMultText src with
  | some m => some m
  | none =>
    match SystemsLean.HonestyFront.parseHonestyText src with
    | some m => some m
    | none =>
      match SystemsLean.HonestyThmFront.parseHonestyThmText src with
      | some m => some m
      | none =>
        match SystemsLean.HonestyCapable.parseCapableText src with
        | some m => some m
        | none =>
          match SystemsLean.HonestyMeasureFront.parseMeasureText src with
          | some m => some m
          | none =>
            match SystemsLean.HonestyMeasureMainFront.parseMeasureMainText src with
            | some m => some m
            | none =>
              match SystemsLean.ThinMainFront.parseThinMain src with
              | some m => some m
              | none =>
                match SystemsLean.HonestyEqFront.parseHonestyEqText src with
                | some m => some m
                | none =>
                  match SystemsLean.HonestyFullBarFront.parseHonestyFullBarText src with
                  | some m => some m
                  | none =>
                    match SystemsLean.HonestyReadFront.parseHonestyReadText src with
                    | some m => some m
                    | none =>
                      match SystemsLean.HonestyReadThmFront.parseHonestyReadThmText src with
                      | some m => some m
                      | none =>
                        match SystemsLean.HonestyPipelineThmFront.parseHonestyPipelineThmText
                            src with
                        | some m => some m
                        | none =>
                          match SystemsLean.HonestyStepThmFront.parseHonestyStepThmText
                              src with
                          | some m => some m
                          | none =>
                            match SystemsLean.HonestyGapThmFront.parseHonestyGapThmText
                                src with
                            | some m => some m
                            | none =>
                              match SystemsLean.HonestyWriteFront.parseHonestyWriteText
                                  src with
                              | some m => some m
                              | none =>
                                match SystemsLean.HonestyPipelineFront.parseHonestyPipelineText
                                    src with
                                | some m => some m
                                | none =>
                                  match SystemsLean.HonestyLoadFront.parseHonestyLoadText
                                      src with
                                  | some m => some m
                                  | none =>
                                    match SystemsLean.HonestyCatchFront.parseHonestyCatchText
                                        src with
                                    | some m => some m
                                    | none =>
                                      match
                                        SystemsLean.HonestyVerdictFront.parseHonestyVerdictText
                                          src with
                                      | some m => some m
                                      | none =>
                                        match
                                          SystemsLean.HonestyNatClaimFront.parseHonestyNatClaimText
                                            src with
                                        | some m => some m
                                        | none =>
                                          match
                                            SystemsLean.HonestyStrCatFront.parseHonestyStrCatText
                                              src with
                                          | some m => some m
                                          | none =>
                                            match
                                             SystemsLean.HonestyExampleFront.parseHonestyExampleText
                                                src with
                                            | some m => some m
                                            | none =>
                                              match
                                               SystemsLean.HonestyBoolExFront.parseHonestyBoolExText
                                                  src with
                                              | some m => some m
                                              | none =>
                                                match
                                             SystemsLean.HonestyTrueCatFront.parseHonestyTrueCatText
                                                    src with
                                                | some m => some m
                                                | none =>
                                                  match
                                             SystemsLean.HonestyQualFront.parseHonestyQualText
                                                    src with
                                                  | some m => some m
                                                  | none =>
                                                    match
                                             SystemsLean.HonestyDecideFront.parseHonestyDecideText
                                                    src with
                                                    | some m => some m
                                                    | none =>
                                                      match
                                             SystemsLean.HonestyGapEqFront.parseHonestyGapEqText
                                                        src with
                                                        | some m => some m
                                                        | none =>
                                                          match
                                             SystemsLean.HonestyCloseEqFront.parseHonestyCloseEqText
                                                            src with
                                                            | some m => some m
                                                            | none =>
                                                              match
                                          SystemsLean.HonestyParityEqFront.parseHonestyParityEqText
                                                                src with
                                                                | some m => some m
                                                                | none =>
                                                                  match
                                             SystemsLean.HonestyDualResFront.parseHonestyDualResText
                                                                    src with
                                                                    | some m => some m
                                                                    | none =>
                                                                    match
                                                                      (
                                       SystemsLean.HonestyDualResThmFront.parseHonestyDualResThmText
                                                                        src) with
                                                                          | some m => some m
                                                                          | none =>
                                                                          match
                                                                      (
                                       SystemsLean.HonestyEmitApplyFront.parseHonestyEmitApplyText
                                                                        src) with
                                                                          | some m => some m
                                                                          | none =>
                                                                          match
                                                                      (
                                         SystemsLean.HonestyEmitScafFront.parseHonestyEmitScafText
                                                                        src) with
                                                                          | some m => some m
                                                                          | none =>
                                                                          match
                                                                      (
                                                                  SystemsLean.HostFront.parseSource
                                                                        src) with
                                                          | SystemsLean.HostFront.FrontResult.accept
                                                                  m =>
                                                                some m
                                                          | SystemsLean.HostFront.FrontResult.reject
                                                                  _ =>
                                                                none

/-- Source text passes Slake's checker when the shared reader yields a
    module and slakeCheckerAccepts that module.
    The Mult front reads the SystemsLean/Mult.lean surface.
    The old front still reads the one-line dialect.
    No on-disk file is claimed accepted.
    Lean.Elab.processCommands is not this path.
    A missing object file is not a rejection. -/
def acceptsSource (src : String) : Prop :=
  match readModule src with
  | some m => SystemsLean.HostKernel.slakeCheckerAccepts m
  | none => False

/- checkSource is the Bool form of rejectLayer.
   none is accept. some is a named layer. That is not package ownership. -/

/-- Kept modules the checker path can keep. CompilePathLinear via
    acceptKept. CompilePathTypes via acceptKeptTypes.
    CompilePathProgram via acceptKeptProgram.
    CompilePath via acceptKeptCompilePath. Count stays 4.
    CompilePathGraph via acceptKeptGraph.
    CompilePathExtract via acceptKeptExtract.
    CompilePathApply via acceptKeptApply.
    CompilePathBody via acceptKeptBody.
    CompilePathCompose via acceptKeptCompose. Count stays 4.
    CompilePathErasure via acceptKeptErasure. Count stays 4.
    CompilePathMult via acceptKeptMult. Count stays 4.
    CompilePathPlan via acceptKeptPlan. Count stays 4.
    TheoremSurface via acceptKeptTheoremSurface. Count stays 4.
    Not package ownership. -/
def keptCount : Nat := 4

/-- CompilePathTypes mint, Bool honesty pair, and decide theorem.
    Not Option Host views. Those views are CompilePathLinear. -/
def typesKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "typesFixtureKindMultOk"
        rightName := "typesFixtureProgramReady" }
      theoremForm := {
        theoremName := "typesFixtureKindMultOk_true"
        proofText := "by decide" }
      linearDef := { defName := "typesFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem typesFixtureKindMultOk_true uses decide.
    native_decide and decide! are not decide. -/
def typesThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "typesFixtureKindMultOk_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Types keep arm. -/
def typesRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathTypes. Mint is Nat.
    Theorem is Bool with decide. Honesty pair is Bool.
    Does not require substring linear. Does not require
    Option Host views. --slake-check reads this arm. -/
def acceptKeptTypes (src : String) : Bool :=
  typesThmHasDecide src && typesRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf typesKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.HostTerm.HostType.bool
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathTypes.lean. Not a comment. -/
def typesKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def typesFixtureMintId : Nat := 5\n" ++
  "def typesFixtureKindMultOk : Bool := true\n" ++
  "def typesFixtureProgramReady : Bool := true\n" ++
  "theorem typesFixtureKindMultOk_true : " ++
  "typesFixtureKindMultOk = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptTypesKeepToy : Bool := acceptKeptTypes typesKeepToy

def rejectTypesHollow : Bool :=
  !acceptKeptTypes SystemsLean.KeptWalk.hollowToy

def rejectTypesComment : Bool :=
  !acceptKeptTypes SystemsLean.KeptWalk.commentToy

def typesKeepPinsOk : Bool :=
  acceptTypesKeepToy && rejectTypesHollow && rejectTypesComment
    && keptCount == 4

/-- CompilePathProgram mint, Bool honesty pair, and decide theorem.
    Not Option Host views. Those views are CompilePathLinear. -/
def programKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "programFixtureFoldOk"
        rightName := "programFixtureProgramReady" }
      theoremForm := {
        theoremName := "programFixtureFoldOk_true"
        proofText := "by decide" }
      linearDef := { defName := "programFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem programFixtureFoldOk_true uses decide.
    native_decide and decide! are not decide. -/
def programThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "programFixtureFoldOk_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Program keep arm. -/
def programRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathProgram. Mint is Nat.
    Theorem is Bool with decide. Honesty pair is Bool.
    Does not require substring linear. Does not require
    Option Host views. --slake-check reads this arm. -/
def acceptKeptProgram (src : String) : Bool :=
  programThmHasDecide src && programRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf programKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.HostTerm.HostType.bool
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathProgram.lean. Not a comment. -/
def programKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def programFixtureMintId : Nat := 6\n" ++
  "def programFixtureFoldOk : Bool := true\n" ++
  "def programFixtureProgramReady : Bool := true\n" ++
  "theorem programFixtureFoldOk_true : " ++
  "programFixtureFoldOk = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptProgramKeepToy : Bool := acceptKeptProgram programKeepToy

def rejectProgramHollow : Bool :=
  !acceptKeptProgram SystemsLean.KeptWalk.hollowToy

def rejectProgramComment : Bool :=
  !acceptKeptProgram SystemsLean.KeptWalk.commentToy

def programKeepPinsOk : Bool :=
  acceptProgramKeepToy && rejectProgramHollow && rejectProgramComment
    && keptCount == 4

/-- CompilePath barrel mint, Option Host live/spent pair, and decide
    theorem. Live aliases lowerCompilePathFixtureCompose.
    Sequential spent consumes live. Not a Bool honesty pair. -/
def compilePathKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "compilePathFixtureLiveView"
        rightName := "compilePathFixtureSpentView" }
      theoremForm := {
        theoremName := "lowerCompilePathFixtureCompose_isSome"
        proofText := "by decide" }
      linearDef := { defName := "compilePathFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem lowerCompilePathFixtureCompose_isSome uses decide.
    native_decide and decide! are not decide. -/
def compilePathThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "lowerCompilePathFixtureCompose_isSome" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the CompilePath keep arm. -/
def compilePathRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePath. Mint is Nat.
    Theorem is Bool with decide. Mutual pair is Option Host.
    Sequential live then spent. Live aliases
    lowerCompilePathFixtureCompose. Does not require substring
    linear. --slake-check reads this arm. -/
def acceptKeptCompilePath (src : String) : Bool :=
  compilePathThmHasDecide src && compilePathRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf compilePathKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.KeptHitKernel.optionHostTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePath.lean. Not a comment. -/
def compilePathKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def compilePathFixtureMintId : Nat := 4\n" ++
  "def lowerCompilePathFixtureCompose : Option Host := none\n" ++
  "def compilePathFixtureLiveView : Option Host := none\n" ++
  "def compilePathFixtureSpentView : Option Host := none\n" ++
  "theorem lowerCompilePathFixtureCompose_isSome : " ++
  "lowerCompilePathFixtureCompose.isSome = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptCompilePathKeepToy : Bool :=
  acceptKeptCompilePath compilePathKeepToy

def rejectCompilePathHollow : Bool :=
  !acceptKeptCompilePath SystemsLean.KeptWalk.hollowToy

def rejectCompilePathComment : Bool :=
  !acceptKeptCompilePath SystemsLean.KeptWalk.commentToy

def compilePathKeepPinsOk : Bool :=
  acceptCompilePathKeepToy && rejectCompilePathHollow
    && rejectCompilePathComment && keptCount == 4

/-- CompilePathGraph mint, Bool honesty pair, and decide theorem.
    Not Option Host views. Those views are CompilePathLinear. -/
def graphKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "graphFixtureGraphReady"
        rightName := "graphFixtureProgramReady" }
      theoremForm := {
        theoremName := "graphFixtureGraphReady_true"
        proofText := "by decide" }
      linearDef := { defName := "graphFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem graphFixtureGraphReady_true uses decide.
    native_decide and decide! are not decide. -/
def graphThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "graphFixtureGraphReady_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Graph keep arm. -/
def graphRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathGraph. Mint is Nat.
    Theorem is Bool with decide. Honesty pair is Bool.
    Does not require substring linear. Does not require
    Option Host views. --slake-check reads this arm. -/
def acceptKeptGraph (src : String) : Bool :=
  graphThmHasDecide src && graphRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf graphKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.HostTerm.HostType.bool
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathGraph.lean. Not a comment. -/
def graphKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def graphFixtureMintId : Nat := 8\n" ++
  "def graphFixtureGraphReady : Bool := true\n" ++
  "def graphFixtureProgramReady : Bool := true\n" ++
  "theorem graphFixtureGraphReady_true : " ++
  "graphFixtureGraphReady = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptGraphKeepToy : Bool := acceptKeptGraph graphKeepToy

def rejectGraphHollow : Bool :=
  !acceptKeptGraph SystemsLean.KeptWalk.hollowToy

def rejectGraphComment : Bool :=
  !acceptKeptGraph SystemsLean.KeptWalk.commentToy

def graphKeepPinsOk : Bool :=
  acceptGraphKeepToy && rejectGraphHollow && rejectGraphComment
    && keptCount == 4

/-- CompilePathExtract mint, Option Host live/spent pair, and decide
    theorem. Live aliases lowerExtractFixtureCompose.
    Sequential spent consumes live. Not a Bool honesty pair. -/
def extractKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "extractFixtureLiveView"
        rightName := "extractFixtureSpentView" }
      theoremForm := {
        theoremName := "extractRuntimeFsGateReady_true"
        proofText := "by decide" }
      linearDef := { defName := "extractFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem extractRuntimeFsGateReady_true uses decide.
    native_decide and decide! are not decide. -/
def extractThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "extractRuntimeFsGateReady_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Extract keep arm. -/
def extractRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathExtract. Mint is Nat.
    Theorem is Bool with decide. Mutual pair is Option Host.
    Sequential live then spent. Live aliases
    lowerExtractFixtureCompose. Does not require substring
    linear. --slake-check reads this arm. -/
def acceptKeptExtract (src : String) : Bool :=
  extractThmHasDecide src && extractRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf extractKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.KeptHitKernel.optionHostTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathExtract.lean. Not a comment. -/
def extractKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def extractFixtureMintId : Nat := 13\n" ++
  "def lowerExtractFixtureCompose : Option Host := none\n" ++
  "def extractFixtureLiveView : Option Host := none\n" ++
  "def extractFixtureSpentView : Option Host := none\n" ++
  "theorem extractRuntimeFsGateReady_true : " ++
  "extractRuntimeFsGateReady = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptExtractKeepToy : Bool := acceptKeptExtract extractKeepToy

def rejectExtractHollow : Bool :=
  !acceptKeptExtract SystemsLean.KeptWalk.hollowToy

def rejectExtractComment : Bool :=
  !acceptKeptExtract SystemsLean.KeptWalk.commentToy

def extractKeepPinsOk : Bool :=
  acceptExtractKeepToy && rejectExtractHollow && rejectExtractComment
    && keptCount == 4

/-- CompilePathApply mint, mutual live/spent Option Host pair,
    and decide theorem. Mint is applyFixtureMintId. -/
def applyKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "applyFixtureLiveView"
        rightName := "applyFixtureSpentView" }
      theoremForm := {
        theoremName := "applyFixtureApplyOk_true"
        proofText := "by decide" }
      linearDef := { defName := "applyFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem applyFixtureApplyOk_true uses decide.
    native_decide and decide! are not decide. -/
def applyThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "applyFixtureApplyOk_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Apply keep arm. -/
def applyRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathApply. Mint is Nat.
    Theorem is Bool with decide. Mutual pair is Option Host.
    Does not require substring linear. --slake-check reads this arm. -/
def acceptKeptApply (src : String) : Bool :=
  applyThmHasDecide src && applyRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf applyKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.KeptHitKernel.optionHostTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathApply.lean. Not a comment. -/
def applyKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def applyFixtureMintId : Nat := 11\n" ++
  "def applyFixtureLiveView : Option Host := none\n" ++
  "def applyFixtureSpentView : Option Host := none\n" ++
  "theorem applyFixtureApplyOk_true : " ++
  "applyFixtureApplyOk = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptApplyKeepToy : Bool := acceptKeptApply applyKeepToy

def rejectApplyHollow : Bool :=
  !acceptKeptApply SystemsLean.KeptWalk.hollowToy

def rejectApplyComment : Bool :=
  !acceptKeptApply SystemsLean.KeptWalk.commentToy

def applyKeepPinsOk : Bool :=
  acceptApplyKeepToy && rejectApplyHollow && rejectApplyComment
    && keptCount == 4

/-- CompilePathBody mint, mutual live/spent Option Host pair,
    and decide theorem. Mint is bodyFixtureMintId. -/
def bodyKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "bodyFixtureLiveView"
        rightName := "bodyFixtureSpentView" }
      theoremForm := {
        theoremName := "bodyFixtureComposeReady_true"
        proofText := "by decide" }
      linearDef := { defName := "bodyFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem bodyFixtureComposeReady_true uses decide.
    native_decide and decide! are not decide. -/
def bodyThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "bodyFixtureComposeReady_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Body keep arm. -/
def bodyRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathBody. Mint is Nat.
    Theorem is Bool with decide. Mutual pair is Option Host.
    Does not require substring linear. --slake-check reads this arm. -/
def acceptKeptBody (src : String) : Bool :=
  bodyThmHasDecide src && bodyRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf bodyKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.KeptHitKernel.optionHostTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathBody.lean. Not a comment. -/
def bodyKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def bodyFixtureMintId : Nat := 12\n" ++
  "def bodyFixtureLiveView : Option Host := none\n" ++
  "def bodyFixtureSpentView : Option Host := none\n" ++
  "theorem bodyFixtureComposeReady_true : " ++
  "bodyFixtureComposeReady = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptBodyKeepToy : Bool := acceptKeptBody bodyKeepToy

def rejectBodyHollow : Bool :=
  !acceptKeptBody SystemsLean.KeptWalk.hollowToy

def rejectBodyComment : Bool :=
  !acceptKeptBody SystemsLean.KeptWalk.commentToy

def bodyKeepPinsOk : Bool :=
  acceptBodyKeepToy && rejectBodyHollow && rejectBodyComment
    && keptCount == 4

/-- CompilePathCompose mint, mutual live/spent Option Host pair,
    and decide theorem. Mint is composeFixtureMintId. -/
def composeKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "composeFixtureLiveView"
        rightName := "composeFixtureSpentView" }
      theoremForm := {
        theoremName := "composeFixtureComposeReady_true"
        proofText := "by decide" }
      linearDef := { defName := "composeFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem composeFixtureComposeReady_true uses decide.
    native_decide and decide! are not decide. -/
def composeThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "composeFixtureComposeReady_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Compose keep arm. -/
def composeRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathCompose. Mint is Nat.
    Theorem is Bool with decide. Mutual pair is Option Host.
    Does not require substring linear. --slake-check reads this arm. -/
def acceptKeptCompose (src : String) : Bool :=
  composeThmHasDecide src && composeRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf composeKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.KeptHitKernel.optionHostTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathCompose.lean. Not a comment. -/
def composeKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def composeFixtureMintId : Nat := 9\n" ++
  "def composeFixtureLiveView : Option Host := none\n" ++
  "def composeFixtureSpentView : Option Host := none\n" ++
  "theorem composeFixtureComposeReady_true : " ++
  "composeFixtureComposeReady = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptComposeKeepToy : Bool := acceptKeptCompose composeKeepToy

def rejectComposeHollow : Bool :=
  !acceptKeptCompose SystemsLean.KeptWalk.hollowToy

def rejectComposeComment : Bool :=
  !acceptKeptCompose SystemsLean.KeptWalk.commentToy

def composeKeepPinsOk : Bool :=
  acceptComposeKeepToy && rejectComposeHollow && rejectComposeComment
    && keptCount == 4

/-- CompilePathErasure sequential live/spent Option Host pair,
    and decide theorem. Erasure has no mint identifier.
    Nat ascription is erasureFixtureTagErased, the existing type tag. -/
def erasureKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "erasureFixtureLiveView"
        rightName := "erasureFixtureSpentView" }
      theoremForm := {
        theoremName := "erasureFixtureComposeReady_true"
        proofText := "by decide" }
      linearDef := { defName := "erasureFixtureTagErased" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem erasureFixtureComposeReady_true uses decide.
    native_decide and decide! are not decide. -/
def erasureThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "erasureFixtureComposeReady_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Erasure keep arm. -/
def erasureRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathErasure. No mint identifier.
    Theorem is Bool with decide. Mutual pair is Option Host.
    Nat ascription is the existing type tag, not a mint.
    Does not require substring linear. --slake-check reads this arm. -/
def acceptKeptErasure (src : String) : Bool :=
  erasureThmHasDecide src && erasureRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf erasureKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.KeptHitKernel.optionHostTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathErasure.lean. Not a comment. -/
def erasureKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def erasureFixtureTagErased : Nat := 0\n" ++
  "def erasureFixtureLiveView : Option Host := none\n" ++
  "def erasureFixtureSpentView : Option Host := none\n" ++
  "theorem erasureFixtureComposeReady_true : " ++
  "erasureFixtureComposeReady = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptErasureKeepToy : Bool := acceptKeptErasure erasureKeepToy

def rejectErasureHollow : Bool :=
  !acceptKeptErasure SystemsLean.KeptWalk.hollowToy

def rejectErasureComment : Bool :=
  !acceptKeptErasure SystemsLean.KeptWalk.commentToy

def erasureKeepPinsOk : Bool :=
  acceptErasureKeepToy && rejectErasureHollow && rejectErasureComment
    && keptCount == 4

/-- CompilePathMult mint, sequential live/spent Option Host pair,
    and decide theorem. Mint is multFixtureMintId. -/
def multKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "multFixtureLiveView"
        rightName := "multFixtureSpentView" }
      theoremForm := {
        theoremName := "multFixtureComposeReady_true"
        proofText := "by decide" }
      linearDef := { defName := "multFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem multFixtureComposeReady_true uses decide.
    native_decide and decide! are not decide. -/
def multThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "multFixtureComposeReady_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Mult keep arm. -/
def multRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathMult. Mint is Nat.
    Theorem is Bool with decide. Mutual pair is Option Host.
    Sequential live then spent. Does not require substring linear.
    --slake-check reads this arm. -/
def acceptKeptMult (src : String) : Bool :=
  multThmHasDecide src && multRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf multKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.KeptHitKernel.optionHostTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathMult.lean. Not a comment. -/
def multKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def multFixtureMintId : Nat := 4\n" ++
  "def multFixtureLiveView : Option Host := none\n" ++
  "def multFixtureSpentView : Option Host := none\n" ++
  "theorem multFixtureComposeReady_true : " ++
  "multFixtureComposeReady = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptMultKeepToy : Bool := acceptKeptMult multKeepToy

def rejectMultHollow : Bool :=
  !acceptKeptMult SystemsLean.KeptWalk.hollowToy

def rejectMultComment : Bool :=
  !acceptKeptMult SystemsLean.KeptWalk.commentToy

def multKeepPinsOk : Bool :=
  acceptMultKeepToy && rejectMultHollow && rejectMultComment
    && keptCount == 4

/-- CompilePathPlan mint, sequential live/spent Option Host pair,
    and decide theorem. Mint is planFixtureMintId. -/
def planKeptHit : SystemsLean.KeptWalk.KeptHit :=
  { triple := {
      mutualForm := {
        leftName := "planFixtureLiveView"
        rightName := "planFixtureSpentView" }
      theoremForm := {
        theoremName := "planFixtureComposeReady_true"
        proofText := "by decide" }
      linearDef := { defName := "planFixtureMintId" } }
    tactic := { tacticName := "decide" } }

/-- True when theorem planFixtureComposeReady_true uses decide.
    native_decide and decide! are not decide. -/
def planThmHasDecide (src : String) : Bool :=
  go (src.splitOn "\n")
where
  go (lines : List String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      let t := SystemsLean.KeptWalk.skipMods 8
        (SystemsLean.MutualForm.trim
          (SystemsLean.MutualForm.stripCR line))
      if SystemsLean.MutualForm.startsWord t "theorem" then
        let body := SystemsLean.KeptWalk.dropWord t "theorem"
        let nm := SystemsLean.KeptWalk.firstIdent body
        if nm == "planFixtureComposeReady_true" then
          match SystemsLean.KeptWalk.takeBy body with
          | some "decide" => true
          | _ => false
        else go rest
      else go rest

/-- Fail-closed dest toys stay rejects on the Plan keep arm. -/
def planRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of SystemsLean.CompilePathPlan. Mint is Nat.
    Theorem is Bool with decide. Mutual pair is Option Host.
    Sequential live then spent. Does not require substring linear.
    --slake-check reads this arm. -/
def acceptKeptPlan (src : String) : Bool :=
  planThmHasDecide src && planRejectClosed src
    && match SystemsLean.KeptHitKernel.typesOf planKeptHit src with
       | none => false
       | some ty =>
         SystemsLean.KeptHitKernel.hostTypeEq ty.thmTy
           SystemsLean.HostTerm.HostType.bool
           && SystemsLean.HostTerm.hostTypeOk ty.leftTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             ty.rightTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.leftTy
             SystemsLean.KeptHitKernel.optionHostTy
           && SystemsLean.KeptHitKernel.hostTypeEq ty.linTy
             SystemsLean.HostTerm.HostType.nat

/-- Forms that exist on CompilePathPlan.lean. Not a comment. -/
def planKeepToy : String :=
  "namespace SystemsLean.CompilePath\n" ++
  "def planFixtureMintId : Nat := 10\n" ++
  "def planFixtureLiveView : Option Host := none\n" ++
  "def planFixtureSpentView : Option Host := none\n" ++
  "theorem planFixtureComposeReady_true : " ++
  "planFixtureComposeReady = true := by decide\n" ++
  "end SystemsLean.CompilePath\n"

def acceptPlanKeepToy : Bool := acceptKeptPlan planKeepToy

def rejectPlanHollow : Bool :=
  !acceptKeptPlan SystemsLean.KeptWalk.hollowToy

def rejectPlanComment : Bool :=
  !acceptKeptPlan SystemsLean.KeptWalk.commentToy

def planKeepPinsOk : Bool :=
  acceptPlanKeepToy && rejectPlanHollow && rejectPlanComment
    && keptCount == 4

/-- Fail-closed dest toys stay rejects on the TheoremSurface keep arm. -/
def theoremSurfaceRejectClosed (src : String) : Bool :=
  !SystemsLean.RejectBeqThm.rejects src
    && !SystemsLean.RejectBne.rejects src
    && !SystemsLean.RejectMatch.rejects src
    && !SystemsLean.RejectIf.rejects src
    && !SystemsLean.RejectIte.rejects src
    && !SystemsLean.RejectDecideAscription.rejects src
    && !SystemsLean.RejectCond.rejects src
    && !SystemsLean.RejectDite.rejects src
    && !SystemsLean.RejectBif.rejects src
    && !SystemsLean.RejectDcond.rejects src
    && !SystemsLean.RejectOr.rejects src
    && !SystemsLean.RejectAnd.rejects src
    && !SystemsLean.RejectNot.rejects src
    && !SystemsLean.RejectXor.rejects src
    && !SystemsLean.RejectStrictOr.rejects src
    && !SystemsLean.RejectStrictAnd.rejects src
    && !SystemsLean.RejectBoolBne.rejects src
    && !SystemsLean.RejectBoolBeq.rejects src
    && !SystemsLean.RejectDecideBang.rejects src
    && !SystemsLean.RejectNotPrefix.rejects src
    && !SystemsLean.RejectOrInfix.rejects src
    && !SystemsLean.RejectAndInfix.rejects src
    && !SystemsLean.RejectXorInfix.rejects src

/-- Typed keep of a TheoremSurface module. Namespace, at least one
    theorem, no main, no structure, and no literal Bool or String
    def. TopScan.cmdsOf emits imports, namespace, and end. Theorems
    stay on TheoremSurface.parseTheoremSurface. Not a typed KeptHit.
    Not a mint. Not Option Host views. Does not require substring
    linear. --slake-check reads this arm. -/
def acceptKeptTheoremSurface (src : String) : Bool :=
  theoremSurfaceRejectClosed src
    && match SystemsLean.TheoremSurface.parseTheoremSurface src with
       | none => false
       | some _ => true

/-- Forms that exist on SurfaceMatrixTheorems.lean. Not a comment.
    The import is the one that file writes, so addDecl can see
    `matrixSurfaceOk`. The theorem words are the original line.
    checkSource does not accept this through acceptKeptTheoremSurface. -/
def theoremSurfaceKeepToy : String :=
  "import SystemsLean.SurfaceMatrix\n" ++
  "namespace SystemsLean.SurfaceMatrix\n" ++
  "theorem matrixSurfaceOk_true : " ++
  "matrixSurfaceOk = true := by decide\n" ++
  "end SystemsLean.SurfaceMatrix\n"

def acceptTheoremSurfaceKeepToy : Bool :=
  acceptKeptTheoremSurface theoremSurfaceKeepToy

def rejectTheoremSurfaceHollow : Bool :=
  !acceptKeptTheoremSurface SystemsLean.KeptWalk.hollowToy

def rejectTheoremSurfaceComment : Bool :=
  !acceptKeptTheoremSurface SystemsLean.KeptWalk.commentToy

def theoremSurfaceKeepPinsOk : Bool :=
  acceptTheoremSurfaceKeepToy && rejectTheoremSurfaceHollow
    && rejectTheoremSurfaceComment && keptCount == 4

/-- First declaration after preamble. A non-preamble line stops the
    walk and its tokens go to hkStringLitDef. Preamble may continue:
    blank lines, the comment stepper, import, open, private, example,
    and a namespace line whose name is an ident. hkCont does not skip
    a declaration. True only when that line is one double-quoted
    String def. Bool true does not match. Not every source. Not the
    type-token String bucket. Not a majority. Not package accept.
    keptCount stays 4. -/
def acceptKeptStringLitDef (src : String) : Bool :=
  let rec step (blk : Bool) (dash : Bool) (str : Bool) (esc : Bool)
      (acc : List Char) : List Char -> Prod String Bool
    | [] => (String.ofList acc.reverse, blk)
    | c :: rest =>
      if blk then
        if dash && c == '/' then
          step false false false false acc rest
        else if c == '-' then
          step true true false false acc rest
        else
          step true false false false acc rest
      else if esc then
        step false false true false (c :: acc) rest
      else if str && c == '\\' then
        step false false true true acc rest
      else if str && c == '"' then
        step false false false false ('"' :: acc) rest
      else if str then
        step false false true false (c :: acc) rest
      else if c == '-' &&
          (match rest with | '-' :: _ => true | _ => false) then
        (String.ofList acc.reverse, false)
      else if c == '/' &&
          (match rest with | '-' :: _ => true | _ => false) then
        match rest with
        | '-' :: rest2 => step true false false false acc rest2
        | _ => (String.ofList acc.reverse, true)
      else if c == '"' then
        step false false true false ('"' :: acc) rest
      else
        step false false false false (c :: acc) rest
  let rec walk (blk : Bool) : List String -> Bool
    | [] => false
    | line :: rest =>
      match step blk false false false [] line.toList with
      | (code, blkNext) =>
        let toks := SystemsLean.HostFront.lineTokens code
        if toks.isEmpty then walk blkNext rest
        else
          match toks with
          | "import" :: _ => walk blkNext rest
          | "open" :: _ => walk blkNext rest
          | "private" :: _ => walk blkNext rest
          | "example" :: _ => walk blkNext rest
          | "namespace" :: name :: [] =>
            if SystemsLean.HostFront.isIdent name then
              walk blkNext rest
            else false
          | _ =>
            SystemsLean.HostFront.hkStringLitDef toks
  walk false (src.splitOn "\n")

/-- none when the checker accepts the source.
    some "front reject" when every front returns none.
    some "front reject TOKEN" when the Capable dialect parsed a prefix
    and stopped. TOKEN is the first token not consumed.
    some "kernel reject NAME" when a front yields a module and the
    kernel fails. NAME is the failing command, or ill-formed.
    some "kept reject" when a kept-walk hit fails acceptKept and
    kernelFailAt is none. Matching Nat views take that path.
    A typed KeptHit walk is a pass: Bool or Prop theorem, decide,
    matching Option Host mutual views, and a linear Nat mint def.
    CompilePathLinear still takes the acceptKept arm.
    CompilePathTypes takes the acceptKeptTypes arm.
    CompilePathProgram takes the acceptKeptProgram arm.
    CompilePath takes the acceptKeptCompilePath arm. Count stays 4.
    CompilePathGraph takes the acceptKeptGraph arm.
    CompilePathExtract takes the acceptKeptExtract arm.
    CompilePathApply takes the acceptKeptApply arm.
    CompilePathBody takes the acceptKeptBody arm.
    CompilePathCompose takes the acceptKeptCompose arm. Count stays 4.
    CompilePathErasure takes the acceptKeptErasure arm. Count stays 4.
    CompilePathMult takes the acceptKeptMult arm. Count stays 4.
    CompilePathPlan takes the acceptKeptPlan arm. Count stays 4.
    TheoremSurface takes the acceptKeptTheoremSurface arm. Count stays 4.
    The HostFront String literal def takes the acceptKeptStringLitDef arm.
    A preamble import may precede that declaration. Count stays 4.
    That pass is not a majority and not package accept.
    That pass does not call kernelFailAt on an untyped Cmd.def_.
    Hollow namespace and end is not that pass.
    Missing any of the four is not that pass.
    Does not call Lean.Elab.processCommands.
    A missing object file is not a rejection.
    slakeOwnsPackageTypecheck stays false.
    Previous arms. OriginalDeclaration unclaimed and notAccepted
    fall through here unchanged, except a source that contains
    `theorem matrixSurfaceOk_true`. That source is not accepted here. -/
def rejectLayerChain (src : String) : Option String :=
  if SystemsLean.OriginalDeclaration.matrixSurfaceOkTrueFound src then
    some "kernel reject matrixSurfaceOk_true"
  else if SystemsLean.KeptHitKernel.acceptKept src then none
  else if acceptKeptTypes src then none
  else if acceptKeptProgram src then none
  else if acceptKeptCompilePath src then none
  else if acceptKeptGraph src then none
  else if acceptKeptExtract src then none
  else if acceptKeptApply src then none
  else if acceptKeptBody src then none
  else if acceptKeptCompose src then none
  else if acceptKeptErasure src then none
  else if acceptKeptMult src then none
  else if acceptKeptPlan src then none
  else if acceptKeptTheoremSurface src then none
  else if acceptKeptStringLitDef src then none
  else
    match readModule src with
    | none =>
      match SystemsLean.HonestyCapable.stoppedToken src with
      | some tok => some ("front reject " ++ tok)
      | none => some "front reject"
    | some m =>
      match SystemsLean.HostKernel.kernelFailAt m with
      | none => SystemsLean.KeptReject.afterKept src none
      | some label => SystemsLean.KeptReject.afterKept src
          (some label)

/-- none only when OriginalDeclaration.claimSource is accept.
    That requires every def in the fragment, importModules loaded,
    and addDecl returning no exception once per def.
    For `matrixSurfaceOk_true`, accept is addDecl of type
    `matrixSurfaceOk = true` and value `Eq.refl`, and no other
    declaration in that source. notAccepted does not fall through.
    unclaimed and other notAccepted fall through to rejectLayerChain.
    A set_option line does not accept the file by itself.
    A file whose code contains := do stays unclaimed when any
    statement in that do-block is not translated. A translated
    IrGraph main is accept only after addDecl.
    Does not call Lean.Elab.processCommands. -/
def rejectLayer (src : String) : Option String :=
  match SystemsLean.OriginalDeclaration.claimSource src with
  | .accept => none
  | .unclaimed => rejectLayerChain src
  | .notAccepted =>
    if SystemsLean.OriginalDeclaration.matrixSurfaceOkTrueFound src then
      some "kernel reject matrixSurfaceOk_true"
    else
      rejectLayerChain src

/-- Shared reader, then HostKernel.slakeChecker.
    The Mult front reads the SystemsLean/Mult.lean surface.
    The old front still reads the one-line dialect.
    No on-disk file is claimed accepted.
    Does not call Lean.Elab.processCommands.
    A missing object file is not a rejection. -/
def checkSource (src : String) : Bool :=
  match rejectLayer src with
  | none => true
  | some _ => false

end SystemsLean.SlakeCheckSource
