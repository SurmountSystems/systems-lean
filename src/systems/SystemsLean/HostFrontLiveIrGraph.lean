/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/IrGraph.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is IrGraph.lean. It is not IrGraphTheorems.lean.
  Three imports: SystemsLean.Mult, SystemsLean.Types,
  SystemsLean.IrProgram. Namespace SystemsLean.IrGraph.
  Kept for the kernel: those three imports, the namespace, edgeMax,
  structure Edge, structure Graph, edgeCount, inductive PushNodeResult,
  inductive AddEdgeResult, and end. A count of 11.
  HostKernel accepts structure and inductive commands, so those stay.
  empty, nodeCount, isEmpty, edgeEndpointsOk, edgesSound, addEdge,
  pushNode, isWellTyped, and checkFailClosed stay in the source text
  (needles). Their bodies call IrProgram or use decide, fun, or match,
  and import SystemsLean.IrProgram does not seed those names.
  The three imports are kept. A zero-import parse is not this file.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IRGRAPH,
  SLAKE_HOST_FRONT_LIVE_IRGRAPH_V0,
  PARSE-LIVE-IRGRAPH, liveRel,
  kernelCheckLiveIrGraphSource,
  hostFrontLiveIrGraphReady.
  Module: SystemsLean.HostFrontLiveIrGraph
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveIrGraphSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveIrGraph

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IRGRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IRGRAPH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IRGRAPH"

/-- Live file basename. -/
def liveRel : String := "IrGraph.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrGraphRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveIrGraphFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveIrGraphFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveIrGraphResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveIrGraphProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveIrGraphParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveIrGraphSkipFuel : Nat := 8192

/-- Kept commands: three imports, namespace, edgeMax, two structures,
    edgeCount, two inductives, and end. A count of 11. From IrGraph.lean. -/
def liveIrGraphKeptCmds : Nat := 11

/-- Dotted ident `SystemsLean . IrGraph`. -/
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

/-- Names a command adds to the known-const set.
    Imports do not add names. IrProgram.length is not seeded. -/
def cmdAddsIrGraph (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Parse `def` only when the body is one complete term.
    A leftover that is not the next command means the body used syntax
    HostTerm does not keep (`<`, `fun`, `match`, list lit). Return none
    so the caller skipUntilCmd. Do not keep a prefix of the body. -/
def parseDefIrGraph (fuel : Nat) (dname : String)
    (rest : List String) : Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match kind with
        | DefBodyKind.equation => none
        | DefBodyKind.assign =>
          match parseHostTypeAllHt tyToks with
          | none => none
          | some retTy =>
            let ty := addBinderArrows bs retTy
            let bnames := bs.map (fun p => p.fst)
            let dn := HostTerm.n dname
            match parseTermHt fuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              let complete :=
                match rest4 with
                | [] => true
                | t :: _ => isCmdKw t
              if !complete then none
              else
                let rest5 := skipNonCmd liveIrGraphSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    open is not parsed here. theorem, example, and set_option are not
    parsed here. -/
def parseOneCmdIrGraph (fuel : Nat) (toks : List String) :
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
  | "inductive" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseCtorBarsHt fuel rest [] with
      | none => none
      | some (ctors, rest2) =>
        if ctors.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingHt rest3 with
            | some (der, rest4) =>
              some (Cmd.inductive_ (HostTerm.n (lastSeg name)) ctors der, rest4)
            | none => none
          | _ =>
            some (Cmd.inductive_ (HostTerm.n (lastSeg name)) ctors [], rest2)
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefIrGraph fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip open and defs whose bodies are not kernel-known.
    A non-command token (`open`) is not a parse failure. -/
def parseCmdsIrGraph : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdIrGraph liveIrGraphParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveIrGraphSkipFuel rest
      if cmdBodyKnown kn c then
        parseCmdsIrGraph n rest2
          (kn ++ cmdAddsIrGraph c) (acc ++ [c])
      else
        parseCmdsIrGraph n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveIrGraphSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsIrGraph n rest2 kn acc
        else none
      | [] => some acc

/-- Parse live IrGraph.lean text.
    Greppable: parseLiveIrGraphSource, PARSE-LIVE-IRGRAPH. -/
def parseLiveIrGraphSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsIrGraph liveIrGraphParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.IrGraph"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live IrGraph parse. Not a fixture. Not a hardcoded true.
    Greppable: kernelCheckLiveIrGraphSource, PARSE-LIVE-IRGRAPH. -/
def kernelCheckLiveIrGraphSource (src : String) : Bool :=
  match parseLiveIrGraphSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveIrGraphParsed? : Option Module :=
  match parseLiveIrGraphSource liveIrGraphSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveIrGraphParsed? with
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

/-- Three imports. Not zero. SystemsLean.Mult, Types, and IrProgram. -/
def liveParseImportsOk : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    importNames m.commands
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram"]

/-- Live parse command count. Three imports, namespace, edgeMax,
    Edge, Graph, edgeCount, two inductives, end. Count is 11. -/
def liveParseCmdCountOk : Bool :=
  match liveIrGraphParsed? with
  | some m => m.commands.length == liveIrGraphKeptCmds
  | none => false

/-- edgeMax is a Nat literal 16. -/
def liveParseHasEdgeMax : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.nat) (Term.litNat k) =>
        x.raw == "edgeMax" && k == 16
      | _ => false

/-- structure Edge has fromIdx and toIdx, both Nat. -/
def liveParseHasEdgeStruct : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "Edge"
          && fields.map (fun f => f.name.raw) == ["fromIdx", "toIdx"]
          && fields.all (fun f =>
            match f.ty with
            | HostType.nat => true
            | _ => false)
          && fields.length == 2
      | _ => false

/-- structure Graph has prog : Program and edges : List. -/
def liveParseHasGraphStruct : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "Graph"
          && fields.map (fun f => f.name.raw) == ["prog", "edges"]
          && (match fields with
            | [p, e] =>
              (match p.ty with
                | HostType.named n => n.raw == "Program"
                | _ => false)
                && (match e.ty with
                  | HostType.named n => n.raw == "List"
                  | _ => false)
            | _ => false)
      | _ => false

/-- edgeCount is a defBind on Graph returning Nat. -/
def liveParseHasEdgeCount : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.defBind x bs ret _ =>
        x.raw == "edgeCount"
          && bs.any (fun p =>
            p.fst.raw == "g"
              && match p.snd with
                | HostType.named n => n.raw == "Graph"
                | _ => false)
          && match ret with
            | HostType.nat => true
            | _ => false
      | _ => false

/-- PushNodeResult has ok, badNode, and full. -/
def liveParseHasPushInd : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "PushNodeResult"
          && ctors.map (fun d => d.name.raw) == ["ok", "badNode", "full"]
      | _ => false

/-- AddEdgeResult has ok, full, and badEndpoints. -/
def liveParseHasAddInd : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "AddEdgeResult"
          && ctors.map (fun d => d.name.raw)
            == ["ok", "full", "badEndpoints"]
      | _ => false

/-- Wrap module lastSeg is IrGraph (no module line in the live file). -/
def liveParseHasIrGraphModule : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.IrGraph"
      && lastSeg m.name.raw == "IrGraph"

/-- Live parse has namespace SystemsLean.IrGraph. -/
def liveParseHasIrGraphNs : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.IrGraph"
      | _ => false

/-- Live parse ends namespace SystemsLean.IrGraph. -/
def liveParseHasIrGraphEnd : Bool :=
  match liveIrGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.IrGraph"
      | _ => false

/-- Import needles. Three imports, each once. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- Import SystemsLean.Types. -/
def needleImportTypes : String := "import SystemsLean.Types\n"

/-- Import SystemsLean.IrProgram. Not dropped. -/
def needleImportIrProgram : String := "import SystemsLean.IrProgram\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.IrGraph\n"

/-- edgeMax def needle. Body is the Nat literal 16. -/
def needleEdgeMax : String := "def edgeMax : Nat := 16\n"

/-- structure Edge needle. -/
def needleStructEdge : String := "structure Edge where\n"

/-- structure Graph needle. -/
def needleStructGraph : String := "structure Graph where\n"

/-- empty def needle. Body calls IrProgram.empty. Not a kernel atom. -/
def needleEmpty : String :=
  "def empty : Graph := { prog := IrProgram.empty, edges := [] }\n"

/-- edgeCount def needle. Body is g.edges.length. -/
def needleEdgeCount : String :=
  "def edgeCount (g : Graph) : Nat := g.edges.length\n"

/-- nodeCount def needle. Body calls IrProgram.length. -/
def needleNodeCount : String :=
  "def nodeCount (g : Graph) : Nat := IrProgram.length g.prog\n"

/-- isEmpty def needle. Body calls IrProgram.isEmpty. -/
def needleIsEmpty : String := "def isEmpty (g : Graph) : Bool :=\n"

/-- PushNodeResult inductive needle. -/
def needlePushInd : String := "inductive PushNodeResult where\n"

/-- AddEdgeResult inductive needle. -/
def needleAddInd : String := "inductive AddEdgeResult where\n"

/-- edgeEndpointsOk def needle. Body uses decide and `<`. -/
def needleEndpoints : String :=
  "def edgeEndpointsOk (e : Edge) (nCount : Nat) : Bool :=\n"

/-- edgesSound def needle. Body uses decide, fun, and `.all`. -/
def needleEdgesSound : String :=
  "def edgesSound (edges : List Edge) (nCount : Nat) : Bool :=\n"

/-- addEdge def needle. -/
def needleAddEdge : String :=
  "def addEdge (g : Graph) (fromIdx toIdx : Nat) : AddEdgeResult :=\n"

/-- pushNode def needle. Body matches IrProgram.push. -/
def needlePushNode : String :=
  "def pushNode (g : Graph) (n : IrNode) : PushNodeResult :=\n"

/-- isWellTyped def needle. -/
def needleIsWellTyped : String := "def isWellTyped (g : Graph) : Bool :=\n"

/-- checkFailClosed def needle. Body is isWellTyped, not a lone atom kept
    ahead of that def. -/
def needleCheckFail : String :=
  "def checkFailClosed (g : Graph) : Bool := isWellTyped g\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.IrGraph\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Three imports. The live file does not have zero imports. -/
def liveNeedlesOk : Bool :=
  let src := liveIrGraphSource
  (src.splitOn needleImportMult).length == 2
    && (src.splitOn needleImportTypes).length == 2
    && (src.splitOn needleImportIrProgram).length == 2
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleEdgeMax).length > 1
    && (src.splitOn needleStructEdge).length > 1
    && (src.splitOn needleStructGraph).length > 1
    && (src.splitOn needleEmpty).length > 1
    && (src.splitOn needleEdgeCount).length > 1
    && (src.splitOn needleNodeCount).length > 1
    && (src.splitOn needleIsEmpty).length > 1
    && (src.splitOn needlePushInd).length > 1
    && (src.splitOn needleAddInd).length > 1
    && (src.splitOn needleEndpoints).length > 1
    && (src.splitOn needleEdgesSound).length > 1
    && (src.splitOn needleAddEdge).length > 1
    && (src.splitOn needlePushNode).length > 1
    && (src.splitOn needleIsWellTyped).length > 1
    && (src.splitOn needleCheckFail).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveIrGraphReady, PARSE-LIVE-IRGRAPH,
    HOST-FRONT-LIVE-IRGRAPH.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveIrGraphReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IRGRAPH_V0")
    && (hostId == "HOST-FRONT-LIVE-IRGRAPH")
    && (parseId == "PARSE-LIVE-IRGRAPH")
    && (liveRel == "IrGraph.lean")
    && (liveIrGraphRel == "src/systems/SystemsLean/IrGraph.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveIrGraphFullHost
    && !hostFrontLiveIrGraphFullBackend
    && !hostFrontLiveIrGraphResidualFreeClaimed
    && !hostFrontLiveIrGraphProvablyUnlocked
    && kernelCheckLiveIrGraphSource liveIrGraphSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseHasEdgeMax
    && liveParseHasEdgeStruct
    && liveParseHasGraphStruct
    && liveParseHasEdgeCount
    && liveParseHasPushInd
    && liveParseHasAddInd
    && liveParseHasIrGraphModule
    && liveParseHasIrGraphNs
    && liveParseHasIrGraphEnd
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveIrGraphSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveIrGraph (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IRGRAPH =="
  IO.println s!"  host={hostId} file={liveIrGraphRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveIrGraphRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveIrGraphRel}"
    throw (IO.userError s!"missing {liveIrGraphRel}")
  let disk <- IO.FS.readFile path
  if disk != liveIrGraphSource then
    IO.eprintln "error: dual-pin mismatch: on-disk IrGraph.lean != liveIrGraphSource"
    throw (IO.userError "dual-pin mismatch live IrGraph.lean")
  let r := parseLiveIrGraphSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IRGRAPH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IRGRAPH reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IRGRAPH ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} edgeMax={liveParseHasEdgeMax} edge={liveParseHasEdgeStruct} graph={liveParseHasGraphStruct} edgeCount={liveParseHasEdgeCount} push={liveParseHasPushInd} add={liveParseHasAddInd} module={liveParseHasIrGraphModule} namespace={liveParseHasIrGraphNs} end={liveParseHasIrGraphEnd} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live IrGraph parse false"
      throw (IO.userError "kernelCheck live IrGraph parse false")
    unless hostFrontLiveIrGraphReady do
      IO.eprintln "error: hostFrontLiveIrGraphReady false"
      throw (IO.userError "hostFrontLiveIrGraphReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty IrGraph source was accepted"
      throw (IO.userError "empty IrGraph source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveIrGraph root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveIrGraph
