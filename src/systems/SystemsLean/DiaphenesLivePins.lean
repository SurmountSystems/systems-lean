/-
  Module: SystemsLean.DiaphenesLivePins
  One namespace starting with SystemsLean.HostFrontLive.
  An import of SystemsLean.HostKernel is required.
  At least one String literal and one Bool false.
  A raw-string opener is none. IO and theorems are skipped.
  A String body with ++ is skipped. A projection is skipped.
  A false Bool stays false. The module file name is not stored.
  The module name is the namespace text.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.DiaphenesDriverPins

namespace SystemsLean.DiaphenesLivePins

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip SMode)
open SystemsLean.DiaphenesDriverPins
  (hasRawOpen linesOf group foldBlocks emptyPins startsWith)

def livePfx : String := "SystemsLean.HostFrontLive"

def hostKernel : String := "SystemsLean.HostKernel"

def hasKernel : List String -> Bool
  | [] => false
  | m :: rest => m == hostKernel || hasKernel rest

def oneNs : List String -> Option String
  | [m] => some m
  | _ => none

def hasFalse : List (Prod String Bool) -> Bool
  | [] => false
  | (_, v) :: rest => v == false || hasFalse rest

def strCmd (nm lit : String) : Cmd :=
  Cmd.def_ (n nm) (some HostType.string) (Term.litString lit)

def boolCmd (nm : String) (v : Bool) : Cmd :=
  Cmd.def_ (n nm) (some HostType.bool) (Term.litBool v)

def impCmd (m : String) : Cmd :=
  Cmd.importModule (n m)

def mapStr : List (Prod String String) -> List Cmd
  | [] => []
  | (nm, lit) :: rest => strCmd nm lit :: mapStr rest

def mapBool : List (Prod String Bool) -> List Cmd
  | [] => []
  | (nm, v) :: rest => boolCmd nm v :: mapBool rest

def mapImp : List String -> List Cmd
  | [] => []
  | m :: rest => impCmd m :: mapImp rest

def finish
    (imps : List String) (nss : List String)
    (strs : List (Prod String String))
    (bools : List (Prod String Bool)) : Option Module :=
  if !hasKernel imps then
    none
  else
    match oneNs nss with
    | none => none
    | some ns =>
      if !startsWith ns livePfx then
        none
      else
        let ss := strs.reverse
        if ss.isEmpty || !hasFalse bools then
          none
        else
          let cmds :=
            mapImp imps.reverse
              ++ [Cmd.namespace (n ns)]
              ++ mapStr ss
              ++ mapBool bools.reverse
              ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m then some m else none

def parseLive (src : String) : Option Module :=
  if hasRawOpen src.toList then
    none
  else
    match strip src.toList SMode.code [] with
    | none => none
    | some kept =>
      let st := foldBlocks (group (linesOf kept)) emptyPins
      finish st.imps st.nss st.strs st.bools

end SystemsLean.DiaphenesLivePins
