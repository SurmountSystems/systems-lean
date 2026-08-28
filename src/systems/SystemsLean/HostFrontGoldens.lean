/-
  SYSTEMS_LEAN_HOST partial -- HostFront dual-pinned golden texts + file names.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion of HostFront. Namespace SystemsLean.HostFront.
  Non-claims: not peer green; host residual remains; not free/PROVABLY/llvm.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT, HostFrontGoldens, goodG1Text,
  goodG2Text, goodG3Text, goodG4Text, goodG5Text, goodG6Text, goodG7Text,
  badB1Text, badB2Text, badB3Text, badB4Text, goodG1File, LINEAR-EXACT-ONCE,
  TYPED_IR_V0, IR_PROGRAM_V0, IR_GRAPH_EDGES_V0, HOST_COMPOSE_V0.
  Module: SystemsLean.HostFrontGoldens
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostFrontGoldens; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Host elaborator residual remains.
-/
namespace SystemsLean.HostFront
/-! ### Dual-pinned golden texts (must match on-disk files under goldensRel)

  Greppable: goodG1Text, goodG2Text, badB1Text, badB2Text, badB3Text, badB4Text,
  HostFrontGoldens.
-/
def goodG1Text : String :=
  "# Host fragment dialect v0 (Mult-first) -- G1 Mult fixture\n" ++
  "# form: module/namespace/inductive/def/check/end\n" ++
  "# targets SystemsLean.HostTerm IR; not full Lean 4; not Mult IR node lines\n" ++
  "\n" ++
  "module SystemsLean.Mult\n" ++
  "namespace SystemsLean.Mult\n" ++
  "inductive Mult mult0 mult1 multOmega deriving DecidableEq Repr\n" ++
  "def name : Mult -> String := match var m | mult0 => \"MULT-0\" | mult1 => \"MULT-1\" | multOmega => \"MULT-OMEGA\"\n" ++
  "def isValid : Mult -> Bool := match var m | mult0 => true | mult1 => true | multOmega => true\n" ++
  "def ofNat? : Nat -> Option Mult := match var k | 0 => some mult0 | 1 => some mult1 | 2 => some multOmega | _ => none\n" ++
  "def isValidTag : Nat -> Bool := app isSome ( app ofNat? ( var k ) )\n" ++
  "def multIsValid : Mult -> Bool := app isValid ( var m )\n" ++
  "check mult0 : Mult\n" ++
  "end SystemsLean.Mult\n"

/-- G2 minimal Mult inductive + check. -/
def goodG2Text : String :=
  "# G2 minimal Mult inductive + check\n" ++
  "\n" ++
  "module SystemsLean.MultMini\n" ++
  "namespace SystemsLean.MultMini\n" ++
  "inductive Mult mult0 mult1 multOmega deriving DecidableEq Repr\n" ++
  "check mult0 : Mult\n" ++
  "end SystemsLean.MultMini\n"

/-- G3 Linear-shaped host fragment (shareNat / polyId / LINEAR-EXACT-ONCE).
    Expand set: Linear unit shapes under Mult-first dialect. -/
def goodG3Text : String :=
  "# G3 Linear-shaped host fragment (shareNat / polyId / LINEAR-EXACT-ONCE id)\n" ++
  "# form: module/namespace/def/check/end -- not full Linear.lean axioms\n" ++
  "# Mult-first dialect still; Linear unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.LinearMini\n" ++
  "namespace SystemsLean.LinearMini\n" ++
  "def shareNat : Nat -> Nat := var n\n" ++
  "def polyId : Nat -> Nat := var x\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.LinearMini\n"

/-- G4 Types-shaped host fragment (TYPED_IR / kind-mult honesty mini).
    Expand set: Types unit shapes under Mult-first dialect.
    Greppable: goodG4Text, TYPED_IR_V0, KIND-MULT-OK, TYPES-FIXTURE. -/
def goodG4Text : String :=
  "# G4 Types-shaped host fragment (TYPED_IR / kind-mult honesty mini)\n" ++
  "# form: module/namespace/def/check/end -- not full Types.lean / elaborator\n" ++
  "# Mult-first dialect still; Types unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.TypesMini\n" ++
  "namespace SystemsLean.TypesMini\n" ++
  "def typedIrId : String := \"TYPED_IR_V0\"\n" ++
  "def kindMultOkId : String := \"KIND-MULT-OK\"\n" ++
  "def typesFixtureId : String := \"TYPES-FIXTURE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.TypesMini\n"

/-- G5 Program-shaped host fragment (ordered IR program honesty mini).
    Expand set: Program unit shapes under Mult-first dialect.
    Greppable: goodG5Text, IR_PROGRAM_V0, ORDERED-IR-PROGRAM, PROGRAM-FIXTURE. -/
def goodG5Text : String :=
  "# G5 Program-shaped host fragment (ordered IR program honesty mini)\n" ++
  "# form: module/namespace/def/check/end -- not full IrProgram.lean / elaborator\n" ++
  "# Mult-first dialect still; Program unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.ProgramMini\n" ++
  "namespace SystemsLean.ProgramMini\n" ++
  "def irProgramId : String := \"IR_PROGRAM_V0\"\n" ++
  "def orderedIrProgramId : String := \"ORDERED-IR-PROGRAM\"\n" ++
  "def programFixtureId : String := \"PROGRAM-FIXTURE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.ProgramMini\n"

/-- G6 Graph-shaped host fragment (edge-list IR graph honesty mini).
    Expand set: Graph unit shapes under Mult-first dialect.
    Greppable: goodG6Text, IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK, GRAPH-FIXTURE. -/
def goodG6Text : String :=
  "# G6 Graph-shaped host fragment (edge-list IR graph honesty mini)\n" ++
  "# form: module/namespace/def/check/end -- not full IrGraph.lean / elaborator\n" ++
  "# Mult-first dialect still; Graph unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.GraphMini\n" ++
  "namespace SystemsLean.GraphMini\n" ++
  "def irGraphEdgesId : String := \"IR_GRAPH_EDGES_V0\"\n" ++
  "def emptyGraphOkId : String := \"EMPTY-GRAPH-OK\"\n" ++
  "def graphFixtureId : String := \"GRAPH-FIXTURE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.GraphMini\n"

/-- G7 Compose-shaped host fragment (HostCompose mint/consume honesty mini).
    Expand set: Compose unit shapes under Mult-first dialect.
    Greppable: goodG7Text, HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-FIXTURE. -/
def goodG7Text : String :=
  "# G7 Compose-shaped host fragment (HostCompose mint/consume honesty mini)\n" ++
  "# form: module/namespace/def/check/end -- not full HostCompose.lean / elaborator\n" ++
  "# Mult-first dialect still; Compose unit shapes as expand surface\n" ++
  "\n" ++
  "module SystemsLean.ComposeMini\n" ++
  "namespace SystemsLean.ComposeMini\n" ++
  "def hostComposeId : String := \"HOST_COMPOSE_V0\"\n" ++
  "def hostComposeSurfaceId : String := \"HOST-COMPOSE\"\n" ++
  "def composeFixtureId : String := \"COMPOSE-FIXTURE\"\n" ++
  "check 0 : Nat\n" ++
  "end SystemsLean.ComposeMini\n"

/-- B1 empty (comments only). -/
def badB1Text : String :=
  "# B1 empty module -- only comments (EMPTY-MODULE-FAIL-CLOSED)\n" ++
  "\n" ++
  "# no commands\n"

/-- B2 line shape (garbled inductive). -/
def badB2Text : String :=
  "# B2 line shape -- inductive missing name (LINE-SHAPE)\n" ++
  "\n" ++
  "module Bad.Shape\n" ++
  "inductive\n"

/-- B3 unknown command. -/
def badB3Text : String :=
  "# B3 unknown command (UNKNOWN-CMD)\n" ++
  "\n" ++
  "module Bad.Unknown\n" ++
  "foobar xyz\n"

/-- B4 zero-ctor inductive. -/
def badB4Text : String :=
  "# B4 zero-ctor inductive (ZERO-CTOR-INDUCTIVE)\n" ++
  "\n" ++
  "module Bad.Ind\n" ++
  "inductive EmptyLike deriving DecidableEq\n"

/-- Golden file basenames. -/
def goodG1File : String := "good-mult-fixture.slake-host"
def goodG2File : String := "good-mult-mini.slake-host"
def goodG3File : String := "good-linear-mini.slake-host"
def goodG4File : String := "good-types-mini.slake-host"
def goodG5File : String := "good-program-mini.slake-host"
def goodG6File : String := "good-graph-mini.slake-host"
def goodG7File : String := "good-compose-mini.slake-host"
def badB1File : String := "bad-empty.slake-host"
def badB2File : String := "bad-line-shape.slake-host"
def badB3File : String := "bad-unknown-cmd.slake-host"
def badB4File : String := "bad-zero-ctor.slake-host"
end SystemsLean.HostFront
