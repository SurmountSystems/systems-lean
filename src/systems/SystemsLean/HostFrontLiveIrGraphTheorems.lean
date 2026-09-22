/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/IrGraphTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is IrGraphTheorems.lean. It is not IrGraph.lean.
  Theorems, examples, opens, and private defs are skipped. Private def
  bodies are struct literals, matches, or equations, not kernel-checkable
  here. Kept commands are four imports, namespace, and end.
  theorem count is 23. example count is 9. set_option count is 0.
  Section anchors are the IR-GRAPH-THEOREM and IR-GRAPH-SMOKE headers
  that occur in IrGraphTheorems.lean. Not LlvmHold anchors.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IR-GRAPH-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_IR_GRAPH_THEOREMS_V0,
  PARSE-LIVE-IR-GRAPH-THEOREMS, IR-GRAPH-THEOREM, liveRel,
  kernelCheckLiveIrGraphTheoremsSource,
  hostFrontLiveIrGraphTheoremsReady.
  Module: SystemsLean.HostFrontLiveIrGraphTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveIrGraphTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveIrGraphTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_IR_GRAPH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IR-GRAPH-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IR-GRAPH-THEOREMS"

/-- Live file relative to repo root. Dual-pin path.
    liveRel itself is defined in the Source module. -/
def liveIrGraphTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveIrGraphTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveIrGraphTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveIrGraphTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveIrGraphTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveIrGraphTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorems, examples, opens, and private defs. -/
def liveIrGraphTheoremsSkipFuel : Nat := 8192

/-- Kept commands: four imports, namespace, and end.
    Theorems, examples, opens, and private defs are skipped.
    From IrGraphTheorems.lean. A count of 4 would drop two imports. -/
def liveIrGraphTheoremsKeptCmds : Nat := 6

/-- theorem keyword count. IrGraphTheorems.lean has twenty-three theorems. -/
def liveIrGraphTheoremsTheoremCount : Nat := 23

/-- example keyword count. IrGraphTheorems.lean has nine examples. -/
def liveIrGraphTheoremsExampleCount : Nat := 9

/-- set_option keyword count. IrGraphTheorems.lean has no set_option. -/
def liveIrGraphTheoremsSetOptionCount : Nat := 0

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
def cmdAddsIrGraphTheorems (c : Cmd) : List String :=
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

/-- Body is kernel-known, no untyped proj, no Term.app.
    Private defs in this file are not kept even when this would pass. -/
def cmdBodyKnownIrGraphTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveIrGraphTheoremsParseFuel body
        && termNoAppN liveIrGraphTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveIrGraphTheoremsParseFuel body
        && termNoAppN liveIrGraphTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, open, private, and set_option are not parsed here. -/
def parseOneCmdIrGraphTheorems (fuel : Nat) (toks : List String) :
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

/-- True for a private def command. Those bodies are not kept. -/
def cmdIsDefIrGraphTheorems : Cmd -> Bool
  | Cmd.def_ _ _ _ => true
  | Cmd.defBind _ _ _ _ => true
  | _ => false

/-- Fold commands. Skip theorem, example, set_option, open, private,
    and every def (private struct / match / equation bodies). -/
def parseCmdsIrGraphTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdIrGraphTheorems liveIrGraphTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveIrGraphTheoremsSkipFuel rest
      if cmdIsDefIrGraphTheorems c then
        parseCmdsIrGraphTheorems n rest2 kn acc
      else if cmdBodyKnownIrGraphTheorems kn c then
        parseCmdsIrGraphTheorems n rest2
          (kn ++ cmdAddsIrGraphTheorems c) (acc ++ [c])
      else
        parseCmdsIrGraphTheorems n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsIrGraphTheorems n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveIrGraphTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsIrGraphTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live IrGraphTheorems.lean text.
    Greppable: parseLiveIrGraphTheoremsSource,
    PARSE-LIVE-IR-GRAPH-THEOREMS. -/
def parseLiveIrGraphTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsIrGraphTheorems liveIrGraphTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.IrGraphTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live IrGraphTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveIrGraphTheoremsSource,
    PARSE-LIVE-IR-GRAPH-THEOREMS. -/
def kernelCheckLiveIrGraphTheoremsSource (src : String) : Bool :=
  match parseLiveIrGraphTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveIrGraphTheoremsParsed? : Option Module :=
  match parseLiveIrGraphTheoremsSource liveIrGraphTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveIrGraphTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Four imports, namespace, and end.
    Theorems, examples, opens, and private defs are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveIrGraphTheoremsParsed? with
  | some m => m.commands.length == liveIrGraphTheoremsKeptCmds
  | none => false

/-- This file keeps no def. Private defs are skipped. -/
def liveParseHasNoDef : Bool :=
  match liveIrGraphTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is IrGraphTheorems (no module line in the live file). -/
def liveParseHasIrGraphTheoremsModule : Bool :=
  match liveIrGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.IrGraphTheorems"
      && lastSeg m.name.raw == "IrGraphTheorems"

/-- Live parse has namespace SystemsLean.IrGraph.
    The long-file split shares that namespace. It is not
    SystemsLean.IrGraphTheorems. -/
def liveParseHasIrGraphNs : Bool :=
  match liveIrGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.IrGraph"
      | _ => false

/-- Live parse ends namespace SystemsLean.IrGraph. -/
def liveParseHasIrGraphEnd : Bool :=
  match liveIrGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.IrGraph"
      | _ => false

/-- Live parse imports SystemsLean.IrGraph. -/
def liveParseHasIrGraphImport : Bool :=
  match liveIrGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.IrGraph"
      | _ => false

/-- Live parse imports SystemsLean.Mult, Types, and IrProgram. -/
def liveParseHasSupportImports : Bool :=
  match liveIrGraphTheoremsParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Mult"
      && has "SystemsLean.Types"
      && has "SystemsLean.IrProgram"

/-- Keyword counts: theorem 23, example 9, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveIrGraphTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveIrGraphTheoremsSource)
    let fuel := liveIrGraphTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveIrGraphTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveIrGraphTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveIrGraphTheoremsSetOptionCount

/-- Import needles. Trailing newline. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- Import needle. Trailing newline. -/
def needleImportTypes : String := "import SystemsLean.Types\n"

/-- Import needle. Trailing newline. -/
def needleImportIrProgram : String := "import SystemsLean.IrProgram\n"

/-- Import needle. Trailing newline. -/
def needleImportIrGraph : String := "import SystemsLean.IrGraph\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.IrGraph\n"

/-- IR-GRAPH-THEOREM section anchor. Trailing newline.
    This string occurs in IrGraphTheorems.lean. -/
def needleSectionTheorem : String :=
  "/-! ### IR-GRAPH-THEOREM / HOST-IR-GRAPH-THEOREM (readable statements, then proofs)\n"

/-- First theorem anchor. Trailing newline. -/
def needleTheoremEmpty : String :=
  "theorem isWellTyped_empty_true : isWellTyped empty = true := rfl\n"

/-- edgeMax theorem anchor. Trailing newline. -/
def needleTheoremEdgeMax : String :=
  "theorem edgeMax_eq_sixteen : edgeMax = 16 := rfl\n"

/-- edgesSound section anchor. Trailing newline. -/
def needleSectionEdges : String :=
  "/-! ### edgesSound / single-node program-only graph (beyond EMPTY-GRAPH-OK) -/\n"

/-- pushNode section anchor. Trailing newline. -/
def needleSectionPush : String :=
  "/-! ### pushNode / addEdge success + fail-closed (beyond EMPTY-GRAPH-OK) -/\n"

/-- Multi-node section anchor. Trailing newline. -/
def needleSectionMulti : String :=
  "/-! ### Multi-node edge contracts (one-edge then two-edge; beyond one-node self-edge) -/\n"

/-- Capacity section anchor. Trailing newline. -/
def needleSectionCapacity : String :=
  "/-! ### Edge capacity full reject (promote IR-GRAPH-SMOKE capacity-full path)\n"

/-- Oversize theorem anchor. Trailing newline. -/
def needleTheoremOversize : String :=
  "theorem isWellTyped_oversize_false :\n"

/-- IR-GRAPH-SMOKE section anchor. Trailing newline.
    This string occurs in IrGraphTheorems.lean. -/
def needleSectionSmoke : String :=
  "/-! ### Graph smoke (behavioral; lake build fails if an example does not hold)\n"

/-- Empty well-typed example anchor. Trailing newline. -/
def needleExampleEmpty : String :=
  "example : isWellTyped empty = true := by decide\n"

/-- edgeMax example anchor. Trailing newline. -/
def needleExampleEdgeMax : String :=
  "example : edgeMax = 16 := by decide\n"

/-- Capacity-full example anchor. Trailing newline. -/
def needleExampleFull : String :=
  "example : edgeCount (smokeFillEdges smokeTwoNodes 16) = 16 := by decide\n"

/-- Private def anchor. Trailing newline. Not kept by the parser. -/
def needlePrivateDef : String :=
  "private def thmValueNode : IrNode :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.IrGraph\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.IrGraphTheorems. Anchors are from IrGraphTheorems.lean. -/
def liveNeedlesOk : Bool :=
  let src := liveIrGraphTheoremsSource
  (src.splitOn needleImportMult).length > 1
    && (src.splitOn needleImportTypes).length > 1
    && (src.splitOn needleImportIrProgram).length > 1
    && (src.splitOn needleImportIrGraph).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleSectionTheorem).length > 1
    && (src.splitOn needleTheoremEmpty).length > 1
    && (src.splitOn needleTheoremEdgeMax).length > 1
    && (src.splitOn needleSectionEdges).length > 1
    && (src.splitOn needleSectionPush).length > 1
    && (src.splitOn needleSectionMulti).length > 1
    && (src.splitOn needleSectionCapacity).length > 1
    && (src.splitOn needleTheoremOversize).length > 1
    && (src.splitOn needleSectionSmoke).length > 1
    && (src.splitOn needleExampleEmpty).length > 1
    && (src.splitOn needleExampleEdgeMax).length > 1
    && (src.splitOn needleExampleFull).length > 1
    && (src.splitOn needlePrivateDef).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveIrGraphTheoremsReady,
    PARSE-LIVE-IR-GRAPH-THEOREMS,
    HOST-FRONT-LIVE-IR-GRAPH-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveIrGraphTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IR_GRAPH_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-IR-GRAPH-THEOREMS")
    && (parseId == "PARSE-LIVE-IR-GRAPH-THEOREMS")
    && (liveRel == "IrGraphTheorems.lean")
    && (liveIrGraphTheoremsRel
      == "src/systems/SystemsLean/IrGraphTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveIrGraphTheoremsFullHost
    && !hostFrontLiveIrGraphTheoremsFullBackend
    && !hostFrontLiveIrGraphTheoremsResidualFreeClaimed
    && !hostFrontLiveIrGraphTheoremsProvablyUnlocked
    && kernelCheckLiveIrGraphTheoremsSource liveIrGraphTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoDef
    && liveParseHasIrGraphTheoremsModule
    && liveParseHasIrGraphNs
    && liveParseHasIrGraphEnd
    && liveParseHasIrGraphImport
    && liveParseHasSupportImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveIrGraphTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveIrGraphTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IR-GRAPH-THEOREMS =="
  IO.println s!"  host={hostId} file={liveIrGraphTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveIrGraphTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveIrGraphTheoremsRel}"
    throw (IO.userError s!"missing {liveIrGraphTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveIrGraphTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk IrGraphTheorems.lean != liveIrGraphTheoremsSource"
    throw (IO.userError "dual-pin mismatch live IrGraphTheorems.lean")
  let r := parseLiveIrGraphTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IR-GRAPH-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IR-GRAPH-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IR-GRAPH-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live IrGraphTheorems parse false"
      throw (IO.userError "kernelCheck live IrGraphTheorems parse false")
    unless hostFrontLiveIrGraphTheoremsReady do
      IO.eprintln "error: hostFrontLiveIrGraphTheoremsReady false"
      throw (IO.userError "hostFrontLiveIrGraphTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty IrGraphTheorems source was accepted"
      throw (IO.userError "empty IrGraphTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveIrGraphTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveIrGraphTheorems
