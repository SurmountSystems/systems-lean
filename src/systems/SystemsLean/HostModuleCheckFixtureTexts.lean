/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck good fixture texts (Mult..SurfaceMatrixTheorems).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostModuleCheckFixtures: dual-pinned good structural fixture text strings Mult through SurfaceMatrixTheorems; Emit scaffolds and later product-path foundation texts live in HostModuleCheckFixtureTextsEmit.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckFixtureTexts,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, Host library seed expand continue,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckFixtureTexts
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckFixtureTexts;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/


namespace SystemsLean.HostModuleCheck

/-! ### Dual-pinned fixture texts (structural; mirror on-disk surfaces) -/

/-- Minimal good Mult text. Greppable: hostModuleCheckGoodMultText. -/
def hostModuleCheckGoodMultText : String :=
  "namespace SystemsLean.Mult\n" ++
  "inductive Mult where\n" ++
  "  | mult0\n" ++
  "  | mult1\n" ++
  "  | multOmega\n" ++
  "def name : Mult -> String\n" ++
  "  | Mult.mult0 => \"MULT-0\"\n" ++
  "def isValid : Mult -> Bool\n" ++
  "  | _ => true\n" ++
  "def ofNat? : Nat -> Option Mult\n" ++
  "  | 0 => some Mult.mult0\n" ++
  "  | _ => none\n" ++
  "def isValidTag (n : Nat) : Bool := (ofNat? n).isSome\n" ++
  "def multIsValid (m : Mult) : Bool := isValid m\n" ++
  "end SystemsLean.Mult\n"
/-- Minimal good MultTheorems text (A56 FOUNDATION-KIND-SURFACE Mult..Types deepen;
    structural names only). Greppable: hostModuleCheckGoodMultTheoremsText,
    Check depth deepen. -/
def hostModuleCheckGoodMultTheoremsText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Mult\n" ++
  "theorem ofNat?_zero : ofNat? 0 = some Mult.mult0 := rfl\n" ++
  "theorem ofNat?_one : ofNat? 1 = some Mult.mult1 := rfl\n" ++
  "theorem ofNat?_two : ofNat? 2 = some Mult.multOmega := rfl\n" ++
  "theorem ofNat?_fail_closed (n : Nat) (h : 2 < n) : ofNat? n = none := by sorry\n" ++
  "theorem isValidTag_zero : isValidTag 0 = true := rfl\n" ++
  "theorem isValidTag_one : isValidTag 1 = true := rfl\n" ++
  "theorem isValidTag_two : isValidTag 2 = true := rfl\n" ++
  "theorem isValidTag_fail_closed (n : Nat) (h : 2 < n) : isValidTag n = false := by sorry\n" ++
  "theorem isValid_true (m : Mult) : isValid m = true := by sorry\n" ++
  "theorem multIsValid_eq_isValid (m : Mult) : multIsValid m = isValid m := rfl\n" ++
  "theorem name_mult0 : name Mult.mult0 = \"MULT-0\" := rfl\n" ++
  "theorem name_mult1 : name Mult.mult1 = \"MULT-1\" := rfl\n" ++
  "theorem name_multOmega : name Mult.multOmega = \"MULT-OMEGA\" := rfl\n" ++
  "theorem isValidTag_eq_ofNat?_isSome (n : Nat) : True := trivial\n" ++
  "end SystemsLean.Mult\n"
/-- Minimal good Linear text (A56: axioms + honesty ids on FOUNDATION-KIND-SURFACE).
    Greppable: hostModuleCheckGoodLinearText, Check depth deepen. -/
def hostModuleCheckGoodLinearText : String :=
  "namespace SystemsLean.Linear\n" ++
  "def shareNat (n : Nat) : Nat := n + n\n" ++
  "axiom Token : Type\n" ++
  "axiom mkToken : Nat -> Token\n" ++
  "axiom consume : Token -> Nat\n" ++
  "def polyId {a : Type} (x : a) : a := x\n" ++
  "def mult0ClassId : String := \"MULT-0\"\n" ++
  "def mult1ClassId : String := \"MULT-1\"\n" ++
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "def linearAxiomsRemainId : String := \"LINEAR-AXIOMS-REMAIN\"\n" ++
  "def affineNotFirstClassId : String := \"AFFINE-NOT-FIRST-CLASS\"\n" ++
  "def linearAxiomInventoryOk : Bool := true\n" ++
  "end SystemsLean.Linear\n"
/-- Minimal good LinearTheorems text (A56 Mult..Types deepen).
    Greppable: hostModuleCheckGoodLinearTheoremsText, Check depth deepen. -/
def hostModuleCheckGoodLinearTheoremsText : String :=
  "import SystemsLean.Linear\n" ++
  "namespace SystemsLean.Linear\n" ++
  "theorem shareNat_eq (n : Nat) : shareNat n = n + n := rfl\n" ++
  "theorem shareNat_zero : shareNat 0 = 0 := rfl\n" ++
  "theorem shareNat_succ (n : Nat) : shareNat (n + 1) = (n + 1) + (n + 1) := rfl\n" ++
  "theorem polyId_id {a : Type} (x : a) : polyId x = x := rfl\n" ++
  "theorem mult0ClassId_eq : mult0ClassId = \"MULT-0\" := rfl\n" ++
  "theorem mult1ClassId_eq : mult1ClassId = \"MULT-1\" := rfl\n" ++
  "theorem multOmegaClassId_eq : multOmegaClassId = \"MULT-OMEGA\" := rfl\n" ++
  "theorem linearAxiomInventoryOk_true : linearAxiomInventoryOk = true := rfl\n" ++
  "theorem shareNat_reuse (n : Nat) : True := trivial\n" ++
  "theorem linearExactOnceId_eq : linearExactOnceId = \"LINEAR-EXACT-ONCE\" := rfl\n" ++
  "theorem linearAxiomsRemainId_eq : linearAxiomsRemainId = \"LINEAR-AXIOMS-REMAIN\" := rfl\n" ++
  "theorem affineNotFirstClassId_eq : affineNotFirstClassId = \"AFFINE-NOT-FIRST-CLASS\" := rfl\n" ++
  "end SystemsLean.Linear\n"
/-- Minimal good Types text (A56 + Types L2 TERM-SURFACE shapes).
    Greppable: hostModuleCheckGoodTypesText, Check depth deepen, FOUNDATION-KIND-SURFACE,
    TERM-SURFACE, Types-only. -/
def hostModuleCheckGoodTypesText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Types\n" ++
  "structure TypeTag where\n" ++
  "  tag : Nat\n" ++
  "inductive NodeKind where\n" ++
  "  | value\n" ++
  "  | linear\n" ++
  "  | erased\n" ++
  "structure IrNode where\n" ++
  "  ty : TypeTag\n" ++
  "  mult : Mult\n" ++
  "  kind : NodeKind\n" ++
  "def typeTagInit (tag : Nat) : TypeTag := { tag := tag }\n" ++
  "def NodeKind.name : NodeKind -> String\n" ++
  "  | NodeKind.value => \"VALUE\"\n" ++
  "  | NodeKind.linear => \"LINEAR\"\n" ++
  "  | NodeKind.erased => \"ERASED\"\n" ++
  "def NodeKind.expectedMult : NodeKind -> Mult\n" ++
  "  | NodeKind.value => Mult.multOmega\n" ++
  "  | NodeKind.linear => Mult.mult1\n" ++
  "  | NodeKind.erased => Mult.mult0\n" ++
  "def kindMultOk (k : NodeKind) (m : Mult) : Bool := decide (k.expectedMult = m)\n" ++
  "def ofKindTag? : Nat -> Option NodeKind\n" ++
  "  | 0 => some NodeKind.value\n" ++
  "  | 1 => some NodeKind.linear\n" ++
  "  | 2 => some NodeKind.erased\n" ++
  "  | _ => none\n" ++
  "def isValidKindTag (n : Nat) : Bool := (ofKindTag? n).isSome\n" ++
  "def IrNode.isWellTyped (n : IrNode) : Bool := kindMultOk n.kind n.mult\n" ++
  "def mkNode? (tag : Nat) (m : Mult) (k : NodeKind) : Option IrNode := none\n" ++
  "def mkNodeFromTags? (a b c : Nat) : Option IrNode := none\n" ++
  "end SystemsLean.Types\n"
/-- Minimal good TypesTheorems text (A56 Mult..Types deepen).
    Greppable: hostModuleCheckGoodTypesTheoremsText, Check depth deepen. -/
def hostModuleCheckGoodTypesTheoremsText : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.Types\n" ++
  "theorem ofKindTag?_zero : ofKindTag? 0 = some NodeKind.value := rfl\n" ++
  "theorem ofKindTag?_one : ofKindTag? 1 = some NodeKind.linear := rfl\n" ++
  "theorem ofKindTag?_two : ofKindTag? 2 = some NodeKind.erased := rfl\n" ++
  "theorem ofKindTag?_fail_closed (n : Nat) (h : 2 < n) : ofKindTag? n = none := by sorry\n" ++
  "theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl\n" ++
  "theorem isValidKindTag_one : isValidKindTag 1 = true := rfl\n" ++
  "theorem isValidKindTag_two : isValidKindTag 2 = true := rfl\n" ++
  "theorem isValidKindTag_fail_closed (n : Nat) (h : 2 < n) : isValidKindTag n = false := by sorry\n" ++
  "theorem kindMultOk_value_omega : True := trivial\n" ++
  "theorem kindMultOk_linear_one : True := trivial\n" ++
  "theorem kindMultOk_erased_zero : True := trivial\n" ++
  "theorem expectedMult_value : True := trivial\n" ++
  "theorem expectedMult_linear : True := trivial\n" ++
  "theorem expectedMult_erased : True := trivial\n" ++
  "end SystemsLean.Types\n"
/-- Minimal good IrProgram text (A57 + IrProgram L2 TERM-SURFACE shapes).
    Greppable: hostModuleCheckGoodIrProgramText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, TERM-SURFACE, IrProgram-only. -/
def hostModuleCheckGoodIrProgramText : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.IrProgram\n" ++
  "structure Program where\n" ++
  "  nodes : List Nat\n" ++
  "inductive PushResult where\n" ++
  "  | ok (p : Program)\n" ++
  "  | badNode\n" ++
  "  | full\n" ++
  "def programCap : Nat := 8\n" ++
  "def empty : Program := { nodes := [] }\n" ++
  "def length (p : Program) : Nat := p.nodes.length\n" ++
  "def isEmpty (p : Program) : Bool := p.nodes.isEmpty\n" ++
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
  "def foldWellTyped (p : Program) : Nat := 0\n" ++
  "def checkFailClosed (p : Program) : Bool := isWellTyped p\n" ++
  "end SystemsLean.IrProgram\n"

/-- Minimal good IrProgramTheorems text (A57 deepen continue expanded corpus).
    Greppable: hostModuleCheckGoodIrProgramTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodIrProgramTheoremsText : String :=
  "import SystemsLean.IrProgram\n" ++
  "namespace SystemsLean.IrProgram\n" ++
  "theorem empty_isEmpty : isEmpty empty = true := rfl\n" ++
  "theorem empty_length_zero : length empty = 0 := rfl\n" ++
  "theorem programCap_eq_eight : programCap = 8 := rfl\n" ++
  "theorem isWellTyped_empty_false : isWellTyped empty = false := rfl\n" ++
  "theorem empty_not_well_typed : isWellTyped empty = false := rfl\n" ++
  "theorem checkFailClosed_eq_isWellTyped (p : Program) : True := trivial\n" ++
  "theorem foldWellTyped_empty_none : True := trivial\n" ++
  "theorem push_bad_node : True := trivial\n" ++
  "theorem push_value_one_ok : True := trivial\n" ++
  "theorem length_single_value : True := trivial\n" ++
  "theorem isWellTyped_single_value : True := trivial\n" ++
  "theorem foldWellTyped_single_value_some : True := trivial\n" ++
  "end SystemsLean.IrProgram\n"

/-- Minimal good IrGraph text (A57 + IrGraph L2 TERM-SURFACE shapes).
    Greppable: hostModuleCheckGoodIrGraphText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, TERM-SURFACE, IrGraph-only. -/
def hostModuleCheckGoodIrGraphText : String :=
  "import SystemsLean.IrProgram\nnamespace SystemsLean.IrGraph\n" ++
  "structure Edge where\n  fromIdx : Nat\n  toIdx : Nat\n" ++
  "structure Graph where\n  prog : Nat\n  edges : List Edge\n" ++
  "inductive PushNodeResult where\n  | ok (g : Graph)\n  | badNode\n  | full\n" ++
  "inductive AddEdgeResult where\n  | ok (g : Graph)\n  | full\n  | badEndpoints\n" ++
  "def edgeMax : Nat := 16\n" ++
  "def empty : Graph := { prog := IrProgram.empty, edges := [] }\n" ++
  "def edgeCount (g : Graph) : Nat := g.edges.length\n" ++
  "def nodeCount (g : Graph) : Nat := 0\n" ++
  "def isEmpty (g : Graph) : Bool := true\n" ++
  "def edgesSound (edges : List Edge) (nCount : Nat) : Bool := true\n" ++
  "def pushNode (g : Graph) (n : Nat) : PushNodeResult :=\n" ++
  "  match IrProgram.push g.prog n with\n" ++
  "  | IrProgram.PushResult.ok p => PushNodeResult.ok { g with prog := p }\n" ++
  "  | IrProgram.PushResult.badNode => PushNodeResult.badNode\n" ++
  "  | IrProgram.PushResult.full => PushNodeResult.full\n" ++
  "def addEdge (g : Graph) (fromIdx toIdx : Nat) : AddEdgeResult :=\n" ++
  "  if g.edges.length >= edgeMax then AddEdgeResult.full\n" ++
  "  else if false then AddEdgeResult.badEndpoints\n" ++
  "  else AddEdgeResult.ok { prog := g.prog, edges := g.edges }\n" ++
  "def isWellTyped (g : Graph) : Bool :=\n" ++
  "  if isEmpty g then true else if IrProgram.isEmpty g.prog then false\n" ++
  "  else IrProgram.isWellTyped g.prog && edgesSound g.edges (IrProgram.length g.prog)\n" ++
  "def checkFailClosed (g : Graph) : Bool := isWellTyped g\nend SystemsLean.IrGraph\n"

/-- Minimal good IrGraphTheorems text (A57 deepen continue expanded corpus).
    Greppable: hostModuleCheckGoodIrGraphTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodIrGraphTheoremsText : String :=
  "import SystemsLean.IrGraph\n" ++
  "namespace SystemsLean.IrGraph\n" ++
  "theorem isWellTyped_empty_true : isWellTyped empty = true := rfl\n" ++
  "theorem empty_well_typed : isWellTyped empty = true := rfl\n" ++
  "theorem empty_isEmpty : isEmpty empty = true := rfl\n" ++
  "theorem edgeMax_eq_sixteen : edgeMax = 16 := rfl\n" ++
  "theorem checkFailClosed_eq_isWellTyped (g : Graph) : True := trivial\n" ++
  "theorem edgesSound_empty : True := trivial\n" ++
  "theorem pushNode_value_one_ok : True := trivial\n" ++
  "theorem addEdge_empty_badEndpoints : True := trivial\n" ++
  "theorem isWellTyped_one_node_empty_edges : True := trivial\n" ++
  "theorem addEdge_one_node_self_ok : True := trivial\n" ++
  "theorem edgesSound_one_edge : True := trivial\n" ++
  "theorem isWellTyped_two_nodes_one_edge : True := trivial\n" ++
  "end SystemsLean.IrGraph\n"

/-- Minimal good HostCompose text (A57 + HostCompose L2 TERM-SURFACE shapes).
    Full L2 twin corpus lives in HostModuleCheckHostComposeTerm; this seed good
    must still pass refineHostComposeWithTermSurface.
    Greppable: hostModuleCheckGoodHostComposeText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, TERM-SURFACE, HostCompose-only. -/
def hostModuleCheckGoodHostComposeText : String :=
  "import SystemsLean.IrGraph\nnamespace SystemsLean.HostCompose\n" ++
  "structure LinearHost where\n  live : Bool\n  id : Nat\n" ++
  "structure Host where\n  graph : Nat\n  linear : LinearHost\n  erased : Nat\n" ++
  "inductive MintResult where\n  | ok (hc : Host)\n  | badId\n  | alreadyLive\n" ++
  "inductive ConsumeResult where\n  | ok (hc : Host) (payload : Nat)\n  | notLive\n" ++
  "inductive HostPushNodeResult where\n  | ok (hc : Host)\n  | badNode\n  | full\n" ++
  "inductive HostAddEdgeResult where\n  | ok (hc : Host)\n  | full\n  | badEndpoints\n" ++
  "def empty : Host := {\n  graph := IrGraph.empty\n  linear := LinearHost.empty\n  erased := Erasure.unmarked\n}\n" ++
  "def mint (hc : Host) (id : Nat) : MintResult :=\n  if id = 0 then MintResult.badId\n  else if hc.linear.live then MintResult.alreadyLive\n  else MintResult.ok { hc with linear := { live := true, id := id } }\n" ++
  "def consume (hc : Host) : ConsumeResult :=\n  if !hc.linear.live then ConsumeResult.notLive\n  else ConsumeResult.ok { hc with linear := { live := false, id := 0 } } hc.linear.id\n" ++
  "def markErased (hc : Host) : Host := { hc with erased := Erasure.mark hc.erased }\n" ++
  "def pushHostNode (hc : Host) (n : Nat) : HostPushNodeResult :=\n  match IrGraph.pushNode hc.graph n with\n  | IrGraph.PushNodeResult.ok g => HostPushNodeResult.ok { hc with graph := g }\n  | IrGraph.PushNodeResult.badNode => HostPushNodeResult.badNode\n  | IrGraph.PushNodeResult.full => HostPushNodeResult.full\n" ++
  "def addHostEdge (hc : Host) (fromIdx toIdx : Nat) : HostAddEdgeResult :=\n  match IrGraph.addEdge hc.graph fromIdx toIdx with\n  | IrGraph.AddEdgeResult.ok g => HostAddEdgeResult.ok { hc with graph := g }\n  | IrGraph.AddEdgeResult.full => HostAddEdgeResult.full\n  | IrGraph.AddEdgeResult.badEndpoints => HostAddEdgeResult.badEndpoints\n" ++
  "def multPreScan (hc : Host) : Bool := true\ndef hostIsWellTyped (hc : Host) : Bool := true\n" ++
  "def checkFailClosed (hc : Host) : Bool := hostIsWellTyped hc && multPreScan hc\n" ++
  "def extractOk (hc : Host) (claim : Nat) : Bool := Extract.isFreestandingGoal claim && checkFailClosed hc\n" ++
  "def extractOkFs (hc : Host) : Bool := extractOk hc RuntimeClaim.runtimeFs\nend SystemsLean.HostCompose\n"

/-- Minimal good HostComposeTheorems text (A57 deepen continue expanded corpus).
    Greppable: hostModuleCheckGoodHostComposeTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodHostComposeTheoremsText : String :=
  "import SystemsLean.HostCompose\n" ++
  "namespace SystemsLean.HostCompose\n" ++
  "theorem multPreScan_empty_true : multPreScan empty = true := rfl\n" ++
  "theorem checkFailClosed_empty_true : checkFailClosed empty = true := rfl\n" ++
  "theorem extractOkFs_empty_true : extractOkFs empty = true := rfl\n" ++
  "theorem mint_zero_badId : True := trivial\n" ++
  "theorem consume_empty_notLive : True := trivial\n" ++
  "theorem extractOkFs_eq : True := trivial\n" ++
  "theorem checkFailClosed_eq : True := trivial\n" ++
  "theorem mint_empty_one_ok : True := trivial\n" ++
  "theorem consume_minted_one : True := trivial\n" ++
  "theorem mint_already_live_one : True := trivial\n" ++
  "theorem double_consume_notLive : True := trivial\n" ++
  "theorem nodeMultOk_omega : True := trivial\n" ++
  "theorem multPreScan_mult1_unminted_false : True := trivial\n" ++
  "theorem extractOkFs_mult1_minted_true : True := trivial\n" ++
  "end SystemsLean.HostCompose\n"
/-- Minimal good Erasure text (A58 + Erasure L2 TERM-SURFACE shapes).
    Full L2 twin corpus lives in HostModuleCheckErasureTerm; this seed good
    must still pass refineErasureWithTermSurface.
    Greppable: hostModuleCheckGoodErasureText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, TERM-SURFACE, Erasure-only. -/
def hostModuleCheckGoodErasureText : String :=
  "import SystemsLean.Mult\nnamespace SystemsLean.Erasure\n" ++
  "structure Erased where\n  marked : Bool\n" ++
  "def unmarked : Erased := { marked := false }\n" ++
  "def mark (e : Erased) : Erased := { marked := true }\n" ++
  "def isRuntimeAbsent (e : Erased) : Bool := e.marked\n" ++
  "def erasureIsRuntimeAbsent (e : Erased) : Bool := isRuntimeAbsent e\n" ++
  "def isErasureGrade (m : Mult) : Bool :=\n  match m with\n  | Mult.mult0 => true\n  | Mult.mult1 => false\n  | Mult.multOmega => false\n" ++
  "def markForGrade? (m : Mult) (e : Erased) : Option Erased :=\n  if isErasureGrade m then\n    some (mark e)\n  else\n    none\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) : Bool :=\n  isErasureGrade m && isRuntimeAbsent e\nend SystemsLean.Erasure\n"

/-- Minimal good ErasureTheorems text (A58 deepen continue expanded corpus).
    Greppable: hostModuleCheckGoodErasureTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodErasureTheoremsText : String :=
  "import SystemsLean.Erasure\n" ++
  "namespace SystemsLean.Erasure\n" ++
  "theorem isRuntimeAbsent_unmarked_false : True := trivial\n" ++
  "theorem isRuntimeAbsent_mark_true : True := trivial\n" ++
  "theorem isErasureGrade_mult0 : True := trivial\n" ++
  "theorem isErasureGrade_mult1_false : True := trivial\n" ++
  "theorem markForGrade?_mult0_some : True := trivial\n" ++
  "theorem markForGrade?_mult1_none : True := trivial\n" ++
  "theorem checkFailClosed_unmarked_false : True := trivial\n" ++
  "theorem checkFailClosed_eq : True := trivial\n" ++
  "theorem isRuntimeAbsent_eq_marked : True := trivial\n" ++
  "theorem erasureIsRuntimeAbsent_eq : True := trivial\n" ++
  "theorem mark_idempotent : True := trivial\n" ++
  "theorem isErasureGrade_omega_false : True := trivial\n" ++
  "theorem markForGrade?_omega_none : True := trivial\n" ++
  "theorem checkFailClosed_marked_mult0_true : True := trivial\n" ++
  "end SystemsLean.Erasure\n"

/-- L2 good Extract text (term-surface shapes; seed L0 path still accepts under
    refine). Greppable: hostModuleCheckGoodExtractText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, TERM-SURFACE, Extract-only. -/
def hostModuleCheckGoodExtractText : String :=
  "import SystemsLean.Erasure\nnamespace SystemsLean.Extract\n" ++
  "inductive RuntimeClaim where\n  | runtimeFs\n  | runtimeClassic\n  | edgeRuntime\n" ++
  "def RuntimeClaim.name : RuntimeClaim -> String\n  | RuntimeClaim.runtimeFs => \"RUNTIME-FS\"\n  | RuntimeClaim.runtimeClassic => \"RUNTIME-CLASSIC\"\n  | RuntimeClaim.edgeRuntime => \"EDGE-RUNTIME\"\n" ++
  "def isFreestandingGoal (c : RuntimeClaim) : Bool :=\n  match c with\n  | RuntimeClaim.runtimeFs => true\n  | RuntimeClaim.runtimeClassic => false\n  | RuntimeClaim.edgeRuntime => false\n" ++
  "def ofRuntimeTag? : Nat -> Option RuntimeClaim\n  | 0 => some RuntimeClaim.runtimeFs\n  | 1 => some RuntimeClaim.runtimeClassic\n  | 2 => some RuntimeClaim.edgeRuntime\n  | _ => none\n" ++
  "def isValidRuntimeTag (n : Nat) : Bool := (ofRuntimeTag? n).isSome\n" ++
  "def checkFailClosed (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n  if !isFreestandingGoal claim then\n    false\n  else\n    match m with\n    | Mult.mult0 => SystemsLean.Erasure.checkFailClosed m e\n    | Mult.mult1 => false\n    | Mult.multOmega => true\n" ++
  "def extractOk (m : Mult) (e : Erased) (claim : RuntimeClaim) : Bool :=\n  checkFailClosed m e claim\n" ++
  "def extractOkFromTags? (multTag : Nat) (erasedMarked : Bool) (runtimeTag : Nat) : Option Bool :=\n  match Mult.ofNat? multTag, ofRuntimeTag? runtimeTag with\n  | some m, some claim =>\n    some (extractOk m { marked := erasedMarked } claim)\n  | _, _ => none\nend SystemsLean.Extract\n"

/-- Minimal good ExtractTheorems text (A58 deepen continue expanded corpus).
    Greppable: hostModuleCheckGoodExtractTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodExtractTheoremsText : String :=
  "import SystemsLean.Extract\n" ++
  "namespace SystemsLean.Extract\n" ++
  "theorem isFreestandingGoal_runtimeFs : True := trivial\n" ++
  "theorem isFreestandingGoal_classic_false : True := trivial\n" ++
  "theorem extractOk_classic_reject : True := trivial\n" ++
  "theorem extractOk_mult0_unmarked_false : True := trivial\n" ++
  "theorem ofRuntimeTag?_zero : True := trivial\n" ++
  "theorem ofRuntimeTag?_fail_closed : True := trivial\n" ++
  "theorem isValidRuntimeTag_zero : True := trivial\n" ++
  "theorem isValidRuntimeTag_fail_closed : True := trivial\n" ++
  "theorem isFreestandingGoal_edge_false : True := trivial\n" ++
  "theorem extractOk_edge_reject : True := trivial\n" ++
  "theorem extractOk_mult1_fs_false : True := trivial\n" ++
  "theorem extractOk_mult0_marked_fs_true : True := trivial\n" ++
  "theorem ofRuntimeTag?_one : True := trivial\n" ++
  "theorem extractOk_eq_checkFailClosed : True := trivial\n" ++
  "end SystemsLean.Extract\n"

/-- Minimal good CompilePath text (library seed expand continue).
    Greppable: hostModuleCheckGoodCompilePathText, Host library seed expand continue. -/
def hostModuleCheckGoodCompilePathText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.CompilePath\n" ++
  "def stageId : String := \"SLAKE_COMPILE_PATH_V1\"\n" ++
  "def hostCompilePathId : String := \"HOST-COMPILE-PATH\"\n" ++
  "def gradeSurfaceOk : Bool := true\n" ++
  "def checkHost (hc : Nat) : Bool := true\n" ++
  "def extractFsOk (hc : Nat) : Bool := true\n" ++
  "def compileReady (hc : Nat) : Bool := true\n" ++
  "end SystemsLean.CompilePath\n"

/-- Minimal good KernelMult text (Kind-surface band expand readiness surface).
    Greppable: hostModuleCheckGoodKernelMultText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodKernelMultText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelMult\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_MULT_V0\"\n" ++
  "def kernelMultId : String := \"SELF-HOST-KERNEL-MULT\"\n" ++
  "def mkGradeNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerMultKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkGradeNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkGradeNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkGradeNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def multKernelReady : Bool :=\n" ++
  "  match lowerMultKernel with\n" ++
  "  | none => false\n" ++
  "  | some p => programCompileReady p && gradeSurfaceOk\n" ++
  "def unknownTagRejected : Bool := !Mult.isValidTag 3\n" ++
  "def kernelSurfaceOk : Bool := true\n" ++
  "def kernelOk : Bool := multKernelReady && kernelSurfaceOk && unknownTagRejected\n" ++
  "def multKernelProgram : Nat := 0\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "end SystemsLean.KernelMult\n"

/-- Minimal good KernelLinear text (Kind-surface band expand).
    Greppable: hostModuleCheckGoodKernelLinearText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodKernelLinearText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelLinear\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\"\n" ++
  "def kernelLinearId : String := \"SELF-HOST-KERNEL-LINEAR\"\n" ++
  "def mkLinearNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerLinearKernel : Option Nat := some 0\n" ++
  "def linearKernelReady : Bool := true\n" ++
  "def linearKernelOk : Bool := true\n" ++
  "def hostKernelLinearId : String := \"HOST-KERNEL-LINEAR\"\n" ++
  "def linearHostPathReady : Bool := true\n" ++
  "def linearMismatchRejected : Bool := true\n" ++
  "def linearSurfaceOk : Bool := true\n" ++
  "end SystemsLean.KernelLinear\n"

/-- Minimal good KernelTypes text (Kind-surface band expand).
    Greppable: hostModuleCheckGoodKernelTypesText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodKernelTypesText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelTypes\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\"\n" ++
  "def kernelTypesId : String := \"SELF-HOST-KERNEL-TYPES\"\n" ++
  "def mkTypedNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerTypesKernel : Option Nat := some 0\n" ++
  "def typesKernelReady : Bool := true\n" ++
  "def typesKernelOk : Bool := true\n" ++
  "def hostKernelTypesId : String := \"HOST-KERNEL-TYPES\"\n" ++
  "def typesProgramPathReady : Bool := true\n" ++
  "def unknownKindRejected : Bool := true\n" ++
  "def typesSurfaceOk : Bool := true\n" ++
  "end SystemsLean.KernelTypes\n"

/-- Minimal good KernelProgram text (Kind-surface band expand).
    Greppable: hostModuleCheckGoodKernelProgramText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodKernelProgramText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelProgram\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\"\n" ++
  "def kernelProgramId : String := \"SELF-HOST-KERNEL-PROGRAM\"\n" ++
  "def mkProgramNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerProgramKernel : Option Nat := some 0\n" ++
  "def programKernelReady : Bool := true\n" ++
  "def programKernelOk : Bool := true\n" ++
  "def hostKernelProgramId : String := \"HOST-KERNEL-PROGRAM\"\n" ++
  "def programPathReady : Bool := true\n" ++
  "def programGraphPathReady : Bool := true\n" ++
  "def programComposePathReady : Bool := true\n" ++
  "end SystemsLean.KernelProgram\n"

/-- Minimal good KernelMultTheorems text (Kind-surface band expand corpus).
    Greppable: hostModuleCheckGoodKernelMultTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodKernelMultTheoremsText : String :=
  "import SystemsLean.KernelMult\n" ++
  "namespace SystemsLean.KernelMult\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_MULT_V0\" := rfl\n" ++
  "theorem kernelMultId_eq : kernelMultId = \"SELF-HOST-KERNEL-MULT\" := rfl\n" ++
  "theorem multKernelReady_true : True := trivial\n" ++
  "theorem kernelOk_true : True := trivial\n" ++
  "theorem lowerMultKernel_isSome : True := trivial\n" ++
  "theorem unknownTagRejected_true : True := trivial\n" ++
  "theorem multKernelProgram_length_three : True := trivial\n" ++
  "theorem multKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem programCompileReady_empty_false : True := trivial\n" ++
  "theorem lowerMultKernel_length_three : True := trivial\n" ++
  "theorem lowerMultKernel_isWellTyped : True := trivial\n" ++
  "end SystemsLean.KernelMult\n"

/-- Minimal good KernelLinearTheorems text (Kind-surface band expand corpus).
    Greppable: hostModuleCheckGoodKernelLinearTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodKernelLinearTheoremsText : String :=
  "import SystemsLean.KernelLinear\n" ++
  "namespace SystemsLean.KernelLinear\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\" := rfl\n" ++
  "theorem kernelLinearId_eq : kernelLinearId = \"SELF-HOST-KERNEL-LINEAR\" := rfl\n" ++
  "theorem linearKernelReady_true : True := trivial\n" ++
  "theorem linearKernelOk_true : True := trivial\n" ++
  "theorem lowerLinearKernel_isSome : True := trivial\n" ++
  "theorem linearMismatchRejected_true : True := trivial\n" ++
  "theorem linearKernelProgram_length_one : True := trivial\n" ++
  "theorem linearKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelLinearId_eq : True := trivial\n" ++
  "theorem linearHostPathReady_true : True := trivial\n" ++
  "theorem programCompileReady_empty_false : True := trivial\n" ++
  "theorem lowerLinearKernel_length_one : True := trivial\n" ++
  "end SystemsLean.KernelLinear\n"

/-- Minimal good KernelTypesTheorems text (Kind-surface band expand corpus).
    Greppable: hostModuleCheckGoodKernelTypesTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodKernelTypesTheoremsText : String :=
  "import SystemsLean.KernelTypes\n" ++
  "namespace SystemsLean.KernelTypes\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\" := rfl\n" ++
  "theorem kernelTypesId_eq : kernelTypesId = \"SELF-HOST-KERNEL-TYPES\" := rfl\n" ++
  "theorem typesKernelReady_true : True := trivial\n" ++
  "theorem typesKernelOk_true : True := trivial\n" ++
  "theorem lowerTypesKernel_isSome : True := trivial\n" ++
  "theorem unknownKindRejected_true : True := trivial\n" ++
  "theorem typesKernelProgram_length_three : True := trivial\n" ++
  "theorem typesKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelTypesId_eq : True := trivial\n" ++
  "theorem typesProgramPathReady_true : True := trivial\n" ++
  "theorem kindMultMismatchRejected_true : True := trivial\n" ++
  "theorem lowerTypesKernel_length_three : True := trivial\n" ++
  "end SystemsLean.KernelTypes\n"

/-- Minimal good KernelProgramTheorems text (Kind-surface band expand corpus).
    Greppable: hostModuleCheckGoodKernelProgramTheoremsText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckGoodKernelProgramTheoremsText : String :=
  "import SystemsLean.KernelProgram\n" ++
  "namespace SystemsLean.KernelProgram\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\" := rfl\n" ++
  "theorem kernelProgramId_eq : kernelProgramId = \"SELF-HOST-KERNEL-PROGRAM\" := rfl\n" ++
  "theorem programKernelReady_true : True := trivial\n" ++
  "theorem programKernelOk_true : True := trivial\n" ++
  "theorem lowerProgramKernel_isSome : True := trivial\n" ++
  "theorem programPathReady_true : True := trivial\n" ++
  "theorem programKernelProgram_length_three : True := trivial\n" ++
  "theorem programKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelProgramId_eq : True := trivial\n" ++
  "theorem programGraphPathReady_true : True := trivial\n" ++
  "theorem programComposePathReady_true : True := trivial\n" ++
  "theorem lowerProgramKernel_length_three : True := trivial\n" ++
  "end SystemsLean.KernelProgram\n"

/-- Minimal good JoinMap text (library seed expand continue).
    Greppable: hostModuleCheckGoodJoinMapText, Host library seed expand continue. -/
def hostModuleCheckGoodJoinMapText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.JoinMap\n" ++
  "def stageId : String := \"SLAKE_JOIN_MAP_V0\"\n" ++
  "def hostJoinMapId : String := \"HOST-JOIN-MAP\"\n" ++
  "def joinMapId : String := \"JOIN-MAP\"\n" ++
  "def joinAlgContractOk : Bool := true\n" ++
  "def joinUnitCompileReady (hc : Nat) : Bool := true\n" ++
  "def joinProgramCompileReady (p : Nat) : Bool := true\n" ++
  "end SystemsLean.JoinMap\n"

/-- Minimal good JoinMapTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodJoinMapTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodJoinMapTheoremsText : String :=
  "import SystemsLean.JoinMap\n" ++
  "namespace SystemsLean.JoinMap\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostJoinMapId_eq : True := trivial\n" ++
  "theorem joinAlgUseOk_true : True := trivial\n" ++
  "theorem joinAlgContractOk_true : True := trivial\n" ++
  "theorem joinCompileReady_eq_joinUnitCompileReady : True := trivial\n" ++
  "theorem joinUnitCompileReady_empty_true : True := trivial\n" ++
  "theorem joinProgramCompileReady_empty_false : True := trivial\n" ++
  "theorem empty_host_ok_ne_empty_program_ok : True := trivial\n" ++
  "end SystemsLean.JoinMap\n"

/-- Minimal good SelfHost text (library seed expand continue).
    Greppable: hostModuleCheckGoodSelfHostText, Host library seed expand continue. -/
def hostModuleCheckGoodSelfHostText : String :=
  "import SystemsLean.JoinMap\n" ++
  "namespace SystemsLean.SelfHost\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_V0\"\n" ++
  "def hostSelfHostId : String := \"HOST-SELF-HOST\"\n" ++
  "def selfHostId : String := \"SELF-HOST\"\n" ++
  "def hostSurfaceOk : Bool := true\n" ++
  "def selfHostUnitReady (hc : Nat) : Bool := true\n" ++
  "def selfHostProgramReady (p : Nat) : Bool := true\n" ++
  "end SystemsLean.SelfHost\n"

/-- Minimal good SelfHostTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodSelfHostTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodSelfHostTheoremsText : String :=
  "import SystemsLean.SelfHost\n" ++
  "namespace SystemsLean.SelfHost\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostSelfHostId_eq : True := trivial\n" ++
  "theorem hostSurfaceOk_true : True := trivial\n" ++
  "theorem selfHostReady_eq_selfHostUnitReady : True := trivial\n" ++
  "theorem selfHostUnitReady_empty_true : True := trivial\n" ++
  "theorem selfHostProgramReady_empty_false : True := trivial\n" ++
  "theorem empty_host_ok_ne_empty_program_ok : True := trivial\n" ++
  "theorem selfHostUnitReady_mult1_unminted_false : True := trivial\n" ++
  "end SystemsLean.SelfHost\n"

/-- Minimal good SurfaceMatrix text (library seed expand continue).
    Greppable: hostModuleCheckGoodSurfaceMatrixText, Host library seed expand continue. -/
def hostModuleCheckGoodSurfaceMatrixText : String :=
  "import SystemsLean.SelfHost\n" ++
  "namespace SystemsLean.SurfaceMatrix\n" ++
  "def stageId : String := \"SLAKE_SURFACE_MATRIX_V0\"\n" ++
  "def hostSurfaceMatrixId : String := \"HOST-SURFACE-MATRIX\"\n" ++
  "def surfaceMatrixId : String := \"SURFACE-MATRIX\"\n" ++
  "def matrixSurfaceOk : Bool := true\n" ++
  "def matrixUnitReady (hc : Nat) : Bool := true\n" ++
  "def matrixProgramReady (p : Nat) : Bool := true\n" ++
  "end SystemsLean.SurfaceMatrix\n"

/-- Minimal good SurfaceMatrixTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodSurfaceMatrixTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodSurfaceMatrixTheoremsText : String :=
  "import SystemsLean.SurfaceMatrix\n" ++
  "namespace SystemsLean.SurfaceMatrix\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostSurfaceMatrixId_eq : True := trivial\n" ++
  "theorem surfaceMatrixId_eq : True := trivial\n" ++
  "theorem matrixSurfaceOk_true : True := trivial\n" ++
  "theorem matrixUnitReady_empty_true : True := trivial\n" ++
  "theorem matrixProgramReady_empty_false : True := trivial\n" ++
  "theorem empty_host_ok_ne_empty_program_ok : True := trivial\n" ++
  "theorem matrixUnitReady_mult1_unminted_false : True := trivial\n" ++
  "end SystemsLean.SurfaceMatrix\n"

/-- Emit scaffold + product-path foundation texts in HostModuleCheckFixtureTextsEmit.
    Greppable: HostModuleCheckFixtureTextsEmit. -/
def hostModuleCheckFixtureTextsEmitModuleCite : String :=
  "SystemsLean.HostModuleCheckFixtureTextsEmit"

end SystemsLean.HostModuleCheck
