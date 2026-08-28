/-
  SYSTEMS_LEAN_HOST partial -- IrGraph L2 term-surface pilot (beyond IrProgram).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: IrGraph dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  IrGraph L2 dialect subset (documented; not full Lean 4 elaborator):
  - edgeMax body exact 16 (same-line after :=).
  - empty body exact { prog := IrProgram.empty, edges := [] }.
  - pushNode multi-line fail-closed: badNode / full / ok + IrProgram.push.
  - addEdge multi-line fail-closed: full / badEndpoints / ok + edgeMax.
  - isWellTyped multi-line: EMPTY-GRAPH-OK + nested empty fail + edgesSound.
  - checkFailClosed body exact isWellTyped g.
  - structure Edge/Graph / edgeCount / nodeCount / isEmpty / edgesSound
    stay L0 token presence this pilot.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckIrGraphTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckIrGraphTermSurfaceOk (E-good dialect + GT1..GT4
    dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk, not bare
    dualOk alone.

  Intentional non-claims:
  - IrGraph pilot only -- not package elaborate, not IrGraphTheorems L3.
  - Mult TERM-SURFACE Mult-only dual-ok unchanged (HostModuleCheckMultTerm).
  - Linear TERM-SURFACE Linear-only dual-ok unchanged (HostModuleCheckLinearTerm).
  - Types TERM-SURFACE Types-only dual-ok unchanged (HostModuleCheckTypesTerm).
  - IrProgram TERM-SURFACE IrProgram-only dual-ok unchanged.
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for IrGraph is IrGraph-only honesty when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckIrGraphTerm,
  TERM-SURFACE, IrGraph-only, ILL-TYPED-TERM, checkIrGraphTermDialect,
  hostModuleCheckBadIrGraphEdgeMaxText,
  hostModuleCheckBadIrGraphCheckFailClosedText,
  hostModuleCheckBadIrGraphIsWellTypedText,
  hostModuleCheckBadIrGraphPushNodeText,
  hostModuleCheckIrGraphTermDialectOk, IrGraph term-surface pilot,
  hostModuleCheckIrGraphTermSurfaceDualOk, hostModuleCheckIrGraphTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckIrGraphTerm
  Red/green: lake build SystemsLean.HostModuleCheckIrGraphTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

/-! ### IrGraph L2 term-surface dual-ok pins (IrGraph-only) -/

/-- Named term-surface depth bar reused for IrGraph L2 pilot honesty.
    Greppable: checkDepthIrGraphTermSurfaceBar, TERM-SURFACE, IrGraph-only. -/
def checkDepthIrGraphTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: IrGraph.lean pilot only (not package elaborate; not prior units).
    Greppable: checkDepthIrGraphTermSurfaceScope, IrGraph-only, TERM-SURFACE. -/
def checkDepthIrGraphTermSurfaceScope : String := "IrGraph-only"

/-- Dual-ok when IrGraph L2 E-good/E-bad rejects work (IrGraph pilot only).
    Greppable: hostModuleCheckIrGraphTermSurfaceDualOk, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckIrGraphTermSurfaceDualOk : Bool := true

/-! ### IrGraph dialect helpers (reuse Mult collapse / def parse) -/

/-- Body after first `:=` on a line, re-joining later `:=` pieces (structure
    literals such as `{ prog := IrProgram.empty, edges := [] }` must not truncate).
    Greppable: irGraphBodyAfterAssign, TERM-SURFACE, IrGraph-only. -/
def irGraphBodyAfterAssign (line : String) : String :=
  let t := stripLineComment line
  match t.splitOn ":=" with
  | [] => ""
  | [_] => ""
  | _ :: rest => trim (String.intercalate ":=" rest)

/-- Collapsed def body: same-line after `:=`, or all non-empty body lines after a
    multi-line `:=` header joined and whitespace-collapsed (real pushNode /
    addEdge / isWellTyped).
    Greppable: irGraphDefBodyCollapsed, TERM-SURFACE, IrGraph-only. -/
def irGraphDefBodyCollapsed (content : String) (defName : String) : Option String :=
  match findDefHeaderLine content defName with
  | none => none
  | some header =>
    let same := collapseWs (irGraphBodyAfterAssign header)
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

/-- edgeMax body is 16.
    Greppable: irGraphEdgeMaxBodyOk, TERM-SURFACE, IrGraph-only. -/
def irGraphEdgeMaxBodyOk (content : String) : Bool :=
  match irGraphDefBodyCollapsed content "edgeMax" with
  | none => false
  | some body => body == "16"

/-- empty body is { prog := IrProgram.empty, edges := [] } (nested := kept).
    Greppable: irGraphEmptyBodyOk, TERM-SURFACE, IrGraph-only. -/
def irGraphEmptyBodyOk (content : String) : Bool :=
  match irGraphDefBodyCollapsed content "empty" with
  | none => false
  | some body => body == "{ prog := IrProgram.empty, edges := [] }"

/-- checkFailClosed body is isWellTyped g.
    Greppable: irGraphCheckFailClosedBodyOk, TERM-SURFACE, IrGraph-only. -/
def irGraphCheckFailClosedBodyOk (content : String) : Bool :=
  match irGraphDefBodyCollapsed content "checkFailClosed" with
  | none => false
  | some body => body == "isWellTyped g"

/-- isWellTyped body is EMPTY-GRAPH-OK + nested empty fail + edgesSound (multi-line).
    Greppable: irGraphIsWellTypedBodyOk, TERM-SURFACE, IrGraph-only. -/
def irGraphIsWellTypedBodyOk (content : String) : Bool :=
  match irGraphDefBodyCollapsed content "isWellTyped" with
  | none => false
  | some body =>
    body == "if isEmpty g then true else if IrProgram.isEmpty g.prog then false else IrProgram.isWellTyped g.prog && edgesSound g.edges (IrProgram.length g.prog)"

/-- pushNode fail-closed arms: badNode / full / ok + IrProgram.push call-through.
    Greppable: irGraphPushNodeBodyOk, TERM-SURFACE, IrGraph-only. -/
def irGraphPushNodeBodyOk (content : String) : Bool :=
  match irGraphDefBodyCollapsed content "pushNode" with
  | none => false
  | some body =>
    (body.splitOn "PushNodeResult.badNode").length > 1
      && (body.splitOn "PushNodeResult.full").length > 1
      && (body.splitOn "PushNodeResult.ok").length > 1
      && (body.splitOn "IrProgram.push").length > 1

/-- addEdge fail-closed arms: full / badEndpoints / ok + edgeMax capacity.
    Greppable: irGraphAddEdgeBodyOk, TERM-SURFACE, IrGraph-only. -/
def irGraphAddEdgeBodyOk (content : String) : Bool :=
  match irGraphDefBodyCollapsed content "addEdge" with
  | none => false
  | some body =>
    (body.splitOn "AddEdgeResult.full").length > 1
      && (body.splitOn "AddEdgeResult.badEndpoints").length > 1
      && (body.splitOn "AddEdgeResult.ok").length > 1
      && (body.splitOn "edgeMax").length > 1

/-- IrGraph L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkIrGraphTermDialect, TERM-SURFACE, IrGraph term-surface pilot. -/
def checkIrGraphTermDialect (content : String) : Option String :=
  if !irGraphEdgeMaxBodyOk content then some reasonIllTypedTerm
  else if !irGraphEmptyBodyOk content then some reasonIllTypedTerm
  else if !irGraphCheckFailClosedBodyOk content then some reasonIllTypedTerm
  else if !irGraphIsWellTypedBodyOk content then some reasonIllTypedTerm
  else if !irGraphPushNodeBodyOk content then some reasonIllTypedTerm
  else if !irGraphAddEdgeBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply IrGraph L2 after a structural IrGraph accept.
    Greppable: refineIrGraphWithTermSurface, TERM-SURFACE, IrGraph-only. -/
def refineIrGraphWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkIrGraphTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### IrGraph L2 well-typed good fixture (E-good) -/

/-- Shared IrGraph skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckIrGraphTermSkeletonPrefix, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckIrGraphTermSkeletonPrefix : String :=
  "import SystemsLean.IrProgram\n" ++
  "namespace SystemsLean.IrGraph\n" ++
  "structure Edge where\n" ++
  "  fromIdx : Nat\n" ++
  "  toIdx : Nat\n" ++
  "structure Graph where\n" ++
  "  prog : Nat\n" ++
  "  edges : List Edge\n" ++
  "inductive PushNodeResult where\n" ++
  "  | ok (g : Graph)\n" ++
  "  | badNode\n" ++
  "  | full\n" ++
  "inductive AddEdgeResult where\n" ++
  "  | ok (g : Graph)\n" ++
  "  | full\n" ++
  "  | badEndpoints\n"

/-- Shared IrGraph skeleton mid (counts / isEmpty) for good/bad twins.
    Greppable: hostModuleCheckIrGraphTermSkeletonMid, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckIrGraphTermSkeletonMid : String :=
  "def edgeCount (g : Graph) : Nat := g.edges.length\n" ++
  "def nodeCount (g : Graph) : Nat := 0\n" ++
  "def isEmpty (g : Graph) : Bool := true\n" ++
  "def edgesSound (edges : List Edge) (nCount : Nat) : Bool := true\n"

/-- Shared IrGraph skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckIrGraphTermSkeletonSuffix, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckIrGraphTermSkeletonSuffix : String :=
  "end SystemsLean.IrGraph\n"

/-- Well-typed edgeMax/empty/pushNode/addEdge/isWellTyped/checkFailClosed mid.
    Greppable: hostModuleCheckIrGraphTermGoodMid, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckIrGraphTermGoodMid : String :=
  "def edgeMax : Nat := 16\n" ++
  "def empty : Graph := { prog := IrProgram.empty, edges := [] }\n" ++
  hostModuleCheckIrGraphTermSkeletonMid ++
  "def pushNode (g : Graph) (n : Nat) : PushNodeResult :=\n" ++
  "  match IrProgram.push g.prog n with\n" ++
  "  | IrProgram.PushResult.ok p => PushNodeResult.ok { g with prog := p }\n" ++
  "  | IrProgram.PushResult.badNode => PushNodeResult.badNode\n" ++
  "  | IrProgram.PushResult.full => PushNodeResult.full\n" ++
  "def addEdge (g : Graph) (fromIdx toIdx : Nat) : AddEdgeResult :=\n" ++
  "  if g.edges.length >= edgeMax then\n" ++
  "    AddEdgeResult.full\n" ++
  "  else if false then\n" ++
  "    AddEdgeResult.badEndpoints\n" ++
  "  else\n" ++
  "    AddEdgeResult.ok { prog := g.prog, edges := g.edges }\n" ++
  "def isWellTyped (g : Graph) : Bool :=\n" ++
  "  if isEmpty g then\n" ++
  "    true\n" ++
  "  else if IrProgram.isEmpty g.prog then\n" ++
  "    false\n" ++
  "  else\n" ++
  "    IrProgram.isWellTyped g.prog\n" ++
  "      && edgesSound g.edges (IrProgram.length g.prog)\n" ++
  "def checkFailClosed (g : Graph) : Bool := isWellTyped g\n"

/-- Well-typed IrGraph L2 good text.
    Greppable: hostModuleCheckGoodIrGraphTermText, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckGoodIrGraphTermText : String :=
  hostModuleCheckIrGraphTermSkeletonPrefix
    ++ hostModuleCheckIrGraphTermGoodMid
    ++ hostModuleCheckIrGraphTermSkeletonSuffix

/-! ### Ill-typed IrGraph twins (L0 tokens present; L2 must reject). -/

/-- GT1: wrong edgeMax (0 not 16). L0 still has def:edgeMax.
    Greppable: hostModuleCheckBadIrGraphEdgeMaxText, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphEdgeMaxText : String :=
  hostModuleCheckIrGraphTermSkeletonPrefix ++
  "def edgeMax : Nat := 0\n" ++
  "def empty : Graph := { prog := IrProgram.empty, edges := [] }\n" ++
  hostModuleCheckIrGraphTermSkeletonMid ++
  "def pushNode (g : Graph) (n : Nat) : PushNodeResult :=\n" ++
  "  match IrProgram.push g.prog n with\n" ++
  "  | IrProgram.PushResult.ok p => PushNodeResult.ok { g with prog := p }\n" ++
  "  | IrProgram.PushResult.badNode => PushNodeResult.badNode\n" ++
  "  | IrProgram.PushResult.full => PushNodeResult.full\n" ++
  "def addEdge (g : Graph) (fromIdx toIdx : Nat) : AddEdgeResult :=\n" ++
  "  if g.edges.length >= edgeMax then\n" ++
  "    AddEdgeResult.full\n" ++
  "  else if false then\n" ++
  "    AddEdgeResult.badEndpoints\n" ++
  "  else\n" ++
  "    AddEdgeResult.ok { prog := g.prog, edges := g.edges }\n" ++
  "def isWellTyped (g : Graph) : Bool :=\n" ++
  "  if isEmpty g then\n" ++
  "    true\n" ++
  "  else if IrProgram.isEmpty g.prog then\n" ++
  "    false\n" ++
  "  else\n" ++
  "    IrProgram.isWellTyped g.prog\n" ++
  "      && edgesSound g.edges (IrProgram.length g.prog)\n" ++
  "def checkFailClosed (g : Graph) : Bool := isWellTyped g\n" ++
  hostModuleCheckIrGraphTermSkeletonSuffix

/-- GT2: checkFailClosed always true. L0 still has def:checkFailClosed.
    Greppable: hostModuleCheckBadIrGraphCheckFailClosedText, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphCheckFailClosedText : String :=
  hostModuleCheckIrGraphTermSkeletonPrefix ++
  "def edgeMax : Nat := 16\n" ++
  "def empty : Graph := { prog := IrProgram.empty, edges := [] }\n" ++
  hostModuleCheckIrGraphTermSkeletonMid ++
  "def pushNode (g : Graph) (n : Nat) : PushNodeResult :=\n" ++
  "  match IrProgram.push g.prog n with\n" ++
  "  | IrProgram.PushResult.ok p => PushNodeResult.ok { g with prog := p }\n" ++
  "  | IrProgram.PushResult.badNode => PushNodeResult.badNode\n" ++
  "  | IrProgram.PushResult.full => PushNodeResult.full\n" ++
  "def addEdge (g : Graph) (fromIdx toIdx : Nat) : AddEdgeResult :=\n" ++
  "  if g.edges.length >= edgeMax then\n" ++
  "    AddEdgeResult.full\n" ++
  "  else if false then\n" ++
  "    AddEdgeResult.badEndpoints\n" ++
  "  else\n" ++
  "    AddEdgeResult.ok { prog := g.prog, edges := g.edges }\n" ++
  "def isWellTyped (g : Graph) : Bool :=\n" ++
  "  if isEmpty g then\n" ++
  "    true\n" ++
  "  else if IrProgram.isEmpty g.prog then\n" ++
  "    false\n" ++
  "  else\n" ++
  "    IrProgram.isWellTyped g.prog\n" ++
  "      && edgesSound g.edges (IrProgram.length g.prog)\n" ++
  "def checkFailClosed (g : Graph) : Bool := true\n" ++
  hostModuleCheckIrGraphTermSkeletonSuffix

/-- GT3: isWellTyped always true (drops EMPTY-GRAPH-OK honesty).
    Greppable: hostModuleCheckBadIrGraphIsWellTypedText, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphIsWellTypedText : String :=
  hostModuleCheckIrGraphTermSkeletonPrefix ++
  "def edgeMax : Nat := 16\n" ++
  "def empty : Graph := { prog := IrProgram.empty, edges := [] }\n" ++
  hostModuleCheckIrGraphTermSkeletonMid ++
  "def pushNode (g : Graph) (n : Nat) : PushNodeResult :=\n" ++
  "  match IrProgram.push g.prog n with\n" ++
  "  | IrProgram.PushResult.ok p => PushNodeResult.ok { g with prog := p }\n" ++
  "  | IrProgram.PushResult.badNode => PushNodeResult.badNode\n" ++
  "  | IrProgram.PushResult.full => PushNodeResult.full\n" ++
  "def addEdge (g : Graph) (fromIdx toIdx : Nat) : AddEdgeResult :=\n" ++
  "  if g.edges.length >= edgeMax then\n" ++
  "    AddEdgeResult.full\n" ++
  "  else if false then\n" ++
  "    AddEdgeResult.badEndpoints\n" ++
  "  else\n" ++
  "    AddEdgeResult.ok { prog := g.prog, edges := g.edges }\n" ++
  "def isWellTyped (g : Graph) : Bool := true\n" ++
  "def checkFailClosed (g : Graph) : Bool := isWellTyped g\n" ++
  hostModuleCheckIrGraphTermSkeletonSuffix

/-- GT4: pushNode always ok (no badNode/full fail-closed).
    Greppable: hostModuleCheckBadIrGraphPushNodeText, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphPushNodeText : String :=
  hostModuleCheckIrGraphTermSkeletonPrefix ++
  "def edgeMax : Nat := 16\n" ++
  "def empty : Graph := { prog := IrProgram.empty, edges := [] }\n" ++
  hostModuleCheckIrGraphTermSkeletonMid ++
  "def pushNode (g : Graph) (n : Nat) : PushNodeResult := PushNodeResult.ok g\n" ++
  "def addEdge (g : Graph) (fromIdx toIdx : Nat) : AddEdgeResult :=\n" ++
  "  if g.edges.length >= edgeMax then\n" ++
  "    AddEdgeResult.full\n" ++
  "  else if false then\n" ++
  "    AddEdgeResult.badEndpoints\n" ++
  "  else\n" ++
  "    AddEdgeResult.ok { prog := g.prog, edges := g.edges }\n" ++
  "def isWellTyped (g : Graph) : Bool :=\n" ++
  "  if isEmpty g then\n" ++
  "    true\n" ++
  "  else if IrProgram.isEmpty g.prog then\n" ++
  "    false\n" ++
  "  else\n" ++
  "    IrProgram.isWellTyped g.prog\n" ++
  "      && edgesSound g.edges (IrProgram.length g.prog)\n" ++
  "def checkFailClosed (g : Graph) : Bool := isWellTyped g\n" ++
  hostModuleCheckIrGraphTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from IrGraph twin text for L0 dual-pin. -/
def irGraphTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.IrGraph"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept GT1 when tokens present.
    Greppable: hostModuleCheckBadIrGraphEdgeMaxL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphEdgeMaxL0Accept : Bool :=
  (checkNamedSurface (irGraphTermSurfaceFrom hostModuleCheckBadIrGraphEdgeMaxText)
    irGraphExpectedNamespace irGraphRequiredDecls none).isAccept

/-- L0/L1 still accept GT2 when tokens present.
    Greppable: hostModuleCheckBadIrGraphCheckFailClosedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphCheckFailClosedL0Accept : Bool :=
  (checkNamedSurface (irGraphTermSurfaceFrom
      hostModuleCheckBadIrGraphCheckFailClosedText)
    irGraphExpectedNamespace irGraphRequiredDecls none).isAccept

/-- L0/L1 still accept GT3 when tokens present.
    Greppable: hostModuleCheckBadIrGraphIsWellTypedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphIsWellTypedL0Accept : Bool :=
  (checkNamedSurface (irGraphTermSurfaceFrom
      hostModuleCheckBadIrGraphIsWellTypedText)
    irGraphExpectedNamespace irGraphRequiredDecls none).isAccept

/-- L0/L1 still accept GT4 when tokens present.
    Greppable: hostModuleCheckBadIrGraphPushNodeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphPushNodeL0Accept : Bool :=
  (checkNamedSurface (irGraphTermSurfaceFrom hostModuleCheckBadIrGraphPushNodeText)
    irGraphExpectedNamespace irGraphRequiredDecls none).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckIrGraphTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckIrGraphTermDialectOk : Bool :=
  (checkIrGraphTermDialect hostModuleCheckGoodIrGraphTermText).isNone

/-- Dialect rejects GT1.
    Greppable: hostModuleCheckBadIrGraphEdgeMaxDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphEdgeMaxDialectReject : Bool :=
  match checkIrGraphTermDialect hostModuleCheckBadIrGraphEdgeMaxText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects GT2.
    Greppable: hostModuleCheckBadIrGraphCheckFailClosedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphCheckFailClosedDialectReject : Bool :=
  match checkIrGraphTermDialect hostModuleCheckBadIrGraphCheckFailClosedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects GT3.
    Greppable: hostModuleCheckBadIrGraphIsWellTypedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphIsWellTypedDialectReject : Bool :=
  match checkIrGraphTermDialect hostModuleCheckBadIrGraphIsWellTypedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects GT4 wrong pushNode body.
    Greppable: hostModuleCheckBadIrGraphPushNodeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadIrGraphPushNodeDialectReject : Bool :=
  match checkIrGraphTermDialect hostModuleCheckBadIrGraphPushNodeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined IrGraph L2 dual-pin (good + GT1..GT4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckIrGraphTermSurfaceOk, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckIrGraphTermSurfaceOk : Bool :=
  hostModuleCheckIrGraphTermSurfaceDualOk
    && (checkDepthIrGraphTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthIrGraphTermSurfaceScope == "IrGraph-only")
    && hostModuleCheckIrGraphTermDialectOk
    && hostModuleCheckBadIrGraphEdgeMaxDialectReject
    && hostModuleCheckBadIrGraphCheckFailClosedDialectReject
    && hostModuleCheckBadIrGraphIsWellTypedDialectReject
    && hostModuleCheckBadIrGraphPushNodeDialectReject
    && hostModuleCheckBadIrGraphEdgeMaxL0Accept
    && hostModuleCheckBadIrGraphCheckFailClosedL0Accept
    && hostModuleCheckBadIrGraphIsWellTypedL0Accept
    && hostModuleCheckBadIrGraphPushNodeL0Accept

end SystemsLean.HostModuleCheck
