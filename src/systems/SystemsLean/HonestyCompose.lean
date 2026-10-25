/-
  Module: SystemsLean.HonestyCompose
  CapableCompose from freestandingCapableComposeReadOneSsot through main.
  FilePath, IO do, requireFile, containsStr, ssotBlock, match, and
  main's IO UInt32. filterArgs is the list match. A false Bool is not
  rewritten here. An IO action is not stored as Bool true. A missing
  file stays the requireFile arm. An empty read stays the error arm.
  `/` is a token so the path operator does not drop the rest.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyBound
import SystemsLean.HonestySpecList

namespace SystemsLean.HonestyCompose

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (isIdent isLetter isDigit isWs isIdentChar)
open SystemsLean.HonestyBound

inductive SpecParse where
  | skip
  | bad
  | got (cmd : Cmd) (rest : List String)

inductive TMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Same tokens as the spec list, plus `/` and `=`. An unknown
    character keeps the tokens so far. `=>` and `==` stay one token. -/
def tok : List Char -> TMode -> List String -> Option (List String)
  | [], TMode.norm, acc => some acc.reverse
  | [], TMode.id cur, acc => some (emitId acc cur).reverse
  | [], TMode.str _, _ => none
  | '"' :: rest, TMode.str cur, acc =>
    tok rest TMode.norm (emitStr acc cur)
  | c :: rest, TMode.str cur, acc =>
    tok rest (TMode.str (c :: cur)) acc
  | ':' :: '=' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (":=" :: acc)
  | ':' :: ':' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("::" :: acc)
  | '=' :: '>' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("=>" :: acc)
  | '=' :: '=' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("==" :: acc)
  | '=' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("=" :: acc)
  | '&' :: '&' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("&&" :: acc)
  | '+' :: '+' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("++" :: acc)
  | '+' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("+" :: acc)
  | '|' :: '|' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("||" :: acc)
  | '|' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("|" :: acc)
  | '-' :: '>' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("->" :: acc)
  | '<' :: '-' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("<-" :: acc)
  | '!' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("!" :: acc)
  | '>' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (">" :: acc)
  | '[' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("[" :: acc)
  | ']' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("]" :: acc)
  | '{' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("{" :: acc)
  | '}' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("}" :: acc)
  | ',' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("," :: acc)
  | ':' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (":" :: acc)
  | '(' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("(" :: acc)
  | ')' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (")" :: acc)
  | '.' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("." :: acc)
  | '/' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("/" :: acc)
  | '"' :: rest, TMode.norm, acc =>
    tok rest (TMode.str []) acc
  | c :: rest, TMode.norm, acc =>
    if isWs c then tok rest TMode.norm acc
    else if isLetter c || c == '_' then
      tok rest (TMode.id [c]) acc
    else if isDigit c then
      tok rest TMode.norm (String.mk [c] :: acc)
    else
      some acc.reverse
  | ':' :: '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (":=" :: emitId acc cur)
  | ':' :: ':' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("::" :: emitId acc cur)
  | '=' :: '>' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("=>" :: emitId acc cur)
  | '=' :: '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("==" :: emitId acc cur)
  | '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("=" :: emitId acc cur)
  | '&' :: '&' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("&&" :: emitId acc cur)
  | '+' :: '+' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("++" :: emitId acc cur)
  | '+' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("+" :: emitId acc cur)
  | '|' :: '|' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("||" :: emitId acc cur)
  | '|' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("|" :: emitId acc cur)
  | '-' :: '>' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("->" :: emitId acc cur)
  | '<' :: '-' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("<-" :: emitId acc cur)
  | '!' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("!" :: emitId acc cur)
  | '>' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (">" :: emitId acc cur)
  | '[' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("[" :: emitId acc cur)
  | ']' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("]" :: emitId acc cur)
  | '{' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("{" :: emitId acc cur)
  | '}' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("}" :: emitId acc cur)
  | ',' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("," :: emitId acc cur)
  | ':' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (":" :: emitId acc cur)
  | '(' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("(" :: emitId acc cur)
  | ')' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (")" :: emitId acc cur)
  | '.' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("." :: emitId acc cur)
  | '/' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("/" :: emitId acc cur)
  | c :: rest, TMode.id cur, acc =>
    if isIdentChar c then
      tok rest (TMode.id (c :: cur)) acc
    else if isWs c then
      tok rest TMode.norm (emitId acc cur)
    else
      some (emitId acc cur).reverse

