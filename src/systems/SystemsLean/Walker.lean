/-
  Module: SystemsLean.Walker
  Reader for namespace SystemsLean.UseCheck.
  Looks at ConsumeEvent, checkConsumeToken, UseEvent,
  and checkUnrestrictedShare.
  Also looks at checkErasedAbsent and def erasedAbsentUseCheckReady.
  The reader also looks at def checkConsumeTokenOk
  and def checkUnrestrictedShareOk.
  The reader also looks at inductive Grade, structure TypedUse,
  structure TypedBinder, def checkGrade, def checkTypedUse,
  def checkTypedUseOk, def checkBinders, def checkBindersOk,
  def typedUseCheckReady, and def allTypesUseCheckDone.
  The reader also looks at inductive Remain, def remainOfGrade,
  def stepRemain, def checkTelescope, def checkTelescopeOk,
  and def telescopeUseCheckReady.
  The reader also looks at inductive UseTerm, def termBinders, def usesOf,
  def checkTerm, def checkTermOk, and def termUseCheckReady.
  The reader also looks at def letUseCheckReady.
  The reader also looks at constructor matchCase and
  def matchUseCheckReady.
  The reader also looks at constructor mutualBind and
  def mutualUseCheckReady.
  The reader also looks at constructor theoremBody, theorem
  checkTerm_theorem_spent, and def theoremBodyUseCheckReady.
  The reader also looks at constructor lam, theorem
  checkTerm_lam_spent, and def lamUseCheckReady.
  The reader also looks at constructor app, theorem
  checkTerm_app_spent, and def appUseCheckReady.
  The reader also looks at def consumeTokenUseCheckReady,
  def unrestrictedShareUseCheckReady, and constructor letBind.
  The reader also looks at abbrev TokenId, def consumeCount,
  and def useCount.
  The reader also looks at def lookupGrade, def lookupRemain,
  def setRemain, and def remainBinders. The reader also looks
  at def bindAppend and def useAppend.
  The reader also looks at def leftoverRemain, def checkTelescopeGo,
  and def typedCount.
  The reader also looks at def Grade.name, def typedGradeUniform,
  and constructor var. The reader also looks at Grade constructors
  erased, linear, and share. The reader also looks at Check
  constructors ok, drop, and doubleSpend, and Remain constructors
  spent, once, and many. The reader also looks at field
  id : TokenId, field grade : Grade, Grade.name match arms
  Grade.erased, Grade.linear, and Grade.share, and UseTerm match
  arms UseTerm.var, UseTerm.lam, UseTerm.app, UseTerm.letBind,
  UseTerm.matchCase, UseTerm.mutualBind, and UseTerm.theoremBody.
  The reader also looks at Remain match arms Remain.once,
  Remain.spent, and Remain.many, match arms 0 =>, 1 =>, _ =>,
  [] =>, and Check.ok =>, and constructor type ascriptions
  var (id : TokenId), lam (id : TokenId), app (fn : UseTerm),
  and letBind (id : TokenId). The reader also looks at
  constructor type ascriptions matchCase (id : TokenId),
  mutualBind (idL : TokenId), and theoremBody (id : TokenId),
  Option and list match arms none =>, some g =>, some r =>,
  b :: rest =>, and u :: rest =>, and Grade remain-result
  arms Grade.erased => Remain.spent, Grade.linear => Remain.once,
  and Grade.share => Remain.many. The reader also looks at
  match consumeCount tokenId log with, match useCount tokenId
  log with, and (left : UseTerm) (right : UseTerm), plus match
  g with, match n with, match binders with, match log with,
  match r with, match lookupGrade id binders with, match
  lookupGrade u.id binders with, match lookupRemain u.id rs
  with, match stepRemain g r with, and match checkTypedUse
  b.id b.grade log with.
  Erased / grade / binder / telescope / term / let / match / mutual
  theorems live in UseCheckTheorems; this reader still requires
  theoremBody names, lam names, and app names on the UseCheck source. Four
  structures and seven theorems are required. No main and no raw string.
  A longer name does not count. A comment does not count.
  Long-file split: let / match / mutual / theoremBody / lam / app none-fixtures
  and typed / telescope / term / consume / share shape fixtures live in
  SystemsLean.WalkerTheorems (same namespace). parseUseCheck,
  seesDecls, and useCheckCoreSrc stay in this file.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  allTypesUseCheckDone stays false.
  Module must stay ASCII.
-/

import SystemsLean.TopScan

namespace SystemsLean.Walker

open SystemsLean.HostTerm
open SystemsLean.TopScan

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
    && hasLine (bounded "abbrev TokenId") lines
    && hasLine (bounded "structure ConsumeEvent") lines
    && hasLine (bounded "inductive Check") lines
    && hasLine (bounded "| ok") lines
    && hasLine (bounded "| drop") lines
    && hasLine (bounded "| doubleSpend") lines
    && hasLine (bounded "def consumeCount") lines
    && hasLine (bounded "def checkConsumeToken") lines
    && hasLine (bounded "def checkConsumeTokenOk") lines
    && hasLine (bounded "theorem checkConsumeToken_drop") lines
    && hasLine (bounded "theorem checkConsumeToken_ok") lines
    && hasLine (bounded "theorem checkConsumeToken_doubleSpend") lines
    && hasLine (bounded "def consumeTokenUseCheckReady") lines
    && hasLine (bounded "structure UseEvent") lines
    && hasLine (bounded "def useCount") lines
    && hasLine (bounded "def checkUnrestrictedShare") lines
    && hasLine (bounded "def checkUnrestrictedShareOk") lines
    && hasLine (bounded "theorem checkUnrestrictedShare_drop") lines
    && hasLine (bounded "theorem checkUnrestrictedShare_once") lines
    && hasLine (bounded "theorem checkUnrestrictedShare_share") lines
    && hasLine (bounded "def unrestrictedShareUseCheckReady") lines
    && hasLine (bounded "def checkErasedAbsent") lines
    && hasLine (bounded "def erasedAbsentUseCheckReady") lines
    && hasLine (bounded "inductive Grade") lines
    && hasLine (bounded "| erased") lines
    && hasLine (bounded "| linear") lines
    && hasLine (bounded "| share") lines
    && hasLine (bounded "def Grade.name") lines
    && hasLine (bounded "| Grade.erased") lines
    && hasLine (bounded "| Grade.linear") lines
    && hasLine (bounded "| Grade.share") lines
    && hasLine (bounded "structure TypedUse") lines
    && hasLine (bounded "id : TokenId") lines
    && hasLine (bounded "grade : Grade") lines
    && hasLine (bounded "structure TypedBinder") lines
    && hasLine (bounded "def typedCount") lines
    && hasLine (bounded "def typedGradeUniform") lines
    && hasLine (bounded "def checkGrade") lines
    && hasLine (bounded "def checkTypedUse") lines
    && hasLine (bounded "def checkTypedUseOk") lines
    && hasLine (bounded "def checkBinders") lines
    && hasLine (bounded "def checkBindersOk") lines
    && hasLine (bounded "def typedUseCheckReady") lines
    && hasLine (bounded "inductive Remain") lines
    && hasLine (bounded "| spent") lines
    && hasLine (bounded "| once") lines
    && hasLine (bounded "| many") lines
    && hasLine (bounded "def remainOfGrade") lines
    && hasLine (bounded "def stepRemain") lines
    && hasLine (bounded "def lookupGrade") lines
    && hasLine (bounded "def lookupRemain") lines
    && hasLine (bounded "def setRemain") lines
    && hasLine (bounded "def remainBinders") lines
    && hasLine (bounded "def leftoverRemain") lines
    && hasLine (bounded "def checkTelescopeGo") lines
    && hasLine (bounded "def checkTelescope") lines
    && hasLine (bounded "def checkTelescopeOk") lines
    && hasLine (bounded "def telescopeUseCheckReady") lines
    && hasLine (bounded "def bindAppend") lines
    && hasLine (bounded "def useAppend") lines
    && hasLine (bounded "inductive UseTerm") lines
    && hasLine (bounded "def termBinders") lines
    && hasLine (bounded "def usesOf") lines
    && hasLine (bounded "| UseTerm.var") lines
    && hasLine (bounded "| UseTerm.lam") lines
    && hasLine (bounded "| UseTerm.app") lines
    && hasLine (bounded "| UseTerm.letBind") lines
    && hasLine (bounded "| UseTerm.matchCase") lines
    && hasLine (bounded "| UseTerm.mutualBind") lines
    && hasLine (bounded "| UseTerm.theoremBody") lines
    && hasLine (bounded "def checkTerm") lines
    && hasLine (bounded "def checkTermOk") lines
    && hasLine (bounded "def termUseCheckReady") lines
    && hasLine (bounded "| var") lines
    && hasLine (bounded "| lam") lines
    && hasLine (bounded "theorem checkTerm_lam_spent") lines
    && hasLine (bounded "def lamUseCheckReady") lines
    && hasLine (bounded "| app") lines
    && hasLine (bounded "theorem checkTerm_app_spent") lines
    && hasLine (bounded "def appUseCheckReady") lines
    && hasLine (bounded "| letBind") lines
    && hasLine (bounded "def letUseCheckReady") lines
    && hasLine (bounded "| matchCase") lines
    && hasLine (bounded "def matchUseCheckReady") lines
    && hasLine (bounded "| mutualBind") lines
    && hasLine (bounded "def mutualUseCheckReady") lines
    && hasLine (bounded "| theoremBody") lines
    && hasLine (bounded "theorem checkTerm_theorem_spent") lines
    && hasLine (bounded "def theoremBodyUseCheckReady") lines
    && hasLine (bounded "def allTypesUseCheckDone") lines
    && hasLine (bounded "| Remain.once") lines
    && hasLine (bounded "| Remain.spent") lines
    && hasLine (bounded "| Remain.many") lines
    && hasLine (bounded "| 0 =>") lines
    && hasLine (bounded "| 1 =>") lines
    && hasLine (bounded "| _ =>") lines
    && hasLine (bounded "| [] =>") lines
    && hasLine (bounded "| Check.ok =>") lines
    && hasLine (bounded "| var (id : TokenId)") lines
    && hasLine (bounded "| lam (id : TokenId)") lines
    && hasLine (bounded "| app (fn : UseTerm)") lines
    && hasLine (bounded "| letBind (id : TokenId)") lines
    && hasLine (bounded "| matchCase (id : TokenId)") lines
    && hasLine (bounded "| mutualBind (idL : TokenId)") lines
    && hasLine (bounded "| theoremBody (id : TokenId)") lines
    && hasLine (bounded "| none =>") lines
    && hasLine (bounded "| some g =>") lines
    && hasLine (bounded "| some r =>") lines
    && hasLine (bounded "| b :: rest =>") lines
    && hasLine (bounded "| u :: rest =>") lines
    && hasLine (bounded "| Grade.erased => Remain.spent") lines
    && hasLine (bounded "| Grade.linear => Remain.once") lines
    && hasLine (bounded "| Grade.share => Remain.many") lines
    && hasLine (bounded "match consumeCount tokenId log with") lines
    && hasLine (bounded "match useCount tokenId log with") lines
    && hasLine (bounded "(left : UseTerm) (right : UseTerm)") lines
    && hasLine (bounded "match g with") lines
    && hasLine (bounded "match n with") lines
    && hasLine (bounded "match binders with") lines
    && hasLine (bounded "match log with") lines
    && hasLine (bounded "match r with") lines
    && hasLine (bounded "match lookupGrade id binders with") lines
    && hasLine (bounded "match lookupGrade u.id binders with") lines
    && hasLine (bounded "match lookupRemain u.id rs with") lines
    && hasLine (bounded "match stepRemain g r with") lines
    && hasLine (bounded "match checkTypedUse b.id b.grade log with") lines
    && hasLine (bounded "| Grade.share => Check.ok") lines
    && hasLine (bounded "if typedGradeUniform tokenId expected log then") lines
    && hasLine (bounded "| bad => bad") lines
    && hasLine (bounded "| Remain.once => (Check.ok, Remain.spent)") lines
    && hasLine (bounded "| Remain.spent => (Check.doubleSpend, Remain.spent)") lines
    && hasLine (bounded "| Remain.many => (Check.drop, r)") lines
    && hasLine (bounded "| (id, r) :: rest =>") lines
    && hasLine (bounded "| (id, r0) :: rest =>") lines
    && hasLine (bounded "| (_, Remain.once) :: _ => Check.drop") lines
    && hasLine (bounded "| _ :: rest => leftoverRemain rest") lines
    && hasLine (bounded "if g == u.grade then") lines
    && hasLine (bounded "| (Check.ok, r') =>") lines
    && hasLine (bounded "| (bad, _) => bad") lines
    && hasLine (bounded "| [], ys => ys") lines
    && hasLine (bounded "| x :: xs, ys => x :: bindAppend xs ys") lines
    && hasLine (bounded "| 0 => Check.drop") lines
    && hasLine (bounded "| 1 => Check.ok") lines
    && hasLine (bounded "| _ => Check.doubleSpend") lines
    && hasLine (bounded "| 0 => Check.ok") lines
    && hasLine (bounded "| _ => Check.drop") lines
    && hasLine (bounded "checkGrade expected (typedCount tokenId log)") lines
    && hasLine (bounded "| Check.ok => checkBinders rest log") lines
    && hasLine (bounded "| Remain.many => (Check.ok, Remain.many)") lines
    && hasLine (bounded "| _ => (Check.drop, r)") lines
    && hasLine (bounded "| Remain.spent => (Check.drop, Remain.spent)") lines
    && hasLine (bounded "| _ => Check.ok") lines
    && hasLine (bounded "| [] => leftoverRemain rs") lines
    && hasLine (bounded "| none => checkTelescopeGo binders rs rest") lines
    && hasLine (bounded "| none => Check.drop") lines
    && hasLine (bounded "| x :: xs, ys => x :: useAppend xs ys") lines
    && hasLine (bounded "| [] => Check.ok") lines
    && hasLine (bounded "| [] => none") lines
    && hasLine (bounded "| [] => []") lines
    && hasLine (bounded "| Grade.erased => \"MULT-0\"") lines
    && hasLine (bounded "| Grade.linear => \"MULT-1\"") lines
    && hasLine (bounded "| Grade.share => \"MULT-OMEGA\"") lines
    && hasLine (bounded "| UseTerm.var _ => []") lines
    && hasLine (bounded "| none => []") lines
    && hasLine (bounded "| some g => [{ id := id, grade := g }]") lines
    && hasLine (bounded "| b :: rest => (b.id, remainOfGrade b.grade) :: remainBinders rest") lines
    && hasLine (bounded "if id == tokenId then some r else lookupRemain tokenId rest") lines
    && hasLine (bounded "if id == tokenId then (id, r) :: rest") lines
    && hasLine (bounded "else (id, r0) :: setRemain tokenId r rest") lines
    && hasLine (bounded "if b.id == tokenId then some b.grade else lookupGrade tokenId rest") lines
    && hasLine (bounded "| UseTerm.lam id g body =>") lines
    && hasLine (bounded "| UseTerm.app fn arg =>") lines
    && hasLine (bounded "| UseTerm.letBind id g value body =>") lines
    && hasLine (bounded "| UseTerm.matchCase id g disc branch =>") lines
    && hasLine (bounded "| UseTerm.mutualBind idL gL idR gR left right =>") lines
    && hasLine (bounded "| UseTerm.theoremBody id g ty proof =>") lines
    && hasLine (bounded "| UseTerm.var id =>") lines

def parseUseCheck (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsHead sc != "SystemsLean.UseCheck" then none
    else if sc.structN < 4 || sc.theoremN < 7 then none
    else if sc.mainN != 0 || sc.rawN != 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else if boolSuf sc "allTypesUseCheckDone" == some true then none
    else if !seesDecls (codeLines src) then none
    else cmdsOf sc (nsHead sc) true

def useCheckCoreSrc : String :=
  "namespace SystemsLean.UseCheck\n"
  ++ "abbrev TokenId := Nat\n"
  ++ "structure ConsumeEvent where\n"
  ++ "inductive Check where\n"
  ++ "| ok\n"
  ++ "| drop\n"
  ++ "| doubleSpend\n"
  ++ "def consumeCount : Nat := 0\n"
  ++ "def checkConsumeToken : Check := Check.ok\n"
  ++ "def checkConsumeTokenOk : Bool := false\n"
  ++ "theorem checkConsumeToken_drop : True := by trivial\n"
  ++ "theorem checkConsumeToken_ok : True := by trivial\n"
  ++ "theorem checkConsumeToken_doubleSpend : True := by trivial\n"
  ++ "def consumeTokenUseCheckReady : Bool := false\n"
  ++ "structure UseEvent where\n"
  ++ "def useCount : Nat := 0\n"
  ++ "def checkUnrestrictedShare : Check := Check.ok\n"
  ++ "def checkUnrestrictedShareOk : Bool := false\n"
  ++ "theorem checkUnrestrictedShare_drop : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_once : True := by trivial\n"
  ++ "theorem checkUnrestrictedShare_share : True := by trivial\n"
  ++ "def unrestrictedShareUseCheckReady : Bool := false\n"
  ++ "def checkErasedAbsent : Check := Check.ok\n"
  ++ "theorem checkErasedAbsent_absent : True := by trivial\n"
  ++ "theorem checkErasedAbsent_once : True := by trivial\n"
  ++ "theorem checkErasedAbsent_many : True := by trivial\n"
  ++ "def erasedAbsentUseCheckReady : Bool := false\n"

end SystemsLean.Walker
