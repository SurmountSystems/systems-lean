/-
  Module: SystemsLean.FranciscoUseCheck
  Reader for namespace SystemsLean.UseCheck.
  Looks at ConsumeEvent, checkConsumeToken, UseEvent,
  and checkUnrestrictedShare.
  Also looks at checkErasedAbsent and the three theorems
  checkErasedAbsent_absent, checkErasedAbsent_once,
  and checkErasedAbsent_many.
  The reader also looks at def checkConsumeTokenOk
  and def checkUnrestrictedShareOk.
  The reader also looks at def erasedAbsentUseCheckReady.
  Two structures and nine theorems are required. No main and no raw string.
  A longer name does not count. A comment does not count.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoUseCheck

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

inductive CMode where
  | code
  | line
  | blk (d : Nat)

/-- Skip `--` line comments and nested `/-` `-/` blocks. Newlines stay. -/
def stripGo (cs : List Char) (mode : CMode) : List Char :=
  match cs, mode with
  | [], _ => []
  | '-' :: '-' :: rest, CMode.code => stripGo rest CMode.line
  | '/' :: '-' :: rest, CMode.code => stripGo rest (CMode.blk 1)
  | c :: rest, CMode.code => c :: stripGo rest CMode.code
  | '\n' :: rest, CMode.line => '\n' :: stripGo rest CMode.code
  | _ :: rest, CMode.line => stripGo rest CMode.line
  | '/' :: '-' :: rest, CMode.blk d =>
    stripGo rest (CMode.blk (d + 1))
  | '-' :: '/' :: rest, CMode.blk d =>
    if d <= 1 then stripGo rest CMode.code
    else stripGo rest (CMode.blk (d - 1))
  | '\n' :: rest, CMode.blk d =>
    '\n' :: stripGo rest (CMode.blk d)
  | _ :: rest, CMode.blk d => stripGo rest (CMode.blk d)
termination_by cs.length

def codeLines (src : String) : List String :=
  (String.mk (stripGo src.toList CMode.code)).splitOn "\n"

def isIdentChar (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')
    || ('0' <= c && c <= '9') || c == '_' || c == '?'
    || c == '\''

/-- Walk a prefix on List Char. The suffix is what did not match. -/
def afterPre (pre cs : List Char) : Option (List Char) :=
  match pre, cs with
  | [], rest => some rest
  | _ :: _, [] => none
  | p :: ps, c :: rest =>
    if p == c then afterPre ps rest else none
termination_by pre.length

/-- Keyword, one space, name, then end or a non-ident char. -/
def bounded (kwName line : String) : Bool :=
  match afterPre kwName.toList (trim line).toList with
  | none => false
  | some [] => true
  | some (c :: _) => !isIdentChar c

def exactNs (line : String) : Bool :=
  trim line == "namespace SystemsLean.UseCheck"

def exactEnd (line : String) : Bool :=
  trim line == "end SystemsLean.UseCheck"

def hasLine (p : String -> Bool) (lines : List String) : Bool :=
  lines.any p

def seesDecls (lines : List String) : Bool :=
  hasLine exactNs lines
    && hasLine exactEnd lines
    && hasLine (bounded "structure ConsumeEvent") lines
    && hasLine (bounded "inductive Check") lines
    && hasLine (bounded "def checkConsumeToken") lines
    && hasLine (bounded "def checkConsumeTokenOk") lines
    && hasLine (bounded "theorem checkConsumeToken_drop") lines
    && hasLine (bounded "theorem checkConsumeToken_ok") lines
    && hasLine (bounded "theorem checkConsumeToken_doubleSpend") lines
    && hasLine (bounded "structure UseEvent") lines
    && hasLine (bounded "def checkUnrestrictedShare") lines
    && hasLine (bounded "def checkUnrestrictedShareOk") lines
    && hasLine (bounded "theorem checkUnrestrictedShare_drop") lines
    && hasLine (bounded "theorem checkUnrestrictedShare_once") lines
    && hasLine (bounded "theorem checkUnrestrictedShare_share") lines
    && hasLine (bounded "def checkErasedAbsent") lines
    && hasLine (bounded "theorem checkErasedAbsent_absent") lines
    && hasLine (bounded "theorem checkErasedAbsent_once") lines
    && hasLine (bounded "theorem checkErasedAbsent_many") lines
    && hasLine (bounded "def erasedAbsentUseCheckReady") lines

def parseUseCheck (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsHead sc != "SystemsLean.UseCheck" then none
    else if sc.structN < 2 || sc.theoremN < 9 then none
    else if sc.mainN != 0 || sc.rawN != 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else if !seesDecls (codeLines src) then none
    else cmdsOf sc (nsHead sc) true

/- Shape checks. Not run in this file. -/

def useCheckShapeSrc : String :=
  "namespace SystemsLean.UseCheck\n"
  ++ "structure ConsumeEvent where\n"
  ++ "inductive Check where\n"
  ++ "def checkConsumeToken : Check := Check.ok\n"
  ++ "def checkConsumeTokenOk : Bool := false\n"
  ++ "theorem checkConsumeToken_drop : True := by trivial\n"
  ++ "theorem checkConsumeToken_ok : True := by trivial\n"
  ++ "theorem checkConsumeToken_doubleSpend : True := by trivial\n"
  ++ "structure UseEvent where\n"
  ++ "def checkUnrestrictedShare : Check := Check.ok\n"
  ++ "def checkUnrestrictedShareOk : Bool := false\n"
  ++ "theorem checkUnrestrictedShare_drop : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_once : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_share : True := by trivial\n"
  ++ "def checkErasedAbsent : Check := Check.ok\n"
  ++ "theorem checkErasedAbsent_absent : True := by trivial\n"
  ++ "theorem checkErasedAbsent_once : True := by trivial\n"
  ++ "theorem checkErasedAbsent_many : True := by trivial\n"
  ++ "def erasedAbsentUseCheckReady : Bool := false\n"
  ++ "end SystemsLean.UseCheck\n"

def useCheckShapeSome : Bool :=
  (parseUseCheck useCheckShapeSrc).isSome

def useCheckNoConsumeOkSrc : String :=
  "namespace SystemsLean.UseCheck\n"
  ++ "structure ConsumeEvent where\n"
  ++ "inductive Check where\n"
  ++ "def checkConsumeToken : Check := Check.ok\n"
  ++ "theorem checkConsumeToken_drop : True := by trivial\n"
  ++ "theorem checkConsumeToken_ok : True := by trivial\n"
  ++ "theorem checkConsumeToken_doubleSpend : True := by trivial\n"
  ++ "structure UseEvent where\n"
  ++ "def checkUnrestrictedShare : Check := Check.ok\n"
  ++ "def checkUnrestrictedShareOk : Bool := false\n"
  ++ "theorem checkUnrestrictedShare_drop : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_once : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_share : True := by trivial\n"
  ++ "def checkErasedAbsent : Check := Check.ok\n"
  ++ "theorem checkErasedAbsent_absent : True := by trivial\n"
  ++ "theorem checkErasedAbsent_once : True := by trivial\n"
  ++ "theorem checkErasedAbsent_many : True := by trivial\n"
  ++ "def erasedAbsentUseCheckReady : Bool := false\n"
  ++ "end SystemsLean.UseCheck\n"

def useCheckNoConsumeOkNone : Bool :=
  (parseUseCheck useCheckNoConsumeOkSrc).isNone

def useCheckNoShareOkSrc : String :=
  "namespace SystemsLean.UseCheck\n"
  ++ "structure ConsumeEvent where\n"
  ++ "inductive Check where\n"
  ++ "def checkConsumeToken : Check := Check.ok\n"
  ++ "def checkConsumeTokenOk : Bool := false\n"
  ++ "theorem checkConsumeToken_drop : True := by trivial\n"
  ++ "theorem checkConsumeToken_ok : True := by trivial\n"
  ++ "theorem checkConsumeToken_doubleSpend : True := by trivial\n"
  ++ "structure UseEvent where\n"
  ++ "def checkUnrestrictedShare : Check := Check.ok\n"
  ++ "theorem checkUnrestrictedShare_drop : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_once : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_share : True := by trivial\n"
  ++ "def checkErasedAbsent : Check := Check.ok\n"
  ++ "theorem checkErasedAbsent_absent : True := by trivial\n"
  ++ "theorem checkErasedAbsent_once : True := by trivial\n"
  ++ "theorem checkErasedAbsent_many : True := by trivial\n"
  ++ "def erasedAbsentUseCheckReady : Bool := false\n"
  ++ "end SystemsLean.UseCheck\n"

def useCheckNoShareOkNone : Bool :=
  (parseUseCheck useCheckNoShareOkSrc).isNone

def useCheckNoReadySrc : String :=
  "namespace SystemsLean.UseCheck\n"
  ++ "structure ConsumeEvent where\n"
  ++ "inductive Check where\n"
  ++ "def checkConsumeToken : Check := Check.ok\n"
  ++ "theorem checkConsumeToken_drop : True := by trivial\n"
  ++ "theorem checkConsumeToken_ok : True := by trivial\n"
  ++ "theorem checkConsumeToken_doubleSpend : True := by trivial\n"
  ++ "structure UseEvent where\n"
  ++ "def checkUnrestrictedShare : Check := Check.ok\n"
  ++ "theorem checkUnrestrictedShare_drop : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_once : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_share : True := by trivial\n"
  ++ "def checkErasedAbsent : Check := Check.ok\n"
  ++ "theorem checkErasedAbsent_absent : True := by trivial\n"
  ++ "theorem checkErasedAbsent_once : True := by trivial\n"
  ++ "theorem checkErasedAbsent_many : True := by trivial\n"
  ++ "end SystemsLean.UseCheck\n"

def useCheckNoReadyNone : Bool :=
  (parseUseCheck useCheckNoReadySrc).isNone

def useCheckNoErasedSrc : String :=
  "namespace SystemsLean.UseCheck\n"
  ++ "structure ConsumeEvent where\n"
  ++ "inductive Check where\n"
  ++ "def checkConsumeToken : Check := Check.ok\n"
  ++ "theorem checkConsumeToken_drop : True := by trivial\n"
  ++ "theorem checkConsumeToken_ok : True := by trivial\n"
  ++ "theorem checkConsumeToken_doubleSpend : True := by trivial\n"
  ++ "structure UseEvent where\n"
  ++ "def checkUnrestrictedShare : Check := Check.ok\n"
  ++ "theorem checkUnrestrictedShare_drop : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_once : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_share : True := by trivial\n"
  ++ "end SystemsLean.UseCheck\n"

def useCheckNoErasedNone : Bool :=
  (parseUseCheck useCheckNoErasedSrc).isNone

def useCheckOtherSrc : String :=
  "namespace SystemsLean.UseCheck\n"
  ++ "structure Other where\n"
  ++ "theorem t : True := by trivial\n"
  ++ "end SystemsLean.UseCheck\n"

def useCheckOtherNone : Bool :=
  (parseUseCheck useCheckOtherSrc).isNone

def useCheckCommentSrc : String :=
  "namespace SystemsLean.UseCheck\n"
  ++ "structure Other where\n"
  ++ "theorem t : True := by trivial\n"
  ++ "-- def checkConsumeToken\n"
  ++ "end SystemsLean.UseCheck\n"

def useCheckCommentNone : Bool :=
  (parseUseCheck useCheckCommentSrc).isNone

end SystemsLean.FranciscoUseCheck