def takeAll : List String -> List String -> Option (List String)
  | [], rest => some rest
  | w :: ws, t :: rest => if w == t then takeAll ws rest else none
  | _ :: _, [] => none

def q (s : String) : String :=
  "\"" ++ s ++ "\""

def yell (msg err : String) : List String :=
  [ "IO", ".", "eprintln", "s", "!", q msg
  , "throw", "(", "IO", ".", "userError", "s", "!", q err, ")" ]

def yellPlain (msg err : String) : List String :=
  [ "IO", ".", "eprintln", q msg
  , "throw", "(", "IO", ".", "userError", q err, ")" ]

def says (msg : String) : List String :=
  ["IO", ".", "println", "s", "!", q msg]

def saysPlain (msg : String) : List String :=
  ["IO", ".", "println", q msg]

def mutEmpty (name : String) : List String :=
  ["let", "mut", name, ":", "String", ":=", q ""]

def roleArm (role slot : String) : List String :=
  ["|", q role, "=>", slot, ":=", "content"]

def unlessMixed (needle msg err : String) : List String :=
  [ "unless", "containsStr", "composed", needle, "do"
  , "IO", ".", "eprintln", "s", "!", q msg
  , "throw", "(", "IO", ".", "userError", q err, ")" ]

def unlessLit (needle msg err : String) : List String :=
  ["unless", "containsStr", "composed", q needle, "do"]
    ++ yellPlain msg err

def call (fn : String) (args : List Term) : Term :=
  args.foldl (fun acc arg => Term.app acc arg) (Term.const (n fn))

def userErr (msg : String) : Term :=
  Term.app (Term.const (n "IO.userError")) (Term.litString msg)

def optBlock (varName : String) (scrut errNone errEmpty rest : Term) :
    Term :=
  Term.match_ scrut
    [ (Pat.ctor0 (n "none"), errNone)
    , (Pat.someVar (n varName),
        Term.ite
          (Term.proj (Term.var (n varName)) (n "isEmpty"))
          errEmpty rest) ]

/-- Empty content, a missing token, and a missing or empty block are
    errors. The last leaf is the content, not Bool true. -/
def readTerm (path spec : String) : Term :=
  Term.ite (Term.proj (Term.var (n "content")) (n "isEmpty"))
    (userErr ("empty " ++ path))
    (Term.ite
      (call "containsStr"
        [ Term.var (n "content")
        , Term.proj (Term.var (n spec)) (n "token") ])
      (optBlock "h"
        (call "ssotBlock"
          [ Term.var (n "content")
          , Term.proj (Term.var (n spec)) (n "headerBlock") ])
        (userErr ("missing HEADER " ++ spec))
        (userErr ("empty HEADER " ++ spec))
        (optBlock "b"
          (call "ssotBlock"
            [ Term.var (n "content")
            , Term.proj (Term.var (n spec)) (n "bodyBlock") ])
          (userErr ("missing BODY " ++ spec))
          (userErr ("empty BODY " ++ spec))
          (Term.var (n "content"))))
      (userErr ("missing token " ++ spec)))

def readCmd (path spec : String) : Cmd :=
  Cmd.defBind (n "freestandingCapableComposeReadOneSsot")
    [ (n path, HostType.named (n "System.FilePath"))
    , (n spec, HostType.named (n "ComposeSsotSpec")) ]
    (HostType.named (n "IO.String"))
    (readTerm path spec)

def readToks (path spec : String) : List String :=
  [ "requireFile", path, "s", "!"
  , q ("dual SSOT ({" ++ spec ++ ".token})")
  , "let", "content", "<-", "IO", ".", "FS", ".", "readFile", path
  , "if", "content", ".", "isEmpty", "then" ]
  ++ yell ("error: empty dual SSOT: {" ++ path ++ "}")
       ("empty {" ++ path ++ "}")
  ++ ["unless", "containsStr", "content", spec, ".", "token", "do"]
  ++ yell
       ("error: dual SSOT missing token {" ++ spec ++ ".token}: {"
         ++ path ++ "}")
       ("missing token {" ++ spec ++ ".token}")
  ++ [ "match", "ssotBlock", "content", spec, ".", "headerBlock", "with"
     , "|", "none", "=>" ]
  ++ yell
       ("error: dual SSOT missing HEADER block {" ++ spec
         ++ ".headerBlock}: {" ++ path ++ "}")
       ("missing HEADER {" ++ spec ++ ".headerBlock}")
  ++ ["|", "some", "h", "=>", "if", "h", ".", "isEmpty", "then"]
  ++ yell
       ("error: empty HEADER block {" ++ spec ++ ".headerBlock}: {"
         ++ path ++ "}")
       ("empty HEADER {" ++ spec ++ ".headerBlock}")
  ++ [ "match", "ssotBlock", "content", spec, ".", "bodyBlock", "with"
     , "|", "none", "=>" ]
  ++ yell
       ("error: dual SSOT missing BODY block {" ++ spec
         ++ ".bodyBlock}: {" ++ path ++ "}")
       ("missing BODY {" ++ spec ++ ".bodyBlock}")
  ++ ["|", "some", "b", "=>", "if", "b", ".", "isEmpty", "then"]
  ++ yell
       ("error: empty BODY block {" ++ spec ++ ".bodyBlock}: {"
         ++ path ++ "}")
       ("empty BODY {" ++ spec ++ ".bodyBlock}")
  ++ ["pure", "content"]

def piece (s : String) : List String :=
  ["s", "!", q s]

def markerToks (plan apply body : String) : List String :=
  piece ("{" ++ "writerPathStepCompose}\\n") ++ ["++"]
  ++ piece ("ROLE-plan:\\n{" ++ plan ++ "}\\n") ++ ["++"]
  ++ piece ("ROLE-apply:\\n{" ++ apply ++ "}\\n") ++ ["++"]
  ++ piece ("ROLE-body:\\n{" ++ body ++ "}\\n") ++ ["++"]
  ++ piece "STAGE:{stageId}\\n" ++ ["++"]
  ++ piece "CONTRACT:{contractStepCompose}\\n" ++ ["++"]
  ++ piece "GAP:{gapCompose}\\n"

def markerTerm (plan apply body : String) : Term :=
  call "++"
    [ call "++"
        [ call "++"
            [ call "++"
                [ call "++"
                    [ call "++"
                        [ Term.litString ("{" ++ "writerPathStepCompose}\\n")
                        , Term.litString
                            ("ROLE-plan:\\n{" ++ plan ++ "}\\n") ]
                    , Term.litString
                        ("ROLE-apply:\\n{" ++ apply ++ "}\\n") ]
                , Term.litString ("ROLE-body:\\n{" ++ body ++ "}\\n") ]
            , Term.litString "STAGE:{stageId}\\n" ]
        , Term.litString "CONTRACT:{contractStepCompose}\\n" ]
    , Term.litString "GAP:{gapCompose}\\n" ]

def markerCmd (plan apply body : String) : Cmd :=
  Cmd.defBind (n "buildComposeMarker")
    [ (n plan, HostType.string)
    , (n apply, HostType.string)
    , (n body, HostType.string) ]
    HostType.string
    (markerTerm plan apply body)

def need (needle err : String) (rest : Term) : Term :=
  Term.ite
    (call "containsStr"
      [Term.var (n "composed"), Term.var (n needle)])
    rest
    (userErr err)

def needLit (needle err : String) (rest : Term) : Term :=
  Term.ite
    (call "containsStr"
      [Term.var (n "composed"), Term.litString needle])
    rest
    (userErr err)

def orEmpty : Term :=
  call "||"
    [ call "||"
        [ Term.proj (Term.var (n "planText")) (n "isEmpty")
        , Term.proj (Term.var (n "applyText")) (n "isEmpty") ]
    , Term.proj (Term.var (n "bodyText")) (n "isEmpty") ]

/-- Incomplete inputs and a missing marker id are errors.
    The leaf is the marker call, not Bool true. -/
def planTerm : Term :=
  Term.ite orEmpty
    (userErr "incomplete compose inputs")
    (need "writerPathStepCompose" "missing compose step id"
      (need "contractStepCompose" "missing compose contract id"
        (needLit "HOST-EMIT-PLAN" "missing HOST-EMIT-PLAN in composed"
          (needLit "HOST-EMIT-APPLY" "missing HOST-EMIT-APPLY in composed"
            (needLit "HOST-EMIT-BODY" "missing HOST-EMIT-BODY in composed"
              (need "gapCompose" "missing compose gap id"
                (need "stageId" "missing compose stage id"
                  (call "buildComposeMarker"
                    [ Term.var (n "planText")
                    , Term.var (n "applyText")
                    , Term.var (n "bodyText") ]))))))))

def planCmd (root : String) : Cmd :=
  Cmd.defBind (n "freestandingCapableComposePlanApplyBody")
    [(n root, HostType.named (n "System.FilePath"))]
    (HostType.named (n "IO.Unit"))
    planTerm

def planToks (root : String) : List String :=
  [ "let", "emitDir", ":=", root, "/", q "src", "/", q "systems", "/"
  , q "emit" ]
  ++ says "== {stageId}: freestanding-capable COMPOSE plan/apply/body =="
  ++ says "  host: {hostId} / {selfHostId}"
  ++ says ("  contract: {contractStepCompose} "
      ++ "(productPathFreestandingCapableStepContractComposeSatisfied)")
  ++ says ("  gap: {gapCompose} (B14 CapableCompose true after B27 "
      ++ "Lake-free freestanding-capable-compose-lake-free; "
      ++ "this path is Lake exe diagnostic)")
  ++ says "  step: {writerPathStepCompose}"
  ++ says "  API: {freestandingCapableComposeApi}"
  ++ saysPlain
       "  authority: not FreestandingEmit (no import; no emit-at-root/render)"
  ++ says ("    productPathFreestandingCapableComposeAuthorityNotEmit: "
      ++ "{productPathFreestandingCapableComposeAuthorityNotEmit}")
  ++ says ("    productPathFreestandingCapableComposeDependsOnLake: "
      ++ "{productPathFreestandingCapableComposeDependsOnLake} "
      ++ "(Lake exe host diagnostic; Lake-free measure is "
      ++ "freestanding-capable-compose-lake-free)")
  ++ saysPlain
       ("  depth: IO.FS.readFile + token + HEADER/BODY + "
         ++ "ordered plan/apply/body marker")
  ++ saysPlain
       "  not: Mult..Apply template embed; not write; not perform claimed"
  ++ mutEmpty "planText" ++ mutEmpty "applyText" ++ mutEmpty "bodyText"
  ++ [ "for", "spec", "in", "planApplyBodySpecs", "do"
     , "let", "path", ":=", "emitDir", "/", "spec", ".", "base"
     , "let", "content", "<-"
     , "freestandingCapableComposeReadOneSsot", "path", "spec" ]
  ++ says ("  compose input ok: {path} ({spec.token}; "
      ++ "{spec.headerBlock}/{spec.bodyBlock}; {spec.role})")
  ++ ["match", "spec", ".", "role", "with"]
  ++ roleArm "plan" "planText"
  ++ roleArm "apply" "applyText"
  ++ roleArm "body" "bodyText"
  ++ ["|", "other", "=>"]
  ++ yell "error: unknown compose role {other} for {spec.base}"
       "unknown compose role {other}"
  ++ [ "if", "planText", ".", "isEmpty", "||", "applyText", ".", "isEmpty"
     , "||", "bodyText", ".", "isEmpty", "then" ]
  ++ yellPlain "error: plan/apply/body compose inputs incomplete"
       "incomplete compose inputs"
  ++ [ "let", "composed", ":="
     , "buildComposeMarker", "planText", "applyText", "bodyText" ]
  ++ unlessMixed "writerPathStepCompose"
       "error: composed missing step id {writerPathStepCompose}"
       "missing compose step id"
  ++ unlessMixed "contractStepCompose"
       "error: composed missing contract {contractStepCompose}"
       "missing compose contract id"
  ++ unlessLit "HOST-EMIT-PLAN"
       "error: composed missing HOST-EMIT-PLAN"
       "missing HOST-EMIT-PLAN in composed"
  ++ unlessLit "HOST-EMIT-APPLY"
       "error: composed missing HOST-EMIT-APPLY"
       "missing HOST-EMIT-APPLY in composed"
  ++ unlessLit "HOST-EMIT-BODY"
       "error: composed missing HOST-EMIT-BODY"
       "missing HOST-EMIT-BODY in composed"
  ++ unlessMixed "gapCompose"
       "error: composed missing gap {gapCompose}"
       "missing compose gap id"
  ++ unlessMixed "stageId"
       "error: composed missing stage {stageId}"
       "missing compose stage id"
  ++ says ("GREEN {stageId}: freestanding-capable composed "
      ++ "plan/apply/body marker ({composed.length} chars)")
  ++ saysPlain
       ("  FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE advanced "
         ++ "(no-emit authority)")
  ++ saysPlain
       ("  honest: Full unsatisfied; WriteHcSatisfied is B18; "
         ++ "perform claimed false; complete false")
  ++ saysPlain
       ("  B14 productPathFreestandingCapableCompose true after B27 "
         ++ "(just freestanding-capable-compose-lake-free)")
  ++ saysPlain
       ("  note: CapableWriteHc true after B28 "
         ++ "freestanding-capable-write-hc-lake-free")

/-- Nil drops nothing. The `"--"` cons drops that cell. The other cons
    keeps the cell. This is not Bool true. -/
def filterTerm : Term :=
  Term.match_ (Term.var (n "args"))
    [ (Pat.ctor0 (n "nil"), Term.const (n "List.nil"))
    , (Pat.ctor0 (n "cons"),
        call "filterArgs" [Term.var (n "rest")])
    , (Pat.ctor0 (n "cons"),
        call "::"
          [ Term.var (n "a")
          , call "filterArgs" [Term.var (n "rest")] ]) ]

def filterCmd : Cmd :=
  Cmd.def_ (n "filterArgs")
    (some (HostType.arrow
      (HostType.named (n "List String"))
      (HostType.named (n "List String"))))
    filterTerm

def filterToks : List String :=
  [ "def", "filterArgs", ":", "List", "String", "->", "List", "String"
  , "|", "[", "]", "=>", "[", "]"
  , "|", q "--", "::", "rest", "=>", "filterArgs", "rest"
  , "|", "a", "::", "rest", "=>", "a", "::", "filterArgs", "rest" ]

/-- Exit 0 only on the ok arm. Exit 1 is the failure arm. -/
def mainTerm : Term :=
  Term.ite
    (Term.var (n "productPathFreestandingCapableComposeOk"))
    (Term.litNat 0)
    (Term.litNat 1)

def mainCmd (args : String) : Cmd :=
  Cmd.defBind (n "main")
    [(n args, HostType.named (n "List String"))]
    (HostType.named (n "IO.UInt32"))
    mainTerm

def mainToks (args : String) : List String :=
  [ "let", "root", ":", "System", ".", "FilePath", ":="
  , "match", "filterArgs", args, "with"
  , "|", "r", "::", "_", "=>", "System", ".", "FilePath", ".", "mk", "r"
  , "|", "[", "]", "=>", q "."
  , "try"
  , "unless", "productPathFreestandingCapableComposeOk", "do"
  , "IO", ".", "eprintln", "s", "!", q "error: {stageId} surface not ok"
  , "throw", "(", "IO", ".", "userError"
  , q "productPathFreestandingCapableComposeOk false", ")"
  , "freestandingCapableComposePlanApplyBody", "root"
  , "pure", "0"
  , "catch", "e", "=>"
  , "IO", ".", "eprintln", "s", "!", q "{e}"
  , "pure", "1" ]

def parseNamed (ts : List String) : Bound :=
  match ts with
  | "def" :: "freestandingCapableComposeReadOneSsot" :: "(" :: p
      :: ":" :: "System" :: "." :: "FilePath" :: ")" :: "(" :: spec
      :: ":" :: "ComposeSsotSpec" :: ")" :: ":" :: "IO" :: "String"
      :: ":=" :: "do" :: rest =>
    if isIdent p && isIdent spec then
      match takeAll (readToks p spec) rest with
      | some rest2 => Bound.got (readCmd p spec) rest2
      | none => Bound.bad
    else
      Bound.bad
  | "def" :: "freestandingCapableComposeReadOneSsot" :: _ =>
    Bound.bad
  | "def" :: "buildComposeMarker" :: "(" :: x :: y :: z
      :: ":" :: "String" :: ")" :: ":" :: "String" :: ":=" :: rest =>
    if isIdent x && isIdent y && isIdent z then
      match takeAll (markerToks x y z) rest with
      | some rest2 => Bound.got (markerCmd x y z) rest2
      | none => Bound.bad
    else
      Bound.bad
  | "def" :: "buildComposeMarker" :: _ => Bound.bad
  | "def" :: "freestandingCapableComposePlanApplyBody" :: "(" :: root
      :: ":" :: "System" :: "." :: "FilePath" :: ")"
      :: ":" :: "IO" :: "Unit" :: ":=" :: "do" :: rest =>
    if isIdent root then
      match takeAll (planToks root) rest with
      | some rest2 => Bound.got (planCmd root) rest2
      | none => Bound.bad
    else
      Bound.bad
  | "def" :: "freestandingCapableComposePlanApplyBody" :: _ =>
    Bound.bad
  | "def" :: "main" :: "(" :: args :: ":" :: "List" :: "String" :: ")"
      :: ":" :: "IO" :: "UInt32" :: ":=" :: "do" :: rest =>
    if isIdent args then
      match takeAll (mainToks args) rest with
      | some rest2 => Bound.got (mainCmd args) rest2
      | none => Bound.skip
    else
      Bound.skip
  | _ => Bound.skip

/-- Another paren header is skip, so Capable's main still reaches
    its own parser. A compose header with the wrong body is bad. -/
def parseIo (ts : List String) : Bound :=
  parseNamed ts

def parseFilter (ts : List String) : SpecParse :=
  match ts with
  | "def" :: "filterArgs" :: _ =>
    match takeAll filterToks ts with
    | some rest => SpecParse.got filterCmd rest
    | none => SpecParse.bad
  | _ => SpecParse.skip

/-- The spec list first. filterArgs only when that list does not match.
    Any other colon def stays skip. -/
def parseSpecList (ts : List String) : SpecParse :=
  match SystemsLean.HonestySpecList.parseSpecList ts with
  | SystemsLean.HonestySpecList.SpecParse.bad => SpecParse.bad
  | SystemsLean.HonestySpecList.SpecParse.got cmd rest =>
    SpecParse.got cmd rest
  | SystemsLean.HonestySpecList.SpecParse.skip => parseFilter ts

def notBoolCmd : Cmd -> Bool
  | Cmd.defBind _ _ _ (Term.litBool _) => false
  | Cmd.def_ _ _ (Term.litBool _) => false
  | _ => true

def readHeader : List String :=
  [ "def", "freestandingCapableComposeReadOneSsot", "(", "path", ":"
  , "System", ".", "FilePath", ")", "(", "spec", ":", "ComposeSsotSpec"
  , ")", ":", "IO", "String", ":=", "do" ]

def readAccepts : Bool :=
  match parseIo (readHeader ++ readToks "path" "spec") with
  | Bound.got cmd [] => notBoolCmd cmd
  | _ => false

def readDropsRequire : Bool :=
  match parseIo (readHeader ++ ["pure", "content"]) with
  | Bound.bad => true
  | _ => false

def filterAccepts : Bool :=
  match parseSpecList filterToks with
  | SpecParse.got cmd [] => notBoolCmd cmd
  | _ => false

def capableMainSkips : Bool :=
  match parseIo
      [ "def", "main", "(", "_args", ":", "List", "String", ")"
      , ":", "IO", "UInt32", ":=", "do", "try"
      , "printGapMeasure", "pure", "0" ] with
  | Bound.skip => true
  | _ => false

end SystemsLean.HonestyCompose
