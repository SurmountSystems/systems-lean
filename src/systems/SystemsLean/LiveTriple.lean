/-
  Module: SystemsLean.LiveTriple
  Shape: three imports, then one namespace.
  First import is SystemsLean.HostFrontLiveHostTerm.
  Middle import ends with Source. Third is SystemsLean.HostKernel.
  Depth-0 forms: a String def, Bool false, Bool true, and def main.
  No theorem, example, or mutual. The namespace matches end.
  The file name is not stored. Selection uses imports, namespace, and forms.
  A false Bool is emitted as litBool false. A true Bool stays true.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm

namespace SystemsLean.LiveTriple

open SystemsLean.HostTerm

def liveTerm : String := "SystemsLean.HostFrontLiveHostTerm"

def hostKernel : String := "SystemsLean.HostKernel"

def letter (c : Char) : Bool :=
  ('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z') || c == '_'

def identChar (c : Char) : Bool :=
  letter c || ('0' <= c && c <= '9') || c == '\'' || c == '?'

def plainIdent (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: cs => letter c && cs.all identChar

def dottedOk (s : String) : Bool :=
  !(s.startsWith ".")
    && !(s.endsWith ".")
    && (s.splitOn ".").all plainIdent

def dropChars : Nat -> List Char -> List Char
  | 0, cs => cs
  | _, [] => []
  | Nat.succ k, _ :: rest => dropChars k rest

def trimL : List Char -> List Char
  | ' ' :: r => trimL r
  | '\t' :: r => trimL r
  | cs => cs

def trim (s : String) : String :=
  let a := trimL s.toList
  String.mk (trimL a.reverse).reverse

def words (s : String) : List String :=
  go ((trim s).splitOn " ")
where
  go
    | [] => []
    | "" :: r => go r
    | w :: r => w :: go r

def hasW (w : String) : List String -> Bool
  | [] => false
  | x :: r => x == w || hasW w r

def defName (left : String) : Option String :=
  let ws := words left
  match ws.reverse with
  | nm :: _ => if hasW "def" ws && plainIdent nm then some nm else none
  | [] => none

def twoParts (sep line : String) : Option (Prod String String) :=
  match line.splitOn sep with
  | a :: b :: [] => some (a, b)
  | _ => none

structure TopScan where
  imps : List String
  ns : String
  sawNs : Bool
  endNs : String
  sawEnd : Bool
  sawStr : Bool
  strNm : String
  sawF : Bool
  fNm : String
  sawT : Bool
  tNm : String
  sawMain : Bool
  sawThm : Bool
  sawEx : Bool
  sawMut : Bool
  sawRaw : Bool
  sawStruct : Bool
  sawInd : Bool
  closed : Bool

def emptyScan : TopScan :=
  { imps := []
  , ns := ""
  , sawNs := false
  , endNs := ""
  , sawEnd := false
  , sawStr := false
  , strNm := ""
  , sawF := false
  , fNm := ""
  , sawT := false
  , tNm := ""
  , sawMain := false
  , sawThm := false
  , sawEx := false
  , sawMut := false
  , sawRaw := false
  , sawStruct := false
  , sawInd := false
  , closed := false }

def noteImp (line : String) (sc : TopScan) : TopScan :=
  if line.startsWith "import " then
    let nm := trim (String.mk (dropChars 7 line.toList))
    if dottedOk nm then { sc with imps := nm :: sc.imps } else sc
  else
    sc

def noteNs (line : String) (sc : TopScan) : TopScan :=
  if sc.sawNs then
    sc
  else if line.startsWith "namespace " then
    let nm := trim (String.mk (dropChars 10 line.toList))
    if dottedOk nm then { sc with ns := nm, sawNs := true } else sc
  else
    sc

def noteEnd (line : String) (sc : TopScan) : TopScan :=
  if line.startsWith "end " then
    let nm := trim (String.mk (dropChars 4 line.toList))
    if dottedOk nm then { sc with endNs := nm, sawEnd := true } else sc
  else
    sc

def noteForm (line : String) (sc : TopScan) : TopScan :=
  match words line with
  | "theorem" :: _ => { sc with sawThm := true }
  | "example" :: _ => { sc with sawEx := true }
  | "mutual" :: _ => { sc with sawMut := true }
  | "structure" :: _ => { sc with sawStruct := true }
  | "inductive" :: _ => { sc with sawInd := true }
  | "private" :: "theorem" :: _ => { sc with sawThm := true }
  | "private" :: "example" :: _ => { sc with sawEx := true }
  | "protected" :: "theorem" :: _ => { sc with sawThm := true }
  | _ => sc

def noteStr (line : String) (sc : TopScan) : TopScan :=
  if sc.sawStr then
    sc
  else
    match twoParts " : String :=" line with
    | some (left, _) =>
      match defName left with
      | some nm => { sc with sawStr := true, strNm := nm }
      | none => sc
    | none => sc

def noteBool (line : String) (sc : TopScan) : TopScan :=
  match twoParts " : Bool :=" line with
  | none => sc
  | some (left, rhs) =>
    match defName left with
    | none => sc
    | some nm =>
      let r := trim rhs
      if r == "false" && !sc.sawF then
        { sc with sawF := true, fNm := nm }
      else if r == "true" && !sc.sawT then
        { sc with sawT := true, tNm := nm }
      else
        sc

def noteMain (line : String) (sc : TopScan) : TopScan :=
  if sc.sawMain then
    sc
  else if line == "def main" || line.startsWith "def main "
      || line.startsWith "def main:" then
    { sc with sawMain := true }
  else
    sc

def noteLine (line : String) (sc : TopScan) : TopScan :=
  let a := noteImp line sc
  let b := noteNs line a
  let c := noteEnd line b
  let d := noteForm line c
  let e := noteStr line d
  let f := noteBool line e
  noteMain line f

def commit (buf : List Char) (sc : TopScan) : TopScan :=
  let line := trim (String.mk buf.reverse)
  if line == "" then sc else noteLine line sc

inductive SMode where
  | code
  | line
  | blk (nest : Nat)
  | str
  | esc
  | raw (need : Nat)
  | rawH (need got : Nat)
  | chr
  | chrEsc

structure St where
  mode : SMode
  bdepth : Nat
  start : Bool
  buf : List Char
  prevId : Bool
  scan : TopScan

def initSt : St :=
  { mode := SMode.code
  , bdepth := 0
  , start := true
  , buf := []
  , prevId := false
  , scan := emptyScan }

def commitIf (st : St) : TopScan :=
  if st.start && st.bdepth == 0 then commit st.buf st.scan else st.scan

def pushCode (c : Char) (st : St) : St :=
  let buf := if st.bdepth == 0 && st.start then c :: st.buf else st.buf
  { st with buf := buf, prevId := identChar c }

def enterLine (st : St) : St :=
  { st with mode := SMode.line, prevId := false }

def enterBlk (st : St) : St :=
  { st with mode := SMode.blk 1, prevId := false }

def closeBlk (n : Nat) (st : St) : St :=
  if n <= 1 then
    { st with mode := SMode.code, prevId := false }
  else
    { st with mode := SMode.blk (n - 1), prevId := false }

def enterRaw (need : Nat) (st : St) : St :=
  let sc :=
    if st.bdepth == 0 then { st.scan with sawRaw := true } else st.scan
  { st with mode := SMode.raw need, prevId := false, scan := sc }

def eatCode (c : Char) (st : St) : St :=
  if c == '"' then
    { st with mode := SMode.str, prevId := false }
  else if c == '\'' && !st.prevId then
    { st with mode := SMode.chr, prevId := false }
  else if c == '(' || c == '{' || c == '[' then
    { st with bdepth := st.bdepth + 1, prevId := false }
  else if c == ')' || c == '}' || c == ']' then
    let d := if st.bdepth == 0 then 0 else st.bdepth - 1
    { st with bdepth := d, prevId := false }
  else
    pushCode c st

def eat (c : Char) (st : St) : St :=
  match st.mode with
  | SMode.code => eatCode c st
  | SMode.line => st
  | SMode.blk _ => st
  | SMode.str =>
    if c == '"' then { st with mode := SMode.code, prevId := false }
    else if c == '\\' then { st with mode := SMode.esc }
    else st
  | SMode.esc => { st with mode := SMode.str }
  | SMode.raw need =>
    if c == '"' then { st with mode := SMode.rawH need 0 } else st
  | SMode.rawH need got =>
    if c == '#' then
      let g := got + 1
      if g == need then { st with mode := SMode.code, prevId := false }
      else { st with mode := SMode.rawH need g }
    else if c == '"' then { st with mode := SMode.rawH need 0 }
    else { st with mode := SMode.raw need }
  | SMode.chr =>
    if c == '\\' then { st with mode := SMode.chrEsc }
    else if c == '\'' then { st with mode := SMode.code, prevId := false }
    else st
  | SMode.chrEsc => { st with mode := SMode.chr }

def onNl (st : St) : St :=
  let sc := commitIf st
  match st.mode with
  | SMode.line =>
    { st with
      mode := SMode.code
      , start := st.bdepth == 0
      , buf := []
      , prevId := false
      , scan := sc }
  | SMode.code =>
    { st with
      start := st.bdepth == 0
      , buf := []
      , prevId := false
      , scan := sc }
  | SMode.blk n =>
    { st with
      mode := SMode.blk n
      , start := false
      , buf := []
      , prevId := false
      , scan := sc }
  | SMode.str =>
    { st with start := false, buf := [], prevId := false, scan := sc }
  | SMode.esc =>
    { st with
      mode := SMode.str
      , start := false
      , buf := []
      , prevId := false
      , scan := sc }
  | SMode.raw need =>
    { st with
      mode := SMode.raw need
      , start := false
      , buf := []
      , prevId := false
      , scan := sc }
  | SMode.rawH need got =>
    { st with
      mode := SMode.rawH need got
      , start := false
      , buf := []
      , prevId := false
      , scan := sc }
  | SMode.chr =>
    { st with start := false, buf := [], prevId := false, scan := sc }
  | SMode.chrEsc =>
    { st with
      mode := SMode.chr
      , start := false
      , buf := []
      , prevId := false
      , scan := sc }

def finishEof (st : St) : TopScan :=
  match st.mode with
  | SMode.code => { commitIf st with closed := true }
  | SMode.line => { commitIf st with closed := true }
  | _ => { st.scan with closed := false }

private def takeLt (a : Char) (as : List Char) :
    as.length < (a :: as).length := by
  rw [List.length_cons]
  exact Nat.lt_succ_self as.length

private def takeLt2 (a b : Char) (as : List Char) :
    as.length < (a :: b :: as).length :=
  Nat.lt_trans (takeLt b as) (takeLt a (b :: as))

private def takeLt3 (a b c : Char) (as : List Char) :
    as.length < (a :: b :: c :: as).length :=
  Nat.lt_trans (takeLt c as) (takeLt2 a b (c :: as))

private def takeLt4 (a b c d : Char) (as : List Char) :
    as.length < (a :: b :: c :: d :: as).length :=
  Nat.lt_trans (takeLt d as) (takeLt3 a b c (d :: as))

private def takeLt5 (a b c d e : Char) (as : List Char) :
    as.length < (a :: b :: c :: d :: e :: as).length :=
  Nat.lt_trans (takeLt e as) (takeLt4 a b c d (e :: as))

structure GoTail (cs : List Char) where
  next : List Char
  st : St
  shorter : next.length < cs.length

private def goOne (c : Char) (rest : List Char) (st : St) :
    GoTail (c :: rest) :=
  { next := rest, st := st, shorter := takeLt c rest }

private def scanDash (c : Char) (rest : List Char) (st : St) :
    Option (GoTail (c :: rest)) :=
  match rest with
  | [] => some (goOne c [] (eat '-' st))
  | d :: rest2 =>
    if d = '-' then
      match st.mode with
      | SMode.code =>
        some {
          next := rest2
          st := enterLine st
          shorter := takeLt2 c d rest2
        }
      | _ => some (goOne c (d :: rest2) (eat '-' st))
    else if d = '/' then
      match st.mode with
      | SMode.blk n =>
        some {
          next := rest2
          st := closeBlk n st
          shorter := takeLt2 c d rest2
        }
      | _ => some (goOne c (d :: rest2) (eat '-' st))
    else
      some (goOne c (d :: rest2) (eat '-' st))

private def scanSlash (c : Char) (rest : List Char) (st : St) :
    Option (GoTail (c :: rest)) :=
  match rest with
  | [] => some (goOne c [] (eat '/' st))
  | d :: rest2 =>
    if d = '-' then
      match st.mode with
      | SMode.code =>
        some {
          next := rest2
          st := enterBlk st
          shorter := takeLt2 c d rest2
        }
      | SMode.blk n =>
        some {
          next := rest2
          st := { st with mode := SMode.blk (n + 1) }
          shorter := takeLt2 c d rest2
        }
      | _ => some (goOne c (d :: rest2) (eat '/' st))
    else
      some (goOne c (d :: rest2) (eat '/' st))

private def scanRaw (c : Char) (rest : List Char) (st : St) :
    Option (GoTail (c :: rest)) :=
  match rest with
  | [] => some (goOne c [] (eat 'r' st))
  | h1 :: r1 =>
    if h1 = '#' then
      match r1 with
      | [] => some (goOne c (h1 :: []) (eat 'r' st))
      | h2 :: r2 =>
        if h2 = '#' then
          match r2 with
          | [] => some (goOne c (h1 :: h2 :: []) (eat 'r' st))
          | h3 :: r3 =>
            if h3 = '#' then
              match r3 with
              | [] => some (goOne c (h1 :: h2 :: h3 :: []) (eat 'r' st))
              | q :: rest2 =>
                if q = '"' then
                  match st.mode, st.prevId with
                  | SMode.code, false =>
                    some {
                      next := rest2
                      st := enterRaw 3 st
                      shorter := takeLt5 c h1 h2 h3 q rest2
                    }
                  | _, _ => some (goOne c (h1 :: h2 :: h3 :: q :: rest2) (eat 'r' st))
                else
                  some (goOne c (h1 :: h2 :: h3 :: q :: rest2) (eat 'r' st))
            else if h3 = '"' then
              match st.mode, st.prevId with
              | SMode.code, false =>
                some {
                  next := r3
                  st := enterRaw 2 st
                  shorter := takeLt4 c h1 h2 h3 r3
                }
              | _, _ => some (goOne c (h1 :: h2 :: h3 :: r3) (eat 'r' st))
            else
              some (goOne c (h1 :: h2 :: h3 :: r3) (eat 'r' st))
        else if h2 = '"' then
          match st.mode, st.prevId with
          | SMode.code, false =>
            some {
              next := r2
              st := enterRaw 1 st
              shorter := takeLt3 c h1 h2 r2
            }
          | _, _ => some (goOne c (h1 :: h2 :: r2) (eat 'r' st))
        else
          some (goOne c (h1 :: h2 :: r2) (eat 'r' st))
    else
      some (goOne c (h1 :: r1) (eat 'r' st))

def scanTail (cs : List Char) (st : St) : Option (GoTail cs) :=
  match cs with
  | [] => none
  | c :: rest =>
    if c = '\n' then
      some (goOne c rest (onNl st))
    else if c = '-' then
      scanDash c rest st
    else if c = '/' then
      scanSlash c rest st
    else if c = 'r' then
      scanRaw c rest st
    else
      some (goOne c rest (eat c st))

theorem scanTail_shorter (cs : List Char) (st : St) (t : GoTail cs)
    (h : scanTail cs st = some t) : t.next.length < cs.length := by
  have _used := h
  cases cs with
  | nil => exact t.shorter
  | cons _ _ => exact t.shorter

def scanGo (cs : List Char) (st : St) : TopScan :=
  match h : scanTail cs st with
  | none => finishEof st
  | some t => scanGo t.next t.st
termination_by cs.length
decreasing_by
  simp_wf
  exact scanTail_shorter cs st t h

def scanTop (src : String) : TopScan :=
  let sc := scanGo src.toList initSt
  { sc with imps := sc.imps.reverse }

def impCmd (s : String) : Cmd :=
  Cmd.importModule (n s)

def nsCmd (s : String) : Cmd :=
  Cmd.namespace (n s)

def endCmd (s : String) : Cmd :=
  Cmd.endNamespace (n s)

def strCmd (nm : String) : Cmd :=
  Cmd.def_ (n nm) (some HostType.string) (Term.litString "")

def boolCmd (nm : String) (b : Bool) : Cmd :=
  Cmd.def_ (n nm) (some HostType.bool) (Term.litBool b)

def takeImps : Nat -> List String -> List Cmd
  | 0, _ => []
  | _, [] => []
  | Nat.succ k, s :: rest => impCmd s :: takeImps k rest

/-- Same-line false, then same-line true. A missing flag is omitted. -/
def optBools (sc : TopScan) : List Cmd :=
  let fs :=
    if sc.sawF && sc.fNm != "" then [boolCmd sc.fNm false] else []
  let ts :=
    if sc.sawT && sc.tNm != "" then [boolCmd sc.tNm true] else []
  fs ++ ts

/-- Same-line String def, or nothing. The literal text is not kept. -/
def optStr (sc : TopScan) : List Cmd :=
  if sc.sawStr && sc.strNm != "" then [strCmd sc.strNm] else []

def hmcNs : String := "SystemsLean.HostModuleCheck"

def closedNs (sc : TopScan) : Bool :=
  sc.sawNs && sc.ns != "" && sc.sawEnd && sc.endNs == sc.ns
    && sc.closed

def lastImp : List String -> String
  | [] => ""
  | a :: [] => a
  | _ :: rest => lastImp rest

def headImp : List String -> String
  | a :: _ => a
  | [] => ""

/-- Live term, a Source import, HostKernel last. -/
def liveFamily (xs : List String) : Bool :=
  match xs with
  | a :: b :: _ =>
    a == liveTerm && b.endsWith "Source" && lastImp xs == hostKernel
  | _ => false

def is1 (xs : List String) : Bool :=
  match xs with
  | _ :: [] => true
  | _ => false

def is2 (xs : List String) : Bool :=
  match xs with
  | _ :: _ :: [] => true
  | _ => false

def is3 (xs : List String) : Bool :=
  match xs with
  | _ :: _ :: _ :: [] => true
  | _ => false

def is4 (xs : List String) : Bool :=
  match xs with
  | _ :: _ :: _ :: _ :: [] => true
  | _ => false

def is5 (xs : List String) : Bool :=
  match xs with
  | _ :: _ :: _ :: _ :: _ :: [] => true
  | _ => false

def atLeast3 (xs : List String) : Bool :=
  match xs with
  | _ :: _ :: _ :: _ => true
  | _ => false

def atLeast8 (xs : List String) : Bool :=
  match xs with
  | _ :: _ :: _ :: _ :: _ :: _ :: _ :: _ :: _ => true
  | _ => false

def modOf (ns : String) (cmds : List Cmd) : Option Module :=
  let m : Module := { name := n ns, commands := cmds }
  if isWellFormed m then some m else none

def midImp (xs : List String) : String :=
  match xs with
  | _ :: b :: _ => b
  | _ => ""

def live3Ok (sc : TopScan) : Bool :=
  match sc.imps with
  | a :: b :: c :: [] =>
    a == liveTerm && c == hostKernel && b.endsWith "Source"
      && sc.sawNs && sc.ns != "" && sc.sawEnd && sc.endNs == sc.ns
      && sc.sawStr && sc.strNm != ""
      && sc.sawF && sc.fNm != ""
      && sc.sawT && sc.tNm != ""
      && sc.sawMain && !sc.sawThm && !sc.sawEx && !sc.sawMut
      && sc.closed
  | _ => false

/-- Three-import live term shape. none on every other shape. -/
def parseLiveTriple (src : String) : Option Module :=
  let sc := scanTop src
  if live3Ok sc then
    modOf sc.ns
      [ impCmd liveTerm
      , impCmd (midImp sc.imps)
      , impCmd hostKernel
      , nsCmd sc.ns
      , strCmd sc.strNm
      , boolCmd sc.fNm false
      , boolCmd sc.tNm true
      , endCmd sc.ns ]
  else
    none

def hasLitBool (b : Bool) : List Cmd -> Bool
  | [] => false
  | Cmd.def_ _ (some HostType.bool) (Term.litBool v) :: rest =>
    v == b || hasLitBool b rest
  | _ :: rest => hasLitBool b rest

def liveToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.DemoSource\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def stageId : String := \"x\"\n"
  ++ "def pin : Bool := false\n"
  ++ "def other : Bool := true\n"
  ++ "def main : IO Unit := pure ()\n"
  ++ "end SystemsLean.Demo\n"

def liveRejectToy : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n"
  ++ "import SystemsLean.HostKernel\n"
  ++ "namespace SystemsLean.Demo\n"
  ++ "def pin : Bool := false\n"
  ++ "end SystemsLean.Demo\n"

def liveTripleKeepsFalse : Bool :=
  match parseLiveTriple liveToy with
  | some m =>
    hasLitBool false m.commands && hasLitBool true m.commands
      && isWellFormed m
  | none => false

def liveTripleRejects : Bool :=
  match parseLiveTriple liveRejectToy with
  | none => true
  | some _ => false

end SystemsLean.LiveTriple
