/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckAcceptsGoodsTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckAcceptsGoodsTerm.
  Reuses HostFrontLiveHostTerm skip-un-kernelable fold and the
  string-safe comment fold HostFrontLiveHostCheck.stripCommentsHc.
  Not HostFrontLiveMult.stripComments, which treats dash-dash as a
  comment even inside a string. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not HostModuleCheckAcceptsGoods.lean.
  Not HostModuleCheckAccepts.lean. Not HostKernel.lean.
  Not EmitMultScaffold.lean. Not a fifth-4 file.

  Spec (readable):
  - parseLiveHostModuleCheckAcceptsGoodsTermSource turns live
    HostModuleCheckAcceptsGoodsTerm.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckAcceptsGoodsTerm
    even without a module line.
  - liveRel is the exact basename HostModuleCheckAcceptsGoodsTerm.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckAcceptsGoodsTermSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - Nine dotted imports, namespace SystemsLean.HostModuleCheck, and end
    are kept. Def bodies are applications and projections, not kernel
    literals, so they are skip-folded. Kept command count is 11.
    kernelFuel is 64. 11 does not pass 64.
  - Skip-head still sees def emitPlanTermSmokeResult and
    def hostModuleCheckEmitKernelTermSmokeAllOk in the live text.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckAcceptsGoodsTerm
  PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM
  HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKACCEPTSGOODSTERM_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckAcceptsGoodsTermSource,
  kernelCheckLiveHostModuleCheckAcceptsGoodsTermSource,
  hostFrontLiveHostModuleCheckAcceptsGoodsTermReady,
  liveHostModuleCheckAcceptsGoodsTermSource,
  liveRel, liveHostModuleCheckAcceptsGoodsTermRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTerm
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKACCEPTSGOODSTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckAcceptsGoodsTerm.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckAcceptsGoodsTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 16384

/-- Kept-command count: nine imports, namespace, and end.
    Seventeen smoke defs are not kernel literals. kernelFuel is 64. -/
def liveKeptCmds : Nat := 11

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckAcceptsGoodsTerm has dash-dash in the header block
    comment and in doc comments. No backslash escapes in that file. -/
def stripCommentsHcN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsHcN n nest false false ('\n' :: acc) rest
        else
          stripCommentsHcN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsHcN n nest false false ('"' :: acc) rest
        else
          stripCommentsHcN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsHcN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsHcN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsHcN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsHcN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsHcN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsHcN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsHcN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsHcN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostModuleCheckAcceptsGoodsTerm.lean
    bytes. Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostModuleCheckAcceptsGoodsTerm`. -/
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

/-- One String, Bool, or Nat literal, and the next token is a command.
    A longer body is not kept. Returning none lets the caller skipUntilCmd
    so a later `end` is not swallowed as an application argument. -/
def parseDefLiteral (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    if !bs.isEmpty then none
    else
      match rest2 with
      | ":" :: rest3 =>
        match splitDefBody rest3 with
        | none => none
        | some (kind, (tyToks, bodyToks)) =>
          match kind with
          | DefBodyKind.equation => none
          | DefBodyKind.assign =>
            match bodyToks with
            | t :: rest4 =>
              let stopped :=
                match rest4 with
                | [] => true
                | u :: _ => isCmdKw u
              if !stopped then none
              else
                match parseHostTypeAllHt tyToks with
                | none => none
                | some ty =>
                  let dn := HostTerm.n dname
                  match ty, t with
                  | HostType.string, _ =>
                    if isStringLit t then
                      some (Cmd.def_ dn (some ty)
                        (Term.litString (stripStringLit t)), rest4)
                    else none
                  | HostType.bool, "true" =>
                    some (Cmd.def_ dn (some ty) (Term.litBool true), rest4)
                  | HostType.bool, "false" =>
                    some (Cmd.def_ dn (some ty) (Term.litBool false), rest4)
                  | HostType.nat, _ =>
                    if isNatLit t then
                      match ofNatLit? t with
                      | some k =>
                        some (Cmd.def_ dn (some ty) (Term.litNat k), rest4)
                      | none => none
                    else none
                  | _, _ => none
            | [] => none
      | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmd (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLiteral fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / private /
    un-kernelable defs. private is not isCmdKw. -/
def parseCmds : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmd liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      parseCmds n rest2 (acc ++ [c])
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmds n rest acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSkipFuel rest
          if rest2.length < toks.length then
            parseCmds n rest2 acc
          else none
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

/-- Parse live HostModuleCheckAcceptsGoodsTerm.lean text.
    Greppable: parseLiveHostModuleCheckAcceptsGoodsTermSource,
    PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM. -/
def parseLiveHostModuleCheckAcceptsGoodsTermSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmds liveParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckAcceptsGoodsTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckAcceptsGoodsTermSource,
    PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM. -/
def kernelCheckLiveHostModuleCheckAcceptsGoodsTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckAcceptsGoodsTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckAcceptsGoodsTermSource
      liveHostModuleCheckAcceptsGoodsTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Import command names, in order. -/
def importNames : List Cmd -> List String
  | [] => []
  | Cmd.importModule x :: rest => x.raw :: importNames rest
  | _ :: rest => importNames rest

/-- Nine imports. Not zero. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostModuleCheckSurface",
      "SystemsLean.HostModuleCheckEmitPlanTerm",
      "SystemsLean.HostModuleCheckEmitApplyTerm",
      "SystemsLean.HostModuleCheckEmitBodyTerm",
      "SystemsLean.HostModuleCheckKernelMultTerm",
      "SystemsLean.HostModuleCheckKernelLinearTerm",
      "SystemsLean.HostModuleCheckKernelTypesTerm",
      "SystemsLean.HostModuleCheckKernelProgramTerm",
      "SystemsLean.HostModuleCheckKernelEmitTerm"
    ]

/-- Live parse command count is liveKeptCmds and does not pass kernelFuel. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds && m.commands.length <= 64
  | none => false

/-- Wrap module lastSeg is HostModuleCheckAcceptsGoodsTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckAcceptsGoodsTerm"
      && lastSeg m.name.raw == "HostModuleCheckAcceptsGoodsTerm"

/-- Live parse has namespace SystemsLean.HostModuleCheck. -/
def liveParseHasNs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostModuleCheck. -/
def liveParseHasEnd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Skip-head: the two defs that name this file are in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripCommentsHc liveHostModuleCheckAcceptsGoodsTermSource)
    toksHaveDefNamed liveSkipFuel toks "emitPlanTermSmokeResult"
      && toksHaveDefNamed liveSkipFuel toks
        "hostModuleCheckEmitKernelTermSmokeAllOk"

/-- Import SystemsLean.HostModuleCheckSurface. -/
def needleImportSurface : String :=
  "import SystemsLean.HostModuleCheckSurface\n"

/-- Import SystemsLean.HostModuleCheckKernelEmitTerm. -/
def needleImportKernelEmit : String :=
  "import SystemsLean.HostModuleCheckKernelEmitTerm\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- First smoke def. Body is not a kernel literal. -/
def needleEmitPlan : String :=
  "def emitPlanTermSmokeResult (content : String) : ModuleCheckResult :=\n"

/-- Fold of the Emit and Kernel smokes. Body is not a kernel literal. -/
def needleAllOk : String :=
  "def hostModuleCheckEmitKernelTermSmokeAllOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckAcceptsGoodsTermSource
  (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleImportKernelEmit).length == 2
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleEmitPlan).length > 1
    && (src.splitOn needleAllOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckAcceptsGoodsTermReady,
    PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckAcceptsGoodsTermReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKACCEPTSGOODSTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM")
    && (liveRel == "HostModuleCheckAcceptsGoodsTerm.lean")
    && (liveHostModuleCheckAcceptsGoodsTermRel ==
        "src/systems/SystemsLean/HostModuleCheckAcceptsGoodsTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckAcceptsGoodsTermFullHost
    && !hostFrontLiveHostModuleCheckAcceptsGoodsTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckAcceptsGoodsTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckAcceptsGoodsTermSource
        liveHostModuleCheckAcceptsGoodsTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseHasModule
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckAcceptsGoodsTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsGoodsTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckAcceptsGoodsTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckAcceptsGoodsTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckAcceptsGoodsTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckAcceptsGoodsTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckAcceptsGoodsTerm.lean != liveHostModuleCheckAcceptsGoodsTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckAcceptsGoodsTerm.lean")
  let r := parseLiveHostModuleCheckAcceptsGoodsTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckAcceptsGoodsTerm parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckAcceptsGoodsTerm parse false")
    unless hostFrontLiveHostModuleCheckAcceptsGoodsTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckAcceptsGoodsTermReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckAcceptsGoodsTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckAcceptsGoodsTerm source was accepted"
      throw (IO.userError
        "empty HostModuleCheckAcceptsGoodsTerm source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckAcceptsGoodsTerm.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTerm
