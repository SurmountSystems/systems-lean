/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathComposePlan.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathComposePlan. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule.
  This wrap parses ProductPathComposePlan.lean only.
  Unique needles use trailing newline so HostFrontLiveProductPathComposePlan is not a
  prefix hit on mill wrap companions. Mill wrap
  HostFrontLiveProductPathComposePlanMain parses ProductPathComposePlanMain.lean
  only. Do not steal it. Do not wrap ProductPathComposePlanTheorems.lean.
  Occupancy leftover is not this wrap. Do not edit Term files.
  Not Linear.lean. Not ComposeSubsetEmit. Not IrGraph.
  Not DualEqWriteClosePath. Not DualEqWriteCapableGap.

  Spec (readable):
  - parseLiveProductPathComposePlanSource turns live ProductPathComposePlan.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.ProductPathComposePlan even without a module line.
  - kernelCheckLiveProductPathComposePlanSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, boolean && chains, Term.app, IO mains)
    are skip-folded. Kernelable string/Nat/Bool atom defs plus namespace / end
    remain. No import in this live file. Open skipped. Compound && ready pins skip.
  - Skip-fold ALL theorems and examples. Compound && ready pins skip
    (productPathPerformComposeOk, productPathPerformComposePartialReady).
  - structure DualSsotSpec skip-folds. IO compose helpers skip-fold
    (containsStr, requireFile, readOneSsot, buildComposeMarker,
    composePlanApplyBodyAtRoot, filterArgs, main).
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails
    termKnownN / termNoBadProjN / termNoAppN / termIsKernelAtom.
    cmdBodyKnown rejects typeHasUInt32OrIo so
    def main (_args : List String) : IO UInt32 and
    composePlanApplyBodyAtRoot skip-fold.
  - Living namespace lastSeg is ProductPathComposePlan.
  - Wrap-assigned module lastSeg is ProductPathComposePlan.
  - Skip-head via toksHaveDefNamed: stageId and hostId (both local).
    Do not require a CapableWriteHcLoad-style import.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill remill. Mill stays 69 of 69. Not Lake-gone.
  - Not PROVABLY. Not freestanding residual free.
  - Not Linear / ComposeSubsetEmit / IrGraph parsers.
  - Not mill ProductPathComposePlanMain wrap. Not ProductPathComposePlanTheorems wrap.

  Unique needles (trailing newline so HostFrontLiveProductPathComposePlan is not a prefix):
  HostFrontLiveProductPathComposePlan
  PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN
  HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveProductPathComposePlanSource,
  kernelCheckLiveProductPathComposePlanSource,
  hostFrontLiveProductPathComposePlanReady, liveProductPathComposePlanSource,
  liveProductPathComposePlanRel, liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveProductPathComposePlan
  Red/green: dests-skipped until barrel; lake build
  SystemsLean.HostFrontLiveProductPathComposePlan on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathComposePlanSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathComposePlan

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathComposePlanRel : String :=
  "src/systems/SystemsLean/ProductPathComposePlan.lean"

/-- Live basename. Greppable: liveRel. Must be ProductPathComposePlan.lean. -/
def liveRel : String := "ProductPathComposePlan.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathComposePlanFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathComposePlanResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathComposePlanProvablyUnlocked : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def hostFrontLiveProductPathComposePlanOwnsPackageTypecheck : Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathComposePlanParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveProductPathComposePlanSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    ProductPathComposePlan has quoted phrases in comments and IO print strings.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsPpcpN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsPpcpN n nest false false ('\n' :: acc) rest
        else
          stripCommentsPpcpN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsPpcpN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsPpcpN n nest false false ('"' :: acc) rest
        else
          stripCommentsPpcpN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsPpcpN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsPpcpN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsPpcpN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsPpcpN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsPpcpN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsPpcpN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsPpcpN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsPpcpN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live ProductPathComposePlan.lean bytes. -/
def stripCommentsPpcp (src : String) : String :=
  String.ofList (stripCommentsPpcpN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . ProductPathComposePlan`. -/
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

/-- If rest is not a command start, skip to the next command. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Reject field proj the kernel cannot type (keep isEmpty / isSome / length). -/
def termNoBadProjN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.app f a => termNoBadProjN n f && termNoBadProjN n a
  | Nat.succ n, Term.some_ t => termNoBadProjN n t
  | Nat.succ n, Term.ite c t e =>
      termNoBadProjN n c && termNoBadProjN n t && termNoBadProjN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoBadProjN n a && termNoBadProjN n b
  | Nat.succ n, Term.proj o f =>
      (f.raw == "isEmpty" || f.raw == "isSome" || f.raw == "length")
        && termNoBadProjN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoBadProjN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Names a command adds to the known-const set. -/
def cmdAddsProductPathComposePlan (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat is an untyped app.
    Kernel cannot apply String. Skip any Term.app. -/
def termNoAppN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ n, Term.some_ t => termNoAppN n t
  | Nat.succ n, Term.ite c t e =>
      termNoAppN n c && termNoAppN n t && termNoAppN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoAppN n a && termNoAppN n b
  | Nat.succ n, Term.proj o _ => termNoAppN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoAppN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Atom bodies the kernel can type without && / ++ / struct / ite. -/
def termIsKernelAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownProductPathComposePlan (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathComposePlanParseFuel body
        && termNoAppN liveProductPathComposePlanParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathComposePlanParseFuel body
        && termNoAppN liveProductPathComposePlanParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefProductPathComposePlan (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match kind with
        | DefBodyKind.equation => none
        | DefBodyKind.assign =>
          match parseHostTypeAllHt tyToks with
          | none => none
          | some retTy =>
            let ty := addBinderArrows bs retTy
            let bnames := bs.map (fun p => p.fst)
            let dn := HostTerm.n dname
            match parseAtomHt liveHostTermParseFuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              match rest4 with
              | [] =>
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, [])
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, [])
              | t :: _ =>
                if isCmdKw t then
                  let rest5 := skipNonCmd liveProductPathComposePlanSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdProductPathComposePlan (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "import" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.importModule (HostTerm.n nm), rest2)
    | none => none
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.namespace (HostTerm.n nm), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.endNamespace (HostTerm.n nm), rest2)
    | none => none
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefProductPathComposePlan fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsProductPathComposePlan : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathComposePlan liveProductPathComposePlanParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathComposePlanSkipFuel rest
      if cmdBodyKnownProductPathComposePlan kn c then
        parseCmdsProductPathComposePlan n rest2
          (kn ++ cmdAddsProductPathComposePlan c) (acc ++ [c])
      else
        parseCmdsProductPathComposePlan n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveProductPathComposePlanSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsProductPathComposePlan n rest2 kn acc
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live ProductPathComposePlan.lean text.
    Greppable: parseLiveProductPathComposePlanSource,
    PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN. -/
def parseLiveProductPathComposePlanSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsPpcp src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathComposePlan liveProductPathComposePlanParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathComposePlan"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathComposePlan parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveProductPathComposePlanSource,
    PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN. -/
def kernelCheckLiveProductPathComposePlanSource (src : String) : Bool :=
  match parseLiveProductPathComposePlanSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathComposePlanParsed? : Option Module :=
  match parseLiveProductPathComposePlanSource liveProductPathComposePlanSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathComposePlanParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=13: namespace, eleven kernelable String/Bool atoms,
    end. ProductPathComposePlan has no import lines. Do not copy a
    DualEqWriteParity bound of 33 or a DualEqWriteApi bound of 59. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathComposePlanParsed? with
  | some m => m.commands.length >= 13
  | none => false

/-- Wrap module lastSeg is ProductPathComposePlan (no module line in the live file). -/
def liveParseHasProductPathComposePlanModule : Bool :=
  match liveProductPathComposePlanParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "ProductPathComposePlan"

/-- Live parse has the living ProductPathComposePlan namespace command. -/
def liveParseHasProductPathComposePlanNs : Bool :=
  match liveProductPathComposePlanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "ProductPathComposePlan"
      | _ => false

/-- Skip-head: def stageId and def hostId are local in ProductPathComposePlan.lean.
    IO body skip-folds; token walk still sees the def. -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathComposePlanParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsPpcp liveProductPathComposePlanSource)
    toksHaveDefNamed liveProductPathComposePlanSkipFuel toks "stageId"
      && toksHaveDefNamed liveProductPathComposePlanSkipFuel toks "hostId"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathComposePlanReady,
    PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN,
    HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveProductPathComposePlanReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN")
    && (liveProductPathComposePlanRel
      == "src/systems/SystemsLean/ProductPathComposePlan.lean")
    && (liveRel == "ProductPathComposePlan.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathComposePlanFullHost
    && !hostFrontLiveProductPathComposePlanResidualFreeClaimed
    && !hostFrontLiveProductPathComposePlanProvablyUnlocked
    && !hostFrontLiveProductPathComposePlanOwnsPackageTypecheck
    && kernelCheckLiveProductPathComposePlanSource liveProductPathComposePlanSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProductPathComposePlanModule
    && liveParseHasProductPathComposePlanNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathComposePlanSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. -/

def runLiveProductPathComposePlan (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN =="
  IO.println s!"  host={hostId} file={liveProductPathComposePlanRel} liveRel={liveRel}"
  let path := root / liveProductPathComposePlanRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathComposePlanRel}"
    throw (IO.userError s!"missing {liveProductPathComposePlanRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathComposePlanSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathComposePlan.lean != liveProductPathComposePlanSource"
    throw (IO.userError "dual-pin mismatch live ProductPathComposePlan.lean")
  let r := parseLiveProductPathComposePlanSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathComposePlan parse false"
      throw (IO.userError "kernelCheck live ProductPathComposePlan parse false")
    unless hostFrontLiveProductPathComposePlanReady do
      IO.eprintln "error: hostFrontLiveProductPathComposePlanReady false"
      throw (IO.userError "hostFrontLiveProductPathComposePlanReady false")
    IO.println s!"GREEN {stageId}: live ProductPathComposePlan.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathComposePlan root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathComposePlan
