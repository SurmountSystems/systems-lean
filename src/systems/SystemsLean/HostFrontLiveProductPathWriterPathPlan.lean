/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/ProductPathWriterPathPlan.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathWriterPathPlan. Reuses HostFrontLiveHostTerm skip-fold
  (Types-style). Comment strip via HostFrontLiveMult.stripComments.
  This file has no imports. It is ProductPathWriterPathPlan.lean. Do not claim it imports
  ProductPathWriterPathPlan. Not a remill. Not occupancy leftover.
  Not mill remill of mill 69. Not occupancy Term.

  Spec (readable):
  - parseLiveProductPathWriterPathPlanSource turns live ProductPathWriterPathPlan.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.ProductPathWriterPathPlan even without a module line.
  - kernelCheckLiveProductPathWriterPathPlanSource is HostKernel.kernelCheck of that parse.
  - isWellFormed does not require imports. Do not require any import.
  - Skip comments. Keep namespace, end, string-literal defs, and the Bool
    conjunction (parenthesized == as decideEq, && as if-then-else false).
  - Known defs for the body checker are the fifteen product names. No import
    commands in the live parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Occupancy stays 49. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - Not a theorems wrap. Not ProductPathWriterPathPlanTheorems.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_PLAN_V0, PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN,
  parseLiveProductPathWriterPathPlanSource, kernelCheckLiveProductPathWriterPathPlanSource,
  hostFrontLiveProductPathWriterPathPlanReady, liveProductPathWriterPathPlanSource, liveRel,
  liveProductPathWriterPathPlanRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveProductPathWriterPathPlan
  Red/green: lean --run SlakeTypecheckProductPathWriterPathPlan (horizon).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathWriterPathPlanSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathWriterPathPlan

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from product SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_PLAN_V0. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_PLAN_V0"

/-- Greppable host map id. Distinct from product HOST-SELF-HOST-PRODUCT-WRITER-PATH-PLAN. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN"

/-- Live basename. Greppable: liveRel. Must be ProductPathWriterPathPlan.lean. -/
def liveRel : String := "ProductPathWriterPathPlan.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterPathPlanRel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathWriterPathPlanFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathWriterPathPlanResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathWriterPathPlanProvablyUnlocked : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveProductPathWriterPathPlanMillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveProductPathWriterPathPlanOccupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveProductPathWriterPathPlanNotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveProductPathWriterPathPlanNotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveProductPathWriterPathPlanLakeGone : Bool := false

/-- Parse fuel (command fold and Bool chain). -/
def liveProductPathWriterPathPlanParseFuel : Nat := 256

/-- Skip fuel for comment leftovers and un-kernelable tails. -/
def liveProductPathWriterPathPlanSkipFuel : Nat := 8192

/-- Real command count: namespace, fifteen defs, end. Not a stub. -/
def liveProductPathWriterPathPlanCmdCount : Nat := 17

/-- Fifteen product defs. Body checker known-const list. No extras. -/
def productPathWriterPathPlanDefNames : List String :=
  ["stageId", "hostId", "selfHostId", "writerPathPlanModuleCite",
   "productWriterPathStepReadSsot", "productWriterPathStepCompose",
   "productWriterPathStepWriteWire", "productWriterPathStepInstallOut",
   "productOutPath", "hostLakeEmitWriterPath", "hostLakeEmitExe",
   "hostLakeEmitStageCite", "acceptancePath",
   "productWriterPathPlanOk", "productWriterPathPlanPartialReady"]

/-- Dotted ident, or one already-dotted token from the host tokenizer. -/
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
def skipNonCmdPlan (fuel : Nat) (rest : List String) : List String :=
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

/-- Names a command adds to the known-const set. Imports add nothing. -/
def cmdAddsProductPathWriterPathPlan (c : Cmd) : List String :=
  match c with
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- No Term.app. String concat and juxtaposition are not kernel Bool. -/
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

/-- UInt32 / UInt8 / ByteArray / IO / Int types poison kernelCheck. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO"
        || lastSeg x.raw == "Int" || lastSeg x.raw == "UInt8"
        || lastSeg x.raw == "ByteArray"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, no UInt/IO typed defs.
    Known consts are defs already accepted (the fifteen product names). -/
def cmdBodyKnownProductPathWriterPathPlan (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriterPathPlanParseFuel body
        && termNoAppN liveProductPathWriterPathPlanParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriterPathPlanParseFuel body
        && termNoAppN liveProductPathWriterPathPlanParseFuel body
  | _ => true

/- Bool / String term. `==` is decideEq. `&&` is `if left then right else false`
   so HostKernel infers Bool. Stop before the next command. Do not juxtaposition-app
   `def` (that keyword is an ident to the host tokenizer). -/
mutual
  def parseAtomPlan : Nat -> List String -> Option (Prod Term (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match toks with
      | [] => none
      | "(" :: rest =>
        match parseAndPlan n rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | t :: rest =>
        if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t && !isCmdKw t && t != "&&" && t != "==" then
          some (Term.const (HostTerm.n (lastSeg t)), rest)
        else
          none

  def parseEqPlan : Nat -> List String -> Option (Prod Term (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match parseAtomPlan n toks with
      | none => none
      | some (a, "==" :: rest) =>
        match parseAtomPlan n rest with
        | some (b, rest2) => some (Term.decideEq a b, rest2)
        | none => none
      | some (a, rest) => some (a, rest)

  def parseAndPlan : Nat -> List String -> Option (Prod Term (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match parseEqPlan n toks with
      | none => none
      | some (a, "&&" :: rest) =>
        match parseAndPlan n rest with
        | some (b, rest2) =>
          some (Term.ite a b (Term.litBool false), rest2)
        | none => none
      | some (a, rest) => some (a, rest)
end

/-- Typed assign `def`. String atoms and the Bool && / == chain.
    Leftover that is not a command start is skip, not a truncated keep. -/
def parseDefProductPathWriterPathPlan (fuel : Nat) (dname : String) (rest : List String) :
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
            let dn := HostTerm.n dname
            match parseAndPlan liveProductPathWriterPathPlanParseFuel bodyToks with
            | none => none
            | some (body, rest4) =>
              match rest4 with
              | t :: _ =>
                if !isCmdKw t then none
                else
                  let rest5 := skipNonCmdPlan liveProductPathWriterPathPlanSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
              | [] =>
                let rest5 := skipNonCmdPlan liveProductPathWriterPathPlanSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathWriterPathPlan (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefProductPathWriterPathPlan fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / un-kernelable defs.
    This live file keeps namespace, fifteen defs, and end. -/
def parseCmdsProductPathWriterPathPlan : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathWriterPathPlan liveProductPathWriterPathPlanParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmdPlan liveProductPathWriterPathPlanSkipFuel rest
      if cmdBodyKnownProductPathWriterPathPlan kn c then
        parseCmdsProductPathWriterPathPlan n rest2 (kn ++ cmdAddsProductPathWriterPathPlan c) (acc ++ [c])
      else
        parseCmdsProductPathWriterPathPlan n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveProductPathWriterPathPlanSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsProductPathWriterPathPlan n rest2 kn acc
        else none
      | [] => some acc

/-- Parse live ProductPathWriterPathPlan.lean text.
    Greppable: parseLiveProductPathWriterPathPlanSource, PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN. -/
def parseLiveProductPathWriterPathPlanSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathWriterPathPlan liveProductPathWriterPathPlanParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathWriterPathPlan", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathWriterPathPlan parse.
    Greppable: kernelCheckLiveProductPathWriterPathPlanSource, PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN.
    HostKernel.kernelCheck of the parsed module. Not a constant true. -/
def kernelCheckLiveProductPathWriterPathPlanSource (src : String) : Bool :=
  match parseLiveProductPathWriterPathPlanSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathWriterPathPlanParsed? : Option Module :=
  match parseLiveProductPathWriterPathPlanSource liveProductPathWriterPathPlanSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathWriterPathPlanParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse has no import command. The product file has zero imports. -/
def liveParseHasNoImport : Bool :=
  match liveProductPathWriterPathPlanParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Live parse command count is the real parsed count (namespace, fifteen defs, end). -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathWriterPathPlanParsed? with
  | some m => m.commands.length == liveProductPathWriterPathPlanCmdCount
  | none => false

/-- Live parse has the ProductPathWriterPathPlan namespace command. -/
def liveParseHasProductPathWriterPathPlanNs : Bool :=
  match liveProductPathWriterPathPlanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductPathWriterPathPlan"
      | _ => false

/-- Live parse has the matching end command. -/
def liveParseHasProductPathWriterPathPlanEnd : Bool :=
  match liveProductPathWriterPathPlanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductPathWriterPathPlan"
      | _ => false

/-- Live parse has the fifteen product defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathWriterPathPlanParsed? with
  | none => false
  | some m =>
    productPathWriterPathPlanDefNames.all fun nm =>
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false

/-- Count decideEq nodes. The surface conjunction is thirteen string comparisons. -/
def countDecideEqN : Nat -> Term -> Nat
  | 0, _ => 0
  | Nat.succ n, Term.decideEq a b =>
    1 + countDecideEqN n a + countDecideEqN n b
  | Nat.succ n, Term.ite c t e =>
    countDecideEqN n c + countDecideEqN n t + countDecideEqN n e
  | Nat.succ n, Term.app f a => countDecideEqN n f + countDecideEqN n a
  | Nat.succ n, Term.some_ t => countDecideEqN n t
  | Nat.succ n, Term.proj o _ => countDecideEqN n o
  | Nat.succ n, Term.structLit fs =>
    fs.foldl (fun acc p => acc + countDecideEqN n p.snd) 0
  | Nat.succ n, Term.match_ s arms =>
    countDecideEqN n s +
      arms.foldl (fun acc p => acc + countDecideEqN n p.snd) 0
  | Nat.succ _, _ => 0

/-- productWriterPathPlanOk is the && / == chain, not a dropped atom. -/
def liveParseSurfaceOkConjunction : Bool :=
  match liveProductPathWriterPathPlanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ body =>
        x.raw == "productWriterPathPlanOk"
          && countDecideEqN liveProductPathWriterPathPlanParseFuel body == 13
      | _ => false

/-- productWriterPathPlanPartialReady names productWriterPathPlanOk. -/
def liveParsePartialReadyIsOk : Bool :=
  match liveProductPathWriterPathPlanParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ body =>
        x.raw == "productWriterPathPlanPartialReady" &&
          match body with
          | Term.const n => n.raw == "productWriterPathPlanOk"
          | _ => false
      | _ => false

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathWriterPathPlanSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathWriterPathPlanReady, PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN,
    HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN.
    Real conjunction: parse plus kernelCheck plus the real command count.
    Not hardcoded true. -/
def hostFrontLiveProductPathWriterPathPlanReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_PLAN_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN")
    && (liveRel == "ProductPathWriterPathPlan.lean")
    && (liveProductPathWriterPathPlanRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathWriterPathPlanFullHost
    && !hostFrontLiveProductPathWriterPathPlanResidualFreeClaimed
    && !hostFrontLiveProductPathWriterPathPlanProvablyUnlocked
    && (hostFrontLiveProductPathWriterPathPlanMillCount == 69)
    && (hostFrontLiveProductPathWriterPathPlanOccupancy == 49)
    && hostFrontLiveProductPathWriterPathPlanNotOccupancyName50
    && hostFrontLiveProductPathWriterPathPlanNotMill70
    && !hostFrontLiveProductPathWriterPathPlanLakeGone
    && kernelCheckLiveProductPathWriterPathPlanSource liveProductPathWriterPathPlanSource
    && liveParseHasNoCheckCmd
    && liveParseHasNoImport
    && liveParseCmdCountOk
    && liveParseHasProductPathWriterPathPlanNs
    && liveParseHasProductPathWriterPathPlanEnd
    && liveParseHasCoreDefs
    && liveParseSurfaceOkConjunction
    && liveParsePartialReadyIsOk
    && liveParseRejectsEmpty

/-- Short command tag for a failed run. Not a success banner. -/
def cmdTag (c : Cmd) : String :=
  match c with
  | Cmd.namespace x => "ns:" ++ x.raw
  | Cmd.endNamespace x => "end:" ++ x.raw
  | Cmd.importModule x => "import:" ++ x.raw
  | Cmd.def_ x _ _ => "def:" ++ x.raw
  | Cmd.defBind x _ _ _ => "defBind:" ++ x.raw
  | Cmd.check _ _ => "check"
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "inductive:" ++ x.raw
  | Cmd.structure_ x _ _ => "structure:" ++ x.raw

def cmdTags (cmds : List Cmd) : String :=
  String.intercalate "," (cmds.map cmdTag)

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProductPathWriterPathPlan (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN =="
  IO.println s!"  host={hostId} liveRel={liveRel} file={liveProductPathWriterPathPlanRel}"
  let path := root / liveProductPathWriterPathPlanRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathWriterPathPlanRel}"
    throw (IO.userError s!"missing {liveProductPathWriterPathPlanRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathWriterPathPlanSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathWriterPathPlan.lean != liveProductPathWriterPathPlanSource"
    throw (IO.userError "dual-pin mismatch live ProductPathWriterPathPlan.lean")
  let r := parseLiveProductPathWriterPathPlanSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln s!"error: kernelCheck live ProductPathWriterPathPlan parse false cmds={m.commands.length} tags={cmdTags m.commands} conj={liveParseSurfaceOkConjunction}"
      throw (IO.userError "kernelCheck live ProductPathWriterPathPlan parse false")
    unless hostFrontLiveProductPathWriterPathPlanReady do
      IO.eprintln s!"error: hostFrontLiveProductPathWriterPathPlanReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasProductPathWriterPathPlanNs} endNs={liveParseHasProductPathWriterPathPlanEnd} core={liveParseHasCoreDefs} noCheck={liveParseHasNoCheckCmd} noImport={liveParseHasNoImport} conj={liveParseSurfaceOkConjunction} liveRelOk={liveRel == "ProductPathWriterPathPlan.lean"} kernel={k} tags={cmdTags m.commands}"
      throw (IO.userError "hostFrontLiveProductPathWriterPathPlanReady false")
    IO.println s!"GREEN {stageId}: live ProductPathWriterPathPlan.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathWriterPathPlan root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathWriterPathPlan
