/-
  Module: SystemsLean.LivePin
  One shape: one or more imports, including SystemsLean.HostKernel,
  and no import whose name contains HostFrontLiveHostTerm.
  One namespace, SystemsLean.HostFrontLive plus a longer suffix,
  and the same end. A hashed raw string (one or more hashes).
  A depth-0 def main. One depth-0 def whose name ends with FullHost
  and whose Bool literal is false. No depth-0 theorem.
  A depth-0 `mutual` with only whitespace after it opens a count.
  A depth-0 bare `end` closes that count. It does not end the
  namespace and it is not bad. A bare `end` at count 0 is bad.
  A named end is the namespace end only when the count is already 0.
  A named end while the count is open is bad. Accept only at count 0.
  The mutual block is not emitted.
  Text inside a raw string, a comment, or a quote is not a def.
  The module is the namespace, that one false Bool, and the end.
  The file name is not stored. A false Bool stays false.
  Namespace, one def, and end fit kernel fuel 64.
  Reading every def in the source would need a larger fuel.
  This file does not change HostKernel fuel.
  Does not call Lean.Elab.processCommands.
  Returns none on every other shape.
  slakeOwnsPackageTypecheck stays false. ASCII only.
-/

import SystemsLean.HostTerm

namespace SystemsLean.LivePin

open SystemsLean.HostTerm

def lineFuel : Nat := 400000

def livePfx : String := "SystemsLean.HostFrontLive"

def kernelImp : String := "SystemsLean.HostKernel"

def termPart : String := "HostFrontLiveHostTerm"

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\n' || c == '\t' || c == '\r'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

structure St where
  ns : String
  nsCount : Nat
  endCount : Nat
  ended : Bool
  mutualOpen : Nat
  imports : Nat
  sawKernel : Bool
  sawLiveTerm : Bool
  sawMain : Bool
  sawRaw : Bool
  sawTheorem : Bool
  fullName : String
  fullFalse : Nat
  fullTrue : Nat
  bad : Bool

def emptySt : St :=
  { ns := ""
    nsCount := 0
    endCount := 0
    ended := false
    mutualOpen := 0
    imports := 0
    sawKernel := false
    sawLiveTerm := false
    sawMain := false
    sawRaw := false
    sawTheorem := false
    fullName := ""
    fullFalse := 0
    fullTrue := 0
    bad := false }

def markBad (st : St) : St :=
  { st with bad := true }

def markRaw (st : St) : St :=
  { st with sawRaw := true }

def skipWs : List Char -> List Char
  | [] => []
  | c :: rest => if isWs c then skipWs rest else c :: rest

def onlyWs : List Char -> Bool
  | [] => true
  | c :: rest => isWs c && onlyWs rest

def identRest (fuel : Nat) (acc : List Char) : List Char ->
    Prod (List Char) (List Char)
  | cs =>
    match fuel with
    | 0 => (acc, cs)
    | Nat.succ k =>
      match cs with
      | d :: rest =>
        if isIdentChar d then identRest k (d :: acc) rest
        else (acc, cs)
      | [] => (acc, [])
termination_by fuel

def takeIdent (cs : List Char) : Option (Prod String (List Char)) :=
  match cs with
  | [] => none
  | c :: rest =>
    if isLetter c || c == '_' then
      let got := identRest 512 [c] rest
      some (String.mk got.fst.reverse, got.snd)
    else
      none

def takeDots (fuel : Nat) (acc : String) : List Char ->
    Option (Prod String (List Char))
  | cs =>
    match fuel with
    | 0 => none
    | Nat.succ k =>
      match cs with
      | '.' :: rest =>
        match takeIdent rest with
        | some (id, rest2) => takeDots k (acc ++ "." ++ id) rest2
        | none => none
      | _ => some (acc, cs)
termination_by fuel

def takeDotName (cs : List Char) : Option (Prod String (List Char)) :=
  match takeIdent cs with
  | some (id, rest) => takeDots 64 id rest
  | none => none

def hasPart (s p : String) : Bool :=
  match s.splitOn p with
  | _ :: _ :: _ => true
  | _ => false

def longerThan (s p : String) : Bool :=
  Nat.blt p.length s.length

def isLiveNs (nm : String) : Bool :=
  nm.startsWith livePfx && longerThan nm livePfx

def endsFull (nm : String) : Bool :=
  let p := "FullHost"
  Nat.ble p.length nm.length
    && (nm.drop (nm.length - p.length)) == p

def noteImport (st : St) (nm : String) : St :=
  let st1 := { st with imports := st.imports + 1 }
  let st2 :=
    if nm == kernelImp then { st1 with sawKernel := true } else st1
  if hasPart nm termPart then { st2 with sawLiveTerm := true } else st2

def noteFull (st : St) (nm : String) (rest : List Char) : St :=
  let text := String.mk rest
  if hasPart text " : Bool := true" then
    { st with fullTrue := st.fullTrue + 1 }
  else if hasPart text " : Bool := false" then
    let nm2 := if st.fullName == "" then nm else st.fullName
    { st with fullFalse := st.fullFalse + 1, fullName := nm2 }
  else
    st

def noteDef (st : St) (rest : List Char) : St :=
  match takeIdent (skipWs rest) with
  | none => st
  | some (nm, rest2) =>
    let st1 := if nm == "main" then { st with sawMain := true } else st
    if endsFull nm then noteFull st1 nm rest2 else st1

def classify (line : String) (st : St) : St :=
  if st.bad then
    st
  else
    let cs := line.toList
    if st.ended then
      if onlyWs cs then st else markBad st
    else
      match takeIdent (skipWs cs) with
      | none => st
      | some ("import", rest) =>
        match takeDotName (skipWs rest) with
        | some (nm, rest2) =>
          if onlyWs rest2 then noteImport st nm else markBad st
        | none => markBad st
      | some ("namespace", rest) =>
        match takeDotName (skipWs rest) with
        | some (nm, rest2) =>
          if onlyWs rest2 && st.nsCount == 0 && isLiveNs nm then
            { st with ns := nm, nsCount := 1 }
          else
            markBad st
        | none => markBad st
      | some ("mutual", rest) =>
        if onlyWs rest then
          { st with mutualOpen := st.mutualOpen + 1 }
        else
          st
      | some ("end", rest) =>
        match takeDotName (skipWs rest) with
        | some (nm, rest2) =>
          if st.mutualOpen != 0 then
            markBad st
          else if onlyWs rest2 && st.nsCount == 1 && nm == st.ns
              && st.endCount == 0 then
            { st with endCount := 1, ended := true }
          else
            markBad st
        | none =>
          if onlyWs rest && st.mutualOpen != 0 then
            { st with mutualOpen := st.mutualOpen - 1 }
          else
            markBad st
      | some ("def", rest) => noteDef st rest
      | some ("theorem", _) => { st with sawTheorem := true }
      | some (_, _) => st

inductive Mode where
  | code
  | str
  | esc
  | raw (need : Nat)
  | blk (depth : Nat)

inductive StrEnd where
  | closed (rest : List Char)
  | unclosed (esc : Bool)

inductive BlkEnd where
  | closed (rest : List Char)
  | open (depth : Nat)

def closeStr : List Char -> StrEnd
  | [] => StrEnd.unclosed false
  | '\\' :: [] => StrEnd.unclosed true
  | '\\' :: _ :: rest => closeStr rest
  | '"' :: rest => StrEnd.closed rest
  | _ :: rest => closeStr rest

def closeBlk (depth : Nat) : List Char -> BlkEnd
  | [] => BlkEnd.open depth
  | '-' :: '/' :: rest =>
    if depth <= 1 then BlkEnd.closed rest
    else closeBlk (depth - 1) rest
  | '/' :: '-' :: rest => closeBlk (depth + 1) rest
  | _ :: rest => closeBlk depth rest

def countHashes : List Char -> Prod Nat (List Char)
  | '#' :: rest =>
    let got := countHashes rest
    (got.fst + 1, got.snd)
  | cs => (0, cs)

def skipN (n : Nat) (cs : List Char) : List Char :=
  match n with
  | 0 => cs
  | Nat.succ k =>
    match cs with
    | _ :: rest => skipN k rest
    | [] => []
termination_by n

/-- Leading hashes leave a suffix no longer than the input. -/
theorem countHashes_snd_len_le (cs : List Char) :
    (countHashes cs).snd.length <= cs.length := by
  match cs with
  | [] => simp [countHashes]
  | '#' :: rest =>
    simp only [countHashes]
    exact Nat.le_succ_of_le (countHashes_snd_len_le rest)
  | c :: rest =>
    if h : c = '#' then
      subst h
      simp only [countHashes]
      exact Nat.le_succ_of_le (countHashes_snd_len_le rest)
    else
      unfold countHashes
      split
      . next heq =>
        injection heq with hhead
        exact absurd hhead h
      . exact Nat.le_refl _

def closeRaw (need : Nat) (cs : List Char) : Option (List Char) :=
  match cs with
  | [] => none
  | '"' :: rest =>
    let nh := countHashes rest
    if nh.fst >= need && need > 0 then some (skipN need rest)
    else closeRaw need nh.snd
  | _ :: rest => closeRaw need rest
termination_by cs.length
decreasing_by
  all_goals simp_wf
  . exact Nat.lt_succ_of_le (countHashes_snd_len_le rest)

def continuesIdent (acc : List Char) : Bool :=
  match acc with
  | c :: _ => isIdentChar c
  | [] => false

def eat (fuel : Nat) (cs : List Char) (acc : List Char) (st : St)
    (mode : Mode) : Prod Mode St :=
  match fuel with
  | 0 => (Mode.code, markBad st)
  | Nat.succ k =>
    match mode, cs with
    | Mode.code, [] =>
      (Mode.code, classify (String.mk acc.reverse) st)
    | Mode.code, '-' :: '-' :: _ =>
      (Mode.code, classify (String.mk acc.reverse) st)
    | Mode.code, '/' :: '-' :: rest =>
      match closeBlk 1 rest with
      | BlkEnd.closed rest2 => eat k rest2 acc st Mode.code
      | BlkEnd.open d =>
        (Mode.blk d, classify (String.mk acc.reverse) st)
    | Mode.code, '\'' :: rest =>
      if continuesIdent acc then
        eat k rest ('\'' :: acc) st Mode.code
      else
        match rest with
        | '\\' :: _ :: '\'' :: rest2 => eat k rest2 acc st Mode.code
        | _ :: '\'' :: rest2 => eat k rest2 acc st Mode.code
        | _ => eat k rest ('\'' :: acc) st Mode.code
    | Mode.code, '"' :: rest =>
      match closeStr rest with
      | StrEnd.closed rest2 => eat k rest2 acc st Mode.code
      | StrEnd.unclosed esc =>
        let st2 := classify (String.mk acc.reverse) st
        if esc then (Mode.esc, st2) else (Mode.str, st2)
    | Mode.code, 'r' :: rest =>
      if continuesIdent acc then
        eat k rest ('r' :: acc) st Mode.code
      else
        match rest with
        | '#' :: _ =>
          let nh := countHashes rest
          match nh.snd with
          | '"' :: restB =>
            match closeRaw nh.fst restB with
            | some restC => eat k restC acc (markRaw st) Mode.code
            | none =>
              let st2 := classify (String.mk acc.reverse) st
              (Mode.raw nh.fst, markRaw st2)
          | _ => eat k rest ('r' :: acc) st Mode.code
        | _ => eat k rest ('r' :: acc) st Mode.code
    | Mode.code, c :: rest =>
      eat k rest (c :: acc) st Mode.code
    | Mode.str, [] => (Mode.str, st)
    | Mode.str, '\\' :: [] => (Mode.esc, st)
    | Mode.str, '\\' :: _ :: rest => eat k rest [] st Mode.str
    | Mode.str, '"' :: rest => eat k rest [] st Mode.code
    | Mode.str, _ :: rest => eat k rest [] st Mode.str
    | Mode.esc, [] => (Mode.str, st)
    | Mode.esc, _ :: rest => eat k rest [] st Mode.str
    | (Mode.raw need), line =>
      match closeRaw need line with
      | some rest => eat k rest [] st Mode.code
      | none => (Mode.raw need, st)
    | (Mode.blk depth), line =>
      match closeBlk depth line with
      | BlkEnd.closed rest => eat k rest [] st Mode.code
      | BlkEnd.open d => (Mode.blk d, st)
termination_by fuel

def one (n : Nat) : Bool :=
  match n with
  | 1 => true
  | _ => false

def finish (mode : Mode) (st : St) : Option St :=
  match mode with
  | Mode.code =>
    if st.bad || st.sawLiveTerm || st.sawTheorem then none
    else if st.sawKernel && st.nsCount == 1 && st.endCount == 1
        && st.sawMain && st.sawRaw && one st.fullFalse
        && st.fullTrue == 0 && st.fullName != ""
        && isLiveNs st.ns && st.mutualOpen == 0 then
      some st
    else none
  | _ => none

def walk (lines : List String) (mode : Mode) (st : St) : Option St :=
  match lines with
  | [] => finish mode st
  | line :: rest =>
    let stepped := eat lineFuel line.toList [] st mode
    walk rest stepped.fst stepped.snd
termination_by lines.length

def parseLivePin (src : String) : Option Module :=
  match walk (src.splitOn "\n") Mode.code emptySt with
  | none => none
  | some st =>
    let cmds :=
      [ Cmd.namespace (n st.ns)
      , Cmd.def_ (n st.fullName) (some HostType.bool) (Term.litBool false)
      , Cmd.endNamespace (n st.ns) ]
    let m : Module := { name := n st.ns, commands := cmds }
    if isWellFormed m then some m else none

def pinNs : String := "SystemsLean.HostFrontLivePin"

def pinToy : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def tick : Char := '\"'\n" ++
  "def liveSrc : String := r#\"theorem hidden : True := by\n" ++
  "  decide\n" ++
  "\"#\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

/-- Kernel import, live namespace, false FullHost, raw, and main. -/
def pinAccepts : Bool :=
  match parseLivePin pinToy with
  | some m =>
    match m.commands with
    | Cmd.namespace a
        :: Cmd.def_ d (some HostType.bool) (Term.litBool false)
        :: Cmd.endNamespace b :: [] =>
      a.raw == pinNs && d.raw == "hostFrontLivePinFullHost"
        && b.raw == a.raw && isWellFormed m
    | _ => false
  | none => false

def noRaw : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

def noRawRejects : Bool :=
  match parseLivePin noRaw with
  | none => true
  | some _ => false

def hostTerm : String :=
  "import SystemsLean.HostFrontLiveHostTerm\n" ++
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def liveSrc : String := r#\"x\"#\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

def hostTermRejects : Bool :=
  match parseLivePin hostTerm with
  | none => true
  | some _ => false

def noMain : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def liveSrc : String := r#\"x\"#\n" ++
  "end SystemsLean.HostFrontLivePin\n"

def noMainRejects : Bool :=
  match parseLivePin noMain with
  | none => true
  | some _ => false

def depthThm : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "theorem t : True := by\n" ++
  "  decide\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def liveSrc : String := r#\"x\"#\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

def depthThmRejects : Bool :=
  match parseLivePin depthThm with
  | none => true
  | some _ => false

def fullTrue : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := true\n" ++
  "def liveSrc : String := r#\"x\"#\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

def fullTrueRejects : Bool :=
  match parseLivePin fullTrue with
  | none => true
  | some _ => false

def wrongNs : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.OtherPin\n" ++
  "def otherPinFullHost : Bool := false\n" ++
  "def liveSrc : String := r#\"x\"#\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.OtherPin\n"

def wrongNsRejects : Bool :=
  match parseLivePin wrongNs with
  | none => true
  | some _ => false

def zeroImp : String :=
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def liveSrc : String := r#\"x\"#\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

def zeroImpRejects : Bool :=
  match parseLivePin zeroImp with
  | none => true
  | some _ => false

/-- A zero-import raw embed is the theorem-form scanner shape. This reader skips it. -/
def plainEmbed : String :=
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def liveRel : String := \"x.lean\"\n" ++
  "def src : String := r#\"theorem t : True := by decide\"#\n" ++
  "end SystemsLean.HostFrontLivePin\n"

def plainEmbedRejects : Bool :=
  match parseLivePin plainEmbed with
  | none => true
  | some _ => false

def mutualToy : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def tick : Char := '\"'\n" ++
  "def liveSrc : String := r#\"theorem hidden : True := by\n" ++
  "  decide\n" ++
  "end SystemsLean.Hidden\n" ++
  "\"#\n" ++
  "mutual\n" ++
  "def insideMutual : Nat := 0\n" ++
  "end\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

/-- Same pin shape, plus one mutual closed by a bare end before main. -/
def mutualAccepts : Bool :=
  match parseLivePin mutualToy with
  | some m =>
    match m.commands with
    | Cmd.namespace a
        :: Cmd.def_ d (some HostType.bool) (Term.litBool false)
        :: Cmd.endNamespace b :: [] =>
      a.raw == pinNs && d.raw == "hostFrontLivePinFullHost"
        && b.raw == a.raw && isWellFormed m
    | _ => false
  | none => false

def bareEndToy : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def liveSrc : String := r#\"x\"#\n" ++
  "end\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

/-- A bare end with no open mutual is rejected. -/
def bareEndRejects : Bool :=
  match parseLivePin bareEndToy with
  | none => true
  | some _ => false

def openMutualToy : String :=
  "import SystemsLean.HostKernel\n" ++
  "namespace SystemsLean.HostFrontLivePin\n" ++
  "def hostFrontLivePinFullHost : Bool := false\n" ++
  "def liveSrc : String := r#\"x\"#\n" ++
  "mutual\n" ++
  "def insideMutual : Nat := 0\n" ++
  "def main : IO UInt32 := pure 0\n" ++
  "end SystemsLean.HostFrontLivePin\n"

/-- A mutual with no bare end is rejected. -/
def openMutualRejects : Bool :=
  match parseLivePin openMutualToy with
  | none => true
  | some _ => false

end SystemsLean.LivePin
