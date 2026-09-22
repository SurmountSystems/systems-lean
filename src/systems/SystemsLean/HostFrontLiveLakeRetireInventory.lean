/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LakeRetireInventory.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LakeRetireInventory.lean. It is a closed check of the
  inventory file. It is not a Lake retirement. Lake is not gone.
  stillUsesLake false in the live file is not a Lake-gone claim.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem and example are skipped. set_option count is 0.
  The live file has no import.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LAKE-RETIRE-INVENTORY,
  SLAKE_HOST_FRONT_LIVE_LAKE_RETIRE_INVENTORY_V0,
  PARSE-LIVE-LAKE-RETIRE-INVENTORY, LAKE-RETIRE-INVENTORY, liveRel,
  kernelCheckLiveLakeRetireInventorySource,
  hostFrontLiveLakeRetireInventoryReady.
  Module: SystemsLean.HostFrontLiveLakeRetireInventory
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLakeRetireInventorySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLakeRetireInventory

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LAKE_RETIRE_INVENTORY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LAKE-RETIRE-INVENTORY"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LAKE-RETIRE-INVENTORY"

/-- Live file basename. -/
def liveRel : String := "LakeRetireInventory.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLakeRetireInventoryRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLakeRetireInventoryFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveLakeRetireInventoryFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLakeRetireInventoryResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveLakeRetireInventoryProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLakeRetireInventoryParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLakeRetireInventorySkipFuel : Nat := 8192

/-- Kept commands: namespace, kernel-checkable defs, and end.
    The live file has no import. Theorem and example are not kept.
    Accepted count printed by lean --run is 36. -/
def liveLakeRetireInventoryKeptCmds : Nat := 36

/-- theorem keyword count. LakeRetireInventory.lean has seventeen theorems. -/
def liveLakeRetireInventoryTheoremCount : Nat := 17

/-- example keyword count. LakeRetireInventory.lean has fourteen examples. -/
def liveLakeRetireInventoryExampleCount : Nat := 14

/-- set_option keyword count. LakeRetireInventory.lean has no set_option. -/
def liveLakeRetireInventorySetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LakeRetireInventory`. -/
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
def cmdAddsLakeRetireInventory (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded. -/
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

/-- Body is kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownLakeRetireInventory (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLakeRetireInventoryParseFuel body
        && termNoAppN liveLakeRetireInventoryParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLakeRetireInventoryParseFuel body
        && termNoAppN liveLakeRetireInventoryParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLakeRetireInventory (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsLakeRetireInventory : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLakeRetireInventory liveLakeRetireInventoryParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLakeRetireInventorySkipFuel rest
      if cmdBodyKnownLakeRetireInventory kn c then
        parseCmdsLakeRetireInventory n rest2
          (kn ++ cmdAddsLakeRetireInventory c) (acc ++ [c])
      else
        parseCmdsLakeRetireInventory n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLakeRetireInventorySkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLakeRetireInventory n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LakeRetireInventory.lean text.
    Greppable: parseLiveLakeRetireInventorySource,
    PARSE-LIVE-LAKE-RETIRE-INVENTORY. -/
def parseLiveLakeRetireInventorySource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLakeRetireInventory liveLakeRetireInventoryParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LakeRetireInventory"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LakeRetireInventory parse. Not a fixture.
    Greppable: kernelCheckLiveLakeRetireInventorySource,
    PARSE-LIVE-LAKE-RETIRE-INVENTORY. -/
def kernelCheckLiveLakeRetireInventorySource (src : String) : Bool :=
  match parseLiveLakeRetireInventorySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLakeRetireInventoryParsed? : Option Module :=
  match parseLiveLakeRetireInventorySource liveLakeRetireInventorySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLakeRetireInventoryParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Import is absent.
    Namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveLakeRetireInventoryParsed? with
  | some m => m.commands.length == liveLakeRetireInventoryKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, stillUsesLake,
    dependsOnLake, lakeRetireHostElaborateRemains. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLakeRetireInventoryParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "stillUsesLake"
      && has "dependsOnLake"
      && has "lakeRetireHostElaborateRemains"

/-- Wrap module lastSeg is LakeRetireInventory (no module line in the live file). -/
def liveParseHasLakeRetireInventoryModule : Bool :=
  match liveLakeRetireInventoryParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LakeRetireInventory"
      && lastSeg m.name.raw == "LakeRetireInventory"

/-- Live parse has namespace SystemsLean.LakeRetireInventory. -/
def liveParseHasLakeRetireInventoryNs : Bool :=
  match liveLakeRetireInventoryParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LakeRetireInventory"
      | _ => false

/-- Live parse ends namespace SystemsLean.LakeRetireInventory. -/
def liveParseHasLakeRetireInventoryEnd : Bool :=
  match liveLakeRetireInventoryParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LakeRetireInventory"
      | _ => false

/-- Live file has no import. Parsed module has zero import commands. -/
def liveParseHasNoImport : Bool :=
  match liveLakeRetireInventoryParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem and example are the live counts. set_option is 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLakeRetireInventoryParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLakeRetireInventorySource)
    let fuel := liveLakeRetireInventorySkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLakeRetireInventoryTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLakeRetireInventoryExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLakeRetireInventorySetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LakeRetireInventory\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LAKE_RETIRE_INVENTORY_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LAKE-RETIRE-INVENTORY\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"LAKE-RETIRE-INVENTORY\"\n"

/-- stillUsesLake def needle with a trailing newline.
    The live pin is false. That pin is not a Lake-gone claim. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := false\n"

/-- dependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String := "def dependsOnLake : Bool := false\n"

/-- lakeRetireHostElaborateRemains def needle with a trailing newline. -/
def needleHostElaborateRemains : String :=
  "def lakeRetireHostElaborateRemains : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LakeRetireInventory\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import needle. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLakeRetireInventorySource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleHostElaborateRemains).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLakeRetireInventoryReady,
    PARSE-LIVE-LAKE-RETIRE-INVENTORY,
    HOST-FRONT-LIVE-LAKE-RETIRE-INVENTORY.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLakeRetireInventoryReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LAKE_RETIRE_INVENTORY_V0")
    && (hostId == "HOST-FRONT-LIVE-LAKE-RETIRE-INVENTORY")
    && (parseId == "PARSE-LIVE-LAKE-RETIRE-INVENTORY")
    && (liveRel == "LakeRetireInventory.lean")
    && (liveLakeRetireInventoryRel
      == "src/systems/SystemsLean/LakeRetireInventory.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLakeRetireInventoryFullHost
    && !hostFrontLiveLakeRetireInventoryFullBackend
    && !hostFrontLiveLakeRetireInventoryResidualFreeClaimed
    && !hostFrontLiveLakeRetireInventoryProvablyUnlocked
    && kernelCheckLiveLakeRetireInventorySource liveLakeRetireInventorySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLakeRetireInventoryModule
    && liveParseHasLakeRetireInventoryNs
    && liveParseHasLakeRetireInventoryEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLakeRetireInventorySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLakeRetireInventory (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LAKE-RETIRE-INVENTORY =="
  IO.println s!"  host={hostId} file={liveLakeRetireInventoryRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLakeRetireInventoryRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLakeRetireInventoryRel}"
    throw (IO.userError s!"missing {liveLakeRetireInventoryRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLakeRetireInventorySource then
    IO.eprintln "error: dual-pin mismatch: on-disk LakeRetireInventory.lean != liveLakeRetireInventorySource"
    throw (IO.userError "dual-pin mismatch live LakeRetireInventory.lean")
  let r := parseLiveLakeRetireInventorySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LAKE-RETIRE-INVENTORY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LAKE-RETIRE-INVENTORY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LAKE-RETIRE-INVENTORY ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LakeRetireInventory parse false"
      throw (IO.userError "kernelCheck live LakeRetireInventory parse false")
    unless hostFrontLiveLakeRetireInventoryReady do
      IO.eprintln "error: hostFrontLiveLakeRetireInventoryReady false"
      throw (IO.userError "hostFrontLiveLakeRetireInventoryReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LakeRetireInventory source was accepted"
      throw (IO.userError "empty LakeRetireInventory source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLakeRetireInventory root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLakeRetireInventory
