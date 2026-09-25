/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmProgramSsa.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmProgramSsa. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold (Types-style atom bodies). Not HostFront G1.
  Not HostTerm.multFixtureModule. Not KernelMult-only.
  This wrap parses the library LlvmProgramSsa.lean. Not the mill entry
  LlvmProgramSsaMain.lean. Not Linear.lean (QTT Linear module).
  Not IrGraph.lean. Not ComposeSubsetEmit.lean. Not a mill remill.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not write out/llvm-ir. Dests skipped.
  Text parse only. Do not import SystemsLean.LlvmProgramSsa.
  Skip-fold IO defs validateProgramSsaPackage, llvmProgramSsaWrite, and main.
  Skip theorem, example, open, and bodies outside the atom grammar
  (match, let, lambda, bang, dotted app, string append, && chains).
  Keep dotted imports, the namespace, the end, and simple String/Bool atoms.
  kernelCheck is HostKernel.kernelCheck, not a hardcoded true.
  Occupancy stays 49. Mill stays 69 of 69. Not FullHost. Not Lake-gone.
  Not occupancy name 50. Not mill 62 remill.
  Unique needles (trailing newline, each once in the library):
  namespace SystemsLean.LlvmProgramSsa
  def stageId : String := "SLAKE_LLVM_PROGRAM_SSA_V0"
  def hostId : String := "HOST-LLVM-PROGRAM-SSA"
  def llvmProgramSsaFullBackendClaimed : Bool := false
  def programSsaBasename : String := "slake_program_ssa.ll"
  def ssaShapedId : String := "SSA-SHAPED"
  end SystemsLean.LlvmProgramSsa
  PARSE-LIVE-LLVM-PROGRAM-SSA
  HOST-FRONT-LIVE-LLVM-PROGRAM-SSA
  SLAKE_HOST_FRONT_LIVE_LLVM_PROGRAM_SSA_V0
  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveLlvmProgramSsaSource,
  kernelCheckLiveLlvmProgramSsaSource,
  hostFrontLiveLlvmProgramSsaReady, liveLlvmProgramSsaSource,
  liveLlvmProgramSsaRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveLlvmProgramSsa
  Not package typecheck GREEN. Not PROVABLY. Not freestanding residual free.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmProgramSsaSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmProgramSsa

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Distinct from the mill MAIN id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_PROGRAM_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-PROGRAM-SSA"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-PROGRAM-SSA"

/-- Live file basename. Not a src/systems path. Library, not the mill entry. -/
def liveRel : String := "LlvmProgramSsa.lean"

/-- Same basename as liveRel. -/
def liveLlvmProgramSsaRel : String := liveRel

/-- Repo-relative path. Read the file through this, not through liveRel. -/
def liveLlvmProgramSsaPath : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmProgramSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def hostFrontLiveLlvmProgramSsaFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmProgramSsaResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLlvmProgramSsaProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). Library has about ninety command starts. -/
def liveLlvmProgramSsaParseFuel : Nat := 512

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveLlvmProgramSsaSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
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

/-- String-safe comment strip for live LlvmProgramSsa.lean bytes. -/
def stripCommentsOr (src : String) : String :=
  String.ofList (stripCommentsOrN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident, for example `SystemsLean . KernelProgram`. -/
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
def cmdAddsLlvmProgramSsa (c : Cmd) : List String :=
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

/-- IO and non-atom helpers that must not be kernel-checked. -/
def skipDefName (s : String) : Bool :=
  s == "validateProgramSsaPackage" || s == "llvmProgramSsaWrite" || s == "main"
    || s == "containsSub" || s == "filterArgs"

/-- Body is kernel-known, no untyped proj, no Term.app, atom only. -/
def cmdBodyKnownLlvmProgramSsa (kn : List String) : Cmd -> Bool
  | Cmd.def_ x ty body =>
      !skipDefName x.raw
        && (match ty with
            | some t => !typeHasUInt32OrIo t
            | none => true)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmProgramSsaParseFuel body
        && termNoAppN liveLlvmProgramSsaParseFuel body
  | Cmd.defBind x bs ret body =>
      !skipDefName x.raw
        && !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termIsKernelAtom body
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmProgramSsaParseFuel body
        && termNoAppN liveLlvmProgramSsaParseFuel body
  | _ => true

/-- Typed assign `def` whose body is one atom (lit / const). Do not use
    parseTermHt: a Bool/String lit followed by `def` becomes Term.app
    and skip-folds the kernelable def. Compound && / == bodies fail closed. -/
def parseDefLlvmProgramSsa (fuel : Nat) (dname : String) (rest : List String) :
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
                  let rest5 := skipNonCmd liveLlvmProgramSsaSkipFuel rest4
                  if bs.isEmpty then
                    some (Cmd.def_ dn (some ty) body, rest5)
                  else
                    let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                    some (Cmd.defBind dn nbs retTy body, rest5)
                else none
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Types-style: import / namespace / end / def. Open, theorem, example skip. -/
def parseOneCmdLlvmProgramSsa (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLlvmProgramSsa fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / structure /
    un-kernelable defs. A body outside the grammar skips that command only. -/
def parseCmdsLlvmProgramSsa : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmProgramSsa liveLlvmProgramSsaParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmProgramSsaSkipFuel rest
      if cmdBodyKnownLlvmProgramSsa kn c then
        parseCmdsLlvmProgramSsa n rest2
          (kn ++ cmdAddsLlvmProgramSsa c) (acc ++ [c])
      else
        parseCmdsLlvmProgramSsa n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveLlvmProgramSsaSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLlvmProgramSsa n rest2 kn acc
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

/-- Parse live LlvmProgramSsa.lean text.
    Greppable: parseLiveLlvmProgramSsaSource, PARSE-LIVE-LLVM-PROGRAM-SSA. -/
def parseLiveLlvmProgramSsaSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsOr src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmProgramSsa liveLlvmProgramSsaParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmProgramSsa"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmProgramSsa parse. Not a fixture.
    Returns HostKernel.kernelCheck, not a hardcoded true.
    Greppable: kernelCheckLiveLlvmProgramSsaSource, PARSE-LIVE-LLVM-PROGRAM-SSA. -/
def kernelCheckLiveLlvmProgramSsaSource (src : String) : Bool :=
  match parseLiveLlvmProgramSsaSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmProgramSsaParsed? : Option Module :=
  match parseLiveLlvmProgramSsaSource liveLlvmProgramSsaSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Count non-overlapping needle hits. Empty needle counts as zero. -/
def countNeedle (hay needle : String) : Nat :=
  if needle.isEmpty then 0 else (hay.splitOn needle).length - 1

/-- Each library needle once, including the trailing newline. -/
def liveNeedlesOnce : Bool :=
  countNeedle liveLlvmProgramSsaSource
      "namespace SystemsLean.LlvmProgramSsa\n" == 1
    && countNeedle liveLlvmProgramSsaSource
      "def stageId : String := \"SLAKE_LLVM_PROGRAM_SSA_V0\"\n" == 1
    && countNeedle liveLlvmProgramSsaSource
      "def hostId : String := \"HOST-LLVM-PROGRAM-SSA\"\n" == 1
    && countNeedle liveLlvmProgramSsaSource
      "def llvmProgramSsaFullBackendClaimed : Bool := false\n" == 1
    && countNeedle liveLlvmProgramSsaSource
      "def programSsaBasename : String := \"slake_program_ssa.ll\"\n" == 1
    && countNeedle liveLlvmProgramSsaSource
      "def ssaShapedId : String := \"SSA-SHAPED\"\n" == 1
    && countNeedle liveLlvmProgramSsaSource
      "end SystemsLean.LlvmProgramSsa\n" == 1

/-- How many times `mod` is imported. -/
def importCount (m : Module) (mod : String) : Nat :=
  m.commands.foldl (fun n c =>
    match c with
    | Cmd.importModule x => if x.raw == mod then n + 1 else n
    | _ => n) 0

/-- Dotted imports kept, each once. Includes LlvmMultSsa, which the library imports. -/
def liveParseHasRequiredImports : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    importCount m "SystemsLean.Mult" == 1
      && importCount m "SystemsLean.Types" == 1
      && importCount m "SystemsLean.IrProgram" == 1
      && importCount m "SystemsLean.KernelProgram" == 1
      && importCount m "SystemsLean.LlvmHold" == 1
      && importCount m "SystemsLean.LlvmEmitPath" == 1
      && importCount m "SystemsLean.LlvmProgramText" == 1
      && importCount m "SystemsLean.LlvmTypesSsa" == 1
      && importCount m "SystemsLean.LlvmLinearSsa" == 1
      && importCount m "SystemsLean.LlvmMultSsa" == 1

/-- Live parse kept import SystemsLean.KernelProgram. -/
def liveParseHasKernelProgramImport : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m => importCount m "SystemsLean.KernelProgram" == 1

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Accepted command list is non-empty. Not the mill Main length == 1 pin. -/
def liveParseNonEmpty : Bool :=
  match liveLlvmProgramSsaParsed? with
  | some m => m.commands.length > 0
  | none => false

/-- Parsed module name is SystemsLean.LlvmProgramSsa (no module line in the file). -/
def liveParseModuleIsLlvmProgramSsa : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m => m.name.raw == "SystemsLean.LlvmProgramSsa"

/-- Namespace command kept. -/
def liveParseHasNamespace : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmProgramSsa"
      | _ => false

/-- End command kept. -/
def liveParseHasEnd : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmProgramSsa"
      | _ => false

/-- Simple String atom `stageId` kept. -/
def liveParseHasStageIdDef : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "stageId" && s == "SLAKE_LLVM_PROGRAM_SSA_V0"
      | _ => false

/-- Simple String atom `hostId` kept. -/
def liveParseHasHostIdDef : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "hostId" && s == "HOST-LLVM-PROGRAM-SSA"
      | _ => false

/-- Simple String atom `programSsaBasename` kept. -/
def liveParseHasProgramSsaBasename : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "programSsaBasename" && s == "slake_program_ssa.ll"
      | _ => false

/-- Simple String atom `ssaShapedId` kept. -/
def liveParseHasSsaShapedId : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "ssaShapedId" && s == "SSA-SHAPED"
      | _ => false

/-- Library bool llvmProgramSsaFullBackendClaimed stays false and is kept. -/
def liveParseHasFullBackendFalse : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.bool) (Term.litBool b) =>
        x.raw == "llvmProgramSsaFullBackendClaimed" && b == false
      | _ => false

/-- IO defs are not in the kernel-checked command list. -/
def liveParseSkippedIo : Bool :=
  match liveLlvmProgramSsaParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => skipDefName x.raw
      | Cmd.defBind x _ _ _ => skipDefName x.raw
      | _ => false)

/-- Skip-head still sees the IO def names in the live tokens. -/
def liveToksHaveIoDefs : Bool :=
  let toks := tokenizeHostTerm (stripCommentsOr liveLlvmProgramSsaSource)
  toksHaveDefNamed liveLlvmProgramSsaSkipFuel toks "validateProgramSsaPackage"
    && toksHaveDefNamed liveLlvmProgramSsaSkipFuel toks "llvmProgramSsaWrite"
    && toksHaveDefNamed liveLlvmProgramSsaSkipFuel toks "main"

/-- End-to-end ready: live text parse kernel-checks.
    Real conjunction. Not the constant true.
    Greppable: hostFrontLiveLlvmProgramSsaReady, PARSE-LIVE-LLVM-PROGRAM-SSA,
    HOST-FRONT-LIVE-LLVM-PROGRAM-SSA. -/
def hostFrontLiveLlvmProgramSsaReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_PROGRAM_SSA_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-PROGRAM-SSA")
    && (parseId == "PARSE-LIVE-LLVM-PROGRAM-SSA")
    && (liveRel == "LlvmProgramSsa.lean")
    && (liveLlvmProgramSsaRel == liveRel)
    && (liveLlvmProgramSsaPath == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmProgramSsaFullHost
    && !hostFrontLiveLlvmProgramSsaFullBackend
    && !hostFrontLiveLlvmProgramSsaResidualFreeClaimed
    && !hostFrontLiveLlvmProgramSsaProvablyUnlocked
    && kernelCheckLiveLlvmProgramSsaSource liveLlvmProgramSsaSource
    && liveParseNonEmpty
    && liveParseModuleIsLlvmProgramSsa
    && liveParseHasKernelProgramImport
    && liveParseHasRequiredImports
    && liveParseHasNamespace
    && liveParseHasEnd
    && liveParseHasStageIdDef
    && liveParseHasHostIdDef
    && liveParseHasProgramSsaBasename
    && liveParseHasSsaShapedId
    && liveParseHasFullBackendFalse
    && liveParseHasNoCheckCmd
    && liveParseSkippedIo
    && liveToksHaveIoDefs
    && liveNeedlesOnce

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmProgramSsaSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- One-line command trace for a red kernelCheck. -/
def cmdTrace (c : Cmd) : String :=
  match c with
  | Cmd.importModule x => "import " ++ x.raw
  | Cmd.namespace x => "namespace " ++ x.raw
  | Cmd.endNamespace x => "end " ++ x.raw
  | Cmd.def_ x _ _ => "def " ++ x.raw
  | Cmd.defBind x _ _ _ => "defBind " ++ x.raw
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "inductive " ++ x.raw
  | Cmd.structure_ x _ _ => "structure " ++ x.raw
  | Cmd.check _ _ => "check"

/-! ### Driver (short banners; dual-pin file equality). Not a mill remill. -/

def runLiveLlvmProgramSsa (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-PROGRAM-SSA =="
  IO.println s!"  host={hostId} file={liveRel}"
  let path := root / liveLlvmProgramSsaPath
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmProgramSsaPath}"
    throw (IO.userError s!"missing {liveLlvmProgramSsaPath}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmProgramSsaSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmProgramSsa.lean != liveLlvmProgramSsaSource"
    throw (IO.userError "dual-pin mismatch live LlvmProgramSsa.lean")
  let r := parseLiveLlvmProgramSsaSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-PROGRAM-SSA reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-PROGRAM-SSA reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    unless k do
      IO.eprintln s!"error: kernelCheck live LlvmProgramSsa parse false cmds={m.commands.length}"
      for c in m.commands do
        IO.eprintln s!"  cmd {cmdTrace c}"
      throw (IO.userError "kernelCheck live LlvmProgramSsa parse false")
    unless hostFrontLiveLlvmProgramSsaReady do
      IO.eprintln "error: hostFrontLiveLlvmProgramSsaReady false"
      IO.eprintln s!"  needles={liveNeedlesOnce} imports={liveParseHasRequiredImports} module={liveParseModuleIsLlvmProgramSsa} ns={liveParseHasNamespace} end={liveParseHasEnd} stageDef={liveParseHasStageIdDef} hostDef={liveParseHasHostIdDef} baseDef={liveParseHasProgramSsaBasename} ssaDef={liveParseHasSsaShapedId} fullBackendFalse={liveParseHasFullBackendFalse} skippedIo={liveParseSkippedIo} toksIo={liveToksHaveIoDefs} nonempty={liveParseNonEmpty}"
      throw (IO.userError "hostFrontLiveLlvmProgramSsaReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"PASS PARSE-LIVE-LLVM-PROGRAM-SSA ACCEPT cmds={m.commands.length} kernelCheck=true liveRel={liveRel}"
    IO.println s!"GREEN {stageId}: live LlvmProgramSsa.lean parse kernelCheck; FullBackend false; not an LLVM backend; not a mill remill; dests skipped"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmProgramSsa root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmProgramSsa
