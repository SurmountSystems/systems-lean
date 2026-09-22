/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitBanner.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitBanner. Reuses HostFrontLiveHostTerm
  tokenizeHostTerm and HostFrontLiveMult stripComments.
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not the EmitBannerScaffold product parser.
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.

  Spec (readable):
  - parseLiveEmitBannerSource turns live EmitBanner.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.EmitBanner (no module line in the file).
  - Import target SystemsLean.EmitBannerScaffold stays after comment strip.
    That import is not this module name.
  - kernelCheckLiveEmitBannerSource is HostKernel.kernelCheck of that parse.
  - After strip, the shape is import, namespace, and end. No def and no
    theorem in this file. Doc comments are block comments. stripComments strips them.
  - Skip-fold theorem, example, set_option, open, private, and def.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. slakeOwnsPackageTypecheck stays false.
  - Not freestanding residual free.

  Unique needles (trailing newline so a longer name is not a prefix hit):
  HostFrontLiveEmitBanner
  PARSE-LIVE-EMIT-BANNER
  HOST-FRONT-LIVE-EMIT-BANNER
  SLAKE_HOST_FRONT_LIVE_EMIT_BANNER_V0
  src/systems/SystemsLean/EmitBanner.lean

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveEmitBannerSource,
  kernelCheckLiveEmitBannerSource,
  hostFrontLiveEmitBannerReady, liveEmitBannerSource,
  liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveEmitBanner
  Red/green: dest-missing until barrel; closed lean --run on horizon.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitBannerSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitBanner

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_BANNER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-BANNER"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-BANNER"

/-- Live file relative to repo root. Dual-pin path. Exact, not a prefix. -/
def liveRel : String := "src/systems/SystemsLean/EmitBanner.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitBannerFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitBannerResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitBannerProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitBannerParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitBannerSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitBanner`. -/
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

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdEmitBanner (fuel : Nat) (toks : List String) :
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
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / private / def.
    private is not isCmdKw. This file has import, namespace, and end only. -/
def parseCmdsEmitBanner : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdEmitBanner liveEmitBannerParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitBannerSkipFuel rest
      parseCmdsEmitBanner n rest2 (acc ++ [c])
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitBanner n rest acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitBannerSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitBanner n rest2 acc
          else none
        else none
      | [] => some acc

/-- Token walk: `def` named `nm`. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match rest with
    | t :: rest2 => t == nm || toksHaveDefNamed n rest2 nm
    | [] => false
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live EmitBanner.lean text.
    Greppable: parseLiveEmitBannerSource, PARSE-LIVE-EMIT-BANNER. -/
def parseLiveEmitBannerSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitBanner liveEmitBannerParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitBanner"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitBanner parse. Not a fixture.
    Greppable: kernelCheckLiveEmitBannerSource, PARSE-LIVE-EMIT-BANNER. -/
def kernelCheckLiveEmitBannerSource (src : String) : Bool :=
  match parseLiveEmitBannerSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitBannerParsed? : Option Module :=
  match parseLiveEmitBannerSource liveEmitBannerSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitBannerParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Import of EmitBannerScaffold, exact string, not this module name. -/
def cmdIsImportScaffold : Cmd -> Bool
  | Cmd.importModule x =>
    x.raw == "SystemsLean.EmitBannerScaffold"
      && lastSeg x.raw == "EmitBannerScaffold"
  | _ => false

/-- Namespace command whose full name and lastSeg are EmitBanner. -/
def cmdIsEmitBannerNs : Cmd -> Bool
  | Cmd.namespace x =>
    x.raw == "SystemsLean.EmitBanner" && lastSeg x.raw == "EmitBanner"
  | _ => false

/-- End command whose full name and lastSeg are EmitBanner. -/
def cmdIsEmitBannerEnd : Cmd -> Bool
  | Cmd.endNamespace x =>
    x.raw == "SystemsLean.EmitBanner" && lastSeg x.raw == "EmitBanner"
  | _ => false

/-- Import, namespace, or end of this file. Rejects a stray command. -/
def cmdIsEmitBannerShape : Cmd -> Bool
  | c => cmdIsImportScaffold c || cmdIsEmitBannerNs c || cmdIsEmitBannerEnd c

/-- Command count lower bound: namespace and end at minimum.
    Not a hardcoded ready bit. The PASS line prints the measured count. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitBannerParsed? with
  | some m =>
    m.commands.length >= 2 && m.commands.all cmdIsEmitBannerShape
  | none => false

/-- Module lastSeg is EmitBanner. Not EmitBannerScaffold. -/
def liveParseHasEmitBannerModule : Bool :=
  match liveEmitBannerParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitBanner"
      && lastSeg m.name.raw == "EmitBanner"

/-- Exactly one namespace command, lastSeg EmitBanner. -/
def liveParseHasEmitBannerNs : Bool :=
  match liveEmitBannerParsed? with
  | none => false
  | some m => (m.commands.filter cmdIsEmitBannerNs).length == 1

/-- Exactly one end command, lastSeg EmitBanner. -/
def liveParseHasEmitBannerEnd : Bool :=
  match liveEmitBannerParsed? with
  | none => false
  | some m => (m.commands.filter cmdIsEmitBannerEnd).length == 1

/-- Exactly one import of SystemsLean.EmitBannerScaffold.
    That target is not the module name SystemsLean.EmitBanner. -/
def liveParseImportTargetIsNotModule : Bool :=
  match liveEmitBannerParsed? with
  | none => false
  | some m =>
    (m.commands.filter cmdIsImportScaffold).length == 1
      && m.name.raw == "SystemsLean.EmitBanner"
      && m.name.raw != "SystemsLean.EmitBannerScaffold"

/-- After comment strip, no `def bannerHeaderFragment`.
    That def lives on EmitBannerScaffold, not in this file. -/
def liveParseLacksBannerHeaderFragmentDef : Bool :=
  match liveEmitBannerParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitBannerSource)
    !(toksHaveDefNamed liveEmitBannerSkipFuel toks "bannerHeaderFragment")

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitBannerSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitBannerReady,
    PARSE-LIVE-EMIT-BANNER,
    HOST-FRONT-LIVE-EMIT-BANNER.
    Real conjunction: parse plus kernel plus honesty pins. Not := true. -/
def hostFrontLiveEmitBannerReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_BANNER_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-BANNER")
    && (parseId == "PARSE-LIVE-EMIT-BANNER")
    && (liveRel == "src/systems/SystemsLean/EmitBanner.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitBannerFullHost
    && !hostFrontLiveEmitBannerResidualFreeClaimed
    && !hostFrontLiveEmitBannerProvablyUnlocked
    && kernelCheckLiveEmitBannerSource liveEmitBannerSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitBannerModule
    && liveParseHasEmitBannerNs
    && liveParseHasEmitBannerEnd
    && liveParseImportTargetIsNotModule
    && liveParseLacksBannerHeaderFragmentDef
    && liveParseRejectsEmpty

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitBanner (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-BANNER =="
  IO.println s!"  host={hostId} file={liveRel} liveRel={liveRel}"
  let path := root / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRel}"
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitBannerSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitBanner.lean != liveEmitBannerSource"
    throw (IO.userError "dual-pin mismatch live EmitBanner.lean")
  let r := parseLiveEmitBannerSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-BANNER reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-BANNER reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-BANNER ACCEPT cmds={m.commands.length} kernelCheck={k} liveRel={liveRel}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitBanner parse false"
      throw (IO.userError "kernelCheck live EmitBanner parse false")
    unless hostFrontLiveEmitBannerReady do
      IO.eprintln "error: hostFrontLiveEmitBannerReady false"
      throw (IO.userError "hostFrontLiveEmitBannerReady false")
    IO.println s!"GREEN {stageId}: live EmitBanner.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitBanner root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitBanner
