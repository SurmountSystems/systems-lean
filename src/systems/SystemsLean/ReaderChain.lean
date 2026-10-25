/-
  Module: SystemsLean.ReaderChain
  Form reader chain peeled out of HostFront.
  The one-line dialect stays in HostFront.
  This runs only when that dialect rejects.
  parseMutualForm is last.
  Returns none on every miss.
  The file name is not stored here.
  Does not call Lean.Elab.processCommands.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.TypecheckDriver
import SystemsLean.RawStringCarrier
import SystemsLean.LiveCheck
import SystemsLean.TheoremOnly
import SystemsLean.TheoremMix
import SystemsLean.ProductForward
import SystemsLean.StringBody
import SystemsLean.TheoremMain
import SystemsLean.ClosedBody
import SystemsLean.MainClosed
import SystemsLean.TwoEnd
import SystemsLean.MutualForm

namespace SystemsLean.ReaderChain

/-- Reader chain. parseMutualForm is last. Returns none on every miss. -/
def parseReaderChain (src : String) : Option SystemsLean.HostTerm.Module :=
  match SystemsLean.TypecheckDriver.parseTypecheckDriver src with
  | some m => some m
  | none =>
    match SystemsLean.RawStringCarrier.parseLivePin src with
    | some m => some m
    | none =>
      match SystemsLean.LiveCheck.parseLiveCheck src with
      | some m => some m
      | none =>
        match SystemsLean.TheoremOnly.parseTheoremOnly src with
        | some m => some m
        | none =>
          match SystemsLean.TheoremMix.parseTheoremMix src with
          | some m => some m
          | none =>
            match SystemsLean.ProductForward.parseProductForward src with
            | some m => some m
            | none =>
              match SystemsLean.StringBody.parseStringBody src with
              | some m => some m
              | none =>
                match SystemsLean.TheoremMain.parseTheoremMain src with
                | some m => some m
                | none =>
                  match SystemsLean.ClosedBody.parseClosedBody src with
                  | some m => some m
                  | none =>
                    match SystemsLean.MainClosed.parseMainClosed src with
                    | some m => some m
                    | none =>
                      match SystemsLean.TwoEnd.parseTwoEnd src with
                      | some m => some m
                      | none =>
                        SystemsLean.MutualForm.parseMutualForm src

end SystemsLean.ReaderChain
