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
  Module: SystemsLean.SlakeCheckSource
  Module must stay ASCII.
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

/-- none when the checker accepts the source.
    some "front reject" when every front returns none.
    some "front reject TOKEN" when the Capable dialect parsed a prefix
    and stopped. TOKEN is the first token not consumed.
    some "kernel reject NAME" when a front yields a module and the
    kernel fails. NAME is the failing command, or ill-formed.
    Does not call Lean.Elab.processCommands.
    A missing object file is not a rejection.
    slakeOwnsPackageTypecheck stays false. -/
def rejectLayer (src : String) : Option String :=
  match readModule src with
  | none =>
    match SystemsLean.HonestyCapable.stoppedToken src with
    | some tok => some ("front reject " ++ tok)
    | none => some "front reject"
  | some m =>
    match SystemsLean.HostKernel.kernelFailAt m with
    | none => none
    | some label => some ("kernel reject " ++ label)

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
