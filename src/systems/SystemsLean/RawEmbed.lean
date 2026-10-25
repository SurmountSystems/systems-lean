/-
  Module: SystemsLean.RawEmbed
  Shape: no import. A depth-0 raw string and a String def.
  Namespace starts with SystemsLean.HostFrontLive and matches end.
  No def main, theorem, example, or Bool literal.
  The file name is not stored. none on every other shape.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.RawEmbed

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def rawPrefix : String := "SystemsLean.HostFrontLive"

def rawOk (sc : TopScan) : Bool :=
  sc.imps.isEmpty && sc.sawRaw && sc.sawStr && sc.strNm != ""
    && sc.sawNs && sc.ns.startsWith rawPrefix
    && sc.sawEnd && sc.endNs == sc.ns
    && !sc.sawMain && !sc.sawThm && !sc.sawEx
    && !sc.sawF && !sc.sawT && sc.closed

/-- Zero-import raw embed under HostFrontLive. none otherwise. -/
def parseRawEmbed (src : String) : Option Module :=
  let sc := scanTop src
  if rawOk sc then
    modOf sc.ns [nsCmd sc.ns, strCmd sc.strNm, endCmd sc.ns]
  else
    none

def rawToy : String :=
  "namespace SystemsLean.HostFrontLiveDemo\n"
  ++ "def src : String := r#\"body\"#\n"
  ++ "end SystemsLean.HostFrontLiveDemo\n"

def rawRejectToy : String :=
  "namespace SystemsLean.EmitApply\n"
  ++ "def src : String := r#\"body\"#\n"
  ++ "end SystemsLean.EmitApply\n"

def rawEmbedAccepts : Bool :=
  match parseRawEmbed rawToy with
  | some m => isWellFormed m && m.commands.length == 3
  | none => false

def rawEmbedRejects : Bool :=
  match parseRawEmbed rawRejectToy with
  | none => true
  | some _ => false

end SystemsLean.RawEmbed
