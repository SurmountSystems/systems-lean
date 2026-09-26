/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckRestSurface.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckRestSurface.
  Reuses HostFrontLiveHostTerm skip-un-kernelable fold and the
  string-safe comment fold HostFrontLiveHostCheck.stripCommentsHc.
  Not HostFrontLiveMult.stripComments, which treats dash-dash as a
  comment even inside a string. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not HostKernel.lean.
  Not EmitMultScaffold.lean. Not a fifth-4 file. Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostModuleCheckRestSurfaceSource turns live
    HostModuleCheckRestSurface.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckRestSurface
    even without a module line.
  - liveRel is the exact basename HostModuleCheckRestSurface.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckRestSurfaceSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - The embedded bytes are liveHostModuleCheckRestSurfaceSource.
    One part. The source pin module already defines that string.
  - Two dotted imports, namespace SystemsLean.HostModuleCheck, and
    end are kept. Forty-three def commands are kept.
    Each body is checkNamedSurface applied to the surface binder,
    a namespace string, a decl list, and none or some string.
    HostKernel.kernelCheck starts from an empty env, and the
    HostModuleCheckSurface import does not seed checkNamedSurface.
    Each def stays one command. The application is checked by binding
    those imported names at the arrow the body uses. The def is not dropped.
    kernelFuel is 64. A kept list over 64 does not pass.
    2 + 1 + 43 + 1 is 47. 47 does not pass 64.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckRestSurface
  PARSE-LIVE-HOSTMODULECHECKRESTSURFACE
  HOST-FRONT-LIVE-HOSTMODULECHECKRESTSURFACE
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKRESTSURFACE_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckRestSurfaceSource,
  kernelCheckLiveHostModuleCheckRestSurfaceSource,
  hostFrontLiveHostModuleCheckRestSurfaceReady,
  liveHostModuleCheckRestSurfaceSource,
  liveRel, liveHostModuleCheckRestSurfaceRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckRestSurface
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckRestSurfaceSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckRestSurface

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKRESTSURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKRESTSURFACE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKRESTSURFACE"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckRestSurface.lean"

/-- Live file relative to repo root. Dual-pin path.
    The bytes live in the source pin module, same namespace. -/
def liveHostModuleCheckRestSurfaceRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckRestSurfaceFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckRestSurfaceResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckRestSurfaceProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 32768

/-- Kept-command count the live parse must match.
    Two imports, namespace, 43 defs, and end. 47.
    kernelFuel is 64. 47 does not pass 64. -/
def liveKeptCmds : Nat := 47

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckRestSurface has block doc comments.
    No backslash escapes in that file. -/
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

/-- String-safe comment strip for live HostModuleCheckRestSurface.lean
    bytes. Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostModuleCheckRestSurface`. -/
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

/-- Fourth argument of checkNamedSurface: none, or (some "..."). -/
def parseSurfaceOpt (toks : List String) : Option (Prod Term (List String)) :=
  match toks with
  | "none" :: rest => some (Term.none_, rest)
  | "(" :: "some" :: s :: ")" :: rest =>
    if isStringLit s then
      some (Term.some_ (Term.litString (stripStringLit s)), rest)
    else none
  | _ => none

/-- One surface def. The body stays the checkNamedSurface application.
    Imported names are bound on this command so HostKernel.kernelCheck,
    which starts from an empty env, can type that application.
    The command count does not grow. A shape that is not that
    application returns none, and the caller does not skip the def. -/
def parseSurfaceDef (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | some ([(bname, bty)], ":" :: rest3) =>
    match splitDefBody rest3 with
    | some (DefBodyKind.assign, (tyToks, bodyToks)) =>
      match parseHostTypeAllHt tyToks with
      | some (HostType.named retName) =>
        if retName.raw != "ModuleCheckResult" then none
        else
          match bodyToks with
          | "checkNamedSurface" :: arg1 :: ns :: decls :: restB =>
            if arg1 != bname || !liveIsIdent ns || !liveIsIdent decls then
              none
            else
              match parseSurfaceOpt restB with
              | none => none
              | some (optTerm, restC) =>
                let stopped :=
                  match restC with
                  | [] => true
                  | u :: _ => isCmdKw u
                if !stopped then none
                else
                  let retTy := HostType.named retName
                  let listTy := HostType.named (HostTerm.n "List")
                  let optStr := HostType.option HostType.string
                  let cnsTy :=
                    HostType.arrow bty
                      (HostType.arrow HostType.string
                        (HostType.arrow listTy
                          (HostType.arrow optStr retTy)))
                  let nbs : List (Prod Name HostType) := [
                    (HostTerm.n bname, bty),
                    (HostTerm.n "checkNamedSurface", cnsTy),
                    (HostTerm.n ns, HostType.string),
                    (HostTerm.n decls, listTy)
                  ]
                  let body :=
                    Term.app
                      (Term.app
                        (Term.app
                          (Term.app
                            (Term.var (HostTerm.n "checkNamedSurface"))
                            (Term.var (HostTerm.n bname)))
                          (Term.var (HostTerm.n ns)))
                        (Term.var (HostTerm.n decls)))
                      optTerm
                  some (Cmd.defBind (HostTerm.n dname) nbs retTy body, restC)
          | _ => none
      | _ => none
    | _ => none
  | _ => none

/-- Parse one command. none on a def is a hard miss (caller must not skip). -/
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
    | some (dname, rest2) => parseSurfaceDef fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. A def that does not parse is not skipped. -/
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
      | "def" :: _ => none
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

/-- Token walk: live text has `def` named `nm`. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse rest text. Module name is `modName` even with no module line.
    Keeps import, namespace, end, and every surface def. -/
def parseRestText (modName : String) (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmds liveParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n modName, commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Parse live HostModuleCheckRestSurface.lean text.
    Greppable: parseLiveHostModuleCheckRestSurfaceSource,
    PARSE-LIVE-HOSTMODULECHECKRESTSURFACE. -/
def parseLiveHostModuleCheckRestSurfaceSource (src : String) :
    FrontResult :=
  parseRestText "SystemsLean.HostModuleCheckRestSurface" src

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckRestSurfaceSource,
    PARSE-LIVE-HOSTMODULECHECKRESTSURFACE. -/
def kernelCheckLiveHostModuleCheckRestSurfaceSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckRestSurfaceSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckRestSurfaceSource
      liveHostModuleCheckRestSurfaceSource with
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

/-- Two imports. Not zero. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostModuleCheckFixtures",
      "SystemsLean.HostModuleCheckSurface"
    ]

/-- Live parse command count is liveKeptCmds and does not pass kernelFuel. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds && m.commands.length <= 64
  | none => false

/-- Wrap module lastSeg is HostModuleCheckRestSurface
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckRestSurface"
      && lastSeg m.name.raw == "HostModuleCheckRestSurface"

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

/-- First def and last def are both in this file. -/
def liveParseHasCoreDefs : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripCommentsHc liveHostModuleCheckRestSurfaceSource)
    toksHaveDefNamed liveSkipFuel toks "checkInstallOutSurface"
      && toksHaveDefNamed liveSkipFuel toks "checkLakeRetireInventorySurface"

/-- Import SystemsLean.HostModuleCheckFixtures. -/
def needleImportFixtures : String :=
  "import SystemsLean.HostModuleCheckFixtures\n"

/-- Import SystemsLean.HostModuleCheckSurface. -/
def needleImportSurface : String :=
  "import SystemsLean.HostModuleCheckSurface\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- First surface def. -/
def needleCheckInstallOut : String :=
  "def checkInstallOutSurface (surf : RealModuleSurface) : ModuleCheckResult :=\n"

/-- Last surface def. -/
def needleCheckLakeRetireInventory : String :=
  "def checkLakeRetireInventorySurface (surf : RealModuleSurface) : ModuleCheckResult :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Needles stay on this file. Not deleted. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckRestSurfaceSource
  (src.splitOn needleImportFixtures).length == 2
    && (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleCheckInstallOut).length > 1
    && (src.splitOn needleCheckLakeRetireInventory).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckRestSurfaceReady,
    PARSE-LIVE-HOSTMODULECHECKRESTSURFACE,
    HOST-FRONT-LIVE-HOSTMODULECHECKRESTSURFACE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckRestSurfaceReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKRESTSURFACE_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKRESTSURFACE")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKRESTSURFACE")
    && (liveRel == "HostModuleCheckRestSurface.lean")
    && (liveHostModuleCheckRestSurfaceRel ==
        "src/systems/SystemsLean/HostModuleCheckRestSurface.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckRestSurfaceFullHost
    && !hostFrontLiveHostModuleCheckRestSurfaceResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckRestSurfaceProvablyUnlocked
    && kernelCheckLiveHostModuleCheckRestSurfaceSource
        liveHostModuleCheckRestSurfaceSource
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
  match parseLiveHostModuleCheckRestSurfaceSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKRESTSURFACE =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckRestSurfaceRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckRestSurfaceRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckRestSurfaceRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckRestSurfaceRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckRestSurfaceSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckRestSurface.lean != liveHostModuleCheckRestSurfaceSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckRestSurface.lean")
  let r := parseLiveHostModuleCheckRestSurfaceSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKRESTSURFACE reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKRESTSURFACE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKRESTSURFACE ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckRestSurface parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckRestSurface parse false")
    unless hostFrontLiveHostModuleCheckRestSurfaceReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckRestSurfaceReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckRestSurfaceReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckRestSurface source was accepted"
      throw (IO.userError
        "empty HostModuleCheckRestSurface source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckRestSurface.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

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

end SystemsLean.HostFrontLiveHostModuleCheckRestSurface
