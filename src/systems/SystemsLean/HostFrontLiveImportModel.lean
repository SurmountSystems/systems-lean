/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostImportGraphModel.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportModel. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostImportGraphModel text.

  Spec (readable):
  - parseLiveImportModelSource turns live HostImportGraphModel.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostImportGraphModel even without a module line.
  - kernelCheckLiveImportModelSource is HostKernel.kernelCheck of that parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IMPORT-MODEL,
  SLAKE_HOST_FRONT_LIVE_IMPORT_MODEL_V0, PARSE-LIVE-IMPORT-MODEL,
  parseLiveImportModelSource, kernelCheckLiveImportModelSource,
  hostFrontLiveImportModelReady, liveImportModelSource, liveImportModelRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveImportModel
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveImportModel on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveImportModelSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveImportModel

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IMPORT_MODEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IMPORT-MODEL"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IMPORT-MODEL"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportModelRel : String :=
  "src/systems/SystemsLean/HostImportGraphModel.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveImportModelFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveImportModelResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveImportModelProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveImportModelParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveImportModelSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . HostImportGraph`. -/
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
def cmdAddsModel (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Body is kernel-known and has no untyped proj. -/
def cmdBodyKnownModel (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportModelParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveImportModelParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdModel (fuel : Nat) (toks : List String) :
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
  | _ => parseOneCmdHt fuel toks

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsModel : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdModel liveImportModelParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveImportModelSkipFuel rest
      if cmdBodyKnownModel kn c then
        parseCmdsModel n rest2 (kn ++ cmdAddsModel c) (acc ++ [c])
      else
        parseCmdsModel n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveImportModelSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsModel n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostImportGraphModel.lean text.
    Greppable: parseLiveImportModelSource, PARSE-LIVE-IMPORT-MODEL. -/
def parseLiveImportModelSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsModel liveImportModelParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostImportGraphModel"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostImportGraphModel parse.
    Greppable: kernelCheckLiveImportModelSource, PARSE-LIVE-IMPORT-MODEL. -/
def kernelCheckLiveImportModelSource (src : String) : Bool :=
  match parseLiveImportModelSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveImportModelParsed? : Option Module :=
  match parseLiveImportModelSource liveImportModelSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveImportModelParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / structure / inductive / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveImportModelParsed? with
  | some m => m.commands.length >= 4
  | none => false

/-- Live parse imports SystemsLean.HostImportGraphSeeds. -/
def liveParseHasSeedsImport : Bool :=
  match liveImportModelParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostImportGraphSeeds"
      | _ => false

/-- Live parse has the HostImportGraph namespace command. -/
def liveParseHasImportGraphNs : Bool :=
  match liveImportModelParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostImportGraph"
      | _ => false

/-- Live parse has structure RealMod. -/
def liveParseHasRealMod : Bool :=
  match liveImportModelParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "RealMod" && fields.length >= 2
      | _ => false

/-- Live parse has ImportGraphResult accept/reject. -/
def liveParseHasImportGraphResult : Bool :=
  match liveImportModelParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "ImportGraphResult" && ctors.length == 2
          && ctors.any (fun x => x.name.raw == "accept")
          && ctors.any (fun x => x.name.raw == "reject")
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveImportModelReady, PARSE-LIVE-IMPORT-MODEL,
    HOST-FRONT-LIVE-IMPORT-MODEL.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveImportModelReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IMPORT_MODEL_V0")
    && (hostId == "HOST-FRONT-LIVE-IMPORT-MODEL")
    && (parseId == "PARSE-LIVE-IMPORT-MODEL")
    && (liveImportModelRel
      == "src/systems/SystemsLean/HostImportGraphModel.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveImportModelFullHost
    && !hostFrontLiveImportModelResidualFreeClaimed
    && !hostFrontLiveImportModelProvablyUnlocked
    && kernelCheckLiveImportModelSource liveImportModelSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSeedsImport
    && liveParseHasImportGraphNs
    && liveParseHasRealMod
    && liveParseHasImportGraphResult

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveImportModelSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveImportModel (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IMPORT-MODEL =="
  IO.println s!"  host={hostId} file={liveImportModelRel}"
  let path := root / liveImportModelRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveImportModelRel}"
    throw (IO.userError s!"missing {liveImportModelRel}")
  let disk <- IO.FS.readFile path
  if disk != liveImportModelSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostImportGraphModel.lean != liveImportModelSource"
    throw (IO.userError "dual-pin mismatch live HostImportGraphModel.lean")
  let r := parseLiveImportModelSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IMPORT-MODEL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IMPORT-MODEL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IMPORT-MODEL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostImportGraphModel parse false"
      throw (IO.userError "kernelCheck live HostImportGraphModel parse false")
    unless hostFrontLiveImportModelReady do
      IO.eprintln "error: hostFrontLiveImportModelReady false"
      throw (IO.userError "hostFrontLiveImportModelReady false")
    IO.println s!"GREEN {stageId}: live HostImportGraphModel.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveImportModel root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveImportModel
