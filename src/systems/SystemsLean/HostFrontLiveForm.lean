/-
  Module: SystemsLean.HostFrontLiveForm
  Shape: namespace SystemsLean.HostFrontLive with a top-level form.
  SystemsLean.HostFront is none. Every other shape is none.
  The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
-/

import SystemsLean.Scan
import SystemsLean.HostTerm

namespace SystemsLean.HostFrontLiveForm

open SystemsLean.HostTerm
open SystemsLean.Scan

def shape (f : Fact) : Bool :=
  baseOk f && startsWith f.ns "SystemsLean.HostFrontLive" &&
    hasForm f

def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if shape f then witness f else none

def toySrc : String :=
  "namespace SystemsLean.HostFrontLiveBootstrapHonesty\n" ++
  "def kept : Bool := false\n" ++
  "end SystemsLean.HostFrontLiveBootstrapHonesty\n"

def toyFalse : Bool :=
  match parse toySrc with
  | some m =>
    match m.commands with
    | Cmd.namespace _ ::
        Cmd.def_ nm (some HostType.bool) (Term.litBool false) ::
        Cmd.endNamespace _ :: [] =>
      nm.raw == "kept"
    | _ => false
  | none => false

def bareSrc : String :=
  "namespace SystemsLean.HostFront\n" ++
  "def kept : Bool := false\n" ++
  "end SystemsLean.HostFront\n"

def bareNone : Bool :=
  match parse bareSrc with
  | none => true
  | some _ => false

end SystemsLean.HostFrontLiveForm
