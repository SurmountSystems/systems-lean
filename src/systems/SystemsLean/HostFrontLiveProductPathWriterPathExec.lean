/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/ProductPathWriterPathExec.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathWriterPathExec. Reuses HostFrontLiveHostTerm skip-fold
  (Types-style). Comment strip via HostFrontLiveMult.stripComments.
  This file has no imports. It is ProductPathWriterPathExec.lean. Do not claim it imports
  ProductPathWriterPathExec. Not a remill. Not occupancy leftover.
  Not mill remill of mill 69. Not occupancy Term.

  Spec (readable):
  - parseLiveProductPathWriterPathExecSource turns live ProductPathWriterPathExec.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.ProductPathWriterPathExec even without a module line.
  - kernelCheckLiveProductPathWriterPathExecSource is HostKernel.kernelCheck of that parse.
  - isWellFormed does not require imports. Do not require any import.
  - Skip comments. Keep namespace, end, string-literal defs, and the Bool
    conjunction (parenthesized == as decideEq, && as if-then-else false).
  - Known defs for the body checker are the twenty product names. No import
    commands in the live parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Occupancy stays 49. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - Not a theorems wrap. Not ProductPathWriterPathExecTheorems.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_EXEC_V0, PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC,
  parseLiveProductPathWriterPathExecSource, kernelCheckLiveProductPathWriterPathExecSource,
  hostFrontLiveProductPathWriterPathExecReady, liveProductPathWriterPathExecSource, liveRel,
  liveProductPathWriterPathExecRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveProductPathWriterPathExec
  Red/green: lean --run SlakeTypecheckProductPathWriterPathExec (horizon).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathWriterPathExecSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathWriterPathExec

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from product SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_EXEC_V0. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_EXEC_V0"

/-- Greppable host map id. Distinct from product HOST-SELF-HOST-PRODUCT-WRITER-PATH-EXEC. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC"

/-- Live basename. Greppable: liveRel. Must be ProductPathWriterPathExec.lean. -/
def liveRel : String := "ProductPathWriterPathExec.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterPathExecRel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathWriterPathExecFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathWriterPathExecResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathWriterPathExecProvablyUnlocked : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveProductPathWriterPathExecMillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveProductPathWriterPathExecOccupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveProductPathWriterPathExecNotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveProductPathWriterPathExecNotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveProductPathWriterPathExecLakeGone : Bool := false

/-- Parse fuel (command fold and Bool chain). -/
def liveProductPathWriterPathExecParseFuel : Nat := 256

/-- Skip fuel for comment leftovers and un-kernelable tails. -/
def liveProductPathWriterPathExecSkipFuel : Nat := 8192

/-- Real command count: namespace, twenty defs, end. Not a stub. -/
def liveProductPathWriterPathExecCmdCount : Nat := 22

/-- Twenty product defs. Body checker known-const list. No extras. -/
def productPathWriterPathExecDefNames : List String :=
  ["stageId", "hostId", "selfHostId", "writerPathExecModuleCite",
   "productWriterPathExecReadSsotFn", "productWriterPathExecReadBodyFn",
   "productWriterPathExecReadPlanFn", "productWriterPathExecDualSsot",
   "productWriterPathExecComposeFn", "productWriterPathExecComposeSourceFn",
   "productWriterPathExecWriteFn", "productWriterPathExecEmitEntry",
   "productWriterPathExecInstallRecipe", "productOutPath",
   "hostLakeEmitWriterPath", "hostLakeEmitExe", "hostLakeEmitStageCite",
   "acceptancePath", "productWriterPathExecutionOk",
   "productWriterPathExecutionPartialReady"]

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
def skipNonCmdExec (fuel : Nat) (rest : List String) : List String :=
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
def cmdAddsProductPathWriterPathExec (c : Cmd) : List String :=
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
    Known consts are defs already accepted (the twenty product names). -/
def cmdBodyKnownProductPathWriterPathExec (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriterPathExecParseFuel body
        && termNoAppN liveProductPathWriterPathExecParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathWriterPathExecParseFuel body
        && termNoAppN liveProductPathWriterPathExecParseFuel body
  | _ => true

/- Bool / String term. `==` is decideEq. `&&` is `if left then right else false`
   so HostKernel infers Bool. Stop before the next command. Do not juxtaposition-app
   `def` (that keyword is an ident to the host tokenizer). -/
mutual
  def parseAtomExec : Nat -> List String -> Option (Prod Term (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match toks with
      | [] => none
      | "(" :: rest =>
        match parseAndExec n rest with
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

  def parseEqExec : Nat -> List String -> Option (Prod Term (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match parseAtomExec n toks with
      | none => none
      | some (a, "==" :: rest) =>
        match parseAtomExec n rest with
        | some (b, rest2) => some (Term.decideEq a b, rest2)
        | none => none
      | some (a, rest) => some (a, rest)

  def parseAndExec : Nat -> List String -> Option (Prod Term (List String))
    | 0, _ => none
    | Nat.succ n, toks =>
      match parseEqExec n toks with
      | none => none
      | some (a, "&&" :: rest) =>
        match parseAndExec n rest with
        | some (b, rest2) =>
          some (Term.ite a b (Term.litBool false), rest2)
        | none => none
      | some (a, rest) => some (a, rest)
end

/-- Typed assign `def`. String atoms and the Bool && / == chain.
    Leftover that is not a command start is skip, not a truncated keep. -/
def parseDefProductPathWriterPathExec (fuel : Nat) (dname : String) (rest : List String) :
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
            match parseAndExec liveProductPathWriterPathExecParseFuel bodyToks with
            | none => none
            | some (body, rest4) =>
              match rest4 with
              | t :: _ =>
                if !isCmdKw t then none
                else
                  let rest5 := skipNonCmdExec liveProductPathWriterPathExecSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
              | [] =>
                let rest5 := skipNonCmdExec liveProductPathWriterPathExecSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdProductPathWriterPathExec (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefProductPathWriterPathExec fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / un-kernelable defs.
    This live file keeps namespace, twenty defs, and end. -/
def parseCmdsProductPathWriterPathExec : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathWriterPathExec liveProductPathWriterPathExecParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmdExec liveProductPathWriterPathExecSkipFuel rest
      if cmdBodyKnownProductPathWriterPathExec kn c then
        parseCmdsProductPathWriterPathExec n rest2 (kn ++ cmdAddsProductPathWriterPathExec c) (acc ++ [c])
      else
        parseCmdsProductPathWriterPathExec n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveProductPathWriterPathExecSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsProductPathWriterPathExec n rest2 kn acc
        else none
      | [] => some acc

/-- Parse live ProductPathWriterPathExec.lean text.
    Greppable: parseLiveProductPathWriterPathExecSource, PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC. -/
def parseLiveProductPathWriterPathExecSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathWriterPathExec liveProductPathWriterPathExecParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathWriterPathExec", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathWriterPathExec parse.
    Greppable: kernelCheckLiveProductPathWriterPathExecSource, PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC.
    HostKernel.kernelCheck of the parsed module. Not a constant true. -/
def kernelCheckLiveProductPathWriterPathExecSource (src : String) : Bool :=
  match parseLiveProductPathWriterPathExecSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathWriterPathExecParsed? : Option Module :=
  match parseLiveProductPathWriterPathExecSource liveProductPathWriterPathExecSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathWriterPathExecParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse has no import command. The product file has zero imports. -/
def liveParseHasNoImport : Bool :=
  match liveProductPathWriterPathExecParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Live parse command count is the real parsed count (namespace, twenty defs, end). -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathWriterPathExecParsed? with
  | some m => m.commands.length == liveProductPathWriterPathExecCmdCount
  | none => false

/-- Live parse has the ProductPathWriterPathExec namespace command. -/
def liveParseHasProductPathWriterPathExecNs : Bool :=
  match liveProductPathWriterPathExecParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductPathWriterPathExec"
      | _ => false

/-- Live parse has the matching end command. -/
def liveParseHasProductPathWriterPathExecEnd : Bool :=
  match liveProductPathWriterPathExecParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductPathWriterPathExec"
      | _ => false

/-- Live parse has the twenty product defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveProductPathWriterPathExecParsed? with
  | none => false
  | some m =>
    productPathWriterPathExecDefNames.all fun nm =>
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false

/-- Count decideEq nodes. The surface conjunction is eighteen string comparisons. -/
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

/-- productWriterPathExecutionOk is the && / == chain, not a dropped atom. -/
def liveParseSurfaceOkConjunction : Bool :=
  match liveProductPathWriterPathExecParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ body =>
        x.raw == "productWriterPathExecutionOk"
          && countDecideEqN liveProductPathWriterPathExecParseFuel body == 18
      | _ => false

/-- productWriterPathExecutionPartialReady names productWriterPathExecutionOk. -/
def liveParsePartialReadyIsOk : Bool :=
  match liveProductPathWriterPathExecParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ body =>
        x.raw == "productWriterPathExecutionPartialReady" &&
          match body with
          | Term.const n => n.raw == "productWriterPathExecutionOk"
          | _ => false
      | _ => false

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathWriterPathExecSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathWriterPathExecReady, PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC,
    HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC.
    Real conjunction: parse plus kernelCheck plus the real command count.
    Not hardcoded true. -/
def hostFrontLiveProductPathWriterPathExecReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_EXEC_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC")
    && (liveRel == "ProductPathWriterPathExec.lean")
    && (liveProductPathWriterPathExecRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathWriterPathExecFullHost
    && !hostFrontLiveProductPathWriterPathExecResidualFreeClaimed
    && !hostFrontLiveProductPathWriterPathExecProvablyUnlocked
    && (hostFrontLiveProductPathWriterPathExecMillCount == 69)
    && (hostFrontLiveProductPathWriterPathExecOccupancy == 49)
    && hostFrontLiveProductPathWriterPathExecNotOccupancyName50
    && hostFrontLiveProductPathWriterPathExecNotMill70
    && !hostFrontLiveProductPathWriterPathExecLakeGone
    && kernelCheckLiveProductPathWriterPathExecSource liveProductPathWriterPathExecSource
    && liveParseHasNoCheckCmd
    && liveParseHasNoImport
    && liveParseCmdCountOk
    && liveParseHasProductPathWriterPathExecNs
    && liveParseHasProductPathWriterPathExecEnd
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

def runLiveProductPathWriterPathExec (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC =="
  IO.println s!"  host={hostId} liveRel={liveRel} file={liveProductPathWriterPathExecRel}"
  let path := root / liveProductPathWriterPathExecRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathWriterPathExecRel}"
    throw (IO.userError s!"missing {liveProductPathWriterPathExecRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathWriterPathExecSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathWriterPathExec.lean != liveProductPathWriterPathExecSource"
    throw (IO.userError "dual-pin mismatch live ProductPathWriterPathExec.lean")
  let r := parseLiveProductPathWriterPathExecSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln s!"error: kernelCheck live ProductPathWriterPathExec parse false cmds={m.commands.length} tags={cmdTags m.commands} conj={liveParseSurfaceOkConjunction}"
      throw (IO.userError "kernelCheck live ProductPathWriterPathExec parse false")
    unless hostFrontLiveProductPathWriterPathExecReady do
      IO.eprintln s!"error: hostFrontLiveProductPathWriterPathExecReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasProductPathWriterPathExecNs} endNs={liveParseHasProductPathWriterPathExecEnd} core={liveParseHasCoreDefs} noCheck={liveParseHasNoCheckCmd} noImport={liveParseHasNoImport} conj={liveParseSurfaceOkConjunction} liveRelOk={liveRel == "ProductPathWriterPathExec.lean"} kernel={k} tags={cmdTags m.commands}"
      throw (IO.userError "hostFrontLiveProductPathWriterPathExecReady false")
    IO.println s!"GREEN {stageId}: live ProductPathWriterPathExec.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathWriterPathExec root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathWriterPathExec
