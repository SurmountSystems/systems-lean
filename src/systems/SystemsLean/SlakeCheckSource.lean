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
import SystemsLean.HonestyPipelineFront
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
    If that returns none, HonestyPipelineFront reads imports,
    then the written namespace, string and Bool pins, one
    FilePath IO Unit pipeline, filterArgs, and main.
    A false Bool stays false. The file name is not hardcoded.
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
                              match SystemsLean.HonestyPipelineFront.parseHonestyPipelineText
                                  src with
                              | some m => some m
                              | none =>
                                match SystemsLean.HostFront.parseSource src with
                                | SystemsLean.HostFront.FrontResult.accept m => some m
                                | SystemsLean.HostFront.FrontResult.reject _ => none

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
