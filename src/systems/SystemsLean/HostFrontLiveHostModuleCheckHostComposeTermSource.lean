/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckHostComposeTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckHostComposeTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckHostComposeTerm.lean.
  It is not HostModuleCheck and not HostCompose.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckHostComposeTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKHOSTCOMPOSETERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckHostComposeTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckHostComposeTerm

/-- Dual-pinned live HostModuleCheckHostComposeTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckHostComposeTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKHOSTCOMPOSETERM. -/
def liveHostModuleCheckHostComposeTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostCompose L2 term-surface pilot (beyond IrGraph).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostCompose dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  HostCompose L2 dialect subset (documented; not full Lean 4 elaborator):
  - empty multi-line structure with nested := kept (graph/linear/erased).
  - mint multi-line fail-closed: badId / alreadyLive / ok.
  - consume multi-line fail-closed: notLive / ok.
  - pushHostNode match fail-closed: badNode / full / ok + IrGraph.pushNode.
  - checkFailClosed body exact hostIsWellTyped hc && multPreScan hc.
  - extractOkFs body exact extractOk hc RuntimeClaim.runtimeFs.
  - markErased / addHostEdge / multPreScan / hostIsWellTyped / extractOk stay
    L0 token presence this pilot.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckHostComposeTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckHostComposeTermSurfaceOk (E-good dialect +
    GT1..GT4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - HostCompose pilot only -- not package elaborate, not HostComposeTheorems L3.
  - Mult/Linear/Types/IrProgram/IrGraph TERM-SURFACE dual-ok unchanged.
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - TERM-SURFACE dual-ok for HostCompose is HostCompose-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckHostComposeTerm,
  TERM-SURFACE, HostCompose-only, ILL-TYPED-TERM, checkHostComposeTermDialect,
  hostModuleCheckBadHostComposeEmptyText,
  hostModuleCheckBadHostComposeCheckFailClosedText,
  hostModuleCheckBadHostComposeMintText,
  hostModuleCheckBadHostComposePushHostNodeText,
  hostModuleCheckHostComposeTermDialectOk, HostCompose term-surface pilot,
  hostModuleCheckHostComposeTermSurfaceDualOk,
  hostModuleCheckHostComposeTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckHostComposeTerm
  Red/green: lake build SystemsLean.HostModuleCheckHostComposeTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm

namespace SystemsLean.HostModuleCheck

/-! ### HostCompose L2 term-surface dual-ok pins (HostCompose-only) -/

/-- Named term-surface depth bar reused for HostCompose L2 pilot honesty.
    Greppable: checkDepthHostComposeTermSurfaceBar, TERM-SURFACE, HostCompose-only. -/
def checkDepthHostComposeTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: HostCompose.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthHostComposeTermSurfaceScope, HostCompose-only, TERM-SURFACE. -/
def checkDepthHostComposeTermSurfaceScope : String := "HostCompose-only"

/-- Dual-ok when HostCompose L2 E-good/E-bad rejects work (HostCompose pilot only).
    Greppable: hostModuleCheckHostComposeTermSurfaceDualOk, TERM-SURFACE,
    HostCompose-only. -/
def hostModuleCheckHostComposeTermSurfaceDualOk : Bool := true

/-! ### HostCompose dialect helpers (reuse Mult collapse / def parse) -/

/-- Body after first `:=` on a line, re-joining later `:=` pieces (structure
    literals such as `{ graph := IrGraph.empty ... }` must not truncate).
    Greppable: hostComposeBodyAfterAssign, TERM-SURFACE, HostCompose-only. -/
def hostComposeBodyAfterAssign (line : String) : String :=
  let t := stripLineComment line
  match t.splitOn ":=" with
  | [] => ""
  | [_] => ""
  | _ :: rest => trim (String.intercalate ":=" rest)

/-- Collapsed def body: same-line after `:=` when closed; else multi-line after
    header. Bare open brace `{` on the header line seeds multi-line collection
    (real empty structure spans lines).
    Greppable: hostComposeDefBodyCollapsed, TERM-SURFACE, HostCompose-only. -/
def hostComposeDefBodyCollapsed (content : String) (defName : String) : Option String :=
  match findDefHeaderLine content defName with
  | none => none
  | some header =>
    let headBody := hostComposeBodyAfterAssign header
    let same := collapseWs headBody
    -- Closed same-line body (not bare open brace of multi-line structure).
    if same != "" && same != "{" then some same
    else
      let seed : List String :=
        if trim headBody == "" then [] else [trim headBody]
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
      afterHeader false false seed (content.splitOn "\n")

/-- empty body is graph/linear/erased structure (nested := kept).
    Greppable: hostComposeEmptyBodyOk, TERM-SURFACE, HostCompose-only. -/
def hostComposeEmptyBodyOk (content : String) : Bool :=
  match hostComposeDefBodyCollapsed content "empty" with
  | none => false
  | some body =>
    body == "{ graph := IrGraph.empty linear := LinearHost.empty erased := Erasure.unmarked }"

/-- mint fail-closed arms: badId / alreadyLive / ok.
    Greppable: hostComposeMintBodyOk, TERM-SURFACE, HostCompose-only. -/
def hostComposeMintBodyOk (content : String) : Bool :=
  match hostComposeDefBodyCollapsed content "mint" with
  | none => false
  | some body =>
    (body.splitOn "MintResult.badId").length > 1
      && (body.splitOn "MintResult.alreadyLive").length > 1
      && (body.splitOn "MintResult.ok").length > 1

/-- consume fail-closed arms: notLive / ok.
    Greppable: hostComposeConsumeBodyOk, TERM-SURFACE, HostCompose-only. -/
def hostComposeConsumeBodyOk (content : String) : Bool :=
  match hostComposeDefBodyCollapsed content "consume" with
  | none => false
  | some body =>
    (body.splitOn "ConsumeResult.notLive").length > 1
      && (body.splitOn "ConsumeResult.ok").length > 1

/-- pushHostNode fail-closed arms: badNode / full / ok + IrGraph.pushNode.
    Greppable: hostComposePushHostNodeBodyOk, TERM-SURFACE, HostCompose-only. -/
def hostComposePushHostNodeBodyOk (content : String) : Bool :=
  match hostComposeDefBodyCollapsed content "pushHostNode" with
  | none => false
  | some body =>
    (body.splitOn "HostPushNodeResult.badNode").length > 1
      && (body.splitOn "HostPushNodeResult.full").length > 1
      && (body.splitOn "HostPushNodeResult.ok").length > 1
      && (body.splitOn "IrGraph.pushNode").length > 1

/-- checkFailClosed body is hostIsWellTyped hc && multPreScan hc.
    Greppable: hostComposeCheckFailClosedBodyOk, TERM-SURFACE, HostCompose-only. -/
def hostComposeCheckFailClosedBodyOk (content : String) : Bool :=
  match hostComposeDefBodyCollapsed content "checkFailClosed" with
  | none => false
  | some body => body == "hostIsWellTyped hc && multPreScan hc"

/-- extractOkFs body is extractOk hc RuntimeClaim.runtimeFs.
    Greppable: hostComposeExtractOkFsBodyOk, TERM-SURFACE, HostCompose-only. -/
def hostComposeExtractOkFsBodyOk (content : String) : Bool :=
  match hostComposeDefBodyCollapsed content "extractOkFs" with
  | none => false
  | some body => body == "extractOk hc RuntimeClaim.runtimeFs"

/-- HostCompose L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkHostComposeTermDialect, TERM-SURFACE,
    HostCompose term-surface pilot. -/
def checkHostComposeTermDialect (content : String) : Option String :=
  if !hostComposeEmptyBodyOk content then some reasonIllTypedTerm
  else if !hostComposeMintBodyOk content then some reasonIllTypedTerm
  else if !hostComposeConsumeBodyOk content then some reasonIllTypedTerm
  else if !hostComposePushHostNodeBodyOk content then some reasonIllTypedTerm
  else if !hostComposeCheckFailClosedBodyOk content then some reasonIllTypedTerm
  else if !hostComposeExtractOkFsBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply HostCompose L2 after a structural HostCompose accept.
    Greppable: refineHostComposeWithTermSurface, TERM-SURFACE, HostCompose-only. -/
def refineHostComposeWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkHostComposeTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### HostCompose L2 well-typed good fixture (E-good) -/

/-- Shared HostCompose skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckHostComposeTermSkeletonPrefix, TERM-SURFACE,
    HostCompose-only. -/
def hostModuleCheckHostComposeTermSkeletonPrefix : String :=
  "import SystemsLean.IrGraph\n" ++
  "namespace SystemsLean.HostCompose\n" ++
  "structure LinearHost where\n" ++
  "  live : Bool\n" ++
  "  id : Nat\n" ++
  "structure Host where\n" ++
  "  graph : Nat\n" ++
  "  linear : LinearHost\n" ++
  "  erased : Nat\n" ++
  "inductive MintResult where\n" ++
  "  | ok (hc : Host)\n" ++
  "  | badId\n" ++
  "  | alreadyLive\n" ++
  "inductive ConsumeResult where\n" ++
  "  | ok (hc : Host) (payload : Nat)\n" ++
  "  | notLive\n" ++
  "inductive HostPushNodeResult where\n" ++
  "  | ok (hc : Host)\n" ++
  "  | badNode\n" ++
  "  | full\n" ++
  "inductive HostAddEdgeResult where\n" ++
  "  | ok (hc : Host)\n" ++
  "  | full\n" ++
  "  | badEndpoints\n"

/-- Shared HostCompose skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckHostComposeTermSkeletonSuffix, TERM-SURFACE,
    HostCompose-only. -/
def hostModuleCheckHostComposeTermSkeletonSuffix : String :=
  "end SystemsLean.HostCompose\n"

/-- Well-typed empty/mint/consume/push/checkFailClosed/extract mid.
    Greppable: hostModuleCheckHostComposeTermGoodMid, TERM-SURFACE,
    HostCompose-only. -/
def hostModuleCheckHostComposeTermGoodMid : String :=
  "def empty : Host := {\n" ++
  "  graph := IrGraph.empty\n" ++
  "  linear := LinearHost.empty\n" ++
  "  erased := Erasure.unmarked\n" ++
  "}\n" ++
  "def mint (hc : Host) (id : Nat) : MintResult :=\n" ++
  "  if id = 0 then\n" ++
  "    MintResult.badId\n" ++
  "  else if hc.linear.live then\n" ++
  "    MintResult.alreadyLive\n" ++
  "  else\n" ++
  "    MintResult.ok { hc with linear := { live := true, id := id } }\n" ++
  "def consume (hc : Host) : ConsumeResult :=\n" ++
  "  if !hc.linear.live then\n" ++
  "    ConsumeResult.notLive\n" ++
  "  else\n" ++
  "    let payload := hc.linear.id\n" ++
  "    ConsumeResult.ok { hc with linear := { live := false, id := 0 } } payload\n" ++
  "def markErased (hc : Host) : Host :=\n" ++
  "  { hc with erased := Erasure.mark hc.erased }\n" ++
  "def pushHostNode (hc : Host) (n : Nat) : HostPushNodeResult :=\n" ++
  "  match IrGraph.pushNode hc.graph n with\n" ++
  "  | IrGraph.PushNodeResult.ok g => HostPushNodeResult.ok { hc with graph := g }\n" ++
  "  | IrGraph.PushNodeResult.badNode => HostPushNodeResult.badNode\n" ++
  "  | IrGraph.PushNodeResult.full => HostPushNodeResult.full\n" ++
  "def addHostEdge (hc : Host) (fromIdx toIdx : Nat) : HostAddEdgeResult :=\n" ++
  "  match IrGraph.addEdge hc.graph fromIdx toIdx with\n" ++
  "  | IrGraph.AddEdgeResult.ok g => HostAddEdgeResult.ok { hc with graph := g }\n" ++
  "  | IrGraph.AddEdgeResult.full => HostAddEdgeResult.full\n" ++
  "  | IrGraph.AddEdgeResult.badEndpoints => HostAddEdgeResult.badEndpoints\n" ++
  "def multPreScan (hc : Host) : Bool := true\n" ++
  "def hostIsWellTyped (hc : Host) : Bool := true\n" ++
  "def checkFailClosed (hc : Host) : Bool :=\n" ++
  "  hostIsWellTyped hc && multPreScan hc\n" ++
  "def extractOk (hc : Host) (claim : Nat) : Bool :=\n" ++
  "  Extract.isFreestandingGoal claim && checkFailClosed hc\n" ++
  "def extractOkFs (hc : Host) : Bool :=\n" ++
  "  extractOk hc RuntimeClaim.runtimeFs\n"

/-- Well-typed HostCompose L2 good text.
    Greppable: hostModuleCheckGoodHostComposeTermText, TERM-SURFACE,
    HostCompose-only. -/
def hostModuleCheckGoodHostComposeTermText : String :=
  hostModuleCheckHostComposeTermSkeletonPrefix
    ++ hostModuleCheckHostComposeTermGoodMid
    ++ hostModuleCheckHostComposeTermSkeletonSuffix

/-! ### Ill-typed HostCompose twins (L0 tokens present; L2 must reject). -/

/-- GT1: empty drops graph/erased fields. L0 still has def:empty.
    Greppable: hostModuleCheckBadHostComposeEmptyText, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeEmptyText : String :=
  hostModuleCheckHostComposeTermSkeletonPrefix ++
  "def empty : Host := { linear := LinearHost.empty }\n" ++
  "def mint (hc : Host) (id : Nat) : MintResult :=\n" ++
  "  if id = 0 then MintResult.badId\n" ++
  "  else if hc.linear.live then MintResult.alreadyLive\n" ++
  "  else MintResult.ok { hc with linear := { live := true, id := id } }\n" ++
  "def consume (hc : Host) : ConsumeResult :=\n" ++
  "  if !hc.linear.live then ConsumeResult.notLive\n" ++
  "  else ConsumeResult.ok { hc with linear := { live := false, id := 0 } } 0\n" ++
  "def markErased (hc : Host) : Host := hc\n" ++
  "def pushHostNode (hc : Host) (n : Nat) : HostPushNodeResult :=\n" ++
  "  match IrGraph.pushNode hc.graph n with\n" ++
  "  | IrGraph.PushNodeResult.ok g => HostPushNodeResult.ok { hc with graph := g }\n" ++
  "  | IrGraph.PushNodeResult.badNode => HostPushNodeResult.badNode\n" ++
  "  | IrGraph.PushNodeResult.full => HostPushNodeResult.full\n" ++
  "def addHostEdge (hc : Host) (fromIdx toIdx : Nat) : HostAddEdgeResult :=\n" ++
  "  HostAddEdgeResult.ok hc\n" ++
  "def multPreScan (hc : Host) : Bool := true\n" ++
  "def hostIsWellTyped (hc : Host) : Bool := true\n" ++
  "def checkFailClosed (hc : Host) : Bool :=\n" ++
  "  hostIsWellTyped hc && multPreScan hc\n" ++
  "def extractOk (hc : Host) (claim : Nat) : Bool := true\n" ++
  "def extractOkFs (hc : Host) : Bool := extractOk hc RuntimeClaim.runtimeFs\n" ++
  hostModuleCheckHostComposeTermSkeletonSuffix

/-- GT2: checkFailClosed always true. L0 still has def:checkFailClosed.
    Greppable: hostModuleCheckBadHostComposeCheckFailClosedText, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeCheckFailClosedText : String :=
  hostModuleCheckHostComposeTermSkeletonPrefix ++
  "def empty : Host := {\n" ++
  "  graph := IrGraph.empty\n" ++
  "  linear := LinearHost.empty\n" ++
  "  erased := Erasure.unmarked\n" ++
  "}\n" ++
  "def mint (hc : Host) (id : Nat) : MintResult :=\n" ++
  "  if id = 0 then\n" ++
  "    MintResult.badId\n" ++
  "  else if hc.linear.live then\n" ++
  "    MintResult.alreadyLive\n" ++
  "  else\n" ++
  "    MintResult.ok { hc with linear := { live := true, id := id } }\n" ++
  "def consume (hc : Host) : ConsumeResult :=\n" ++
  "  if !hc.linear.live then\n" ++
  "    ConsumeResult.notLive\n" ++
  "  else\n" ++
  "    let payload := hc.linear.id\n" ++
  "    ConsumeResult.ok { hc with linear := { live := false, id := 0 } } payload\n" ++
  "def markErased (hc : Host) : Host :=\n" ++
  "  { hc with erased := Erasure.mark hc.erased }\n" ++
  "def pushHostNode (hc : Host) (n : Nat) : HostPushNodeResult :=\n" ++
  "  match IrGraph.pushNode hc.graph n with\n" ++
  "  | IrGraph.PushNodeResult.ok g => HostPushNodeResult.ok { hc with graph := g }\n" ++
  "  | IrGraph.PushNodeResult.badNode => HostPushNodeResult.badNode\n" ++
  "  | IrGraph.PushNodeResult.full => HostPushNodeResult.full\n" ++
  "def addHostEdge (hc : Host) (fromIdx toIdx : Nat) : HostAddEdgeResult :=\n" ++
  "  match IrGraph.addEdge hc.graph fromIdx toIdx with\n" ++
  "  | IrGraph.AddEdgeResult.ok g => HostAddEdgeResult.ok { hc with graph := g }\n" ++
  "  | IrGraph.AddEdgeResult.full => HostAddEdgeResult.full\n" ++
  "  | IrGraph.AddEdgeResult.badEndpoints => HostAddEdgeResult.badEndpoints\n" ++
  "def multPreScan (hc : Host) : Bool := true\n" ++
  "def hostIsWellTyped (hc : Host) : Bool := true\n" ++
  "def checkFailClosed (hc : Host) : Bool := true\n" ++
  "def extractOk (hc : Host) (claim : Nat) : Bool :=\n" ++
  "  Extract.isFreestandingGoal claim && checkFailClosed hc\n" ++
  "def extractOkFs (hc : Host) : Bool :=\n" ++
  "  extractOk hc RuntimeClaim.runtimeFs\n" ++
  hostModuleCheckHostComposeTermSkeletonSuffix

/-- GT3: mint always ok (no badId/alreadyLive fail-closed).
    Greppable: hostModuleCheckBadHostComposeMintText, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeMintText : String :=
  hostModuleCheckHostComposeTermSkeletonPrefix ++
  "def empty : Host := {\n" ++
  "  graph := IrGraph.empty\n" ++
  "  linear := LinearHost.empty\n" ++
  "  erased := Erasure.unmarked\n" ++
  "}\n" ++
  "def mint (hc : Host) (id : Nat) : MintResult := MintResult.ok hc\n" ++
  "def consume (hc : Host) : ConsumeResult :=\n" ++
  "  if !hc.linear.live then\n" ++
  "    ConsumeResult.notLive\n" ++
  "  else\n" ++
  "    let payload := hc.linear.id\n" ++
  "    ConsumeResult.ok { hc with linear := { live := false, id := 0 } } payload\n" ++
  "def markErased (hc : Host) : Host :=\n" ++
  "  { hc with erased := Erasure.mark hc.erased }\n" ++
  "def pushHostNode (hc : Host) (n : Nat) : HostPushNodeResult :=\n" ++
  "  match IrGraph.pushNode hc.graph n with\n" ++
  "  | IrGraph.PushNodeResult.ok g => HostPushNodeResult.ok { hc with graph := g }\n" ++
  "  | IrGraph.PushNodeResult.badNode => HostPushNodeResult.badNode\n" ++
  "  | IrGraph.PushNodeResult.full => HostPushNodeResult.full\n" ++
  "def addHostEdge (hc : Host) (fromIdx toIdx : Nat) : HostAddEdgeResult :=\n" ++
  "  match IrGraph.addEdge hc.graph fromIdx toIdx with\n" ++
  "  | IrGraph.AddEdgeResult.ok g => HostAddEdgeResult.ok { hc with graph := g }\n" ++
  "  | IrGraph.AddEdgeResult.full => HostAddEdgeResult.full\n" ++
  "  | IrGraph.AddEdgeResult.badEndpoints => HostAddEdgeResult.badEndpoints\n" ++
  "def multPreScan (hc : Host) : Bool := true\n" ++
  "def hostIsWellTyped (hc : Host) : Bool := true\n" ++
  "def checkFailClosed (hc : Host) : Bool :=\n" ++
  "  hostIsWellTyped hc && multPreScan hc\n" ++
  "def extractOk (hc : Host) (claim : Nat) : Bool :=\n" ++
  "  Extract.isFreestandingGoal claim && checkFailClosed hc\n" ++
  "def extractOkFs (hc : Host) : Bool :=\n" ++
  "  extractOk hc RuntimeClaim.runtimeFs\n" ++
  hostModuleCheckHostComposeTermSkeletonSuffix

/-- GT4: pushHostNode always ok (no badNode/full fail-closed).
    Greppable: hostModuleCheckBadHostComposePushHostNodeText, TERM-SURFACE. -/
def hostModuleCheckBadHostComposePushHostNodeText : String :=
  hostModuleCheckHostComposeTermSkeletonPrefix ++
  "def empty : Host := {\n" ++
  "  graph := IrGraph.empty\n" ++
  "  linear := LinearHost.empty\n" ++
  "  erased := Erasure.unmarked\n" ++
  "}\n" ++
  "def mint (hc : Host) (id : Nat) : MintResult :=\n" ++
  "  if id = 0 then\n" ++
  "    MintResult.badId\n" ++
  "  else if hc.linear.live then\n" ++
  "    MintResult.alreadyLive\n" ++
  "  else\n" ++
  "    MintResult.ok { hc with linear := { live := true, id := id } }\n" ++
  "def consume (hc : Host) : ConsumeResult :=\n" ++
  "  if !hc.linear.live then\n" ++
  "    ConsumeResult.notLive\n" ++
  "  else\n" ++
  "    let payload := hc.linear.id\n" ++
  "    ConsumeResult.ok { hc with linear := { live := false, id := 0 } } payload\n" ++
  "def markErased (hc : Host) : Host :=\n" ++
  "  { hc with erased := Erasure.mark hc.erased }\n" ++
  "def pushHostNode (hc : Host) (n : Nat) : HostPushNodeResult := HostPushNodeResult.ok hc\n" ++
  "def addHostEdge (hc : Host) (fromIdx toIdx : Nat) : HostAddEdgeResult :=\n" ++
  "  match IrGraph.addEdge hc.graph fromIdx toIdx with\n" ++
  "  | IrGraph.AddEdgeResult.ok g => HostAddEdgeResult.ok { hc with graph := g }\n" ++
  "  | IrGraph.AddEdgeResult.full => HostAddEdgeResult.full\n" ++
  "  | IrGraph.AddEdgeResult.badEndpoints => HostAddEdgeResult.badEndpoints\n" ++
  "def multPreScan (hc : Host) : Bool := true\n" ++
  "def hostIsWellTyped (hc : Host) : Bool := true\n" ++
  "def checkFailClosed (hc : Host) : Bool :=\n" ++
  "  hostIsWellTyped hc && multPreScan hc\n" ++
  "def extractOk (hc : Host) (claim : Nat) : Bool :=\n" ++
  "  Extract.isFreestandingGoal claim && checkFailClosed hc\n" ++
  "def extractOkFs (hc : Host) : Bool :=\n" ++
  "  extractOk hc RuntimeClaim.runtimeFs\n" ++
  hostModuleCheckHostComposeTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from HostCompose twin text for L0 dual-pin. -/
def hostComposeTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.HostCompose"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept GT1 when tokens present.
    Greppable: hostModuleCheckBadHostComposeEmptyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeEmptyL0Accept : Bool :=
  (checkNamedSurface (hostComposeTermSurfaceFrom hostModuleCheckBadHostComposeEmptyText)
    hostComposeExpectedNamespace hostComposeRequiredDecls none).isAccept

/-- L0/L1 still accept GT2 when tokens present.
    Greppable: hostModuleCheckBadHostComposeCheckFailClosedL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeCheckFailClosedL0Accept : Bool :=
  (checkNamedSurface (hostComposeTermSurfaceFrom
      hostModuleCheckBadHostComposeCheckFailClosedText)
    hostComposeExpectedNamespace hostComposeRequiredDecls none).isAccept

/-- L0/L1 still accept GT3 when tokens present.
    Greppable: hostModuleCheckBadHostComposeMintL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeMintL0Accept : Bool :=
  (checkNamedSurface (hostComposeTermSurfaceFrom hostModuleCheckBadHostComposeMintText)
    hostComposeExpectedNamespace hostComposeRequiredDecls none).isAccept

/-- L0/L1 still accept GT4 when tokens present.
    Greppable: hostModuleCheckBadHostComposePushHostNodeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadHostComposePushHostNodeL0Accept : Bool :=
  (checkNamedSurface (hostComposeTermSurfaceFrom
      hostModuleCheckBadHostComposePushHostNodeText)
    hostComposeExpectedNamespace hostComposeRequiredDecls none).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckHostComposeTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckHostComposeTermDialectOk : Bool :=
  (checkHostComposeTermDialect hostModuleCheckGoodHostComposeTermText).isNone

/-- Dialect rejects GT1.
    Greppable: hostModuleCheckBadHostComposeEmptyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeEmptyDialectReject : Bool :=
  match checkHostComposeTermDialect hostModuleCheckBadHostComposeEmptyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects GT2.
    Greppable: hostModuleCheckBadHostComposeCheckFailClosedDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeCheckFailClosedDialectReject : Bool :=
  match checkHostComposeTermDialect hostModuleCheckBadHostComposeCheckFailClosedText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects GT3.
    Greppable: hostModuleCheckBadHostComposeMintDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadHostComposeMintDialectReject : Bool :=
  match checkHostComposeTermDialect hostModuleCheckBadHostComposeMintText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects GT4 wrong pushHostNode body.
    Greppable: hostModuleCheckBadHostComposePushHostNodeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadHostComposePushHostNodeDialectReject : Bool :=
  match checkHostComposeTermDialect hostModuleCheckBadHostComposePushHostNodeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined HostCompose L2 dual-pin (good + GT1..GT4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckHostComposeTermSurfaceOk, TERM-SURFACE,
    HostCompose-only. -/
def hostModuleCheckHostComposeTermSurfaceOk : Bool :=
  hostModuleCheckHostComposeTermSurfaceDualOk
    && (checkDepthHostComposeTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthHostComposeTermSurfaceScope == "HostCompose-only")
    && hostModuleCheckHostComposeTermDialectOk
    && hostModuleCheckBadHostComposeEmptyDialectReject
    && hostModuleCheckBadHostComposeCheckFailClosedDialectReject
    && hostModuleCheckBadHostComposeMintDialectReject
    && hostModuleCheckBadHostComposePushHostNodeDialectReject
    && hostModuleCheckBadHostComposeEmptyL0Accept
    && hostModuleCheckBadHostComposeCheckFailClosedL0Accept
    && hostModuleCheckBadHostComposeMintL0Accept
    && hostModuleCheckBadHostComposePushHostNodeL0Accept

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckHostComposeTerm
