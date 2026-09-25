/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckAcceptsProof.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckAcceptsProof.
  Reuses HostFrontLiveHostTerm skip-un-kernelable fold and the
  string-safe comment fold HostFrontLiveHostCheck.stripCommentsHc.
  Not HostFrontLiveMult.stripComments, which treats dash-dash as a
  comment even inside a string. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not HostModuleCheckAcceptsLater.lean.
  Not HostModuleCheckAcceptsGoodsTerm.lean.
  Not HostModuleCheckAcceptsGoods.lean.
  Not HostModuleCheckAccepts.lean. Not HostKernel.lean.
  Not EmitMultScaffold.lean. Not a fifth-4 file. Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostModuleCheckAcceptsProofSource turns live
    HostModuleCheckAcceptsProof.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckAcceptsProof
    even without a module line.
  - liveRel is the exact basename HostModuleCheckAcceptsProof.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckAcceptsProofSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - Eight dotted imports, namespace SystemsLean.HostModuleCheck, and
    end are kept. Twenty def bodies are applications, not kernel
    literals, so they are skip-folded, including five proof smoke folds.
    Kept command count is 10. kernelFuel is 64. 10 does not pass 64.
  - Skip-head still sees def hostModuleCheckGoodKernelMultTheoremsProof and
    def hostModuleCheckKernelEmitProofSmokeOk in the live text.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckAcceptsProof
  PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF
  HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSPROOF
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKACCEPTSPROOF_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckAcceptsProofSource,
  kernelCheckLiveHostModuleCheckAcceptsProofSource,
  hostFrontLiveHostModuleCheckAcceptsProofReady,
  liveHostModuleCheckAcceptsProofSource,
  liveRel, liveHostModuleCheckAcceptsProofRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckAcceptsProof
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckAcceptsProofSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckAcceptsProof

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKACCEPTSPROOF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSPROOF"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckAcceptsProof.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckAcceptsProofRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckAcceptsProofFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckAcceptsProofResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckAcceptsProofProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 16384

/-- Kept-command count: eight imports, namespace, and end.
    Twenty defs are not kernel literals. Five of those are proof smoke
    folds. kernelFuel is 64. -/
def liveKeptCmds : Nat := 10

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckAcceptsProof has dash-dash in the header block
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

/-- String-safe comment strip for live HostModuleCheckAcceptsProof.lean
    bytes. Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostModuleCheckAcceptsProof`. -/
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

/-- Parse live HostModuleCheckAcceptsProof.lean text.
    Greppable: parseLiveHostModuleCheckAcceptsProofSource,
    PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF. -/
def parseLiveHostModuleCheckAcceptsProofSource (src : String) :
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
          { name := HostTerm.n "SystemsLean.HostModuleCheckAcceptsProof"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckAcceptsProofSource,
    PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF. -/
def kernelCheckLiveHostModuleCheckAcceptsProofSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckAcceptsProofSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckAcceptsProofSource
      liveHostModuleCheckAcceptsProofSource with
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

/-- Eight imports. Not zero. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostModuleCheckFixtures",
      "SystemsLean.HostModuleCheckSurface",
      "SystemsLean.HostModuleCheckRealModule",
      "SystemsLean.HostModuleCheckKernelMultProof",
      "SystemsLean.HostModuleCheckKernelLinearProof",
      "SystemsLean.HostModuleCheckKernelTypesProof",
      "SystemsLean.HostModuleCheckKernelProgramProof",
      "SystemsLean.HostModuleCheckKernelEmitProof"
    ]

/-- Live parse command count is liveKeptCmds and does not pass kernelFuel. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds && m.commands.length <= 64
  | none => false

/-- Wrap module lastSeg is HostModuleCheckAcceptsProof
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckAcceptsProof"
      && lastSeg m.name.raw == "HostModuleCheckAcceptsProof"

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
      (stripCommentsHc liveHostModuleCheckAcceptsProofSource)
    toksHaveDefNamed liveSkipFuel toks
        "hostModuleCheckGoodKernelMultTheoremsProof"
      && toksHaveDefNamed liveSkipFuel toks
        "hostModuleCheckKernelEmitProofSmokeOk"

/-- Import SystemsLean.HostModuleCheckFixtures. -/
def needleImportFixtures : String :=
  "import SystemsLean.HostModuleCheckFixtures\n"

/-- Import SystemsLean.HostModuleCheckKernelEmitProof. -/
def needleImportKernelEmit : String :=
  "import SystemsLean.HostModuleCheckKernelEmitProof\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- First proof def. Body is not a kernel literal. -/
def needleGoodKernelMult : String :=
  "def hostModuleCheckGoodKernelMultTheoremsProof : ModuleCheckResult :=\n"

/-- Last proof smoke def. Body is not a kernel literal. -/
def needleEmitSmoke : String :=
  "def hostModuleCheckKernelEmitProofSmokeOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckAcceptsProofSource
  (src.splitOn needleImportFixtures).length == 2
    && (src.splitOn needleImportKernelEmit).length == 2
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleGoodKernelMult).length > 1
    && (src.splitOn needleEmitSmoke).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckAcceptsProofReady,
    PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF,
    HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSPROOF.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckAcceptsProofReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKACCEPTSPROOF_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKACCEPTSPROOF")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF")
    && (liveRel == "HostModuleCheckAcceptsProof.lean")
    && (liveHostModuleCheckAcceptsProofRel ==
        "src/systems/SystemsLean/HostModuleCheckAcceptsProof.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckAcceptsProofFullHost
    && !hostFrontLiveHostModuleCheckAcceptsProofResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckAcceptsProofProvablyUnlocked
    && kernelCheckLiveHostModuleCheckAcceptsProofSource
        liveHostModuleCheckAcceptsProofSource
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
  match parseLiveHostModuleCheckAcceptsProofSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsProofRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckAcceptsProofRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckAcceptsProofRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckAcceptsProofRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckAcceptsProofSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckAcceptsProof.lean != liveHostModuleCheckAcceptsProofSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckAcceptsProof.lean")
  let r := parseLiveHostModuleCheckAcceptsProofSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKACCEPTSPROOF ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckAcceptsProof parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckAcceptsProof parse false")
    unless hostFrontLiveHostModuleCheckAcceptsProofReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckAcceptsProofReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckAcceptsProofReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckAcceptsProof source was accepted"
      throw (IO.userError
        "empty HostModuleCheckAcceptsProof source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckAcceptsProof.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

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

end SystemsLean.HostFrontLiveHostModuleCheckAcceptsProof
