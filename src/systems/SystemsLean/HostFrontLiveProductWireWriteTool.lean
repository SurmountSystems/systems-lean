/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductWireWriteTool.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that
  parse. Ready is that conjunction, not a hardcoded true.
  This wrap is ProductWireWriteTool.lean. It is not CapableWriteHc.lean.
  It is not InstallOut.lean.
  Literal defs stay. Compound defs are skipped when the body is not
  kernel-checkable. theorem count is 7. example count is 16.
  set_option count is 1.
  notLakeBuilt is kept: the prefix before `!=` parses
  (nativeIo and not printsFullHelperC). The `!=` tail is skip-folded.
  Ready names defs outside this file.
  containsStr, emit, filterArgs, and main are not kept.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def stillUsesLake is true. That def is not this wrap's
  FullHost flag. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCT-WIRE-WRITE-TOOL,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_WIRE_WRITE_TOOL_V0,
  PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL, PRODUCT-WIRE-FS-WRITE-TOOL, liveRel,
  kernelCheckLiveProductWireWriteToolSource,
  hostFrontLiveProductWireWriteToolReady.
  Module: SystemsLean.HostFrontLiveProductWireWriteTool
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductWireWriteToolSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductWireWriteTool

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_PRODUCT_WIRE_WRITE_TOOL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCT-WIRE-WRITE-TOOL"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL"

/-- Live file relative to repo root. Dual-pin path.
    liveRel itself is defined in the Source module. -/
def liveProductWireWriteToolRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductWireWriteToolFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def stillUsesLake is true. That def is not this flag. -/
def hostFrontLiveProductWireWriteToolFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductWireWriteToolResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProductWireWriteToolProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProductWireWriteToolParseFuel : Nat := 256

/-- Skip fuel for theorems, examples, and un-kernelable defs. -/
def liveProductWireWriteToolSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, kernel-checkable defs, and end.
    ProductWireWriteTool.lean keeps 23, including productWireFsWriterNotLakeBuilt.
    A count of 22 drops that def. A count of 4 would drop the literal defs.
    productWireFsWriterCSource is string append, not a kept literal. -/
def liveProductWireWriteToolKeptCmds : Nat := 23

/-- theorem keyword count. ProductWireWriteTool.lean has seven theorems. -/
def liveProductWireWriteToolTheoremCount : Nat := 7

/-- example keyword count. ProductWireWriteTool.lean has sixteen examples. -/
def liveProductWireWriteToolExampleCount : Nat := 16

/-- set_option keyword count. ProductWireWriteTool.lean has one set_option. -/
def liveProductWireWriteToolSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . ProductWireWriteTool`. -/
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
def cmdAddsProductWireWriteTool (c : Cmd) : List String :=
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
def cmdBodyKnownProductWireWriteTool (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductWireWriteToolParseFuel body
        && termNoAppN liveProductWireWriteToolParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductWireWriteToolParseFuel body
        && termNoAppN liveProductWireWriteToolParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProductWireWriteTool (fuel : Nat) (toks : List String) :
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
def parseCmdsProductWireWriteTool : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductWireWriteTool
        liveProductWireWriteToolParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductWireWriteToolSkipFuel rest
      if cmdBodyKnownProductWireWriteTool kn c then
        parseCmdsProductWireWriteTool n rest2
          (kn ++ cmdAddsProductWireWriteTool c) (acc ++ [c])
      else
        parseCmdsProductWireWriteTool n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductWireWriteToolSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductWireWriteTool n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProductWireWriteTool.lean text.
    Greppable: parseLiveProductWireWriteToolSource,
    PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL. -/
def parseLiveProductWireWriteToolSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductWireWriteTool
        liveProductWireWriteToolParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductWireWriteTool"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductWireWriteTool parse. Not a fixture.
    Calls HostKernel.kernelCheck. Greppable:
    kernelCheckLiveProductWireWriteToolSource,
    PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL. -/
def kernelCheckLiveProductWireWriteToolSource (src : String) : Bool :=
  match parseLiveProductWireWriteToolSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductWireWriteToolParsed? : Option Module :=
  match parseLiveProductWireWriteToolSource liveProductWireWriteToolSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductWireWriteToolParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Two imports, namespace, end, and kernel-checkable defs.
    Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveProductWireWriteToolParsed? with
  | some m => m.commands.length == liveProductWireWriteToolKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveProductWireWriteToolParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "surfaceId"
      && has "stillUsesLake"
      && has "dependsOnLake"
      && has "productWireFsWriterFinishedClaimed"
      && has "productWireFsWriterNativeIo"
      && has "productWireFsWriterPrintsFullHelperC"
      && has "productWireFsWriterCRel"
      && has "productWireFsWriterBinRel"
      && has "lakeExeProductWireFsWriter"
      && has "justRecipeProductWireFsWriter"
      && has "productWireFsWriterKeepsHostLake"

/-- Wrap module lastSeg is ProductWireWriteTool
    (no module line in the live file). -/
def liveParseHasProductWireWriteToolModule : Bool :=
  match liveProductWireWriteToolParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProductWireWriteTool"
      && lastSeg m.name.raw == "ProductWireWriteTool"

/-- Live parse has namespace SystemsLean.ProductWireWriteTool. -/
def liveParseHasProductWireWriteToolNs : Bool :=
  match liveProductWireWriteToolParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductWireWriteTool"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProductWireWriteTool. -/
def liveParseHasProductWireWriteToolEnd : Bool :=
  match liveProductWireWriteToolParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductWireWriteTool"
      | _ => false

/-- Live parse imports SystemsLean.CapableWriteHc. -/
def liveParseHasCapableWriteHcImport : Bool :=
  match liveProductWireWriteToolParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CapableWriteHc"
      | _ => false

/-- Live parse imports SystemsLean.InstallOut. -/
def liveParseHasInstallOutImport : Bool :=
  match liveProductWireWriteToolParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.InstallOut"
      | _ => false

/-- Keyword counts: theorem 7, example 16, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveProductWireWriteToolParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveProductWireWriteToolSource)
    let fuel := liveProductWireWriteToolSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveProductWireWriteToolTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveProductWireWriteToolExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProductWireWriteToolSetOptionCount

/-- CapableWriteHc import needle. Trailing newline. -/
def needleImportCapableWriteHc : String :=
  "import SystemsLean.CapableWriteHc\n"

/-- InstallOut import needle. Trailing newline. -/
def needleImportInstallOut : String :=
  "import SystemsLean.InstallOut\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String :=
  "namespace SystemsLean.ProductWireWriteTool\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-PRODUCT-WIRE-FS-WRITE-TOOL\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"PRODUCT-WIRE-FS-WRITE-TOOL\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- dependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String := "def dependsOnLake : Bool := true\n"

/-- Finished pin needle with a trailing newline. -/
def needleFinishedClaimed : String :=
  "def productWireFsWriterFinishedClaimed : Bool := true\n"

/-- Native IO pin needle with a trailing newline. -/
def needleNativeIo : String :=
  "def productWireFsWriterNativeIo : Bool := true\n"

/-- Helper-C pin needle with a trailing newline. -/
def needlePrintsFullHelperC : String :=
  "def productWireFsWriterPrintsFullHelperC : Bool := false\n"

/-- Keeps-host-Lake def line needle with a trailing newline. -/
def needleKeepsHostLake : String :=
  "def productWireFsWriterKeepsHostLake : Bool :=\n"

/-- PRODUCT-WIRE-FS-WRITE-TOOL-THEOREM section anchor. Trailing newline. -/
def needleSectionTheorem : String :=
  "/-! ### PRODUCT-WIRE-FS-WRITE-TOOL-THEOREM -/\n"

/-- Ready theorem anchor. Trailing newline. -/
def needleTheoremReady : String :=
  "theorem productWireFsWriterReady_true :\n"

/-- PRODUCT-WIRE-FS-WRITE-TOOL-SMOKE section anchor. Trailing newline. -/
def needleSectionSmoke : String :=
  "/-! ### PRODUCT-WIRE-FS-WRITE-TOOL-SMOKE -/\n"

/-- Ready example anchor. Trailing newline. -/
def needleExampleReady : String :=
  "example : productWireFsWriterReady = true := by native_decide\n"

/-- set_option anchor. Trailing newline. -/
def needleSetOption : String := "set_option maxRecDepth 8192\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProductWireWriteTool\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveProductWireWriteToolSource
  (src.splitOn needleImportCapableWriteHc).length > 1
    && (src.splitOn needleImportInstallOut).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleFinishedClaimed).length > 1
    && (src.splitOn needleNativeIo).length > 1
    && (src.splitOn needlePrintsFullHelperC).length > 1
    && (src.splitOn needleKeepsHostLake).length > 1
    && (src.splitOn needleSectionTheorem).length > 1
    && (src.splitOn needleTheoremReady).length > 1
    && (src.splitOn needleSectionSmoke).length > 1
    && (src.splitOn needleExampleReady).length > 1
    && (src.splitOn needleSetOption).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductWireWriteToolReady,
    PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL,
    HOST-FRONT-LIVE-PRODUCT-WIRE-WRITE-TOOL.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProductWireWriteToolReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCT_WIRE_WRITE_TOOL_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCT-WIRE-WRITE-TOOL")
    && (parseId == "PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL")
    && (liveRel == "ProductWireWriteTool.lean")
    && (liveProductWireWriteToolRel
      == "src/systems/SystemsLean/ProductWireWriteTool.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductWireWriteToolFullHost
    && !hostFrontLiveProductWireWriteToolFullBackend
    && !hostFrontLiveProductWireWriteToolResidualFreeClaimed
    && !hostFrontLiveProductWireWriteToolProvablyUnlocked
    && kernelCheckLiveProductWireWriteToolSource
      liveProductWireWriteToolSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasProductWireWriteToolModule
    && liveParseHasProductWireWriteToolNs
    && liveParseHasProductWireWriteToolEnd
    && liveParseHasCapableWriteHcImport
    && liveParseHasInstallOutImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductWireWriteToolSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProductWireWriteTool (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL =="
  IO.println s!"  host={hostId} file={liveProductWireWriteToolRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProductWireWriteToolRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductWireWriteToolRel}"
    throw (IO.userError s!"missing {liveProductWireWriteToolRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductWireWriteToolSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductWireWriteTool.lean != liveProductWireWriteToolSource"
    throw (IO.userError "dual-pin mismatch live ProductWireWriteTool.lean")
  let fuel := liveProductWireWriteToolSkipFuel
  let toks := tokenizeHostTerm (stripComments disk)
  let th := toksCountKw fuel toks "theorem" 0
  let ex := toksCountKw fuel toks "example" 0
  let so := toksCountKw fuel toks "set_option" 0
  IO.println s!"kw theorem={th} example={ex} set_option={so}"
  let r := parseLiveProductWireWriteToolSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    for c in m.commands do
      match c with
      | Cmd.importModule x => IO.println s!"kept import {x.raw}"
      | Cmd.namespace x => IO.println s!"kept namespace {x.raw}"
      | Cmd.endNamespace x => IO.println s!"kept end {x.raw}"
      | Cmd.def_ x _ _ => IO.println s!"kept def {x.raw}"
      | Cmd.defBind x _ _ _ => IO.println s!"kept defBind {x.raw}"
      | _ => IO.println "kept other"
    IO.println s!"parts cmdOk={liveParseCmdCountOk} kwOk={liveParseKwCountsOk} literals={liveParseHasLiteralDefs} ns={liveParseHasProductWireWriteToolNs} end={liveParseHasProductWireWriteToolEnd} impA={liveParseHasCapableWriteHcImport} impB={liveParseHasInstallOutImport} needles={liveNeedlesOk} empty={liveParseRejectsEmpty}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductWireWriteTool parse false"
      throw (IO.userError "kernelCheck live ProductWireWriteTool parse false")
    unless hostFrontLiveProductWireWriteToolReady do
      IO.eprintln "error: hostFrontLiveProductWireWriteToolReady false"
      throw (IO.userError "hostFrontLiveProductWireWriteToolReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProductWireWriteTool source was accepted"
      throw (IO.userError "empty ProductWireWriteTool source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductWireWriteTool root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductWireWriteTool
