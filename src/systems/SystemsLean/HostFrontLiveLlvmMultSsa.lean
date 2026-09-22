/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmMultSsa.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmMultSsa. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses LlvmMultSsa.lean only. Not the mill Main parser
  HostFrontLiveLlvmMultSsaMain. Not LlvmLinearSsa. Not IrGraph.
  Not Linear.lean. Not ComposeSubsetEmit.lean.
  This wrap is not an LLVM backend. FullBackend stays false.
  Unique needles use a trailing newline so HostFrontLiveLlvmMultSsa is not a
  prefix hit on HostFrontLiveLlvmMultSsaSource or
  HostFrontLiveLlvmMultSsaParserMain.
  Not mill 61 remill. Not mill 69 remill. Mill stays 69 of 69.
  Occupancy stays 49. Not FullHost. Not Lake-gone.

  Spec (readable):
  - parseLiveLlvmMultSsaSource turns live LlvmMultSsa.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.LlvmMultSsa even without a module line.
  - The living namespace SystemsLean.LlvmMultSsa is kept, and end is kept.
  - kernelCheckLiveLlvmMultSsaSource is HostKernel.kernelCheck of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted calls, string ++,
    field proj, theorem scripts, tactics, examples, boolean &&, Term.app,
    IO mains) are skip-folded.
  - Atom String and Bool defs are kept. The justRecipe const alias may be kept.
  - Five dotted imports, namespace, and end are kept. Open is skipped.
  - def main (IO UInt32) skip-folds. Skip-head still sees def main.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not an LLVM backend. FullBackend false.
  - Not occupancy name 50. Not mill 69 remill.
  - Not Lake-gone. Not PROVABLY. Not freestanding residual free.
  - Not the LlvmMultSsaMain mill wrap. Not LlvmLinearSsa.

  Unique needles (trailing newline; lines from LlvmMultSsa.lean):
  namespace SystemsLean.LlvmMultSsa
  def llvmMultSsaFullBackendClaimed : Bool := false
  def stageId : String := "SLAKE_LLVM_MULT_SSA_V0"
  def llvmMultSsaReady : Bool :=
  end SystemsLean.LlvmMultSsa

  Hyphenated stage id (not LLVM-MULT-SSA-MAIN):
  LLVM-MULT-SSA

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveLlvmMultSsaSource,
  kernelCheckLiveLlvmMultSsaSource,
  hostFrontLiveLlvmMultSsaReady, liveLlvmMultSsaSource,
  liveLlvmMultSsaRel, PARSE-LIVE-LLVM-MULT-SSA,
  HOST-FRONT-LIVE-LLVM-MULT-SSA, LLVM-MULT-SSA.
  Module: SystemsLean.HostFrontLiveLlvmMultSsa
  Not package typecheck GREEN. Not FullHost. Not Lake-gone. Not FullBackend.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmMultSsaSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmMultSsa

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_MULT_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-MULT-SSA"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-MULT-SSA"

/-- Hyphenated stage id. Not LLVM-MULT-SSA-MAIN. -/
def bannerId : String := "LLVM-MULT-SSA"


/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmMultSsaRel : String :=
  "src/systems/SystemsLean/LlvmMultSsa.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmMultSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def hostFrontLiveLlvmMultSsaFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmMultSsaResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLlvmMultSsaProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmMultSsaParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveLlvmMultSsaSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    LlvmMultSsa keeps string payloads quoted; this strip stays in-string safe.
    HostFrontLiveMult.stripComments is not in-string safe. Backslash
    keeps the next char inside a string. -/
def stripCommentsOrN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsOrN n nest false false ('\n' :: acc) rest
        else
          stripCommentsOrN n nest true false acc rest
      else if inStr then
        if c == '\\' then
          match rest with
          | d :: rest2 =>
            stripCommentsOrN n nest false true (d :: c :: acc) rest2
          | [] => (c :: acc).reverse
        else if c == '"' then
          stripCommentsOrN n nest false false ('"' :: acc) rest
        else
          stripCommentsOrN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsOrN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsOrN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsOrN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsOrN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsOrN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsOrN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsOrN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsOrN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live LlvmMultSsa.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . LlvmMultSsa`. -/
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
def cmdAddsLlvmMultSsa (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so string concat is an untyped app.
    Kernel cannot apply String. Skip any Term.app. -/
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

/-- Atom bodies the kernel can type without && / ++ / struct / ite. -/
def termIsKernelAtom : Term -> Bool
  | Term.var _ => true
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.none_ => true
  | Term.const _ => true
  | _ => false

/-- UInt32 / IO / Int types poison kernelCheck of the skip-fold. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO" || lastSeg x.raw == "Int"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownLlvmMultSsa (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmMultSsaParseFuel body
        && termNoAppN liveLlvmMultSsaParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmMultSsaParseFuel body
        && termNoAppN liveLlvmMultSsaParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefLlvmMultSsa (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
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
                  let rest5 := skipNonCmd liveLlvmMultSsaSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open skipped. -/
def parseOneCmdLlvmMultSsa (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLlvmMultSsa fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. -/
def parseCmdsLlvmMultSsa : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmMultSsa liveLlvmMultSsaParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmMultSsaSkipFuel rest
      if cmdBodyKnownLlvmMultSsa kn c then
        parseCmdsLlvmMultSsa n rest2
          (kn ++ cmdAddsLlvmMultSsa c) (acc ++ [c])
      else
        parseCmdsLlvmMultSsa n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveLlvmMultSsaSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLlvmMultSsa n rest2 kn acc
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live LlvmMultSsa.lean text.
    Greppable: parseLiveLlvmMultSsaSource,
    PARSE-LIVE-LLVM-MULT-SSA. -/
def parseLiveLlvmMultSsaSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmMultSsa liveLlvmMultSsaParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmMultSsa"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmMultSsa parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveLlvmMultSsaSource,
    PARSE-LIVE-LLVM-MULT-SSA. -/
def kernelCheckLiveLlvmMultSsaSource (src : String) : Bool :=
  match parseLiveLlvmMultSsaSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmMultSsaParsed? : Option Module :=
  match parseLiveLlvmMultSsaSource liveLlvmMultSsaSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmMultSsaParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Library lines. Each needle includes its trailing newline.
    Taken from LlvmMultSsa.lean, not from LlvmMultSsaMain.lean. -/
def needleNamespace : String := "namespace SystemsLean.LlvmMultSsa\n"

def needleFullBackend : String :=
  "def llvmMultSsaFullBackendClaimed : Bool := false\n"

def needleStageIdLine : String :=
  "def stageId : String := \"SLAKE_LLVM_MULT_SSA_V0\"\n"

def needleReadyLine : String := "def llvmMultSsaReady : Bool :=\n"

def needleEnd : String := "end SystemsLean.LlvmMultSsa\n"

def sourceHasNeedle (needle : String) : Bool :=
  (liveLlvmMultSsaSource.splitOn needle).length > 1

def liveNeedlesOk : Bool :=
  sourceHasNeedle needleNamespace
    && sourceHasNeedle needleFullBackend
    && sourceHasNeedle needleStageIdLine
    && sourceHasNeedle needleReadyLine
    && sourceHasNeedle needleEnd

/-- Skip-fold command count.
    5 imports + namespace + 29 atom defs (13 string lits, justRecipe const
    alias, 12 Bool lits, 3 later string lits) + end = 36.
    Theorems, examples, ++ strings, &&, !, apps, and IO mains skip-fold. -/
def liveParseCmdCountExpected : Nat := 36

def liveParseCmdCountOk : Bool :=
  match liveLlvmMultSsaParsed? with
  | some m => m.commands.length == liveParseCmdCountExpected
  | none => false

/-- Parser-assigned module lastSeg is LlvmMultSsa (no Lean module line). -/
def liveParseHasLlvmMultSsaModule : Bool :=
  match liveLlvmMultSsaParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "LlvmMultSsa"

def liveParseHasImport (mod : String) : Bool :=
  match liveLlvmMultSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == mod
      | _ => false

/-- Five dotted imports of the library file. Not an import of itself. -/
def liveParseHasLibraryImports : Bool :=
  liveParseHasImport "SystemsLean.Mult"
    && liveParseHasImport "SystemsLean.KernelMult"
    && liveParseHasImport "SystemsLean.LlvmHold"
    && liveParseHasImport "SystemsLean.LlvmEmitPath"
    && liveParseHasImport "SystemsLean.LlvmMultText"

def liveParseHasNamespace : Bool :=
  match liveLlvmMultSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmMultSsa"
      | _ => false

def liveParseHasEndNamespace : Bool :=
  match liveLlvmMultSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmMultSsa"
      | _ => false

def liveParseHasDefNamed (nm : String) : Bool :=
  match liveLlvmMultSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == nm
      | Cmd.defBind x _ _ _ => x.raw == nm
      | _ => false

/-- Kept atom def whose body is the false full-backend pin. -/
def liveParseHasFullBackendFalse : Bool :=
  match liveLlvmMultSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ (Term.litBool false) =>
        x.raw == "llvmMultSsaFullBackendClaimed"
      | _ => false

/-- Skip-head: def main is in the token stream even though the IO body
    skip-folds. stageId is a kept atom def. -/
def liveParseHasCoreDefs : Bool :=
  match liveLlvmMultSsaParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsOr liveLlvmMultSsaSource)
    toksHaveDefNamed liveLlvmMultSsaSkipFuel toks "main"
      && liveParseHasDefNamed "stageId"
      && liveParseHasFullBackendFalse

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmMultSsaReady,
    PARSE-LIVE-LLVM-MULT-SSA,
    HOST-FRONT-LIVE-LLVM-MULT-SSA,
    LLVM-MULT-SSA.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true.
    FullBackend stays false. This is not an LLVM backend. -/
def hostFrontLiveLlvmMultSsaReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_MULT_SSA_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-MULT-SSA")
    && (parseId == "PARSE-LIVE-LLVM-MULT-SSA")
    && (bannerId == "LLVM-MULT-SSA")
    && (liveLlvmMultSsaRel
      == "src/systems/SystemsLean/LlvmMultSsa.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmMultSsaFullHost
    && !hostFrontLiveLlvmMultSsaFullBackend
    && !hostFrontLiveLlvmMultSsaResidualFreeClaimed
    && !hostFrontLiveLlvmMultSsaProvablyUnlocked
    && liveNeedlesOk
    && kernelCheckLiveLlvmMultSsaSource liveLlvmMultSsaSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLlvmMultSsaModule
    && liveParseHasLibraryImports
    && liveParseHasNamespace
    && liveParseHasEndNamespace
    && liveParseHasCoreDefs

def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmMultSsaSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 61 remill. -/

def runLiveLlvmMultSsa (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: {bannerId} =="
  IO.println s!"  host={hostId} file={liveLlvmMultSsaRel}"
  let path := root / liveLlvmMultSsaRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmMultSsaRel}"
    throw (IO.userError s!"missing {liveLlvmMultSsaRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmMultSsaSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmMultSsa.lean != liveLlvmMultSsaSource"
    throw (IO.userError "dual-pin mismatch live LlvmMultSsa.lean")
  let r := parseLiveLlvmMultSsaSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-MULT-SSA reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-MULT-SSA reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-MULT-SSA ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmMultSsa parse false"
      throw (IO.userError "kernelCheck live LlvmMultSsa parse false")
    unless hostFrontLiveLlvmMultSsaReady do
      IO.eprintln s!"error: hostFrontLiveLlvmMultSsaReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} ns={liveParseHasNamespace} endNs={liveParseHasEndNamespace} imports={liveParseHasLibraryImports} fullBackendFalse={liveParseHasFullBackendFalse} core={liveParseHasCoreDefs} module={liveParseHasLlvmMultSsaModule} noCheck={liveParseHasNoCheckCmd} needles={liveNeedlesOk} kernel={k}"
      throw (IO.userError "hostFrontLiveLlvmMultSsaReady false")
    IO.println s!"GREEN {stageId}: live LlvmMultSsa.lean parse kernelCheck; FullBackend false; not an LLVM backend"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmMultSsa root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmMultSsa
