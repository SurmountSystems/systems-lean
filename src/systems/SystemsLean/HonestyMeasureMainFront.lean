/-
  Module: SystemsLean.HonestyMeasureMainFront
  A namespace of string and Bool defs, then one IO Unit measure,
  then main. No Bool def sits between that measure and main.
  The measure name is the def ident. The file name is not read.
  Prints are IO.println of a quoted string or an s! hole.
  The if condition is a Bool that already reduces true.
  Else is eprintln and throw of a hole-free string.
  The measure term is not Bool true.
  A false Bool stays false.
  A Bool def after the measure is the other measure front.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HonestyFront
import SystemsLean.HonestyCompose
import SystemsLean.HonestyCapable
import SystemsLean.HonestyMeasureFront

namespace SystemsLean.HonestyMeasureMainFront

open SystemsLean.HostTerm
open SystemsLean.HonestyCapable
open SystemsLean.HonestyMeasureFront
open SystemsLean.HonestyFront (strip SMode parseDotted parseFuel)
open SystemsLean.HonestyCompose (tok TMode)

/-- Main follows the measure. A later Bool def is not this tail. -/
def parseTail (ns : String) (defs : List Cmd) (env : CapEnv)
    (ts : List String) : Option Module :=
  match measureHead ts with
  | none => none
  | some (mname, rest) =>
    let allow := allowNames env
    match takePrints parseFuel allow [] rest with
    | none => none
    | some (lines, rest2) =>
      match parseMeasureIf env allow lines rest2 with
      | none => none
      | some bits =>
        match parseMeasureMain mname bits.rest with
        | none => none
        | some rest3 =>
          finish ns (defs ++ [measureCmd bits mname, mainCmd]) rest3

/-- none unless measure is followed by main. The file name is not read. -/
def parseMeasureMainText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok kept TMode.norm [] with
    | none => none
    | some ts =>
      match ts with
      | "namespace" :: rest =>
        match parseDotted parseFuel rest with
        | none => none
        | some (ns, rest2) =>
          match parseDefs parseFuel emptyEnv [] rest2 with
          | none => none
          | some (defs, env, rest3) =>
            if defs.isEmpty then none else parseTail ns defs env rest3
      | _ => none

def toySrc : String :=
  "namespace SystemsLean.Toy\n" ++
  "def stageId : String := \"S\"\n" ++
  "def ok : Bool := (stageId == \"S\")\n" ++
  "def full : Bool := false\n" ++
  "def printIt : IO Unit := do\n" ++
  "  IO.println s!\"== {stageId} ==\"\n" ++
  "  if ok then\n" ++
  "    IO.println \"GREEN\"\n" ++
  "  else\n" ++
  "    IO.eprintln s!\"error: {stageId}\"\n" ++
  "    throw (IO.userError \"ok false\")\n" ++
  "def main (_args : List String) : IO UInt32 := do\n" ++
  "  try\n" ++
  "    printIt\n" ++
  "    pure 0\n" ++
  "  catch e =>\n" ++
  "    IO.eprintln s!\"{e}\"\n" ++
  "    pure 1\n" ++
  "end SystemsLean.Toy\n"

def betweenSrc : String :=
  "namespace SystemsLean.Toy\n" ++
  "def stageId : String := \"S\"\n" ++
  "def ok : Bool := (stageId == \"S\")\n" ++
  "def full : Bool := false\n" ++
  "def printIt : IO Unit := do\n" ++
  "  IO.println s!\"== {stageId} ==\"\n" ++
  "  if ok then\n" ++
  "    IO.println \"GREEN\"\n" ++
  "  else\n" ++
  "    IO.eprintln s!\"error: {stageId}\"\n" ++
  "    throw (IO.userError \"ok false\")\n" ++
  "def later : Bool := true\n" ++
  "def main (_args : List String) : IO UInt32 := do\n" ++
  "  try\n" ++
  "    printIt\n" ++
  "    pure 0\n" ++
  "  catch e =>\n" ++
  "    IO.eprintln s!\"{e}\"\n" ++
  "    pure 1\n" ++
  "end SystemsLean.Toy\n"

def toyAccepts : Bool :=
  match parseMeasureMainText toySrc with
  | some _ => true
  | none => false

def betweenMisses : Bool :=
  match parseMeasureMainText betweenSrc with
  | none => true
  | some _ => false

end SystemsLean.HonestyMeasureMainFront
