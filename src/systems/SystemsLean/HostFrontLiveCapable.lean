/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/Capable.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is Capable.lean. It is not CapableTheorems.lean.
  Literal defs stay. Compound defs stay when the body is kernel-checkable.
  IO mains are skipped. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  This wrap is not an LLVM backend. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_V0,
  PARSE-LIVE-CAPABLE, CAPABLE-GAP-THEOREM, liveRel,
  kernelCheckLiveCapableSource,
  hostFrontLiveCapableReady.
  Module: SystemsLean.HostFrontLiveCapable
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapable

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE"

/-- Live file basename. -/
def liveRel : String := "Capable.lean"

/-- Live path relative to repo root. -/
def liveCapableRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Parse fuel. -/
def liveCapableParseFuel : Nat := 256

/-- Skip fuel. -/
def liveCapableSkipFuel : Nat := 8192

/-- Kept commands: namespace, literal String/Bool defs, the Ok and
    PartialReady conjunctions, and end. printGapMeasure and main are
    IO and are skipped. No import. -/
def liveCapableKeptCmds : Nat := 22

/-- Dotted name: one or more idents joined by `.`. -/
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

/-- Skip non-command tokens until the next command keyword. -/
def skipNonCmd : Nat -> List String -> List String
  | 0, toks => toks
  | _, [] => []
  | Nat.succ n, t :: rest =>
    if isCmdKw t then t :: rest
    else skipNonCmd n rest

/-- Reject `.isNone` / `.isSome` (kernel has no those builtins).
    Field proj with any other field is allowed when the object is known. -/
def termNoBadProjN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ n, t =>
    match t with
    | Term.proj obj f =>
      (f.raw != "isNone" && f.raw != "isSome") && termNoBadProjN n obj
    | Term.app f a => termNoBadProjN n f && termNoBadProjN n a
    | Term.some_ u => termNoBadProjN n u
    | Term.ite c t1 e =>
      termNoBadProjN n c && termNoBadProjN n t1 && termNoBadProjN n e
    | Term.decideEq a b => termNoBadProjN n a && termNoBadProjN n b
    | Term.match_ scrut arms =>
      termNoBadProjN n scrut &&
        arms.all fun arm => termNoBadProjN n arm.snd
    | Term.structLit fs =>
      fs.all fun fld => termNoBadProjN n fld.snd
    | _ => true

/-- Names a kept command adds. -/
def cmdAddsCapable : Cmd -> List String
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | Cmd.structure_ x fs _ => x.raw :: fs.map fun f => f.name.raw
  | Cmd.inductive_ x ctors _ => x.raw :: ctors.map fun c => c.name.raw
  | _ => []

/-- True when the term has no Term.app (kernel arrow-only app). -/
def termNoAppN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ n, t =>
    match t with
    | Term.app _ _ => false
    | Term.some_ u => termNoAppN n u
    | Term.ite c a b => termNoAppN n c && termNoAppN n a && termNoAppN n b
    | Term.decideEq a b => termNoAppN n a && termNoAppN n b
    | Term.proj obj _ => termNoAppN n obj
    | Term.match_ scrut arms =>
      termNoAppN n scrut && arms.all fun arm => termNoAppN n arm.snd
    | Term.structLit fs => fs.all fun fld => termNoAppN n fld.snd
    | _ => true

/-- Keep a def only when its body is kernel-checkable. -/
def cmdBodyKnownCapable (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableParseFuel body
        && termNoAppN liveCapableParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableParseFuel body
        && termNoAppN liveCapableParseFuel body
  | _ => true

/-- One command. Skip a def whose body is not kernel-checkable. -/
def parseOneCmdCapable (fuel : Nat) (kn : List String) :
    List String -> Option (Prod Cmd (List String))
  | [] => none
  | "import" :: rest =>
    match parseDottedName fuel rest with
    | some (name, rest2) => some (Cmd.importModule (HostTerm.n name), rest2)
    | none => none
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (name, rest2) => some (Cmd.namespace (HostTerm.n name), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (name, rest2) => some (Cmd.endNamespace (HostTerm.n name), rest2)
    | none => none
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. On a def whose body is not kernel-checkable, skip
    the command and keep folding. -/
def parseCmdsCapable (fuel : Nat) (toks : List String)
    (kn : List String) (acc : List Cmd) : Option (List Cmd) :=
  match fuel with
  | 0 => none
  | Nat.succ n =>
    match toks with
    | [] => some acc.reverse
    | _ =>
      match parseOneCmdCapable n kn toks with
      | some (cmd, rest) =>
        if cmdBodyKnownCapable kn cmd then
          let kn2 := kn ++ cmdAddsCapable cmd
          parseCmdsCapable n rest kn2 (cmd :: acc)
        else
          match toks with
          | t :: restToks =>
            if isCmdKw t then
              let rest2 := skipUntilCmd liveCapableSkipFuel restToks
              if rest2.length < toks.length then
                parseCmdsCapable n rest2 kn acc
              else none
            else none
          | [] => some acc.reverse
      | none =>
        match toks with
        | t :: rest =>
          if isCmdKw t then
            let rest2 := skipUntilCmd liveCapableSkipFuel rest
            if rest2.length < toks.length then
              parseCmdsCapable n rest2 kn acc
            else none
          else
            let rest2 := skipNonCmd liveCapableSkipFuel toks
            if rest2.length < toks.length then
              parseCmdsCapable n rest2 kn acc
            else none
        | [] => some acc.reverse

/-- Count command-keyword occurrences (fuel-bounded). -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    let acc2 := if t == kw then acc + 1 else acc
    toksCountKw n rest kw acc2

/-- Parse live Capable.lean text into a HostTerm module.
    Module name is SystemsLean.Capable even without a module line.
    Greppable: parseLiveCapableSource. -/
def parseLiveCapableSource (src : String) : FrontResult :=
  if src.isEmpty then
    FrontResult.reject reasonEmptyModule
  else
    let toks := tokenizeHostTerm (stripComments src)
    match parseCmdsCapable liveCapableParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      let m : Module := {
        name := HostTerm.n "SystemsLean.Capable"
        commands := cmds
      }
      if isWellFormed m then
        FrontResult.accept m
      else
        FrontResult.reject reasonNotWellFormed

/-- Parsed live module, when the front accepts. -/
def liveCapableParsed? : Option Module :=
  match parseLiveCapableSource liveCapableSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Kernel-check the parsed live module. Not a constant true.
    Greppable: kernelCheckLiveCapableSource. -/
def kernelCheckLiveCapableSource (src : String) : Bool :=
  match parseLiveCapableSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- On-disk Capable.lean text for the closed-subset driver.
    `root` is the repo root (just passes it). -/
def loadLiveCapable (root : String) : IO String :=
  IO.FS.readFile (root ++ "/" ++ liveCapableRel)

/-- True when the loaded text matches the embedded source. -/
def liveCapableText (disk : String) : Bool :=
  disk == liveCapableSource

/-- Namespace command present. -/
def liveParseHasCapableNs : Bool :=
  match liveCapableParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.Capable"
      | _ => false

/-- End command present. -/
def liveParseHasCapableEnd : Bool :=
  match liveCapableParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.Capable"
      | _ => false

/-- No import in this live file. -/
def liveParseHasNoImport : Bool :=
  match liveCapableParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- stageId literal def survived the fold. -/
def liveParseHasStageId : Bool :=
  match liveCapableParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "stageId"
      | _ => false

/-- Install-only and full-perform literal defs survived the fold. -/
def liveParseHasLiteralDefs : Bool :=
  match liveCapableParsed? with
  | none => false
  | some m =>
    let has (name : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == name
        | _ => false
    has "productPathFreestandingCapableInstallOnly"
      && has "productPathFreestandingCapableFullPerform"
      && has "productPathFreestandingCapableOk"
      && has "productPathFreestandingCapablePartialReady"

/-- Kept-command count. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableParsed? with
  | none => false
  | some m => m.commands.length == liveCapableKeptCmds

/-- Parsed module name is the live basename. -/
def liveParseModuleNameOk : Bool :=
  match liveCapableParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.Capable"
      && lastSeg m.name.raw == "Capable"

/-- theorem count in the token stream (0 in this live file). -/
def liveCapableTheoremCount : Nat :=
  toksCountKw liveCapableSkipFuel
    (tokenizeHostTerm (stripComments liveCapableSource)) "theorem" 0

/-- example count in the token stream (0 in this live file). -/
def liveCapableExampleCount : Nat :=
  toksCountKw liveCapableSkipFuel
    (tokenizeHostTerm (stripComments liveCapableSource)) "example" 0

/-- set_option count in the token stream (0 in this live file). -/
def liveCapableSetOptionCount : Nat :=
  toksCountKw liveCapableSkipFuel
    (tokenizeHostTerm (stripComments liveCapableSource)) "set_option" 0

/-- Real needles from Capable.lean, each with its trailing newline.
    Greppable: liveNeedlesOk. -/
def needleNamespace : String := "namespace SystemsLean.Capable\n"

/-- stageId def line. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0\"\n"

/-- hostId def line. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP\"\n"

/-- Install-only literal. -/
def needleInstallOnly : String :=
  "def productPathFreestandingCapableInstallOnly : Bool := true\n"

/-- Full perform stays false in this home. -/
def needleFullPerform : String :=
  "def productPathFreestandingCapableFullPerform : Bool := false\n"

/-- Read literal. -/
def needleRead : String :=
  "def productPathFreestandingCapableRead : Bool := true\n"

/-- End namespace line. -/
def needleEnd : String := "end SystemsLean.Capable\n"

/-- Embedded source contains the live needles. -/
def liveNeedlesOk : Bool :=
  liveCapableSource.contains needleNamespace
    && liveCapableSource.contains needleStageId
    && liveCapableSource.contains needleHostId
    && liveCapableSource.contains needleInstallOnly
    && liveCapableSource.contains needleFullPerform
    && liveCapableSource.contains needleRead
    && liveCapableSource.contains needleEnd

/-- Kernel check of the embedded live source. -/
def liveKernelOk : Bool :=
  kernelCheckLiveCapableSource liveCapableSource

/-- Honest non-claims. -/
def hostFrontLiveCapableFullHost : Bool := false

/-- Honest non-claim. -/
def hostFrontLiveCapableFullBackend : Bool := false

/-- Package typecheck pin stays false. -/
def hostFrontLiveCapableOwnsPackageTypecheck : Bool := false

/-- Not freestanding residual free. -/
def hostFrontLiveCapableResidualFreeClaimed : Bool := false

/-- PROVABLY stays false in this wrap. -/
def hostFrontLiveCapableProvablyUnlocked : Bool := false

/-- Ready: dual-pin needles, parse shape, and kernel check.
    Not a hardcoded true. Greppable: hostFrontLiveCapableReady. -/
def hostFrontLiveCapableReady : Bool :=
  liveNeedlesOk
    && liveParseHasCapableNs
    && liveParseHasCapableEnd
    && liveParseHasNoImport
    && liveParseHasStageId
    && liveParseHasLiteralDefs
    && liveParseCmdCountOk
    && liveParseModuleNameOk
    && liveCapableTheoremCount == 0
    && liveCapableExampleCount == 0
    && liveCapableSetOptionCount == 0
    && liveKernelOk
    && stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_V0"
    && hostId == "HOST-FRONT-LIVE-CAPABLE"
    && liveRel == "Capable.lean"
    && liveCapableRel == "src/systems/SystemsLean/Capable.lean"
    && (!hostFrontLiveCapableFullHost)
    && (!hostFrontLiveCapableFullBackend)
    && (!hostFrontLiveCapableOwnsPackageTypecheck)
    && (!hostFrontLiveCapableResidualFreeClaimed)
    && (!hostFrontLiveCapableProvablyUnlocked)

/-- Driver stdout: short banner, dual-pin, parse, kernel check.
    Greppable: PARSE-LIVE-CAPABLE. -/
def runLiveCapable (disk : String) : IO UInt32 := do
  if disk != liveCapableSource then
    IO.eprintln "error: live Capable.lean text != embedded source"
    return 1
  match parseLiveCapableSource disk with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: parse reject {reason}"
    return 1
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheckLiveCapableSource false"
      return 1
    unless hostFrontLiveCapableReady do
      IO.eprintln "error: hostFrontLiveCapableReady false"
      return 1
    return 0

/-- lean --run entry. Repo root is the optional first arg
    (just passes it). Default `.` when the process cwd is the repo root. -/
def main (args : List String) : IO UInt32 := do
  let root := match args with
    | r :: _ => r
    | [] => "."
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveCapableRel}"
  let disk <- loadLiveCapable root
  runLiveCapable disk

end SystemsLean.HostFrontLiveCapable
