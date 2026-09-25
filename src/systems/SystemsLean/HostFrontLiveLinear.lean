/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/Linear.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is Linear.lean. It is not EmitLinearScaffold.lean.
  One import: SystemsLean.UseCheck. Namespace SystemsLean.Linear.
  Kept for the kernel: that import, the namespace, six string defs,
  and end. Axioms, noncomputable roundTrip, shareNat, polyId, and
  linearAxiomInventoryOk stay in the source text (needles). Their
  bodies are not single atoms, and HostTerm has no axiom command.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LINEAR,
  SLAKE_HOST_FRONT_LIVE_LINEAR_V0,
  PARSE-LIVE-LINEAR, liveRel,
  kernelCheckLiveLinearSource,
  hostFrontLiveLinearReady.
  Module: SystemsLean.HostFrontLiveLinear
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLinearSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLinear

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LINEAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LINEAR"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LINEAR"

/-- Live file basename. -/
def liveRel : String := "Linear.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLinearFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveLinearFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLinearResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveLinearProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLinearParseFuel : Nat := 256

/-- Skip fuel for axioms and defs whose bodies are not kernel-checkable. -/
def liveLinearSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, six literal defs, and end.
    A count of 9. From Linear.lean. -/
def liveLinearKeptCmds : Nat := 9

/-- Strip comments. Keep dash-dash and block-open inside string payloads.
    A backslash keeps the next char inside a string. -/
def stripCommentsLinearN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsLinearN n nest false false
            ('\n' :: acc) rest
        else
          stripCommentsLinearN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsLinearN n nest false true
              (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsLinearN n nest false false ('"' :: acc) rest
        else
          stripCommentsLinearN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsLinearN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsLinearN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsLinearN n nest false false
            ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsLinearN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsLinearN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsLinearN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsLinearN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsLinearN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live Linear.lean bytes. -/
def stripCommentsLinear (src : String) : String :=
  String.ofList
    (stripCommentsLinearN (src.length + 8) 0 false false []
      src.toList)

/-- Dotted ident `SystemsLean . Linear`. -/
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
def cmdAddsLinear (c : Cmd) : List String :=
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
def cmdBodyKnownLinear (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearParseFuel body
        && termNoAppN liveLinearParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearParseFuel body
        && termNoAppN liveLinearParseFuel body
  | _ => true

/-- Typed assign whose body is one atom. A compound body (`+`, `&&`,
    or an application) returns none. The caller then skipUntilCmd.
    parseTermHt keeps applying and can take the `end` token. -/
def parseDefLinear (fuel : Nat) (dname : String)
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
            match parseAtomHt liveHostTermParseFuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              match rest4 with
              | [] =>
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, [])
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, [])
              | t :: _ =>
                if isCmdKw t then
                  let rest5 := skipNonCmd liveLinearSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    axiom and noncomputable are not parsed here. theorem, example, and
    set_option are not parsed here. -/
def parseOneCmdLinear (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLinear fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip axiom, noncomputable, and un-kernelable defs.
    A non-command token (`axiom`, `noncomputable`) is not a parse failure:
    Linear.lean has those keywords, and HostTerm has no axiom command. -/
def parseCmdsLinear : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLinear liveLinearParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLinearSkipFuel rest
      if cmdBodyKnownLinear kn c then
        parseCmdsLinear n rest2
          (kn ++ cmdAddsLinear c) (acc ++ [c])
      else
        parseCmdsLinear n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveLinearSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLinear n rest2 kn acc
        else none
      | [] => some acc

/-- Parse live Linear.lean text.
    Greppable: parseLiveLinearSource, PARSE-LIVE-LINEAR. -/
def parseLiveLinearSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsLinear src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLinear liveLinearParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.Linear"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live Linear parse. Not a fixture. Not a hardcoded true.
    Greppable: kernelCheckLiveLinearSource, PARSE-LIVE-LINEAR. -/
def kernelCheckLiveLinearSource (src : String) : Bool :=
  match parseLiveLinearSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLinearParsed? : Option Module :=
  match parseLiveLinearSource liveLinearSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLinearParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Import command count. -/
def countImports : List Cmd -> Nat
  | [] => 0
  | Cmd.importModule _ :: rest => countImports rest + 1
  | _ :: rest => countImports rest

/-- Live parse command count. One import, namespace, six literal defs, end.
    Count is 9. -/
def liveParseCmdCountOk : Bool :=
  match liveLinearParsed? with
  | some m => m.commands.length == liveLinearKeptCmds
  | none => false

/-- One import, SystemsLean.UseCheck. Not zero imports. -/
def liveParseHasUseCheckImport : Bool :=
  match liveLinearParsed? with
  | none => false
  | some m =>
    countImports m.commands == 1
      && m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == "SystemsLean.UseCheck"
        | _ => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLinearParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "mult0ClassId"
      && has "mult1ClassId"
      && has "multOmegaClassId"
      && has "linearExactOnceId"
      && has "linearAxiomsRemainId"
      && has "affineNotFirstClassId"

/-- String bodies of the six kept defs. -/
def liveParseLiteralBodiesOk : Bool :=
  match liveLinearParsed? with
  | none => false
  | some m =>
    let lit (nm val : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ (Term.litString v) => x.raw == nm && v == val
        | _ => false
    lit "mult0ClassId" "MULT-0"
      && lit "mult1ClassId" "MULT-1"
      && lit "multOmegaClassId" "MULT-OMEGA"
      && lit "linearExactOnceId" "LINEAR-EXACT-ONCE"
      && lit "linearAxiomsRemainId" "LINEAR-AXIOMS-REMAIN"
      && lit "affineNotFirstClassId" "AFFINE-NOT-FIRST-CLASS"

/-- Wrap module lastSeg is Linear (no module line in the live file). -/
def liveParseHasLinearModule : Bool :=
  match liveLinearParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.Linear"
      && lastSeg m.name.raw == "Linear"

/-- Live parse has namespace SystemsLean.Linear. -/
def liveParseHasLinearNs : Bool :=
  match liveLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.Linear"
      | _ => false

/-- Live parse ends namespace SystemsLean.Linear. -/
def liveParseHasLinearEnd : Bool :=
  match liveLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.Linear"
      | _ => false

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.UseCheck\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.Linear\n"

/-- shareNat def needle. Body is not a kernel atom (`n + n`). -/
def needleShareNat : String :=
  "def shareNat (n : Nat) : Nat := n + n\n"

/-- axiom Token needle. HostTerm has no axiom command. -/
def needleAxiomToken : String := "axiom Token : Type\n"

/-- axiom mkToken needle. -/
def needleAxiomMkToken : String := "axiom mkToken : Nat -> Token\n"

/-- axiom consume needle. -/
def needleAxiomConsume : String := "axiom consume : Token -> Nat\n"

/-- noncomputable roundTrip needle. Body is an application. -/
def needleRoundTrip : String :=
  "noncomputable def roundTrip (n : Nat) : Nat := consume (mkToken n)\n"

/-- polyId needle. Implicit binder is not a kernel atom def. -/
def needlePolyId : String :=
  "def polyId {a : Type} (x : a) : a := x\n"

/-- mult0ClassId def needle with a trailing newline. -/
def needleMult0 : String :=
  "def mult0ClassId : String := \"MULT-0\"\n"

/-- mult1ClassId def needle with a trailing newline. -/
def needleMult1 : String :=
  "def mult1ClassId : String := \"MULT-1\"\n"

/-- multOmegaClassId def needle with a trailing newline. -/
def needleMultOmega : String :=
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n"

/-- linearExactOnceId def needle with a trailing newline. -/
def needleExactOnce : String :=
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n"

/-- linearAxiomsRemainId def needle with a trailing newline. -/
def needleAxiomsRemain : String :=
  "def linearAxiomsRemainId : String := \"LINEAR-AXIOMS-REMAIN\"\n"

/-- affineNotFirstClassId def needle with a trailing newline. -/
def needleAffine : String :=
  "def affineNotFirstClassId : String := \"AFFINE-NOT-FIRST-CLASS\"\n"

/-- linearAxiomInventoryOk def needle. Body is a conjunction, not an atom. -/
def needleInventory : String :=
  "def linearAxiomInventoryOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.Linear\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    One import. The live file does not have zero imports. -/
def liveNeedlesOk : Bool :=
  let src := liveLinearSource
  (src.splitOn needleImport).length == 2
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleShareNat).length > 1
    && (src.splitOn needleAxiomToken).length > 1
    && (src.splitOn needleAxiomMkToken).length > 1
    && (src.splitOn needleAxiomConsume).length > 1
    && (src.splitOn needleRoundTrip).length > 1
    && (src.splitOn needlePolyId).length > 1
    && (src.splitOn needleMult0).length > 1
    && (src.splitOn needleMult1).length > 1
    && (src.splitOn needleMultOmega).length > 1
    && (src.splitOn needleExactOnce).length > 1
    && (src.splitOn needleAxiomsRemain).length > 1
    && (src.splitOn needleAffine).length > 1
    && (src.splitOn needleInventory).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLinearReady, PARSE-LIVE-LINEAR,
    HOST-FRONT-LIVE-LINEAR.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLinearReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LINEAR_V0")
    && (hostId == "HOST-FRONT-LIVE-LINEAR")
    && (parseId == "PARSE-LIVE-LINEAR")
    && (liveRel == "Linear.lean")
    && (liveLinearRel == "src/systems/SystemsLean/Linear.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLinearFullHost
    && !hostFrontLiveLinearFullBackend
    && !hostFrontLiveLinearResidualFreeClaimed
    && !hostFrontLiveLinearProvablyUnlocked
    && kernelCheckLiveLinearSource liveLinearSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasUseCheckImport
    && liveParseHasLiteralDefs
    && liveParseLiteralBodiesOk
    && liveParseHasLinearModule
    && liveParseHasLinearNs
    && liveParseHasLinearEnd
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLinearSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLinear (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LINEAR =="
  IO.println s!"  host={hostId} file={liveLinearRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLinearRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLinearRel}"
    throw (IO.userError s!"missing {liveLinearRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLinearSource then
    IO.eprintln "error: dual-pin mismatch: on-disk Linear.lean != liveLinearSource"
    throw (IO.userError "dual-pin mismatch live Linear.lean")
  let r := parseLiveLinearSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LINEAR reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LINEAR reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LINEAR ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} import={liveParseHasUseCheckImport} literalDefs={liveParseHasLiteralDefs} bodies={liveParseLiteralBodiesOk} module={liveParseHasLinearModule} namespace={liveParseHasLinearNs} end={liveParseHasLinearEnd} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live Linear parse false"
      throw (IO.userError "kernelCheck live Linear parse false")
    unless hostFrontLiveLinearReady do
      IO.eprintln "error: hostFrontLiveLinearReady false"
      throw (IO.userError "hostFrontLiveLinearReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty Linear source was accepted"
      throw (IO.userError "empty Linear source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLinear root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLinear
