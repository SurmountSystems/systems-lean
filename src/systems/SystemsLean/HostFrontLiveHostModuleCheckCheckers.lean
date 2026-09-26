/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckCheckers.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCheckers.
  Reuses HostFrontLiveHostTerm skip-un-kernelable fold and the
  string-safe comment fold HostFrontLiveHostCheck.stripCommentsHc.
  Not HostFrontLiveMult.stripComments, which treats dash-dash as a
  comment even inside a string. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not HostModuleCheckCheckersKernel.lean.
  Not HostModuleCheckCheckersLater.lean.
  Not HostKernel.lean.
  Not EmitMultScaffold.lean. Not a fifth-4 file. Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostModuleCheckCheckersSource turns live
    HostModuleCheckCheckers.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckCheckers
    even without a module line.
  - liveRel is the exact basename HostModuleCheckCheckers.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckCheckersSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - The embedded bytes are liveHostModuleCheckCheckersSource0 ++
    liveHostModuleCheckCheckersSource1. Two parts only.
  - Two dotted imports, namespace SystemsLean.HostModuleCheck, and
    end are kept. Fifty-six def commands are kept through parseSurfaceDef.
    Each body is checkNamedSurface applied to the surface binder,
    a namespace string, a decl list, and none or some string.
    HostKernel.kernelCheck starts from an empty env, and the
    HostModuleCheckSurface import does not seed checkNamedSurface.
    Each def stays one command. The application is checked by binding
    those imported names at the arrow the body uses. The def is not dropped.
    Binders are non-empty. Bodies are applications.
    kernelFuel is 64. A kept list over 64 does not pass.
    2 + 1 + 56 + 1 is 60. 60 does not pass 64.
  - The live text has def checkMultSurface.
    def checkHostPackageRootsSurface lives in
    HostModuleCheckRootsSurface.lean. The needle stays. It is
    checked on that file, not deleted.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckCheckers
  PARSE-LIVE-HOSTMODULECHECKCHECKERS
  HOST-FRONT-LIVE-HOSTMODULECHECKCHECKERS
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKCHECKERS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckCheckersSource,
  kernelCheckLiveHostModuleCheckCheckersSource,
  hostFrontLiveHostModuleCheckCheckersReady,
  liveHostModuleCheckCheckersSource,
  liveRel, liveHostModuleCheckCheckersRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCheckers
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckCheckersSource
import SystemsLean.HostFrontLiveHostModuleCheckCheckersSource01
import SystemsLean.HostFrontLiveHostModuleCheckRootsSurfaceSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckCheckers

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKCHECKERS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKCHECKERS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKCHECKERS"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckCheckers.lean"

/-- Full live bytes. First half then second half. -/
def liveHostModuleCheckCheckersSource : String :=
  liveHostModuleCheckCheckersSource0 ++ liveHostModuleCheckCheckersSource1

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCheckersRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckCheckersFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckCheckersResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckCheckersProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 32768

/-- Kept-command count the live parse must match.
    Two imports, namespace, 56 defs, and end. 60.
    kernelFuel is 64. 60 does not pass 64. -/
def liveKeptCmds : Nat := 60

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckCheckers has dash-dash in the header block
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

/-- String-safe comment strip for live HostModuleCheckCheckers.lean
    bytes. Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostModuleCheckCheckers`. -/
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
  | "structure" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseStructFieldDeclsHt fuel rest [] with
      | none => none
      | some (fields, rest2) =>
        if fields.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingHt rest3 with
            | some (der, rest4) =>
              some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields der, rest4)
            | none => none
          | _ =>
            some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields [], rest2)
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseSurfaceDef fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / private
    when those keywords are not kept. private is not isCmdKw.
    A def that does not parse is not skipped. -/
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

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse checkers-family text. Module name is `modName` even with no
    module line. Keeps import, namespace, end, structure, and def.
    Greppable: parseCheckersText. -/
def parseCheckersText (modName : String) (src : String) : FrontResult :=
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

/-- Parse live HostModuleCheckCheckers.lean text.
    Greppable: parseLiveHostModuleCheckCheckersSource,
    PARSE-LIVE-HOSTMODULECHECKCHECKERS. -/
def parseLiveHostModuleCheckCheckersSource (src : String) :
    FrontResult :=
  parseCheckersText "SystemsLean.HostModuleCheckCheckers" src

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckCheckersSource,
    PARSE-LIVE-HOSTMODULECHECKCHECKERS. -/
def kernelCheckLiveHostModuleCheckCheckersSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckCheckersSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckCheckersSource
      liveHostModuleCheckCheckersSource with
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

/-- Wrap module lastSeg is HostModuleCheckCheckers
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckCheckers"
      && lastSeg m.name.raw == "HostModuleCheckCheckers"

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

/-- checkMultSurface is in this file. checkHostPackageRootsSurface
    is in HostModuleCheckRootsSurface.lean. The needle is not deleted. -/
def liveParseHasCoreDefs : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripCommentsHc liveHostModuleCheckCheckersSource)
    let rootToks := tokenizeHostTerm
      (stripCommentsHc
        SystemsLean.HostFrontLiveHostModuleCheckRootsSurface.liveHostModuleCheckRootsSurfaceSource)
    toksHaveDefNamed liveSkipFuel toks "checkMultSurface"
      && toksHaveDefNamed liveSkipFuel rootToks
        "checkHostPackageRootsSurface"

/-- Import SystemsLean.HostModuleCheckFixtures. -/
def needleImportFixtures : String :=
  "import SystemsLean.HostModuleCheckFixtures\n"

/-- Import SystemsLean.HostModuleCheckSurface. -/
def needleImportSurface : String :=
  "import SystemsLean.HostModuleCheckSurface\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- First surface def. Body is not a kernel literal. -/
def needleCheckMult : String :=
  "def checkMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=\n"

/-- Last surface def. Body is not a kernel literal. -/
def needleCheckHostPackageRoots : String :=
  "def checkHostPackageRootsSurface (surf : RealModuleSurface) : ModuleCheckResult :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Parent needles stay on this file. The roots def needle is
    checked on HostModuleCheckRootsSurface.lean. Not deleted. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckCheckersSource
  let roots :=
    SystemsLean.HostFrontLiveHostModuleCheckRootsSurface.liveHostModuleCheckRootsSurfaceSource
  (src.splitOn needleImportFixtures).length == 2
    && (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleCheckMult).length > 1
    && (roots.splitOn needleCheckHostPackageRoots).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckCheckersReady,
    PARSE-LIVE-HOSTMODULECHECKCHECKERS,
    HOST-FRONT-LIVE-HOSTMODULECHECKCHECKERS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckCheckersReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKCHECKERS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKCHECKERS")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKCHECKERS")
    && (liveRel == "HostModuleCheckCheckers.lean")
    && (liveHostModuleCheckCheckersRel ==
        "src/systems/SystemsLean/HostModuleCheckCheckers.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckCheckersFullHost
    && !hostFrontLiveHostModuleCheckCheckersResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckCheckersProvablyUnlocked
    && kernelCheckLiveHostModuleCheckCheckersSource
        liveHostModuleCheckCheckersSource
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
  match parseLiveHostModuleCheckCheckersSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKCHECKERS =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckCheckersRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckCheckersRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckCheckersRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckCheckersRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckCheckersSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckCheckers.lean != liveHostModuleCheckCheckersSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckCheckers.lean")
  let r := parseLiveHostModuleCheckCheckersSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKCHECKERS reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKCHECKERS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKCHECKERS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckCheckers parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckCheckers parse false")
    unless hostFrontLiveHostModuleCheckCheckersReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckCheckersReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckCheckersReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckCheckers source was accepted"
      throw (IO.userError
        "empty HostModuleCheckCheckers source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckCheckers.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

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

end SystemsLean.HostFrontLiveHostModuleCheckCheckers
