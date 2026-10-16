/-
  Module: SystemsLean.EdmontonChain
  Edmonton reader chain peeled out of HostFront.
  The one-line dialect stays in HostFront.
  This runs only when that dialect rejects.
  parseMutualForm is last.
  Returns none on every miss.
  The file name is not stored here.
  Does not call Lean.Elab.processCommands.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.EdmontonTypecheckDriver
import SystemsLean.EdmontonLivePin
import SystemsLean.EdmontonLiveCheck
import SystemsLean.EdmontonTheoremOnly
import SystemsLean.EdmontonTheoremMix
import SystemsLean.EdmontonProductForward
import SystemsLean.EdmontonStringBody
import SystemsLean.EdmontonTheoremMain
import SystemsLean.EdmontonClosedBody
import SystemsLean.EdmontonMainClosed
import SystemsLean.EdmontonTwoEnd
import SystemsLean.EdmontonMutualForm

namespace SystemsLean.EdmontonChain

/-- Reader chain. parseMutualForm is last. Returns none on every miss. -/
def parseEdmonton (src : String) : Option SystemsLean.HostTerm.Module :=
  match SystemsLean.EdmontonTypecheckDriver.parseTypecheckDriver src with
  | some m => some m
  | none =>
    match SystemsLean.EdmontonLivePin.parseLivePin src with
    | some m => some m
    | none =>
      match SystemsLean.EdmontonLiveCheck.parseLiveCheck src with
      | some m => some m
      | none =>
        match SystemsLean.EdmontonTheoremOnly.parseTheoremOnly src with
        | some m => some m
        | none =>
          match SystemsLean.EdmontonTheoremMix.parseTheoremMix src with
          | some m => some m
          | none =>
            match SystemsLean.EdmontonProductForward.parseProductForward src with
            | some m => some m
            | none =>
              match SystemsLean.EdmontonStringBody.parseStringBody src with
              | some m => some m
              | none =>
                match SystemsLean.EdmontonTheoremMain.parseTheoremMain src with
                | some m => some m
                | none =>
                  match SystemsLean.EdmontonClosedBody.parseClosedBody src with
                  | some m => some m
                  | none =>
                    match SystemsLean.EdmontonMainClosed.parseMainClosed src with
                    | some m => some m
                    | none =>
                      match SystemsLean.EdmontonTwoEnd.parseTwoEnd src with
                      | some m => some m
                      | none =>
                        SystemsLean.EdmontonMutualForm.parseMutualForm src

end SystemsLean.EdmontonChain
