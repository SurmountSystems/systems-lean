/-
  Module: SystemsLean.HonestyReadFront
  Front for namespace SystemsLean.CapableRead.
  No import. The file name is not hardcoded.
  String and Bool pins must be the stored literals.
  DualSsotSpec has four String fields: base, token,
  headerBlock, bodyBlock. The list dualSsotSpecs is those
  twelve records, in that order. A fifth role field is none.
  productPathFreestandingCapableStepContractFullSatisfied
  stays false. Bool true is not that pin.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyCapable
import SystemsLean.HonestyRequire
import SystemsLean.HonestyCompose

namespace SystemsLean.HonestyReadFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip unquote parseDotted parseFuel isIdent)
open SystemsLean.HonestyBound (Bound)
open SystemsLean.HonestyRequire (parseBinderDef)
open SystemsLean.HonestyCompose (tok TMode SpecParse parseFilter)
open SystemsLean.HonestyCapable (CapEnv)

def nsRead : String := "SystemsLean.CapableRead"

def wantStr : List (Prod String String) :=
  [ ("stageId",
      "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0")
  , ("hostId",
      "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ")
  , ("selfHostId",
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ")
  , ("contractStepRead",
      "FREESTANDING-CAPABLE-STEP-CONTRACT-READ")
  , ("gapReadSsot", "FREESTANDING-PERFORM-GAP-READ-SSOT")
  , ("lakeExeName", "slake-freestanding-capable-read")
  , ("justRecipeName", "freestanding-capable-read")
  , ("productPathFreestandingCapableReadLakeFreeRecipe",
      "freestanding-capable-read-lake-free")
  , ("freestandingCapableReadApi", "freestandingCapableReadDualSsot") ]

def fullName : String :=
  "productPathFreestandingCapableStepContractFullSatisfied"

def okName : String :=
  "productPathFreestandingCapableReadOk"

def readyName : String :=
  "productPathFreestandingCapableReadPartialReady"

def authName : String :=
  "productPathFreestandingCapableReadAuthorityNotEmit"

def lakeName : String :=
  "productPathFreestandingCapableReadDependsOnLake"

def seeds : List (List String) :=
  [ ["host_emit_mult.ssot.txt", "HOST-EMIT-MULT",
      "MULT_C_HEADER", "MULT_C_BODY"]
  , ["host_emit_linear.ssot.txt", "HOST-EMIT-LINEAR",
      "LINEAR_C_HEADER", "LINEAR_C_BODY"]
  , ["host_emit_erasure.ssot.txt", "HOST-EMIT-ERASURE",
      "ERASURE_C_HEADER", "ERASURE_C_BODY"]
  , ["host_emit_extract.ssot.txt", "HOST-EMIT-EXTRACT",
      "EXTRACT_C_HEADER", "EXTRACT_C_BODY"]
  , ["host_emit_types.ssot.txt", "HOST-EMIT-TYPES",
      "TYPES_C_HEADER", "TYPES_C_BODY"]
  , ["host_emit_program.ssot.txt", "HOST-EMIT-PROGRAM",
      "PROGRAM_C_HEADER", "PROGRAM_C_BODY"]
  , ["host_emit_graph.ssot.txt", "HOST-EMIT-GRAPH",
      "GRAPH_C_HEADER", "GRAPH_C_BODY"]
  , ["host_emit_compose.ssot.txt", "HOST-EMIT-COMPOSE",
      "COMPOSE_C_HEADER", "COMPOSE_C_BODY"]
  , ["host_emit_plan.ssot.txt", "HOST-EMIT-PLAN",
      "PLAN_C_HEADER", "PLAN_C_BODY"]
  , ["host_emit_apply.ssot.txt", "HOST-EMIT-APPLY",
      "APPLY_C_HEADER", "APPLY_C_BODY"]
  , ["host_emit_body_fragment.ssot.txt", "HOST-EMIT-SSOT",
      "BODY_C_HEADER", "BODY_C_BODY"]
  , ["host_emit_banner.ssot.txt", "HOST-EMIT-BANNER",
      "BANNER_C_HEADER", "BANNER_C_BODY"] ]

def litOf (c : Cmd) : Option (Prod String String) :=
  match c with
  | Cmd.def_ nm (some HostType.string) (Term.litString s) =>
    some (nm.raw, s)
  | _ => none

def boolLit (c : Cmd) : Option (Prod String Bool) :=
  match c with
  | Cmd.def_ nm (some HostType.bool) (Term.litBool b) =>
    some (nm.raw, b)
  | _ => none

def takeStr (cs : List Cmd) (acc : List (Prod String String)) :
    Option (Prod (List (Prod String String)) (List Cmd)) :=
  match cs with
  | [] => some (acc.reverse, [])
  | c :: rest =>
    match litOf c with
    | some p => takeStr rest (p :: acc)
    | none => some (acc.reverse, cs)

def twoTrue (cs : List Cmd) : Bool :=
  match cs with
  | [c1, c2] =>
    match boolLit c1, boolLit c2 with
    | some (n1, true), some (n2, true) =>
      n1 == authName && n2 == lakeName
    | _, _ => false
  | _ => false

def fieldsOk (c : Cmd) : Bool :=
  match c with
  | Cmd.structure_ nm fs _ =>
    nm.raw == "DualSsotSpec"
      && fs.map (fun f => f.name.raw)
        == ["base", "token", "headerBlock", "bodyBlock"]
  | _ => false

def takeAll : List String -> List String -> Option (List String)
  | [], rest => some rest
  | w :: ws, t :: rest => if w == t then takeAll ws rest else none
  | _ :: _, [] => none

def q4 (seed : List String) (ts : List String) :
    Option (Prod Term (List String)) :=
  match seed, ts with
  | [b, tokS, h, y],
    "{" :: "base" :: ":=" :: lb :: ","
      :: "token" :: ":=" :: lt :: ","
      :: "headerBlock" :: ":=" :: lh :: ","
      :: "bodyBlock" :: ":=" :: ly :: "}" :: rest =>
    match unquote lb, unquote lt, unquote lh, unquote ly with
    | some sb, some st, some sh, some sy =>
      if sb == b && st == tokS && sh == h && sy == y then
        some (Term.structLit
          [ (n "base", Term.litString sb)
          , (n "token", Term.litString st)
          , (n "headerBlock", Term.litString sh)
          , (n "bodyBlock", Term.litString sy) ], rest)
      else
        none
    | _, _, _, _ => none
  | _, _ => none

def nilTerm : Term :=
  Term.const (n "List.nil")

def consTerm (head tail : Term) : Term :=
  Term.app (Term.app (Term.const (n "List.cons")) head) tail

def listTerm (specs : List Term) : Term :=
  specs.foldr consTerm nilTerm

def parseSpecs (ss : List (List String)) (ts : List String) :
    Option (Prod (List Term) (List String)) :=
  match ss with
  | [] =>
    match ts with
    | "]" :: rest => some ([], rest)
    | _ => none
  | s :: more =>
    match q4 s ts with
    | some (tm, "," :: rest) =>
      match parseSpecs more rest with
      | some (ms, rest2) => some (tm :: ms, rest2)
      | none => none
    | some (tm, "]" :: rest) =>
      if more.isEmpty then some ([tm], rest) else none
    | _ => none

def listHeader : List String :=
  [ "def", "dualSsotSpecs", ":", "List", "DualSsotSpec", ":=", "[" ]

def listCmd (body : Term) : Cmd :=
  Cmd.def_ (n "dualSsotSpecs")
    (some (HostType.named (n "List DualSsotSpec")))
    body

def err (msg : String) : Term :=
  Term.app (Term.const (n "IO.userError")) (Term.litString msg)

def content : Term :=
  Term.var (n "content")

def specProj (field : String) : Term :=
  Term.proj (Term.var (n "spec")) (n field)

def app2 (fn : String) (a b : Term) : Term :=
  Term.app (Term.app (Term.const (n fn)) a) b

def oneBlock (bind field rest : String) (inner : Term) : Term :=
  Term.match_ (app2 "ssotBlock" content (specProj field))
    [ (Pat.ctor0 (n "none"), err ("missing " ++ rest))
    , (Pat.someVar (n bind),
        Term.ite
          (Term.proj (Term.var (n bind)) (n "isEmpty"))
          (err ("empty " ++ rest))
          inner) ]

/-- Leaf is ok, so this is IO Unit, not the content string. -/
def unitRead : Term :=
  Term.ite (Term.proj content (n "isEmpty"))
    (err "empty path")
    (Term.ite
      (app2 "containsStr" content (specProj "token"))
      (oneBlock "h" "headerBlock" "HEADER"
        (oneBlock "b" "bodyBlock" "BODY" (Term.const (n "ok"))))
      (err "missing token spec"))

def ioUnit : HostType :=
  HostType.named (n "IO.Unit")

def pathTy : HostType :=
  HostType.named (n "System.FilePath")

def oneCmd : Cmd :=
  Cmd.defBind (n "freestandingCapableReadOneSsot")
    [ (n "path", pathTy)
    , (n "spec", HostType.named (n "DualSsotSpec")) ]
    ioUnit
    unitRead

def dualCmd : Cmd :=
  Cmd.defBind (n "freestandingCapableReadDualSsot")
    [(n "root", pathTy)]
    ioUnit
    unitRead

def mainCmd : Cmd :=
  Cmd.defBind (n "main")
    [(n "args", HostType.named (n "List String"))]
    (HostType.named (n "IO.UInt32"))
    (Term.ite (Term.var (n okName)) (Term.litNat 0) (Term.litNat 1))

def hasTok : List String -> String -> Bool
  | [], _ => false
  | t :: ts, w => t == w || hasTok ts w

def skipBody (fuel : Nat) (acc : List String) (ts : List String) :
    Option (Prod (List String) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, "def" :: _ => some (acc.reverse, ts)
  | _, "end" :: _ => some (acc.reverse, ts)
  | Nat.succ k, t :: rest => skipBody k (t :: acc) rest
  | _, [] => none

def oneHeader : List String :=
  [ "def", "freestandingCapableReadOneSsot", "("
  , "path", ":", "System", ".", "FilePath", ")"
  , "(", "spec", ":", "DualSsotSpec", ")"
  , ":", "IO", "Unit", ":=", "do" ]

def dualHeader : List String :=
  [ "def", "freestandingCapableReadDualSsot", "("
  , "root", ":", "System", ".", "FilePath", ")"
  , ":", "IO", "Unit", ":=", "do" ]

def mainHeader : List String :=
  [ "def", "main", "(", "args", ":", "List", "String", ")"
  , ":", "IO", "UInt32", ":=", "do" ]

def takeDo (header : List String) (need : List String)
    (ts : List String) : Option (List String) :=
  match takeAll header ts with
  | none => none
  | some rest =>
    match skipBody parseFuel [] rest with
    | none => none
    | some (body, rest2) =>
      if need.all (hasTok body) then some rest2 else none

def threeBind (ts : List String) :
    Option (Prod (List Cmd) (List String)) :=
  match parseBinderDef ts with
  | Bound.got c1 r1 =>
    match parseBinderDef r1 with
    | Bound.got c2 r2 =>
      match parseBinderDef r2 with
      | Bound.got c3 r3 => some ([c1, c2, c3], r3)
      | _ => none
    | _ => none
  | _ => none

def isFullFalse (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ nm (some HostType.bool) (Term.litBool false) =>
    nm.raw == fullName
  | _ => false

def isNamed (c : Cmd) (name : String) : Bool :=
  match c with
  | Cmd.def_ nm _ _ => nm.raw == name
  | Cmd.defBind nm _ _ _ => nm.raw == name
  | _ => false

def takeBools (fuel : Nat) (env : CapEnv) (acc : List Cmd)
    (ts : List String) :
    Option (Prod (List Cmd) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match SystemsLean.HonestyCapable.parseDef env ts with
    | some (cmd, env2, rest) =>
      takeBools k env2 (cmd :: acc) rest
    | none => some (acc.reverse, ts)

def pinsOk (cs : List Cmd) : Bool :=
  match takeStr cs [] with
  | some (lits, rest) => lits == wantStr && twoTrue rest
  | none => false

def endOk (ts : List String) : Bool :=
  match ts with
  | "end" :: rest =>
    match parseDotted parseFuel rest with
    | some (nm, []) => nm == nsRead
    | _ => false
  | _ => false

def parseRead (ts : List String) : Option Module :=
  match ts with
  | "namespace" :: rest =>
    match parseDotted parseFuel rest with
    | some (ns, restNs) =>
      if ns != nsRead then
        none
      else
        match SystemsLean.HonestyCapable.parseDefs
            parseFuel SystemsLean.HonestyCapable.emptyEnv [] restNs with
        | some (pins, env, restP) =>
          if !pinsOk pins then
            none
          else
            match SystemsLean.HonestyCapable.parseStruct restP with
            | some (st, restS) =>
              if !fieldsOk st then
                none
              else
                match threeBind restS with
                | none => none
                | some (bs, restB) =>
                  match takeAll listHeader restB with
                  | none => none
                  | some restL =>
                    match parseSpecs seeds restL with
                    | none => none
                    | some (specs, restAfter) =>
                      match takeDo oneHeader
                          ["readFile", "containsStr", "ssotBlock", "pure"]
                          restAfter with
                      | none => none
                      | some rest1 =>
                        match takeDo dualHeader
                            ["dualSsotSpecs", "for", "emitDir"] rest1 with
                        | none => none
                        | some rest2 =>
                          match parseFilter rest2 with
                          | SpecParse.got filt restF =>
                            match takeBools parseFuel env [] restF with
                            | some ([cOk, cFull, cReady], restM) =>
                              if isNamed cOk okName && isFullFalse cFull
                                  && isNamed cReady readyName then
                                match takeDo mainHeader
                                    [okName, "catch", "0", "1"] restM with
                                | some restE =>
                                  if endOk restE then
                                    let cmds :=
                                      Cmd.namespace (n ns)
                                        :: pins ++ [st] ++ bs
                                        ++ [listCmd (listTerm specs), oneCmd,
                                            dualCmd, filt, cOk, cFull,
                                            cReady, mainCmd]
                                        ++ [Cmd.endNamespace (n ns)]
                                    let m : Module :=
                                      { name := n ns, commands := cmds }
                                    if isWellFormed m then some m else none
                                  else
                                    none
                                | none => none
                              else
                                none
                            | _ => none
                          | _ => none
            | none => none
        | none => none
    | none => none
  | _ => none

/-- Parse CapableRead. none means not this namespace, or a bad pin. -/
def parseHonestyReadText (src : String) : Option Module :=
  match strip src.toList HonestyFront.SMode.code [] with
  | none => none
  | some kept =>
    match tok kept TMode.norm [] with
    | none => none
    | some ts => parseRead ts

end SystemsLean.HonestyReadFront
