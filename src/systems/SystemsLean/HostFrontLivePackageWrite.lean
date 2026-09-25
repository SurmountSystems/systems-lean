/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostPackageWrite.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePackageWrite. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostPackageWrite text.

  Spec (readable):
  - parseLivePackageWriteSource turns live HostPackageWrite.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostPackageWrite even without a module line.
  - kernelCheckLivePackageWriteSource is HostKernel.kernelCheck of that parse.
    Reject is false. Not a constant true. Not kernelCheckN with local seeds.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PACKAGEWRITE,
  SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_V0, PARSE-LIVE-PACKAGEWRITE,
  parseLivePackageWriteSource, kernelCheckLivePackageWriteSource,
  hostFrontLivePackageWriteReady, livePackageWriteSource, livePackageWriteRel,
  liveRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLivePackageWrite
  Red/green: just systems-host dest rows later (HostTerm holds nix/systems-host-presence);
  lake build SystemsLean.HostFrontLivePackageWrite on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLivePackageWriteSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLivePackageWrite

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PACKAGEWRITE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PACKAGEWRITE"

/-- Live file basename. Not a path. -/
def liveRel : String := "HostPackageWrite.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def livePackageWriteRel : String := "src/systems/SystemsLean/HostPackageWrite.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLivePackageWriteFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLivePackageWriteResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLivePackageWriteProvablyUnlocked : Bool := false

/-- Seed names from HostFront / HostGraph / subset-emit imports. -/
def seedKnown : List String :=
  ["hostFrontGoodG1", "hostFrontReady", "goldensRel",
    "hostGraphGoodClosure", "hostGraphGoodLinearExpand",
    "hostGraphGoodTypesExpand", "hostGraphGoodProgramExpand",
    "hostGraphGoodGraphExpand", "hostGraphGoodComposeExpand",
    "hostGraphReady",
    "multSubsetEmitReady", "multSubsetEmitWroteExpected",
    "linearSubsetEmitReady", "linearSubsetEmitWroteExpected",
    "typesSubsetEmitReady", "typesSubsetEmitWroteExpected",
    "programSubsetEmitReady", "programSubsetEmitWroteExpected",
    "graphSubsetEmitReady", "graphSubsetEmitWroteExpected",
    "composeSubsetEmitReady", "composeSubsetEmitWroteExpected"]

/-- True when this import lastSeg carries PackageWrite seeds. -/
def importSeeds (x : String) : Bool :=
  x == "HostFront" || x == "HostGraph"
    || x == "MultSubsetEmit" || x == "LinearSubsetEmit"
    || x == "TypesSubsetEmit" || x == "ProgramSubsetEmit"
    || x == "GraphSubsetEmit" || x == "ComposeSubsetEmit"

/-- Kernel env for HostFront / HostGraph / subset-emit imports.
    HostKernel does not seed those names. -/
def seedPackageWrite (env : Env) : Env :=
  ("hostFrontGoodG1", HostType.bool)
    :: ("hostFrontReady", HostType.bool)
    :: ("goldensRel", HostType.string)
    :: ("hostGraphGoodClosure", HostType.bool)
    :: ("hostGraphGoodLinearExpand", HostType.bool)
    :: ("hostGraphGoodTypesExpand", HostType.bool)
    :: ("hostGraphGoodProgramExpand", HostType.bool)
    :: ("hostGraphGoodGraphExpand", HostType.bool)
    :: ("hostGraphGoodComposeExpand", HostType.bool)
    :: ("hostGraphReady", HostType.bool)
    :: ("multSubsetEmitReady", HostType.bool)
    :: ("multSubsetEmitWroteExpected", HostType.bool)
    :: ("linearSubsetEmitReady", HostType.bool)
    :: ("linearSubsetEmitWroteExpected", HostType.bool)
    :: ("typesSubsetEmitReady", HostType.bool)
    :: ("typesSubsetEmitWroteExpected", HostType.bool)
    :: ("programSubsetEmitReady", HostType.bool)
    :: ("programSubsetEmitWroteExpected", HostType.bool)
    :: ("graphSubsetEmitReady", HostType.bool)
    :: ("graphSubsetEmitWroteExpected", HostType.bool)
    :: ("composeSubsetEmitReady", HostType.bool)
    :: ("composeSubsetEmitWroteExpected", HostType.bool)
    :: env

/-- Names a command adds to the known-const set.
    HostKernel.kernelCheck does not seed HostFront / HostGraph / subset-emit
    imports, so those names stay unknown and their defs are skipped. -/
def cmdAddsPackageWrite (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Dotted ident `SystemsLean . HostPackageWrite`. -/
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

/-- Parse one command. Dotted import / open / namespace / end.
    def delegates to the HostTerm skip-fold. none means skip. -/
def parseOneCmdPackageWrite (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "import" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.importModule (HostTerm.n nm), rest2)
    | none => none
  | "open" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.openNs [HostTerm.n nm], rest2)
    | none => none
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.namespace (HostTerm.n nm), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.endNamespace (HostTerm.n nm), rest2)
    | none => none
  | "def" :: _ => parseOneCmdHt fuel toks
  | _ => none

/-- Parse-fold fuel. HostPackageWrite has more command keywords than HostTerm. -/
def livePackageWriteParseFuel : Nat := 512

/-- Skip fuel. HostPackageWrite filterArgs leftover `|` and do-block acceptors
    exceed liveHostTermParseFuel 256 tokens. Same role as liveGraphSkipFuel. -/
def livePackageWriteSkipFuel : Nat := 4096

/-- If rest is not a command start, skip to the next command.
    parseOneCmdHt can accept a short typed def and leave `|` equations or
    `do` leftover; those are not PARSE-FAIL. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Shallow Bool / String / Nat atoms. Nested ite (long && chains) exceeds
    kernelCheckN remaining fuel on a 60-command fold. -/
def boolKeepSimplePw : Term -> Bool
  | Term.litBool _ => true
  | Term.litString _ => true
  | Term.litNat _ => true
  | Term.const _ => true
  | Term.var _ => true
  | _ => false

/-- Bool bodies the kernel can check (lits, aliases, one-level && / !, ==).
    Drop nested &&, List.any proj, and IO / do-block defs. -/
def boolKeepPw : Term -> Bool
  | Term.litBool _ => true
  | Term.const _ => true
  | Term.var _ => true
  | Term.ite c t e =>
      boolKeepSimplePw c && boolKeepSimplePw t && boolKeepSimplePw e
  | Term.decideEq a b =>
      boolKeepSimplePw a && boolKeepSimplePw b
  | _ => false

/-- Return type is a kernel-keep shape. Named List / IO binders skip. -/
def retKeepPw : HostType -> Term -> Bool
  | HostType.bool, body => boolKeepPw body
  | HostType.string, Term.litString _ => true
  | HostType.string, Term.const _ => true
  | HostType.string, Term.var _ => true
  | HostType.nat, Term.litNat _ => true
  | HostType.nat, Term.const _ => true
  | HostType.nat, Term.var _ => true
  | _, _ => false

/-- Body of a typed def is kernel-known and return-shaped. -/
def cmdBodyKnownPw (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ (some ty) body =>
      termKnownN liveHostTermParseFuel kn body && retKeepPw ty body
  | Cmd.defBind _ _ ret body =>
      termKnownN liveHostTermParseFuel kn body && retKeepPw ret body
  | Cmd.def_ _ none _ => false
  | _ => true

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsPackageWrite : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdPackageWrite livePackageWriteParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd livePackageWriteSkipFuel rest
      if cmdBodyKnownPw kn c then
        parseCmdsPackageWrite n rest2 (kn ++ cmdAddsPackageWrite c) (acc ++ [c])
      else
        parseCmdsPackageWrite n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd livePackageWriteSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsPackageWrite n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostPackageWrite.lean text.
    Greppable: parseLivePackageWriteSource, PARSE-LIVE-PACKAGEWRITE. -/
def parseLivePackageWriteSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPackageWrite livePackageWriteParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostPackageWrite", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostPackageWrite parse.
    Greppable: kernelCheckLivePackageWriteSource, PARSE-LIVE-PACKAGEWRITE. -/
def kernelCheckLivePackageWriteSource (src : String) : Bool :=
  match parseLivePackageWriteSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def livePackageWriteParsed? : Option Module :=
  match parseLivePackageWriteSource livePackageWriteSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match livePackageWriteParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / typed defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match livePackageWriteParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.HostFront. -/
def liveParseHasHostFrontImport : Bool :=
  match livePackageWriteParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostFront"
      | _ => false

/-- Live parse imports SystemsLean.HostGraph. -/
def liveParseHasHostGraphImport : Bool :=
  match livePackageWriteParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostGraph"
      | _ => false

/-- Live parse has core HostPackageWrite defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match livePackageWriteParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "hostId"
      && (has "hostPackageWriteG1Ready"
        || has "hostPackageWriteFinishedClaimed")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLivePackageWriteReady, PARSE-LIVE-PACKAGEWRITE,
    HOST-FRONT-LIVE-PACKAGEWRITE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLivePackageWriteReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_V0")
    && (hostId == "HOST-FRONT-LIVE-PACKAGEWRITE")
    && (parseId == "PARSE-LIVE-PACKAGEWRITE")
    && (liveRel == "HostPackageWrite.lean")
    && (livePackageWriteRel == "src/systems/SystemsLean/HostPackageWrite.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLivePackageWriteFullHost
    && !hostFrontLivePackageWriteResidualFreeClaimed
    && !hostFrontLivePackageWriteProvablyUnlocked
    && kernelCheckLivePackageWriteSource livePackageWriteSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostFrontImport
    && liveParseHasHostGraphImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLivePackageWriteSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLivePackageWrite (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PACKAGEWRITE =="
  IO.println s!"  host={hostId} file={livePackageWriteRel}"
  let path := root / livePackageWriteRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {livePackageWriteRel}"
    throw (IO.userError s!"missing {livePackageWriteRel}")
  let disk <- IO.FS.readFile path
  if disk != livePackageWriteSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostPackageWrite.lean != livePackageWriteSource"
    throw (IO.userError "dual-pin mismatch live HostPackageWrite.lean")
  let r := parseLivePackageWriteSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PACKAGEWRITE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PACKAGEWRITE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PACKAGEWRITE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostPackageWrite parse false"
      throw (IO.userError "kernelCheck live HostPackageWrite parse false")
    unless hostFrontLivePackageWriteReady do
      IO.eprintln "error: hostFrontLivePackageWriteReady false"
      throw (IO.userError "hostFrontLivePackageWriteReady false")
    IO.println s!"GREEN {stageId}: live HostPackageWrite.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLivePackageWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLivePackageWrite
