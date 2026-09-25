/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckIrProgramTerm.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckIrProgramTerm.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckIrProgramTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IR-PROGRAM-TERM.
  Module: SystemsLean.HostFrontLiveHostModuleCheckIrProgramTermSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckIrProgramTermSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckIrProgramTerm.lean"

/-- Pinned live HostModuleCheckIrProgramTerm.lean bytes. -/
def liveHostModuleCheckIrProgramTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- IrProgram L2 term-surface pilot (beyond Types).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: IrProgram dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  IrProgram L2 dialect subset (documented; not full Lean 4 elaborator):
  - programCap body exact 8 (same-line after :=).
  - empty body exact { nodes := [] }.
  - push multi-line fail-closed: badNode / full / ok arms (collapsed body).
  - isWellTyped multi-line: non-empty + cap + all IrNode.isWellTyped.
  - checkFailClosed body exact isWellTyped p.
  - structure Program / inductive PushResult / length / isEmpty / foldWellTyped
    stay L0 token presence this pilot.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckIrProgramTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckIrProgramTermSurfaceOk (E-good dialect + PT1..PT4
    dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk, not bare
    dualOk alone.

  Intentional non-claims:
  - IrProgram pilot only -- not package elaborate, not IrProgramTheorems L3.
  - Mult TERM-SURFACE Mult-only dual-ok unchanged (HostModuleCheckMultTerm).
  - Linear TERM-SURFACE Linear-only dual-ok unchanged (HostModuleCheckLinearTerm).
  - Types TERM-SURFACE Types-only dual-ok unchanged (HostModuleCheckTypesTerm).
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for IrProgram is IrProgram-only honesty when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckIrProgramTerm,
  TERM-SURFACE, IrProgram-only, ILL-TYPED-TERM, checkIrProgramTermDialect,
  hostModuleCheckBadIrProgramCapText,
  hostModuleCheckBadIrProgramCheckFailClosedText,
  hostModuleCheckBadIrProgramIsWellTypedText,
  hostModuleCheckBadIrProgramPushText,
  hostModuleCheckIrProgramTermDialectOk, IrProgram term-surface pilot,
  hostModuleCheckIrProgramTermSurfaceDualOk, hostModuleCheckIrProgramTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckIrProgramTerm
  Red/green: lake build SystemsLean.HostModuleCheckIrProgramTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

/-! ### IrProgram L2 term-surface dual-ok pins (IrProgram-only) -/

/-- Named term-surface depth bar reused for IrProgram L2 pilot honesty.
    Greppable: checkDepthIrProgramTermSurfaceBar, TERM-SURFACE, IrProgram-only. -/
def checkDepthIrProgramTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: IrProgram.lean pilot only (not package elaborate; not Mult/Linear/Types).
    Greppable: checkDepthIrProgramTermSurfaceScope, IrProgram-only, TERM-SURFACE. -/
def checkDepthIrProgramTermSurfaceScope : String := "IrProgram-only"

/-- Dual-ok when IrProgram L2 E-good/E-bad rejects work (IrProgram pilot only).
    Greppable: hostModuleCheckIrProgramTermSurfaceDualOk, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckIrProgramTermSurfaceDualOk : Bool := true

/-! ### IrProgram dialect helpers (reuse Mult collapse / def parse) -/

/-- Body after first `:=` on a line, re-joining later `:=` pieces (structure
    literals such as `{ nodes := [] }` must not truncate).
    Greppable: irProgramBodyAfterAssign, TERM-SURFACE, IrProgram-only. -/
def irProgramBodyAfterAssign (line : String) : String :=
  let t := stripLineComment line
  match t.splitOn ":=" with
  | [] => ""
  | [_] => ""
  | _ :: rest => trim (String.intercalate ":=" rest)

/-- Collapsed def body: same-line after `:=`, or all non-empty body lines after a
    multi-line `:=` header joined and whitespace-collapsed (real push / isWellTyped).
    Greppable: irProgramDefBodyCollapsed, TERM-SURFACE, IrProgram-only. -/
def irProgramDefBodyCollapsed (content : String) (defName : String) : Option String :=
  match findDefHeaderLine content defName with
  | none => none
  | some header =>
    let same := collapseWs (irProgramBodyAfterAssign header)
    if same != "" then some same
    else
      let rec afterHeader (inBlock : Bool) (seen : Bool) (acc : List String) :
          List String -> Option String
        | [] =>
          if acc.isEmpty then none
          else some (collapseWs (String.intercalate " " acc.reverse))
        | line :: rest =>
          if inBlock then
            if (line.splitOn "-/").length > 1 then
              afterHeader false seen acc rest
            else
              afterHeader true seen acc rest
          else
            let t := trim line
            if hasPrefix t "/-" then
              if (t.splitOn "-/").length > 1 then afterHeader false seen acc rest
              else afterHeader true seen acc rest
            else if !seen then
              if isDefNamed line defName then afterHeader false true acc rest
              else afterHeader false false acc rest
            else if t == "" then afterHeader false true acc rest
            else if hasPrefix t "def " || hasPrefix t "inductive "
                || hasPrefix t "theorem " || hasPrefix t "end "
                || hasPrefix t "namespace " || hasPrefix t "structure "
                || hasPrefix t "axiom " then
              if acc.isEmpty then none
              else some (collapseWs (String.intercalate " " acc.reverse))
            else
              -- Body lines may contain structure `:=`; do not re-split.
              afterHeader false true (stripLineComment t :: acc) rest
      afterHeader false false [] (content.splitOn "\n")

/-- programCap body is 8.
    Greppable: irProgramCapBodyOk, TERM-SURFACE, IrProgram-only. -/
def irProgramCapBodyOk (content : String) : Bool :=
  match irProgramDefBodyCollapsed content "programCap" with
  | none => false
  | some body => body == "8"

/-- empty body is { nodes := [] } (nested := kept via irProgramBodyAfterAssign).
    Greppable: irProgramEmptyBodyOk, TERM-SURFACE, IrProgram-only. -/
def irProgramEmptyBodyOk (content : String) : Bool :=
  match irProgramDefBodyCollapsed content "empty" with
  | none => false
  | some body => body == "{ nodes := [] }"

/-- checkFailClosed body is isWellTyped p.
    Greppable: irProgramCheckFailClosedBodyOk, TERM-SURFACE, IrProgram-only. -/
def irProgramCheckFailClosedBodyOk (content : String) : Bool :=
  match irProgramDefBodyCollapsed content "checkFailClosed" with
  | none => false
  | some body => body == "isWellTyped p"

/-- isWellTyped body is non-empty + cap + all node well-typed (multi-line ok).
    Greppable: irProgramIsWellTypedBodyOk, TERM-SURFACE, IrProgram-only. -/
def irProgramIsWellTypedBodyOk (content : String) : Bool :=
  match irProgramDefBodyCollapsed content "isWellTyped" with
  | none => false
  | some body =>
    body == "!p.nodes.isEmpty && decide (p.nodes.length <= programCap) && p.nodes.all IrNode.isWellTyped"

/-- push fail-closed arms: badNode / full / ok with well-typed guard.
    Greppable: irProgramPushBodyOk, TERM-SURFACE, IrProgram-only. -/
def irProgramPushBodyOk (content : String) : Bool :=
  match irProgramDefBodyCollapsed content "push" with
  | none => false
  | some body =>
    (body.splitOn "PushResult.badNode").length > 1
      && (body.splitOn "PushResult.full").length > 1
      && (body.splitOn "PushResult.ok").length > 1
      && (body.splitOn "!n.isWellTyped").length > 1
      && (body.splitOn "programCap").length > 1

/-- IrProgram L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkIrProgramTermDialect, TERM-SURFACE, IrProgram term-surface pilot. -/
def checkIrProgramTermDialect (content : String) : Option String :=
  if !irProgramCapBodyOk content then some reasonIllTypedTerm
  else if !irProgramEmptyBodyOk content then some reasonIllTypedTerm
  else if !irProgramCheckFailClosedBodyOk content then some reasonIllTypedTerm
  else if !irProgramIsWellTypedBodyOk content then some reasonIllTypedTerm
  else if !irProgramPushBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply IrProgram L2 after a structural IrProgram accept.
    Greppable: refineIrProgramWithTermSurface, TERM-SURFACE, IrProgram-only. -/
def refineIrProgramWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkIrProgramTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### IrProgram L2 well-typed good fixture (E-good) -/

/-- Shared IrProgram skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckIrProgramTermSkeletonPrefix, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckIrProgramTermSkeletonPrefix : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.IrProgram\n" ++
  "structure Program where\n" ++
  "  nodes : List Nat\n" ++
  "inductive PushResult where\n" ++
  "  | ok (p : Program)\n" ++
  "  | badNode\n" ++
  "  | full\n"

/-- Shared IrProgram skeleton mid (length/isEmpty) for good/bad twins.
    Greppable: hostModuleCheckIrProgramTermSkeletonMid, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckIrProgramTermSkeletonMid : String :=
  "def length (p : Program) : Nat := p.nodes.length\n" ++
  "def isEmpty (p : Program) : Bool := p.nodes.isEmpty\n"

/-- Shared IrProgram skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckIrProgramTermSkeletonSuffix, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckIrProgramTermSkeletonSuffix : String :=
  "def foldWellTyped (p : Program) : Nat := 0\n" ++
  "end SystemsLean.IrProgram\n"

/-- Well-typed programCap/empty/push/isWellTyped/checkFailClosed mid-block (E-good).
    Greppable: hostModuleCheckIrProgramTermGoodMid, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckIrProgramTermGoodMid : String :=
  "def programCap : Nat := 8\n" ++
  "def empty : Program := { nodes := [] }\n" ++
  hostModuleCheckIrProgramTermSkeletonMid ++
  "def push (p : Program) (n : Nat) : PushResult :=\n" ++
  "  if !n.isWellTyped then\n" ++
  "    PushResult.badNode\n" ++
  "  else if p.nodes.length >= programCap then\n" ++
  "    PushResult.full\n" ++
  "  else\n" ++
  "    PushResult.ok { nodes := p.nodes ++ [n] }\n" ++
  "def isWellTyped (p : Program) : Bool :=\n" ++
  "  !p.nodes.isEmpty\n" ++
  "    && decide (p.nodes.length <= programCap)\n" ++
  "    && p.nodes.all IrNode.isWellTyped\n" ++
  "def checkFailClosed (p : Program) : Bool := isWellTyped p\n"

/-- Well-typed IrProgram L2 good text.
    Greppable: hostModuleCheckGoodIrProgramTermText, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckGoodIrProgramTermText : String :=
  hostModuleCheckIrProgramTermSkeletonPrefix
    ++ hostModuleCheckIrProgramTermGoodMid
    ++ hostModuleCheckIrProgramTermSkeletonSuffix

/-! ### Ill-typed IrProgram twins (L0 tokens present; L2 must reject). -/

/-- PT1: wrong programCap (0 not 8). L0 still has def:programCap.
    Greppable: hostModuleCheckBadIrProgramCapText, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramCapText : String :=
  hostModuleCheckIrProgramTermSkeletonPrefix ++
  "def programCap : Nat := 0\n" ++
  "def empty : Program := { nodes := [] }\n" ++
  hostModuleCheckIrProgramTermSkeletonMid ++
  "def push (p : Program) (n : Nat) : PushResult :=\n" ++
  "  if !n.isWellTyped then\n" ++
  "    PushResult.badNode\n" ++
  "  else if p.nodes.length >= programCap then\n" ++
  "    PushResult.full\n" ++
  "  else\n" ++
  "    PushResult.ok { nodes := p.nodes ++ [n] }\n" ++
  "def isWellTyped (p : Program) : Bool :=\n" ++
  "  !p.nodes.isEmpty\n" ++
  "    && decide (p.nodes.length <= programCap)\n" ++
  "    && p.nodes.all IrNode.isWellTyped\n" ++
  "def checkFailClosed (p : Program) : Bool := isWellTyped p\n" ++
  hostModuleCheckIrProgramTermSkeletonSuffix

/-- PT2: checkFailClosed always true. L0 still has def:checkFailClosed.
    Greppable: hostModuleCheckBadIrProgramCheckFailClosedText, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramCheckFailClosedText : String :=
  hostModuleCheckIrProgramTermSkeletonPrefix ++
  "def programCap : Nat := 8\n" ++
  "def empty : Program := { nodes := [] }\n" ++
  hostModuleCheckIrProgramTermSkeletonMid ++
  "def push (p : Program) (n : Nat) : PushResult :=\n" ++
  "  if !n.isWellTyped then\n" ++
  "    PushResult.badNode\n" ++
  "  else if p.nodes.length >= programCap then\n" ++
  "    PushResult.full\n" ++
  "  else\n" ++
  "    PushResult.ok { nodes := p.nodes ++ [n] }\n" ++
  "def isWellTyped (p : Program) : Bool :=\n" ++
  "  !p.nodes.isEmpty\n" ++
  "    && decide (p.nodes.length <= programCap)\n" ++
  "    && p.nodes.all IrNode.isWellTyped\n" ++
  "def checkFailClosed (p : Program) : Bool := true\n" ++
  hostModuleCheckIrProgramTermSkeletonSuffix

/-- PT3: isWellTyped always true (drops EMPTY-PROGRAM-FAIL-CLOSED).
    Greppable: hostModuleCheckBadIrProgramIsWellTypedText, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramIsWellTypedText : String :=
  hostModuleCheckIrProgramTermSkeletonPrefix ++
  "def programCap : Nat := 8\n" ++
  "def empty : Program := { nodes := [] }\n" ++
  hostModuleCheckIrProgramTermSkeletonMid ++
  "def push (p : Program) (n : Nat) : PushResult :=\n" ++
  "  if !n.isWellTyped then\n" ++
  "    PushResult.badNode\n" ++
  "  else if p.nodes.length >= programCap then\n" ++
  "    PushResult.full\n" ++
  "  else\n" ++
  "    PushResult.ok { nodes := p.nodes ++ [n] }\n" ++
  "def isWellTyped (p : Program) : Bool := true\n" ++
  "def checkFailClosed (p : Program) : Bool := isWellTyped p\n" ++
  hostModuleCheckIrProgramTermSkeletonSuffix

/-- PT4: push always ok (no badNode/full fail-closed).
    Greppable: hostModuleCheckBadIrProgramPushText, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramPushText : String :=
  hostModuleCheckIrProgramTermSkeletonPrefix ++
  "def programCap : Nat := 8\n" ++
  "def empty : Program := { nodes := [] }\n" ++
  hostModuleCheckIrProgramTermSkeletonMid ++
  "def push (p : Program) (n : Nat) : PushResult := PushResult.ok p\n" ++
  "def isWellTyped (p : Program) : Bool :=\n" ++
  "  !p.nodes.isEmpty\n" ++
  "    && decide (p.nodes.length <= programCap)\n" ++
  "    && p.nodes.all IrNode.isWellTyped\n" ++
  "def checkFailClosed (p : Program) : Bool := isWellTyped p\n" ++
  hostModuleCheckIrProgramTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from IrProgram twin text for L0 dual-pin. -/
def irProgramTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.IrProgram"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept PT1 when tokens present.
    Greppable: hostModuleCheckBadIrProgramCapL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramCapL0Accept : Bool :=
  (checkNamedSurface (irProgramTermSurfaceFrom hostModuleCheckBadIrProgramCapText)
    irProgramExpectedNamespace irProgramRequiredDecls none).isAccept

/-- L0/L1 still accept PT2 when tokens present.
    Greppable: hostModuleCheckBadIrProgramCheckFailClosedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramCheckFailClosedL0Accept : Bool :=
  (checkNamedSurface (irProgramTermSurfaceFrom
      hostModuleCheckBadIrProgramCheckFailClosedText)
    irProgramExpectedNamespace irProgramRequiredDecls none).isAccept

/-- L0/L1 still accept PT3 when tokens present.
    Greppable: hostModuleCheckBadIrProgramIsWellTypedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramIsWellTypedL0Accept : Bool :=
  (checkNamedSurface (irProgramTermSurfaceFrom
      hostModuleCheckBadIrProgramIsWellTypedText)
    irProgramExpectedNamespace irProgramRequiredDecls none).isAccept

/-- L0/L1 still accept PT4 when tokens present.
    Greppable: hostModuleCheckBadIrProgramPushL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramPushL0Accept : Bool :=
  (checkNamedSurface (irProgramTermSurfaceFrom hostModuleCheckBadIrProgramPushText)
    irProgramExpectedNamespace irProgramRequiredDecls none).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckIrProgramTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckIrProgramTermDialectOk : Bool :=
  (checkIrProgramTermDialect hostModuleCheckGoodIrProgramTermText).isNone

/-- Dialect rejects PT1.
    Greppable: hostModuleCheckBadIrProgramCapDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramCapDialectReject : Bool :=
  match checkIrProgramTermDialect hostModuleCheckBadIrProgramCapText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PT2.
    Greppable: hostModuleCheckBadIrProgramCheckFailClosedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramCheckFailClosedDialectReject : Bool :=
  match checkIrProgramTermDialect hostModuleCheckBadIrProgramCheckFailClosedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PT3.
    Greppable: hostModuleCheckBadIrProgramIsWellTypedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramIsWellTypedDialectReject : Bool :=
  match checkIrProgramTermDialect hostModuleCheckBadIrProgramIsWellTypedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PT4 wrong push body.
    Greppable: hostModuleCheckBadIrProgramPushDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadIrProgramPushDialectReject : Bool :=
  match checkIrProgramTermDialect hostModuleCheckBadIrProgramPushText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined IrProgram L2 dual-pin (good + PT1..PT4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckIrProgramTermSurfaceOk, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckIrProgramTermSurfaceOk : Bool :=
  hostModuleCheckIrProgramTermSurfaceDualOk
    && (checkDepthIrProgramTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthIrProgramTermSurfaceScope == "IrProgram-only")
    && hostModuleCheckIrProgramTermDialectOk
    && hostModuleCheckBadIrProgramCapDialectReject
    && hostModuleCheckBadIrProgramCheckFailClosedDialectReject
    && hostModuleCheckBadIrProgramIsWellTypedDialectReject
    && hostModuleCheckBadIrProgramPushDialectReject
    && hostModuleCheckBadIrProgramCapL0Accept
    && hostModuleCheckBadIrProgramCheckFailClosedL0Accept
    && hostModuleCheckBadIrProgramIsWellTypedL0Accept
    && hostModuleCheckBadIrProgramPushL0Accept

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckIrProgramTermSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckIrProgramTermSourceReady : Bool :=
  liveRel == "HostModuleCheckIrProgramTerm.lean"
    && kernelCheckLiveHostModuleCheckIrProgramTermSource liveHostModuleCheckIrProgramTermSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckIrProgramTermSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckIrProgramTerm.lean")
  let k := kernelCheckLiveHostModuleCheckIrProgramTermSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckIrProgramTerm parse false")
  unless hostFrontLiveHostModuleCheckIrProgramTermSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckIrProgramTermSource
