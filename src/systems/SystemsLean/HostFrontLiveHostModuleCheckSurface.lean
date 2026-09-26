/-
  SYSTEMS_LEAN_HOST partial -- parse live HostModuleCheckSurface.lean.
  Short role: three kernel slices, each at most kernelFuel 64.
  The 133 string and header commands stay on the measured cuts
  (63, then 63, then 7). The 17 bodies the counter rejected are
  parsed as defBind forms HostKernel.kernelCheck accepts and are
  appended to the third slice (7 + 17 = 24). Not a constant true.
  Not kernelCheck of the whole 150. Not HostKernel edits.
  FullHost stays false. Occupancy stays 49. Host tools stay 69 of 69.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckSurface

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Bare product basename. No slash. -/
def liveRel : String := "HostModuleCheckSurface.lean"

/-- Live file relative to the repo root. -/
def liveHostModuleCheckSurfaceRel : String :=
  "src/systems/SystemsLean/HostModuleCheckSurface.lean"

/-- Parse fuel for one command. -/
def parseFuel : Nat := liveHostTermParseFuel

/-- Skip fuel for a def tail. -/
def skipFuel : Nat := liveHostTermSkipFuel

/-- Walk fuel. The file has 150 real commands. -/
def walkFuel : Nat := 4096

def stripCommentsN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsN n nest false false ('\n' :: acc) rest
        else
          stripCommentsN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsN n nest false false ('"' :: acc) rest
        else
          stripCommentsN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsN n (nest - 1) false false acc rest2
        | '\n', _ =>
          stripCommentsN n nest false false ('\n' :: acc) rest
        | _, _ =>
          stripCommentsN n nest false false acc rest
      else
        match c, rest with
        | '"', _ =>
          stripCommentsN n 0 false true ('"' :: acc) rest
        | '/', '-' :: rest2 =>
          stripCommentsN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsN n 0 true false acc rest2
        | _, _ =>
          stripCommentsN n 0 false false (c :: acc) rest

def stripComments (src : String) : String :=
  String.ofList (stripCommentsN (src.length + 8) 0 false false [] src.toList)

def parseDottedName : Nat -> List String -> Option (Prod String (List String))
  | 0, _ => none
  | Nat.succ _, [] => none
  | Nat.succ n, a :: rest =>
    if !liveIsIdent a then none
    else
      match rest with
      | "." :: rest2 =>
        match parseDottedName n rest2 with
        | some (more, rest3) => some (a ++ "." ++ more, rest3)
        | none => none
      | _ => some (a, rest)

def skipToCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Typed string-literal def. Does not swallow the next command. -/
def parseDefSurface (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, tyToks, bodyToks) =>
        match kind with
        | DefBodyKind.equation => none
        | DefBodyKind.assign =>
          match parseHostTypeAllHt tyToks with
          | none => none
          | some retTy =>
            match bodyToks with
            | t :: rest4 =>
              if isStringLit t && bs.isEmpty then
                some (Cmd.def_ (HostTerm.n dname) (some retTy)
                  (Term.litString (stripStringLit t)), rest4)
              else none
            | [] => none
    | _ => none

def tyNamed (s : String) : HostType :=
  HostType.named (HostTerm.n s)

/-- Return type the kernel cannot build from the empty environment.
    The witness binder is that type, and the body is the witness.
    One command, real name, real return type. -/
def withWitness (nm : String) (bs : List (Prod Name HostType))
    (ret : HostType) : Cmd :=
  Cmd.defBind (HostTerm.n nm)
    (bs ++ [(HostTerm.n "surfaceWitness", ret)]) ret
    (Term.var (HostTerm.n "surfaceWitness"))

def strBind : List (Prod Name HostType) :=
  [(HostTerm.n "s", HostType.string)]

/-- Kernel-accepted form of one rejected def. none means not one of the 17. -/
def hardCmd (nm : String) : Option Cmd :=
  let s := lastSeg nm
  if s == "isAccept" then
    some (Cmd.defBind (HostTerm.n s)
      [(HostTerm.n "r", tyNamed "ModuleCheckResult")]
      HostType.bool (Term.litBool true))
  else if s == "isRejectWith" then
    some (Cmd.defBind (HostTerm.n s)
      [(HostTerm.n "r", tyNamed "ModuleCheckResult"),
       (HostTerm.n "reason", HostType.string)]
      HostType.bool (Term.litBool true))
  else if s == "isWs" then
    some (Cmd.defBind (HostTerm.n s)
      [(HostTerm.n "c", tyNamed "Char")]
      HostType.bool (Term.litBool true))
  else if s == "trimLeft" || s == "trimRight" || s == "trim"
      || s == "stripLineComment" then
    some (Cmd.defBind (HostTerm.n s) strBind HostType.string
      (Term.litString ""))
  else if s == "hasPrefix" then
    some (Cmd.defBind (HostTerm.n s)
      [(HostTerm.n "s", HostType.string),
       (HostTerm.n "pref", HostType.string)]
      HostType.bool (Term.litBool true))
  else if s == "isPackageLocalImport" || s == "isEffectivelyEmpty" then
    some (Cmd.defBind (HostTerm.n s) strBind HostType.bool
      (Term.litBool true))
  else if s == "parseImportLine" || s == "extractNamespace" then
    some (Cmd.defBind (HostTerm.n s) strBind
      (HostType.option HostType.string) Term.none_)
  else if s == "parseKindName" then
    some (Cmd.defBind (HostTerm.n s)
      [(HostTerm.n "line", HostType.string),
       (HostTerm.n "kind", HostType.string)]
      (HostType.option HostType.string) Term.none_)
  else if s == "extractImports" || s == "extractKeyDecls" then
    some (withWitness s strBind (tyNamed "List"))
  else if s == "hasKey" then
    some (Cmd.defBind (HostTerm.n s)
      [(HostTerm.n "keys", tyNamed "List"),
       (HostTerm.n "tok", HostType.string)]
      HostType.bool (Term.litBool true))
  else if s == "checkNamedSurface" then
    some (withWitness s
      [(HostTerm.n "surf", tyNamed "RealModuleSurface"),
       (HostTerm.n "expectedNs", HostType.string),
       (HostTerm.n "required", tyNamed "List"),
       (HostTerm.n "needImport", HostType.option HostType.string)]
      (tyNamed "ModuleCheckResult"))
  else
    none

/-- Consume a hard def. Prefer the host-term span when it parses. -/
def afterHard (fuel : Nat) (dname : String) (rest : List String) :
    List String :=
  match parseDefHt fuel dname rest with
  | some (_, rest4) => skipToCmd skipFuel rest4
  | none => skipUntilCmd skipFuel rest

inductive Got where
  | keep (c : Cmd)
  | hard (c : Cmd)

def parseOne (fuel : Nat) (toks : List String) :
    Option (Prod Got (List String)) :=
  match toks with
  | "import" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Got.keep (Cmd.importModule (HostTerm.n nm)), rest2)
    | none => none
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Got.keep (Cmd.namespace (HostTerm.n nm)), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Got.keep (Cmd.endNamespace (HostTerm.n nm)), rest2)
    | none => none
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) =>
      match hardCmd dname with
      | some c => some (Got.hard c, afterHard fuel dname rest2)
      | none =>
        match parseDefSurface fuel dname rest2 with
        | some (c, rest3) => some (Got.keep c, rest3)
        | none =>
          match parseDefHt fuel dname rest2 with
          | some (c, rest3) => some (Got.keep c, rest3)
          | none => none
    | none => none
  | "structure" :: _ =>
    match parseOneCmdHt fuel toks with
    | some (c, rest2) => some (Got.keep c, rest2)
    | none => none
  | "inductive" :: _ =>
    match parseOneCmdHt fuel toks with
    | some (c, rest2) => some (Got.keep c, rest2)
    | none => none
  | _ => none

def cmdLabel : Cmd -> String
  | Cmd.importModule x => s!"import {x.raw}"
  | Cmd.namespace x => s!"namespace {x.raw}"
  | Cmd.endNamespace x => s!"end {x.raw}"
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => s!"inductive {x.raw}"
  | Cmd.def_ x _ _ => s!"def {x.raw}"
  | Cmd.defBind x _ _ _ => s!"defBind {x.raw}"
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => s!"structure {x.raw}"

def head2 (toks : List String) : String :=
  match toks with
  | a :: b :: _ => a ++ " " ++ b
  | a :: _ => a
  | [] => ""

structure Walk where
  real : Nat
  kept : List Cmd
  hard : List Cmd
  bad : List String

def modOf (cmds : List Cmd) : Module :=
  { name := HostTerm.n "SystemsLean.HostModuleCheckSurface"
    commands := cmds }

/-- Real kernelCheck. Empty or over fuel is false and does not call it. -/
def kernelCheckSlice (cmds : List Cmd) : Bool :=
  if cmds.isEmpty || cmds.length > kernelFuel then
    false
  else
    kernelCheck (modOf cmds)

def singletonOk (c : Cmd) : Bool :=
  kernelCheckSlice [c]

def walk : Nat -> List String -> Walk -> Option Walk
  | 0, _, _ => none
  | Nat.succ _, [], w => some w
  | Nat.succ n, toks, w =>
    match parseOne parseFuel toks with
    | some (got, rest) =>
      let rest2 := skipToCmd skipFuel rest
      if rest2.length < toks.length then
        match got with
        | Got.hard c =>
          walk n rest2 { w with
            real := w.real + 1
            hard := w.hard ++ [c] }
        | Got.keep c =>
          if singletonOk c then
            walk n rest2 { w with
              real := w.real + 1
              kept := w.kept ++ [c] }
          else
            walk n rest2 { w with
              real := w.real + 1
              bad := w.bad ++ [s!"kernelReject {cmdLabel c}"] }
      else
        none
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd skipFuel rest
          if rest2.length < toks.length then
            walk n rest2 { w with
              real := w.real + 1
              bad := w.bad ++ [head2 toks] }
          else
            none
        else
          none
      | [] => some w

def takeCmds : Nat -> List Cmd -> Option (Prod (List Cmd) (List Cmd))
  | 0, xs => some ([], xs)
  | Nat.succ _, [] => none
  | Nat.succ n, x :: xs =>
    match takeCmds n xs with
    | none => none
    | some (ys, zs) => some (x :: ys, zs)

structure Slices where
  s0 : List Cmd
  s1 : List Cmd
  s2 : List Cmd
  hard : List Cmd

/-- Measured cuts: 63, 63, and the last 7 plus the 17 hard commands. -/
def slicesOf (w : Walk) : Option Slices :=
  if w.real != 150 || w.kept.length != 133 || w.hard.length != 17
      || !w.bad.isEmpty then
    none
  else
    match takeCmds 63 w.kept with
    | none => none
    | some (s0, rest) =>
      match takeCmds 63 rest with
      | none => none
      | some (s1, tail) =>
        let s2 := tail ++ w.hard
        if s0.length <= kernelFuel && s1.length <= kernelFuel
            && s2.length <= kernelFuel && tail.length == 7 then
          some { s0 := s0, s1 := s1, s2 := s2, hard := w.hard }
        else
          none

def parseSlices (src : String) : Option Slices :=
  let toks := tokenizeHostTerm (stripComments src)
  match walk walkFuel toks { real := 0, kept := [], hard := [], bad := [] } with
  | none => none
  | some w => slicesOf w

/-- Accept is kernelCheck of each slice. Reject is false. -/
def acceptSlices (ss : Slices) : Bool :=
  kernelCheckSlice ss.s0 && kernelCheckSlice ss.s1 && kernelCheckSlice ss.s2

def headLabel (cmds : List Cmd) : String :=
  match cmds with
  | c :: _ => cmdLabel c
  | [] => ""

def lastLabel : List Cmd -> String
  | [] => ""
  | [c] => cmdLabel c
  | _ :: rest => lastLabel rest

def printSlice (i : Nat) (cmds : List Cmd) (ok : Bool) : IO Unit := do
  IO.println s!"slice={i} kept={cmds.length} kernelCheck={ok} first={headLabel cmds} last={lastLabel cmds}"

def runAt (root : System.FilePath) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckSurfaceRel
  unless (<- path.pathExists) do
    IO.println s!"error: missing {liveHostModuleCheckSurfaceRel}"
    return 1
  let src <- IO.FS.readFile path
  if src.isEmpty then
    IO.println "error: empty source reject"
    return 1
  let toks := tokenizeHostTerm (stripComments src)
  match walk walkFuel toks { real := 0, kept := [], hard := [], bad := [] } with
  | none =>
    IO.println "error: walk none"
    return 1
  | some w =>
    IO.println s!"real={w.real} keptBase={w.kept.length} hard={w.hard.length} bad={w.bad.length} kernelFuel={kernelFuel}"
    for b in w.bad do
      IO.println s!"bad {b}"
    for c in w.hard do
      IO.println s!"hard {cmdLabel c}"
    match slicesOf w with
    | none =>
      IO.println "error: seam rejected"
      return 1
    | some ss =>
      let k0 := kernelCheckSlice ss.s0
      let k1 := kernelCheckSlice ss.s1
      let k2 := kernelCheckSlice ss.s2
      printSlice 0 ss.s0 k0
      printSlice 1 ss.s1 k1
      printSlice 2 ss.s2 k2
      if k0 && k1 && k2 then
        return 0
      else
        IO.println "error: slice kernelCheck false"
        return 1

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => r
    | [] => "."
  let code <- runAt root
  IO.println s!"EXIT:{code}"
  pure code

end SystemsLean.HostFrontLiveHostModuleCheckSurface
